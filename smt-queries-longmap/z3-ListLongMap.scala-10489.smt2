; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123494 () Bool)

(assert start!123494)

(declare-fun b!1431395 () Bool)

(declare-fun res!965374 () Bool)

(declare-fun e!808134 () Bool)

(assert (=> b!1431395 (=> (not res!965374) (not e!808134))))

(declare-datatypes ((array!97431 0))(
  ( (array!97432 (arr!47023 (Array (_ BitVec 32) (_ BitVec 64))) (size!47575 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97431)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431395 (= res!965374 (validKeyInArray!0 (select (arr!47023 a!2831) i!982)))))

(declare-fun b!1431396 () Bool)

(declare-fun e!808129 () Bool)

(assert (=> b!1431396 (= e!808134 e!808129)))

(declare-fun res!965366 () Bool)

(assert (=> b!1431396 (=> (not res!965366) (not e!808129))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11329 0))(
  ( (MissingZero!11329 (index!47708 (_ BitVec 32))) (Found!11329 (index!47709 (_ BitVec 32))) (Intermediate!11329 (undefined!12141 Bool) (index!47710 (_ BitVec 32)) (x!129350 (_ BitVec 32))) (Undefined!11329) (MissingVacant!11329 (index!47711 (_ BitVec 32))) )
))
(declare-fun lt!629994 () SeekEntryResult!11329)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97431 (_ BitVec 32)) SeekEntryResult!11329)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431396 (= res!965366 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47023 a!2831) j!81) mask!2608) (select (arr!47023 a!2831) j!81) a!2831 mask!2608) lt!629994))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1431396 (= lt!629994 (Intermediate!11329 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431398 () Bool)

(declare-fun res!965376 () Bool)

(declare-fun e!808133 () Bool)

(assert (=> b!1431398 (=> (not res!965376) (not e!808133))))

(declare-fun lt!629993 () array!97431)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!629997 () SeekEntryResult!11329)

(declare-fun lt!629995 () (_ BitVec 64))

(assert (=> b!1431398 (= res!965376 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629995 lt!629993 mask!2608) lt!629997))))

(declare-fun b!1431399 () Bool)

(declare-fun e!808130 () Bool)

(assert (=> b!1431399 (= e!808133 (not e!808130))))

(declare-fun res!965377 () Bool)

(assert (=> b!1431399 (=> res!965377 e!808130)))

