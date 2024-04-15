; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120446 () Bool)

(assert start!120446)

(declare-fun b!1402332 () Bool)

(declare-fun e!794086 () Bool)

(declare-fun e!794089 () Bool)

(assert (=> b!1402332 (= e!794086 e!794089)))

(declare-fun res!940900 () Bool)

(assert (=> b!1402332 (=> res!940900 e!794089)))

(declare-datatypes ((SeekEntryResult!10598 0))(
  ( (MissingZero!10598 (index!44769 (_ BitVec 32))) (Found!10598 (index!44770 (_ BitVec 32))) (Intermediate!10598 (undefined!11410 Bool) (index!44771 (_ BitVec 32)) (x!126390 (_ BitVec 32))) (Undefined!10598) (MissingVacant!10598 (index!44772 (_ BitVec 32))) )
))
(declare-fun lt!617507 () SeekEntryResult!10598)

(declare-fun lt!617510 () SeekEntryResult!10598)

(get-info :version)

(assert (=> b!1402332 (= res!940900 (or (= lt!617507 lt!617510) (not ((_ is Intermediate!10598) lt!617510))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95808 0))(
  ( (array!95809 (arr!46255 (Array (_ BitVec 32) (_ BitVec 64))) (size!46807 (_ BitVec 32))) )
))
(declare-fun lt!617508 () array!95808)

(declare-fun lt!617504 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95808 (_ BitVec 32)) SeekEntryResult!10598)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402332 (= lt!617510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617504 mask!2840) lt!617504 lt!617508 mask!2840))))

