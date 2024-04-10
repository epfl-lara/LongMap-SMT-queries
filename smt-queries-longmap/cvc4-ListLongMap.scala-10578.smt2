; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124610 () Bool)

(assert start!124610)

(declare-fun b!1442948 () Bool)

(declare-fun res!975111 () Bool)

(declare-fun e!813188 () Bool)

(assert (=> b!1442948 (=> (not res!975111) (not e!813188))))

(declare-datatypes ((array!98058 0))(
  ( (array!98059 (arr!47317 (Array (_ BitVec 32) (_ BitVec 64))) (size!47867 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98058)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98058 (_ BitVec 32)) Bool)

(assert (=> b!1442948 (= res!975111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442949 () Bool)

(declare-fun res!975121 () Bool)

(declare-fun e!813193 () Bool)

(assert (=> b!1442949 (=> (not res!975121) (not e!813193))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442949 (= res!975121 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442950 () Bool)

(declare-fun res!975115 () Bool)

(declare-fun e!813194 () Bool)

(assert (=> b!1442950 (=> (not res!975115) (not e!813194))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11569 0))(
  ( (MissingZero!11569 (index!48668 (_ BitVec 32))) (Found!11569 (index!48669 (_ BitVec 32))) (Intermediate!11569 (undefined!12381 Bool) (index!48670 (_ BitVec 32)) (x!130370 (_ BitVec 32))) (Undefined!11569) (MissingVacant!11569 (index!48671 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98058 (_ BitVec 32)) SeekEntryResult!11569)

(assert (=> b!1442950 (= res!975115 (= (seekEntryOrOpen!0 (select (arr!47317 a!2862) j!93) a!2862 mask!2687) (Found!11569 j!93)))))

(declare-fun b!1442951 () Bool)

(declare-fun res!975116 () Bool)

(assert (=> b!1442951 (=> (not res!975116) (not e!813188))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1442951 (= res!975116 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47867 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47867 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47867 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442953 () Bool)

(declare-fun res!975113 () Bool)

(assert (=> b!1442953 (=> (not res!975113) (not e!813188))))

(declare-datatypes ((List!33818 0))(
  ( (Nil!33815) (Cons!33814 (h!35164 (_ BitVec 64)) (t!48512 List!33818)) )
))
(declare-fun arrayNoDuplicates!0 (array!98058 (_ BitVec 32) List!33818) Bool)

(assert (=> b!1442953 (= res!975113 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33815))))

(declare-fun e!813189 () Bool)

(declare-fun lt!633710 () array!98058)

(declare-fun lt!633713 () (_ BitVec 64))

(declare-fun b!1442954 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98058 (_ BitVec 32)) SeekEntryResult!11569)

(assert (=> b!1442954 (= e!813189 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633713 lt!633710 mask!2687) (seekEntryOrOpen!0 lt!633713 lt!633710 mask!2687)))))

(declare-fun b!1442955 () Bool)

(declare-fun res!975119 () Bool)

(assert (=> b!1442955 (=> (not res!975119) (not e!813188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442955 (= res!975119 (validKeyInArray!0 (select (arr!47317 a!2862) j!93)))))

(declare-fun b!1442956 () Bool)

(assert (=> b!1442956 (= e!813194 (or (= (select (arr!47317 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47317 a!2862) intermediateBeforeIndex!19) (select (arr!47317 a!2862) j!93))))))

(declare-fun b!1442957 () Bool)

(declare-fun e!813191 () Bool)

(declare-fun e!813190 () Bool)

(assert (=> b!1442957 (= e!813191 e!813190)))

(declare-fun res!975108 () Bool)

(assert (=> b!1442957 (=> (not res!975108) (not e!813190))))

(declare-fun lt!633712 () SeekEntryResult!11569)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98058 (_ BitVec 32)) SeekEntryResult!11569)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442957 (= res!975108 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47317 a!2862) j!93) mask!2687) (select (arr!47317 a!2862) j!93) a!2862 mask!2687) lt!633712))))

