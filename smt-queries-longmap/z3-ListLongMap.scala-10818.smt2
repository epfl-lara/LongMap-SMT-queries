; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126506 () Bool)

(assert start!126506)

(declare-fun b!1484935 () Bool)

(declare-fun e!832460 () Bool)

(declare-fun e!832468 () Bool)

(assert (=> b!1484935 (= e!832460 (not e!832468))))

(declare-fun res!1009866 () Bool)

(assert (=> b!1484935 (=> res!1009866 e!832468)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99466 0))(
  ( (array!99467 (arr!48010 (Array (_ BitVec 32) (_ BitVec 64))) (size!48562 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99466)

(assert (=> b!1484935 (= res!1009866 (or (and (= (select (arr!48010 a!2862) index!646) (select (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48010 a!2862) index!646) (select (arr!48010 a!2862) j!93))) (= (select (arr!48010 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832469 () Bool)

(assert (=> b!1484935 e!832469))

(declare-fun res!1009865 () Bool)

(assert (=> b!1484935 (=> (not res!1009865) (not e!832469))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99466 (_ BitVec 32)) Bool)

(assert (=> b!1484935 (= res!1009865 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49731 0))(
  ( (Unit!49732) )
))
(declare-fun lt!647750 () Unit!49731)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49731)

(assert (=> b!1484935 (= lt!647750 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484936 () Bool)

(declare-fun e!832464 () Bool)

(assert (=> b!1484936 (= e!832464 e!832460)))

(declare-fun res!1009872 () Bool)

(assert (=> b!1484936 (=> (not res!1009872) (not e!832460))))

(declare-datatypes ((SeekEntryResult!12275 0))(
  ( (MissingZero!12275 (index!51492 (_ BitVec 32))) (Found!12275 (index!51493 (_ BitVec 32))) (Intermediate!12275 (undefined!13087 Bool) (index!51494 (_ BitVec 32)) (x!133064 (_ BitVec 32))) (Undefined!12275) (MissingVacant!12275 (index!51495 (_ BitVec 32))) )
))
(declare-fun lt!647747 () SeekEntryResult!12275)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484936 (= res!1009872 (= lt!647747 (Intermediate!12275 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!647745 () array!99466)

(declare-fun lt!647744 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99466 (_ BitVec 32)) SeekEntryResult!12275)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484936 (= lt!647747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647744 mask!2687) lt!647744 lt!647745 mask!2687))))

(assert (=> b!1484936 (= lt!647744 (select (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484937 () Bool)

(declare-fun res!1009868 () Bool)

(assert (=> b!1484937 (=> (not res!1009868) (not e!832460))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484937 (= res!1009868 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484938 () Bool)

(declare-fun res!1009861 () Bool)

(declare-fun e!832462 () Bool)

(assert (=> b!1484938 (=> (not res!1009861) (not e!832462))))

(assert (=> b!1484938 (= res!1009861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484939 () Bool)

(declare-fun e!832467 () Bool)

(declare-fun e!832463 () Bool)

(assert (=> b!1484939 (= e!832467 e!832463)))

(declare-fun res!1009873 () Bool)

(assert (=> b!1484939 (=> (not res!1009873) (not e!832463))))

(declare-fun lt!647748 () (_ BitVec 64))

(assert (=> b!1484939 (= res!1009873 (and (= index!646 intermediateAfterIndex!19) (= lt!647748 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484940 () Bool)

(declare-fun e!832465 () Bool)

(assert (=> b!1484940 (= e!832465 (= lt!647747 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647744 lt!647745 mask!2687)))))

(declare-fun b!1484941 () Bool)

(declare-fun res!1009870 () Bool)

(assert (=> b!1484941 (=> (not res!1009870) (not e!832469))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99466 (_ BitVec 32)) SeekEntryResult!12275)

(assert (=> b!1484941 (= res!1009870 (= (seekEntryOrOpen!0 (select (arr!48010 a!2862) j!93) a!2862 mask!2687) (Found!12275 j!93)))))

(declare-fun b!1484942 () Bool)

(assert (=> b!1484942 (= e!832468 true)))

(declare-fun lt!647749 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484942 (= lt!647749 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484943 () Bool)

(declare-fun res!1009860 () Bool)

(assert (=> b!1484943 (=> (not res!1009860) (not e!832462))))

(declare-datatypes ((List!34589 0))(
  ( (Nil!34586) (Cons!34585 (h!35959 (_ BitVec 64)) (t!49275 List!34589)) )
))
(declare-fun arrayNoDuplicates!0 (array!99466 (_ BitVec 32) List!34589) Bool)

(assert (=> b!1484943 (= res!1009860 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34586))))

(declare-fun b!1484944 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99466 (_ BitVec 32)) SeekEntryResult!12275)

(assert (=> b!1484944 (= e!832463 (= (seekEntryOrOpen!0 lt!647744 lt!647745 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647744 lt!647745 mask!2687)))))

(declare-fun b!1484945 () Bool)

(declare-fun res!1009858 () Bool)

(assert (=> b!1484945 (=> (not res!1009858) (not e!832462))))

(assert (=> b!1484945 (= res!1009858 (and (= (size!48562 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48562 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48562 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484946 () Bool)

(declare-fun res!1009869 () Bool)

(assert (=> b!1484946 (=> (not res!1009869) (not e!832462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484946 (= res!1009869 (validKeyInArray!0 (select (arr!48010 a!2862) j!93)))))

(declare-fun b!1484948 () Bool)

(assert (=> b!1484948 (= e!832469 e!832467)))

(declare-fun res!1009856 () Bool)

(assert (=> b!1484948 (=> res!1009856 e!832467)))

(assert (=> b!1484948 (= res!1009856 (or (and (= (select (arr!48010 a!2862) index!646) lt!647748) (= (select (arr!48010 a!2862) index!646) (select (arr!48010 a!2862) j!93))) (= (select (arr!48010 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484948 (= lt!647748 (select (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484949 () Bool)

(declare-fun res!1009855 () Bool)

(assert (=> b!1484949 (=> (not res!1009855) (not e!832460))))

(assert (=> b!1484949 (= res!1009855 e!832465)))

(declare-fun c!137065 () Bool)

(assert (=> b!1484949 (= c!137065 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484950 () Bool)

(declare-fun res!1009857 () Bool)

(assert (=> b!1484950 (=> (not res!1009857) (not e!832462))))

(assert (=> b!1484950 (= res!1009857 (validKeyInArray!0 (select (arr!48010 a!2862) i!1006)))))

(declare-fun b!1484951 () Bool)

(declare-fun res!1009871 () Bool)

(assert (=> b!1484951 (=> (not res!1009871) (not e!832462))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1484951 (= res!1009871 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48562 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48562 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48562 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484952 () Bool)

(declare-fun res!1009859 () Bool)

(assert (=> b!1484952 (=> (not res!1009859) (not e!832469))))

(assert (=> b!1484952 (= res!1009859 (or (= (select (arr!48010 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48010 a!2862) intermediateBeforeIndex!19) (select (arr!48010 a!2862) j!93))))))

(declare-fun b!1484953 () Bool)

(declare-fun e!832461 () Bool)

(assert (=> b!1484953 (= e!832462 e!832461)))

(declare-fun res!1009863 () Bool)

(assert (=> b!1484953 (=> (not res!1009863) (not e!832461))))

(assert (=> b!1484953 (= res!1009863 (= (select (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484953 (= lt!647745 (array!99467 (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48562 a!2862)))))

(declare-fun b!1484954 () Bool)

(declare-fun res!1009867 () Bool)

(assert (=> b!1484954 (=> (not res!1009867) (not e!832464))))

(declare-fun lt!647746 () SeekEntryResult!12275)

(assert (=> b!1484954 (= res!1009867 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48010 a!2862) j!93) a!2862 mask!2687) lt!647746))))

(declare-fun b!1484955 () Bool)

(assert (=> b!1484955 (= e!832461 e!832464)))

(declare-fun res!1009864 () Bool)

(assert (=> b!1484955 (=> (not res!1009864) (not e!832464))))

(assert (=> b!1484955 (= res!1009864 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48010 a!2862) j!93) mask!2687) (select (arr!48010 a!2862) j!93) a!2862 mask!2687) lt!647746))))

(assert (=> b!1484955 (= lt!647746 (Intermediate!12275 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1009862 () Bool)

(assert (=> start!126506 (=> (not res!1009862) (not e!832462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126506 (= res!1009862 (validMask!0 mask!2687))))

(assert (=> start!126506 e!832462))

(assert (=> start!126506 true))

(declare-fun array_inv!37243 (array!99466) Bool)

(assert (=> start!126506 (array_inv!37243 a!2862)))

(declare-fun b!1484947 () Bool)

(assert (=> b!1484947 (= e!832465 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647744 lt!647745 mask!2687) (seekEntryOrOpen!0 lt!647744 lt!647745 mask!2687)))))

(assert (= (and start!126506 res!1009862) b!1484945))

(assert (= (and b!1484945 res!1009858) b!1484950))

(assert (= (and b!1484950 res!1009857) b!1484946))

(assert (= (and b!1484946 res!1009869) b!1484938))

(assert (= (and b!1484938 res!1009861) b!1484943))

(assert (= (and b!1484943 res!1009860) b!1484951))

(assert (= (and b!1484951 res!1009871) b!1484953))

(assert (= (and b!1484953 res!1009863) b!1484955))

(assert (= (and b!1484955 res!1009864) b!1484954))

(assert (= (and b!1484954 res!1009867) b!1484936))

(assert (= (and b!1484936 res!1009872) b!1484949))

(assert (= (and b!1484949 c!137065) b!1484940))

(assert (= (and b!1484949 (not c!137065)) b!1484947))

(assert (= (and b!1484949 res!1009855) b!1484937))

(assert (= (and b!1484937 res!1009868) b!1484935))

(assert (= (and b!1484935 res!1009865) b!1484941))

(assert (= (and b!1484941 res!1009870) b!1484952))

(assert (= (and b!1484952 res!1009859) b!1484948))

(assert (= (and b!1484948 (not res!1009856)) b!1484939))

(assert (= (and b!1484939 res!1009873) b!1484944))

(assert (= (and b!1484935 (not res!1009866)) b!1484942))

(declare-fun m!1369557 () Bool)

(assert (=> b!1484940 m!1369557))

(declare-fun m!1369559 () Bool)

(assert (=> b!1484950 m!1369559))

(assert (=> b!1484950 m!1369559))

(declare-fun m!1369561 () Bool)

(assert (=> b!1484950 m!1369561))

(declare-fun m!1369563 () Bool)

(assert (=> b!1484955 m!1369563))

(assert (=> b!1484955 m!1369563))

(declare-fun m!1369565 () Bool)

(assert (=> b!1484955 m!1369565))

(assert (=> b!1484955 m!1369565))

(assert (=> b!1484955 m!1369563))

(declare-fun m!1369567 () Bool)

(assert (=> b!1484955 m!1369567))

(assert (=> b!1484941 m!1369563))

(assert (=> b!1484941 m!1369563))

(declare-fun m!1369569 () Bool)

(assert (=> b!1484941 m!1369569))

(assert (=> b!1484946 m!1369563))

(assert (=> b!1484946 m!1369563))

(declare-fun m!1369571 () Bool)

(assert (=> b!1484946 m!1369571))

(declare-fun m!1369573 () Bool)

(assert (=> b!1484938 m!1369573))

(declare-fun m!1369575 () Bool)

(assert (=> b!1484943 m!1369575))

(declare-fun m!1369577 () Bool)

(assert (=> b!1484953 m!1369577))

(declare-fun m!1369579 () Bool)

(assert (=> b!1484953 m!1369579))

(declare-fun m!1369581 () Bool)

(assert (=> b!1484952 m!1369581))

(assert (=> b!1484952 m!1369563))

(assert (=> b!1484954 m!1369563))

(assert (=> b!1484954 m!1369563))

(declare-fun m!1369583 () Bool)

(assert (=> b!1484954 m!1369583))

(declare-fun m!1369585 () Bool)

(assert (=> b!1484942 m!1369585))

(declare-fun m!1369587 () Bool)

(assert (=> b!1484935 m!1369587))

(assert (=> b!1484935 m!1369577))

(declare-fun m!1369589 () Bool)

(assert (=> b!1484935 m!1369589))

(declare-fun m!1369591 () Bool)

(assert (=> b!1484935 m!1369591))

(declare-fun m!1369593 () Bool)

(assert (=> b!1484935 m!1369593))

(assert (=> b!1484935 m!1369563))

(declare-fun m!1369595 () Bool)

(assert (=> start!126506 m!1369595))

(declare-fun m!1369597 () Bool)

(assert (=> start!126506 m!1369597))

(assert (=> b!1484948 m!1369591))

(assert (=> b!1484948 m!1369563))

(assert (=> b!1484948 m!1369577))

(assert (=> b!1484948 m!1369589))

(declare-fun m!1369599 () Bool)

(assert (=> b!1484947 m!1369599))

(declare-fun m!1369601 () Bool)

(assert (=> b!1484947 m!1369601))

(assert (=> b!1484944 m!1369601))

(assert (=> b!1484944 m!1369599))

(declare-fun m!1369603 () Bool)

(assert (=> b!1484936 m!1369603))

(assert (=> b!1484936 m!1369603))

(declare-fun m!1369605 () Bool)

(assert (=> b!1484936 m!1369605))

(assert (=> b!1484936 m!1369577))

(declare-fun m!1369607 () Bool)

(assert (=> b!1484936 m!1369607))

(check-sat (not start!126506) (not b!1484954) (not b!1484936) (not b!1484941) (not b!1484942) (not b!1484943) (not b!1484938) (not b!1484935) (not b!1484940) (not b!1484944) (not b!1484950) (not b!1484947) (not b!1484946) (not b!1484955))
(check-sat)
