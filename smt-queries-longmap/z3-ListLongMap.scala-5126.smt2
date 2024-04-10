; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69640 () Bool)

(assert start!69640)

(declare-fun b!811340 () Bool)

(declare-fun res!554393 () Bool)

(declare-fun e!449073 () Bool)

(assert (=> b!811340 (=> (not res!554393) (not e!449073))))

(declare-datatypes ((array!44079 0))(
  ( (array!44080 (arr!21109 (Array (_ BitVec 32) (_ BitVec 64))) (size!21530 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44079)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811340 (= res!554393 (validKeyInArray!0 (select (arr!21109 a!3170) j!153)))))

(declare-fun b!811341 () Bool)

(declare-fun e!449071 () Bool)

(declare-fun e!449074 () Bool)

(assert (=> b!811341 (= e!449071 e!449074)))

(declare-fun res!554389 () Bool)

(assert (=> b!811341 (=> (not res!554389) (not e!449074))))

(declare-datatypes ((SeekEntryResult!8700 0))(
  ( (MissingZero!8700 (index!37171 (_ BitVec 32))) (Found!8700 (index!37172 (_ BitVec 32))) (Intermediate!8700 (undefined!9512 Bool) (index!37173 (_ BitVec 32)) (x!67985 (_ BitVec 32))) (Undefined!8700) (MissingVacant!8700 (index!37174 (_ BitVec 32))) )
))
(declare-fun lt!363748 () SeekEntryResult!8700)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!363751 () SeekEntryResult!8700)

(assert (=> b!811341 (= res!554389 (and (= lt!363751 lt!363748) (= lt!363748 (Found!8700 j!153)) (not (= (select (arr!21109 a!3170) index!1236) (select (arr!21109 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44079 (_ BitVec 32)) SeekEntryResult!8700)

(assert (=> b!811341 (= lt!363748 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21109 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44079 (_ BitVec 32)) SeekEntryResult!8700)

(assert (=> b!811341 (= lt!363751 (seekEntryOrOpen!0 (select (arr!21109 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811342 () Bool)

(declare-fun e!449075 () Bool)

(assert (=> b!811342 (= e!449075 e!449071)))

(declare-fun res!554391 () Bool)

(assert (=> b!811342 (=> (not res!554391) (not e!449071))))

(declare-fun lt!363747 () array!44079)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363752 () (_ BitVec 64))

(assert (=> b!811342 (= res!554391 (= (seekEntryOrOpen!0 lt!363752 lt!363747 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363752 lt!363747 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!811342 (= lt!363752 (select (store (arr!21109 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811342 (= lt!363747 (array!44080 (store (arr!21109 a!3170) i!1163 k0!2044) (size!21530 a!3170)))))

(declare-fun b!811343 () Bool)

(declare-fun res!554384 () Bool)

(assert (=> b!811343 (=> (not res!554384) (not e!449073))))

(assert (=> b!811343 (= res!554384 (validKeyInArray!0 k0!2044))))

(declare-fun b!811344 () Bool)

(declare-fun res!554388 () Bool)

(assert (=> b!811344 (=> (not res!554388) (not e!449073))))

(declare-fun arrayContainsKey!0 (array!44079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811344 (= res!554388 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811346 () Bool)

(declare-fun res!554392 () Bool)

(assert (=> b!811346 (=> (not res!554392) (not e!449075))))

(assert (=> b!811346 (= res!554392 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21530 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21109 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21530 a!3170)) (= (select (arr!21109 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811347 () Bool)

(declare-fun res!554386 () Bool)

(assert (=> b!811347 (=> (not res!554386) (not e!449075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44079 (_ BitVec 32)) Bool)

(assert (=> b!811347 (= res!554386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811348 () Bool)

(assert (=> b!811348 (= e!449073 e!449075)))

(declare-fun res!554383 () Bool)

(assert (=> b!811348 (=> (not res!554383) (not e!449075))))

(declare-fun lt!363746 () SeekEntryResult!8700)

(assert (=> b!811348 (= res!554383 (or (= lt!363746 (MissingZero!8700 i!1163)) (= lt!363746 (MissingVacant!8700 i!1163))))))

(assert (=> b!811348 (= lt!363746 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811349 () Bool)

(declare-fun res!554390 () Bool)

(assert (=> b!811349 (=> (not res!554390) (not e!449075))))

(declare-datatypes ((List!15072 0))(
  ( (Nil!15069) (Cons!15068 (h!16197 (_ BitVec 64)) (t!21387 List!15072)) )
))
(declare-fun arrayNoDuplicates!0 (array!44079 (_ BitVec 32) List!15072) Bool)

(assert (=> b!811349 (= res!554390 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15069))))

(declare-fun b!811350 () Bool)

(declare-fun res!554385 () Bool)

(assert (=> b!811350 (=> (not res!554385) (not e!449073))))

(assert (=> b!811350 (= res!554385 (and (= (size!21530 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21530 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21530 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!554387 () Bool)

(assert (=> start!69640 (=> (not res!554387) (not e!449073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69640 (= res!554387 (validMask!0 mask!3266))))

(assert (=> start!69640 e!449073))

(assert (=> start!69640 true))

(declare-fun array_inv!16905 (array!44079) Bool)

(assert (=> start!69640 (array_inv!16905 a!3170)))

(declare-fun b!811345 () Bool)

(assert (=> b!811345 (= e!449074 (not true))))

(declare-fun lt!363750 () (_ BitVec 32))

(assert (=> b!811345 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363750 vacantAfter!23 lt!363752 lt!363747 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363750 vacantBefore!23 (select (arr!21109 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27662 0))(
  ( (Unit!27663) )
))
(declare-fun lt!363749 () Unit!27662)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44079 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27662)

(assert (=> b!811345 (= lt!363749 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363750 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811345 (= lt!363750 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!69640 res!554387) b!811350))

(assert (= (and b!811350 res!554385) b!811340))

(assert (= (and b!811340 res!554393) b!811343))

(assert (= (and b!811343 res!554384) b!811344))

(assert (= (and b!811344 res!554388) b!811348))

(assert (= (and b!811348 res!554383) b!811347))

(assert (= (and b!811347 res!554386) b!811349))

(assert (= (and b!811349 res!554390) b!811346))

(assert (= (and b!811346 res!554392) b!811342))

(assert (= (and b!811342 res!554391) b!811341))

(assert (= (and b!811341 res!554389) b!811345))

(declare-fun m!753655 () Bool)

(assert (=> b!811348 m!753655))

(declare-fun m!753657 () Bool)

(assert (=> b!811346 m!753657))

(declare-fun m!753659 () Bool)

(assert (=> b!811346 m!753659))

(declare-fun m!753661 () Bool)

(assert (=> b!811344 m!753661))

(declare-fun m!753663 () Bool)

(assert (=> b!811342 m!753663))

(declare-fun m!753665 () Bool)

(assert (=> b!811342 m!753665))

(declare-fun m!753667 () Bool)

(assert (=> b!811342 m!753667))

(declare-fun m!753669 () Bool)

(assert (=> b!811342 m!753669))

(declare-fun m!753671 () Bool)

(assert (=> b!811343 m!753671))

(declare-fun m!753673 () Bool)

(assert (=> b!811347 m!753673))

(declare-fun m!753675 () Bool)

(assert (=> b!811345 m!753675))

(declare-fun m!753677 () Bool)

(assert (=> b!811345 m!753677))

(assert (=> b!811345 m!753675))

(declare-fun m!753679 () Bool)

(assert (=> b!811345 m!753679))

(declare-fun m!753681 () Bool)

(assert (=> b!811345 m!753681))

(declare-fun m!753683 () Bool)

(assert (=> b!811345 m!753683))

(declare-fun m!753685 () Bool)

(assert (=> start!69640 m!753685))

(declare-fun m!753687 () Bool)

(assert (=> start!69640 m!753687))

(declare-fun m!753689 () Bool)

(assert (=> b!811341 m!753689))

(assert (=> b!811341 m!753675))

(assert (=> b!811341 m!753675))

(declare-fun m!753691 () Bool)

(assert (=> b!811341 m!753691))

(assert (=> b!811341 m!753675))

(declare-fun m!753693 () Bool)

(assert (=> b!811341 m!753693))

(declare-fun m!753695 () Bool)

(assert (=> b!811349 m!753695))

(assert (=> b!811340 m!753675))

(assert (=> b!811340 m!753675))

(declare-fun m!753697 () Bool)

(assert (=> b!811340 m!753697))

(check-sat (not b!811349) (not start!69640) (not b!811344) (not b!811343) (not b!811340) (not b!811345) (not b!811341) (not b!811348) (not b!811347) (not b!811342))
(check-sat)
