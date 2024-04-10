; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57812 () Bool)

(assert start!57812)

(declare-fun b!639419 () Bool)

(declare-fun e!365947 () Bool)

(declare-datatypes ((array!38314 0))(
  ( (array!38315 (arr!18378 (Array (_ BitVec 32) (_ BitVec 64))) (size!18742 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38314)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!639419 (= e!365947 (or (bvsge (size!18742 a!2986) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!18742 a!2986)) (bvsle j!136 (size!18742 a!2986))))))

(declare-fun lt!295803 () array!38314)

(declare-datatypes ((List!12419 0))(
  ( (Nil!12416) (Cons!12415 (h!13460 (_ BitVec 64)) (t!18647 List!12419)) )
))
(declare-fun arrayNoDuplicates!0 (array!38314 (_ BitVec 32) List!12419) Bool)

(assert (=> b!639419 (arrayNoDuplicates!0 lt!295803 #b00000000000000000000000000000000 Nil!12416)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((Unit!21606 0))(
  ( (Unit!21607) )
))
(declare-fun lt!295808 () Unit!21606)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38314 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12419) Unit!21606)

(assert (=> b!639419 (= lt!295808 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12416))))

(declare-fun arrayContainsKey!0 (array!38314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639419 (arrayContainsKey!0 lt!295803 (select (arr!18378 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295805 () Unit!21606)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38314 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21606)

(assert (=> b!639419 (= lt!295805 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295803 (select (arr!18378 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639420 () Bool)

(declare-fun e!365950 () Bool)

(declare-fun e!365948 () Bool)

(assert (=> b!639420 (= e!365950 (not e!365948))))

(declare-fun res!413977 () Bool)

(assert (=> b!639420 (=> res!413977 e!365948)))

(declare-datatypes ((SeekEntryResult!6818 0))(
  ( (MissingZero!6818 (index!29589 (_ BitVec 32))) (Found!6818 (index!29590 (_ BitVec 32))) (Intermediate!6818 (undefined!7630 Bool) (index!29591 (_ BitVec 32)) (x!58349 (_ BitVec 32))) (Undefined!6818) (MissingVacant!6818 (index!29592 (_ BitVec 32))) )
))
(declare-fun lt!295809 () SeekEntryResult!6818)

(assert (=> b!639420 (= res!413977 (not (= lt!295809 (Found!6818 index!984))))))

(declare-fun lt!295800 () Unit!21606)

(declare-fun e!365955 () Unit!21606)

(assert (=> b!639420 (= lt!295800 e!365955)))

(declare-fun c!73094 () Bool)

(assert (=> b!639420 (= c!73094 (= lt!295809 Undefined!6818))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!295802 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38314 (_ BitVec 32)) SeekEntryResult!6818)

(assert (=> b!639420 (= lt!295809 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295802 lt!295803 mask!3053))))

(declare-fun e!365957 () Bool)

(assert (=> b!639420 e!365957))

(declare-fun res!413965 () Bool)

(assert (=> b!639420 (=> (not res!413965) (not e!365957))))

(declare-fun lt!295806 () SeekEntryResult!6818)

(declare-fun lt!295807 () (_ BitVec 32))

(assert (=> b!639420 (= res!413965 (= lt!295806 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295807 vacantSpotIndex!68 lt!295802 lt!295803 mask!3053)))))

(assert (=> b!639420 (= lt!295806 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295807 vacantSpotIndex!68 (select (arr!18378 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639420 (= lt!295802 (select (store (arr!18378 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295801 () Unit!21606)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38314 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21606)

(assert (=> b!639420 (= lt!295801 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295807 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639420 (= lt!295807 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639421 () Bool)

(declare-fun lt!295804 () SeekEntryResult!6818)

(assert (=> b!639421 (= e!365957 (= lt!295804 lt!295806))))

(declare-fun b!639422 () Bool)

(declare-fun res!413973 () Bool)

(declare-fun e!365952 () Bool)

(assert (=> b!639422 (=> (not res!413973) (not e!365952))))

(assert (=> b!639422 (= res!413973 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639423 () Bool)

(declare-fun e!365953 () Bool)

(declare-fun e!365951 () Bool)

(assert (=> b!639423 (= e!365953 e!365951)))

(declare-fun res!413968 () Bool)

(assert (=> b!639423 (=> (not res!413968) (not e!365951))))

(assert (=> b!639423 (= res!413968 (= (select (store (arr!18378 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639423 (= lt!295803 (array!38315 (store (arr!18378 a!2986) i!1108 k!1786) (size!18742 a!2986)))))

(declare-fun b!639424 () Bool)

(declare-fun Unit!21608 () Unit!21606)

(assert (=> b!639424 (= e!365955 Unit!21608)))

(declare-fun b!639425 () Bool)

(declare-fun res!413969 () Bool)

(assert (=> b!639425 (=> (not res!413969) (not e!365953))))

(assert (=> b!639425 (= res!413969 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12416))))

(declare-fun b!639426 () Bool)

(assert (=> b!639426 (= e!365951 e!365950)))

(declare-fun res!413972 () Bool)

(assert (=> b!639426 (=> (not res!413972) (not e!365950))))

(assert (=> b!639426 (= res!413972 (and (= lt!295804 (Found!6818 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18378 a!2986) index!984) (select (arr!18378 a!2986) j!136))) (not (= (select (arr!18378 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!639426 (= lt!295804 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18378 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!413966 () Bool)

(assert (=> start!57812 (=> (not res!413966) (not e!365952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57812 (= res!413966 (validMask!0 mask!3053))))

(assert (=> start!57812 e!365952))

(assert (=> start!57812 true))

(declare-fun array_inv!14174 (array!38314) Bool)

(assert (=> start!57812 (array_inv!14174 a!2986)))

(declare-fun b!639427 () Bool)

(assert (=> b!639427 (= e!365952 e!365953)))

(declare-fun res!413981 () Bool)

(assert (=> b!639427 (=> (not res!413981) (not e!365953))))

(declare-fun lt!295799 () SeekEntryResult!6818)

(assert (=> b!639427 (= res!413981 (or (= lt!295799 (MissingZero!6818 i!1108)) (= lt!295799 (MissingVacant!6818 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38314 (_ BitVec 32)) SeekEntryResult!6818)

(assert (=> b!639427 (= lt!295799 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!639428 () Bool)

(declare-fun e!365958 () Bool)

(declare-fun e!365954 () Bool)

(assert (=> b!639428 (= e!365958 e!365954)))

(declare-fun res!413978 () Bool)

(assert (=> b!639428 (=> (not res!413978) (not e!365954))))

(assert (=> b!639428 (= res!413978 (arrayContainsKey!0 lt!295803 (select (arr!18378 a!2986) j!136) j!136))))

(declare-fun b!639429 () Bool)

(declare-fun e!365949 () Bool)

(assert (=> b!639429 (= e!365949 e!365958)))

(declare-fun res!413967 () Bool)

(assert (=> b!639429 (=> res!413967 e!365958)))

(declare-fun lt!295810 () (_ BitVec 64))

(assert (=> b!639429 (= res!413967 (or (not (= (select (arr!18378 a!2986) j!136) lt!295802)) (not (= (select (arr!18378 a!2986) j!136) lt!295810)) (bvsge j!136 index!984)))))

(declare-fun b!639430 () Bool)

(declare-fun res!413979 () Bool)

(assert (=> b!639430 (=> (not res!413979) (not e!365952))))

(assert (=> b!639430 (= res!413979 (and (= (size!18742 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18742 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18742 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639431 () Bool)

(declare-fun res!413980 () Bool)

(assert (=> b!639431 (=> (not res!413980) (not e!365953))))

(assert (=> b!639431 (= res!413980 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18378 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639432 () Bool)

(declare-fun Unit!21609 () Unit!21606)

(assert (=> b!639432 (= e!365955 Unit!21609)))

(assert (=> b!639432 false))

(declare-fun b!639433 () Bool)

(assert (=> b!639433 (= e!365954 (arrayContainsKey!0 lt!295803 (select (arr!18378 a!2986) j!136) index!984))))

(declare-fun b!639434 () Bool)

(declare-fun res!413974 () Bool)

(assert (=> b!639434 (=> (not res!413974) (not e!365952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639434 (= res!413974 (validKeyInArray!0 k!1786))))

(declare-fun b!639435 () Bool)

(assert (=> b!639435 (= e!365948 e!365947)))

(declare-fun res!413970 () Bool)

(assert (=> b!639435 (=> res!413970 e!365947)))

(assert (=> b!639435 (= res!413970 (or (not (= (select (arr!18378 a!2986) j!136) lt!295802)) (not (= (select (arr!18378 a!2986) j!136) lt!295810)) (bvsge j!136 index!984)))))

(assert (=> b!639435 e!365949))

(declare-fun res!413975 () Bool)

(assert (=> b!639435 (=> (not res!413975) (not e!365949))))

(assert (=> b!639435 (= res!413975 (= lt!295810 (select (arr!18378 a!2986) j!136)))))

(assert (=> b!639435 (= lt!295810 (select (store (arr!18378 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!639436 () Bool)

(declare-fun res!413971 () Bool)

(assert (=> b!639436 (=> (not res!413971) (not e!365953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38314 (_ BitVec 32)) Bool)

(assert (=> b!639436 (= res!413971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639437 () Bool)

(declare-fun res!413976 () Bool)

(assert (=> b!639437 (=> (not res!413976) (not e!365952))))

(assert (=> b!639437 (= res!413976 (validKeyInArray!0 (select (arr!18378 a!2986) j!136)))))

(assert (= (and start!57812 res!413966) b!639430))

(assert (= (and b!639430 res!413979) b!639437))

(assert (= (and b!639437 res!413976) b!639434))

(assert (= (and b!639434 res!413974) b!639422))

(assert (= (and b!639422 res!413973) b!639427))

(assert (= (and b!639427 res!413981) b!639436))

(assert (= (and b!639436 res!413971) b!639425))

(assert (= (and b!639425 res!413969) b!639431))

(assert (= (and b!639431 res!413980) b!639423))

(assert (= (and b!639423 res!413968) b!639426))

(assert (= (and b!639426 res!413972) b!639420))

(assert (= (and b!639420 res!413965) b!639421))

(assert (= (and b!639420 c!73094) b!639432))

(assert (= (and b!639420 (not c!73094)) b!639424))

(assert (= (and b!639420 (not res!413977)) b!639435))

(assert (= (and b!639435 res!413975) b!639429))

(assert (= (and b!639429 (not res!413967)) b!639428))

(assert (= (and b!639428 res!413978) b!639433))

(assert (= (and b!639435 (not res!413970)) b!639419))

(declare-fun m!613283 () Bool)

(assert (=> b!639423 m!613283))

(declare-fun m!613285 () Bool)

(assert (=> b!639423 m!613285))

(declare-fun m!613287 () Bool)

(assert (=> b!639426 m!613287))

(declare-fun m!613289 () Bool)

(assert (=> b!639426 m!613289))

(assert (=> b!639426 m!613289))

(declare-fun m!613291 () Bool)

(assert (=> b!639426 m!613291))

(assert (=> b!639429 m!613289))

(declare-fun m!613293 () Bool)

(assert (=> b!639431 m!613293))

(assert (=> b!639437 m!613289))

(assert (=> b!639437 m!613289))

(declare-fun m!613295 () Bool)

(assert (=> b!639437 m!613295))

(assert (=> b!639428 m!613289))

(assert (=> b!639428 m!613289))

(declare-fun m!613297 () Bool)

(assert (=> b!639428 m!613297))

(declare-fun m!613299 () Bool)

(assert (=> start!57812 m!613299))

(declare-fun m!613301 () Bool)

(assert (=> start!57812 m!613301))

(declare-fun m!613303 () Bool)

(assert (=> b!639422 m!613303))

(declare-fun m!613305 () Bool)

(assert (=> b!639425 m!613305))

(declare-fun m!613307 () Bool)

(assert (=> b!639427 m!613307))

(assert (=> b!639435 m!613289))

(assert (=> b!639435 m!613283))

(declare-fun m!613309 () Bool)

(assert (=> b!639435 m!613309))

(declare-fun m!613311 () Bool)

(assert (=> b!639436 m!613311))

(assert (=> b!639419 m!613289))

(assert (=> b!639419 m!613289))

(declare-fun m!613313 () Bool)

(assert (=> b!639419 m!613313))

(assert (=> b!639419 m!613289))

(declare-fun m!613315 () Bool)

(assert (=> b!639419 m!613315))

(declare-fun m!613317 () Bool)

(assert (=> b!639419 m!613317))

(declare-fun m!613319 () Bool)

(assert (=> b!639419 m!613319))

(assert (=> b!639433 m!613289))

(assert (=> b!639433 m!613289))

(declare-fun m!613321 () Bool)

(assert (=> b!639433 m!613321))

(declare-fun m!613323 () Bool)

(assert (=> b!639434 m!613323))

(declare-fun m!613325 () Bool)

(assert (=> b!639420 m!613325))

(declare-fun m!613327 () Bool)

(assert (=> b!639420 m!613327))

(assert (=> b!639420 m!613289))

(assert (=> b!639420 m!613283))

(declare-fun m!613329 () Bool)

(assert (=> b!639420 m!613329))

(declare-fun m!613331 () Bool)

(assert (=> b!639420 m!613331))

(declare-fun m!613333 () Bool)

(assert (=> b!639420 m!613333))

(assert (=> b!639420 m!613289))

(declare-fun m!613335 () Bool)

(assert (=> b!639420 m!613335))

(push 1)

(assert (not b!639433))

(assert (not b!639426))

(assert (not b!639437))

(assert (not b!639436))

(assert (not b!639425))

(assert (not b!639422))

(assert (not b!639427))

(assert (not b!639420))

(assert (not b!639434))

(assert (not b!639428))

(assert (not start!57812))

(assert (not b!639419))

(check-sat)

(pop 1)

(push 1)

(check-sat)

