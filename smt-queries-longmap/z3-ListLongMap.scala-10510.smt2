; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124108 () Bool)

(assert start!124108)

(declare-fun b!1436975 () Bool)

(declare-fun res!969159 () Bool)

(declare-fun e!811078 () Bool)

(assert (=> b!1436975 (=> (not res!969159) (not e!811078))))

(declare-datatypes ((array!97733 0))(
  ( (array!97734 (arr!47164 (Array (_ BitVec 32) (_ BitVec 64))) (size!47715 (_ BitVec 32))) )
))
(declare-fun lt!632448 () array!97733)

(declare-datatypes ((SeekEntryResult!11345 0))(
  ( (MissingZero!11345 (index!47772 (_ BitVec 32))) (Found!11345 (index!47773 (_ BitVec 32))) (Intermediate!11345 (undefined!12157 Bool) (index!47774 (_ BitVec 32)) (x!129599 (_ BitVec 32))) (Undefined!11345) (MissingVacant!11345 (index!47775 (_ BitVec 32))) )
))
(declare-fun lt!632447 () SeekEntryResult!11345)

(declare-fun lt!632444 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97733 (_ BitVec 32)) SeekEntryResult!11345)

(assert (=> b!1436975 (= res!969159 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!632444 lt!632448 mask!2608) lt!632447))))

(declare-fun b!1436976 () Bool)

(declare-fun res!969158 () Bool)

(declare-fun e!811079 () Bool)

(assert (=> b!1436976 (=> (not res!969158) (not e!811079))))

