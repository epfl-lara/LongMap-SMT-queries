; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53274 () Bool)

(assert start!53274)

(declare-fun b!579158 () Bool)

(declare-fun res!367122 () Bool)

(declare-fun e!332822 () Bool)

(assert (=> b!579158 (=> (not res!367122) (not e!332822))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36189 0))(
  ( (array!36190 (arr!17369 (Array (_ BitVec 32) (_ BitVec 64))) (size!17734 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36189)

(assert (=> b!579158 (= res!367122 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17369 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17369 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579160 () Bool)

(declare-fun res!367123 () Bool)

(declare-fun e!332821 () Bool)

(assert (=> b!579160 (=> (not res!367123) (not e!332821))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579160 (= res!367123 (validKeyInArray!0 (select (arr!17369 a!2986) j!136)))))

(declare-fun b!579161 () Bool)

(declare-fun res!367119 () Bool)

(assert (=> b!579161 (=> (not res!367119) (not e!332821))))

(assert (=> b!579161 (= res!367119 (and (= (size!17734 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17734 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17734 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579162 () Bool)

(declare-fun res!367117 () Bool)

(assert (=> b!579162 (=> (not res!367117) (not e!332821))))

(assert (=> b!579162 (= res!367117 (validKeyInArray!0 k0!1786))))

(declare-fun b!579163 () Bool)

(assert (=> b!579163 (= e!332821 e!332822)))

(declare-fun res!367121 () Bool)

(assert (=> b!579163 (=> (not res!367121) (not e!332822))))

(declare-datatypes ((SeekEntryResult!5806 0))(
  ( (MissingZero!5806 (index!25451 (_ BitVec 32))) (Found!5806 (index!25452 (_ BitVec 32))) (Intermediate!5806 (undefined!6618 Bool) (index!25453 (_ BitVec 32)) (x!54350 (_ BitVec 32))) (Undefined!5806) (MissingVacant!5806 (index!25454 (_ BitVec 32))) )
))
(declare-fun lt!264246 () SeekEntryResult!5806)

(assert (=> b!579163 (= res!367121 (or (= lt!264246 (MissingZero!5806 i!1108)) (= lt!264246 (MissingVacant!5806 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36189 (_ BitVec 32)) SeekEntryResult!5806)

(assert (=> b!579163 (= lt!264246 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579164 () Bool)

(assert (=> b!579164 (= e!332822 false)))

(declare-fun lt!264247 () SeekEntryResult!5806)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36189 (_ BitVec 32)) SeekEntryResult!5806)

(assert (=> b!579164 (= lt!264247 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17369 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579159 () Bool)

(declare-fun res!367118 () Bool)

(assert (=> b!579159 (=> (not res!367118) (not e!332821))))

(declare-fun arrayContainsKey!0 (array!36189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579159 (= res!367118 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!367124 () Bool)

(assert (=> start!53274 (=> (not res!367124) (not e!332821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53274 (= res!367124 (validMask!0 mask!3053))))

(assert (=> start!53274 e!332821))

(assert (=> start!53274 true))

(declare-fun array_inv!13252 (array!36189) Bool)

(assert (=> start!53274 (array_inv!13252 a!2986)))

(declare-fun b!579165 () Bool)

(declare-fun res!367116 () Bool)

(assert (=> b!579165 (=> (not res!367116) (not e!332822))))

(declare-datatypes ((List!11449 0))(
  ( (Nil!11446) (Cons!11445 (h!12490 (_ BitVec 64)) (t!17668 List!11449)) )
))
(declare-fun arrayNoDuplicates!0 (array!36189 (_ BitVec 32) List!11449) Bool)

(assert (=> b!579165 (= res!367116 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11446))))

(declare-fun b!579166 () Bool)

(declare-fun res!367120 () Bool)

(assert (=> b!579166 (=> (not res!367120) (not e!332822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36189 (_ BitVec 32)) Bool)

(assert (=> b!579166 (= res!367120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53274 res!367124) b!579161))

(assert (= (and b!579161 res!367119) b!579160))

(assert (= (and b!579160 res!367123) b!579162))

(assert (= (and b!579162 res!367117) b!579159))

(assert (= (and b!579159 res!367118) b!579163))

(assert (= (and b!579163 res!367121) b!579166))

(assert (= (and b!579166 res!367120) b!579165))

(assert (= (and b!579165 res!367116) b!579158))

(assert (= (and b!579158 res!367122) b!579164))

(declare-fun m!557263 () Bool)

(assert (=> b!579165 m!557263))

(declare-fun m!557265 () Bool)

(assert (=> b!579166 m!557265))

(declare-fun m!557267 () Bool)

(assert (=> b!579158 m!557267))

(declare-fun m!557269 () Bool)

(assert (=> b!579158 m!557269))

(declare-fun m!557271 () Bool)

(assert (=> b!579158 m!557271))

(declare-fun m!557273 () Bool)

(assert (=> b!579159 m!557273))

(declare-fun m!557275 () Bool)

(assert (=> b!579163 m!557275))

(declare-fun m!557277 () Bool)

(assert (=> b!579164 m!557277))

(assert (=> b!579164 m!557277))

(declare-fun m!557279 () Bool)

(assert (=> b!579164 m!557279))

(declare-fun m!557281 () Bool)

(assert (=> b!579162 m!557281))

(assert (=> b!579160 m!557277))

(assert (=> b!579160 m!557277))

(declare-fun m!557283 () Bool)

(assert (=> b!579160 m!557283))

(declare-fun m!557285 () Bool)

(assert (=> start!53274 m!557285))

(declare-fun m!557287 () Bool)

(assert (=> start!53274 m!557287))

(check-sat (not b!579163) (not b!579159) (not start!53274) (not b!579162) (not b!579164) (not b!579160) (not b!579166) (not b!579165))
(check-sat)
