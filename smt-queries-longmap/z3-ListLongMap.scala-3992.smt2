; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54192 () Bool)

(assert start!54192)

(declare-fun b!591425 () Bool)

(declare-fun e!337696 () Bool)

(declare-fun e!337692 () Bool)

(assert (=> b!591425 (= e!337696 e!337692)))

(declare-fun res!378299 () Bool)

(assert (=> b!591425 (=> (not res!378299) (not e!337692))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36867 0))(
  ( (array!36868 (arr!17701 (Array (_ BitVec 32) (_ BitVec 64))) (size!18065 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36867)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!591425 (= res!378299 (= (select (store (arr!17701 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!268354 () array!36867)

(assert (=> b!591425 (= lt!268354 (array!36868 (store (arr!17701 a!2986) i!1108 k0!1786) (size!18065 a!2986)))))

(declare-fun b!591426 () Bool)

(declare-fun res!378294 () Bool)

(declare-fun e!337691 () Bool)

(assert (=> b!591426 (=> (not res!378294) (not e!337691))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591426 (= res!378294 (validKeyInArray!0 (select (arr!17701 a!2986) j!136)))))

(declare-fun b!591427 () Bool)

(declare-fun res!378298 () Bool)

(assert (=> b!591427 (=> (not res!378298) (not e!337696))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36867 (_ BitVec 32)) Bool)

(assert (=> b!591427 (= res!378298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591428 () Bool)

(declare-fun e!337697 () Bool)

(declare-fun e!337694 () Bool)

(assert (=> b!591428 (= e!337697 e!337694)))

(declare-fun res!378289 () Bool)

(assert (=> b!591428 (=> res!378289 e!337694)))

(declare-fun lt!268348 () (_ BitVec 64))

(declare-fun lt!268350 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591428 (= res!378289 (or (not (= (select (arr!17701 a!2986) j!136) lt!268348)) (not (= (select (arr!17701 a!2986) j!136) lt!268350)) (bvsge j!136 index!984)))))

(declare-fun b!591429 () Bool)

(declare-fun e!337700 () Bool)

(declare-fun e!337698 () Bool)

(assert (=> b!591429 (= e!337700 (not e!337698))))

(declare-fun res!378295 () Bool)

(assert (=> b!591429 (=> res!378295 e!337698)))

(declare-datatypes ((SeekEntryResult!6097 0))(
  ( (MissingZero!6097 (index!26624 (_ BitVec 32))) (Found!6097 (index!26625 (_ BitVec 32))) (Intermediate!6097 (undefined!6909 Bool) (index!26626 (_ BitVec 32)) (x!55572 (_ BitVec 32))) (Undefined!6097) (MissingVacant!6097 (index!26627 (_ BitVec 32))) )
))
(declare-fun lt!268349 () SeekEntryResult!6097)

(assert (=> b!591429 (= res!378295 (not (= lt!268349 (Found!6097 index!984))))))

(declare-datatypes ((Unit!18481 0))(
  ( (Unit!18482) )
))
(declare-fun lt!268352 () Unit!18481)

(declare-fun e!337693 () Unit!18481)

(assert (=> b!591429 (= lt!268352 e!337693)))

(declare-fun c!66938 () Bool)

(assert (=> b!591429 (= c!66938 (= lt!268349 Undefined!6097))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36867 (_ BitVec 32)) SeekEntryResult!6097)

(assert (=> b!591429 (= lt!268349 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268348 lt!268354 mask!3053))))

(declare-fun e!337701 () Bool)

(assert (=> b!591429 e!337701))

(declare-fun res!378291 () Bool)

(assert (=> b!591429 (=> (not res!378291) (not e!337701))))

(declare-fun lt!268351 () SeekEntryResult!6097)

(declare-fun lt!268347 () (_ BitVec 32))

(assert (=> b!591429 (= res!378291 (= lt!268351 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268347 vacantSpotIndex!68 lt!268348 lt!268354 mask!3053)))))

(assert (=> b!591429 (= lt!268351 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268347 vacantSpotIndex!68 (select (arr!17701 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591429 (= lt!268348 (select (store (arr!17701 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268353 () Unit!18481)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36867 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18481)

(assert (=> b!591429 (= lt!268353 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268347 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591429 (= lt!268347 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!591430 () Bool)

(declare-fun res!378290 () Bool)

(assert (=> b!591430 (=> (not res!378290) (not e!337696))))

(declare-datatypes ((List!11649 0))(
  ( (Nil!11646) (Cons!11645 (h!12693 (_ BitVec 64)) (t!17869 List!11649)) )
))
(declare-fun arrayNoDuplicates!0 (array!36867 (_ BitVec 32) List!11649) Bool)

(assert (=> b!591430 (= res!378290 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11646))))

(declare-fun b!591431 () Bool)

(declare-fun e!337695 () Bool)

(assert (=> b!591431 (= e!337694 e!337695)))

(declare-fun res!378293 () Bool)

(assert (=> b!591431 (=> (not res!378293) (not e!337695))))

(declare-fun arrayContainsKey!0 (array!36867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591431 (= res!378293 (arrayContainsKey!0 lt!268354 (select (arr!17701 a!2986) j!136) j!136))))

(declare-fun b!591432 () Bool)

(declare-fun Unit!18483 () Unit!18481)

(assert (=> b!591432 (= e!337693 Unit!18483)))

(declare-fun res!378297 () Bool)

(assert (=> start!54192 (=> (not res!378297) (not e!337691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54192 (= res!378297 (validMask!0 mask!3053))))

(assert (=> start!54192 e!337691))

(assert (=> start!54192 true))

(declare-fun array_inv!13560 (array!36867) Bool)

(assert (=> start!54192 (array_inv!13560 a!2986)))

(declare-fun b!591433 () Bool)

(declare-fun res!378286 () Bool)

(assert (=> b!591433 (=> (not res!378286) (not e!337691))))

(assert (=> b!591433 (= res!378286 (and (= (size!18065 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18065 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18065 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591434 () Bool)

(declare-fun res!378288 () Bool)

(assert (=> b!591434 (=> (not res!378288) (not e!337691))))

(assert (=> b!591434 (= res!378288 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591435 () Bool)

(assert (=> b!591435 (= e!337692 e!337700)))

(declare-fun res!378300 () Bool)

(assert (=> b!591435 (=> (not res!378300) (not e!337700))))

(declare-fun lt!268345 () SeekEntryResult!6097)

(assert (=> b!591435 (= res!378300 (and (= lt!268345 (Found!6097 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17701 a!2986) index!984) (select (arr!17701 a!2986) j!136))) (not (= (select (arr!17701 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!591435 (= lt!268345 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17701 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591436 () Bool)

(assert (=> b!591436 (= e!337695 (arrayContainsKey!0 lt!268354 (select (arr!17701 a!2986) j!136) index!984))))

(declare-fun b!591437 () Bool)

(assert (=> b!591437 (= e!337698 true)))

(assert (=> b!591437 e!337697))

(declare-fun res!378287 () Bool)

(assert (=> b!591437 (=> (not res!378287) (not e!337697))))

(assert (=> b!591437 (= res!378287 (= lt!268350 (select (arr!17701 a!2986) j!136)))))

(assert (=> b!591437 (= lt!268350 (select (store (arr!17701 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!591438 () Bool)

(declare-fun res!378292 () Bool)

(assert (=> b!591438 (=> (not res!378292) (not e!337691))))

(assert (=> b!591438 (= res!378292 (validKeyInArray!0 k0!1786))))

(declare-fun b!591439 () Bool)

(declare-fun Unit!18484 () Unit!18481)

(assert (=> b!591439 (= e!337693 Unit!18484)))

(assert (=> b!591439 false))

(declare-fun b!591440 () Bool)

(assert (=> b!591440 (= e!337691 e!337696)))

(declare-fun res!378301 () Bool)

(assert (=> b!591440 (=> (not res!378301) (not e!337696))))

(declare-fun lt!268346 () SeekEntryResult!6097)

(assert (=> b!591440 (= res!378301 (or (= lt!268346 (MissingZero!6097 i!1108)) (= lt!268346 (MissingVacant!6097 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36867 (_ BitVec 32)) SeekEntryResult!6097)

(assert (=> b!591440 (= lt!268346 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591441 () Bool)

(assert (=> b!591441 (= e!337701 (= lt!268345 lt!268351))))

(declare-fun b!591442 () Bool)

(declare-fun res!378296 () Bool)

(assert (=> b!591442 (=> (not res!378296) (not e!337696))))

(assert (=> b!591442 (= res!378296 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17701 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54192 res!378297) b!591433))

(assert (= (and b!591433 res!378286) b!591426))

(assert (= (and b!591426 res!378294) b!591438))

(assert (= (and b!591438 res!378292) b!591434))

(assert (= (and b!591434 res!378288) b!591440))

(assert (= (and b!591440 res!378301) b!591427))

(assert (= (and b!591427 res!378298) b!591430))

(assert (= (and b!591430 res!378290) b!591442))

(assert (= (and b!591442 res!378296) b!591425))

(assert (= (and b!591425 res!378299) b!591435))

(assert (= (and b!591435 res!378300) b!591429))

(assert (= (and b!591429 res!378291) b!591441))

(assert (= (and b!591429 c!66938) b!591439))

(assert (= (and b!591429 (not c!66938)) b!591432))

(assert (= (and b!591429 (not res!378295)) b!591437))

(assert (= (and b!591437 res!378287) b!591428))

(assert (= (and b!591428 (not res!378289)) b!591431))

(assert (= (and b!591431 res!378293) b!591436))

(declare-fun m!569873 () Bool)

(assert (=> b!591427 m!569873))

(declare-fun m!569875 () Bool)

(assert (=> b!591438 m!569875))

(declare-fun m!569877 () Bool)

(assert (=> b!591437 m!569877))

(declare-fun m!569879 () Bool)

(assert (=> b!591437 m!569879))

(declare-fun m!569881 () Bool)

(assert (=> b!591437 m!569881))

(assert (=> b!591431 m!569877))

(assert (=> b!591431 m!569877))

(declare-fun m!569883 () Bool)

(assert (=> b!591431 m!569883))

(declare-fun m!569885 () Bool)

(assert (=> b!591430 m!569885))

(assert (=> b!591425 m!569879))

(declare-fun m!569887 () Bool)

(assert (=> b!591425 m!569887))

(declare-fun m!569889 () Bool)

(assert (=> b!591435 m!569889))

(assert (=> b!591435 m!569877))

(assert (=> b!591435 m!569877))

(declare-fun m!569891 () Bool)

(assert (=> b!591435 m!569891))

(assert (=> b!591426 m!569877))

(assert (=> b!591426 m!569877))

(declare-fun m!569893 () Bool)

(assert (=> b!591426 m!569893))

(declare-fun m!569895 () Bool)

(assert (=> b!591442 m!569895))

(declare-fun m!569897 () Bool)

(assert (=> b!591429 m!569897))

(declare-fun m!569899 () Bool)

(assert (=> b!591429 m!569899))

(declare-fun m!569901 () Bool)

(assert (=> b!591429 m!569901))

(assert (=> b!591429 m!569877))

(assert (=> b!591429 m!569879))

(assert (=> b!591429 m!569877))

(declare-fun m!569903 () Bool)

(assert (=> b!591429 m!569903))

(declare-fun m!569905 () Bool)

(assert (=> b!591429 m!569905))

(declare-fun m!569907 () Bool)

(assert (=> b!591429 m!569907))

(declare-fun m!569909 () Bool)

(assert (=> b!591434 m!569909))

(declare-fun m!569911 () Bool)

(assert (=> start!54192 m!569911))

(declare-fun m!569913 () Bool)

(assert (=> start!54192 m!569913))

(assert (=> b!591436 m!569877))

(assert (=> b!591436 m!569877))

(declare-fun m!569915 () Bool)

(assert (=> b!591436 m!569915))

(assert (=> b!591428 m!569877))

(declare-fun m!569917 () Bool)

(assert (=> b!591440 m!569917))

(check-sat (not b!591434) (not b!591436) (not b!591430) (not b!591431) (not b!591438) (not b!591426) (not b!591435) (not start!54192) (not b!591440) (not b!591429) (not b!591427))
(check-sat)
