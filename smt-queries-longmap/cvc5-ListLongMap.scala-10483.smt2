; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123276 () Bool)

(assert start!123276)

(declare-fun b!1429644 () Bool)

(declare-fun res!964280 () Bool)

(declare-fun e!807218 () Bool)

(assert (=> b!1429644 (=> (not res!964280) (not e!807218))))

(declare-datatypes ((array!97437 0))(
  ( (array!97438 (arr!47030 (Array (_ BitVec 32) (_ BitVec 64))) (size!47580 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97437)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429644 (= res!964280 (validKeyInArray!0 (select (arr!47030 a!2831) i!982)))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun b!1429645 () Bool)

(declare-fun e!807217 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11309 0))(
  ( (MissingZero!11309 (index!47628 (_ BitVec 32))) (Found!11309 (index!47629 (_ BitVec 32))) (Intermediate!11309 (undefined!12121 Bool) (index!47630 (_ BitVec 32)) (x!129263 (_ BitVec 32))) (Undefined!11309) (MissingVacant!11309 (index!47631 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97437 (_ BitVec 32)) SeekEntryResult!11309)

(assert (=> b!1429645 (= e!807217 (= (seekEntryOrOpen!0 (select (arr!47030 a!2831) j!81) a!2831 mask!2608) (Found!11309 j!81)))))

(declare-fun b!1429646 () Bool)

(declare-fun res!964276 () Bool)

(assert (=> b!1429646 (=> (not res!964276) (not e!807218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97437 (_ BitVec 32)) Bool)

(assert (=> b!1429646 (= res!964276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429648 () Bool)

(declare-fun e!807221 () Bool)

(declare-fun e!807220 () Bool)

(assert (=> b!1429648 (= e!807221 e!807220)))

(declare-fun res!964275 () Bool)

(assert (=> b!1429648 (=> (not res!964275) (not e!807220))))

(declare-fun lt!629445 () array!97437)

(declare-fun lt!629448 () SeekEntryResult!11309)

(declare-fun lt!629444 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97437 (_ BitVec 32)) SeekEntryResult!11309)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429648 (= res!964275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629444 mask!2608) lt!629444 lt!629445 mask!2608) lt!629448))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429648 (= lt!629448 (Intermediate!11309 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429648 (= lt!629444 (select (store (arr!47030 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429648 (= lt!629445 (array!97438 (store (arr!47030 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47580 a!2831)))))

(declare-fun b!1429649 () Bool)

(declare-fun res!964284 () Bool)

(assert (=> b!1429649 (=> (not res!964284) (not e!807218))))

(assert (=> b!1429649 (= res!964284 (and (= (size!47580 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47580 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47580 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429650 () Bool)

(declare-fun res!964278 () Bool)

(assert (=> b!1429650 (=> (not res!964278) (not e!807220))))

(declare-fun lt!629447 () SeekEntryResult!11309)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429650 (= res!964278 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47030 a!2831) j!81) a!2831 mask!2608) lt!629447))))

(declare-fun b!1429651 () Bool)

(declare-fun res!964279 () Bool)

(assert (=> b!1429651 (=> (not res!964279) (not e!807218))))

(declare-datatypes ((List!33540 0))(
  ( (Nil!33537) (Cons!33536 (h!34850 (_ BitVec 64)) (t!48234 List!33540)) )
))
(declare-fun arrayNoDuplicates!0 (array!97437 (_ BitVec 32) List!33540) Bool)

(assert (=> b!1429651 (= res!964279 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33537))))

(declare-fun b!1429647 () Bool)

(assert (=> b!1429647 (= e!807218 e!807221)))

(declare-fun res!964273 () Bool)

(assert (=> b!1429647 (=> (not res!964273) (not e!807221))))

(assert (=> b!1429647 (= res!964273 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47030 a!2831) j!81) mask!2608) (select (arr!47030 a!2831) j!81) a!2831 mask!2608) lt!629447))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429647 (= lt!629447 (Intermediate!11309 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!964283 () Bool)

(assert (=> start!123276 (=> (not res!964283) (not e!807218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123276 (= res!964283 (validMask!0 mask!2608))))

(assert (=> start!123276 e!807218))

(assert (=> start!123276 true))

(declare-fun array_inv!36058 (array!97437) Bool)

(assert (=> start!123276 (array_inv!36058 a!2831)))

(declare-fun b!1429652 () Bool)

(declare-fun res!964274 () Bool)

(assert (=> b!1429652 (=> (not res!964274) (not e!807220))))

(assert (=> b!1429652 (= res!964274 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629444 lt!629445 mask!2608) lt!629448))))

(declare-fun b!1429653 () Bool)

(declare-fun res!964285 () Bool)

(assert (=> b!1429653 (=> (not res!964285) (not e!807218))))

(assert (=> b!1429653 (= res!964285 (validKeyInArray!0 (select (arr!47030 a!2831) j!81)))))

(declare-fun b!1429654 () Bool)

(declare-fun res!964277 () Bool)

(assert (=> b!1429654 (=> (not res!964277) (not e!807218))))

(assert (=> b!1429654 (= res!964277 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47580 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47580 a!2831))))))

(declare-fun b!1429655 () Bool)

(declare-fun res!964281 () Bool)

(assert (=> b!1429655 (=> (not res!964281) (not e!807220))))

(assert (=> b!1429655 (= res!964281 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429656 () Bool)

(assert (=> b!1429656 (= e!807220 (not true))))

(assert (=> b!1429656 e!807217))

(declare-fun res!964282 () Bool)

(assert (=> b!1429656 (=> (not res!964282) (not e!807217))))

(assert (=> b!1429656 (= res!964282 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48364 0))(
  ( (Unit!48365) )
))
(declare-fun lt!629446 () Unit!48364)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48364)

(assert (=> b!1429656 (= lt!629446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123276 res!964283) b!1429649))

(assert (= (and b!1429649 res!964284) b!1429644))

(assert (= (and b!1429644 res!964280) b!1429653))

(assert (= (and b!1429653 res!964285) b!1429646))

(assert (= (and b!1429646 res!964276) b!1429651))

(assert (= (and b!1429651 res!964279) b!1429654))

(assert (= (and b!1429654 res!964277) b!1429647))

(assert (= (and b!1429647 res!964273) b!1429648))

(assert (= (and b!1429648 res!964275) b!1429650))

(assert (= (and b!1429650 res!964278) b!1429652))

(assert (= (and b!1429652 res!964274) b!1429655))

(assert (= (and b!1429655 res!964281) b!1429656))

(assert (= (and b!1429656 res!964282) b!1429645))

(declare-fun m!1319739 () Bool)

(assert (=> b!1429656 m!1319739))

(declare-fun m!1319741 () Bool)

(assert (=> b!1429656 m!1319741))

(declare-fun m!1319743 () Bool)

(assert (=> b!1429652 m!1319743))

(declare-fun m!1319745 () Bool)

(assert (=> b!1429644 m!1319745))

(assert (=> b!1429644 m!1319745))

(declare-fun m!1319747 () Bool)

(assert (=> b!1429644 m!1319747))

(declare-fun m!1319749 () Bool)

(assert (=> b!1429646 m!1319749))

(declare-fun m!1319751 () Bool)

(assert (=> b!1429645 m!1319751))

(assert (=> b!1429645 m!1319751))

(declare-fun m!1319753 () Bool)

(assert (=> b!1429645 m!1319753))

(declare-fun m!1319755 () Bool)

(assert (=> start!123276 m!1319755))

(declare-fun m!1319757 () Bool)

(assert (=> start!123276 m!1319757))

(assert (=> b!1429647 m!1319751))

(assert (=> b!1429647 m!1319751))

(declare-fun m!1319759 () Bool)

(assert (=> b!1429647 m!1319759))

(assert (=> b!1429647 m!1319759))

(assert (=> b!1429647 m!1319751))

(declare-fun m!1319761 () Bool)

(assert (=> b!1429647 m!1319761))

(declare-fun m!1319763 () Bool)

(assert (=> b!1429648 m!1319763))

(assert (=> b!1429648 m!1319763))

(declare-fun m!1319765 () Bool)

(assert (=> b!1429648 m!1319765))

(declare-fun m!1319767 () Bool)

(assert (=> b!1429648 m!1319767))

(declare-fun m!1319769 () Bool)

(assert (=> b!1429648 m!1319769))

(declare-fun m!1319771 () Bool)

(assert (=> b!1429651 m!1319771))

(assert (=> b!1429653 m!1319751))

(assert (=> b!1429653 m!1319751))

(declare-fun m!1319773 () Bool)

(assert (=> b!1429653 m!1319773))

(assert (=> b!1429650 m!1319751))

(assert (=> b!1429650 m!1319751))

(declare-fun m!1319775 () Bool)

(assert (=> b!1429650 m!1319775))

(push 1)

