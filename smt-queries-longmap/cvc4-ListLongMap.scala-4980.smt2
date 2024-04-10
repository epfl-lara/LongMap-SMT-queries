; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68394 () Bool)

(assert start!68394)

(declare-fun b!794787 () Bool)

(declare-fun res!539311 () Bool)

(declare-fun e!441251 () Bool)

(assert (=> b!794787 (=> (not res!539311) (not e!441251))))

(declare-datatypes ((array!43184 0))(
  ( (array!43185 (arr!20672 (Array (_ BitVec 32) (_ BitVec 64))) (size!21093 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43184)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794787 (= res!539311 (and (= (size!21093 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21093 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21093 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794788 () Bool)

(declare-fun res!539310 () Bool)

(declare-fun e!441249 () Bool)

(assert (=> b!794788 (=> (not res!539310) (not e!441249))))

(declare-datatypes ((List!14635 0))(
  ( (Nil!14632) (Cons!14631 (h!15760 (_ BitVec 64)) (t!20950 List!14635)) )
))
(declare-fun arrayNoDuplicates!0 (array!43184 (_ BitVec 32) List!14635) Bool)

(assert (=> b!794788 (= res!539310 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14632))))

(declare-fun b!794789 () Bool)

(declare-fun res!539314 () Bool)

(assert (=> b!794789 (=> (not res!539314) (not e!441251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794789 (= res!539314 (validKeyInArray!0 (select (arr!20672 a!3170) j!153)))))

(declare-fun b!794790 () Bool)

(declare-fun res!539315 () Bool)

(assert (=> b!794790 (=> (not res!539315) (not e!441249))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794790 (= res!539315 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21093 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20672 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21093 a!3170)) (= (select (arr!20672 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794791 () Bool)

(assert (=> b!794791 (= e!441251 e!441249)))

(declare-fun res!539313 () Bool)

(assert (=> b!794791 (=> (not res!539313) (not e!441249))))

(declare-datatypes ((SeekEntryResult!8263 0))(
  ( (MissingZero!8263 (index!35420 (_ BitVec 32))) (Found!8263 (index!35421 (_ BitVec 32))) (Intermediate!8263 (undefined!9075 Bool) (index!35422 (_ BitVec 32)) (x!66341 (_ BitVec 32))) (Undefined!8263) (MissingVacant!8263 (index!35423 (_ BitVec 32))) )
))
(declare-fun lt!354295 () SeekEntryResult!8263)

(assert (=> b!794791 (= res!539313 (or (= lt!354295 (MissingZero!8263 i!1163)) (= lt!354295 (MissingVacant!8263 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43184 (_ BitVec 32)) SeekEntryResult!8263)

(assert (=> b!794791 (= lt!354295 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794793 () Bool)

(declare-fun e!441250 () Bool)

(assert (=> b!794793 (= e!441249 e!441250)))

(declare-fun res!539307 () Bool)

(assert (=> b!794793 (=> (not res!539307) (not e!441250))))

(declare-fun lt!354292 () (_ BitVec 64))

(declare-fun lt!354293 () array!43184)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43184 (_ BitVec 32)) SeekEntryResult!8263)

(assert (=> b!794793 (= res!539307 (= (seekEntryOrOpen!0 lt!354292 lt!354293 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354292 lt!354293 mask!3266)))))

(assert (=> b!794793 (= lt!354292 (select (store (arr!20672 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794793 (= lt!354293 (array!43185 (store (arr!20672 a!3170) i!1163 k!2044) (size!21093 a!3170)))))

(declare-fun b!794794 () Bool)

(declare-fun res!539312 () Bool)

(assert (=> b!794794 (=> (not res!539312) (not e!441251))))

(declare-fun arrayContainsKey!0 (array!43184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794794 (= res!539312 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794795 () Bool)

(declare-fun res!539309 () Bool)

(assert (=> b!794795 (=> (not res!539309) (not e!441251))))

(assert (=> b!794795 (= res!539309 (validKeyInArray!0 k!2044))))

(declare-fun b!794796 () Bool)

(assert (=> b!794796 (= e!441250 false)))

(declare-fun lt!354296 () SeekEntryResult!8263)

(assert (=> b!794796 (= lt!354296 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20672 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354294 () SeekEntryResult!8263)

(assert (=> b!794796 (= lt!354294 (seekEntryOrOpen!0 (select (arr!20672 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!539308 () Bool)

(assert (=> start!68394 (=> (not res!539308) (not e!441251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68394 (= res!539308 (validMask!0 mask!3266))))

(assert (=> start!68394 e!441251))

(assert (=> start!68394 true))

(declare-fun array_inv!16468 (array!43184) Bool)

(assert (=> start!68394 (array_inv!16468 a!3170)))

(declare-fun b!794792 () Bool)

(declare-fun res!539306 () Bool)

(assert (=> b!794792 (=> (not res!539306) (not e!441249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43184 (_ BitVec 32)) Bool)

(assert (=> b!794792 (= res!539306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68394 res!539308) b!794787))

(assert (= (and b!794787 res!539311) b!794789))

(assert (= (and b!794789 res!539314) b!794795))

(assert (= (and b!794795 res!539309) b!794794))

(assert (= (and b!794794 res!539312) b!794791))

(assert (= (and b!794791 res!539313) b!794792))

(assert (= (and b!794792 res!539306) b!794788))

(assert (= (and b!794788 res!539310) b!794790))

(assert (= (and b!794790 res!539315) b!794793))

(assert (= (and b!794793 res!539307) b!794796))

(declare-fun m!735355 () Bool)

(assert (=> start!68394 m!735355))

(declare-fun m!735357 () Bool)

(assert (=> start!68394 m!735357))

(declare-fun m!735359 () Bool)

(assert (=> b!794793 m!735359))

(declare-fun m!735361 () Bool)

(assert (=> b!794793 m!735361))

(declare-fun m!735363 () Bool)

(assert (=> b!794793 m!735363))

(declare-fun m!735365 () Bool)

(assert (=> b!794793 m!735365))

(declare-fun m!735367 () Bool)

(assert (=> b!794794 m!735367))

(declare-fun m!735369 () Bool)

(assert (=> b!794796 m!735369))

(assert (=> b!794796 m!735369))

(declare-fun m!735371 () Bool)

(assert (=> b!794796 m!735371))

(assert (=> b!794796 m!735369))

(declare-fun m!735373 () Bool)

(assert (=> b!794796 m!735373))

(declare-fun m!735375 () Bool)

(assert (=> b!794790 m!735375))

(declare-fun m!735377 () Bool)

(assert (=> b!794790 m!735377))

(declare-fun m!735379 () Bool)

(assert (=> b!794795 m!735379))

(declare-fun m!735381 () Bool)

(assert (=> b!794791 m!735381))

(declare-fun m!735383 () Bool)

(assert (=> b!794788 m!735383))

(declare-fun m!735385 () Bool)

(assert (=> b!794792 m!735385))

(assert (=> b!794789 m!735369))

(assert (=> b!794789 m!735369))

(declare-fun m!735387 () Bool)

(assert (=> b!794789 m!735387))

(push 1)

(assert (not b!794796))

