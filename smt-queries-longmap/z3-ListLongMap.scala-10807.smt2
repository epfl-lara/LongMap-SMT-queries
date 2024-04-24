; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126768 () Bool)

(assert start!126768)

(declare-fun b!1484933 () Bool)

(declare-fun res!1008740 () Bool)

(declare-fun e!832769 () Bool)

(assert (=> b!1484933 (=> (not res!1008740) (not e!832769))))

(declare-datatypes ((array!99568 0))(
  ( (array!99569 (arr!48055 (Array (_ BitVec 32) (_ BitVec 64))) (size!48606 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99568)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12192 0))(
  ( (MissingZero!12192 (index!51160 (_ BitVec 32))) (Found!12192 (index!51161 (_ BitVec 32))) (Intermediate!12192 (undefined!13004 Bool) (index!51162 (_ BitVec 32)) (x!132933 (_ BitVec 32))) (Undefined!12192) (MissingVacant!12192 (index!51163 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99568 (_ BitVec 32)) SeekEntryResult!12192)

(assert (=> b!1484933 (= res!1008740 (= (seekEntryOrOpen!0 (select (arr!48055 a!2862) j!93) a!2862 mask!2687) (Found!12192 j!93)))))

(declare-fun b!1484935 () Bool)

(declare-fun e!832767 () Bool)

(declare-fun e!832765 () Bool)

(assert (=> b!1484935 (= e!832767 e!832765)))

(declare-fun res!1008741 () Bool)

(assert (=> b!1484935 (=> (not res!1008741) (not e!832765))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!647994 () SeekEntryResult!12192)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484935 (= res!1008741 (= lt!647994 (Intermediate!12192 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!647993 () (_ BitVec 64))

(declare-fun lt!647998 () array!99568)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99568 (_ BitVec 32)) SeekEntryResult!12192)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484935 (= lt!647994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647993 mask!2687) lt!647993 lt!647998 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1484935 (= lt!647993 (select (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484936 () Bool)

(declare-fun e!832770 () Bool)

(assert (=> b!1484936 (= e!832765 (not e!832770))))

(declare-fun res!1008734 () Bool)

(assert (=> b!1484936 (=> res!1008734 e!832770)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1484936 (= res!1008734 (or (and (= (select (arr!48055 a!2862) index!646) (select (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48055 a!2862) index!646) (select (arr!48055 a!2862) j!93))) (= (select (arr!48055 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484936 e!832769))

(declare-fun res!1008736 () Bool)

(assert (=> b!1484936 (=> (not res!1008736) (not e!832769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99568 (_ BitVec 32)) Bool)

(assert (=> b!1484936 (= res!1008736 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49757 0))(
  ( (Unit!49758) )
))
(declare-fun lt!647995 () Unit!49757)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49757)

(assert (=> b!1484936 (= lt!647995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484937 () Bool)

(declare-fun res!1008732 () Bool)

(declare-fun e!832766 () Bool)

(assert (=> b!1484937 (=> (not res!1008732) (not e!832766))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484937 (= res!1008732 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48606 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48606 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48606 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!832764 () Bool)

(declare-fun b!1484938 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99568 (_ BitVec 32)) SeekEntryResult!12192)

(assert (=> b!1484938 (= e!832764 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647993 lt!647998 mask!2687) (seekEntryOrOpen!0 lt!647993 lt!647998 mask!2687)))))

(declare-fun b!1484939 () Bool)

(declare-fun e!832761 () Bool)

(declare-fun e!832762 () Bool)

(assert (=> b!1484939 (= e!832761 e!832762)))

(declare-fun res!1008730 () Bool)

(assert (=> b!1484939 (=> (not res!1008730) (not e!832762))))

(declare-fun lt!647996 () (_ BitVec 64))

(assert (=> b!1484939 (= res!1008730 (and (= index!646 intermediateAfterIndex!19) (= lt!647996 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484940 () Bool)

(assert (=> b!1484940 (= e!832762 (= (seekEntryOrOpen!0 lt!647993 lt!647998 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647993 lt!647998 mask!2687)))))

(declare-fun b!1484941 () Bool)

(declare-fun res!1008744 () Bool)

(assert (=> b!1484941 (=> (not res!1008744) (not e!832767))))

(declare-fun lt!647992 () SeekEntryResult!12192)

(assert (=> b!1484941 (= res!1008744 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48055 a!2862) j!93) a!2862 mask!2687) lt!647992))))

(declare-fun b!1484942 () Bool)

(assert (=> b!1484942 (= e!832770 true)))

(declare-fun lt!647997 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484942 (= lt!647997 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1484943 () Bool)

(declare-fun res!1008743 () Bool)

(assert (=> b!1484943 (=> (not res!1008743) (not e!832765))))

(assert (=> b!1484943 (= res!1008743 e!832764)))

(declare-fun c!137635 () Bool)

(assert (=> b!1484943 (= c!137635 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484944 () Bool)

(declare-fun res!1008745 () Bool)

(assert (=> b!1484944 (=> (not res!1008745) (not e!832766))))

(assert (=> b!1484944 (= res!1008745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484945 () Bool)

(declare-fun e!832763 () Bool)

(assert (=> b!1484945 (= e!832766 e!832763)))

(declare-fun res!1008728 () Bool)

(assert (=> b!1484945 (=> (not res!1008728) (not e!832763))))

(assert (=> b!1484945 (= res!1008728 (= (select (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484945 (= lt!647998 (array!99569 (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48606 a!2862)))))

(declare-fun res!1008731 () Bool)

(assert (=> start!126768 (=> (not res!1008731) (not e!832766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126768 (= res!1008731 (validMask!0 mask!2687))))

(assert (=> start!126768 e!832766))

(assert (=> start!126768 true))

(declare-fun array_inv!37336 (array!99568) Bool)

(assert (=> start!126768 (array_inv!37336 a!2862)))

(declare-fun b!1484934 () Bool)

(declare-fun res!1008742 () Bool)

(assert (=> b!1484934 (=> (not res!1008742) (not e!832765))))

(assert (=> b!1484934 (= res!1008742 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484946 () Bool)

(declare-fun res!1008729 () Bool)

(assert (=> b!1484946 (=> (not res!1008729) (not e!832766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484946 (= res!1008729 (validKeyInArray!0 (select (arr!48055 a!2862) i!1006)))))

(declare-fun b!1484947 () Bool)

(assert (=> b!1484947 (= e!832763 e!832767)))

(declare-fun res!1008738 () Bool)

(assert (=> b!1484947 (=> (not res!1008738) (not e!832767))))

(assert (=> b!1484947 (= res!1008738 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48055 a!2862) j!93) mask!2687) (select (arr!48055 a!2862) j!93) a!2862 mask!2687) lt!647992))))

(assert (=> b!1484947 (= lt!647992 (Intermediate!12192 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484948 () Bool)

(assert (=> b!1484948 (= e!832769 e!832761)))

(declare-fun res!1008737 () Bool)

(assert (=> b!1484948 (=> res!1008737 e!832761)))

(assert (=> b!1484948 (= res!1008737 (or (and (= (select (arr!48055 a!2862) index!646) lt!647996) (= (select (arr!48055 a!2862) index!646) (select (arr!48055 a!2862) j!93))) (= (select (arr!48055 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484948 (= lt!647996 (select (store (arr!48055 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484949 () Bool)

(assert (=> b!1484949 (= e!832764 (= lt!647994 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647993 lt!647998 mask!2687)))))

(declare-fun b!1484950 () Bool)

(declare-fun res!1008746 () Bool)

(assert (=> b!1484950 (=> (not res!1008746) (not e!832766))))

(assert (=> b!1484950 (= res!1008746 (validKeyInArray!0 (select (arr!48055 a!2862) j!93)))))

(declare-fun b!1484951 () Bool)

(declare-fun res!1008739 () Bool)

(assert (=> b!1484951 (=> (not res!1008739) (not e!832769))))

(assert (=> b!1484951 (= res!1008739 (or (= (select (arr!48055 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48055 a!2862) intermediateBeforeIndex!19) (select (arr!48055 a!2862) j!93))))))

(declare-fun b!1484952 () Bool)

(declare-fun res!1008733 () Bool)

(assert (=> b!1484952 (=> (not res!1008733) (not e!832766))))

(assert (=> b!1484952 (= res!1008733 (and (= (size!48606 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48606 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48606 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484953 () Bool)

(declare-fun res!1008735 () Bool)

(assert (=> b!1484953 (=> (not res!1008735) (not e!832766))))

(declare-datatypes ((List!34543 0))(
  ( (Nil!34540) (Cons!34539 (h!35927 (_ BitVec 64)) (t!49229 List!34543)) )
))
(declare-fun arrayNoDuplicates!0 (array!99568 (_ BitVec 32) List!34543) Bool)

(assert (=> b!1484953 (= res!1008735 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34540))))

(assert (= (and start!126768 res!1008731) b!1484952))

(assert (= (and b!1484952 res!1008733) b!1484946))

(assert (= (and b!1484946 res!1008729) b!1484950))

(assert (= (and b!1484950 res!1008746) b!1484944))

(assert (= (and b!1484944 res!1008745) b!1484953))

(assert (= (and b!1484953 res!1008735) b!1484937))

(assert (= (and b!1484937 res!1008732) b!1484945))

(assert (= (and b!1484945 res!1008728) b!1484947))

(assert (= (and b!1484947 res!1008738) b!1484941))

(assert (= (and b!1484941 res!1008744) b!1484935))

(assert (= (and b!1484935 res!1008741) b!1484943))

(assert (= (and b!1484943 c!137635) b!1484949))

(assert (= (and b!1484943 (not c!137635)) b!1484938))

(assert (= (and b!1484943 res!1008743) b!1484934))

(assert (= (and b!1484934 res!1008742) b!1484936))

(assert (= (and b!1484936 res!1008736) b!1484933))

(assert (= (and b!1484933 res!1008740) b!1484951))

(assert (= (and b!1484951 res!1008739) b!1484948))

(assert (= (and b!1484948 (not res!1008737)) b!1484939))

(assert (= (and b!1484939 res!1008730) b!1484940))

(assert (= (and b!1484936 (not res!1008734)) b!1484942))

(declare-fun m!1370431 () Bool)

(assert (=> start!126768 m!1370431))

(declare-fun m!1370433 () Bool)

(assert (=> start!126768 m!1370433))

(declare-fun m!1370435 () Bool)

(assert (=> b!1484948 m!1370435))

(declare-fun m!1370437 () Bool)

(assert (=> b!1484948 m!1370437))

(declare-fun m!1370439 () Bool)

(assert (=> b!1484948 m!1370439))

(declare-fun m!1370441 () Bool)

(assert (=> b!1484948 m!1370441))

(assert (=> b!1484950 m!1370437))

(assert (=> b!1484950 m!1370437))

(declare-fun m!1370443 () Bool)

(assert (=> b!1484950 m!1370443))

(declare-fun m!1370445 () Bool)

(assert (=> b!1484949 m!1370445))

(declare-fun m!1370447 () Bool)

(assert (=> b!1484953 m!1370447))

(declare-fun m!1370449 () Bool)

(assert (=> b!1484940 m!1370449))

(declare-fun m!1370451 () Bool)

(assert (=> b!1484940 m!1370451))

(declare-fun m!1370453 () Bool)

(assert (=> b!1484935 m!1370453))

(assert (=> b!1484935 m!1370453))

(declare-fun m!1370455 () Bool)

(assert (=> b!1484935 m!1370455))

(assert (=> b!1484935 m!1370439))

(declare-fun m!1370457 () Bool)

(assert (=> b!1484935 m!1370457))

(assert (=> b!1484945 m!1370439))

(declare-fun m!1370459 () Bool)

(assert (=> b!1484945 m!1370459))

(assert (=> b!1484941 m!1370437))

(assert (=> b!1484941 m!1370437))

(declare-fun m!1370461 () Bool)

(assert (=> b!1484941 m!1370461))

(declare-fun m!1370463 () Bool)

(assert (=> b!1484946 m!1370463))

(assert (=> b!1484946 m!1370463))

(declare-fun m!1370465 () Bool)

(assert (=> b!1484946 m!1370465))

(declare-fun m!1370467 () Bool)

(assert (=> b!1484944 m!1370467))

(assert (=> b!1484933 m!1370437))

(assert (=> b!1484933 m!1370437))

(declare-fun m!1370469 () Bool)

(assert (=> b!1484933 m!1370469))

(assert (=> b!1484947 m!1370437))

(assert (=> b!1484947 m!1370437))

(declare-fun m!1370471 () Bool)

(assert (=> b!1484947 m!1370471))

(assert (=> b!1484947 m!1370471))

(assert (=> b!1484947 m!1370437))

(declare-fun m!1370473 () Bool)

(assert (=> b!1484947 m!1370473))

(declare-fun m!1370475 () Bool)

(assert (=> b!1484936 m!1370475))

(assert (=> b!1484936 m!1370439))

(assert (=> b!1484936 m!1370441))

(assert (=> b!1484936 m!1370435))

(declare-fun m!1370477 () Bool)

(assert (=> b!1484936 m!1370477))

(assert (=> b!1484936 m!1370437))

(assert (=> b!1484938 m!1370451))

(assert (=> b!1484938 m!1370449))

(declare-fun m!1370479 () Bool)

(assert (=> b!1484951 m!1370479))

(assert (=> b!1484951 m!1370437))

(declare-fun m!1370481 () Bool)

(assert (=> b!1484942 m!1370481))

(check-sat (not b!1484941) (not b!1484933) (not start!126768) (not b!1484953) (not b!1484950) (not b!1484949) (not b!1484936) (not b!1484940) (not b!1484938) (not b!1484946) (not b!1484944) (not b!1484935) (not b!1484947) (not b!1484942))
(check-sat)
