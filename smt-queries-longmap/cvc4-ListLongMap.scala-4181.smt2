; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57006 () Bool)

(assert start!57006)

(declare-fun b!631075 () Bool)

(declare-fun res!408031 () Bool)

(declare-fun e!360831 () Bool)

(assert (=> b!631075 (=> (not res!408031) (not e!360831))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38082 0))(
  ( (array!38083 (arr!18275 (Array (_ BitVec 32) (_ BitVec 64))) (size!18639 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38082)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!631075 (= res!408031 (and (= (size!18639 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18639 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18639 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631076 () Bool)

(declare-fun res!408029 () Bool)

(declare-fun e!360830 () Bool)

(assert (=> b!631076 (=> (not res!408029) (not e!360830))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631076 (= res!408029 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18275 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631077 () Bool)

(declare-fun res!408023 () Bool)

(assert (=> b!631077 (=> (not res!408023) (not e!360831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631077 (= res!408023 (validKeyInArray!0 (select (arr!18275 a!2986) j!136)))))

(declare-fun b!631078 () Bool)

(declare-fun e!360832 () Bool)

(declare-fun e!360828 () Bool)

(assert (=> b!631078 (= e!360832 e!360828)))

(declare-fun res!408021 () Bool)

(assert (=> b!631078 (=> (not res!408021) (not e!360828))))

(declare-datatypes ((SeekEntryResult!6715 0))(
  ( (MissingZero!6715 (index!29150 (_ BitVec 32))) (Found!6715 (index!29151 (_ BitVec 32))) (Intermediate!6715 (undefined!7527 Bool) (index!29152 (_ BitVec 32)) (x!57885 (_ BitVec 32))) (Undefined!6715) (MissingVacant!6715 (index!29153 (_ BitVec 32))) )
))
(declare-fun lt!291519 () SeekEntryResult!6715)

(assert (=> b!631078 (= res!408021 (and (= lt!291519 (Found!6715 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18275 a!2986) index!984) (select (arr!18275 a!2986) j!136))) (not (= (select (arr!18275 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38082 (_ BitVec 32)) SeekEntryResult!6715)

(assert (=> b!631078 (= lt!291519 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18275 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631079 () Bool)

(declare-fun res!408032 () Bool)

(assert (=> b!631079 (=> (not res!408032) (not e!360831))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!631079 (= res!408032 (validKeyInArray!0 k!1786))))

(declare-fun res!408030 () Bool)

(assert (=> start!57006 (=> (not res!408030) (not e!360831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57006 (= res!408030 (validMask!0 mask!3053))))

(assert (=> start!57006 e!360831))

(assert (=> start!57006 true))

(declare-fun array_inv!14071 (array!38082) Bool)

(assert (=> start!57006 (array_inv!14071 a!2986)))

(declare-fun b!631080 () Bool)

(declare-fun res!408027 () Bool)

(assert (=> b!631080 (=> (not res!408027) (not e!360830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38082 (_ BitVec 32)) Bool)

(assert (=> b!631080 (= res!408027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631081 () Bool)

(declare-fun res!408022 () Bool)

(assert (=> b!631081 (=> (not res!408022) (not e!360830))))

(declare-datatypes ((List!12316 0))(
  ( (Nil!12313) (Cons!12312 (h!13357 (_ BitVec 64)) (t!18544 List!12316)) )
))
(declare-fun arrayNoDuplicates!0 (array!38082 (_ BitVec 32) List!12316) Bool)

(assert (=> b!631081 (= res!408022 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12313))))

(declare-fun b!631082 () Bool)

(declare-fun res!408024 () Bool)

(assert (=> b!631082 (=> (not res!408024) (not e!360831))))

(declare-fun arrayContainsKey!0 (array!38082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631082 (= res!408024 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631083 () Bool)

(assert (=> b!631083 (= e!360828 (not true))))

(declare-datatypes ((Unit!21194 0))(
  ( (Unit!21195) )
))
(declare-fun lt!291522 () Unit!21194)

(declare-fun e!360829 () Unit!21194)

(assert (=> b!631083 (= lt!291522 e!360829)))

(declare-fun c!71894 () Bool)

(declare-fun lt!291523 () (_ BitVec 64))

(declare-fun lt!291526 () array!38082)

(assert (=> b!631083 (= c!71894 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291523 lt!291526 mask!3053) Undefined!6715))))

(declare-fun e!360834 () Bool)

(assert (=> b!631083 e!360834))

(declare-fun res!408026 () Bool)

(assert (=> b!631083 (=> (not res!408026) (not e!360834))))

(declare-fun lt!291521 () (_ BitVec 32))

(declare-fun lt!291525 () SeekEntryResult!6715)

(assert (=> b!631083 (= res!408026 (= lt!291525 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291521 vacantSpotIndex!68 lt!291523 lt!291526 mask!3053)))))

(assert (=> b!631083 (= lt!291525 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291521 vacantSpotIndex!68 (select (arr!18275 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631083 (= lt!291523 (select (store (arr!18275 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291520 () Unit!21194)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38082 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21194)

(assert (=> b!631083 (= lt!291520 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291521 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631083 (= lt!291521 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631084 () Bool)

(assert (=> b!631084 (= e!360831 e!360830)))

(declare-fun res!408028 () Bool)

(assert (=> b!631084 (=> (not res!408028) (not e!360830))))

(declare-fun lt!291524 () SeekEntryResult!6715)

(assert (=> b!631084 (= res!408028 (or (= lt!291524 (MissingZero!6715 i!1108)) (= lt!291524 (MissingVacant!6715 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38082 (_ BitVec 32)) SeekEntryResult!6715)

(assert (=> b!631084 (= lt!291524 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!631085 () Bool)

(assert (=> b!631085 (= e!360830 e!360832)))

(declare-fun res!408025 () Bool)

(assert (=> b!631085 (=> (not res!408025) (not e!360832))))

(assert (=> b!631085 (= res!408025 (= (select (store (arr!18275 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631085 (= lt!291526 (array!38083 (store (arr!18275 a!2986) i!1108 k!1786) (size!18639 a!2986)))))

(declare-fun b!631086 () Bool)

(declare-fun Unit!21196 () Unit!21194)

(assert (=> b!631086 (= e!360829 Unit!21196)))

(assert (=> b!631086 false))

(declare-fun b!631087 () Bool)

(assert (=> b!631087 (= e!360834 (= lt!291519 lt!291525))))

(declare-fun b!631088 () Bool)

(declare-fun Unit!21197 () Unit!21194)

(assert (=> b!631088 (= e!360829 Unit!21197)))

(assert (= (and start!57006 res!408030) b!631075))

(assert (= (and b!631075 res!408031) b!631077))

(assert (= (and b!631077 res!408023) b!631079))

(assert (= (and b!631079 res!408032) b!631082))

(assert (= (and b!631082 res!408024) b!631084))

(assert (= (and b!631084 res!408028) b!631080))

(assert (= (and b!631080 res!408027) b!631081))

(assert (= (and b!631081 res!408022) b!631076))

(assert (= (and b!631076 res!408029) b!631085))

(assert (= (and b!631085 res!408025) b!631078))

(assert (= (and b!631078 res!408021) b!631083))

(assert (= (and b!631083 res!408026) b!631087))

(assert (= (and b!631083 c!71894) b!631086))

(assert (= (and b!631083 (not c!71894)) b!631088))

(declare-fun m!606023 () Bool)

(assert (=> b!631083 m!606023))

(declare-fun m!606025 () Bool)

(assert (=> b!631083 m!606025))

(declare-fun m!606027 () Bool)

(assert (=> b!631083 m!606027))

(declare-fun m!606029 () Bool)

(assert (=> b!631083 m!606029))

(declare-fun m!606031 () Bool)

(assert (=> b!631083 m!606031))

(assert (=> b!631083 m!606029))

(declare-fun m!606033 () Bool)

(assert (=> b!631083 m!606033))

(declare-fun m!606035 () Bool)

(assert (=> b!631083 m!606035))

(declare-fun m!606037 () Bool)

(assert (=> b!631083 m!606037))

(declare-fun m!606039 () Bool)

(assert (=> b!631076 m!606039))

(declare-fun m!606041 () Bool)

(assert (=> b!631084 m!606041))

(declare-fun m!606043 () Bool)

(assert (=> b!631080 m!606043))

(declare-fun m!606045 () Bool)

(assert (=> b!631078 m!606045))

(assert (=> b!631078 m!606029))

(assert (=> b!631078 m!606029))

(declare-fun m!606047 () Bool)

(assert (=> b!631078 m!606047))

(declare-fun m!606049 () Bool)

(assert (=> b!631079 m!606049))

(declare-fun m!606051 () Bool)

(assert (=> b!631082 m!606051))

(assert (=> b!631077 m!606029))

(assert (=> b!631077 m!606029))

(declare-fun m!606053 () Bool)

(assert (=> b!631077 m!606053))

(declare-fun m!606055 () Bool)

(assert (=> start!57006 m!606055))

(declare-fun m!606057 () Bool)

(assert (=> start!57006 m!606057))

(declare-fun m!606059 () Bool)

(assert (=> b!631081 m!606059))

(assert (=> b!631085 m!606031))

(declare-fun m!606061 () Bool)

(assert (=> b!631085 m!606061))

(push 1)

