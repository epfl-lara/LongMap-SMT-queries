; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53470 () Bool)

(assert start!53470)

(declare-fun b!581895 () Bool)

(declare-fun res!369716 () Bool)

(declare-fun e!333806 () Bool)

(assert (=> b!581895 (=> (not res!369716) (not e!333806))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36371 0))(
  ( (array!36372 (arr!17460 (Array (_ BitVec 32) (_ BitVec 64))) (size!17824 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36371)

(assert (=> b!581895 (= res!369716 (and (= (size!17824 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17824 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17824 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581896 () Bool)

(declare-fun res!369719 () Bool)

(assert (=> b!581896 (=> (not res!369719) (not e!333806))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581896 (= res!369719 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581897 () Bool)

(declare-fun res!369715 () Bool)

(declare-fun e!333805 () Bool)

(assert (=> b!581897 (=> (not res!369715) (not e!333805))))

(declare-datatypes ((List!11501 0))(
  ( (Nil!11498) (Cons!11497 (h!12542 (_ BitVec 64)) (t!17729 List!11501)) )
))
(declare-fun arrayNoDuplicates!0 (array!36371 (_ BitVec 32) List!11501) Bool)

(assert (=> b!581897 (= res!369715 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11498))))

(declare-fun b!581898 () Bool)

(declare-fun res!369714 () Bool)

(assert (=> b!581898 (=> (not res!369714) (not e!333805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36371 (_ BitVec 32)) Bool)

(assert (=> b!581898 (= res!369714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581899 () Bool)

(assert (=> b!581899 (= e!333806 e!333805)))

(declare-fun res!369713 () Bool)

(assert (=> b!581899 (=> (not res!369713) (not e!333805))))

(declare-datatypes ((SeekEntryResult!5900 0))(
  ( (MissingZero!5900 (index!25827 (_ BitVec 32))) (Found!5900 (index!25828 (_ BitVec 32))) (Intermediate!5900 (undefined!6712 Bool) (index!25829 (_ BitVec 32)) (x!54689 (_ BitVec 32))) (Undefined!5900) (MissingVacant!5900 (index!25830 (_ BitVec 32))) )
))
(declare-fun lt!264994 () SeekEntryResult!5900)

(assert (=> b!581899 (= res!369713 (or (= lt!264994 (MissingZero!5900 i!1108)) (= lt!264994 (MissingVacant!5900 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36371 (_ BitVec 32)) SeekEntryResult!5900)

(assert (=> b!581899 (= lt!264994 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581900 () Bool)

(declare-fun res!369718 () Bool)

(assert (=> b!581900 (=> (not res!369718) (not e!333805))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581900 (= res!369718 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17460 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17460 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!369712 () Bool)

(assert (=> start!53470 (=> (not res!369712) (not e!333806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53470 (= res!369712 (validMask!0 mask!3053))))

(assert (=> start!53470 e!333806))

(assert (=> start!53470 true))

(declare-fun array_inv!13256 (array!36371) Bool)

(assert (=> start!53470 (array_inv!13256 a!2986)))

(declare-fun b!581901 () Bool)

(declare-fun res!369711 () Bool)

(assert (=> b!581901 (=> (not res!369711) (not e!333806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581901 (= res!369711 (validKeyInArray!0 k!1786))))

(declare-fun b!581902 () Bool)

(assert (=> b!581902 (= e!333805 false)))

(declare-fun lt!264993 () SeekEntryResult!5900)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36371 (_ BitVec 32)) SeekEntryResult!5900)

(assert (=> b!581902 (= lt!264993 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17460 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581903 () Bool)

(declare-fun res!369717 () Bool)

(assert (=> b!581903 (=> (not res!369717) (not e!333806))))

(assert (=> b!581903 (= res!369717 (validKeyInArray!0 (select (arr!17460 a!2986) j!136)))))

(assert (= (and start!53470 res!369712) b!581895))

(assert (= (and b!581895 res!369716) b!581903))

(assert (= (and b!581903 res!369717) b!581901))

(assert (= (and b!581901 res!369711) b!581896))

(assert (= (and b!581896 res!369719) b!581899))

(assert (= (and b!581899 res!369713) b!581898))

(assert (= (and b!581898 res!369714) b!581897))

(assert (= (and b!581897 res!369715) b!581900))

(assert (= (and b!581900 res!369718) b!581902))

(declare-fun m!560419 () Bool)

(assert (=> start!53470 m!560419))

(declare-fun m!560421 () Bool)

(assert (=> start!53470 m!560421))

(declare-fun m!560423 () Bool)

(assert (=> b!581900 m!560423))

(declare-fun m!560425 () Bool)

(assert (=> b!581900 m!560425))

(declare-fun m!560427 () Bool)

(assert (=> b!581900 m!560427))

(declare-fun m!560429 () Bool)

(assert (=> b!581903 m!560429))

(assert (=> b!581903 m!560429))

(declare-fun m!560431 () Bool)

(assert (=> b!581903 m!560431))

(declare-fun m!560433 () Bool)

(assert (=> b!581897 m!560433))

(declare-fun m!560435 () Bool)

(assert (=> b!581898 m!560435))

(assert (=> b!581902 m!560429))

(assert (=> b!581902 m!560429))

(declare-fun m!560437 () Bool)

(assert (=> b!581902 m!560437))

(declare-fun m!560439 () Bool)

(assert (=> b!581896 m!560439))

(declare-fun m!560441 () Bool)

(assert (=> b!581901 m!560441))

(declare-fun m!560443 () Bool)

(assert (=> b!581899 m!560443))

(push 1)

