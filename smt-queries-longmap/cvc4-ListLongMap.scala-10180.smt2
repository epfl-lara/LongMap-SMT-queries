; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120010 () Bool)

(assert start!120010)

(declare-fun b!1397095 () Bool)

(declare-fun res!936010 () Bool)

(declare-fun e!790941 () Bool)

(assert (=> b!1397095 (=> (not res!936010) (not e!790941))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95539 0))(
  ( (array!95540 (arr!46123 (Array (_ BitVec 32) (_ BitVec 64))) (size!46673 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95539)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397095 (= res!936010 (and (= (size!46673 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46673 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46673 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397096 () Bool)

(declare-fun res!936014 () Bool)

(assert (=> b!1397096 (=> (not res!936014) (not e!790941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397096 (= res!936014 (validKeyInArray!0 (select (arr!46123 a!2901) j!112)))))

(declare-fun b!1397097 () Bool)

(declare-fun res!936016 () Bool)

(assert (=> b!1397097 (=> (not res!936016) (not e!790941))))

(declare-datatypes ((List!32642 0))(
  ( (Nil!32639) (Cons!32638 (h!33880 (_ BitVec 64)) (t!47336 List!32642)) )
))
(declare-fun arrayNoDuplicates!0 (array!95539 (_ BitVec 32) List!32642) Bool)

(assert (=> b!1397097 (= res!936016 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32639))))

(declare-fun b!1397098 () Bool)

(declare-fun res!936012 () Bool)

(assert (=> b!1397098 (=> (not res!936012) (not e!790941))))

(assert (=> b!1397098 (= res!936012 (validKeyInArray!0 (select (arr!46123 a!2901) i!1037)))))

(declare-fun b!1397099 () Bool)

(declare-fun e!790942 () Bool)

(assert (=> b!1397099 (= e!790941 (not e!790942))))

(declare-fun res!936015 () Bool)

(assert (=> b!1397099 (=> res!936015 e!790942)))

(declare-datatypes ((SeekEntryResult!10440 0))(
  ( (MissingZero!10440 (index!44131 (_ BitVec 32))) (Found!10440 (index!44132 (_ BitVec 32))) (Intermediate!10440 (undefined!11252 Bool) (index!44133 (_ BitVec 32)) (x!125790 (_ BitVec 32))) (Undefined!10440) (MissingVacant!10440 (index!44134 (_ BitVec 32))) )
))
(declare-fun lt!613941 () SeekEntryResult!10440)

(assert (=> b!1397099 (= res!936015 (or (not (is-Intermediate!10440 lt!613941)) (undefined!11252 lt!613941)))))

(declare-fun e!790940 () Bool)

(assert (=> b!1397099 e!790940))

(declare-fun res!936011 () Bool)

(assert (=> b!1397099 (=> (not res!936011) (not e!790940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95539 (_ BitVec 32)) Bool)

(assert (=> b!1397099 (= res!936011 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46884 0))(
  ( (Unit!46885) )
))
(declare-fun lt!613936 () Unit!46884)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46884)

(assert (=> b!1397099 (= lt!613936 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613937 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95539 (_ BitVec 32)) SeekEntryResult!10440)

(assert (=> b!1397099 (= lt!613941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613937 (select (arr!46123 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397099 (= lt!613937 (toIndex!0 (select (arr!46123 a!2901) j!112) mask!2840))))

(declare-fun b!1397100 () Bool)

(declare-fun res!936008 () Bool)

(assert (=> b!1397100 (=> (not res!936008) (not e!790941))))

(assert (=> b!1397100 (= res!936008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397101 () Bool)

(declare-fun e!790943 () Bool)

(assert (=> b!1397101 (= e!790943 true)))

(declare-fun lt!613940 () array!95539)

(declare-fun lt!613938 () (_ BitVec 64))

(declare-fun lt!613939 () SeekEntryResult!10440)

(assert (=> b!1397101 (= lt!613939 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613937 lt!613938 lt!613940 mask!2840))))

(declare-fun b!1397102 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95539 (_ BitVec 32)) SeekEntryResult!10440)

(assert (=> b!1397102 (= e!790940 (= (seekEntryOrOpen!0 (select (arr!46123 a!2901) j!112) a!2901 mask!2840) (Found!10440 j!112)))))

(declare-fun b!1397103 () Bool)

(assert (=> b!1397103 (= e!790942 e!790943)))

(declare-fun res!936013 () Bool)

(assert (=> b!1397103 (=> res!936013 e!790943)))

(declare-fun lt!613935 () SeekEntryResult!10440)

(assert (=> b!1397103 (= res!936013 (or (= lt!613941 lt!613935) (not (is-Intermediate!10440 lt!613935)) (bvslt (x!125790 lt!613941) #b00000000000000000000000000000000) (bvsgt (x!125790 lt!613941) #b01111111111111111111111111111110) (bvslt lt!613937 #b00000000000000000000000000000000) (bvsge lt!613937 (size!46673 a!2901)) (bvslt (index!44133 lt!613941) #b00000000000000000000000000000000) (bvsge (index!44133 lt!613941) (size!46673 a!2901)) (not (= lt!613941 (Intermediate!10440 false (index!44133 lt!613941) (x!125790 lt!613941)))) (not (= lt!613935 (Intermediate!10440 (undefined!11252 lt!613935) (index!44133 lt!613935) (x!125790 lt!613935))))))))

(assert (=> b!1397103 (= lt!613935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613938 mask!2840) lt!613938 lt!613940 mask!2840))))

(assert (=> b!1397103 (= lt!613938 (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397103 (= lt!613940 (array!95540 (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46673 a!2901)))))

(declare-fun res!936009 () Bool)

(assert (=> start!120010 (=> (not res!936009) (not e!790941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120010 (= res!936009 (validMask!0 mask!2840))))

(assert (=> start!120010 e!790941))

(assert (=> start!120010 true))

(declare-fun array_inv!35151 (array!95539) Bool)

(assert (=> start!120010 (array_inv!35151 a!2901)))

(assert (= (and start!120010 res!936009) b!1397095))

(assert (= (and b!1397095 res!936010) b!1397098))

(assert (= (and b!1397098 res!936012) b!1397096))

(assert (= (and b!1397096 res!936014) b!1397100))

(assert (= (and b!1397100 res!936008) b!1397097))

(assert (= (and b!1397097 res!936016) b!1397099))

(assert (= (and b!1397099 res!936011) b!1397102))

(assert (= (and b!1397099 (not res!936015)) b!1397103))

(assert (= (and b!1397103 (not res!936013)) b!1397101))

(declare-fun m!1283751 () Bool)

(assert (=> b!1397097 m!1283751))

(declare-fun m!1283753 () Bool)

(assert (=> start!120010 m!1283753))

(declare-fun m!1283755 () Bool)

(assert (=> start!120010 m!1283755))

(declare-fun m!1283757 () Bool)

(assert (=> b!1397101 m!1283757))

(declare-fun m!1283759 () Bool)

(assert (=> b!1397099 m!1283759))

(declare-fun m!1283761 () Bool)

(assert (=> b!1397099 m!1283761))

(assert (=> b!1397099 m!1283759))

(declare-fun m!1283763 () Bool)

(assert (=> b!1397099 m!1283763))

(assert (=> b!1397099 m!1283759))

(declare-fun m!1283765 () Bool)

(assert (=> b!1397099 m!1283765))

(declare-fun m!1283767 () Bool)

(assert (=> b!1397099 m!1283767))

(declare-fun m!1283769 () Bool)

(assert (=> b!1397103 m!1283769))

(assert (=> b!1397103 m!1283769))

(declare-fun m!1283771 () Bool)

(assert (=> b!1397103 m!1283771))

(declare-fun m!1283773 () Bool)

(assert (=> b!1397103 m!1283773))

(declare-fun m!1283775 () Bool)

(assert (=> b!1397103 m!1283775))

(assert (=> b!1397096 m!1283759))

(assert (=> b!1397096 m!1283759))

(declare-fun m!1283777 () Bool)

(assert (=> b!1397096 m!1283777))

(declare-fun m!1283779 () Bool)

(assert (=> b!1397100 m!1283779))

(declare-fun m!1283781 () Bool)

(assert (=> b!1397098 m!1283781))

(assert (=> b!1397098 m!1283781))

(declare-fun m!1283783 () Bool)

(assert (=> b!1397098 m!1283783))

(assert (=> b!1397102 m!1283759))

(assert (=> b!1397102 m!1283759))

(declare-fun m!1283785 () Bool)

(assert (=> b!1397102 m!1283785))

(push 1)

