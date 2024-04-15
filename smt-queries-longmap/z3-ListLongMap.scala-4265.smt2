; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59318 () Bool)

(assert start!59318)

(declare-fun b!654157 () Bool)

(declare-fun e!375635 () Bool)

(declare-fun e!375627 () Bool)

(assert (=> b!654157 (= e!375635 e!375627)))

(declare-fun res!424357 () Bool)

(assert (=> b!654157 (=> (not res!424357) (not e!375627))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38649 0))(
  ( (array!38650 (arr!18524 (Array (_ BitVec 32) (_ BitVec 64))) (size!18889 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38649)

(assert (=> b!654157 (= res!424357 (= (select (store (arr!18524 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!304613 () array!38649)

(assert (=> b!654157 (= lt!304613 (array!38650 (store (arr!18524 a!2986) i!1108 k0!1786) (size!18889 a!2986)))))

(declare-fun b!654158 () Bool)

(declare-fun res!424353 () Bool)

(assert (=> b!654158 (=> (not res!424353) (not e!375635))))

(declare-datatypes ((List!12604 0))(
  ( (Nil!12601) (Cons!12600 (h!13645 (_ BitVec 64)) (t!18823 List!12604)) )
))
(declare-fun arrayNoDuplicates!0 (array!38649 (_ BitVec 32) List!12604) Bool)

(assert (=> b!654158 (= res!424353 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12601))))

(declare-fun b!654159 () Bool)

(declare-fun res!424365 () Bool)

(declare-fun e!375630 () Bool)

(assert (=> b!654159 (=> (not res!424365) (not e!375630))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!654159 (= res!424365 (and (= (size!18889 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18889 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18889 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654160 () Bool)

(declare-fun e!375633 () Bool)

(assert (=> b!654160 (= e!375627 e!375633)))

(declare-fun res!424360 () Bool)

(assert (=> b!654160 (=> (not res!424360) (not e!375633))))

(declare-datatypes ((SeekEntryResult!6961 0))(
  ( (MissingZero!6961 (index!30203 (_ BitVec 32))) (Found!6961 (index!30204 (_ BitVec 32))) (Intermediate!6961 (undefined!7773 Bool) (index!30205 (_ BitVec 32)) (x!59005 (_ BitVec 32))) (Undefined!6961) (MissingVacant!6961 (index!30206 (_ BitVec 32))) )
))
(declare-fun lt!304615 () SeekEntryResult!6961)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!654160 (= res!424360 (and (= lt!304615 (Found!6961 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18524 a!2986) index!984) (select (arr!18524 a!2986) j!136))) (not (= (select (arr!18524 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38649 (_ BitVec 32)) SeekEntryResult!6961)

(assert (=> b!654160 (= lt!304615 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18524 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654161 () Bool)

(declare-datatypes ((Unit!22394 0))(
  ( (Unit!22395) )
))
(declare-fun e!375629 () Unit!22394)

(declare-fun Unit!22396 () Unit!22394)

(assert (=> b!654161 (= e!375629 Unit!22396)))

(declare-fun lt!304609 () Unit!22394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38649 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22394)

(assert (=> b!654161 (= lt!304609 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304613 (select (arr!18524 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654161 (arrayContainsKey!0 lt!304613 (select (arr!18524 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304621 () Unit!22394)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38649 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12604) Unit!22394)

(assert (=> b!654161 (= lt!304621 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12601))))

(assert (=> b!654161 (arrayNoDuplicates!0 lt!304613 #b00000000000000000000000000000000 Nil!12601)))

(declare-fun lt!304625 () Unit!22394)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38649 (_ BitVec 32) (_ BitVec 32)) Unit!22394)

(assert (=> b!654161 (= lt!304625 (lemmaNoDuplicateFromThenFromBigger!0 lt!304613 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654161 (arrayNoDuplicates!0 lt!304613 j!136 Nil!12601)))

(declare-fun lt!304623 () Unit!22394)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38649 (_ BitVec 64) (_ BitVec 32) List!12604) Unit!22394)

(assert (=> b!654161 (= lt!304623 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304613 (select (arr!18524 a!2986) j!136) j!136 Nil!12601))))

(assert (=> b!654161 false))

(declare-fun b!654162 () Bool)

(declare-fun e!375628 () Unit!22394)

(declare-fun Unit!22397 () Unit!22394)

(assert (=> b!654162 (= e!375628 Unit!22397)))

(declare-fun b!654163 () Bool)

(declare-fun e!375638 () Bool)

(declare-fun e!375636 () Bool)

(assert (=> b!654163 (= e!375638 e!375636)))

(declare-fun res!424364 () Bool)

(assert (=> b!654163 (=> res!424364 e!375636)))

(declare-fun lt!304608 () (_ BitVec 64))

(declare-fun lt!304611 () (_ BitVec 64))

(assert (=> b!654163 (= res!424364 (or (not (= (select (arr!18524 a!2986) j!136) lt!304608)) (not (= (select (arr!18524 a!2986) j!136) lt!304611)) (bvsge j!136 index!984)))))

(declare-fun b!654164 () Bool)

(declare-fun res!424355 () Bool)

(assert (=> b!654164 (=> (not res!424355) (not e!375630))))

(assert (=> b!654164 (= res!424355 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun e!375631 () Bool)

(declare-fun b!654165 () Bool)

(assert (=> b!654165 (= e!375631 (arrayContainsKey!0 lt!304613 (select (arr!18524 a!2986) j!136) index!984))))

(declare-fun b!654167 () Bool)

(declare-fun Unit!22398 () Unit!22394)

(assert (=> b!654167 (= e!375628 Unit!22398)))

(declare-fun res!424352 () Bool)

(assert (=> b!654167 (= res!424352 (arrayContainsKey!0 lt!304613 (select (arr!18524 a!2986) j!136) j!136))))

(declare-fun e!375639 () Bool)

(assert (=> b!654167 (=> (not res!424352) (not e!375639))))

(assert (=> b!654167 e!375639))

(declare-fun lt!304619 () Unit!22394)

(assert (=> b!654167 (= lt!304619 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304613 (select (arr!18524 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654167 (arrayContainsKey!0 lt!304613 (select (arr!18524 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304624 () Unit!22394)

(assert (=> b!654167 (= lt!304624 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12601))))

(assert (=> b!654167 (arrayNoDuplicates!0 lt!304613 #b00000000000000000000000000000000 Nil!12601)))

(declare-fun lt!304618 () Unit!22394)

(assert (=> b!654167 (= lt!304618 (lemmaNoDuplicateFromThenFromBigger!0 lt!304613 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654167 (arrayNoDuplicates!0 lt!304613 index!984 Nil!12601)))

(declare-fun lt!304620 () Unit!22394)

(assert (=> b!654167 (= lt!304620 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304613 (select (arr!18524 a!2986) j!136) index!984 Nil!12601))))

(assert (=> b!654167 false))

(declare-fun b!654168 () Bool)

(assert (=> b!654168 (= e!375630 e!375635)))

(declare-fun res!424366 () Bool)

(assert (=> b!654168 (=> (not res!424366) (not e!375635))))

(declare-fun lt!304612 () SeekEntryResult!6961)

(assert (=> b!654168 (= res!424366 (or (= lt!304612 (MissingZero!6961 i!1108)) (= lt!304612 (MissingVacant!6961 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38649 (_ BitVec 32)) SeekEntryResult!6961)

(assert (=> b!654168 (= lt!304612 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!654169 () Bool)

(declare-fun e!375632 () Unit!22394)

(declare-fun Unit!22399 () Unit!22394)

(assert (=> b!654169 (= e!375632 Unit!22399)))

(assert (=> b!654169 false))

(declare-fun b!654170 () Bool)

(declare-fun res!424358 () Bool)

(assert (=> b!654170 (=> (not res!424358) (not e!375635))))

(assert (=> b!654170 (= res!424358 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18524 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654171 () Bool)

(assert (=> b!654171 (= e!375639 (arrayContainsKey!0 lt!304613 (select (arr!18524 a!2986) j!136) index!984))))

(declare-fun b!654172 () Bool)

(declare-fun e!375637 () Bool)

(declare-fun e!375641 () Bool)

(assert (=> b!654172 (= e!375637 e!375641)))

(declare-fun res!424359 () Bool)

(assert (=> b!654172 (=> res!424359 e!375641)))

(assert (=> b!654172 (= res!424359 (or (not (= (select (arr!18524 a!2986) j!136) lt!304608)) (not (= (select (arr!18524 a!2986) j!136) lt!304611))))))

(assert (=> b!654172 e!375638))

(declare-fun res!424349 () Bool)

(assert (=> b!654172 (=> (not res!424349) (not e!375638))))

(assert (=> b!654172 (= res!424349 (= lt!304611 (select (arr!18524 a!2986) j!136)))))

(assert (=> b!654172 (= lt!304611 (select (store (arr!18524 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!654173 () Bool)

(declare-fun Unit!22400 () Unit!22394)

(assert (=> b!654173 (= e!375632 Unit!22400)))

(declare-fun b!654174 () Bool)

(assert (=> b!654174 (= e!375633 (not e!375637))))

(declare-fun res!424363 () Bool)

(assert (=> b!654174 (=> res!424363 e!375637)))

(declare-fun lt!304617 () SeekEntryResult!6961)

(assert (=> b!654174 (= res!424363 (not (= lt!304617 (Found!6961 index!984))))))

(declare-fun lt!304610 () Unit!22394)

(assert (=> b!654174 (= lt!304610 e!375632)))

(declare-fun c!75272 () Bool)

(assert (=> b!654174 (= c!75272 (= lt!304617 Undefined!6961))))

(assert (=> b!654174 (= lt!304617 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304608 lt!304613 mask!3053))))

(declare-fun e!375634 () Bool)

(assert (=> b!654174 e!375634))

(declare-fun res!424356 () Bool)

(assert (=> b!654174 (=> (not res!424356) (not e!375634))))

(declare-fun lt!304614 () SeekEntryResult!6961)

(declare-fun lt!304607 () (_ BitVec 32))

(assert (=> b!654174 (= res!424356 (= lt!304614 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304607 vacantSpotIndex!68 lt!304608 lt!304613 mask!3053)))))

(assert (=> b!654174 (= lt!304614 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304607 vacantSpotIndex!68 (select (arr!18524 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654174 (= lt!304608 (select (store (arr!18524 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!304616 () Unit!22394)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22394)

(assert (=> b!654174 (= lt!304616 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304607 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654174 (= lt!304607 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!654175 () Bool)

(declare-fun res!424351 () Bool)

(assert (=> b!654175 (=> (not res!424351) (not e!375630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654175 (= res!424351 (validKeyInArray!0 k0!1786))))

(declare-fun b!654176 () Bool)

(assert (=> b!654176 (= e!375636 e!375631)))

(declare-fun res!424354 () Bool)

(assert (=> b!654176 (=> (not res!424354) (not e!375631))))

(assert (=> b!654176 (= res!424354 (arrayContainsKey!0 lt!304613 (select (arr!18524 a!2986) j!136) j!136))))

(declare-fun b!654177 () Bool)

(declare-fun Unit!22401 () Unit!22394)

(assert (=> b!654177 (= e!375629 Unit!22401)))

(declare-fun b!654178 () Bool)

(declare-fun res!424362 () Bool)

(assert (=> b!654178 (=> (not res!424362) (not e!375635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38649 (_ BitVec 32)) Bool)

(assert (=> b!654178 (= res!424362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654166 () Bool)

(declare-fun res!424361 () Bool)

(assert (=> b!654166 (=> (not res!424361) (not e!375630))))

(assert (=> b!654166 (= res!424361 (validKeyInArray!0 (select (arr!18524 a!2986) j!136)))))

(declare-fun res!424350 () Bool)

(assert (=> start!59318 (=> (not res!424350) (not e!375630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59318 (= res!424350 (validMask!0 mask!3053))))

(assert (=> start!59318 e!375630))

(assert (=> start!59318 true))

(declare-fun array_inv!14407 (array!38649) Bool)

(assert (=> start!59318 (array_inv!14407 a!2986)))

(declare-fun b!654179 () Bool)

(assert (=> b!654179 (= e!375641 false)))

(declare-fun lt!304622 () Unit!22394)

(assert (=> b!654179 (= lt!304622 e!375628)))

(declare-fun c!75273 () Bool)

(assert (=> b!654179 (= c!75273 (bvslt index!984 j!136))))

(declare-fun lt!304626 () Unit!22394)

(assert (=> b!654179 (= lt!304626 e!375629)))

(declare-fun c!75271 () Bool)

(assert (=> b!654179 (= c!75271 (bvslt j!136 index!984))))

(declare-fun b!654180 () Bool)

(assert (=> b!654180 (= e!375634 (= lt!304615 lt!304614))))

(assert (= (and start!59318 res!424350) b!654159))

(assert (= (and b!654159 res!424365) b!654166))

(assert (= (and b!654166 res!424361) b!654175))

(assert (= (and b!654175 res!424351) b!654164))

(assert (= (and b!654164 res!424355) b!654168))

(assert (= (and b!654168 res!424366) b!654178))

(assert (= (and b!654178 res!424362) b!654158))

(assert (= (and b!654158 res!424353) b!654170))

(assert (= (and b!654170 res!424358) b!654157))

(assert (= (and b!654157 res!424357) b!654160))

(assert (= (and b!654160 res!424360) b!654174))

(assert (= (and b!654174 res!424356) b!654180))

(assert (= (and b!654174 c!75272) b!654169))

(assert (= (and b!654174 (not c!75272)) b!654173))

(assert (= (and b!654174 (not res!424363)) b!654172))

(assert (= (and b!654172 res!424349) b!654163))

(assert (= (and b!654163 (not res!424364)) b!654176))

(assert (= (and b!654176 res!424354) b!654165))

(assert (= (and b!654172 (not res!424359)) b!654179))

(assert (= (and b!654179 c!75271) b!654161))

(assert (= (and b!654179 (not c!75271)) b!654177))

(assert (= (and b!654179 c!75273) b!654167))

(assert (= (and b!654179 (not c!75273)) b!654162))

(assert (= (and b!654167 res!424352) b!654171))

(declare-fun m!626775 () Bool)

(assert (=> b!654163 m!626775))

(declare-fun m!626777 () Bool)

(assert (=> b!654175 m!626777))

(assert (=> b!654166 m!626775))

(assert (=> b!654166 m!626775))

(declare-fun m!626779 () Bool)

(assert (=> b!654166 m!626779))

(assert (=> b!654172 m!626775))

(declare-fun m!626781 () Bool)

(assert (=> b!654172 m!626781))

(declare-fun m!626783 () Bool)

(assert (=> b!654172 m!626783))

(declare-fun m!626785 () Bool)

(assert (=> start!59318 m!626785))

(declare-fun m!626787 () Bool)

(assert (=> start!59318 m!626787))

(declare-fun m!626789 () Bool)

(assert (=> b!654168 m!626789))

(assert (=> b!654167 m!626775))

(declare-fun m!626791 () Bool)

(assert (=> b!654167 m!626791))

(declare-fun m!626793 () Bool)

(assert (=> b!654167 m!626793))

(assert (=> b!654167 m!626775))

(declare-fun m!626795 () Bool)

(assert (=> b!654167 m!626795))

(declare-fun m!626797 () Bool)

(assert (=> b!654167 m!626797))

(assert (=> b!654167 m!626775))

(declare-fun m!626799 () Bool)

(assert (=> b!654167 m!626799))

(declare-fun m!626801 () Bool)

(assert (=> b!654167 m!626801))

(declare-fun m!626803 () Bool)

(assert (=> b!654167 m!626803))

(assert (=> b!654167 m!626775))

(declare-fun m!626805 () Bool)

(assert (=> b!654167 m!626805))

(assert (=> b!654167 m!626775))

(assert (=> b!654171 m!626775))

(assert (=> b!654171 m!626775))

(declare-fun m!626807 () Bool)

(assert (=> b!654171 m!626807))

(assert (=> b!654165 m!626775))

(assert (=> b!654165 m!626775))

(assert (=> b!654165 m!626807))

(declare-fun m!626809 () Bool)

(assert (=> b!654164 m!626809))

(assert (=> b!654157 m!626781))

(declare-fun m!626811 () Bool)

(assert (=> b!654157 m!626811))

(assert (=> b!654161 m!626775))

(declare-fun m!626813 () Bool)

(assert (=> b!654161 m!626813))

(assert (=> b!654161 m!626775))

(declare-fun m!626815 () Bool)

(assert (=> b!654161 m!626815))

(assert (=> b!654161 m!626775))

(declare-fun m!626817 () Bool)

(assert (=> b!654161 m!626817))

(declare-fun m!626819 () Bool)

(assert (=> b!654161 m!626819))

(assert (=> b!654161 m!626793))

(assert (=> b!654161 m!626775))

(declare-fun m!626821 () Bool)

(assert (=> b!654161 m!626821))

(assert (=> b!654161 m!626803))

(declare-fun m!626823 () Bool)

(assert (=> b!654160 m!626823))

(assert (=> b!654160 m!626775))

(assert (=> b!654160 m!626775))

(declare-fun m!626825 () Bool)

(assert (=> b!654160 m!626825))

(declare-fun m!626827 () Bool)

(assert (=> b!654170 m!626827))

(declare-fun m!626829 () Bool)

(assert (=> b!654174 m!626829))

(assert (=> b!654174 m!626775))

(assert (=> b!654174 m!626781))

(declare-fun m!626831 () Bool)

(assert (=> b!654174 m!626831))

(declare-fun m!626833 () Bool)

(assert (=> b!654174 m!626833))

(declare-fun m!626835 () Bool)

(assert (=> b!654174 m!626835))

(declare-fun m!626837 () Bool)

(assert (=> b!654174 m!626837))

(assert (=> b!654174 m!626775))

(declare-fun m!626839 () Bool)

(assert (=> b!654174 m!626839))

(declare-fun m!626841 () Bool)

(assert (=> b!654178 m!626841))

(declare-fun m!626843 () Bool)

(assert (=> b!654158 m!626843))

(assert (=> b!654176 m!626775))

(assert (=> b!654176 m!626775))

(assert (=> b!654176 m!626795))

(check-sat (not b!654176) (not b!654164) (not b!654161) (not b!654158) (not b!654168) (not b!654166) (not b!654167) (not b!654174) (not b!654165) (not start!59318) (not b!654160) (not b!654175) (not b!654178) (not b!654171))
(check-sat)
