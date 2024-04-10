; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126660 () Bool)

(assert start!126660)

(declare-fun b!1486882 () Bool)

(declare-fun res!1011190 () Bool)

(declare-fun e!833490 () Bool)

(assert (=> b!1486882 (=> (not res!1011190) (not e!833490))))

(declare-datatypes ((array!99559 0))(
  ( (array!99560 (arr!48054 (Array (_ BitVec 32) (_ BitVec 64))) (size!48604 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99559)

(declare-datatypes ((List!34555 0))(
  ( (Nil!34552) (Cons!34551 (h!35928 (_ BitVec 64)) (t!49249 List!34555)) )
))
(declare-fun arrayNoDuplicates!0 (array!99559 (_ BitVec 32) List!34555) Bool)

(assert (=> b!1486882 (= res!1011190 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34552))))

(declare-fun b!1486883 () Bool)

(declare-fun res!1011197 () Bool)

(declare-fun e!833489 () Bool)

(assert (=> b!1486883 (=> (not res!1011197) (not e!833489))))

(declare-fun e!833486 () Bool)

(assert (=> b!1486883 (= res!1011197 e!833486)))

(declare-fun c!137370 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1486883 (= c!137370 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486884 () Bool)

(declare-fun res!1011195 () Bool)

(declare-fun e!833485 () Bool)

(assert (=> b!1486884 (=> (not res!1011195) (not e!833485))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1486884 (= res!1011195 (or (= (select (arr!48054 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48054 a!2862) intermediateBeforeIndex!19) (select (arr!48054 a!2862) j!93))))))

(declare-fun lt!648615 () array!99559)

(declare-fun lt!648621 () (_ BitVec 64))

(declare-fun b!1486885 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12294 0))(
  ( (MissingZero!12294 (index!51568 (_ BitVec 32))) (Found!12294 (index!51569 (_ BitVec 32))) (Intermediate!12294 (undefined!13106 Bool) (index!51570 (_ BitVec 32)) (x!133150 (_ BitVec 32))) (Undefined!12294) (MissingVacant!12294 (index!51571 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99559 (_ BitVec 32)) SeekEntryResult!12294)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99559 (_ BitVec 32)) SeekEntryResult!12294)

(assert (=> b!1486885 (= e!833486 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648621 lt!648615 mask!2687) (seekEntryOrOpen!0 lt!648621 lt!648615 mask!2687)))))

(declare-fun b!1486886 () Bool)

(declare-fun res!1011208 () Bool)

(declare-fun e!833487 () Bool)

(assert (=> b!1486886 (=> (not res!1011208) (not e!833487))))

(declare-fun lt!648619 () SeekEntryResult!12294)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99559 (_ BitVec 32)) SeekEntryResult!12294)

(assert (=> b!1486886 (= res!1011208 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48054 a!2862) j!93) a!2862 mask!2687) lt!648619))))

(declare-fun b!1486887 () Bool)

(declare-fun res!1011192 () Bool)

(assert (=> b!1486887 (=> (not res!1011192) (not e!833485))))

(assert (=> b!1486887 (= res!1011192 (= (seekEntryOrOpen!0 (select (arr!48054 a!2862) j!93) a!2862 mask!2687) (Found!12294 j!93)))))

(declare-fun b!1486888 () Bool)

(declare-fun e!833483 () Bool)

(assert (=> b!1486888 (= e!833483 true)))

