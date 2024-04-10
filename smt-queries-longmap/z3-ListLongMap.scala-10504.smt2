; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123722 () Bool)

(assert start!123722)

(declare-fun b!1434113 () Bool)

(declare-fun res!967576 () Bool)

(declare-fun e!809434 () Bool)

(assert (=> b!1434113 (=> (not res!967576) (not e!809434))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1434113 (= res!967576 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434114 () Bool)

(declare-fun res!967577 () Bool)

(declare-fun e!809433 () Bool)

(assert (=> b!1434114 (=> (not res!967577) (not e!809433))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97580 0))(
  ( (array!97581 (arr!47094 (Array (_ BitVec 32) (_ BitVec 64))) (size!47644 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97580)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434114 (= res!967577 (and (= (size!47644 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47644 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47644 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434115 () Bool)

(declare-fun e!809431 () Bool)

(assert (=> b!1434115 (= e!809434 (not e!809431))))

(declare-fun res!967582 () Bool)

(assert (=> b!1434115 (=> res!967582 e!809431)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1434115 (= res!967582 (or (= (select (arr!47094 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47094 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47094 a!2831) index!585) (select (arr!47094 a!2831) j!81)) (= (select (store (arr!47094 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809435 () Bool)

(assert (=> b!1434115 e!809435))

(declare-fun res!967578 () Bool)

(assert (=> b!1434115 (=> (not res!967578) (not e!809435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97580 (_ BitVec 32)) Bool)

(assert (=> b!1434115 (= res!967578 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48492 0))(
  ( (Unit!48493) )
))
(declare-fun lt!631327 () Unit!48492)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48492)

(assert (=> b!1434115 (= lt!631327 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434116 () Bool)

(declare-fun res!967575 () Bool)

(assert (=> b!1434116 (=> (not res!967575) (not e!809433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434116 (= res!967575 (validKeyInArray!0 (select (arr!47094 a!2831) j!81)))))

(declare-fun b!1434118 () Bool)

(declare-fun res!967586 () Bool)

(assert (=> b!1434118 (=> (not res!967586) (not e!809433))))

(assert (=> b!1434118 (= res!967586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434119 () Bool)

(declare-datatypes ((SeekEntryResult!11373 0))(
  ( (MissingZero!11373 (index!47884 (_ BitVec 32))) (Found!11373 (index!47885 (_ BitVec 32))) (Intermediate!11373 (undefined!12185 Bool) (index!47886 (_ BitVec 32)) (x!129537 (_ BitVec 32))) (Undefined!11373) (MissingVacant!11373 (index!47887 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97580 (_ BitVec 32)) SeekEntryResult!11373)

(assert (=> b!1434119 (= e!809435 (= (seekEntryOrOpen!0 (select (arr!47094 a!2831) j!81) a!2831 mask!2608) (Found!11373 j!81)))))

(declare-fun b!1434120 () Bool)

(declare-fun res!967585 () Bool)

(assert (=> b!1434120 (=> (not res!967585) (not e!809433))))

(assert (=> b!1434120 (= res!967585 (validKeyInArray!0 (select (arr!47094 a!2831) i!982)))))

(declare-fun b!1434121 () Bool)

(assert (=> b!1434121 (= e!809431 true)))

(declare-fun lt!631331 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434121 (= lt!631331 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1434122 () Bool)

(declare-fun e!809432 () Bool)

(assert (=> b!1434122 (= e!809432 e!809434)))

(declare-fun res!967583 () Bool)

(assert (=> b!1434122 (=> (not res!967583) (not e!809434))))

(declare-fun lt!631329 () array!97580)

(declare-fun lt!631330 () (_ BitVec 64))

(declare-fun lt!631332 () SeekEntryResult!11373)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97580 (_ BitVec 32)) SeekEntryResult!11373)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434122 (= res!967583 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631330 mask!2608) lt!631330 lt!631329 mask!2608) lt!631332))))

(assert (=> b!1434122 (= lt!631332 (Intermediate!11373 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434122 (= lt!631330 (select (store (arr!47094 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434122 (= lt!631329 (array!97581 (store (arr!47094 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47644 a!2831)))))

(declare-fun b!1434117 () Bool)

(declare-fun res!967579 () Bool)

(assert (=> b!1434117 (=> (not res!967579) (not e!809434))))

(declare-fun lt!631328 () SeekEntryResult!11373)

(assert (=> b!1434117 (= res!967579 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47094 a!2831) j!81) a!2831 mask!2608) lt!631328))))

(declare-fun res!967581 () Bool)

(assert (=> start!123722 (=> (not res!967581) (not e!809433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123722 (= res!967581 (validMask!0 mask!2608))))

(assert (=> start!123722 e!809433))

(assert (=> start!123722 true))

(declare-fun array_inv!36122 (array!97580) Bool)

(assert (=> start!123722 (array_inv!36122 a!2831)))

(declare-fun b!1434123 () Bool)

(declare-fun res!967580 () Bool)

(assert (=> b!1434123 (=> (not res!967580) (not e!809433))))

(declare-datatypes ((List!33604 0))(
  ( (Nil!33601) (Cons!33600 (h!34929 (_ BitVec 64)) (t!48298 List!33604)) )
))
(declare-fun arrayNoDuplicates!0 (array!97580 (_ BitVec 32) List!33604) Bool)

(assert (=> b!1434123 (= res!967580 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33601))))

(declare-fun b!1434124 () Bool)

(declare-fun res!967587 () Bool)

(assert (=> b!1434124 (=> (not res!967587) (not e!809434))))

(assert (=> b!1434124 (= res!967587 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631330 lt!631329 mask!2608) lt!631332))))

(declare-fun b!1434125 () Bool)

(assert (=> b!1434125 (= e!809433 e!809432)))

(declare-fun res!967588 () Bool)

(assert (=> b!1434125 (=> (not res!967588) (not e!809432))))

(assert (=> b!1434125 (= res!967588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47094 a!2831) j!81) mask!2608) (select (arr!47094 a!2831) j!81) a!2831 mask!2608) lt!631328))))

(assert (=> b!1434125 (= lt!631328 (Intermediate!11373 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434126 () Bool)

(declare-fun res!967584 () Bool)

(assert (=> b!1434126 (=> (not res!967584) (not e!809433))))

(assert (=> b!1434126 (= res!967584 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47644 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47644 a!2831))))))

(assert (= (and start!123722 res!967581) b!1434114))

(assert (= (and b!1434114 res!967577) b!1434120))

(assert (= (and b!1434120 res!967585) b!1434116))

(assert (= (and b!1434116 res!967575) b!1434118))

(assert (= (and b!1434118 res!967586) b!1434123))

(assert (= (and b!1434123 res!967580) b!1434126))

(assert (= (and b!1434126 res!967584) b!1434125))

(assert (= (and b!1434125 res!967588) b!1434122))

(assert (= (and b!1434122 res!967583) b!1434117))

(assert (= (and b!1434117 res!967579) b!1434124))

(assert (= (and b!1434124 res!967587) b!1434113))

(assert (= (and b!1434113 res!967576) b!1434115))

(assert (= (and b!1434115 res!967578) b!1434119))

(assert (= (and b!1434115 (not res!967582)) b!1434121))

(declare-fun m!1323725 () Bool)

(assert (=> start!123722 m!1323725))

(declare-fun m!1323727 () Bool)

(assert (=> start!123722 m!1323727))

(declare-fun m!1323729 () Bool)

(assert (=> b!1434119 m!1323729))

(assert (=> b!1434119 m!1323729))

(declare-fun m!1323731 () Bool)

(assert (=> b!1434119 m!1323731))

(declare-fun m!1323733 () Bool)

(assert (=> b!1434121 m!1323733))

(assert (=> b!1434116 m!1323729))

(assert (=> b!1434116 m!1323729))

(declare-fun m!1323735 () Bool)

(assert (=> b!1434116 m!1323735))

(assert (=> b!1434125 m!1323729))

(assert (=> b!1434125 m!1323729))

(declare-fun m!1323737 () Bool)

(assert (=> b!1434125 m!1323737))

(assert (=> b!1434125 m!1323737))

(assert (=> b!1434125 m!1323729))

(declare-fun m!1323739 () Bool)

(assert (=> b!1434125 m!1323739))

(assert (=> b!1434117 m!1323729))

(assert (=> b!1434117 m!1323729))

(declare-fun m!1323741 () Bool)

(assert (=> b!1434117 m!1323741))

(declare-fun m!1323743 () Bool)

(assert (=> b!1434115 m!1323743))

(declare-fun m!1323745 () Bool)

(assert (=> b!1434115 m!1323745))

(declare-fun m!1323747 () Bool)

(assert (=> b!1434115 m!1323747))

(declare-fun m!1323749 () Bool)

(assert (=> b!1434115 m!1323749))

(assert (=> b!1434115 m!1323729))

(declare-fun m!1323751 () Bool)

(assert (=> b!1434115 m!1323751))

(declare-fun m!1323753 () Bool)

(assert (=> b!1434122 m!1323753))

(assert (=> b!1434122 m!1323753))

(declare-fun m!1323755 () Bool)

(assert (=> b!1434122 m!1323755))

(assert (=> b!1434122 m!1323743))

(declare-fun m!1323757 () Bool)

(assert (=> b!1434122 m!1323757))

(declare-fun m!1323759 () Bool)

(assert (=> b!1434118 m!1323759))

(declare-fun m!1323761 () Bool)

(assert (=> b!1434120 m!1323761))

(assert (=> b!1434120 m!1323761))

(declare-fun m!1323763 () Bool)

(assert (=> b!1434120 m!1323763))

(declare-fun m!1323765 () Bool)

(assert (=> b!1434123 m!1323765))

(declare-fun m!1323767 () Bool)

(assert (=> b!1434124 m!1323767))

(check-sat (not b!1434115) (not b!1434125) (not b!1434121) (not start!123722) (not b!1434123) (not b!1434120) (not b!1434124) (not b!1434116) (not b!1434117) (not b!1434122) (not b!1434119) (not b!1434118))
(check-sat)
