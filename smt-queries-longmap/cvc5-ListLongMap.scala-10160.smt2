; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119724 () Bool)

(assert start!119724)

(declare-fun b!1394683 () Bool)

(declare-fun res!934098 () Bool)

(declare-fun e!789613 () Bool)

(assert (=> b!1394683 (=> res!934098 e!789613)))

(declare-datatypes ((array!95406 0))(
  ( (array!95407 (arr!46061 (Array (_ BitVec 32) (_ BitVec 64))) (size!46611 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95406)

(declare-datatypes ((SeekEntryResult!10378 0))(
  ( (MissingZero!10378 (index!43883 (_ BitVec 32))) (Found!10378 (index!43884 (_ BitVec 32))) (Intermediate!10378 (undefined!11190 Bool) (index!43885 (_ BitVec 32)) (x!125550 (_ BitVec 32))) (Undefined!10378) (MissingVacant!10378 (index!43886 (_ BitVec 32))) )
))
(declare-fun lt!612661 () SeekEntryResult!10378)

(declare-fun lt!612665 () (_ BitVec 32))

(assert (=> b!1394683 (= res!934098 (or (bvslt (x!125550 lt!612661) #b00000000000000000000000000000000) (bvsgt (x!125550 lt!612661) #b01111111111111111111111111111110) (bvslt lt!612665 #b00000000000000000000000000000000) (bvsge lt!612665 (size!46611 a!2901)) (bvslt (index!43885 lt!612661) #b00000000000000000000000000000000) (bvsge (index!43885 lt!612661) (size!46611 a!2901)) (not (= lt!612661 (Intermediate!10378 false (index!43885 lt!612661) (x!125550 lt!612661))))))))

(declare-fun b!1394684 () Bool)

(assert (=> b!1394684 (= e!789613 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!612663 () (_ BitVec 64))

(declare-fun lt!612666 () SeekEntryResult!10378)

(declare-fun lt!612664 () array!95406)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95406 (_ BitVec 32)) SeekEntryResult!10378)

(assert (=> b!1394684 (= lt!612666 (seekEntryOrOpen!0 lt!612663 lt!612664 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((Unit!46760 0))(
  ( (Unit!46761) )
))
(declare-fun lt!612662 () Unit!46760)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95406 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46760)

(assert (=> b!1394684 (= lt!612662 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612665 (x!125550 lt!612661) (index!43885 lt!612661) mask!2840))))

(declare-fun b!1394686 () Bool)

(declare-fun res!934092 () Bool)

(declare-fun e!789614 () Bool)

(assert (=> b!1394686 (=> (not res!934092) (not e!789614))))

(declare-datatypes ((List!32580 0))(
  ( (Nil!32577) (Cons!32576 (h!33809 (_ BitVec 64)) (t!47274 List!32580)) )
))
(declare-fun arrayNoDuplicates!0 (array!95406 (_ BitVec 32) List!32580) Bool)

(assert (=> b!1394686 (= res!934092 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32577))))

(declare-fun b!1394687 () Bool)

(declare-fun e!789612 () Bool)

(assert (=> b!1394687 (= e!789612 e!789613)))

(declare-fun res!934095 () Bool)

(assert (=> b!1394687 (=> res!934095 e!789613)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95406 (_ BitVec 32)) SeekEntryResult!10378)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394687 (= res!934095 (not (= lt!612661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612663 mask!2840) lt!612663 lt!612664 mask!2840))))))

(assert (=> b!1394687 (= lt!612663 (select (store (arr!46061 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394687 (= lt!612664 (array!95407 (store (arr!46061 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46611 a!2901)))))

(declare-fun b!1394688 () Bool)

(declare-fun res!934096 () Bool)

(assert (=> b!1394688 (=> (not res!934096) (not e!789614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394688 (= res!934096 (validKeyInArray!0 (select (arr!46061 a!2901) i!1037)))))

(declare-fun b!1394689 () Bool)

(assert (=> b!1394689 (= e!789614 (not e!789612))))

(declare-fun res!934094 () Bool)

(assert (=> b!1394689 (=> res!934094 e!789612)))

(assert (=> b!1394689 (= res!934094 (or (not (is-Intermediate!10378 lt!612661)) (undefined!11190 lt!612661)))))

(assert (=> b!1394689 (= lt!612666 (Found!10378 j!112))))

(assert (=> b!1394689 (= lt!612666 (seekEntryOrOpen!0 (select (arr!46061 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95406 (_ BitVec 32)) Bool)

(assert (=> b!1394689 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612660 () Unit!46760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95406 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46760)

(assert (=> b!1394689 (= lt!612660 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394689 (= lt!612661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612665 (select (arr!46061 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394689 (= lt!612665 (toIndex!0 (select (arr!46061 a!2901) j!112) mask!2840))))

(declare-fun b!1394690 () Bool)

(declare-fun res!934093 () Bool)

(assert (=> b!1394690 (=> (not res!934093) (not e!789614))))

(assert (=> b!1394690 (= res!934093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394691 () Bool)

(declare-fun res!934097 () Bool)

(assert (=> b!1394691 (=> (not res!934097) (not e!789614))))

(assert (=> b!1394691 (= res!934097 (validKeyInArray!0 (select (arr!46061 a!2901) j!112)))))

(declare-fun b!1394685 () Bool)

(declare-fun res!934091 () Bool)

(assert (=> b!1394685 (=> (not res!934091) (not e!789614))))

(assert (=> b!1394685 (= res!934091 (and (= (size!46611 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46611 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46611 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!934099 () Bool)

(assert (=> start!119724 (=> (not res!934099) (not e!789614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119724 (= res!934099 (validMask!0 mask!2840))))

(assert (=> start!119724 e!789614))

(assert (=> start!119724 true))

(declare-fun array_inv!35089 (array!95406) Bool)

(assert (=> start!119724 (array_inv!35089 a!2901)))

(assert (= (and start!119724 res!934099) b!1394685))

(assert (= (and b!1394685 res!934091) b!1394688))

(assert (= (and b!1394688 res!934096) b!1394691))

(assert (= (and b!1394691 res!934097) b!1394690))

(assert (= (and b!1394690 res!934093) b!1394686))

(assert (= (and b!1394686 res!934092) b!1394689))

(assert (= (and b!1394689 (not res!934094)) b!1394687))

(assert (= (and b!1394687 (not res!934095)) b!1394683))

(assert (= (and b!1394683 (not res!934098)) b!1394684))

(declare-fun m!1281105 () Bool)

(assert (=> b!1394690 m!1281105))

(declare-fun m!1281107 () Bool)

(assert (=> start!119724 m!1281107))

(declare-fun m!1281109 () Bool)

(assert (=> start!119724 m!1281109))

(declare-fun m!1281111 () Bool)

(assert (=> b!1394687 m!1281111))

(assert (=> b!1394687 m!1281111))

(declare-fun m!1281113 () Bool)

(assert (=> b!1394687 m!1281113))

(declare-fun m!1281115 () Bool)

(assert (=> b!1394687 m!1281115))

(declare-fun m!1281117 () Bool)

(assert (=> b!1394687 m!1281117))

(declare-fun m!1281119 () Bool)

(assert (=> b!1394691 m!1281119))

(assert (=> b!1394691 m!1281119))

(declare-fun m!1281121 () Bool)

(assert (=> b!1394691 m!1281121))

(assert (=> b!1394689 m!1281119))

(declare-fun m!1281123 () Bool)

(assert (=> b!1394689 m!1281123))

(assert (=> b!1394689 m!1281119))

(assert (=> b!1394689 m!1281119))

(declare-fun m!1281125 () Bool)

(assert (=> b!1394689 m!1281125))

(declare-fun m!1281127 () Bool)

(assert (=> b!1394689 m!1281127))

(declare-fun m!1281129 () Bool)

(assert (=> b!1394689 m!1281129))

(assert (=> b!1394689 m!1281119))

(declare-fun m!1281131 () Bool)

(assert (=> b!1394689 m!1281131))

(declare-fun m!1281133 () Bool)

(assert (=> b!1394688 m!1281133))

(assert (=> b!1394688 m!1281133))

(declare-fun m!1281135 () Bool)

(assert (=> b!1394688 m!1281135))

(declare-fun m!1281137 () Bool)

(assert (=> b!1394684 m!1281137))

(declare-fun m!1281139 () Bool)

(assert (=> b!1394684 m!1281139))

(declare-fun m!1281141 () Bool)

(assert (=> b!1394686 m!1281141))

(push 1)

