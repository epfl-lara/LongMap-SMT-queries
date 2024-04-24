; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57660 () Bool)

(assert start!57660)

(declare-fun b!637077 () Bool)

(declare-fun e!364518 () Bool)

(declare-fun e!364517 () Bool)

(assert (=> b!637077 (= e!364518 e!364517)))

(declare-fun res!412100 () Bool)

(assert (=> b!637077 (=> res!412100 e!364517)))

(declare-fun lt!294571 () (_ BitVec 64))

(declare-fun lt!294575 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38244 0))(
  ( (array!38245 (arr!18343 (Array (_ BitVec 32) (_ BitVec 64))) (size!18707 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38244)

(assert (=> b!637077 (= res!412100 (or (not (= (select (arr!18343 a!2986) j!136) lt!294571)) (not (= (select (arr!18343 a!2986) j!136) lt!294575)) (bvsge j!136 index!984)))))

(declare-fun b!637078 () Bool)

(declare-fun e!364520 () Bool)

(declare-fun e!364512 () Bool)

(assert (=> b!637078 (= e!364520 e!364512)))

(declare-fun res!412110 () Bool)

(assert (=> b!637078 (=> (not res!412110) (not e!364512))))

(declare-datatypes ((SeekEntryResult!6739 0))(
  ( (MissingZero!6739 (index!29267 (_ BitVec 32))) (Found!6739 (index!29268 (_ BitVec 32))) (Intermediate!6739 (undefined!7551 Bool) (index!29269 (_ BitVec 32)) (x!58175 (_ BitVec 32))) (Undefined!6739) (MissingVacant!6739 (index!29270 (_ BitVec 32))) )
))
(declare-fun lt!294572 () SeekEntryResult!6739)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!637078 (= res!412110 (or (= lt!294572 (MissingZero!6739 i!1108)) (= lt!294572 (MissingVacant!6739 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38244 (_ BitVec 32)) SeekEntryResult!6739)

(assert (=> b!637078 (= lt!294572 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!637079 () Bool)

(declare-fun res!412097 () Bool)

(assert (=> b!637079 (=> (not res!412097) (not e!364520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637079 (= res!412097 (validKeyInArray!0 k0!1786))))

(declare-fun b!637080 () Bool)

(declare-fun e!364515 () Bool)

(declare-fun e!364521 () Bool)

(assert (=> b!637080 (= e!364515 e!364521)))

(declare-fun res!412103 () Bool)

(assert (=> b!637080 (=> res!412103 e!364521)))

(assert (=> b!637080 (= res!412103 (or (not (= (select (arr!18343 a!2986) j!136) lt!294571)) (not (= (select (arr!18343 a!2986) j!136) lt!294575)) (bvsge j!136 index!984)))))

(assert (=> b!637080 e!364518))

(declare-fun res!412099 () Bool)

(assert (=> b!637080 (=> (not res!412099) (not e!364518))))

(assert (=> b!637080 (= res!412099 (= lt!294575 (select (arr!18343 a!2986) j!136)))))

(assert (=> b!637080 (= lt!294575 (select (store (arr!18343 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!637081 () Bool)

(declare-fun e!364519 () Bool)

(assert (=> b!637081 (= e!364521 e!364519)))

(declare-fun res!412105 () Bool)

(assert (=> b!637081 (=> res!412105 e!364519)))

(assert (=> b!637081 (= res!412105 (or (bvsge (size!18707 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18707 a!2986))))))

(declare-fun lt!294573 () array!38244)

(declare-fun arrayContainsKey!0 (array!38244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637081 (arrayContainsKey!0 lt!294573 (select (arr!18343 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!21465 0))(
  ( (Unit!21466) )
))
(declare-fun lt!294570 () Unit!21465)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38244 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21465)

(assert (=> b!637081 (= lt!294570 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294573 (select (arr!18343 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637082 () Bool)

(declare-fun res!412094 () Bool)

(assert (=> b!637082 (=> (not res!412094) (not e!364512))))

(declare-datatypes ((List!12291 0))(
  ( (Nil!12288) (Cons!12287 (h!13335 (_ BitVec 64)) (t!18511 List!12291)) )
))
(declare-fun arrayNoDuplicates!0 (array!38244 (_ BitVec 32) List!12291) Bool)

(assert (=> b!637082 (= res!412094 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12288))))

(declare-fun b!637083 () Bool)

(declare-fun res!412098 () Bool)

(assert (=> b!637083 (=> (not res!412098) (not e!364512))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!637083 (= res!412098 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18343 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!364510 () Bool)

(declare-fun b!637084 () Bool)

(assert (=> b!637084 (= e!364510 (arrayContainsKey!0 lt!294573 (select (arr!18343 a!2986) j!136) index!984))))

(declare-fun b!637085 () Bool)

(declare-fun res!412101 () Bool)

(assert (=> b!637085 (=> res!412101 e!364519)))

(declare-fun noDuplicate!385 (List!12291) Bool)

(assert (=> b!637085 (= res!412101 (not (noDuplicate!385 Nil!12288)))))

(declare-fun b!637086 () Bool)

(declare-fun res!412104 () Bool)

(assert (=> b!637086 (=> (not res!412104) (not e!364520))))

(assert (=> b!637086 (= res!412104 (and (= (size!18707 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18707 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18707 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637087 () Bool)

(declare-fun e!364509 () Unit!21465)

(declare-fun Unit!21467 () Unit!21465)

(assert (=> b!637087 (= e!364509 Unit!21467)))

(assert (=> b!637087 false))

(declare-fun b!637088 () Bool)

(declare-fun res!412106 () Bool)

(assert (=> b!637088 (=> (not res!412106) (not e!364520))))

(assert (=> b!637088 (= res!412106 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637090 () Bool)

(declare-fun e!364514 () Bool)

(assert (=> b!637090 (= e!364512 e!364514)))

(declare-fun res!412107 () Bool)

(assert (=> b!637090 (=> (not res!412107) (not e!364514))))

(assert (=> b!637090 (= res!412107 (= (select (store (arr!18343 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637090 (= lt!294573 (array!38245 (store (arr!18343 a!2986) i!1108 k0!1786) (size!18707 a!2986)))))

(declare-fun b!637091 () Bool)

(declare-fun res!412114 () Bool)

(assert (=> b!637091 (=> (not res!412114) (not e!364520))))

(assert (=> b!637091 (= res!412114 (validKeyInArray!0 (select (arr!18343 a!2986) j!136)))))

(declare-fun b!637092 () Bool)

(assert (=> b!637092 (= e!364517 e!364510)))

(declare-fun res!412095 () Bool)

(assert (=> b!637092 (=> (not res!412095) (not e!364510))))

(assert (=> b!637092 (= res!412095 (arrayContainsKey!0 lt!294573 (select (arr!18343 a!2986) j!136) j!136))))

(declare-fun b!637093 () Bool)

(declare-fun res!412108 () Bool)

(assert (=> b!637093 (=> res!412108 e!364519)))

(declare-fun contains!3083 (List!12291 (_ BitVec 64)) Bool)

(assert (=> b!637093 (= res!412108 (contains!3083 Nil!12288 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637094 () Bool)

(declare-fun res!412102 () Bool)

(assert (=> b!637094 (=> res!412102 e!364519)))

(assert (=> b!637094 (= res!412102 (contains!3083 Nil!12288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637095 () Bool)

(declare-fun Unit!21468 () Unit!21465)

(assert (=> b!637095 (= e!364509 Unit!21468)))

(declare-fun res!412109 () Bool)

(assert (=> start!57660 (=> (not res!412109) (not e!364520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57660 (= res!412109 (validMask!0 mask!3053))))

(assert (=> start!57660 e!364520))

(assert (=> start!57660 true))

(declare-fun array_inv!14202 (array!38244) Bool)

(assert (=> start!57660 (array_inv!14202 a!2986)))

(declare-fun b!637089 () Bool)

(declare-fun e!364516 () Bool)

(declare-fun lt!294578 () SeekEntryResult!6739)

(declare-fun lt!294577 () SeekEntryResult!6739)

(assert (=> b!637089 (= e!364516 (= lt!294578 lt!294577))))

(declare-fun b!637096 () Bool)

(declare-fun e!364513 () Bool)

(assert (=> b!637096 (= e!364514 e!364513)))

(declare-fun res!412096 () Bool)

(assert (=> b!637096 (=> (not res!412096) (not e!364513))))

(assert (=> b!637096 (= res!412096 (and (= lt!294578 (Found!6739 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18343 a!2986) index!984) (select (arr!18343 a!2986) j!136))) (not (= (select (arr!18343 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38244 (_ BitVec 32)) SeekEntryResult!6739)

(assert (=> b!637096 (= lt!294578 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637097 () Bool)

(declare-fun res!412112 () Bool)

(assert (=> b!637097 (=> (not res!412112) (not e!364512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38244 (_ BitVec 32)) Bool)

(assert (=> b!637097 (= res!412112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637098 () Bool)

(assert (=> b!637098 (= e!364519 (not (contains!3083 Nil!12288 k0!1786)))))

(declare-fun b!637099 () Bool)

(assert (=> b!637099 (= e!364513 (not e!364515))))

(declare-fun res!412113 () Bool)

(assert (=> b!637099 (=> res!412113 e!364515)))

(declare-fun lt!294579 () SeekEntryResult!6739)

(assert (=> b!637099 (= res!412113 (not (= lt!294579 (Found!6739 index!984))))))

(declare-fun lt!294576 () Unit!21465)

(assert (=> b!637099 (= lt!294576 e!364509)))

(declare-fun c!72860 () Bool)

(assert (=> b!637099 (= c!72860 (= lt!294579 Undefined!6739))))

(assert (=> b!637099 (= lt!294579 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294571 lt!294573 mask!3053))))

(assert (=> b!637099 e!364516))

(declare-fun res!412111 () Bool)

(assert (=> b!637099 (=> (not res!412111) (not e!364516))))

(declare-fun lt!294574 () (_ BitVec 32))

(assert (=> b!637099 (= res!412111 (= lt!294577 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294574 vacantSpotIndex!68 lt!294571 lt!294573 mask!3053)))))

(assert (=> b!637099 (= lt!294577 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294574 vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637099 (= lt!294571 (select (store (arr!18343 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294580 () Unit!21465)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38244 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21465)

(assert (=> b!637099 (= lt!294580 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294574 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637099 (= lt!294574 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (= (and start!57660 res!412109) b!637086))

(assert (= (and b!637086 res!412104) b!637091))

(assert (= (and b!637091 res!412114) b!637079))

(assert (= (and b!637079 res!412097) b!637088))

(assert (= (and b!637088 res!412106) b!637078))

(assert (= (and b!637078 res!412110) b!637097))

(assert (= (and b!637097 res!412112) b!637082))

(assert (= (and b!637082 res!412094) b!637083))

(assert (= (and b!637083 res!412098) b!637090))

(assert (= (and b!637090 res!412107) b!637096))

(assert (= (and b!637096 res!412096) b!637099))

(assert (= (and b!637099 res!412111) b!637089))

(assert (= (and b!637099 c!72860) b!637087))

(assert (= (and b!637099 (not c!72860)) b!637095))

(assert (= (and b!637099 (not res!412113)) b!637080))

(assert (= (and b!637080 res!412099) b!637077))

(assert (= (and b!637077 (not res!412100)) b!637092))

(assert (= (and b!637092 res!412095) b!637084))

(assert (= (and b!637080 (not res!412103)) b!637081))

(assert (= (and b!637081 (not res!412105)) b!637085))

(assert (= (and b!637085 (not res!412101)) b!637094))

(assert (= (and b!637094 (not res!412102)) b!637093))

(assert (= (and b!637093 (not res!412108)) b!637098))

(declare-fun m!611593 () Bool)

(assert (=> b!637098 m!611593))

(declare-fun m!611595 () Bool)

(assert (=> b!637083 m!611595))

(declare-fun m!611597 () Bool)

(assert (=> b!637088 m!611597))

(declare-fun m!611599 () Bool)

(assert (=> b!637085 m!611599))

(declare-fun m!611601 () Bool)

(assert (=> b!637077 m!611601))

(declare-fun m!611603 () Bool)

(assert (=> b!637078 m!611603))

(assert (=> b!637091 m!611601))

(assert (=> b!637091 m!611601))

(declare-fun m!611605 () Bool)

(assert (=> b!637091 m!611605))

(declare-fun m!611607 () Bool)

(assert (=> b!637094 m!611607))

(declare-fun m!611609 () Bool)

(assert (=> start!57660 m!611609))

(declare-fun m!611611 () Bool)

(assert (=> start!57660 m!611611))

(declare-fun m!611613 () Bool)

(assert (=> b!637082 m!611613))

(assert (=> b!637081 m!611601))

(assert (=> b!637081 m!611601))

(declare-fun m!611615 () Bool)

(assert (=> b!637081 m!611615))

(assert (=> b!637081 m!611601))

(declare-fun m!611617 () Bool)

(assert (=> b!637081 m!611617))

(assert (=> b!637080 m!611601))

(declare-fun m!611619 () Bool)

(assert (=> b!637080 m!611619))

(declare-fun m!611621 () Bool)

(assert (=> b!637080 m!611621))

(declare-fun m!611623 () Bool)

(assert (=> b!637093 m!611623))

(assert (=> b!637090 m!611619))

(declare-fun m!611625 () Bool)

(assert (=> b!637090 m!611625))

(declare-fun m!611627 () Bool)

(assert (=> b!637097 m!611627))

(declare-fun m!611629 () Bool)

(assert (=> b!637096 m!611629))

(assert (=> b!637096 m!611601))

(assert (=> b!637096 m!611601))

(declare-fun m!611631 () Bool)

(assert (=> b!637096 m!611631))

(assert (=> b!637092 m!611601))

(assert (=> b!637092 m!611601))

(declare-fun m!611633 () Bool)

(assert (=> b!637092 m!611633))

(assert (=> b!637084 m!611601))

(assert (=> b!637084 m!611601))

(declare-fun m!611635 () Bool)

(assert (=> b!637084 m!611635))

(declare-fun m!611637 () Bool)

(assert (=> b!637079 m!611637))

(declare-fun m!611639 () Bool)

(assert (=> b!637099 m!611639))

(declare-fun m!611641 () Bool)

(assert (=> b!637099 m!611641))

(assert (=> b!637099 m!611601))

(assert (=> b!637099 m!611619))

(declare-fun m!611643 () Bool)

(assert (=> b!637099 m!611643))

(declare-fun m!611645 () Bool)

(assert (=> b!637099 m!611645))

(assert (=> b!637099 m!611601))

(declare-fun m!611647 () Bool)

(assert (=> b!637099 m!611647))

(declare-fun m!611649 () Bool)

(assert (=> b!637099 m!611649))

(check-sat (not b!637078) (not b!637084) (not b!637082) (not b!637088) (not b!637085) (not start!57660) (not b!637094) (not b!637092) (not b!637099) (not b!637079) (not b!637091) (not b!637081) (not b!637096) (not b!637097) (not b!637093) (not b!637098))
(check-sat)
(get-model)

(declare-fun b!637248 () Bool)

(declare-fun e!364609 () Bool)

(declare-fun e!364610 () Bool)

(assert (=> b!637248 (= e!364609 e!364610)))

(declare-fun c!72869 () Bool)

(assert (=> b!637248 (= c!72869 (validKeyInArray!0 (select (arr!18343 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!637249 () Bool)

(declare-fun call!33459 () Bool)

(assert (=> b!637249 (= e!364610 call!33459)))

(declare-fun b!637250 () Bool)

(assert (=> b!637250 (= e!364610 call!33459)))

(declare-fun d!90189 () Bool)

(declare-fun res!412248 () Bool)

(declare-fun e!364611 () Bool)

(assert (=> d!90189 (=> res!412248 e!364611)))

(assert (=> d!90189 (= res!412248 (bvsge #b00000000000000000000000000000000 (size!18707 a!2986)))))

(assert (=> d!90189 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12288) e!364611)))

(declare-fun b!637251 () Bool)

(assert (=> b!637251 (= e!364611 e!364609)))

(declare-fun res!412249 () Bool)

(assert (=> b!637251 (=> (not res!412249) (not e!364609))))

(declare-fun e!364608 () Bool)

(assert (=> b!637251 (= res!412249 (not e!364608))))

(declare-fun res!412247 () Bool)

(assert (=> b!637251 (=> (not res!412247) (not e!364608))))

(assert (=> b!637251 (= res!412247 (validKeyInArray!0 (select (arr!18343 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33456 () Bool)

(assert (=> bm!33456 (= call!33459 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72869 (Cons!12287 (select (arr!18343 a!2986) #b00000000000000000000000000000000) Nil!12288) Nil!12288)))))

(declare-fun b!637252 () Bool)

(assert (=> b!637252 (= e!364608 (contains!3083 Nil!12288 (select (arr!18343 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90189 (not res!412248)) b!637251))

(assert (= (and b!637251 res!412247) b!637252))

(assert (= (and b!637251 res!412249) b!637248))

(assert (= (and b!637248 c!72869) b!637249))

(assert (= (and b!637248 (not c!72869)) b!637250))

(assert (= (or b!637249 b!637250) bm!33456))

(declare-fun m!611767 () Bool)

(assert (=> b!637248 m!611767))

(assert (=> b!637248 m!611767))

(declare-fun m!611769 () Bool)

(assert (=> b!637248 m!611769))

(assert (=> b!637251 m!611767))

(assert (=> b!637251 m!611767))

(assert (=> b!637251 m!611769))

(assert (=> bm!33456 m!611767))

(declare-fun m!611771 () Bool)

(assert (=> bm!33456 m!611771))

(assert (=> b!637252 m!611767))

(assert (=> b!637252 m!611767))

(declare-fun m!611773 () Bool)

(assert (=> b!637252 m!611773))

(assert (=> b!637082 d!90189))

(declare-fun d!90191 () Bool)

(declare-fun res!412254 () Bool)

(declare-fun e!364616 () Bool)

(assert (=> d!90191 (=> res!412254 e!364616)))

(assert (=> d!90191 (= res!412254 (= (select (arr!18343 lt!294573) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18343 a!2986) j!136)))))

(assert (=> d!90191 (= (arrayContainsKey!0 lt!294573 (select (arr!18343 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!364616)))

(declare-fun b!637257 () Bool)

(declare-fun e!364617 () Bool)

(assert (=> b!637257 (= e!364616 e!364617)))

(declare-fun res!412255 () Bool)

(assert (=> b!637257 (=> (not res!412255) (not e!364617))))

(assert (=> b!637257 (= res!412255 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18707 lt!294573)))))

(declare-fun b!637258 () Bool)

(assert (=> b!637258 (= e!364617 (arrayContainsKey!0 lt!294573 (select (arr!18343 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90191 (not res!412254)) b!637257))

(assert (= (and b!637257 res!412255) b!637258))

(declare-fun m!611775 () Bool)

(assert (=> d!90191 m!611775))

(assert (=> b!637258 m!611601))

(declare-fun m!611777 () Bool)

(assert (=> b!637258 m!611777))

(assert (=> b!637081 d!90191))

(declare-fun d!90193 () Bool)

(assert (=> d!90193 (arrayContainsKey!0 lt!294573 (select (arr!18343 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294649 () Unit!21465)

(declare-fun choose!114 (array!38244 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21465)

(assert (=> d!90193 (= lt!294649 (choose!114 lt!294573 (select (arr!18343 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90193 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90193 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294573 (select (arr!18343 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!294649)))

(declare-fun bs!19142 () Bool)

(assert (= bs!19142 d!90193))

(assert (=> bs!19142 m!611601))

(assert (=> bs!19142 m!611615))

(assert (=> bs!19142 m!611601))

(declare-fun m!611779 () Bool)

(assert (=> bs!19142 m!611779))

(assert (=> b!637081 d!90193))

(declare-fun d!90195 () Bool)

(declare-fun res!412256 () Bool)

(declare-fun e!364618 () Bool)

(assert (=> d!90195 (=> res!412256 e!364618)))

(assert (=> d!90195 (= res!412256 (= (select (arr!18343 lt!294573) j!136) (select (arr!18343 a!2986) j!136)))))

(assert (=> d!90195 (= (arrayContainsKey!0 lt!294573 (select (arr!18343 a!2986) j!136) j!136) e!364618)))

(declare-fun b!637259 () Bool)

(declare-fun e!364619 () Bool)

(assert (=> b!637259 (= e!364618 e!364619)))

(declare-fun res!412257 () Bool)

(assert (=> b!637259 (=> (not res!412257) (not e!364619))))

(assert (=> b!637259 (= res!412257 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18707 lt!294573)))))

(declare-fun b!637260 () Bool)

(assert (=> b!637260 (= e!364619 (arrayContainsKey!0 lt!294573 (select (arr!18343 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90195 (not res!412256)) b!637259))

(assert (= (and b!637259 res!412257) b!637260))

(declare-fun m!611781 () Bool)

(assert (=> d!90195 m!611781))

(assert (=> b!637260 m!611601))

(declare-fun m!611783 () Bool)

(assert (=> b!637260 m!611783))

(assert (=> b!637092 d!90195))

(declare-fun d!90197 () Bool)

(declare-fun lt!294652 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!244 (List!12291) (InoxSet (_ BitVec 64)))

(assert (=> d!90197 (= lt!294652 (select (content!244 Nil!12288) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364625 () Bool)

(assert (=> d!90197 (= lt!294652 e!364625)))

(declare-fun res!412263 () Bool)

(assert (=> d!90197 (=> (not res!412263) (not e!364625))))

(get-info :version)

(assert (=> d!90197 (= res!412263 ((_ is Cons!12287) Nil!12288))))

(assert (=> d!90197 (= (contains!3083 Nil!12288 #b0000000000000000000000000000000000000000000000000000000000000000) lt!294652)))

(declare-fun b!637265 () Bool)

(declare-fun e!364624 () Bool)

(assert (=> b!637265 (= e!364625 e!364624)))

(declare-fun res!412262 () Bool)

(assert (=> b!637265 (=> res!412262 e!364624)))

(assert (=> b!637265 (= res!412262 (= (h!13335 Nil!12288) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637266 () Bool)

(assert (=> b!637266 (= e!364624 (contains!3083 (t!18511 Nil!12288) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90197 res!412263) b!637265))

(assert (= (and b!637265 (not res!412262)) b!637266))

(declare-fun m!611785 () Bool)

(assert (=> d!90197 m!611785))

(declare-fun m!611787 () Bool)

(assert (=> d!90197 m!611787))

(declare-fun m!611789 () Bool)

(assert (=> b!637266 m!611789))

(assert (=> b!637094 d!90197))

(declare-fun d!90199 () Bool)

(declare-fun lt!294653 () Bool)

(assert (=> d!90199 (= lt!294653 (select (content!244 Nil!12288) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364627 () Bool)

(assert (=> d!90199 (= lt!294653 e!364627)))

(declare-fun res!412265 () Bool)

(assert (=> d!90199 (=> (not res!412265) (not e!364627))))

(assert (=> d!90199 (= res!412265 ((_ is Cons!12287) Nil!12288))))

(assert (=> d!90199 (= (contains!3083 Nil!12288 #b1000000000000000000000000000000000000000000000000000000000000000) lt!294653)))

(declare-fun b!637267 () Bool)

(declare-fun e!364626 () Bool)

(assert (=> b!637267 (= e!364627 e!364626)))

(declare-fun res!412264 () Bool)

(assert (=> b!637267 (=> res!412264 e!364626)))

(assert (=> b!637267 (= res!412264 (= (h!13335 Nil!12288) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637268 () Bool)

(assert (=> b!637268 (= e!364626 (contains!3083 (t!18511 Nil!12288) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90199 res!412265) b!637267))

(assert (= (and b!637267 (not res!412264)) b!637268))

(assert (=> d!90199 m!611785))

(declare-fun m!611791 () Bool)

(assert (=> d!90199 m!611791))

(declare-fun m!611793 () Bool)

(assert (=> b!637268 m!611793))

(assert (=> b!637093 d!90199))

(declare-fun d!90201 () Bool)

(assert (=> d!90201 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!637079 d!90201))

(declare-fun d!90203 () Bool)

(assert (=> d!90203 (= (validKeyInArray!0 (select (arr!18343 a!2986) j!136)) (and (not (= (select (arr!18343 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18343 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!637091 d!90203))

(declare-fun d!90205 () Bool)

(declare-fun lt!294654 () Bool)

(assert (=> d!90205 (= lt!294654 (select (content!244 Nil!12288) k0!1786))))

(declare-fun e!364629 () Bool)

(assert (=> d!90205 (= lt!294654 e!364629)))

(declare-fun res!412267 () Bool)

(assert (=> d!90205 (=> (not res!412267) (not e!364629))))

(assert (=> d!90205 (= res!412267 ((_ is Cons!12287) Nil!12288))))

(assert (=> d!90205 (= (contains!3083 Nil!12288 k0!1786) lt!294654)))

(declare-fun b!637269 () Bool)

(declare-fun e!364628 () Bool)

(assert (=> b!637269 (= e!364629 e!364628)))

(declare-fun res!412266 () Bool)

(assert (=> b!637269 (=> res!412266 e!364628)))

(assert (=> b!637269 (= res!412266 (= (h!13335 Nil!12288) k0!1786))))

(declare-fun b!637270 () Bool)

(assert (=> b!637270 (= e!364628 (contains!3083 (t!18511 Nil!12288) k0!1786))))

(assert (= (and d!90205 res!412267) b!637269))

(assert (= (and b!637269 (not res!412266)) b!637270))

(assert (=> d!90205 m!611785))

(declare-fun m!611795 () Bool)

(assert (=> d!90205 m!611795))

(declare-fun m!611797 () Bool)

(assert (=> b!637270 m!611797))

(assert (=> b!637098 d!90205))

(declare-fun d!90207 () Bool)

(declare-fun res!412273 () Bool)

(declare-fun e!364638 () Bool)

(assert (=> d!90207 (=> res!412273 e!364638)))

(assert (=> d!90207 (= res!412273 (bvsge #b00000000000000000000000000000000 (size!18707 a!2986)))))

(assert (=> d!90207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!364638)))

(declare-fun b!637279 () Bool)

(declare-fun e!364636 () Bool)

(declare-fun call!33462 () Bool)

(assert (=> b!637279 (= e!364636 call!33462)))

(declare-fun bm!33459 () Bool)

(assert (=> bm!33459 (= call!33462 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!637280 () Bool)

(declare-fun e!364637 () Bool)

(assert (=> b!637280 (= e!364636 e!364637)))

(declare-fun lt!294663 () (_ BitVec 64))

(assert (=> b!637280 (= lt!294663 (select (arr!18343 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!294662 () Unit!21465)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38244 (_ BitVec 64) (_ BitVec 32)) Unit!21465)

(assert (=> b!637280 (= lt!294662 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!294663 #b00000000000000000000000000000000))))

(assert (=> b!637280 (arrayContainsKey!0 a!2986 lt!294663 #b00000000000000000000000000000000)))

(declare-fun lt!294661 () Unit!21465)

(assert (=> b!637280 (= lt!294661 lt!294662)))

(declare-fun res!412272 () Bool)

(assert (=> b!637280 (= res!412272 (= (seekEntryOrOpen!0 (select (arr!18343 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6739 #b00000000000000000000000000000000)))))

(assert (=> b!637280 (=> (not res!412272) (not e!364637))))

(declare-fun b!637281 () Bool)

(assert (=> b!637281 (= e!364637 call!33462)))

(declare-fun b!637282 () Bool)

(assert (=> b!637282 (= e!364638 e!364636)))

(declare-fun c!72872 () Bool)

(assert (=> b!637282 (= c!72872 (validKeyInArray!0 (select (arr!18343 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90207 (not res!412273)) b!637282))

(assert (= (and b!637282 c!72872) b!637280))

(assert (= (and b!637282 (not c!72872)) b!637279))

(assert (= (and b!637280 res!412272) b!637281))

(assert (= (or b!637281 b!637279) bm!33459))

(declare-fun m!611799 () Bool)

(assert (=> bm!33459 m!611799))

(assert (=> b!637280 m!611767))

(declare-fun m!611801 () Bool)

(assert (=> b!637280 m!611801))

(declare-fun m!611803 () Bool)

(assert (=> b!637280 m!611803))

(assert (=> b!637280 m!611767))

(declare-fun m!611805 () Bool)

(assert (=> b!637280 m!611805))

(assert (=> b!637282 m!611767))

(assert (=> b!637282 m!611767))

(assert (=> b!637282 m!611769))

(assert (=> b!637097 d!90207))

(declare-fun d!90209 () Bool)

(declare-fun e!364641 () Bool)

(assert (=> d!90209 e!364641))

(declare-fun res!412276 () Bool)

(assert (=> d!90209 (=> (not res!412276) (not e!364641))))

(assert (=> d!90209 (= res!412276 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18707 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18707 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18707 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18707 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18707 a!2986))))))

(declare-fun lt!294666 () Unit!21465)

(declare-fun choose!9 (array!38244 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21465)

(assert (=> d!90209 (= lt!294666 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294574 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90209 (validMask!0 mask!3053)))

(assert (=> d!90209 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294574 vacantSpotIndex!68 mask!3053) lt!294666)))

(declare-fun b!637285 () Bool)

(assert (=> b!637285 (= e!364641 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294574 vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294574 vacantSpotIndex!68 (select (store (arr!18343 a!2986) i!1108 k0!1786) j!136) (array!38245 (store (arr!18343 a!2986) i!1108 k0!1786) (size!18707 a!2986)) mask!3053)))))

(assert (= (and d!90209 res!412276) b!637285))

(declare-fun m!611807 () Bool)

(assert (=> d!90209 m!611807))

(assert (=> d!90209 m!611609))

(assert (=> b!637285 m!611641))

(declare-fun m!611809 () Bool)

(assert (=> b!637285 m!611809))

(assert (=> b!637285 m!611641))

(assert (=> b!637285 m!611601))

(assert (=> b!637285 m!611601))

(assert (=> b!637285 m!611647))

(assert (=> b!637285 m!611619))

(assert (=> b!637099 d!90209))

(declare-fun b!637314 () Bool)

(declare-fun c!72881 () Bool)

(declare-fun lt!294679 () (_ BitVec 64))

(assert (=> b!637314 (= c!72881 (= lt!294679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364666 () SeekEntryResult!6739)

(declare-fun e!364665 () SeekEntryResult!6739)

(assert (=> b!637314 (= e!364666 e!364665)))

(declare-fun d!90211 () Bool)

(declare-fun lt!294678 () SeekEntryResult!6739)

(assert (=> d!90211 (and (or ((_ is Undefined!6739) lt!294678) (not ((_ is Found!6739) lt!294678)) (and (bvsge (index!29268 lt!294678) #b00000000000000000000000000000000) (bvslt (index!29268 lt!294678) (size!18707 lt!294573)))) (or ((_ is Undefined!6739) lt!294678) ((_ is Found!6739) lt!294678) (not ((_ is MissingVacant!6739) lt!294678)) (not (= (index!29270 lt!294678) vacantSpotIndex!68)) (and (bvsge (index!29270 lt!294678) #b00000000000000000000000000000000) (bvslt (index!29270 lt!294678) (size!18707 lt!294573)))) (or ((_ is Undefined!6739) lt!294678) (ite ((_ is Found!6739) lt!294678) (= (select (arr!18343 lt!294573) (index!29268 lt!294678)) lt!294571) (and ((_ is MissingVacant!6739) lt!294678) (= (index!29270 lt!294678) vacantSpotIndex!68) (= (select (arr!18343 lt!294573) (index!29270 lt!294678)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!364664 () SeekEntryResult!6739)

(assert (=> d!90211 (= lt!294678 e!364664)))

(declare-fun c!72879 () Bool)

(assert (=> d!90211 (= c!72879 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90211 (= lt!294679 (select (arr!18343 lt!294573) index!984))))

(assert (=> d!90211 (validMask!0 mask!3053)))

(assert (=> d!90211 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294571 lt!294573 mask!3053) lt!294678)))

(declare-fun b!637315 () Bool)

(assert (=> b!637315 (= e!364666 (Found!6739 index!984))))

(declare-fun b!637316 () Bool)

(assert (=> b!637316 (= e!364664 Undefined!6739)))

(declare-fun b!637317 () Bool)

(assert (=> b!637317 (= e!364665 (MissingVacant!6739 vacantSpotIndex!68))))

(declare-fun b!637318 () Bool)

(assert (=> b!637318 (= e!364665 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!294571 lt!294573 mask!3053))))

(declare-fun b!637319 () Bool)

(assert (=> b!637319 (= e!364664 e!364666)))

(declare-fun c!72880 () Bool)

(assert (=> b!637319 (= c!72880 (= lt!294679 lt!294571))))

(assert (= (and d!90211 c!72879) b!637316))

(assert (= (and d!90211 (not c!72879)) b!637319))

(assert (= (and b!637319 c!72880) b!637315))

(assert (= (and b!637319 (not c!72880)) b!637314))

(assert (= (and b!637314 c!72881) b!637317))

(assert (= (and b!637314 (not c!72881)) b!637318))

(declare-fun m!611831 () Bool)

(assert (=> d!90211 m!611831))

(declare-fun m!611833 () Bool)

(assert (=> d!90211 m!611833))

(declare-fun m!611835 () Bool)

(assert (=> d!90211 m!611835))

(assert (=> d!90211 m!611609))

(declare-fun m!611837 () Bool)

(assert (=> b!637318 m!611837))

(assert (=> b!637318 m!611837))

(declare-fun m!611839 () Bool)

(assert (=> b!637318 m!611839))

(assert (=> b!637099 d!90211))

(declare-fun b!637320 () Bool)

(declare-fun c!72884 () Bool)

(declare-fun lt!294681 () (_ BitVec 64))

(assert (=> b!637320 (= c!72884 (= lt!294681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364669 () SeekEntryResult!6739)

(declare-fun e!364668 () SeekEntryResult!6739)

(assert (=> b!637320 (= e!364669 e!364668)))

(declare-fun d!90227 () Bool)

(declare-fun lt!294680 () SeekEntryResult!6739)

(assert (=> d!90227 (and (or ((_ is Undefined!6739) lt!294680) (not ((_ is Found!6739) lt!294680)) (and (bvsge (index!29268 lt!294680) #b00000000000000000000000000000000) (bvslt (index!29268 lt!294680) (size!18707 a!2986)))) (or ((_ is Undefined!6739) lt!294680) ((_ is Found!6739) lt!294680) (not ((_ is MissingVacant!6739) lt!294680)) (not (= (index!29270 lt!294680) vacantSpotIndex!68)) (and (bvsge (index!29270 lt!294680) #b00000000000000000000000000000000) (bvslt (index!29270 lt!294680) (size!18707 a!2986)))) (or ((_ is Undefined!6739) lt!294680) (ite ((_ is Found!6739) lt!294680) (= (select (arr!18343 a!2986) (index!29268 lt!294680)) (select (arr!18343 a!2986) j!136)) (and ((_ is MissingVacant!6739) lt!294680) (= (index!29270 lt!294680) vacantSpotIndex!68) (= (select (arr!18343 a!2986) (index!29270 lt!294680)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!364667 () SeekEntryResult!6739)

(assert (=> d!90227 (= lt!294680 e!364667)))

(declare-fun c!72882 () Bool)

(assert (=> d!90227 (= c!72882 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90227 (= lt!294681 (select (arr!18343 a!2986) lt!294574))))

(assert (=> d!90227 (validMask!0 mask!3053)))

(assert (=> d!90227 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294574 vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053) lt!294680)))

(declare-fun b!637321 () Bool)

(assert (=> b!637321 (= e!364669 (Found!6739 lt!294574))))

(declare-fun b!637322 () Bool)

(assert (=> b!637322 (= e!364667 Undefined!6739)))

(declare-fun b!637323 () Bool)

(assert (=> b!637323 (= e!364668 (MissingVacant!6739 vacantSpotIndex!68))))

(declare-fun b!637324 () Bool)

(assert (=> b!637324 (= e!364668 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294574 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637325 () Bool)

(assert (=> b!637325 (= e!364667 e!364669)))

(declare-fun c!72883 () Bool)

(assert (=> b!637325 (= c!72883 (= lt!294681 (select (arr!18343 a!2986) j!136)))))

(assert (= (and d!90227 c!72882) b!637322))

(assert (= (and d!90227 (not c!72882)) b!637325))

(assert (= (and b!637325 c!72883) b!637321))

(assert (= (and b!637325 (not c!72883)) b!637320))

(assert (= (and b!637320 c!72884) b!637323))

(assert (= (and b!637320 (not c!72884)) b!637324))

(declare-fun m!611841 () Bool)

(assert (=> d!90227 m!611841))

(declare-fun m!611843 () Bool)

(assert (=> d!90227 m!611843))

(declare-fun m!611845 () Bool)

(assert (=> d!90227 m!611845))

(assert (=> d!90227 m!611609))

(declare-fun m!611847 () Bool)

(assert (=> b!637324 m!611847))

(assert (=> b!637324 m!611847))

(assert (=> b!637324 m!611601))

(declare-fun m!611849 () Bool)

(assert (=> b!637324 m!611849))

(assert (=> b!637099 d!90227))

(declare-fun d!90229 () Bool)

(declare-fun lt!294684 () (_ BitVec 32))

(assert (=> d!90229 (and (bvsge lt!294684 #b00000000000000000000000000000000) (bvslt lt!294684 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90229 (= lt!294684 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!90229 (validMask!0 mask!3053)))

(assert (=> d!90229 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!294684)))

(declare-fun bs!19144 () Bool)

(assert (= bs!19144 d!90229))

(declare-fun m!611851 () Bool)

(assert (=> bs!19144 m!611851))

(assert (=> bs!19144 m!611609))

(assert (=> b!637099 d!90229))

(declare-fun b!637336 () Bool)

(declare-fun c!72889 () Bool)

(declare-fun lt!294686 () (_ BitVec 64))

(assert (=> b!637336 (= c!72889 (= lt!294686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364680 () SeekEntryResult!6739)

(declare-fun e!364679 () SeekEntryResult!6739)

(assert (=> b!637336 (= e!364680 e!364679)))

(declare-fun d!90231 () Bool)

(declare-fun lt!294685 () SeekEntryResult!6739)

(assert (=> d!90231 (and (or ((_ is Undefined!6739) lt!294685) (not ((_ is Found!6739) lt!294685)) (and (bvsge (index!29268 lt!294685) #b00000000000000000000000000000000) (bvslt (index!29268 lt!294685) (size!18707 lt!294573)))) (or ((_ is Undefined!6739) lt!294685) ((_ is Found!6739) lt!294685) (not ((_ is MissingVacant!6739) lt!294685)) (not (= (index!29270 lt!294685) vacantSpotIndex!68)) (and (bvsge (index!29270 lt!294685) #b00000000000000000000000000000000) (bvslt (index!29270 lt!294685) (size!18707 lt!294573)))) (or ((_ is Undefined!6739) lt!294685) (ite ((_ is Found!6739) lt!294685) (= (select (arr!18343 lt!294573) (index!29268 lt!294685)) lt!294571) (and ((_ is MissingVacant!6739) lt!294685) (= (index!29270 lt!294685) vacantSpotIndex!68) (= (select (arr!18343 lt!294573) (index!29270 lt!294685)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!364678 () SeekEntryResult!6739)

(assert (=> d!90231 (= lt!294685 e!364678)))

(declare-fun c!72887 () Bool)

(assert (=> d!90231 (= c!72887 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90231 (= lt!294686 (select (arr!18343 lt!294573) lt!294574))))

(assert (=> d!90231 (validMask!0 mask!3053)))

(assert (=> d!90231 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294574 vacantSpotIndex!68 lt!294571 lt!294573 mask!3053) lt!294685)))

(declare-fun b!637337 () Bool)

(assert (=> b!637337 (= e!364680 (Found!6739 lt!294574))))

(declare-fun b!637338 () Bool)

(assert (=> b!637338 (= e!364678 Undefined!6739)))

(declare-fun b!637339 () Bool)

(assert (=> b!637339 (= e!364679 (MissingVacant!6739 vacantSpotIndex!68))))

(declare-fun b!637340 () Bool)

(assert (=> b!637340 (= e!364679 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294574 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!294571 lt!294573 mask!3053))))

(declare-fun b!637341 () Bool)

(assert (=> b!637341 (= e!364678 e!364680)))

(declare-fun c!72888 () Bool)

(assert (=> b!637341 (= c!72888 (= lt!294686 lt!294571))))

(assert (= (and d!90231 c!72887) b!637338))

(assert (= (and d!90231 (not c!72887)) b!637341))

(assert (= (and b!637341 c!72888) b!637337))

(assert (= (and b!637341 (not c!72888)) b!637336))

(assert (= (and b!637336 c!72889) b!637339))

(assert (= (and b!637336 (not c!72889)) b!637340))

(declare-fun m!611853 () Bool)

(assert (=> d!90231 m!611853))

(declare-fun m!611855 () Bool)

(assert (=> d!90231 m!611855))

(declare-fun m!611857 () Bool)

(assert (=> d!90231 m!611857))

(assert (=> d!90231 m!611609))

(assert (=> b!637340 m!611847))

(assert (=> b!637340 m!611847))

(declare-fun m!611859 () Bool)

(assert (=> b!637340 m!611859))

(assert (=> b!637099 d!90231))

(declare-fun d!90233 () Bool)

(declare-fun lt!294703 () SeekEntryResult!6739)

(assert (=> d!90233 (and (or ((_ is Undefined!6739) lt!294703) (not ((_ is Found!6739) lt!294703)) (and (bvsge (index!29268 lt!294703) #b00000000000000000000000000000000) (bvslt (index!29268 lt!294703) (size!18707 a!2986)))) (or ((_ is Undefined!6739) lt!294703) ((_ is Found!6739) lt!294703) (not ((_ is MissingZero!6739) lt!294703)) (and (bvsge (index!29267 lt!294703) #b00000000000000000000000000000000) (bvslt (index!29267 lt!294703) (size!18707 a!2986)))) (or ((_ is Undefined!6739) lt!294703) ((_ is Found!6739) lt!294703) ((_ is MissingZero!6739) lt!294703) (not ((_ is MissingVacant!6739) lt!294703)) (and (bvsge (index!29270 lt!294703) #b00000000000000000000000000000000) (bvslt (index!29270 lt!294703) (size!18707 a!2986)))) (or ((_ is Undefined!6739) lt!294703) (ite ((_ is Found!6739) lt!294703) (= (select (arr!18343 a!2986) (index!29268 lt!294703)) k0!1786) (ite ((_ is MissingZero!6739) lt!294703) (= (select (arr!18343 a!2986) (index!29267 lt!294703)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6739) lt!294703) (= (select (arr!18343 a!2986) (index!29270 lt!294703)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!364711 () SeekEntryResult!6739)

(assert (=> d!90233 (= lt!294703 e!364711)))

(declare-fun c!72908 () Bool)

(declare-fun lt!294702 () SeekEntryResult!6739)

(assert (=> d!90233 (= c!72908 (and ((_ is Intermediate!6739) lt!294702) (undefined!7551 lt!294702)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38244 (_ BitVec 32)) SeekEntryResult!6739)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90233 (= lt!294702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90233 (validMask!0 mask!3053)))

(assert (=> d!90233 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!294703)))

(declare-fun b!637387 () Bool)

(assert (=> b!637387 (= e!364711 Undefined!6739)))

(declare-fun b!637388 () Bool)

(declare-fun e!364710 () SeekEntryResult!6739)

(assert (=> b!637388 (= e!364711 e!364710)))

(declare-fun lt!294704 () (_ BitVec 64))

(assert (=> b!637388 (= lt!294704 (select (arr!18343 a!2986) (index!29269 lt!294702)))))

(declare-fun c!72907 () Bool)

(assert (=> b!637388 (= c!72907 (= lt!294704 k0!1786))))

(declare-fun b!637389 () Bool)

(assert (=> b!637389 (= e!364710 (Found!6739 (index!29269 lt!294702)))))

(declare-fun b!637390 () Bool)

(declare-fun c!72906 () Bool)

(assert (=> b!637390 (= c!72906 (= lt!294704 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364712 () SeekEntryResult!6739)

(assert (=> b!637390 (= e!364710 e!364712)))

(declare-fun b!637391 () Bool)

(assert (=> b!637391 (= e!364712 (MissingZero!6739 (index!29269 lt!294702)))))

(declare-fun b!637392 () Bool)

(assert (=> b!637392 (= e!364712 (seekKeyOrZeroReturnVacant!0 (x!58175 lt!294702) (index!29269 lt!294702) (index!29269 lt!294702) k0!1786 a!2986 mask!3053))))

(assert (= (and d!90233 c!72908) b!637387))

(assert (= (and d!90233 (not c!72908)) b!637388))

(assert (= (and b!637388 c!72907) b!637389))

(assert (= (and b!637388 (not c!72907)) b!637390))

(assert (= (and b!637390 c!72906) b!637391))

(assert (= (and b!637390 (not c!72906)) b!637392))

(declare-fun m!611893 () Bool)

(assert (=> d!90233 m!611893))

(declare-fun m!611895 () Bool)

(assert (=> d!90233 m!611895))

(declare-fun m!611897 () Bool)

(assert (=> d!90233 m!611897))

(declare-fun m!611899 () Bool)

(assert (=> d!90233 m!611899))

(declare-fun m!611901 () Bool)

(assert (=> d!90233 m!611901))

(assert (=> d!90233 m!611609))

(assert (=> d!90233 m!611893))

(declare-fun m!611903 () Bool)

(assert (=> b!637388 m!611903))

(declare-fun m!611905 () Bool)

(assert (=> b!637392 m!611905))

(assert (=> b!637078 d!90233))

(declare-fun d!90251 () Bool)

(declare-fun res!412314 () Bool)

(declare-fun e!364717 () Bool)

(assert (=> d!90251 (=> res!412314 e!364717)))

(assert (=> d!90251 (= res!412314 (= (select (arr!18343 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90251 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!364717)))

(declare-fun b!637399 () Bool)

(declare-fun e!364718 () Bool)

(assert (=> b!637399 (= e!364717 e!364718)))

(declare-fun res!412315 () Bool)

(assert (=> b!637399 (=> (not res!412315) (not e!364718))))

(assert (=> b!637399 (= res!412315 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18707 a!2986)))))

(declare-fun b!637400 () Bool)

(assert (=> b!637400 (= e!364718 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90251 (not res!412314)) b!637399))

(assert (= (and b!637399 res!412315) b!637400))

(assert (=> d!90251 m!611767))

(declare-fun m!611907 () Bool)

(assert (=> b!637400 m!611907))

(assert (=> b!637088 d!90251))

(declare-fun d!90253 () Bool)

(declare-fun res!412318 () Bool)

(declare-fun e!364721 () Bool)

(assert (=> d!90253 (=> res!412318 e!364721)))

(assert (=> d!90253 (= res!412318 (= (select (arr!18343 lt!294573) index!984) (select (arr!18343 a!2986) j!136)))))

(assert (=> d!90253 (= (arrayContainsKey!0 lt!294573 (select (arr!18343 a!2986) j!136) index!984) e!364721)))

(declare-fun b!637403 () Bool)

(declare-fun e!364722 () Bool)

(assert (=> b!637403 (= e!364721 e!364722)))

(declare-fun res!412319 () Bool)

(assert (=> b!637403 (=> (not res!412319) (not e!364722))))

(assert (=> b!637403 (= res!412319 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18707 lt!294573)))))

(declare-fun b!637404 () Bool)

(assert (=> b!637404 (= e!364722 (arrayContainsKey!0 lt!294573 (select (arr!18343 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90253 (not res!412318)) b!637403))

(assert (= (and b!637403 res!412319) b!637404))

(assert (=> d!90253 m!611835))

(assert (=> b!637404 m!611601))

(declare-fun m!611909 () Bool)

(assert (=> b!637404 m!611909))

(assert (=> b!637084 d!90253))

(declare-fun d!90255 () Bool)

(assert (=> d!90255 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57660 d!90255))

(declare-fun d!90263 () Bool)

(assert (=> d!90263 (= (array_inv!14202 a!2986) (bvsge (size!18707 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57660 d!90263))

(declare-fun d!90265 () Bool)

(declare-fun res!412334 () Bool)

(declare-fun e!364747 () Bool)

(assert (=> d!90265 (=> res!412334 e!364747)))

(assert (=> d!90265 (= res!412334 ((_ is Nil!12288) Nil!12288))))

(assert (=> d!90265 (= (noDuplicate!385 Nil!12288) e!364747)))

(declare-fun b!637439 () Bool)

(declare-fun e!364748 () Bool)

(assert (=> b!637439 (= e!364747 e!364748)))

(declare-fun res!412335 () Bool)

(assert (=> b!637439 (=> (not res!412335) (not e!364748))))

(assert (=> b!637439 (= res!412335 (not (contains!3083 (t!18511 Nil!12288) (h!13335 Nil!12288))))))

(declare-fun b!637440 () Bool)

(assert (=> b!637440 (= e!364748 (noDuplicate!385 (t!18511 Nil!12288)))))

(assert (= (and d!90265 (not res!412334)) b!637439))

(assert (= (and b!637439 res!412335) b!637440))

(declare-fun m!611935 () Bool)

(assert (=> b!637439 m!611935))

(declare-fun m!611937 () Bool)

(assert (=> b!637440 m!611937))

(assert (=> b!637085 d!90265))

(declare-fun b!637441 () Bool)

(declare-fun c!72923 () Bool)

(declare-fun lt!294721 () (_ BitVec 64))

(assert (=> b!637441 (= c!72923 (= lt!294721 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364751 () SeekEntryResult!6739)

(declare-fun e!364750 () SeekEntryResult!6739)

(assert (=> b!637441 (= e!364751 e!364750)))

(declare-fun lt!294720 () SeekEntryResult!6739)

(declare-fun d!90271 () Bool)

(assert (=> d!90271 (and (or ((_ is Undefined!6739) lt!294720) (not ((_ is Found!6739) lt!294720)) (and (bvsge (index!29268 lt!294720) #b00000000000000000000000000000000) (bvslt (index!29268 lt!294720) (size!18707 a!2986)))) (or ((_ is Undefined!6739) lt!294720) ((_ is Found!6739) lt!294720) (not ((_ is MissingVacant!6739) lt!294720)) (not (= (index!29270 lt!294720) vacantSpotIndex!68)) (and (bvsge (index!29270 lt!294720) #b00000000000000000000000000000000) (bvslt (index!29270 lt!294720) (size!18707 a!2986)))) (or ((_ is Undefined!6739) lt!294720) (ite ((_ is Found!6739) lt!294720) (= (select (arr!18343 a!2986) (index!29268 lt!294720)) (select (arr!18343 a!2986) j!136)) (and ((_ is MissingVacant!6739) lt!294720) (= (index!29270 lt!294720) vacantSpotIndex!68) (= (select (arr!18343 a!2986) (index!29270 lt!294720)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!364749 () SeekEntryResult!6739)

(assert (=> d!90271 (= lt!294720 e!364749)))

(declare-fun c!72921 () Bool)

(assert (=> d!90271 (= c!72921 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90271 (= lt!294721 (select (arr!18343 a!2986) index!984))))

(assert (=> d!90271 (validMask!0 mask!3053)))

(assert (=> d!90271 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053) lt!294720)))

(declare-fun b!637442 () Bool)

(assert (=> b!637442 (= e!364751 (Found!6739 index!984))))

(declare-fun b!637443 () Bool)

(assert (=> b!637443 (= e!364749 Undefined!6739)))

(declare-fun b!637444 () Bool)

(assert (=> b!637444 (= e!364750 (MissingVacant!6739 vacantSpotIndex!68))))

(declare-fun b!637445 () Bool)

(assert (=> b!637445 (= e!364750 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637446 () Bool)

(assert (=> b!637446 (= e!364749 e!364751)))

(declare-fun c!72922 () Bool)

(assert (=> b!637446 (= c!72922 (= lt!294721 (select (arr!18343 a!2986) j!136)))))

(assert (= (and d!90271 c!72921) b!637443))

(assert (= (and d!90271 (not c!72921)) b!637446))

(assert (= (and b!637446 c!72922) b!637442))

(assert (= (and b!637446 (not c!72922)) b!637441))

(assert (= (and b!637441 c!72923) b!637444))

(assert (= (and b!637441 (not c!72923)) b!637445))

(declare-fun m!611939 () Bool)

(assert (=> d!90271 m!611939))

(declare-fun m!611941 () Bool)

(assert (=> d!90271 m!611941))

(assert (=> d!90271 m!611629))

(assert (=> d!90271 m!611609))

(assert (=> b!637445 m!611837))

(assert (=> b!637445 m!611837))

(assert (=> b!637445 m!611601))

(declare-fun m!611943 () Bool)

(assert (=> b!637445 m!611943))

(assert (=> b!637096 d!90271))

(check-sat (not d!90199) (not d!90205) (not b!637318) (not b!637392) (not b!637280) (not d!90193) (not b!637285) (not d!90197) (not b!637400) (not b!637251) (not b!637270) (not b!637260) (not d!90211) (not b!637248) (not b!637282) (not b!637252) (not bm!33456) (not d!90227) (not b!637258) (not b!637404) (not b!637324) (not b!637440) (not b!637439) (not bm!33459) (not d!90233) (not b!637340) (not b!637445) (not d!90271) (not b!637266) (not b!637268) (not d!90229) (not d!90231) (not d!90209))
(check-sat)
