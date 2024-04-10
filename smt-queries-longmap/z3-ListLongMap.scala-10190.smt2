; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120068 () Bool)

(assert start!120068)

(declare-fun b!1397878 () Bool)

(declare-fun res!936796 () Bool)

(declare-fun e!791377 () Bool)

(assert (=> b!1397878 (=> (not res!936796) (not e!791377))))

(declare-datatypes ((array!95597 0))(
  ( (array!95598 (arr!46152 (Array (_ BitVec 32) (_ BitVec 64))) (size!46702 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95597)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95597 (_ BitVec 32)) Bool)

(assert (=> b!1397878 (= res!936796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397879 () Bool)

(declare-fun res!936791 () Bool)

(assert (=> b!1397879 (=> (not res!936791) (not e!791377))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397879 (= res!936791 (validKeyInArray!0 (select (arr!46152 a!2901) j!112)))))

(declare-fun res!936797 () Bool)

(assert (=> start!120068 (=> (not res!936797) (not e!791377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120068 (= res!936797 (validMask!0 mask!2840))))

(assert (=> start!120068 e!791377))

(assert (=> start!120068 true))

(declare-fun array_inv!35180 (array!95597) Bool)

(assert (=> start!120068 (array_inv!35180 a!2901)))

(declare-fun b!1397880 () Bool)

(declare-fun e!791376 () Bool)

(declare-fun e!791374 () Bool)

(assert (=> b!1397880 (= e!791376 e!791374)))

(declare-fun res!936798 () Bool)

(assert (=> b!1397880 (=> res!936798 e!791374)))

(declare-datatypes ((SeekEntryResult!10469 0))(
  ( (MissingZero!10469 (index!44247 (_ BitVec 32))) (Found!10469 (index!44248 (_ BitVec 32))) (Intermediate!10469 (undefined!11281 Bool) (index!44249 (_ BitVec 32)) (x!125899 (_ BitVec 32))) (Undefined!10469) (MissingVacant!10469 (index!44250 (_ BitVec 32))) )
))
(declare-fun lt!614550 () SeekEntryResult!10469)

(declare-fun lt!614545 () SeekEntryResult!10469)

(declare-fun lt!614547 () (_ BitVec 32))

(get-info :version)

(assert (=> b!1397880 (= res!936798 (or (= lt!614545 lt!614550) (not ((_ is Intermediate!10469) lt!614550)) (bvslt (x!125899 lt!614545) #b00000000000000000000000000000000) (bvsgt (x!125899 lt!614545) #b01111111111111111111111111111110) (bvslt lt!614547 #b00000000000000000000000000000000) (bvsge lt!614547 (size!46702 a!2901)) (bvslt (index!44249 lt!614545) #b00000000000000000000000000000000) (bvsge (index!44249 lt!614545) (size!46702 a!2901)) (not (= lt!614545 (Intermediate!10469 false (index!44249 lt!614545) (x!125899 lt!614545)))) (not (= lt!614550 (Intermediate!10469 (undefined!11281 lt!614550) (index!44249 lt!614550) (x!125899 lt!614550))))))))

(declare-fun lt!614546 () (_ BitVec 64))

(declare-fun lt!614548 () array!95597)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95597 (_ BitVec 32)) SeekEntryResult!10469)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397880 (= lt!614550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614546 mask!2840) lt!614546 lt!614548 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397880 (= lt!614546 (select (store (arr!46152 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397880 (= lt!614548 (array!95598 (store (arr!46152 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46702 a!2901)))))

(declare-fun b!1397881 () Bool)

(declare-fun res!936794 () Bool)

(assert (=> b!1397881 (=> (not res!936794) (not e!791377))))

(assert (=> b!1397881 (= res!936794 (validKeyInArray!0 (select (arr!46152 a!2901) i!1037)))))

(declare-fun b!1397882 () Bool)

(assert (=> b!1397882 (= e!791377 (not e!791376))))

(declare-fun res!936792 () Bool)

(assert (=> b!1397882 (=> res!936792 e!791376)))

(assert (=> b!1397882 (= res!936792 (or (not ((_ is Intermediate!10469) lt!614545)) (undefined!11281 lt!614545)))))

(declare-fun e!791378 () Bool)

(assert (=> b!1397882 e!791378))

(declare-fun res!936795 () Bool)

(assert (=> b!1397882 (=> (not res!936795) (not e!791378))))

(assert (=> b!1397882 (= res!936795 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46942 0))(
  ( (Unit!46943) )
))
(declare-fun lt!614544 () Unit!46942)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46942)

(assert (=> b!1397882 (= lt!614544 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397882 (= lt!614545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614547 (select (arr!46152 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397882 (= lt!614547 (toIndex!0 (select (arr!46152 a!2901) j!112) mask!2840))))

(declare-fun b!1397883 () Bool)

(declare-fun res!936793 () Bool)

(assert (=> b!1397883 (=> (not res!936793) (not e!791377))))

(declare-datatypes ((List!32671 0))(
  ( (Nil!32668) (Cons!32667 (h!33909 (_ BitVec 64)) (t!47365 List!32671)) )
))
(declare-fun arrayNoDuplicates!0 (array!95597 (_ BitVec 32) List!32671) Bool)

(assert (=> b!1397883 (= res!936793 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32668))))

(declare-fun b!1397884 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95597 (_ BitVec 32)) SeekEntryResult!10469)

(assert (=> b!1397884 (= e!791378 (= (seekEntryOrOpen!0 (select (arr!46152 a!2901) j!112) a!2901 mask!2840) (Found!10469 j!112)))))

(declare-fun b!1397885 () Bool)

(assert (=> b!1397885 (= e!791374 true)))

(declare-fun lt!614549 () SeekEntryResult!10469)

(assert (=> b!1397885 (= lt!614549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614547 lt!614546 lt!614548 mask!2840))))

(declare-fun b!1397886 () Bool)

(declare-fun res!936799 () Bool)

(assert (=> b!1397886 (=> (not res!936799) (not e!791377))))

(assert (=> b!1397886 (= res!936799 (and (= (size!46702 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46702 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46702 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120068 res!936797) b!1397886))

(assert (= (and b!1397886 res!936799) b!1397881))

(assert (= (and b!1397881 res!936794) b!1397879))

(assert (= (and b!1397879 res!936791) b!1397878))

(assert (= (and b!1397878 res!936796) b!1397883))

(assert (= (and b!1397883 res!936793) b!1397882))

(assert (= (and b!1397882 res!936795) b!1397884))

(assert (= (and b!1397882 (not res!936792)) b!1397880))

(assert (= (and b!1397880 (not res!936798)) b!1397885))

(declare-fun m!1284795 () Bool)

(assert (=> b!1397885 m!1284795))

(declare-fun m!1284797 () Bool)

(assert (=> b!1397882 m!1284797))

(declare-fun m!1284799 () Bool)

(assert (=> b!1397882 m!1284799))

(assert (=> b!1397882 m!1284797))

(declare-fun m!1284801 () Bool)

(assert (=> b!1397882 m!1284801))

(assert (=> b!1397882 m!1284797))

(declare-fun m!1284803 () Bool)

(assert (=> b!1397882 m!1284803))

(declare-fun m!1284805 () Bool)

(assert (=> b!1397882 m!1284805))

(declare-fun m!1284807 () Bool)

(assert (=> b!1397878 m!1284807))

(assert (=> b!1397884 m!1284797))

(assert (=> b!1397884 m!1284797))

(declare-fun m!1284809 () Bool)

(assert (=> b!1397884 m!1284809))

(assert (=> b!1397879 m!1284797))

(assert (=> b!1397879 m!1284797))

(declare-fun m!1284811 () Bool)

(assert (=> b!1397879 m!1284811))

(declare-fun m!1284813 () Bool)

(assert (=> b!1397883 m!1284813))

(declare-fun m!1284815 () Bool)

(assert (=> b!1397881 m!1284815))

(assert (=> b!1397881 m!1284815))

(declare-fun m!1284817 () Bool)

(assert (=> b!1397881 m!1284817))

(declare-fun m!1284819 () Bool)

(assert (=> b!1397880 m!1284819))

(assert (=> b!1397880 m!1284819))

(declare-fun m!1284821 () Bool)

(assert (=> b!1397880 m!1284821))

(declare-fun m!1284823 () Bool)

(assert (=> b!1397880 m!1284823))

(declare-fun m!1284825 () Bool)

(assert (=> b!1397880 m!1284825))

(declare-fun m!1284827 () Bool)

(assert (=> start!120068 m!1284827))

(declare-fun m!1284829 () Bool)

(assert (=> start!120068 m!1284829))

(check-sat (not b!1397879) (not start!120068) (not b!1397882) (not b!1397883) (not b!1397881) (not b!1397880) (not b!1397885) (not b!1397884) (not b!1397878))
(check-sat)
