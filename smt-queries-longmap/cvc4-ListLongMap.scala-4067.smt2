; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55904 () Bool)

(assert start!55904)

(declare-fun b!611779 () Bool)

(declare-datatypes ((Unit!19618 0))(
  ( (Unit!19619) )
))
(declare-fun e!350618 () Unit!19618)

(declare-fun Unit!19620 () Unit!19618)

(assert (=> b!611779 (= e!350618 Unit!19620)))

(declare-fun b!611780 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37374 0))(
  ( (array!37375 (arr!17933 (Array (_ BitVec 32) (_ BitVec 64))) (size!18297 (_ BitVec 32))) )
))
(declare-fun lt!279933 () array!37374)

(declare-fun e!350614 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37374)

(declare-fun arrayContainsKey!0 (array!37374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611780 (= e!350614 (arrayContainsKey!0 lt!279933 (select (arr!17933 a!2986) j!136) index!984))))

(declare-fun b!611781 () Bool)

(declare-fun e!350607 () Bool)

(assert (=> b!611781 (= e!350607 e!350614)))

(declare-fun res!393463 () Bool)

(assert (=> b!611781 (=> (not res!393463) (not e!350614))))

(assert (=> b!611781 (= res!393463 (arrayContainsKey!0 lt!279933 (select (arr!17933 a!2986) j!136) j!136))))

(declare-fun b!611782 () Bool)

(declare-fun res!393475 () Bool)

(declare-fun e!350609 () Bool)

(assert (=> b!611782 (=> (not res!393475) (not e!350609))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37374 (_ BitVec 32)) Bool)

