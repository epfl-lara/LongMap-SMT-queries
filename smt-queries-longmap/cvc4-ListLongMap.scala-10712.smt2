; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125414 () Bool)

(assert start!125414)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!824139 () Bool)

(declare-fun lt!642009 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1467135 () Bool)

(declare-fun lt!642005 () (_ BitVec 32))

(declare-datatypes ((array!98862 0))(
  ( (array!98863 (arr!47719 (Array (_ BitVec 32) (_ BitVec 64))) (size!48269 (_ BitVec 32))) )
))
(declare-fun lt!642012 () array!98862)

(declare-datatypes ((SeekEntryResult!11971 0))(
  ( (MissingZero!11971 (index!50276 (_ BitVec 32))) (Found!11971 (index!50277 (_ BitVec 32))) (Intermediate!11971 (undefined!12783 Bool) (index!50278 (_ BitVec 32)) (x!131844 (_ BitVec 32))) (Undefined!11971) (MissingVacant!11971 (index!50279 (_ BitVec 32))) )
))
(declare-fun lt!642007 () SeekEntryResult!11971)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98862 (_ BitVec 32)) SeekEntryResult!11971)

(assert (=> b!1467135 (= e!824139 (not (= lt!642007 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642005 lt!642009 lt!642012 mask!2687))))))

(declare-fun b!1467136 () Bool)

(declare-fun e!824140 () Bool)

(declare-fun e!824142 () Bool)

(assert (=> b!1467136 (= e!824140 e!824142)))

(declare-fun res!995718 () Bool)

(assert (=> b!1467136 (=> (not res!995718) (not e!824142))))

(declare-fun lt!642008 () SeekEntryResult!11971)

