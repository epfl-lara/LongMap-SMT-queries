; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122888 () Bool)

(assert start!122888)

(declare-fun b!1422681 () Bool)

(declare-fun e!804510 () Bool)

(assert (=> b!1422681 (= e!804510 (not true))))

(declare-fun e!804511 () Bool)

(assert (=> b!1422681 e!804511))

(declare-fun res!957441 () Bool)

(assert (=> b!1422681 (=> (not res!957441) (not e!804511))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97175 0))(
  ( (array!97176 (arr!46903 (Array (_ BitVec 32) (_ BitVec 64))) (size!47454 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97175)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97175 (_ BitVec 32)) Bool)

(assert (=> b!1422681 (= res!957441 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48047 0))(
  ( (Unit!48048) )
))
(declare-fun lt!626707 () Unit!48047)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97175 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48047)

(assert (=> b!1422681 (= lt!626707 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422682 () Bool)

(declare-fun res!957439 () Bool)

(declare-fun e!804512 () Bool)

(assert (=> b!1422682 (=> (not res!957439) (not e!804512))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422682 (= res!957439 (and (= (size!47454 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47454 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47454 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422683 () Bool)

(declare-fun res!957430 () Bool)

(assert (=> b!1422683 (=> (not res!957430) (not e!804510))))

(declare-datatypes ((SeekEntryResult!11090 0))(
  ( (MissingZero!11090 (index!46752 (_ BitVec 32))) (Found!11090 (index!46753 (_ BitVec 32))) (Intermediate!11090 (undefined!11902 Bool) (index!46754 (_ BitVec 32)) (x!128559 (_ BitVec 32))) (Undefined!11090) (MissingVacant!11090 (index!46755 (_ BitVec 32))) )
))
(declare-fun lt!626705 () SeekEntryResult!11090)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97175 (_ BitVec 32)) SeekEntryResult!11090)

(assert (=> b!1422683 (= res!957430 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46903 a!2831) j!81) a!2831 mask!2608) lt!626705))))

(declare-fun b!1422684 () Bool)

(declare-fun res!957438 () Bool)

(assert (=> b!1422684 (=> (not res!957438) (not e!804510))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422684 (= res!957438 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422685 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97175 (_ BitVec 32)) SeekEntryResult!11090)

(assert (=> b!1422685 (= e!804511 (= (seekEntryOrOpen!0 (select (arr!46903 a!2831) j!81) a!2831 mask!2608) (Found!11090 j!81)))))

(declare-fun b!1422686 () Bool)

(declare-fun e!804508 () Bool)

(assert (=> b!1422686 (= e!804512 e!804508)))

(declare-fun res!957440 () Bool)

(assert (=> b!1422686 (=> (not res!957440) (not e!804508))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422686 (= res!957440 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46903 a!2831) j!81) mask!2608) (select (arr!46903 a!2831) j!81) a!2831 mask!2608) lt!626705))))

(assert (=> b!1422686 (= lt!626705 (Intermediate!11090 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422688 () Bool)

(declare-fun res!957432 () Bool)

(assert (=> b!1422688 (=> (not res!957432) (not e!804512))))

(assert (=> b!1422688 (= res!957432 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47454 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47454 a!2831))))))

(declare-fun b!1422689 () Bool)

(declare-fun res!957431 () Bool)

(assert (=> b!1422689 (=> (not res!957431) (not e!804512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422689 (= res!957431 (validKeyInArray!0 (select (arr!46903 a!2831) j!81)))))

(declare-fun b!1422690 () Bool)

(declare-fun res!957436 () Bool)

(assert (=> b!1422690 (=> (not res!957436) (not e!804512))))

(assert (=> b!1422690 (= res!957436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422691 () Bool)

(declare-fun res!957442 () Bool)

(assert (=> b!1422691 (=> (not res!957442) (not e!804512))))

(assert (=> b!1422691 (= res!957442 (validKeyInArray!0 (select (arr!46903 a!2831) i!982)))))

(declare-fun b!1422692 () Bool)

(declare-fun res!957433 () Bool)

(assert (=> b!1422692 (=> (not res!957433) (not e!804512))))

(declare-datatypes ((List!33400 0))(
  ( (Nil!33397) (Cons!33396 (h!34706 (_ BitVec 64)) (t!48086 List!33400)) )
))
(declare-fun arrayNoDuplicates!0 (array!97175 (_ BitVec 32) List!33400) Bool)

(assert (=> b!1422692 (= res!957433 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33397))))

(declare-fun b!1422693 () Bool)

(assert (=> b!1422693 (= e!804508 e!804510)))

(declare-fun res!957437 () Bool)

(assert (=> b!1422693 (=> (not res!957437) (not e!804510))))

(declare-fun lt!626708 () array!97175)

(declare-fun lt!626704 () SeekEntryResult!11090)

(declare-fun lt!626706 () (_ BitVec 64))

(assert (=> b!1422693 (= res!957437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626706 mask!2608) lt!626706 lt!626708 mask!2608) lt!626704))))

