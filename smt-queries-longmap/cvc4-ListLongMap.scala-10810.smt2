; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126512 () Bool)

(assert start!126512)

(declare-fun b!1483918 () Bool)

(declare-fun res!1008750 () Bool)

(declare-fun e!832031 () Bool)

(assert (=> b!1483918 (=> (not res!1008750) (not e!832031))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99474 0))(
  ( (array!99475 (arr!48013 (Array (_ BitVec 32) (_ BitVec 64))) (size!48563 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99474)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483918 (= res!1008750 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48563 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48563 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48563 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483919 () Bool)

(declare-fun res!1008752 () Bool)

(declare-fun e!832033 () Bool)

(assert (=> b!1483919 (=> (not res!1008752) (not e!832033))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12253 0))(
  ( (MissingZero!12253 (index!51404 (_ BitVec 32))) (Found!12253 (index!51405 (_ BitVec 32))) (Intermediate!12253 (undefined!13065 Bool) (index!51406 (_ BitVec 32)) (x!132985 (_ BitVec 32))) (Undefined!12253) (MissingVacant!12253 (index!51407 (_ BitVec 32))) )
))
(declare-fun lt!647592 () SeekEntryResult!12253)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99474 (_ BitVec 32)) SeekEntryResult!12253)

(assert (=> b!1483919 (= res!1008752 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48013 a!2862) j!93) a!2862 mask!2687) lt!647592))))

(declare-fun b!1483920 () Bool)

(declare-fun e!832030 () Bool)

(declare-fun e!832028 () Bool)

(assert (=> b!1483920 (= e!832030 e!832028)))

(declare-fun res!1008753 () Bool)

(assert (=> b!1483920 (=> res!1008753 e!832028)))

(declare-fun lt!647590 () (_ BitVec 64))

