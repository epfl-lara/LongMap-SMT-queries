; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126442 () Bool)

(assert start!126442)

(declare-fun b!1482919 () Bool)

(declare-fun e!831508 () Bool)

(declare-fun e!831501 () Bool)

(assert (=> b!1482919 (= e!831508 e!831501)))

(declare-fun res!1008034 () Bool)

(assert (=> b!1482919 (=> res!1008034 e!831501)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99402 0))(
  ( (array!99403 (arr!47978 (Array (_ BitVec 32) (_ BitVec 64))) (size!48530 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99402)

(declare-fun lt!647072 () (_ BitVec 64))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1482919 (= res!1008034 (or (and (= (select (arr!47978 a!2862) index!646) lt!647072) (= (select (arr!47978 a!2862) index!646) (select (arr!47978 a!2862) j!93))) (= (select (arr!47978 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1482919 (= lt!647072 (select (store (arr!47978 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1482920 () Bool)

(declare-fun res!1008049 () Bool)

(declare-fun e!831500 () Bool)

(assert (=> b!1482920 (=> (not res!1008049) (not e!831500))))

(declare-datatypes ((SeekEntryResult!12243 0))(
  ( (MissingZero!12243 (index!51364 (_ BitVec 32))) (Found!12243 (index!51365 (_ BitVec 32))) (Intermediate!12243 (undefined!13055 Bool) (index!51366 (_ BitVec 32)) (x!132944 (_ BitVec 32))) (Undefined!12243) (MissingVacant!12243 (index!51367 (_ BitVec 32))) )
))
(declare-fun lt!647076 () SeekEntryResult!12243)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99402 (_ BitVec 32)) SeekEntryResult!12243)

(assert (=> b!1482920 (= res!1008049 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47978 a!2862) j!93) a!2862 mask!2687) lt!647076))))

(declare-fun b!1482921 () Bool)

(declare-fun e!831504 () Bool)

(declare-fun e!831505 () Bool)

(assert (=> b!1482921 (= e!831504 e!831505)))

(declare-fun res!1008031 () Bool)

(assert (=> b!1482921 (=> (not res!1008031) (not e!831505))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1482921 (= res!1008031 (= (select (store (arr!47978 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647075 () array!99402)

(assert (=> b!1482921 (= lt!647075 (array!99403 (store (arr!47978 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48530 a!2862)))))

(declare-fun lt!647074 () (_ BitVec 64))

(declare-fun e!831509 () Bool)

(declare-fun b!1482922 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99402 (_ BitVec 32)) SeekEntryResult!12243)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99402 (_ BitVec 32)) SeekEntryResult!12243)

(assert (=> b!1482922 (= e!831509 (= (seekEntryOrOpen!0 lt!647074 lt!647075 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647074 lt!647075 mask!2687)))))

(declare-fun b!1482923 () Bool)

(declare-fun e!831506 () Bool)

(assert (=> b!1482923 (= e!831506 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647074 lt!647075 mask!2687) (seekEntryOrOpen!0 lt!647074 lt!647075 mask!2687)))))

(declare-fun b!1482924 () Bool)

(declare-fun res!1008046 () Bool)

(assert (=> b!1482924 (=> (not res!1008046) (not e!831504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482924 (= res!1008046 (validKeyInArray!0 (select (arr!47978 a!2862) j!93)))))

(declare-fun b!1482925 () Bool)

(declare-fun e!831507 () Bool)

(assert (=> b!1482925 (= e!831500 e!831507)))

(declare-fun res!1008043 () Bool)

(assert (=> b!1482925 (=> (not res!1008043) (not e!831507))))

(declare-fun lt!647078 () SeekEntryResult!12243)

(assert (=> b!1482925 (= res!1008043 (= lt!647078 (Intermediate!12243 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482925 (= lt!647078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647074 mask!2687) lt!647074 lt!647075 mask!2687))))

(assert (=> b!1482925 (= lt!647074 (select (store (arr!47978 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482926 () Bool)

(declare-fun e!831502 () Bool)

(assert (=> b!1482926 (= e!831507 (not e!831502))))

(declare-fun res!1008047 () Bool)

(assert (=> b!1482926 (=> res!1008047 e!831502)))

(assert (=> b!1482926 (= res!1008047 (or (and (= (select (arr!47978 a!2862) index!646) (select (store (arr!47978 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47978 a!2862) index!646) (select (arr!47978 a!2862) j!93))) (= (select (arr!47978 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1482926 e!831508))

(declare-fun res!1008036 () Bool)

(assert (=> b!1482926 (=> (not res!1008036) (not e!831508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99402 (_ BitVec 32)) Bool)

(assert (=> b!1482926 (= res!1008036 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49667 0))(
  ( (Unit!49668) )
))
(declare-fun lt!647077 () Unit!49667)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99402 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49667)

(assert (=> b!1482926 (= lt!647077 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1482927 () Bool)

(declare-fun res!1008041 () Bool)

(assert (=> b!1482927 (=> (not res!1008041) (not e!831508))))

(assert (=> b!1482927 (= res!1008041 (= (seekEntryOrOpen!0 (select (arr!47978 a!2862) j!93) a!2862 mask!2687) (Found!12243 j!93)))))

(declare-fun b!1482928 () Bool)

(assert (=> b!1482928 (= e!831502 true)))

(declare-fun lt!647073 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482928 (= lt!647073 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1482930 () Bool)

(assert (=> b!1482930 (= e!831505 e!831500)))

(declare-fun res!1008048 () Bool)

(assert (=> b!1482930 (=> (not res!1008048) (not e!831500))))

(assert (=> b!1482930 (= res!1008048 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47978 a!2862) j!93) mask!2687) (select (arr!47978 a!2862) j!93) a!2862 mask!2687) lt!647076))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482930 (= lt!647076 (Intermediate!12243 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482931 () Bool)

(declare-fun res!1008044 () Bool)

(assert (=> b!1482931 (=> (not res!1008044) (not e!831504))))

(assert (=> b!1482931 (= res!1008044 (and (= (size!48530 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48530 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48530 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482932 () Bool)

(declare-fun res!1008045 () Bool)

(assert (=> b!1482932 (=> (not res!1008045) (not e!831508))))

(assert (=> b!1482932 (= res!1008045 (or (= (select (arr!47978 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47978 a!2862) intermediateBeforeIndex!19) (select (arr!47978 a!2862) j!93))))))

(declare-fun b!1482933 () Bool)

(declare-fun res!1008042 () Bool)

(assert (=> b!1482933 (=> (not res!1008042) (not e!831504))))

(assert (=> b!1482933 (= res!1008042 (validKeyInArray!0 (select (arr!47978 a!2862) i!1006)))))

(declare-fun b!1482934 () Bool)

(declare-fun res!1008040 () Bool)

(assert (=> b!1482934 (=> (not res!1008040) (not e!831504))))

(declare-datatypes ((List!34557 0))(
  ( (Nil!34554) (Cons!34553 (h!35927 (_ BitVec 64)) (t!49243 List!34557)) )
))
(declare-fun arrayNoDuplicates!0 (array!99402 (_ BitVec 32) List!34557) Bool)

(assert (=> b!1482934 (= res!1008040 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34554))))

(declare-fun b!1482935 () Bool)

(assert (=> b!1482935 (= e!831501 e!831509)))

(declare-fun res!1008033 () Bool)

(assert (=> b!1482935 (=> (not res!1008033) (not e!831509))))

(assert (=> b!1482935 (= res!1008033 (and (= index!646 intermediateAfterIndex!19) (= lt!647072 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482936 () Bool)

(declare-fun res!1008035 () Bool)

(assert (=> b!1482936 (=> (not res!1008035) (not e!831507))))

(assert (=> b!1482936 (= res!1008035 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482937 () Bool)

(declare-fun res!1008037 () Bool)

(assert (=> b!1482937 (=> (not res!1008037) (not e!831504))))

(assert (=> b!1482937 (= res!1008037 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48530 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48530 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48530 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1482938 () Bool)

(assert (=> b!1482938 (= e!831506 (= lt!647078 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647074 lt!647075 mask!2687)))))

(declare-fun b!1482939 () Bool)

(declare-fun res!1008032 () Bool)

(assert (=> b!1482939 (=> (not res!1008032) (not e!831504))))

(assert (=> b!1482939 (= res!1008032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1008038 () Bool)

(assert (=> start!126442 (=> (not res!1008038) (not e!831504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126442 (= res!1008038 (validMask!0 mask!2687))))

(assert (=> start!126442 e!831504))

(assert (=> start!126442 true))

(declare-fun array_inv!37211 (array!99402) Bool)

(assert (=> start!126442 (array_inv!37211 a!2862)))

(declare-fun b!1482929 () Bool)

(declare-fun res!1008039 () Bool)

(assert (=> b!1482929 (=> (not res!1008039) (not e!831507))))

(assert (=> b!1482929 (= res!1008039 e!831506)))

(declare-fun c!136969 () Bool)

(assert (=> b!1482929 (= c!136969 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126442 res!1008038) b!1482931))

(assert (= (and b!1482931 res!1008044) b!1482933))

(assert (= (and b!1482933 res!1008042) b!1482924))

(assert (= (and b!1482924 res!1008046) b!1482939))

(assert (= (and b!1482939 res!1008032) b!1482934))

(assert (= (and b!1482934 res!1008040) b!1482937))

(assert (= (and b!1482937 res!1008037) b!1482921))

(assert (= (and b!1482921 res!1008031) b!1482930))

(assert (= (and b!1482930 res!1008048) b!1482920))

(assert (= (and b!1482920 res!1008049) b!1482925))

(assert (= (and b!1482925 res!1008043) b!1482929))

(assert (= (and b!1482929 c!136969) b!1482938))

(assert (= (and b!1482929 (not c!136969)) b!1482923))

(assert (= (and b!1482929 res!1008039) b!1482936))

(assert (= (and b!1482936 res!1008035) b!1482926))

(assert (= (and b!1482926 res!1008036) b!1482927))

(assert (= (and b!1482927 res!1008041) b!1482932))

(assert (= (and b!1482932 res!1008045) b!1482919))

(assert (= (and b!1482919 (not res!1008034)) b!1482935))

(assert (= (and b!1482935 res!1008033) b!1482922))

(assert (= (and b!1482926 (not res!1008047)) b!1482928))

(declare-fun m!1367893 () Bool)

(assert (=> b!1482939 m!1367893))

(declare-fun m!1367895 () Bool)

(assert (=> b!1482924 m!1367895))

(assert (=> b!1482924 m!1367895))

(declare-fun m!1367897 () Bool)

(assert (=> b!1482924 m!1367897))

(declare-fun m!1367899 () Bool)

(assert (=> b!1482926 m!1367899))

(declare-fun m!1367901 () Bool)

(assert (=> b!1482926 m!1367901))

(declare-fun m!1367903 () Bool)

(assert (=> b!1482926 m!1367903))

(declare-fun m!1367905 () Bool)

(assert (=> b!1482926 m!1367905))

(declare-fun m!1367907 () Bool)

(assert (=> b!1482926 m!1367907))

(assert (=> b!1482926 m!1367895))

(assert (=> b!1482919 m!1367905))

(assert (=> b!1482919 m!1367895))

(assert (=> b!1482919 m!1367901))

(assert (=> b!1482919 m!1367903))

(declare-fun m!1367909 () Bool)

(assert (=> b!1482933 m!1367909))

(assert (=> b!1482933 m!1367909))

(declare-fun m!1367911 () Bool)

(assert (=> b!1482933 m!1367911))

(declare-fun m!1367913 () Bool)

(assert (=> b!1482934 m!1367913))

(declare-fun m!1367915 () Bool)

(assert (=> b!1482932 m!1367915))

(assert (=> b!1482932 m!1367895))

(assert (=> b!1482930 m!1367895))

(assert (=> b!1482930 m!1367895))

(declare-fun m!1367917 () Bool)

(assert (=> b!1482930 m!1367917))

(assert (=> b!1482930 m!1367917))

(assert (=> b!1482930 m!1367895))

(declare-fun m!1367919 () Bool)

(assert (=> b!1482930 m!1367919))

(declare-fun m!1367921 () Bool)

(assert (=> start!126442 m!1367921))

(declare-fun m!1367923 () Bool)

(assert (=> start!126442 m!1367923))

(declare-fun m!1367925 () Bool)

(assert (=> b!1482923 m!1367925))

(declare-fun m!1367927 () Bool)

(assert (=> b!1482923 m!1367927))

(assert (=> b!1482920 m!1367895))

(assert (=> b!1482920 m!1367895))

(declare-fun m!1367929 () Bool)

(assert (=> b!1482920 m!1367929))

(assert (=> b!1482927 m!1367895))

(assert (=> b!1482927 m!1367895))

(declare-fun m!1367931 () Bool)

(assert (=> b!1482927 m!1367931))

(declare-fun m!1367933 () Bool)

(assert (=> b!1482938 m!1367933))

(declare-fun m!1367935 () Bool)

(assert (=> b!1482928 m!1367935))

(declare-fun m!1367937 () Bool)

(assert (=> b!1482925 m!1367937))

(assert (=> b!1482925 m!1367937))

(declare-fun m!1367939 () Bool)

(assert (=> b!1482925 m!1367939))

(assert (=> b!1482925 m!1367901))

(declare-fun m!1367941 () Bool)

(assert (=> b!1482925 m!1367941))

(assert (=> b!1482922 m!1367927))

(assert (=> b!1482922 m!1367925))

(assert (=> b!1482921 m!1367901))

(declare-fun m!1367943 () Bool)

(assert (=> b!1482921 m!1367943))

(push 1)

(assert (not b!1482924))

(assert (not b!1482933))

(assert (not b!1482934))

(assert (not b!1482926))

(assert (not b!1482920))

(assert (not b!1482938))

(assert (not start!126442))

(assert (not b!1482923))

(assert (not b!1482939))

(assert (not b!1482930))

(assert (not b!1482925))

(assert (not b!1482928))

(assert (not b!1482922))

(assert (not b!1482927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

