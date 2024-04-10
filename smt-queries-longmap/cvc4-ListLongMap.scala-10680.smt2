; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125222 () Bool)

(assert start!125222)

(declare-fun b!1460804 () Bool)

(declare-fun e!821324 () Bool)

(declare-fun e!821330 () Bool)

(assert (=> b!1460804 (= e!821324 e!821330)))

(declare-fun res!990539 () Bool)

(assert (=> b!1460804 (=> (not res!990539) (not e!821330))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98670 0))(
  ( (array!98671 (arr!47623 (Array (_ BitVec 32) (_ BitVec 64))) (size!48173 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98670)

(assert (=> b!1460804 (= res!990539 (= (select (store (arr!47623 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!639932 () array!98670)

(assert (=> b!1460804 (= lt!639932 (array!98671 (store (arr!47623 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48173 a!2862)))))

(declare-fun b!1460805 () Bool)

(declare-fun res!990536 () Bool)

(assert (=> b!1460805 (=> (not res!990536) (not e!821324))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460805 (= res!990536 (validKeyInArray!0 (select (arr!47623 a!2862) j!93)))))

(declare-fun b!1460806 () Bool)

(declare-fun res!990547 () Bool)

(assert (=> b!1460806 (=> (not res!990547) (not e!821324))))

(declare-datatypes ((List!34124 0))(
  ( (Nil!34121) (Cons!34120 (h!35470 (_ BitVec 64)) (t!48818 List!34124)) )
))
(declare-fun arrayNoDuplicates!0 (array!98670 (_ BitVec 32) List!34124) Bool)

(assert (=> b!1460806 (= res!990547 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34121))))

(declare-fun b!1460807 () Bool)

(declare-fun e!821326 () Bool)

(declare-fun e!821328 () Bool)

(assert (=> b!1460807 (= e!821326 e!821328)))

(declare-fun res!990537 () Bool)

(assert (=> b!1460807 (=> (not res!990537) (not e!821328))))

(declare-datatypes ((SeekEntryResult!11875 0))(
  ( (MissingZero!11875 (index!49892 (_ BitVec 32))) (Found!11875 (index!49893 (_ BitVec 32))) (Intermediate!11875 (undefined!12687 Bool) (index!49894 (_ BitVec 32)) (x!131492 (_ BitVec 32))) (Undefined!11875) (MissingVacant!11875 (index!49895 (_ BitVec 32))) )
))
(declare-fun lt!639931 () SeekEntryResult!11875)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460807 (= res!990537 (= lt!639931 (Intermediate!11875 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639929 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98670 (_ BitVec 32)) SeekEntryResult!11875)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460807 (= lt!639931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639929 mask!2687) lt!639929 lt!639932 mask!2687))))

(assert (=> b!1460807 (= lt!639929 (select (store (arr!47623 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460808 () Bool)

(assert (=> b!1460808 (= e!821328 (not true))))

(declare-fun e!821327 () Bool)

(assert (=> b!1460808 e!821327))

(declare-fun res!990545 () Bool)

(assert (=> b!1460808 (=> (not res!990545) (not e!821327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98670 (_ BitVec 32)) Bool)

(assert (=> b!1460808 (= res!990545 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49246 0))(
  ( (Unit!49247) )
))
(declare-fun lt!639933 () Unit!49246)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49246)

(assert (=> b!1460808 (= lt!639933 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460809 () Bool)

(declare-fun res!990535 () Bool)

(assert (=> b!1460809 (=> (not res!990535) (not e!821324))))

(assert (=> b!1460809 (= res!990535 (validKeyInArray!0 (select (arr!47623 a!2862) i!1006)))))

(declare-fun b!1460810 () Bool)

(declare-fun res!990543 () Bool)

(assert (=> b!1460810 (=> (not res!990543) (not e!821324))))

(assert (=> b!1460810 (= res!990543 (and (= (size!48173 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48173 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48173 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460811 () Bool)

(declare-fun res!990534 () Bool)

(assert (=> b!1460811 (=> (not res!990534) (not e!821328))))

(declare-fun e!821325 () Bool)

(assert (=> b!1460811 (= res!990534 e!821325)))

(declare-fun c!134646 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1460811 (= c!134646 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460812 () Bool)

(assert (=> b!1460812 (= e!821330 e!821326)))

(declare-fun res!990546 () Bool)

(assert (=> b!1460812 (=> (not res!990546) (not e!821326))))

(declare-fun lt!639930 () SeekEntryResult!11875)

(assert (=> b!1460812 (= res!990546 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47623 a!2862) j!93) mask!2687) (select (arr!47623 a!2862) j!93) a!2862 mask!2687) lt!639930))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460812 (= lt!639930 (Intermediate!11875 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460813 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98670 (_ BitVec 32)) SeekEntryResult!11875)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98670 (_ BitVec 32)) SeekEntryResult!11875)

(assert (=> b!1460813 (= e!821325 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639929 lt!639932 mask!2687) (seekEntryOrOpen!0 lt!639929 lt!639932 mask!2687)))))

(declare-fun b!1460815 () Bool)

(declare-fun res!990533 () Bool)

(assert (=> b!1460815 (=> (not res!990533) (not e!821326))))

(assert (=> b!1460815 (= res!990533 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47623 a!2862) j!93) a!2862 mask!2687) lt!639930))))

(declare-fun b!1460816 () Bool)

(declare-fun res!990538 () Bool)

(assert (=> b!1460816 (=> (not res!990538) (not e!821324))))

(assert (=> b!1460816 (= res!990538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460817 () Bool)

(assert (=> b!1460817 (= e!821327 (or (= (select (arr!47623 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47623 a!2862) intermediateBeforeIndex!19) (select (arr!47623 a!2862) j!93))))))

(declare-fun b!1460818 () Bool)

(assert (=> b!1460818 (= e!821325 (= lt!639931 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639929 lt!639932 mask!2687)))))

(declare-fun b!1460819 () Bool)

(declare-fun res!990541 () Bool)

(assert (=> b!1460819 (=> (not res!990541) (not e!821324))))

(assert (=> b!1460819 (= res!990541 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48173 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48173 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48173 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460820 () Bool)

(declare-fun res!990544 () Bool)

(assert (=> b!1460820 (=> (not res!990544) (not e!821328))))

(assert (=> b!1460820 (= res!990544 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460814 () Bool)

(declare-fun res!990542 () Bool)

(assert (=> b!1460814 (=> (not res!990542) (not e!821327))))

(assert (=> b!1460814 (= res!990542 (= (seekEntryOrOpen!0 (select (arr!47623 a!2862) j!93) a!2862 mask!2687) (Found!11875 j!93)))))

(declare-fun res!990540 () Bool)

(assert (=> start!125222 (=> (not res!990540) (not e!821324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125222 (= res!990540 (validMask!0 mask!2687))))

(assert (=> start!125222 e!821324))

(assert (=> start!125222 true))

(declare-fun array_inv!36651 (array!98670) Bool)

(assert (=> start!125222 (array_inv!36651 a!2862)))

(assert (= (and start!125222 res!990540) b!1460810))

(assert (= (and b!1460810 res!990543) b!1460809))

(assert (= (and b!1460809 res!990535) b!1460805))

(assert (= (and b!1460805 res!990536) b!1460816))

(assert (= (and b!1460816 res!990538) b!1460806))

(assert (= (and b!1460806 res!990547) b!1460819))

(assert (= (and b!1460819 res!990541) b!1460804))

(assert (= (and b!1460804 res!990539) b!1460812))

(assert (= (and b!1460812 res!990546) b!1460815))

(assert (= (and b!1460815 res!990533) b!1460807))

(assert (= (and b!1460807 res!990537) b!1460811))

(assert (= (and b!1460811 c!134646) b!1460818))

(assert (= (and b!1460811 (not c!134646)) b!1460813))

(assert (= (and b!1460811 res!990534) b!1460820))

(assert (= (and b!1460820 res!990544) b!1460808))

(assert (= (and b!1460808 res!990545) b!1460814))

(assert (= (and b!1460814 res!990542) b!1460817))

(declare-fun m!1348467 () Bool)

(assert (=> b!1460817 m!1348467))

(declare-fun m!1348469 () Bool)

(assert (=> b!1460817 m!1348469))

(declare-fun m!1348471 () Bool)

(assert (=> b!1460818 m!1348471))

(declare-fun m!1348473 () Bool)

(assert (=> b!1460813 m!1348473))

(declare-fun m!1348475 () Bool)

(assert (=> b!1460813 m!1348475))

(declare-fun m!1348477 () Bool)

(assert (=> b!1460808 m!1348477))

(declare-fun m!1348479 () Bool)

(assert (=> b!1460808 m!1348479))

(declare-fun m!1348481 () Bool)

(assert (=> b!1460807 m!1348481))

(assert (=> b!1460807 m!1348481))

(declare-fun m!1348483 () Bool)

(assert (=> b!1460807 m!1348483))

(declare-fun m!1348485 () Bool)

(assert (=> b!1460807 m!1348485))

(declare-fun m!1348487 () Bool)

(assert (=> b!1460807 m!1348487))

(declare-fun m!1348489 () Bool)

(assert (=> start!125222 m!1348489))

(declare-fun m!1348491 () Bool)

(assert (=> start!125222 m!1348491))

(assert (=> b!1460804 m!1348485))

(declare-fun m!1348493 () Bool)

(assert (=> b!1460804 m!1348493))

(assert (=> b!1460814 m!1348469))

(assert (=> b!1460814 m!1348469))

(declare-fun m!1348495 () Bool)

(assert (=> b!1460814 m!1348495))

(declare-fun m!1348497 () Bool)

(assert (=> b!1460809 m!1348497))

(assert (=> b!1460809 m!1348497))

(declare-fun m!1348499 () Bool)

(assert (=> b!1460809 m!1348499))

(declare-fun m!1348501 () Bool)

(assert (=> b!1460816 m!1348501))

(assert (=> b!1460805 m!1348469))

(assert (=> b!1460805 m!1348469))

(declare-fun m!1348503 () Bool)

(assert (=> b!1460805 m!1348503))

(assert (=> b!1460812 m!1348469))

(assert (=> b!1460812 m!1348469))

(declare-fun m!1348505 () Bool)

(assert (=> b!1460812 m!1348505))

(assert (=> b!1460812 m!1348505))

(assert (=> b!1460812 m!1348469))

(declare-fun m!1348507 () Bool)

(assert (=> b!1460812 m!1348507))

(declare-fun m!1348509 () Bool)

(assert (=> b!1460806 m!1348509))

(assert (=> b!1460815 m!1348469))

(assert (=> b!1460815 m!1348469))

(declare-fun m!1348511 () Bool)

(assert (=> b!1460815 m!1348511))

(push 1)

