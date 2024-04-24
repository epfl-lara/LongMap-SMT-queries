; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126684 () Bool)

(assert start!126684)

(declare-fun b!1483887 () Bool)

(declare-fun res!1008039 () Bool)

(declare-fun e!832243 () Bool)

(assert (=> b!1483887 (=> (not res!1008039) (not e!832243))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99541 0))(
  ( (array!99542 (arr!48043 (Array (_ BitVec 32) (_ BitVec 64))) (size!48594 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99541)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1483887 (= res!1008039 (and (= (size!48594 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48594 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48594 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483888 () Bool)

(declare-fun res!1008036 () Bool)

(declare-fun e!832245 () Bool)

(assert (=> b!1483888 (=> (not res!1008036) (not e!832245))))

(declare-fun e!832248 () Bool)

(assert (=> b!1483888 (= res!1008036 e!832248)))

(declare-fun c!137461 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1483888 (= c!137461 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483889 () Bool)

(declare-fun res!1008031 () Bool)

(assert (=> b!1483889 (=> (not res!1008031) (not e!832243))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483889 (= res!1008031 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48594 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48594 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48594 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483890 () Bool)

(assert (=> b!1483890 (= e!832245 (not true))))

(declare-fun e!832242 () Bool)

(assert (=> b!1483890 e!832242))

(declare-fun res!1008027 () Bool)

(assert (=> b!1483890 (=> (not res!1008027) (not e!832242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99541 (_ BitVec 32)) Bool)

(assert (=> b!1483890 (= res!1008027 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49733 0))(
  ( (Unit!49734) )
))
(declare-fun lt!647631 () Unit!49733)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49733)

(assert (=> b!1483890 (= lt!647631 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!647635 () array!99541)

(declare-fun lt!647632 () (_ BitVec 64))

(declare-fun b!1483891 () Bool)

(declare-datatypes ((SeekEntryResult!12180 0))(
  ( (MissingZero!12180 (index!51112 (_ BitVec 32))) (Found!12180 (index!51113 (_ BitVec 32))) (Intermediate!12180 (undefined!12992 Bool) (index!51114 (_ BitVec 32)) (x!132880 (_ BitVec 32))) (Undefined!12180) (MissingVacant!12180 (index!51115 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99541 (_ BitVec 32)) SeekEntryResult!12180)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99541 (_ BitVec 32)) SeekEntryResult!12180)

(assert (=> b!1483891 (= e!832248 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647632 lt!647635 mask!2687) (seekEntryOrOpen!0 lt!647632 lt!647635 mask!2687)))))

(declare-fun b!1483892 () Bool)

(declare-fun e!832244 () Bool)

(assert (=> b!1483892 (= e!832244 e!832245)))

(declare-fun res!1008034 () Bool)

(assert (=> b!1483892 (=> (not res!1008034) (not e!832245))))

(declare-fun lt!647634 () SeekEntryResult!12180)

(assert (=> b!1483892 (= res!1008034 (= lt!647634 (Intermediate!12180 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99541 (_ BitVec 32)) SeekEntryResult!12180)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483892 (= lt!647634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647632 mask!2687) lt!647632 lt!647635 mask!2687))))

(assert (=> b!1483892 (= lt!647632 (select (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483893 () Bool)

(declare-fun e!832246 () Bool)

(assert (=> b!1483893 (= e!832243 e!832246)))

(declare-fun res!1008038 () Bool)

(assert (=> b!1483893 (=> (not res!1008038) (not e!832246))))

(assert (=> b!1483893 (= res!1008038 (= (select (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483893 (= lt!647635 (array!99542 (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48594 a!2862)))))

(declare-fun b!1483894 () Bool)

(declare-fun res!1008041 () Bool)

(assert (=> b!1483894 (=> (not res!1008041) (not e!832245))))

(assert (=> b!1483894 (= res!1008041 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483895 () Bool)

(assert (=> b!1483895 (= e!832242 (and (or (= (select (arr!48043 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48043 a!2862) intermediateBeforeIndex!19) (select (arr!48043 a!2862) j!93))) (or (and (= (select (arr!48043 a!2862) index!646) (select (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48043 a!2862) index!646) (select (arr!48043 a!2862) j!93))) (= (select (arr!48043 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!48043 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!1008033 () Bool)

(assert (=> start!126684 (=> (not res!1008033) (not e!832243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126684 (= res!1008033 (validMask!0 mask!2687))))

(assert (=> start!126684 e!832243))

(assert (=> start!126684 true))

(declare-fun array_inv!37324 (array!99541) Bool)

(assert (=> start!126684 (array_inv!37324 a!2862)))

(declare-fun b!1483896 () Bool)

(declare-fun res!1008032 () Bool)

(assert (=> b!1483896 (=> (not res!1008032) (not e!832243))))

(declare-datatypes ((List!34531 0))(
  ( (Nil!34528) (Cons!34527 (h!35912 (_ BitVec 64)) (t!49217 List!34531)) )
))
(declare-fun arrayNoDuplicates!0 (array!99541 (_ BitVec 32) List!34531) Bool)

(assert (=> b!1483896 (= res!1008032 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34528))))

(declare-fun b!1483897 () Bool)

(declare-fun res!1008040 () Bool)

(assert (=> b!1483897 (=> (not res!1008040) (not e!832243))))

(assert (=> b!1483897 (= res!1008040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483898 () Bool)

(declare-fun res!1008028 () Bool)

(assert (=> b!1483898 (=> (not res!1008028) (not e!832243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483898 (= res!1008028 (validKeyInArray!0 (select (arr!48043 a!2862) i!1006)))))

(declare-fun b!1483899 () Bool)

(assert (=> b!1483899 (= e!832246 e!832244)))

(declare-fun res!1008030 () Bool)

(assert (=> b!1483899 (=> (not res!1008030) (not e!832244))))

(declare-fun lt!647633 () SeekEntryResult!12180)

(assert (=> b!1483899 (= res!1008030 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48043 a!2862) j!93) mask!2687) (select (arr!48043 a!2862) j!93) a!2862 mask!2687) lt!647633))))

(assert (=> b!1483899 (= lt!647633 (Intermediate!12180 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483900 () Bool)

(declare-fun res!1008035 () Bool)

(assert (=> b!1483900 (=> (not res!1008035) (not e!832242))))

(assert (=> b!1483900 (= res!1008035 (= (seekEntryOrOpen!0 (select (arr!48043 a!2862) j!93) a!2862 mask!2687) (Found!12180 j!93)))))

(declare-fun b!1483901 () Bool)

(declare-fun res!1008037 () Bool)

(assert (=> b!1483901 (=> (not res!1008037) (not e!832243))))

(assert (=> b!1483901 (= res!1008037 (validKeyInArray!0 (select (arr!48043 a!2862) j!93)))))

(declare-fun b!1483902 () Bool)

(assert (=> b!1483902 (= e!832248 (= lt!647634 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647632 lt!647635 mask!2687)))))

(declare-fun b!1483903 () Bool)

(declare-fun res!1008029 () Bool)

(assert (=> b!1483903 (=> (not res!1008029) (not e!832244))))

(assert (=> b!1483903 (= res!1008029 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48043 a!2862) j!93) a!2862 mask!2687) lt!647633))))

(assert (= (and start!126684 res!1008033) b!1483887))

(assert (= (and b!1483887 res!1008039) b!1483898))

(assert (= (and b!1483898 res!1008028) b!1483901))

(assert (= (and b!1483901 res!1008037) b!1483897))

(assert (= (and b!1483897 res!1008040) b!1483896))

(assert (= (and b!1483896 res!1008032) b!1483889))

(assert (= (and b!1483889 res!1008031) b!1483893))

(assert (= (and b!1483893 res!1008038) b!1483899))

(assert (= (and b!1483899 res!1008030) b!1483903))

(assert (= (and b!1483903 res!1008029) b!1483892))

(assert (= (and b!1483892 res!1008034) b!1483888))

(assert (= (and b!1483888 c!137461) b!1483902))

(assert (= (and b!1483888 (not c!137461)) b!1483891))

(assert (= (and b!1483888 res!1008036) b!1483894))

(assert (= (and b!1483894 res!1008041) b!1483890))

(assert (= (and b!1483890 res!1008027) b!1483900))

(assert (= (and b!1483900 res!1008035) b!1483895))

(declare-fun m!1369591 () Bool)

(assert (=> b!1483901 m!1369591))

(assert (=> b!1483901 m!1369591))

(declare-fun m!1369593 () Bool)

(assert (=> b!1483901 m!1369593))

(assert (=> b!1483899 m!1369591))

(assert (=> b!1483899 m!1369591))

(declare-fun m!1369595 () Bool)

(assert (=> b!1483899 m!1369595))

(assert (=> b!1483899 m!1369595))

(assert (=> b!1483899 m!1369591))

(declare-fun m!1369597 () Bool)

(assert (=> b!1483899 m!1369597))

(declare-fun m!1369599 () Bool)

(assert (=> b!1483890 m!1369599))

(declare-fun m!1369601 () Bool)

(assert (=> b!1483890 m!1369601))

(declare-fun m!1369603 () Bool)

(assert (=> b!1483895 m!1369603))

(declare-fun m!1369605 () Bool)

(assert (=> b!1483895 m!1369605))

(declare-fun m!1369607 () Bool)

(assert (=> b!1483895 m!1369607))

(declare-fun m!1369609 () Bool)

(assert (=> b!1483895 m!1369609))

(assert (=> b!1483895 m!1369591))

(declare-fun m!1369611 () Bool)

(assert (=> start!126684 m!1369611))

(declare-fun m!1369613 () Bool)

(assert (=> start!126684 m!1369613))

(declare-fun m!1369615 () Bool)

(assert (=> b!1483896 m!1369615))

(assert (=> b!1483893 m!1369603))

(declare-fun m!1369617 () Bool)

(assert (=> b!1483893 m!1369617))

(assert (=> b!1483903 m!1369591))

(assert (=> b!1483903 m!1369591))

(declare-fun m!1369619 () Bool)

(assert (=> b!1483903 m!1369619))

(assert (=> b!1483900 m!1369591))

(assert (=> b!1483900 m!1369591))

(declare-fun m!1369621 () Bool)

(assert (=> b!1483900 m!1369621))

(declare-fun m!1369623 () Bool)

(assert (=> b!1483892 m!1369623))

(assert (=> b!1483892 m!1369623))

(declare-fun m!1369625 () Bool)

(assert (=> b!1483892 m!1369625))

(assert (=> b!1483892 m!1369603))

(declare-fun m!1369627 () Bool)

(assert (=> b!1483892 m!1369627))

(declare-fun m!1369629 () Bool)

(assert (=> b!1483897 m!1369629))

(declare-fun m!1369631 () Bool)

(assert (=> b!1483902 m!1369631))

(declare-fun m!1369633 () Bool)

(assert (=> b!1483898 m!1369633))

(assert (=> b!1483898 m!1369633))

(declare-fun m!1369635 () Bool)

(assert (=> b!1483898 m!1369635))

(declare-fun m!1369637 () Bool)

(assert (=> b!1483891 m!1369637))

(declare-fun m!1369639 () Bool)

(assert (=> b!1483891 m!1369639))

(check-sat (not b!1483897) (not b!1483890) (not b!1483903) (not b!1483901) (not b!1483891) (not b!1483899) (not b!1483900) (not b!1483898) (not b!1483902) (not b!1483896) (not start!126684) (not b!1483892))
(check-sat)
