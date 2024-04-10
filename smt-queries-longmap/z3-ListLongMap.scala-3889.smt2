; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53346 () Bool)

(assert start!53346)

(declare-fun b!580185 () Bool)

(declare-fun res!368008 () Bool)

(declare-fun e!333249 () Bool)

(assert (=> b!580185 (=> (not res!368008) (not e!333249))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580185 (= res!368008 (validKeyInArray!0 k0!1786))))

(declare-fun b!580187 () Bool)

(declare-fun res!368001 () Bool)

(assert (=> b!580187 (=> (not res!368001) (not e!333249))))

(declare-datatypes ((array!36247 0))(
  ( (array!36248 (arr!17398 (Array (_ BitVec 32) (_ BitVec 64))) (size!17762 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36247)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580187 (= res!368001 (validKeyInArray!0 (select (arr!17398 a!2986) j!136)))))

(declare-fun b!580188 () Bool)

(declare-fun res!368006 () Bool)

(declare-fun e!333247 () Bool)

(assert (=> b!580188 (=> (not res!368006) (not e!333247))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36247 (_ BitVec 32)) Bool)

(assert (=> b!580188 (= res!368006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580189 () Bool)

(declare-fun res!368003 () Bool)

(assert (=> b!580189 (=> (not res!368003) (not e!333249))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580189 (= res!368003 (and (= (size!17762 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17762 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17762 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580190 () Bool)

(assert (=> b!580190 (= e!333249 e!333247)))

(declare-fun res!368004 () Bool)

(assert (=> b!580190 (=> (not res!368004) (not e!333247))))

(declare-datatypes ((SeekEntryResult!5838 0))(
  ( (MissingZero!5838 (index!25579 (_ BitVec 32))) (Found!5838 (index!25580 (_ BitVec 32))) (Intermediate!5838 (undefined!6650 Bool) (index!25581 (_ BitVec 32)) (x!54459 (_ BitVec 32))) (Undefined!5838) (MissingVacant!5838 (index!25582 (_ BitVec 32))) )
))
(declare-fun lt!264648 () SeekEntryResult!5838)

(assert (=> b!580190 (= res!368004 (or (= lt!264648 (MissingZero!5838 i!1108)) (= lt!264648 (MissingVacant!5838 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36247 (_ BitVec 32)) SeekEntryResult!5838)

(assert (=> b!580190 (= lt!264648 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580191 () Bool)

(declare-fun res!368007 () Bool)

(assert (=> b!580191 (=> (not res!368007) (not e!333247))))

(declare-datatypes ((List!11439 0))(
  ( (Nil!11436) (Cons!11435 (h!12480 (_ BitVec 64)) (t!17667 List!11439)) )
))
(declare-fun arrayNoDuplicates!0 (array!36247 (_ BitVec 32) List!11439) Bool)

(assert (=> b!580191 (= res!368007 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11436))))

(declare-fun res!368009 () Bool)

(assert (=> start!53346 (=> (not res!368009) (not e!333249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53346 (= res!368009 (validMask!0 mask!3053))))

(assert (=> start!53346 e!333249))

(assert (=> start!53346 true))

(declare-fun array_inv!13194 (array!36247) Bool)

(assert (=> start!53346 (array_inv!13194 a!2986)))

(declare-fun b!580186 () Bool)

(declare-fun res!368005 () Bool)

(assert (=> b!580186 (=> (not res!368005) (not e!333249))))

(declare-fun arrayContainsKey!0 (array!36247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580186 (= res!368005 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580192 () Bool)

(assert (=> b!580192 (= e!333247 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264649 () SeekEntryResult!5838)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36247 (_ BitVec 32)) SeekEntryResult!5838)

(assert (=> b!580192 (= lt!264649 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17398 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580193 () Bool)

(declare-fun res!368002 () Bool)

(assert (=> b!580193 (=> (not res!368002) (not e!333247))))

(assert (=> b!580193 (= res!368002 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17398 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17398 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53346 res!368009) b!580189))

(assert (= (and b!580189 res!368003) b!580187))

(assert (= (and b!580187 res!368001) b!580185))

(assert (= (and b!580185 res!368008) b!580186))

(assert (= (and b!580186 res!368005) b!580190))

(assert (= (and b!580190 res!368004) b!580188))

(assert (= (and b!580188 res!368006) b!580191))

(assert (= (and b!580191 res!368007) b!580193))

(assert (= (and b!580193 res!368002) b!580192))

(declare-fun m!558777 () Bool)

(assert (=> b!580191 m!558777))

(declare-fun m!558779 () Bool)

(assert (=> b!580192 m!558779))

(assert (=> b!580192 m!558779))

(declare-fun m!558781 () Bool)

(assert (=> b!580192 m!558781))

(declare-fun m!558783 () Bool)

(assert (=> start!53346 m!558783))

(declare-fun m!558785 () Bool)

(assert (=> start!53346 m!558785))

(assert (=> b!580187 m!558779))

(assert (=> b!580187 m!558779))

(declare-fun m!558787 () Bool)

(assert (=> b!580187 m!558787))

(declare-fun m!558789 () Bool)

(assert (=> b!580188 m!558789))

(declare-fun m!558791 () Bool)

(assert (=> b!580185 m!558791))

(declare-fun m!558793 () Bool)

(assert (=> b!580193 m!558793))

(declare-fun m!558795 () Bool)

(assert (=> b!580193 m!558795))

(declare-fun m!558797 () Bool)

(assert (=> b!580193 m!558797))

(declare-fun m!558799 () Bool)

(assert (=> b!580190 m!558799))

(declare-fun m!558801 () Bool)

(assert (=> b!580186 m!558801))

(check-sat (not b!580187) (not b!580191) (not b!580190) (not b!580188) (not start!53346) (not b!580192) (not b!580185) (not b!580186))
