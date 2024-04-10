; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62136 () Bool)

(assert start!62136)

(declare-fun b!695715 () Bool)

(declare-fun e!395681 () Bool)

(declare-fun e!395683 () Bool)

(assert (=> b!695715 (= e!395681 e!395683)))

(declare-fun res!459663 () Bool)

(assert (=> b!695715 (=> (not res!459663) (not e!395683))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695715 (= res!459663 (bvsle from!3004 i!1382))))

(declare-fun b!695716 () Bool)

(declare-fun e!395684 () Bool)

(declare-datatypes ((List!13165 0))(
  ( (Nil!13162) (Cons!13161 (h!14206 (_ BitVec 64)) (t!19447 List!13165)) )
))
(declare-fun acc!681 () List!13165)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3742 (List!13165 (_ BitVec 64)) Bool)

(assert (=> b!695716 (= e!395684 (contains!3742 acc!681 k!2843))))

(declare-fun res!459664 () Bool)

(declare-fun e!395682 () Bool)

(assert (=> start!62136 (=> (not res!459664) (not e!395682))))

(declare-datatypes ((array!39926 0))(
  ( (array!39927 (arr!19124 (Array (_ BitVec 32) (_ BitVec 64))) (size!19509 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39926)

(assert (=> start!62136 (= res!459664 (and (bvslt (size!19509 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19509 a!3626))))))

(assert (=> start!62136 e!395682))

(assert (=> start!62136 true))

(declare-fun array_inv!14920 (array!39926) Bool)

(assert (=> start!62136 (array_inv!14920 a!3626)))

(declare-fun b!695717 () Bool)

(assert (=> b!695717 (= e!395683 (not (contains!3742 acc!681 k!2843)))))

(declare-fun b!695718 () Bool)

(declare-fun res!459670 () Bool)

(assert (=> b!695718 (=> (not res!459670) (not e!395682))))

(assert (=> b!695718 (= res!459670 (not (contains!3742 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695719 () Bool)

(assert (=> b!695719 (= e!395682 false)))

(declare-fun lt!317077 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39926 (_ BitVec 32) List!13165) Bool)

(assert (=> b!695719 (= lt!317077 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695720 () Bool)

(declare-fun res!459666 () Bool)

(assert (=> b!695720 (=> (not res!459666) (not e!395682))))

(assert (=> b!695720 (= res!459666 e!395681)))

(declare-fun res!459671 () Bool)

(assert (=> b!695720 (=> res!459671 e!395681)))

(assert (=> b!695720 (= res!459671 e!395684)))

(declare-fun res!459665 () Bool)

(assert (=> b!695720 (=> (not res!459665) (not e!395684))))

(assert (=> b!695720 (= res!459665 (bvsgt from!3004 i!1382))))

(declare-fun b!695721 () Bool)

(declare-fun res!459669 () Bool)

(assert (=> b!695721 (=> (not res!459669) (not e!395682))))

(declare-fun noDuplicate!989 (List!13165) Bool)

(assert (=> b!695721 (= res!459669 (noDuplicate!989 acc!681))))

(declare-fun b!695722 () Bool)

(declare-fun res!459668 () Bool)

(assert (=> b!695722 (=> (not res!459668) (not e!395682))))

(assert (=> b!695722 (= res!459668 (not (contains!3742 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695723 () Bool)

(declare-fun res!459667 () Bool)

(assert (=> b!695723 (=> (not res!459667) (not e!395682))))

(assert (=> b!695723 (= res!459667 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13162))))

(assert (= (and start!62136 res!459664) b!695721))

(assert (= (and b!695721 res!459669) b!695718))

(assert (= (and b!695718 res!459670) b!695722))

(assert (= (and b!695722 res!459668) b!695720))

(assert (= (and b!695720 res!459665) b!695716))

(assert (= (and b!695720 (not res!459671)) b!695715))

(assert (= (and b!695715 res!459663) b!695717))

(assert (= (and b!695720 res!459666) b!695723))

(assert (= (and b!695723 res!459667) b!695719))

(declare-fun m!657087 () Bool)

(assert (=> b!695717 m!657087))

(assert (=> b!695716 m!657087))

(declare-fun m!657089 () Bool)

(assert (=> start!62136 m!657089))

(declare-fun m!657091 () Bool)

(assert (=> b!695718 m!657091))

(declare-fun m!657093 () Bool)

(assert (=> b!695723 m!657093))

(declare-fun m!657095 () Bool)

(assert (=> b!695721 m!657095))

(declare-fun m!657097 () Bool)

(assert (=> b!695719 m!657097))

(declare-fun m!657099 () Bool)

(assert (=> b!695722 m!657099))

(push 1)

(assert (not b!695721))

(assert (not b!695716))

(assert (not b!695722))

(assert (not b!695723))

(assert (not b!695718))

(assert (not start!62136))

(assert (not b!695719))

(assert (not b!695717))

(check-sat)

(pop 1)

