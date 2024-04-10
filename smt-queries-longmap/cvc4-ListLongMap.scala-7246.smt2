; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92542 () Bool)

(assert start!92542)

(declare-fun b!1052646 () Bool)

(declare-fun res!701772 () Bool)

(declare-fun e!597684 () Bool)

(assert (=> b!1052646 (=> (not res!701772) (not e!597684))))

(declare-datatypes ((array!66343 0))(
  ( (array!66344 (arr!31911 (Array (_ BitVec 32) (_ BitVec 64))) (size!32447 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66343)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052646 (= res!701772 (= (select (arr!31911 a!3488) i!1381) k!2747))))

(declare-fun b!1052647 () Bool)

(declare-fun res!701780 () Bool)

(assert (=> b!1052647 (=> (not res!701780) (not e!597684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052647 (= res!701780 (validKeyInArray!0 k!2747))))

(declare-fun b!1052648 () Bool)

(declare-fun e!597685 () Bool)

(assert (=> b!1052648 (= e!597684 e!597685)))

(declare-fun res!701778 () Bool)

(assert (=> b!1052648 (=> (not res!701778) (not e!597685))))

(declare-fun lt!464888 () array!66343)

(declare-fun arrayContainsKey!0 (array!66343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052648 (= res!701778 (arrayContainsKey!0 lt!464888 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052648 (= lt!464888 (array!66344 (store (arr!31911 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32447 a!3488)))))

(declare-fun b!1052649 () Bool)

(declare-fun e!597680 () Bool)

(assert (=> b!1052649 (= e!597680 true)))

(declare-fun lt!464889 () (_ BitVec 32))

(assert (=> b!1052649 (not (= (select (arr!31911 a!3488) lt!464889) k!2747))))

(declare-datatypes ((Unit!34494 0))(
  ( (Unit!34495) )
))
(declare-fun lt!464890 () Unit!34494)

(declare-datatypes ((List!22223 0))(
  ( (Nil!22220) (Cons!22219 (h!23428 (_ BitVec 64)) (t!31530 List!22223)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66343 (_ BitVec 64) (_ BitVec 32) List!22223) Unit!34494)

(assert (=> b!1052649 (= lt!464890 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 lt!464889 Nil!22220))))

(declare-fun lt!464891 () (_ BitVec 32))

(assert (=> b!1052649 (arrayContainsKey!0 a!3488 k!2747 lt!464891)))

(declare-fun lt!464892 () Unit!34494)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66343 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34494)

(assert (=> b!1052649 (= lt!464892 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464891))))

(assert (=> b!1052649 (= lt!464891 (bvadd #b00000000000000000000000000000001 lt!464889))))

(declare-fun arrayNoDuplicates!0 (array!66343 (_ BitVec 32) List!22223) Bool)

(assert (=> b!1052649 (arrayNoDuplicates!0 a!3488 lt!464889 Nil!22220)))

(declare-fun lt!464887 () Unit!34494)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66343 (_ BitVec 32) (_ BitVec 32)) Unit!34494)

(assert (=> b!1052649 (= lt!464887 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464889))))

(declare-fun b!1052650 () Bool)

(declare-fun e!597683 () Bool)

(declare-fun e!597679 () Bool)

(assert (=> b!1052650 (= e!597683 e!597679)))

(declare-fun res!701775 () Bool)

(assert (=> b!1052650 (=> res!701775 e!597679)))

(assert (=> b!1052650 (= res!701775 (or (bvsgt lt!464889 i!1381) (bvsle i!1381 lt!464889)))))

(declare-fun b!1052651 () Bool)

(declare-fun e!597682 () Bool)

(assert (=> b!1052651 (= e!597685 e!597682)))

(declare-fun res!701776 () Bool)

(assert (=> b!1052651 (=> (not res!701776) (not e!597682))))

(assert (=> b!1052651 (= res!701776 (not (= lt!464889 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66343 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052651 (= lt!464889 (arrayScanForKey!0 lt!464888 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!701773 () Bool)

(assert (=> start!92542 (=> (not res!701773) (not e!597684))))

(assert (=> start!92542 (= res!701773 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32447 a!3488)) (bvslt (size!32447 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92542 e!597684))

(assert (=> start!92542 true))

(declare-fun array_inv!24691 (array!66343) Bool)

(assert (=> start!92542 (array_inv!24691 a!3488)))

(declare-fun b!1052652 () Bool)

(assert (=> b!1052652 (= e!597679 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052653 () Bool)

(assert (=> b!1052653 (= e!597682 (not e!597680))))

(declare-fun res!701779 () Bool)

(assert (=> b!1052653 (=> res!701779 e!597680)))

(assert (=> b!1052653 (= res!701779 (or (bvsgt lt!464889 i!1381) (bvsle i!1381 lt!464889)))))

(assert (=> b!1052653 e!597683))

(declare-fun res!701777 () Bool)

(assert (=> b!1052653 (=> (not res!701777) (not e!597683))))

(assert (=> b!1052653 (= res!701777 (= (select (store (arr!31911 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464889) k!2747))))

(declare-fun b!1052654 () Bool)

(declare-fun res!701774 () Bool)

(assert (=> b!1052654 (=> (not res!701774) (not e!597684))))

(assert (=> b!1052654 (= res!701774 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22220))))

(assert (= (and start!92542 res!701773) b!1052654))

(assert (= (and b!1052654 res!701774) b!1052647))

(assert (= (and b!1052647 res!701780) b!1052646))

(assert (= (and b!1052646 res!701772) b!1052648))

(assert (= (and b!1052648 res!701778) b!1052651))

(assert (= (and b!1052651 res!701776) b!1052653))

(assert (= (and b!1052653 res!701777) b!1052650))

(assert (= (and b!1052650 (not res!701775)) b!1052652))

(assert (= (and b!1052653 (not res!701779)) b!1052649))

(declare-fun m!973037 () Bool)

(assert (=> b!1052648 m!973037))

(declare-fun m!973039 () Bool)

(assert (=> b!1052648 m!973039))

(declare-fun m!973041 () Bool)

(assert (=> b!1052646 m!973041))

(declare-fun m!973043 () Bool)

(assert (=> b!1052654 m!973043))

(declare-fun m!973045 () Bool)

(assert (=> start!92542 m!973045))

(declare-fun m!973047 () Bool)

(assert (=> b!1052647 m!973047))

(declare-fun m!973049 () Bool)

(assert (=> b!1052652 m!973049))

(declare-fun m!973051 () Bool)

(assert (=> b!1052649 m!973051))

(declare-fun m!973053 () Bool)

(assert (=> b!1052649 m!973053))

(declare-fun m!973055 () Bool)

(assert (=> b!1052649 m!973055))

(declare-fun m!973057 () Bool)

(assert (=> b!1052649 m!973057))

(declare-fun m!973059 () Bool)

(assert (=> b!1052649 m!973059))

(declare-fun m!973061 () Bool)

(assert (=> b!1052649 m!973061))

(declare-fun m!973063 () Bool)

(assert (=> b!1052651 m!973063))

(assert (=> b!1052653 m!973039))

(declare-fun m!973065 () Bool)

(assert (=> b!1052653 m!973065))

(push 1)

(assert (not b!1052647))

(assert (not b!1052651))

(assert (not b!1052652))

