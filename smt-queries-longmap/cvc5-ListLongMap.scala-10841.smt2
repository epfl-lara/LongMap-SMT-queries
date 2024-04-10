; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126892 () Bool)

(assert start!126892)

(declare-fun b!1490896 () Bool)

(declare-fun e!835390 () Bool)

(declare-fun e!835391 () Bool)

(assert (=> b!1490896 (= e!835390 e!835391)))

(declare-fun res!1014133 () Bool)

(assert (=> b!1490896 (=> (not res!1014133) (not e!835391))))

(declare-datatypes ((SeekEntryResult!12344 0))(
  ( (MissingZero!12344 (index!51768 (_ BitVec 32))) (Found!12344 (index!51769 (_ BitVec 32))) (Intermediate!12344 (undefined!13156 Bool) (index!51770 (_ BitVec 32)) (x!133360 (_ BitVec 32))) (Undefined!12344) (MissingVacant!12344 (index!51771 (_ BitVec 32))) )
))
(declare-fun lt!650096 () SeekEntryResult!12344)

(declare-datatypes ((array!99665 0))(
  ( (array!99666 (arr!48104 (Array (_ BitVec 32) (_ BitVec 64))) (size!48654 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99665)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99665 (_ BitVec 32)) SeekEntryResult!12344)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490896 (= res!1014133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48104 a!2862) j!93) mask!2687) (select (arr!48104 a!2862) j!93) a!2862 mask!2687) lt!650096))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490896 (= lt!650096 (Intermediate!12344 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1014129 () Bool)

(declare-fun e!835388 () Bool)

(assert (=> start!126892 (=> (not res!1014129) (not e!835388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126892 (= res!1014129 (validMask!0 mask!2687))))

(assert (=> start!126892 e!835388))

(assert (=> start!126892 true))

(declare-fun array_inv!37132 (array!99665) Bool)

(assert (=> start!126892 (array_inv!37132 a!2862)))

(declare-fun b!1490897 () Bool)

(declare-fun res!1014127 () Bool)

(assert (=> b!1490897 (=> (not res!1014127) (not e!835388))))

(declare-datatypes ((List!34605 0))(
  ( (Nil!34602) (Cons!34601 (h!35984 (_ BitVec 64)) (t!49299 List!34605)) )
))
(declare-fun arrayNoDuplicates!0 (array!99665 (_ BitVec 32) List!34605) Bool)

(assert (=> b!1490897 (= res!1014127 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34602))))

(declare-fun b!1490898 () Bool)

(declare-fun e!835389 () Bool)

(assert (=> b!1490898 (= e!835391 e!835389)))

(declare-fun res!1014126 () Bool)

(assert (=> b!1490898 (=> (not res!1014126) (not e!835389))))

(declare-fun lt!650097 () SeekEntryResult!12344)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1490898 (= res!1014126 (= lt!650097 (Intermediate!12344 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650100 () (_ BitVec 64))

(declare-fun lt!650098 () array!99665)

(assert (=> b!1490898 (= lt!650097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650100 mask!2687) lt!650100 lt!650098 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1490898 (= lt!650100 (select (store (arr!48104 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490899 () Bool)

(declare-fun res!1014136 () Bool)

(assert (=> b!1490899 (=> (not res!1014136) (not e!835388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490899 (= res!1014136 (validKeyInArray!0 (select (arr!48104 a!2862) i!1006)))))

(declare-fun b!1490900 () Bool)

(declare-fun res!1014130 () Bool)

(assert (=> b!1490900 (=> (not res!1014130) (not e!835388))))

(assert (=> b!1490900 (= res!1014130 (and (= (size!48654 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48654 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48654 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490901 () Bool)

(declare-fun res!1014137 () Bool)

(assert (=> b!1490901 (=> (not res!1014137) (not e!835388))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1490901 (= res!1014137 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48654 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48654 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48654 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490902 () Bool)

(declare-fun e!835386 () Bool)

(assert (=> b!1490902 (= e!835386 true)))

(declare-fun lt!650099 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490902 (= lt!650099 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490903 () Bool)

(declare-fun res!1014132 () Bool)

(assert (=> b!1490903 (=> (not res!1014132) (not e!835388))))

(assert (=> b!1490903 (= res!1014132 (validKeyInArray!0 (select (arr!48104 a!2862) j!93)))))

(declare-fun b!1490904 () Bool)

(declare-fun e!835385 () Bool)

(assert (=> b!1490904 (= e!835385 (= lt!650097 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650100 lt!650098 mask!2687)))))

(declare-fun b!1490905 () Bool)

(assert (=> b!1490905 (= e!835388 e!835390)))

(declare-fun res!1014134 () Bool)

(assert (=> b!1490905 (=> (not res!1014134) (not e!835390))))

(assert (=> b!1490905 (= res!1014134 (= (select (store (arr!48104 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490905 (= lt!650098 (array!99666 (store (arr!48104 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48654 a!2862)))))

(declare-fun b!1490906 () Bool)

(declare-fun res!1014135 () Bool)

(assert (=> b!1490906 (=> (not res!1014135) (not e!835389))))

(assert (=> b!1490906 (= res!1014135 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490907 () Bool)

(declare-fun res!1014128 () Bool)

(assert (=> b!1490907 (=> (not res!1014128) (not e!835388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99665 (_ BitVec 32)) Bool)

(assert (=> b!1490907 (= res!1014128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490908 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99665 (_ BitVec 32)) SeekEntryResult!12344)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99665 (_ BitVec 32)) SeekEntryResult!12344)

(assert (=> b!1490908 (= e!835385 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650100 lt!650098 mask!2687) (seekEntryOrOpen!0 lt!650100 lt!650098 mask!2687)))))

(declare-fun b!1490909 () Bool)

(declare-fun res!1014125 () Bool)

(assert (=> b!1490909 (=> (not res!1014125) (not e!835391))))

(assert (=> b!1490909 (= res!1014125 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48104 a!2862) j!93) a!2862 mask!2687) lt!650096))))

(declare-fun b!1490910 () Bool)

(assert (=> b!1490910 (= e!835389 (not e!835386))))

(declare-fun res!1014139 () Bool)

(assert (=> b!1490910 (=> res!1014139 e!835386)))

(assert (=> b!1490910 (= res!1014139 (or (and (= (select (arr!48104 a!2862) index!646) (select (store (arr!48104 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48104 a!2862) index!646) (select (arr!48104 a!2862) j!93))) (= (select (arr!48104 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835387 () Bool)

(assert (=> b!1490910 e!835387))

(declare-fun res!1014124 () Bool)

(assert (=> b!1490910 (=> (not res!1014124) (not e!835387))))

(assert (=> b!1490910 (= res!1014124 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50028 0))(
  ( (Unit!50029) )
))
(declare-fun lt!650095 () Unit!50028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50028)

(assert (=> b!1490910 (= lt!650095 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490911 () Bool)

(assert (=> b!1490911 (= e!835387 (or (= (select (arr!48104 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48104 a!2862) intermediateBeforeIndex!19) (select (arr!48104 a!2862) j!93))))))

(declare-fun b!1490912 () Bool)

(declare-fun res!1014131 () Bool)

(assert (=> b!1490912 (=> (not res!1014131) (not e!835389))))

(assert (=> b!1490912 (= res!1014131 e!835385)))

(declare-fun c!137913 () Bool)

(assert (=> b!1490912 (= c!137913 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490913 () Bool)

(declare-fun res!1014138 () Bool)

(assert (=> b!1490913 (=> (not res!1014138) (not e!835387))))

(assert (=> b!1490913 (= res!1014138 (= (seekEntryOrOpen!0 (select (arr!48104 a!2862) j!93) a!2862 mask!2687) (Found!12344 j!93)))))

(assert (= (and start!126892 res!1014129) b!1490900))

(assert (= (and b!1490900 res!1014130) b!1490899))

(assert (= (and b!1490899 res!1014136) b!1490903))

(assert (= (and b!1490903 res!1014132) b!1490907))

(assert (= (and b!1490907 res!1014128) b!1490897))

(assert (= (and b!1490897 res!1014127) b!1490901))

(assert (= (and b!1490901 res!1014137) b!1490905))

(assert (= (and b!1490905 res!1014134) b!1490896))

(assert (= (and b!1490896 res!1014133) b!1490909))

(assert (= (and b!1490909 res!1014125) b!1490898))

(assert (= (and b!1490898 res!1014126) b!1490912))

(assert (= (and b!1490912 c!137913) b!1490904))

(assert (= (and b!1490912 (not c!137913)) b!1490908))

(assert (= (and b!1490912 res!1014131) b!1490906))

(assert (= (and b!1490906 res!1014135) b!1490910))

(assert (= (and b!1490910 res!1014124) b!1490913))

(assert (= (and b!1490913 res!1014138) b!1490911))

(assert (= (and b!1490910 (not res!1014139)) b!1490902))

(declare-fun m!1375039 () Bool)

(assert (=> start!126892 m!1375039))

(declare-fun m!1375041 () Bool)

(assert (=> start!126892 m!1375041))

(declare-fun m!1375043 () Bool)

(assert (=> b!1490905 m!1375043))

(declare-fun m!1375045 () Bool)

(assert (=> b!1490905 m!1375045))

(declare-fun m!1375047 () Bool)

(assert (=> b!1490904 m!1375047))

(declare-fun m!1375049 () Bool)

(assert (=> b!1490908 m!1375049))

(declare-fun m!1375051 () Bool)

(assert (=> b!1490908 m!1375051))

(declare-fun m!1375053 () Bool)

(assert (=> b!1490909 m!1375053))

(assert (=> b!1490909 m!1375053))

(declare-fun m!1375055 () Bool)

(assert (=> b!1490909 m!1375055))

(assert (=> b!1490903 m!1375053))

(assert (=> b!1490903 m!1375053))

(declare-fun m!1375057 () Bool)

(assert (=> b!1490903 m!1375057))

(assert (=> b!1490896 m!1375053))

(assert (=> b!1490896 m!1375053))

(declare-fun m!1375059 () Bool)

(assert (=> b!1490896 m!1375059))

(assert (=> b!1490896 m!1375059))

(assert (=> b!1490896 m!1375053))

(declare-fun m!1375061 () Bool)

(assert (=> b!1490896 m!1375061))

(declare-fun m!1375063 () Bool)

(assert (=> b!1490899 m!1375063))

(assert (=> b!1490899 m!1375063))

(declare-fun m!1375065 () Bool)

(assert (=> b!1490899 m!1375065))

(declare-fun m!1375067 () Bool)

(assert (=> b!1490907 m!1375067))

(assert (=> b!1490913 m!1375053))

(assert (=> b!1490913 m!1375053))

(declare-fun m!1375069 () Bool)

(assert (=> b!1490913 m!1375069))

(declare-fun m!1375071 () Bool)

(assert (=> b!1490897 m!1375071))

(declare-fun m!1375073 () Bool)

(assert (=> b!1490910 m!1375073))

(assert (=> b!1490910 m!1375043))

(declare-fun m!1375075 () Bool)

(assert (=> b!1490910 m!1375075))

(declare-fun m!1375077 () Bool)

(assert (=> b!1490910 m!1375077))

(declare-fun m!1375079 () Bool)

(assert (=> b!1490910 m!1375079))

(assert (=> b!1490910 m!1375053))

(declare-fun m!1375081 () Bool)

(assert (=> b!1490911 m!1375081))

(assert (=> b!1490911 m!1375053))

(declare-fun m!1375083 () Bool)

(assert (=> b!1490902 m!1375083))

(declare-fun m!1375085 () Bool)

(assert (=> b!1490898 m!1375085))

(assert (=> b!1490898 m!1375085))

(declare-fun m!1375087 () Bool)

(assert (=> b!1490898 m!1375087))

(assert (=> b!1490898 m!1375043))

(declare-fun m!1375089 () Bool)

(assert (=> b!1490898 m!1375089))

(push 1)

