; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122636 () Bool)

(assert start!122636)

(declare-fun b!1420498 () Bool)

(declare-fun res!955937 () Bool)

(declare-fun e!803401 () Bool)

(assert (=> b!1420498 (=> (not res!955937) (not e!803401))))

(declare-datatypes ((array!97001 0))(
  ( (array!97002 (arr!46818 (Array (_ BitVec 32) (_ BitVec 64))) (size!47368 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97001)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420498 (= res!955937 (validKeyInArray!0 (select (arr!46818 a!2831) j!81)))))

(declare-fun b!1420499 () Bool)

(declare-fun res!955935 () Bool)

(assert (=> b!1420499 (=> (not res!955935) (not e!803401))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11103 0))(
  ( (MissingZero!11103 (index!46804 (_ BitVec 32))) (Found!11103 (index!46805 (_ BitVec 32))) (Intermediate!11103 (undefined!11915 Bool) (index!46806 (_ BitVec 32)) (x!128465 (_ BitVec 32))) (Undefined!11103) (MissingVacant!11103 (index!46807 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97001 (_ BitVec 32)) SeekEntryResult!11103)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420499 (= res!955935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46818 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46818 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97002 (store (arr!46818 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47368 a!2831)) mask!2608) (Intermediate!11103 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420500 () Bool)

(declare-fun res!955939 () Bool)

(assert (=> b!1420500 (=> (not res!955939) (not e!803401))))

(assert (=> b!1420500 (= res!955939 (validKeyInArray!0 (select (arr!46818 a!2831) i!982)))))

(declare-fun b!1420501 () Bool)

(declare-fun res!955938 () Bool)

(assert (=> b!1420501 (=> (not res!955938) (not e!803401))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420501 (= res!955938 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47368 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47368 a!2831))))))

(declare-fun b!1420502 () Bool)

(declare-fun res!955933 () Bool)

(assert (=> b!1420502 (=> (not res!955933) (not e!803401))))

(declare-datatypes ((List!33328 0))(
  ( (Nil!33325) (Cons!33324 (h!34626 (_ BitVec 64)) (t!48022 List!33328)) )
))
(declare-fun arrayNoDuplicates!0 (array!97001 (_ BitVec 32) List!33328) Bool)

(assert (=> b!1420502 (= res!955933 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33325))))

(declare-fun b!1420503 () Bool)

(declare-fun res!955936 () Bool)

(assert (=> b!1420503 (=> (not res!955936) (not e!803401))))

(assert (=> b!1420503 (= res!955936 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46818 a!2831) j!81) mask!2608) (select (arr!46818 a!2831) j!81) a!2831 mask!2608) (Intermediate!11103 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420504 () Bool)

(assert (=> b!1420504 (= e!803401 false)))

(declare-fun lt!625923 () SeekEntryResult!11103)

(assert (=> b!1420504 (= lt!625923 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46818 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1420505 () Bool)

(declare-fun res!955932 () Bool)

(assert (=> b!1420505 (=> (not res!955932) (not e!803401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97001 (_ BitVec 32)) Bool)

(assert (=> b!1420505 (= res!955932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!955934 () Bool)

(assert (=> start!122636 (=> (not res!955934) (not e!803401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122636 (= res!955934 (validMask!0 mask!2608))))

(assert (=> start!122636 e!803401))

(assert (=> start!122636 true))

(declare-fun array_inv!35846 (array!97001) Bool)

(assert (=> start!122636 (array_inv!35846 a!2831)))

(declare-fun b!1420506 () Bool)

(declare-fun res!955931 () Bool)

(assert (=> b!1420506 (=> (not res!955931) (not e!803401))))

(assert (=> b!1420506 (= res!955931 (and (= (size!47368 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47368 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47368 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122636 res!955934) b!1420506))

(assert (= (and b!1420506 res!955931) b!1420500))

(assert (= (and b!1420500 res!955939) b!1420498))

(assert (= (and b!1420498 res!955937) b!1420505))

(assert (= (and b!1420505 res!955932) b!1420502))

(assert (= (and b!1420502 res!955933) b!1420501))

(assert (= (and b!1420501 res!955938) b!1420503))

(assert (= (and b!1420503 res!955936) b!1420499))

(assert (= (and b!1420499 res!955935) b!1420504))

(declare-fun m!1311015 () Bool)

(assert (=> b!1420502 m!1311015))

(declare-fun m!1311017 () Bool)

(assert (=> start!122636 m!1311017))

(declare-fun m!1311019 () Bool)

(assert (=> start!122636 m!1311019))

(declare-fun m!1311021 () Bool)

(assert (=> b!1420503 m!1311021))

(assert (=> b!1420503 m!1311021))

(declare-fun m!1311023 () Bool)

(assert (=> b!1420503 m!1311023))

(assert (=> b!1420503 m!1311023))

(assert (=> b!1420503 m!1311021))

(declare-fun m!1311025 () Bool)

(assert (=> b!1420503 m!1311025))

(assert (=> b!1420498 m!1311021))

(assert (=> b!1420498 m!1311021))

(declare-fun m!1311027 () Bool)

(assert (=> b!1420498 m!1311027))

(assert (=> b!1420504 m!1311021))

(assert (=> b!1420504 m!1311021))

(declare-fun m!1311029 () Bool)

(assert (=> b!1420504 m!1311029))

(declare-fun m!1311031 () Bool)

(assert (=> b!1420500 m!1311031))

(assert (=> b!1420500 m!1311031))

(declare-fun m!1311033 () Bool)

(assert (=> b!1420500 m!1311033))

(declare-fun m!1311035 () Bool)

(assert (=> b!1420505 m!1311035))

(declare-fun m!1311037 () Bool)

(assert (=> b!1420499 m!1311037))

(declare-fun m!1311039 () Bool)

(assert (=> b!1420499 m!1311039))

(assert (=> b!1420499 m!1311039))

(declare-fun m!1311041 () Bool)

(assert (=> b!1420499 m!1311041))

(assert (=> b!1420499 m!1311041))

(assert (=> b!1420499 m!1311039))

(declare-fun m!1311043 () Bool)

(assert (=> b!1420499 m!1311043))

(check-sat (not b!1420498) (not b!1420503) (not b!1420502) (not b!1420505) (not b!1420504) (not b!1420500) (not start!122636) (not b!1420499))
