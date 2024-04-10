; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53568 () Bool)

(assert start!53568)

(declare-fun res!371034 () Bool)

(declare-fun e!334247 () Bool)

(assert (=> start!53568 (=> (not res!371034) (not e!334247))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53568 (= res!371034 (validMask!0 mask!3053))))

(assert (=> start!53568 e!334247))

(assert (=> start!53568 true))

(declare-datatypes ((array!36469 0))(
  ( (array!36470 (arr!17509 (Array (_ BitVec 32) (_ BitVec 64))) (size!17873 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36469)

(declare-fun array_inv!13305 (array!36469) Bool)

(assert (=> start!53568 (array_inv!13305 a!2986)))

(declare-fun b!583218 () Bool)

(declare-fun res!371041 () Bool)

(declare-fun e!334246 () Bool)

(assert (=> b!583218 (=> (not res!371041) (not e!334246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36469 (_ BitVec 32)) Bool)

(assert (=> b!583218 (= res!371041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583219 () Bool)

(assert (=> b!583219 (= e!334246 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5949 0))(
  ( (MissingZero!5949 (index!26023 (_ BitVec 32))) (Found!5949 (index!26024 (_ BitVec 32))) (Intermediate!5949 (undefined!6761 Bool) (index!26025 (_ BitVec 32)) (x!54866 (_ BitVec 32))) (Undefined!5949) (MissingVacant!5949 (index!26026 (_ BitVec 32))) )
))
(declare-fun lt!265287 () SeekEntryResult!5949)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36469 (_ BitVec 32)) SeekEntryResult!5949)

(assert (=> b!583219 (= lt!265287 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17509 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583220 () Bool)

(declare-fun res!371037 () Bool)

(assert (=> b!583220 (=> (not res!371037) (not e!334247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583220 (= res!371037 (validKeyInArray!0 (select (arr!17509 a!2986) j!136)))))

(declare-fun b!583221 () Bool)

(assert (=> b!583221 (= e!334247 e!334246)))

(declare-fun res!371039 () Bool)

(assert (=> b!583221 (=> (not res!371039) (not e!334246))))

(declare-fun lt!265288 () SeekEntryResult!5949)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583221 (= res!371039 (or (= lt!265288 (MissingZero!5949 i!1108)) (= lt!265288 (MissingVacant!5949 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36469 (_ BitVec 32)) SeekEntryResult!5949)

(assert (=> b!583221 (= lt!265288 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583222 () Bool)

(declare-fun res!371036 () Bool)

(assert (=> b!583222 (=> (not res!371036) (not e!334247))))

(assert (=> b!583222 (= res!371036 (and (= (size!17873 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17873 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17873 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583223 () Bool)

(declare-fun res!371035 () Bool)

(assert (=> b!583223 (=> (not res!371035) (not e!334246))))

(assert (=> b!583223 (= res!371035 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17509 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17509 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583224 () Bool)

(declare-fun res!371038 () Bool)

(assert (=> b!583224 (=> (not res!371038) (not e!334246))))

(declare-datatypes ((List!11550 0))(
  ( (Nil!11547) (Cons!11546 (h!12591 (_ BitVec 64)) (t!17778 List!11550)) )
))
(declare-fun arrayNoDuplicates!0 (array!36469 (_ BitVec 32) List!11550) Bool)

(assert (=> b!583224 (= res!371038 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11547))))

(declare-fun b!583225 () Bool)

(declare-fun res!371040 () Bool)

(assert (=> b!583225 (=> (not res!371040) (not e!334247))))

(assert (=> b!583225 (= res!371040 (validKeyInArray!0 k0!1786))))

(declare-fun b!583226 () Bool)

(declare-fun res!371042 () Bool)

(assert (=> b!583226 (=> (not res!371042) (not e!334247))))

(declare-fun arrayContainsKey!0 (array!36469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583226 (= res!371042 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53568 res!371034) b!583222))

(assert (= (and b!583222 res!371036) b!583220))

(assert (= (and b!583220 res!371037) b!583225))

(assert (= (and b!583225 res!371040) b!583226))

(assert (= (and b!583226 res!371042) b!583221))

(assert (= (and b!583221 res!371039) b!583218))

(assert (= (and b!583218 res!371041) b!583224))

(assert (= (and b!583224 res!371038) b!583223))

(assert (= (and b!583223 res!371035) b!583219))

(declare-fun m!561693 () Bool)

(assert (=> b!583220 m!561693))

(assert (=> b!583220 m!561693))

(declare-fun m!561695 () Bool)

(assert (=> b!583220 m!561695))

(declare-fun m!561697 () Bool)

(assert (=> start!53568 m!561697))

(declare-fun m!561699 () Bool)

(assert (=> start!53568 m!561699))

(assert (=> b!583219 m!561693))

(assert (=> b!583219 m!561693))

(declare-fun m!561701 () Bool)

(assert (=> b!583219 m!561701))

(declare-fun m!561703 () Bool)

(assert (=> b!583226 m!561703))

(declare-fun m!561705 () Bool)

(assert (=> b!583221 m!561705))

(declare-fun m!561707 () Bool)

(assert (=> b!583218 m!561707))

(declare-fun m!561709 () Bool)

(assert (=> b!583224 m!561709))

(declare-fun m!561711 () Bool)

(assert (=> b!583225 m!561711))

(declare-fun m!561713 () Bool)

(assert (=> b!583223 m!561713))

(declare-fun m!561715 () Bool)

(assert (=> b!583223 m!561715))

(declare-fun m!561717 () Bool)

(assert (=> b!583223 m!561717))

(check-sat (not b!583225) (not b!583226) (not b!583219) (not b!583218) (not b!583224) (not b!583221) (not b!583220) (not start!53568))
(check-sat)
