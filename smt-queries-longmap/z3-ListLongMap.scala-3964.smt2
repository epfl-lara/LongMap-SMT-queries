; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53796 () Bool)

(assert start!53796)

(declare-fun b!587098 () Bool)

(declare-fun res!374919 () Bool)

(declare-fun e!335444 () Bool)

(assert (=> b!587098 (=> (not res!374919) (not e!335444))))

(declare-datatypes ((array!36697 0))(
  ( (array!36698 (arr!17623 (Array (_ BitVec 32) (_ BitVec 64))) (size!17987 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36697)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587098 (= res!374919 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587099 () Bool)

(declare-fun res!374921 () Bool)

(assert (=> b!587099 (=> (not res!374921) (not e!335444))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587099 (= res!374921 (validKeyInArray!0 (select (arr!17623 a!2986) j!136)))))

(declare-fun b!587100 () Bool)

(declare-fun res!374914 () Bool)

(assert (=> b!587100 (=> (not res!374914) (not e!335444))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587100 (= res!374914 (and (= (size!17987 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17987 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17987 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587101 () Bool)

(declare-fun res!374916 () Bool)

(declare-fun e!335443 () Bool)

(assert (=> b!587101 (=> (not res!374916) (not e!335443))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587101 (= res!374916 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17623 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17623 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587103 () Bool)

(declare-fun res!374923 () Bool)

(assert (=> b!587103 (=> (not res!374923) (not e!335443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36697 (_ BitVec 32)) Bool)

(assert (=> b!587103 (= res!374923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587104 () Bool)

(declare-fun res!374918 () Bool)

(assert (=> b!587104 (=> (not res!374918) (not e!335444))))

(assert (=> b!587104 (= res!374918 (validKeyInArray!0 k0!1786))))

(declare-fun b!587105 () Bool)

(declare-fun res!374915 () Bool)

(assert (=> b!587105 (=> (not res!374915) (not e!335443))))

(declare-datatypes ((List!11664 0))(
  ( (Nil!11661) (Cons!11660 (h!12705 (_ BitVec 64)) (t!17892 List!11664)) )
))
(declare-fun arrayNoDuplicates!0 (array!36697 (_ BitVec 32) List!11664) Bool)

(assert (=> b!587105 (= res!374915 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11661))))

(declare-fun b!587106 () Bool)

(assert (=> b!587106 (= e!335444 e!335443)))

(declare-fun res!374924 () Bool)

(assert (=> b!587106 (=> (not res!374924) (not e!335443))))

(declare-datatypes ((SeekEntryResult!6063 0))(
  ( (MissingZero!6063 (index!26479 (_ BitVec 32))) (Found!6063 (index!26480 (_ BitVec 32))) (Intermediate!6063 (undefined!6875 Bool) (index!26481 (_ BitVec 32)) (x!55284 (_ BitVec 32))) (Undefined!6063) (MissingVacant!6063 (index!26482 (_ BitVec 32))) )
))
(declare-fun lt!266273 () SeekEntryResult!6063)

(assert (=> b!587106 (= res!374924 (or (= lt!266273 (MissingZero!6063 i!1108)) (= lt!266273 (MissingVacant!6063 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36697 (_ BitVec 32)) SeekEntryResult!6063)

(assert (=> b!587106 (= lt!266273 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!374920 () Bool)

(assert (=> start!53796 (=> (not res!374920) (not e!335444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53796 (= res!374920 (validMask!0 mask!3053))))

(assert (=> start!53796 e!335444))

(assert (=> start!53796 true))

(declare-fun array_inv!13419 (array!36697) Bool)

(assert (=> start!53796 (array_inv!13419 a!2986)))

(declare-fun b!587102 () Bool)

(declare-fun res!374922 () Bool)

(assert (=> b!587102 (=> (not res!374922) (not e!335443))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36697 (_ BitVec 32)) SeekEntryResult!6063)

(assert (=> b!587102 (= res!374922 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17623 a!2986) j!136) a!2986 mask!3053) (Found!6063 j!136)))))

(declare-fun b!587107 () Bool)

(declare-fun lt!266274 () (_ BitVec 32))

(assert (=> b!587107 (= e!335443 (not (or (bvslt mask!3053 #b00000000000000000000000000000000) (and (bvsge lt!266274 #b00000000000000000000000000000000) (bvslt lt!266274 (bvadd #b00000000000000000000000000000001 mask!3053))))))))

(assert (=> b!587107 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266274 vacantSpotIndex!68 (select (arr!17623 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266274 vacantSpotIndex!68 (select (store (arr!17623 a!2986) i!1108 k0!1786) j!136) (array!36698 (store (arr!17623 a!2986) i!1108 k0!1786) (size!17987 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18246 0))(
  ( (Unit!18247) )
))
(declare-fun lt!266275 () Unit!18246)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18246)

(assert (=> b!587107 (= lt!266275 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266274 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587107 (= lt!266274 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587108 () Bool)

(declare-fun res!374917 () Bool)

(assert (=> b!587108 (=> (not res!374917) (not e!335443))))

(assert (=> b!587108 (= res!374917 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17623 a!2986) index!984) (select (arr!17623 a!2986) j!136))) (not (= (select (arr!17623 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53796 res!374920) b!587100))

(assert (= (and b!587100 res!374914) b!587099))

(assert (= (and b!587099 res!374921) b!587104))

(assert (= (and b!587104 res!374918) b!587098))

(assert (= (and b!587098 res!374919) b!587106))

(assert (= (and b!587106 res!374924) b!587103))

(assert (= (and b!587103 res!374923) b!587105))

(assert (= (and b!587105 res!374915) b!587101))

(assert (= (and b!587101 res!374916) b!587102))

(assert (= (and b!587102 res!374922) b!587108))

(assert (= (and b!587108 res!374917) b!587107))

(declare-fun m!565557 () Bool)

(assert (=> b!587099 m!565557))

(assert (=> b!587099 m!565557))

(declare-fun m!565559 () Bool)

(assert (=> b!587099 m!565559))

(declare-fun m!565561 () Bool)

(assert (=> b!587103 m!565561))

(declare-fun m!565563 () Bool)

(assert (=> b!587106 m!565563))

(declare-fun m!565565 () Bool)

(assert (=> b!587105 m!565565))

(declare-fun m!565567 () Bool)

(assert (=> b!587107 m!565567))

(declare-fun m!565569 () Bool)

(assert (=> b!587107 m!565569))

(assert (=> b!587107 m!565557))

(assert (=> b!587107 m!565569))

(declare-fun m!565571 () Bool)

(assert (=> b!587107 m!565571))

(declare-fun m!565573 () Bool)

(assert (=> b!587107 m!565573))

(assert (=> b!587107 m!565557))

(declare-fun m!565575 () Bool)

(assert (=> b!587107 m!565575))

(declare-fun m!565577 () Bool)

(assert (=> b!587107 m!565577))

(declare-fun m!565579 () Bool)

(assert (=> start!53796 m!565579))

(declare-fun m!565581 () Bool)

(assert (=> start!53796 m!565581))

(declare-fun m!565583 () Bool)

(assert (=> b!587098 m!565583))

(declare-fun m!565585 () Bool)

(assert (=> b!587104 m!565585))

(declare-fun m!565587 () Bool)

(assert (=> b!587108 m!565587))

(assert (=> b!587108 m!565557))

(declare-fun m!565589 () Bool)

(assert (=> b!587101 m!565589))

(assert (=> b!587101 m!565577))

(declare-fun m!565591 () Bool)

(assert (=> b!587101 m!565591))

(assert (=> b!587102 m!565557))

(assert (=> b!587102 m!565557))

(declare-fun m!565593 () Bool)

(assert (=> b!587102 m!565593))

(check-sat (not b!587105) (not b!587102) (not b!587106) (not b!587099) (not b!587104) (not b!587103) (not b!587107) (not b!587098) (not start!53796))
(check-sat)
(get-model)

(declare-fun bm!32777 () Bool)

(declare-fun call!32780 () Bool)

(declare-fun c!66461 () Bool)

(assert (=> bm!32777 (= call!32780 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66461 (Cons!11660 (select (arr!17623 a!2986) #b00000000000000000000000000000000) Nil!11661) Nil!11661)))))

(declare-fun b!587152 () Bool)

(declare-fun e!335464 () Bool)

(declare-fun e!335466 () Bool)

(assert (=> b!587152 (= e!335464 e!335466)))

(assert (=> b!587152 (= c!66461 (validKeyInArray!0 (select (arr!17623 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!587153 () Bool)

(assert (=> b!587153 (= e!335466 call!32780)))

(declare-fun d!85903 () Bool)

(declare-fun res!374964 () Bool)

(declare-fun e!335465 () Bool)

(assert (=> d!85903 (=> res!374964 e!335465)))

(assert (=> d!85903 (= res!374964 (bvsge #b00000000000000000000000000000000 (size!17987 a!2986)))))

(assert (=> d!85903 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11661) e!335465)))

(declare-fun b!587154 () Bool)

(assert (=> b!587154 (= e!335466 call!32780)))

(declare-fun b!587155 () Bool)

(declare-fun e!335463 () Bool)

(declare-fun contains!2905 (List!11664 (_ BitVec 64)) Bool)

(assert (=> b!587155 (= e!335463 (contains!2905 Nil!11661 (select (arr!17623 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!587156 () Bool)

(assert (=> b!587156 (= e!335465 e!335464)))

(declare-fun res!374965 () Bool)

(assert (=> b!587156 (=> (not res!374965) (not e!335464))))

(assert (=> b!587156 (= res!374965 (not e!335463))))

(declare-fun res!374966 () Bool)

(assert (=> b!587156 (=> (not res!374966) (not e!335463))))

(assert (=> b!587156 (= res!374966 (validKeyInArray!0 (select (arr!17623 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!85903 (not res!374964)) b!587156))

(assert (= (and b!587156 res!374966) b!587155))

(assert (= (and b!587156 res!374965) b!587152))

(assert (= (and b!587152 c!66461) b!587153))

(assert (= (and b!587152 (not c!66461)) b!587154))

(assert (= (or b!587153 b!587154) bm!32777))

(declare-fun m!565633 () Bool)

(assert (=> bm!32777 m!565633))

(declare-fun m!565635 () Bool)

(assert (=> bm!32777 m!565635))

(assert (=> b!587152 m!565633))

(assert (=> b!587152 m!565633))

(declare-fun m!565637 () Bool)

(assert (=> b!587152 m!565637))

(assert (=> b!587155 m!565633))

(assert (=> b!587155 m!565633))

(declare-fun m!565639 () Bool)

(assert (=> b!587155 m!565639))

(assert (=> b!587156 m!565633))

(assert (=> b!587156 m!565633))

(assert (=> b!587156 m!565637))

(assert (=> b!587105 d!85903))

(declare-fun b!587170 () Bool)

(declare-fun e!335473 () SeekEntryResult!6063)

(declare-fun lt!266292 () SeekEntryResult!6063)

(assert (=> b!587170 (= e!335473 (Found!6063 (index!26481 lt!266292)))))

(declare-fun b!587171 () Bool)

(declare-fun e!335474 () SeekEntryResult!6063)

(assert (=> b!587171 (= e!335474 Undefined!6063)))

(declare-fun b!587172 () Bool)

(declare-fun e!335475 () SeekEntryResult!6063)

(assert (=> b!587172 (= e!335475 (seekKeyOrZeroReturnVacant!0 (x!55284 lt!266292) (index!26481 lt!266292) (index!26481 lt!266292) k0!1786 a!2986 mask!3053))))

(declare-fun b!587173 () Bool)

(assert (=> b!587173 (= e!335474 e!335473)))

(declare-fun lt!266291 () (_ BitVec 64))

(assert (=> b!587173 (= lt!266291 (select (arr!17623 a!2986) (index!26481 lt!266292)))))

(declare-fun c!66469 () Bool)

(assert (=> b!587173 (= c!66469 (= lt!266291 k0!1786))))

(declare-fun b!587174 () Bool)

(assert (=> b!587174 (= e!335475 (MissingZero!6063 (index!26481 lt!266292)))))

(declare-fun b!587169 () Bool)

(declare-fun c!66470 () Bool)

(assert (=> b!587169 (= c!66470 (= lt!266291 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!587169 (= e!335473 e!335475)))

(declare-fun d!85905 () Bool)

(declare-fun lt!266293 () SeekEntryResult!6063)

(get-info :version)

(assert (=> d!85905 (and (or ((_ is Undefined!6063) lt!266293) (not ((_ is Found!6063) lt!266293)) (and (bvsge (index!26480 lt!266293) #b00000000000000000000000000000000) (bvslt (index!26480 lt!266293) (size!17987 a!2986)))) (or ((_ is Undefined!6063) lt!266293) ((_ is Found!6063) lt!266293) (not ((_ is MissingZero!6063) lt!266293)) (and (bvsge (index!26479 lt!266293) #b00000000000000000000000000000000) (bvslt (index!26479 lt!266293) (size!17987 a!2986)))) (or ((_ is Undefined!6063) lt!266293) ((_ is Found!6063) lt!266293) ((_ is MissingZero!6063) lt!266293) (not ((_ is MissingVacant!6063) lt!266293)) (and (bvsge (index!26482 lt!266293) #b00000000000000000000000000000000) (bvslt (index!26482 lt!266293) (size!17987 a!2986)))) (or ((_ is Undefined!6063) lt!266293) (ite ((_ is Found!6063) lt!266293) (= (select (arr!17623 a!2986) (index!26480 lt!266293)) k0!1786) (ite ((_ is MissingZero!6063) lt!266293) (= (select (arr!17623 a!2986) (index!26479 lt!266293)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6063) lt!266293) (= (select (arr!17623 a!2986) (index!26482 lt!266293)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85905 (= lt!266293 e!335474)))

(declare-fun c!66468 () Bool)

(assert (=> d!85905 (= c!66468 (and ((_ is Intermediate!6063) lt!266292) (undefined!6875 lt!266292)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36697 (_ BitVec 32)) SeekEntryResult!6063)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85905 (= lt!266292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!85905 (validMask!0 mask!3053)))

(assert (=> d!85905 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!266293)))

(assert (= (and d!85905 c!66468) b!587171))

(assert (= (and d!85905 (not c!66468)) b!587173))

(assert (= (and b!587173 c!66469) b!587170))

(assert (= (and b!587173 (not c!66469)) b!587169))

(assert (= (and b!587169 c!66470) b!587174))

(assert (= (and b!587169 (not c!66470)) b!587172))

(declare-fun m!565641 () Bool)

(assert (=> b!587172 m!565641))

(declare-fun m!565643 () Bool)

(assert (=> b!587173 m!565643))

(declare-fun m!565645 () Bool)

(assert (=> d!85905 m!565645))

(assert (=> d!85905 m!565579))

(declare-fun m!565647 () Bool)

(assert (=> d!85905 m!565647))

(declare-fun m!565649 () Bool)

(assert (=> d!85905 m!565649))

(assert (=> d!85905 m!565649))

(declare-fun m!565651 () Bool)

(assert (=> d!85905 m!565651))

(declare-fun m!565653 () Bool)

(assert (=> d!85905 m!565653))

(assert (=> b!587106 d!85905))

(declare-fun b!587205 () Bool)

(declare-fun e!335493 () SeekEntryResult!6063)

(assert (=> b!587205 (= e!335493 (Found!6063 lt!266274))))

(declare-fun b!587206 () Bool)

(declare-fun e!335491 () SeekEntryResult!6063)

(assert (=> b!587206 (= e!335491 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!266274 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17623 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587207 () Bool)

(declare-fun e!335492 () SeekEntryResult!6063)

(assert (=> b!587207 (= e!335492 e!335493)))

(declare-fun lt!266308 () (_ BitVec 64))

(declare-fun c!66487 () Bool)

(assert (=> b!587207 (= c!66487 (= lt!266308 (select (arr!17623 a!2986) j!136)))))

(declare-fun b!587208 () Bool)

(declare-fun c!66488 () Bool)

(assert (=> b!587208 (= c!66488 (= lt!266308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!587208 (= e!335493 e!335491)))

(declare-fun lt!266307 () SeekEntryResult!6063)

(declare-fun d!85911 () Bool)

(assert (=> d!85911 (and (or ((_ is Undefined!6063) lt!266307) (not ((_ is Found!6063) lt!266307)) (and (bvsge (index!26480 lt!266307) #b00000000000000000000000000000000) (bvslt (index!26480 lt!266307) (size!17987 a!2986)))) (or ((_ is Undefined!6063) lt!266307) ((_ is Found!6063) lt!266307) (not ((_ is MissingVacant!6063) lt!266307)) (not (= (index!26482 lt!266307) vacantSpotIndex!68)) (and (bvsge (index!26482 lt!266307) #b00000000000000000000000000000000) (bvslt (index!26482 lt!266307) (size!17987 a!2986)))) (or ((_ is Undefined!6063) lt!266307) (ite ((_ is Found!6063) lt!266307) (= (select (arr!17623 a!2986) (index!26480 lt!266307)) (select (arr!17623 a!2986) j!136)) (and ((_ is MissingVacant!6063) lt!266307) (= (index!26482 lt!266307) vacantSpotIndex!68) (= (select (arr!17623 a!2986) (index!26482 lt!266307)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85911 (= lt!266307 e!335492)))

(declare-fun c!66486 () Bool)

(assert (=> d!85911 (= c!66486 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!85911 (= lt!266308 (select (arr!17623 a!2986) lt!266274))))

(assert (=> d!85911 (validMask!0 mask!3053)))

(assert (=> d!85911 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266274 vacantSpotIndex!68 (select (arr!17623 a!2986) j!136) a!2986 mask!3053) lt!266307)))

(declare-fun b!587209 () Bool)

(assert (=> b!587209 (= e!335491 (MissingVacant!6063 vacantSpotIndex!68))))

(declare-fun b!587210 () Bool)

(assert (=> b!587210 (= e!335492 Undefined!6063)))

(assert (= (and d!85911 c!66486) b!587210))

(assert (= (and d!85911 (not c!66486)) b!587207))

(assert (= (and b!587207 c!66487) b!587205))

(assert (= (and b!587207 (not c!66487)) b!587208))

(assert (= (and b!587208 c!66488) b!587209))

(assert (= (and b!587208 (not c!66488)) b!587206))

(declare-fun m!565669 () Bool)

(assert (=> b!587206 m!565669))

(assert (=> b!587206 m!565669))

(assert (=> b!587206 m!565557))

(declare-fun m!565671 () Bool)

(assert (=> b!587206 m!565671))

(declare-fun m!565673 () Bool)

(assert (=> d!85911 m!565673))

(declare-fun m!565675 () Bool)

(assert (=> d!85911 m!565675))

(declare-fun m!565677 () Bool)

(assert (=> d!85911 m!565677))

(assert (=> d!85911 m!565579))

(assert (=> b!587107 d!85911))

(declare-fun b!587211 () Bool)

(declare-fun e!335496 () SeekEntryResult!6063)

(assert (=> b!587211 (= e!335496 (Found!6063 lt!266274))))

(declare-fun b!587212 () Bool)

(declare-fun e!335494 () SeekEntryResult!6063)

(assert (=> b!587212 (= e!335494 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!266274 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (store (arr!17623 a!2986) i!1108 k0!1786) j!136) (array!36698 (store (arr!17623 a!2986) i!1108 k0!1786) (size!17987 a!2986)) mask!3053))))

(declare-fun b!587213 () Bool)

(declare-fun e!335495 () SeekEntryResult!6063)

(assert (=> b!587213 (= e!335495 e!335496)))

(declare-fun c!66490 () Bool)

(declare-fun lt!266310 () (_ BitVec 64))

(assert (=> b!587213 (= c!66490 (= lt!266310 (select (store (arr!17623 a!2986) i!1108 k0!1786) j!136)))))

(declare-fun b!587214 () Bool)

(declare-fun c!66491 () Bool)

(assert (=> b!587214 (= c!66491 (= lt!266310 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!587214 (= e!335496 e!335494)))

(declare-fun lt!266309 () SeekEntryResult!6063)

(declare-fun d!85919 () Bool)

(assert (=> d!85919 (and (or ((_ is Undefined!6063) lt!266309) (not ((_ is Found!6063) lt!266309)) (and (bvsge (index!26480 lt!266309) #b00000000000000000000000000000000) (bvslt (index!26480 lt!266309) (size!17987 (array!36698 (store (arr!17623 a!2986) i!1108 k0!1786) (size!17987 a!2986)))))) (or ((_ is Undefined!6063) lt!266309) ((_ is Found!6063) lt!266309) (not ((_ is MissingVacant!6063) lt!266309)) (not (= (index!26482 lt!266309) vacantSpotIndex!68)) (and (bvsge (index!26482 lt!266309) #b00000000000000000000000000000000) (bvslt (index!26482 lt!266309) (size!17987 (array!36698 (store (arr!17623 a!2986) i!1108 k0!1786) (size!17987 a!2986)))))) (or ((_ is Undefined!6063) lt!266309) (ite ((_ is Found!6063) lt!266309) (= (select (arr!17623 (array!36698 (store (arr!17623 a!2986) i!1108 k0!1786) (size!17987 a!2986))) (index!26480 lt!266309)) (select (store (arr!17623 a!2986) i!1108 k0!1786) j!136)) (and ((_ is MissingVacant!6063) lt!266309) (= (index!26482 lt!266309) vacantSpotIndex!68) (= (select (arr!17623 (array!36698 (store (arr!17623 a!2986) i!1108 k0!1786) (size!17987 a!2986))) (index!26482 lt!266309)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85919 (= lt!266309 e!335495)))

(declare-fun c!66489 () Bool)

(assert (=> d!85919 (= c!66489 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!85919 (= lt!266310 (select (arr!17623 (array!36698 (store (arr!17623 a!2986) i!1108 k0!1786) (size!17987 a!2986))) lt!266274))))

(assert (=> d!85919 (validMask!0 mask!3053)))

(assert (=> d!85919 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266274 vacantSpotIndex!68 (select (store (arr!17623 a!2986) i!1108 k0!1786) j!136) (array!36698 (store (arr!17623 a!2986) i!1108 k0!1786) (size!17987 a!2986)) mask!3053) lt!266309)))

(declare-fun b!587215 () Bool)

(assert (=> b!587215 (= e!335494 (MissingVacant!6063 vacantSpotIndex!68))))

(declare-fun b!587216 () Bool)

(assert (=> b!587216 (= e!335495 Undefined!6063)))

(assert (= (and d!85919 c!66489) b!587216))

(assert (= (and d!85919 (not c!66489)) b!587213))

(assert (= (and b!587213 c!66490) b!587211))

(assert (= (and b!587213 (not c!66490)) b!587214))

(assert (= (and b!587214 c!66491) b!587215))

(assert (= (and b!587214 (not c!66491)) b!587212))

(assert (=> b!587212 m!565669))

(assert (=> b!587212 m!565669))

(assert (=> b!587212 m!565569))

(declare-fun m!565679 () Bool)

(assert (=> b!587212 m!565679))

(declare-fun m!565681 () Bool)

(assert (=> d!85919 m!565681))

(declare-fun m!565683 () Bool)

(assert (=> d!85919 m!565683))

(declare-fun m!565685 () Bool)

(assert (=> d!85919 m!565685))

(assert (=> d!85919 m!565579))

(assert (=> b!587107 d!85919))

(declare-fun d!85921 () Bool)

(declare-fun e!335511 () Bool)

(assert (=> d!85921 e!335511))

(declare-fun res!374969 () Bool)

(assert (=> d!85921 (=> (not res!374969) (not e!335511))))

(assert (=> d!85921 (= res!374969 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!17987 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17987 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!17987 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17987 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17987 a!2986))))))

(declare-fun lt!266321 () Unit!18246)

(declare-fun choose!9 (array!36697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18246)

(assert (=> d!85921 (= lt!266321 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266274 vacantSpotIndex!68 mask!3053))))

(assert (=> d!85921 (validMask!0 mask!3053)))

(assert (=> d!85921 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266274 vacantSpotIndex!68 mask!3053) lt!266321)))

(declare-fun b!587243 () Bool)

(assert (=> b!587243 (= e!335511 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266274 vacantSpotIndex!68 (select (arr!17623 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266274 vacantSpotIndex!68 (select (store (arr!17623 a!2986) i!1108 k0!1786) j!136) (array!36698 (store (arr!17623 a!2986) i!1108 k0!1786) (size!17987 a!2986)) mask!3053)))))

(assert (= (and d!85921 res!374969) b!587243))

(declare-fun m!565705 () Bool)

(assert (=> d!85921 m!565705))

(assert (=> d!85921 m!565579))

(assert (=> b!587243 m!565557))

(assert (=> b!587243 m!565577))

(assert (=> b!587243 m!565569))

(assert (=> b!587243 m!565569))

(assert (=> b!587243 m!565571))

(assert (=> b!587243 m!565557))

(assert (=> b!587243 m!565575))

(assert (=> b!587107 d!85921))

(declare-fun d!85931 () Bool)

(declare-fun lt!266324 () (_ BitVec 32))

(assert (=> d!85931 (and (bvsge lt!266324 #b00000000000000000000000000000000) (bvslt lt!266324 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85931 (= lt!266324 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!85931 (validMask!0 mask!3053)))

(assert (=> d!85931 (= (nextIndex!0 index!984 x!910 mask!3053) lt!266324)))

(declare-fun bs!18175 () Bool)

(assert (= bs!18175 d!85931))

(declare-fun m!565707 () Bool)

(assert (=> bs!18175 m!565707))

(assert (=> bs!18175 m!565579))

(assert (=> b!587107 d!85931))

(declare-fun b!587244 () Bool)

(declare-fun e!335514 () SeekEntryResult!6063)

(assert (=> b!587244 (= e!335514 (Found!6063 index!984))))

(declare-fun b!587245 () Bool)

(declare-fun e!335512 () SeekEntryResult!6063)

(assert (=> b!587245 (= e!335512 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17623 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587246 () Bool)

(declare-fun e!335513 () SeekEntryResult!6063)

(assert (=> b!587246 (= e!335513 e!335514)))

(declare-fun lt!266326 () (_ BitVec 64))

(declare-fun c!66505 () Bool)

(assert (=> b!587246 (= c!66505 (= lt!266326 (select (arr!17623 a!2986) j!136)))))

(declare-fun b!587247 () Bool)

(declare-fun c!66506 () Bool)

(assert (=> b!587247 (= c!66506 (= lt!266326 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!587247 (= e!335514 e!335512)))

(declare-fun d!85933 () Bool)

(declare-fun lt!266325 () SeekEntryResult!6063)

(assert (=> d!85933 (and (or ((_ is Undefined!6063) lt!266325) (not ((_ is Found!6063) lt!266325)) (and (bvsge (index!26480 lt!266325) #b00000000000000000000000000000000) (bvslt (index!26480 lt!266325) (size!17987 a!2986)))) (or ((_ is Undefined!6063) lt!266325) ((_ is Found!6063) lt!266325) (not ((_ is MissingVacant!6063) lt!266325)) (not (= (index!26482 lt!266325) vacantSpotIndex!68)) (and (bvsge (index!26482 lt!266325) #b00000000000000000000000000000000) (bvslt (index!26482 lt!266325) (size!17987 a!2986)))) (or ((_ is Undefined!6063) lt!266325) (ite ((_ is Found!6063) lt!266325) (= (select (arr!17623 a!2986) (index!26480 lt!266325)) (select (arr!17623 a!2986) j!136)) (and ((_ is MissingVacant!6063) lt!266325) (= (index!26482 lt!266325) vacantSpotIndex!68) (= (select (arr!17623 a!2986) (index!26482 lt!266325)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85933 (= lt!266325 e!335513)))

(declare-fun c!66504 () Bool)

(assert (=> d!85933 (= c!66504 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!85933 (= lt!266326 (select (arr!17623 a!2986) index!984))))

(assert (=> d!85933 (validMask!0 mask!3053)))

(assert (=> d!85933 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17623 a!2986) j!136) a!2986 mask!3053) lt!266325)))

(declare-fun b!587248 () Bool)

(assert (=> b!587248 (= e!335512 (MissingVacant!6063 vacantSpotIndex!68))))

(declare-fun b!587249 () Bool)

(assert (=> b!587249 (= e!335513 Undefined!6063)))

(assert (= (and d!85933 c!66504) b!587249))

(assert (= (and d!85933 (not c!66504)) b!587246))

(assert (= (and b!587246 c!66505) b!587244))

(assert (= (and b!587246 (not c!66505)) b!587247))

(assert (= (and b!587247 c!66506) b!587248))

(assert (= (and b!587247 (not c!66506)) b!587245))

(assert (=> b!587245 m!565567))

(assert (=> b!587245 m!565567))

(assert (=> b!587245 m!565557))

(declare-fun m!565709 () Bool)

(assert (=> b!587245 m!565709))

(declare-fun m!565711 () Bool)

(assert (=> d!85933 m!565711))

(declare-fun m!565713 () Bool)

(assert (=> d!85933 m!565713))

(assert (=> d!85933 m!565587))

(assert (=> d!85933 m!565579))

(assert (=> b!587102 d!85933))

(declare-fun bm!32780 () Bool)

(declare-fun call!32783 () Bool)

(assert (=> bm!32780 (= call!32783 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!587295 () Bool)

(declare-fun e!335545 () Bool)

(declare-fun e!335546 () Bool)

(assert (=> b!587295 (= e!335545 e!335546)))

(declare-fun lt!266347 () (_ BitVec 64))

(assert (=> b!587295 (= lt!266347 (select (arr!17623 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!266348 () Unit!18246)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36697 (_ BitVec 64) (_ BitVec 32)) Unit!18246)

(assert (=> b!587295 (= lt!266348 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!266347 #b00000000000000000000000000000000))))

(assert (=> b!587295 (arrayContainsKey!0 a!2986 lt!266347 #b00000000000000000000000000000000)))

(declare-fun lt!266349 () Unit!18246)

(assert (=> b!587295 (= lt!266349 lt!266348)))

(declare-fun res!374984 () Bool)

(assert (=> b!587295 (= res!374984 (= (seekEntryOrOpen!0 (select (arr!17623 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6063 #b00000000000000000000000000000000)))))

(assert (=> b!587295 (=> (not res!374984) (not e!335546))))

(declare-fun d!85935 () Bool)

(declare-fun res!374983 () Bool)

(declare-fun e!335544 () Bool)

(assert (=> d!85935 (=> res!374983 e!335544)))

(assert (=> d!85935 (= res!374983 (bvsge #b00000000000000000000000000000000 (size!17987 a!2986)))))

(assert (=> d!85935 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!335544)))

(declare-fun b!587296 () Bool)

(assert (=> b!587296 (= e!335544 e!335545)))

(declare-fun c!66523 () Bool)

(assert (=> b!587296 (= c!66523 (validKeyInArray!0 (select (arr!17623 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!587297 () Bool)

(assert (=> b!587297 (= e!335546 call!32783)))

(declare-fun b!587298 () Bool)

(assert (=> b!587298 (= e!335545 call!32783)))

(assert (= (and d!85935 (not res!374983)) b!587296))

(assert (= (and b!587296 c!66523) b!587295))

(assert (= (and b!587296 (not c!66523)) b!587298))

(assert (= (and b!587295 res!374984) b!587297))

(assert (= (or b!587297 b!587298) bm!32780))

(declare-fun m!565737 () Bool)

(assert (=> bm!32780 m!565737))

(assert (=> b!587295 m!565633))

(declare-fun m!565739 () Bool)

(assert (=> b!587295 m!565739))

(declare-fun m!565741 () Bool)

(assert (=> b!587295 m!565741))

(assert (=> b!587295 m!565633))

(declare-fun m!565743 () Bool)

(assert (=> b!587295 m!565743))

(assert (=> b!587296 m!565633))

(assert (=> b!587296 m!565633))

(assert (=> b!587296 m!565637))

(assert (=> b!587103 d!85935))

(declare-fun d!85945 () Bool)

(declare-fun res!374992 () Bool)

(declare-fun e!335555 () Bool)

(assert (=> d!85945 (=> res!374992 e!335555)))

(assert (=> d!85945 (= res!374992 (= (select (arr!17623 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!85945 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!335555)))

(declare-fun b!587308 () Bool)

(declare-fun e!335556 () Bool)

(assert (=> b!587308 (= e!335555 e!335556)))

(declare-fun res!374993 () Bool)

(assert (=> b!587308 (=> (not res!374993) (not e!335556))))

(assert (=> b!587308 (= res!374993 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17987 a!2986)))))

(declare-fun b!587309 () Bool)

(assert (=> b!587309 (= e!335556 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85945 (not res!374992)) b!587308))

(assert (= (and b!587308 res!374993) b!587309))

(assert (=> d!85945 m!565633))

(declare-fun m!565753 () Bool)

(assert (=> b!587309 m!565753))

(assert (=> b!587098 d!85945))

(declare-fun d!85949 () Bool)

(assert (=> d!85949 (= (validKeyInArray!0 (select (arr!17623 a!2986) j!136)) (and (not (= (select (arr!17623 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17623 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!587099 d!85949))

(declare-fun d!85951 () Bool)

(assert (=> d!85951 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!587104 d!85951))

(declare-fun d!85953 () Bool)

(assert (=> d!85953 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53796 d!85953))

(declare-fun d!85957 () Bool)

(assert (=> d!85957 (= (array_inv!13419 a!2986) (bvsge (size!17987 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53796 d!85957))

(check-sat (not d!85905) (not b!587206) (not d!85921) (not b!587172) (not b!587296) (not d!85933) (not b!587309) (not b!587155) (not d!85919) (not d!85911) (not b!587243) (not b!587152) (not b!587245) (not b!587156) (not b!587295) (not d!85931) (not b!587212) (not bm!32777) (not bm!32780))
(check-sat)
