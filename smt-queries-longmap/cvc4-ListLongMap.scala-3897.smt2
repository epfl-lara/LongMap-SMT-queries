; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53396 () Bool)

(assert start!53396)

(declare-fun b!580869 () Bool)

(declare-fun res!368687 () Bool)

(declare-fun e!333473 () Bool)

(assert (=> b!580869 (=> (not res!368687) (not e!333473))))

(declare-datatypes ((array!36297 0))(
  ( (array!36298 (arr!17423 (Array (_ BitVec 32) (_ BitVec 64))) (size!17787 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36297)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36297 (_ BitVec 32)) Bool)

(assert (=> b!580869 (= res!368687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580870 () Bool)

(declare-fun res!368691 () Bool)

(declare-fun e!333474 () Bool)

(assert (=> b!580870 (=> (not res!368691) (not e!333474))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580870 (= res!368691 (validKeyInArray!0 (select (arr!17423 a!2986) j!136)))))

(declare-fun b!580871 () Bool)

(declare-fun res!368686 () Bool)

(assert (=> b!580871 (=> (not res!368686) (not e!333474))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580871 (= res!368686 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580872 () Bool)

(assert (=> b!580872 (= e!333474 e!333473)))

(declare-fun res!368690 () Bool)

(assert (=> b!580872 (=> (not res!368690) (not e!333473))))

(declare-datatypes ((SeekEntryResult!5863 0))(
  ( (MissingZero!5863 (index!25679 (_ BitVec 32))) (Found!5863 (index!25680 (_ BitVec 32))) (Intermediate!5863 (undefined!6675 Bool) (index!25681 (_ BitVec 32)) (x!54548 (_ BitVec 32))) (Undefined!5863) (MissingVacant!5863 (index!25682 (_ BitVec 32))) )
))
(declare-fun lt!264790 () SeekEntryResult!5863)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580872 (= res!368690 (or (= lt!264790 (MissingZero!5863 i!1108)) (= lt!264790 (MissingVacant!5863 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36297 (_ BitVec 32)) SeekEntryResult!5863)

(assert (=> b!580872 (= lt!264790 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580873 () Bool)

(declare-fun res!368688 () Bool)

(assert (=> b!580873 (=> (not res!368688) (not e!333473))))

(declare-datatypes ((List!11464 0))(
  ( (Nil!11461) (Cons!11460 (h!12505 (_ BitVec 64)) (t!17692 List!11464)) )
))
(declare-fun arrayNoDuplicates!0 (array!36297 (_ BitVec 32) List!11464) Bool)

(assert (=> b!580873 (= res!368688 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11461))))

(declare-fun b!580874 () Bool)

(declare-fun res!368685 () Bool)

(assert (=> b!580874 (=> (not res!368685) (not e!333474))))

(assert (=> b!580874 (= res!368685 (validKeyInArray!0 k!1786))))

(declare-fun b!580875 () Bool)

(declare-fun res!368692 () Bool)

(assert (=> b!580875 (=> (not res!368692) (not e!333473))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580875 (= res!368692 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17423 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17423 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580876 () Bool)

(declare-fun res!368693 () Bool)

(assert (=> b!580876 (=> (not res!368693) (not e!333474))))

(assert (=> b!580876 (= res!368693 (and (= (size!17787 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17787 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17787 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!368689 () Bool)

(assert (=> start!53396 (=> (not res!368689) (not e!333474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53396 (= res!368689 (validMask!0 mask!3053))))

(assert (=> start!53396 e!333474))

(assert (=> start!53396 true))

(declare-fun array_inv!13219 (array!36297) Bool)

(assert (=> start!53396 (array_inv!13219 a!2986)))

(declare-fun b!580877 () Bool)

(assert (=> b!580877 (= e!333473 false)))

(declare-fun lt!264789 () SeekEntryResult!5863)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36297 (_ BitVec 32)) SeekEntryResult!5863)

(assert (=> b!580877 (= lt!264789 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17423 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53396 res!368689) b!580876))

(assert (= (and b!580876 res!368693) b!580870))

(assert (= (and b!580870 res!368691) b!580874))

(assert (= (and b!580874 res!368685) b!580871))

(assert (= (and b!580871 res!368686) b!580872))

(assert (= (and b!580872 res!368690) b!580869))

(assert (= (and b!580869 res!368687) b!580873))

(assert (= (and b!580873 res!368688) b!580875))

(assert (= (and b!580875 res!368692) b!580877))

(declare-fun m!559433 () Bool)

(assert (=> b!580871 m!559433))

(declare-fun m!559435 () Bool)

(assert (=> b!580870 m!559435))

(assert (=> b!580870 m!559435))

(declare-fun m!559437 () Bool)

(assert (=> b!580870 m!559437))

(assert (=> b!580877 m!559435))

(assert (=> b!580877 m!559435))

(declare-fun m!559439 () Bool)

(assert (=> b!580877 m!559439))

(declare-fun m!559441 () Bool)

(assert (=> b!580873 m!559441))

(declare-fun m!559443 () Bool)

(assert (=> b!580875 m!559443))

(declare-fun m!559445 () Bool)

(assert (=> b!580875 m!559445))

(declare-fun m!559447 () Bool)

(assert (=> b!580875 m!559447))

(declare-fun m!559449 () Bool)

(assert (=> start!53396 m!559449))

(declare-fun m!559451 () Bool)

(assert (=> start!53396 m!559451))

(declare-fun m!559453 () Bool)

(assert (=> b!580872 m!559453))

(declare-fun m!559455 () Bool)

(assert (=> b!580869 m!559455))

(declare-fun m!559457 () Bool)

(assert (=> b!580874 m!559457))

(push 1)

(assert (not start!53396))

(assert (not b!580877))

(assert (not b!580870))

(assert (not b!580872))

(assert (not b!580871))

(assert (not b!580873))

(assert (not b!580869))

(assert (not b!580874))

(check-sat)

