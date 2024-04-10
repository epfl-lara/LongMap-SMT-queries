; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68530 () Bool)

(assert start!68530)

(declare-fun b!796954 () Bool)

(declare-fun e!442175 () Bool)

(declare-fun e!442174 () Bool)

(assert (=> b!796954 (= e!442175 e!442174)))

(declare-fun res!541474 () Bool)

(assert (=> b!796954 (=> (not res!541474) (not e!442174))))

(declare-datatypes ((SeekEntryResult!8331 0))(
  ( (MissingZero!8331 (index!35692 (_ BitVec 32))) (Found!8331 (index!35693 (_ BitVec 32))) (Intermediate!8331 (undefined!9143 Bool) (index!35694 (_ BitVec 32)) (x!66593 (_ BitVec 32))) (Undefined!8331) (MissingVacant!8331 (index!35695 (_ BitVec 32))) )
))
(declare-fun lt!355456 () SeekEntryResult!8331)

(declare-fun lt!355455 () SeekEntryResult!8331)

(assert (=> b!796954 (= res!541474 (= lt!355456 lt!355455))))

(declare-fun lt!355453 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!43320 0))(
  ( (array!43321 (arr!20740 (Array (_ BitVec 32) (_ BitVec 64))) (size!21161 (_ BitVec 32))) )
))
(declare-fun lt!355460 () array!43320)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43320 (_ BitVec 32)) SeekEntryResult!8331)

