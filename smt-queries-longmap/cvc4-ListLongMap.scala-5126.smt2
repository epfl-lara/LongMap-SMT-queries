; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69642 () Bool)

(assert start!69642)

(declare-fun b!811373 () Bool)

(declare-fun e!449086 () Bool)

(declare-fun e!449088 () Bool)

(assert (=> b!811373 (= e!449086 e!449088)))

(declare-fun res!554424 () Bool)

(assert (=> b!811373 (=> (not res!554424) (not e!449088))))

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8701 0))(
  ( (MissingZero!8701 (index!37175 (_ BitVec 32))) (Found!8701 (index!37176 (_ BitVec 32))) (Intermediate!8701 (undefined!9513 Bool) (index!37177 (_ BitVec 32)) (x!67986 (_ BitVec 32))) (Undefined!8701) (MissingVacant!8701 (index!37178 (_ BitVec 32))) )
))
(declare-fun lt!363770 () SeekEntryResult!8701)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!44081 0))(
  ( (array!44082 (arr!21110 (Array (_ BitVec 32) (_ BitVec 64))) (size!21531 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44081)

(declare-fun lt!363768 () SeekEntryResult!8701)

(assert (=> b!811373 (= res!554424 (and (= lt!363770 lt!363768) (= lt!363768 (Found!8701 j!153)) (not (= (select (arr!21110 a!3170) index!1236) (select (arr!21110 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44081 (_ BitVec 32)) SeekEntryResult!8701)

(assert (=> b!811373 (= lt!363768 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21110 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44081 (_ BitVec 32)) SeekEntryResult!8701)

(assert (=> b!811373 (= lt!363770 (seekEntryOrOpen!0 (select (arr!21110 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811374 () Bool)

(declare-fun res!554421 () Bool)

(declare-fun e!449089 () Bool)

(assert (=> b!811374 (=> (not res!554421) (not e!449089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811374 (= res!554421 (validKeyInArray!0 (select (arr!21110 a!3170) j!153)))))

(declare-fun b!811375 () Bool)

(declare-fun res!554417 () Bool)

(declare-fun e!449087 () Bool)

(assert (=> b!811375 (=> (not res!554417) (not e!449087))))

(declare-datatypes ((List!15073 0))(
  ( (Nil!15070) (Cons!15069 (h!16198 (_ BitVec 64)) (t!21388 List!15073)) )
))
(declare-fun arrayNoDuplicates!0 (array!44081 (_ BitVec 32) List!15073) Bool)

(assert (=> b!811375 (= res!554417 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15070))))

(declare-fun b!811376 () Bool)

(assert (=> b!811376 (= e!449089 e!449087)))

(declare-fun res!554419 () Bool)

(assert (=> b!811376 (=> (not res!554419) (not e!449087))))

(declare-fun lt!363767 () SeekEntryResult!8701)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!811376 (= res!554419 (or (= lt!363767 (MissingZero!8701 i!1163)) (= lt!363767 (MissingVacant!8701 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!811376 (= lt!363767 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!811377 () Bool)

(declare-fun res!554418 () Bool)

(assert (=> b!811377 (=> (not res!554418) (not e!449087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44081 (_ BitVec 32)) Bool)

(assert (=> b!811377 (= res!554418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811379 () Bool)

(declare-fun res!554425 () Bool)

(assert (=> b!811379 (=> (not res!554425) (not e!449089))))

(assert (=> b!811379 (= res!554425 (and (= (size!21531 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21531 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21531 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811380 () Bool)

(assert (=> b!811380 (= e!449088 (not true))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363773 () (_ BitVec 64))

(declare-fun lt!363769 () (_ BitVec 32))

(declare-fun lt!363772 () array!44081)

(assert (=> b!811380 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363769 vacantAfter!23 lt!363773 lt!363772 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363769 vacantBefore!23 (select (arr!21110 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27664 0))(
  ( (Unit!27665) )
))
(declare-fun lt!363771 () Unit!27664)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44081 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27664)

(assert (=> b!811380 (= lt!363771 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!363769 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811380 (= lt!363769 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811381 () Bool)

(declare-fun res!554426 () Bool)

(assert (=> b!811381 (=> (not res!554426) (not e!449089))))

(assert (=> b!811381 (= res!554426 (validKeyInArray!0 k!2044))))

(declare-fun b!811382 () Bool)

(assert (=> b!811382 (= e!449087 e!449086)))

(declare-fun res!554416 () Bool)

(assert (=> b!811382 (=> (not res!554416) (not e!449086))))

(assert (=> b!811382 (= res!554416 (= (seekEntryOrOpen!0 lt!363773 lt!363772 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363773 lt!363772 mask!3266)))))

(assert (=> b!811382 (= lt!363773 (select (store (arr!21110 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!811382 (= lt!363772 (array!44082 (store (arr!21110 a!3170) i!1163 k!2044) (size!21531 a!3170)))))

(declare-fun b!811383 () Bool)

(declare-fun res!554420 () Bool)

(assert (=> b!811383 (=> (not res!554420) (not e!449089))))

(declare-fun arrayContainsKey!0 (array!44081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811383 (= res!554420 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!554423 () Bool)

(assert (=> start!69642 (=> (not res!554423) (not e!449089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69642 (= res!554423 (validMask!0 mask!3266))))

(assert (=> start!69642 e!449089))

(assert (=> start!69642 true))

(declare-fun array_inv!16906 (array!44081) Bool)

(assert (=> start!69642 (array_inv!16906 a!3170)))

(declare-fun b!811378 () Bool)

(declare-fun res!554422 () Bool)

(assert (=> b!811378 (=> (not res!554422) (not e!449087))))

(assert (=> b!811378 (= res!554422 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21531 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21110 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21531 a!3170)) (= (select (arr!21110 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69642 res!554423) b!811379))

(assert (= (and b!811379 res!554425) b!811374))

(assert (= (and b!811374 res!554421) b!811381))

(assert (= (and b!811381 res!554426) b!811383))

(assert (= (and b!811383 res!554420) b!811376))

(assert (= (and b!811376 res!554419) b!811377))

(assert (= (and b!811377 res!554418) b!811375))

(assert (= (and b!811375 res!554417) b!811378))

(assert (= (and b!811378 res!554422) b!811382))

(assert (= (and b!811382 res!554416) b!811373))

(assert (= (and b!811373 res!554424) b!811380))

(declare-fun m!753699 () Bool)

(assert (=> b!811373 m!753699))

(declare-fun m!753701 () Bool)

(assert (=> b!811373 m!753701))

(assert (=> b!811373 m!753701))

(declare-fun m!753703 () Bool)

(assert (=> b!811373 m!753703))

(assert (=> b!811373 m!753701))

(declare-fun m!753705 () Bool)

(assert (=> b!811373 m!753705))

(declare-fun m!753707 () Bool)

(assert (=> b!811377 m!753707))

(assert (=> b!811374 m!753701))

(assert (=> b!811374 m!753701))

(declare-fun m!753709 () Bool)

(assert (=> b!811374 m!753709))

(declare-fun m!753711 () Bool)

(assert (=> b!811380 m!753711))

(assert (=> b!811380 m!753701))

(declare-fun m!753713 () Bool)

(assert (=> b!811380 m!753713))

(declare-fun m!753715 () Bool)

(assert (=> b!811380 m!753715))

(assert (=> b!811380 m!753701))

(declare-fun m!753717 () Bool)

(assert (=> b!811380 m!753717))

(declare-fun m!753719 () Bool)

(assert (=> start!69642 m!753719))

(declare-fun m!753721 () Bool)

(assert (=> start!69642 m!753721))

(declare-fun m!753723 () Bool)

(assert (=> b!811378 m!753723))

(declare-fun m!753725 () Bool)

(assert (=> b!811378 m!753725))

(declare-fun m!753727 () Bool)

(assert (=> b!811376 m!753727))

(declare-fun m!753729 () Bool)

(assert (=> b!811381 m!753729))

(declare-fun m!753731 () Bool)

(assert (=> b!811375 m!753731))

(declare-fun m!753733 () Bool)

(assert (=> b!811383 m!753733))

(declare-fun m!753735 () Bool)

(assert (=> b!811382 m!753735))

(declare-fun m!753737 () Bool)

(assert (=> b!811382 m!753737))

(declare-fun m!753739 () Bool)

(assert (=> b!811382 m!753739))

(declare-fun m!753741 () Bool)

(assert (=> b!811382 m!753741))

(push 1)

(assert (not b!811373))

(assert (not b!811381))

(assert (not b!811375))

(assert (not b!811380))

(assert (not b!811376))

(assert (not b!811374))

