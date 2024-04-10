; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126880 () Bool)

(assert start!126880)

(declare-fun b!1490572 () Bool)

(declare-fun res!1013840 () Bool)

(declare-fun e!835242 () Bool)

(assert (=> b!1490572 (=> (not res!1013840) (not e!835242))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!99653 0))(
  ( (array!99654 (arr!48098 (Array (_ BitVec 32) (_ BitVec 64))) (size!48648 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99653)

(declare-datatypes ((SeekEntryResult!12338 0))(
  ( (MissingZero!12338 (index!51744 (_ BitVec 32))) (Found!12338 (index!51745 (_ BitVec 32))) (Intermediate!12338 (undefined!13150 Bool) (index!51746 (_ BitVec 32)) (x!133338 (_ BitVec 32))) (Undefined!12338) (MissingVacant!12338 (index!51747 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99653 (_ BitVec 32)) SeekEntryResult!12338)

(assert (=> b!1490572 (= res!1013840 (= (seekEntryOrOpen!0 (select (arr!48098 a!2862) j!93) a!2862 mask!2687) (Found!12338 j!93)))))

(declare-fun b!1490573 () Bool)

(declare-fun res!1013837 () Bool)

(declare-fun e!835241 () Bool)

(assert (=> b!1490573 (=> (not res!1013837) (not e!835241))))

(declare-fun e!835243 () Bool)

(assert (=> b!1490573 (= res!1013837 e!835243)))

(declare-fun c!137895 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490573 (= c!137895 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490574 () Bool)

(declare-fun res!1013836 () Bool)

(declare-fun e!835247 () Bool)

(assert (=> b!1490574 (=> (not res!1013836) (not e!835247))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1490574 (= res!1013836 (and (= (size!48648 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48648 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48648 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490575 () Bool)

(declare-fun e!835245 () Bool)

(assert (=> b!1490575 (= e!835241 (not e!835245))))

(declare-fun res!1013838 () Bool)

(assert (=> b!1490575 (=> res!1013838 e!835245)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1490575 (= res!1013838 (or (and (= (select (arr!48098 a!2862) index!646) (select (store (arr!48098 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48098 a!2862) index!646) (select (arr!48098 a!2862) j!93))) (= (select (arr!48098 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490575 e!835242))

(declare-fun res!1013843 () Bool)

(assert (=> b!1490575 (=> (not res!1013843) (not e!835242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99653 (_ BitVec 32)) Bool)

(assert (=> b!1490575 (= res!1013843 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50016 0))(
  ( (Unit!50017) )
))
(declare-fun lt!649992 () Unit!50016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50016)

(assert (=> b!1490575 (= lt!649992 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490576 () Bool)

(declare-fun res!1013844 () Bool)

(assert (=> b!1490576 (=> (not res!1013844) (not e!835247))))

(declare-datatypes ((List!34599 0))(
  ( (Nil!34596) (Cons!34595 (h!35978 (_ BitVec 64)) (t!49293 List!34599)) )
))
(declare-fun arrayNoDuplicates!0 (array!99653 (_ BitVec 32) List!34599) Bool)

(assert (=> b!1490576 (= res!1013844 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34596))))

(declare-fun b!1490577 () Bool)

(assert (=> b!1490577 (= e!835245 true)))

(declare-fun lt!649987 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490577 (= lt!649987 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!1013850 () Bool)

(assert (=> start!126880 (=> (not res!1013850) (not e!835247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126880 (= res!1013850 (validMask!0 mask!2687))))

(assert (=> start!126880 e!835247))

(assert (=> start!126880 true))

(declare-fun array_inv!37126 (array!99653) Bool)

(assert (=> start!126880 (array_inv!37126 a!2862)))

(declare-fun b!1490578 () Bool)

(declare-fun res!1013841 () Bool)

(assert (=> b!1490578 (=> (not res!1013841) (not e!835247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490578 (= res!1013841 (validKeyInArray!0 (select (arr!48098 a!2862) j!93)))))

(declare-fun lt!649990 () (_ BitVec 64))

(declare-fun b!1490579 () Bool)

(declare-fun lt!649988 () array!99653)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99653 (_ BitVec 32)) SeekEntryResult!12338)

(assert (=> b!1490579 (= e!835243 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649990 lt!649988 mask!2687) (seekEntryOrOpen!0 lt!649990 lt!649988 mask!2687)))))

(declare-fun b!1490580 () Bool)

(declare-fun e!835240 () Bool)

(assert (=> b!1490580 (= e!835247 e!835240)))

(declare-fun res!1013839 () Bool)

(assert (=> b!1490580 (=> (not res!1013839) (not e!835240))))

(assert (=> b!1490580 (= res!1013839 (= (select (store (arr!48098 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490580 (= lt!649988 (array!99654 (store (arr!48098 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48648 a!2862)))))

(declare-fun b!1490581 () Bool)

(declare-fun res!1013845 () Bool)

(assert (=> b!1490581 (=> (not res!1013845) (not e!835247))))

(assert (=> b!1490581 (= res!1013845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490582 () Bool)

(declare-fun res!1013847 () Bool)

(assert (=> b!1490582 (=> (not res!1013847) (not e!835247))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490582 (= res!1013847 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48648 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48648 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48648 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490583 () Bool)

(declare-fun res!1013842 () Bool)

(declare-fun e!835246 () Bool)

(assert (=> b!1490583 (=> (not res!1013842) (not e!835246))))

(declare-fun lt!649989 () SeekEntryResult!12338)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99653 (_ BitVec 32)) SeekEntryResult!12338)

(assert (=> b!1490583 (= res!1013842 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48098 a!2862) j!93) a!2862 mask!2687) lt!649989))))

(declare-fun lt!649991 () SeekEntryResult!12338)

(declare-fun b!1490584 () Bool)

(assert (=> b!1490584 (= e!835243 (= lt!649991 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649990 lt!649988 mask!2687)))))

(declare-fun b!1490585 () Bool)

(assert (=> b!1490585 (= e!835246 e!835241)))

(declare-fun res!1013846 () Bool)

(assert (=> b!1490585 (=> (not res!1013846) (not e!835241))))

(assert (=> b!1490585 (= res!1013846 (= lt!649991 (Intermediate!12338 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490585 (= lt!649991 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649990 mask!2687) lt!649990 lt!649988 mask!2687))))

(assert (=> b!1490585 (= lt!649990 (select (store (arr!48098 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490586 () Bool)

(declare-fun res!1013848 () Bool)

(assert (=> b!1490586 (=> (not res!1013848) (not e!835241))))

(assert (=> b!1490586 (= res!1013848 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490587 () Bool)

(assert (=> b!1490587 (= e!835242 (or (= (select (arr!48098 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48098 a!2862) intermediateBeforeIndex!19) (select (arr!48098 a!2862) j!93))))))

(declare-fun b!1490588 () Bool)

(assert (=> b!1490588 (= e!835240 e!835246)))

(declare-fun res!1013851 () Bool)

(assert (=> b!1490588 (=> (not res!1013851) (not e!835246))))

(assert (=> b!1490588 (= res!1013851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48098 a!2862) j!93) mask!2687) (select (arr!48098 a!2862) j!93) a!2862 mask!2687) lt!649989))))

(assert (=> b!1490588 (= lt!649989 (Intermediate!12338 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490589 () Bool)

(declare-fun res!1013849 () Bool)

(assert (=> b!1490589 (=> (not res!1013849) (not e!835247))))

(assert (=> b!1490589 (= res!1013849 (validKeyInArray!0 (select (arr!48098 a!2862) i!1006)))))

(assert (= (and start!126880 res!1013850) b!1490574))

(assert (= (and b!1490574 res!1013836) b!1490589))

(assert (= (and b!1490589 res!1013849) b!1490578))

(assert (= (and b!1490578 res!1013841) b!1490581))

(assert (= (and b!1490581 res!1013845) b!1490576))

(assert (= (and b!1490576 res!1013844) b!1490582))

(assert (= (and b!1490582 res!1013847) b!1490580))

(assert (= (and b!1490580 res!1013839) b!1490588))

(assert (= (and b!1490588 res!1013851) b!1490583))

(assert (= (and b!1490583 res!1013842) b!1490585))

(assert (= (and b!1490585 res!1013846) b!1490573))

(assert (= (and b!1490573 c!137895) b!1490584))

(assert (= (and b!1490573 (not c!137895)) b!1490579))

(assert (= (and b!1490573 res!1013837) b!1490586))

(assert (= (and b!1490586 res!1013848) b!1490575))

(assert (= (and b!1490575 res!1013843) b!1490572))

(assert (= (and b!1490572 res!1013840) b!1490587))

(assert (= (and b!1490575 (not res!1013838)) b!1490577))

(declare-fun m!1374727 () Bool)

(assert (=> b!1490576 m!1374727))

(declare-fun m!1374729 () Bool)

(assert (=> b!1490584 m!1374729))

(declare-fun m!1374731 () Bool)

(assert (=> b!1490587 m!1374731))

(declare-fun m!1374733 () Bool)

(assert (=> b!1490587 m!1374733))

(assert (=> b!1490578 m!1374733))

(assert (=> b!1490578 m!1374733))

(declare-fun m!1374735 () Bool)

(assert (=> b!1490578 m!1374735))

(declare-fun m!1374737 () Bool)

(assert (=> b!1490577 m!1374737))

(declare-fun m!1374739 () Bool)

(assert (=> b!1490585 m!1374739))

(assert (=> b!1490585 m!1374739))

(declare-fun m!1374741 () Bool)

(assert (=> b!1490585 m!1374741))

(declare-fun m!1374743 () Bool)

(assert (=> b!1490585 m!1374743))

(declare-fun m!1374745 () Bool)

(assert (=> b!1490585 m!1374745))

(declare-fun m!1374747 () Bool)

(assert (=> start!126880 m!1374747))

(declare-fun m!1374749 () Bool)

(assert (=> start!126880 m!1374749))

(declare-fun m!1374751 () Bool)

(assert (=> b!1490581 m!1374751))

(assert (=> b!1490583 m!1374733))

(assert (=> b!1490583 m!1374733))

(declare-fun m!1374753 () Bool)

(assert (=> b!1490583 m!1374753))

(assert (=> b!1490572 m!1374733))

(assert (=> b!1490572 m!1374733))

(declare-fun m!1374755 () Bool)

(assert (=> b!1490572 m!1374755))

(declare-fun m!1374757 () Bool)

(assert (=> b!1490579 m!1374757))

(declare-fun m!1374759 () Bool)

(assert (=> b!1490579 m!1374759))

(assert (=> b!1490580 m!1374743))

(declare-fun m!1374761 () Bool)

(assert (=> b!1490580 m!1374761))

(assert (=> b!1490588 m!1374733))

(assert (=> b!1490588 m!1374733))

(declare-fun m!1374763 () Bool)

(assert (=> b!1490588 m!1374763))

(assert (=> b!1490588 m!1374763))

(assert (=> b!1490588 m!1374733))

(declare-fun m!1374765 () Bool)

(assert (=> b!1490588 m!1374765))

(declare-fun m!1374767 () Bool)

(assert (=> b!1490575 m!1374767))

(assert (=> b!1490575 m!1374743))

(declare-fun m!1374769 () Bool)

(assert (=> b!1490575 m!1374769))

(declare-fun m!1374771 () Bool)

(assert (=> b!1490575 m!1374771))

(declare-fun m!1374773 () Bool)

(assert (=> b!1490575 m!1374773))

(assert (=> b!1490575 m!1374733))

(declare-fun m!1374775 () Bool)

(assert (=> b!1490589 m!1374775))

(assert (=> b!1490589 m!1374775))

(declare-fun m!1374777 () Bool)

(assert (=> b!1490589 m!1374777))

(push 1)

