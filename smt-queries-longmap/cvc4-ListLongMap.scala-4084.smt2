; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56006 () Bool)

(assert start!56006)

(declare-fun b!615576 () Bool)

(declare-fun e!352954 () Bool)

(declare-fun e!352953 () Bool)

(assert (=> b!615576 (= e!352954 e!352953)))

(declare-fun res!396515 () Bool)

(assert (=> b!615576 (=> (not res!396515) (not e!352953))))

(declare-datatypes ((SeekEntryResult!6424 0))(
  ( (MissingZero!6424 (index!27980 (_ BitVec 32))) (Found!6424 (index!27981 (_ BitVec 32))) (Intermediate!6424 (undefined!7236 Bool) (index!27982 (_ BitVec 32)) (x!56776 (_ BitVec 32))) (Undefined!6424) (MissingVacant!6424 (index!27983 (_ BitVec 32))) )
))
(declare-fun lt!282803 () SeekEntryResult!6424)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!615576 (= res!396515 (or (= lt!282803 (MissingZero!6424 i!1108)) (= lt!282803 (MissingVacant!6424 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37476 0))(
  ( (array!37477 (arr!17984 (Array (_ BitVec 32) (_ BitVec 64))) (size!18348 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37476)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37476 (_ BitVec 32)) SeekEntryResult!6424)

(assert (=> b!615576 (= lt!282803 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!615577 () Bool)

(declare-fun lt!282798 () array!37476)

(declare-fun res!396510 () Bool)

(declare-fun arrayContainsKey!0 (array!37476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615577 (= res!396510 (arrayContainsKey!0 lt!282798 (select (arr!17984 a!2986) j!136) j!136))))

(declare-fun e!352948 () Bool)

(assert (=> b!615577 (=> (not res!396510) (not e!352948))))

(declare-fun e!352951 () Bool)

(assert (=> b!615577 (= e!352951 e!352948)))

(declare-fun b!615578 () Bool)

(declare-fun res!396509 () Bool)

(assert (=> b!615578 (=> (not res!396509) (not e!352954))))

(assert (=> b!615578 (= res!396509 (and (= (size!18348 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18348 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18348 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615579 () Bool)

(declare-datatypes ((Unit!19968 0))(
  ( (Unit!19969) )
))
(declare-fun e!352958 () Unit!19968)

(declare-fun Unit!19970 () Unit!19968)

(assert (=> b!615579 (= e!352958 Unit!19970)))

(declare-fun b!615580 () Bool)

(declare-fun res!396514 () Bool)

(assert (=> b!615580 (=> (not res!396514) (not e!352953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37476 (_ BitVec 32)) Bool)

(assert (=> b!615580 (= res!396514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615581 () Bool)

(declare-fun e!352955 () Bool)

(declare-fun lt!282800 () SeekEntryResult!6424)

(declare-fun lt!282816 () SeekEntryResult!6424)

(assert (=> b!615581 (= e!352955 (= lt!282800 lt!282816))))

(declare-fun b!615582 () Bool)

(declare-fun e!352947 () Bool)

(assert (=> b!615582 (= e!352947 (not true))))

(declare-fun lt!282799 () Unit!19968)

(declare-fun e!352959 () Unit!19968)

(assert (=> b!615582 (= lt!282799 e!352959)))

(declare-fun c!69905 () Bool)

(declare-fun lt!282807 () SeekEntryResult!6424)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!615582 (= c!69905 (= lt!282807 (Found!6424 index!984)))))

(declare-fun lt!282812 () Unit!19968)

(declare-fun e!352949 () Unit!19968)

(assert (=> b!615582 (= lt!282812 e!352949)))

(declare-fun c!69902 () Bool)

(assert (=> b!615582 (= c!69902 (= lt!282807 Undefined!6424))))

(declare-fun lt!282810 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37476 (_ BitVec 32)) SeekEntryResult!6424)

(assert (=> b!615582 (= lt!282807 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282810 lt!282798 mask!3053))))

(assert (=> b!615582 e!352955))

(declare-fun res!396517 () Bool)

(assert (=> b!615582 (=> (not res!396517) (not e!352955))))

(declare-fun lt!282802 () (_ BitVec 32))

(assert (=> b!615582 (= res!396517 (= lt!282816 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282802 vacantSpotIndex!68 lt!282810 lt!282798 mask!3053)))))

(assert (=> b!615582 (= lt!282816 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282802 vacantSpotIndex!68 (select (arr!17984 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615582 (= lt!282810 (select (store (arr!17984 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!282817 () Unit!19968)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37476 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19968)

(assert (=> b!615582 (= lt!282817 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282802 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615582 (= lt!282802 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615583 () Bool)

(declare-fun res!396518 () Bool)

(assert (=> b!615583 (=> (not res!396518) (not e!352953))))

(declare-datatypes ((List!12025 0))(
  ( (Nil!12022) (Cons!12021 (h!13066 (_ BitVec 64)) (t!18253 List!12025)) )
))
(declare-fun arrayNoDuplicates!0 (array!37476 (_ BitVec 32) List!12025) Bool)

(assert (=> b!615583 (= res!396518 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12022))))

(declare-fun b!615584 () Bool)

(declare-fun Unit!19971 () Unit!19968)

(assert (=> b!615584 (= e!352959 Unit!19971)))

(declare-fun b!615585 () Bool)

(assert (=> b!615585 false))

(declare-fun lt!282806 () Unit!19968)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37476 (_ BitVec 64) (_ BitVec 32) List!12025) Unit!19968)

(assert (=> b!615585 (= lt!282806 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282798 (select (arr!17984 a!2986) j!136) index!984 Nil!12022))))

(assert (=> b!615585 (arrayNoDuplicates!0 lt!282798 index!984 Nil!12022)))

(declare-fun lt!282805 () Unit!19968)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37476 (_ BitVec 32) (_ BitVec 32)) Unit!19968)

(assert (=> b!615585 (= lt!282805 (lemmaNoDuplicateFromThenFromBigger!0 lt!282798 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615585 (arrayNoDuplicates!0 lt!282798 #b00000000000000000000000000000000 Nil!12022)))

(declare-fun lt!282815 () Unit!19968)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37476 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12025) Unit!19968)

(assert (=> b!615585 (= lt!282815 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12022))))

(assert (=> b!615585 (arrayContainsKey!0 lt!282798 (select (arr!17984 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282814 () Unit!19968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37476 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19968)

(assert (=> b!615585 (= lt!282814 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282798 (select (arr!17984 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!352950 () Bool)

(assert (=> b!615585 e!352950))

(declare-fun res!396516 () Bool)

(assert (=> b!615585 (=> (not res!396516) (not e!352950))))

(assert (=> b!615585 (= res!396516 (arrayContainsKey!0 lt!282798 (select (arr!17984 a!2986) j!136) j!136))))

(declare-fun e!352952 () Unit!19968)

(declare-fun Unit!19972 () Unit!19968)

(assert (=> b!615585 (= e!352952 Unit!19972)))

(declare-fun b!615586 () Bool)

(declare-fun e!352956 () Bool)

(assert (=> b!615586 (= e!352956 e!352947)))

(declare-fun res!396512 () Bool)

(assert (=> b!615586 (=> (not res!396512) (not e!352947))))

(assert (=> b!615586 (= res!396512 (and (= lt!282800 (Found!6424 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17984 a!2986) index!984) (select (arr!17984 a!2986) j!136))) (not (= (select (arr!17984 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!615586 (= lt!282800 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17984 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615587 () Bool)

(declare-fun res!396507 () Bool)

(assert (=> b!615587 (= res!396507 (bvsge j!136 index!984))))

(assert (=> b!615587 (=> res!396507 e!352951)))

(declare-fun e!352946 () Bool)

(assert (=> b!615587 (= e!352946 e!352951)))

(declare-fun b!615589 () Bool)

(declare-fun res!396508 () Bool)

(assert (=> b!615589 (=> (not res!396508) (not e!352953))))

(assert (=> b!615589 (= res!396508 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17984 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615590 () Bool)

(assert (=> b!615590 false))

(declare-fun lt!282811 () Unit!19968)

(assert (=> b!615590 (= lt!282811 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282798 (select (arr!17984 a!2986) j!136) j!136 Nil!12022))))

(assert (=> b!615590 (arrayNoDuplicates!0 lt!282798 j!136 Nil!12022)))

(declare-fun lt!282809 () Unit!19968)

(assert (=> b!615590 (= lt!282809 (lemmaNoDuplicateFromThenFromBigger!0 lt!282798 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615590 (arrayNoDuplicates!0 lt!282798 #b00000000000000000000000000000000 Nil!12022)))

(declare-fun lt!282804 () Unit!19968)

(assert (=> b!615590 (= lt!282804 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12022))))

(assert (=> b!615590 (arrayContainsKey!0 lt!282798 (select (arr!17984 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282801 () Unit!19968)

(assert (=> b!615590 (= lt!282801 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282798 (select (arr!17984 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19973 () Unit!19968)

(assert (=> b!615590 (= e!352958 Unit!19973)))

(declare-fun b!615591 () Bool)

(declare-fun Unit!19974 () Unit!19968)

(assert (=> b!615591 (= e!352952 Unit!19974)))

(declare-fun b!615592 () Bool)

(declare-fun res!396513 () Bool)

(assert (=> b!615592 (=> (not res!396513) (not e!352954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615592 (= res!396513 (validKeyInArray!0 k!1786))))

(declare-fun b!615593 () Bool)

(assert (=> b!615593 (= e!352950 (arrayContainsKey!0 lt!282798 (select (arr!17984 a!2986) j!136) index!984))))

(declare-fun b!615594 () Bool)

(assert (=> b!615594 (= e!352953 e!352956)))

(declare-fun res!396511 () Bool)

(assert (=> b!615594 (=> (not res!396511) (not e!352956))))

(assert (=> b!615594 (= res!396511 (= (select (store (arr!17984 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615594 (= lt!282798 (array!37477 (store (arr!17984 a!2986) i!1108 k!1786) (size!18348 a!2986)))))

(declare-fun b!615595 () Bool)

(declare-fun res!396521 () Bool)

(assert (=> b!615595 (=> (not res!396521) (not e!352954))))

(assert (=> b!615595 (= res!396521 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615596 () Bool)

(declare-fun res!396519 () Bool)

(assert (=> b!615596 (=> (not res!396519) (not e!352954))))

(assert (=> b!615596 (= res!396519 (validKeyInArray!0 (select (arr!17984 a!2986) j!136)))))

(declare-fun b!615597 () Bool)

(declare-fun Unit!19975 () Unit!19968)

(assert (=> b!615597 (= e!352959 Unit!19975)))

(declare-fun res!396520 () Bool)

(assert (=> b!615597 (= res!396520 (= (select (store (arr!17984 a!2986) i!1108 k!1786) index!984) (select (arr!17984 a!2986) j!136)))))

(assert (=> b!615597 (=> (not res!396520) (not e!352946))))

(assert (=> b!615597 e!352946))

(declare-fun c!69903 () Bool)

(assert (=> b!615597 (= c!69903 (bvslt j!136 index!984))))

(declare-fun lt!282808 () Unit!19968)

(assert (=> b!615597 (= lt!282808 e!352958)))

(declare-fun c!69904 () Bool)

(assert (=> b!615597 (= c!69904 (bvslt index!984 j!136))))

(declare-fun lt!282813 () Unit!19968)

(assert (=> b!615597 (= lt!282813 e!352952)))

(assert (=> b!615597 false))

(declare-fun res!396506 () Bool)

(assert (=> start!56006 (=> (not res!396506) (not e!352954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56006 (= res!396506 (validMask!0 mask!3053))))

(assert (=> start!56006 e!352954))

(assert (=> start!56006 true))

(declare-fun array_inv!13780 (array!37476) Bool)

(assert (=> start!56006 (array_inv!13780 a!2986)))

(declare-fun b!615588 () Bool)

(declare-fun Unit!19976 () Unit!19968)

(assert (=> b!615588 (= e!352949 Unit!19976)))

(assert (=> b!615588 false))

(declare-fun b!615598 () Bool)

(assert (=> b!615598 (= e!352948 (arrayContainsKey!0 lt!282798 (select (arr!17984 a!2986) j!136) index!984))))

(declare-fun b!615599 () Bool)

(declare-fun Unit!19977 () Unit!19968)

(assert (=> b!615599 (= e!352949 Unit!19977)))

(assert (= (and start!56006 res!396506) b!615578))

(assert (= (and b!615578 res!396509) b!615596))

(assert (= (and b!615596 res!396519) b!615592))

(assert (= (and b!615592 res!396513) b!615595))

(assert (= (and b!615595 res!396521) b!615576))

(assert (= (and b!615576 res!396515) b!615580))

(assert (= (and b!615580 res!396514) b!615583))

(assert (= (and b!615583 res!396518) b!615589))

(assert (= (and b!615589 res!396508) b!615594))

(assert (= (and b!615594 res!396511) b!615586))

(assert (= (and b!615586 res!396512) b!615582))

(assert (= (and b!615582 res!396517) b!615581))

(assert (= (and b!615582 c!69902) b!615588))

(assert (= (and b!615582 (not c!69902)) b!615599))

(assert (= (and b!615582 c!69905) b!615597))

(assert (= (and b!615582 (not c!69905)) b!615584))

(assert (= (and b!615597 res!396520) b!615587))

(assert (= (and b!615587 (not res!396507)) b!615577))

(assert (= (and b!615577 res!396510) b!615598))

(assert (= (and b!615597 c!69903) b!615590))

(assert (= (and b!615597 (not c!69903)) b!615579))

(assert (= (and b!615597 c!69904) b!615585))

(assert (= (and b!615597 (not c!69904)) b!615591))

(assert (= (and b!615585 res!396516) b!615593))

(declare-fun m!591775 () Bool)

(assert (=> b!615595 m!591775))

(declare-fun m!591777 () Bool)

(assert (=> b!615598 m!591777))

(assert (=> b!615598 m!591777))

(declare-fun m!591779 () Bool)

(assert (=> b!615598 m!591779))

(declare-fun m!591781 () Bool)

(assert (=> b!615597 m!591781))

(declare-fun m!591783 () Bool)

(assert (=> b!615597 m!591783))

(assert (=> b!615597 m!591777))

(assert (=> b!615593 m!591777))

(assert (=> b!615593 m!591777))

(assert (=> b!615593 m!591779))

(declare-fun m!591785 () Bool)

(assert (=> b!615586 m!591785))

(assert (=> b!615586 m!591777))

(assert (=> b!615586 m!591777))

(declare-fun m!591787 () Bool)

(assert (=> b!615586 m!591787))

(assert (=> b!615590 m!591777))

(declare-fun m!591789 () Bool)

(assert (=> b!615590 m!591789))

(assert (=> b!615590 m!591777))

(declare-fun m!591791 () Bool)

(assert (=> b!615590 m!591791))

(assert (=> b!615590 m!591777))

(declare-fun m!591793 () Bool)

(assert (=> b!615590 m!591793))

(declare-fun m!591795 () Bool)

(assert (=> b!615590 m!591795))

(declare-fun m!591797 () Bool)

(assert (=> b!615590 m!591797))

(assert (=> b!615590 m!591777))

(declare-fun m!591799 () Bool)

(assert (=> b!615590 m!591799))

(declare-fun m!591801 () Bool)

(assert (=> b!615590 m!591801))

(declare-fun m!591803 () Bool)

(assert (=> b!615589 m!591803))

(declare-fun m!591805 () Bool)

(assert (=> b!615583 m!591805))

(declare-fun m!591807 () Bool)

(assert (=> b!615576 m!591807))

(assert (=> b!615594 m!591781))

(declare-fun m!591809 () Bool)

(assert (=> b!615594 m!591809))

(declare-fun m!591811 () Bool)

(assert (=> b!615580 m!591811))

(declare-fun m!591813 () Bool)

(assert (=> b!615592 m!591813))

(declare-fun m!591815 () Bool)

(assert (=> start!56006 m!591815))

(declare-fun m!591817 () Bool)

(assert (=> start!56006 m!591817))

(assert (=> b!615585 m!591777))

(assert (=> b!615585 m!591801))

(assert (=> b!615585 m!591777))

(declare-fun m!591819 () Bool)

(assert (=> b!615585 m!591819))

(declare-fun m!591821 () Bool)

(assert (=> b!615585 m!591821))

(declare-fun m!591823 () Bool)

(assert (=> b!615585 m!591823))

(assert (=> b!615585 m!591777))

(declare-fun m!591825 () Bool)

(assert (=> b!615585 m!591825))

(assert (=> b!615585 m!591777))

(declare-fun m!591827 () Bool)

(assert (=> b!615585 m!591827))

(assert (=> b!615585 m!591777))

(declare-fun m!591829 () Bool)

(assert (=> b!615585 m!591829))

(assert (=> b!615585 m!591797))

(assert (=> b!615577 m!591777))

(assert (=> b!615577 m!591777))

(assert (=> b!615577 m!591827))

(declare-fun m!591831 () Bool)

(assert (=> b!615582 m!591831))

(declare-fun m!591833 () Bool)

(assert (=> b!615582 m!591833))

(assert (=> b!615582 m!591777))

(assert (=> b!615582 m!591781))

(declare-fun m!591835 () Bool)

(assert (=> b!615582 m!591835))

(declare-fun m!591837 () Bool)

(assert (=> b!615582 m!591837))

(declare-fun m!591839 () Bool)

(assert (=> b!615582 m!591839))

(assert (=> b!615582 m!591777))

(declare-fun m!591841 () Bool)

(assert (=> b!615582 m!591841))

(assert (=> b!615596 m!591777))

(assert (=> b!615596 m!591777))

(declare-fun m!591843 () Bool)

(assert (=> b!615596 m!591843))

(push 1)

