; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124834 () Bool)

(assert start!124834)

(declare-fun b!1448997 () Bool)

(declare-fun res!980491 () Bool)

(declare-fun e!816010 () Bool)

(assert (=> b!1448997 (=> (not res!980491) (not e!816010))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11681 0))(
  ( (MissingZero!11681 (index!49116 (_ BitVec 32))) (Found!11681 (index!49117 (_ BitVec 32))) (Intermediate!11681 (undefined!12493 Bool) (index!49118 (_ BitVec 32)) (x!130786 (_ BitVec 32))) (Undefined!11681) (MissingVacant!11681 (index!49119 (_ BitVec 32))) )
))
(declare-fun lt!635738 () SeekEntryResult!11681)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98282 0))(
  ( (array!98283 (arr!47429 (Array (_ BitVec 32) (_ BitVec 64))) (size!47979 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98282)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98282 (_ BitVec 32)) SeekEntryResult!11681)

(assert (=> b!1448997 (= res!980491 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47429 a!2862) j!93) a!2862 mask!2687) lt!635738))))

(declare-fun b!1448998 () Bool)

(declare-fun e!816008 () Bool)

(declare-fun e!816009 () Bool)

(assert (=> b!1448998 (= e!816008 e!816009)))

(declare-fun res!980498 () Bool)

(assert (=> b!1448998 (=> (not res!980498) (not e!816009))))

(declare-fun lt!635736 () SeekEntryResult!11681)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98282 (_ BitVec 32)) SeekEntryResult!11681)

