; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123626 () Bool)

(assert start!123626)

(declare-fun res!966995 () Bool)

(declare-fun e!808971 () Bool)

(assert (=> start!123626 (=> (not res!966995) (not e!808971))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123626 (= res!966995 (validMask!0 mask!2608))))

(assert (=> start!123626 e!808971))

(assert (=> start!123626 true))

(declare-datatypes ((array!97506 0))(
  ( (array!97507 (arr!47059 (Array (_ BitVec 32) (_ BitVec 64))) (size!47611 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97506)

(declare-fun array_inv!36292 (array!97506) Bool)

(assert (=> start!123626 (array_inv!36292 a!2831)))

(declare-fun b!1433216 () Bool)

(declare-fun res!966985 () Bool)

(assert (=> b!1433216 (=> (not res!966985) (not e!808971))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1433216 (= res!966985 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47611 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47611 a!2831))))))

(declare-fun b!1433217 () Bool)

(declare-fun res!966989 () Bool)

(assert (=> b!1433217 (=> (not res!966989) (not e!808971))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433217 (= res!966989 (and (= (size!47611 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47611 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47611 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433218 () Bool)

(declare-fun res!966994 () Bool)

(assert (=> b!1433218 (=> (not res!966994) (not e!808971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433218 (= res!966994 (validKeyInArray!0 (select (arr!47059 a!2831) j!81)))))

(declare-fun b!1433219 () Bool)

(declare-fun e!808968 () Bool)

(assert (=> b!1433219 (= e!808971 e!808968)))

(declare-fun res!966988 () Bool)

(assert (=> b!1433219 (=> (not res!966988) (not e!808968))))

(declare-datatypes ((SeekEntryResult!11365 0))(
  ( (MissingZero!11365 (index!47852 (_ BitVec 32))) (Found!11365 (index!47853 (_ BitVec 32))) (Intermediate!11365 (undefined!12177 Bool) (index!47854 (_ BitVec 32)) (x!129491 (_ BitVec 32))) (Undefined!11365) (MissingVacant!11365 (index!47855 (_ BitVec 32))) )
))
(declare-fun lt!630785 () SeekEntryResult!11365)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97506 (_ BitVec 32)) SeekEntryResult!11365)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433219 (= res!966988 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47059 a!2831) j!81) mask!2608) (select (arr!47059 a!2831) j!81) a!2831 mask!2608) lt!630785))))

(assert (=> b!1433219 (= lt!630785 (Intermediate!11365 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433220 () Bool)

(declare-fun e!808969 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97506 (_ BitVec 32)) SeekEntryResult!11365)

(assert (=> b!1433220 (= e!808969 (= (seekEntryOrOpen!0 (select (arr!47059 a!2831) j!81) a!2831 mask!2608) (Found!11365 j!81)))))

(declare-fun b!1433221 () Bool)

(declare-fun res!966987 () Bool)

(declare-fun e!808970 () Bool)

(assert (=> b!1433221 (=> (not res!966987) (not e!808970))))

(declare-fun lt!630782 () (_ BitVec 64))

(declare-fun lt!630783 () array!97506)

(declare-fun lt!630781 () SeekEntryResult!11365)

(assert (=> b!1433221 (= res!966987 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630782 lt!630783 mask!2608) lt!630781))))

(declare-fun b!1433222 () Bool)

(assert (=> b!1433222 (= e!808968 e!808970)))

(declare-fun res!966984 () Bool)

(assert (=> b!1433222 (=> (not res!966984) (not e!808970))))

