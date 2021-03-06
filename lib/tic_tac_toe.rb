class TicTacToe

def initialize
@board=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

WIN_COMBINATIONS=[ 
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
end

def input_to_index(input)
input.to_i-1
end

def move (index,token)
@board[index] = token
end




def position_taken?(index)
    @board[index] != " "
    end

def valid_move?(index)
 !position_taken?(index) && index.between?(0,8)
end

def turn_count
@board.count{|turn| turn !=" "}
end

def current_player
turn_count.even? ? "X" : "O"
end

def turn
puts "Please select a square (1-9):"
input = gets.strip
index =input_to_index(input)
if valid_move?(index)
    token = current_player
    move(index,token)
else
    puts "Please select a valid answer (1-9)"
    turn
end
display_board
end

def won?
    a = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    b = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    return a || b 
  end


def full?
    def full?
        !@board.any?{|x| x == "" || x == " "}
      end
    
end

def draw?
    !won? && full?
end

def over?
won? || draw?
end


def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end

def play 
while !over?
    turn
end
if won?
    puts "Congratulations #{winner}!"
elsif draw?
    puts "Cat's Game!"
end



end


end