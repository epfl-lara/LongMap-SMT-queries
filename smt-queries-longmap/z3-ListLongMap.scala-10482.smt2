; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123512 () Bool)

(assert start!123512)

(declare-fun b!1430976 () Bool)

(declare-fun res!964721 () Bool)

(declare-fun e!808103 () Bool)

(assert (=> b!1430976 (=> (not res!964721) (not e!808103))))

(declare-datatypes ((array!97544 0))(
  ( (array!97545 (arr!47080 (Array (_ BitVec 32) (_ BitVec 64))) (size!47631 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97544)

(declare-datatypes ((List!33577 0))(
  ( (Nil!33574) (Cons!33573 (h!34898 (_ BitVec 64)) (t!48263 List!33577)) )
))
(declare-fun arrayNoDuplicates!0 (array!97544 (_ BitVec 32) List!33577) Bool)

(assert (=> b!1430976 (= res!964721 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33574))))

(declare-fun b!1430977 () Bool)

(declare-fun res!964725 () Bool)

(assert (=> b!1430977 (=> (not res!964725) (not e!808103))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1430977 (= res!964725 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47631 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47631 a!2831))))))

(declare-fun b!1430978 () Bool)

(declare-fun res!964731 () Bool)

(declare-fun e!808102 () Bool)

(assert (=> b!1430978 (=> (not res!964731) (not e!808102))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1430978 (= res!964731 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430979 () Bool)

(declare-fun res!964728 () Bool)

(assert (=> b!1430979 (=> (not res!964728) (not e!808102))))

(declare-fun lt!629932 () array!97544)

(declare-fun lt!629930 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11261 0))(
  ( (MissingZero!11261 (index!47436 (_ BitVec 32))) (Found!11261 (index!47437 (_ BitVec 32))) (Intermediate!11261 (undefined!12073 Bool) (index!47438 (_ BitVec 32)) (x!129232 (_ BitVec 32))) (Undefined!11261) (MissingVacant!11261 (index!47439 (_ BitVec 32))) )
))
(declare-fun lt!629933 () SeekEntryResult!11261)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97544 (_ BitVec 32)) SeekEntryResult!11261)

(assert (=> b!1430979 (= res!964728 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629930 lt!629932 mask!2608) lt!629933))))

(declare-fun b!1430980 () Bool)

(declare-fun res!964729 () Bool)

(assert (=> b!1430980 (=> (not res!964729) (not e!808103))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430980 (= res!964729 (validKeyInArray!0 (select (arr!47080 a!2831) i!982)))))

(declare-fun b!1430981 () Bool)

(declare-fun res!964730 () Bool)

(assert (=> b!1430981 (=> (not res!964730) (not e!808102))))

(declare-fun lt!629929 () SeekEntryResult!11261)

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1430981 (= res!964730 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47080 a!2831) j!81) a!2831 mask!2608) lt!629929))))

(declare-fun b!1430982 () Bool)

(declare-fun e!808099 () Bool)

(assert (=> b!1430982 (= e!808099 e!808102)))

(declare-fun res!964724 () Bool)

(assert (=> b!1430982 (=> (not res!964724) (not e!808102))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430982 (= res!964724 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629930 mask!2608) lt!629930 lt!629932 mask!2608) lt!629933))))

