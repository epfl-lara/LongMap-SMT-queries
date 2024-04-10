; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126146 () Bool)

(assert start!126146)

(declare-fun b!1476922 () Bool)

(declare-fun res!1003112 () Bool)

(declare-fun e!828590 () Bool)

(assert (=> b!1476922 (=> (not res!1003112) (not e!828590))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476922 (= res!1003112 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-datatypes ((SeekEntryResult!12145 0))(
  ( (MissingZero!12145 (index!50972 (_ BitVec 32))) (Found!12145 (index!50973 (_ BitVec 32))) (Intermediate!12145 (undefined!12957 Bool) (index!50974 (_ BitVec 32)) (x!132568 (_ BitVec 32))) (Undefined!12145) (MissingVacant!12145 (index!50975 (_ BitVec 32))) )
))
(declare-fun lt!645176 () SeekEntryResult!12145)

(declare-fun lt!645180 () (_ BitVec 64))

(declare-fun e!828592 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1476923 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99252 0))(
  ( (array!99253 (arr!47905 (Array (_ BitVec 32) (_ BitVec 64))) (size!48455 (_ BitVec 32))) )
))
(declare-fun lt!645175 () array!99252)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99252 (_ BitVec 32)) SeekEntryResult!12145)

(assert (=> b!1476923 (= e!828592 (= lt!645176 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645180 lt!645175 mask!2687)))))

(declare-fun b!1476924 () Bool)

(assert (=> b!1476924 (= e!828590 (not true))))

(declare-fun e!828589 () Bool)

(assert (=> b!1476924 e!828589))

(declare-fun res!1003107 () Bool)

