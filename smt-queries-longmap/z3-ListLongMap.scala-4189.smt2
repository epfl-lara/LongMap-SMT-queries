; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57096 () Bool)

(assert start!57096)

(declare-fun b!632036 () Bool)

(declare-fun e!361325 () Bool)

(declare-fun e!361327 () Bool)

(assert (=> b!632036 (= e!361325 e!361327)))

(declare-fun res!408794 () Bool)

(assert (=> b!632036 (=> (not res!408794) (not e!361327))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38127 0))(
  ( (array!38128 (arr!18296 (Array (_ BitVec 32) (_ BitVec 64))) (size!18661 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38127)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632036 (= res!408794 (= (select (store (arr!18296 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291981 () array!38127)

(assert (=> b!632036 (= lt!291981 (array!38128 (store (arr!18296 a!2986) i!1108 k0!1786) (size!18661 a!2986)))))

(declare-fun b!632037 () Bool)

(declare-fun e!361332 () Bool)

(assert (=> b!632037 (= e!361327 e!361332)))

(declare-fun res!408797 () Bool)

(assert (=> b!632037 (=> (not res!408797) (not e!361332))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6733 0))(
  ( (MissingZero!6733 (index!29225 (_ BitVec 32))) (Found!6733 (index!29226 (_ BitVec 32))) (Intermediate!6733 (undefined!7545 Bool) (index!29227 (_ BitVec 32)) (x!57971 (_ BitVec 32))) (Undefined!6733) (MissingVacant!6733 (index!29228 (_ BitVec 32))) )
))
(declare-fun lt!291983 () SeekEntryResult!6733)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632037 (= res!408797 (and (= lt!291983 (Found!6733 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18296 a!2986) index!984) (select (arr!18296 a!2986) j!136))) (not (= (select (arr!18296 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38127 (_ BitVec 32)) SeekEntryResult!6733)

(assert (=> b!632037 (= lt!291983 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18296 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632038 () Bool)

(declare-fun e!361331 () Bool)

(assert (=> b!632038 (= e!361332 (not e!361331))))

(declare-fun res!408796 () Bool)

(assert (=> b!632038 (=> res!408796 e!361331)))

(declare-fun lt!291982 () SeekEntryResult!6733)

(assert (=> b!632038 (= res!408796 (not (= lt!291982 (Found!6733 index!984))))))

(declare-datatypes ((Unit!21260 0))(
  ( (Unit!21261) )
))
(declare-fun lt!291980 () Unit!21260)

(declare-fun e!361329 () Unit!21260)

(assert (=> b!632038 (= lt!291980 e!361329)))

(declare-fun c!71988 () Bool)

(assert (=> b!632038 (= c!71988 (= lt!291982 Undefined!6733))))

(declare-fun lt!291977 () (_ BitVec 64))

(assert (=> b!632038 (= lt!291982 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291977 lt!291981 mask!3053))))

(declare-fun e!361326 () Bool)

(assert (=> b!632038 e!361326))

(declare-fun res!408804 () Bool)

(assert (=> b!632038 (=> (not res!408804) (not e!361326))))

(declare-fun lt!291979 () SeekEntryResult!6733)

(declare-fun lt!291978 () (_ BitVec 32))

(assert (=> b!632038 (= res!408804 (= lt!291979 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291978 vacantSpotIndex!68 lt!291977 lt!291981 mask!3053)))))

(assert (=> b!632038 (= lt!291979 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291978 vacantSpotIndex!68 (select (arr!18296 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632038 (= lt!291977 (select (store (arr!18296 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291984 () Unit!21260)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38127 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21260)

(assert (=> b!632038 (= lt!291984 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291978 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632038 (= lt!291978 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632039 () Bool)

(assert (=> b!632039 (= e!361326 (= lt!291983 lt!291979))))

(declare-fun b!632040 () Bool)

(declare-fun res!408806 () Bool)

(assert (=> b!632040 (=> (not res!408806) (not e!361325))))

(declare-datatypes ((List!12376 0))(
  ( (Nil!12373) (Cons!12372 (h!13417 (_ BitVec 64)) (t!18595 List!12376)) )
))
(declare-fun arrayNoDuplicates!0 (array!38127 (_ BitVec 32) List!12376) Bool)

(assert (=> b!632040 (= res!408806 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12373))))

(declare-fun b!632041 () Bool)

(declare-fun res!408799 () Bool)

(declare-fun e!361328 () Bool)

(assert (=> b!632041 (=> (not res!408799) (not e!361328))))

(declare-fun arrayContainsKey!0 (array!38127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632041 (= res!408799 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632042 () Bool)

(assert (=> b!632042 (= e!361331 true)))

(assert (=> b!632042 (= (select (store (arr!18296 a!2986) i!1108 k0!1786) index!984) (select (arr!18296 a!2986) j!136))))

(declare-fun b!632043 () Bool)

(declare-fun res!408801 () Bool)

(assert (=> b!632043 (=> (not res!408801) (not e!361328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632043 (= res!408801 (validKeyInArray!0 (select (arr!18296 a!2986) j!136)))))

(declare-fun res!408803 () Bool)

(assert (=> start!57096 (=> (not res!408803) (not e!361328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57096 (= res!408803 (validMask!0 mask!3053))))

(assert (=> start!57096 e!361328))

(assert (=> start!57096 true))

(declare-fun array_inv!14179 (array!38127) Bool)

(assert (=> start!57096 (array_inv!14179 a!2986)))

(declare-fun b!632044 () Bool)

(declare-fun res!408802 () Bool)

(assert (=> b!632044 (=> (not res!408802) (not e!361325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38127 (_ BitVec 32)) Bool)

(assert (=> b!632044 (= res!408802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632045 () Bool)

(declare-fun Unit!21262 () Unit!21260)

(assert (=> b!632045 (= e!361329 Unit!21262)))

(declare-fun b!632046 () Bool)

(assert (=> b!632046 (= e!361328 e!361325)))

(declare-fun res!408805 () Bool)

(assert (=> b!632046 (=> (not res!408805) (not e!361325))))

(declare-fun lt!291985 () SeekEntryResult!6733)

(assert (=> b!632046 (= res!408805 (or (= lt!291985 (MissingZero!6733 i!1108)) (= lt!291985 (MissingVacant!6733 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38127 (_ BitVec 32)) SeekEntryResult!6733)

(assert (=> b!632046 (= lt!291985 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!632047 () Bool)

(declare-fun res!408798 () Bool)

(assert (=> b!632047 (=> (not res!408798) (not e!361325))))

(assert (=> b!632047 (= res!408798 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18296 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632048 () Bool)

(declare-fun res!408795 () Bool)

(assert (=> b!632048 (=> (not res!408795) (not e!361328))))

(assert (=> b!632048 (= res!408795 (and (= (size!18661 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18661 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18661 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632049 () Bool)

(declare-fun Unit!21263 () Unit!21260)

(assert (=> b!632049 (= e!361329 Unit!21263)))

(assert (=> b!632049 false))

(declare-fun b!632050 () Bool)

(declare-fun res!408800 () Bool)

(assert (=> b!632050 (=> (not res!408800) (not e!361328))))

(assert (=> b!632050 (= res!408800 (validKeyInArray!0 k0!1786))))

(assert (= (and start!57096 res!408803) b!632048))

(assert (= (and b!632048 res!408795) b!632043))

(assert (= (and b!632043 res!408801) b!632050))

(assert (= (and b!632050 res!408800) b!632041))

(assert (= (and b!632041 res!408799) b!632046))

(assert (= (and b!632046 res!408805) b!632044))

(assert (= (and b!632044 res!408802) b!632040))

(assert (= (and b!632040 res!408806) b!632047))

(assert (= (and b!632047 res!408798) b!632036))

(assert (= (and b!632036 res!408794) b!632037))

(assert (= (and b!632037 res!408797) b!632038))

(assert (= (and b!632038 res!408804) b!632039))

(assert (= (and b!632038 c!71988) b!632049))

(assert (= (and b!632038 (not c!71988)) b!632045))

(assert (= (and b!632038 (not res!408796)) b!632042))

(declare-fun m!606379 () Bool)

(assert (=> b!632036 m!606379))

(declare-fun m!606381 () Bool)

(assert (=> b!632036 m!606381))

(assert (=> b!632042 m!606379))

(declare-fun m!606383 () Bool)

(assert (=> b!632042 m!606383))

(declare-fun m!606385 () Bool)

(assert (=> b!632042 m!606385))

(declare-fun m!606387 () Bool)

(assert (=> b!632040 m!606387))

(declare-fun m!606389 () Bool)

(assert (=> b!632037 m!606389))

(assert (=> b!632037 m!606385))

(assert (=> b!632037 m!606385))

(declare-fun m!606391 () Bool)

(assert (=> b!632037 m!606391))

(declare-fun m!606393 () Bool)

(assert (=> b!632044 m!606393))

(declare-fun m!606395 () Bool)

(assert (=> b!632038 m!606395))

(declare-fun m!606397 () Bool)

(assert (=> b!632038 m!606397))

(declare-fun m!606399 () Bool)

(assert (=> b!632038 m!606399))

(assert (=> b!632038 m!606379))

(assert (=> b!632038 m!606385))

(declare-fun m!606401 () Bool)

(assert (=> b!632038 m!606401))

(declare-fun m!606403 () Bool)

(assert (=> b!632038 m!606403))

(assert (=> b!632038 m!606385))

(declare-fun m!606405 () Bool)

(assert (=> b!632038 m!606405))

(declare-fun m!606407 () Bool)

(assert (=> b!632046 m!606407))

(declare-fun m!606409 () Bool)

(assert (=> b!632041 m!606409))

(declare-fun m!606411 () Bool)

(assert (=> b!632047 m!606411))

(assert (=> b!632043 m!606385))

(assert (=> b!632043 m!606385))

(declare-fun m!606413 () Bool)

(assert (=> b!632043 m!606413))

(declare-fun m!606415 () Bool)

(assert (=> b!632050 m!606415))

(declare-fun m!606417 () Bool)

(assert (=> start!57096 m!606417))

(declare-fun m!606419 () Bool)

(assert (=> start!57096 m!606419))

(check-sat (not b!632043) (not b!632038) (not b!632044) (not b!632050) (not b!632041) (not b!632037) (not start!57096) (not b!632040) (not b!632046))
(check-sat)
