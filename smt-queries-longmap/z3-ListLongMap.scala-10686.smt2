; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125256 () Bool)

(assert start!125256)

(declare-fun b!1461921 () Bool)

(declare-fun e!821835 () Bool)

(declare-fun e!821838 () Bool)

(assert (=> b!1461921 (= e!821835 e!821838)))

(declare-fun res!991452 () Bool)

(assert (=> b!1461921 (=> (not res!991452) (not e!821838))))

(declare-datatypes ((SeekEntryResult!11892 0))(
  ( (MissingZero!11892 (index!49960 (_ BitVec 32))) (Found!11892 (index!49961 (_ BitVec 32))) (Intermediate!11892 (undefined!12704 Bool) (index!49962 (_ BitVec 32)) (x!131557 (_ BitVec 32))) (Undefined!11892) (MissingVacant!11892 (index!49963 (_ BitVec 32))) )
))
(declare-fun lt!640285 () SeekEntryResult!11892)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461921 (= res!991452 (= lt!640285 (Intermediate!11892 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640286 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98704 0))(
  ( (array!98705 (arr!47640 (Array (_ BitVec 32) (_ BitVec 64))) (size!48190 (_ BitVec 32))) )
))
(declare-fun lt!640288 () array!98704)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98704 (_ BitVec 32)) SeekEntryResult!11892)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461921 (= lt!640285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640286 mask!2687) lt!640286 lt!640288 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98704)