(declare-fun lt!648616 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486888 (= lt!648616 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486889 () Bool)

(declare-fun res!1011203 () Bool)

(assert (=> b!1486889 (=> (not res!1011203) (not e!833490))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486889 (= res!1011203 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48604 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48604 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48604 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486890 () Bool)

(declare-fun res!1011207 () Bool)

(assert (=> b!1486890 (=> (not res!1011207) (not e!833490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486890 (= res!1011207 (validKeyInArray!0 (select (arr!48054 a!2862) j!93)))))

(declare-fun b!1486891 () Bool)

(declare-fun res!1011193 () Bool)

(assert (=> b!1486891 (=> (not res!1011193) (not e!833490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99559 (_ BitVec 32)) Bool)

(assert (=> b!1486891 (= res!1011193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486892 () Bool)

(assert (=> b!1486892 (= e!833489 (not e!833483))))

(declare-fun res!1011205 () Bool)

(assert (=> b!1486892 (=> res!1011205 e!833483)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486892 (= res!1011205 (or (and (= (select (arr!48054 a!2862) index!646) (select (store (arr!48054 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48054 a!2862) index!646) (select (arr!48054 a!2862) j!93))) (= (select (arr!48054 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486892 e!833485))

(declare-fun res!1011191 () Bool)

(assert (=> b!1486892 (=> (not res!1011191) (not e!833485))))

(assert (=> b!1486892 (= res!1011191 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49928 0))(
  ( (Unit!49929) )
))
(declare-fun lt!648618 () Unit!49928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49928)

(assert (=> b!1486892 (= lt!648618 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486893 () Bool)

(assert (=> b!1486893 (= e!833487 e!833489)))

(declare-fun res!1011196 () Bool)

(assert (=> b!1486893 (=> (not res!1011196) (not e!833489))))

(declare-fun lt!648620 () SeekEntryResult!12294)

(assert (=> b!1486893 (= res!1011196 (= lt!648620 (Intermediate!12294 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486893 (= lt!648620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648621 mask!2687) lt!648621 lt!648615 mask!2687))))

(assert (=> b!1486893 (= lt!648621 (select (store (arr!48054 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486894 () Bool)

(declare-fun e!833484 () Bool)

(assert (=> b!1486894 (= e!833490 e!833484)))

(declare-fun res!1011201 () Bool)

(assert (=> b!1486894 (=> (not res!1011201) (not e!833484))))

(assert (=> b!1486894 (= res!1011201 (= (select (store (arr!48054 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486894 (= lt!648615 (array!99560 (store (arr!48054 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48604 a!2862)))))

(declare-fun b!1486895 () Bool)

(declare-fun res!1011202 () Bool)

(assert (=> b!1486895 (=> (not res!1011202) (not e!833490))))

(assert (=> b!1486895 (= res!1011202 (and (= (size!48604 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48604 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48604 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486896 () Bool)

(declare-fun res!1011194 () Bool)

(assert (=> b!1486896 (=> (not res!1011194) (not e!833489))))

(assert (=> b!1486896 (= res!1011194 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486897 () Bool)

(declare-fun e!833488 () Bool)

(assert (=> b!1486897 (= e!833488 (= (seekEntryOrOpen!0 lt!648621 lt!648615 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648621 lt!648615 mask!2687)))))

(declare-fun b!1486898 () Bool)

(declare-fun e!833491 () Bool)

(assert (=> b!1486898 (= e!833491 e!833488)))

(declare-fun res!1011199 () Bool)

(assert (=> b!1486898 (=> (not res!1011199) (not e!833488))))

(declare-fun lt!648617 () (_ BitVec 64))

(assert (=> b!1486898 (= res!1011199 (and (= index!646 intermediateAfterIndex!19) (= lt!648617 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1011206 () Bool)

(assert (=> start!126660 (=> (not res!1011206) (not e!833490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126660 (= res!1011206 (validMask!0 mask!2687))))

(assert (=> start!126660 e!833490))

(assert (=> start!126660 true))

(declare-fun array_inv!37082 (array!99559) Bool)

(assert (=> start!126660 (array_inv!37082 a!2862)))

(declare-fun b!1486899 () Bool)

(declare-fun res!1011200 () Bool)

(assert (=> b!1486899 (=> (not res!1011200) (not e!833490))))

(assert (=> b!1486899 (= res!1011200 (validKeyInArray!0 (select (arr!48054 a!2862) i!1006)))))

(declare-fun b!1486900 () Bool)

(assert (=> b!1486900 (= e!833486 (= lt!648620 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648621 lt!648615 mask!2687)))))

(declare-fun b!1486901 () Bool)

(assert (=> b!1486901 (= e!833484 e!833487)))

(declare-fun res!1011204 () Bool)

(assert (=> b!1486901 (=> (not res!1011204) (not e!833487))))

(assert (=> b!1486901 (= res!1011204 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48054 a!2862) j!93) mask!2687) (select (arr!48054 a!2862) j!93) a!2862 mask!2687) lt!648619))))

(assert (=> b!1486901 (= lt!648619 (Intermediate!12294 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486902 () Bool)

(assert (=> b!1486902 (= e!833485 e!833491)))

(declare-fun res!1011198 () Bool)

(assert (=> b!1486902 (=> res!1011198 e!833491)))

(assert (=> b!1486902 (= res!1011198 (or (and (= (select (arr!48054 a!2862) index!646) lt!648617) (= (select (arr!48054 a!2862) index!646) (select (arr!48054 a!2862) j!93))) (= (select (arr!48054 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486902 (= lt!648617 (select (store (arr!48054 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(assert (= (and start!126660 res!1011206) b!1486895))

(assert (= (and b!1486895 res!1011202) b!1486899))

(assert (= (and b!1486899 res!1011200) b!1486890))

(assert (= (and b!1486890 res!1011207) b!1486891))

(assert (= (and b!1486891 res!1011193) b!1486882))

(assert (= (and b!1486882 res!1011190) b!1486889))

(assert (= (and b!1486889 res!1011203) b!1486894))

(assert (= (and b!1486894 res!1011201) b!1486901))

(assert (= (and b!1486901 res!1011204) b!1486886))

(assert (= (and b!1486886 res!1011208) b!1486893))

(assert (= (and b!1486893 res!1011196) b!1486883))

(assert (= (and b!1486883 c!137370) b!1486900))

(assert (= (and b!1486883 (not c!137370)) b!1486885))

(assert (= (and b!1486883 res!1011197) b!1486896))

(assert (= (and b!1486896 res!1011194) b!1486892))

(assert (= (and b!1486892 res!1011191) b!1486887))

(assert (= (and b!1486887 res!1011192) b!1486884))

(assert (= (and b!1486884 res!1011195) b!1486902))

(assert (= (and b!1486902 (not res!1011198)) b!1486898))

(assert (= (and b!1486898 res!1011199) b!1486897))

(assert (= (and b!1486892 (not res!1011205)) b!1486888))

(declare-fun m!1371683 () Bool)

(assert (=> b!1486899 m!1371683))

(assert (=> b!1486899 m!1371683))

(declare-fun m!1371685 () Bool)

(assert (=> b!1486899 m!1371685))

(declare-fun m!1371687 () Bool)

(assert (=> b!1486897 m!1371687))

(declare-fun m!1371689 () Bool)

(assert (=> b!1486897 m!1371689))

(declare-fun m!1371691 () Bool)

(assert (=> b!1486888 m!1371691))

(declare-fun m!1371693 () Bool)

(assert (=> b!1486900 m!1371693))

(declare-fun m!1371695 () Bool)

(assert (=> start!126660 m!1371695))

(declare-fun m!1371697 () Bool)

(assert (=> start!126660 m!1371697))

(declare-fun m!1371699 () Bool)

(assert (=> b!1486884 m!1371699))

(declare-fun m!1371701 () Bool)

(assert (=> b!1486884 m!1371701))

(assert (=> b!1486886 m!1371701))

(assert (=> b!1486886 m!1371701))

(declare-fun m!1371703 () Bool)

(assert (=> b!1486886 m!1371703))

(declare-fun m!1371705 () Bool)

(assert (=> b!1486882 m!1371705))

(assert (=> b!1486890 m!1371701))

(assert (=> b!1486890 m!1371701))

(declare-fun m!1371707 () Bool)

(assert (=> b!1486890 m!1371707))

(declare-fun m!1371709 () Bool)

(assert (=> b!1486892 m!1371709))

(declare-fun m!1371711 () Bool)

(assert (=> b!1486892 m!1371711))

(declare-fun m!1371713 () Bool)

(assert (=> b!1486892 m!1371713))

(declare-fun m!1371715 () Bool)

(assert (=> b!1486892 m!1371715))

(declare-fun m!1371717 () Bool)

(assert (=> b!1486892 m!1371717))

(assert (=> b!1486892 m!1371701))

(assert (=> b!1486894 m!1371711))

(declare-fun m!1371719 () Bool)

(assert (=> b!1486894 m!1371719))

(assert (=> b!1486902 m!1371715))

(assert (=> b!1486902 m!1371701))

(assert (=> b!1486902 m!1371711))

(assert (=> b!1486902 m!1371713))

(declare-fun m!1371721 () Bool)

(assert (=> b!1486893 m!1371721))

(assert (=> b!1486893 m!1371721))

(declare-fun m!1371723 () Bool)

(assert (=> b!1486893 m!1371723))

(assert (=> b!1486893 m!1371711))

(declare-fun m!1371725 () Bool)

(assert (=> b!1486893 m!1371725))

(assert (=> b!1486901 m!1371701))

(assert (=> b!1486901 m!1371701))

(declare-fun m!1371727 () Bool)

(assert (=> b!1486901 m!1371727))

(assert (=> b!1486901 m!1371727))

(assert (=> b!1486901 m!1371701))

(declare-fun m!1371729 () Bool)

(assert (=> b!1486901 m!1371729))

(assert (=> b!1486885 m!1371689))

(assert (=> b!1486885 m!1371687))

(declare-fun m!1371731 () Bool)

(assert (=> b!1486891 m!1371731))

(assert (=> b!1486887 m!1371701))

(assert (=> b!1486887 m!1371701))

(declare-fun m!1371733 () Bool)

(assert (=> b!1486887 m!1371733))

(check-sat (not b!1486892) (not b!1486888) (not start!126660) (not b!1486900) (not b!1486890) (not b!1486886) (not b!1486899) (not b!1486893) (not b!1486885) (not b!1486901) (not b!1486891) (not b!1486882) (not b!1486897) (not b!1486887))
(check-sat)
