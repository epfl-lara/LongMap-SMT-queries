; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53448 () Bool)

(assert start!53448)

(declare-fun b!581529 () Bool)

(declare-fun res!369490 () Bool)

(declare-fun e!333604 () Bool)

(assert (=> b!581529 (=> (not res!369490) (not e!333604))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36363 0))(
  ( (array!36364 (arr!17456 (Array (_ BitVec 32) (_ BitVec 64))) (size!17821 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36363)

(assert (=> b!581529 (= res!369490 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17456 a!2986) index!984) (select (arr!17456 a!2986) j!136)) (= index!984 j!136) (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!581530 () Bool)

(declare-fun res!369488 () Bool)

(assert (=> b!581530 (=> (not res!369488) (not e!333604))))

(declare-datatypes ((List!11536 0))(
  ( (Nil!11533) (Cons!11532 (h!12577 (_ BitVec 64)) (t!17755 List!11536)) )
))
(declare-fun arrayNoDuplicates!0 (array!36363 (_ BitVec 32) List!11536) Bool)

(assert (=> b!581530 (= res!369488 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11533))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun b!581531 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581531 (= e!333604 (not (validKeyInArray!0 (select (store (arr!17456 a!2986) i!1108 k0!1786) j!136))))))

(declare-fun b!581532 () Bool)

(declare-fun e!333605 () Bool)

(assert (=> b!581532 (= e!333605 e!333604)))

(declare-fun res!369493 () Bool)

(assert (=> b!581532 (=> (not res!369493) (not e!333604))))

(declare-datatypes ((SeekEntryResult!5893 0))(
  ( (MissingZero!5893 (index!25799 (_ BitVec 32))) (Found!5893 (index!25800 (_ BitVec 32))) (Intermediate!5893 (undefined!6705 Bool) (index!25801 (_ BitVec 32)) (x!54669 (_ BitVec 32))) (Undefined!5893) (MissingVacant!5893 (index!25802 (_ BitVec 32))) )
))
(declare-fun lt!264748 () SeekEntryResult!5893)

(assert (=> b!581532 (= res!369493 (or (= lt!264748 (MissingZero!5893 i!1108)) (= lt!264748 (MissingVacant!5893 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36363 (_ BitVec 32)) SeekEntryResult!5893)

(assert (=> b!581532 (= lt!264748 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!369495 () Bool)

(assert (=> start!53448 (=> (not res!369495) (not e!333605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53448 (= res!369495 (validMask!0 mask!3053))))

(assert (=> start!53448 e!333605))

(assert (=> start!53448 true))

(declare-fun array_inv!13339 (array!36363) Bool)

(assert (=> start!53448 (array_inv!13339 a!2986)))

(declare-fun b!581533 () Bool)

(declare-fun res!369491 () Bool)

(assert (=> b!581533 (=> (not res!369491) (not e!333604))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!581533 (= res!369491 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17456 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17456 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581534 () Bool)

(declare-fun res!369489 () Bool)

(assert (=> b!581534 (=> (not res!369489) (not e!333605))))

(assert (=> b!581534 (= res!369489 (and (= (size!17821 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17821 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17821 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581535 () Bool)

(declare-fun res!369497 () Bool)

(assert (=> b!581535 (=> (not res!369497) (not e!333604))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36363 (_ BitVec 32)) SeekEntryResult!5893)

(assert (=> b!581535 (= res!369497 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17456 a!2986) j!136) a!2986 mask!3053) (Found!5893 j!136)))))

(declare-fun b!581536 () Bool)

(declare-fun res!369487 () Bool)

(assert (=> b!581536 (=> (not res!369487) (not e!333604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36363 (_ BitVec 32)) Bool)

(assert (=> b!581536 (= res!369487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581537 () Bool)

(declare-fun res!369494 () Bool)

(assert (=> b!581537 (=> (not res!369494) (not e!333605))))

(assert (=> b!581537 (= res!369494 (validKeyInArray!0 (select (arr!17456 a!2986) j!136)))))

(declare-fun b!581538 () Bool)

(declare-fun res!369496 () Bool)

(assert (=> b!581538 (=> (not res!369496) (not e!333605))))

(assert (=> b!581538 (= res!369496 (validKeyInArray!0 k0!1786))))

(declare-fun b!581539 () Bool)

(declare-fun res!369492 () Bool)

(assert (=> b!581539 (=> (not res!369492) (not e!333605))))

(declare-fun arrayContainsKey!0 (array!36363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581539 (= res!369492 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53448 res!369495) b!581534))

(assert (= (and b!581534 res!369489) b!581537))

(assert (= (and b!581537 res!369494) b!581538))

(assert (= (and b!581538 res!369496) b!581539))

(assert (= (and b!581539 res!369492) b!581532))

(assert (= (and b!581532 res!369493) b!581536))

(assert (= (and b!581536 res!369487) b!581530))

(assert (= (and b!581530 res!369488) b!581533))

(assert (= (and b!581533 res!369491) b!581535))

(assert (= (and b!581535 res!369497) b!581529))

(assert (= (and b!581529 res!369490) b!581531))

(declare-fun m!559537 () Bool)

(assert (=> b!581533 m!559537))

(declare-fun m!559539 () Bool)

(assert (=> b!581533 m!559539))

(declare-fun m!559541 () Bool)

(assert (=> b!581533 m!559541))

(declare-fun m!559543 () Bool)

(assert (=> b!581539 m!559543))

(declare-fun m!559545 () Bool)

(assert (=> b!581536 m!559545))

(declare-fun m!559547 () Bool)

(assert (=> b!581537 m!559547))

(assert (=> b!581537 m!559547))

(declare-fun m!559549 () Bool)

(assert (=> b!581537 m!559549))

(declare-fun m!559551 () Bool)

(assert (=> b!581538 m!559551))

(assert (=> b!581531 m!559539))

(declare-fun m!559553 () Bool)

(assert (=> b!581531 m!559553))

(assert (=> b!581531 m!559553))

(declare-fun m!559555 () Bool)

(assert (=> b!581531 m!559555))

(declare-fun m!559557 () Bool)

(assert (=> b!581529 m!559557))

(assert (=> b!581529 m!559547))

(declare-fun m!559559 () Bool)

(assert (=> b!581532 m!559559))

(declare-fun m!559561 () Bool)

(assert (=> b!581530 m!559561))

(declare-fun m!559563 () Bool)

(assert (=> start!53448 m!559563))

(declare-fun m!559565 () Bool)

(assert (=> start!53448 m!559565))

(assert (=> b!581535 m!559547))

(assert (=> b!581535 m!559547))

(declare-fun m!559567 () Bool)

(assert (=> b!581535 m!559567))

(check-sat (not b!581538) (not b!581536) (not b!581531) (not start!53448) (not b!581535) (not b!581537) (not b!581530) (not b!581532) (not b!581539))
(check-sat)
