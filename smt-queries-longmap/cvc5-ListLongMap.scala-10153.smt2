; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119874 () Bool)

(assert start!119874)

(declare-fun res!934040 () Bool)

(declare-fun e!790123 () Bool)

(assert (=> start!119874 (=> (not res!934040) (not e!790123))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119874 (= res!934040 (validMask!0 mask!2840))))

(assert (=> start!119874 e!790123))

(assert (=> start!119874 true))

(declare-datatypes ((array!95478 0))(
  ( (array!95479 (arr!46095 (Array (_ BitVec 32) (_ BitVec 64))) (size!46646 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95478)

(declare-fun array_inv!35376 (array!95478) Bool)

(assert (=> start!119874 (array_inv!35376 a!2901)))

(declare-fun b!1395311 () Bool)

(declare-fun res!934041 () Bool)

(assert (=> b!1395311 (=> (not res!934041) (not e!790123))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395311 (= res!934041 (validKeyInArray!0 (select (arr!46095 a!2901) j!112)))))

(declare-fun b!1395312 () Bool)

(declare-fun e!790122 () Bool)

(assert (=> b!1395312 (= e!790123 (not e!790122))))

(declare-fun res!934042 () Bool)

(assert (=> b!1395312 (=> res!934042 e!790122)))

(declare-datatypes ((SeekEntryResult!10315 0))(
  ( (MissingZero!10315 (index!43631 (_ BitVec 32))) (Found!10315 (index!43632 (_ BitVec 32))) (Intermediate!10315 (undefined!11127 Bool) (index!43633 (_ BitVec 32)) (x!125450 (_ BitVec 32))) (Undefined!10315) (MissingVacant!10315 (index!43634 (_ BitVec 32))) )
))
(declare-fun lt!612663 () SeekEntryResult!10315)

(assert (=> b!1395312 (= res!934042 (or (not (is-Intermediate!10315 lt!612663)) (undefined!11127 lt!612663)))))

(declare-fun e!790121 () Bool)

(assert (=> b!1395312 e!790121))

(declare-fun res!934036 () Bool)

(assert (=> b!1395312 (=> (not res!934036) (not e!790121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95478 (_ BitVec 32)) Bool)

(assert (=> b!1395312 (= res!934036 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46661 0))(
  ( (Unit!46662) )
))
(declare-fun lt!612665 () Unit!46661)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46661)

(assert (=> b!1395312 (= lt!612665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95478 (_ BitVec 32)) SeekEntryResult!10315)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395312 (= lt!612663 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46095 a!2901) j!112) mask!2840) (select (arr!46095 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395313 () Bool)

(assert (=> b!1395313 (= e!790122 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612664 () SeekEntryResult!10315)

(assert (=> b!1395313 (= lt!612664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95479 (store (arr!46095 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46646 a!2901)) mask!2840))))

(declare-fun b!1395314 () Bool)

(declare-fun res!934039 () Bool)

(assert (=> b!1395314 (=> (not res!934039) (not e!790123))))

(assert (=> b!1395314 (= res!934039 (and (= (size!46646 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46646 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46646 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395315 () Bool)

(declare-fun res!934035 () Bool)

(assert (=> b!1395315 (=> (not res!934035) (not e!790123))))

(assert (=> b!1395315 (= res!934035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395316 () Bool)

(declare-fun res!934037 () Bool)

(assert (=> b!1395316 (=> (not res!934037) (not e!790123))))

(assert (=> b!1395316 (= res!934037 (validKeyInArray!0 (select (arr!46095 a!2901) i!1037)))))

(declare-fun b!1395317 () Bool)

(declare-fun res!934038 () Bool)

(assert (=> b!1395317 (=> (not res!934038) (not e!790123))))

(declare-datatypes ((List!32601 0))(
  ( (Nil!32598) (Cons!32597 (h!33838 (_ BitVec 64)) (t!47287 List!32601)) )
))
(declare-fun arrayNoDuplicates!0 (array!95478 (_ BitVec 32) List!32601) Bool)

(assert (=> b!1395317 (= res!934038 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32598))))

(declare-fun b!1395318 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95478 (_ BitVec 32)) SeekEntryResult!10315)

(assert (=> b!1395318 (= e!790121 (= (seekEntryOrOpen!0 (select (arr!46095 a!2901) j!112) a!2901 mask!2840) (Found!10315 j!112)))))

(assert (= (and start!119874 res!934040) b!1395314))

(assert (= (and b!1395314 res!934039) b!1395316))

(assert (= (and b!1395316 res!934037) b!1395311))

(assert (= (and b!1395311 res!934041) b!1395315))

(assert (= (and b!1395315 res!934035) b!1395317))

(assert (= (and b!1395317 res!934038) b!1395312))

(assert (= (and b!1395312 res!934036) b!1395318))

(assert (= (and b!1395312 (not res!934042)) b!1395313))

(declare-fun m!1281759 () Bool)

(assert (=> b!1395317 m!1281759))

(declare-fun m!1281761 () Bool)

(assert (=> start!119874 m!1281761))

(declare-fun m!1281763 () Bool)

(assert (=> start!119874 m!1281763))

(declare-fun m!1281765 () Bool)

(assert (=> b!1395312 m!1281765))

(declare-fun m!1281767 () Bool)

(assert (=> b!1395312 m!1281767))

(assert (=> b!1395312 m!1281765))

(declare-fun m!1281769 () Bool)

(assert (=> b!1395312 m!1281769))

(assert (=> b!1395312 m!1281767))

(assert (=> b!1395312 m!1281765))

(declare-fun m!1281771 () Bool)

(assert (=> b!1395312 m!1281771))

(declare-fun m!1281773 () Bool)

(assert (=> b!1395312 m!1281773))

(declare-fun m!1281775 () Bool)

(assert (=> b!1395315 m!1281775))

(assert (=> b!1395311 m!1281765))

(assert (=> b!1395311 m!1281765))

(declare-fun m!1281777 () Bool)

(assert (=> b!1395311 m!1281777))

(declare-fun m!1281779 () Bool)

(assert (=> b!1395313 m!1281779))

(declare-fun m!1281781 () Bool)

(assert (=> b!1395313 m!1281781))

(assert (=> b!1395313 m!1281781))

(declare-fun m!1281783 () Bool)

(assert (=> b!1395313 m!1281783))

(assert (=> b!1395313 m!1281783))

(assert (=> b!1395313 m!1281781))

(declare-fun m!1281785 () Bool)

(assert (=> b!1395313 m!1281785))

(assert (=> b!1395318 m!1281765))

(assert (=> b!1395318 m!1281765))

(declare-fun m!1281787 () Bool)

(assert (=> b!1395318 m!1281787))

(declare-fun m!1281789 () Bool)

(assert (=> b!1395316 m!1281789))

(assert (=> b!1395316 m!1281789))

(declare-fun m!1281791 () Bool)

(assert (=> b!1395316 m!1281791))

(push 1)

(assert (not b!1395312))

(assert (not b!1395313))

(assert (not b!1395316))

(assert (not b!1395317))

(assert (not b!1395315))

(assert (not start!119874))

(assert (not b!1395318))

(assert (not b!1395311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