(assert (=> b!1422693 (= lt!626704 (Intermediate!11090 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422693 (= lt!626706 (select (store (arr!46903 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422693 (= lt!626708 (array!97176 (store (arr!46903 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47454 a!2831)))))

(declare-fun res!957434 () Bool)

(assert (=> start!122888 (=> (not res!957434) (not e!804512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122888 (= res!957434 (validMask!0 mask!2608))))

(assert (=> start!122888 e!804512))

(assert (=> start!122888 true))

(declare-fun array_inv!36184 (array!97175) Bool)

(assert (=> start!122888 (array_inv!36184 a!2831)))

(declare-fun b!1422687 () Bool)

(declare-fun res!957435 () Bool)

(assert (=> b!1422687 (=> (not res!957435) (not e!804510))))

(assert (=> b!1422687 (= res!957435 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626706 lt!626708 mask!2608) lt!626704))))

(assert (= (and start!122888 res!957434) b!1422682))

(assert (= (and b!1422682 res!957439) b!1422691))

(assert (= (and b!1422691 res!957442) b!1422689))

(assert (= (and b!1422689 res!957431) b!1422690))

(assert (= (and b!1422690 res!957436) b!1422692))

(assert (= (and b!1422692 res!957433) b!1422688))

(assert (= (and b!1422688 res!957432) b!1422686))

(assert (= (and b!1422686 res!957440) b!1422693))

(assert (= (and b!1422693 res!957437) b!1422683))

(assert (= (and b!1422683 res!957430) b!1422687))

(assert (= (and b!1422687 res!957435) b!1422684))

(assert (= (and b!1422684 res!957438) b!1422681))

(assert (= (and b!1422681 res!957441) b!1422685))

(declare-fun m!1313451 () Bool)

(assert (=> start!122888 m!1313451))

(declare-fun m!1313453 () Bool)

(assert (=> start!122888 m!1313453))

(declare-fun m!1313455 () Bool)

(assert (=> b!1422690 m!1313455))

(declare-fun m!1313457 () Bool)

(assert (=> b!1422689 m!1313457))

(assert (=> b!1422689 m!1313457))

(declare-fun m!1313459 () Bool)

(assert (=> b!1422689 m!1313459))

(assert (=> b!1422685 m!1313457))

(assert (=> b!1422685 m!1313457))

(declare-fun m!1313461 () Bool)

(assert (=> b!1422685 m!1313461))

(declare-fun m!1313463 () Bool)

(assert (=> b!1422681 m!1313463))

(declare-fun m!1313465 () Bool)

(assert (=> b!1422681 m!1313465))

(declare-fun m!1313467 () Bool)

(assert (=> b!1422693 m!1313467))

(assert (=> b!1422693 m!1313467))

(declare-fun m!1313469 () Bool)

(assert (=> b!1422693 m!1313469))

(declare-fun m!1313471 () Bool)

(assert (=> b!1422693 m!1313471))

(declare-fun m!1313473 () Bool)

(assert (=> b!1422693 m!1313473))

(assert (=> b!1422683 m!1313457))

(assert (=> b!1422683 m!1313457))

(declare-fun m!1313475 () Bool)

(assert (=> b!1422683 m!1313475))

(assert (=> b!1422686 m!1313457))

(assert (=> b!1422686 m!1313457))

(declare-fun m!1313477 () Bool)

(assert (=> b!1422686 m!1313477))

(assert (=> b!1422686 m!1313477))

(assert (=> b!1422686 m!1313457))

(declare-fun m!1313479 () Bool)

(assert (=> b!1422686 m!1313479))

(declare-fun m!1313481 () Bool)

(assert (=> b!1422691 m!1313481))

(assert (=> b!1422691 m!1313481))

(declare-fun m!1313483 () Bool)

(assert (=> b!1422691 m!1313483))

(declare-fun m!1313485 () Bool)

(assert (=> b!1422687 m!1313485))

(declare-fun m!1313487 () Bool)

(assert (=> b!1422692 m!1313487))

(check-sat (not start!122888) (not b!1422690) (not b!1422685) (not b!1422693) (not b!1422683) (not b!1422692) (not b!1422681) (not b!1422689) (not b!1422691) (not b!1422687) (not b!1422686))
(check-sat)