(assert (=> b!1431399 (= res!965377 (or (= (select (arr!47023 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47023 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47023 a!2831) index!585) (select (arr!47023 a!2831) j!81)) (= (select (store (arr!47023 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808131 () Bool)

(assert (=> b!1431399 e!808131))

(declare-fun res!965372 () Bool)

(assert (=> b!1431399 (=> (not res!965372) (not e!808131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97431 (_ BitVec 32)) Bool)

(assert (=> b!1431399 (= res!965372 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48243 0))(
  ( (Unit!48244) )
))
(declare-fun lt!629996 () Unit!48243)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48243)

(assert (=> b!1431399 (= lt!629996 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431400 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97431 (_ BitVec 32)) SeekEntryResult!11329)

(assert (=> b!1431400 (= e!808131 (= (seekEntryOrOpen!0 (select (arr!47023 a!2831) j!81) a!2831 mask!2608) (Found!11329 j!81)))))

(declare-fun b!1431401 () Bool)

(assert (=> b!1431401 (= e!808129 e!808133)))

(declare-fun res!965370 () Bool)

(assert (=> b!1431401 (=> (not res!965370) (not e!808133))))

(assert (=> b!1431401 (= res!965370 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629995 mask!2608) lt!629995 lt!629993 mask!2608) lt!629997))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431401 (= lt!629997 (Intermediate!11329 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431401 (= lt!629995 (select (store (arr!47023 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431401 (= lt!629993 (array!97432 (store (arr!47023 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47575 a!2831)))))

(declare-fun b!1431402 () Bool)

(declare-fun res!965371 () Bool)

(assert (=> b!1431402 (=> (not res!965371) (not e!808134))))

(assert (=> b!1431402 (= res!965371 (validKeyInArray!0 (select (arr!47023 a!2831) j!81)))))

(declare-fun b!1431403 () Bool)

(declare-fun res!965369 () Bool)

(assert (=> b!1431403 (=> (not res!965369) (not e!808134))))

(assert (=> b!1431403 (= res!965369 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47575 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47575 a!2831))))))

(declare-fun b!1431404 () Bool)

(declare-fun res!965364 () Bool)

(assert (=> b!1431404 (=> (not res!965364) (not e!808133))))

(assert (=> b!1431404 (= res!965364 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431405 () Bool)

(assert (=> b!1431405 (= e!808130 true)))

(declare-fun lt!629992 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431405 (= lt!629992 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1431397 () Bool)

(declare-fun res!965373 () Bool)

(assert (=> b!1431397 (=> (not res!965373) (not e!808134))))

(declare-datatypes ((List!33611 0))(
  ( (Nil!33608) (Cons!33607 (h!34930 (_ BitVec 64)) (t!48297 List!33611)) )
))
(declare-fun arrayNoDuplicates!0 (array!97431 (_ BitVec 32) List!33611) Bool)

(assert (=> b!1431397 (= res!965373 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33608))))

(declare-fun res!965367 () Bool)

(assert (=> start!123494 (=> (not res!965367) (not e!808134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123494 (= res!965367 (validMask!0 mask!2608))))

(assert (=> start!123494 e!808134))

(assert (=> start!123494 true))

(declare-fun array_inv!36256 (array!97431) Bool)

(assert (=> start!123494 (array_inv!36256 a!2831)))

(declare-fun b!1431406 () Bool)

(declare-fun res!965375 () Bool)

(assert (=> b!1431406 (=> (not res!965375) (not e!808133))))

(assert (=> b!1431406 (= res!965375 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47023 a!2831) j!81) a!2831 mask!2608) lt!629994))))

(declare-fun b!1431407 () Bool)

(declare-fun res!965365 () Bool)

(assert (=> b!1431407 (=> (not res!965365) (not e!808134))))

(assert (=> b!1431407 (= res!965365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431408 () Bool)

(declare-fun res!965368 () Bool)

(assert (=> b!1431408 (=> (not res!965368) (not e!808134))))

(assert (=> b!1431408 (= res!965368 (and (= (size!47575 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47575 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47575 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123494 res!965367) b!1431408))

(assert (= (and b!1431408 res!965368) b!1431395))

(assert (= (and b!1431395 res!965374) b!1431402))

(assert (= (and b!1431402 res!965371) b!1431407))

(assert (= (and b!1431407 res!965365) b!1431397))

(assert (= (and b!1431397 res!965373) b!1431403))

(assert (= (and b!1431403 res!965369) b!1431396))

(assert (= (and b!1431396 res!965366) b!1431401))

(assert (= (and b!1431401 res!965370) b!1431406))

(assert (= (and b!1431406 res!965375) b!1431398))

(assert (= (and b!1431398 res!965376) b!1431404))

(assert (= (and b!1431404 res!965364) b!1431399))

(assert (= (and b!1431399 res!965372) b!1431400))

(assert (= (and b!1431399 (not res!965377)) b!1431405))

(declare-fun m!1320677 () Bool)

(assert (=> b!1431395 m!1320677))

(assert (=> b!1431395 m!1320677))

(declare-fun m!1320679 () Bool)

(assert (=> b!1431395 m!1320679))

(declare-fun m!1320681 () Bool)

(assert (=> b!1431400 m!1320681))

(assert (=> b!1431400 m!1320681))

(declare-fun m!1320683 () Bool)

(assert (=> b!1431400 m!1320683))

(declare-fun m!1320685 () Bool)

(assert (=> b!1431397 m!1320685))

(declare-fun m!1320687 () Bool)

(assert (=> b!1431398 m!1320687))

(assert (=> b!1431406 m!1320681))

(assert (=> b!1431406 m!1320681))

(declare-fun m!1320689 () Bool)

(assert (=> b!1431406 m!1320689))

(declare-fun m!1320691 () Bool)

(assert (=> b!1431401 m!1320691))

(assert (=> b!1431401 m!1320691))

(declare-fun m!1320693 () Bool)

(assert (=> b!1431401 m!1320693))

(declare-fun m!1320695 () Bool)

(assert (=> b!1431401 m!1320695))

(declare-fun m!1320697 () Bool)

(assert (=> b!1431401 m!1320697))

(assert (=> b!1431396 m!1320681))

(assert (=> b!1431396 m!1320681))

(declare-fun m!1320699 () Bool)

(assert (=> b!1431396 m!1320699))

(assert (=> b!1431396 m!1320699))

(assert (=> b!1431396 m!1320681))

(declare-fun m!1320701 () Bool)

(assert (=> b!1431396 m!1320701))

(assert (=> b!1431399 m!1320695))

(declare-fun m!1320703 () Bool)

(assert (=> b!1431399 m!1320703))

(declare-fun m!1320705 () Bool)

(assert (=> b!1431399 m!1320705))

(declare-fun m!1320707 () Bool)

(assert (=> b!1431399 m!1320707))

(assert (=> b!1431399 m!1320681))

(declare-fun m!1320709 () Bool)

(assert (=> b!1431399 m!1320709))

(declare-fun m!1320711 () Bool)

(assert (=> start!123494 m!1320711))

(declare-fun m!1320713 () Bool)

(assert (=> start!123494 m!1320713))

(assert (=> b!1431402 m!1320681))

(assert (=> b!1431402 m!1320681))

(declare-fun m!1320715 () Bool)

(assert (=> b!1431402 m!1320715))

(declare-fun m!1320717 () Bool)

(assert (=> b!1431405 m!1320717))

(declare-fun m!1320719 () Bool)

(assert (=> b!1431407 m!1320719))

(check-sat (not b!1431402) (not b!1431401) (not b!1431395) (not start!123494) (not b!1431400) (not b!1431406) (not b!1431407) (not b!1431397) (not b!1431399) (not b!1431405) (not b!1431398) (not b!1431396))
(check-sat)
