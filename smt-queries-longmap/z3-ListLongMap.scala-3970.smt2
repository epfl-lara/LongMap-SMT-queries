; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53892 () Bool)

(assert start!53892)

(declare-fun b!587944 () Bool)

(declare-fun res!375584 () Bool)

(declare-fun e!335795 () Bool)

(assert (=> b!587944 (=> (not res!375584) (not e!335795))))

(declare-datatypes ((array!36736 0))(
  ( (array!36737 (arr!17641 (Array (_ BitVec 32) (_ BitVec 64))) (size!18005 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36736)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36736 (_ BitVec 32)) Bool)

(assert (=> b!587944 (= res!375584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587945 () Bool)

(declare-fun res!375583 () Bool)

(assert (=> b!587945 (=> (not res!375583) (not e!335795))))

(declare-datatypes ((List!11682 0))(
  ( (Nil!11679) (Cons!11678 (h!12723 (_ BitVec 64)) (t!17910 List!11682)) )
))
(declare-fun arrayNoDuplicates!0 (array!36736 (_ BitVec 32) List!11682) Bool)

(assert (=> b!587945 (= res!375583 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11679))))

(declare-fun b!587946 () Bool)

(declare-fun res!375585 () Bool)

(declare-fun e!335797 () Bool)

(assert (=> b!587946 (=> (not res!375585) (not e!335797))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587946 (= res!375585 (and (= (size!18005 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18005 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18005 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587947 () Bool)

(declare-fun res!375589 () Bool)

(assert (=> b!587947 (=> (not res!375589) (not e!335797))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587947 (= res!375589 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587948 () Bool)

(declare-fun e!335798 () Bool)

(assert (=> b!587948 (= e!335798 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun e!335796 () Bool)

(assert (=> b!587948 e!335796))

(declare-fun res!375586 () Bool)

(assert (=> b!587948 (=> (not res!375586) (not e!335796))))

(declare-datatypes ((SeekEntryResult!6081 0))(
  ( (MissingZero!6081 (index!26554 (_ BitVec 32))) (Found!6081 (index!26555 (_ BitVec 32))) (Intermediate!6081 (undefined!6893 Bool) (index!26556 (_ BitVec 32)) (x!55359 (_ BitVec 32))) (Undefined!6081) (MissingVacant!6081 (index!26557 (_ BitVec 32))) )
))
(declare-fun lt!266567 () SeekEntryResult!6081)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266565 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36736 (_ BitVec 32)) SeekEntryResult!6081)

(assert (=> b!587948 (= res!375586 (= lt!266567 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266565 vacantSpotIndex!68 (select (store (arr!17641 a!2986) i!1108 k0!1786) j!136) (array!36737 (store (arr!17641 a!2986) i!1108 k0!1786) (size!18005 a!2986)) mask!3053)))))

(assert (=> b!587948 (= lt!266567 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266565 vacantSpotIndex!68 (select (arr!17641 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18282 0))(
  ( (Unit!18283) )
))
(declare-fun lt!266566 () Unit!18282)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36736 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18282)

(assert (=> b!587948 (= lt!266566 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266565 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587948 (= lt!266565 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587949 () Bool)

(declare-fun res!375582 () Bool)

(assert (=> b!587949 (=> (not res!375582) (not e!335797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587949 (= res!375582 (validKeyInArray!0 (select (arr!17641 a!2986) j!136)))))

(declare-fun b!587950 () Bool)

(assert (=> b!587950 (= e!335795 e!335798)))

(declare-fun res!375587 () Bool)

(assert (=> b!587950 (=> (not res!375587) (not e!335798))))

(declare-fun lt!266568 () SeekEntryResult!6081)

(assert (=> b!587950 (= res!375587 (and (= lt!266568 (Found!6081 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17641 a!2986) index!984) (select (arr!17641 a!2986) j!136))) (not (= (select (arr!17641 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!587950 (= lt!266568 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17641 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587952 () Bool)

(assert (=> b!587952 (= e!335796 (= lt!266568 lt!266567))))

(declare-fun b!587953 () Bool)

(assert (=> b!587953 (= e!335797 e!335795)))

(declare-fun res!375580 () Bool)

(assert (=> b!587953 (=> (not res!375580) (not e!335795))))

(declare-fun lt!266569 () SeekEntryResult!6081)

(assert (=> b!587953 (= res!375580 (or (= lt!266569 (MissingZero!6081 i!1108)) (= lt!266569 (MissingVacant!6081 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36736 (_ BitVec 32)) SeekEntryResult!6081)

(assert (=> b!587953 (= lt!266569 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587954 () Bool)

(declare-fun res!375581 () Bool)

(assert (=> b!587954 (=> (not res!375581) (not e!335797))))

(assert (=> b!587954 (= res!375581 (validKeyInArray!0 k0!1786))))

(declare-fun res!375590 () Bool)

(assert (=> start!53892 (=> (not res!375590) (not e!335797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53892 (= res!375590 (validMask!0 mask!3053))))

(assert (=> start!53892 e!335797))

(assert (=> start!53892 true))

(declare-fun array_inv!13437 (array!36736) Bool)

(assert (=> start!53892 (array_inv!13437 a!2986)))

(declare-fun b!587951 () Bool)

(declare-fun res!375588 () Bool)

(assert (=> b!587951 (=> (not res!375588) (not e!335795))))

(assert (=> b!587951 (= res!375588 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17641 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17641 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53892 res!375590) b!587946))

(assert (= (and b!587946 res!375585) b!587949))

(assert (= (and b!587949 res!375582) b!587954))

(assert (= (and b!587954 res!375581) b!587947))

(assert (= (and b!587947 res!375589) b!587953))

(assert (= (and b!587953 res!375580) b!587944))

(assert (= (and b!587944 res!375584) b!587945))

(assert (= (and b!587945 res!375583) b!587951))

(assert (= (and b!587951 res!375588) b!587950))

(assert (= (and b!587950 res!375587) b!587948))

(assert (= (and b!587948 res!375586) b!587952))

(declare-fun m!566421 () Bool)

(assert (=> b!587945 m!566421))

(declare-fun m!566423 () Bool)

(assert (=> b!587951 m!566423))

(declare-fun m!566425 () Bool)

(assert (=> b!587951 m!566425))

(declare-fun m!566427 () Bool)

(assert (=> b!587951 m!566427))

(declare-fun m!566429 () Bool)

(assert (=> b!587954 m!566429))

(declare-fun m!566431 () Bool)

(assert (=> b!587949 m!566431))

(assert (=> b!587949 m!566431))

(declare-fun m!566433 () Bool)

(assert (=> b!587949 m!566433))

(declare-fun m!566435 () Bool)

(assert (=> b!587948 m!566435))

(declare-fun m!566437 () Bool)

(assert (=> b!587948 m!566437))

(assert (=> b!587948 m!566437))

(declare-fun m!566439 () Bool)

(assert (=> b!587948 m!566439))

(assert (=> b!587948 m!566431))

(assert (=> b!587948 m!566431))

(declare-fun m!566441 () Bool)

(assert (=> b!587948 m!566441))

(assert (=> b!587948 m!566425))

(declare-fun m!566443 () Bool)

(assert (=> b!587948 m!566443))

(declare-fun m!566445 () Bool)

(assert (=> b!587953 m!566445))

(declare-fun m!566447 () Bool)

(assert (=> b!587950 m!566447))

(assert (=> b!587950 m!566431))

(assert (=> b!587950 m!566431))

(declare-fun m!566449 () Bool)

(assert (=> b!587950 m!566449))

(declare-fun m!566451 () Bool)

(assert (=> start!53892 m!566451))

(declare-fun m!566453 () Bool)

(assert (=> start!53892 m!566453))

(declare-fun m!566455 () Bool)

(assert (=> b!587947 m!566455))

(declare-fun m!566457 () Bool)

(assert (=> b!587944 m!566457))

(check-sat (not b!587949) (not b!587953) (not b!587944) (not b!587954) (not start!53892) (not b!587948) (not b!587950) (not b!587945) (not b!587947))
(check-sat)
