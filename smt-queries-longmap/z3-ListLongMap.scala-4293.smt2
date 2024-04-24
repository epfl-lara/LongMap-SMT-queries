; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59844 () Bool)

(assert start!59844)

(declare-fun b!660668 () Bool)

(declare-fun res!428621 () Bool)

(declare-fun e!379662 () Bool)

(assert (=> b!660668 (=> (not res!428621) (not e!379662))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38829 0))(
  ( (array!38830 (arr!18604 (Array (_ BitVec 32) (_ BitVec 64))) (size!18968 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38829)

(assert (=> b!660668 (= res!428621 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18968 a!3626))))))

(declare-fun b!660669 () Bool)

(declare-fun res!428623 () Bool)

(assert (=> b!660669 (=> (not res!428623) (not e!379662))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12552 0))(
  ( (Nil!12549) (Cons!12548 (h!13596 (_ BitVec 64)) (t!18772 List!12552)) )
))
(declare-fun acc!681 () List!12552)

(declare-fun arrayNoDuplicates!0 (array!38829 (_ BitVec 32) List!12552) Bool)

(assert (=> b!660669 (= res!428623 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!428624 () Bool)

(assert (=> start!59844 (=> (not res!428624) (not e!379662))))

(assert (=> start!59844 (= res!428624 (and (bvslt (size!18968 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18968 a!3626))))))

(assert (=> start!59844 e!379662))

(assert (=> start!59844 true))

(declare-fun array_inv!14463 (array!38829) Bool)

(assert (=> start!59844 (array_inv!14463 a!3626)))

(declare-fun b!660670 () Bool)

(declare-fun e!379660 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3204 (List!12552 (_ BitVec 64)) Bool)

(assert (=> b!660670 (= e!379660 (contains!3204 acc!681 k0!2843))))

(declare-fun b!660671 () Bool)

(declare-fun res!428631 () Bool)

(assert (=> b!660671 (=> (not res!428631) (not e!379662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!660671 (= res!428631 (validKeyInArray!0 k0!2843))))

(declare-fun b!660672 () Bool)

(declare-fun res!428627 () Bool)

(assert (=> b!660672 (=> (not res!428627) (not e!379662))))

(declare-fun e!379661 () Bool)

(assert (=> b!660672 (= res!428627 e!379661)))

(declare-fun res!428622 () Bool)

(assert (=> b!660672 (=> res!428622 e!379661)))

(assert (=> b!660672 (= res!428622 e!379660)))

(declare-fun res!428629 () Bool)

(assert (=> b!660672 (=> (not res!428629) (not e!379660))))

(assert (=> b!660672 (= res!428629 (bvsgt from!3004 i!1382))))

(declare-fun b!660673 () Bool)

(assert (=> b!660673 (= e!379662 (bvsge #b00000000000000000000000000000000 (size!18968 a!3626)))))

(declare-fun b!660674 () Bool)

(declare-fun res!428625 () Bool)

(assert (=> b!660674 (=> (not res!428625) (not e!379662))))

(assert (=> b!660674 (= res!428625 (not (contains!3204 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660675 () Bool)

(declare-fun e!379658 () Bool)

(assert (=> b!660675 (= e!379661 e!379658)))

(declare-fun res!428630 () Bool)

(assert (=> b!660675 (=> (not res!428630) (not e!379658))))

(assert (=> b!660675 (= res!428630 (bvsle from!3004 i!1382))))

(declare-fun b!660676 () Bool)

(declare-fun res!428628 () Bool)

(assert (=> b!660676 (=> (not res!428628) (not e!379662))))

(assert (=> b!660676 (= res!428628 (not (contains!3204 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660677 () Bool)

(assert (=> b!660677 (= e!379658 (not (contains!3204 acc!681 k0!2843)))))

(declare-fun b!660678 () Bool)

(declare-fun res!428626 () Bool)

(assert (=> b!660678 (=> (not res!428626) (not e!379662))))

(declare-fun noDuplicate!478 (List!12552) Bool)

(assert (=> b!660678 (= res!428626 (noDuplicate!478 acc!681))))

(declare-fun b!660679 () Bool)

(declare-fun res!428632 () Bool)

(assert (=> b!660679 (=> (not res!428632) (not e!379662))))

(assert (=> b!660679 (= res!428632 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12549))))

(assert (= (and start!59844 res!428624) b!660678))

(assert (= (and b!660678 res!428626) b!660674))

(assert (= (and b!660674 res!428625) b!660676))

(assert (= (and b!660676 res!428628) b!660672))

(assert (= (and b!660672 res!428629) b!660670))

(assert (= (and b!660672 (not res!428622)) b!660675))

(assert (= (and b!660675 res!428630) b!660677))

(assert (= (and b!660672 res!428627) b!660679))

(assert (= (and b!660679 res!428632) b!660669))

(assert (= (and b!660669 res!428623) b!660668))

(assert (= (and b!660668 res!428621) b!660671))

(assert (= (and b!660671 res!428631) b!660673))

(declare-fun m!633817 () Bool)

(assert (=> b!660676 m!633817))

(declare-fun m!633819 () Bool)

(assert (=> b!660678 m!633819))

(declare-fun m!633821 () Bool)

(assert (=> start!59844 m!633821))

(declare-fun m!633823 () Bool)

(assert (=> b!660674 m!633823))

(declare-fun m!633825 () Bool)

(assert (=> b!660669 m!633825))

(declare-fun m!633827 () Bool)

(assert (=> b!660679 m!633827))

(declare-fun m!633829 () Bool)

(assert (=> b!660677 m!633829))

(declare-fun m!633831 () Bool)

(assert (=> b!660671 m!633831))

(assert (=> b!660670 m!633829))

(check-sat (not start!59844) (not b!660669) (not b!660676) (not b!660679) (not b!660670) (not b!660678) (not b!660677) (not b!660671) (not b!660674))
(check-sat)
