; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68518 () Bool)

(assert start!68518)

(declare-fun res!541266 () Bool)

(declare-fun e!442076 () Bool)

(assert (=> start!68518 (=> (not res!541266) (not e!442076))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68518 (= res!541266 (validMask!0 mask!3266))))

(assert (=> start!68518 e!442076))

(assert (=> start!68518 true))

(declare-datatypes ((array!43308 0))(
  ( (array!43309 (arr!20734 (Array (_ BitVec 32) (_ BitVec 64))) (size!21155 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43308)

(declare-fun array_inv!16530 (array!43308) Bool)

(assert (=> start!68518 (array_inv!16530 a!3170)))

(declare-fun b!796747 () Bool)

(declare-fun res!541275 () Bool)

(assert (=> b!796747 (=> (not res!541275) (not e!442076))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796747 (= res!541275 (and (= (size!21155 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21155 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21155 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796748 () Bool)

(declare-fun res!541268 () Bool)

(declare-fun e!442074 () Bool)

(assert (=> b!796748 (=> (not res!541268) (not e!442074))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796748 (= res!541268 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21155 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20734 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21155 a!3170)) (= (select (arr!20734 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796749 () Bool)

(declare-fun e!442078 () Bool)

(declare-fun e!442075 () Bool)

(assert (=> b!796749 (= e!442078 e!442075)))

(declare-fun res!541270 () Bool)

(assert (=> b!796749 (=> (not res!541270) (not e!442075))))

(declare-datatypes ((SeekEntryResult!8325 0))(
  ( (MissingZero!8325 (index!35668 (_ BitVec 32))) (Found!8325 (index!35669 (_ BitVec 32))) (Intermediate!8325 (undefined!9137 Bool) (index!35670 (_ BitVec 32)) (x!66571 (_ BitVec 32))) (Undefined!8325) (MissingVacant!8325 (index!35671 (_ BitVec 32))) )
))
(declare-fun lt!355326 () SeekEntryResult!8325)

(declare-fun lt!355327 () SeekEntryResult!8325)

(assert (=> b!796749 (= res!541270 (and (= lt!355326 lt!355327) (= lt!355327 (Found!8325 j!153)) (= (select (arr!20734 a!3170) index!1236) (select (arr!20734 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43308 (_ BitVec 32)) SeekEntryResult!8325)

(assert (=> b!796749 (= lt!355327 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20734 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43308 (_ BitVec 32)) SeekEntryResult!8325)

(assert (=> b!796749 (= lt!355326 (seekEntryOrOpen!0 (select (arr!20734 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796750 () Bool)

(assert (=> b!796750 (= e!442076 e!442074)))

(declare-fun res!541272 () Bool)

(assert (=> b!796750 (=> (not res!541272) (not e!442074))))

(declare-fun lt!355324 () SeekEntryResult!8325)

(assert (=> b!796750 (= res!541272 (or (= lt!355324 (MissingZero!8325 i!1163)) (= lt!355324 (MissingVacant!8325 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!796750 (= lt!355324 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796751 () Bool)

(declare-fun res!541277 () Bool)

(assert (=> b!796751 (=> (not res!541277) (not e!442076))))

(declare-fun arrayContainsKey!0 (array!43308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796751 (= res!541277 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796752 () Bool)

(declare-fun e!442079 () Bool)

(assert (=> b!796752 (= e!442075 (not e!442079))))

(declare-fun res!541273 () Bool)

(assert (=> b!796752 (=> res!541273 e!442079)))

(assert (=> b!796752 (= res!541273 (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20734 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!355323 () SeekEntryResult!8325)

(assert (=> b!796752 (= lt!355323 (Found!8325 index!1236))))

(declare-fun b!796753 () Bool)

(declare-fun res!541271 () Bool)

(assert (=> b!796753 (=> (not res!541271) (not e!442074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43308 (_ BitVec 32)) Bool)

(assert (=> b!796753 (= res!541271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796754 () Bool)

(declare-fun res!541274 () Bool)

(assert (=> b!796754 (=> (not res!541274) (not e!442076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796754 (= res!541274 (validKeyInArray!0 (select (arr!20734 a!3170) j!153)))))

(declare-fun b!796755 () Bool)

(declare-fun lt!355328 () (_ BitVec 64))

(assert (=> b!796755 (= e!442079 (validKeyInArray!0 lt!355328))))

(declare-fun b!796756 () Bool)

(declare-fun res!541276 () Bool)

(assert (=> b!796756 (=> (not res!541276) (not e!442076))))

(assert (=> b!796756 (= res!541276 (validKeyInArray!0 k0!2044))))

(declare-fun b!796757 () Bool)

(assert (=> b!796757 (= e!442074 e!442078)))

(declare-fun res!541267 () Bool)

(assert (=> b!796757 (=> (not res!541267) (not e!442078))))

(declare-fun lt!355322 () SeekEntryResult!8325)

(assert (=> b!796757 (= res!541267 (= lt!355322 lt!355323))))

(declare-fun lt!355325 () array!43308)

(assert (=> b!796757 (= lt!355323 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355328 lt!355325 mask!3266))))

(assert (=> b!796757 (= lt!355322 (seekEntryOrOpen!0 lt!355328 lt!355325 mask!3266))))

(assert (=> b!796757 (= lt!355328 (select (store (arr!20734 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796757 (= lt!355325 (array!43309 (store (arr!20734 a!3170) i!1163 k0!2044) (size!21155 a!3170)))))

(declare-fun b!796758 () Bool)

(declare-fun res!541269 () Bool)

(assert (=> b!796758 (=> (not res!541269) (not e!442074))))

(declare-datatypes ((List!14697 0))(
  ( (Nil!14694) (Cons!14693 (h!15822 (_ BitVec 64)) (t!21012 List!14697)) )
))
(declare-fun arrayNoDuplicates!0 (array!43308 (_ BitVec 32) List!14697) Bool)

(assert (=> b!796758 (= res!541269 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14694))))

(assert (= (and start!68518 res!541266) b!796747))

(assert (= (and b!796747 res!541275) b!796754))

(assert (= (and b!796754 res!541274) b!796756))

(assert (= (and b!796756 res!541276) b!796751))

(assert (= (and b!796751 res!541277) b!796750))

(assert (= (and b!796750 res!541272) b!796753))

(assert (= (and b!796753 res!541271) b!796758))

(assert (= (and b!796758 res!541269) b!796748))

(assert (= (and b!796748 res!541268) b!796757))

(assert (= (and b!796757 res!541267) b!796749))

(assert (= (and b!796749 res!541270) b!796752))

(assert (= (and b!796752 (not res!541273)) b!796755))

(declare-fun m!737565 () Bool)

(assert (=> start!68518 m!737565))

(declare-fun m!737567 () Bool)

(assert (=> start!68518 m!737567))

(declare-fun m!737569 () Bool)

(assert (=> b!796754 m!737569))

(assert (=> b!796754 m!737569))

(declare-fun m!737571 () Bool)

(assert (=> b!796754 m!737571))

(declare-fun m!737573 () Bool)

(assert (=> b!796750 m!737573))

(declare-fun m!737575 () Bool)

(assert (=> b!796755 m!737575))

(declare-fun m!737577 () Bool)

(assert (=> b!796756 m!737577))

(declare-fun m!737579 () Bool)

(assert (=> b!796757 m!737579))

(declare-fun m!737581 () Bool)

(assert (=> b!796757 m!737581))

(declare-fun m!737583 () Bool)

(assert (=> b!796757 m!737583))

(declare-fun m!737585 () Bool)

(assert (=> b!796757 m!737585))

(declare-fun m!737587 () Bool)

(assert (=> b!796751 m!737587))

(declare-fun m!737589 () Bool)

(assert (=> b!796749 m!737589))

(assert (=> b!796749 m!737569))

(assert (=> b!796749 m!737569))

(declare-fun m!737591 () Bool)

(assert (=> b!796749 m!737591))

(assert (=> b!796749 m!737569))

(declare-fun m!737593 () Bool)

(assert (=> b!796749 m!737593))

(declare-fun m!737595 () Bool)

(assert (=> b!796758 m!737595))

(declare-fun m!737597 () Bool)

(assert (=> b!796748 m!737597))

(declare-fun m!737599 () Bool)

(assert (=> b!796748 m!737599))

(declare-fun m!737601 () Bool)

(assert (=> b!796753 m!737601))

(assert (=> b!796752 m!737583))

(declare-fun m!737603 () Bool)

(assert (=> b!796752 m!737603))

(check-sat (not b!796754) (not b!796755) (not b!796751) (not start!68518) (not b!796758) (not b!796749) (not b!796753) (not b!796750) (not b!796756) (not b!796757))
(check-sat)
