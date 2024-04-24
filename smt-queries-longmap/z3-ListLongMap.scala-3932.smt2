; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53652 () Bool)

(assert start!53652)

(declare-fun b!583955 () Bool)

(declare-fun res!371675 () Bool)

(declare-fun e!334548 () Bool)

(assert (=> b!583955 (=> (not res!371675) (not e!334548))))

(declare-datatypes ((array!36498 0))(
  ( (array!36499 (arr!17521 (Array (_ BitVec 32) (_ BitVec 64))) (size!17885 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36498)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583955 (= res!371675 (validKeyInArray!0 (select (arr!17521 a!2986) j!136)))))

(declare-fun b!583956 () Bool)

(declare-fun res!371671 () Bool)

(declare-fun e!334550 () Bool)

(assert (=> b!583956 (=> (not res!371671) (not e!334550))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583956 (= res!371671 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17521 a!2986) index!984) (select (arr!17521 a!2986) j!136))) (not (= (select (arr!17521 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583957 () Bool)

(declare-fun e!334551 () Bool)

(assert (=> b!583957 (= e!334550 e!334551)))

(declare-fun res!371674 () Bool)

(assert (=> b!583957 (=> (not res!371674) (not e!334551))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!265502 () (_ BitVec 32))

(assert (=> b!583957 (= res!371674 (and (bvsge lt!265502 #b00000000000000000000000000000000) (bvslt lt!265502 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583957 (= lt!265502 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!583958 () Bool)

(declare-fun res!371667 () Bool)

(assert (=> b!583958 (=> (not res!371667) (not e!334550))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5917 0))(
  ( (MissingZero!5917 (index!25895 (_ BitVec 32))) (Found!5917 (index!25896 (_ BitVec 32))) (Intermediate!5917 (undefined!6729 Bool) (index!25897 (_ BitVec 32)) (x!54885 (_ BitVec 32))) (Undefined!5917) (MissingVacant!5917 (index!25898 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36498 (_ BitVec 32)) SeekEntryResult!5917)

(assert (=> b!583958 (= res!371667 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17521 a!2986) j!136) a!2986 mask!3053) (Found!5917 j!136)))))

(declare-fun b!583959 () Bool)

(declare-fun res!371676 () Bool)

(assert (=> b!583959 (=> (not res!371676) (not e!334550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36498 (_ BitVec 32)) Bool)

(assert (=> b!583959 (= res!371676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583960 () Bool)

(assert (=> b!583960 (= e!334548 e!334550)))

(declare-fun res!371672 () Bool)

(assert (=> b!583960 (=> (not res!371672) (not e!334550))))

(declare-fun lt!265504 () SeekEntryResult!5917)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583960 (= res!371672 (or (= lt!265504 (MissingZero!5917 i!1108)) (= lt!265504 (MissingVacant!5917 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36498 (_ BitVec 32)) SeekEntryResult!5917)

(assert (=> b!583960 (= lt!265504 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583961 () Bool)

(declare-fun res!371666 () Bool)

(assert (=> b!583961 (=> (not res!371666) (not e!334550))))

(declare-datatypes ((List!11469 0))(
  ( (Nil!11466) (Cons!11465 (h!12513 (_ BitVec 64)) (t!17689 List!11469)) )
))
(declare-fun arrayNoDuplicates!0 (array!36498 (_ BitVec 32) List!11469) Bool)

(assert (=> b!583961 (= res!371666 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11466))))

(declare-fun b!583962 () Bool)

(declare-fun res!371677 () Bool)

(assert (=> b!583962 (=> (not res!371677) (not e!334548))))

(assert (=> b!583962 (= res!371677 (and (= (size!17885 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17885 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17885 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583963 () Bool)

(declare-fun res!371670 () Bool)

(assert (=> b!583963 (=> (not res!371670) (not e!334548))))

(assert (=> b!583963 (= res!371670 (validKeyInArray!0 k0!1786))))

(declare-fun b!583964 () Bool)

(declare-fun res!371669 () Bool)

(assert (=> b!583964 (=> (not res!371669) (not e!334550))))

(assert (=> b!583964 (= res!371669 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17521 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17521 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!371673 () Bool)

(assert (=> start!53652 (=> (not res!371673) (not e!334548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53652 (= res!371673 (validMask!0 mask!3053))))

(assert (=> start!53652 e!334548))

(assert (=> start!53652 true))

(declare-fun array_inv!13380 (array!36498) Bool)

(assert (=> start!53652 (array_inv!13380 a!2986)))

(declare-fun b!583965 () Bool)

(assert (=> b!583965 (= e!334551 false)))

(declare-fun lt!265503 () SeekEntryResult!5917)

(assert (=> b!583965 (= lt!265503 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265502 vacantSpotIndex!68 (select (arr!17521 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583966 () Bool)

(declare-fun res!371668 () Bool)

(assert (=> b!583966 (=> (not res!371668) (not e!334548))))

(declare-fun arrayContainsKey!0 (array!36498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583966 (= res!371668 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53652 res!371673) b!583962))

(assert (= (and b!583962 res!371677) b!583955))

(assert (= (and b!583955 res!371675) b!583963))

(assert (= (and b!583963 res!371670) b!583966))

(assert (= (and b!583966 res!371668) b!583960))

(assert (= (and b!583960 res!371672) b!583959))

(assert (= (and b!583959 res!371676) b!583961))

(assert (= (and b!583961 res!371666) b!583964))

(assert (= (and b!583964 res!371669) b!583958))

(assert (= (and b!583958 res!371667) b!583956))

(assert (= (and b!583956 res!371671) b!583957))

(assert (= (and b!583957 res!371674) b!583965))

(declare-fun m!562535 () Bool)

(assert (=> b!583963 m!562535))

(declare-fun m!562537 () Bool)

(assert (=> b!583956 m!562537))

(declare-fun m!562539 () Bool)

(assert (=> b!583956 m!562539))

(assert (=> b!583958 m!562539))

(assert (=> b!583958 m!562539))

(declare-fun m!562541 () Bool)

(assert (=> b!583958 m!562541))

(declare-fun m!562543 () Bool)

(assert (=> b!583960 m!562543))

(assert (=> b!583965 m!562539))

(assert (=> b!583965 m!562539))

(declare-fun m!562545 () Bool)

(assert (=> b!583965 m!562545))

(declare-fun m!562547 () Bool)

(assert (=> b!583966 m!562547))

(declare-fun m!562549 () Bool)

(assert (=> start!53652 m!562549))

(declare-fun m!562551 () Bool)

(assert (=> start!53652 m!562551))

(declare-fun m!562553 () Bool)

(assert (=> b!583957 m!562553))

(declare-fun m!562555 () Bool)

(assert (=> b!583964 m!562555))

(declare-fun m!562557 () Bool)

(assert (=> b!583964 m!562557))

(declare-fun m!562559 () Bool)

(assert (=> b!583964 m!562559))

(declare-fun m!562561 () Bool)

(assert (=> b!583959 m!562561))

(declare-fun m!562563 () Bool)

(assert (=> b!583961 m!562563))

(assert (=> b!583955 m!562539))

(assert (=> b!583955 m!562539))

(declare-fun m!562565 () Bool)

(assert (=> b!583955 m!562565))

(check-sat (not b!583959) (not b!583957) (not b!583963) (not b!583965) (not b!583955) (not b!583961) (not b!583960) (not start!53652) (not b!583958) (not b!583966))
(check-sat)
