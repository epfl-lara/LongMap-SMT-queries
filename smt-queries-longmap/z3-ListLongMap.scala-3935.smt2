; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53670 () Bool)

(assert start!53670)

(declare-fun res!371999 () Bool)

(declare-fun e!334658 () Bool)

(assert (=> start!53670 (=> (not res!371999) (not e!334658))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53670 (= res!371999 (validMask!0 mask!3053))))

(assert (=> start!53670 e!334658))

(assert (=> start!53670 true))

(declare-datatypes ((array!36516 0))(
  ( (array!36517 (arr!17530 (Array (_ BitVec 32) (_ BitVec 64))) (size!17894 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36516)

(declare-fun array_inv!13389 (array!36516) Bool)

(assert (=> start!53670 (array_inv!13389 a!2986)))

(declare-fun b!584279 () Bool)

(declare-fun e!334657 () Bool)

(declare-fun e!334659 () Bool)

(assert (=> b!584279 (= e!334657 e!334659)))

(declare-fun res!372001 () Bool)

(assert (=> b!584279 (=> (not res!372001) (not e!334659))))

(declare-fun lt!265585 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!584279 (= res!372001 (and (bvsge lt!265585 #b00000000000000000000000000000000) (bvslt lt!265585 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584279 (= lt!265585 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!584280 () Bool)

(declare-fun res!371993 () Bool)

(assert (=> b!584280 (=> (not res!371993) (not e!334657))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5926 0))(
  ( (MissingZero!5926 (index!25931 (_ BitVec 32))) (Found!5926 (index!25932 (_ BitVec 32))) (Intermediate!5926 (undefined!6738 Bool) (index!25933 (_ BitVec 32)) (x!54918 (_ BitVec 32))) (Undefined!5926) (MissingVacant!5926 (index!25934 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36516 (_ BitVec 32)) SeekEntryResult!5926)

(assert (=> b!584280 (= res!371993 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17530 a!2986) j!136) a!2986 mask!3053) (Found!5926 j!136)))))

(declare-fun b!584281 () Bool)

(assert (=> b!584281 (= e!334658 e!334657)))

(declare-fun res!371994 () Bool)

(assert (=> b!584281 (=> (not res!371994) (not e!334657))))

(declare-fun lt!265584 () SeekEntryResult!5926)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584281 (= res!371994 (or (= lt!265584 (MissingZero!5926 i!1108)) (= lt!265584 (MissingVacant!5926 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36516 (_ BitVec 32)) SeekEntryResult!5926)

(assert (=> b!584281 (= lt!265584 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584282 () Bool)

(declare-fun res!371990 () Bool)

(assert (=> b!584282 (=> (not res!371990) (not e!334657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36516 (_ BitVec 32)) Bool)

(assert (=> b!584282 (= res!371990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584283 () Bool)

(declare-fun res!372000 () Bool)

(assert (=> b!584283 (=> (not res!372000) (not e!334657))))

(assert (=> b!584283 (= res!372000 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17530 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17530 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584284 () Bool)

(declare-fun res!371996 () Bool)

(assert (=> b!584284 (=> (not res!371996) (not e!334658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584284 (= res!371996 (validKeyInArray!0 k0!1786))))

(declare-fun b!584285 () Bool)

(declare-fun res!371998 () Bool)

(assert (=> b!584285 (=> (not res!371998) (not e!334658))))

(declare-fun arrayContainsKey!0 (array!36516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584285 (= res!371998 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584286 () Bool)

(declare-fun res!371995 () Bool)

(assert (=> b!584286 (=> (not res!371995) (not e!334658))))

(assert (=> b!584286 (= res!371995 (validKeyInArray!0 (select (arr!17530 a!2986) j!136)))))

(declare-fun b!584287 () Bool)

(declare-fun res!371992 () Bool)

(assert (=> b!584287 (=> (not res!371992) (not e!334657))))

(assert (=> b!584287 (= res!371992 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17530 a!2986) index!984) (select (arr!17530 a!2986) j!136))) (not (= (select (arr!17530 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584288 () Bool)

(declare-fun res!371997 () Bool)

(assert (=> b!584288 (=> (not res!371997) (not e!334658))))

(assert (=> b!584288 (= res!371997 (and (= (size!17894 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17894 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17894 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584289 () Bool)

(assert (=> b!584289 (= e!334659 false)))

(declare-fun lt!265583 () SeekEntryResult!5926)

(assert (=> b!584289 (= lt!265583 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265585 vacantSpotIndex!68 (select (arr!17530 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584290 () Bool)

(declare-fun res!371991 () Bool)

(assert (=> b!584290 (=> (not res!371991) (not e!334657))))

(declare-datatypes ((List!11478 0))(
  ( (Nil!11475) (Cons!11474 (h!12522 (_ BitVec 64)) (t!17698 List!11478)) )
))
(declare-fun arrayNoDuplicates!0 (array!36516 (_ BitVec 32) List!11478) Bool)

(assert (=> b!584290 (= res!371991 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11475))))

(assert (= (and start!53670 res!371999) b!584288))

(assert (= (and b!584288 res!371997) b!584286))

(assert (= (and b!584286 res!371995) b!584284))

(assert (= (and b!584284 res!371996) b!584285))

(assert (= (and b!584285 res!371998) b!584281))

(assert (= (and b!584281 res!371994) b!584282))

(assert (= (and b!584282 res!371990) b!584290))

(assert (= (and b!584290 res!371991) b!584283))

(assert (= (and b!584283 res!372000) b!584280))

(assert (= (and b!584280 res!371993) b!584287))

(assert (= (and b!584287 res!371992) b!584279))

(assert (= (and b!584279 res!372001) b!584289))

(declare-fun m!562823 () Bool)

(assert (=> b!584281 m!562823))

(declare-fun m!562825 () Bool)

(assert (=> b!584284 m!562825))

(declare-fun m!562827 () Bool)

(assert (=> b!584287 m!562827))

(declare-fun m!562829 () Bool)

(assert (=> b!584287 m!562829))

(assert (=> b!584280 m!562829))

(assert (=> b!584280 m!562829))

(declare-fun m!562831 () Bool)

(assert (=> b!584280 m!562831))

(declare-fun m!562833 () Bool)

(assert (=> b!584283 m!562833))

(declare-fun m!562835 () Bool)

(assert (=> b!584283 m!562835))

(declare-fun m!562837 () Bool)

(assert (=> b!584283 m!562837))

(declare-fun m!562839 () Bool)

(assert (=> b!584290 m!562839))

(assert (=> b!584289 m!562829))

(assert (=> b!584289 m!562829))

(declare-fun m!562841 () Bool)

(assert (=> b!584289 m!562841))

(declare-fun m!562843 () Bool)

(assert (=> start!53670 m!562843))

(declare-fun m!562845 () Bool)

(assert (=> start!53670 m!562845))

(assert (=> b!584286 m!562829))

(assert (=> b!584286 m!562829))

(declare-fun m!562847 () Bool)

(assert (=> b!584286 m!562847))

(declare-fun m!562849 () Bool)

(assert (=> b!584285 m!562849))

(declare-fun m!562851 () Bool)

(assert (=> b!584279 m!562851))

(declare-fun m!562853 () Bool)

(assert (=> b!584282 m!562853))

(check-sat (not b!584281) (not b!584284) (not b!584280) (not start!53670) (not b!584282) (not b!584285) (not b!584286) (not b!584290) (not b!584279) (not b!584289))
(check-sat)
