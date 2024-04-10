; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53646 () Bool)

(assert start!53646)

(declare-fun b!584539 () Bool)

(declare-fun res!372354 () Bool)

(declare-fun e!334685 () Bool)

(assert (=> b!584539 (=> (not res!372354) (not e!334685))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36547 0))(
  ( (array!36548 (arr!17548 (Array (_ BitVec 32) (_ BitVec 64))) (size!17912 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36547)

(assert (=> b!584539 (= res!372354 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17548 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17548 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584540 () Bool)

(declare-fun e!334686 () Bool)

(assert (=> b!584540 (= e!334686 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5988 0))(
  ( (MissingZero!5988 (index!26179 (_ BitVec 32))) (Found!5988 (index!26180 (_ BitVec 32))) (Intermediate!5988 (undefined!6800 Bool) (index!26181 (_ BitVec 32)) (x!55009 (_ BitVec 32))) (Undefined!5988) (MissingVacant!5988 (index!26182 (_ BitVec 32))) )
))
(declare-fun lt!265598 () SeekEntryResult!5988)

(declare-fun lt!265599 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36547 (_ BitVec 32)) SeekEntryResult!5988)

(assert (=> b!584540 (= lt!265598 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265599 vacantSpotIndex!68 (select (arr!17548 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584541 () Bool)

(declare-fun res!372357 () Bool)

(declare-fun e!334684 () Bool)

(assert (=> b!584541 (=> (not res!372357) (not e!334684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584541 (= res!372357 (validKeyInArray!0 (select (arr!17548 a!2986) j!136)))))

(declare-fun b!584542 () Bool)

(assert (=> b!584542 (= e!334685 e!334686)))

(declare-fun res!372358 () Bool)

(assert (=> b!584542 (=> (not res!372358) (not e!334686))))

(assert (=> b!584542 (= res!372358 (and (bvsge lt!265599 #b00000000000000000000000000000000) (bvslt lt!265599 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584542 (= lt!265599 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584543 () Bool)

(declare-fun res!372362 () Bool)

(assert (=> b!584543 (=> (not res!372362) (not e!334684))))

(assert (=> b!584543 (= res!372362 (and (= (size!17912 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17912 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17912 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584544 () Bool)

(declare-fun res!372364 () Bool)

(assert (=> b!584544 (=> (not res!372364) (not e!334685))))

(assert (=> b!584544 (= res!372364 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17548 a!2986) j!136) a!2986 mask!3053) (Found!5988 j!136)))))

(declare-fun b!584545 () Bool)

(declare-fun res!372363 () Bool)

(assert (=> b!584545 (=> (not res!372363) (not e!334685))))

(declare-datatypes ((List!11589 0))(
  ( (Nil!11586) (Cons!11585 (h!12630 (_ BitVec 64)) (t!17817 List!11589)) )
))
(declare-fun arrayNoDuplicates!0 (array!36547 (_ BitVec 32) List!11589) Bool)

(assert (=> b!584545 (= res!372363 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11586))))

(declare-fun b!584546 () Bool)

(declare-fun res!372361 () Bool)

(assert (=> b!584546 (=> (not res!372361) (not e!334685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36547 (_ BitVec 32)) Bool)

(assert (=> b!584546 (= res!372361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584538 () Bool)

(assert (=> b!584538 (= e!334684 e!334685)))

(declare-fun res!372359 () Bool)

(assert (=> b!584538 (=> (not res!372359) (not e!334685))))

(declare-fun lt!265600 () SeekEntryResult!5988)

(assert (=> b!584538 (= res!372359 (or (= lt!265600 (MissingZero!5988 i!1108)) (= lt!265600 (MissingVacant!5988 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36547 (_ BitVec 32)) SeekEntryResult!5988)

(assert (=> b!584538 (= lt!265600 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!372360 () Bool)

(assert (=> start!53646 (=> (not res!372360) (not e!334684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53646 (= res!372360 (validMask!0 mask!3053))))

(assert (=> start!53646 e!334684))

(assert (=> start!53646 true))

(declare-fun array_inv!13344 (array!36547) Bool)

(assert (=> start!53646 (array_inv!13344 a!2986)))

(declare-fun b!584547 () Bool)

(declare-fun res!372355 () Bool)

(assert (=> b!584547 (=> (not res!372355) (not e!334684))))

(assert (=> b!584547 (= res!372355 (validKeyInArray!0 k0!1786))))

(declare-fun b!584548 () Bool)

(declare-fun res!372356 () Bool)

(assert (=> b!584548 (=> (not res!372356) (not e!334685))))

(assert (=> b!584548 (= res!372356 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17548 a!2986) index!984) (select (arr!17548 a!2986) j!136))) (not (= (select (arr!17548 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584549 () Bool)

(declare-fun res!372365 () Bool)

(assert (=> b!584549 (=> (not res!372365) (not e!334684))))

(declare-fun arrayContainsKey!0 (array!36547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584549 (= res!372365 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53646 res!372360) b!584543))

(assert (= (and b!584543 res!372362) b!584541))

(assert (= (and b!584541 res!372357) b!584547))

(assert (= (and b!584547 res!372355) b!584549))

(assert (= (and b!584549 res!372365) b!584538))

(assert (= (and b!584538 res!372359) b!584546))

(assert (= (and b!584546 res!372361) b!584545))

(assert (= (and b!584545 res!372363) b!584539))

(assert (= (and b!584539 res!372354) b!584544))

(assert (= (and b!584544 res!372364) b!584548))

(assert (= (and b!584548 res!372356) b!584542))

(assert (= (and b!584542 res!372358) b!584540))

(declare-fun m!562881 () Bool)

(assert (=> b!584544 m!562881))

(assert (=> b!584544 m!562881))

(declare-fun m!562883 () Bool)

(assert (=> b!584544 m!562883))

(declare-fun m!562885 () Bool)

(assert (=> b!584547 m!562885))

(declare-fun m!562887 () Bool)

(assert (=> start!53646 m!562887))

(declare-fun m!562889 () Bool)

(assert (=> start!53646 m!562889))

(declare-fun m!562891 () Bool)

(assert (=> b!584538 m!562891))

(assert (=> b!584541 m!562881))

(assert (=> b!584541 m!562881))

(declare-fun m!562893 () Bool)

(assert (=> b!584541 m!562893))

(declare-fun m!562895 () Bool)

(assert (=> b!584548 m!562895))

(assert (=> b!584548 m!562881))

(assert (=> b!584540 m!562881))

(assert (=> b!584540 m!562881))

(declare-fun m!562897 () Bool)

(assert (=> b!584540 m!562897))

(declare-fun m!562899 () Bool)

(assert (=> b!584542 m!562899))

(declare-fun m!562901 () Bool)

(assert (=> b!584545 m!562901))

(declare-fun m!562903 () Bool)

(assert (=> b!584546 m!562903))

(declare-fun m!562905 () Bool)

(assert (=> b!584539 m!562905))

(declare-fun m!562907 () Bool)

(assert (=> b!584539 m!562907))

(declare-fun m!562909 () Bool)

(assert (=> b!584539 m!562909))

(declare-fun m!562911 () Bool)

(assert (=> b!584549 m!562911))

(check-sat (not b!584549) (not b!584545) (not b!584538) (not b!584541) (not b!584547) (not b!584544) (not b!584542) (not b!584540) (not b!584546) (not start!53646))
(check-sat)
