; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119868 () Bool)

(assert start!119868)

(declare-fun b!1395239 () Bool)

(declare-fun res!933967 () Bool)

(declare-fun e!790088 () Bool)

(assert (=> b!1395239 (=> (not res!933967) (not e!790088))))

(declare-datatypes ((array!95472 0))(
  ( (array!95473 (arr!46092 (Array (_ BitVec 32) (_ BitVec 64))) (size!46643 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95472)

(declare-datatypes ((List!32598 0))(
  ( (Nil!32595) (Cons!32594 (h!33835 (_ BitVec 64)) (t!47284 List!32598)) )
))
(declare-fun arrayNoDuplicates!0 (array!95472 (_ BitVec 32) List!32598) Bool)

(assert (=> b!1395239 (= res!933967 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32595))))

(declare-fun b!1395240 () Bool)

(declare-fun res!933966 () Bool)

(assert (=> b!1395240 (=> (not res!933966) (not e!790088))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1395240 (= res!933966 (and (= (size!46643 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46643 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46643 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395241 () Bool)

(declare-fun res!933963 () Bool)

(assert (=> b!1395241 (=> (not res!933963) (not e!790088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395241 (= res!933963 (validKeyInArray!0 (select (arr!46092 a!2901) i!1037)))))

(declare-fun b!1395242 () Bool)

(declare-fun e!790086 () Bool)

(assert (=> b!1395242 (= e!790088 (not e!790086))))

(declare-fun res!933964 () Bool)

(assert (=> b!1395242 (=> res!933964 e!790086)))

(declare-datatypes ((SeekEntryResult!10312 0))(
  ( (MissingZero!10312 (index!43619 (_ BitVec 32))) (Found!10312 (index!43620 (_ BitVec 32))) (Intermediate!10312 (undefined!11124 Bool) (index!43621 (_ BitVec 32)) (x!125439 (_ BitVec 32))) (Undefined!10312) (MissingVacant!10312 (index!43622 (_ BitVec 32))) )
))
(declare-fun lt!612637 () SeekEntryResult!10312)

(assert (=> b!1395242 (= res!933964 (or (not (is-Intermediate!10312 lt!612637)) (undefined!11124 lt!612637)))))

(declare-fun e!790085 () Bool)

(assert (=> b!1395242 e!790085))

(declare-fun res!933968 () Bool)

(assert (=> b!1395242 (=> (not res!933968) (not e!790085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95472 (_ BitVec 32)) Bool)

(assert (=> b!1395242 (= res!933968 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46655 0))(
  ( (Unit!46656) )
))
(declare-fun lt!612638 () Unit!46655)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46655)

(assert (=> b!1395242 (= lt!612638 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95472 (_ BitVec 32)) SeekEntryResult!10312)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395242 (= lt!612637 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46092 a!2901) j!112) mask!2840) (select (arr!46092 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395243 () Bool)

(assert (=> b!1395243 (= e!790086 true)))

(declare-fun lt!612636 () SeekEntryResult!10312)

(assert (=> b!1395243 (= lt!612636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46092 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46092 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95473 (store (arr!46092 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46643 a!2901)) mask!2840))))

(declare-fun b!1395244 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95472 (_ BitVec 32)) SeekEntryResult!10312)

(assert (=> b!1395244 (= e!790085 (= (seekEntryOrOpen!0 (select (arr!46092 a!2901) j!112) a!2901 mask!2840) (Found!10312 j!112)))))

(declare-fun b!1395245 () Bool)

(declare-fun res!933970 () Bool)

(assert (=> b!1395245 (=> (not res!933970) (not e!790088))))

(assert (=> b!1395245 (= res!933970 (validKeyInArray!0 (select (arr!46092 a!2901) j!112)))))

(declare-fun b!1395246 () Bool)

(declare-fun res!933969 () Bool)

(assert (=> b!1395246 (=> (not res!933969) (not e!790088))))

(assert (=> b!1395246 (= res!933969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!933965 () Bool)

(assert (=> start!119868 (=> (not res!933965) (not e!790088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119868 (= res!933965 (validMask!0 mask!2840))))

(assert (=> start!119868 e!790088))

(assert (=> start!119868 true))

(declare-fun array_inv!35373 (array!95472) Bool)

(assert (=> start!119868 (array_inv!35373 a!2901)))

(assert (= (and start!119868 res!933965) b!1395240))

(assert (= (and b!1395240 res!933966) b!1395241))

(assert (= (and b!1395241 res!933963) b!1395245))

(assert (= (and b!1395245 res!933970) b!1395246))

(assert (= (and b!1395246 res!933969) b!1395239))

(assert (= (and b!1395239 res!933967) b!1395242))

(assert (= (and b!1395242 res!933968) b!1395244))

(assert (= (and b!1395242 (not res!933964)) b!1395243))

(declare-fun m!1281657 () Bool)

(assert (=> b!1395242 m!1281657))

(declare-fun m!1281659 () Bool)

(assert (=> b!1395242 m!1281659))

(assert (=> b!1395242 m!1281657))

(declare-fun m!1281661 () Bool)

(assert (=> b!1395242 m!1281661))

(assert (=> b!1395242 m!1281659))

(assert (=> b!1395242 m!1281657))

(declare-fun m!1281663 () Bool)

(assert (=> b!1395242 m!1281663))

(declare-fun m!1281665 () Bool)

(assert (=> b!1395242 m!1281665))

(declare-fun m!1281667 () Bool)

(assert (=> b!1395239 m!1281667))

(assert (=> b!1395244 m!1281657))

(assert (=> b!1395244 m!1281657))

(declare-fun m!1281669 () Bool)

(assert (=> b!1395244 m!1281669))

(declare-fun m!1281671 () Bool)

(assert (=> b!1395243 m!1281671))

(declare-fun m!1281673 () Bool)

(assert (=> b!1395243 m!1281673))

(assert (=> b!1395243 m!1281673))

(declare-fun m!1281675 () Bool)

(assert (=> b!1395243 m!1281675))

(assert (=> b!1395243 m!1281675))

(assert (=> b!1395243 m!1281673))

(declare-fun m!1281677 () Bool)

(assert (=> b!1395243 m!1281677))

(declare-fun m!1281679 () Bool)

(assert (=> start!119868 m!1281679))

(declare-fun m!1281681 () Bool)

(assert (=> start!119868 m!1281681))

(declare-fun m!1281683 () Bool)

(assert (=> b!1395241 m!1281683))

(assert (=> b!1395241 m!1281683))

(declare-fun m!1281685 () Bool)

(assert (=> b!1395241 m!1281685))

(assert (=> b!1395245 m!1281657))

(assert (=> b!1395245 m!1281657))

(declare-fun m!1281687 () Bool)

(assert (=> b!1395245 m!1281687))

(declare-fun m!1281689 () Bool)

(assert (=> b!1395246 m!1281689))

(push 1)

(assert (not b!1395241))

(assert (not b!1395246))

(assert (not b!1395239))

(assert (not b!1395245))

(assert (not start!119868))

(assert (not b!1395242))

(assert (not b!1395244))

(assert (not b!1395243))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

