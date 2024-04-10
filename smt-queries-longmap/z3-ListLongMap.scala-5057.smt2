; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68854 () Bool)

(assert start!68854)

(declare-datatypes ((SeekEntryResult!8493 0))(
  ( (MissingZero!8493 (index!36340 (_ BitVec 32))) (Found!8493 (index!36341 (_ BitVec 32))) (Intermediate!8493 (undefined!9305 Bool) (index!36342 (_ BitVec 32)) (x!67187 (_ BitVec 32))) (Undefined!8493) (MissingVacant!8493 (index!36343 (_ BitVec 32))) )
))
(declare-fun lt!359109 () SeekEntryResult!8493)

(declare-fun lt!359116 () SeekEntryResult!8493)

(declare-fun b!802795 () Bool)

(declare-fun e!444883 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802795 (= e!444883 (not (or (not (= lt!359109 lt!359116)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359115 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43644 0))(
  ( (array!43645 (arr!20902 (Array (_ BitVec 32) (_ BitVec 64))) (size!21323 (_ BitVec 32))) )
))
(declare-fun lt!359111 () array!43644)

(declare-fun a!3170 () array!43644)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!359113 () (_ BitVec 64))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43644 (_ BitVec 32)) SeekEntryResult!8493)

(assert (=> b!802795 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359115 vacantAfter!23 lt!359113 lt!359111 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359115 vacantBefore!23 (select (arr!20902 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((Unit!27526 0))(
  ( (Unit!27527) )
))
(declare-fun lt!359114 () Unit!27526)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43644 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27526)

(assert (=> b!802795 (= lt!359114 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359115 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802795 (= lt!359115 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802796 () Bool)

(declare-fun e!444887 () Bool)

(assert (=> b!802796 (= e!444887 e!444883)))

(declare-fun res!547320 () Bool)

(assert (=> b!802796 (=> (not res!547320) (not e!444883))))

(declare-fun lt!359108 () SeekEntryResult!8493)

(assert (=> b!802796 (= res!547320 (and (= lt!359108 lt!359116) (not (= (select (arr!20902 a!3170) index!1236) (select (arr!20902 a!3170) j!153)))))))

(assert (=> b!802796 (= lt!359116 (Found!8493 j!153))))

(declare-fun b!802797 () Bool)

(declare-fun res!547316 () Bool)

(declare-fun e!444882 () Bool)

(assert (=> b!802797 (=> (not res!547316) (not e!444882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802797 (= res!547316 (validKeyInArray!0 k0!2044))))

(declare-fun b!802798 () Bool)

(declare-fun e!444885 () Bool)

(assert (=> b!802798 (= e!444885 e!444887)))

(declare-fun res!547319 () Bool)

(assert (=> b!802798 (=> (not res!547319) (not e!444887))))

(declare-fun lt!359117 () SeekEntryResult!8493)

(assert (=> b!802798 (= res!547319 (= lt!359117 lt!359108))))

(assert (=> b!802798 (= lt!359108 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20902 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43644 (_ BitVec 32)) SeekEntryResult!8493)

(assert (=> b!802798 (= lt!359117 (seekEntryOrOpen!0 (select (arr!20902 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802799 () Bool)

(declare-fun res!547324 () Bool)

(declare-fun e!444884 () Bool)

(assert (=> b!802799 (=> (not res!547324) (not e!444884))))

(declare-datatypes ((List!14865 0))(
  ( (Nil!14862) (Cons!14861 (h!15990 (_ BitVec 64)) (t!21180 List!14865)) )
))
(declare-fun arrayNoDuplicates!0 (array!43644 (_ BitVec 32) List!14865) Bool)

(assert (=> b!802799 (= res!547324 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14862))))

(declare-fun b!802800 () Bool)

(declare-fun res!547322 () Bool)

(assert (=> b!802800 (=> (not res!547322) (not e!444882))))

(assert (=> b!802800 (= res!547322 (and (= (size!21323 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21323 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21323 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802801 () Bool)

(declare-fun res!547314 () Bool)

(assert (=> b!802801 (=> (not res!547314) (not e!444884))))

(assert (=> b!802801 (= res!547314 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21323 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20902 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21323 a!3170)) (= (select (arr!20902 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802802 () Bool)

(declare-fun res!547315 () Bool)

(assert (=> b!802802 (=> (not res!547315) (not e!444884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43644 (_ BitVec 32)) Bool)

(assert (=> b!802802 (= res!547315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802803 () Bool)

(assert (=> b!802803 (= e!444882 e!444884)))

(declare-fun res!547325 () Bool)

(assert (=> b!802803 (=> (not res!547325) (not e!444884))))

(declare-fun lt!359112 () SeekEntryResult!8493)

(assert (=> b!802803 (= res!547325 (or (= lt!359112 (MissingZero!8493 i!1163)) (= lt!359112 (MissingVacant!8493 i!1163))))))

(assert (=> b!802803 (= lt!359112 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!547321 () Bool)

(assert (=> start!68854 (=> (not res!547321) (not e!444882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68854 (= res!547321 (validMask!0 mask!3266))))

(assert (=> start!68854 e!444882))

(assert (=> start!68854 true))

(declare-fun array_inv!16698 (array!43644) Bool)

(assert (=> start!68854 (array_inv!16698 a!3170)))

(declare-fun b!802804 () Bool)

(declare-fun res!547323 () Bool)

(assert (=> b!802804 (=> (not res!547323) (not e!444882))))

(declare-fun arrayContainsKey!0 (array!43644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802804 (= res!547323 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802805 () Bool)

(declare-fun res!547317 () Bool)

(assert (=> b!802805 (=> (not res!547317) (not e!444882))))

(assert (=> b!802805 (= res!547317 (validKeyInArray!0 (select (arr!20902 a!3170) j!153)))))

(declare-fun b!802806 () Bool)

(assert (=> b!802806 (= e!444884 e!444885)))

(declare-fun res!547318 () Bool)

(assert (=> b!802806 (=> (not res!547318) (not e!444885))))

(declare-fun lt!359110 () SeekEntryResult!8493)

(assert (=> b!802806 (= res!547318 (= lt!359110 lt!359109))))

(assert (=> b!802806 (= lt!359109 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359113 lt!359111 mask!3266))))

(assert (=> b!802806 (= lt!359110 (seekEntryOrOpen!0 lt!359113 lt!359111 mask!3266))))

(assert (=> b!802806 (= lt!359113 (select (store (arr!20902 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802806 (= lt!359111 (array!43645 (store (arr!20902 a!3170) i!1163 k0!2044) (size!21323 a!3170)))))

(assert (= (and start!68854 res!547321) b!802800))

(assert (= (and b!802800 res!547322) b!802805))

(assert (= (and b!802805 res!547317) b!802797))

(assert (= (and b!802797 res!547316) b!802804))

(assert (= (and b!802804 res!547323) b!802803))

(assert (= (and b!802803 res!547325) b!802802))

(assert (= (and b!802802 res!547315) b!802799))

(assert (= (and b!802799 res!547324) b!802801))

(assert (= (and b!802801 res!547314) b!802806))

(assert (= (and b!802806 res!547318) b!802798))

(assert (= (and b!802798 res!547319) b!802796))

(assert (= (and b!802796 res!547320) b!802795))

(declare-fun m!744349 () Bool)

(assert (=> b!802797 m!744349))

(declare-fun m!744351 () Bool)

(assert (=> b!802801 m!744351))

(declare-fun m!744353 () Bool)

(assert (=> b!802801 m!744353))

(declare-fun m!744355 () Bool)

(assert (=> b!802803 m!744355))

(declare-fun m!744357 () Bool)

(assert (=> b!802795 m!744357))

(declare-fun m!744359 () Bool)

(assert (=> b!802795 m!744359))

(assert (=> b!802795 m!744357))

(declare-fun m!744361 () Bool)

(assert (=> b!802795 m!744361))

(declare-fun m!744363 () Bool)

(assert (=> b!802795 m!744363))

(declare-fun m!744365 () Bool)

(assert (=> b!802795 m!744365))

(declare-fun m!744367 () Bool)

(assert (=> b!802796 m!744367))

(assert (=> b!802796 m!744357))

(assert (=> b!802805 m!744357))

(assert (=> b!802805 m!744357))

(declare-fun m!744369 () Bool)

(assert (=> b!802805 m!744369))

(declare-fun m!744371 () Bool)

(assert (=> b!802806 m!744371))

(declare-fun m!744373 () Bool)

(assert (=> b!802806 m!744373))

(declare-fun m!744375 () Bool)

(assert (=> b!802806 m!744375))

(declare-fun m!744377 () Bool)

(assert (=> b!802806 m!744377))

(declare-fun m!744379 () Bool)

(assert (=> b!802804 m!744379))

(declare-fun m!744381 () Bool)

(assert (=> start!68854 m!744381))

(declare-fun m!744383 () Bool)

(assert (=> start!68854 m!744383))

(declare-fun m!744385 () Bool)

(assert (=> b!802799 m!744385))

(assert (=> b!802798 m!744357))

(assert (=> b!802798 m!744357))

(declare-fun m!744387 () Bool)

(assert (=> b!802798 m!744387))

(assert (=> b!802798 m!744357))

(declare-fun m!744389 () Bool)

(assert (=> b!802798 m!744389))

(declare-fun m!744391 () Bool)

(assert (=> b!802802 m!744391))

(check-sat (not b!802805) (not b!802799) (not b!802804) (not b!802803) (not b!802795) (not b!802806) (not b!802797) (not start!68854) (not b!802798) (not b!802802))
(check-sat)
