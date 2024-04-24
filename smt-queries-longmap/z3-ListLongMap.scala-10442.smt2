; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123056 () Bool)

(assert start!123056)

(declare-fun b!1425624 () Bool)

(declare-fun res!960180 () Bool)

(declare-fun e!805828 () Bool)

(assert (=> b!1425624 (=> (not res!960180) (not e!805828))))

(declare-datatypes ((array!97292 0))(
  ( (array!97293 (arr!46960 (Array (_ BitVec 32) (_ BitVec 64))) (size!47511 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97292)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425624 (= res!960180 (and (= (size!47511 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47511 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47511 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425625 () Bool)

(declare-fun res!960177 () Bool)

(assert (=> b!1425625 (=> (not res!960177) (not e!805828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97292 (_ BitVec 32)) Bool)

(assert (=> b!1425625 (= res!960177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425626 () Bool)

(declare-fun e!805827 () Bool)

(declare-fun e!805829 () Bool)

(assert (=> b!1425626 (= e!805827 e!805829)))

(declare-fun res!960175 () Bool)

(assert (=> b!1425626 (=> (not res!960175) (not e!805829))))

(declare-fun lt!627970 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11147 0))(
  ( (MissingZero!11147 (index!46980 (_ BitVec 32))) (Found!11147 (index!46981 (_ BitVec 32))) (Intermediate!11147 (undefined!11959 Bool) (index!46982 (_ BitVec 32)) (x!128774 (_ BitVec 32))) (Undefined!11147) (MissingVacant!11147 (index!46983 (_ BitVec 32))) )
))
(declare-fun lt!627967 () SeekEntryResult!11147)

(declare-fun lt!627971 () array!97292)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97292 (_ BitVec 32)) SeekEntryResult!11147)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425626 (= res!960175 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627970 mask!2608) lt!627970 lt!627971 mask!2608) lt!627967))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1425626 (= lt!627967 (Intermediate!11147 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1425626 (= lt!627970 (select (store (arr!46960 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425626 (= lt!627971 (array!97293 (store (arr!46960 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47511 a!2831)))))

(declare-fun b!1425628 () Bool)

(declare-fun e!805826 () Bool)

(assert (=> b!1425628 (= e!805826 true)))

(declare-fun lt!627968 () SeekEntryResult!11147)

(declare-fun lt!627969 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1425628 (= lt!627968 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627969 lt!627970 lt!627971 mask!2608))))

(declare-fun b!1425629 () Bool)

(declare-fun res!960178 () Bool)

(assert (=> b!1425629 (=> (not res!960178) (not e!805829))))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425629 (= res!960178 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627970 lt!627971 mask!2608) lt!627967))))

(declare-fun b!1425630 () Bool)

(declare-fun res!960187 () Bool)

(assert (=> b!1425630 (=> (not res!960187) (not e!805828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425630 (= res!960187 (validKeyInArray!0 (select (arr!46960 a!2831) j!81)))))

(declare-fun b!1425631 () Bool)

(assert (=> b!1425631 (= e!805828 e!805827)))

(declare-fun res!960183 () Bool)

(assert (=> b!1425631 (=> (not res!960183) (not e!805827))))

(declare-fun lt!627965 () SeekEntryResult!11147)

(assert (=> b!1425631 (= res!960183 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46960 a!2831) j!81) mask!2608) (select (arr!46960 a!2831) j!81) a!2831 mask!2608) lt!627965))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425631 (= lt!627965 (Intermediate!11147 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425632 () Bool)

(declare-fun res!960182 () Bool)

(assert (=> b!1425632 (=> (not res!960182) (not e!805828))))

(assert (=> b!1425632 (= res!960182 (validKeyInArray!0 (select (arr!46960 a!2831) i!982)))))

(declare-fun b!1425633 () Bool)

(declare-fun res!960185 () Bool)

(assert (=> b!1425633 (=> (not res!960185) (not e!805828))))

(declare-datatypes ((List!33457 0))(
  ( (Nil!33454) (Cons!33453 (h!34766 (_ BitVec 64)) (t!48143 List!33457)) )
))
(declare-fun arrayNoDuplicates!0 (array!97292 (_ BitVec 32) List!33457) Bool)

(assert (=> b!1425633 (= res!960185 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33454))))

(declare-fun b!1425634 () Bool)

(declare-fun e!805830 () Bool)

(assert (=> b!1425634 (= e!805830 e!805826)))

(declare-fun res!960181 () Bool)

(assert (=> b!1425634 (=> res!960181 e!805826)))

(assert (=> b!1425634 (= res!960181 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627969 #b00000000000000000000000000000000) (bvsge lt!627969 (size!47511 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425634 (= lt!627969 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1425635 () Bool)

(assert (=> b!1425635 (= e!805829 (not e!805830))))

(declare-fun res!960172 () Bool)

(assert (=> b!1425635 (=> res!960172 e!805830)))

(assert (=> b!1425635 (= res!960172 (or (= (select (arr!46960 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46960 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46960 a!2831) index!585) (select (arr!46960 a!2831) j!81)) (= (select (store (arr!46960 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805831 () Bool)

(assert (=> b!1425635 e!805831))

(declare-fun res!960184 () Bool)

(assert (=> b!1425635 (=> (not res!960184) (not e!805831))))

(assert (=> b!1425635 (= res!960184 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48161 0))(
  ( (Unit!48162) )
))
(declare-fun lt!627966 () Unit!48161)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48161)

(assert (=> b!1425635 (= lt!627966 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1425636 () Bool)

(declare-fun res!960179 () Bool)

(assert (=> b!1425636 (=> (not res!960179) (not e!805829))))

(assert (=> b!1425636 (= res!960179 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46960 a!2831) j!81) a!2831 mask!2608) lt!627965))))

(declare-fun b!1425637 () Bool)

(declare-fun res!960173 () Bool)

(assert (=> b!1425637 (=> (not res!960173) (not e!805828))))

(assert (=> b!1425637 (= res!960173 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47511 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47511 a!2831))))))

(declare-fun res!960174 () Bool)

(assert (=> start!123056 (=> (not res!960174) (not e!805828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123056 (= res!960174 (validMask!0 mask!2608))))

(assert (=> start!123056 e!805828))

(assert (=> start!123056 true))

(declare-fun array_inv!36241 (array!97292) Bool)

(assert (=> start!123056 (array_inv!36241 a!2831)))

(declare-fun b!1425627 () Bool)

(declare-fun res!960186 () Bool)

(assert (=> b!1425627 (=> (not res!960186) (not e!805829))))

(assert (=> b!1425627 (= res!960186 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1425638 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97292 (_ BitVec 32)) SeekEntryResult!11147)

(assert (=> b!1425638 (= e!805831 (= (seekEntryOrOpen!0 (select (arr!46960 a!2831) j!81) a!2831 mask!2608) (Found!11147 j!81)))))

(declare-fun b!1425639 () Bool)

(declare-fun res!960176 () Bool)

(assert (=> b!1425639 (=> res!960176 e!805826)))

(assert (=> b!1425639 (= res!960176 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627969 (select (arr!46960 a!2831) j!81) a!2831 mask!2608) lt!627965)))))

(assert (= (and start!123056 res!960174) b!1425624))

(assert (= (and b!1425624 res!960180) b!1425632))

(assert (= (and b!1425632 res!960182) b!1425630))

(assert (= (and b!1425630 res!960187) b!1425625))

(assert (= (and b!1425625 res!960177) b!1425633))

(assert (= (and b!1425633 res!960185) b!1425637))

(assert (= (and b!1425637 res!960173) b!1425631))

(assert (= (and b!1425631 res!960183) b!1425626))

(assert (= (and b!1425626 res!960175) b!1425636))

(assert (= (and b!1425636 res!960179) b!1425629))

(assert (= (and b!1425629 res!960178) b!1425627))

(assert (= (and b!1425627 res!960186) b!1425635))

(assert (= (and b!1425635 res!960184) b!1425638))

(assert (= (and b!1425635 (not res!960172)) b!1425634))

(assert (= (and b!1425634 (not res!960181)) b!1425639))

(assert (= (and b!1425639 (not res!960176)) b!1425628))

(declare-fun m!1316289 () Bool)

(assert (=> b!1425635 m!1316289))

(declare-fun m!1316291 () Bool)

(assert (=> b!1425635 m!1316291))

(declare-fun m!1316293 () Bool)

(assert (=> b!1425635 m!1316293))

(declare-fun m!1316295 () Bool)

(assert (=> b!1425635 m!1316295))

(declare-fun m!1316297 () Bool)

(assert (=> b!1425635 m!1316297))

(declare-fun m!1316299 () Bool)

(assert (=> b!1425635 m!1316299))

(declare-fun m!1316301 () Bool)

(assert (=> b!1425629 m!1316301))

(assert (=> b!1425638 m!1316297))

(assert (=> b!1425638 m!1316297))

(declare-fun m!1316303 () Bool)

(assert (=> b!1425638 m!1316303))

(declare-fun m!1316305 () Bool)

(assert (=> b!1425625 m!1316305))

(assert (=> b!1425639 m!1316297))

(assert (=> b!1425639 m!1316297))

(declare-fun m!1316307 () Bool)

(assert (=> b!1425639 m!1316307))

(assert (=> b!1425630 m!1316297))

(assert (=> b!1425630 m!1316297))

(declare-fun m!1316309 () Bool)

(assert (=> b!1425630 m!1316309))

(declare-fun m!1316311 () Bool)

(assert (=> b!1425628 m!1316311))

(assert (=> b!1425631 m!1316297))

(assert (=> b!1425631 m!1316297))

(declare-fun m!1316313 () Bool)

(assert (=> b!1425631 m!1316313))

(assert (=> b!1425631 m!1316313))

(assert (=> b!1425631 m!1316297))

(declare-fun m!1316315 () Bool)

(assert (=> b!1425631 m!1316315))

(declare-fun m!1316317 () Bool)

(assert (=> b!1425632 m!1316317))

(assert (=> b!1425632 m!1316317))

(declare-fun m!1316319 () Bool)

(assert (=> b!1425632 m!1316319))

(declare-fun m!1316321 () Bool)

(assert (=> b!1425634 m!1316321))

(declare-fun m!1316323 () Bool)

(assert (=> start!123056 m!1316323))

(declare-fun m!1316325 () Bool)

(assert (=> start!123056 m!1316325))

(declare-fun m!1316327 () Bool)

(assert (=> b!1425633 m!1316327))

(assert (=> b!1425636 m!1316297))

(assert (=> b!1425636 m!1316297))

(declare-fun m!1316329 () Bool)

(assert (=> b!1425636 m!1316329))

(declare-fun m!1316331 () Bool)

(assert (=> b!1425626 m!1316331))

(assert (=> b!1425626 m!1316331))

(declare-fun m!1316333 () Bool)

(assert (=> b!1425626 m!1316333))

(assert (=> b!1425626 m!1316289))

(declare-fun m!1316335 () Bool)

(assert (=> b!1425626 m!1316335))

(check-sat (not b!1425630) (not b!1425625) (not b!1425631) (not b!1425633) (not b!1425628) (not start!123056) (not b!1425636) (not b!1425635) (not b!1425638) (not b!1425626) (not b!1425639) (not b!1425629) (not b!1425634) (not b!1425632))
(check-sat)
