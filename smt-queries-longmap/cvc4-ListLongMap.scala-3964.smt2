; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53798 () Bool)

(assert start!53798)

(declare-fun b!587131 () Bool)

(declare-fun res!374949 () Bool)

(declare-fun e!335452 () Bool)

(assert (=> b!587131 (=> (not res!374949) (not e!335452))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36699 0))(
  ( (array!36700 (arr!17624 (Array (_ BitVec 32) (_ BitVec 64))) (size!17988 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36699)

(declare-datatypes ((SeekEntryResult!6064 0))(
  ( (MissingZero!6064 (index!26483 (_ BitVec 32))) (Found!6064 (index!26484 (_ BitVec 32))) (Intermediate!6064 (undefined!6876 Bool) (index!26485 (_ BitVec 32)) (x!55285 (_ BitVec 32))) (Undefined!6064) (MissingVacant!6064 (index!26486 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36699 (_ BitVec 32)) SeekEntryResult!6064)

(assert (=> b!587131 (= res!374949 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17624 a!2986) j!136) a!2986 mask!3053) (Found!6064 j!136)))))

(declare-fun b!587132 () Bool)

(declare-fun res!374954 () Bool)

(assert (=> b!587132 (=> (not res!374954) (not e!335452))))

(assert (=> b!587132 (= res!374954 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17624 a!2986) index!984) (select (arr!17624 a!2986) j!136))) (not (= (select (arr!17624 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587133 () Bool)

(declare-fun res!374950 () Bool)

(assert (=> b!587133 (=> (not res!374950) (not e!335452))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!587133 (= res!374950 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17624 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17624 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587134 () Bool)

(declare-fun res!374956 () Bool)

(declare-fun e!335453 () Bool)

(assert (=> b!587134 (=> (not res!374956) (not e!335453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587134 (= res!374956 (validKeyInArray!0 (select (arr!17624 a!2986) j!136)))))

(declare-fun b!587135 () Bool)

(assert (=> b!587135 (= e!335453 e!335452)))

(declare-fun res!374957 () Bool)

(assert (=> b!587135 (=> (not res!374957) (not e!335452))))

(declare-fun lt!266283 () SeekEntryResult!6064)

(assert (=> b!587135 (= res!374957 (or (= lt!266283 (MissingZero!6064 i!1108)) (= lt!266283 (MissingVacant!6064 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36699 (_ BitVec 32)) SeekEntryResult!6064)

(assert (=> b!587135 (= lt!266283 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587136 () Bool)

(declare-fun res!374948 () Bool)

(assert (=> b!587136 (=> (not res!374948) (not e!335453))))

(assert (=> b!587136 (= res!374948 (and (= (size!17988 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17988 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17988 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587137 () Bool)

(declare-fun res!374955 () Bool)

(assert (=> b!587137 (=> (not res!374955) (not e!335452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36699 (_ BitVec 32)) Bool)

(assert (=> b!587137 (= res!374955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587138 () Bool)

(declare-fun res!374947 () Bool)

(assert (=> b!587138 (=> (not res!374947) (not e!335453))))

(declare-fun arrayContainsKey!0 (array!36699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587138 (= res!374947 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587139 () Bool)

(declare-fun lt!266282 () (_ BitVec 32))

(assert (=> b!587139 (= e!335452 (not (or (bvslt mask!3053 #b00000000000000000000000000000000) (and (bvsge lt!266282 #b00000000000000000000000000000000) (bvslt lt!266282 (bvadd #b00000000000000000000000000000001 mask!3053))))))))

(assert (=> b!587139 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266282 vacantSpotIndex!68 (select (arr!17624 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266282 vacantSpotIndex!68 (select (store (arr!17624 a!2986) i!1108 k!1786) j!136) (array!36700 (store (arr!17624 a!2986) i!1108 k!1786) (size!17988 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18248 0))(
  ( (Unit!18249) )
))
(declare-fun lt!266284 () Unit!18248)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36699 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18248)

(assert (=> b!587139 (= lt!266284 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266282 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587139 (= lt!266282 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!374951 () Bool)

(assert (=> start!53798 (=> (not res!374951) (not e!335453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53798 (= res!374951 (validMask!0 mask!3053))))

(assert (=> start!53798 e!335453))

(assert (=> start!53798 true))

(declare-fun array_inv!13420 (array!36699) Bool)

(assert (=> start!53798 (array_inv!13420 a!2986)))

(declare-fun b!587140 () Bool)

(declare-fun res!374952 () Bool)

(assert (=> b!587140 (=> (not res!374952) (not e!335452))))

(declare-datatypes ((List!11665 0))(
  ( (Nil!11662) (Cons!11661 (h!12706 (_ BitVec 64)) (t!17893 List!11665)) )
))
(declare-fun arrayNoDuplicates!0 (array!36699 (_ BitVec 32) List!11665) Bool)

(assert (=> b!587140 (= res!374952 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11662))))

(declare-fun b!587141 () Bool)

(declare-fun res!374953 () Bool)

(assert (=> b!587141 (=> (not res!374953) (not e!335453))))

(assert (=> b!587141 (= res!374953 (validKeyInArray!0 k!1786))))

(assert (= (and start!53798 res!374951) b!587136))

(assert (= (and b!587136 res!374948) b!587134))

(assert (= (and b!587134 res!374956) b!587141))

(assert (= (and b!587141 res!374953) b!587138))

(assert (= (and b!587138 res!374947) b!587135))

(assert (= (and b!587135 res!374957) b!587137))

(assert (= (and b!587137 res!374955) b!587140))

(assert (= (and b!587140 res!374952) b!587133))

(assert (= (and b!587133 res!374950) b!587131))

(assert (= (and b!587131 res!374949) b!587132))

(assert (= (and b!587132 res!374954) b!587139))

(declare-fun m!565595 () Bool)

(assert (=> b!587135 m!565595))

(declare-fun m!565597 () Bool)

(assert (=> b!587138 m!565597))

(declare-fun m!565599 () Bool)

(assert (=> b!587139 m!565599))

(declare-fun m!565601 () Bool)

(assert (=> b!587139 m!565601))

(declare-fun m!565603 () Bool)

(assert (=> b!587139 m!565603))

(assert (=> b!587139 m!565601))

(declare-fun m!565605 () Bool)

(assert (=> b!587139 m!565605))

(declare-fun m!565607 () Bool)

(assert (=> b!587139 m!565607))

(declare-fun m!565609 () Bool)

(assert (=> b!587139 m!565609))

(assert (=> b!587139 m!565607))

(declare-fun m!565611 () Bool)

(assert (=> b!587139 m!565611))

(assert (=> b!587131 m!565601))

(assert (=> b!587131 m!565601))

(declare-fun m!565613 () Bool)

(assert (=> b!587131 m!565613))

(declare-fun m!565615 () Bool)

(assert (=> b!587140 m!565615))

(declare-fun m!565617 () Bool)

(assert (=> start!53798 m!565617))

(declare-fun m!565619 () Bool)

(assert (=> start!53798 m!565619))

(declare-fun m!565621 () Bool)

(assert (=> b!587141 m!565621))

(declare-fun m!565623 () Bool)

(assert (=> b!587133 m!565623))

(assert (=> b!587133 m!565603))

(declare-fun m!565625 () Bool)

(assert (=> b!587133 m!565625))

(declare-fun m!565627 () Bool)

(assert (=> b!587137 m!565627))

(assert (=> b!587134 m!565601))

(assert (=> b!587134 m!565601))

(declare-fun m!565629 () Bool)

(assert (=> b!587134 m!565629))

(declare-fun m!565631 () Bool)

(assert (=> b!587132 m!565631))

(assert (=> b!587132 m!565601))

(push 1)

(assert (not b!587134))

(assert (not b!587140))

(assert (not start!53798))

(assert (not b!587135))

(assert (not b!587137))

(assert (not b!587131))

(assert (not b!587139))

(assert (not b!587141))

(assert (not b!587138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85913 () Bool)

(assert (=> d!85913 (= (validKeyInArray!0 (select (arr!17624 a!2986) j!136)) (and (not (= (select (arr!17624 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17624 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!587134 d!85913))

(declare-fun b!587229 () Bool)

(declare-fun e!335503 () SeekEntryResult!6064)

(assert (=> b!587229 (= e!335503 Undefined!6064)))

(declare-fun b!587231 () Bool)

(declare-fun e!335504 () SeekEntryResult!6064)

(assert (=> b!587231 (= e!335503 e!335504)))

(declare-fun lt!266315 () (_ BitVec 64))

(declare-fun c!66499 () Bool)

(assert (=> b!587231 (= c!66499 (= lt!266315 (select (arr!17624 a!2986) j!136)))))

(declare-fun b!587232 () Bool)

(assert (=> b!587232 (= e!335504 (Found!6064 lt!266282))))

(declare-fun b!587230 () Bool)

(declare-fun e!335505 () SeekEntryResult!6064)

(assert (=> b!587230 (= e!335505 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!266282 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17624 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!85915 () Bool)

(declare-fun lt!266316 () SeekEntryResult!6064)

(assert (=> d!85915 (and (or (is-Undefined!6064 lt!266316) (not (is-Found!6064 lt!266316)) (and (bvsge (index!26484 lt!266316) #b00000000000000000000000000000000) (bvslt (index!26484 lt!266316) (size!17988 a!2986)))) (or (is-Undefined!6064 lt!266316) (is-Found!6064 lt!266316) (not (is-MissingVacant!6064 lt!266316)) (not (= (index!26486 lt!266316) vacantSpotIndex!68)) (and (bvsge (index!26486 lt!266316) #b00000000000000000000000000000000) (bvslt (index!26486 lt!266316) (size!17988 a!2986)))) (or (is-Undefined!6064 lt!266316) (ite (is-Found!6064 lt!266316) (= (select (arr!17624 a!2986) (index!26484 lt!266316)) (select (arr!17624 a!2986) j!136)) (and (is-MissingVacant!6064 lt!266316) (= (index!26486 lt!266316) vacantSpotIndex!68) (= (select (arr!17624 a!2986) (index!26486 lt!266316)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85915 (= lt!266316 e!335503)))

(declare-fun c!66500 () Bool)

(assert (=> d!85915 (= c!66500 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!85915 (= lt!266315 (select (arr!17624 a!2986) lt!266282))))

(assert (=> d!85915 (validMask!0 mask!3053)))

(assert (=> d!85915 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266282 vacantSpotIndex!68 (select (arr!17624 a!2986) j!136) a!2986 mask!3053) lt!266316)))

(declare-fun b!587233 () Bool)

(declare-fun c!66498 () Bool)

(assert (=> b!587233 (= c!66498 (= lt!266315 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!587233 (= e!335504 e!335505)))

(declare-fun b!587234 () Bool)

(assert (=> b!587234 (= e!335505 (MissingVacant!6064 vacantSpotIndex!68))))

(assert (= (and d!85915 c!66500) b!587229))

(assert (= (and d!85915 (not c!66500)) b!587231))

(assert (= (and b!587231 c!66499) b!587232))

(assert (= (and b!587231 (not c!66499)) b!587233))

(assert (= (and b!587233 c!66498) b!587234))

(assert (= (and b!587233 (not c!66498)) b!587230))

(declare-fun m!565687 () Bool)

(assert (=> b!587230 m!565687))

(assert (=> b!587230 m!565687))

(assert (=> b!587230 m!565601))

(declare-fun m!565689 () Bool)

(assert (=> b!587230 m!565689))

(declare-fun m!565691 () Bool)

(assert (=> d!85915 m!565691))

(declare-fun m!565693 () Bool)

(assert (=> d!85915 m!565693))

(declare-fun m!565695 () Bool)

(assert (=> d!85915 m!565695))

(assert (=> d!85915 m!565617))

(assert (=> b!587139 d!85915))

(declare-fun b!587235 () Bool)

(declare-fun e!335506 () SeekEntryResult!6064)

(assert (=> b!587235 (= e!335506 Undefined!6064)))

(declare-fun b!587237 () Bool)

(declare-fun e!335507 () SeekEntryResult!6064)

(assert (=> b!587237 (= e!335506 e!335507)))

(declare-fun c!66502 () Bool)

(declare-fun lt!266317 () (_ BitVec 64))

(assert (=> b!587237 (= c!66502 (= lt!266317 (select (store (arr!17624 a!2986) i!1108 k!1786) j!136)))))

(declare-fun b!587238 () Bool)

(assert (=> b!587238 (= e!335507 (Found!6064 lt!266282))))

(declare-fun b!587236 () Bool)

(declare-fun e!335508 () SeekEntryResult!6064)

(assert (=> b!587236 (= e!335508 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!266282 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (store (arr!17624 a!2986) i!1108 k!1786) j!136) (array!36700 (store (arr!17624 a!2986) i!1108 k!1786) (size!17988 a!2986)) mask!3053))))

(declare-fun lt!266318 () SeekEntryResult!6064)

(declare-fun d!85923 () Bool)

(assert (=> d!85923 (and (or (is-Undefined!6064 lt!266318) (not (is-Found!6064 lt!266318)) (and (bvsge (index!26484 lt!266318) #b00000000000000000000000000000000) (bvslt (index!26484 lt!266318) (size!17988 (array!36700 (store (arr!17624 a!2986) i!1108 k!1786) (size!17988 a!2986)))))) (or (is-Undefined!6064 lt!266318) (is-Found!6064 lt!266318) (not (is-MissingVacant!6064 lt!266318)) (not (= (index!26486 lt!266318) vacantSpotIndex!68)) (and (bvsge (index!26486 lt!266318) #b00000000000000000000000000000000) (bvslt (index!26486 lt!266318) (size!17988 (array!36700 (store (arr!17624 a!2986) i!1108 k!1786) (size!17988 a!2986)))))) (or (is-Undefined!6064 lt!266318) (ite (is-Found!6064 lt!266318) (= (select (arr!17624 (array!36700 (store (arr!17624 a!2986) i!1108 k!1786) (size!17988 a!2986))) (index!26484 lt!266318)) (select (store (arr!17624 a!2986) i!1108 k!1786) j!136)) (and (is-MissingVacant!6064 lt!266318) (= (index!26486 lt!266318) vacantSpotIndex!68) (= (select (arr!17624 (array!36700 (store (arr!17624 a!2986) i!1108 k!1786) (size!17988 a!2986))) (index!26486 lt!266318)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85923 (= lt!266318 e!335506)))

(declare-fun c!66503 () Bool)

(assert (=> d!85923 (= c!66503 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!85923 (= lt!266317 (select (arr!17624 (array!36700 (store (arr!17624 a!2986) i!1108 k!1786) (size!17988 a!2986))) lt!266282))))

(assert (=> d!85923 (validMask!0 mask!3053)))

(assert (=> d!85923 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266282 vacantSpotIndex!68 (select (store (arr!17624 a!2986) i!1108 k!1786) j!136) (array!36700 (store (arr!17624 a!2986) i!1108 k!1786) (size!17988 a!2986)) mask!3053) lt!266318)))

(declare-fun b!587239 () Bool)

(declare-fun c!66501 () Bool)

(assert (=> b!587239 (= c!66501 (= lt!266317 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!587239 (= e!335507 e!335508)))

(declare-fun b!587240 () Bool)

(assert (=> b!587240 (= e!335508 (MissingVacant!6064 vacantSpotIndex!68))))

(assert (= (and d!85923 c!66503) b!587235))

(assert (= (and d!85923 (not c!66503)) b!587237))

(assert (= (and b!587237 c!66502) b!587238))

(assert (= (and b!587237 (not c!66502)) b!587239))

(assert (= (and b!587239 c!66501) b!587240))

(assert (= (and b!587239 (not c!66501)) b!587236))

(assert (=> b!587236 m!565687))

(assert (=> b!587236 m!565687))

(assert (=> b!587236 m!565607))

(declare-fun m!565697 () Bool)

(assert (=> b!587236 m!565697))

(declare-fun m!565699 () Bool)

(assert (=> d!85923 m!565699))

(declare-fun m!565701 () Bool)

(assert (=> d!85923 m!565701))

(declare-fun m!565703 () Bool)

(assert (=> d!85923 m!565703))

(assert (=> d!85923 m!565617))

(assert (=> b!587139 d!85923))

(declare-fun d!85925 () Bool)

(declare-fun e!335523 () Bool)

(assert (=> d!85925 e!335523))

(declare-fun res!374972 () Bool)

(assert (=> d!85925 (=> (not res!374972) (not e!335523))))

(assert (=> d!85925 (= res!374972 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!17988 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17988 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!17988 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17988 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17988 a!2986))))))

(declare-fun lt!266333 () Unit!18248)

(declare-fun choose!9 (array!36699 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18248)

(assert (=> d!85925 (= lt!266333 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266282 vacantSpotIndex!68 mask!3053))))

(assert (=> d!85925 (validMask!0 mask!3053)))

(assert (=> d!85925 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266282 vacantSpotIndex!68 mask!3053) lt!266333)))

(declare-fun b!587264 () Bool)

(assert (=> b!587264 (= e!335523 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266282 vacantSpotIndex!68 (select (arr!17624 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266282 vacantSpotIndex!68 (select (store (arr!17624 a!2986) i!1108 k!1786) j!136) (array!36700 (store (arr!17624 a!2986) i!1108 k!1786) (size!17988 a!2986)) mask!3053)))))

(assert (= (and d!85925 res!374972) b!587264))

(declare-fun m!565715 () Bool)

(assert (=> d!85925 m!565715))

(assert (=> d!85925 m!565617))

(assert (=> b!587264 m!565601))

(assert (=> b!587264 m!565607))

(assert (=> b!587264 m!565607))

(assert (=> b!587264 m!565609))

(assert (=> b!587264 m!565603))

(assert (=> b!587264 m!565601))

(assert (=> b!587264 m!565605))

(assert (=> b!587139 d!85925))

(declare-fun d!85937 () Bool)

(declare-fun lt!266336 () (_ BitVec 32))

(assert (=> d!85937 (and (bvsge lt!266336 #b00000000000000000000000000000000) (bvslt lt!266336 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85937 (= lt!266336 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!85937 (validMask!0 mask!3053)))

(assert (=> d!85937 (= (nextIndex!0 index!984 x!910 mask!3053) lt!266336)))

(declare-fun bs!18176 () Bool)

(assert (= bs!18176 d!85937))

(declare-fun m!565717 () Bool)

(assert (=> bs!18176 m!565717))

(assert (=> bs!18176 m!565617))

(assert (=> b!587139 d!85937))

(declare-fun b!587303 () Bool)

(declare-fun e!335554 () Bool)

(declare-fun call!32786 () Bool)

(assert (=> b!587303 (= e!335554 call!32786)))

(declare-fun b!587304 () Bool)

(declare-fun e!335553 () Bool)

(declare-fun e!335551 () Bool)

(assert (=> b!587304 (= e!335553 e!335551)))

(declare-fun res!374991 () Bool)

(assert (=> b!587304 (=> (not res!374991) (not e!335551))))

(declare-fun e!335552 () Bool)

(assert (=> b!587304 (= res!374991 (not e!335552))))

(declare-fun res!374989 () Bool)

(assert (=> b!587304 (=> (not res!374989) (not e!335552))))

(assert (=> b!587304 (= res!374989 (validKeyInArray!0 (select (arr!17624 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!85939 () Bool)

(declare-fun res!374990 () Bool)

(assert (=> d!85939 (=> res!374990 e!335553)))

(assert (=> d!85939 (= res!374990 (bvsge #b00000000000000000000000000000000 (size!17988 a!2986)))))

(assert (=> d!85939 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11662) e!335553)))

(declare-fun b!587305 () Bool)

(assert (=> b!587305 (= e!335554 call!32786)))

(declare-fun b!587306 () Bool)

(declare-fun contains!2906 (List!11665 (_ BitVec 64)) Bool)

(assert (=> b!587306 (= e!335552 (contains!2906 Nil!11662 (select (arr!17624 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32783 () Bool)

(declare-fun c!66524 () Bool)

(assert (=> bm!32783 (= call!32786 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66524 (Cons!11661 (select (arr!17624 a!2986) #b00000000000000000000000000000000) Nil!11662) Nil!11662)))))

(declare-fun b!587307 () Bool)

(assert (=> b!587307 (= e!335551 e!335554)))

(assert (=> b!587307 (= c!66524 (validKeyInArray!0 (select (arr!17624 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!85939 (not res!374990)) b!587304))

(assert (= (and b!587304 res!374989) b!587306))

(assert (= (and b!587304 res!374991) b!587307))

(assert (= (and b!587307 c!66524) b!587303))

(assert (= (and b!587307 (not c!66524)) b!587305))

(assert (= (or b!587303 b!587305) bm!32783))

(declare-fun m!565745 () Bool)

(assert (=> b!587304 m!565745))

(assert (=> b!587304 m!565745))

(declare-fun m!565747 () Bool)

(assert (=> b!587304 m!565747))

(assert (=> b!587306 m!565745))

(assert (=> b!587306 m!565745))

(declare-fun m!565749 () Bool)

(assert (=> b!587306 m!565749))

(assert (=> bm!32783 m!565745))

(declare-fun m!565751 () Bool)

(assert (=> bm!32783 m!565751))

(assert (=> b!587307 m!565745))

(assert (=> b!587307 m!565745))

(assert (=> b!587307 m!565747))

(assert (=> b!587140 d!85939))

(declare-fun b!587339 () Bool)

(declare-fun e!335577 () SeekEntryResult!6064)

(declare-fun e!335576 () SeekEntryResult!6064)

(assert (=> b!587339 (= e!335577 e!335576)))

(declare-fun lt!266370 () (_ BitVec 64))

(declare-fun lt!266372 () SeekEntryResult!6064)

(assert (=> b!587339 (= lt!266370 (select (arr!17624 a!2986) (index!26485 lt!266372)))))

(declare-fun c!66537 () Bool)

(assert (=> b!587339 (= c!66537 (= lt!266370 k!1786))))

(declare-fun b!587340 () Bool)

(declare-fun c!66536 () Bool)

(assert (=> b!587340 (= c!66536 (= lt!266370 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!335575 () SeekEntryResult!6064)

(assert (=> b!587340 (= e!335576 e!335575)))

(declare-fun b!587341 () Bool)

(assert (=> b!587341 (= e!335577 Undefined!6064)))

(declare-fun b!587342 () Bool)

(assert (=> b!587342 (= e!335575 (seekKeyOrZeroReturnVacant!0 (x!55285 lt!266372) (index!26485 lt!266372) (index!26485 lt!266372) k!1786 a!2986 mask!3053))))

(declare-fun b!587344 () Bool)

(assert (=> b!587344 (= e!335575 (MissingZero!6064 (index!26485 lt!266372)))))

(declare-fun d!85947 () Bool)

(declare-fun lt!266371 () SeekEntryResult!6064)

