; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53646 () Bool)

(assert start!53646)

(declare-fun b!583847 () Bool)

(declare-fun e!334512 () Bool)

(declare-fun e!334514 () Bool)

(assert (=> b!583847 (= e!334512 e!334514)))

(declare-fun res!371558 () Bool)

(assert (=> b!583847 (=> (not res!371558) (not e!334514))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265477 () (_ BitVec 32))

(assert (=> b!583847 (= res!371558 (and (bvsge lt!265477 #b00000000000000000000000000000000) (bvslt lt!265477 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583847 (= lt!265477 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!583848 () Bool)

(assert (=> b!583848 (= e!334514 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!36492 0))(
  ( (array!36493 (arr!17518 (Array (_ BitVec 32) (_ BitVec 64))) (size!17882 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36492)

(declare-datatypes ((SeekEntryResult!5914 0))(
  ( (MissingZero!5914 (index!25883 (_ BitVec 32))) (Found!5914 (index!25884 (_ BitVec 32))) (Intermediate!5914 (undefined!6726 Bool) (index!25885 (_ BitVec 32)) (x!54874 (_ BitVec 32))) (Undefined!5914) (MissingVacant!5914 (index!25886 (_ BitVec 32))) )
))
(declare-fun lt!265476 () SeekEntryResult!5914)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36492 (_ BitVec 32)) SeekEntryResult!5914)

(assert (=> b!583848 (= lt!265476 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265477 vacantSpotIndex!68 (select (arr!17518 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583849 () Bool)

(declare-fun res!371560 () Bool)

(declare-fun e!334513 () Bool)

(assert (=> b!583849 (=> (not res!371560) (not e!334513))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583849 (= res!371560 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583850 () Bool)

(declare-fun res!371559 () Bool)

(assert (=> b!583850 (=> (not res!371559) (not e!334512))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583850 (= res!371559 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17518 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17518 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583851 () Bool)

(declare-fun res!371569 () Bool)

(assert (=> b!583851 (=> (not res!371569) (not e!334513))))

(assert (=> b!583851 (= res!371569 (and (= (size!17882 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17882 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17882 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583852 () Bool)

(declare-fun res!371568 () Bool)

(assert (=> b!583852 (=> (not res!371568) (not e!334512))))

(assert (=> b!583852 (= res!371568 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17518 a!2986) index!984) (select (arr!17518 a!2986) j!136))) (not (= (select (arr!17518 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583853 () Bool)

(declare-fun res!371566 () Bool)

(assert (=> b!583853 (=> (not res!371566) (not e!334513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583853 (= res!371566 (validKeyInArray!0 k0!1786))))

(declare-fun res!371567 () Bool)

(assert (=> start!53646 (=> (not res!371567) (not e!334513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53646 (= res!371567 (validMask!0 mask!3053))))

(assert (=> start!53646 e!334513))

(assert (=> start!53646 true))

(declare-fun array_inv!13377 (array!36492) Bool)

(assert (=> start!53646 (array_inv!13377 a!2986)))

(declare-fun b!583854 () Bool)

(declare-fun res!371564 () Bool)

(assert (=> b!583854 (=> (not res!371564) (not e!334512))))

(declare-datatypes ((List!11466 0))(
  ( (Nil!11463) (Cons!11462 (h!12510 (_ BitVec 64)) (t!17686 List!11466)) )
))
(declare-fun arrayNoDuplicates!0 (array!36492 (_ BitVec 32) List!11466) Bool)

(assert (=> b!583854 (= res!371564 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11463))))

(declare-fun b!583855 () Bool)

(declare-fun res!371565 () Bool)

(assert (=> b!583855 (=> (not res!371565) (not e!334512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36492 (_ BitVec 32)) Bool)

(assert (=> b!583855 (= res!371565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583856 () Bool)

(declare-fun res!371561 () Bool)

(assert (=> b!583856 (=> (not res!371561) (not e!334512))))

(assert (=> b!583856 (= res!371561 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17518 a!2986) j!136) a!2986 mask!3053) (Found!5914 j!136)))))

(declare-fun b!583857 () Bool)

(assert (=> b!583857 (= e!334513 e!334512)))

(declare-fun res!371563 () Bool)

(assert (=> b!583857 (=> (not res!371563) (not e!334512))))

(declare-fun lt!265475 () SeekEntryResult!5914)

(assert (=> b!583857 (= res!371563 (or (= lt!265475 (MissingZero!5914 i!1108)) (= lt!265475 (MissingVacant!5914 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36492 (_ BitVec 32)) SeekEntryResult!5914)

(assert (=> b!583857 (= lt!265475 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583858 () Bool)

(declare-fun res!371562 () Bool)

(assert (=> b!583858 (=> (not res!371562) (not e!334513))))

(assert (=> b!583858 (= res!371562 (validKeyInArray!0 (select (arr!17518 a!2986) j!136)))))

(assert (= (and start!53646 res!371567) b!583851))

(assert (= (and b!583851 res!371569) b!583858))

(assert (= (and b!583858 res!371562) b!583853))

(assert (= (and b!583853 res!371566) b!583849))

(assert (= (and b!583849 res!371560) b!583857))

(assert (= (and b!583857 res!371563) b!583855))

(assert (= (and b!583855 res!371565) b!583854))

(assert (= (and b!583854 res!371564) b!583850))

(assert (= (and b!583850 res!371559) b!583856))

(assert (= (and b!583856 res!371561) b!583852))

(assert (= (and b!583852 res!371568) b!583847))

(assert (= (and b!583847 res!371558) b!583848))

(declare-fun m!562439 () Bool)

(assert (=> b!583854 m!562439))

(declare-fun m!562441 () Bool)

(assert (=> b!583850 m!562441))

(declare-fun m!562443 () Bool)

(assert (=> b!583850 m!562443))

(declare-fun m!562445 () Bool)

(assert (=> b!583850 m!562445))

(declare-fun m!562447 () Bool)

(assert (=> b!583856 m!562447))

(assert (=> b!583856 m!562447))

(declare-fun m!562449 () Bool)

(assert (=> b!583856 m!562449))

(assert (=> b!583848 m!562447))

(assert (=> b!583848 m!562447))

(declare-fun m!562451 () Bool)

(assert (=> b!583848 m!562451))

(declare-fun m!562453 () Bool)

(assert (=> b!583852 m!562453))

(assert (=> b!583852 m!562447))

(assert (=> b!583858 m!562447))

(assert (=> b!583858 m!562447))

(declare-fun m!562455 () Bool)

(assert (=> b!583858 m!562455))

(declare-fun m!562457 () Bool)

(assert (=> b!583853 m!562457))

(declare-fun m!562459 () Bool)

(assert (=> b!583855 m!562459))

(declare-fun m!562461 () Bool)

(assert (=> b!583857 m!562461))

(declare-fun m!562463 () Bool)

(assert (=> b!583847 m!562463))

(declare-fun m!562465 () Bool)

(assert (=> b!583849 m!562465))

(declare-fun m!562467 () Bool)

(assert (=> start!53646 m!562467))

(declare-fun m!562469 () Bool)

(assert (=> start!53646 m!562469))

(check-sat (not b!583855) (not start!53646) (not b!583849) (not b!583858) (not b!583856) (not b!583853) (not b!583854) (not b!583847) (not b!583848) (not b!583857))
(check-sat)
