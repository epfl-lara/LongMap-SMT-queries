; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123242 () Bool)

(assert start!123242)

(declare-fun b!1428981 () Bool)

(declare-fun res!963615 () Bool)

(declare-fun e!806965 () Bool)

(assert (=> b!1428981 (=> (not res!963615) (not e!806965))))

(declare-datatypes ((SeekEntryResult!11292 0))(
  ( (MissingZero!11292 (index!47560 (_ BitVec 32))) (Found!11292 (index!47561 (_ BitVec 32))) (Intermediate!11292 (undefined!12104 Bool) (index!47562 (_ BitVec 32)) (x!129198 (_ BitVec 32))) (Undefined!11292) (MissingVacant!11292 (index!47563 (_ BitVec 32))) )
))
(declare-fun lt!629190 () SeekEntryResult!11292)

(declare-datatypes ((array!97403 0))(
  ( (array!97404 (arr!47013 (Array (_ BitVec 32) (_ BitVec 64))) (size!47563 (_ BitVec 32))) )
))
(declare-fun lt!629192 () array!97403)

(declare-fun lt!629193 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97403 (_ BitVec 32)) SeekEntryResult!11292)

(assert (=> b!1428981 (= res!963615 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629193 lt!629192 mask!2608) lt!629190))))

(declare-fun b!1428983 () Bool)

(declare-fun res!963614 () Bool)

(declare-fun e!806964 () Bool)

(assert (=> b!1428983 (=> (not res!963614) (not e!806964))))

(declare-fun a!2831 () array!97403)

(declare-datatypes ((List!33523 0))(
  ( (Nil!33520) (Cons!33519 (h!34833 (_ BitVec 64)) (t!48217 List!33523)) )
))
(declare-fun arrayNoDuplicates!0 (array!97403 (_ BitVec 32) List!33523) Bool)

(assert (=> b!1428983 (= res!963614 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33520))))

(declare-fun b!1428984 () Bool)

(declare-fun res!963617 () Bool)

