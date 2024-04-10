; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57804 () Bool)

(assert start!57804)

(declare-fun b!639191 () Bool)

(declare-fun e!365807 () Bool)

(declare-fun e!365808 () Bool)

(assert (=> b!639191 (= e!365807 e!365808)))

(declare-fun res!413767 () Bool)

(assert (=> b!639191 (=> (not res!413767) (not e!365808))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38306 0))(
  ( (array!38307 (arr!18374 (Array (_ BitVec 32) (_ BitVec 64))) (size!18738 (_ BitVec 32))) )
))
(declare-fun lt!295661 () array!38306)

(declare-fun a!2986 () array!38306)

(declare-fun arrayContainsKey!0 (array!38306 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639191 (= res!413767 (arrayContainsKey!0 lt!295661 (select (arr!18374 a!2986) j!136) j!136))))

(declare-fun b!639192 () Bool)

(declare-fun res!413770 () Bool)

(declare-fun e!365803 () Bool)

(assert (=> b!639192 (=> (not res!413770) (not e!365803))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639192 (= res!413770 (validKeyInArray!0 k!1786))))

(declare-fun b!639193 () Bool)

(declare-fun res!413766 () Bool)

(assert (=> b!639193 (=> (not res!413766) (not e!365803))))

(assert (=> b!639193 (= res!413766 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639194 () Bool)

(declare-fun res!413776 () Bool)

(declare-fun e!365814 () Bool)

(assert (=> b!639194 (=> (not res!413776) (not e!365814))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639194 (= res!413776 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18374 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639195 () Bool)

(declare-fun e!365804 () Bool)

(assert (=> b!639195 (= e!365804 e!365807)))

(declare-fun res!413763 () Bool)

(assert (=> b!639195 (=> res!413763 e!365807)))

(declare-fun lt!295655 () (_ BitVec 64))

(declare-fun lt!295657 () (_ BitVec 64))

(assert (=> b!639195 (= res!413763 (or (not (= (select (arr!18374 a!2986) j!136) lt!295657)) (not (= (select (arr!18374 a!2986) j!136) lt!295655)) (bvsge j!136 index!984)))))

(declare-fun b!639196 () Bool)

(assert (=> b!639196 (= e!365803 e!365814)))

(declare-fun res!413777 () Bool)

(assert (=> b!639196 (=> (not res!413777) (not e!365814))))

(declare-datatypes ((SeekEntryResult!6814 0))(
  ( (MissingZero!6814 (index!29573 (_ BitVec 32))) (Found!6814 (index!29574 (_ BitVec 32))) (Intermediate!6814 (undefined!7626 Bool) (index!29575 (_ BitVec 32)) (x!58329 (_ BitVec 32))) (Undefined!6814) (MissingVacant!6814 (index!29576 (_ BitVec 32))) )
))
(declare-fun lt!295659 () SeekEntryResult!6814)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!639196 (= res!413777 (or (= lt!295659 (MissingZero!6814 i!1108)) (= lt!295659 (MissingVacant!6814 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38306 (_ BitVec 32)) SeekEntryResult!6814)

(assert (=> b!639196 (= lt!295659 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!639197 () Bool)

(declare-datatypes ((Unit!21590 0))(
  ( (Unit!21591) )
))
(declare-fun e!365805 () Unit!21590)

(declare-fun Unit!21592 () Unit!21590)

(assert (=> b!639197 (= e!365805 Unit!21592)))

(declare-fun b!639198 () Bool)

(declare-fun e!365810 () Bool)

(declare-fun lt!295662 () SeekEntryResult!6814)

(declare-fun lt!295664 () SeekEntryResult!6814)

(assert (=> b!639198 (= e!365810 (= lt!295662 lt!295664))))

(declare-fun b!639199 () Bool)

(assert (=> b!639199 (= e!365808 (arrayContainsKey!0 lt!295661 (select (arr!18374 a!2986) j!136) index!984))))

(declare-fun b!639200 () Bool)

(declare-fun res!413775 () Bool)

(assert (=> b!639200 (=> (not res!413775) (not e!365803))))

(assert (=> b!639200 (= res!413775 (validKeyInArray!0 (select (arr!18374 a!2986) j!136)))))

(declare-fun b!639201 () Bool)

(declare-fun e!365806 () Bool)

(assert (=> b!639201 (= e!365814 e!365806)))

(declare-fun res!413769 () Bool)

(assert (=> b!639201 (=> (not res!413769) (not e!365806))))

(assert (=> b!639201 (= res!413769 (= (select (store (arr!18374 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639201 (= lt!295661 (array!38307 (store (arr!18374 a!2986) i!1108 k!1786) (size!18738 a!2986)))))

(declare-fun b!639202 () Bool)

(declare-fun res!413773 () Bool)

(assert (=> b!639202 (=> (not res!413773) (not e!365814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38306 (_ BitVec 32)) Bool)

(assert (=> b!639202 (= res!413773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639203 () Bool)

(declare-fun e!365813 () Bool)

(declare-fun e!365811 () Bool)

(assert (=> b!639203 (= e!365813 e!365811)))

(declare-fun res!413768 () Bool)

(assert (=> b!639203 (=> res!413768 e!365811)))

(assert (=> b!639203 (= res!413768 (or (not (= (select (arr!18374 a!2986) j!136) lt!295657)) (not (= (select (arr!18374 a!2986) j!136) lt!295655)) (bvsge j!136 index!984)))))

(assert (=> b!639203 e!365804))

(declare-fun res!413761 () Bool)

(assert (=> b!639203 (=> (not res!413761) (not e!365804))))

(assert (=> b!639203 (= res!413761 (= lt!295655 (select (arr!18374 a!2986) j!136)))))

(assert (=> b!639203 (= lt!295655 (select (store (arr!18374 a!2986) i!1108 k!1786) index!984))))

(declare-fun res!413764 () Bool)

(assert (=> start!57804 (=> (not res!413764) (not e!365803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57804 (= res!413764 (validMask!0 mask!3053))))

(assert (=> start!57804 e!365803))

(assert (=> start!57804 true))

(declare-fun array_inv!14170 (array!38306) Bool)

(assert (=> start!57804 (array_inv!14170 a!2986)))

(declare-fun b!639204 () Bool)

(declare-fun e!365812 () Bool)

(assert (=> b!639204 (= e!365812 (not e!365813))))

(declare-fun res!413772 () Bool)

(assert (=> b!639204 (=> res!413772 e!365813)))

(declare-fun lt!295666 () SeekEntryResult!6814)

(assert (=> b!639204 (= res!413772 (not (= lt!295666 (Found!6814 index!984))))))

(declare-fun lt!295658 () Unit!21590)

(assert (=> b!639204 (= lt!295658 e!365805)))

(declare-fun c!73082 () Bool)

(assert (=> b!639204 (= c!73082 (= lt!295666 Undefined!6814))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38306 (_ BitVec 32)) SeekEntryResult!6814)

(assert (=> b!639204 (= lt!295666 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295657 lt!295661 mask!3053))))

(assert (=> b!639204 e!365810))

(declare-fun res!413774 () Bool)

(assert (=> b!639204 (=> (not res!413774) (not e!365810))))

(declare-fun lt!295656 () (_ BitVec 32))

(assert (=> b!639204 (= res!413774 (= lt!295664 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295656 vacantSpotIndex!68 lt!295657 lt!295661 mask!3053)))))

(assert (=> b!639204 (= lt!295664 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295656 vacantSpotIndex!68 (select (arr!18374 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639204 (= lt!295657 (select (store (arr!18374 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295665 () Unit!21590)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38306 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21590)

(assert (=> b!639204 (= lt!295665 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295656 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639204 (= lt!295656 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639205 () Bool)

(assert (=> b!639205 (= e!365806 e!365812)))

(declare-fun res!413765 () Bool)

(assert (=> b!639205 (=> (not res!413765) (not e!365812))))

(assert (=> b!639205 (= res!413765 (and (= lt!295662 (Found!6814 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18374 a!2986) index!984) (select (arr!18374 a!2986) j!136))) (not (= (select (arr!18374 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!639205 (= lt!295662 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18374 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639206 () Bool)

(declare-fun res!413771 () Bool)

(assert (=> b!639206 (=> (not res!413771) (not e!365814))))

(declare-datatypes ((List!12415 0))(
  ( (Nil!12412) (Cons!12411 (h!13456 (_ BitVec 64)) (t!18643 List!12415)) )
))
(declare-fun arrayNoDuplicates!0 (array!38306 (_ BitVec 32) List!12415) Bool)

(assert (=> b!639206 (= res!413771 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12412))))

(declare-fun b!639207 () Bool)

(declare-fun res!413762 () Bool)

(assert (=> b!639207 (=> (not res!413762) (not e!365803))))

(assert (=> b!639207 (= res!413762 (and (= (size!18738 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18738 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18738 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639208 () Bool)

(declare-fun Unit!21593 () Unit!21590)

(assert (=> b!639208 (= e!365805 Unit!21593)))

(assert (=> b!639208 false))

(declare-fun b!639209 () Bool)

(assert (=> b!639209 (= e!365811 true)))

(assert (=> b!639209 (arrayNoDuplicates!0 lt!295661 #b00000000000000000000000000000000 Nil!12412)))

(declare-fun lt!295660 () Unit!21590)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38306 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12415) Unit!21590)

(assert (=> b!639209 (= lt!295660 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12412))))

(assert (=> b!639209 (arrayContainsKey!0 lt!295661 (select (arr!18374 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295663 () Unit!21590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38306 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21590)

(assert (=> b!639209 (= lt!295663 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295661 (select (arr!18374 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!57804 res!413764) b!639207))

(assert (= (and b!639207 res!413762) b!639200))

(assert (= (and b!639200 res!413775) b!639192))

(assert (= (and b!639192 res!413770) b!639193))

(assert (= (and b!639193 res!413766) b!639196))

(assert (= (and b!639196 res!413777) b!639202))

(assert (= (and b!639202 res!413773) b!639206))

(assert (= (and b!639206 res!413771) b!639194))

(assert (= (and b!639194 res!413776) b!639201))

(assert (= (and b!639201 res!413769) b!639205))

(assert (= (and b!639205 res!413765) b!639204))

(assert (= (and b!639204 res!413774) b!639198))

(assert (= (and b!639204 c!73082) b!639208))

(assert (= (and b!639204 (not c!73082)) b!639197))

(assert (= (and b!639204 (not res!413772)) b!639203))

(assert (= (and b!639203 res!413761) b!639195))

(assert (= (and b!639195 (not res!413763)) b!639191))

(assert (= (and b!639191 res!413767) b!639199))

(assert (= (and b!639203 (not res!413768)) b!639209))

(declare-fun m!613067 () Bool)

(assert (=> b!639194 m!613067))

(declare-fun m!613069 () Bool)

(assert (=> b!639199 m!613069))

(assert (=> b!639199 m!613069))

(declare-fun m!613071 () Bool)

(assert (=> b!639199 m!613071))

(declare-fun m!613073 () Bool)

(assert (=> b!639209 m!613073))

(assert (=> b!639209 m!613069))

(assert (=> b!639209 m!613069))

(declare-fun m!613075 () Bool)

(assert (=> b!639209 m!613075))

(assert (=> b!639209 m!613069))

(declare-fun m!613077 () Bool)

(assert (=> b!639209 m!613077))

(declare-fun m!613079 () Bool)

(assert (=> b!639209 m!613079))

(declare-fun m!613081 () Bool)

(assert (=> b!639206 m!613081))

(declare-fun m!613083 () Bool)

(assert (=> b!639201 m!613083))

(declare-fun m!613085 () Bool)

(assert (=> b!639201 m!613085))

(declare-fun m!613087 () Bool)

(assert (=> b!639205 m!613087))

(assert (=> b!639205 m!613069))

(assert (=> b!639205 m!613069))

(declare-fun m!613089 () Bool)

(assert (=> b!639205 m!613089))

(declare-fun m!613091 () Bool)

(assert (=> start!57804 m!613091))

(declare-fun m!613093 () Bool)

(assert (=> start!57804 m!613093))

(declare-fun m!613095 () Bool)

(assert (=> b!639202 m!613095))

(assert (=> b!639191 m!613069))

(assert (=> b!639191 m!613069))

(declare-fun m!613097 () Bool)

(assert (=> b!639191 m!613097))

(assert (=> b!639195 m!613069))

(assert (=> b!639200 m!613069))

(assert (=> b!639200 m!613069))

(declare-fun m!613099 () Bool)

(assert (=> b!639200 m!613099))

(declare-fun m!613101 () Bool)

(assert (=> b!639193 m!613101))

(declare-fun m!613103 () Bool)

(assert (=> b!639192 m!613103))

(assert (=> b!639203 m!613069))

(assert (=> b!639203 m!613083))

(declare-fun m!613105 () Bool)

(assert (=> b!639203 m!613105))

(declare-fun m!613107 () Bool)

(assert (=> b!639196 m!613107))

(declare-fun m!613109 () Bool)

(assert (=> b!639204 m!613109))

(declare-fun m!613111 () Bool)

(assert (=> b!639204 m!613111))

(assert (=> b!639204 m!613069))

(declare-fun m!613113 () Bool)

(assert (=> b!639204 m!613113))

(assert (=> b!639204 m!613069))

(assert (=> b!639204 m!613083))

(declare-fun m!613115 () Bool)

(assert (=> b!639204 m!613115))

(declare-fun m!613117 () Bool)

(assert (=> b!639204 m!613117))

(declare-fun m!613119 () Bool)

(assert (=> b!639204 m!613119))

(push 1)

