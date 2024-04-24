; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53400 () Bool)

(assert start!53400)

(declare-fun res!368151 () Bool)

(declare-fun e!333395 () Bool)

(assert (=> start!53400 (=> (not res!368151) (not e!333395))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53400 (= res!368151 (validMask!0 mask!3053))))

(assert (=> start!53400 e!333395))

(assert (=> start!53400 true))

(declare-datatypes ((array!36246 0))(
  ( (array!36247 (arr!17395 (Array (_ BitVec 32) (_ BitVec 64))) (size!17759 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36246)

(declare-fun array_inv!13254 (array!36246) Bool)

(assert (=> start!53400 (array_inv!13254 a!2986)))

(declare-fun b!580439 () Bool)

(declare-fun res!368157 () Bool)

(declare-fun e!333394 () Bool)

(assert (=> b!580439 (=> (not res!368157) (not e!333394))))

(declare-datatypes ((List!11343 0))(
  ( (Nil!11340) (Cons!11339 (h!12387 (_ BitVec 64)) (t!17563 List!11343)) )
))
(declare-fun arrayNoDuplicates!0 (array!36246 (_ BitVec 32) List!11343) Bool)

(assert (=> b!580439 (= res!368157 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11340))))

(declare-fun b!580440 () Bool)

(assert (=> b!580440 (= e!333395 e!333394)))

(declare-fun res!368155 () Bool)

(assert (=> b!580440 (=> (not res!368155) (not e!333394))))

(declare-datatypes ((SeekEntryResult!5791 0))(
  ( (MissingZero!5791 (index!25391 (_ BitVec 32))) (Found!5791 (index!25392 (_ BitVec 32))) (Intermediate!5791 (undefined!6603 Bool) (index!25393 (_ BitVec 32)) (x!54423 (_ BitVec 32))) (Undefined!5791) (MissingVacant!5791 (index!25394 (_ BitVec 32))) )
))
(declare-fun lt!264771 () SeekEntryResult!5791)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580440 (= res!368155 (or (= lt!264771 (MissingZero!5791 i!1108)) (= lt!264771 (MissingVacant!5791 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36246 (_ BitVec 32)) SeekEntryResult!5791)

(assert (=> b!580440 (= lt!264771 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580441 () Bool)

(declare-fun res!368153 () Bool)

(assert (=> b!580441 (=> (not res!368153) (not e!333395))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580441 (= res!368153 (validKeyInArray!0 (select (arr!17395 a!2986) j!136)))))

(declare-fun b!580442 () Bool)

(declare-fun res!368158 () Bool)

(assert (=> b!580442 (=> (not res!368158) (not e!333395))))

(assert (=> b!580442 (= res!368158 (and (= (size!17759 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17759 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17759 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580443 () Bool)

(declare-fun res!368154 () Bool)

(assert (=> b!580443 (=> (not res!368154) (not e!333395))))

(assert (=> b!580443 (= res!368154 (validKeyInArray!0 k0!1786))))

(declare-fun b!580444 () Bool)

(declare-fun res!368152 () Bool)

(assert (=> b!580444 (=> (not res!368152) (not e!333395))))

(declare-fun arrayContainsKey!0 (array!36246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580444 (= res!368152 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580445 () Bool)

(declare-fun res!368150 () Bool)

(assert (=> b!580445 (=> (not res!368150) (not e!333394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36246 (_ BitVec 32)) Bool)

(assert (=> b!580445 (= res!368150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580446 () Bool)

(assert (=> b!580446 (= e!333394 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264772 () SeekEntryResult!5791)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36246 (_ BitVec 32)) SeekEntryResult!5791)

(assert (=> b!580446 (= lt!264772 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17395 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580447 () Bool)

(declare-fun res!368156 () Bool)

(assert (=> b!580447 (=> (not res!368156) (not e!333394))))

(assert (=> b!580447 (= res!368156 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17395 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17395 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53400 res!368151) b!580442))

(assert (= (and b!580442 res!368158) b!580441))

(assert (= (and b!580441 res!368153) b!580443))

(assert (= (and b!580443 res!368154) b!580444))

(assert (= (and b!580444 res!368152) b!580440))

(assert (= (and b!580440 res!368155) b!580445))

(assert (= (and b!580445 res!368150) b!580439))

(assert (= (and b!580439 res!368157) b!580447))

(assert (= (and b!580447 res!368156) b!580446))

(declare-fun m!559181 () Bool)

(assert (=> b!580440 m!559181))

(declare-fun m!559183 () Bool)

(assert (=> b!580441 m!559183))

(assert (=> b!580441 m!559183))

(declare-fun m!559185 () Bool)

(assert (=> b!580441 m!559185))

(declare-fun m!559187 () Bool)

(assert (=> b!580443 m!559187))

(declare-fun m!559189 () Bool)

(assert (=> b!580445 m!559189))

(declare-fun m!559191 () Bool)

(assert (=> b!580444 m!559191))

(assert (=> b!580446 m!559183))

(assert (=> b!580446 m!559183))

(declare-fun m!559193 () Bool)

(assert (=> b!580446 m!559193))

(declare-fun m!559195 () Bool)

(assert (=> b!580439 m!559195))

(declare-fun m!559197 () Bool)

(assert (=> b!580447 m!559197))

(declare-fun m!559199 () Bool)

(assert (=> b!580447 m!559199))

(declare-fun m!559201 () Bool)

(assert (=> b!580447 m!559201))

(declare-fun m!559203 () Bool)

(assert (=> start!53400 m!559203))

(declare-fun m!559205 () Bool)

(assert (=> start!53400 m!559205))

(check-sat (not b!580446) (not b!580440) (not b!580441) (not b!580445) (not b!580439) (not b!580444) (not start!53400) (not b!580443))
(check-sat)