(declare-fun a!2901 () array!95808)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402332 (= lt!617504 (select (store (arr!46255 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402332 (= lt!617508 (array!95809 (store (arr!46255 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46807 a!2901)))))

(declare-fun b!1402333 () Bool)

(declare-fun e!794090 () Bool)

(assert (=> b!1402333 (= e!794090 true)))

(declare-fun lt!617506 () SeekEntryResult!10598)

(declare-fun lt!617513 () SeekEntryResult!10598)

(assert (=> b!1402333 (= lt!617506 lt!617513)))

(declare-datatypes ((Unit!47043 0))(
  ( (Unit!47044) )
))
(declare-fun lt!617511 () Unit!47043)

(declare-fun lt!617509 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47043)

(assert (=> b!1402333 (= lt!617511 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617509 (x!126390 lt!617507) (index!44771 lt!617507) (x!126390 lt!617510) (index!44771 lt!617510) mask!2840))))

(declare-fun res!940897 () Bool)

(declare-fun e!794087 () Bool)

(assert (=> start!120446 (=> (not res!940897) (not e!794087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120446 (= res!940897 (validMask!0 mask!2840))))

(assert (=> start!120446 e!794087))

(assert (=> start!120446 true))

(declare-fun array_inv!35488 (array!95808) Bool)

(assert (=> start!120446 (array_inv!35488 a!2901)))

(declare-fun b!1402334 () Bool)

(assert (=> b!1402334 (= e!794089 e!794090)))

(declare-fun res!940896 () Bool)

(assert (=> b!1402334 (=> res!940896 e!794090)))

(assert (=> b!1402334 (= res!940896 (or (bvslt (x!126390 lt!617507) #b00000000000000000000000000000000) (bvsgt (x!126390 lt!617507) #b01111111111111111111111111111110) (bvslt (x!126390 lt!617510) #b00000000000000000000000000000000) (bvsgt (x!126390 lt!617510) #b01111111111111111111111111111110) (bvslt lt!617509 #b00000000000000000000000000000000) (bvsge lt!617509 (size!46807 a!2901)) (bvslt (index!44771 lt!617507) #b00000000000000000000000000000000) (bvsge (index!44771 lt!617507) (size!46807 a!2901)) (bvslt (index!44771 lt!617510) #b00000000000000000000000000000000) (bvsge (index!44771 lt!617510) (size!46807 a!2901)) (not (= lt!617507 (Intermediate!10598 false (index!44771 lt!617507) (x!126390 lt!617507)))) (not (= lt!617510 (Intermediate!10598 false (index!44771 lt!617510) (x!126390 lt!617510))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95808 (_ BitVec 32)) SeekEntryResult!10598)

(assert (=> b!1402334 (= lt!617513 (seekKeyOrZeroReturnVacant!0 (x!126390 lt!617510) (index!44771 lt!617510) (index!44771 lt!617510) (select (arr!46255 a!2901) j!112) lt!617508 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95808 (_ BitVec 32)) SeekEntryResult!10598)

(assert (=> b!1402334 (= lt!617513 (seekEntryOrOpen!0 lt!617504 lt!617508 mask!2840))))

(assert (=> b!1402334 (and (not (undefined!11410 lt!617510)) (= (index!44771 lt!617510) i!1037) (bvslt (x!126390 lt!617510) (x!126390 lt!617507)) (= (select (store (arr!46255 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44771 lt!617510)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617512 () Unit!47043)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47043)

(assert (=> b!1402334 (= lt!617512 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617509 (x!126390 lt!617507) (index!44771 lt!617507) (x!126390 lt!617510) (index!44771 lt!617510) (undefined!11410 lt!617510) mask!2840))))

(declare-fun b!1402335 () Bool)

(assert (=> b!1402335 (= e!794087 (not e!794086))))

(declare-fun res!940894 () Bool)

(assert (=> b!1402335 (=> res!940894 e!794086)))

(assert (=> b!1402335 (= res!940894 (or (not ((_ is Intermediate!10598) lt!617507)) (undefined!11410 lt!617507)))))

(assert (=> b!1402335 (= lt!617506 (Found!10598 j!112))))

(assert (=> b!1402335 (= lt!617506 (seekEntryOrOpen!0 (select (arr!46255 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95808 (_ BitVec 32)) Bool)

(assert (=> b!1402335 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617505 () Unit!47043)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47043)

(assert (=> b!1402335 (= lt!617505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402335 (= lt!617507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617509 (select (arr!46255 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402335 (= lt!617509 (toIndex!0 (select (arr!46255 a!2901) j!112) mask!2840))))

(declare-fun b!1402336 () Bool)

(declare-fun res!940895 () Bool)

(assert (=> b!1402336 (=> (not res!940895) (not e!794087))))

(assert (=> b!1402336 (= res!940895 (and (= (size!46807 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46807 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46807 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402337 () Bool)

(declare-fun res!940901 () Bool)

(assert (=> b!1402337 (=> (not res!940901) (not e!794087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402337 (= res!940901 (validKeyInArray!0 (select (arr!46255 a!2901) i!1037)))))

(declare-fun b!1402338 () Bool)

(declare-fun res!940898 () Bool)

(assert (=> b!1402338 (=> res!940898 e!794090)))

(assert (=> b!1402338 (= res!940898 (not (= lt!617510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617509 lt!617504 lt!617508 mask!2840))))))

(declare-fun b!1402339 () Bool)

(declare-fun res!940899 () Bool)

(assert (=> b!1402339 (=> (not res!940899) (not e!794087))))

(assert (=> b!1402339 (= res!940899 (validKeyInArray!0 (select (arr!46255 a!2901) j!112)))))

(declare-fun b!1402340 () Bool)

(declare-fun res!940902 () Bool)

(assert (=> b!1402340 (=> (not res!940902) (not e!794087))))

(assert (=> b!1402340 (= res!940902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402341 () Bool)

(declare-fun res!940903 () Bool)

(assert (=> b!1402341 (=> (not res!940903) (not e!794087))))

(declare-datatypes ((List!32852 0))(
  ( (Nil!32849) (Cons!32848 (h!34096 (_ BitVec 64)) (t!47538 List!32852)) )
))
(declare-fun arrayNoDuplicates!0 (array!95808 (_ BitVec 32) List!32852) Bool)

(assert (=> b!1402341 (= res!940903 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32849))))

(assert (= (and start!120446 res!940897) b!1402336))

(assert (= (and b!1402336 res!940895) b!1402337))

(assert (= (and b!1402337 res!940901) b!1402339))

(assert (= (and b!1402339 res!940899) b!1402340))

(assert (= (and b!1402340 res!940902) b!1402341))

(assert (= (and b!1402341 res!940903) b!1402335))

(assert (= (and b!1402335 (not res!940894)) b!1402332))

(assert (= (and b!1402332 (not res!940900)) b!1402334))

(assert (= (and b!1402334 (not res!940896)) b!1402338))

(assert (= (and b!1402338 (not res!940898)) b!1402333))

(declare-fun m!1290025 () Bool)

(assert (=> b!1402340 m!1290025))

(declare-fun m!1290027 () Bool)

(assert (=> b!1402341 m!1290027))

(declare-fun m!1290029 () Bool)

(assert (=> b!1402334 m!1290029))

(declare-fun m!1290031 () Bool)

(assert (=> b!1402334 m!1290031))

(declare-fun m!1290033 () Bool)

(assert (=> b!1402334 m!1290033))

(assert (=> b!1402334 m!1290031))

(declare-fun m!1290035 () Bool)

(assert (=> b!1402334 m!1290035))

(declare-fun m!1290037 () Bool)

(assert (=> b!1402334 m!1290037))

(declare-fun m!1290039 () Bool)

(assert (=> b!1402334 m!1290039))

(declare-fun m!1290041 () Bool)

(assert (=> b!1402333 m!1290041))

(assert (=> b!1402339 m!1290031))

(assert (=> b!1402339 m!1290031))

(declare-fun m!1290043 () Bool)

(assert (=> b!1402339 m!1290043))

(declare-fun m!1290045 () Bool)

(assert (=> b!1402332 m!1290045))

(assert (=> b!1402332 m!1290045))

(declare-fun m!1290047 () Bool)

(assert (=> b!1402332 m!1290047))

(assert (=> b!1402332 m!1290039))

(declare-fun m!1290049 () Bool)

(assert (=> b!1402332 m!1290049))

(declare-fun m!1290051 () Bool)

(assert (=> b!1402338 m!1290051))

(assert (=> b!1402335 m!1290031))

(declare-fun m!1290053 () Bool)

(assert (=> b!1402335 m!1290053))

(assert (=> b!1402335 m!1290031))

(declare-fun m!1290055 () Bool)

(assert (=> b!1402335 m!1290055))

(assert (=> b!1402335 m!1290031))

(declare-fun m!1290057 () Bool)

(assert (=> b!1402335 m!1290057))

(declare-fun m!1290059 () Bool)

(assert (=> b!1402335 m!1290059))

(assert (=> b!1402335 m!1290031))

(declare-fun m!1290061 () Bool)

(assert (=> b!1402335 m!1290061))

(declare-fun m!1290063 () Bool)

(assert (=> b!1402337 m!1290063))

(assert (=> b!1402337 m!1290063))

(declare-fun m!1290065 () Bool)

(assert (=> b!1402337 m!1290065))

(declare-fun m!1290067 () Bool)

(assert (=> start!120446 m!1290067))

(declare-fun m!1290069 () Bool)

(assert (=> start!120446 m!1290069))

(check-sat (not start!120446) (not b!1402340) (not b!1402335) (not b!1402334) (not b!1402338) (not b!1402333) (not b!1402332) (not b!1402339) (not b!1402341) (not b!1402337))
(check-sat)
