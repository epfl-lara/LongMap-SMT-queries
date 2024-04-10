; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55558 () Bool)

(assert start!55558)

(declare-fun b!607782 () Bool)

(declare-fun e!348056 () Bool)

(assert (=> b!607782 (= e!348056 true)))

(declare-fun lt!277542 () Bool)

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((List!11936 0))(
  ( (Nil!11933) (Cons!11932 (h!12977 (_ BitVec 64)) (t!18164 List!11936)) )
))
(declare-fun contains!3012 (List!11936 (_ BitVec 64)) Bool)

(assert (=> b!607782 (= lt!277542 (contains!3012 Nil!11933 k!1786))))

(declare-fun b!607783 () Bool)

(declare-datatypes ((Unit!19390 0))(
  ( (Unit!19391) )
))
(declare-fun e!348065 () Unit!19390)

(declare-fun Unit!19392 () Unit!19390)

(assert (=> b!607783 (= e!348065 Unit!19392)))

(declare-fun b!607784 () Bool)

(declare-fun e!348066 () Bool)

(declare-fun e!348059 () Bool)

(assert (=> b!607784 (= e!348066 e!348059)))

(declare-fun res!390568 () Bool)

(assert (=> b!607784 (=> (not res!390568) (not e!348059))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6335 0))(
  ( (MissingZero!6335 (index!27615 (_ BitVec 32))) (Found!6335 (index!27616 (_ BitVec 32))) (Intermediate!6335 (undefined!7147 Bool) (index!27617 (_ BitVec 32)) (x!56428 (_ BitVec 32))) (Undefined!6335) (MissingVacant!6335 (index!27618 (_ BitVec 32))) )
))
(declare-fun lt!277539 () SeekEntryResult!6335)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37289 0))(
  ( (array!37290 (arr!17895 (Array (_ BitVec 32) (_ BitVec 64))) (size!18259 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37289)

(assert (=> b!607784 (= res!390568 (and (= lt!277539 (Found!6335 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17895 a!2986) index!984) (select (arr!17895 a!2986) j!136))) (not (= (select (arr!17895 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37289 (_ BitVec 32)) SeekEntryResult!6335)

(assert (=> b!607784 (= lt!277539 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17895 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607785 () Bool)

(declare-fun e!348062 () Bool)

(declare-fun e!348067 () Bool)

(assert (=> b!607785 (= e!348062 e!348067)))

(declare-fun res!390551 () Bool)

(assert (=> b!607785 (=> (not res!390551) (not e!348067))))

(declare-fun lt!277551 () array!37289)

(declare-fun arrayContainsKey!0 (array!37289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607785 (= res!390551 (arrayContainsKey!0 lt!277551 (select (arr!17895 a!2986) j!136) j!136))))

(declare-fun res!390561 () Bool)

(declare-fun e!348057 () Bool)

(assert (=> start!55558 (=> (not res!390561) (not e!348057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55558 (= res!390561 (validMask!0 mask!3053))))

(assert (=> start!55558 e!348057))

(assert (=> start!55558 true))

(declare-fun array_inv!13691 (array!37289) Bool)

(assert (=> start!55558 (array_inv!13691 a!2986)))

(declare-fun b!607786 () Bool)

(declare-fun e!348061 () Bool)

(assert (=> b!607786 (= e!348059 (not e!348061))))

(declare-fun res!390566 () Bool)

(assert (=> b!607786 (=> res!390566 e!348061)))

(declare-fun lt!277555 () SeekEntryResult!6335)

(assert (=> b!607786 (= res!390566 (not (= lt!277555 (Found!6335 index!984))))))

(declare-fun lt!277547 () Unit!19390)

(declare-fun e!348063 () Unit!19390)

(assert (=> b!607786 (= lt!277547 e!348063)))

(declare-fun c!68984 () Bool)

(assert (=> b!607786 (= c!68984 (= lt!277555 Undefined!6335))))

(declare-fun lt!277554 () (_ BitVec 64))

(assert (=> b!607786 (= lt!277555 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277554 lt!277551 mask!3053))))

(declare-fun e!348054 () Bool)

(assert (=> b!607786 e!348054))

(declare-fun res!390557 () Bool)

(assert (=> b!607786 (=> (not res!390557) (not e!348054))))

(declare-fun lt!277550 () (_ BitVec 32))

(declare-fun lt!277544 () SeekEntryResult!6335)

(assert (=> b!607786 (= res!390557 (= lt!277544 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277550 vacantSpotIndex!68 lt!277554 lt!277551 mask!3053)))))

(assert (=> b!607786 (= lt!277544 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277550 vacantSpotIndex!68 (select (arr!17895 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!607786 (= lt!277554 (select (store (arr!17895 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!277548 () Unit!19390)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19390)

(assert (=> b!607786 (= lt!277548 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277550 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607786 (= lt!277550 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607787 () Bool)

(declare-fun e!348058 () Bool)

(declare-fun e!348060 () Bool)

(assert (=> b!607787 (= e!348058 e!348060)))

(declare-fun res!390560 () Bool)

(assert (=> b!607787 (=> res!390560 e!348060)))

(assert (=> b!607787 (= res!390560 (bvsge index!984 j!136))))

(declare-fun lt!277552 () Unit!19390)

(assert (=> b!607787 (= lt!277552 e!348065)))

(declare-fun c!68983 () Bool)

(assert (=> b!607787 (= c!68983 (bvslt j!136 index!984))))

(declare-fun b!607788 () Bool)

(assert (=> b!607788 (= e!348067 (arrayContainsKey!0 lt!277551 (select (arr!17895 a!2986) j!136) index!984))))

(declare-fun b!607789 () Bool)

(declare-fun res!390569 () Bool)

(assert (=> b!607789 (=> res!390569 e!348056)))

(assert (=> b!607789 (= res!390569 (contains!3012 Nil!11933 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607790 () Bool)

(declare-fun res!390572 () Bool)

(declare-fun e!348055 () Bool)

(assert (=> b!607790 (=> (not res!390572) (not e!348055))))

(assert (=> b!607790 (= res!390572 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17895 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607791 () Bool)

(assert (=> b!607791 (= e!348060 e!348056)))

(declare-fun res!390570 () Bool)

(assert (=> b!607791 (=> res!390570 e!348056)))

(assert (=> b!607791 (= res!390570 (or (bvsge (size!18259 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18259 a!2986))))))

(assert (=> b!607791 (arrayContainsKey!0 lt!277551 (select (arr!17895 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277541 () Unit!19390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37289 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19390)

(assert (=> b!607791 (= lt!277541 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277551 (select (arr!17895 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348069 () Bool)

(assert (=> b!607791 e!348069))

(declare-fun res!390550 () Bool)

(assert (=> b!607791 (=> (not res!390550) (not e!348069))))

(assert (=> b!607791 (= res!390550 (arrayContainsKey!0 lt!277551 (select (arr!17895 a!2986) j!136) j!136))))

(declare-fun b!607792 () Bool)

(assert (=> b!607792 (= e!348054 (= lt!277539 lt!277544))))

(declare-fun b!607793 () Bool)

(declare-fun res!390558 () Bool)

(assert (=> b!607793 (=> (not res!390558) (not e!348057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607793 (= res!390558 (validKeyInArray!0 k!1786))))

(declare-fun b!607794 () Bool)

(declare-fun res!390556 () Bool)

(assert (=> b!607794 (=> (not res!390556) (not e!348055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37289 (_ BitVec 32)) Bool)

(assert (=> b!607794 (= res!390556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607795 () Bool)

(assert (=> b!607795 (= e!348055 e!348066)))

(declare-fun res!390555 () Bool)

(assert (=> b!607795 (=> (not res!390555) (not e!348066))))

(assert (=> b!607795 (= res!390555 (= (select (store (arr!17895 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607795 (= lt!277551 (array!37290 (store (arr!17895 a!2986) i!1108 k!1786) (size!18259 a!2986)))))

(declare-fun b!607796 () Bool)

(declare-fun res!390552 () Bool)

(assert (=> b!607796 (=> (not res!390552) (not e!348057))))

(assert (=> b!607796 (= res!390552 (validKeyInArray!0 (select (arr!17895 a!2986) j!136)))))

(declare-fun b!607797 () Bool)

(declare-fun e!348068 () Bool)

(assert (=> b!607797 (= e!348068 e!348062)))

(declare-fun res!390564 () Bool)

(assert (=> b!607797 (=> res!390564 e!348062)))

(declare-fun lt!277553 () (_ BitVec 64))

(assert (=> b!607797 (= res!390564 (or (not (= (select (arr!17895 a!2986) j!136) lt!277554)) (not (= (select (arr!17895 a!2986) j!136) lt!277553)) (bvsge j!136 index!984)))))

(declare-fun b!607798 () Bool)

(declare-fun res!390565 () Bool)

(assert (=> b!607798 (=> (not res!390565) (not e!348057))))

(assert (=> b!607798 (= res!390565 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607799 () Bool)

(assert (=> b!607799 (= e!348061 e!348058)))

(declare-fun res!390559 () Bool)

(assert (=> b!607799 (=> res!390559 e!348058)))

(assert (=> b!607799 (= res!390559 (or (not (= (select (arr!17895 a!2986) j!136) lt!277554)) (not (= (select (arr!17895 a!2986) j!136) lt!277553))))))

(assert (=> b!607799 e!348068))

(declare-fun res!390553 () Bool)

(assert (=> b!607799 (=> (not res!390553) (not e!348068))))

(assert (=> b!607799 (= res!390553 (= lt!277553 (select (arr!17895 a!2986) j!136)))))

(assert (=> b!607799 (= lt!277553 (select (store (arr!17895 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!607800 () Bool)

(declare-fun res!390563 () Bool)

(assert (=> b!607800 (=> res!390563 e!348056)))

(assert (=> b!607800 (= res!390563 (contains!3012 Nil!11933 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607801 () Bool)

(declare-fun Unit!19393 () Unit!19390)

(assert (=> b!607801 (= e!348063 Unit!19393)))

(assert (=> b!607801 false))

(declare-fun b!607802 () Bool)

(declare-fun res!390567 () Bool)

(assert (=> b!607802 (=> (not res!390567) (not e!348055))))

(declare-fun arrayNoDuplicates!0 (array!37289 (_ BitVec 32) List!11936) Bool)

(assert (=> b!607802 (= res!390567 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11933))))

(declare-fun b!607803 () Bool)

(declare-fun Unit!19394 () Unit!19390)

(assert (=> b!607803 (= e!348065 Unit!19394)))

(declare-fun lt!277546 () Unit!19390)

(assert (=> b!607803 (= lt!277546 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277551 (select (arr!17895 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607803 (arrayContainsKey!0 lt!277551 (select (arr!17895 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277540 () Unit!19390)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37289 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11936) Unit!19390)

(assert (=> b!607803 (= lt!277540 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11933))))

(assert (=> b!607803 (arrayNoDuplicates!0 lt!277551 #b00000000000000000000000000000000 Nil!11933)))

(declare-fun lt!277545 () Unit!19390)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37289 (_ BitVec 32) (_ BitVec 32)) Unit!19390)

(assert (=> b!607803 (= lt!277545 (lemmaNoDuplicateFromThenFromBigger!0 lt!277551 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607803 (arrayNoDuplicates!0 lt!277551 j!136 Nil!11933)))

(declare-fun lt!277543 () Unit!19390)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37289 (_ BitVec 64) (_ BitVec 32) List!11936) Unit!19390)

(assert (=> b!607803 (= lt!277543 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277551 (select (arr!17895 a!2986) j!136) j!136 Nil!11933))))

(assert (=> b!607803 false))

(declare-fun b!607804 () Bool)

(declare-fun Unit!19395 () Unit!19390)

(assert (=> b!607804 (= e!348063 Unit!19395)))

(declare-fun b!607805 () Bool)

(declare-fun res!390571 () Bool)

(assert (=> b!607805 (=> res!390571 e!348056)))

(declare-fun noDuplicate!318 (List!11936) Bool)

(assert (=> b!607805 (= res!390571 (not (noDuplicate!318 Nil!11933)))))

(declare-fun b!607806 () Bool)

(assert (=> b!607806 (= e!348057 e!348055)))

(declare-fun res!390562 () Bool)

(assert (=> b!607806 (=> (not res!390562) (not e!348055))))

(declare-fun lt!277549 () SeekEntryResult!6335)

(assert (=> b!607806 (= res!390562 (or (= lt!277549 (MissingZero!6335 i!1108)) (= lt!277549 (MissingVacant!6335 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37289 (_ BitVec 32)) SeekEntryResult!6335)

(assert (=> b!607806 (= lt!277549 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!607807 () Bool)

(declare-fun res!390554 () Bool)

(assert (=> b!607807 (=> (not res!390554) (not e!348057))))

(assert (=> b!607807 (= res!390554 (and (= (size!18259 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18259 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18259 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607808 () Bool)

(assert (=> b!607808 (= e!348069 (arrayContainsKey!0 lt!277551 (select (arr!17895 a!2986) j!136) index!984))))

(assert (= (and start!55558 res!390561) b!607807))

(assert (= (and b!607807 res!390554) b!607796))

(assert (= (and b!607796 res!390552) b!607793))

(assert (= (and b!607793 res!390558) b!607798))

(assert (= (and b!607798 res!390565) b!607806))

(assert (= (and b!607806 res!390562) b!607794))

(assert (= (and b!607794 res!390556) b!607802))

(assert (= (and b!607802 res!390567) b!607790))

(assert (= (and b!607790 res!390572) b!607795))

(assert (= (and b!607795 res!390555) b!607784))

(assert (= (and b!607784 res!390568) b!607786))

(assert (= (and b!607786 res!390557) b!607792))

(assert (= (and b!607786 c!68984) b!607801))

(assert (= (and b!607786 (not c!68984)) b!607804))

(assert (= (and b!607786 (not res!390566)) b!607799))

(assert (= (and b!607799 res!390553) b!607797))

(assert (= (and b!607797 (not res!390564)) b!607785))

(assert (= (and b!607785 res!390551) b!607788))

(assert (= (and b!607799 (not res!390559)) b!607787))

(assert (= (and b!607787 c!68983) b!607803))

(assert (= (and b!607787 (not c!68983)) b!607783))

(assert (= (and b!607787 (not res!390560)) b!607791))

(assert (= (and b!607791 res!390550) b!607808))

(assert (= (and b!607791 (not res!390570)) b!607805))

(assert (= (and b!607805 (not res!390571)) b!607789))

(assert (= (and b!607789 (not res!390569)) b!607800))

(assert (= (and b!607800 (not res!390563)) b!607782))

(declare-fun m!584483 () Bool)

(assert (=> b!607796 m!584483))

(assert (=> b!607796 m!584483))

(declare-fun m!584485 () Bool)

(assert (=> b!607796 m!584485))

(assert (=> b!607797 m!584483))

(assert (=> b!607808 m!584483))

(assert (=> b!607808 m!584483))

(declare-fun m!584487 () Bool)

(assert (=> b!607808 m!584487))

(assert (=> b!607788 m!584483))

(assert (=> b!607788 m!584483))

(assert (=> b!607788 m!584487))

(declare-fun m!584489 () Bool)

(assert (=> b!607790 m!584489))

(declare-fun m!584491 () Bool)

(assert (=> b!607784 m!584491))

(assert (=> b!607784 m!584483))

(assert (=> b!607784 m!584483))

(declare-fun m!584493 () Bool)

(assert (=> b!607784 m!584493))

(declare-fun m!584495 () Bool)

(assert (=> b!607789 m!584495))

(declare-fun m!584497 () Bool)

(assert (=> b!607802 m!584497))

(declare-fun m!584499 () Bool)

(assert (=> b!607793 m!584499))

(declare-fun m!584501 () Bool)

(assert (=> b!607794 m!584501))

(declare-fun m!584503 () Bool)

(assert (=> b!607798 m!584503))

(declare-fun m!584505 () Bool)

(assert (=> b!607782 m!584505))

(assert (=> b!607785 m!584483))

(assert (=> b!607785 m!584483))

(declare-fun m!584507 () Bool)

(assert (=> b!607785 m!584507))

(declare-fun m!584509 () Bool)

(assert (=> b!607786 m!584509))

(assert (=> b!607786 m!584483))

(declare-fun m!584511 () Bool)

(assert (=> b!607786 m!584511))

(declare-fun m!584513 () Bool)

(assert (=> b!607786 m!584513))

(declare-fun m!584515 () Bool)

(assert (=> b!607786 m!584515))

(assert (=> b!607786 m!584483))

(declare-fun m!584517 () Bool)

(assert (=> b!607786 m!584517))

(declare-fun m!584519 () Bool)

(assert (=> b!607786 m!584519))

(declare-fun m!584521 () Bool)

(assert (=> b!607786 m!584521))

(declare-fun m!584523 () Bool)

(assert (=> b!607800 m!584523))

(assert (=> b!607791 m!584483))

(assert (=> b!607791 m!584483))

(declare-fun m!584525 () Bool)

(assert (=> b!607791 m!584525))

(assert (=> b!607791 m!584483))

(declare-fun m!584527 () Bool)

(assert (=> b!607791 m!584527))

(assert (=> b!607791 m!584483))

(assert (=> b!607791 m!584507))

(declare-fun m!584529 () Bool)

(assert (=> b!607805 m!584529))

(declare-fun m!584531 () Bool)

(assert (=> start!55558 m!584531))

(declare-fun m!584533 () Bool)

(assert (=> start!55558 m!584533))

(assert (=> b!607799 m!584483))

(assert (=> b!607799 m!584511))

(declare-fun m!584535 () Bool)

(assert (=> b!607799 m!584535))

(assert (=> b!607795 m!584511))

(declare-fun m!584537 () Bool)

(assert (=> b!607795 m!584537))

(declare-fun m!584539 () Bool)

(assert (=> b!607806 m!584539))

(assert (=> b!607803 m!584483))

(declare-fun m!584541 () Bool)

(assert (=> b!607803 m!584541))

(assert (=> b!607803 m!584483))

(declare-fun m!584543 () Bool)

(assert (=> b!607803 m!584543))

(assert (=> b!607803 m!584483))

(declare-fun m!584545 () Bool)

(assert (=> b!607803 m!584545))

(declare-fun m!584547 () Bool)

(assert (=> b!607803 m!584547))

(declare-fun m!584549 () Bool)

(assert (=> b!607803 m!584549))

(declare-fun m!584551 () Bool)

(assert (=> b!607803 m!584551))

(assert (=> b!607803 m!584483))

(declare-fun m!584553 () Bool)

(assert (=> b!607803 m!584553))

(push 1)

