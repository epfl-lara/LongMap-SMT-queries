; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53982 () Bool)

(assert start!53982)

(declare-fun res!377176 () Bool)

(declare-fun e!336651 () Bool)

(assert (=> start!53982 (=> (not res!377176) (not e!336651))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53982 (= res!377176 (validMask!0 mask!3053))))

(assert (=> start!53982 e!336651))

(assert (=> start!53982 true))

(declare-datatypes ((array!36826 0))(
  ( (array!36827 (arr!17686 (Array (_ BitVec 32) (_ BitVec 64))) (size!18050 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36826)

(declare-fun array_inv!13482 (array!36826) Bool)

(assert (=> start!53982 (array_inv!13482 a!2986)))

(declare-fun b!589683 () Bool)

(declare-fun res!377172 () Bool)

(assert (=> b!589683 (=> (not res!377172) (not e!336651))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589683 (= res!377172 (validKeyInArray!0 (select (arr!17686 a!2986) j!136)))))

(declare-fun b!589684 () Bool)

(declare-fun res!377165 () Bool)

(declare-fun e!336647 () Bool)

(assert (=> b!589684 (=> (not res!377165) (not e!336647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36826 (_ BitVec 32)) Bool)

(assert (=> b!589684 (= res!377165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589685 () Bool)

(declare-fun e!336650 () Bool)

(declare-fun e!336649 () Bool)

(assert (=> b!589685 (= e!336650 (not e!336649))))

(declare-fun res!377169 () Bool)

(assert (=> b!589685 (=> res!377169 e!336649)))

(declare-datatypes ((SeekEntryResult!6126 0))(
  ( (MissingZero!6126 (index!26734 (_ BitVec 32))) (Found!6126 (index!26735 (_ BitVec 32))) (Intermediate!6126 (undefined!6938 Bool) (index!26736 (_ BitVec 32)) (x!55524 (_ BitVec 32))) (Undefined!6126) (MissingVacant!6126 (index!26737 (_ BitVec 32))) )
))
(declare-fun lt!267478 () SeekEntryResult!6126)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589685 (= res!377169 (not (= lt!267478 (Found!6126 index!984))))))

(declare-datatypes ((Unit!18422 0))(
  ( (Unit!18423) )
))
(declare-fun lt!267481 () Unit!18422)

(declare-fun e!336652 () Unit!18422)

(assert (=> b!589685 (= lt!267481 e!336652)))

(declare-fun c!66626 () Bool)

(assert (=> b!589685 (= c!66626 (= lt!267478 Undefined!6126))))

(declare-fun lt!267483 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!267480 () array!36826)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36826 (_ BitVec 32)) SeekEntryResult!6126)

(assert (=> b!589685 (= lt!267478 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267483 lt!267480 mask!3053))))

(declare-fun e!336654 () Bool)

(assert (=> b!589685 e!336654))

(declare-fun res!377174 () Bool)

(assert (=> b!589685 (=> (not res!377174) (not e!336654))))

(declare-fun lt!267476 () (_ BitVec 32))

(declare-fun lt!267477 () SeekEntryResult!6126)

(assert (=> b!589685 (= res!377174 (= lt!267477 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267476 vacantSpotIndex!68 lt!267483 lt!267480 mask!3053)))))

(assert (=> b!589685 (= lt!267477 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267476 vacantSpotIndex!68 (select (arr!17686 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!589685 (= lt!267483 (select (store (arr!17686 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267484 () Unit!18422)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36826 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18422)

(assert (=> b!589685 (= lt!267484 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267476 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589685 (= lt!267476 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589686 () Bool)

(declare-fun res!377167 () Bool)

(assert (=> b!589686 (=> (not res!377167) (not e!336651))))

(declare-fun arrayContainsKey!0 (array!36826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589686 (= res!377167 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589687 () Bool)

(assert (=> b!589687 (= e!336651 e!336647)))

(declare-fun res!377166 () Bool)

(assert (=> b!589687 (=> (not res!377166) (not e!336647))))

(declare-fun lt!267482 () SeekEntryResult!6126)

(assert (=> b!589687 (= res!377166 (or (= lt!267482 (MissingZero!6126 i!1108)) (= lt!267482 (MissingVacant!6126 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36826 (_ BitVec 32)) SeekEntryResult!6126)

(assert (=> b!589687 (= lt!267482 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589688 () Bool)

(declare-fun res!377171 () Bool)

(assert (=> b!589688 (=> (not res!377171) (not e!336651))))

(assert (=> b!589688 (= res!377171 (and (= (size!18050 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18050 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18050 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589689 () Bool)

(declare-fun Unit!18424 () Unit!18422)

(assert (=> b!589689 (= e!336652 Unit!18424)))

(assert (=> b!589689 false))

(declare-fun b!589690 () Bool)

(declare-fun res!377177 () Bool)

(assert (=> b!589690 (=> (not res!377177) (not e!336647))))

(assert (=> b!589690 (= res!377177 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17686 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589691 () Bool)

(assert (=> b!589691 (= e!336649 true)))

(assert (=> b!589691 (= (select (store (arr!17686 a!2986) i!1108 k0!1786) index!984) (select (arr!17686 a!2986) j!136))))

(declare-fun b!589692 () Bool)

(declare-fun res!377170 () Bool)

(assert (=> b!589692 (=> (not res!377170) (not e!336647))))

(declare-datatypes ((List!11727 0))(
  ( (Nil!11724) (Cons!11723 (h!12768 (_ BitVec 64)) (t!17955 List!11727)) )
))
(declare-fun arrayNoDuplicates!0 (array!36826 (_ BitVec 32) List!11727) Bool)

(assert (=> b!589692 (= res!377170 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11724))))

(declare-fun b!589693 () Bool)

(declare-fun res!377168 () Bool)

(assert (=> b!589693 (=> (not res!377168) (not e!336651))))

(assert (=> b!589693 (= res!377168 (validKeyInArray!0 k0!1786))))

(declare-fun b!589694 () Bool)

(declare-fun Unit!18425 () Unit!18422)

(assert (=> b!589694 (= e!336652 Unit!18425)))

(declare-fun b!589695 () Bool)

(declare-fun e!336648 () Bool)

(assert (=> b!589695 (= e!336647 e!336648)))

(declare-fun res!377175 () Bool)

(assert (=> b!589695 (=> (not res!377175) (not e!336648))))

(assert (=> b!589695 (= res!377175 (= (select (store (arr!17686 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589695 (= lt!267480 (array!36827 (store (arr!17686 a!2986) i!1108 k0!1786) (size!18050 a!2986)))))

(declare-fun b!589696 () Bool)

(assert (=> b!589696 (= e!336648 e!336650)))

(declare-fun res!377173 () Bool)

(assert (=> b!589696 (=> (not res!377173) (not e!336650))))

(declare-fun lt!267479 () SeekEntryResult!6126)

(assert (=> b!589696 (= res!377173 (and (= lt!267479 (Found!6126 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17686 a!2986) index!984) (select (arr!17686 a!2986) j!136))) (not (= (select (arr!17686 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!589696 (= lt!267479 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17686 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589697 () Bool)

(assert (=> b!589697 (= e!336654 (= lt!267479 lt!267477))))

(assert (= (and start!53982 res!377176) b!589688))

(assert (= (and b!589688 res!377171) b!589683))

(assert (= (and b!589683 res!377172) b!589693))

(assert (= (and b!589693 res!377168) b!589686))

(assert (= (and b!589686 res!377167) b!589687))

(assert (= (and b!589687 res!377166) b!589684))

(assert (= (and b!589684 res!377165) b!589692))

(assert (= (and b!589692 res!377170) b!589690))

(assert (= (and b!589690 res!377177) b!589695))

(assert (= (and b!589695 res!377175) b!589696))

(assert (= (and b!589696 res!377173) b!589685))

(assert (= (and b!589685 res!377174) b!589697))

(assert (= (and b!589685 c!66626) b!589689))

(assert (= (and b!589685 (not c!66626)) b!589694))

(assert (= (and b!589685 (not res!377169)) b!589691))

(declare-fun m!568195 () Bool)

(assert (=> b!589683 m!568195))

(assert (=> b!589683 m!568195))

(declare-fun m!568197 () Bool)

(assert (=> b!589683 m!568197))

(declare-fun m!568199 () Bool)

(assert (=> b!589692 m!568199))

(declare-fun m!568201 () Bool)

(assert (=> b!589690 m!568201))

(declare-fun m!568203 () Bool)

(assert (=> b!589686 m!568203))

(declare-fun m!568205 () Bool)

(assert (=> b!589687 m!568205))

(declare-fun m!568207 () Bool)

(assert (=> b!589695 m!568207))

(declare-fun m!568209 () Bool)

(assert (=> b!589695 m!568209))

(assert (=> b!589691 m!568207))

(declare-fun m!568211 () Bool)

(assert (=> b!589691 m!568211))

(assert (=> b!589691 m!568195))

(declare-fun m!568213 () Bool)

(assert (=> b!589693 m!568213))

(declare-fun m!568215 () Bool)

(assert (=> b!589696 m!568215))

(assert (=> b!589696 m!568195))

(assert (=> b!589696 m!568195))

(declare-fun m!568217 () Bool)

(assert (=> b!589696 m!568217))

(declare-fun m!568219 () Bool)

(assert (=> b!589685 m!568219))

(declare-fun m!568221 () Bool)

(assert (=> b!589685 m!568221))

(assert (=> b!589685 m!568195))

(assert (=> b!589685 m!568207))

(declare-fun m!568223 () Bool)

(assert (=> b!589685 m!568223))

(declare-fun m!568225 () Bool)

(assert (=> b!589685 m!568225))

(assert (=> b!589685 m!568195))

(declare-fun m!568227 () Bool)

(assert (=> b!589685 m!568227))

(declare-fun m!568229 () Bool)

(assert (=> b!589685 m!568229))

(declare-fun m!568231 () Bool)

(assert (=> start!53982 m!568231))

(declare-fun m!568233 () Bool)

(assert (=> start!53982 m!568233))

(declare-fun m!568235 () Bool)

(assert (=> b!589684 m!568235))

(check-sat (not b!589693) (not start!53982) (not b!589696) (not b!589692) (not b!589683) (not b!589686) (not b!589687) (not b!589685) (not b!589684))
(check-sat)
