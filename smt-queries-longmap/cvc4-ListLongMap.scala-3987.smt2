; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53996 () Bool)

(assert start!53996)

(declare-fun b!589998 () Bool)

(declare-fun e!336820 () Bool)

(declare-fun e!336822 () Bool)

(assert (=> b!589998 (= e!336820 e!336822)))

(declare-fun res!377440 () Bool)

(assert (=> b!589998 (=> (not res!377440) (not e!336822))))

(declare-datatypes ((SeekEntryResult!6133 0))(
  ( (MissingZero!6133 (index!26762 (_ BitVec 32))) (Found!6133 (index!26763 (_ BitVec 32))) (Intermediate!6133 (undefined!6945 Bool) (index!26764 (_ BitVec 32)) (x!55547 (_ BitVec 32))) (Undefined!6133) (MissingVacant!6133 (index!26765 (_ BitVec 32))) )
))
(declare-fun lt!267673 () SeekEntryResult!6133)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589998 (= res!377440 (or (= lt!267673 (MissingZero!6133 i!1108)) (= lt!267673 (MissingVacant!6133 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36840 0))(
  ( (array!36841 (arr!17693 (Array (_ BitVec 32) (_ BitVec 64))) (size!18057 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36840)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36840 (_ BitVec 32)) SeekEntryResult!6133)

(assert (=> b!589998 (= lt!267673 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!589999 () Bool)

(declare-fun e!336818 () Bool)

(declare-fun e!336815 () Bool)

(assert (=> b!589999 (= e!336818 (not e!336815))))

(declare-fun res!377447 () Bool)

(assert (=> b!589999 (=> res!377447 e!336815)))

(declare-fun lt!267672 () SeekEntryResult!6133)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589999 (= res!377447 (not (= lt!267672 (Found!6133 index!984))))))

(declare-datatypes ((Unit!18450 0))(
  ( (Unit!18451) )
))
(declare-fun lt!267671 () Unit!18450)

(declare-fun e!336817 () Unit!18450)

(assert (=> b!589999 (= lt!267671 e!336817)))

(declare-fun c!66647 () Bool)

(assert (=> b!589999 (= c!66647 (= lt!267672 Undefined!6133))))

(declare-fun lt!267667 () (_ BitVec 64))

(declare-fun lt!267665 () array!36840)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36840 (_ BitVec 32)) SeekEntryResult!6133)

(assert (=> b!589999 (= lt!267672 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267667 lt!267665 mask!3053))))

(declare-fun e!336816 () Bool)

(assert (=> b!589999 e!336816))

(declare-fun res!377449 () Bool)

(assert (=> b!589999 (=> (not res!377449) (not e!336816))))

(declare-fun lt!267670 () (_ BitVec 32))

(declare-fun lt!267666 () SeekEntryResult!6133)

