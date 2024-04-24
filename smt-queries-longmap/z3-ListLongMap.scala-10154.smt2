; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119876 () Bool)

(assert start!119876)

(declare-fun b!1395337 () Bool)

(declare-fun res!934065 () Bool)

(declare-fun e!790134 () Bool)

(assert (=> b!1395337 (=> res!934065 e!790134)))

(declare-datatypes ((array!95480 0))(
  ( (array!95481 (arr!46096 (Array (_ BitVec 32) (_ BitVec 64))) (size!46647 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95480)

(declare-fun lt!612680 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10316 0))(
  ( (MissingZero!10316 (index!43635 (_ BitVec 32))) (Found!10316 (index!43636 (_ BitVec 32))) (Intermediate!10316 (undefined!11128 Bool) (index!43637 (_ BitVec 32)) (x!125459 (_ BitVec 32))) (Undefined!10316) (MissingVacant!10316 (index!43638 (_ BitVec 32))) )
))
(declare-fun lt!612684 () SeekEntryResult!10316)

(assert (=> b!1395337 (= res!934065 (or (bvslt (x!125459 lt!612684) #b00000000000000000000000000000000) (bvsgt (x!125459 lt!612684) #b01111111111111111111111111111110) (bvslt lt!612680 #b00000000000000000000000000000000) (bvsge lt!612680 (size!46647 a!2901)) (bvslt (index!43637 lt!612684) #b00000000000000000000000000000000) (bvsge (index!43637 lt!612684) (size!46647 a!2901)) (not (= lt!612684 (Intermediate!10316 false (index!43637 lt!612684) (x!125459 lt!612684))))))))

(declare-fun b!1395338 () Bool)

(declare-fun res!934062 () Bool)

(declare-fun e!790136 () Bool)

(assert (=> b!1395338 (=> (not res!934062) (not e!790136))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1395338 (= res!934062 (and (= (size!46647 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46647 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46647 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395339 () Bool)

(declare-fun res!934067 () Bool)

(assert (=> b!1395339 (=> (not res!934067) (not e!790136))))

(declare-datatypes ((List!32602 0))(
  ( (Nil!32599) (Cons!32598 (h!33839 (_ BitVec 64)) (t!47288 List!32602)) )
))
(declare-fun arrayNoDuplicates!0 (array!95480 (_ BitVec 32) List!32602) Bool)

(assert (=> b!1395339 (= res!934067 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32599))))

(declare-fun b!1395340 () Bool)

(declare-fun e!790135 () Bool)

(assert (=> b!1395340 (= e!790136 (not e!790135))))

(declare-fun res!934061 () Bool)

(assert (=> b!1395340 (=> res!934061 e!790135)))

(get-info :version)

(assert (=> b!1395340 (= res!934061 (or (not ((_ is Intermediate!10316) lt!612684)) (undefined!11128 lt!612684)))))

(declare-fun lt!612686 () SeekEntryResult!10316)

(assert (=> b!1395340 (= lt!612686 (Found!10316 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95480 (_ BitVec 32)) SeekEntryResult!10316)

(assert (=> b!1395340 (= lt!612686 (seekEntryOrOpen!0 (select (arr!46096 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95480 (_ BitVec 32)) Bool)

(assert (=> b!1395340 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46663 0))(
  ( (Unit!46664) )
))
(declare-fun lt!612683 () Unit!46663)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46663)

(assert (=> b!1395340 (= lt!612683 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95480 (_ BitVec 32)) SeekEntryResult!10316)

(assert (=> b!1395340 (= lt!612684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612680 (select (arr!46096 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395340 (= lt!612680 (toIndex!0 (select (arr!46096 a!2901) j!112) mask!2840))))

(declare-fun b!1395341 () Bool)

(assert (=> b!1395341 (= e!790135 e!790134)))

(declare-fun res!934066 () Bool)

(assert (=> b!1395341 (=> res!934066 e!790134)))

(declare-fun lt!612682 () array!95480)

(declare-fun lt!612681 () (_ BitVec 64))

(assert (=> b!1395341 (= res!934066 (not (= lt!612684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612681 mask!2840) lt!612681 lt!612682 mask!2840))))))

(assert (=> b!1395341 (= lt!612681 (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1395341 (= lt!612682 (array!95481 (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46647 a!2901)))))

(declare-fun b!1395342 () Bool)

(declare-fun res!934068 () Bool)

(assert (=> b!1395342 (=> (not res!934068) (not e!790136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395342 (= res!934068 (validKeyInArray!0 (select (arr!46096 a!2901) i!1037)))))

(declare-fun res!934064 () Bool)

(assert (=> start!119876 (=> (not res!934064) (not e!790136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119876 (= res!934064 (validMask!0 mask!2840))))

(assert (=> start!119876 e!790136))

(assert (=> start!119876 true))

(declare-fun array_inv!35377 (array!95480) Bool)

(assert (=> start!119876 (array_inv!35377 a!2901)))

(declare-fun b!1395343 () Bool)

(assert (=> b!1395343 (= e!790134 true)))

(assert (=> b!1395343 (= lt!612686 (seekEntryOrOpen!0 lt!612681 lt!612682 mask!2840))))

(declare-fun lt!612685 () Unit!46663)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46663)

(assert (=> b!1395343 (= lt!612685 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612680 (x!125459 lt!612684) (index!43637 lt!612684) mask!2840))))

(declare-fun b!1395344 () Bool)

(declare-fun res!934069 () Bool)

(assert (=> b!1395344 (=> (not res!934069) (not e!790136))))

(assert (=> b!1395344 (= res!934069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395345 () Bool)

(declare-fun res!934063 () Bool)

(assert (=> b!1395345 (=> (not res!934063) (not e!790136))))

(assert (=> b!1395345 (= res!934063 (validKeyInArray!0 (select (arr!46096 a!2901) j!112)))))

(assert (= (and start!119876 res!934064) b!1395338))

(assert (= (and b!1395338 res!934062) b!1395342))

(assert (= (and b!1395342 res!934068) b!1395345))

(assert (= (and b!1395345 res!934063) b!1395344))

(assert (= (and b!1395344 res!934069) b!1395339))

(assert (= (and b!1395339 res!934067) b!1395340))

(assert (= (and b!1395340 (not res!934061)) b!1395341))

(assert (= (and b!1395341 (not res!934066)) b!1395337))

(assert (= (and b!1395337 (not res!934065)) b!1395343))

(declare-fun m!1281793 () Bool)

(assert (=> b!1395343 m!1281793))

(declare-fun m!1281795 () Bool)

(assert (=> b!1395343 m!1281795))

(declare-fun m!1281797 () Bool)

(assert (=> b!1395345 m!1281797))

(assert (=> b!1395345 m!1281797))

(declare-fun m!1281799 () Bool)

(assert (=> b!1395345 m!1281799))

(assert (=> b!1395340 m!1281797))

(declare-fun m!1281801 () Bool)

(assert (=> b!1395340 m!1281801))

(assert (=> b!1395340 m!1281797))

(assert (=> b!1395340 m!1281797))

(declare-fun m!1281803 () Bool)

(assert (=> b!1395340 m!1281803))

(declare-fun m!1281805 () Bool)

(assert (=> b!1395340 m!1281805))

(assert (=> b!1395340 m!1281797))

(declare-fun m!1281807 () Bool)

(assert (=> b!1395340 m!1281807))

(declare-fun m!1281809 () Bool)

(assert (=> b!1395340 m!1281809))

(declare-fun m!1281811 () Bool)

(assert (=> b!1395344 m!1281811))

(declare-fun m!1281813 () Bool)

(assert (=> b!1395339 m!1281813))

(declare-fun m!1281815 () Bool)

(assert (=> b!1395341 m!1281815))

(assert (=> b!1395341 m!1281815))

(declare-fun m!1281817 () Bool)

(assert (=> b!1395341 m!1281817))

(declare-fun m!1281819 () Bool)

(assert (=> b!1395341 m!1281819))

(declare-fun m!1281821 () Bool)

(assert (=> b!1395341 m!1281821))

(declare-fun m!1281823 () Bool)

(assert (=> start!119876 m!1281823))

(declare-fun m!1281825 () Bool)

(assert (=> start!119876 m!1281825))

(declare-fun m!1281827 () Bool)

(assert (=> b!1395342 m!1281827))

(assert (=> b!1395342 m!1281827))

(declare-fun m!1281829 () Bool)

(assert (=> b!1395342 m!1281829))

(check-sat (not b!1395341) (not b!1395345) (not b!1395344) (not start!119876) (not b!1395339) (not b!1395342) (not b!1395343) (not b!1395340))
(check-sat)
