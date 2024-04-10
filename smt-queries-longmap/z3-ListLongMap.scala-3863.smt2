; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53190 () Bool)

(assert start!53190)

(declare-fun b!578182 () Bool)

(declare-fun e!332546 () Bool)

(declare-fun e!332547 () Bool)

(assert (=> b!578182 (= e!332546 e!332547)))

(declare-fun res!366002 () Bool)

(assert (=> b!578182 (=> (not res!366002) (not e!332547))))

(declare-datatypes ((SeekEntryResult!5760 0))(
  ( (MissingZero!5760 (index!25267 (_ BitVec 32))) (Found!5760 (index!25268 (_ BitVec 32))) (Intermediate!5760 (undefined!6572 Bool) (index!25269 (_ BitVec 32)) (x!54173 (_ BitVec 32))) (Undefined!5760) (MissingVacant!5760 (index!25270 (_ BitVec 32))) )
))
(declare-fun lt!264193 () SeekEntryResult!5760)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578182 (= res!366002 (or (= lt!264193 (MissingZero!5760 i!1108)) (= lt!264193 (MissingVacant!5760 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36091 0))(
  ( (array!36092 (arr!17320 (Array (_ BitVec 32) (_ BitVec 64))) (size!17684 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36091)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36091 (_ BitVec 32)) SeekEntryResult!5760)

(assert (=> b!578182 (= lt!264193 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578183 () Bool)

(declare-fun res!365998 () Bool)

(assert (=> b!578183 (=> (not res!365998) (not e!332547))))

(declare-datatypes ((List!11361 0))(
  ( (Nil!11358) (Cons!11357 (h!12402 (_ BitVec 64)) (t!17589 List!11361)) )
))
(declare-fun arrayNoDuplicates!0 (array!36091 (_ BitVec 32) List!11361) Bool)

(assert (=> b!578183 (= res!365998 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11358))))

(declare-fun b!578184 () Bool)

(declare-fun res!366005 () Bool)

(assert (=> b!578184 (=> (not res!366005) (not e!332546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578184 (= res!366005 (validKeyInArray!0 k0!1786))))

(declare-fun b!578185 () Bool)

(declare-fun res!365999 () Bool)

(assert (=> b!578185 (=> (not res!365999) (not e!332546))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578185 (= res!365999 (and (= (size!17684 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17684 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17684 a!2986)) (not (= i!1108 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!578186 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578186 (= e!332547 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17320 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17320 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun res!366003 () Bool)

(assert (=> start!53190 (=> (not res!366003) (not e!332546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53190 (= res!366003 (validMask!0 mask!3053))))

(assert (=> start!53190 e!332546))

(assert (=> start!53190 true))

(declare-fun array_inv!13116 (array!36091) Bool)

(assert (=> start!53190 (array_inv!13116 a!2986)))

(declare-fun b!578187 () Bool)

(declare-fun res!366000 () Bool)

(assert (=> b!578187 (=> (not res!366000) (not e!332547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36091 (_ BitVec 32)) Bool)

(assert (=> b!578187 (= res!366000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578188 () Bool)

(declare-fun res!366004 () Bool)

(assert (=> b!578188 (=> (not res!366004) (not e!332546))))

(declare-fun arrayContainsKey!0 (array!36091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578188 (= res!366004 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578189 () Bool)

(declare-fun res!366001 () Bool)

(assert (=> b!578189 (=> (not res!366001) (not e!332546))))

(assert (=> b!578189 (= res!366001 (validKeyInArray!0 (select (arr!17320 a!2986) j!136)))))

(assert (= (and start!53190 res!366003) b!578185))

(assert (= (and b!578185 res!365999) b!578189))

(assert (= (and b!578189 res!366001) b!578184))

(assert (= (and b!578184 res!366005) b!578188))

(assert (= (and b!578188 res!366004) b!578182))

(assert (= (and b!578182 res!366002) b!578187))

(assert (= (and b!578187 res!366000) b!578183))

(assert (= (and b!578183 res!365998) b!578186))

(declare-fun m!556897 () Bool)

(assert (=> b!578183 m!556897))

(declare-fun m!556899 () Bool)

(assert (=> start!53190 m!556899))

(declare-fun m!556901 () Bool)

(assert (=> start!53190 m!556901))

(declare-fun m!556903 () Bool)

(assert (=> b!578186 m!556903))

(declare-fun m!556905 () Bool)

(assert (=> b!578186 m!556905))

(declare-fun m!556907 () Bool)

(assert (=> b!578186 m!556907))

(declare-fun m!556909 () Bool)

(assert (=> b!578184 m!556909))

(declare-fun m!556911 () Bool)

(assert (=> b!578187 m!556911))

(declare-fun m!556913 () Bool)

(assert (=> b!578189 m!556913))

(assert (=> b!578189 m!556913))

(declare-fun m!556915 () Bool)

(assert (=> b!578189 m!556915))

(declare-fun m!556917 () Bool)

(assert (=> b!578182 m!556917))

(declare-fun m!556919 () Bool)

(assert (=> b!578188 m!556919))

(check-sat (not b!578184) (not b!578188) (not start!53190) (not b!578183) (not b!578187) (not b!578182) (not b!578189))
(check-sat)
