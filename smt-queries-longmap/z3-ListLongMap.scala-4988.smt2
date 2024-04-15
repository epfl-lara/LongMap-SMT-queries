; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68418 () Bool)

(assert start!68418)

(declare-fun b!795215 () Bool)

(declare-fun res!539883 () Bool)

(declare-fun e!441358 () Bool)

(assert (=> b!795215 (=> (not res!539883) (not e!441358))))

(declare-datatypes ((array!43225 0))(
  ( (array!43226 (arr!20693 (Array (_ BitVec 32) (_ BitVec 64))) (size!21114 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43225)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795215 (= res!539883 (validKeyInArray!0 (select (arr!20693 a!3170) j!153)))))

(declare-fun b!795216 () Bool)

(declare-fun res!539875 () Bool)

(assert (=> b!795216 (=> (not res!539875) (not e!441358))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!795216 (= res!539875 (validKeyInArray!0 k0!2044))))

(declare-fun b!795217 () Bool)

(declare-fun e!441361 () Bool)

(declare-fun e!441359 () Bool)

(assert (=> b!795217 (= e!441361 e!441359)))

(declare-fun res!539878 () Bool)

(assert (=> b!795217 (=> (not res!539878) (not e!441359))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354346 () array!43225)

(declare-fun lt!354347 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8281 0))(
  ( (MissingZero!8281 (index!35492 (_ BitVec 32))) (Found!8281 (index!35493 (_ BitVec 32))) (Intermediate!8281 (undefined!9093 Bool) (index!35494 (_ BitVec 32)) (x!66418 (_ BitVec 32))) (Undefined!8281) (MissingVacant!8281 (index!35495 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43225 (_ BitVec 32)) SeekEntryResult!8281)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43225 (_ BitVec 32)) SeekEntryResult!8281)

(assert (=> b!795217 (= res!539878 (= (seekEntryOrOpen!0 lt!354347 lt!354346 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354347 lt!354346 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795217 (= lt!354347 (select (store (arr!20693 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795217 (= lt!354346 (array!43226 (store (arr!20693 a!3170) i!1163 k0!2044) (size!21114 a!3170)))))

(declare-fun b!795218 () Bool)

(declare-fun res!539880 () Bool)

(assert (=> b!795218 (=> (not res!539880) (not e!441361))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795218 (= res!539880 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21114 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20693 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21114 a!3170)) (= (select (arr!20693 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795219 () Bool)

(assert (=> b!795219 (= e!441359 false)))

(declare-fun lt!354349 () SeekEntryResult!8281)

(assert (=> b!795219 (= lt!354349 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20693 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354348 () SeekEntryResult!8281)

(assert (=> b!795219 (= lt!354348 (seekEntryOrOpen!0 (select (arr!20693 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795220 () Bool)

(declare-fun res!539881 () Bool)

(assert (=> b!795220 (=> (not res!539881) (not e!441358))))

(assert (=> b!795220 (= res!539881 (and (= (size!21114 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21114 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21114 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!539882 () Bool)

(assert (=> start!68418 (=> (not res!539882) (not e!441358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68418 (= res!539882 (validMask!0 mask!3266))))

(assert (=> start!68418 e!441358))

(assert (=> start!68418 true))

(declare-fun array_inv!16576 (array!43225) Bool)

(assert (=> start!68418 (array_inv!16576 a!3170)))

(declare-fun b!795221 () Bool)

(declare-fun res!539879 () Bool)

(assert (=> b!795221 (=> (not res!539879) (not e!441361))))

(declare-datatypes ((List!14695 0))(
  ( (Nil!14692) (Cons!14691 (h!15820 (_ BitVec 64)) (t!21001 List!14695)) )
))
(declare-fun arrayNoDuplicates!0 (array!43225 (_ BitVec 32) List!14695) Bool)

(assert (=> b!795221 (= res!539879 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14692))))

(declare-fun b!795222 () Bool)

(declare-fun res!539874 () Bool)

(assert (=> b!795222 (=> (not res!539874) (not e!441358))))

(declare-fun arrayContainsKey!0 (array!43225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795222 (= res!539874 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795223 () Bool)

(declare-fun res!539876 () Bool)

(assert (=> b!795223 (=> (not res!539876) (not e!441361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43225 (_ BitVec 32)) Bool)

(assert (=> b!795223 (= res!539876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795224 () Bool)

(assert (=> b!795224 (= e!441358 e!441361)))

(declare-fun res!539877 () Bool)

(assert (=> b!795224 (=> (not res!539877) (not e!441361))))

(declare-fun lt!354350 () SeekEntryResult!8281)

(assert (=> b!795224 (= res!539877 (or (= lt!354350 (MissingZero!8281 i!1163)) (= lt!354350 (MissingVacant!8281 i!1163))))))

(assert (=> b!795224 (= lt!354350 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68418 res!539882) b!795220))

(assert (= (and b!795220 res!539881) b!795215))

(assert (= (and b!795215 res!539883) b!795216))

(assert (= (and b!795216 res!539875) b!795222))

(assert (= (and b!795222 res!539874) b!795224))

(assert (= (and b!795224 res!539877) b!795223))

(assert (= (and b!795223 res!539876) b!795221))

(assert (= (and b!795221 res!539879) b!795218))

(assert (= (and b!795218 res!539880) b!795217))

(assert (= (and b!795217 res!539878) b!795219))

(declare-fun m!735367 () Bool)

(assert (=> b!795217 m!735367))

(declare-fun m!735369 () Bool)

(assert (=> b!795217 m!735369))

(declare-fun m!735371 () Bool)

(assert (=> b!795217 m!735371))

(declare-fun m!735373 () Bool)

(assert (=> b!795217 m!735373))

(declare-fun m!735375 () Bool)

(assert (=> b!795218 m!735375))

(declare-fun m!735377 () Bool)

(assert (=> b!795218 m!735377))

(declare-fun m!735379 () Bool)

(assert (=> b!795219 m!735379))

(assert (=> b!795219 m!735379))

(declare-fun m!735381 () Bool)

(assert (=> b!795219 m!735381))

(assert (=> b!795219 m!735379))

(declare-fun m!735383 () Bool)

(assert (=> b!795219 m!735383))

(assert (=> b!795215 m!735379))

(assert (=> b!795215 m!735379))

(declare-fun m!735385 () Bool)

(assert (=> b!795215 m!735385))

(declare-fun m!735387 () Bool)

(assert (=> b!795224 m!735387))

(declare-fun m!735389 () Bool)

(assert (=> b!795222 m!735389))

(declare-fun m!735391 () Bool)

(assert (=> start!68418 m!735391))

(declare-fun m!735393 () Bool)

(assert (=> start!68418 m!735393))

(declare-fun m!735395 () Bool)

(assert (=> b!795221 m!735395))

(declare-fun m!735397 () Bool)

(assert (=> b!795216 m!735397))

(declare-fun m!735399 () Bool)

(assert (=> b!795223 m!735399))

(check-sat (not b!795222) (not b!795215) (not b!795219) (not b!795224) (not b!795223) (not b!795221) (not b!795216) (not start!68418) (not b!795217))
(check-sat)
