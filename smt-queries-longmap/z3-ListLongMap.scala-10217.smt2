; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120542 () Bool)

(assert start!120542)

(declare-fun res!939823 () Bool)

(declare-fun e!793898 () Bool)

(assert (=> start!120542 (=> (not res!939823) (not e!793898))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120542 (= res!939823 (validMask!0 mask!2840))))

(assert (=> start!120542 e!793898))

(assert (=> start!120542 true))

(declare-datatypes ((array!95873 0))(
  ( (array!95874 (arr!46285 (Array (_ BitVec 32) (_ BitVec 64))) (size!46836 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95873)

(declare-fun array_inv!35566 (array!95873) Bool)

(assert (=> start!120542 (array_inv!35566 a!2901)))

(declare-fun e!793900 () Bool)

(declare-fun b!1401989 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10505 0))(
  ( (MissingZero!10505 (index!44397 (_ BitVec 32))) (Found!10505 (index!44398 (_ BitVec 32))) (Intermediate!10505 (undefined!11317 Bool) (index!44399 (_ BitVec 32)) (x!126191 (_ BitVec 32))) (Undefined!10505) (MissingVacant!10505 (index!44400 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95873 (_ BitVec 32)) SeekEntryResult!10505)

(assert (=> b!1401989 (= e!793900 (= (seekEntryOrOpen!0 (select (arr!46285 a!2901) j!112) a!2901 mask!2840) (Found!10505 j!112)))))

(declare-fun b!1401990 () Bool)

(declare-fun res!939826 () Bool)

(assert (=> b!1401990 (=> (not res!939826) (not e!793898))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401990 (= res!939826 (and (= (size!46836 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46836 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46836 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401991 () Bool)

(declare-fun e!793896 () Bool)

(declare-fun e!793901 () Bool)

(assert (=> b!1401991 (= e!793896 e!793901)))

(declare-fun res!939819 () Bool)

(assert (=> b!1401991 (=> res!939819 e!793901)))

(declare-fun lt!616906 () SeekEntryResult!10505)

(declare-fun lt!616903 () SeekEntryResult!10505)

(get-info :version)

(assert (=> b!1401991 (= res!939819 (or (= lt!616906 lt!616903) (not ((_ is Intermediate!10505) lt!616903))))))

(declare-fun lt!616904 () (_ BitVec 64))

(declare-fun lt!616902 () array!95873)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95873 (_ BitVec 32)) SeekEntryResult!10505)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401991 (= lt!616903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616904 mask!2840) lt!616904 lt!616902 mask!2840))))

(assert (=> b!1401991 (= lt!616904 (select (store (arr!46285 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401991 (= lt!616902 (array!95874 (store (arr!46285 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46836 a!2901)))))

(declare-fun b!1401992 () Bool)

(declare-fun res!939818 () Bool)

(assert (=> b!1401992 (=> (not res!939818) (not e!793898))))

(declare-datatypes ((List!32791 0))(
  ( (Nil!32788) (Cons!32787 (h!34043 (_ BitVec 64)) (t!47477 List!32791)) )
))
(declare-fun arrayNoDuplicates!0 (array!95873 (_ BitVec 32) List!32791) Bool)

(assert (=> b!1401992 (= res!939818 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32788))))

(declare-fun b!1401993 () Bool)

(declare-fun e!793899 () Bool)

(assert (=> b!1401993 (= e!793901 e!793899)))

(declare-fun res!939820 () Bool)

(assert (=> b!1401993 (=> res!939820 e!793899)))

(declare-fun lt!616900 () (_ BitVec 32))

(assert (=> b!1401993 (= res!939820 (or (bvslt (x!126191 lt!616906) #b00000000000000000000000000000000) (bvsgt (x!126191 lt!616906) #b01111111111111111111111111111110) (bvslt (x!126191 lt!616903) #b00000000000000000000000000000000) (bvsgt (x!126191 lt!616903) #b01111111111111111111111111111110) (bvslt lt!616900 #b00000000000000000000000000000000) (bvsge lt!616900 (size!46836 a!2901)) (bvslt (index!44399 lt!616906) #b00000000000000000000000000000000) (bvsge (index!44399 lt!616906) (size!46836 a!2901)) (bvslt (index!44399 lt!616903) #b00000000000000000000000000000000) (bvsge (index!44399 lt!616903) (size!46836 a!2901)) (not (= lt!616906 (Intermediate!10505 false (index!44399 lt!616906) (x!126191 lt!616906)))) (not (= lt!616903 (Intermediate!10505 false (index!44399 lt!616903) (x!126191 lt!616903))))))))

(declare-fun e!793897 () Bool)

(assert (=> b!1401993 e!793897))

(declare-fun res!939822 () Bool)

(assert (=> b!1401993 (=> (not res!939822) (not e!793897))))

(assert (=> b!1401993 (= res!939822 (and (not (undefined!11317 lt!616903)) (= (index!44399 lt!616903) i!1037) (bvslt (x!126191 lt!616903) (x!126191 lt!616906)) (= (select (store (arr!46285 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44399 lt!616903)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47041 0))(
  ( (Unit!47042) )
))
(declare-fun lt!616907 () Unit!47041)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47041)

(assert (=> b!1401993 (= lt!616907 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616900 (x!126191 lt!616906) (index!44399 lt!616906) (x!126191 lt!616903) (index!44399 lt!616903) (undefined!11317 lt!616903) mask!2840))))

(declare-fun b!1401994 () Bool)

(declare-fun res!939816 () Bool)

(assert (=> b!1401994 (=> (not res!939816) (not e!793898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95873 (_ BitVec 32)) Bool)

(assert (=> b!1401994 (= res!939816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401995 () Bool)

(assert (=> b!1401995 (= e!793899 true)))

(declare-fun lt!616905 () SeekEntryResult!10505)

(assert (=> b!1401995 (= lt!616905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616900 lt!616904 lt!616902 mask!2840))))

(declare-fun b!1401996 () Bool)

(assert (=> b!1401996 (= e!793898 (not e!793896))))

(declare-fun res!939821 () Bool)

(assert (=> b!1401996 (=> res!939821 e!793896)))

(assert (=> b!1401996 (= res!939821 (or (not ((_ is Intermediate!10505) lt!616906)) (undefined!11317 lt!616906)))))

(assert (=> b!1401996 e!793900))

(declare-fun res!939817 () Bool)

(assert (=> b!1401996 (=> (not res!939817) (not e!793900))))

(assert (=> b!1401996 (= res!939817 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616901 () Unit!47041)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47041)

(assert (=> b!1401996 (= lt!616901 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401996 (= lt!616906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616900 (select (arr!46285 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401996 (= lt!616900 (toIndex!0 (select (arr!46285 a!2901) j!112) mask!2840))))

(declare-fun b!1401997 () Bool)

(declare-fun res!939825 () Bool)

(assert (=> b!1401997 (=> (not res!939825) (not e!793898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401997 (= res!939825 (validKeyInArray!0 (select (arr!46285 a!2901) j!112)))))

(declare-fun b!1401998 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95873 (_ BitVec 32)) SeekEntryResult!10505)

(assert (=> b!1401998 (= e!793897 (= (seekEntryOrOpen!0 lt!616904 lt!616902 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126191 lt!616903) (index!44399 lt!616903) (index!44399 lt!616903) (select (arr!46285 a!2901) j!112) lt!616902 mask!2840)))))

(declare-fun b!1401999 () Bool)

(declare-fun res!939824 () Bool)

(assert (=> b!1401999 (=> (not res!939824) (not e!793898))))

(assert (=> b!1401999 (= res!939824 (validKeyInArray!0 (select (arr!46285 a!2901) i!1037)))))

(assert (= (and start!120542 res!939823) b!1401990))

(assert (= (and b!1401990 res!939826) b!1401999))

(assert (= (and b!1401999 res!939824) b!1401997))

(assert (= (and b!1401997 res!939825) b!1401994))

(assert (= (and b!1401994 res!939816) b!1401992))

(assert (= (and b!1401992 res!939818) b!1401996))

(assert (= (and b!1401996 res!939817) b!1401989))

(assert (= (and b!1401996 (not res!939821)) b!1401991))

(assert (= (and b!1401991 (not res!939819)) b!1401993))

(assert (= (and b!1401993 res!939822) b!1401998))

(assert (= (and b!1401993 (not res!939820)) b!1401995))

(declare-fun m!1289809 () Bool)

(assert (=> b!1401992 m!1289809))

(declare-fun m!1289811 () Bool)

(assert (=> b!1401994 m!1289811))

(declare-fun m!1289813 () Bool)

(assert (=> b!1401996 m!1289813))

(declare-fun m!1289815 () Bool)

(assert (=> b!1401996 m!1289815))

(assert (=> b!1401996 m!1289813))

(declare-fun m!1289817 () Bool)

(assert (=> b!1401996 m!1289817))

(assert (=> b!1401996 m!1289813))

(declare-fun m!1289819 () Bool)

(assert (=> b!1401996 m!1289819))

(declare-fun m!1289821 () Bool)

(assert (=> b!1401996 m!1289821))

(assert (=> b!1401997 m!1289813))

(assert (=> b!1401997 m!1289813))

(declare-fun m!1289823 () Bool)

(assert (=> b!1401997 m!1289823))

(declare-fun m!1289825 () Bool)

(assert (=> b!1401993 m!1289825))

(declare-fun m!1289827 () Bool)

(assert (=> b!1401993 m!1289827))

(declare-fun m!1289829 () Bool)

(assert (=> b!1401993 m!1289829))

(declare-fun m!1289831 () Bool)

(assert (=> b!1401999 m!1289831))

(assert (=> b!1401999 m!1289831))

(declare-fun m!1289833 () Bool)

(assert (=> b!1401999 m!1289833))

(declare-fun m!1289835 () Bool)

(assert (=> b!1401995 m!1289835))

(declare-fun m!1289837 () Bool)

(assert (=> b!1401998 m!1289837))

(assert (=> b!1401998 m!1289813))

(assert (=> b!1401998 m!1289813))

(declare-fun m!1289839 () Bool)

(assert (=> b!1401998 m!1289839))

(declare-fun m!1289841 () Bool)

(assert (=> start!120542 m!1289841))

(declare-fun m!1289843 () Bool)

(assert (=> start!120542 m!1289843))

(assert (=> b!1401989 m!1289813))

(assert (=> b!1401989 m!1289813))

(declare-fun m!1289845 () Bool)

(assert (=> b!1401989 m!1289845))

(declare-fun m!1289847 () Bool)

(assert (=> b!1401991 m!1289847))

(assert (=> b!1401991 m!1289847))

(declare-fun m!1289849 () Bool)

(assert (=> b!1401991 m!1289849))

(assert (=> b!1401991 m!1289825))

(declare-fun m!1289851 () Bool)

(assert (=> b!1401991 m!1289851))

(check-sat (not b!1401991) (not b!1401992) (not b!1401994) (not b!1401996) (not b!1401997) (not b!1401999) (not b!1401993) (not b!1401989) (not b!1401995) (not start!120542) (not b!1401998))
(check-sat)
