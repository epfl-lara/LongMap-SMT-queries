; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62448 () Bool)

(assert start!62448)

(declare-fun b!701802 () Bool)

(declare-fun res!465638 () Bool)

(declare-fun e!397438 () Bool)

(assert (=> b!701802 (=> (not res!465638) (not e!397438))))

(declare-datatypes ((List!13261 0))(
  ( (Nil!13258) (Cons!13257 (h!14302 (_ BitVec 64)) (t!19543 List!13261)) )
))
(declare-fun lt!317633 () List!13261)

(declare-fun contains!3838 (List!13261 (_ BitVec 64)) Bool)

(assert (=> b!701802 (= res!465638 (not (contains!3838 lt!317633 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701803 () Bool)

(declare-fun res!465619 () Bool)

(declare-fun e!397437 () Bool)

(assert (=> b!701803 (=> (not res!465619) (not e!397437))))

(declare-datatypes ((array!40127 0))(
  ( (array!40128 (arr!19220 (Array (_ BitVec 32) (_ BitVec 64))) (size!19605 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40127)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun acc!652 () List!13261)

(declare-fun arrayNoDuplicates!0 (array!40127 (_ BitVec 32) List!13261) Bool)

(assert (=> b!701803 (= res!465619 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!701804 () Bool)

(declare-fun res!465630 () Bool)

(assert (=> b!701804 (=> (not res!465630) (not e!397438))))

(declare-fun noDuplicate!1085 (List!13261) Bool)

(assert (=> b!701804 (= res!465630 (noDuplicate!1085 lt!317633))))

(declare-fun b!701805 () Bool)

(assert (=> b!701805 (= e!397437 e!397438)))

(declare-fun res!465636 () Bool)

(assert (=> b!701805 (=> (not res!465636) (not e!397438))))

(assert (=> b!701805 (= res!465636 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun newAcc!49 () List!13261)

(declare-fun lt!317632 () List!13261)

(declare-fun $colon$colon!481 (List!13261 (_ BitVec 64)) List!13261)

(assert (=> b!701805 (= lt!317632 ($colon$colon!481 newAcc!49 (select (arr!19220 a!3591) from!2969)))))

(assert (=> b!701805 (= lt!317633 ($colon$colon!481 acc!652 (select (arr!19220 a!3591) from!2969)))))

(declare-fun b!701806 () Bool)

(declare-fun res!465631 () Bool)

(assert (=> b!701806 (=> (not res!465631) (not e!397437))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!248 (List!13261 (_ BitVec 64)) List!13261)

(assert (=> b!701806 (= res!465631 (= (-!248 newAcc!49 k!2824) acc!652))))

(declare-fun b!701807 () Bool)

(declare-fun res!465615 () Bool)

(assert (=> b!701807 (=> (not res!465615) (not e!397438))))

(assert (=> b!701807 (= res!465615 (noDuplicate!1085 lt!317632))))

(declare-fun b!701808 () Bool)

(declare-fun res!465634 () Bool)

(assert (=> b!701808 (=> (not res!465634) (not e!397437))))

(assert (=> b!701808 (= res!465634 (not (contains!3838 acc!652 k!2824)))))

(declare-fun b!701809 () Bool)

(declare-fun res!465627 () Bool)

(assert (=> b!701809 (=> (not res!465627) (not e!397437))))

(declare-fun arrayContainsKey!0 (array!40127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!701809 (= res!465627 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!701810 () Bool)

(declare-fun res!465639 () Bool)

(assert (=> b!701810 (=> (not res!465639) (not e!397438))))

(assert (=> b!701810 (= res!465639 (not (contains!3838 lt!317632 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701811 () Bool)

(declare-fun res!465616 () Bool)

(assert (=> b!701811 (=> (not res!465616) (not e!397438))))

(declare-fun subseq!283 (List!13261 List!13261) Bool)

(assert (=> b!701811 (= res!465616 (subseq!283 lt!317633 lt!317632))))

(declare-fun b!701812 () Bool)

(declare-fun res!465628 () Bool)

(assert (=> b!701812 (=> (not res!465628) (not e!397438))))

(assert (=> b!701812 (= res!465628 (= (-!248 lt!317632 k!2824) lt!317633))))

(declare-fun b!701813 () Bool)

(declare-fun res!465612 () Bool)

(assert (=> b!701813 (=> (not res!465612) (not e!397438))))

(assert (=> b!701813 (= res!465612 (not (contains!3838 lt!317633 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701814 () Bool)

(declare-fun res!465621 () Bool)

(assert (=> b!701814 (=> (not res!465621) (not e!397438))))

(assert (=> b!701814 (= res!465621 (not (contains!3838 lt!317633 k!2824)))))

(declare-fun b!701815 () Bool)

(declare-fun res!465635 () Bool)

(assert (=> b!701815 (=> (not res!465635) (not e!397437))))

(assert (=> b!701815 (= res!465635 (not (contains!3838 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701816 () Bool)

(declare-fun res!465614 () Bool)

(assert (=> b!701816 (=> (not res!465614) (not e!397437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!701816 (= res!465614 (validKeyInArray!0 (select (arr!19220 a!3591) from!2969)))))

(declare-fun b!701817 () Bool)

(declare-fun res!465624 () Bool)

(assert (=> b!701817 (=> (not res!465624) (not e!397437))))

(assert (=> b!701817 (= res!465624 (not (contains!3838 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!465632 () Bool)

(assert (=> start!62448 (=> (not res!465632) (not e!397437))))

(assert (=> start!62448 (= res!465632 (and (bvslt (size!19605 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19605 a!3591))))))

(assert (=> start!62448 e!397437))

(assert (=> start!62448 true))

(declare-fun array_inv!15016 (array!40127) Bool)

(assert (=> start!62448 (array_inv!15016 a!3591)))

(declare-fun b!701818 () Bool)

(assert (=> b!701818 (= e!397438 false)))

(declare-fun lt!317634 () Bool)

(assert (=> b!701818 (= lt!317634 (contains!3838 lt!317632 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!701819 () Bool)

(declare-fun res!465637 () Bool)

(assert (=> b!701819 (=> (not res!465637) (not e!397437))))

(assert (=> b!701819 (= res!465637 (validKeyInArray!0 k!2824))))

(declare-fun b!701820 () Bool)

(declare-fun res!465623 () Bool)

(assert (=> b!701820 (=> (not res!465623) (not e!397437))))

(assert (=> b!701820 (= res!465623 (noDuplicate!1085 acc!652))))

(declare-fun b!701821 () Bool)

(declare-fun res!465622 () Bool)

(assert (=> b!701821 (=> (not res!465622) (not e!397437))))

(assert (=> b!701821 (= res!465622 (subseq!283 acc!652 newAcc!49))))

(declare-fun b!701822 () Bool)

(declare-fun res!465613 () Bool)

(assert (=> b!701822 (=> (not res!465613) (not e!397438))))

(assert (=> b!701822 (= res!465613 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!701823 () Bool)

(declare-fun res!465617 () Bool)

(assert (=> b!701823 (=> (not res!465617) (not e!397437))))

(assert (=> b!701823 (= res!465617 (noDuplicate!1085 newAcc!49))))

(declare-fun b!701824 () Bool)

(declare-fun res!465620 () Bool)

(assert (=> b!701824 (=> (not res!465620) (not e!397437))))

(assert (=> b!701824 (= res!465620 (not (contains!3838 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701825 () Bool)

(declare-fun res!465629 () Bool)

(assert (=> b!701825 (=> (not res!465629) (not e!397438))))

(assert (=> b!701825 (= res!465629 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317633))))

(declare-fun b!701826 () Bool)

(declare-fun res!465626 () Bool)

(assert (=> b!701826 (=> (not res!465626) (not e!397437))))

(assert (=> b!701826 (= res!465626 (not (contains!3838 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701827 () Bool)

(declare-fun res!465633 () Bool)

(assert (=> b!701827 (=> (not res!465633) (not e!397437))))

(assert (=> b!701827 (= res!465633 (contains!3838 newAcc!49 k!2824))))

(declare-fun b!701828 () Bool)

(declare-fun res!465625 () Bool)

(assert (=> b!701828 (=> (not res!465625) (not e!397438))))

(assert (=> b!701828 (= res!465625 (contains!3838 lt!317632 k!2824))))

(declare-fun b!701829 () Bool)

(declare-fun res!465618 () Bool)

(assert (=> b!701829 (=> (not res!465618) (not e!397437))))

(assert (=> b!701829 (= res!465618 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19605 a!3591)))))

(assert (= (and start!62448 res!465632) b!701820))

(assert (= (and b!701820 res!465623) b!701823))

(assert (= (and b!701823 res!465617) b!701826))

(assert (= (and b!701826 res!465626) b!701815))

(assert (= (and b!701815 res!465635) b!701809))

(assert (= (and b!701809 res!465627) b!701808))

(assert (= (and b!701808 res!465634) b!701819))

(assert (= (and b!701819 res!465637) b!701803))

(assert (= (and b!701803 res!465619) b!701821))

(assert (= (and b!701821 res!465622) b!701827))

(assert (= (and b!701827 res!465633) b!701806))

(assert (= (and b!701806 res!465631) b!701817))

(assert (= (and b!701817 res!465624) b!701824))

(assert (= (and b!701824 res!465620) b!701829))

(assert (= (and b!701829 res!465618) b!701816))

(assert (= (and b!701816 res!465614) b!701805))

(assert (= (and b!701805 res!465636) b!701804))

(assert (= (and b!701804 res!465630) b!701807))

(assert (= (and b!701807 res!465615) b!701813))

(assert (= (and b!701813 res!465612) b!701802))

(assert (= (and b!701802 res!465638) b!701822))

(assert (= (and b!701822 res!465613) b!701814))

(assert (= (and b!701814 res!465621) b!701825))

(assert (= (and b!701825 res!465629) b!701811))

(assert (= (and b!701811 res!465616) b!701828))

(assert (= (and b!701828 res!465625) b!701812))

(assert (= (and b!701812 res!465628) b!701810))

(assert (= (and b!701810 res!465639) b!701818))

(declare-fun m!661075 () Bool)

(assert (=> b!701826 m!661075))

(declare-fun m!661077 () Bool)

(assert (=> b!701814 m!661077))

(declare-fun m!661079 () Bool)

(assert (=> b!701815 m!661079))

(declare-fun m!661081 () Bool)

(assert (=> b!701805 m!661081))

(assert (=> b!701805 m!661081))

(declare-fun m!661083 () Bool)

(assert (=> b!701805 m!661083))

(assert (=> b!701805 m!661081))

(declare-fun m!661085 () Bool)

(assert (=> b!701805 m!661085))

(declare-fun m!661087 () Bool)

(assert (=> b!701807 m!661087))

(declare-fun m!661089 () Bool)

(assert (=> b!701824 m!661089))

(declare-fun m!661091 () Bool)

(assert (=> b!701818 m!661091))

(declare-fun m!661093 () Bool)

(assert (=> start!62448 m!661093))

(declare-fun m!661095 () Bool)

(assert (=> b!701828 m!661095))

(declare-fun m!661097 () Bool)

(assert (=> b!701821 m!661097))

(declare-fun m!661099 () Bool)

(assert (=> b!701803 m!661099))

(declare-fun m!661101 () Bool)

(assert (=> b!701806 m!661101))

(declare-fun m!661103 () Bool)

(assert (=> b!701804 m!661103))

(declare-fun m!661105 () Bool)

(assert (=> b!701820 m!661105))

(declare-fun m!661107 () Bool)

(assert (=> b!701810 m!661107))

(declare-fun m!661109 () Bool)

(assert (=> b!701817 m!661109))

(declare-fun m!661111 () Bool)

(assert (=> b!701819 m!661111))

(declare-fun m!661113 () Bool)

(assert (=> b!701825 m!661113))

(declare-fun m!661115 () Bool)

(assert (=> b!701808 m!661115))

(declare-fun m!661117 () Bool)

(assert (=> b!701813 m!661117))

(declare-fun m!661119 () Bool)

(assert (=> b!701822 m!661119))

(declare-fun m!661121 () Bool)

(assert (=> b!701802 m!661121))

(declare-fun m!661123 () Bool)

(assert (=> b!701809 m!661123))

(assert (=> b!701816 m!661081))

(assert (=> b!701816 m!661081))

(declare-fun m!661125 () Bool)

(assert (=> b!701816 m!661125))

(declare-fun m!661127 () Bool)

(assert (=> b!701812 m!661127))

(declare-fun m!661129 () Bool)

(assert (=> b!701811 m!661129))

(declare-fun m!661131 () Bool)

(assert (=> b!701823 m!661131))

(declare-fun m!661133 () Bool)

(assert (=> b!701827 m!661133))

(push 1)