(assert (=> b!589999 (= res!377449 (= lt!267666 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267670 vacantSpotIndex!68 lt!267667 lt!267665 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!589999 (= lt!267666 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267670 vacantSpotIndex!68 (select (arr!17693 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589999 (= lt!267667 (select (store (arr!17693 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267669 () Unit!18450)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36840 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18450)

(assert (=> b!589999 (= lt!267669 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267670 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589999 (= lt!267670 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!590000 () Bool)

(declare-fun lt!267668 () SeekEntryResult!6133)

(assert (=> b!590000 (= e!336816 (= lt!267668 lt!267666))))

(declare-fun b!590001 () Bool)

(assert (=> b!590001 (= e!336815 (or (not (= (select (arr!17693 a!2986) j!136) lt!267667)) (not (= (select (arr!17693 a!2986) j!136) (select (store (arr!17693 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984) (bvslt (size!18057 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!590001 (= (select (store (arr!17693 a!2986) i!1108 k!1786) index!984) (select (arr!17693 a!2986) j!136))))

(declare-fun b!590002 () Bool)

(declare-fun res!377441 () Bool)

(assert (=> b!590002 (=> (not res!377441) (not e!336822))))

(declare-datatypes ((List!11734 0))(
  ( (Nil!11731) (Cons!11730 (h!12775 (_ BitVec 64)) (t!17962 List!11734)) )
))
(declare-fun arrayNoDuplicates!0 (array!36840 (_ BitVec 32) List!11734) Bool)

(assert (=> b!590002 (= res!377441 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11731))))

(declare-fun b!590003 () Bool)

(declare-fun e!336821 () Bool)

(assert (=> b!590003 (= e!336822 e!336821)))

(declare-fun res!377442 () Bool)

(assert (=> b!590003 (=> (not res!377442) (not e!336821))))

(assert (=> b!590003 (= res!377442 (= (select (store (arr!17693 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590003 (= lt!267665 (array!36841 (store (arr!17693 a!2986) i!1108 k!1786) (size!18057 a!2986)))))

(declare-fun b!590004 () Bool)

(declare-fun res!377439 () Bool)

(assert (=> b!590004 (=> (not res!377439) (not e!336820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590004 (= res!377439 (validKeyInArray!0 k!1786))))

(declare-fun b!590006 () Bool)

(declare-fun Unit!18452 () Unit!18450)

(assert (=> b!590006 (= e!336817 Unit!18452)))

(declare-fun b!590007 () Bool)

(declare-fun res!377444 () Bool)

(assert (=> b!590007 (=> (not res!377444) (not e!336822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36840 (_ BitVec 32)) Bool)

(assert (=> b!590007 (= res!377444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590008 () Bool)

(declare-fun res!377448 () Bool)

(assert (=> b!590008 (=> (not res!377448) (not e!336822))))

(assert (=> b!590008 (= res!377448 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17693 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590009 () Bool)

(assert (=> b!590009 (= e!336821 e!336818)))

(declare-fun res!377446 () Bool)

(assert (=> b!590009 (=> (not res!377446) (not e!336818))))

(assert (=> b!590009 (= res!377446 (and (= lt!267668 (Found!6133 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17693 a!2986) index!984) (select (arr!17693 a!2986) j!136))) (not (= (select (arr!17693 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!590009 (= lt!267668 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17693 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590010 () Bool)

(declare-fun Unit!18453 () Unit!18450)

(assert (=> b!590010 (= e!336817 Unit!18453)))

(assert (=> b!590010 false))

(declare-fun b!590011 () Bool)

(declare-fun res!377445 () Bool)

(assert (=> b!590011 (=> (not res!377445) (not e!336820))))

(assert (=> b!590011 (= res!377445 (validKeyInArray!0 (select (arr!17693 a!2986) j!136)))))

(declare-fun b!590012 () Bool)

(declare-fun res!377443 () Bool)

(assert (=> b!590012 (=> (not res!377443) (not e!336820))))

(declare-fun arrayContainsKey!0 (array!36840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590012 (= res!377443 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!377438 () Bool)

(assert (=> start!53996 (=> (not res!377438) (not e!336820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53996 (= res!377438 (validMask!0 mask!3053))))

(assert (=> start!53996 e!336820))

(assert (=> start!53996 true))

(declare-fun array_inv!13489 (array!36840) Bool)

(assert (=> start!53996 (array_inv!13489 a!2986)))

(declare-fun b!590005 () Bool)

(declare-fun res!377450 () Bool)

(assert (=> b!590005 (=> (not res!377450) (not e!336820))))

(assert (=> b!590005 (= res!377450 (and (= (size!18057 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18057 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18057 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53996 res!377438) b!590005))

(assert (= (and b!590005 res!377450) b!590011))

(assert (= (and b!590011 res!377445) b!590004))

(assert (= (and b!590004 res!377439) b!590012))

(assert (= (and b!590012 res!377443) b!589998))

(assert (= (and b!589998 res!377440) b!590007))

(assert (= (and b!590007 res!377444) b!590002))

(assert (= (and b!590002 res!377441) b!590008))

(assert (= (and b!590008 res!377448) b!590003))

(assert (= (and b!590003 res!377442) b!590009))

(assert (= (and b!590009 res!377446) b!589999))

(assert (= (and b!589999 res!377449) b!590000))

(assert (= (and b!589999 c!66647) b!590010))

(assert (= (and b!589999 (not c!66647)) b!590006))

(assert (= (and b!589999 (not res!377447)) b!590001))

(declare-fun m!568489 () Bool)

(assert (=> b!590008 m!568489))

(declare-fun m!568491 () Bool)

(assert (=> b!590012 m!568491))

(declare-fun m!568493 () Bool)

(assert (=> b!589998 m!568493))

(declare-fun m!568495 () Bool)

(assert (=> b!589999 m!568495))

(declare-fun m!568497 () Bool)

(assert (=> b!589999 m!568497))

(declare-fun m!568499 () Bool)

(assert (=> b!589999 m!568499))

(declare-fun m!568501 () Bool)

(assert (=> b!589999 m!568501))

(declare-fun m!568503 () Bool)

(assert (=> b!589999 m!568503))

(assert (=> b!589999 m!568499))

(declare-fun m!568505 () Bool)

(assert (=> b!589999 m!568505))

(declare-fun m!568507 () Bool)

(assert (=> b!589999 m!568507))

(declare-fun m!568509 () Bool)

(assert (=> b!589999 m!568509))

(declare-fun m!568511 () Bool)

(assert (=> b!590002 m!568511))

(declare-fun m!568513 () Bool)

(assert (=> b!590004 m!568513))

(assert (=> b!590011 m!568499))

(assert (=> b!590011 m!568499))

(declare-fun m!568515 () Bool)

(assert (=> b!590011 m!568515))

(assert (=> b!590003 m!568507))

(declare-fun m!568517 () Bool)

(assert (=> b!590003 m!568517))

(declare-fun m!568519 () Bool)

(assert (=> start!53996 m!568519))

(declare-fun m!568521 () Bool)

(assert (=> start!53996 m!568521))

(assert (=> b!590001 m!568499))

(assert (=> b!590001 m!568507))

(declare-fun m!568523 () Bool)

(assert (=> b!590001 m!568523))

(declare-fun m!568525 () Bool)

(assert (=> b!590007 m!568525))

(declare-fun m!568527 () Bool)

(assert (=> b!590009 m!568527))

(assert (=> b!590009 m!568499))

(assert (=> b!590009 m!568499))

(declare-fun m!568529 () Bool)

(assert (=> b!590009 m!568529))

(push 1)

(assert (not b!589998))

(assert (not b!590007))

(assert (not b!590012))

(assert (not b!589999))

(assert (not b!590002))

(assert (not start!53996))

(assert (not b!590004))

(assert (not b!590011))

(assert (not b!590009))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!590103 () Bool)

(declare-fun e!336879 () SeekEntryResult!6133)

(assert (=> b!590103 (= e!336879 (MissingVacant!6133 vacantSpotIndex!68))))

(declare-fun b!590104 () Bool)

(declare-fun c!66686 () Bool)

(declare-fun lt!267710 () (_ BitVec 64))

(assert (=> b!590104 (= c!66686 (= lt!267710 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!336878 () SeekEntryResult!6133)

(assert (=> b!590104 (= e!336878 e!336879)))

(declare-fun b!590105 () Bool)

(declare-fun e!336877 () SeekEntryResult!6133)

(assert (=> b!590105 (= e!336877 e!336878)))

(declare-fun c!66684 () Bool)

(assert (=> b!590105 (= c!66684 (= lt!267710 (select (arr!17693 a!2986) j!136)))))

(declare-fun b!590106 () Bool)

(assert (=> b!590106 (= e!336878 (Found!6133 index!984))))

(declare-fun lt!267709 () SeekEntryResult!6133)

(declare-fun d!86039 () Bool)

(assert (=> d!86039 (and (or (is-Undefined!6133 lt!267709) (not (is-Found!6133 lt!267709)) (and (bvsge (index!26763 lt!267709) #b00000000000000000000000000000000) (bvslt (index!26763 lt!267709) (size!18057 a!2986)))) (or (is-Undefined!6133 lt!267709) (is-Found!6133 lt!267709) (not (is-MissingVacant!6133 lt!267709)) (not (= (index!26765 lt!267709) vacantSpotIndex!68)) (and (bvsge (index!26765 lt!267709) #b00000000000000000000000000000000) (bvslt (index!26765 lt!267709) (size!18057 a!2986)))) (or (is-Undefined!6133 lt!267709) (ite (is-Found!6133 lt!267709) (= (select (arr!17693 a!2986) (index!26763 lt!267709)) (select (arr!17693 a!2986) j!136)) (and (is-MissingVacant!6133 lt!267709) (= (index!26765 lt!267709) vacantSpotIndex!68) (= (select (arr!17693 a!2986) (index!26765 lt!267709)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86039 (= lt!267709 e!336877)))

(declare-fun c!66685 () Bool)

(assert (=> d!86039 (= c!66685 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86039 (= lt!267710 (select (arr!17693 a!2986) index!984))))

(assert (=> d!86039 (validMask!0 mask!3053)))

(assert (=> d!86039 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17693 a!2986) j!136) a!2986 mask!3053) lt!267709)))

(declare-fun b!590107 () Bool)

(assert (=> b!590107 (= e!336877 Undefined!6133)))

(declare-fun b!590108 () Bool)

(assert (=> b!590108 (= e!336879 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17693 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!86039 c!66685) b!590107))

(assert (= (and d!86039 (not c!66685)) b!590105))

(assert (= (and b!590105 c!66684) b!590106))

(assert (= (and b!590105 (not c!66684)) b!590104))

(assert (= (and b!590104 c!66686) b!590103))

(assert (= (and b!590104 (not c!66686)) b!590108))

(declare-fun m!568585 () Bool)

(assert (=> d!86039 m!568585))

(declare-fun m!568587 () Bool)

(assert (=> d!86039 m!568587))

(assert (=> d!86039 m!568527))

(assert (=> d!86039 m!568519))

(assert (=> b!590108 m!568495))

(assert (=> b!590108 m!568495))

(assert (=> b!590108 m!568499))

(declare-fun m!568589 () Bool)

(assert (=> b!590108 m!568589))

(assert (=> b!590009 d!86039))

(declare-fun lt!267748 () SeekEntryResult!6133)

(declare-fun e!336923 () SeekEntryResult!6133)

(declare-fun b!590181 () Bool)

(assert (=> b!590181 (= e!336923 (seekKeyOrZeroReturnVacant!0 (x!55547 lt!267748) (index!26764 lt!267748) (index!26764 lt!267748) k!1786 a!2986 mask!3053))))

