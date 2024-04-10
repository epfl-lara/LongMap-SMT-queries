; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53794 () Bool)

(assert start!53794)

(declare-fun b!587065 () Bool)

(declare-fun res!374890 () Bool)

(declare-fun e!335434 () Bool)

(assert (=> b!587065 (=> (not res!374890) (not e!335434))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36695 0))(
  ( (array!36696 (arr!17622 (Array (_ BitVec 32) (_ BitVec 64))) (size!17986 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36695)

(assert (=> b!587065 (= res!374890 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17622 a!2986) index!984) (select (arr!17622 a!2986) j!136))) (not (= (select (arr!17622 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587066 () Bool)

(declare-fun res!374885 () Bool)

(declare-fun e!335436 () Bool)

(assert (=> b!587066 (=> (not res!374885) (not e!335436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587066 (= res!374885 (validKeyInArray!0 (select (arr!17622 a!2986) j!136)))))

(declare-fun b!587067 () Bool)

(declare-fun res!374883 () Bool)

(assert (=> b!587067 (=> (not res!374883) (not e!335436))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!587067 (= res!374883 (validKeyInArray!0 k!1786))))

(declare-fun res!374887 () Bool)

(assert (=> start!53794 (=> (not res!374887) (not e!335436))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53794 (= res!374887 (validMask!0 mask!3053))))

(assert (=> start!53794 e!335436))

(assert (=> start!53794 true))

(declare-fun array_inv!13418 (array!36695) Bool)

(assert (=> start!53794 (array_inv!13418 a!2986)))

(declare-fun b!587068 () Bool)

(declare-fun res!374886 () Bool)

(assert (=> b!587068 (=> (not res!374886) (not e!335434))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!587068 (= res!374886 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17622 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17622 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587069 () Bool)

(declare-fun res!374881 () Bool)

(assert (=> b!587069 (=> (not res!374881) (not e!335436))))

(declare-fun arrayContainsKey!0 (array!36695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587069 (= res!374881 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587070 () Bool)

(declare-fun res!374891 () Bool)

(assert (=> b!587070 (=> (not res!374891) (not e!335434))))

(declare-datatypes ((List!11663 0))(
  ( (Nil!11660) (Cons!11659 (h!12704 (_ BitVec 64)) (t!17891 List!11663)) )
))
(declare-fun arrayNoDuplicates!0 (array!36695 (_ BitVec 32) List!11663) Bool)

(assert (=> b!587070 (= res!374891 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11660))))

(declare-fun b!587071 () Bool)

(assert (=> b!587071 (= e!335436 e!335434)))

(declare-fun res!374889 () Bool)

(assert (=> b!587071 (=> (not res!374889) (not e!335434))))

(declare-datatypes ((SeekEntryResult!6062 0))(
  ( (MissingZero!6062 (index!26475 (_ BitVec 32))) (Found!6062 (index!26476 (_ BitVec 32))) (Intermediate!6062 (undefined!6874 Bool) (index!26477 (_ BitVec 32)) (x!55283 (_ BitVec 32))) (Undefined!6062) (MissingVacant!6062 (index!26478 (_ BitVec 32))) )
))
(declare-fun lt!266264 () SeekEntryResult!6062)

(assert (=> b!587071 (= res!374889 (or (= lt!266264 (MissingZero!6062 i!1108)) (= lt!266264 (MissingVacant!6062 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36695 (_ BitVec 32)) SeekEntryResult!6062)

(assert (=> b!587071 (= lt!266264 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587072 () Bool)

(declare-fun lt!266265 () (_ BitVec 32))

(assert (=> b!587072 (= e!335434 (not (or (bvslt mask!3053 #b00000000000000000000000000000000) (and (bvsge lt!266265 #b00000000000000000000000000000000) (bvslt lt!266265 (bvadd #b00000000000000000000000000000001 mask!3053))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36695 (_ BitVec 32)) SeekEntryResult!6062)

(assert (=> b!587072 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266265 vacantSpotIndex!68 (select (arr!17622 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266265 vacantSpotIndex!68 (select (store (arr!17622 a!2986) i!1108 k!1786) j!136) (array!36696 (store (arr!17622 a!2986) i!1108 k!1786) (size!17986 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18244 0))(
  ( (Unit!18245) )
))
(declare-fun lt!266266 () Unit!18244)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36695 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18244)

(assert (=> b!587072 (= lt!266266 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266265 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587072 (= lt!266265 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587073 () Bool)

(declare-fun res!374888 () Bool)

(assert (=> b!587073 (=> (not res!374888) (not e!335434))))

(assert (=> b!587073 (= res!374888 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17622 a!2986) j!136) a!2986 mask!3053) (Found!6062 j!136)))))

(declare-fun b!587074 () Bool)

(declare-fun res!374884 () Bool)

(assert (=> b!587074 (=> (not res!374884) (not e!335434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36695 (_ BitVec 32)) Bool)

(assert (=> b!587074 (= res!374884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587075 () Bool)

(declare-fun res!374882 () Bool)

(assert (=> b!587075 (=> (not res!374882) (not e!335436))))

(assert (=> b!587075 (= res!374882 (and (= (size!17986 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17986 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17986 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53794 res!374887) b!587075))

(assert (= (and b!587075 res!374882) b!587066))

(assert (= (and b!587066 res!374885) b!587067))

(assert (= (and b!587067 res!374883) b!587069))

(assert (= (and b!587069 res!374881) b!587071))

(assert (= (and b!587071 res!374889) b!587074))

(assert (= (and b!587074 res!374884) b!587070))

(assert (= (and b!587070 res!374891) b!587068))

(assert (= (and b!587068 res!374886) b!587073))

(assert (= (and b!587073 res!374888) b!587065))

(assert (= (and b!587065 res!374890) b!587072))

(declare-fun m!565519 () Bool)

(assert (=> b!587072 m!565519))

(declare-fun m!565521 () Bool)

(assert (=> b!587072 m!565521))

(declare-fun m!565523 () Bool)

(assert (=> b!587072 m!565523))

(declare-fun m!565525 () Bool)

(assert (=> b!587072 m!565525))

(declare-fun m!565527 () Bool)

(assert (=> b!587072 m!565527))

(assert (=> b!587072 m!565525))

(declare-fun m!565529 () Bool)

(assert (=> b!587072 m!565529))

(assert (=> b!587072 m!565521))

(declare-fun m!565531 () Bool)

(assert (=> b!587072 m!565531))

(declare-fun m!565533 () Bool)

(assert (=> b!587071 m!565533))

(declare-fun m!565535 () Bool)

(assert (=> b!587065 m!565535))

(assert (=> b!587065 m!565525))

(declare-fun m!565537 () Bool)

(assert (=> b!587070 m!565537))

(assert (=> b!587073 m!565525))

(assert (=> b!587073 m!565525))

(declare-fun m!565539 () Bool)

(assert (=> b!587073 m!565539))

(declare-fun m!565541 () Bool)

(assert (=> start!53794 m!565541))

(declare-fun m!565543 () Bool)

(assert (=> start!53794 m!565543))

(declare-fun m!565545 () Bool)

(assert (=> b!587074 m!565545))

(declare-fun m!565547 () Bool)

(assert (=> b!587069 m!565547))

(declare-fun m!565549 () Bool)

(assert (=> b!587067 m!565549))

(assert (=> b!587066 m!565525))

(assert (=> b!587066 m!565525))

(declare-fun m!565551 () Bool)

(assert (=> b!587066 m!565551))

(declare-fun m!565553 () Bool)

(assert (=> b!587068 m!565553))

(assert (=> b!587068 m!565529))

(declare-fun m!565555 () Bool)

(assert (=> b!587068 m!565555))

(push 1)

(assert (not b!587066))

(assert (not b!587073))

(assert (not b!587070))

(assert (not b!587067))

(assert (not start!53794))

(assert (not b!587069))

(assert (not b!587072))

(assert (not b!587074))

(assert (not b!587071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85907 () Bool)

(assert (=> d!85907 (= (validKeyInArray!0 (select (arr!17622 a!2986) j!136)) (and (not (= (select (arr!17622 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17622 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!587066 d!85907))

(declare-fun d!85909 () Bool)

(declare-fun lt!266304 () SeekEntryResult!6062)

(assert (=> d!85909 (and (or (is-Undefined!6062 lt!266304) (not (is-Found!6062 lt!266304)) (and (bvsge (index!26476 lt!266304) #b00000000000000000000000000000000) (bvslt (index!26476 lt!266304) (size!17986 a!2986)))) (or (is-Undefined!6062 lt!266304) (is-Found!6062 lt!266304) (not (is-MissingZero!6062 lt!266304)) (and (bvsge (index!26475 lt!266304) #b00000000000000000000000000000000) (bvslt (index!26475 lt!266304) (size!17986 a!2986)))) (or (is-Undefined!6062 lt!266304) (is-Found!6062 lt!266304) (is-MissingZero!6062 lt!266304) (not (is-MissingVacant!6062 lt!266304)) (and (bvsge (index!26478 lt!266304) #b00000000000000000000000000000000) (bvslt (index!26478 lt!266304) (size!17986 a!2986)))) (or (is-Undefined!6062 lt!266304) (ite (is-Found!6062 lt!266304) (= (select (arr!17622 a!2986) (index!26476 lt!266304)) k!1786) (ite (is-MissingZero!6062 lt!266304) (= (select (arr!17622 a!2986) (index!26475 lt!266304)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6062 lt!266304) (= (select (arr!17622 a!2986) (index!26478 lt!266304)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!335488 () SeekEntryResult!6062)

(assert (=> d!85909 (= lt!266304 e!335488)))

(declare-fun c!66485 () Bool)

(declare-fun lt!266306 () SeekEntryResult!6062)

(assert (=> d!85909 (= c!66485 (and (is-Intermediate!6062 lt!266306) (undefined!6874 lt!266306)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36695 (_ BitVec 32)) SeekEntryResult!6062)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85909 (= lt!266306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!85909 (validMask!0 mask!3053)))

(assert (=> d!85909 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!266304)))

(declare-fun b!587199 () Bool)

(declare-fun e!335490 () SeekEntryResult!6062)

(assert (=> b!587199 (= e!335490 (MissingZero!6062 (index!26477 lt!266306)))))

(declare-fun b!587200 () Bool)

(assert (=> b!587200 (= e!335488 Undefined!6062)))

(declare-fun b!587201 () Bool)

(assert (=> b!587201 (= e!335490 (seekKeyOrZeroReturnVacant!0 (x!55283 lt!266306) (index!26477 lt!266306) (index!26477 lt!266306) k!1786 a!2986 mask!3053))))

(declare-fun b!587202 () Bool)

(declare-fun e!335489 () SeekEntryResult!6062)

(assert (=> b!587202 (= e!335489 (Found!6062 (index!26477 lt!266306)))))

(declare-fun b!587203 () Bool)

(declare-fun c!66484 () Bool)

(declare-fun lt!266305 () (_ BitVec 64))

(assert (=> b!587203 (= c!66484 (= lt!266305 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!587203 (= e!335489 e!335490)))

(declare-fun b!587204 () Bool)

(assert (=> b!587204 (= e!335488 e!335489)))

(assert (=> b!587204 (= lt!266305 (select (arr!17622 a!2986) (index!26477 lt!266306)))))

(declare-fun c!66483 () Bool)

(assert (=> b!587204 (= c!66483 (= lt!266305 k!1786))))

(assert (= (and d!85909 c!66485) b!587200))

(assert (= (and d!85909 (not c!66485)) b!587204))

(assert (= (and b!587204 c!66483) b!587202))

(assert (= (and b!587204 (not c!66483)) b!587203))

(assert (= (and b!587203 c!66484) b!587199))

(assert (= (and b!587203 (not c!66484)) b!587201))

(declare-fun m!565655 () Bool)

(assert (=> d!85909 m!565655))

(declare-fun m!565657 () Bool)

(assert (=> d!85909 m!565657))

(declare-fun m!565659 () Bool)

(assert (=> d!85909 m!565659))

(assert (=> d!85909 m!565541))

(assert (=> d!85909 m!565657))

(declare-fun m!565661 () Bool)

(assert (=> d!85909 m!565661))

(declare-fun m!565663 () Bool)

(assert (=> d!85909 m!565663))

(declare-fun m!565665 () Bool)

(assert (=> b!587201 m!565665))

(declare-fun m!565667 () Bool)

(assert (=> b!587204 m!565667))

(assert (=> b!587071 d!85909))

(declare-fun d!85917 () Bool)

(assert (=> d!85917 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53794 d!85917))

(declare-fun d!85927 () Bool)

(assert (=> d!85927 (= (array_inv!13418 a!2986) (bvsge (size!17986 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53794 d!85927))

(declare-fun b!587266 () Bool)

(declare-fun e!335524 () SeekEntryResult!6062)

(assert (=> b!587266 (= e!335524 (MissingVacant!6062 vacantSpotIndex!68))))

(declare-fun b!587267 () Bool)

(assert (=> b!587267 (= e!335524 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!266265 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17622 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587268 () Bool)

(declare-fun e!335525 () SeekEntryResult!6062)

(assert (=> b!587268 (= e!335525 (Found!6062 lt!266265))))

(declare-fun b!587269 () Bool)

(declare-fun e!335526 () SeekEntryResult!6062)

(assert (=> b!587269 (= e!335526 e!335525)))

(declare-fun lt!266338 () (_ BitVec 64))

(declare-fun c!66514 () Bool)

(assert (=> b!587269 (= c!66514 (= lt!266338 (select (arr!17622 a!2986) j!136)))))

(declare-fun b!587270 () Bool)

(assert (=> b!587270 (= e!335526 Undefined!6062)))

(declare-fun d!85929 () Bool)

(declare-fun lt!266337 () SeekEntryResult!6062)

(assert (=> d!85929 (and (or (is-Undefined!6062 lt!266337) (not (is-Found!6062 lt!266337)) (and (bvsge (index!26476 lt!266337) #b00000000000000000000000000000000) (bvslt (index!26476 lt!266337) (size!17986 a!2986)))) (or (is-Undefined!6062 lt!266337) (is-Found!6062 lt!266337) (not (is-MissingVacant!6062 lt!266337)) (not (= (index!26478 lt!266337) vacantSpotIndex!68)) (and (bvsge (index!26478 lt!266337) #b00000000000000000000000000000000) (bvslt (index!26478 lt!266337) (size!17986 a!2986)))) (or (is-Undefined!6062 lt!266337) (ite (is-Found!6062 lt!266337) (= (select (arr!17622 a!2986) (index!26476 lt!266337)) (select (arr!17622 a!2986) j!136)) (and (is-MissingVacant!6062 lt!266337) (= (index!26478 lt!266337) vacantSpotIndex!68) (= (select (arr!17622 a!2986) (index!26478 lt!266337)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85929 (= lt!266337 e!335526)))

(declare-fun c!66515 () Bool)

(assert (=> d!85929 (= c!66515 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!85929 (= lt!266338 (select (arr!17622 a!2986) lt!266265))))

(assert (=> d!85929 (validMask!0 mask!3053)))

(assert (=> d!85929 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266265 vacantSpotIndex!68 (select (arr!17622 a!2986) j!136) a!2986 mask!3053) lt!266337)))

(declare-fun b!587265 () Bool)

(declare-fun c!66513 () Bool)

(assert (=> b!587265 (= c!66513 (= lt!266338 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!587265 (= e!335525 e!335524)))

(assert (= (and d!85929 c!66515) b!587270))

(assert (= (and d!85929 (not c!66515)) b!587269))

(assert (= (and b!587269 c!66514) b!587268))

(assert (= (and b!587269 (not c!66514)) b!587265))

(assert (= (and b!587265 c!66513) b!587266))

(assert (= (and b!587265 (not c!66513)) b!587267))

(declare-fun m!565719 () Bool)

(assert (=> b!587267 m!565719))

(assert (=> b!587267 m!565719))

(assert (=> b!587267 m!565525))

(declare-fun m!565721 () Bool)

(assert (=> b!587267 m!565721))

(declare-fun m!565723 () Bool)

(assert (=> d!85929 m!565723))

(declare-fun m!565725 () Bool)

(assert (=> d!85929 m!565725))

(declare-fun m!565727 () Bool)

(assert (=> d!85929 m!565727))

(assert (=> d!85929 m!565541))

(assert (=> b!587072 d!85929))

(declare-fun b!587280 () Bool)

(declare-fun e!335533 () SeekEntryResult!6062)

(assert (=> b!587280 (= e!335533 (MissingVacant!6062 vacantSpotIndex!68))))

(declare-fun b!587281 () Bool)

(assert (=> b!587281 (= e!335533 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!266265 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (store (arr!17622 a!2986) i!1108 k!1786) j!136) (array!36696 (store (arr!17622 a!2986) i!1108 k!1786) (size!17986 a!2986)) mask!3053))))

(declare-fun b!587282 () Bool)

(declare-fun e!335534 () SeekEntryResult!6062)

(assert (=> b!587282 (= e!335534 (Found!6062 lt!266265))))

(declare-fun b!587283 () Bool)

(declare-fun e!335535 () SeekEntryResult!6062)

(assert (=> b!587283 (= e!335535 e!335534)))

(declare-fun lt!266346 () (_ BitVec 64))

(declare-fun c!66519 () Bool)

(assert (=> b!587283 (= c!66519 (= lt!266346 (select (store (arr!17622 a!2986) i!1108 k!1786) j!136)))))

(declare-fun b!587284 () Bool)

(assert (=> b!587284 (= e!335535 Undefined!6062)))

(declare-fun lt!266345 () SeekEntryResult!6062)

(declare-fun d!85941 () Bool)

(assert (=> d!85941 (and (or (is-Undefined!6062 lt!266345) (not (is-Found!6062 lt!266345)) (and (bvsge (index!26476 lt!266345) #b00000000000000000000000000000000) (bvslt (index!26476 lt!266345) (size!17986 (array!36696 (store (arr!17622 a!2986) i!1108 k!1786) (size!17986 a!2986)))))) (or (is-Undefined!6062 lt!266345) (is-Found!6062 lt!266345) (not (is-MissingVacant!6062 lt!266345)) (not (= (index!26478 lt!266345) vacantSpotIndex!68)) (and (bvsge (index!26478 lt!266345) #b00000000000000000000000000000000) (bvslt (index!26478 lt!266345) (size!17986 (array!36696 (store (arr!17622 a!2986) i!1108 k!1786) (size!17986 a!2986)))))) (or (is-Undefined!6062 lt!266345) (ite (is-Found!6062 lt!266345) (= (select (arr!17622 (array!36696 (store (arr!17622 a!2986) i!1108 k!1786) (size!17986 a!2986))) (index!26476 lt!266345)) (select (store (arr!17622 a!2986) i!1108 k!1786) j!136)) (and (is-MissingVacant!6062 lt!266345) (= (index!26478 lt!266345) vacantSpotIndex!68) (= (select (arr!17622 (array!36696 (store (arr!17622 a!2986) i!1108 k!1786) (size!17986 a!2986))) (index!26478 lt!266345)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85941 (= lt!266345 e!335535)))

(declare-fun c!66520 () Bool)

(assert (=> d!85941 (= c!66520 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!85941 (= lt!266346 (select (arr!17622 (array!36696 (store (arr!17622 a!2986) i!1108 k!1786) (size!17986 a!2986))) lt!266265))))

(assert (=> d!85941 (validMask!0 mask!3053)))

(assert (=> d!85941 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266265 vacantSpotIndex!68 (select (store (arr!17622 a!2986) i!1108 k!1786) j!136) (array!36696 (store (arr!17622 a!2986) i!1108 k!1786) (size!17986 a!2986)) mask!3053) lt!266345)))

(declare-fun b!587279 () Bool)

(declare-fun c!66518 () Bool)

(assert (=> b!587279 (= c!66518 (= lt!266346 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!587279 (= e!335534 e!335533)))

(assert (= (and d!85941 c!66520) b!587284))

(assert (= (and d!85941 (not c!66520)) b!587283))

(assert (= (and b!587283 c!66519) b!587282))

(assert (= (and b!587283 (not c!66519)) b!587279))

(assert (= (and b!587279 c!66518) b!587280))

(assert (= (and b!587279 (not c!66518)) b!587281))

(assert (=> b!587281 m!565719))

(assert (=> b!587281 m!565719))

(assert (=> b!587281 m!565521))

(declare-fun m!565729 () Bool)

(assert (=> b!587281 m!565729))

(declare-fun m!565731 () Bool)

(assert (=> d!85941 m!565731))

(declare-fun m!565733 () Bool)

(assert (=> d!85941 m!565733))

(declare-fun m!565735 () Bool)

(assert (=> d!85941 m!565735))

(assert (=> d!85941 m!565541))

(assert (=> b!587072 d!85941))

(declare-fun d!85943 () Bool)

(declare-fun e!335559 () Bool)

(assert (=> d!85943 e!335559))

(declare-fun res!374996 () Bool)

(assert (=> d!85943 (=> (not res!374996) (not e!335559))))

(assert (=> d!85943 (= res!374996 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!17986 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17986 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!17986 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17986 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17986 a!2986))))))

(declare-fun lt!266352 () Unit!18244)

(declare-fun choose!9 (array!36695 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18244)

(assert (=> d!85943 (= lt!266352 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266265 vacantSpotIndex!68 mask!3053))))

(assert (=> d!85943 (validMask!0 mask!3053)))

(assert (=> d!85943 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266265 vacantSpotIndex!68 mask!3053) lt!266352)))

(declare-fun b!587312 () Bool)

(assert (=> b!587312 (= e!335559 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266265 vacantSpotIndex!68 (select (arr!17622 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266265 vacantSpotIndex!68 (select (store (arr!17622 a!2986) i!1108 k!1786) j!136) (array!36696 (store (arr!17622 a!2986) i!1108 k!1786) (size!17986 a!2986)) mask!3053)))))

(assert (= (and d!85943 res!374996) b!587312))

(declare-fun m!565755 () Bool)

(assert (=> d!85943 m!565755))

(assert (=> d!85943 m!565541))

(assert (=> b!587312 m!565529))

(assert (=> b!587312 m!565521))

(assert (=> b!587312 m!565531))

(assert (=> b!587312 m!565525))

(assert (=> b!587312 m!565521))

(assert (=> b!587312 m!565525))

(assert (=> b!587312 m!565527))

(assert (=> b!587072 d!85943))

(declare-fun d!85955 () Bool)

(declare-fun lt!266355 () (_ BitVec 32))

(assert (=> d!85955 (and (bvsge lt!266355 #b00000000000000000000000000000000) (bvslt lt!266355 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85955 (= lt!266355 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!85955 (validMask!0 mask!3053)))

(assert (=> d!85955 (= (nextIndex!0 index!984 x!910 mask!3053) lt!266355)))

(declare-fun bs!18177 () Bool)

(assert (= bs!18177 d!85955))

(declare-fun m!565757 () Bool)

(assert (=> bs!18177 m!565757))

(assert (=> bs!18177 m!565541))

(assert (=> b!587072 d!85955))

(declare-fun d!85959 () Bool)

(assert (=> d!85959 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!587067 d!85959))

(declare-fun b!587314 () Bool)

(declare-fun e!335560 () SeekEntryResult!6062)

(assert (=> b!587314 (= e!335560 (MissingVacant!6062 vacantSpotIndex!68))))

(declare-fun b!587315 () Bool)

(assert (=> b!587315 (= e!335560 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17622 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587316 () Bool)

(declare-fun e!335561 () SeekEntryResult!6062)

(assert (=> b!587316 (= e!335561 (Found!6062 index!984))))

(declare-fun b!587317 () Bool)

(declare-fun e!335562 () SeekEntryResult!6062)

(assert (=> b!587317 (= e!335562 e!335561)))

(declare-fun c!66526 () Bool)

(declare-fun lt!266357 () (_ BitVec 64))

(assert (=> b!587317 (= c!66526 (= lt!266357 (select (arr!17622 a!2986) j!136)))))

(declare-fun b!587318 () Bool)

(assert (=> b!587318 (= e!335562 Undefined!6062)))

(declare-fun d!85961 () Bool)

(declare-fun lt!266356 () SeekEntryResult!6062)

(assert (=> d!85961 (and (or (is-Undefined!6062 lt!266356) (not (is-Found!6062 lt!266356)) (and (bvsge (index!26476 lt!266356) #b00000000000000000000000000000000) (bvslt (index!26476 lt!266356) (size!17986 a!2986)))) (or (is-Undefined!6062 lt!266356) (is-Found!6062 lt!266356) (not (is-MissingVacant!6062 lt!266356)) (not (= (index!26478 lt!266356) vacantSpotIndex!68)) (and (bvsge (index!26478 lt!266356) #b00000000000000000000000000000000) (bvslt (index!26478 lt!266356) (size!17986 a!2986)))) (or (is-Undefined!6062 lt!266356) (ite (is-Found!6062 lt!266356) (= (select (arr!17622 a!2986) (index!26476 lt!266356)) (select (arr!17622 a!2986) j!136)) (and (is-MissingVacant!6062 lt!266356) (= (index!26478 lt!266356) vacantSpotIndex!68) (= (select (arr!17622 a!2986) (index!26478 lt!266356)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85961 (= lt!266356 e!335562)))

(declare-fun c!66527 () Bool)

(assert (=> d!85961 (= c!66527 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!85961 (= lt!266357 (select (arr!17622 a!2986) index!984))))

(assert (=> d!85961 (validMask!0 mask!3053)))

(assert (=> d!85961 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17622 a!2986) j!136) a!2986 mask!3053) lt!266356)))

(declare-fun b!587313 () Bool)

(declare-fun c!66525 () Bool)

(assert (=> b!587313 (= c!66525 (= lt!266357 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!587313 (= e!335561 e!335560)))

(assert (= (and d!85961 c!66527) b!587318))

(assert (= (and d!85961 (not c!66527)) b!587317))

(assert (= (and b!587317 c!66526) b!587316))

(assert (= (and b!587317 (not c!66526)) b!587313))

(assert (= (and b!587313 c!66525) b!587314))

(assert (= (and b!587313 (not c!66525)) b!587315))

(assert (=> b!587315 m!565519))

(assert (=> b!587315 m!565519))

(assert (=> b!587315 m!565525))

(declare-fun m!565759 () Bool)

(assert (=> b!587315 m!565759))

(declare-fun m!565761 () Bool)

(assert (=> d!85961 m!565761))

(declare-fun m!565763 () Bool)

(assert (=> d!85961 m!565763))

(assert (=> d!85961 m!565535))

(assert (=> d!85961 m!565541))

(assert (=> b!587073 d!85961))

(declare-fun b!587351 () Bool)

(declare-fun e!335583 () Bool)

(declare-fun e!335582 () Bool)

(assert (=> b!587351 (= e!335583 e!335582)))

(declare-fun lt!266377 () (_ BitVec 64))

(assert (=> b!587351 (= lt!266377 (select (arr!17622 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!266375 () Unit!18244)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36695 (_ BitVec 64) (_ BitVec 32)) Unit!18244)

(assert (=> b!587351 (= lt!266375 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!266377 #b00000000000000000000000000000000))))

(assert (=> b!587351 (arrayContainsKey!0 a!2986 lt!266377 #b00000000000000000000000000000000)))

(declare-fun lt!266376 () Unit!18244)

(assert (=> b!587351 (= lt!266376 lt!266375)))

(declare-fun res!375001 () Bool)

(assert (=> b!587351 (= res!375001 (= (seekEntryOrOpen!0 (select (arr!17622 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6062 #b00000000000000000000000000000000)))))

(assert (=> b!587351 (=> (not res!375001) (not e!335582))))

(declare-fun b!587352 () Bool)

(declare-fun call!32789 () Bool)

(assert (=> b!587352 (= e!335583 call!32789)))

(declare-fun b!587353 () Bool)

(assert (=> b!587353 (= e!335582 call!32789)))

(declare-fun d!85963 () Bool)

(declare-fun res!375002 () Bool)

(declare-fun e!335581 () Bool)

(assert (=> d!85963 (=> res!375002 e!335581)))

(assert (=> d!85963 (= res!375002 (bvsge #b00000000000000000000000000000000 (size!17986 a!2986)))))

(assert (=> d!85963 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!335581)))

(declare-fun bm!32786 () Bool)

(assert (=> bm!32786 (= call!32789 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!587354 () Bool)

(assert (=> b!587354 (= e!335581 e!335583)))

(declare-fun c!66542 () Bool)

(assert (=> b!587354 (= c!66542 (validKeyInArray!0 (select (arr!17622 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!85963 (not res!375002)) b!587354))

(assert (= (and b!587354 c!66542) b!587351))

(assert (= (and b!587354 (not c!66542)) b!587352))

(assert (= (and b!587351 res!375001) b!587353))

(assert (= (or b!587353 b!587352) bm!32786))

(declare-fun m!565785 () Bool)

(assert (=> b!587351 m!565785))

(declare-fun m!565787 () Bool)

(assert (=> b!587351 m!565787))

(declare-fun m!565789 () Bool)

(assert (=> b!587351 m!565789))

(assert (=> b!587351 m!565785))

(declare-fun m!565791 () Bool)

(assert (=> b!587351 m!565791))

(declare-fun m!565793 () Bool)

(assert (=> bm!32786 m!565793))

(assert (=> b!587354 m!565785))

(assert (=> b!587354 m!565785))

(declare-fun m!565795 () Bool)

(assert (=> b!587354 m!565795))

(assert (=> b!587074 d!85963))

(declare-fun d!85971 () Bool)

(declare-fun res!375007 () Bool)

(declare-fun e!335588 () Bool)

(assert (=> d!85971 (=> res!375007 e!335588)))

(assert (=> d!85971 (= res!375007 (= (select (arr!17622 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!85971 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!335588)))

(declare-fun b!587359 () Bool)

(declare-fun e!335589 () Bool)

(assert (=> b!587359 (= e!335588 e!335589)))

(declare-fun res!375008 () Bool)

(assert (=> b!587359 (=> (not res!375008) (not e!335589))))

(assert (=> b!587359 (= res!375008 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17986 a!2986)))))

(declare-fun b!587360 () Bool)

