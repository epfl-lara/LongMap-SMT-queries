; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120302 () Bool)

(assert start!120302)

(declare-fun b!1399991 () Bool)

(declare-fun res!938511 () Bool)

(declare-fun e!792614 () Bool)

(assert (=> b!1399991 (=> (not res!938511) (not e!792614))))

(declare-datatypes ((array!95711 0))(
  ( (array!95712 (arr!46206 (Array (_ BitVec 32) (_ BitVec 64))) (size!46756 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95711)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399991 (= res!938511 (validKeyInArray!0 (select (arr!46206 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!792615 () Bool)

(declare-fun b!1399992 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10523 0))(
  ( (MissingZero!10523 (index!44469 (_ BitVec 32))) (Found!10523 (index!44470 (_ BitVec 32))) (Intermediate!10523 (undefined!11335 Bool) (index!44471 (_ BitVec 32)) (x!126118 (_ BitVec 32))) (Undefined!10523) (MissingVacant!10523 (index!44472 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95711 (_ BitVec 32)) SeekEntryResult!10523)

(assert (=> b!1399992 (= e!792615 (= (seekEntryOrOpen!0 (select (arr!46206 a!2901) j!112) a!2901 mask!2840) (Found!10523 j!112)))))

(declare-fun b!1399993 () Bool)

(declare-fun res!938505 () Bool)

(assert (=> b!1399993 (=> (not res!938505) (not e!792614))))

(declare-datatypes ((List!32725 0))(
  ( (Nil!32722) (Cons!32721 (h!33969 (_ BitVec 64)) (t!47419 List!32725)) )
))
(declare-fun arrayNoDuplicates!0 (array!95711 (_ BitVec 32) List!32725) Bool)

(assert (=> b!1399993 (= res!938505 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32722))))

(declare-fun b!1399994 () Bool)

(declare-fun res!938508 () Bool)

(assert (=> b!1399994 (=> (not res!938508) (not e!792614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95711 (_ BitVec 32)) Bool)

(assert (=> b!1399994 (= res!938508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399995 () Bool)

(declare-fun e!792617 () Bool)

(declare-fun e!792611 () Bool)

(assert (=> b!1399995 (= e!792617 e!792611)))

(declare-fun res!938502 () Bool)

(assert (=> b!1399995 (=> res!938502 e!792611)))

(declare-fun lt!615884 () SeekEntryResult!10523)

(declare-fun lt!615881 () SeekEntryResult!10523)

(get-info :version)

(assert (=> b!1399995 (= res!938502 (or (= lt!615884 lt!615881) (not ((_ is Intermediate!10523) lt!615881))))))

(declare-fun lt!615882 () (_ BitVec 64))

(declare-fun lt!615879 () array!95711)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95711 (_ BitVec 32)) SeekEntryResult!10523)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399995 (= lt!615881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615882 mask!2840) lt!615882 lt!615879 mask!2840))))

(assert (=> b!1399995 (= lt!615882 (select (store (arr!46206 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399995 (= lt!615879 (array!95712 (store (arr!46206 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46756 a!2901)))))

(declare-fun b!1399996 () Bool)

(declare-fun res!938506 () Bool)

(assert (=> b!1399996 (=> (not res!938506) (not e!792614))))

(assert (=> b!1399996 (= res!938506 (and (= (size!46756 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46756 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46756 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399997 () Bool)

(declare-fun e!792612 () Bool)

(assert (=> b!1399997 (= e!792611 e!792612)))

(declare-fun res!938503 () Bool)

(assert (=> b!1399997 (=> res!938503 e!792612)))

(declare-fun lt!615885 () (_ BitVec 32))

(assert (=> b!1399997 (= res!938503 (or (bvslt (x!126118 lt!615884) #b00000000000000000000000000000000) (bvsgt (x!126118 lt!615884) #b01111111111111111111111111111110) (bvslt (x!126118 lt!615881) #b00000000000000000000000000000000) (bvsgt (x!126118 lt!615881) #b01111111111111111111111111111110) (bvslt lt!615885 #b00000000000000000000000000000000) (bvsge lt!615885 (size!46756 a!2901)) (bvslt (index!44471 lt!615884) #b00000000000000000000000000000000) (bvsge (index!44471 lt!615884) (size!46756 a!2901)) (bvslt (index!44471 lt!615881) #b00000000000000000000000000000000) (bvsge (index!44471 lt!615881) (size!46756 a!2901)) (not (= lt!615884 (Intermediate!10523 false (index!44471 lt!615884) (x!126118 lt!615884)))) (not (= lt!615881 (Intermediate!10523 false (index!44471 lt!615881) (x!126118 lt!615881))))))))

(declare-fun e!792613 () Bool)

(assert (=> b!1399997 e!792613))

(declare-fun res!938504 () Bool)

(assert (=> b!1399997 (=> (not res!938504) (not e!792613))))

(assert (=> b!1399997 (= res!938504 (and (not (undefined!11335 lt!615881)) (= (index!44471 lt!615881) i!1037) (bvslt (x!126118 lt!615881) (x!126118 lt!615884)) (= (select (store (arr!46206 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44471 lt!615881)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47050 0))(
  ( (Unit!47051) )
))
(declare-fun lt!615878 () Unit!47050)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47050)

(assert (=> b!1399997 (= lt!615878 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615885 (x!126118 lt!615884) (index!44471 lt!615884) (x!126118 lt!615881) (index!44471 lt!615881) (undefined!11335 lt!615881) mask!2840))))

(declare-fun b!1399998 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95711 (_ BitVec 32)) SeekEntryResult!10523)

(assert (=> b!1399998 (= e!792613 (= (seekEntryOrOpen!0 lt!615882 lt!615879 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126118 lt!615881) (index!44471 lt!615881) (index!44471 lt!615881) (select (arr!46206 a!2901) j!112) lt!615879 mask!2840)))))

(declare-fun b!1399999 () Bool)

(assert (=> b!1399999 (= e!792612 true)))

(declare-fun lt!615880 () SeekEntryResult!10523)

(assert (=> b!1399999 (= lt!615880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615885 lt!615882 lt!615879 mask!2840))))

(declare-fun res!938510 () Bool)

(assert (=> start!120302 (=> (not res!938510) (not e!792614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120302 (= res!938510 (validMask!0 mask!2840))))

(assert (=> start!120302 e!792614))

(assert (=> start!120302 true))

(declare-fun array_inv!35234 (array!95711) Bool)

(assert (=> start!120302 (array_inv!35234 a!2901)))

(declare-fun b!1400000 () Bool)

(declare-fun res!938507 () Bool)

(assert (=> b!1400000 (=> (not res!938507) (not e!792614))))

(assert (=> b!1400000 (= res!938507 (validKeyInArray!0 (select (arr!46206 a!2901) j!112)))))

(declare-fun b!1400001 () Bool)

(assert (=> b!1400001 (= e!792614 (not e!792617))))

(declare-fun res!938512 () Bool)

(assert (=> b!1400001 (=> res!938512 e!792617)))

(assert (=> b!1400001 (= res!938512 (or (not ((_ is Intermediate!10523) lt!615884)) (undefined!11335 lt!615884)))))

(assert (=> b!1400001 e!792615))

(declare-fun res!938509 () Bool)

(assert (=> b!1400001 (=> (not res!938509) (not e!792615))))

(assert (=> b!1400001 (= res!938509 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615883 () Unit!47050)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47050)

(assert (=> b!1400001 (= lt!615883 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400001 (= lt!615884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615885 (select (arr!46206 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1400001 (= lt!615885 (toIndex!0 (select (arr!46206 a!2901) j!112) mask!2840))))

(assert (= (and start!120302 res!938510) b!1399996))

(assert (= (and b!1399996 res!938506) b!1399991))

(assert (= (and b!1399991 res!938511) b!1400000))

(assert (= (and b!1400000 res!938507) b!1399994))

(assert (= (and b!1399994 res!938508) b!1399993))

(assert (= (and b!1399993 res!938505) b!1400001))

(assert (= (and b!1400001 res!938509) b!1399992))

(assert (= (and b!1400001 (not res!938512)) b!1399995))

(assert (= (and b!1399995 (not res!938502)) b!1399997))

(assert (= (and b!1399997 res!938504) b!1399998))

(assert (= (and b!1399997 (not res!938503)) b!1399999))

(declare-fun m!1287293 () Bool)

(assert (=> start!120302 m!1287293))

(declare-fun m!1287295 () Bool)

(assert (=> start!120302 m!1287295))

(declare-fun m!1287297 () Bool)

(assert (=> b!1399998 m!1287297))

(declare-fun m!1287299 () Bool)

(assert (=> b!1399998 m!1287299))

(assert (=> b!1399998 m!1287299))

(declare-fun m!1287301 () Bool)

(assert (=> b!1399998 m!1287301))

(declare-fun m!1287303 () Bool)

(assert (=> b!1399995 m!1287303))

(assert (=> b!1399995 m!1287303))

(declare-fun m!1287305 () Bool)

(assert (=> b!1399995 m!1287305))

(declare-fun m!1287307 () Bool)

(assert (=> b!1399995 m!1287307))

(declare-fun m!1287309 () Bool)

(assert (=> b!1399995 m!1287309))

(assert (=> b!1400001 m!1287299))

(declare-fun m!1287311 () Bool)

(assert (=> b!1400001 m!1287311))

(assert (=> b!1400001 m!1287299))

(declare-fun m!1287313 () Bool)

(assert (=> b!1400001 m!1287313))

(declare-fun m!1287315 () Bool)

(assert (=> b!1400001 m!1287315))

(assert (=> b!1400001 m!1287299))

(declare-fun m!1287317 () Bool)

(assert (=> b!1400001 m!1287317))

(declare-fun m!1287319 () Bool)

(assert (=> b!1399993 m!1287319))

(declare-fun m!1287321 () Bool)

(assert (=> b!1399999 m!1287321))

(declare-fun m!1287323 () Bool)

(assert (=> b!1399994 m!1287323))

(declare-fun m!1287325 () Bool)

(assert (=> b!1399991 m!1287325))

(assert (=> b!1399991 m!1287325))

(declare-fun m!1287327 () Bool)

(assert (=> b!1399991 m!1287327))

(assert (=> b!1400000 m!1287299))

(assert (=> b!1400000 m!1287299))

(declare-fun m!1287329 () Bool)

(assert (=> b!1400000 m!1287329))

(assert (=> b!1399997 m!1287307))

(declare-fun m!1287331 () Bool)

(assert (=> b!1399997 m!1287331))

(declare-fun m!1287333 () Bool)

(assert (=> b!1399997 m!1287333))

(assert (=> b!1399992 m!1287299))

(assert (=> b!1399992 m!1287299))

(declare-fun m!1287335 () Bool)

(assert (=> b!1399992 m!1287335))

(check-sat (not b!1399992) (not b!1399991) (not b!1400000) (not b!1399993) (not b!1399995) (not start!120302) (not b!1399998) (not b!1400001) (not b!1399997) (not b!1399994) (not b!1399999))
(check-sat)