(assert (=> b!611782 (= res!393475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!611783 () Bool)

(declare-fun e!350605 () Bool)

(assert (=> b!611783 (= e!350605 e!350607)))

(declare-fun res!393467 () Bool)

(assert (=> b!611783 (=> res!393467 e!350607)))

(declare-fun lt!279934 () (_ BitVec 64))

(declare-fun lt!279932 () (_ BitVec 64))

(assert (=> b!611783 (= res!393467 (or (not (= (select (arr!17933 a!2986) j!136) lt!279934)) (not (= (select (arr!17933 a!2986) j!136) lt!279932)) (bvsge j!136 index!984)))))

(declare-fun res!393476 () Bool)

(declare-fun e!350606 () Bool)

(assert (=> start!55904 (=> (not res!393476) (not e!350606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55904 (= res!393476 (validMask!0 mask!3053))))

(assert (=> start!55904 e!350606))

(assert (=> start!55904 true))

(declare-fun array_inv!13729 (array!37374) Bool)

(assert (=> start!55904 (array_inv!13729 a!2986)))

(declare-fun b!611784 () Bool)

(declare-fun e!350616 () Bool)

(assert (=> b!611784 (= e!350609 e!350616)))

(declare-fun res!393477 () Bool)

(assert (=> b!611784 (=> (not res!393477) (not e!350616))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!611784 (= res!393477 (= (select (store (arr!17933 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611784 (= lt!279933 (array!37375 (store (arr!17933 a!2986) i!1108 k!1786) (size!18297 a!2986)))))

(declare-fun b!611785 () Bool)

(declare-fun e!350612 () Bool)

(assert (=> b!611785 (= e!350612 (arrayContainsKey!0 lt!279933 (select (arr!17933 a!2986) j!136) index!984))))

(declare-fun b!611786 () Bool)

(declare-fun e!350619 () Bool)

(declare-fun e!350613 () Bool)

(assert (=> b!611786 (= e!350619 e!350613)))

(declare-fun res!393474 () Bool)

(assert (=> b!611786 (=> res!393474 e!350613)))

(assert (=> b!611786 (= res!393474 (or (not (= (select (arr!17933 a!2986) j!136) lt!279934)) (not (= (select (arr!17933 a!2986) j!136) lt!279932))))))

(assert (=> b!611786 e!350605))

(declare-fun res!393461 () Bool)

(assert (=> b!611786 (=> (not res!393461) (not e!350605))))

(assert (=> b!611786 (= res!393461 (= lt!279932 (select (arr!17933 a!2986) j!136)))))

(assert (=> b!611786 (= lt!279932 (select (store (arr!17933 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!611787 () Bool)

(declare-fun res!393465 () Bool)

(assert (=> b!611787 (=> (not res!393465) (not e!350606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611787 (= res!393465 (validKeyInArray!0 (select (arr!17933 a!2986) j!136)))))

(declare-fun b!611788 () Bool)

(declare-fun res!393462 () Bool)

(assert (=> b!611788 (=> (not res!393462) (not e!350606))))

(assert (=> b!611788 (= res!393462 (validKeyInArray!0 k!1786))))

(declare-fun b!611789 () Bool)

(declare-fun e!350610 () Bool)

(assert (=> b!611789 (= e!350610 (not e!350619))))

(declare-fun res!393470 () Bool)

(assert (=> b!611789 (=> res!393470 e!350619)))

(declare-datatypes ((SeekEntryResult!6373 0))(
  ( (MissingZero!6373 (index!27776 (_ BitVec 32))) (Found!6373 (index!27777 (_ BitVec 32))) (Intermediate!6373 (undefined!7185 Bool) (index!27778 (_ BitVec 32)) (x!56589 (_ BitVec 32))) (Undefined!6373) (MissingVacant!6373 (index!27779 (_ BitVec 32))) )
))
(declare-fun lt!279942 () SeekEntryResult!6373)

(assert (=> b!611789 (= res!393470 (not (= lt!279942 (Found!6373 index!984))))))

(declare-fun lt!279939 () Unit!19618)

(assert (=> b!611789 (= lt!279939 e!350618)))

(declare-fun c!69527 () Bool)

(assert (=> b!611789 (= c!69527 (= lt!279942 Undefined!6373))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37374 (_ BitVec 32)) SeekEntryResult!6373)

(assert (=> b!611789 (= lt!279942 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279934 lt!279933 mask!3053))))

(declare-fun e!350615 () Bool)

(assert (=> b!611789 e!350615))

(declare-fun res!393464 () Bool)

(assert (=> b!611789 (=> (not res!393464) (not e!350615))))

(declare-fun lt!279940 () SeekEntryResult!6373)

(declare-fun lt!279945 () (_ BitVec 32))

(assert (=> b!611789 (= res!393464 (= lt!279940 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279945 vacantSpotIndex!68 lt!279934 lt!279933 mask!3053)))))

(assert (=> b!611789 (= lt!279940 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279945 vacantSpotIndex!68 (select (arr!17933 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!611789 (= lt!279934 (select (store (arr!17933 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!279943 () Unit!19618)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37374 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19618)

(assert (=> b!611789 (= lt!279943 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279945 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611789 (= lt!279945 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!611790 () Bool)

(assert (=> b!611790 (= e!350606 e!350609)))

(declare-fun res!393466 () Bool)

(assert (=> b!611790 (=> (not res!393466) (not e!350609))))

(declare-fun lt!279944 () SeekEntryResult!6373)

(assert (=> b!611790 (= res!393466 (or (= lt!279944 (MissingZero!6373 i!1108)) (= lt!279944 (MissingVacant!6373 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37374 (_ BitVec 32)) SeekEntryResult!6373)

(assert (=> b!611790 (= lt!279944 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!611791 () Bool)

(declare-fun res!393472 () Bool)

(assert (=> b!611791 (=> (not res!393472) (not e!350609))))

(declare-datatypes ((List!11974 0))(
  ( (Nil!11971) (Cons!11970 (h!13015 (_ BitVec 64)) (t!18202 List!11974)) )
))
(declare-fun arrayNoDuplicates!0 (array!37374 (_ BitVec 32) List!11974) Bool)

(assert (=> b!611791 (= res!393472 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11971))))

(declare-fun b!611792 () Bool)

(declare-fun lt!279935 () SeekEntryResult!6373)

(assert (=> b!611792 (= e!350615 (= lt!279935 lt!279940))))

(declare-fun b!611793 () Bool)

(declare-fun res!393478 () Bool)

(assert (=> b!611793 (=> (not res!393478) (not e!350609))))

(assert (=> b!611793 (= res!393478 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17933 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611794 () Bool)

(declare-fun res!393479 () Bool)

(assert (=> b!611794 (=> (not res!393479) (not e!350606))))

(assert (=> b!611794 (= res!393479 (and (= (size!18297 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18297 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18297 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!611795 () Bool)

(declare-fun Unit!19621 () Unit!19618)

(assert (=> b!611795 (= e!350618 Unit!19621)))

(assert (=> b!611795 false))

(declare-fun b!611796 () Bool)

(declare-fun e!350611 () Bool)

(assert (=> b!611796 (= e!350611 true)))

(assert (=> b!611796 (arrayNoDuplicates!0 lt!279933 #b00000000000000000000000000000000 Nil!11971)))

(declare-fun lt!279946 () Unit!19618)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37374 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11974) Unit!19618)

(assert (=> b!611796 (= lt!279946 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11971))))

(assert (=> b!611796 (arrayContainsKey!0 lt!279933 (select (arr!17933 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279937 () Unit!19618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37374 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19618)

(assert (=> b!611796 (= lt!279937 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279933 (select (arr!17933 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!611796 e!350612))

(declare-fun res!393469 () Bool)

(assert (=> b!611796 (=> (not res!393469) (not e!350612))))

(assert (=> b!611796 (= res!393469 (arrayContainsKey!0 lt!279933 (select (arr!17933 a!2986) j!136) j!136))))

(declare-fun b!611797 () Bool)

(declare-fun res!393473 () Bool)

(assert (=> b!611797 (=> (not res!393473) (not e!350606))))

(assert (=> b!611797 (= res!393473 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!611798 () Bool)

(assert (=> b!611798 (= e!350616 e!350610)))

(declare-fun res!393468 () Bool)

(assert (=> b!611798 (=> (not res!393468) (not e!350610))))

(assert (=> b!611798 (= res!393468 (and (= lt!279935 (Found!6373 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17933 a!2986) index!984) (select (arr!17933 a!2986) j!136))) (not (= (select (arr!17933 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!611798 (= lt!279935 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17933 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611799 () Bool)

(declare-fun e!350608 () Unit!19618)

(declare-fun Unit!19622 () Unit!19618)

(assert (=> b!611799 (= e!350608 Unit!19622)))

(declare-fun b!611800 () Bool)

(assert (=> b!611800 (= e!350613 e!350611)))

(declare-fun res!393471 () Bool)

(assert (=> b!611800 (=> res!393471 e!350611)))

(assert (=> b!611800 (= res!393471 (bvsge index!984 j!136))))

(declare-fun lt!279936 () Unit!19618)

(assert (=> b!611800 (= lt!279936 e!350608)))

(declare-fun c!69526 () Bool)

(assert (=> b!611800 (= c!69526 (bvslt j!136 index!984))))

(declare-fun b!611801 () Bool)

(declare-fun Unit!19623 () Unit!19618)

(assert (=> b!611801 (= e!350608 Unit!19623)))

(declare-fun lt!279931 () Unit!19618)

(assert (=> b!611801 (= lt!279931 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279933 (select (arr!17933 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!611801 (arrayContainsKey!0 lt!279933 (select (arr!17933 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279938 () Unit!19618)

(assert (=> b!611801 (= lt!279938 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11971))))

(assert (=> b!611801 (arrayNoDuplicates!0 lt!279933 #b00000000000000000000000000000000 Nil!11971)))

(declare-fun lt!279930 () Unit!19618)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37374 (_ BitVec 32) (_ BitVec 32)) Unit!19618)

(assert (=> b!611801 (= lt!279930 (lemmaNoDuplicateFromThenFromBigger!0 lt!279933 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611801 (arrayNoDuplicates!0 lt!279933 j!136 Nil!11971)))

(declare-fun lt!279941 () Unit!19618)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37374 (_ BitVec 64) (_ BitVec 32) List!11974) Unit!19618)

(assert (=> b!611801 (= lt!279941 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279933 (select (arr!17933 a!2986) j!136) j!136 Nil!11971))))

(assert (=> b!611801 false))

(assert (= (and start!55904 res!393476) b!611794))

(assert (= (and b!611794 res!393479) b!611787))

(assert (= (and b!611787 res!393465) b!611788))

(assert (= (and b!611788 res!393462) b!611797))

(assert (= (and b!611797 res!393473) b!611790))

(assert (= (and b!611790 res!393466) b!611782))

(assert (= (and b!611782 res!393475) b!611791))

(assert (= (and b!611791 res!393472) b!611793))

(assert (= (and b!611793 res!393478) b!611784))

(assert (= (and b!611784 res!393477) b!611798))

(assert (= (and b!611798 res!393468) b!611789))

(assert (= (and b!611789 res!393464) b!611792))

(assert (= (and b!611789 c!69527) b!611795))

(assert (= (and b!611789 (not c!69527)) b!611779))

(assert (= (and b!611789 (not res!393470)) b!611786))

(assert (= (and b!611786 res!393461) b!611783))

(assert (= (and b!611783 (not res!393467)) b!611781))

(assert (= (and b!611781 res!393463) b!611780))

(assert (= (and b!611786 (not res!393474)) b!611800))

(assert (= (and b!611800 c!69526) b!611801))

(assert (= (and b!611800 (not c!69526)) b!611799))

(assert (= (and b!611800 (not res!393471)) b!611796))

(assert (= (and b!611796 res!393469) b!611785))

(declare-fun m!588175 () Bool)

(assert (=> b!611793 m!588175))

(declare-fun m!588177 () Bool)

(assert (=> b!611782 m!588177))

(declare-fun m!588179 () Bool)

(assert (=> b!611791 m!588179))

(declare-fun m!588181 () Bool)

(assert (=> b!611785 m!588181))

(assert (=> b!611785 m!588181))

(declare-fun m!588183 () Bool)

(assert (=> b!611785 m!588183))

(declare-fun m!588185 () Bool)

(assert (=> b!611798 m!588185))

(assert (=> b!611798 m!588181))

(assert (=> b!611798 m!588181))

(declare-fun m!588187 () Bool)

(assert (=> b!611798 m!588187))

(declare-fun m!588189 () Bool)

(assert (=> b!611797 m!588189))

(assert (=> b!611780 m!588181))

(assert (=> b!611780 m!588181))

(assert (=> b!611780 m!588183))

(assert (=> b!611781 m!588181))

(assert (=> b!611781 m!588181))

(declare-fun m!588191 () Bool)

(assert (=> b!611781 m!588191))

(assert (=> b!611801 m!588181))

(declare-fun m!588193 () Bool)

(assert (=> b!611801 m!588193))

(declare-fun m!588195 () Bool)

(assert (=> b!611801 m!588195))

(assert (=> b!611801 m!588181))

(declare-fun m!588197 () Bool)

(assert (=> b!611801 m!588197))

(assert (=> b!611801 m!588181))

(declare-fun m!588199 () Bool)

(assert (=> b!611801 m!588199))

(declare-fun m!588201 () Bool)

(assert (=> b!611801 m!588201))

(declare-fun m!588203 () Bool)

(assert (=> b!611801 m!588203))

(assert (=> b!611801 m!588181))

(declare-fun m!588205 () Bool)

(assert (=> b!611801 m!588205))

(declare-fun m!588207 () Bool)

(assert (=> b!611789 m!588207))

(assert (=> b!611789 m!588181))

(declare-fun m!588209 () Bool)

(assert (=> b!611789 m!588209))

(declare-fun m!588211 () Bool)

(assert (=> b!611789 m!588211))

(declare-fun m!588213 () Bool)

(assert (=> b!611789 m!588213))

(declare-fun m!588215 () Bool)

(assert (=> b!611789 m!588215))

(declare-fun m!588217 () Bool)

(assert (=> b!611789 m!588217))

(assert (=> b!611789 m!588181))

(declare-fun m!588219 () Bool)

(assert (=> b!611789 m!588219))

(declare-fun m!588221 () Bool)

(assert (=> start!55904 m!588221))

(declare-fun m!588223 () Bool)

(assert (=> start!55904 m!588223))

(assert (=> b!611787 m!588181))

(assert (=> b!611787 m!588181))

(declare-fun m!588225 () Bool)

(assert (=> b!611787 m!588225))

(assert (=> b!611786 m!588181))

(assert (=> b!611786 m!588209))

(declare-fun m!588227 () Bool)

(assert (=> b!611786 m!588227))

(assert (=> b!611783 m!588181))

(assert (=> b!611784 m!588209))

(declare-fun m!588229 () Bool)

(assert (=> b!611784 m!588229))

(declare-fun m!588231 () Bool)

(assert (=> b!611790 m!588231))

(assert (=> b!611796 m!588181))

(declare-fun m!588233 () Bool)

(assert (=> b!611796 m!588233))

(assert (=> b!611796 m!588181))

(assert (=> b!611796 m!588191))

(assert (=> b!611796 m!588181))

(declare-fun m!588235 () Bool)

(assert (=> b!611796 m!588235))

(assert (=> b!611796 m!588203))

(assert (=> b!611796 m!588181))

(assert (=> b!611796 m!588205))

(declare-fun m!588237 () Bool)

(assert (=> b!611788 m!588237))

(push 1)

(assert (not start!55904))

(assert (not b!611801))

(assert (not b!611788))

(assert (not b!611790))

(assert (not b!611798))

(assert (not b!611781))

(assert (not b!611780))

(assert (not b!611785))

(assert (not b!611797))

(assert (not b!611796))

(assert (not b!611787))

(assert (not b!611789))

(assert (not b!611791))

(assert (not b!611782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