(assert (=> b!1428984 (=> (not res!963617) (not e!806964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97403 (_ BitVec 32)) Bool)

(assert (=> b!1428984 (= res!963617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428985 () Bool)

(declare-fun res!963616 () Bool)

(assert (=> b!1428985 (=> (not res!963616) (not e!806964))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428985 (= res!963616 (and (= (size!47563 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47563 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47563 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428986 () Bool)

(declare-fun res!963620 () Bool)

(assert (=> b!1428986 (=> (not res!963620) (not e!806964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428986 (= res!963620 (validKeyInArray!0 (select (arr!47013 a!2831) j!81)))))

(declare-fun b!1428987 () Bool)

(declare-fun res!963613 () Bool)

(assert (=> b!1428987 (=> (not res!963613) (not e!806964))))

(assert (=> b!1428987 (= res!963613 (validKeyInArray!0 (select (arr!47013 a!2831) i!982)))))

(declare-fun b!1428988 () Bool)

(declare-fun e!806963 () Bool)

(assert (=> b!1428988 (= e!806963 e!806965)))

(declare-fun res!963621 () Bool)

(assert (=> b!1428988 (=> (not res!963621) (not e!806965))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428988 (= res!963621 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629193 mask!2608) lt!629193 lt!629192 mask!2608) lt!629190))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428988 (= lt!629190 (Intermediate!11292 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428988 (= lt!629193 (select (store (arr!47013 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428988 (= lt!629192 (array!97404 (store (arr!47013 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47563 a!2831)))))

(declare-fun b!1428982 () Bool)

(declare-fun e!806962 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97403 (_ BitVec 32)) SeekEntryResult!11292)

(assert (=> b!1428982 (= e!806962 (= (seekEntryOrOpen!0 (select (arr!47013 a!2831) j!81) a!2831 mask!2608) (Found!11292 j!81)))))

(declare-fun res!963619 () Bool)

(assert (=> start!123242 (=> (not res!963619) (not e!806964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123242 (= res!963619 (validMask!0 mask!2608))))

(assert (=> start!123242 e!806964))

(assert (=> start!123242 true))

(declare-fun array_inv!36041 (array!97403) Bool)

(assert (=> start!123242 (array_inv!36041 a!2831)))

(declare-fun b!1428989 () Bool)

(declare-fun res!963612 () Bool)

(assert (=> b!1428989 (=> (not res!963612) (not e!806964))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1428989 (= res!963612 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47563 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47563 a!2831))))))

(declare-fun b!1428990 () Bool)

(declare-fun res!963618 () Bool)

(assert (=> b!1428990 (=> (not res!963618) (not e!806965))))

(declare-fun lt!629189 () SeekEntryResult!11292)

(assert (=> b!1428990 (= res!963618 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47013 a!2831) j!81) a!2831 mask!2608) lt!629189))))

(declare-fun b!1428991 () Bool)

(assert (=> b!1428991 (= e!806964 e!806963)))

(declare-fun res!963622 () Bool)

(assert (=> b!1428991 (=> (not res!963622) (not e!806963))))

(assert (=> b!1428991 (= res!963622 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47013 a!2831) j!81) mask!2608) (select (arr!47013 a!2831) j!81) a!2831 mask!2608) lt!629189))))

(assert (=> b!1428991 (= lt!629189 (Intermediate!11292 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428992 () Bool)

(declare-fun res!963611 () Bool)

(assert (=> b!1428992 (=> (not res!963611) (not e!806965))))

(assert (=> b!1428992 (= res!963611 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428993 () Bool)

(assert (=> b!1428993 (= e!806965 (not true))))

(assert (=> b!1428993 e!806962))

(declare-fun res!963610 () Bool)

(assert (=> b!1428993 (=> (not res!963610) (not e!806962))))

(assert (=> b!1428993 (= res!963610 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48330 0))(
  ( (Unit!48331) )
))
(declare-fun lt!629191 () Unit!48330)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97403 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48330)

(assert (=> b!1428993 (= lt!629191 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123242 res!963619) b!1428985))

(assert (= (and b!1428985 res!963616) b!1428987))

(assert (= (and b!1428987 res!963613) b!1428986))

(assert (= (and b!1428986 res!963620) b!1428984))

(assert (= (and b!1428984 res!963617) b!1428983))

(assert (= (and b!1428983 res!963614) b!1428989))

(assert (= (and b!1428989 res!963612) b!1428991))

(assert (= (and b!1428991 res!963622) b!1428988))

(assert (= (and b!1428988 res!963621) b!1428990))

(assert (= (and b!1428990 res!963618) b!1428981))

(assert (= (and b!1428981 res!963615) b!1428992))

(assert (= (and b!1428992 res!963611) b!1428993))

(assert (= (and b!1428993 res!963610) b!1428982))

(declare-fun m!1319093 () Bool)

(assert (=> b!1428987 m!1319093))

(assert (=> b!1428987 m!1319093))

(declare-fun m!1319095 () Bool)

(assert (=> b!1428987 m!1319095))

(declare-fun m!1319097 () Bool)

(assert (=> b!1428991 m!1319097))

(assert (=> b!1428991 m!1319097))

(declare-fun m!1319099 () Bool)

(assert (=> b!1428991 m!1319099))

(assert (=> b!1428991 m!1319099))

(assert (=> b!1428991 m!1319097))

(declare-fun m!1319101 () Bool)

(assert (=> b!1428991 m!1319101))

(declare-fun m!1319103 () Bool)

(assert (=> b!1428981 m!1319103))

(assert (=> b!1428982 m!1319097))

(assert (=> b!1428982 m!1319097))

(declare-fun m!1319105 () Bool)

(assert (=> b!1428982 m!1319105))

(declare-fun m!1319107 () Bool)

(assert (=> start!123242 m!1319107))

(declare-fun m!1319109 () Bool)

(assert (=> start!123242 m!1319109))

(assert (=> b!1428986 m!1319097))

(assert (=> b!1428986 m!1319097))

(declare-fun m!1319111 () Bool)

(assert (=> b!1428986 m!1319111))

(assert (=> b!1428990 m!1319097))

(assert (=> b!1428990 m!1319097))

(declare-fun m!1319113 () Bool)

(assert (=> b!1428990 m!1319113))

(declare-fun m!1319115 () Bool)

(assert (=> b!1428993 m!1319115))

(declare-fun m!1319117 () Bool)

(assert (=> b!1428993 m!1319117))

(declare-fun m!1319119 () Bool)

(assert (=> b!1428984 m!1319119))

(declare-fun m!1319121 () Bool)

(assert (=> b!1428983 m!1319121))

(declare-fun m!1319123 () Bool)

(assert (=> b!1428988 m!1319123))

(assert (=> b!1428988 m!1319123))

(declare-fun m!1319125 () Bool)

(assert (=> b!1428988 m!1319125))

(declare-fun m!1319127 () Bool)

(assert (=> b!1428988 m!1319127))

(declare-fun m!1319129 () Bool)

(assert (=> b!1428988 m!1319129))

(check-sat (not b!1428986) (not b!1428991) (not b!1428987) (not b!1428990) (not b!1428984) (not b!1428983) (not b!1428981) (not b!1428993) (not b!1428988) (not b!1428982) (not start!123242))
(check-sat)