(assert (=> b!1442957 (= lt!633712 (Intermediate!11569 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442952 () Bool)

(declare-fun res!975110 () Bool)

(assert (=> b!1442952 (=> (not res!975110) (not e!813188))))

(assert (=> b!1442952 (= res!975110 (and (= (size!47867 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47867 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47867 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!975120 () Bool)

(assert (=> start!124610 (=> (not res!975120) (not e!813188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124610 (= res!975120 (validMask!0 mask!2687))))

(assert (=> start!124610 e!813188))

(assert (=> start!124610 true))

(declare-fun array_inv!36345 (array!98058) Bool)

(assert (=> start!124610 (array_inv!36345 a!2862)))

(declare-fun lt!633711 () SeekEntryResult!11569)

(declare-fun b!1442958 () Bool)

(assert (=> b!1442958 (= e!813189 (= lt!633711 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633713 lt!633710 mask!2687)))))

(declare-fun b!1442959 () Bool)

(assert (=> b!1442959 (= e!813188 e!813191)))

(declare-fun res!975117 () Bool)

(assert (=> b!1442959 (=> (not res!975117) (not e!813191))))

(assert (=> b!1442959 (= res!975117 (= (select (store (arr!47317 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442959 (= lt!633710 (array!98059 (store (arr!47317 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47867 a!2862)))))

(declare-fun b!1442960 () Bool)

(declare-fun res!975107 () Bool)

(assert (=> b!1442960 (=> (not res!975107) (not e!813190))))

(assert (=> b!1442960 (= res!975107 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47317 a!2862) j!93) a!2862 mask!2687) lt!633712))))

(declare-fun b!1442961 () Bool)

(declare-fun res!975112 () Bool)

(assert (=> b!1442961 (=> (not res!975112) (not e!813188))))

(assert (=> b!1442961 (= res!975112 (validKeyInArray!0 (select (arr!47317 a!2862) i!1006)))))

(declare-fun b!1442962 () Bool)

(assert (=> b!1442962 (= e!813190 e!813193)))

(declare-fun res!975114 () Bool)

(assert (=> b!1442962 (=> (not res!975114) (not e!813193))))

(assert (=> b!1442962 (= res!975114 (= lt!633711 (Intermediate!11569 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1442962 (= lt!633711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633713 mask!2687) lt!633713 lt!633710 mask!2687))))

(assert (=> b!1442962 (= lt!633713 (select (store (arr!47317 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442963 () Bool)

(assert (=> b!1442963 (= e!813193 (not (or (not (= (select (arr!47317 a!2862) index!646) (select (store (arr!47317 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47317 a!2862) index!646) (select (arr!47317 a!2862) j!93))) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1442963 e!813194))

(declare-fun res!975109 () Bool)

(assert (=> b!1442963 (=> (not res!975109) (not e!813194))))

(assert (=> b!1442963 (= res!975109 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48634 0))(
  ( (Unit!48635) )
))
(declare-fun lt!633714 () Unit!48634)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48634)

(assert (=> b!1442963 (= lt!633714 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442964 () Bool)

(declare-fun res!975118 () Bool)

(assert (=> b!1442964 (=> (not res!975118) (not e!813193))))

(assert (=> b!1442964 (= res!975118 e!813189)))

(declare-fun c!133431 () Bool)

(assert (=> b!1442964 (= c!133431 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!124610 res!975120) b!1442952))

(assert (= (and b!1442952 res!975110) b!1442961))

(assert (= (and b!1442961 res!975112) b!1442955))

(assert (= (and b!1442955 res!975119) b!1442948))

(assert (= (and b!1442948 res!975111) b!1442953))

(assert (= (and b!1442953 res!975113) b!1442951))

(assert (= (and b!1442951 res!975116) b!1442959))

(assert (= (and b!1442959 res!975117) b!1442957))

(assert (= (and b!1442957 res!975108) b!1442960))

(assert (= (and b!1442960 res!975107) b!1442962))

(assert (= (and b!1442962 res!975114) b!1442964))

(assert (= (and b!1442964 c!133431) b!1442958))

(assert (= (and b!1442964 (not c!133431)) b!1442954))

(assert (= (and b!1442964 res!975118) b!1442949))

(assert (= (and b!1442949 res!975121) b!1442963))

(assert (= (and b!1442963 res!975109) b!1442950))

(assert (= (and b!1442950 res!975115) b!1442956))

(declare-fun m!1332059 () Bool)

(assert (=> b!1442948 m!1332059))

(declare-fun m!1332061 () Bool)

(assert (=> b!1442955 m!1332061))

(assert (=> b!1442955 m!1332061))

(declare-fun m!1332063 () Bool)

(assert (=> b!1442955 m!1332063))

(declare-fun m!1332065 () Bool)

(assert (=> b!1442959 m!1332065))

(declare-fun m!1332067 () Bool)

(assert (=> b!1442959 m!1332067))

(declare-fun m!1332069 () Bool)

(assert (=> b!1442956 m!1332069))

(assert (=> b!1442956 m!1332061))

(declare-fun m!1332071 () Bool)

(assert (=> b!1442954 m!1332071))

(declare-fun m!1332073 () Bool)

(assert (=> b!1442954 m!1332073))

(declare-fun m!1332075 () Bool)

(assert (=> b!1442953 m!1332075))

(declare-fun m!1332077 () Bool)

(assert (=> start!124610 m!1332077))

(declare-fun m!1332079 () Bool)

(assert (=> start!124610 m!1332079))

(declare-fun m!1332081 () Bool)

(assert (=> b!1442962 m!1332081))

(assert (=> b!1442962 m!1332081))

(declare-fun m!1332083 () Bool)

(assert (=> b!1442962 m!1332083))

(assert (=> b!1442962 m!1332065))

(declare-fun m!1332085 () Bool)

(assert (=> b!1442962 m!1332085))

(assert (=> b!1442960 m!1332061))

(assert (=> b!1442960 m!1332061))

(declare-fun m!1332087 () Bool)

(assert (=> b!1442960 m!1332087))

(assert (=> b!1442957 m!1332061))

(assert (=> b!1442957 m!1332061))

(declare-fun m!1332089 () Bool)

(assert (=> b!1442957 m!1332089))

(assert (=> b!1442957 m!1332089))

(assert (=> b!1442957 m!1332061))

(declare-fun m!1332091 () Bool)

(assert (=> b!1442957 m!1332091))

(declare-fun m!1332093 () Bool)

(assert (=> b!1442958 m!1332093))

(assert (=> b!1442950 m!1332061))

(assert (=> b!1442950 m!1332061))

(declare-fun m!1332095 () Bool)

(assert (=> b!1442950 m!1332095))

(declare-fun m!1332097 () Bool)

(assert (=> b!1442963 m!1332097))

(assert (=> b!1442963 m!1332065))

(declare-fun m!1332099 () Bool)

(assert (=> b!1442963 m!1332099))

(declare-fun m!1332101 () Bool)

(assert (=> b!1442963 m!1332101))

(declare-fun m!1332103 () Bool)

(assert (=> b!1442963 m!1332103))

(assert (=> b!1442963 m!1332061))

(declare-fun m!1332105 () Bool)

(assert (=> b!1442961 m!1332105))

(assert (=> b!1442961 m!1332105))

(declare-fun m!1332107 () Bool)

(assert (=> b!1442961 m!1332107))

(push 1)

(assert (not b!1442955))

(assert (not b!1442948))

(assert (not b!1442957))

