; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62574 () Bool)

(assert start!62574)

(declare-fun b!705717 () Bool)

(declare-fun res!469527 () Bool)

(declare-fun e!397861 () Bool)

(assert (=> b!705717 (=> (not res!469527) (not e!397861))))

(declare-datatypes ((List!13324 0))(
  ( (Nil!13321) (Cons!13320 (h!14365 (_ BitVec 64)) (t!19606 List!13324)) )
))
(declare-fun acc!652 () List!13324)

(declare-fun contains!3901 (List!13324 (_ BitVec 64)) Bool)

(assert (=> b!705717 (= res!469527 (not (contains!3901 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705718 () Bool)

(declare-fun res!469544 () Bool)

(assert (=> b!705718 (=> (not res!469544) (not e!397861))))

(declare-datatypes ((array!40253 0))(
  ( (array!40254 (arr!19283 (Array (_ BitVec 32) (_ BitVec 64))) (size!19668 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40253)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40253 (_ BitVec 32) List!13324) Bool)

(assert (=> b!705718 (= res!469544 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705719 () Bool)

(assert (=> b!705719 (= e!397861 (not true))))

(declare-fun newAcc!49 () List!13324)

(assert (=> b!705719 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-fun k!2824 () (_ BitVec 64))

(declare-datatypes ((Unit!24616 0))(
  ( (Unit!24617) )
))
(declare-fun lt!317913 () Unit!24616)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40253 (_ BitVec 64) (_ BitVec 32) List!13324 List!13324) Unit!24616)

(assert (=> b!705719 (= lt!317913 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705720 () Bool)

(declare-fun res!469536 () Bool)

(assert (=> b!705720 (=> (not res!469536) (not e!397861))))

(assert (=> b!705720 (= res!469536 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705721 () Bool)

(declare-fun res!469539 () Bool)

(assert (=> b!705721 (=> (not res!469539) (not e!397861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705721 (= res!469539 (not (validKeyInArray!0 (select (arr!19283 a!3591) from!2969))))))

(declare-fun b!705722 () Bool)

(declare-fun res!469531 () Bool)

(assert (=> b!705722 (=> (not res!469531) (not e!397861))))

(declare-fun -!311 (List!13324 (_ BitVec 64)) List!13324)

(assert (=> b!705722 (= res!469531 (= (-!311 newAcc!49 k!2824) acc!652))))

(declare-fun b!705723 () Bool)

(declare-fun res!469541 () Bool)

(assert (=> b!705723 (=> (not res!469541) (not e!397861))))

(assert (=> b!705723 (= res!469541 (contains!3901 newAcc!49 k!2824))))

(declare-fun b!705725 () Bool)

(declare-fun res!469534 () Bool)

(assert (=> b!705725 (=> (not res!469534) (not e!397861))))

(declare-fun noDuplicate!1148 (List!13324) Bool)

(assert (=> b!705725 (= res!469534 (noDuplicate!1148 newAcc!49))))

(declare-fun b!705726 () Bool)

(declare-fun res!469533 () Bool)

(assert (=> b!705726 (=> (not res!469533) (not e!397861))))

(assert (=> b!705726 (= res!469533 (validKeyInArray!0 k!2824))))

(declare-fun b!705727 () Bool)

(declare-fun res!469538 () Bool)

(assert (=> b!705727 (=> (not res!469538) (not e!397861))))

(declare-fun arrayContainsKey!0 (array!40253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705727 (= res!469538 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!705728 () Bool)

(declare-fun res!469540 () Bool)

(assert (=> b!705728 (=> (not res!469540) (not e!397861))))

(assert (=> b!705728 (= res!469540 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705729 () Bool)

(declare-fun res!469545 () Bool)

(assert (=> b!705729 (=> (not res!469545) (not e!397861))))

(assert (=> b!705729 (= res!469545 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19668 a!3591)))))

(declare-fun b!705730 () Bool)

(declare-fun res!469543 () Bool)

(assert (=> b!705730 (=> (not res!469543) (not e!397861))))

(assert (=> b!705730 (= res!469543 (not (contains!3901 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705724 () Bool)

(declare-fun res!469542 () Bool)

(assert (=> b!705724 (=> (not res!469542) (not e!397861))))

(assert (=> b!705724 (= res!469542 (not (contains!3901 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!469530 () Bool)

(assert (=> start!62574 (=> (not res!469530) (not e!397861))))

(assert (=> start!62574 (= res!469530 (and (bvslt (size!19668 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19668 a!3591))))))

(assert (=> start!62574 e!397861))

(assert (=> start!62574 true))

(declare-fun array_inv!15079 (array!40253) Bool)

(assert (=> start!62574 (array_inv!15079 a!3591)))

(declare-fun b!705731 () Bool)

(declare-fun res!469532 () Bool)

(assert (=> b!705731 (=> (not res!469532) (not e!397861))))

(assert (=> b!705731 (= res!469532 (not (contains!3901 acc!652 k!2824)))))

(declare-fun b!705732 () Bool)

(declare-fun res!469537 () Bool)

(assert (=> b!705732 (=> (not res!469537) (not e!397861))))

(assert (=> b!705732 (= res!469537 (noDuplicate!1148 acc!652))))

(declare-fun b!705733 () Bool)

(declare-fun res!469528 () Bool)

(assert (=> b!705733 (=> (not res!469528) (not e!397861))))

(assert (=> b!705733 (= res!469528 (not (contains!3901 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705734 () Bool)

(declare-fun res!469535 () Bool)

(assert (=> b!705734 (=> (not res!469535) (not e!397861))))

(assert (=> b!705734 (= res!469535 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705735 () Bool)

(declare-fun res!469529 () Bool)

(assert (=> b!705735 (=> (not res!469529) (not e!397861))))

(declare-fun subseq!346 (List!13324 List!13324) Bool)

(assert (=> b!705735 (= res!469529 (subseq!346 acc!652 newAcc!49))))

(assert (= (and start!62574 res!469530) b!705732))

(assert (= (and b!705732 res!469537) b!705725))

(assert (= (and b!705725 res!469534) b!705724))

(assert (= (and b!705724 res!469542) b!705717))

(assert (= (and b!705717 res!469527) b!705727))

(assert (= (and b!705727 res!469538) b!705731))

(assert (= (and b!705731 res!469532) b!705726))

(assert (= (and b!705726 res!469533) b!705718))

(assert (= (and b!705718 res!469544) b!705735))

(assert (= (and b!705735 res!469529) b!705723))

(assert (= (and b!705723 res!469541) b!705722))

(assert (= (and b!705722 res!469531) b!705733))

(assert (= (and b!705733 res!469528) b!705730))

(assert (= (and b!705730 res!469543) b!705729))

(assert (= (and b!705729 res!469545) b!705721))

(assert (= (and b!705721 res!469539) b!705728))

(assert (= (and b!705728 res!469540) b!705734))

(assert (= (and b!705734 res!469535) b!705720))

(assert (= (and b!705720 res!469536) b!705719))

(declare-fun m!663795 () Bool)

(assert (=> b!705731 m!663795))

(declare-fun m!663797 () Bool)

(assert (=> b!705717 m!663797))

(declare-fun m!663799 () Bool)

(assert (=> b!705733 m!663799))

(declare-fun m!663801 () Bool)

(assert (=> b!705730 m!663801))

(declare-fun m!663803 () Bool)

(assert (=> b!705735 m!663803))

(declare-fun m!663805 () Bool)

(assert (=> b!705723 m!663805))

(declare-fun m!663807 () Bool)

(assert (=> b!705726 m!663807))

(declare-fun m!663809 () Bool)

(assert (=> b!705734 m!663809))

(declare-fun m!663811 () Bool)

(assert (=> b!705718 m!663811))

(declare-fun m!663813 () Bool)

(assert (=> b!705725 m!663813))

(declare-fun m!663815 () Bool)

(assert (=> b!705722 m!663815))

(declare-fun m!663817 () Bool)

(assert (=> b!705727 m!663817))

(declare-fun m!663819 () Bool)

(assert (=> b!705720 m!663819))

(declare-fun m!663821 () Bool)

(assert (=> b!705732 m!663821))

(declare-fun m!663823 () Bool)

(assert (=> start!62574 m!663823))

(declare-fun m!663825 () Bool)

(assert (=> b!705721 m!663825))

(assert (=> b!705721 m!663825))

(declare-fun m!663827 () Bool)

(assert (=> b!705721 m!663827))

(declare-fun m!663829 () Bool)

(assert (=> b!705724 m!663829))

(declare-fun m!663831 () Bool)

(assert (=> b!705719 m!663831))

(declare-fun m!663833 () Bool)

(assert (=> b!705719 m!663833))

(push 1)

(assert (not b!705717))

(assert (not b!705731))

(assert (not b!705719))

(assert (not b!705733))

(assert (not b!705730))

(assert (not b!705724))

(assert (not b!705723))

(assert (not b!705725))

(assert (not b!705721))

(assert (not b!705734))

(assert (not b!705720))

(assert (not b!705726))

(assert (not b!705732))

(assert (not b!705722))

(assert (not b!705727))

(assert (not start!62574))

