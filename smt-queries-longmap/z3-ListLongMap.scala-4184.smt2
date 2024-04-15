; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57006 () Bool)

(assert start!57006)

(declare-fun b!631098 () Bool)

(declare-fun res!408151 () Bool)

(declare-fun e!360801 () Bool)

(assert (=> b!631098 (=> (not res!408151) (not e!360801))))

(declare-datatypes ((array!38094 0))(
  ( (array!38095 (arr!18281 (Array (_ BitVec 32) (_ BitVec 64))) (size!18646 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38094)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631098 (= res!408151 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun e!360803 () Bool)

(declare-fun b!631099 () Bool)

(declare-datatypes ((SeekEntryResult!6718 0))(
  ( (MissingZero!6718 (index!29162 (_ BitVec 32))) (Found!6718 (index!29163 (_ BitVec 32))) (Intermediate!6718 (undefined!7530 Bool) (index!29164 (_ BitVec 32)) (x!57907 (_ BitVec 32))) (Undefined!6718) (MissingVacant!6718 (index!29165 (_ BitVec 32))) )
))
(declare-fun lt!291468 () SeekEntryResult!6718)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631099 (= e!360803 (not (or (not (= lt!291468 (Found!6718 index!984))) (= (select (store (arr!18281 a!2986) i!1108 k0!1786) index!984) (select (arr!18281 a!2986) j!136)))))))

(declare-datatypes ((Unit!21200 0))(
  ( (Unit!21201) )
))
(declare-fun lt!291464 () Unit!21200)

(declare-fun e!360804 () Unit!21200)

(assert (=> b!631099 (= lt!291464 e!360804)))

(declare-fun c!71844 () Bool)

(assert (=> b!631099 (= c!71844 (= lt!291468 Undefined!6718))))

(declare-fun lt!291472 () array!38094)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!291465 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38094 (_ BitVec 32)) SeekEntryResult!6718)

(assert (=> b!631099 (= lt!291468 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291465 lt!291472 mask!3053))))

(declare-fun e!360802 () Bool)

(assert (=> b!631099 e!360802))

(declare-fun res!408145 () Bool)

(assert (=> b!631099 (=> (not res!408145) (not e!360802))))

(declare-fun lt!291470 () SeekEntryResult!6718)

(declare-fun lt!291467 () (_ BitVec 32))

(assert (=> b!631099 (= res!408145 (= lt!291470 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291467 vacantSpotIndex!68 lt!291465 lt!291472 mask!3053)))))

