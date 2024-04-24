; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122690 () Bool)

(assert start!122690)

(declare-fun b!1420286 () Bool)

(declare-fun res!955122 () Bool)

(declare-fun e!803729 () Bool)

(assert (=> b!1420286 (=> (not res!955122) (not e!803729))))

(declare-datatypes ((array!97016 0))(
  ( (array!97017 (arr!46825 (Array (_ BitVec 32) (_ BitVec 64))) (size!47376 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97016)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420286 (= res!955122 (validKeyInArray!0 (select (arr!46825 a!2831) j!81)))))

(declare-fun b!1420287 () Bool)

(declare-fun res!955128 () Bool)

(assert (=> b!1420287 (=> (not res!955128) (not e!803729))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420287 (= res!955128 (validKeyInArray!0 (select (arr!46825 a!2831) i!982)))))

(declare-fun b!1420288 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1420288 (= e!803729 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun lt!626132 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420288 (= lt!626132 (toIndex!0 (select (store (arr!46825 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1420289 () Bool)

(declare-fun res!955125 () Bool)

(assert (=> b!1420289 (=> (not res!955125) (not e!803729))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420289 (= res!955125 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47376 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47376 a!2831))))))

(declare-fun b!1420290 () Bool)

(declare-fun res!955124 () Bool)

(assert (=> b!1420290 (=> (not res!955124) (not e!803729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97016 (_ BitVec 32)) Bool)

(assert (=> b!1420290 (= res!955124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420291 () Bool)

(declare-fun res!955127 () Bool)

(assert (=> b!1420291 (=> (not res!955127) (not e!803729))))

(declare-datatypes ((List!33322 0))(
  ( (Nil!33319) (Cons!33318 (h!34625 (_ BitVec 64)) (t!48008 List!33322)) )
))
(declare-fun arrayNoDuplicates!0 (array!97016 (_ BitVec 32) List!33322) Bool)

(assert (=> b!1420291 (= res!955127 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33319))))

(declare-fun res!955126 () Bool)

(assert (=> start!122690 (=> (not res!955126) (not e!803729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122690 (= res!955126 (validMask!0 mask!2608))))

(assert (=> start!122690 e!803729))

(assert (=> start!122690 true))

(declare-fun array_inv!36106 (array!97016) Bool)

(assert (=> start!122690 (array_inv!36106 a!2831)))

(declare-fun b!1420292 () Bool)

(declare-fun res!955129 () Bool)

(assert (=> b!1420292 (=> (not res!955129) (not e!803729))))

(declare-datatypes ((SeekEntryResult!11012 0))(
  ( (MissingZero!11012 (index!46440 (_ BitVec 32))) (Found!11012 (index!46441 (_ BitVec 32))) (Intermediate!11012 (undefined!11824 Bool) (index!46442 (_ BitVec 32)) (x!128267 (_ BitVec 32))) (Undefined!11012) (MissingVacant!11012 (index!46443 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97016 (_ BitVec 32)) SeekEntryResult!11012)

(assert (=> b!1420292 (= res!955129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46825 a!2831) j!81) mask!2608) (select (arr!46825 a!2831) j!81) a!2831 mask!2608) (Intermediate!11012 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420293 () Bool)

(declare-fun res!955123 () Bool)

(assert (=> b!1420293 (=> (not res!955123) (not e!803729))))

(assert (=> b!1420293 (= res!955123 (and (= (size!47376 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47376 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47376 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122690 res!955126) b!1420293))

(assert (= (and b!1420293 res!955123) b!1420287))

(assert (= (and b!1420287 res!955128) b!1420286))

(assert (= (and b!1420286 res!955122) b!1420290))

(assert (= (and b!1420290 res!955124) b!1420291))

(assert (= (and b!1420291 res!955127) b!1420289))

(assert (= (and b!1420289 res!955125) b!1420292))

(assert (= (and b!1420292 res!955129) b!1420288))

(declare-fun m!1311021 () Bool)

(assert (=> b!1420287 m!1311021))

(assert (=> b!1420287 m!1311021))

(declare-fun m!1311023 () Bool)

(assert (=> b!1420287 m!1311023))

(declare-fun m!1311025 () Bool)

(assert (=> b!1420286 m!1311025))

(assert (=> b!1420286 m!1311025))

(declare-fun m!1311027 () Bool)

(assert (=> b!1420286 m!1311027))

(declare-fun m!1311029 () Bool)

(assert (=> b!1420288 m!1311029))

(declare-fun m!1311031 () Bool)

(assert (=> b!1420288 m!1311031))

(assert (=> b!1420288 m!1311031))

(declare-fun m!1311033 () Bool)

(assert (=> b!1420288 m!1311033))

(declare-fun m!1311035 () Bool)

(assert (=> start!122690 m!1311035))

(declare-fun m!1311037 () Bool)

(assert (=> start!122690 m!1311037))

(declare-fun m!1311039 () Bool)

(assert (=> b!1420291 m!1311039))

(assert (=> b!1420292 m!1311025))

(assert (=> b!1420292 m!1311025))

(declare-fun m!1311041 () Bool)

(assert (=> b!1420292 m!1311041))

(assert (=> b!1420292 m!1311041))

(assert (=> b!1420292 m!1311025))

(declare-fun m!1311043 () Bool)

(assert (=> b!1420292 m!1311043))

(declare-fun m!1311045 () Bool)

(assert (=> b!1420290 m!1311045))

(check-sat (not b!1420290) (not b!1420288) (not b!1420287) (not start!122690) (not b!1420286) (not b!1420291) (not b!1420292))
(check-sat)
