; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120422 () Bool)

(assert start!120422)

(declare-fun b!1401971 () Bool)

(declare-fun res!940484 () Bool)

(declare-fun e!793876 () Bool)

(assert (=> b!1401971 (=> (not res!940484) (not e!793876))))

(declare-datatypes ((array!95831 0))(
  ( (array!95832 (arr!46266 (Array (_ BitVec 32) (_ BitVec 64))) (size!46816 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95831)

(declare-datatypes ((List!32785 0))(
  ( (Nil!32782) (Cons!32781 (h!34029 (_ BitVec 64)) (t!47479 List!32785)) )
))
(declare-fun arrayNoDuplicates!0 (array!95831 (_ BitVec 32) List!32785) Bool)

(assert (=> b!1401971 (= res!940484 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32782))))

(declare-fun b!1401972 () Bool)

(declare-fun e!793875 () Bool)

(assert (=> b!1401972 (= e!793876 (not e!793875))))

(declare-fun res!940488 () Bool)

(assert (=> b!1401972 (=> res!940488 e!793875)))

(declare-datatypes ((SeekEntryResult!10583 0))(
  ( (MissingZero!10583 (index!44709 (_ BitVec 32))) (Found!10583 (index!44710 (_ BitVec 32))) (Intermediate!10583 (undefined!11395 Bool) (index!44711 (_ BitVec 32)) (x!126338 (_ BitVec 32))) (Undefined!10583) (MissingVacant!10583 (index!44712 (_ BitVec 32))) )
))
(declare-fun lt!617320 () SeekEntryResult!10583)

(get-info :version)

(assert (=> b!1401972 (= res!940488 (or (not ((_ is Intermediate!10583) lt!617320)) (undefined!11395 lt!617320)))))

(declare-fun e!793874 () Bool)

(assert (=> b!1401972 e!793874))

(declare-fun res!940482 () Bool)

(assert (=> b!1401972 (=> (not res!940482) (not e!793874))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95831 (_ BitVec 32)) Bool)

(assert (=> b!1401972 (= res!940482 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47170 0))(
  ( (Unit!47171) )
))
(declare-fun lt!617318 () Unit!47170)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47170)

(assert (=> b!1401972 (= lt!617318 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617323 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95831 (_ BitVec 32)) SeekEntryResult!10583)

(assert (=> b!1401972 (= lt!617320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617323 (select (arr!46266 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401972 (= lt!617323 (toIndex!0 (select (arr!46266 a!2901) j!112) mask!2840))))

(declare-fun b!1401973 () Bool)

(declare-fun res!940485 () Bool)

(assert (=> b!1401973 (=> (not res!940485) (not e!793876))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401973 (= res!940485 (validKeyInArray!0 (select (arr!46266 a!2901) i!1037)))))

(declare-fun b!1401974 () Bool)

(declare-fun res!940491 () Bool)

(assert (=> b!1401974 (=> (not res!940491) (not e!793876))))

(assert (=> b!1401974 (= res!940491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401975 () Bool)

(declare-fun res!940486 () Bool)

(assert (=> b!1401975 (=> (not res!940486) (not e!793876))))

(assert (=> b!1401975 (= res!940486 (and (= (size!46816 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46816 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46816 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!940487 () Bool)

(assert (=> start!120422 (=> (not res!940487) (not e!793876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120422 (= res!940487 (validMask!0 mask!2840))))

(assert (=> start!120422 e!793876))

(assert (=> start!120422 true))

(declare-fun array_inv!35294 (array!95831) Bool)

(assert (=> start!120422 (array_inv!35294 a!2901)))

(declare-fun b!1401976 () Bool)

(declare-fun lt!617322 () (_ BitVec 64))

(declare-fun lt!617324 () array!95831)

(declare-fun e!793872 () Bool)

(declare-fun lt!617325 () SeekEntryResult!10583)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95831 (_ BitVec 32)) SeekEntryResult!10583)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95831 (_ BitVec 32)) SeekEntryResult!10583)

(assert (=> b!1401976 (= e!793872 (= (seekEntryOrOpen!0 lt!617322 lt!617324 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126338 lt!617325) (index!44711 lt!617325) (index!44711 lt!617325) (select (arr!46266 a!2901) j!112) lt!617324 mask!2840)))))

(declare-fun b!1401977 () Bool)

(declare-fun e!793877 () Bool)

(assert (=> b!1401977 (= e!793875 e!793877)))

(declare-fun res!940490 () Bool)

(assert (=> b!1401977 (=> res!940490 e!793877)))

(assert (=> b!1401977 (= res!940490 (or (= lt!617320 lt!617325) (not ((_ is Intermediate!10583) lt!617325))))))

(assert (=> b!1401977 (= lt!617325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617322 mask!2840) lt!617322 lt!617324 mask!2840))))

(assert (=> b!1401977 (= lt!617322 (select (store (arr!46266 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401977 (= lt!617324 (array!95832 (store (arr!46266 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46816 a!2901)))))

(declare-fun b!1401978 () Bool)

(declare-fun e!793873 () Bool)

(assert (=> b!1401978 (= e!793873 true)))

(declare-fun lt!617321 () SeekEntryResult!10583)

(assert (=> b!1401978 (= lt!617321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617323 lt!617322 lt!617324 mask!2840))))

(declare-fun b!1401979 () Bool)

(declare-fun res!940489 () Bool)

(assert (=> b!1401979 (=> (not res!940489) (not e!793876))))

(assert (=> b!1401979 (= res!940489 (validKeyInArray!0 (select (arr!46266 a!2901) j!112)))))

(declare-fun b!1401980 () Bool)

(assert (=> b!1401980 (= e!793877 e!793873)))

(declare-fun res!940492 () Bool)

(assert (=> b!1401980 (=> res!940492 e!793873)))

(assert (=> b!1401980 (= res!940492 (or (bvslt (x!126338 lt!617320) #b00000000000000000000000000000000) (bvsgt (x!126338 lt!617320) #b01111111111111111111111111111110) (bvslt (x!126338 lt!617325) #b00000000000000000000000000000000) (bvsgt (x!126338 lt!617325) #b01111111111111111111111111111110) (bvslt lt!617323 #b00000000000000000000000000000000) (bvsge lt!617323 (size!46816 a!2901)) (bvslt (index!44711 lt!617320) #b00000000000000000000000000000000) (bvsge (index!44711 lt!617320) (size!46816 a!2901)) (bvslt (index!44711 lt!617325) #b00000000000000000000000000000000) (bvsge (index!44711 lt!617325) (size!46816 a!2901)) (not (= lt!617320 (Intermediate!10583 false (index!44711 lt!617320) (x!126338 lt!617320)))) (not (= lt!617325 (Intermediate!10583 false (index!44711 lt!617325) (x!126338 lt!617325))))))))

(assert (=> b!1401980 e!793872))

(declare-fun res!940483 () Bool)

(assert (=> b!1401980 (=> (not res!940483) (not e!793872))))

(assert (=> b!1401980 (= res!940483 (and (not (undefined!11395 lt!617325)) (= (index!44711 lt!617325) i!1037) (bvslt (x!126338 lt!617325) (x!126338 lt!617320)) (= (select (store (arr!46266 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44711 lt!617325)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617319 () Unit!47170)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47170)

(assert (=> b!1401980 (= lt!617319 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617323 (x!126338 lt!617320) (index!44711 lt!617320) (x!126338 lt!617325) (index!44711 lt!617325) (undefined!11395 lt!617325) mask!2840))))

(declare-fun b!1401981 () Bool)

(assert (=> b!1401981 (= e!793874 (= (seekEntryOrOpen!0 (select (arr!46266 a!2901) j!112) a!2901 mask!2840) (Found!10583 j!112)))))

(assert (= (and start!120422 res!940487) b!1401975))

(assert (= (and b!1401975 res!940486) b!1401973))

(assert (= (and b!1401973 res!940485) b!1401979))

(assert (= (and b!1401979 res!940489) b!1401974))

(assert (= (and b!1401974 res!940491) b!1401971))

(assert (= (and b!1401971 res!940484) b!1401972))

(assert (= (and b!1401972 res!940482) b!1401981))

(assert (= (and b!1401972 (not res!940488)) b!1401977))

(assert (= (and b!1401977 (not res!940490)) b!1401980))

(assert (= (and b!1401980 res!940483) b!1401976))

(assert (= (and b!1401980 (not res!940492)) b!1401978))

(declare-fun m!1289933 () Bool)

(assert (=> start!120422 m!1289933))

(declare-fun m!1289935 () Bool)

(assert (=> start!120422 m!1289935))

(declare-fun m!1289937 () Bool)

(assert (=> b!1401977 m!1289937))

(assert (=> b!1401977 m!1289937))

(declare-fun m!1289939 () Bool)

(assert (=> b!1401977 m!1289939))

(declare-fun m!1289941 () Bool)

(assert (=> b!1401977 m!1289941))

(declare-fun m!1289943 () Bool)

(assert (=> b!1401977 m!1289943))

(assert (=> b!1401980 m!1289941))

(declare-fun m!1289945 () Bool)

(assert (=> b!1401980 m!1289945))

(declare-fun m!1289947 () Bool)

(assert (=> b!1401980 m!1289947))

(declare-fun m!1289949 () Bool)

(assert (=> b!1401978 m!1289949))

(declare-fun m!1289951 () Bool)

(assert (=> b!1401974 m!1289951))

(declare-fun m!1289953 () Bool)

(assert (=> b!1401976 m!1289953))

(declare-fun m!1289955 () Bool)

(assert (=> b!1401976 m!1289955))

(assert (=> b!1401976 m!1289955))

(declare-fun m!1289957 () Bool)

(assert (=> b!1401976 m!1289957))

(assert (=> b!1401979 m!1289955))

(assert (=> b!1401979 m!1289955))

(declare-fun m!1289959 () Bool)

(assert (=> b!1401979 m!1289959))

(assert (=> b!1401972 m!1289955))

(declare-fun m!1289961 () Bool)

(assert (=> b!1401972 m!1289961))

(assert (=> b!1401972 m!1289955))

(declare-fun m!1289963 () Bool)

(assert (=> b!1401972 m!1289963))

(assert (=> b!1401972 m!1289955))

(declare-fun m!1289965 () Bool)

(assert (=> b!1401972 m!1289965))

(declare-fun m!1289967 () Bool)

(assert (=> b!1401972 m!1289967))

(declare-fun m!1289969 () Bool)

(assert (=> b!1401973 m!1289969))

(assert (=> b!1401973 m!1289969))

(declare-fun m!1289971 () Bool)

(assert (=> b!1401973 m!1289971))

(declare-fun m!1289973 () Bool)

(assert (=> b!1401971 m!1289973))

(assert (=> b!1401981 m!1289955))

(assert (=> b!1401981 m!1289955))

(declare-fun m!1289975 () Bool)

(assert (=> b!1401981 m!1289975))

(check-sat (not b!1401977) (not b!1401974) (not b!1401971) (not b!1401976) (not b!1401972) (not b!1401980) (not b!1401981) (not start!120422) (not b!1401979) (not b!1401978) (not b!1401973))
(check-sat)
