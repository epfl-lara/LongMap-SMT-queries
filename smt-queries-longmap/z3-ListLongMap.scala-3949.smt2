; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53688 () Bool)

(assert start!53688)

(declare-fun b!585309 () Bool)

(declare-fun e!334856 () Bool)

(declare-fun e!334855 () Bool)

(assert (=> b!585309 (= e!334856 e!334855)))

(declare-fun res!373277 () Bool)

(assert (=> b!585309 (=> (not res!373277) (not e!334855))))

(declare-datatypes ((SeekEntryResult!6013 0))(
  ( (MissingZero!6013 (index!26279 (_ BitVec 32))) (Found!6013 (index!26280 (_ BitVec 32))) (Intermediate!6013 (undefined!6825 Bool) (index!26281 (_ BitVec 32)) (x!55109 (_ BitVec 32))) (Undefined!6013) (MissingVacant!6013 (index!26282 (_ BitVec 32))) )
))
(declare-fun lt!265625 () SeekEntryResult!6013)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585309 (= res!373277 (or (= lt!265625 (MissingZero!6013 i!1108)) (= lt!265625 (MissingVacant!6013 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36603 0))(
  ( (array!36604 (arr!17576 (Array (_ BitVec 32) (_ BitVec 64))) (size!17941 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36603)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36603 (_ BitVec 32)) SeekEntryResult!6013)

(assert (=> b!585309 (= lt!265625 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585310 () Bool)

(declare-fun res!373271 () Bool)

(assert (=> b!585310 (=> (not res!373271) (not e!334856))))

(declare-fun arrayContainsKey!0 (array!36603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585310 (= res!373271 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585311 () Bool)

(declare-fun res!373268 () Bool)

(assert (=> b!585311 (=> (not res!373268) (not e!334855))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36603 (_ BitVec 32)) SeekEntryResult!6013)

(assert (=> b!585311 (= res!373268 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17576 a!2986) j!136) a!2986 mask!3053) (Found!6013 j!136)))))

(declare-fun b!585312 () Bool)

(declare-fun res!373269 () Bool)

(assert (=> b!585312 (=> (not res!373269) (not e!334855))))

(assert (=> b!585312 (= res!373269 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17576 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17576 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585313 () Bool)

(declare-fun res!373272 () Bool)

(assert (=> b!585313 (=> (not res!373272) (not e!334856))))

(assert (=> b!585313 (= res!373272 (and (= (size!17941 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17941 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17941 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!373276 () Bool)

(assert (=> start!53688 (=> (not res!373276) (not e!334856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53688 (= res!373276 (validMask!0 mask!3053))))

(assert (=> start!53688 e!334856))

(assert (=> start!53688 true))

(declare-fun array_inv!13459 (array!36603) Bool)

(assert (=> start!53688 (array_inv!13459 a!2986)))

(declare-fun b!585314 () Bool)

(declare-fun res!373267 () Bool)

(assert (=> b!585314 (=> (not res!373267) (not e!334856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585314 (= res!373267 (validKeyInArray!0 (select (arr!17576 a!2986) j!136)))))

(declare-fun b!585315 () Bool)

(declare-fun res!373275 () Bool)

(assert (=> b!585315 (=> (not res!373275) (not e!334855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36603 (_ BitVec 32)) Bool)

(assert (=> b!585315 (= res!373275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585316 () Bool)

(assert (=> b!585316 (= e!334855 (not true))))

(declare-fun lt!265626 () (_ BitVec 32))

(assert (=> b!585316 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265626 vacantSpotIndex!68 (select (arr!17576 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265626 vacantSpotIndex!68 (select (store (arr!17576 a!2986) i!1108 k0!1786) j!136) (array!36604 (store (arr!17576 a!2986) i!1108 k0!1786) (size!17941 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18132 0))(
  ( (Unit!18133) )
))
(declare-fun lt!265627 () Unit!18132)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36603 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18132)

(assert (=> b!585316 (= lt!265627 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265626 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585316 (= lt!265626 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585317 () Bool)

(declare-fun res!373274 () Bool)

(assert (=> b!585317 (=> (not res!373274) (not e!334855))))

(declare-datatypes ((List!11656 0))(
  ( (Nil!11653) (Cons!11652 (h!12697 (_ BitVec 64)) (t!17875 List!11656)) )
))
(declare-fun arrayNoDuplicates!0 (array!36603 (_ BitVec 32) List!11656) Bool)

(assert (=> b!585317 (= res!373274 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11653))))

(declare-fun b!585318 () Bool)

(declare-fun res!373270 () Bool)

(assert (=> b!585318 (=> (not res!373270) (not e!334855))))

(assert (=> b!585318 (= res!373270 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17576 a!2986) index!984) (select (arr!17576 a!2986) j!136))) (not (= (select (arr!17576 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585319 () Bool)

(declare-fun res!373273 () Bool)

(assert (=> b!585319 (=> (not res!373273) (not e!334856))))

(assert (=> b!585319 (= res!373273 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53688 res!373276) b!585313))

(assert (= (and b!585313 res!373272) b!585314))

(assert (= (and b!585314 res!373267) b!585319))

(assert (= (and b!585319 res!373273) b!585310))

(assert (= (and b!585310 res!373271) b!585309))

(assert (= (and b!585309 res!373277) b!585315))

(assert (= (and b!585315 res!373275) b!585317))

(assert (= (and b!585317 res!373274) b!585312))

(assert (= (and b!585312 res!373269) b!585311))

(assert (= (and b!585311 res!373268) b!585318))

(assert (= (and b!585318 res!373270) b!585316))

(declare-fun m!563023 () Bool)

(assert (=> b!585309 m!563023))

(declare-fun m!563025 () Bool)

(assert (=> b!585316 m!563025))

(declare-fun m!563027 () Bool)

(assert (=> b!585316 m!563027))

(declare-fun m!563029 () Bool)

(assert (=> b!585316 m!563029))

(declare-fun m!563031 () Bool)

(assert (=> b!585316 m!563031))

(assert (=> b!585316 m!563029))

(declare-fun m!563033 () Bool)

(assert (=> b!585316 m!563033))

(declare-fun m!563035 () Bool)

(assert (=> b!585316 m!563035))

(assert (=> b!585316 m!563027))

(declare-fun m!563037 () Bool)

(assert (=> b!585316 m!563037))

(declare-fun m!563039 () Bool)

(assert (=> b!585312 m!563039))

(assert (=> b!585312 m!563035))

(declare-fun m!563041 () Bool)

(assert (=> b!585312 m!563041))

(declare-fun m!563043 () Bool)

(assert (=> b!585319 m!563043))

(declare-fun m!563045 () Bool)

(assert (=> b!585310 m!563045))

(declare-fun m!563047 () Bool)

(assert (=> b!585315 m!563047))

(declare-fun m!563049 () Bool)

(assert (=> b!585317 m!563049))

(declare-fun m!563051 () Bool)

(assert (=> b!585318 m!563051))

(assert (=> b!585318 m!563029))

(assert (=> b!585311 m!563029))

(assert (=> b!585311 m!563029))

(declare-fun m!563053 () Bool)

(assert (=> b!585311 m!563053))

(declare-fun m!563055 () Bool)

(assert (=> start!53688 m!563055))

(declare-fun m!563057 () Bool)

(assert (=> start!53688 m!563057))

(assert (=> b!585314 m!563029))

(assert (=> b!585314 m!563029))

(declare-fun m!563059 () Bool)

(assert (=> b!585314 m!563059))

(check-sat (not b!585311) (not b!585319) (not b!585315) (not start!53688) (not b!585316) (not b!585310) (not b!585309) (not b!585317) (not b!585314))
(check-sat)
