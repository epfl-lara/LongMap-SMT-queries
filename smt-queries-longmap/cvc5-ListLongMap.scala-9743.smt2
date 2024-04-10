; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115442 () Bool)

(assert start!115442)

(declare-fun b!1365107 () Bool)

(declare-fun e!774137 () Bool)

(declare-fun e!774138 () Bool)

(assert (=> b!1365107 (= e!774137 e!774138)))

(declare-fun res!908697 () Bool)

(assert (=> b!1365107 (=> (not res!908697) (not e!774138))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1365107 (= res!908697 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-datatypes ((array!92763 0))(
  ( (array!92764 (arr!44810 (Array (_ BitVec 32) (_ BitVec 64))) (size!45360 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92763)

(declare-datatypes ((List!31878 0))(
  ( (Nil!31875) (Cons!31874 (h!33083 (_ BitVec 64)) (t!46572 List!31878)) )
))
(declare-fun newAcc!98 () List!31878)

(declare-fun lt!601198 () List!31878)

(assert (=> b!1365107 (= lt!601198 (Cons!31874 (select (arr!44810 a!3861) from!3239) newAcc!98))))

(declare-fun lt!601195 () List!31878)

(declare-fun acc!866 () List!31878)

(assert (=> b!1365107 (= lt!601195 (Cons!31874 (select (arr!44810 a!3861) from!3239) acc!866))))

(declare-fun b!1365108 () Bool)

(declare-fun res!908695 () Bool)

(assert (=> b!1365108 (=> (not res!908695) (not e!774138))))

(declare-fun subseq!962 (List!31878 List!31878) Bool)

(assert (=> b!1365108 (= res!908695 (subseq!962 lt!601198 lt!601195))))

(declare-fun b!1365109 () Bool)

(declare-fun res!908691 () Bool)

(assert (=> b!1365109 (=> (not res!908691) (not e!774138))))

(declare-fun noDuplicate!2417 (List!31878) Bool)

(assert (=> b!1365109 (= res!908691 (noDuplicate!2417 lt!601195))))

(declare-fun b!1365110 () Bool)

(declare-fun res!908688 () Bool)

(assert (=> b!1365110 (=> (not res!908688) (not e!774137))))

(assert (=> b!1365110 (= res!908688 (bvslt from!3239 (size!45360 a!3861)))))

(declare-fun b!1365111 () Bool)

(declare-fun res!908683 () Bool)

(assert (=> b!1365111 (=> (not res!908683) (not e!774138))))

(declare-fun contains!9560 (List!31878 (_ BitVec 64)) Bool)

(assert (=> b!1365111 (= res!908683 (not (contains!9560 lt!601195 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365112 () Bool)

(declare-fun res!908696 () Bool)

(declare-fun e!774139 () Bool)

(assert (=> b!1365112 (=> (not res!908696) (not e!774139))))

(assert (=> b!1365112 (= res!908696 (subseq!962 newAcc!98 acc!866))))

(declare-fun b!1365114 () Bool)

(declare-fun res!908686 () Bool)

(assert (=> b!1365114 (=> (not res!908686) (not e!774137))))

(assert (=> b!1365114 (= res!908686 (not (contains!9560 acc!866 (select (arr!44810 a!3861) from!3239))))))

(declare-fun b!1365115 () Bool)

(declare-fun res!908694 () Bool)

(assert (=> b!1365115 (=> (not res!908694) (not e!774139))))

(assert (=> b!1365115 (= res!908694 (noDuplicate!2417 acc!866))))

(declare-fun b!1365116 () Bool)

(declare-fun res!908682 () Bool)

(assert (=> b!1365116 (=> (not res!908682) (not e!774137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365116 (= res!908682 (validKeyInArray!0 (select (arr!44810 a!3861) from!3239)))))

(declare-fun b!1365117 () Bool)

(assert (=> b!1365117 (= e!774139 e!774137)))

(declare-fun res!908692 () Bool)

(assert (=> b!1365117 (=> (not res!908692) (not e!774137))))

(declare-fun arrayNoDuplicates!0 (array!92763 (_ BitVec 32) List!31878) Bool)

(assert (=> b!1365117 (= res!908692 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45057 0))(
  ( (Unit!45058) )
))
(declare-fun lt!601196 () Unit!45057)

(declare-fun noDuplicateSubseq!149 (List!31878 List!31878) Unit!45057)

(assert (=> b!1365117 (= lt!601196 (noDuplicateSubseq!149 newAcc!98 acc!866))))

(declare-fun b!1365118 () Bool)

(declare-fun res!908693 () Bool)

(assert (=> b!1365118 (=> (not res!908693) (not e!774139))))

(assert (=> b!1365118 (= res!908693 (not (contains!9560 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365119 () Bool)

(declare-fun res!908685 () Bool)

(assert (=> b!1365119 (=> (not res!908685) (not e!774138))))

(assert (=> b!1365119 (= res!908685 (not (contains!9560 lt!601198 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365120 () Bool)

(declare-fun res!908681 () Bool)

(assert (=> b!1365120 (=> (not res!908681) (not e!774138))))

(assert (=> b!1365120 (= res!908681 (not (contains!9560 lt!601195 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365121 () Bool)

(declare-fun res!908687 () Bool)

(assert (=> b!1365121 (=> (not res!908687) (not e!774138))))

(assert (=> b!1365121 (= res!908687 (not (contains!9560 lt!601198 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365122 () Bool)

(declare-fun res!908698 () Bool)

(assert (=> b!1365122 (=> (not res!908698) (not e!774139))))

(assert (=> b!1365122 (= res!908698 (not (contains!9560 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365113 () Bool)

(declare-fun res!908689 () Bool)

(assert (=> b!1365113 (=> (not res!908689) (not e!774139))))

(assert (=> b!1365113 (= res!908689 (not (contains!9560 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908684 () Bool)

(assert (=> start!115442 (=> (not res!908684) (not e!774139))))

(assert (=> start!115442 (= res!908684 (and (bvslt (size!45360 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45360 a!3861))))))

(assert (=> start!115442 e!774139))

(declare-fun array_inv!33838 (array!92763) Bool)

(assert (=> start!115442 (array_inv!33838 a!3861)))

(assert (=> start!115442 true))

(declare-fun b!1365123 () Bool)

(assert (=> b!1365123 (= e!774138 false)))

(declare-fun lt!601197 () Bool)

(assert (=> b!1365123 (= lt!601197 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601195))))

(declare-fun lt!601194 () Unit!45057)

(assert (=> b!1365123 (= lt!601194 (noDuplicateSubseq!149 lt!601198 lt!601195))))

(declare-fun b!1365124 () Bool)

(declare-fun res!908690 () Bool)

(assert (=> b!1365124 (=> (not res!908690) (not e!774139))))

(assert (=> b!1365124 (= res!908690 (not (contains!9560 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115442 res!908684) b!1365115))

(assert (= (and b!1365115 res!908694) b!1365124))

(assert (= (and b!1365124 res!908690) b!1365113))

(assert (= (and b!1365113 res!908689) b!1365122))

(assert (= (and b!1365122 res!908698) b!1365118))

(assert (= (and b!1365118 res!908693) b!1365112))

(assert (= (and b!1365112 res!908696) b!1365117))

(assert (= (and b!1365117 res!908692) b!1365110))

(assert (= (and b!1365110 res!908688) b!1365116))

(assert (= (and b!1365116 res!908682) b!1365114))

(assert (= (and b!1365114 res!908686) b!1365107))

(assert (= (and b!1365107 res!908697) b!1365109))

(assert (= (and b!1365109 res!908691) b!1365111))

(assert (= (and b!1365111 res!908683) b!1365120))

(assert (= (and b!1365120 res!908681) b!1365121))

(assert (= (and b!1365121 res!908687) b!1365119))

(assert (= (and b!1365119 res!908685) b!1365108))

(assert (= (and b!1365108 res!908695) b!1365123))

(declare-fun m!1249741 () Bool)

(assert (=> b!1365109 m!1249741))

(declare-fun m!1249743 () Bool)

(assert (=> b!1365107 m!1249743))

(declare-fun m!1249745 () Bool)

(assert (=> b!1365121 m!1249745))

(declare-fun m!1249747 () Bool)

(assert (=> b!1365124 m!1249747))

(declare-fun m!1249749 () Bool)

(assert (=> start!115442 m!1249749))

(declare-fun m!1249751 () Bool)

(assert (=> b!1365118 m!1249751))

(declare-fun m!1249753 () Bool)

(assert (=> b!1365122 m!1249753))

(declare-fun m!1249755 () Bool)

(assert (=> b!1365117 m!1249755))

(declare-fun m!1249757 () Bool)

(assert (=> b!1365117 m!1249757))

(declare-fun m!1249759 () Bool)

(assert (=> b!1365112 m!1249759))

(assert (=> b!1365114 m!1249743))

(assert (=> b!1365114 m!1249743))

(declare-fun m!1249761 () Bool)

(assert (=> b!1365114 m!1249761))

(declare-fun m!1249763 () Bool)

(assert (=> b!1365119 m!1249763))

(declare-fun m!1249765 () Bool)

(assert (=> b!1365111 m!1249765))

(declare-fun m!1249767 () Bool)

(assert (=> b!1365123 m!1249767))

(declare-fun m!1249769 () Bool)

(assert (=> b!1365123 m!1249769))

(declare-fun m!1249771 () Bool)

(assert (=> b!1365120 m!1249771))

(declare-fun m!1249773 () Bool)

(assert (=> b!1365115 m!1249773))

(declare-fun m!1249775 () Bool)

(assert (=> b!1365108 m!1249775))

(declare-fun m!1249777 () Bool)

(assert (=> b!1365113 m!1249777))

(assert (=> b!1365116 m!1249743))

(assert (=> b!1365116 m!1249743))

(declare-fun m!1249779 () Bool)

(assert (=> b!1365116 m!1249779))

(push 1)

