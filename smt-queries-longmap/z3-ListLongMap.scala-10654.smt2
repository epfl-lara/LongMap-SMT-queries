; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125064 () Bool)

(assert start!125064)

(declare-fun b!1455757 () Bool)

(declare-fun res!986369 () Bool)

(declare-fun e!819130 () Bool)

(assert (=> b!1455757 (=> (not res!986369) (not e!819130))))

(declare-datatypes ((array!98512 0))(
  ( (array!98513 (arr!47544 (Array (_ BitVec 32) (_ BitVec 64))) (size!48094 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98512)

(declare-datatypes ((List!34045 0))(
  ( (Nil!34042) (Cons!34041 (h!35391 (_ BitVec 64)) (t!48739 List!34045)) )
))
(declare-fun arrayNoDuplicates!0 (array!98512 (_ BitVec 32) List!34045) Bool)

(assert (=> b!1455757 (= res!986369 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34042))))

(declare-fun b!1455758 () Bool)

(declare-fun res!986378 () Bool)

(declare-fun e!819129 () Bool)

(assert (=> b!1455758 (=> (not res!986378) (not e!819129))))

(declare-fun e!819128 () Bool)

(assert (=> b!1455758 (= res!986378 e!819128)))

(declare-fun c!134207 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1455758 (= c!134207 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!638073 () (_ BitVec 64))

(declare-fun lt!638069 () array!98512)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1455759 () Bool)

(declare-datatypes ((SeekEntryResult!11796 0))(
  ( (MissingZero!11796 (index!49576 (_ BitVec 32))) (Found!11796 (index!49577 (_ BitVec 32))) (Intermediate!11796 (undefined!12608 Bool) (index!49578 (_ BitVec 32)) (x!131205 (_ BitVec 32))) (Undefined!11796) (MissingVacant!11796 (index!49579 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98512 (_ BitVec 32)) SeekEntryResult!11796)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98512 (_ BitVec 32)) SeekEntryResult!11796)

(assert (=> b!1455759 (= e!819128 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638073 lt!638069 mask!2687) (seekEntryOrOpen!0 lt!638073 lt!638069 mask!2687)))))

(declare-fun e!819127 () Bool)

(declare-fun lt!638071 () (_ BitVec 32))

(declare-fun b!1455760 () Bool)

(declare-fun lt!638072 () SeekEntryResult!11796)

(assert (=> b!1455760 (= e!819127 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638071 intermediateAfterIndex!19 lt!638073 lt!638069 mask!2687) lt!638072)))))

(declare-fun b!1455761 () Bool)

(declare-fun res!986375 () Bool)

(declare-fun e!819124 () Bool)

(assert (=> b!1455761 (=> res!986375 e!819124)))

(declare-fun lt!638066 () SeekEntryResult!11796)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98512 (_ BitVec 32)) SeekEntryResult!11796)

(assert (=> b!1455761 (= res!986375 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638071 (select (arr!47544 a!2862) j!93) a!2862 mask!2687) lt!638066)))))

(declare-fun b!1455762 () Bool)

(declare-fun e!819126 () Bool)

(assert (=> b!1455762 (= e!819129 (not e!819126))))

(declare-fun res!986363 () Bool)

