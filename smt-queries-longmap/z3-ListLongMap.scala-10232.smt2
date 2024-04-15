; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120440 () Bool)

(assert start!120440)

(declare-fun b!1402242 () Bool)

(declare-fun res!940807 () Bool)

(declare-fun e!794043 () Bool)

(assert (=> b!1402242 (=> (not res!940807) (not e!794043))))

(declare-datatypes ((array!95802 0))(
  ( (array!95803 (arr!46252 (Array (_ BitVec 32) (_ BitVec 64))) (size!46804 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95802)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95802 (_ BitVec 32)) Bool)

(assert (=> b!1402242 (= res!940807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402243 () Bool)

(declare-fun res!940813 () Bool)

(assert (=> b!1402243 (=> (not res!940813) (not e!794043))))

(declare-datatypes ((List!32849 0))(
  ( (Nil!32846) (Cons!32845 (h!34093 (_ BitVec 64)) (t!47535 List!32849)) )
))
(declare-fun arrayNoDuplicates!0 (array!95802 (_ BitVec 32) List!32849) Bool)

(assert (=> b!1402243 (= res!940813 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32846))))

(declare-fun b!1402244 () Bool)

(declare-fun e!794041 () Bool)

(declare-fun e!794045 () Bool)

(assert (=> b!1402244 (= e!794041 e!794045)))

(declare-fun res!940809 () Bool)

(assert (=> b!1402244 (=> res!940809 e!794045)))

(declare-datatypes ((SeekEntryResult!10595 0))(
  ( (MissingZero!10595 (index!44757 (_ BitVec 32))) (Found!10595 (index!44758 (_ BitVec 32))) (Intermediate!10595 (undefined!11407 Bool) (index!44759 (_ BitVec 32)) (x!126379 (_ BitVec 32))) (Undefined!10595) (MissingVacant!10595 (index!44760 (_ BitVec 32))) )
))
(declare-fun lt!617414 () SeekEntryResult!10595)

(declare-fun lt!617418 () (_ BitVec 32))

(declare-fun lt!617416 () SeekEntryResult!10595)

(assert (=> b!1402244 (= res!940809 (or (bvslt (x!126379 lt!617414) #b00000000000000000000000000000000) (bvsgt (x!126379 lt!617414) #b01111111111111111111111111111110) (bvslt (x!126379 lt!617416) #b00000000000000000000000000000000) (bvsgt (x!126379 lt!617416) #b01111111111111111111111111111110) (bvslt lt!617418 #b00000000000000000000000000000000) (bvsge lt!617418 (size!46804 a!2901)) (bvslt (index!44759 lt!617414) #b00000000000000000000000000000000) (bvsge (index!44759 lt!617414) (size!46804 a!2901)) (bvslt (index!44759 lt!617416) #b00000000000000000000000000000000) (bvsge (index!44759 lt!617416) (size!46804 a!2901)) (not (= lt!617414 (Intermediate!10595 false (index!44759 lt!617414) (x!126379 lt!617414)))) (not (= lt!617416 (Intermediate!10595 false (index!44759 lt!617416) (x!126379 lt!617416))))))))

(declare-fun lt!617419 () array!95802)

(declare-fun lt!617420 () SeekEntryResult!10595)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95802 (_ BitVec 32)) SeekEntryResult!10595)

(assert (=> b!1402244 (= lt!617420 (seekKeyOrZeroReturnVacant!0 (x!126379 lt!617416) (index!44759 lt!617416) (index!44759 lt!617416) (select (arr!46252 a!2901) j!112) lt!617419 mask!2840))))

(declare-fun lt!617422 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95802 (_ BitVec 32)) SeekEntryResult!10595)

(assert (=> b!1402244 (= lt!617420 (seekEntryOrOpen!0 lt!617422 lt!617419 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402244 (and (not (undefined!11407 lt!617416)) (= (index!44759 lt!617416) i!1037) (bvslt (x!126379 lt!617416) (x!126379 lt!617414)) (= (select (store (arr!46252 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44759 lt!617416)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47037 0))(
  ( (Unit!47038) )
))
(declare-fun lt!617417 () Unit!47037)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47037)

(assert (=> b!1402244 (= lt!617417 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617418 (x!126379 lt!617414) (index!44759 lt!617414) (x!126379 lt!617416) (index!44759 lt!617416) (undefined!11407 lt!617416) mask!2840))))

(declare-fun b!1402245 () Bool)

(declare-fun res!940812 () Bool)

(assert (=> b!1402245 (=> res!940812 e!794045)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95802 (_ BitVec 32)) SeekEntryResult!10595)

(assert (=> b!1402245 (= res!940812 (not (= lt!617416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617418 lt!617422 lt!617419 mask!2840))))))

(declare-fun b!1402246 () Bool)

(declare-fun e!794044 () Bool)

(assert (=> b!1402246 (= e!794044 e!794041)))

(declare-fun res!940811 () Bool)

(assert (=> b!1402246 (=> res!940811 e!794041)))

(get-info :version)

(assert (=> b!1402246 (= res!940811 (or (= lt!617414 lt!617416) (not ((_ is Intermediate!10595) lt!617416))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402246 (= lt!617416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617422 mask!2840) lt!617422 lt!617419 mask!2840))))

(assert (=> b!1402246 (= lt!617422 (select (store (arr!46252 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402246 (= lt!617419 (array!95803 (store (arr!46252 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46804 a!2901)))))

(declare-fun b!1402247 () Bool)

(assert (=> b!1402247 (= e!794045 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!617423 () SeekEntryResult!10595)

(assert (=> b!1402247 (= lt!617423 lt!617420)))

(declare-fun lt!617421 () Unit!47037)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47037)

(assert (=> b!1402247 (= lt!617421 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617418 (x!126379 lt!617414) (index!44759 lt!617414) (x!126379 lt!617416) (index!44759 lt!617416) mask!2840))))

(declare-fun res!940808 () Bool)

(assert (=> start!120440 (=> (not res!940808) (not e!794043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120440 (= res!940808 (validMask!0 mask!2840))))

(assert (=> start!120440 e!794043))

(assert (=> start!120440 true))

(declare-fun array_inv!35485 (array!95802) Bool)

(assert (=> start!120440 (array_inv!35485 a!2901)))

(declare-fun b!1402248 () Bool)

(declare-fun res!940804 () Bool)

(assert (=> b!1402248 (=> (not res!940804) (not e!794043))))

(assert (=> b!1402248 (= res!940804 (and (= (size!46804 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46804 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46804 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402249 () Bool)

(declare-fun res!940806 () Bool)

(assert (=> b!1402249 (=> (not res!940806) (not e!794043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402249 (= res!940806 (validKeyInArray!0 (select (arr!46252 a!2901) i!1037)))))

(declare-fun b!1402250 () Bool)

(declare-fun res!940810 () Bool)

(assert (=> b!1402250 (=> (not res!940810) (not e!794043))))

(assert (=> b!1402250 (= res!940810 (validKeyInArray!0 (select (arr!46252 a!2901) j!112)))))

(declare-fun b!1402251 () Bool)

(assert (=> b!1402251 (= e!794043 (not e!794044))))

(declare-fun res!940805 () Bool)

(assert (=> b!1402251 (=> res!940805 e!794044)))

(assert (=> b!1402251 (= res!940805 (or (not ((_ is Intermediate!10595) lt!617414)) (undefined!11407 lt!617414)))))

(assert (=> b!1402251 (= lt!617423 (Found!10595 j!112))))

(assert (=> b!1402251 (= lt!617423 (seekEntryOrOpen!0 (select (arr!46252 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402251 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617415 () Unit!47037)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47037)

(assert (=> b!1402251 (= lt!617415 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402251 (= lt!617414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617418 (select (arr!46252 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402251 (= lt!617418 (toIndex!0 (select (arr!46252 a!2901) j!112) mask!2840))))

(assert (= (and start!120440 res!940808) b!1402248))

(assert (= (and b!1402248 res!940804) b!1402249))

(assert (= (and b!1402249 res!940806) b!1402250))

(assert (= (and b!1402250 res!940810) b!1402242))

(assert (= (and b!1402242 res!940807) b!1402243))

(assert (= (and b!1402243 res!940813) b!1402251))

(assert (= (and b!1402251 (not res!940805)) b!1402246))

(assert (= (and b!1402246 (not res!940811)) b!1402244))

(assert (= (and b!1402244 (not res!940809)) b!1402245))

(assert (= (and b!1402245 (not res!940812)) b!1402247))

(declare-fun m!1289887 () Bool)

(assert (=> b!1402249 m!1289887))

(assert (=> b!1402249 m!1289887))

(declare-fun m!1289889 () Bool)

(assert (=> b!1402249 m!1289889))

(declare-fun m!1289891 () Bool)

(assert (=> b!1402247 m!1289891))

(declare-fun m!1289893 () Bool)

(assert (=> b!1402250 m!1289893))

(assert (=> b!1402250 m!1289893))

(declare-fun m!1289895 () Bool)

(assert (=> b!1402250 m!1289895))

(assert (=> b!1402251 m!1289893))

(declare-fun m!1289897 () Bool)

(assert (=> b!1402251 m!1289897))

(assert (=> b!1402251 m!1289893))

(declare-fun m!1289899 () Bool)

(assert (=> b!1402251 m!1289899))

(assert (=> b!1402251 m!1289893))

(declare-fun m!1289901 () Bool)

(assert (=> b!1402251 m!1289901))

(assert (=> b!1402251 m!1289893))

(declare-fun m!1289903 () Bool)

(assert (=> b!1402251 m!1289903))

(declare-fun m!1289905 () Bool)

(assert (=> b!1402251 m!1289905))

(declare-fun m!1289907 () Bool)

(assert (=> b!1402246 m!1289907))

(assert (=> b!1402246 m!1289907))

(declare-fun m!1289909 () Bool)

(assert (=> b!1402246 m!1289909))

(declare-fun m!1289911 () Bool)

(assert (=> b!1402246 m!1289911))

(declare-fun m!1289913 () Bool)

(assert (=> b!1402246 m!1289913))

(declare-fun m!1289915 () Bool)

(assert (=> b!1402243 m!1289915))

(declare-fun m!1289917 () Bool)

(assert (=> b!1402244 m!1289917))

(assert (=> b!1402244 m!1289893))

(declare-fun m!1289919 () Bool)

(assert (=> b!1402244 m!1289919))

(assert (=> b!1402244 m!1289893))

(declare-fun m!1289921 () Bool)

(assert (=> b!1402244 m!1289921))

(assert (=> b!1402244 m!1289911))

(declare-fun m!1289923 () Bool)

(assert (=> b!1402244 m!1289923))

(declare-fun m!1289925 () Bool)

(assert (=> b!1402245 m!1289925))

(declare-fun m!1289927 () Bool)

(assert (=> b!1402242 m!1289927))

(declare-fun m!1289929 () Bool)

(assert (=> start!120440 m!1289929))

(declare-fun m!1289931 () Bool)

(assert (=> start!120440 m!1289931))

(check-sat (not b!1402245) (not b!1402244) (not b!1402243) (not b!1402249) (not b!1402246) (not b!1402250) (not b!1402242) (not b!1402251) (not start!120440) (not b!1402247))
(check-sat)