(declare-fun a!2831 () array!97733)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1436976 (= res!969158 (and (= (size!47715 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47715 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47715 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1436977 () Bool)

(declare-fun e!811075 () Bool)

(assert (=> b!1436977 (= e!811075 e!811078)))

(declare-fun res!969148 () Bool)

(assert (=> b!1436977 (=> (not res!969148) (not e!811078))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436977 (= res!969148 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!632444 mask!2608) lt!632444 lt!632448 mask!2608) lt!632447))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1436977 (= lt!632447 (Intermediate!11345 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1436977 (= lt!632444 (select (store (arr!47164 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1436977 (= lt!632448 (array!97734 (store (arr!47164 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47715 a!2831)))))

(declare-fun b!1436978 () Bool)

(declare-fun e!811076 () Bool)

(declare-fun e!811073 () Bool)

(assert (=> b!1436978 (= e!811076 e!811073)))

(declare-fun res!969151 () Bool)

(assert (=> b!1436978 (=> res!969151 e!811073)))

(declare-fun lt!632450 () (_ BitVec 32))

(assert (=> b!1436978 (= res!969151 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!632450 #b00000000000000000000000000000000) (bvsge lt!632450 (size!47715 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436978 (= lt!632450 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1436979 () Bool)

(assert (=> b!1436979 (= e!811079 e!811075)))

(declare-fun res!969147 () Bool)

(assert (=> b!1436979 (=> (not res!969147) (not e!811075))))

(declare-fun lt!632445 () SeekEntryResult!11345)

(assert (=> b!1436979 (= res!969147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47164 a!2831) j!81) mask!2608) (select (arr!47164 a!2831) j!81) a!2831 mask!2608) lt!632445))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1436979 (= lt!632445 (Intermediate!11345 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1436980 () Bool)

(declare-fun res!969157 () Bool)

(assert (=> b!1436980 (=> (not res!969157) (not e!811079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97733 (_ BitVec 32)) Bool)

(assert (=> b!1436980 (= res!969157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1436982 () Bool)

(declare-fun e!811077 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97733 (_ BitVec 32)) SeekEntryResult!11345)

(assert (=> b!1436982 (= e!811077 (= (seekEntryOrOpen!0 (select (arr!47164 a!2831) j!81) a!2831 mask!2608) (Found!11345 j!81)))))

(declare-fun b!1436983 () Bool)

(declare-fun res!969145 () Bool)

(assert (=> b!1436983 (=> (not res!969145) (not e!811079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436983 (= res!969145 (validKeyInArray!0 (select (arr!47164 a!2831) i!982)))))

(declare-fun b!1436984 () Bool)

(declare-fun res!969150 () Bool)

(assert (=> b!1436984 (=> (not res!969150) (not e!811079))))

(assert (=> b!1436984 (= res!969150 (validKeyInArray!0 (select (arr!47164 a!2831) j!81)))))

(declare-fun b!1436985 () Bool)

(assert (=> b!1436985 (= e!811073 true)))

(assert (=> b!1436985 (and (not undefinedAfter!5) (= intermediateAfterIndex!13 i!982) (bvslt intermediateAfterX!13 intermediateBeforeX!13))))

(declare-datatypes ((Unit!48467 0))(
  ( (Unit!48468) )
))
(declare-fun lt!632446 () Unit!48467)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!97733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!48467)

(assert (=> b!1436985 (= lt!632446 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2831 i!982 j!81 (bvadd #b00000000000000000000000000000001 x!605) lt!632450 intermediateBeforeX!13 intermediateBeforeIndex!13 intermediateAfterX!13 intermediateAfterIndex!13 undefinedAfter!5 mask!2608))))

(declare-fun b!1436986 () Bool)

(declare-fun res!969155 () Bool)

(assert (=> b!1436986 (=> (not res!969155) (not e!811079))))

(assert (=> b!1436986 (= res!969155 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47715 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47715 a!2831))))))

(declare-fun b!1436987 () Bool)

(declare-fun res!969160 () Bool)

(assert (=> b!1436987 (=> res!969160 e!811073)))

(assert (=> b!1436987 (= res!969160 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!632450 lt!632444 lt!632448 mask!2608) lt!632447)))))

(declare-fun b!1436988 () Bool)

(declare-fun res!969156 () Bool)

(assert (=> b!1436988 (=> (not res!969156) (not e!811078))))

(assert (=> b!1436988 (= res!969156 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47164 a!2831) j!81) a!2831 mask!2608) lt!632445))))

(declare-fun b!1436989 () Bool)

(declare-fun res!969153 () Bool)

(assert (=> b!1436989 (=> (not res!969153) (not e!811079))))

(declare-datatypes ((List!33661 0))(
  ( (Nil!33658) (Cons!33657 (h!35003 (_ BitVec 64)) (t!48347 List!33661)) )
))
(declare-fun arrayNoDuplicates!0 (array!97733 (_ BitVec 32) List!33661) Bool)

(assert (=> b!1436989 (= res!969153 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33658))))

(declare-fun res!969149 () Bool)

(assert (=> start!124108 (=> (not res!969149) (not e!811079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124108 (= res!969149 (validMask!0 mask!2608))))

(assert (=> start!124108 e!811079))

(assert (=> start!124108 true))

(declare-fun array_inv!36445 (array!97733) Bool)

(assert (=> start!124108 (array_inv!36445 a!2831)))

(declare-fun b!1436981 () Bool)

(declare-fun res!969146 () Bool)

(assert (=> b!1436981 (=> (not res!969146) (not e!811078))))

(assert (=> b!1436981 (= res!969146 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1436990 () Bool)

(assert (=> b!1436990 (= e!811078 (not e!811076))))

(declare-fun res!969144 () Bool)

(assert (=> b!1436990 (=> res!969144 e!811076)))

(assert (=> b!1436990 (= res!969144 (or (= (select (arr!47164 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47164 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47164 a!2831) index!585) (select (arr!47164 a!2831) j!81)) (= (select (store (arr!47164 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1436990 e!811077))

(declare-fun res!969154 () Bool)

(assert (=> b!1436990 (=> (not res!969154) (not e!811077))))

(assert (=> b!1436990 (= res!969154 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-fun lt!632449 () Unit!48467)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48467)

(assert (=> b!1436990 (= lt!632449 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1436991 () Bool)

(declare-fun res!969152 () Bool)

(assert (=> b!1436991 (=> res!969152 e!811073)))

(assert (=> b!1436991 (= res!969152 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!632450 (select (arr!47164 a!2831) j!81) a!2831 mask!2608) lt!632445)))))

(assert (= (and start!124108 res!969149) b!1436976))

(assert (= (and b!1436976 res!969158) b!1436983))

(assert (= (and b!1436983 res!969145) b!1436984))

(assert (= (and b!1436984 res!969150) b!1436980))

(assert (= (and b!1436980 res!969157) b!1436989))

(assert (= (and b!1436989 res!969153) b!1436986))

(assert (= (and b!1436986 res!969155) b!1436979))

(assert (= (and b!1436979 res!969147) b!1436977))

(assert (= (and b!1436977 res!969148) b!1436988))

(assert (= (and b!1436988 res!969156) b!1436975))

(assert (= (and b!1436975 res!969159) b!1436981))

(assert (= (and b!1436981 res!969146) b!1436990))

(assert (= (and b!1436990 res!969154) b!1436982))

(assert (= (and b!1436990 (not res!969144)) b!1436978))

(assert (= (and b!1436978 (not res!969151)) b!1436991))

(assert (= (and b!1436991 (not res!969152)) b!1436987))

(assert (= (and b!1436987 (not res!969160)) b!1436985))

(declare-fun m!1326451 () Bool)

(assert (=> b!1436977 m!1326451))

(assert (=> b!1436977 m!1326451))

(declare-fun m!1326453 () Bool)

(assert (=> b!1436977 m!1326453))

(declare-fun m!1326455 () Bool)

(assert (=> b!1436977 m!1326455))

(declare-fun m!1326457 () Bool)

(assert (=> b!1436977 m!1326457))

(assert (=> b!1436990 m!1326455))

(declare-fun m!1326459 () Bool)

(assert (=> b!1436990 m!1326459))

(declare-fun m!1326461 () Bool)

(assert (=> b!1436990 m!1326461))

(declare-fun m!1326463 () Bool)

(assert (=> b!1436990 m!1326463))

(declare-fun m!1326465 () Bool)

(assert (=> b!1436990 m!1326465))

(declare-fun m!1326467 () Bool)

(assert (=> b!1436990 m!1326467))

(declare-fun m!1326469 () Bool)

(assert (=> b!1436978 m!1326469))

(declare-fun m!1326471 () Bool)

(assert (=> b!1436975 m!1326471))

(assert (=> b!1436982 m!1326465))

(assert (=> b!1436982 m!1326465))

(declare-fun m!1326473 () Bool)

(assert (=> b!1436982 m!1326473))

(declare-fun m!1326475 () Bool)

(assert (=> b!1436985 m!1326475))

(assert (=> b!1436988 m!1326465))

(assert (=> b!1436988 m!1326465))

(declare-fun m!1326477 () Bool)

(assert (=> b!1436988 m!1326477))

(declare-fun m!1326479 () Bool)

(assert (=> b!1436980 m!1326479))

(declare-fun m!1326481 () Bool)

(assert (=> start!124108 m!1326481))

(declare-fun m!1326483 () Bool)

(assert (=> start!124108 m!1326483))

(declare-fun m!1326485 () Bool)

(assert (=> b!1436987 m!1326485))

(declare-fun m!1326487 () Bool)

(assert (=> b!1436989 m!1326487))

(assert (=> b!1436979 m!1326465))

(assert (=> b!1436979 m!1326465))

(declare-fun m!1326489 () Bool)

(assert (=> b!1436979 m!1326489))

(assert (=> b!1436979 m!1326489))

(assert (=> b!1436979 m!1326465))

(declare-fun m!1326491 () Bool)

(assert (=> b!1436979 m!1326491))

(assert (=> b!1436984 m!1326465))

(assert (=> b!1436984 m!1326465))

(declare-fun m!1326493 () Bool)

(assert (=> b!1436984 m!1326493))

(assert (=> b!1436991 m!1326465))

(assert (=> b!1436991 m!1326465))

(declare-fun m!1326495 () Bool)

(assert (=> b!1436991 m!1326495))

(declare-fun m!1326497 () Bool)

(assert (=> b!1436983 m!1326497))

(assert (=> b!1436983 m!1326497))

(declare-fun m!1326499 () Bool)

(assert (=> b!1436983 m!1326499))

(check-sat (not b!1436990) (not b!1436983) (not b!1436980) (not b!1436991) (not b!1436988) (not b!1436987) (not b!1436985) (not b!1436977) (not b!1436978) (not b!1436984) (not b!1436982) (not b!1436989) (not b!1436975) (not start!124108) (not b!1436979))
(check-sat)
