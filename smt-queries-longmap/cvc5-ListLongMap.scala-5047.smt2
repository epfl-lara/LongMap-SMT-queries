; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68792 () Bool)

(assert start!68792)

(declare-fun res!546274 () Bool)

(declare-fun e!444396 () Bool)

(assert (=> start!68792 (=> (not res!546274) (not e!444396))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68792 (= res!546274 (validMask!0 mask!3266))))

(assert (=> start!68792 e!444396))

(assert (=> start!68792 true))

(declare-datatypes ((array!43582 0))(
  ( (array!43583 (arr!20871 (Array (_ BitVec 32) (_ BitVec 64))) (size!21292 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43582)

(declare-fun array_inv!16667 (array!43582) Bool)

(assert (=> start!68792 (array_inv!16667 a!3170)))

(declare-fun b!801749 () Bool)

(declare-fun e!444398 () Bool)

(assert (=> b!801749 (= e!444398 (not (bvsge mask!3266 #b00000000000000000000000000000000)))))

(declare-fun lt!358420 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358418 () array!43582)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!358421 () (_ BitVec 64))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8462 0))(
  ( (MissingZero!8462 (index!36216 (_ BitVec 32))) (Found!8462 (index!36217 (_ BitVec 32))) (Intermediate!8462 (undefined!9274 Bool) (index!36218 (_ BitVec 32)) (x!67076 (_ BitVec 32))) (Undefined!8462) (MissingVacant!8462 (index!36219 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43582 (_ BitVec 32)) SeekEntryResult!8462)

(assert (=> b!801749 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358420 vacantAfter!23 lt!358421 lt!358418 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358420 vacantBefore!23 (select (arr!20871 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27464 0))(
  ( (Unit!27465) )
))
(declare-fun lt!358415 () Unit!27464)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43582 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27464)

(assert (=> b!801749 (= lt!358415 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358420 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801749 (= lt!358420 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801750 () Bool)

(declare-fun res!546278 () Bool)

(assert (=> b!801750 (=> (not res!546278) (not e!444396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801750 (= res!546278 (validKeyInArray!0 (select (arr!20871 a!3170) j!153)))))

(declare-fun b!801751 () Bool)

(declare-fun res!546273 () Bool)

(assert (=> b!801751 (=> (not res!546273) (not e!444396))))

(assert (=> b!801751 (= res!546273 (and (= (size!21292 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21292 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21292 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801752 () Bool)

(declare-fun res!546268 () Bool)

(declare-fun e!444395 () Bool)

(assert (=> b!801752 (=> (not res!546268) (not e!444395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43582 (_ BitVec 32)) Bool)

(assert (=> b!801752 (= res!546268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801753 () Bool)

(declare-fun res!546270 () Bool)

(assert (=> b!801753 (=> (not res!546270) (not e!444395))))

(assert (=> b!801753 (= res!546270 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21292 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20871 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21292 a!3170)) (= (select (arr!20871 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801754 () Bool)

(assert (=> b!801754 (= e!444396 e!444395)))

(declare-fun res!546277 () Bool)

(assert (=> b!801754 (=> (not res!546277) (not e!444395))))

(declare-fun lt!358416 () SeekEntryResult!8462)

(assert (=> b!801754 (= res!546277 (or (= lt!358416 (MissingZero!8462 i!1163)) (= lt!358416 (MissingVacant!8462 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43582 (_ BitVec 32)) SeekEntryResult!8462)

(assert (=> b!801754 (= lt!358416 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801755 () Bool)

(declare-fun res!546272 () Bool)

(assert (=> b!801755 (=> (not res!546272) (not e!444395))))

(declare-datatypes ((List!14834 0))(
  ( (Nil!14831) (Cons!14830 (h!15959 (_ BitVec 64)) (t!21149 List!14834)) )
))
(declare-fun arrayNoDuplicates!0 (array!43582 (_ BitVec 32) List!14834) Bool)

(assert (=> b!801755 (= res!546272 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14831))))

(declare-fun b!801756 () Bool)

(declare-fun res!546269 () Bool)

(assert (=> b!801756 (=> (not res!546269) (not e!444396))))

(assert (=> b!801756 (= res!546269 (validKeyInArray!0 k!2044))))

(declare-fun b!801757 () Bool)

(declare-fun res!546275 () Bool)

(assert (=> b!801757 (=> (not res!546275) (not e!444396))))

(declare-fun arrayContainsKey!0 (array!43582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801757 (= res!546275 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801758 () Bool)

(declare-fun e!444397 () Bool)

(assert (=> b!801758 (= e!444395 e!444397)))

(declare-fun res!546271 () Bool)

(assert (=> b!801758 (=> (not res!546271) (not e!444397))))

(assert (=> b!801758 (= res!546271 (= (seekEntryOrOpen!0 lt!358421 lt!358418 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358421 lt!358418 mask!3266)))))

(assert (=> b!801758 (= lt!358421 (select (store (arr!20871 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801758 (= lt!358418 (array!43583 (store (arr!20871 a!3170) i!1163 k!2044) (size!21292 a!3170)))))

(declare-fun b!801759 () Bool)

(assert (=> b!801759 (= e!444397 e!444398)))

(declare-fun res!546276 () Bool)

(assert (=> b!801759 (=> (not res!546276) (not e!444398))))

(declare-fun lt!358419 () SeekEntryResult!8462)

(declare-fun lt!358417 () SeekEntryResult!8462)

(assert (=> b!801759 (= res!546276 (and (= lt!358417 lt!358419) (= lt!358419 (Found!8462 j!153)) (not (= (select (arr!20871 a!3170) index!1236) (select (arr!20871 a!3170) j!153)))))))

(assert (=> b!801759 (= lt!358419 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20871 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801759 (= lt!358417 (seekEntryOrOpen!0 (select (arr!20871 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68792 res!546274) b!801751))

(assert (= (and b!801751 res!546273) b!801750))

(assert (= (and b!801750 res!546278) b!801756))

(assert (= (and b!801756 res!546269) b!801757))

(assert (= (and b!801757 res!546275) b!801754))

(assert (= (and b!801754 res!546277) b!801752))

(assert (= (and b!801752 res!546268) b!801755))

(assert (= (and b!801755 res!546272) b!801753))

(assert (= (and b!801753 res!546270) b!801758))

(assert (= (and b!801758 res!546271) b!801759))

(assert (= (and b!801759 res!546276) b!801749))

(declare-fun m!742967 () Bool)

(assert (=> b!801759 m!742967))

(declare-fun m!742969 () Bool)

(assert (=> b!801759 m!742969))

(assert (=> b!801759 m!742969))

(declare-fun m!742971 () Bool)

(assert (=> b!801759 m!742971))

(assert (=> b!801759 m!742969))

(declare-fun m!742973 () Bool)

(assert (=> b!801759 m!742973))

(declare-fun m!742975 () Bool)

(assert (=> b!801754 m!742975))

(declare-fun m!742977 () Bool)

(assert (=> b!801753 m!742977))

(declare-fun m!742979 () Bool)

(assert (=> b!801753 m!742979))

(assert (=> b!801750 m!742969))

(assert (=> b!801750 m!742969))

(declare-fun m!742981 () Bool)

(assert (=> b!801750 m!742981))

(assert (=> b!801749 m!742969))

(assert (=> b!801749 m!742969))

(declare-fun m!742983 () Bool)

(assert (=> b!801749 m!742983))

(declare-fun m!742985 () Bool)

(assert (=> b!801749 m!742985))

(declare-fun m!742987 () Bool)

(assert (=> b!801749 m!742987))

(declare-fun m!742989 () Bool)

(assert (=> b!801749 m!742989))

(declare-fun m!742991 () Bool)

(assert (=> b!801755 m!742991))

(declare-fun m!742993 () Bool)

(assert (=> b!801757 m!742993))

(declare-fun m!742995 () Bool)

(assert (=> b!801758 m!742995))

(declare-fun m!742997 () Bool)

(assert (=> b!801758 m!742997))

(declare-fun m!742999 () Bool)

(assert (=> b!801758 m!742999))

(declare-fun m!743001 () Bool)

(assert (=> b!801758 m!743001))

(declare-fun m!743003 () Bool)

(assert (=> b!801756 m!743003))

(declare-fun m!743005 () Bool)

(assert (=> start!68792 m!743005))

(declare-fun m!743007 () Bool)

(assert (=> start!68792 m!743007))

(declare-fun m!743009 () Bool)

(assert (=> b!801752 m!743009))

(push 1)