(assert (=> b!1433222 (= res!966984 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630782 mask!2608) lt!630782 lt!630783 mask!2608) lt!630781))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433222 (= lt!630781 (Intermediate!11365 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1433222 (= lt!630782 (select (store (arr!47059 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433222 (= lt!630783 (array!97507 (store (arr!47059 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47611 a!2831)))))

(declare-fun b!1433223 () Bool)

(declare-fun e!808967 () Bool)

(assert (=> b!1433223 (= e!808967 true)))

(declare-fun lt!630784 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433223 (= lt!630784 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1433224 () Bool)

(assert (=> b!1433224 (= e!808970 (not e!808967))))

(declare-fun res!966991 () Bool)

(assert (=> b!1433224 (=> res!966991 e!808967)))

(assert (=> b!1433224 (= res!966991 (or (= (select (arr!47059 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47059 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47059 a!2831) index!585) (select (arr!47059 a!2831) j!81)) (= (select (store (arr!47059 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1433224 e!808969))

(declare-fun res!966996 () Bool)

(assert (=> b!1433224 (=> (not res!966996) (not e!808969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97506 (_ BitVec 32)) Bool)

(assert (=> b!1433224 (= res!966996 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48315 0))(
  ( (Unit!48316) )
))
(declare-fun lt!630786 () Unit!48315)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48315)

(assert (=> b!1433224 (= lt!630786 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433225 () Bool)

(declare-fun res!966990 () Bool)

(assert (=> b!1433225 (=> (not res!966990) (not e!808971))))

(declare-datatypes ((List!33647 0))(
  ( (Nil!33644) (Cons!33643 (h!34969 (_ BitVec 64)) (t!48333 List!33647)) )
))
(declare-fun arrayNoDuplicates!0 (array!97506 (_ BitVec 32) List!33647) Bool)

(assert (=> b!1433225 (= res!966990 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33644))))

(declare-fun b!1433226 () Bool)

(declare-fun res!966997 () Bool)

(assert (=> b!1433226 (=> (not res!966997) (not e!808970))))

(assert (=> b!1433226 (= res!966997 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433227 () Bool)

(declare-fun res!966986 () Bool)

(assert (=> b!1433227 (=> (not res!966986) (not e!808971))))

(assert (=> b!1433227 (= res!966986 (validKeyInArray!0 (select (arr!47059 a!2831) i!982)))))

(declare-fun b!1433228 () Bool)

(declare-fun res!966993 () Bool)

(assert (=> b!1433228 (=> (not res!966993) (not e!808970))))

(assert (=> b!1433228 (= res!966993 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47059 a!2831) j!81) a!2831 mask!2608) lt!630785))))

(declare-fun b!1433229 () Bool)

(declare-fun res!966992 () Bool)

(assert (=> b!1433229 (=> (not res!966992) (not e!808971))))

(assert (=> b!1433229 (= res!966992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!123626 res!966995) b!1433217))

(assert (= (and b!1433217 res!966989) b!1433227))

(assert (= (and b!1433227 res!966986) b!1433218))

(assert (= (and b!1433218 res!966994) b!1433229))

(assert (= (and b!1433229 res!966992) b!1433225))

(assert (= (and b!1433225 res!966990) b!1433216))

(assert (= (and b!1433216 res!966985) b!1433219))

(assert (= (and b!1433219 res!966988) b!1433222))

(assert (= (and b!1433222 res!966984) b!1433228))

(assert (= (and b!1433228 res!966993) b!1433221))

(assert (= (and b!1433221 res!966987) b!1433226))

(assert (= (and b!1433226 res!966997) b!1433224))

(assert (= (and b!1433224 res!966996) b!1433220))

(assert (= (and b!1433224 (not res!966991)) b!1433223))

(declare-fun m!1322447 () Bool)

(assert (=> b!1433229 m!1322447))

(declare-fun m!1322449 () Bool)

(assert (=> b!1433222 m!1322449))

(assert (=> b!1433222 m!1322449))

(declare-fun m!1322451 () Bool)

(assert (=> b!1433222 m!1322451))

(declare-fun m!1322453 () Bool)

(assert (=> b!1433222 m!1322453))

(declare-fun m!1322455 () Bool)

(assert (=> b!1433222 m!1322455))

(declare-fun m!1322457 () Bool)

(assert (=> b!1433227 m!1322457))

(assert (=> b!1433227 m!1322457))

(declare-fun m!1322459 () Bool)

(assert (=> b!1433227 m!1322459))

(declare-fun m!1322461 () Bool)

(assert (=> b!1433220 m!1322461))

(assert (=> b!1433220 m!1322461))

(declare-fun m!1322463 () Bool)

(assert (=> b!1433220 m!1322463))

(assert (=> b!1433218 m!1322461))

(assert (=> b!1433218 m!1322461))

(declare-fun m!1322465 () Bool)

(assert (=> b!1433218 m!1322465))

(declare-fun m!1322467 () Bool)

(assert (=> start!123626 m!1322467))

(declare-fun m!1322469 () Bool)

(assert (=> start!123626 m!1322469))

(assert (=> b!1433228 m!1322461))

(assert (=> b!1433228 m!1322461))

(declare-fun m!1322471 () Bool)

(assert (=> b!1433228 m!1322471))

(declare-fun m!1322473 () Bool)

(assert (=> b!1433225 m!1322473))

(declare-fun m!1322475 () Bool)

(assert (=> b!1433221 m!1322475))

(assert (=> b!1433224 m!1322453))

(declare-fun m!1322477 () Bool)

(assert (=> b!1433224 m!1322477))

(declare-fun m!1322479 () Bool)

(assert (=> b!1433224 m!1322479))

(declare-fun m!1322481 () Bool)

(assert (=> b!1433224 m!1322481))

(assert (=> b!1433224 m!1322461))

(declare-fun m!1322483 () Bool)

(assert (=> b!1433224 m!1322483))

(assert (=> b!1433219 m!1322461))

(assert (=> b!1433219 m!1322461))

(declare-fun m!1322485 () Bool)

(assert (=> b!1433219 m!1322485))

(assert (=> b!1433219 m!1322485))

(assert (=> b!1433219 m!1322461))

(declare-fun m!1322487 () Bool)

(assert (=> b!1433219 m!1322487))

(declare-fun m!1322489 () Bool)

(assert (=> b!1433223 m!1322489))

(check-sat (not b!1433218) (not b!1433229) (not b!1433227) (not b!1433221) (not b!1433225) (not b!1433220) (not b!1433219) (not b!1433228) (not b!1433224) (not b!1433223) (not b!1433222) (not start!123626))
(check-sat)