(assert (=> b!796954 (= lt!355455 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355453 lt!355460 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43320 (_ BitVec 32)) SeekEntryResult!8331)

(assert (=> b!796954 (= lt!355456 (seekEntryOrOpen!0 lt!355453 lt!355460 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43320)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796954 (= lt!355453 (select (store (arr!20740 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796954 (= lt!355460 (array!43321 (store (arr!20740 a!3170) i!1163 k0!2044) (size!21161 a!3170)))))

(declare-fun b!796955 () Bool)

(declare-fun e!442178 () Bool)

(declare-fun e!442173 () Bool)

(assert (=> b!796955 (= e!442178 e!442173)))

(declare-fun res!541481 () Bool)

(assert (=> b!796955 (=> (not res!541481) (not e!442173))))

(declare-fun lt!355454 () SeekEntryResult!8331)

(declare-fun lt!355457 () SeekEntryResult!8331)

(assert (=> b!796955 (= res!541481 (and (= lt!355454 lt!355457) (= (select (arr!20740 a!3170) index!1236) (select (arr!20740 a!3170) j!153))))))

(assert (=> b!796955 (= lt!355457 (Found!8331 j!153))))

(declare-fun b!796956 () Bool)

(declare-fun res!541483 () Bool)

(declare-fun e!442176 () Bool)

(assert (=> b!796956 (=> (not res!541483) (not e!442176))))

(assert (=> b!796956 (= res!541483 (and (= (size!21161 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21161 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21161 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796957 () Bool)

(declare-fun res!541480 () Bool)

(assert (=> b!796957 (=> (not res!541480) (not e!442175))))

(declare-datatypes ((List!14703 0))(
  ( (Nil!14700) (Cons!14699 (h!15828 (_ BitVec 64)) (t!21018 List!14703)) )
))
(declare-fun arrayNoDuplicates!0 (array!43320 (_ BitVec 32) List!14703) Bool)

(assert (=> b!796957 (= res!541480 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14700))))

(declare-fun b!796958 () Bool)

(assert (=> b!796958 (= e!442176 e!442175)))

(declare-fun res!541473 () Bool)

(assert (=> b!796958 (=> (not res!541473) (not e!442175))))

(declare-fun lt!355458 () SeekEntryResult!8331)

(assert (=> b!796958 (= res!541473 (or (= lt!355458 (MissingZero!8331 i!1163)) (= lt!355458 (MissingVacant!8331 i!1163))))))

(assert (=> b!796958 (= lt!355458 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796959 () Bool)

(declare-fun res!541479 () Bool)

(assert (=> b!796959 (=> (not res!541479) (not e!442175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43320 (_ BitVec 32)) Bool)

(assert (=> b!796959 (= res!541479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796960 () Bool)

(declare-fun res!541476 () Bool)

(assert (=> b!796960 (=> (not res!541476) (not e!442176))))

(declare-fun arrayContainsKey!0 (array!43320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796960 (= res!541476 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796961 () Bool)

(declare-fun res!541482 () Bool)

(assert (=> b!796961 (=> (not res!541482) (not e!442175))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796961 (= res!541482 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21161 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20740 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21161 a!3170)) (= (select (arr!20740 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!541477 () Bool)

(assert (=> start!68530 (=> (not res!541477) (not e!442176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68530 (= res!541477 (validMask!0 mask!3266))))

(assert (=> start!68530 e!442176))

(assert (=> start!68530 true))

(declare-fun array_inv!16536 (array!43320) Bool)

(assert (=> start!68530 (array_inv!16536 a!3170)))

(declare-fun b!796962 () Bool)

(assert (=> b!796962 (= e!442174 e!442178)))

(declare-fun res!541478 () Bool)

(assert (=> b!796962 (=> (not res!541478) (not e!442178))))

(declare-fun lt!355459 () SeekEntryResult!8331)

(assert (=> b!796962 (= res!541478 (= lt!355459 lt!355454))))

(assert (=> b!796962 (= lt!355454 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20740 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796962 (= lt!355459 (seekEntryOrOpen!0 (select (arr!20740 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796963 () Bool)

(declare-fun res!541484 () Bool)

(assert (=> b!796963 (=> (not res!541484) (not e!442176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796963 (= res!541484 (validKeyInArray!0 k0!2044))))

(declare-fun b!796964 () Bool)

(assert (=> b!796964 (= e!442173 (not (or (not (= lt!355455 lt!355457)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(assert (=> b!796964 (= lt!355455 (Found!8331 index!1236))))

(declare-fun b!796965 () Bool)

(declare-fun res!541475 () Bool)

(assert (=> b!796965 (=> (not res!541475) (not e!442176))))

(assert (=> b!796965 (= res!541475 (validKeyInArray!0 (select (arr!20740 a!3170) j!153)))))

(assert (= (and start!68530 res!541477) b!796956))

(assert (= (and b!796956 res!541483) b!796965))

(assert (= (and b!796965 res!541475) b!796963))

(assert (= (and b!796963 res!541484) b!796960))

(assert (= (and b!796960 res!541476) b!796958))

(assert (= (and b!796958 res!541473) b!796959))

(assert (= (and b!796959 res!541479) b!796957))

(assert (= (and b!796957 res!541480) b!796961))

(assert (= (and b!796961 res!541482) b!796954))

(assert (= (and b!796954 res!541474) b!796962))

(assert (= (and b!796962 res!541478) b!796955))

(assert (= (and b!796955 res!541481) b!796964))

(declare-fun m!737789 () Bool)

(assert (=> b!796954 m!737789))

(declare-fun m!737791 () Bool)

(assert (=> b!796954 m!737791))

(declare-fun m!737793 () Bool)

(assert (=> b!796954 m!737793))

(declare-fun m!737795 () Bool)

(assert (=> b!796954 m!737795))

(declare-fun m!737797 () Bool)

(assert (=> b!796957 m!737797))

(declare-fun m!737799 () Bool)

(assert (=> b!796959 m!737799))

(declare-fun m!737801 () Bool)

(assert (=> b!796962 m!737801))

(assert (=> b!796962 m!737801))

(declare-fun m!737803 () Bool)

(assert (=> b!796962 m!737803))

(assert (=> b!796962 m!737801))

(declare-fun m!737805 () Bool)

(assert (=> b!796962 m!737805))

(declare-fun m!737807 () Bool)

(assert (=> start!68530 m!737807))

(declare-fun m!737809 () Bool)

(assert (=> start!68530 m!737809))

(declare-fun m!737811 () Bool)

(assert (=> b!796961 m!737811))

(declare-fun m!737813 () Bool)

(assert (=> b!796961 m!737813))

(declare-fun m!737815 () Bool)

(assert (=> b!796963 m!737815))

(declare-fun m!737817 () Bool)

(assert (=> b!796960 m!737817))

(declare-fun m!737819 () Bool)

(assert (=> b!796958 m!737819))

(assert (=> b!796965 m!737801))

(assert (=> b!796965 m!737801))

(declare-fun m!737821 () Bool)

(assert (=> b!796965 m!737821))

(declare-fun m!737823 () Bool)

(assert (=> b!796955 m!737823))

(assert (=> b!796955 m!737801))

(check-sat (not b!796965) (not b!796954) (not start!68530) (not b!796957) (not b!796963) (not b!796962) (not b!796959) (not b!796958) (not b!796960))
(check-sat)
