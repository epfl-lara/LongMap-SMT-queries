; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62134 () Bool)

(assert start!62134)

(declare-fun b!695688 () Bool)

(declare-fun e!395669 () Bool)

(declare-fun e!395668 () Bool)

(assert (=> b!695688 (= e!395669 e!395668)))

(declare-fun res!459640 () Bool)

(assert (=> b!695688 (=> (not res!459640) (not e!395668))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695688 (= res!459640 (bvsle from!3004 i!1382))))

(declare-fun b!695689 () Bool)

(declare-fun e!395666 () Bool)

(declare-datatypes ((List!13164 0))(
  ( (Nil!13161) (Cons!13160 (h!14205 (_ BitVec 64)) (t!19446 List!13164)) )
))
(declare-fun acc!681 () List!13164)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3741 (List!13164 (_ BitVec 64)) Bool)

(assert (=> b!695689 (= e!395666 (contains!3741 acc!681 k0!2843))))

(declare-fun b!695690 () Bool)

(assert (=> b!695690 (= e!395668 (not (contains!3741 acc!681 k0!2843)))))

(declare-fun res!459641 () Bool)

(declare-fun e!395667 () Bool)

(assert (=> start!62134 (=> (not res!459641) (not e!395667))))

(declare-datatypes ((array!39924 0))(
  ( (array!39925 (arr!19123 (Array (_ BitVec 32) (_ BitVec 64))) (size!19508 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39924)

(assert (=> start!62134 (= res!459641 (and (bvslt (size!19508 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19508 a!3626))))))

(assert (=> start!62134 e!395667))

(assert (=> start!62134 true))

(declare-fun array_inv!14919 (array!39924) Bool)

(assert (=> start!62134 (array_inv!14919 a!3626)))

(declare-fun b!695691 () Bool)

(declare-fun res!459643 () Bool)

(assert (=> b!695691 (=> (not res!459643) (not e!395667))))

(assert (=> b!695691 (= res!459643 (not (contains!3741 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695692 () Bool)

(declare-fun res!459642 () Bool)

(assert (=> b!695692 (=> (not res!459642) (not e!395667))))

(assert (=> b!695692 (= res!459642 e!395669)))

(declare-fun res!459638 () Bool)

(assert (=> b!695692 (=> res!459638 e!395669)))

(assert (=> b!695692 (= res!459638 e!395666)))

(declare-fun res!459637 () Bool)

(assert (=> b!695692 (=> (not res!459637) (not e!395666))))

(assert (=> b!695692 (= res!459637 (bvsgt from!3004 i!1382))))

(declare-fun b!695693 () Bool)

(assert (=> b!695693 (= e!395667 false)))

(declare-fun lt!317074 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39924 (_ BitVec 32) List!13164) Bool)

(assert (=> b!695693 (= lt!317074 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695694 () Bool)

(declare-fun res!459639 () Bool)

(assert (=> b!695694 (=> (not res!459639) (not e!395667))))

(assert (=> b!695694 (= res!459639 (not (contains!3741 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695695 () Bool)

(declare-fun res!459644 () Bool)

(assert (=> b!695695 (=> (not res!459644) (not e!395667))))

(assert (=> b!695695 (= res!459644 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13161))))

(declare-fun b!695696 () Bool)

(declare-fun res!459636 () Bool)

(assert (=> b!695696 (=> (not res!459636) (not e!395667))))

(declare-fun noDuplicate!988 (List!13164) Bool)

(assert (=> b!695696 (= res!459636 (noDuplicate!988 acc!681))))

(assert (= (and start!62134 res!459641) b!695696))

(assert (= (and b!695696 res!459636) b!695694))

(assert (= (and b!695694 res!459639) b!695691))

(assert (= (and b!695691 res!459643) b!695692))

(assert (= (and b!695692 res!459637) b!695689))

(assert (= (and b!695692 (not res!459638)) b!695688))

(assert (= (and b!695688 res!459640) b!695690))

(assert (= (and b!695692 res!459642) b!695695))

(assert (= (and b!695695 res!459644) b!695693))

(declare-fun m!657073 () Bool)

(assert (=> b!695690 m!657073))

(declare-fun m!657075 () Bool)

(assert (=> b!695693 m!657075))

(declare-fun m!657077 () Bool)

(assert (=> b!695696 m!657077))

(declare-fun m!657079 () Bool)

(assert (=> start!62134 m!657079))

(declare-fun m!657081 () Bool)

(assert (=> b!695695 m!657081))

(declare-fun m!657083 () Bool)

(assert (=> b!695691 m!657083))

(assert (=> b!695689 m!657073))

(declare-fun m!657085 () Bool)

(assert (=> b!695694 m!657085))

(check-sat (not b!695693) (not b!695696) (not b!695691) (not b!695689) (not b!695695) (not b!695690) (not b!695694) (not start!62134))
(check-sat)
