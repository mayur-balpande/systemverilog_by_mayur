// How can you randomize an array with unique values?

class mayur;
    rand int a[];

    constraint c1 {
        a.size() == 10;}

        constraint c2{
            unique {a};
        }

endclass

module tb();

    mayur m1;
    initial begin
        m1 = new();
        if (m1.randomize())
        $display("a = %p", m1.a);
        else
        $display("Randomization Failed");
    end
endmodule