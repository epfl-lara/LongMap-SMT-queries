; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53340 () Bool)

(assert start!53340)

(declare-fun b!580104 () Bool)

(declare-fun e!333222 () Bool)

(declare-fun e!333221 () Bool)

(assert (=> b!580104 (= e!333222 e!333221)))

(declare-fun res!367927 () Bool)

(assert (=> b!580104 (=> (not res!367927) (not e!333221))))

(declare-datatypes ((SeekEntryResult!5835 0))(
  ( (MissingZero!5835 (index!25567 (_ BitVec 32))) (Found!5835 (index!25568 (_ BitVec 32))) (Intermediate!5835 (undefined!6647 Bool) (index!25569 (_ BitVec 32)) (x!54448 (_ BitVec 32))) (Undefined!5835) (MissingVacant!5835 (index!25570 (_ BitVec 32))) )
))
(declare-fun lt!264631 () SeekEntryResult!5835)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580104 (= res!367927 (or (= lt!264631 (MissingZero!5835 i!1108)) (= lt!264631 (MissingVacant!5835 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36241 0))(
  ( (array!36242 (arr!17395 (Array (_ BitVec 32) (_ BitVec 64))) (size!17759 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36241)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36241 (_ BitVec 32)) SeekEntryResult!5835)

(assert (=> b!580104 (= lt!264631 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580105 () Bool)

(declare-fun res!367924 () Bool)

(assert (=> b!580105 (=> (not res!367924) (not e!333222))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580105 (= res!367924 (and (= (size!17759 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17759 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17759 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580107 () Bool)

(declare-fun res!367928 () Bool)

(assert (=> b!580107 (=> (not res!367928) (not e!333222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580107 (= res!367928 (validKeyInArray!0 k0!1786))))

(declare-fun b!580108 () Bool)

(declare-fun res!367926 () Bool)

(assert (=> b!580108 (=> (not res!367926) (not e!333221))))

(declare-datatypes ((List!11436 0))(
  ( (Nil!11433) (Cons!11432 (h!12477 (_ BitVec 64)) (t!17664 List!11436)) )
))
(declare-fun arrayNoDuplicates!0 (array!36241 (_ BitVec 32) List!11436) Bool)

(assert (=> b!580108 (= res!367926 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11433))))

(declare-fun b!580109 () Bool)

(declare-fun res!367920 () Bool)

(assert (=> b!580109 (=> (not res!367920) (not e!333221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36241 (_ BitVec 32)) Bool)

(assert (=> b!580109 (= res!367920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580110 () Bool)

(declare-fun res!367922 () Bool)

(assert (=> b!580110 (=> (not res!367922) (not e!333221))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580110 (= res!367922 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17395 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17395 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580111 () Bool)

(assert (=> b!580111 (= e!333221 false)))

(declare-fun lt!264630 () SeekEntryResult!5835)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36241 (_ BitVec 32)) SeekEntryResult!5835)

(assert (=> b!580111 (= lt!264630 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17395 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580112 () Bool)

(declare-fun res!367921 () Bool)

(assert (=> b!580112 (=> (not res!367921) (not e!333222))))

(assert (=> b!580112 (= res!367921 (validKeyInArray!0 (select (arr!17395 a!2986) j!136)))))

(declare-fun res!367923 () Bool)

(assert (=> start!53340 (=> (not res!367923) (not e!333222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53340 (= res!367923 (validMask!0 mask!3053))))

(assert (=> start!53340 e!333222))

(assert (=> start!53340 true))

(declare-fun array_inv!13191 (array!36241) Bool)

(assert (=> start!53340 (array_inv!13191 a!2986)))

(declare-fun b!580106 () Bool)

(declare-fun res!367925 () Bool)

(assert (=> b!580106 (=> (not res!367925) (not e!333222))))

(declare-fun arrayContainsKey!0 (array!36241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580106 (= res!367925 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53340 res!367923) b!580105))

(assert (= (and b!580105 res!367924) b!580112))

(assert (= (and b!580112 res!367921) b!580107))

(assert (= (and b!580107 res!367928) b!580106))

(assert (= (and b!580106 res!367925) b!580104))

(assert (= (and b!580104 res!367927) b!580109))

(assert (= (and b!580109 res!367920) b!580108))

(assert (= (and b!580108 res!367926) b!580110))

(assert (= (and b!580110 res!367922) b!580111))

(declare-fun m!558699 () Bool)

(assert (=> b!580108 m!558699))

(declare-fun m!558701 () Bool)

(assert (=> b!580111 m!558701))

(assert (=> b!580111 m!558701))

(declare-fun m!558703 () Bool)

(assert (=> b!580111 m!558703))

(assert (=> b!580112 m!558701))

(assert (=> b!580112 m!558701))

(declare-fun m!558705 () Bool)

(assert (=> b!580112 m!558705))

(declare-fun m!558707 () Bool)

(assert (=> start!53340 m!558707))

(declare-fun m!558709 () Bool)

(assert (=> start!53340 m!558709))

(declare-fun m!558711 () Bool)

(assert (=> b!580104 m!558711))

(declare-fun m!558713 () Bool)

(assert (=> b!580106 m!558713))

(declare-fun m!558715 () Bool)

(assert (=> b!580110 m!558715))

(declare-fun m!558717 () Bool)

(assert (=> b!580110 m!558717))

(declare-fun m!558719 () Bool)

(assert (=> b!580110 m!558719))

(declare-fun m!558721 () Bool)

(assert (=> b!580109 m!558721))

(declare-fun m!558723 () Bool)

(assert (=> b!580107 m!558723))

(check-sat (not b!580108) (not start!53340) (not b!580111) (not b!580107) (not b!580109) (not b!580106) (not b!580112) (not b!580104))