(assert (=> b!1448998 (= res!980498 (= lt!635736 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47429 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448999 () Bool)

(declare-fun res!980500 () Bool)

(declare-fun e!816006 () Bool)

(assert (=> b!1448999 (=> (not res!980500) (not e!816006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448999 (= res!980500 (validKeyInArray!0 (select (arr!47429 a!2862) j!93)))))

(declare-fun b!1449000 () Bool)

(declare-fun res!980492 () Bool)

(declare-fun e!816014 () Bool)

(assert (=> b!1449000 (=> (not res!980492) (not e!816014))))

(declare-fun e!816013 () Bool)

(assert (=> b!1449000 (= res!980492 e!816013)))

(declare-fun c!133767 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449000 (= c!133767 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449001 () Bool)

(declare-fun e!816005 () Bool)

(assert (=> b!1449001 (= e!816005 true)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!635742 () SeekEntryResult!11681)

(assert (=> b!1449001 (= lt!635742 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47429 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449002 () Bool)

(declare-fun res!980497 () Bool)

(assert (=> b!1449002 (=> (not res!980497) (not e!816006))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1449002 (= res!980497 (and (= (size!47979 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47979 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47979 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449003 () Bool)

(declare-fun e!816011 () Bool)

(assert (=> b!1449003 (= e!816011 e!816008)))

(declare-fun res!980484 () Bool)

(assert (=> b!1449003 (=> res!980484 e!816008)))

(assert (=> b!1449003 (= res!980484 (or (and (= (select (arr!47429 a!2862) index!646) (select (store (arr!47429 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47429 a!2862) index!646) (select (arr!47429 a!2862) j!93))) (not (= (select (arr!47429 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449004 () Bool)

(declare-fun res!980495 () Bool)

(assert (=> b!1449004 (=> (not res!980495) (not e!816014))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449004 (= res!980495 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449006 () Bool)

(declare-fun lt!635737 () (_ BitVec 64))

(declare-fun lt!635739 () SeekEntryResult!11681)

(declare-fun lt!635740 () array!98282)

(assert (=> b!1449006 (= e!816013 (= lt!635739 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635737 lt!635740 mask!2687)))))

(declare-fun b!1449007 () Bool)

(declare-fun res!980486 () Bool)

(assert (=> b!1449007 (=> (not res!980486) (not e!816006))))

(assert (=> b!1449007 (= res!980486 (validKeyInArray!0 (select (arr!47429 a!2862) i!1006)))))

(declare-fun b!1449008 () Bool)

(declare-fun e!816007 () Bool)

(assert (=> b!1449008 (= e!816006 e!816007)))

(declare-fun res!980490 () Bool)

(assert (=> b!1449008 (=> (not res!980490) (not e!816007))))

(assert (=> b!1449008 (= res!980490 (= (select (store (arr!47429 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449008 (= lt!635740 (array!98283 (store (arr!47429 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47979 a!2862)))))

(declare-fun b!1449009 () Bool)

(declare-fun res!980496 () Bool)

(assert (=> b!1449009 (=> (not res!980496) (not e!816006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98282 (_ BitVec 32)) Bool)

(assert (=> b!1449009 (= res!980496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449010 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98282 (_ BitVec 32)) SeekEntryResult!11681)

(assert (=> b!1449010 (= e!816013 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635737 lt!635740 mask!2687) (seekEntryOrOpen!0 lt!635737 lt!635740 mask!2687)))))

(declare-fun b!1449011 () Bool)

(declare-fun res!980487 () Bool)

(assert (=> b!1449011 (=> (not res!980487) (not e!816006))))

(assert (=> b!1449011 (= res!980487 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47979 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47979 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47979 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449012 () Bool)

(assert (=> b!1449012 (= e!816009 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun res!980485 () Bool)

(assert (=> start!124834 (=> (not res!980485) (not e!816006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124834 (= res!980485 (validMask!0 mask!2687))))

(assert (=> start!124834 e!816006))

(assert (=> start!124834 true))

(declare-fun array_inv!36457 (array!98282) Bool)

(assert (=> start!124834 (array_inv!36457 a!2862)))

(declare-fun b!1449005 () Bool)

(assert (=> b!1449005 (= e!816007 e!816010)))

(declare-fun res!980493 () Bool)

(assert (=> b!1449005 (=> (not res!980493) (not e!816010))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449005 (= res!980493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47429 a!2862) j!93) mask!2687) (select (arr!47429 a!2862) j!93) a!2862 mask!2687) lt!635738))))

(assert (=> b!1449005 (= lt!635738 (Intermediate!11681 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449013 () Bool)

(assert (=> b!1449013 (= e!816010 e!816014)))

(declare-fun res!980488 () Bool)

(assert (=> b!1449013 (=> (not res!980488) (not e!816014))))

(assert (=> b!1449013 (= res!980488 (= lt!635739 (Intermediate!11681 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449013 (= lt!635739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635737 mask!2687) lt!635737 lt!635740 mask!2687))))

(assert (=> b!1449013 (= lt!635737 (select (store (arr!47429 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449014 () Bool)

(assert (=> b!1449014 (= e!816014 (not e!816005))))

(declare-fun res!980489 () Bool)

(assert (=> b!1449014 (=> res!980489 e!816005)))

(assert (=> b!1449014 (= res!980489 (or (and (= (select (arr!47429 a!2862) index!646) (select (store (arr!47429 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47429 a!2862) index!646) (select (arr!47429 a!2862) j!93))) (not (= (select (arr!47429 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47429 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449014 e!816011))

(declare-fun res!980499 () Bool)

(assert (=> b!1449014 (=> (not res!980499) (not e!816011))))

(assert (=> b!1449014 (= res!980499 (and (= lt!635736 (Found!11681 j!93)) (or (= (select (arr!47429 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47429 a!2862) intermediateBeforeIndex!19) (select (arr!47429 a!2862) j!93)))))))

(assert (=> b!1449014 (= lt!635736 (seekEntryOrOpen!0 (select (arr!47429 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449014 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48858 0))(
  ( (Unit!48859) )
))
(declare-fun lt!635741 () Unit!48858)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48858)

(assert (=> b!1449014 (= lt!635741 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449015 () Bool)

(declare-fun res!980494 () Bool)

(assert (=> b!1449015 (=> (not res!980494) (not e!816006))))

(declare-datatypes ((List!33930 0))(
  ( (Nil!33927) (Cons!33926 (h!35276 (_ BitVec 64)) (t!48624 List!33930)) )
))
(declare-fun arrayNoDuplicates!0 (array!98282 (_ BitVec 32) List!33930) Bool)

(assert (=> b!1449015 (= res!980494 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33927))))

(assert (= (and start!124834 res!980485) b!1449002))

(assert (= (and b!1449002 res!980497) b!1449007))

(assert (= (and b!1449007 res!980486) b!1448999))

(assert (= (and b!1448999 res!980500) b!1449009))

(assert (= (and b!1449009 res!980496) b!1449015))

(assert (= (and b!1449015 res!980494) b!1449011))

(assert (= (and b!1449011 res!980487) b!1449008))

(assert (= (and b!1449008 res!980490) b!1449005))

(assert (= (and b!1449005 res!980493) b!1448997))

(assert (= (and b!1448997 res!980491) b!1449013))

(assert (= (and b!1449013 res!980488) b!1449000))

(assert (= (and b!1449000 c!133767) b!1449006))

(assert (= (and b!1449000 (not c!133767)) b!1449010))

(assert (= (and b!1449000 res!980492) b!1449004))

(assert (= (and b!1449004 res!980495) b!1449014))

(assert (= (and b!1449014 res!980499) b!1449003))

(assert (= (and b!1449003 (not res!980484)) b!1448998))

(assert (= (and b!1448998 res!980498) b!1449012))

(assert (= (and b!1449014 (not res!980489)) b!1449001))

(declare-fun m!1337731 () Bool)

(assert (=> start!124834 m!1337731))

(declare-fun m!1337733 () Bool)

(assert (=> start!124834 m!1337733))

(declare-fun m!1337735 () Bool)

(assert (=> b!1448998 m!1337735))

(assert (=> b!1448998 m!1337735))

(declare-fun m!1337737 () Bool)

(assert (=> b!1448998 m!1337737))

(declare-fun m!1337739 () Bool)

(assert (=> b!1449007 m!1337739))

(assert (=> b!1449007 m!1337739))

(declare-fun m!1337741 () Bool)

(assert (=> b!1449007 m!1337741))

(declare-fun m!1337743 () Bool)

(assert (=> b!1449003 m!1337743))

(declare-fun m!1337745 () Bool)

(assert (=> b!1449003 m!1337745))

(declare-fun m!1337747 () Bool)

(assert (=> b!1449003 m!1337747))

(assert (=> b!1449003 m!1337735))

(declare-fun m!1337749 () Bool)

(assert (=> b!1449010 m!1337749))

(declare-fun m!1337751 () Bool)

(assert (=> b!1449010 m!1337751))

(assert (=> b!1449008 m!1337745))

(declare-fun m!1337753 () Bool)

(assert (=> b!1449008 m!1337753))

(assert (=> b!1448997 m!1337735))

(assert (=> b!1448997 m!1337735))

(declare-fun m!1337755 () Bool)

(assert (=> b!1448997 m!1337755))

(declare-fun m!1337757 () Bool)

(assert (=> b!1449014 m!1337757))

(assert (=> b!1449014 m!1337745))

(declare-fun m!1337759 () Bool)

(assert (=> b!1449014 m!1337759))

(assert (=> b!1449014 m!1337747))

(assert (=> b!1449014 m!1337743))

(assert (=> b!1449014 m!1337735))

(declare-fun m!1337761 () Bool)

(assert (=> b!1449014 m!1337761))

(declare-fun m!1337763 () Bool)

(assert (=> b!1449014 m!1337763))

(assert (=> b!1449014 m!1337735))

(declare-fun m!1337765 () Bool)

(assert (=> b!1449013 m!1337765))

(assert (=> b!1449013 m!1337765))

(declare-fun m!1337767 () Bool)

(assert (=> b!1449013 m!1337767))

(assert (=> b!1449013 m!1337745))

(declare-fun m!1337769 () Bool)

(assert (=> b!1449013 m!1337769))

(declare-fun m!1337771 () Bool)

(assert (=> b!1449009 m!1337771))

(declare-fun m!1337773 () Bool)

(assert (=> b!1449006 m!1337773))

(assert (=> b!1449005 m!1337735))

(assert (=> b!1449005 m!1337735))

(declare-fun m!1337775 () Bool)

(assert (=> b!1449005 m!1337775))

(assert (=> b!1449005 m!1337775))

(assert (=> b!1449005 m!1337735))

(declare-fun m!1337777 () Bool)

(assert (=> b!1449005 m!1337777))

(declare-fun m!1337779 () Bool)

(assert (=> b!1449015 m!1337779))

(assert (=> b!1448999 m!1337735))

(assert (=> b!1448999 m!1337735))

(declare-fun m!1337781 () Bool)

(assert (=> b!1448999 m!1337781))

(assert (=> b!1449001 m!1337735))

(assert (=> b!1449001 m!1337735))

(declare-fun m!1337783 () Bool)

(assert (=> b!1449001 m!1337783))

(push 1)

