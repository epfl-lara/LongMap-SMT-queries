; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119832 () Bool)

(assert start!119832)

(declare-fun b!1394807 () Bool)

(declare-fun e!789871 () Bool)

(assert (=> b!1394807 (= e!789871 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10294 0))(
  ( (MissingZero!10294 (index!43547 (_ BitVec 32))) (Found!10294 (index!43548 (_ BitVec 32))) (Intermediate!10294 (undefined!11106 Bool) (index!43549 (_ BitVec 32)) (x!125373 (_ BitVec 32))) (Undefined!10294) (MissingVacant!10294 (index!43550 (_ BitVec 32))) )
))
(declare-fun lt!612474 () SeekEntryResult!10294)

(declare-datatypes ((array!95436 0))(
  ( (array!95437 (arr!46074 (Array (_ BitVec 32) (_ BitVec 64))) (size!46625 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95436)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95436 (_ BitVec 32)) SeekEntryResult!10294)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394807 (= lt!612474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46074 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46074 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95437 (store (arr!46074 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46625 a!2901)) mask!2840))))

(declare-fun b!1394808 () Bool)

(declare-fun res!933538 () Bool)

(declare-fun e!789870 () Bool)

(assert (=> b!1394808 (=> (not res!933538) (not e!789870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394808 (= res!933538 (validKeyInArray!0 (select (arr!46074 a!2901) i!1037)))))

(declare-fun b!1394809 () Bool)

(declare-fun res!933537 () Bool)

(assert (=> b!1394809 (=> (not res!933537) (not e!789870))))

(assert (=> b!1394809 (= res!933537 (and (= (size!46625 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46625 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46625 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!933531 () Bool)

(assert (=> start!119832 (=> (not res!933531) (not e!789870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119832 (= res!933531 (validMask!0 mask!2840))))

(assert (=> start!119832 e!789870))

(assert (=> start!119832 true))

(declare-fun array_inv!35355 (array!95436) Bool)

(assert (=> start!119832 (array_inv!35355 a!2901)))

(declare-fun b!1394810 () Bool)

(declare-fun res!933535 () Bool)

(assert (=> b!1394810 (=> (not res!933535) (not e!789870))))

(declare-datatypes ((List!32580 0))(
  ( (Nil!32577) (Cons!32576 (h!33817 (_ BitVec 64)) (t!47266 List!32580)) )
))
(declare-fun arrayNoDuplicates!0 (array!95436 (_ BitVec 32) List!32580) Bool)

(assert (=> b!1394810 (= res!933535 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32577))))

(declare-fun b!1394811 () Bool)

(declare-fun e!789872 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95436 (_ BitVec 32)) SeekEntryResult!10294)

(assert (=> b!1394811 (= e!789872 (= (seekEntryOrOpen!0 (select (arr!46074 a!2901) j!112) a!2901 mask!2840) (Found!10294 j!112)))))

(declare-fun b!1394812 () Bool)

(assert (=> b!1394812 (= e!789870 (not e!789871))))

(declare-fun res!933536 () Bool)

(assert (=> b!1394812 (=> res!933536 e!789871)))

(declare-fun lt!612476 () SeekEntryResult!10294)

(assert (=> b!1394812 (= res!933536 (or (not (is-Intermediate!10294 lt!612476)) (undefined!11106 lt!612476)))))

(assert (=> b!1394812 e!789872))

(declare-fun res!933532 () Bool)

(assert (=> b!1394812 (=> (not res!933532) (not e!789872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95436 (_ BitVec 32)) Bool)

(assert (=> b!1394812 (= res!933532 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46619 0))(
  ( (Unit!46620) )
))
(declare-fun lt!612475 () Unit!46619)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46619)

(assert (=> b!1394812 (= lt!612475 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394812 (= lt!612476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46074 a!2901) j!112) mask!2840) (select (arr!46074 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394813 () Bool)

(declare-fun res!933534 () Bool)

(assert (=> b!1394813 (=> (not res!933534) (not e!789870))))

(assert (=> b!1394813 (= res!933534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394814 () Bool)

(declare-fun res!933533 () Bool)

(assert (=> b!1394814 (=> (not res!933533) (not e!789870))))

(assert (=> b!1394814 (= res!933533 (validKeyInArray!0 (select (arr!46074 a!2901) j!112)))))

(assert (= (and start!119832 res!933531) b!1394809))

(assert (= (and b!1394809 res!933537) b!1394808))

(assert (= (and b!1394808 res!933538) b!1394814))

(assert (= (and b!1394814 res!933533) b!1394813))

(assert (= (and b!1394813 res!933534) b!1394810))

(assert (= (and b!1394810 res!933535) b!1394812))

(assert (= (and b!1394812 res!933532) b!1394811))

(assert (= (and b!1394812 (not res!933536)) b!1394807))

(declare-fun m!1281045 () Bool)

(assert (=> b!1394808 m!1281045))

(assert (=> b!1394808 m!1281045))

(declare-fun m!1281047 () Bool)

(assert (=> b!1394808 m!1281047))

(declare-fun m!1281049 () Bool)

(assert (=> start!119832 m!1281049))

(declare-fun m!1281051 () Bool)

(assert (=> start!119832 m!1281051))

(declare-fun m!1281053 () Bool)

(assert (=> b!1394811 m!1281053))

(assert (=> b!1394811 m!1281053))

(declare-fun m!1281055 () Bool)

(assert (=> b!1394811 m!1281055))

(assert (=> b!1394812 m!1281053))

(declare-fun m!1281057 () Bool)

(assert (=> b!1394812 m!1281057))

(assert (=> b!1394812 m!1281053))

(declare-fun m!1281059 () Bool)

(assert (=> b!1394812 m!1281059))

(assert (=> b!1394812 m!1281057))

(assert (=> b!1394812 m!1281053))

(declare-fun m!1281061 () Bool)

(assert (=> b!1394812 m!1281061))

(declare-fun m!1281063 () Bool)

(assert (=> b!1394812 m!1281063))

(declare-fun m!1281065 () Bool)

(assert (=> b!1394813 m!1281065))

(declare-fun m!1281067 () Bool)

(assert (=> b!1394807 m!1281067))

(declare-fun m!1281069 () Bool)

(assert (=> b!1394807 m!1281069))

(assert (=> b!1394807 m!1281069))

(declare-fun m!1281071 () Bool)

(assert (=> b!1394807 m!1281071))

(assert (=> b!1394807 m!1281071))

(assert (=> b!1394807 m!1281069))

(declare-fun m!1281073 () Bool)

(assert (=> b!1394807 m!1281073))

(declare-fun m!1281075 () Bool)

(assert (=> b!1394810 m!1281075))

(assert (=> b!1394814 m!1281053))

(assert (=> b!1394814 m!1281053))

(declare-fun m!1281077 () Bool)

(assert (=> b!1394814 m!1281077))

(push 1)

(assert (not b!1394813))

(assert (not b!1394811))

(assert (not b!1394812))

(assert (not b!1394810))

(assert (not b!1394807))

(assert (not start!119832))

(assert (not b!1394808))

(assert (not b!1394814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