(assert (=> b!1430982 (= lt!629933 (Intermediate!11261 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430982 (= lt!629930 (select (store (arr!47080 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430982 (= lt!629932 (array!97545 (store (arr!47080 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47631 a!2831)))))

(declare-fun b!1430983 () Bool)

(declare-fun res!964722 () Bool)

(assert (=> b!1430983 (=> (not res!964722) (not e!808103))))

(assert (=> b!1430983 (= res!964722 (validKeyInArray!0 (select (arr!47080 a!2831) j!81)))))

(declare-fun res!964726 () Bool)

(assert (=> start!123512 (=> (not res!964726) (not e!808103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123512 (= res!964726 (validMask!0 mask!2608))))

(assert (=> start!123512 e!808103))

(assert (=> start!123512 true))

(declare-fun array_inv!36361 (array!97544) Bool)

(assert (=> start!123512 (array_inv!36361 a!2831)))

(declare-fun b!1430984 () Bool)

(declare-fun res!964720 () Bool)

(assert (=> b!1430984 (=> (not res!964720) (not e!808103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97544 (_ BitVec 32)) Bool)

(assert (=> b!1430984 (= res!964720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430985 () Bool)

(assert (=> b!1430985 (= e!808103 e!808099)))

(declare-fun res!964732 () Bool)

(assert (=> b!1430985 (=> (not res!964732) (not e!808099))))

(assert (=> b!1430985 (= res!964732 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47080 a!2831) j!81) mask!2608) (select (arr!47080 a!2831) j!81) a!2831 mask!2608) lt!629929))))

(assert (=> b!1430985 (= lt!629929 (Intermediate!11261 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430986 () Bool)

(assert (=> b!1430986 (= e!808102 (not true))))

(declare-fun e!808101 () Bool)

(assert (=> b!1430986 e!808101))

(declare-fun res!964727 () Bool)

(assert (=> b!1430986 (=> (not res!964727) (not e!808101))))

(assert (=> b!1430986 (= res!964727 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48299 0))(
  ( (Unit!48300) )
))
(declare-fun lt!629931 () Unit!48299)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48299)

(assert (=> b!1430986 (= lt!629931 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430987 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97544 (_ BitVec 32)) SeekEntryResult!11261)

(assert (=> b!1430987 (= e!808101 (= (seekEntryOrOpen!0 (select (arr!47080 a!2831) j!81) a!2831 mask!2608) (Found!11261 j!81)))))

(declare-fun b!1430988 () Bool)

(declare-fun res!964723 () Bool)

(assert (=> b!1430988 (=> (not res!964723) (not e!808103))))

(assert (=> b!1430988 (= res!964723 (and (= (size!47631 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47631 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47631 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123512 res!964726) b!1430988))

(assert (= (and b!1430988 res!964723) b!1430980))

(assert (= (and b!1430980 res!964729) b!1430983))

(assert (= (and b!1430983 res!964722) b!1430984))

(assert (= (and b!1430984 res!964720) b!1430976))

(assert (= (and b!1430976 res!964721) b!1430977))

(assert (= (and b!1430977 res!964725) b!1430985))

(assert (= (and b!1430985 res!964732) b!1430982))

(assert (= (and b!1430982 res!964724) b!1430981))

(assert (= (and b!1430981 res!964730) b!1430979))

(assert (= (and b!1430979 res!964728) b!1430978))

(assert (= (and b!1430978 res!964731) b!1430986))

(assert (= (and b!1430986 res!964727) b!1430987))

(declare-fun m!1321191 () Bool)

(assert (=> b!1430986 m!1321191))

(declare-fun m!1321193 () Bool)

(assert (=> b!1430986 m!1321193))

(declare-fun m!1321195 () Bool)

(assert (=> start!123512 m!1321195))

(declare-fun m!1321197 () Bool)

(assert (=> start!123512 m!1321197))

(declare-fun m!1321199 () Bool)

(assert (=> b!1430983 m!1321199))

(assert (=> b!1430983 m!1321199))

(declare-fun m!1321201 () Bool)

(assert (=> b!1430983 m!1321201))

(assert (=> b!1430987 m!1321199))

(assert (=> b!1430987 m!1321199))

(declare-fun m!1321203 () Bool)

(assert (=> b!1430987 m!1321203))

(declare-fun m!1321205 () Bool)

(assert (=> b!1430976 m!1321205))

(assert (=> b!1430981 m!1321199))

(assert (=> b!1430981 m!1321199))

(declare-fun m!1321207 () Bool)

(assert (=> b!1430981 m!1321207))

(declare-fun m!1321209 () Bool)

(assert (=> b!1430982 m!1321209))

(assert (=> b!1430982 m!1321209))

(declare-fun m!1321211 () Bool)

(assert (=> b!1430982 m!1321211))

(declare-fun m!1321213 () Bool)

(assert (=> b!1430982 m!1321213))

(declare-fun m!1321215 () Bool)

(assert (=> b!1430982 m!1321215))

(assert (=> b!1430985 m!1321199))

(assert (=> b!1430985 m!1321199))

(declare-fun m!1321217 () Bool)

(assert (=> b!1430985 m!1321217))

(assert (=> b!1430985 m!1321217))

(assert (=> b!1430985 m!1321199))

(declare-fun m!1321219 () Bool)

(assert (=> b!1430985 m!1321219))

(declare-fun m!1321221 () Bool)

(assert (=> b!1430984 m!1321221))

(declare-fun m!1321223 () Bool)

(assert (=> b!1430979 m!1321223))

(declare-fun m!1321225 () Bool)

(assert (=> b!1430980 m!1321225))

(assert (=> b!1430980 m!1321225))

(declare-fun m!1321227 () Bool)

(assert (=> b!1430980 m!1321227))

(check-sat (not b!1430983) (not b!1430985) (not b!1430980) (not b!1430984) (not start!123512) (not b!1430981) (not b!1430982) (not b!1430986) (not b!1430987) (not b!1430976) (not b!1430979))
(check-sat)
