; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62140 () Bool)

(assert start!62140)

(declare-fun b!695769 () Bool)

(declare-fun e!395712 () Bool)

(assert (=> b!695769 (= e!395712 false)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13167 0))(
  ( (Nil!13164) (Cons!13163 (h!14208 (_ BitVec 64)) (t!19449 List!13167)) )
))
(declare-fun acc!681 () List!13167)

(declare-fun lt!317083 () Bool)

(declare-datatypes ((array!39930 0))(
  ( (array!39931 (arr!19126 (Array (_ BitVec 32) (_ BitVec 64))) (size!19511 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39930)

(declare-fun arrayNoDuplicates!0 (array!39930 (_ BitVec 32) List!13167) Bool)

(assert (=> b!695769 (= lt!317083 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695770 () Bool)

(declare-fun e!395713 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3744 (List!13167 (_ BitVec 64)) Bool)

(assert (=> b!695770 (= e!395713 (not (contains!3744 acc!681 k0!2843)))))

(declare-fun b!695771 () Bool)

(declare-fun e!395715 () Bool)

(assert (=> b!695771 (= e!395715 e!395713)))

(declare-fun res!459723 () Bool)

(assert (=> b!695771 (=> (not res!459723) (not e!395713))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695771 (= res!459723 (bvsle from!3004 i!1382))))

(declare-fun b!695772 () Bool)

(declare-fun res!459725 () Bool)

(assert (=> b!695772 (=> (not res!459725) (not e!395712))))

(assert (=> b!695772 (= res!459725 e!395715)))

(declare-fun res!459724 () Bool)

(assert (=> b!695772 (=> res!459724 e!395715)))

(declare-fun e!395711 () Bool)

(assert (=> b!695772 (= res!459724 e!395711)))

(declare-fun res!459720 () Bool)

(assert (=> b!695772 (=> (not res!459720) (not e!395711))))

(assert (=> b!695772 (= res!459720 (bvsgt from!3004 i!1382))))

(declare-fun b!695773 () Bool)

(declare-fun res!459722 () Bool)

(assert (=> b!695773 (=> (not res!459722) (not e!395712))))

(assert (=> b!695773 (= res!459722 (not (contains!3744 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695774 () Bool)

(declare-fun res!459717 () Bool)

(assert (=> b!695774 (=> (not res!459717) (not e!395712))))

(declare-fun noDuplicate!991 (List!13167) Bool)

(assert (=> b!695774 (= res!459717 (noDuplicate!991 acc!681))))

(declare-fun b!695775 () Bool)

(declare-fun res!459718 () Bool)

(assert (=> b!695775 (=> (not res!459718) (not e!395712))))

(assert (=> b!695775 (= res!459718 (not (contains!3744 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!459719 () Bool)

(assert (=> start!62140 (=> (not res!459719) (not e!395712))))

(assert (=> start!62140 (= res!459719 (and (bvslt (size!19511 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19511 a!3626))))))

(assert (=> start!62140 e!395712))

(assert (=> start!62140 true))

(declare-fun array_inv!14922 (array!39930) Bool)

(assert (=> start!62140 (array_inv!14922 a!3626)))

(declare-fun b!695776 () Bool)

(assert (=> b!695776 (= e!395711 (contains!3744 acc!681 k0!2843))))

(declare-fun b!695777 () Bool)

(declare-fun res!459721 () Bool)

(assert (=> b!695777 (=> (not res!459721) (not e!395712))))

(assert (=> b!695777 (= res!459721 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13164))))

(assert (= (and start!62140 res!459719) b!695774))

(assert (= (and b!695774 res!459717) b!695773))

(assert (= (and b!695773 res!459722) b!695775))

(assert (= (and b!695775 res!459718) b!695772))

(assert (= (and b!695772 res!459720) b!695776))

(assert (= (and b!695772 (not res!459724)) b!695771))

(assert (= (and b!695771 res!459723) b!695770))

(assert (= (and b!695772 res!459725) b!695777))

(assert (= (and b!695777 res!459721) b!695769))

(declare-fun m!657115 () Bool)

(assert (=> b!695776 m!657115))

(declare-fun m!657117 () Bool)

(assert (=> b!695774 m!657117))

(declare-fun m!657119 () Bool)

(assert (=> b!695775 m!657119))

(assert (=> b!695770 m!657115))

(declare-fun m!657121 () Bool)

(assert (=> start!62140 m!657121))

(declare-fun m!657123 () Bool)

(assert (=> b!695769 m!657123))

(declare-fun m!657125 () Bool)

(assert (=> b!695773 m!657125))

(declare-fun m!657127 () Bool)

(assert (=> b!695777 m!657127))

(check-sat (not b!695770) (not b!695774) (not b!695773) (not b!695776) (not start!62140) (not b!695769) (not b!695775) (not b!695777))
(check-sat)
