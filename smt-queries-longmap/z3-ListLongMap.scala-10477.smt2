; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123482 () Bool)

(assert start!123482)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97514 0))(
  ( (array!97515 (arr!47065 (Array (_ BitVec 32) (_ BitVec 64))) (size!47616 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97514)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun b!1430391 () Bool)

(declare-fun e!807878 () Bool)

(declare-datatypes ((SeekEntryResult!11246 0))(
  ( (MissingZero!11246 (index!47376 (_ BitVec 32))) (Found!11246 (index!47377 (_ BitVec 32))) (Intermediate!11246 (undefined!12058 Bool) (index!47378 (_ BitVec 32)) (x!129177 (_ BitVec 32))) (Undefined!11246) (MissingVacant!11246 (index!47379 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97514 (_ BitVec 32)) SeekEntryResult!11246)

(assert (=> b!1430391 (= e!807878 (= (seekEntryOrOpen!0 (select (arr!47065 a!2831) j!81) a!2831 mask!2608) (Found!11246 j!81)))))

(declare-fun b!1430392 () Bool)

(declare-fun e!807876 () Bool)

(declare-fun e!807877 () Bool)

(assert (=> b!1430392 (= e!807876 e!807877)))

(declare-fun res!964142 () Bool)

(assert (=> b!1430392 (=> (not res!964142) (not e!807877))))

(declare-fun lt!629705 () (_ BitVec 64))

(declare-fun lt!629707 () SeekEntryResult!11246)

(declare-fun lt!629708 () array!97514)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97514 (_ BitVec 32)) SeekEntryResult!11246)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430392 (= res!964142 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629705 mask!2608) lt!629705 lt!629708 mask!2608) lt!629707))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430392 (= lt!629707 (Intermediate!11246 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1430392 (= lt!629705 (select (store (arr!47065 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430392 (= lt!629708 (array!97515 (store (arr!47065 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47616 a!2831)))))

(declare-fun b!1430393 () Bool)

(declare-fun res!964138 () Bool)

(declare-fun e!807875 () Bool)

(assert (=> b!1430393 (=> (not res!964138) (not e!807875))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1430393 (= res!964138 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47616 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47616 a!2831))))))

(declare-fun b!1430394 () Bool)

(declare-fun res!964144 () Bool)

(assert (=> b!1430394 (=> (not res!964144) (not e!807875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97514 (_ BitVec 32)) Bool)

(assert (=> b!1430394 (= res!964144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430395 () Bool)

(declare-fun res!964139 () Bool)

(assert (=> b!1430395 (=> (not res!964139) (not e!807877))))

(assert (=> b!1430395 (= res!964139 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!964145 () Bool)

(assert (=> start!123482 (=> (not res!964145) (not e!807875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123482 (= res!964145 (validMask!0 mask!2608))))

(assert (=> start!123482 e!807875))

(assert (=> start!123482 true))

(declare-fun array_inv!36346 (array!97514) Bool)

(assert (=> start!123482 (array_inv!36346 a!2831)))

(declare-fun b!1430396 () Bool)

(declare-fun res!964146 () Bool)

(assert (=> b!1430396 (=> (not res!964146) (not e!807875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430396 (= res!964146 (validKeyInArray!0 (select (arr!47065 a!2831) i!982)))))

(declare-fun b!1430397 () Bool)

(declare-fun res!964136 () Bool)

(assert (=> b!1430397 (=> (not res!964136) (not e!807875))))

(assert (=> b!1430397 (= res!964136 (validKeyInArray!0 (select (arr!47065 a!2831) j!81)))))

(declare-fun b!1430398 () Bool)

(declare-fun res!964137 () Bool)

(assert (=> b!1430398 (=> (not res!964137) (not e!807875))))

(declare-datatypes ((List!33562 0))(
  ( (Nil!33559) (Cons!33558 (h!34883 (_ BitVec 64)) (t!48248 List!33562)) )
))
(declare-fun arrayNoDuplicates!0 (array!97514 (_ BitVec 32) List!33562) Bool)

(assert (=> b!1430398 (= res!964137 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33559))))

(declare-fun b!1430399 () Bool)

(declare-fun res!964140 () Bool)

(assert (=> b!1430399 (=> (not res!964140) (not e!807877))))

(assert (=> b!1430399 (= res!964140 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629705 lt!629708 mask!2608) lt!629707))))

(declare-fun b!1430400 () Bool)

(declare-fun res!964135 () Bool)

(assert (=> b!1430400 (=> (not res!964135) (not e!807877))))

(declare-fun lt!629706 () SeekEntryResult!11246)

(assert (=> b!1430400 (= res!964135 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47065 a!2831) j!81) a!2831 mask!2608) lt!629706))))

(declare-fun b!1430401 () Bool)

(assert (=> b!1430401 (= e!807877 (not true))))

(assert (=> b!1430401 e!807878))

(declare-fun res!964147 () Bool)

(assert (=> b!1430401 (=> (not res!964147) (not e!807878))))

(assert (=> b!1430401 (= res!964147 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48269 0))(
  ( (Unit!48270) )
))
(declare-fun lt!629704 () Unit!48269)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48269)

(assert (=> b!1430401 (= lt!629704 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430402 () Bool)

(assert (=> b!1430402 (= e!807875 e!807876)))

(declare-fun res!964141 () Bool)

(assert (=> b!1430402 (=> (not res!964141) (not e!807876))))

(assert (=> b!1430402 (= res!964141 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47065 a!2831) j!81) mask!2608) (select (arr!47065 a!2831) j!81) a!2831 mask!2608) lt!629706))))

(assert (=> b!1430402 (= lt!629706 (Intermediate!11246 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430403 () Bool)

(declare-fun res!964143 () Bool)

(assert (=> b!1430403 (=> (not res!964143) (not e!807875))))

(assert (=> b!1430403 (= res!964143 (and (= (size!47616 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47616 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47616 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123482 res!964145) b!1430403))

(assert (= (and b!1430403 res!964143) b!1430396))

(assert (= (and b!1430396 res!964146) b!1430397))

(assert (= (and b!1430397 res!964136) b!1430394))

(assert (= (and b!1430394 res!964144) b!1430398))

(assert (= (and b!1430398 res!964137) b!1430393))

(assert (= (and b!1430393 res!964138) b!1430402))

(assert (= (and b!1430402 res!964141) b!1430392))

(assert (= (and b!1430392 res!964142) b!1430400))

(assert (= (and b!1430400 res!964135) b!1430399))

(assert (= (and b!1430399 res!964140) b!1430395))

(assert (= (and b!1430395 res!964139) b!1430401))

(assert (= (and b!1430401 res!964147) b!1430391))

(declare-fun m!1320621 () Bool)

(assert (=> start!123482 m!1320621))

(declare-fun m!1320623 () Bool)

(assert (=> start!123482 m!1320623))

(declare-fun m!1320625 () Bool)

(assert (=> b!1430399 m!1320625))

(declare-fun m!1320627 () Bool)

(assert (=> b!1430400 m!1320627))

(assert (=> b!1430400 m!1320627))

(declare-fun m!1320629 () Bool)

(assert (=> b!1430400 m!1320629))

(declare-fun m!1320631 () Bool)

(assert (=> b!1430401 m!1320631))

(declare-fun m!1320633 () Bool)

(assert (=> b!1430401 m!1320633))

(declare-fun m!1320635 () Bool)

(assert (=> b!1430396 m!1320635))

(assert (=> b!1430396 m!1320635))

(declare-fun m!1320637 () Bool)

(assert (=> b!1430396 m!1320637))

(assert (=> b!1430397 m!1320627))

(assert (=> b!1430397 m!1320627))

(declare-fun m!1320639 () Bool)

(assert (=> b!1430397 m!1320639))

(declare-fun m!1320641 () Bool)

(assert (=> b!1430398 m!1320641))

(declare-fun m!1320643 () Bool)

(assert (=> b!1430394 m!1320643))

(assert (=> b!1430391 m!1320627))

(assert (=> b!1430391 m!1320627))

(declare-fun m!1320645 () Bool)

(assert (=> b!1430391 m!1320645))

(declare-fun m!1320647 () Bool)

(assert (=> b!1430392 m!1320647))

(assert (=> b!1430392 m!1320647))

(declare-fun m!1320649 () Bool)

(assert (=> b!1430392 m!1320649))

(declare-fun m!1320651 () Bool)

(assert (=> b!1430392 m!1320651))

(declare-fun m!1320653 () Bool)

(assert (=> b!1430392 m!1320653))

(assert (=> b!1430402 m!1320627))

(assert (=> b!1430402 m!1320627))

(declare-fun m!1320655 () Bool)

(assert (=> b!1430402 m!1320655))

(assert (=> b!1430402 m!1320655))

(assert (=> b!1430402 m!1320627))

(declare-fun m!1320657 () Bool)

(assert (=> b!1430402 m!1320657))

(check-sat (not b!1430399) (not b!1430391) (not b!1430401) (not b!1430397) (not b!1430396) (not start!123482) (not b!1430400) (not b!1430402) (not b!1430392) (not b!1430398) (not b!1430394))
(check-sat)