(assert (=> b!1461921 (= lt!640286 (select (store (arr!47640 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461922 () Bool)

(declare-fun res!991459 () Bool)

(declare-fun e!821831 () Bool)

(assert (=> b!1461922 (=> (not res!991459) (not e!821831))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98704 (_ BitVec 32)) SeekEntryResult!11892)

(assert (=> b!1461922 (= res!991459 (= (seekEntryOrOpen!0 (select (arr!47640 a!2862) j!93) a!2862 mask!2687) (Found!11892 j!93)))))

(declare-fun b!1461924 () Bool)

(declare-fun res!991451 () Bool)

(assert (=> b!1461924 (=> (not res!991451) (not e!821838))))

(declare-fun e!821840 () Bool)

(assert (=> b!1461924 (= res!991451 e!821840)))

(declare-fun c!134747 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1461924 (= c!134747 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461925 () Bool)

(declare-fun res!991460 () Bool)

(assert (=> b!1461925 (=> (not res!991460) (not e!821838))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461925 (= res!991460 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461926 () Bool)

(declare-fun res!991461 () Bool)

(declare-fun e!821833 () Bool)

(assert (=> b!1461926 (=> (not res!991461) (not e!821833))))

(declare-datatypes ((List!34141 0))(
  ( (Nil!34138) (Cons!34137 (h!35487 (_ BitVec 64)) (t!48835 List!34141)) )
))
(declare-fun arrayNoDuplicates!0 (array!98704 (_ BitVec 32) List!34141) Bool)

(assert (=> b!1461926 (= res!991461 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34138))))

(declare-fun b!1461927 () Bool)

(declare-fun e!821832 () Bool)

(assert (=> b!1461927 (= e!821832 e!821835)))

(declare-fun res!991454 () Bool)

(assert (=> b!1461927 (=> (not res!991454) (not e!821835))))

(declare-fun lt!640284 () SeekEntryResult!11892)

(assert (=> b!1461927 (= res!991454 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47640 a!2862) j!93) mask!2687) (select (arr!47640 a!2862) j!93) a!2862 mask!2687) lt!640284))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1461927 (= lt!640284 (Intermediate!11892 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461928 () Bool)

(declare-fun e!821836 () Bool)

(assert (=> b!1461928 (= e!821838 (not e!821836))))

(declare-fun res!991462 () Bool)

(assert (=> b!1461928 (=> res!991462 e!821836)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1461928 (= res!991462 (or (and (= (select (arr!47640 a!2862) index!646) (select (store (arr!47640 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47640 a!2862) index!646) (select (arr!47640 a!2862) j!93))) (= (select (arr!47640 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461928 e!821831))

(declare-fun res!991457 () Bool)

(assert (=> b!1461928 (=> (not res!991457) (not e!821831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98704 (_ BitVec 32)) Bool)

(assert (=> b!1461928 (= res!991457 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49280 0))(
  ( (Unit!49281) )
))
(declare-fun lt!640287 () Unit!49280)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49280)

(assert (=> b!1461928 (= lt!640287 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461929 () Bool)

(declare-fun res!991450 () Bool)

(assert (=> b!1461929 (=> (not res!991450) (not e!821833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461929 (= res!991450 (validKeyInArray!0 (select (arr!47640 a!2862) i!1006)))))

(declare-fun b!1461930 () Bool)

(declare-fun lt!640290 () (_ BitVec 32))

(declare-fun e!821839 () Bool)

(assert (=> b!1461930 (= e!821839 (not (= lt!640285 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640290 lt!640286 lt!640288 mask!2687))))))

(declare-fun b!1461931 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98704 (_ BitVec 32)) SeekEntryResult!11892)

(assert (=> b!1461931 (= e!821840 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640286 lt!640288 mask!2687) (seekEntryOrOpen!0 lt!640286 lt!640288 mask!2687)))))

(declare-fun b!1461932 () Bool)

(assert (=> b!1461932 (= e!821840 (= lt!640285 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640286 lt!640288 mask!2687)))))

(declare-fun b!1461933 () Bool)

(declare-fun res!991456 () Bool)

(assert (=> b!1461933 (=> (not res!991456) (not e!821833))))

(assert (=> b!1461933 (= res!991456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461934 () Bool)

(declare-fun e!821834 () Bool)

(assert (=> b!1461934 (= e!821834 true)))

(declare-fun lt!640289 () Bool)

(assert (=> b!1461934 (= lt!640289 e!821839)))

(declare-fun c!134748 () Bool)

(assert (=> b!1461934 (= c!134748 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461935 () Bool)

(declare-fun res!991464 () Bool)

(assert (=> b!1461935 (=> (not res!991464) (not e!821833))))

(assert (=> b!1461935 (= res!991464 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48190 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48190 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48190 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461923 () Bool)

(assert (=> b!1461923 (= e!821836 e!821834)))

(declare-fun res!991463 () Bool)

(assert (=> b!1461923 (=> res!991463 e!821834)))

(assert (=> b!1461923 (= res!991463 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640290 #b00000000000000000000000000000000) (bvsge lt!640290 (size!48190 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461923 (= lt!640290 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!991448 () Bool)

(assert (=> start!125256 (=> (not res!991448) (not e!821833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125256 (= res!991448 (validMask!0 mask!2687))))

(assert (=> start!125256 e!821833))

(assert (=> start!125256 true))

(declare-fun array_inv!36668 (array!98704) Bool)

(assert (=> start!125256 (array_inv!36668 a!2862)))

(declare-fun b!1461936 () Bool)

(declare-fun res!991458 () Bool)

(assert (=> b!1461936 (=> (not res!991458) (not e!821833))))

(assert (=> b!1461936 (= res!991458 (validKeyInArray!0 (select (arr!47640 a!2862) j!93)))))

(declare-fun b!1461937 () Bool)

(declare-fun res!991449 () Bool)

(assert (=> b!1461937 (=> res!991449 e!821834)))

(assert (=> b!1461937 (= res!991449 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640290 (select (arr!47640 a!2862) j!93) a!2862 mask!2687) lt!640284)))))

(declare-fun b!1461938 () Bool)

(assert (=> b!1461938 (= e!821831 (or (= (select (arr!47640 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47640 a!2862) intermediateBeforeIndex!19) (select (arr!47640 a!2862) j!93))))))

(declare-fun b!1461939 () Bool)

(assert (=> b!1461939 (= e!821839 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640290 intermediateAfterIndex!19 lt!640286 lt!640288 mask!2687) (seekEntryOrOpen!0 lt!640286 lt!640288 mask!2687))))))

(declare-fun b!1461940 () Bool)

(declare-fun res!991465 () Bool)

(assert (=> b!1461940 (=> (not res!991465) (not e!821833))))

(assert (=> b!1461940 (= res!991465 (and (= (size!48190 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48190 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48190 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461941 () Bool)

(assert (=> b!1461941 (= e!821833 e!821832)))

(declare-fun res!991453 () Bool)

(assert (=> b!1461941 (=> (not res!991453) (not e!821832))))

(assert (=> b!1461941 (= res!991453 (= (select (store (arr!47640 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461941 (= lt!640288 (array!98705 (store (arr!47640 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48190 a!2862)))))

(declare-fun b!1461942 () Bool)

(declare-fun res!991455 () Bool)

(assert (=> b!1461942 (=> (not res!991455) (not e!821835))))

(assert (=> b!1461942 (= res!991455 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47640 a!2862) j!93) a!2862 mask!2687) lt!640284))))

(assert (= (and start!125256 res!991448) b!1461940))

(assert (= (and b!1461940 res!991465) b!1461929))

(assert (= (and b!1461929 res!991450) b!1461936))

(assert (= (and b!1461936 res!991458) b!1461933))

(assert (= (and b!1461933 res!991456) b!1461926))

(assert (= (and b!1461926 res!991461) b!1461935))

(assert (= (and b!1461935 res!991464) b!1461941))

(assert (= (and b!1461941 res!991453) b!1461927))

(assert (= (and b!1461927 res!991454) b!1461942))

(assert (= (and b!1461942 res!991455) b!1461921))

(assert (= (and b!1461921 res!991452) b!1461924))

(assert (= (and b!1461924 c!134747) b!1461932))

(assert (= (and b!1461924 (not c!134747)) b!1461931))

(assert (= (and b!1461924 res!991451) b!1461925))

(assert (= (and b!1461925 res!991460) b!1461928))

(assert (= (and b!1461928 res!991457) b!1461922))

(assert (= (and b!1461922 res!991459) b!1461938))

(assert (= (and b!1461928 (not res!991462)) b!1461923))

(assert (= (and b!1461923 (not res!991463)) b!1461937))

(assert (= (and b!1461937 (not res!991449)) b!1461934))

(assert (= (and b!1461934 c!134748) b!1461930))

(assert (= (and b!1461934 (not c!134748)) b!1461939))

(declare-fun m!1349441 () Bool)

(assert (=> b!1461937 m!1349441))

(assert (=> b!1461937 m!1349441))

(declare-fun m!1349443 () Bool)

(assert (=> b!1461937 m!1349443))

(declare-fun m!1349445 () Bool)

(assert (=> b!1461931 m!1349445))

(declare-fun m!1349447 () Bool)

(assert (=> b!1461931 m!1349447))

(declare-fun m!1349449 () Bool)

(assert (=> b!1461928 m!1349449))

(declare-fun m!1349451 () Bool)

(assert (=> b!1461928 m!1349451))

(declare-fun m!1349453 () Bool)

(assert (=> b!1461928 m!1349453))

(declare-fun m!1349455 () Bool)

(assert (=> b!1461928 m!1349455))

(declare-fun m!1349457 () Bool)

(assert (=> b!1461928 m!1349457))

(assert (=> b!1461928 m!1349441))

(assert (=> b!1461936 m!1349441))

(assert (=> b!1461936 m!1349441))

(declare-fun m!1349459 () Bool)

(assert (=> b!1461936 m!1349459))

(declare-fun m!1349461 () Bool)

(assert (=> b!1461933 m!1349461))

(declare-fun m!1349463 () Bool)

(assert (=> b!1461930 m!1349463))

(declare-fun m!1349465 () Bool)

(assert (=> b!1461938 m!1349465))

(assert (=> b!1461938 m!1349441))

(assert (=> b!1461941 m!1349451))

(declare-fun m!1349467 () Bool)

(assert (=> b!1461941 m!1349467))

(declare-fun m!1349469 () Bool)

(assert (=> b!1461929 m!1349469))

(assert (=> b!1461929 m!1349469))

(declare-fun m!1349471 () Bool)

(assert (=> b!1461929 m!1349471))

(declare-fun m!1349473 () Bool)

(assert (=> b!1461923 m!1349473))

(assert (=> b!1461927 m!1349441))

(assert (=> b!1461927 m!1349441))

(declare-fun m!1349475 () Bool)

(assert (=> b!1461927 m!1349475))

(assert (=> b!1461927 m!1349475))

(assert (=> b!1461927 m!1349441))

(declare-fun m!1349477 () Bool)

(assert (=> b!1461927 m!1349477))

(declare-fun m!1349479 () Bool)

(assert (=> b!1461932 m!1349479))

(assert (=> b!1461942 m!1349441))

(assert (=> b!1461942 m!1349441))

(declare-fun m!1349481 () Bool)

(assert (=> b!1461942 m!1349481))

(declare-fun m!1349483 () Bool)

(assert (=> b!1461939 m!1349483))

(assert (=> b!1461939 m!1349447))

(assert (=> b!1461922 m!1349441))

(assert (=> b!1461922 m!1349441))

(declare-fun m!1349485 () Bool)

(assert (=> b!1461922 m!1349485))

(declare-fun m!1349487 () Bool)

(assert (=> b!1461926 m!1349487))

(declare-fun m!1349489 () Bool)

(assert (=> b!1461921 m!1349489))

(assert (=> b!1461921 m!1349489))

(declare-fun m!1349491 () Bool)

(assert (=> b!1461921 m!1349491))

(assert (=> b!1461921 m!1349451))

(declare-fun m!1349493 () Bool)

(assert (=> b!1461921 m!1349493))

(declare-fun m!1349495 () Bool)

(assert (=> start!125256 m!1349495))

(declare-fun m!1349497 () Bool)

(assert (=> start!125256 m!1349497))

(check-sat (not start!125256) (not b!1461922) (not b!1461923) (not b!1461926) (not b!1461942) (not b!1461936) (not b!1461931) (not b!1461927) (not b!1461937) (not b!1461932) (not b!1461930) (not b!1461928) (not b!1461933) (not b!1461921) (not b!1461929) (not b!1461939))
(check-sat)