(assert (=> b!1476924 (=> (not res!1003107) (not e!828589))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun a!2862 () array!99252)

(declare-fun lt!645178 () SeekEntryResult!12145)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1476924 (= res!1003107 (and (= lt!645178 (Found!12145 j!93)) (or (= (select (arr!47905 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47905 a!2862) intermediateBeforeIndex!19) (select (arr!47905 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99252 (_ BitVec 32)) SeekEntryResult!12145)

(assert (=> b!1476924 (= lt!645178 (seekEntryOrOpen!0 (select (arr!47905 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99252 (_ BitVec 32)) Bool)

(assert (=> b!1476924 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49630 0))(
  ( (Unit!49631) )
))
(declare-fun lt!645177 () Unit!49630)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99252 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49630)

(assert (=> b!1476924 (= lt!645177 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476925 () Bool)

(declare-fun e!828593 () Bool)

(assert (=> b!1476925 (= e!828593 e!828590)))

(declare-fun res!1003106 () Bool)

(assert (=> b!1476925 (=> (not res!1003106) (not e!828590))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476925 (= res!1003106 (= lt!645176 (Intermediate!12145 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476925 (= lt!645176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645180 mask!2687) lt!645180 lt!645175 mask!2687))))

(assert (=> b!1476925 (= lt!645180 (select (store (arr!47905 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476926 () Bool)

(declare-fun e!828591 () Bool)

(assert (=> b!1476926 (= e!828591 e!828593)))

(declare-fun res!1003113 () Bool)

(assert (=> b!1476926 (=> (not res!1003113) (not e!828593))))

(declare-fun lt!645179 () SeekEntryResult!12145)

(assert (=> b!1476926 (= res!1003113 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47905 a!2862) j!93) mask!2687) (select (arr!47905 a!2862) j!93) a!2862 mask!2687) lt!645179))))

(assert (=> b!1476926 (= lt!645179 (Intermediate!12145 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476927 () Bool)

(declare-fun res!1003105 () Bool)

(declare-fun e!828586 () Bool)

(assert (=> b!1476927 (=> (not res!1003105) (not e!828586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476927 (= res!1003105 (validKeyInArray!0 (select (arr!47905 a!2862) j!93)))))

(declare-fun b!1476928 () Bool)

(declare-fun res!1003117 () Bool)

(assert (=> b!1476928 (=> (not res!1003117) (not e!828586))))

(assert (=> b!1476928 (= res!1003117 (validKeyInArray!0 (select (arr!47905 a!2862) i!1006)))))

(declare-fun b!1476929 () Bool)

(declare-fun res!1003109 () Bool)

(assert (=> b!1476929 (=> (not res!1003109) (not e!828586))))

(assert (=> b!1476929 (= res!1003109 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48455 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48455 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48455 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476930 () Bool)

(assert (=> b!1476930 (= e!828586 e!828591)))

(declare-fun res!1003118 () Bool)

(assert (=> b!1476930 (=> (not res!1003118) (not e!828591))))

(assert (=> b!1476930 (= res!1003118 (= (select (store (arr!47905 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476930 (= lt!645175 (array!99253 (store (arr!47905 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48455 a!2862)))))

(declare-fun b!1476931 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99252 (_ BitVec 32)) SeekEntryResult!12145)

(assert (=> b!1476931 (= e!828592 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645180 lt!645175 mask!2687) (seekEntryOrOpen!0 lt!645180 lt!645175 mask!2687)))))

(declare-fun b!1476932 () Bool)

(declare-fun res!1003114 () Bool)

(assert (=> b!1476932 (=> (not res!1003114) (not e!828593))))

(assert (=> b!1476932 (= res!1003114 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47905 a!2862) j!93) a!2862 mask!2687) lt!645179))))

(declare-fun b!1476933 () Bool)

(declare-fun res!1003110 () Bool)

(assert (=> b!1476933 (=> (not res!1003110) (not e!828586))))

(assert (=> b!1476933 (= res!1003110 (and (= (size!48455 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48455 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48455 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476934 () Bool)

(declare-fun e!828588 () Bool)

(declare-fun e!828587 () Bool)

(assert (=> b!1476934 (= e!828588 e!828587)))

(declare-fun res!1003120 () Bool)

(assert (=> b!1476934 (=> (not res!1003120) (not e!828587))))

(assert (=> b!1476934 (= res!1003120 (= lt!645178 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47905 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476935 () Bool)

(declare-fun res!1003115 () Bool)

(assert (=> b!1476935 (=> (not res!1003115) (not e!828586))))

(assert (=> b!1476935 (= res!1003115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476936 () Bool)

(assert (=> b!1476936 (= e!828589 e!828588)))

(declare-fun res!1003108 () Bool)

(assert (=> b!1476936 (=> res!1003108 e!828588)))

(assert (=> b!1476936 (= res!1003108 (or (and (= (select (arr!47905 a!2862) index!646) (select (store (arr!47905 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47905 a!2862) index!646) (select (arr!47905 a!2862) j!93))) (not (= (select (arr!47905 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1003116 () Bool)

(assert (=> start!126146 (=> (not res!1003116) (not e!828586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126146 (= res!1003116 (validMask!0 mask!2687))))

(assert (=> start!126146 e!828586))

(assert (=> start!126146 true))

(declare-fun array_inv!36933 (array!99252) Bool)

(assert (=> start!126146 (array_inv!36933 a!2862)))

(declare-fun b!1476937 () Bool)

(declare-fun res!1003119 () Bool)

(assert (=> b!1476937 (=> (not res!1003119) (not e!828590))))

(assert (=> b!1476937 (= res!1003119 e!828592)))

(declare-fun c!136428 () Bool)

(assert (=> b!1476937 (= c!136428 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476938 () Bool)

(assert (=> b!1476938 (= e!828587 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476939 () Bool)

(declare-fun res!1003111 () Bool)

(assert (=> b!1476939 (=> (not res!1003111) (not e!828586))))

(declare-datatypes ((List!34406 0))(
  ( (Nil!34403) (Cons!34402 (h!35770 (_ BitVec 64)) (t!49100 List!34406)) )
))
(declare-fun arrayNoDuplicates!0 (array!99252 (_ BitVec 32) List!34406) Bool)

(assert (=> b!1476939 (= res!1003111 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34403))))

(assert (= (and start!126146 res!1003116) b!1476933))

(assert (= (and b!1476933 res!1003110) b!1476928))

(assert (= (and b!1476928 res!1003117) b!1476927))

(assert (= (and b!1476927 res!1003105) b!1476935))

(assert (= (and b!1476935 res!1003115) b!1476939))

(assert (= (and b!1476939 res!1003111) b!1476929))

(assert (= (and b!1476929 res!1003109) b!1476930))

(assert (= (and b!1476930 res!1003118) b!1476926))

(assert (= (and b!1476926 res!1003113) b!1476932))

(assert (= (and b!1476932 res!1003114) b!1476925))

(assert (= (and b!1476925 res!1003106) b!1476937))

(assert (= (and b!1476937 c!136428) b!1476923))

(assert (= (and b!1476937 (not c!136428)) b!1476931))

(assert (= (and b!1476937 res!1003119) b!1476922))

(assert (= (and b!1476922 res!1003112) b!1476924))

(assert (= (and b!1476924 res!1003107) b!1476936))

(assert (= (and b!1476936 (not res!1003108)) b!1476934))

(assert (= (and b!1476934 res!1003120) b!1476938))

(declare-fun m!1362891 () Bool)

(assert (=> start!126146 m!1362891))

(declare-fun m!1362893 () Bool)

(assert (=> start!126146 m!1362893))

(declare-fun m!1362895 () Bool)

(assert (=> b!1476925 m!1362895))

(assert (=> b!1476925 m!1362895))

(declare-fun m!1362897 () Bool)

(assert (=> b!1476925 m!1362897))

(declare-fun m!1362899 () Bool)

(assert (=> b!1476925 m!1362899))

(declare-fun m!1362901 () Bool)

(assert (=> b!1476925 m!1362901))

(declare-fun m!1362903 () Bool)

(assert (=> b!1476923 m!1362903))

(declare-fun m!1362905 () Bool)

(assert (=> b!1476939 m!1362905))

(declare-fun m!1362907 () Bool)

(assert (=> b!1476934 m!1362907))

(assert (=> b!1476934 m!1362907))

(declare-fun m!1362909 () Bool)

(assert (=> b!1476934 m!1362909))

(assert (=> b!1476932 m!1362907))

(assert (=> b!1476932 m!1362907))

(declare-fun m!1362911 () Bool)

(assert (=> b!1476932 m!1362911))

(declare-fun m!1362913 () Bool)

(assert (=> b!1476935 m!1362913))

(assert (=> b!1476927 m!1362907))

(assert (=> b!1476927 m!1362907))

(declare-fun m!1362915 () Bool)

(assert (=> b!1476927 m!1362915))

(declare-fun m!1362917 () Bool)

(assert (=> b!1476928 m!1362917))

(assert (=> b!1476928 m!1362917))

(declare-fun m!1362919 () Bool)

(assert (=> b!1476928 m!1362919))

(declare-fun m!1362921 () Bool)

(assert (=> b!1476936 m!1362921))

(assert (=> b!1476936 m!1362899))

(declare-fun m!1362923 () Bool)

(assert (=> b!1476936 m!1362923))

(assert (=> b!1476936 m!1362907))

(declare-fun m!1362925 () Bool)

(assert (=> b!1476924 m!1362925))

(declare-fun m!1362927 () Bool)

(assert (=> b!1476924 m!1362927))

(assert (=> b!1476924 m!1362907))

(declare-fun m!1362929 () Bool)

(assert (=> b!1476924 m!1362929))

(declare-fun m!1362931 () Bool)

(assert (=> b!1476924 m!1362931))

(assert (=> b!1476924 m!1362907))

(assert (=> b!1476926 m!1362907))

(assert (=> b!1476926 m!1362907))

(declare-fun m!1362933 () Bool)

(assert (=> b!1476926 m!1362933))

(assert (=> b!1476926 m!1362933))

(assert (=> b!1476926 m!1362907))

(declare-fun m!1362935 () Bool)

(assert (=> b!1476926 m!1362935))

(assert (=> b!1476930 m!1362899))

(declare-fun m!1362937 () Bool)

(assert (=> b!1476930 m!1362937))

(declare-fun m!1362939 () Bool)

(assert (=> b!1476931 m!1362939))

(declare-fun m!1362941 () Bool)

(assert (=> b!1476931 m!1362941))

(push 1)