(assert (=> b!631099 (= lt!291470 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291467 vacantSpotIndex!68 (select (arr!18281 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631099 (= lt!291465 (select (store (arr!18281 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291469 () Unit!21200)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38094 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21200)

(assert (=> b!631099 (= lt!291469 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291467 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631099 (= lt!291467 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!408144 () Bool)

(assert (=> start!57006 (=> (not res!408144) (not e!360801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57006 (= res!408144 (validMask!0 mask!3053))))

(assert (=> start!57006 e!360801))

(assert (=> start!57006 true))

(declare-fun array_inv!14164 (array!38094) Bool)

(assert (=> start!57006 (array_inv!14164 a!2986)))

(declare-fun b!631100 () Bool)

(declare-fun res!408153 () Bool)

(declare-fun e!360806 () Bool)

(assert (=> b!631100 (=> (not res!408153) (not e!360806))))

(declare-datatypes ((List!12361 0))(
  ( (Nil!12358) (Cons!12357 (h!13402 (_ BitVec 64)) (t!18580 List!12361)) )
))
(declare-fun arrayNoDuplicates!0 (array!38094 (_ BitVec 32) List!12361) Bool)

(assert (=> b!631100 (= res!408153 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12358))))

(declare-fun b!631101 () Bool)

(declare-fun lt!291466 () SeekEntryResult!6718)

(assert (=> b!631101 (= e!360802 (= lt!291466 lt!291470))))

(declare-fun b!631102 () Bool)

(declare-fun res!408152 () Bool)

(assert (=> b!631102 (=> (not res!408152) (not e!360801))))

(assert (=> b!631102 (= res!408152 (and (= (size!18646 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18646 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18646 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631103 () Bool)

(declare-fun Unit!21202 () Unit!21200)

(assert (=> b!631103 (= e!360804 Unit!21202)))

(declare-fun b!631104 () Bool)

(declare-fun e!360805 () Bool)

(assert (=> b!631104 (= e!360806 e!360805)))

(declare-fun res!408146 () Bool)

(assert (=> b!631104 (=> (not res!408146) (not e!360805))))

(assert (=> b!631104 (= res!408146 (= (select (store (arr!18281 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631104 (= lt!291472 (array!38095 (store (arr!18281 a!2986) i!1108 k0!1786) (size!18646 a!2986)))))

(declare-fun b!631105 () Bool)

(declare-fun res!408149 () Bool)

(assert (=> b!631105 (=> (not res!408149) (not e!360806))))

(assert (=> b!631105 (= res!408149 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18281 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631106 () Bool)

(declare-fun res!408154 () Bool)

(assert (=> b!631106 (=> (not res!408154) (not e!360801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631106 (= res!408154 (validKeyInArray!0 k0!1786))))

(declare-fun b!631107 () Bool)

(assert (=> b!631107 (= e!360801 e!360806)))

(declare-fun res!408147 () Bool)

(assert (=> b!631107 (=> (not res!408147) (not e!360806))))

(declare-fun lt!291471 () SeekEntryResult!6718)

(assert (=> b!631107 (= res!408147 (or (= lt!291471 (MissingZero!6718 i!1108)) (= lt!291471 (MissingVacant!6718 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38094 (_ BitVec 32)) SeekEntryResult!6718)

(assert (=> b!631107 (= lt!291471 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631108 () Bool)

(assert (=> b!631108 (= e!360805 e!360803)))

(declare-fun res!408155 () Bool)

(assert (=> b!631108 (=> (not res!408155) (not e!360803))))

(assert (=> b!631108 (= res!408155 (and (= lt!291466 (Found!6718 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18281 a!2986) index!984) (select (arr!18281 a!2986) j!136))) (not (= (select (arr!18281 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631108 (= lt!291466 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18281 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631109 () Bool)

(declare-fun Unit!21203 () Unit!21200)

(assert (=> b!631109 (= e!360804 Unit!21203)))

(assert (=> b!631109 false))

(declare-fun b!631110 () Bool)

(declare-fun res!408150 () Bool)

(assert (=> b!631110 (=> (not res!408150) (not e!360801))))

(assert (=> b!631110 (= res!408150 (validKeyInArray!0 (select (arr!18281 a!2986) j!136)))))

(declare-fun b!631111 () Bool)

(declare-fun res!408148 () Bool)

(assert (=> b!631111 (=> (not res!408148) (not e!360806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38094 (_ BitVec 32)) Bool)

(assert (=> b!631111 (= res!408148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!57006 res!408144) b!631102))

(assert (= (and b!631102 res!408152) b!631110))

(assert (= (and b!631110 res!408150) b!631106))

(assert (= (and b!631106 res!408154) b!631098))

(assert (= (and b!631098 res!408151) b!631107))

(assert (= (and b!631107 res!408147) b!631111))

(assert (= (and b!631111 res!408148) b!631100))

(assert (= (and b!631100 res!408153) b!631105))

(assert (= (and b!631105 res!408149) b!631104))

(assert (= (and b!631104 res!408146) b!631108))

(assert (= (and b!631108 res!408155) b!631099))

(assert (= (and b!631099 res!408145) b!631101))

(assert (= (and b!631099 c!71844) b!631109))

(assert (= (and b!631099 (not c!71844)) b!631103))

(declare-fun m!605539 () Bool)

(assert (=> b!631106 m!605539))

(declare-fun m!605541 () Bool)

(assert (=> b!631105 m!605541))

(declare-fun m!605543 () Bool)

(assert (=> b!631098 m!605543))

(declare-fun m!605545 () Bool)

(assert (=> b!631110 m!605545))

(assert (=> b!631110 m!605545))

(declare-fun m!605547 () Bool)

(assert (=> b!631110 m!605547))

(declare-fun m!605549 () Bool)

(assert (=> b!631107 m!605549))

(declare-fun m!605551 () Bool)

(assert (=> b!631108 m!605551))

(assert (=> b!631108 m!605545))

(assert (=> b!631108 m!605545))

(declare-fun m!605553 () Bool)

(assert (=> b!631108 m!605553))

(declare-fun m!605555 () Bool)

(assert (=> b!631111 m!605555))

(declare-fun m!605557 () Bool)

(assert (=> b!631104 m!605557))

(declare-fun m!605559 () Bool)

(assert (=> b!631104 m!605559))

(declare-fun m!605561 () Bool)

(assert (=> b!631100 m!605561))

(declare-fun m!605563 () Bool)

(assert (=> start!57006 m!605563))

(declare-fun m!605565 () Bool)

(assert (=> start!57006 m!605565))

(declare-fun m!605567 () Bool)

(assert (=> b!631099 m!605567))

(declare-fun m!605569 () Bool)

(assert (=> b!631099 m!605569))

(assert (=> b!631099 m!605545))

(assert (=> b!631099 m!605557))

(declare-fun m!605571 () Bool)

(assert (=> b!631099 m!605571))

(declare-fun m!605573 () Bool)

(assert (=> b!631099 m!605573))

(declare-fun m!605575 () Bool)

(assert (=> b!631099 m!605575))

(declare-fun m!605577 () Bool)

(assert (=> b!631099 m!605577))

(assert (=> b!631099 m!605545))

(declare-fun m!605579 () Bool)

(assert (=> b!631099 m!605579))

(check-sat (not b!631100) (not b!631098) (not b!631107) (not b!631106) (not start!57006) (not b!631108) (not b!631099) (not b!631111) (not b!631110))
(check-sat)
(get-model)

(declare-fun d!89105 () Bool)

(declare-fun res!408232 () Bool)

(declare-fun e!360854 () Bool)

(assert (=> d!89105 (=> res!408232 e!360854)))

(assert (=> d!89105 (= res!408232 (= (select (arr!18281 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89105 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!360854)))

(declare-fun b!631200 () Bool)

(declare-fun e!360855 () Bool)

(assert (=> b!631200 (= e!360854 e!360855)))

(declare-fun res!408233 () Bool)

(assert (=> b!631200 (=> (not res!408233) (not e!360855))))

(assert (=> b!631200 (= res!408233 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18646 a!2986)))))

(declare-fun b!631201 () Bool)

(assert (=> b!631201 (= e!360855 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89105 (not res!408232)) b!631200))

(assert (= (and b!631200 res!408233) b!631201))

(declare-fun m!605665 () Bool)

(assert (=> d!89105 m!605665))

(declare-fun m!605667 () Bool)

(assert (=> b!631201 m!605667))

(assert (=> b!631098 d!89105))

(declare-fun b!631214 () Bool)

(declare-fun e!360864 () SeekEntryResult!6718)

(assert (=> b!631214 (= e!360864 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18281 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631215 () Bool)

(assert (=> b!631215 (= e!360864 (MissingVacant!6718 vacantSpotIndex!68))))

(declare-fun b!631216 () Bool)

(declare-fun c!71858 () Bool)

(declare-fun lt!291532 () (_ BitVec 64))

(assert (=> b!631216 (= c!71858 (= lt!291532 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360863 () SeekEntryResult!6718)

(assert (=> b!631216 (= e!360863 e!360864)))

(declare-fun b!631217 () Bool)

(declare-fun e!360862 () SeekEntryResult!6718)

(assert (=> b!631217 (= e!360862 e!360863)))

(declare-fun c!71857 () Bool)

(assert (=> b!631217 (= c!71857 (= lt!291532 (select (arr!18281 a!2986) j!136)))))

(declare-fun b!631218 () Bool)

(assert (=> b!631218 (= e!360862 Undefined!6718)))

(declare-fun lt!291531 () SeekEntryResult!6718)

(declare-fun d!89107 () Bool)

(get-info :version)

(assert (=> d!89107 (and (or ((_ is Undefined!6718) lt!291531) (not ((_ is Found!6718) lt!291531)) (and (bvsge (index!29163 lt!291531) #b00000000000000000000000000000000) (bvslt (index!29163 lt!291531) (size!18646 a!2986)))) (or ((_ is Undefined!6718) lt!291531) ((_ is Found!6718) lt!291531) (not ((_ is MissingVacant!6718) lt!291531)) (not (= (index!29165 lt!291531) vacantSpotIndex!68)) (and (bvsge (index!29165 lt!291531) #b00000000000000000000000000000000) (bvslt (index!29165 lt!291531) (size!18646 a!2986)))) (or ((_ is Undefined!6718) lt!291531) (ite ((_ is Found!6718) lt!291531) (= (select (arr!18281 a!2986) (index!29163 lt!291531)) (select (arr!18281 a!2986) j!136)) (and ((_ is MissingVacant!6718) lt!291531) (= (index!29165 lt!291531) vacantSpotIndex!68) (= (select (arr!18281 a!2986) (index!29165 lt!291531)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89107 (= lt!291531 e!360862)))

(declare-fun c!71859 () Bool)

(assert (=> d!89107 (= c!71859 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89107 (= lt!291532 (select (arr!18281 a!2986) index!984))))

(assert (=> d!89107 (validMask!0 mask!3053)))

(assert (=> d!89107 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18281 a!2986) j!136) a!2986 mask!3053) lt!291531)))

(declare-fun b!631219 () Bool)

(assert (=> b!631219 (= e!360863 (Found!6718 index!984))))

(assert (= (and d!89107 c!71859) b!631218))

(assert (= (and d!89107 (not c!71859)) b!631217))

(assert (= (and b!631217 c!71857) b!631219))

(assert (= (and b!631217 (not c!71857)) b!631216))

(assert (= (and b!631216 c!71858) b!631215))

(assert (= (and b!631216 (not c!71858)) b!631214))

(assert (=> b!631214 m!605567))

(assert (=> b!631214 m!605567))

(assert (=> b!631214 m!605545))

(declare-fun m!605669 () Bool)

(assert (=> b!631214 m!605669))

(declare-fun m!605671 () Bool)

(assert (=> d!89107 m!605671))

(declare-fun m!605673 () Bool)

(assert (=> d!89107 m!605673))

(assert (=> d!89107 m!605551))

(assert (=> d!89107 m!605563))

(assert (=> b!631108 d!89107))

(declare-fun b!631273 () Bool)

(declare-fun e!360898 () SeekEntryResult!6718)

(declare-fun e!360899 () SeekEntryResult!6718)

(assert (=> b!631273 (= e!360898 e!360899)))

(declare-fun lt!291553 () (_ BitVec 64))

(declare-fun lt!291551 () SeekEntryResult!6718)

(assert (=> b!631273 (= lt!291553 (select (arr!18281 a!2986) (index!29164 lt!291551)))))

(declare-fun c!71882 () Bool)

(assert (=> b!631273 (= c!71882 (= lt!291553 k0!1786))))

(declare-fun b!631274 () Bool)

(declare-fun c!71881 () Bool)

(assert (=> b!631274 (= c!71881 (= lt!291553 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360900 () SeekEntryResult!6718)

(assert (=> b!631274 (= e!360899 e!360900)))

(declare-fun b!631275 () Bool)

(assert (=> b!631275 (= e!360900 (MissingZero!6718 (index!29164 lt!291551)))))

(declare-fun b!631276 () Bool)

(assert (=> b!631276 (= e!360899 (Found!6718 (index!29164 lt!291551)))))

(declare-fun b!631277 () Bool)

(assert (=> b!631277 (= e!360900 (seekKeyOrZeroReturnVacant!0 (x!57907 lt!291551) (index!29164 lt!291551) (index!29164 lt!291551) k0!1786 a!2986 mask!3053))))

(declare-fun d!89109 () Bool)

(declare-fun lt!291552 () SeekEntryResult!6718)

(assert (=> d!89109 (and (or ((_ is Undefined!6718) lt!291552) (not ((_ is Found!6718) lt!291552)) (and (bvsge (index!29163 lt!291552) #b00000000000000000000000000000000) (bvslt (index!29163 lt!291552) (size!18646 a!2986)))) (or ((_ is Undefined!6718) lt!291552) ((_ is Found!6718) lt!291552) (not ((_ is MissingZero!6718) lt!291552)) (and (bvsge (index!29162 lt!291552) #b00000000000000000000000000000000) (bvslt (index!29162 lt!291552) (size!18646 a!2986)))) (or ((_ is Undefined!6718) lt!291552) ((_ is Found!6718) lt!291552) ((_ is MissingZero!6718) lt!291552) (not ((_ is MissingVacant!6718) lt!291552)) (and (bvsge (index!29165 lt!291552) #b00000000000000000000000000000000) (bvslt (index!29165 lt!291552) (size!18646 a!2986)))) (or ((_ is Undefined!6718) lt!291552) (ite ((_ is Found!6718) lt!291552) (= (select (arr!18281 a!2986) (index!29163 lt!291552)) k0!1786) (ite ((_ is MissingZero!6718) lt!291552) (= (select (arr!18281 a!2986) (index!29162 lt!291552)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6718) lt!291552) (= (select (arr!18281 a!2986) (index!29165 lt!291552)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89109 (= lt!291552 e!360898)))

(declare-fun c!71880 () Bool)

(assert (=> d!89109 (= c!71880 (and ((_ is Intermediate!6718) lt!291551) (undefined!7530 lt!291551)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38094 (_ BitVec 32)) SeekEntryResult!6718)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89109 (= lt!291551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89109 (validMask!0 mask!3053)))

(assert (=> d!89109 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!291552)))

(declare-fun b!631278 () Bool)

(assert (=> b!631278 (= e!360898 Undefined!6718)))

(assert (= (and d!89109 c!71880) b!631278))

(assert (= (and d!89109 (not c!71880)) b!631273))

(assert (= (and b!631273 c!71882) b!631276))

(assert (= (and b!631273 (not c!71882)) b!631274))

(assert (= (and b!631274 c!71881) b!631275))

(assert (= (and b!631274 (not c!71881)) b!631277))

(declare-fun m!605689 () Bool)

(assert (=> b!631273 m!605689))

(declare-fun m!605691 () Bool)

(assert (=> b!631277 m!605691))

(declare-fun m!605693 () Bool)

(assert (=> d!89109 m!605693))

(declare-fun m!605695 () Bool)

(assert (=> d!89109 m!605695))

(declare-fun m!605697 () Bool)

(assert (=> d!89109 m!605697))

(declare-fun m!605699 () Bool)

(assert (=> d!89109 m!605699))

(assert (=> d!89109 m!605563))

(assert (=> d!89109 m!605695))

(declare-fun m!605701 () Bool)

(assert (=> d!89109 m!605701))

(assert (=> b!631107 d!89109))

(declare-fun b!631303 () Bool)

(declare-fun e!360924 () Bool)

(declare-fun e!360923 () Bool)

(assert (=> b!631303 (= e!360924 e!360923)))

(declare-fun lt!291564 () (_ BitVec 64))

(assert (=> b!631303 (= lt!291564 (select (arr!18281 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!291563 () Unit!21200)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38094 (_ BitVec 64) (_ BitVec 32)) Unit!21200)

(assert (=> b!631303 (= lt!291563 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!291564 #b00000000000000000000000000000000))))

(assert (=> b!631303 (arrayContainsKey!0 a!2986 lt!291564 #b00000000000000000000000000000000)))

(declare-fun lt!291565 () Unit!21200)

(assert (=> b!631303 (= lt!291565 lt!291563)))

(declare-fun res!408265 () Bool)

(assert (=> b!631303 (= res!408265 (= (seekEntryOrOpen!0 (select (arr!18281 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6718 #b00000000000000000000000000000000)))))

(assert (=> b!631303 (=> (not res!408265) (not e!360923))))

(declare-fun d!89117 () Bool)

(declare-fun res!408266 () Bool)

(declare-fun e!360922 () Bool)

(assert (=> d!89117 (=> res!408266 e!360922)))

(assert (=> d!89117 (= res!408266 (bvsge #b00000000000000000000000000000000 (size!18646 a!2986)))))

(assert (=> d!89117 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!360922)))

(declare-fun bm!33307 () Bool)

(declare-fun call!33310 () Bool)

(assert (=> bm!33307 (= call!33310 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!631304 () Bool)

(assert (=> b!631304 (= e!360924 call!33310)))

(declare-fun b!631305 () Bool)

(assert (=> b!631305 (= e!360923 call!33310)))

(declare-fun b!631306 () Bool)

(assert (=> b!631306 (= e!360922 e!360924)))

(declare-fun c!71886 () Bool)

(assert (=> b!631306 (= c!71886 (validKeyInArray!0 (select (arr!18281 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89117 (not res!408266)) b!631306))

(assert (= (and b!631306 c!71886) b!631303))

(assert (= (and b!631306 (not c!71886)) b!631304))

(assert (= (and b!631303 res!408265) b!631305))

(assert (= (or b!631305 b!631304) bm!33307))

(assert (=> b!631303 m!605665))

(declare-fun m!605717 () Bool)

(assert (=> b!631303 m!605717))

(declare-fun m!605719 () Bool)

(assert (=> b!631303 m!605719))

(assert (=> b!631303 m!605665))

(declare-fun m!605721 () Bool)

(assert (=> b!631303 m!605721))

(declare-fun m!605723 () Bool)

(assert (=> bm!33307 m!605723))

(assert (=> b!631306 m!605665))

(assert (=> b!631306 m!605665))

(declare-fun m!605725 () Bool)

(assert (=> b!631306 m!605725))

(assert (=> b!631111 d!89117))

(declare-fun d!89129 () Bool)

(assert (=> d!89129 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!631106 d!89129))

(declare-fun b!631329 () Bool)

(declare-fun e!360940 () Bool)

(declare-fun contains!3074 (List!12361 (_ BitVec 64)) Bool)

(assert (=> b!631329 (= e!360940 (contains!3074 Nil!12358 (select (arr!18281 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!631330 () Bool)

(declare-fun e!360939 () Bool)

(declare-fun e!360942 () Bool)

(assert (=> b!631330 (= e!360939 e!360942)))

(declare-fun res!408274 () Bool)

(assert (=> b!631330 (=> (not res!408274) (not e!360942))))

(assert (=> b!631330 (= res!408274 (not e!360940))))

(declare-fun res!408273 () Bool)

(assert (=> b!631330 (=> (not res!408273) (not e!360940))))

(assert (=> b!631330 (= res!408273 (validKeyInArray!0 (select (arr!18281 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!631331 () Bool)

(declare-fun e!360941 () Bool)

(declare-fun call!33313 () Bool)

(assert (=> b!631331 (= e!360941 call!33313)))

(declare-fun bm!33310 () Bool)

(declare-fun c!71895 () Bool)

(assert (=> bm!33310 (= call!33313 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71895 (Cons!12357 (select (arr!18281 a!2986) #b00000000000000000000000000000000) Nil!12358) Nil!12358)))))

(declare-fun b!631332 () Bool)

(assert (=> b!631332 (= e!360941 call!33313)))

(declare-fun d!89131 () Bool)

(declare-fun res!408275 () Bool)

(assert (=> d!89131 (=> res!408275 e!360939)))

(assert (=> d!89131 (= res!408275 (bvsge #b00000000000000000000000000000000 (size!18646 a!2986)))))

(assert (=> d!89131 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12358) e!360939)))

(declare-fun b!631333 () Bool)

(assert (=> b!631333 (= e!360942 e!360941)))

(assert (=> b!631333 (= c!71895 (validKeyInArray!0 (select (arr!18281 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89131 (not res!408275)) b!631330))

(assert (= (and b!631330 res!408273) b!631329))

(assert (= (and b!631330 res!408274) b!631333))

(assert (= (and b!631333 c!71895) b!631332))

(assert (= (and b!631333 (not c!71895)) b!631331))

(assert (= (or b!631332 b!631331) bm!33310))

(assert (=> b!631329 m!605665))

(assert (=> b!631329 m!605665))

(declare-fun m!605747 () Bool)

(assert (=> b!631329 m!605747))

(assert (=> b!631330 m!605665))

(assert (=> b!631330 m!605665))

(assert (=> b!631330 m!605725))

(assert (=> bm!33310 m!605665))

(declare-fun m!605749 () Bool)

(assert (=> bm!33310 m!605749))

(assert (=> b!631333 m!605665))

(assert (=> b!631333 m!605665))

(assert (=> b!631333 m!605725))

(assert (=> b!631100 d!89131))

(declare-fun e!360947 () SeekEntryResult!6718)

(declare-fun b!631338 () Bool)

(assert (=> b!631338 (= e!360947 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291467 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18281 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631339 () Bool)

(assert (=> b!631339 (= e!360947 (MissingVacant!6718 vacantSpotIndex!68))))

(declare-fun b!631340 () Bool)

(declare-fun c!71899 () Bool)

(declare-fun lt!291578 () (_ BitVec 64))

(assert (=> b!631340 (= c!71899 (= lt!291578 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360946 () SeekEntryResult!6718)

(assert (=> b!631340 (= e!360946 e!360947)))

(declare-fun b!631341 () Bool)

(declare-fun e!360945 () SeekEntryResult!6718)

(assert (=> b!631341 (= e!360945 e!360946)))

(declare-fun c!71898 () Bool)

(assert (=> b!631341 (= c!71898 (= lt!291578 (select (arr!18281 a!2986) j!136)))))

(declare-fun b!631342 () Bool)

(assert (=> b!631342 (= e!360945 Undefined!6718)))

(declare-fun lt!291577 () SeekEntryResult!6718)

(declare-fun d!89143 () Bool)

(assert (=> d!89143 (and (or ((_ is Undefined!6718) lt!291577) (not ((_ is Found!6718) lt!291577)) (and (bvsge (index!29163 lt!291577) #b00000000000000000000000000000000) (bvslt (index!29163 lt!291577) (size!18646 a!2986)))) (or ((_ is Undefined!6718) lt!291577) ((_ is Found!6718) lt!291577) (not ((_ is MissingVacant!6718) lt!291577)) (not (= (index!29165 lt!291577) vacantSpotIndex!68)) (and (bvsge (index!29165 lt!291577) #b00000000000000000000000000000000) (bvslt (index!29165 lt!291577) (size!18646 a!2986)))) (or ((_ is Undefined!6718) lt!291577) (ite ((_ is Found!6718) lt!291577) (= (select (arr!18281 a!2986) (index!29163 lt!291577)) (select (arr!18281 a!2986) j!136)) (and ((_ is MissingVacant!6718) lt!291577) (= (index!29165 lt!291577) vacantSpotIndex!68) (= (select (arr!18281 a!2986) (index!29165 lt!291577)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89143 (= lt!291577 e!360945)))

(declare-fun c!71900 () Bool)

(assert (=> d!89143 (= c!71900 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89143 (= lt!291578 (select (arr!18281 a!2986) lt!291467))))

(assert (=> d!89143 (validMask!0 mask!3053)))

(assert (=> d!89143 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291467 vacantSpotIndex!68 (select (arr!18281 a!2986) j!136) a!2986 mask!3053) lt!291577)))

(declare-fun b!631343 () Bool)

(assert (=> b!631343 (= e!360946 (Found!6718 lt!291467))))

(assert (= (and d!89143 c!71900) b!631342))

(assert (= (and d!89143 (not c!71900)) b!631341))

(assert (= (and b!631341 c!71898) b!631343))

(assert (= (and b!631341 (not c!71898)) b!631340))

(assert (= (and b!631340 c!71899) b!631339))

(assert (= (and b!631340 (not c!71899)) b!631338))

(declare-fun m!605751 () Bool)

(assert (=> b!631338 m!605751))

(assert (=> b!631338 m!605751))

(assert (=> b!631338 m!605545))

(declare-fun m!605753 () Bool)

(assert (=> b!631338 m!605753))

(declare-fun m!605755 () Bool)

(assert (=> d!89143 m!605755))

(declare-fun m!605757 () Bool)

(assert (=> d!89143 m!605757))

(declare-fun m!605759 () Bool)

(assert (=> d!89143 m!605759))

(assert (=> d!89143 m!605563))

(assert (=> b!631099 d!89143))

(declare-fun d!89145 () Bool)

(declare-fun lt!291581 () (_ BitVec 32))

(assert (=> d!89145 (and (bvsge lt!291581 #b00000000000000000000000000000000) (bvslt lt!291581 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89145 (= lt!291581 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89145 (validMask!0 mask!3053)))

(assert (=> d!89145 (= (nextIndex!0 index!984 x!910 mask!3053) lt!291581)))

(declare-fun bs!18998 () Bool)

(assert (= bs!18998 d!89145))

(declare-fun m!605761 () Bool)

(assert (=> bs!18998 m!605761))

(assert (=> bs!18998 m!605563))

(assert (=> b!631099 d!89145))

(declare-fun d!89147 () Bool)

(declare-fun e!360972 () Bool)

(assert (=> d!89147 e!360972))

(declare-fun res!408287 () Bool)

(assert (=> d!89147 (=> (not res!408287) (not e!360972))))

(assert (=> d!89147 (= res!408287 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18646 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18646 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18646 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18646 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18646 a!2986))))))

(declare-fun lt!291600 () Unit!21200)

(declare-fun choose!9 (array!38094 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21200)

(assert (=> d!89147 (= lt!291600 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291467 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89147 (validMask!0 mask!3053)))

(assert (=> d!89147 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291467 vacantSpotIndex!68 mask!3053) lt!291600)))

(declare-fun b!631381 () Bool)

(assert (=> b!631381 (= e!360972 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291467 vacantSpotIndex!68 (select (arr!18281 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291467 vacantSpotIndex!68 (select (store (arr!18281 a!2986) i!1108 k0!1786) j!136) (array!38095 (store (arr!18281 a!2986) i!1108 k0!1786) (size!18646 a!2986)) mask!3053)))))

(assert (= (and d!89147 res!408287) b!631381))

(declare-fun m!605791 () Bool)

(assert (=> d!89147 m!605791))

(assert (=> d!89147 m!605563))

(assert (=> b!631381 m!605557))

(assert (=> b!631381 m!605545))

(assert (=> b!631381 m!605577))

(declare-fun m!605793 () Bool)

(assert (=> b!631381 m!605793))

(assert (=> b!631381 m!605545))

(assert (=> b!631381 m!605579))

(assert (=> b!631381 m!605577))

(assert (=> b!631099 d!89147))

(declare-fun b!631382 () Bool)

(declare-fun e!360975 () SeekEntryResult!6718)

(assert (=> b!631382 (= e!360975 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!291465 lt!291472 mask!3053))))

(declare-fun b!631383 () Bool)

(assert (=> b!631383 (= e!360975 (MissingVacant!6718 vacantSpotIndex!68))))

(declare-fun b!631384 () Bool)

(declare-fun c!71915 () Bool)

(declare-fun lt!291602 () (_ BitVec 64))

(assert (=> b!631384 (= c!71915 (= lt!291602 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360974 () SeekEntryResult!6718)

(assert (=> b!631384 (= e!360974 e!360975)))

(declare-fun b!631385 () Bool)

(declare-fun e!360973 () SeekEntryResult!6718)

(assert (=> b!631385 (= e!360973 e!360974)))

(declare-fun c!71914 () Bool)

(assert (=> b!631385 (= c!71914 (= lt!291602 lt!291465))))

(declare-fun b!631386 () Bool)

(assert (=> b!631386 (= e!360973 Undefined!6718)))

(declare-fun lt!291601 () SeekEntryResult!6718)

(declare-fun d!89159 () Bool)

(assert (=> d!89159 (and (or ((_ is Undefined!6718) lt!291601) (not ((_ is Found!6718) lt!291601)) (and (bvsge (index!29163 lt!291601) #b00000000000000000000000000000000) (bvslt (index!29163 lt!291601) (size!18646 lt!291472)))) (or ((_ is Undefined!6718) lt!291601) ((_ is Found!6718) lt!291601) (not ((_ is MissingVacant!6718) lt!291601)) (not (= (index!29165 lt!291601) vacantSpotIndex!68)) (and (bvsge (index!29165 lt!291601) #b00000000000000000000000000000000) (bvslt (index!29165 lt!291601) (size!18646 lt!291472)))) (or ((_ is Undefined!6718) lt!291601) (ite ((_ is Found!6718) lt!291601) (= (select (arr!18281 lt!291472) (index!29163 lt!291601)) lt!291465) (and ((_ is MissingVacant!6718) lt!291601) (= (index!29165 lt!291601) vacantSpotIndex!68) (= (select (arr!18281 lt!291472) (index!29165 lt!291601)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89159 (= lt!291601 e!360973)))

(declare-fun c!71916 () Bool)

(assert (=> d!89159 (= c!71916 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89159 (= lt!291602 (select (arr!18281 lt!291472) index!984))))

(assert (=> d!89159 (validMask!0 mask!3053)))

(assert (=> d!89159 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291465 lt!291472 mask!3053) lt!291601)))

(declare-fun b!631387 () Bool)

(assert (=> b!631387 (= e!360974 (Found!6718 index!984))))

(assert (= (and d!89159 c!71916) b!631386))

(assert (= (and d!89159 (not c!71916)) b!631385))

(assert (= (and b!631385 c!71914) b!631387))

(assert (= (and b!631385 (not c!71914)) b!631384))

(assert (= (and b!631384 c!71915) b!631383))

(assert (= (and b!631384 (not c!71915)) b!631382))

(assert (=> b!631382 m!605567))

(assert (=> b!631382 m!605567))

(declare-fun m!605795 () Bool)

(assert (=> b!631382 m!605795))

(declare-fun m!605797 () Bool)

(assert (=> d!89159 m!605797))

(declare-fun m!605799 () Bool)

(assert (=> d!89159 m!605799))

(declare-fun m!605801 () Bool)

(assert (=> d!89159 m!605801))

(assert (=> d!89159 m!605563))

(assert (=> b!631099 d!89159))

(declare-fun b!631388 () Bool)

(declare-fun e!360978 () SeekEntryResult!6718)

(assert (=> b!631388 (= e!360978 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291467 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!291465 lt!291472 mask!3053))))

(declare-fun b!631389 () Bool)

(assert (=> b!631389 (= e!360978 (MissingVacant!6718 vacantSpotIndex!68))))

(declare-fun b!631390 () Bool)

(declare-fun c!71918 () Bool)

(declare-fun lt!291604 () (_ BitVec 64))

(assert (=> b!631390 (= c!71918 (= lt!291604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360977 () SeekEntryResult!6718)

(assert (=> b!631390 (= e!360977 e!360978)))

(declare-fun b!631391 () Bool)

(declare-fun e!360976 () SeekEntryResult!6718)

(assert (=> b!631391 (= e!360976 e!360977)))

(declare-fun c!71917 () Bool)

(assert (=> b!631391 (= c!71917 (= lt!291604 lt!291465))))

(declare-fun b!631392 () Bool)

(assert (=> b!631392 (= e!360976 Undefined!6718)))

(declare-fun d!89161 () Bool)

(declare-fun lt!291603 () SeekEntryResult!6718)

(assert (=> d!89161 (and (or ((_ is Undefined!6718) lt!291603) (not ((_ is Found!6718) lt!291603)) (and (bvsge (index!29163 lt!291603) #b00000000000000000000000000000000) (bvslt (index!29163 lt!291603) (size!18646 lt!291472)))) (or ((_ is Undefined!6718) lt!291603) ((_ is Found!6718) lt!291603) (not ((_ is MissingVacant!6718) lt!291603)) (not (= (index!29165 lt!291603) vacantSpotIndex!68)) (and (bvsge (index!29165 lt!291603) #b00000000000000000000000000000000) (bvslt (index!29165 lt!291603) (size!18646 lt!291472)))) (or ((_ is Undefined!6718) lt!291603) (ite ((_ is Found!6718) lt!291603) (= (select (arr!18281 lt!291472) (index!29163 lt!291603)) lt!291465) (and ((_ is MissingVacant!6718) lt!291603) (= (index!29165 lt!291603) vacantSpotIndex!68) (= (select (arr!18281 lt!291472) (index!29165 lt!291603)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89161 (= lt!291603 e!360976)))

(declare-fun c!71919 () Bool)

(assert (=> d!89161 (= c!71919 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89161 (= lt!291604 (select (arr!18281 lt!291472) lt!291467))))

(assert (=> d!89161 (validMask!0 mask!3053)))

(assert (=> d!89161 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291467 vacantSpotIndex!68 lt!291465 lt!291472 mask!3053) lt!291603)))

(declare-fun b!631393 () Bool)

(assert (=> b!631393 (= e!360977 (Found!6718 lt!291467))))

(assert (= (and d!89161 c!71919) b!631392))

(assert (= (and d!89161 (not c!71919)) b!631391))

(assert (= (and b!631391 c!71917) b!631393))

(assert (= (and b!631391 (not c!71917)) b!631390))

(assert (= (and b!631390 c!71918) b!631389))

(assert (= (and b!631390 (not c!71918)) b!631388))

(assert (=> b!631388 m!605751))

(assert (=> b!631388 m!605751))

(declare-fun m!605803 () Bool)

(assert (=> b!631388 m!605803))

(declare-fun m!605805 () Bool)

(assert (=> d!89161 m!605805))

(declare-fun m!605807 () Bool)

(assert (=> d!89161 m!605807))

(declare-fun m!605809 () Bool)

(assert (=> d!89161 m!605809))

(assert (=> d!89161 m!605563))

(assert (=> b!631099 d!89161))

(declare-fun d!89163 () Bool)

(assert (=> d!89163 (= (validKeyInArray!0 (select (arr!18281 a!2986) j!136)) (and (not (= (select (arr!18281 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18281 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!631110 d!89163))

(declare-fun d!89165 () Bool)

(assert (=> d!89165 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57006 d!89165))

(declare-fun d!89171 () Bool)

(assert (=> d!89171 (= (array_inv!14164 a!2986) (bvsge (size!18646 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57006 d!89171))

(check-sat (not d!89159) (not d!89109) (not b!631303) (not b!631201) (not d!89143) (not d!89161) (not b!631214) (not bm!33310) (not b!631330) (not b!631338) (not d!89145) (not d!89147) (not b!631333) (not b!631388) (not d!89107) (not b!631277) (not b!631329) (not b!631381) (not bm!33307) (not b!631306) (not b!631382))
(check-sat)
