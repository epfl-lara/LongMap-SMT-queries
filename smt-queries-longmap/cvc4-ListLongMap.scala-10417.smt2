; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122668 () Bool)

(assert start!122668)

(declare-fun b!1420983 () Bool)

(declare-fun res!956421 () Bool)

(declare-fun e!803579 () Bool)

(assert (=> b!1420983 (=> (not res!956421) (not e!803579))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97033 0))(
  ( (array!97034 (arr!46834 (Array (_ BitVec 32) (_ BitVec 64))) (size!47384 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97033)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420983 (= res!956421 (and (= (size!47384 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47384 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47384 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420984 () Bool)

(declare-fun res!956422 () Bool)

(declare-fun e!803576 () Bool)

(assert (=> b!1420984 (=> (not res!956422) (not e!803576))))

(declare-datatypes ((SeekEntryResult!11119 0))(
  ( (MissingZero!11119 (index!46868 (_ BitVec 32))) (Found!11119 (index!46869 (_ BitVec 32))) (Intermediate!11119 (undefined!11931 Bool) (index!46870 (_ BitVec 32)) (x!128521 (_ BitVec 32))) (Undefined!11119) (MissingVacant!11119 (index!46871 (_ BitVec 32))) )
))
(declare-fun lt!626078 () SeekEntryResult!11119)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97033 (_ BitVec 32)) SeekEntryResult!11119)

(assert (=> b!1420984 (= res!956422 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46834 a!2831) j!81) a!2831 mask!2608) lt!626078))))

(declare-fun b!1420985 () Bool)

(declare-fun res!956425 () Bool)

(assert (=> b!1420985 (=> (not res!956425) (not e!803579))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1420985 (= res!956425 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47384 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47384 a!2831))))))

(declare-fun b!1420986 () Bool)

(declare-fun res!956424 () Bool)

(assert (=> b!1420986 (=> (not res!956424) (not e!803579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420986 (= res!956424 (validKeyInArray!0 (select (arr!46834 a!2831) i!982)))))

(declare-fun b!1420987 () Bool)

(declare-fun res!956418 () Bool)

(assert (=> b!1420987 (=> (not res!956418) (not e!803579))))

(assert (=> b!1420987 (= res!956418 (validKeyInArray!0 (select (arr!46834 a!2831) j!81)))))

(declare-fun b!1420988 () Bool)

(declare-fun e!803577 () Bool)

(assert (=> b!1420988 (= e!803577 e!803576)))

(declare-fun res!956419 () Bool)

(assert (=> b!1420988 (=> (not res!956419) (not e!803576))))

(declare-fun lt!626077 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!626079 () array!97033)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420988 (= res!956419 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626077 mask!2608) lt!626077 lt!626079 mask!2608) (Intermediate!11119 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1420988 (= lt!626077 (select (store (arr!46834 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420988 (= lt!626079 (array!97034 (store (arr!46834 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47384 a!2831)))))

(declare-fun b!1420990 () Bool)

(declare-fun res!956423 () Bool)

(assert (=> b!1420990 (=> (not res!956423) (not e!803579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97033 (_ BitVec 32)) Bool)

(assert (=> b!1420990 (= res!956423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420991 () Bool)

(declare-fun res!956416 () Bool)

(assert (=> b!1420991 (=> (not res!956416) (not e!803579))))

(declare-datatypes ((List!33344 0))(
  ( (Nil!33341) (Cons!33340 (h!34642 (_ BitVec 64)) (t!48038 List!33344)) )
))
(declare-fun arrayNoDuplicates!0 (array!97033 (_ BitVec 32) List!33344) Bool)

(assert (=> b!1420991 (= res!956416 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33341))))

(declare-fun b!1420992 () Bool)

(assert (=> b!1420992 (= e!803576 false)))

(declare-fun lt!626076 () SeekEntryResult!11119)

(assert (=> b!1420992 (= lt!626076 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626077 lt!626079 mask!2608))))

(declare-fun res!956417 () Bool)

(assert (=> start!122668 (=> (not res!956417) (not e!803579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122668 (= res!956417 (validMask!0 mask!2608))))

(assert (=> start!122668 e!803579))

(assert (=> start!122668 true))

(declare-fun array_inv!35862 (array!97033) Bool)

(assert (=> start!122668 (array_inv!35862 a!2831)))

(declare-fun b!1420989 () Bool)

(assert (=> b!1420989 (= e!803579 e!803577)))

(declare-fun res!956420 () Bool)

(assert (=> b!1420989 (=> (not res!956420) (not e!803577))))

(assert (=> b!1420989 (= res!956420 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46834 a!2831) j!81) mask!2608) (select (arr!46834 a!2831) j!81) a!2831 mask!2608) lt!626078))))

(assert (=> b!1420989 (= lt!626078 (Intermediate!11119 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122668 res!956417) b!1420983))

(assert (= (and b!1420983 res!956421) b!1420986))

(assert (= (and b!1420986 res!956424) b!1420987))

(assert (= (and b!1420987 res!956418) b!1420990))

(assert (= (and b!1420990 res!956423) b!1420991))

(assert (= (and b!1420991 res!956416) b!1420985))

(assert (= (and b!1420985 res!956425) b!1420989))

(assert (= (and b!1420989 res!956420) b!1420988))

(assert (= (and b!1420988 res!956419) b!1420984))

(assert (= (and b!1420984 res!956422) b!1420992))

(declare-fun m!1311523 () Bool)

(assert (=> b!1420989 m!1311523))

(assert (=> b!1420989 m!1311523))

(declare-fun m!1311525 () Bool)

(assert (=> b!1420989 m!1311525))

(assert (=> b!1420989 m!1311525))

(assert (=> b!1420989 m!1311523))

(declare-fun m!1311527 () Bool)

(assert (=> b!1420989 m!1311527))

(declare-fun m!1311529 () Bool)

(assert (=> b!1420991 m!1311529))

(assert (=> b!1420987 m!1311523))

(assert (=> b!1420987 m!1311523))

(declare-fun m!1311531 () Bool)

(assert (=> b!1420987 m!1311531))

(declare-fun m!1311533 () Bool)

(assert (=> b!1420990 m!1311533))

(declare-fun m!1311535 () Bool)

(assert (=> start!122668 m!1311535))

(declare-fun m!1311537 () Bool)

(assert (=> start!122668 m!1311537))

(declare-fun m!1311539 () Bool)

(assert (=> b!1420986 m!1311539))

(assert (=> b!1420986 m!1311539))

(declare-fun m!1311541 () Bool)

(assert (=> b!1420986 m!1311541))

(assert (=> b!1420984 m!1311523))

(assert (=> b!1420984 m!1311523))

(declare-fun m!1311543 () Bool)

(assert (=> b!1420984 m!1311543))

(declare-fun m!1311545 () Bool)

(assert (=> b!1420992 m!1311545))

(declare-fun m!1311547 () Bool)

(assert (=> b!1420988 m!1311547))

(assert (=> b!1420988 m!1311547))

(declare-fun m!1311549 () Bool)

(assert (=> b!1420988 m!1311549))

(declare-fun m!1311551 () Bool)

(assert (=> b!1420988 m!1311551))

(declare-fun m!1311553 () Bool)

(assert (=> b!1420988 m!1311553))

(push 1)

(assert (not b!1420990))

(assert (not b!1420986))

(assert (not b!1420989))

(assert (not b!1420987))

(assert (not b!1420992))

(assert (not b!1420988))

(assert (not b!1420991))

(assert (not start!122668))

(assert (not b!1420984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

