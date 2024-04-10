; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69638 () Bool)

(assert start!69638)

(declare-fun b!811307 () Bool)

(declare-fun e!449057 () Bool)

(declare-fun e!449059 () Bool)

(assert (=> b!811307 (= e!449057 e!449059)))

(declare-fun res!554359 () Bool)

(assert (=> b!811307 (=> (not res!554359) (not e!449059))))

(declare-datatypes ((SeekEntryResult!8699 0))(
  ( (MissingZero!8699 (index!37167 (_ BitVec 32))) (Found!8699 (index!37168 (_ BitVec 32))) (Intermediate!8699 (undefined!9511 Bool) (index!37169 (_ BitVec 32)) (x!67984 (_ BitVec 32))) (Undefined!8699) (MissingVacant!8699 (index!37170 (_ BitVec 32))) )
))
(declare-fun lt!363731 () SeekEntryResult!8699)

(declare-datatypes ((array!44077 0))(
  ( (array!44078 (arr!21108 (Array (_ BitVec 32) (_ BitVec 64))) (size!21529 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44077)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!363729 () SeekEntryResult!8699)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!811307 (= res!554359 (and (= lt!363729 lt!363731) (= lt!363731 (Found!8699 j!153)) (not (= (select (arr!21108 a!3170) index!1236) (select (arr!21108 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44077 (_ BitVec 32)) SeekEntryResult!8699)

(assert (=> b!811307 (= lt!363731 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21108 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44077 (_ BitVec 32)) SeekEntryResult!8699)

(assert (=> b!811307 (= lt!363729 (seekEntryOrOpen!0 (select (arr!21108 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!554350 () Bool)

(declare-fun e!449056 () Bool)

(assert (=> start!69638 (=> (not res!554350) (not e!449056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69638 (= res!554350 (validMask!0 mask!3266))))

(assert (=> start!69638 e!449056))

(assert (=> start!69638 true))

(declare-fun array_inv!16904 (array!44077) Bool)

(assert (=> start!69638 (array_inv!16904 a!3170)))

(declare-fun b!811308 () Bool)

(declare-fun res!554356 () Bool)

(assert (=> b!811308 (=> (not res!554356) (not e!449056))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811308 (= res!554356 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811309 () Bool)

(declare-fun e!449060 () Bool)

(assert (=> b!811309 (= e!449056 e!449060)))

(declare-fun res!554352 () Bool)

(assert (=> b!811309 (=> (not res!554352) (not e!449060))))

(declare-fun lt!363730 () SeekEntryResult!8699)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!811309 (= res!554352 (or (= lt!363730 (MissingZero!8699 i!1163)) (= lt!363730 (MissingVacant!8699 i!1163))))))

(assert (=> b!811309 (= lt!363730 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!811310 () Bool)

(declare-fun res!554358 () Bool)

(assert (=> b!811310 (=> (not res!554358) (not e!449056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811310 (= res!554358 (validKeyInArray!0 k!2044))))

(declare-fun b!811311 () Bool)

(declare-fun res!554360 () Bool)

(assert (=> b!811311 (=> (not res!554360) (not e!449060))))

(declare-datatypes ((List!15071 0))(
  ( (Nil!15068) (Cons!15067 (h!16196 (_ BitVec 64)) (t!21386 List!15071)) )
))
(declare-fun arrayNoDuplicates!0 (array!44077 (_ BitVec 32) List!15071) Bool)

(assert (=> b!811311 (= res!554360 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15068))))

(declare-fun b!811312 () Bool)

(declare-fun res!554354 () Bool)

(assert (=> b!811312 (=> (not res!554354) (not e!449056))))

(assert (=> b!811312 (= res!554354 (validKeyInArray!0 (select (arr!21108 a!3170) j!153)))))

(declare-fun b!811313 () Bool)

(assert (=> b!811313 (= e!449059 (not true))))

(declare-fun lt!363727 () (_ BitVec 64))

(declare-fun lt!363728 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363725 () array!44077)

(assert (=> b!811313 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363728 vacantAfter!23 lt!363727 lt!363725 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363728 vacantBefore!23 (select (arr!21108 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27660 0))(
  ( (Unit!27661) )
))
(declare-fun lt!363726 () Unit!27660)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44077 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27660)

(assert (=> b!811313 (= lt!363726 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363728 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811313 (= lt!363728 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811314 () Bool)

(assert (=> b!811314 (= e!449060 e!449057)))

(declare-fun res!554355 () Bool)

(assert (=> b!811314 (=> (not res!554355) (not e!449057))))

(assert (=> b!811314 (= res!554355 (= (seekEntryOrOpen!0 lt!363727 lt!363725 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363727 lt!363725 mask!3266)))))

(assert (=> b!811314 (= lt!363727 (select (store (arr!21108 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!811314 (= lt!363725 (array!44078 (store (arr!21108 a!3170) i!1163 k!2044) (size!21529 a!3170)))))

(declare-fun b!811315 () Bool)

(declare-fun res!554357 () Bool)

(assert (=> b!811315 (=> (not res!554357) (not e!449060))))

(assert (=> b!811315 (= res!554357 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21529 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21108 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21529 a!3170)) (= (select (arr!21108 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!811316 () Bool)

(declare-fun res!554351 () Bool)

(assert (=> b!811316 (=> (not res!554351) (not e!449060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44077 (_ BitVec 32)) Bool)

(assert (=> b!811316 (= res!554351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811317 () Bool)

(declare-fun res!554353 () Bool)

(assert (=> b!811317 (=> (not res!554353) (not e!449056))))

(assert (=> b!811317 (= res!554353 (and (= (size!21529 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21529 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21529 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69638 res!554350) b!811317))

(assert (= (and b!811317 res!554353) b!811312))

(assert (= (and b!811312 res!554354) b!811310))

(assert (= (and b!811310 res!554358) b!811308))

(assert (= (and b!811308 res!554356) b!811309))

(assert (= (and b!811309 res!554352) b!811316))

(assert (= (and b!811316 res!554351) b!811311))

(assert (= (and b!811311 res!554360) b!811315))

(assert (= (and b!811315 res!554357) b!811314))

(assert (= (and b!811314 res!554355) b!811307))

(assert (= (and b!811307 res!554359) b!811313))

(declare-fun m!753611 () Bool)

(assert (=> b!811309 m!753611))

(declare-fun m!753613 () Bool)

(assert (=> b!811313 m!753613))

(declare-fun m!753615 () Bool)

(assert (=> b!811313 m!753615))

(declare-fun m!753617 () Bool)

(assert (=> b!811313 m!753617))

(assert (=> b!811313 m!753615))

(declare-fun m!753619 () Bool)

(assert (=> b!811313 m!753619))

(declare-fun m!753621 () Bool)

(assert (=> b!811313 m!753621))

(declare-fun m!753623 () Bool)

(assert (=> b!811316 m!753623))

(declare-fun m!753625 () Bool)

(assert (=> b!811315 m!753625))

(declare-fun m!753627 () Bool)

(assert (=> b!811315 m!753627))

(declare-fun m!753629 () Bool)

(assert (=> b!811311 m!753629))

(assert (=> b!811312 m!753615))

(assert (=> b!811312 m!753615))

(declare-fun m!753631 () Bool)

(assert (=> b!811312 m!753631))

(declare-fun m!753633 () Bool)

(assert (=> b!811310 m!753633))

(declare-fun m!753635 () Bool)

(assert (=> b!811314 m!753635))

(declare-fun m!753637 () Bool)

(assert (=> b!811314 m!753637))

(declare-fun m!753639 () Bool)

(assert (=> b!811314 m!753639))

(declare-fun m!753641 () Bool)

(assert (=> b!811314 m!753641))

(declare-fun m!753643 () Bool)

(assert (=> start!69638 m!753643))

(declare-fun m!753645 () Bool)

(assert (=> start!69638 m!753645))

(declare-fun m!753647 () Bool)

(assert (=> b!811308 m!753647))

(declare-fun m!753649 () Bool)

(assert (=> b!811307 m!753649))

(assert (=> b!811307 m!753615))

(assert (=> b!811307 m!753615))

(declare-fun m!753651 () Bool)

(assert (=> b!811307 m!753651))

(assert (=> b!811307 m!753615))

(declare-fun m!753653 () Bool)

(assert (=> b!811307 m!753653))

(push 1)

