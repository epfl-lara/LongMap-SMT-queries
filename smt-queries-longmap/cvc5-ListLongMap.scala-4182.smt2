; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57008 () Bool)

(assert start!57008)

(declare-fun b!631117 () Bool)

(declare-fun res!408066 () Bool)

(declare-fun e!360852 () Bool)

(assert (=> b!631117 (=> (not res!408066) (not e!360852))))

(declare-datatypes ((array!38084 0))(
  ( (array!38085 (arr!18276 (Array (_ BitVec 32) (_ BitVec 64))) (size!18640 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38084)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38084 (_ BitVec 32)) Bool)

(assert (=> b!631117 (= res!408066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631118 () Bool)

(declare-datatypes ((Unit!21198 0))(
  ( (Unit!21199) )
))
(declare-fun e!360850 () Unit!21198)

(declare-fun Unit!21200 () Unit!21198)

(assert (=> b!631118 (= e!360850 Unit!21200)))

(assert (=> b!631118 false))

(declare-fun b!631119 () Bool)

(declare-fun e!360855 () Bool)

(assert (=> b!631119 (= e!360855 e!360852)))

(declare-fun res!408062 () Bool)

(assert (=> b!631119 (=> (not res!408062) (not e!360852))))

(declare-datatypes ((SeekEntryResult!6716 0))(
  ( (MissingZero!6716 (index!29154 (_ BitVec 32))) (Found!6716 (index!29155 (_ BitVec 32))) (Intermediate!6716 (undefined!7528 Bool) (index!29156 (_ BitVec 32)) (x!57894 (_ BitVec 32))) (Undefined!6716) (MissingVacant!6716 (index!29157 (_ BitVec 32))) )
))
(declare-fun lt!291546 () SeekEntryResult!6716)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!631119 (= res!408062 (or (= lt!291546 (MissingZero!6716 i!1108)) (= lt!291546 (MissingVacant!6716 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38084 (_ BitVec 32)) SeekEntryResult!6716)

(assert (=> b!631119 (= lt!291546 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun e!360849 () Bool)

(declare-fun b!631120 () Bool)

(declare-fun lt!291550 () SeekEntryResult!6716)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631120 (= e!360849 (not (or (not (= lt!291550 (Found!6716 index!984))) (bvslt index!984 (size!18640 a!2986)))))))

(declare-fun lt!291549 () Unit!21198)

(assert (=> b!631120 (= lt!291549 e!360850)))

(declare-fun c!71897 () Bool)

(assert (=> b!631120 (= c!71897 (= lt!291550 Undefined!6716))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!291545 () array!38084)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!291551 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38084 (_ BitVec 32)) SeekEntryResult!6716)

(assert (=> b!631120 (= lt!291550 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291551 lt!291545 mask!3053))))

(declare-fun e!360853 () Bool)

(assert (=> b!631120 e!360853))

(declare-fun res!408057 () Bool)

(assert (=> b!631120 (=> (not res!408057) (not e!360853))))

(declare-fun lt!291552 () SeekEntryResult!6716)

(declare-fun lt!291553 () (_ BitVec 32))

(assert (=> b!631120 (= res!408057 (= lt!291552 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291553 vacantSpotIndex!68 lt!291551 lt!291545 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!631120 (= lt!291552 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291553 vacantSpotIndex!68 (select (arr!18276 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631120 (= lt!291551 (select (store (arr!18276 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291548 () Unit!21198)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38084 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21198)

(assert (=> b!631120 (= lt!291548 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291553 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631120 (= lt!291553 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!408067 () Bool)

(assert (=> start!57008 (=> (not res!408067) (not e!360855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57008 (= res!408067 (validMask!0 mask!3053))))

(assert (=> start!57008 e!360855))

(assert (=> start!57008 true))

(declare-fun array_inv!14072 (array!38084) Bool)

(assert (=> start!57008 (array_inv!14072 a!2986)))

(declare-fun b!631121 () Bool)

(declare-fun res!408063 () Bool)

(assert (=> b!631121 (=> (not res!408063) (not e!360855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631121 (= res!408063 (validKeyInArray!0 k!1786))))

(declare-fun b!631122 () Bool)

(declare-fun res!408061 () Bool)

(assert (=> b!631122 (=> (not res!408061) (not e!360855))))

(assert (=> b!631122 (= res!408061 (validKeyInArray!0 (select (arr!18276 a!2986) j!136)))))

(declare-fun b!631123 () Bool)

(declare-fun e!360854 () Bool)

(assert (=> b!631123 (= e!360852 e!360854)))

(declare-fun res!408060 () Bool)

(assert (=> b!631123 (=> (not res!408060) (not e!360854))))

(assert (=> b!631123 (= res!408060 (= (select (store (arr!18276 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631123 (= lt!291545 (array!38085 (store (arr!18276 a!2986) i!1108 k!1786) (size!18640 a!2986)))))

(declare-fun b!631124 () Bool)

(declare-fun lt!291547 () SeekEntryResult!6716)

(assert (=> b!631124 (= e!360853 (= lt!291547 lt!291552))))

(declare-fun b!631125 () Bool)

(declare-fun res!408065 () Bool)

(assert (=> b!631125 (=> (not res!408065) (not e!360852))))

(assert (=> b!631125 (= res!408065 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18276 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631126 () Bool)

(declare-fun res!408059 () Bool)

(assert (=> b!631126 (=> (not res!408059) (not e!360855))))

(assert (=> b!631126 (= res!408059 (and (= (size!18640 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18640 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18640 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631127 () Bool)

(declare-fun res!408064 () Bool)

(assert (=> b!631127 (=> (not res!408064) (not e!360855))))

(declare-fun arrayContainsKey!0 (array!38084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631127 (= res!408064 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631128 () Bool)

(declare-fun res!408068 () Bool)

(assert (=> b!631128 (=> (not res!408068) (not e!360852))))

(declare-datatypes ((List!12317 0))(
  ( (Nil!12314) (Cons!12313 (h!13358 (_ BitVec 64)) (t!18545 List!12317)) )
))
(declare-fun arrayNoDuplicates!0 (array!38084 (_ BitVec 32) List!12317) Bool)

(assert (=> b!631128 (= res!408068 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12314))))

(declare-fun b!631129 () Bool)

(declare-fun Unit!21201 () Unit!21198)

(assert (=> b!631129 (= e!360850 Unit!21201)))

(declare-fun b!631130 () Bool)

(assert (=> b!631130 (= e!360854 e!360849)))

(declare-fun res!408058 () Bool)

(assert (=> b!631130 (=> (not res!408058) (not e!360849))))

(assert (=> b!631130 (= res!408058 (and (= lt!291547 (Found!6716 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18276 a!2986) index!984) (select (arr!18276 a!2986) j!136))) (not (= (select (arr!18276 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631130 (= lt!291547 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18276 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57008 res!408067) b!631126))

(assert (= (and b!631126 res!408059) b!631122))

(assert (= (and b!631122 res!408061) b!631121))

(assert (= (and b!631121 res!408063) b!631127))

(assert (= (and b!631127 res!408064) b!631119))

(assert (= (and b!631119 res!408062) b!631117))

(assert (= (and b!631117 res!408066) b!631128))

(assert (= (and b!631128 res!408068) b!631125))

(assert (= (and b!631125 res!408065) b!631123))

(assert (= (and b!631123 res!408060) b!631130))

(assert (= (and b!631130 res!408058) b!631120))

(assert (= (and b!631120 res!408057) b!631124))

(assert (= (and b!631120 c!71897) b!631118))

(assert (= (and b!631120 (not c!71897)) b!631129))

(declare-fun m!606063 () Bool)

(assert (=> b!631121 m!606063))

(declare-fun m!606065 () Bool)

(assert (=> b!631128 m!606065))

(declare-fun m!606067 () Bool)

(assert (=> b!631119 m!606067))

(declare-fun m!606069 () Bool)

(assert (=> b!631127 m!606069))

(declare-fun m!606071 () Bool)

(assert (=> b!631123 m!606071))

(declare-fun m!606073 () Bool)

(assert (=> b!631123 m!606073))

(declare-fun m!606075 () Bool)

(assert (=> start!57008 m!606075))

(declare-fun m!606077 () Bool)

(assert (=> start!57008 m!606077))

(declare-fun m!606079 () Bool)

(assert (=> b!631125 m!606079))

(declare-fun m!606081 () Bool)

(assert (=> b!631130 m!606081))

(declare-fun m!606083 () Bool)

(assert (=> b!631130 m!606083))

(assert (=> b!631130 m!606083))

(declare-fun m!606085 () Bool)

(assert (=> b!631130 m!606085))

(assert (=> b!631122 m!606083))

(assert (=> b!631122 m!606083))

(declare-fun m!606087 () Bool)

(assert (=> b!631122 m!606087))

(declare-fun m!606089 () Bool)

(assert (=> b!631120 m!606089))

(declare-fun m!606091 () Bool)

(assert (=> b!631120 m!606091))

(assert (=> b!631120 m!606083))

(assert (=> b!631120 m!606071))

(assert (=> b!631120 m!606083))

(declare-fun m!606093 () Bool)

(assert (=> b!631120 m!606093))

(declare-fun m!606095 () Bool)

(assert (=> b!631120 m!606095))

(declare-fun m!606097 () Bool)

(assert (=> b!631120 m!606097))

(declare-fun m!606099 () Bool)

(assert (=> b!631120 m!606099))

(declare-fun m!606101 () Bool)

(assert (=> b!631117 m!606101))

(push 1)

(assert (not b!631120))

(assert (not b!631121))

(assert (not b!631122))

(assert (not b!631128))

(assert (not start!57008))

(assert (not b!631127))

(assert (not b!631117))

(assert (not b!631119))

(assert (not b!631130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