(declare-fun a!2862 () array!98862)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467136 (= res!995718 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47719 a!2862) j!93) mask!2687) (select (arr!47719 a!2862) j!93) a!2862 mask!2687) lt!642008))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1467136 (= lt!642008 (Intermediate!11971 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467137 () Bool)

(declare-fun res!995716 () Bool)

(declare-fun e!824143 () Bool)

(assert (=> b!1467137 (=> (not res!995716) (not e!824143))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467137 (= res!995716 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48269 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48269 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48269 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1467138 () Bool)

(declare-fun res!995728 () Bool)

(assert (=> b!1467138 (=> (not res!995728) (not e!824143))))

(declare-datatypes ((List!34220 0))(
  ( (Nil!34217) (Cons!34216 (h!35566 (_ BitVec 64)) (t!48914 List!34220)) )
))
(declare-fun arrayNoDuplicates!0 (array!98862 (_ BitVec 32) List!34220) Bool)

(assert (=> b!1467138 (= res!995728 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34217))))

(declare-fun b!1467139 () Bool)

(assert (=> b!1467139 (= e!824143 e!824140)))

(declare-fun res!995714 () Bool)

(assert (=> b!1467139 (=> (not res!995714) (not e!824140))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467139 (= res!995714 (= (select (store (arr!47719 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1467139 (= lt!642012 (array!98863 (store (arr!47719 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48269 a!2862)))))

(declare-fun b!1467140 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98862 (_ BitVec 32)) SeekEntryResult!11971)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98862 (_ BitVec 32)) SeekEntryResult!11971)

(assert (=> b!1467140 (= e!824139 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642005 intermediateAfterIndex!19 lt!642009 lt!642012 mask!2687) (seekEntryOrOpen!0 lt!642009 lt!642012 mask!2687))))))

(declare-fun e!824145 () Bool)

(declare-fun b!1467141 () Bool)

(assert (=> b!1467141 (= e!824145 (= lt!642007 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642009 lt!642012 mask!2687)))))

(declare-fun b!1467142 () Bool)

(declare-fun res!995729 () Bool)

(assert (=> b!1467142 (=> (not res!995729) (not e!824143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467142 (= res!995729 (validKeyInArray!0 (select (arr!47719 a!2862) i!1006)))))

(declare-fun b!1467143 () Bool)

(declare-fun res!995717 () Bool)

(assert (=> b!1467143 (=> (not res!995717) (not e!824143))))

(assert (=> b!1467143 (= res!995717 (validKeyInArray!0 (select (arr!47719 a!2862) j!93)))))

(declare-fun b!1467144 () Bool)

(declare-fun e!824147 () Bool)

(assert (=> b!1467144 (= e!824142 e!824147)))

(declare-fun res!995726 () Bool)

(assert (=> b!1467144 (=> (not res!995726) (not e!824147))))

(assert (=> b!1467144 (= res!995726 (= lt!642007 (Intermediate!11971 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1467144 (= lt!642007 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642009 mask!2687) lt!642009 lt!642012 mask!2687))))

(assert (=> b!1467144 (= lt!642009 (select (store (arr!47719 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1467145 () Bool)

(declare-fun res!995727 () Bool)

(assert (=> b!1467145 (=> (not res!995727) (not e!824143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98862 (_ BitVec 32)) Bool)

(assert (=> b!1467145 (= res!995727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467146 () Bool)

(declare-fun res!995730 () Bool)

(declare-fun e!824144 () Bool)

(assert (=> b!1467146 (=> res!995730 e!824144)))

(assert (=> b!1467146 (= res!995730 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1467147 () Bool)

(declare-fun res!995715 () Bool)

(assert (=> b!1467147 (=> (not res!995715) (not e!824147))))

(assert (=> b!1467147 (= res!995715 e!824145)))

(declare-fun c!135222 () Bool)

(assert (=> b!1467147 (= c!135222 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1467148 () Bool)

(declare-fun res!995725 () Bool)

(assert (=> b!1467148 (=> res!995725 e!824144)))

(assert (=> b!1467148 (= res!995725 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642005 (select (arr!47719 a!2862) j!93) a!2862 mask!2687) lt!642008)))))

(declare-fun b!1467149 () Bool)

(declare-fun e!824146 () Bool)

(assert (=> b!1467149 (= e!824147 (not e!824146))))

(declare-fun res!995723 () Bool)

(assert (=> b!1467149 (=> res!995723 e!824146)))

(assert (=> b!1467149 (= res!995723 (or (and (= (select (arr!47719 a!2862) index!646) (select (store (arr!47719 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47719 a!2862) index!646) (select (arr!47719 a!2862) j!93))) (= (select (arr!47719 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!642011 () SeekEntryResult!11971)

(assert (=> b!1467149 (and (= lt!642011 (Found!11971 j!93)) (or (= (select (arr!47719 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47719 a!2862) intermediateBeforeIndex!19) (select (arr!47719 a!2862) j!93))))))

(assert (=> b!1467149 (= lt!642011 (seekEntryOrOpen!0 (select (arr!47719 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1467149 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49438 0))(
  ( (Unit!49439) )
))
(declare-fun lt!642006 () Unit!49438)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49438)

(assert (=> b!1467149 (= lt!642006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1467150 () Bool)

(declare-fun res!995719 () Bool)

(assert (=> b!1467150 (=> (not res!995719) (not e!824143))))

(assert (=> b!1467150 (= res!995719 (and (= (size!48269 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48269 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48269 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467151 () Bool)

(declare-fun res!995720 () Bool)

(assert (=> b!1467151 (=> res!995720 e!824144)))

(assert (=> b!1467151 (= res!995720 e!824139)))

(declare-fun c!135221 () Bool)

(assert (=> b!1467151 (= c!135221 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1467152 () Bool)

(assert (=> b!1467152 (= e!824144 true)))

(assert (=> b!1467152 (= lt!642011 (seekEntryOrOpen!0 lt!642009 lt!642012 mask!2687))))

(declare-fun lt!642010 () Unit!49438)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49438)

(assert (=> b!1467152 (= lt!642010 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!642005 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1467153 () Bool)

(assert (=> b!1467153 (= e!824146 e!824144)))

(declare-fun res!995724 () Bool)

(assert (=> b!1467153 (=> res!995724 e!824144)))

(assert (=> b!1467153 (= res!995724 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642005 #b00000000000000000000000000000000) (bvsge lt!642005 (size!48269 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467153 (= lt!642005 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1467154 () Bool)

(assert (=> b!1467154 (= e!824145 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642009 lt!642012 mask!2687) (seekEntryOrOpen!0 lt!642009 lt!642012 mask!2687)))))

(declare-fun res!995722 () Bool)

(assert (=> start!125414 (=> (not res!995722) (not e!824143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125414 (= res!995722 (validMask!0 mask!2687))))

(assert (=> start!125414 e!824143))

(assert (=> start!125414 true))

(declare-fun array_inv!36747 (array!98862) Bool)

(assert (=> start!125414 (array_inv!36747 a!2862)))

(declare-fun b!1467155 () Bool)

(declare-fun res!995731 () Bool)

(assert (=> b!1467155 (=> (not res!995731) (not e!824147))))

(assert (=> b!1467155 (= res!995731 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1467156 () Bool)

(declare-fun res!995721 () Bool)

(assert (=> b!1467156 (=> (not res!995721) (not e!824142))))

(assert (=> b!1467156 (= res!995721 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47719 a!2862) j!93) a!2862 mask!2687) lt!642008))))

(assert (= (and start!125414 res!995722) b!1467150))

(assert (= (and b!1467150 res!995719) b!1467142))

(assert (= (and b!1467142 res!995729) b!1467143))

(assert (= (and b!1467143 res!995717) b!1467145))

(assert (= (and b!1467145 res!995727) b!1467138))

(assert (= (and b!1467138 res!995728) b!1467137))

(assert (= (and b!1467137 res!995716) b!1467139))

(assert (= (and b!1467139 res!995714) b!1467136))

(assert (= (and b!1467136 res!995718) b!1467156))

(assert (= (and b!1467156 res!995721) b!1467144))

(assert (= (and b!1467144 res!995726) b!1467147))

(assert (= (and b!1467147 c!135222) b!1467141))

(assert (= (and b!1467147 (not c!135222)) b!1467154))

(assert (= (and b!1467147 res!995715) b!1467155))

(assert (= (and b!1467155 res!995731) b!1467149))

(assert (= (and b!1467149 (not res!995723)) b!1467153))

(assert (= (and b!1467153 (not res!995724)) b!1467148))

(assert (= (and b!1467148 (not res!995725)) b!1467151))

(assert (= (and b!1467151 c!135221) b!1467135))

(assert (= (and b!1467151 (not c!135221)) b!1467140))

(assert (= (and b!1467151 (not res!995720)) b!1467146))

(assert (= (and b!1467146 (not res!995730)) b!1467152))

(declare-fun m!1354063 () Bool)

(assert (=> b!1467145 m!1354063))

(declare-fun m!1354065 () Bool)

(assert (=> b!1467139 m!1354065))

(declare-fun m!1354067 () Bool)

(assert (=> b!1467139 m!1354067))

(declare-fun m!1354069 () Bool)

(assert (=> b!1467135 m!1354069))

(declare-fun m!1354071 () Bool)

(assert (=> b!1467153 m!1354071))

(declare-fun m!1354073 () Bool)

(assert (=> b!1467142 m!1354073))

(assert (=> b!1467142 m!1354073))

(declare-fun m!1354075 () Bool)

(assert (=> b!1467142 m!1354075))

(declare-fun m!1354077 () Bool)

(assert (=> b!1467144 m!1354077))

(assert (=> b!1467144 m!1354077))

(declare-fun m!1354079 () Bool)

(assert (=> b!1467144 m!1354079))

(assert (=> b!1467144 m!1354065))

(declare-fun m!1354081 () Bool)

(assert (=> b!1467144 m!1354081))

(declare-fun m!1354083 () Bool)

(assert (=> b!1467152 m!1354083))

(declare-fun m!1354085 () Bool)

(assert (=> b!1467152 m!1354085))

(declare-fun m!1354087 () Bool)

(assert (=> b!1467143 m!1354087))

(assert (=> b!1467143 m!1354087))

(declare-fun m!1354089 () Bool)

(assert (=> b!1467143 m!1354089))

(assert (=> b!1467148 m!1354087))

(assert (=> b!1467148 m!1354087))

(declare-fun m!1354091 () Bool)

(assert (=> b!1467148 m!1354091))

(declare-fun m!1354093 () Bool)

(assert (=> b!1467138 m!1354093))

(declare-fun m!1354095 () Bool)

(assert (=> b!1467149 m!1354095))

(assert (=> b!1467149 m!1354065))

(declare-fun m!1354097 () Bool)

(assert (=> b!1467149 m!1354097))

(declare-fun m!1354099 () Bool)

(assert (=> b!1467149 m!1354099))

(declare-fun m!1354101 () Bool)

(assert (=> b!1467149 m!1354101))

(assert (=> b!1467149 m!1354087))

(declare-fun m!1354103 () Bool)

(assert (=> b!1467149 m!1354103))

(declare-fun m!1354105 () Bool)

(assert (=> b!1467149 m!1354105))

(assert (=> b!1467149 m!1354087))

(declare-fun m!1354107 () Bool)

(assert (=> b!1467154 m!1354107))

(assert (=> b!1467154 m!1354083))

(declare-fun m!1354109 () Bool)

(assert (=> b!1467141 m!1354109))

(declare-fun m!1354111 () Bool)

(assert (=> start!125414 m!1354111))

(declare-fun m!1354113 () Bool)

(assert (=> start!125414 m!1354113))

(assert (=> b!1467156 m!1354087))

(assert (=> b!1467156 m!1354087))

(declare-fun m!1354115 () Bool)

(assert (=> b!1467156 m!1354115))

(assert (=> b!1467136 m!1354087))

(assert (=> b!1467136 m!1354087))

(declare-fun m!1354117 () Bool)

(assert (=> b!1467136 m!1354117))

(assert (=> b!1467136 m!1354117))

(assert (=> b!1467136 m!1354087))

(declare-fun m!1354119 () Bool)

(assert (=> b!1467136 m!1354119))

(declare-fun m!1354121 () Bool)

(assert (=> b!1467140 m!1354121))

(assert (=> b!1467140 m!1354083))

(push 1)