(assert (=> b!1483920 (= res!1008753 (or (and (= (select (arr!48013 a!2862) index!646) lt!647590) (= (select (arr!48013 a!2862) index!646) (select (arr!48013 a!2862) j!93))) (= (select (arr!48013 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1483920 (= lt!647590 (select (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483921 () Bool)

(declare-fun e!832035 () Bool)

(assert (=> b!1483921 (= e!832028 e!832035)))

(declare-fun res!1008754 () Bool)

(assert (=> b!1483921 (=> (not res!1008754) (not e!832035))))

(assert (=> b!1483921 (= res!1008754 (and (= index!646 intermediateAfterIndex!19) (= lt!647590 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!647591 () (_ BitVec 64))

(declare-fun b!1483922 () Bool)

(declare-fun e!832037 () Bool)

(declare-fun lt!647586 () array!99474)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99474 (_ BitVec 32)) SeekEntryResult!12253)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99474 (_ BitVec 32)) SeekEntryResult!12253)

(assert (=> b!1483922 (= e!832037 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647591 lt!647586 mask!2687) (seekEntryOrOpen!0 lt!647591 lt!647586 mask!2687)))))

(declare-fun b!1483923 () Bool)

(declare-fun e!832034 () Bool)

(assert (=> b!1483923 (= e!832031 e!832034)))

(declare-fun res!1008751 () Bool)

(assert (=> b!1483923 (=> (not res!1008751) (not e!832034))))

(assert (=> b!1483923 (= res!1008751 (= (select (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483923 (= lt!647586 (array!99475 (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48563 a!2862)))))

(declare-fun b!1483924 () Bool)

(declare-fun res!1008762 () Bool)

(assert (=> b!1483924 (=> (not res!1008762) (not e!832030))))

(assert (=> b!1483924 (= res!1008762 (= (seekEntryOrOpen!0 (select (arr!48013 a!2862) j!93) a!2862 mask!2687) (Found!12253 j!93)))))

(declare-fun b!1483925 () Bool)

(declare-fun res!1008749 () Bool)

(assert (=> b!1483925 (=> (not res!1008749) (not e!832031))))

(declare-datatypes ((List!34514 0))(
  ( (Nil!34511) (Cons!34510 (h!35884 (_ BitVec 64)) (t!49208 List!34514)) )
))
(declare-fun arrayNoDuplicates!0 (array!99474 (_ BitVec 32) List!34514) Bool)

(assert (=> b!1483925 (= res!1008749 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34511))))

(declare-fun b!1483926 () Bool)

(declare-fun res!1008759 () Bool)

(declare-fun e!832036 () Bool)

(assert (=> b!1483926 (=> (not res!1008759) (not e!832036))))

(assert (=> b!1483926 (= res!1008759 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483927 () Bool)

(declare-fun res!1008747 () Bool)

(assert (=> b!1483927 (=> (not res!1008747) (not e!832036))))

(assert (=> b!1483927 (= res!1008747 e!832037)))

(declare-fun c!137109 () Bool)

(assert (=> b!1483927 (= c!137109 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483928 () Bool)

(assert (=> b!1483928 (= e!832034 e!832033)))

(declare-fun res!1008757 () Bool)

(assert (=> b!1483928 (=> (not res!1008757) (not e!832033))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483928 (= res!1008757 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48013 a!2862) j!93) mask!2687) (select (arr!48013 a!2862) j!93) a!2862 mask!2687) lt!647592))))

(assert (=> b!1483928 (= lt!647592 (Intermediate!12253 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483929 () Bool)

(declare-fun e!832029 () Bool)

(assert (=> b!1483929 (= e!832029 true)))

(declare-fun lt!647587 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483929 (= lt!647587 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483930 () Bool)

(declare-fun res!1008763 () Bool)

(assert (=> b!1483930 (=> (not res!1008763) (not e!832031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483930 (= res!1008763 (validKeyInArray!0 (select (arr!48013 a!2862) j!93)))))

(declare-fun b!1483931 () Bool)

(declare-fun res!1008760 () Bool)

(assert (=> b!1483931 (=> (not res!1008760) (not e!832031))))

(assert (=> b!1483931 (= res!1008760 (and (= (size!48563 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48563 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48563 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483932 () Bool)

(declare-fun lt!647589 () SeekEntryResult!12253)

(assert (=> b!1483932 (= e!832037 (= lt!647589 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647591 lt!647586 mask!2687)))))

(declare-fun b!1483933 () Bool)

(declare-fun res!1008746 () Bool)

(assert (=> b!1483933 (=> (not res!1008746) (not e!832030))))

(assert (=> b!1483933 (= res!1008746 (or (= (select (arr!48013 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48013 a!2862) intermediateBeforeIndex!19) (select (arr!48013 a!2862) j!93))))))

(declare-fun b!1483934 () Bool)

(assert (=> b!1483934 (= e!832035 (= (seekEntryOrOpen!0 lt!647591 lt!647586 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647591 lt!647586 mask!2687)))))

(declare-fun b!1483935 () Bool)

(assert (=> b!1483935 (= e!832033 e!832036)))

(declare-fun res!1008756 () Bool)

(assert (=> b!1483935 (=> (not res!1008756) (not e!832036))))

(assert (=> b!1483935 (= res!1008756 (= lt!647589 (Intermediate!12253 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483935 (= lt!647589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647591 mask!2687) lt!647591 lt!647586 mask!2687))))

(assert (=> b!1483935 (= lt!647591 (select (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1008755 () Bool)

(assert (=> start!126512 (=> (not res!1008755) (not e!832031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126512 (= res!1008755 (validMask!0 mask!2687))))

(assert (=> start!126512 e!832031))

(assert (=> start!126512 true))

(declare-fun array_inv!37041 (array!99474) Bool)

(assert (=> start!126512 (array_inv!37041 a!2862)))

(declare-fun b!1483936 () Bool)

(assert (=> b!1483936 (= e!832036 (not e!832029))))

(declare-fun res!1008761 () Bool)

(assert (=> b!1483936 (=> res!1008761 e!832029)))

(assert (=> b!1483936 (= res!1008761 (or (and (= (select (arr!48013 a!2862) index!646) (select (store (arr!48013 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48013 a!2862) index!646) (select (arr!48013 a!2862) j!93))) (= (select (arr!48013 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483936 e!832030))

(declare-fun res!1008758 () Bool)

(assert (=> b!1483936 (=> (not res!1008758) (not e!832030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99474 (_ BitVec 32)) Bool)

(assert (=> b!1483936 (= res!1008758 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49846 0))(
  ( (Unit!49847) )
))
(declare-fun lt!647588 () Unit!49846)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99474 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49846)

(assert (=> b!1483936 (= lt!647588 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483937 () Bool)

(declare-fun res!1008745 () Bool)

(assert (=> b!1483937 (=> (not res!1008745) (not e!832031))))

(assert (=> b!1483937 (= res!1008745 (validKeyInArray!0 (select (arr!48013 a!2862) i!1006)))))

(declare-fun b!1483938 () Bool)

(declare-fun res!1008748 () Bool)

(assert (=> b!1483938 (=> (not res!1008748) (not e!832031))))

(assert (=> b!1483938 (= res!1008748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126512 res!1008755) b!1483931))

(assert (= (and b!1483931 res!1008760) b!1483937))

(assert (= (and b!1483937 res!1008745) b!1483930))

(assert (= (and b!1483930 res!1008763) b!1483938))

(assert (= (and b!1483938 res!1008748) b!1483925))

(assert (= (and b!1483925 res!1008749) b!1483918))

(assert (= (and b!1483918 res!1008750) b!1483923))

(assert (= (and b!1483923 res!1008751) b!1483928))

(assert (= (and b!1483928 res!1008757) b!1483919))

(assert (= (and b!1483919 res!1008752) b!1483935))

(assert (= (and b!1483935 res!1008756) b!1483927))

(assert (= (and b!1483927 c!137109) b!1483932))

(assert (= (and b!1483927 (not c!137109)) b!1483922))

(assert (= (and b!1483927 res!1008747) b!1483926))

(assert (= (and b!1483926 res!1008759) b!1483936))

(assert (= (and b!1483936 res!1008758) b!1483924))

(assert (= (and b!1483924 res!1008762) b!1483933))

(assert (= (and b!1483933 res!1008746) b!1483920))

(assert (= (and b!1483920 (not res!1008753)) b!1483921))

(assert (= (and b!1483921 res!1008754) b!1483934))

(assert (= (and b!1483936 (not res!1008761)) b!1483929))

(declare-fun m!1369317 () Bool)

(assert (=> start!126512 m!1369317))

(declare-fun m!1369319 () Bool)

(assert (=> start!126512 m!1369319))

(declare-fun m!1369321 () Bool)

(assert (=> b!1483923 m!1369321))

(declare-fun m!1369323 () Bool)

(assert (=> b!1483923 m!1369323))

(declare-fun m!1369325 () Bool)

(assert (=> b!1483924 m!1369325))

(assert (=> b!1483924 m!1369325))

(declare-fun m!1369327 () Bool)

(assert (=> b!1483924 m!1369327))

(declare-fun m!1369329 () Bool)

(assert (=> b!1483922 m!1369329))

(declare-fun m!1369331 () Bool)

(assert (=> b!1483922 m!1369331))

(assert (=> b!1483919 m!1369325))

(assert (=> b!1483919 m!1369325))

(declare-fun m!1369333 () Bool)

(assert (=> b!1483919 m!1369333))

(declare-fun m!1369335 () Bool)

(assert (=> b!1483920 m!1369335))

(assert (=> b!1483920 m!1369325))

(assert (=> b!1483920 m!1369321))

(declare-fun m!1369337 () Bool)

(assert (=> b!1483920 m!1369337))

(declare-fun m!1369339 () Bool)

(assert (=> b!1483935 m!1369339))

(assert (=> b!1483935 m!1369339))

(declare-fun m!1369341 () Bool)

(assert (=> b!1483935 m!1369341))

(assert (=> b!1483935 m!1369321))

(declare-fun m!1369343 () Bool)

(assert (=> b!1483935 m!1369343))

(declare-fun m!1369345 () Bool)

(assert (=> b!1483938 m!1369345))

(declare-fun m!1369347 () Bool)

(assert (=> b!1483925 m!1369347))

(declare-fun m!1369349 () Bool)

(assert (=> b!1483932 m!1369349))

(declare-fun m!1369351 () Bool)

(assert (=> b!1483937 m!1369351))

(assert (=> b!1483937 m!1369351))

(declare-fun m!1369353 () Bool)

(assert (=> b!1483937 m!1369353))

(assert (=> b!1483930 m!1369325))

(assert (=> b!1483930 m!1369325))

(declare-fun m!1369355 () Bool)

(assert (=> b!1483930 m!1369355))

(declare-fun m!1369357 () Bool)

(assert (=> b!1483929 m!1369357))

(declare-fun m!1369359 () Bool)

(assert (=> b!1483936 m!1369359))

(assert (=> b!1483936 m!1369321))

(assert (=> b!1483936 m!1369337))

(assert (=> b!1483936 m!1369335))

(declare-fun m!1369361 () Bool)

(assert (=> b!1483936 m!1369361))

(assert (=> b!1483936 m!1369325))

(assert (=> b!1483928 m!1369325))

(assert (=> b!1483928 m!1369325))

(declare-fun m!1369363 () Bool)

(assert (=> b!1483928 m!1369363))

(assert (=> b!1483928 m!1369363))

(assert (=> b!1483928 m!1369325))

(declare-fun m!1369365 () Bool)

(assert (=> b!1483928 m!1369365))

(assert (=> b!1483934 m!1369331))

(assert (=> b!1483934 m!1369329))

(declare-fun m!1369367 () Bool)

(assert (=> b!1483933 m!1369367))

(assert (=> b!1483933 m!1369325))

(push 1)

