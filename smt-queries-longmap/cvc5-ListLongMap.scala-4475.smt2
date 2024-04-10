; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62276 () Bool)

(assert start!62276)

(declare-fun b!697773 () Bool)

(declare-fun e!396665 () Bool)

(declare-fun e!396666 () Bool)

(assert (=> b!697773 (= e!396665 e!396666)))

(declare-fun res!461655 () Bool)

(assert (=> b!697773 (=> (not res!461655) (not e!396666))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697773 (= res!461655 (bvsle from!3004 i!1382))))

(declare-fun res!461653 () Bool)

(declare-fun e!396668 () Bool)

(assert (=> start!62276 (=> (not res!461653) (not e!396668))))

(declare-datatypes ((array!39994 0))(
  ( (array!39995 (arr!19155 (Array (_ BitVec 32) (_ BitVec 64))) (size!19540 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39994)

(assert (=> start!62276 (= res!461653 (and (bvslt (size!19540 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19540 a!3626))))))

(assert (=> start!62276 e!396668))

(assert (=> start!62276 true))

(declare-fun array_inv!14951 (array!39994) Bool)

(assert (=> start!62276 (array_inv!14951 a!3626)))

(declare-fun b!697774 () Bool)

(assert (=> b!697774 (= e!396668 false)))

(declare-fun lt!317191 () Bool)

(declare-datatypes ((List!13196 0))(
  ( (Nil!13193) (Cons!13192 (h!14237 (_ BitVec 64)) (t!19478 List!13196)) )
))
(declare-fun acc!681 () List!13196)

(declare-fun arrayNoDuplicates!0 (array!39994 (_ BitVec 32) List!13196) Bool)

(assert (=> b!697774 (= lt!317191 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697775 () Bool)

(declare-fun res!461657 () Bool)

(assert (=> b!697775 (=> (not res!461657) (not e!396668))))

(declare-fun noDuplicate!1020 (List!13196) Bool)

(assert (=> b!697775 (= res!461657 (noDuplicate!1020 acc!681))))

(declare-fun b!697776 () Bool)

(declare-fun res!461652 () Bool)

(assert (=> b!697776 (=> (not res!461652) (not e!396668))))

(declare-fun contains!3773 (List!13196 (_ BitVec 64)) Bool)

(assert (=> b!697776 (= res!461652 (not (contains!3773 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697777 () Bool)

(declare-fun res!461656 () Bool)

(assert (=> b!697777 (=> (not res!461656) (not e!396668))))

(assert (=> b!697777 (= res!461656 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13193))))

(declare-fun b!697778 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!697778 (= e!396666 (not (contains!3773 acc!681 k!2843)))))

(declare-fun b!697779 () Bool)

(declare-fun res!461650 () Bool)

(assert (=> b!697779 (=> (not res!461650) (not e!396668))))

(assert (=> b!697779 (= res!461650 (not (contains!3773 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697780 () Bool)

(declare-fun res!461651 () Bool)

(assert (=> b!697780 (=> (not res!461651) (not e!396668))))

(assert (=> b!697780 (= res!461651 e!396665)))

(declare-fun res!461654 () Bool)

(assert (=> b!697780 (=> res!461654 e!396665)))

(declare-fun e!396667 () Bool)

(assert (=> b!697780 (= res!461654 e!396667)))

(declare-fun res!461649 () Bool)

(assert (=> b!697780 (=> (not res!461649) (not e!396667))))

(assert (=> b!697780 (= res!461649 (bvsgt from!3004 i!1382))))

(declare-fun b!697781 () Bool)

(assert (=> b!697781 (= e!396667 (contains!3773 acc!681 k!2843))))

(assert (= (and start!62276 res!461653) b!697775))

(assert (= (and b!697775 res!461657) b!697779))

(assert (= (and b!697779 res!461650) b!697776))

(assert (= (and b!697776 res!461652) b!697780))

(assert (= (and b!697780 res!461649) b!697781))

(assert (= (and b!697780 (not res!461654)) b!697773))

(assert (= (and b!697773 res!461655) b!697778))

(assert (= (and b!697780 res!461651) b!697777))

(assert (= (and b!697777 res!461656) b!697774))

(declare-fun m!658121 () Bool)

(assert (=> b!697777 m!658121))

(declare-fun m!658123 () Bool)

(assert (=> b!697776 m!658123))

(declare-fun m!658125 () Bool)

(assert (=> start!62276 m!658125))

(declare-fun m!658127 () Bool)

(assert (=> b!697774 m!658127))

(declare-fun m!658129 () Bool)

(assert (=> b!697775 m!658129))

(declare-fun m!658131 () Bool)

(assert (=> b!697781 m!658131))

(declare-fun m!658133 () Bool)

(assert (=> b!697779 m!658133))

(assert (=> b!697778 m!658131))

(push 1)

(assert (not b!697778))

(assert (not b!697775))

(assert (not b!697776))

(assert (not b!697781))

(assert (not b!697779))

(assert (not b!697777))

(assert (not start!62276))

(assert (not b!697774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

