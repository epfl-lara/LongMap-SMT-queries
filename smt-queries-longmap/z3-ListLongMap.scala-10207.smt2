; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120296 () Bool)

(assert start!120296)

(declare-fun b!1399892 () Bool)

(declare-fun res!938411 () Bool)

(declare-fun e!792549 () Bool)

(assert (=> b!1399892 (=> (not res!938411) (not e!792549))))

(declare-datatypes ((array!95705 0))(
  ( (array!95706 (arr!46203 (Array (_ BitVec 32) (_ BitVec 64))) (size!46753 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95705)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95705 (_ BitVec 32)) Bool)

(assert (=> b!1399892 (= res!938411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399893 () Bool)

(declare-fun e!792551 () Bool)

(declare-fun e!792553 () Bool)

(assert (=> b!1399893 (= e!792551 e!792553)))

(declare-fun res!938410 () Bool)

(assert (=> b!1399893 (=> res!938410 e!792553)))

(declare-datatypes ((SeekEntryResult!10520 0))(
  ( (MissingZero!10520 (index!44457 (_ BitVec 32))) (Found!10520 (index!44458 (_ BitVec 32))) (Intermediate!10520 (undefined!11332 Bool) (index!44459 (_ BitVec 32)) (x!126107 (_ BitVec 32))) (Undefined!10520) (MissingVacant!10520 (index!44460 (_ BitVec 32))) )
))
(declare-fun lt!615809 () SeekEntryResult!10520)

(declare-fun lt!615812 () SeekEntryResult!10520)

(get-info :version)

(assert (=> b!1399893 (= res!938410 (or (= lt!615809 lt!615812) (not ((_ is Intermediate!10520) lt!615812))))))

(declare-fun lt!615807 () array!95705)

(declare-fun lt!615813 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95705 (_ BitVec 32)) SeekEntryResult!10520)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399893 (= lt!615812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615813 mask!2840) lt!615813 lt!615807 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1399893 (= lt!615813 (select (store (arr!46203 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399893 (= lt!615807 (array!95706 (store (arr!46203 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46753 a!2901)))))

(declare-fun b!1399894 () Bool)

(declare-fun e!792550 () Bool)

(assert (=> b!1399894 (= e!792550 true)))

(declare-fun lt!615811 () (_ BitVec 32))

(declare-fun lt!615806 () SeekEntryResult!10520)

(assert (=> b!1399894 (= lt!615806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615811 lt!615813 lt!615807 mask!2840))))

(declare-fun res!938412 () Bool)

(assert (=> start!120296 (=> (not res!938412) (not e!792549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120296 (= res!938412 (validMask!0 mask!2840))))

(assert (=> start!120296 e!792549))

(assert (=> start!120296 true))

(declare-fun array_inv!35231 (array!95705) Bool)

(assert (=> start!120296 (array_inv!35231 a!2901)))

(declare-fun b!1399895 () Bool)

(declare-fun res!938409 () Bool)

(assert (=> b!1399895 (=> (not res!938409) (not e!792549))))

(assert (=> b!1399895 (= res!938409 (and (= (size!46753 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46753 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46753 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399896 () Bool)

(assert (=> b!1399896 (= e!792553 e!792550)))

(declare-fun res!938408 () Bool)

(assert (=> b!1399896 (=> res!938408 e!792550)))

(assert (=> b!1399896 (= res!938408 (or (bvslt (x!126107 lt!615809) #b00000000000000000000000000000000) (bvsgt (x!126107 lt!615809) #b01111111111111111111111111111110) (bvslt (x!126107 lt!615812) #b00000000000000000000000000000000) (bvsgt (x!126107 lt!615812) #b01111111111111111111111111111110) (bvslt lt!615811 #b00000000000000000000000000000000) (bvsge lt!615811 (size!46753 a!2901)) (bvslt (index!44459 lt!615809) #b00000000000000000000000000000000) (bvsge (index!44459 lt!615809) (size!46753 a!2901)) (bvslt (index!44459 lt!615812) #b00000000000000000000000000000000) (bvsge (index!44459 lt!615812) (size!46753 a!2901)) (not (= lt!615809 (Intermediate!10520 false (index!44459 lt!615809) (x!126107 lt!615809)))) (not (= lt!615812 (Intermediate!10520 false (index!44459 lt!615812) (x!126107 lt!615812))))))))

(declare-fun e!792552 () Bool)

(assert (=> b!1399896 e!792552))

(declare-fun res!938407 () Bool)

(assert (=> b!1399896 (=> (not res!938407) (not e!792552))))

(assert (=> b!1399896 (= res!938407 (and (not (undefined!11332 lt!615812)) (= (index!44459 lt!615812) i!1037) (bvslt (x!126107 lt!615812) (x!126107 lt!615809)) (= (select (store (arr!46203 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44459 lt!615812)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47044 0))(
  ( (Unit!47045) )
))
(declare-fun lt!615810 () Unit!47044)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47044)

(assert (=> b!1399896 (= lt!615810 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615811 (x!126107 lt!615809) (index!44459 lt!615809) (x!126107 lt!615812) (index!44459 lt!615812) (undefined!11332 lt!615812) mask!2840))))

(declare-fun b!1399897 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95705 (_ BitVec 32)) SeekEntryResult!10520)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95705 (_ BitVec 32)) SeekEntryResult!10520)

(assert (=> b!1399897 (= e!792552 (= (seekEntryOrOpen!0 lt!615813 lt!615807 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126107 lt!615812) (index!44459 lt!615812) (index!44459 lt!615812) (select (arr!46203 a!2901) j!112) lt!615807 mask!2840)))))

(declare-fun b!1399898 () Bool)

(declare-fun res!938404 () Bool)

(assert (=> b!1399898 (=> (not res!938404) (not e!792549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399898 (= res!938404 (validKeyInArray!0 (select (arr!46203 a!2901) j!112)))))

(declare-fun b!1399899 () Bool)

(assert (=> b!1399899 (= e!792549 (not e!792551))))

(declare-fun res!938403 () Bool)

(assert (=> b!1399899 (=> res!938403 e!792551)))

(assert (=> b!1399899 (= res!938403 (or (not ((_ is Intermediate!10520) lt!615809)) (undefined!11332 lt!615809)))))

(declare-fun e!792548 () Bool)

(assert (=> b!1399899 e!792548))

(declare-fun res!938405 () Bool)

(assert (=> b!1399899 (=> (not res!938405) (not e!792548))))

(assert (=> b!1399899 (= res!938405 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615808 () Unit!47044)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47044)

(assert (=> b!1399899 (= lt!615808 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1399899 (= lt!615809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615811 (select (arr!46203 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399899 (= lt!615811 (toIndex!0 (select (arr!46203 a!2901) j!112) mask!2840))))

(declare-fun b!1399900 () Bool)

(declare-fun res!938406 () Bool)

(assert (=> b!1399900 (=> (not res!938406) (not e!792549))))

(assert (=> b!1399900 (= res!938406 (validKeyInArray!0 (select (arr!46203 a!2901) i!1037)))))

(declare-fun b!1399901 () Bool)

(assert (=> b!1399901 (= e!792548 (= (seekEntryOrOpen!0 (select (arr!46203 a!2901) j!112) a!2901 mask!2840) (Found!10520 j!112)))))

(declare-fun b!1399902 () Bool)

(declare-fun res!938413 () Bool)

(assert (=> b!1399902 (=> (not res!938413) (not e!792549))))

(declare-datatypes ((List!32722 0))(
  ( (Nil!32719) (Cons!32718 (h!33966 (_ BitVec 64)) (t!47416 List!32722)) )
))
(declare-fun arrayNoDuplicates!0 (array!95705 (_ BitVec 32) List!32722) Bool)

(assert (=> b!1399902 (= res!938413 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32719))))

(assert (= (and start!120296 res!938412) b!1399895))

(assert (= (and b!1399895 res!938409) b!1399900))

(assert (= (and b!1399900 res!938406) b!1399898))

(assert (= (and b!1399898 res!938404) b!1399892))

(assert (= (and b!1399892 res!938411) b!1399902))

(assert (= (and b!1399902 res!938413) b!1399899))

(assert (= (and b!1399899 res!938405) b!1399901))

(assert (= (and b!1399899 (not res!938403)) b!1399893))

(assert (= (and b!1399893 (not res!938410)) b!1399896))

(assert (= (and b!1399896 res!938407) b!1399897))

(assert (= (and b!1399896 (not res!938408)) b!1399894))

(declare-fun m!1287161 () Bool)

(assert (=> b!1399892 m!1287161))

(declare-fun m!1287163 () Bool)

(assert (=> b!1399894 m!1287163))

(declare-fun m!1287165 () Bool)

(assert (=> b!1399898 m!1287165))

(assert (=> b!1399898 m!1287165))

(declare-fun m!1287167 () Bool)

(assert (=> b!1399898 m!1287167))

(declare-fun m!1287169 () Bool)

(assert (=> b!1399897 m!1287169))

(assert (=> b!1399897 m!1287165))

(assert (=> b!1399897 m!1287165))

(declare-fun m!1287171 () Bool)

(assert (=> b!1399897 m!1287171))

(assert (=> b!1399899 m!1287165))

(declare-fun m!1287173 () Bool)

(assert (=> b!1399899 m!1287173))

(assert (=> b!1399899 m!1287165))

(declare-fun m!1287175 () Bool)

(assert (=> b!1399899 m!1287175))

(assert (=> b!1399899 m!1287165))

(declare-fun m!1287177 () Bool)

(assert (=> b!1399899 m!1287177))

(declare-fun m!1287179 () Bool)

(assert (=> b!1399899 m!1287179))

(declare-fun m!1287181 () Bool)

(assert (=> start!120296 m!1287181))

(declare-fun m!1287183 () Bool)

(assert (=> start!120296 m!1287183))

(declare-fun m!1287185 () Bool)

(assert (=> b!1399900 m!1287185))

(assert (=> b!1399900 m!1287185))

(declare-fun m!1287187 () Bool)

(assert (=> b!1399900 m!1287187))

(declare-fun m!1287189 () Bool)

(assert (=> b!1399896 m!1287189))

(declare-fun m!1287191 () Bool)

(assert (=> b!1399896 m!1287191))

(declare-fun m!1287193 () Bool)

(assert (=> b!1399896 m!1287193))

(assert (=> b!1399901 m!1287165))

(assert (=> b!1399901 m!1287165))

(declare-fun m!1287195 () Bool)

(assert (=> b!1399901 m!1287195))

(declare-fun m!1287197 () Bool)

(assert (=> b!1399893 m!1287197))

(assert (=> b!1399893 m!1287197))

(declare-fun m!1287199 () Bool)

(assert (=> b!1399893 m!1287199))

(assert (=> b!1399893 m!1287189))

(declare-fun m!1287201 () Bool)

(assert (=> b!1399893 m!1287201))

(declare-fun m!1287203 () Bool)

(assert (=> b!1399902 m!1287203))

(check-sat (not b!1399896) (not b!1399898) (not b!1399901) (not b!1399893) (not b!1399892) (not b!1399894) (not b!1399900) (not b!1399902) (not b!1399897) (not start!120296) (not b!1399899))
(check-sat)