(assert (=> b!1455762 (=> res!986363 e!819126)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455762 (= res!986363 (or (and (= (select (arr!47544 a!2862) index!646) (select (store (arr!47544 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47544 a!2862) index!646) (select (arr!47544 a!2862) j!93))) (= (select (arr!47544 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819122 () Bool)

(assert (=> b!1455762 e!819122))

(declare-fun res!986368 () Bool)

(assert (=> b!1455762 (=> (not res!986368) (not e!819122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98512 (_ BitVec 32)) Bool)

(assert (=> b!1455762 (= res!986368 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49088 0))(
  ( (Unit!49089) )
))
(declare-fun lt!638070 () Unit!49088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49088)

(assert (=> b!1455762 (= lt!638070 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455763 () Bool)

(declare-fun res!986370 () Bool)

(assert (=> b!1455763 (=> (not res!986370) (not e!819129))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455763 (= res!986370 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455764 () Bool)

(declare-fun res!986373 () Bool)

(assert (=> b!1455764 (=> (not res!986373) (not e!819130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455764 (= res!986373 (validKeyInArray!0 (select (arr!47544 a!2862) j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1455765 () Bool)

(assert (=> b!1455765 (= e!819122 (and (or (= (select (arr!47544 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47544 a!2862) intermediateBeforeIndex!19) (select (arr!47544 a!2862) j!93))) (let ((bdg!53182 (select (store (arr!47544 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47544 a!2862) index!646) bdg!53182) (= (select (arr!47544 a!2862) index!646) (select (arr!47544 a!2862) j!93))) (= (select (arr!47544 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53182 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455766 () Bool)

(declare-fun e!819123 () Bool)

(assert (=> b!1455766 (= e!819123 e!819129)))

(declare-fun res!986365 () Bool)

(assert (=> b!1455766 (=> (not res!986365) (not e!819129))))

(declare-fun lt!638068 () SeekEntryResult!11796)

(assert (=> b!1455766 (= res!986365 (= lt!638068 (Intermediate!11796 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455766 (= lt!638068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638073 mask!2687) lt!638073 lt!638069 mask!2687))))

(assert (=> b!1455766 (= lt!638073 (select (store (arr!47544 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455767 () Bool)

(declare-fun e!819125 () Bool)

(assert (=> b!1455767 (= e!819130 e!819125)))

(declare-fun res!986374 () Bool)

(assert (=> b!1455767 (=> (not res!986374) (not e!819125))))

(assert (=> b!1455767 (= res!986374 (= (select (store (arr!47544 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455767 (= lt!638069 (array!98513 (store (arr!47544 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48094 a!2862)))))

(declare-fun b!1455768 () Bool)

(declare-fun res!986380 () Bool)

(assert (=> b!1455768 (=> (not res!986380) (not e!819122))))

(assert (=> b!1455768 (= res!986380 (= (seekEntryOrOpen!0 (select (arr!47544 a!2862) j!93) a!2862 mask!2687) (Found!11796 j!93)))))

(declare-fun b!1455756 () Bool)

(declare-fun res!986366 () Bool)

(assert (=> b!1455756 (=> (not res!986366) (not e!819130))))

(assert (=> b!1455756 (= res!986366 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48094 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48094 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48094 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!986367 () Bool)

(assert (=> start!125064 (=> (not res!986367) (not e!819130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125064 (= res!986367 (validMask!0 mask!2687))))

(assert (=> start!125064 e!819130))

(assert (=> start!125064 true))

(declare-fun array_inv!36572 (array!98512) Bool)

(assert (=> start!125064 (array_inv!36572 a!2862)))

(declare-fun b!1455769 () Bool)

(assert (=> b!1455769 (= e!819127 (not (= lt!638068 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638071 lt!638073 lt!638069 mask!2687))))))

(declare-fun b!1455770 () Bool)

(declare-fun res!986364 () Bool)

(assert (=> b!1455770 (=> (not res!986364) (not e!819130))))

(assert (=> b!1455770 (= res!986364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455771 () Bool)

(assert (=> b!1455771 (= e!819124 true)))

(declare-fun lt!638067 () Bool)

(assert (=> b!1455771 (= lt!638067 e!819127)))

(declare-fun c!134208 () Bool)

(assert (=> b!1455771 (= c!134208 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455772 () Bool)

(declare-fun res!986372 () Bool)

(assert (=> b!1455772 (=> (not res!986372) (not e!819130))))

(assert (=> b!1455772 (= res!986372 (validKeyInArray!0 (select (arr!47544 a!2862) i!1006)))))

(declare-fun b!1455773 () Bool)

(assert (=> b!1455773 (= e!819128 (= lt!638068 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638073 lt!638069 mask!2687)))))

(declare-fun b!1455774 () Bool)

(declare-fun res!986377 () Bool)

(assert (=> b!1455774 (=> (not res!986377) (not e!819130))))

(assert (=> b!1455774 (= res!986377 (and (= (size!48094 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48094 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48094 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455775 () Bool)

(assert (=> b!1455775 (= e!819125 e!819123)))

(declare-fun res!986376 () Bool)

(assert (=> b!1455775 (=> (not res!986376) (not e!819123))))

(assert (=> b!1455775 (= res!986376 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47544 a!2862) j!93) mask!2687) (select (arr!47544 a!2862) j!93) a!2862 mask!2687) lt!638066))))

(assert (=> b!1455775 (= lt!638066 (Intermediate!11796 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455776 () Bool)

(assert (=> b!1455776 (= e!819126 e!819124)))

(declare-fun res!986379 () Bool)

(assert (=> b!1455776 (=> res!986379 e!819124)))

(assert (=> b!1455776 (= res!986379 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638071 #b00000000000000000000000000000000) (bvsge lt!638071 (size!48094 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455776 (= lt!638071 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1455776 (= lt!638072 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638073 lt!638069 mask!2687))))

(assert (=> b!1455776 (= lt!638072 (seekEntryOrOpen!0 lt!638073 lt!638069 mask!2687))))

(declare-fun b!1455777 () Bool)

(declare-fun res!986371 () Bool)

(assert (=> b!1455777 (=> (not res!986371) (not e!819123))))

(assert (=> b!1455777 (= res!986371 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47544 a!2862) j!93) a!2862 mask!2687) lt!638066))))

(assert (= (and start!125064 res!986367) b!1455774))

(assert (= (and b!1455774 res!986377) b!1455772))

(assert (= (and b!1455772 res!986372) b!1455764))

(assert (= (and b!1455764 res!986373) b!1455770))

(assert (= (and b!1455770 res!986364) b!1455757))

(assert (= (and b!1455757 res!986369) b!1455756))

(assert (= (and b!1455756 res!986366) b!1455767))

(assert (= (and b!1455767 res!986374) b!1455775))

(assert (= (and b!1455775 res!986376) b!1455777))

(assert (= (and b!1455777 res!986371) b!1455766))

(assert (= (and b!1455766 res!986365) b!1455758))

(assert (= (and b!1455758 c!134207) b!1455773))

(assert (= (and b!1455758 (not c!134207)) b!1455759))

(assert (= (and b!1455758 res!986378) b!1455763))

(assert (= (and b!1455763 res!986370) b!1455762))

(assert (= (and b!1455762 res!986368) b!1455768))

(assert (= (and b!1455768 res!986380) b!1455765))

(assert (= (and b!1455762 (not res!986363)) b!1455776))

(assert (= (and b!1455776 (not res!986379)) b!1455761))

(assert (= (and b!1455761 (not res!986375)) b!1455771))

(assert (= (and b!1455771 c!134208) b!1455769))

(assert (= (and b!1455771 (not c!134208)) b!1455760))

(declare-fun m!1343939 () Bool)

(assert (=> b!1455760 m!1343939))

(declare-fun m!1343941 () Bool)

(assert (=> b!1455761 m!1343941))

(assert (=> b!1455761 m!1343941))

(declare-fun m!1343943 () Bool)

(assert (=> b!1455761 m!1343943))

(assert (=> b!1455768 m!1343941))

(assert (=> b!1455768 m!1343941))

(declare-fun m!1343945 () Bool)

(assert (=> b!1455768 m!1343945))

(assert (=> b!1455775 m!1343941))

(assert (=> b!1455775 m!1343941))

(declare-fun m!1343947 () Bool)

(assert (=> b!1455775 m!1343947))

(assert (=> b!1455775 m!1343947))

(assert (=> b!1455775 m!1343941))

(declare-fun m!1343949 () Bool)

(assert (=> b!1455775 m!1343949))

(declare-fun m!1343951 () Bool)

(assert (=> b!1455776 m!1343951))

(declare-fun m!1343953 () Bool)

(assert (=> b!1455776 m!1343953))

(declare-fun m!1343955 () Bool)

(assert (=> b!1455776 m!1343955))

(declare-fun m!1343957 () Bool)

(assert (=> b!1455770 m!1343957))

(declare-fun m!1343959 () Bool)

(assert (=> b!1455773 m!1343959))

(declare-fun m!1343961 () Bool)

(assert (=> b!1455769 m!1343961))

(declare-fun m!1343963 () Bool)

(assert (=> b!1455772 m!1343963))

(assert (=> b!1455772 m!1343963))

(declare-fun m!1343965 () Bool)

(assert (=> b!1455772 m!1343965))

(declare-fun m!1343967 () Bool)

(assert (=> b!1455762 m!1343967))

(declare-fun m!1343969 () Bool)

(assert (=> b!1455762 m!1343969))

(declare-fun m!1343971 () Bool)

(assert (=> b!1455762 m!1343971))

(declare-fun m!1343973 () Bool)

(assert (=> b!1455762 m!1343973))

(declare-fun m!1343975 () Bool)

(assert (=> b!1455762 m!1343975))

(assert (=> b!1455762 m!1343941))

(assert (=> b!1455765 m!1343969))

(declare-fun m!1343977 () Bool)

(assert (=> b!1455765 m!1343977))

(assert (=> b!1455765 m!1343971))

(assert (=> b!1455765 m!1343973))

(assert (=> b!1455765 m!1343941))

(declare-fun m!1343979 () Bool)

(assert (=> start!125064 m!1343979))

(declare-fun m!1343981 () Bool)

(assert (=> start!125064 m!1343981))

(assert (=> b!1455777 m!1343941))

(assert (=> b!1455777 m!1343941))

(declare-fun m!1343983 () Bool)

(assert (=> b!1455777 m!1343983))

(assert (=> b!1455767 m!1343969))

(declare-fun m!1343985 () Bool)

(assert (=> b!1455767 m!1343985))

(declare-fun m!1343987 () Bool)

(assert (=> b!1455757 m!1343987))

(assert (=> b!1455759 m!1343953))

(assert (=> b!1455759 m!1343955))

(declare-fun m!1343989 () Bool)

(assert (=> b!1455766 m!1343989))

(assert (=> b!1455766 m!1343989))

(declare-fun m!1343991 () Bool)

(assert (=> b!1455766 m!1343991))

(assert (=> b!1455766 m!1343969))

(declare-fun m!1343993 () Bool)

(assert (=> b!1455766 m!1343993))

(assert (=> b!1455764 m!1343941))

(assert (=> b!1455764 m!1343941))

(declare-fun m!1343995 () Bool)

(assert (=> b!1455764 m!1343995))

(check-sat (not b!1455760) (not b!1455777) (not b!1455768) (not b!1455773) (not b!1455766) (not b!1455762) (not b!1455769) (not b!1455764) (not b!1455775) (not start!125064) (not b!1455770) (not b!1455757) (not b!1455772) (not b!1455761) (not b!1455759) (not b!1455776))
(check-sat)
