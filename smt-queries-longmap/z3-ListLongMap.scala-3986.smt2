; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53988 () Bool)

(assert start!53988)

(declare-fun b!589818 () Bool)

(declare-fun res!377285 () Bool)

(declare-fun e!336723 () Bool)

(assert (=> b!589818 (=> (not res!377285) (not e!336723))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36832 0))(
  ( (array!36833 (arr!17689 (Array (_ BitVec 32) (_ BitVec 64))) (size!18053 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36832)

(assert (=> b!589818 (= res!377285 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17689 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589819 () Bool)

(declare-datatypes ((Unit!18434 0))(
  ( (Unit!18435) )
))
(declare-fun e!336721 () Unit!18434)

(declare-fun Unit!18436 () Unit!18434)

(assert (=> b!589819 (= e!336721 Unit!18436)))

(assert (=> b!589819 false))

(declare-fun b!589820 () Bool)

(declare-fun Unit!18437 () Unit!18434)

(assert (=> b!589820 (= e!336721 Unit!18437)))

(declare-fun b!589821 () Bool)

(declare-fun e!336720 () Bool)

(assert (=> b!589821 (= e!336720 e!336723)))

(declare-fun res!377294 () Bool)

(assert (=> b!589821 (=> (not res!377294) (not e!336723))))

(declare-datatypes ((SeekEntryResult!6129 0))(
  ( (MissingZero!6129 (index!26746 (_ BitVec 32))) (Found!6129 (index!26747 (_ BitVec 32))) (Intermediate!6129 (undefined!6941 Bool) (index!26748 (_ BitVec 32)) (x!55535 (_ BitVec 32))) (Undefined!6129) (MissingVacant!6129 (index!26749 (_ BitVec 32))) )
))
(declare-fun lt!267561 () SeekEntryResult!6129)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589821 (= res!377294 (or (= lt!267561 (MissingZero!6129 i!1108)) (= lt!267561 (MissingVacant!6129 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36832 (_ BitVec 32)) SeekEntryResult!6129)

(assert (=> b!589821 (= lt!267561 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589822 () Bool)

(declare-fun res!377290 () Bool)

(assert (=> b!589822 (=> (not res!377290) (not e!336723))))

(declare-datatypes ((List!11730 0))(
  ( (Nil!11727) (Cons!11726 (h!12771 (_ BitVec 64)) (t!17958 List!11730)) )
))
(declare-fun arrayNoDuplicates!0 (array!36832 (_ BitVec 32) List!11730) Bool)

(assert (=> b!589822 (= res!377290 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11727))))

(declare-fun b!589823 () Bool)

(declare-fun res!377287 () Bool)

(assert (=> b!589823 (=> (not res!377287) (not e!336723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36832 (_ BitVec 32)) Bool)

(assert (=> b!589823 (= res!377287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589824 () Bool)

(declare-fun e!336726 () Bool)

(declare-fun e!336725 () Bool)

(assert (=> b!589824 (= e!336726 (not e!336725))))

(declare-fun res!377288 () Bool)

(assert (=> b!589824 (=> res!377288 e!336725)))

(declare-fun lt!267558 () SeekEntryResult!6129)

(assert (=> b!589824 (= res!377288 (not (= lt!267558 (Found!6129 index!984))))))

(declare-fun lt!267564 () Unit!18434)

(assert (=> b!589824 (= lt!267564 e!336721)))

(declare-fun c!66635 () Bool)

(assert (=> b!589824 (= c!66635 (= lt!267558 Undefined!6129))))

(declare-fun lt!267557 () (_ BitVec 64))

(declare-fun lt!267560 () array!36832)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36832 (_ BitVec 32)) SeekEntryResult!6129)

(assert (=> b!589824 (= lt!267558 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267557 lt!267560 mask!3053))))

(declare-fun e!336724 () Bool)

(assert (=> b!589824 e!336724))

(declare-fun res!377282 () Bool)

(assert (=> b!589824 (=> (not res!377282) (not e!336724))))

(declare-fun lt!267562 () (_ BitVec 32))

(declare-fun lt!267563 () SeekEntryResult!6129)

(assert (=> b!589824 (= res!377282 (= lt!267563 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267562 vacantSpotIndex!68 lt!267557 lt!267560 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!589824 (= lt!267563 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267562 vacantSpotIndex!68 (select (arr!17689 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589824 (= lt!267557 (select (store (arr!17689 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267559 () Unit!18434)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36832 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18434)

(assert (=> b!589824 (= lt!267559 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267562 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589824 (= lt!267562 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589825 () Bool)

(declare-fun res!377283 () Bool)

(assert (=> b!589825 (=> (not res!377283) (not e!336720))))

(declare-fun arrayContainsKey!0 (array!36832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589825 (= res!377283 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589826 () Bool)

(declare-fun res!377291 () Bool)

(assert (=> b!589826 (=> (not res!377291) (not e!336720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589826 (= res!377291 (validKeyInArray!0 k0!1786))))

(declare-fun res!377286 () Bool)

(assert (=> start!53988 (=> (not res!377286) (not e!336720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53988 (= res!377286 (validMask!0 mask!3053))))

(assert (=> start!53988 e!336720))

(assert (=> start!53988 true))

(declare-fun array_inv!13485 (array!36832) Bool)

(assert (=> start!53988 (array_inv!13485 a!2986)))

(declare-fun b!589827 () Bool)

(declare-fun e!336722 () Bool)

(assert (=> b!589827 (= e!336722 e!336726)))

(declare-fun res!377292 () Bool)

(assert (=> b!589827 (=> (not res!377292) (not e!336726))))

(declare-fun lt!267565 () SeekEntryResult!6129)

(assert (=> b!589827 (= res!377292 (and (= lt!267565 (Found!6129 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17689 a!2986) index!984) (select (arr!17689 a!2986) j!136))) (not (= (select (arr!17689 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!589827 (= lt!267565 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17689 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589828 () Bool)

(assert (=> b!589828 (= e!336725 true)))

(assert (=> b!589828 (= (select (store (arr!17689 a!2986) i!1108 k0!1786) index!984) (select (arr!17689 a!2986) j!136))))

(declare-fun b!589829 () Bool)

(assert (=> b!589829 (= e!336723 e!336722)))

(declare-fun res!377284 () Bool)

(assert (=> b!589829 (=> (not res!377284) (not e!336722))))

(assert (=> b!589829 (= res!377284 (= (select (store (arr!17689 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589829 (= lt!267560 (array!36833 (store (arr!17689 a!2986) i!1108 k0!1786) (size!18053 a!2986)))))

(declare-fun b!589830 () Bool)

(declare-fun res!377293 () Bool)

(assert (=> b!589830 (=> (not res!377293) (not e!336720))))

(assert (=> b!589830 (= res!377293 (validKeyInArray!0 (select (arr!17689 a!2986) j!136)))))

(declare-fun b!589831 () Bool)

(declare-fun res!377289 () Bool)

(assert (=> b!589831 (=> (not res!377289) (not e!336720))))

(assert (=> b!589831 (= res!377289 (and (= (size!18053 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18053 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18053 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589832 () Bool)

(assert (=> b!589832 (= e!336724 (= lt!267565 lt!267563))))

(assert (= (and start!53988 res!377286) b!589831))

(assert (= (and b!589831 res!377289) b!589830))

(assert (= (and b!589830 res!377293) b!589826))

(assert (= (and b!589826 res!377291) b!589825))

(assert (= (and b!589825 res!377283) b!589821))

(assert (= (and b!589821 res!377294) b!589823))

(assert (= (and b!589823 res!377287) b!589822))

(assert (= (and b!589822 res!377290) b!589818))

(assert (= (and b!589818 res!377285) b!589829))

(assert (= (and b!589829 res!377284) b!589827))

(assert (= (and b!589827 res!377292) b!589824))

(assert (= (and b!589824 res!377282) b!589832))

(assert (= (and b!589824 c!66635) b!589819))

(assert (= (and b!589824 (not c!66635)) b!589820))

(assert (= (and b!589824 (not res!377288)) b!589828))

(declare-fun m!568321 () Bool)

(assert (=> b!589825 m!568321))

(declare-fun m!568323 () Bool)

(assert (=> b!589826 m!568323))

(declare-fun m!568325 () Bool)

(assert (=> b!589818 m!568325))

(declare-fun m!568327 () Bool)

(assert (=> b!589823 m!568327))

(declare-fun m!568329 () Bool)

(assert (=> b!589822 m!568329))

(declare-fun m!568331 () Bool)

(assert (=> start!53988 m!568331))

(declare-fun m!568333 () Bool)

(assert (=> start!53988 m!568333))

(declare-fun m!568335 () Bool)

(assert (=> b!589824 m!568335))

(declare-fun m!568337 () Bool)

(assert (=> b!589824 m!568337))

(assert (=> b!589824 m!568337))

(declare-fun m!568339 () Bool)

(assert (=> b!589824 m!568339))

(declare-fun m!568341 () Bool)

(assert (=> b!589824 m!568341))

(declare-fun m!568343 () Bool)

(assert (=> b!589824 m!568343))

(declare-fun m!568345 () Bool)

(assert (=> b!589824 m!568345))

(declare-fun m!568347 () Bool)

(assert (=> b!589824 m!568347))

(declare-fun m!568349 () Bool)

(assert (=> b!589824 m!568349))

(assert (=> b!589828 m!568349))

(declare-fun m!568351 () Bool)

(assert (=> b!589828 m!568351))

(assert (=> b!589828 m!568337))

(declare-fun m!568353 () Bool)

(assert (=> b!589821 m!568353))

(declare-fun m!568355 () Bool)

(assert (=> b!589827 m!568355))

(assert (=> b!589827 m!568337))

(assert (=> b!589827 m!568337))

(declare-fun m!568357 () Bool)

(assert (=> b!589827 m!568357))

(assert (=> b!589830 m!568337))

(assert (=> b!589830 m!568337))

(declare-fun m!568359 () Bool)

(assert (=> b!589830 m!568359))

(assert (=> b!589829 m!568349))

(declare-fun m!568361 () Bool)

(assert (=> b!589829 m!568361))

(check-sat (not start!53988) (not b!589830) (not b!589823) (not b!589821) (not b!589824) (not b!589826) (not b!589827) (not b!589822) (not b!589825))
(check-sat)
