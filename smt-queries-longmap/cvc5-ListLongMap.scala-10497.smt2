; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123558 () Bool)

(assert start!123558)

(declare-fun b!1432571 () Bool)

(declare-fun res!966436 () Bool)

(declare-fun e!808659 () Bool)

(assert (=> b!1432571 (=> (not res!966436) (not e!808659))))

(declare-datatypes ((array!97530 0))(
  ( (array!97531 (arr!47072 (Array (_ BitVec 32) (_ BitVec 64))) (size!47622 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97530)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432571 (= res!966436 (validKeyInArray!0 (select (arr!47072 a!2831) j!81)))))

(declare-fun b!1432572 () Bool)

(declare-fun e!808661 () Bool)

(declare-fun e!808658 () Bool)

(assert (=> b!1432572 (= e!808661 (not e!808658))))

(declare-fun res!966435 () Bool)

(assert (=> b!1432572 (=> res!966435 e!808658)))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432572 (= res!966435 (or (= (select (arr!47072 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47072 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47072 a!2831) index!585) (select (arr!47072 a!2831) j!81)) (= (select (store (arr!47072 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808660 () Bool)

(assert (=> b!1432572 e!808660))

(declare-fun res!966444 () Bool)

(assert (=> b!1432572 (=> (not res!966444) (not e!808660))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97530 (_ BitVec 32)) Bool)

(assert (=> b!1432572 (= res!966444 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48448 0))(
  ( (Unit!48449) )
))
(declare-fun lt!630649 () Unit!48448)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48448)

(assert (=> b!1432572 (= lt!630649 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432573 () Bool)

(declare-fun res!966438 () Bool)

(assert (=> b!1432573 (=> (not res!966438) (not e!808661))))

(declare-datatypes ((SeekEntryResult!11351 0))(
  ( (MissingZero!11351 (index!47796 (_ BitVec 32))) (Found!11351 (index!47797 (_ BitVec 32))) (Intermediate!11351 (undefined!12163 Bool) (index!47798 (_ BitVec 32)) (x!129441 (_ BitVec 32))) (Undefined!11351) (MissingVacant!11351 (index!47799 (_ BitVec 32))) )
))
(declare-fun lt!630654 () SeekEntryResult!11351)

(declare-fun lt!630650 () array!97530)

(declare-fun lt!630652 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97530 (_ BitVec 32)) SeekEntryResult!11351)

(assert (=> b!1432573 (= res!966438 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630652 lt!630650 mask!2608) lt!630654))))

(declare-fun b!1432574 () Bool)

(declare-fun res!966441 () Bool)

(assert (=> b!1432574 (=> (not res!966441) (not e!808659))))

(assert (=> b!1432574 (= res!966441 (and (= (size!47622 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47622 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47622 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432575 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97530 (_ BitVec 32)) SeekEntryResult!11351)

(assert (=> b!1432575 (= e!808660 (= (seekEntryOrOpen!0 (select (arr!47072 a!2831) j!81) a!2831 mask!2608) (Found!11351 j!81)))))

(declare-fun b!1432576 () Bool)

(declare-fun res!966443 () Bool)

(assert (=> b!1432576 (=> (not res!966443) (not e!808659))))

(assert (=> b!1432576 (= res!966443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!966448 () Bool)

(assert (=> start!123558 (=> (not res!966448) (not e!808659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123558 (= res!966448 (validMask!0 mask!2608))))

(assert (=> start!123558 e!808659))

(assert (=> start!123558 true))

(declare-fun array_inv!36100 (array!97530) Bool)

(assert (=> start!123558 (array_inv!36100 a!2831)))

(declare-fun b!1432577 () Bool)

(assert (=> b!1432577 (= e!808658 true)))

(declare-fun lt!630653 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432577 (= lt!630653 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432578 () Bool)

(declare-fun res!966440 () Bool)

(assert (=> b!1432578 (=> (not res!966440) (not e!808661))))

(declare-fun lt!630651 () SeekEntryResult!11351)

(assert (=> b!1432578 (= res!966440 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47072 a!2831) j!81) a!2831 mask!2608) lt!630651))))

(declare-fun b!1432579 () Bool)

(declare-fun res!966445 () Bool)

(assert (=> b!1432579 (=> (not res!966445) (not e!808661))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432579 (= res!966445 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432580 () Bool)

(declare-fun res!966439 () Bool)

(assert (=> b!1432580 (=> (not res!966439) (not e!808659))))

(assert (=> b!1432580 (= res!966439 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47622 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47622 a!2831))))))

(declare-fun b!1432581 () Bool)

(declare-fun e!808656 () Bool)

(assert (=> b!1432581 (= e!808656 e!808661)))

(declare-fun res!966437 () Bool)

(assert (=> b!1432581 (=> (not res!966437) (not e!808661))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432581 (= res!966437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630652 mask!2608) lt!630652 lt!630650 mask!2608) lt!630654))))

(assert (=> b!1432581 (= lt!630654 (Intermediate!11351 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432581 (= lt!630652 (select (store (arr!47072 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432581 (= lt!630650 (array!97531 (store (arr!47072 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47622 a!2831)))))

(declare-fun b!1432582 () Bool)

(declare-fun res!966442 () Bool)

(assert (=> b!1432582 (=> (not res!966442) (not e!808659))))

(assert (=> b!1432582 (= res!966442 (validKeyInArray!0 (select (arr!47072 a!2831) i!982)))))

(declare-fun b!1432583 () Bool)

(assert (=> b!1432583 (= e!808659 e!808656)))

(declare-fun res!966447 () Bool)

(assert (=> b!1432583 (=> (not res!966447) (not e!808656))))

(assert (=> b!1432583 (= res!966447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47072 a!2831) j!81) mask!2608) (select (arr!47072 a!2831) j!81) a!2831 mask!2608) lt!630651))))

(assert (=> b!1432583 (= lt!630651 (Intermediate!11351 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432584 () Bool)

(declare-fun res!966446 () Bool)

(assert (=> b!1432584 (=> (not res!966446) (not e!808659))))

(declare-datatypes ((List!33582 0))(
  ( (Nil!33579) (Cons!33578 (h!34901 (_ BitVec 64)) (t!48276 List!33582)) )
))
(declare-fun arrayNoDuplicates!0 (array!97530 (_ BitVec 32) List!33582) Bool)

(assert (=> b!1432584 (= res!966446 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33579))))

(assert (= (and start!123558 res!966448) b!1432574))

(assert (= (and b!1432574 res!966441) b!1432582))

(assert (= (and b!1432582 res!966442) b!1432571))

(assert (= (and b!1432571 res!966436) b!1432576))

(assert (= (and b!1432576 res!966443) b!1432584))

(assert (= (and b!1432584 res!966446) b!1432580))

(assert (= (and b!1432580 res!966439) b!1432583))

(assert (= (and b!1432583 res!966447) b!1432581))

(assert (= (and b!1432581 res!966437) b!1432578))

(assert (= (and b!1432578 res!966440) b!1432573))

(assert (= (and b!1432573 res!966438) b!1432579))

(assert (= (and b!1432579 res!966445) b!1432572))

(assert (= (and b!1432572 res!966444) b!1432575))

(assert (= (and b!1432572 (not res!966435)) b!1432577))

(declare-fun m!1322385 () Bool)

(assert (=> b!1432573 m!1322385))

(declare-fun m!1322387 () Bool)

(assert (=> b!1432578 m!1322387))

(assert (=> b!1432578 m!1322387))

(declare-fun m!1322389 () Bool)

(assert (=> b!1432578 m!1322389))

(declare-fun m!1322391 () Bool)

(assert (=> b!1432584 m!1322391))

(declare-fun m!1322393 () Bool)

(assert (=> b!1432581 m!1322393))

(assert (=> b!1432581 m!1322393))

(declare-fun m!1322395 () Bool)

(assert (=> b!1432581 m!1322395))

(declare-fun m!1322397 () Bool)

(assert (=> b!1432581 m!1322397))

(declare-fun m!1322399 () Bool)

(assert (=> b!1432581 m!1322399))

(assert (=> b!1432571 m!1322387))

(assert (=> b!1432571 m!1322387))

(declare-fun m!1322401 () Bool)

(assert (=> b!1432571 m!1322401))

(declare-fun m!1322403 () Bool)

(assert (=> start!123558 m!1322403))

(declare-fun m!1322405 () Bool)

(assert (=> start!123558 m!1322405))

(declare-fun m!1322407 () Bool)

(assert (=> b!1432576 m!1322407))

(assert (=> b!1432583 m!1322387))

(assert (=> b!1432583 m!1322387))

(declare-fun m!1322409 () Bool)

(assert (=> b!1432583 m!1322409))

(assert (=> b!1432583 m!1322409))

(assert (=> b!1432583 m!1322387))

(declare-fun m!1322411 () Bool)

(assert (=> b!1432583 m!1322411))

(declare-fun m!1322413 () Bool)

(assert (=> b!1432577 m!1322413))

(declare-fun m!1322415 () Bool)

(assert (=> b!1432582 m!1322415))

(assert (=> b!1432582 m!1322415))

(declare-fun m!1322417 () Bool)

(assert (=> b!1432582 m!1322417))

(assert (=> b!1432575 m!1322387))

(assert (=> b!1432575 m!1322387))

(declare-fun m!1322419 () Bool)

(assert (=> b!1432575 m!1322419))

(assert (=> b!1432572 m!1322397))

(declare-fun m!1322421 () Bool)

(assert (=> b!1432572 m!1322421))

(declare-fun m!1322423 () Bool)

(assert (=> b!1432572 m!1322423))

(declare-fun m!1322425 () Bool)

(assert (=> b!1432572 m!1322425))

(assert (=> b!1432572 m!1322387))

(declare-fun m!1322427 () Bool)

(assert (=> b!1432572 m!1322427))

(push 1)

