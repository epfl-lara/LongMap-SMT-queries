; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68640 () Bool)

(assert start!68640)

(declare-fun b!798947 () Bool)

(declare-fun res!543609 () Bool)

(declare-fun e!443065 () Bool)

(assert (=> b!798947 (=> (not res!543609) (not e!443065))))

(declare-datatypes ((array!43447 0))(
  ( (array!43448 (arr!20804 (Array (_ BitVec 32) (_ BitVec 64))) (size!21225 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43447)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43447 (_ BitVec 32)) Bool)

(assert (=> b!798947 (= res!543609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798948 () Bool)

(declare-fun res!543608 () Bool)

(declare-fun e!443063 () Bool)

(assert (=> b!798948 (=> (not res!543608) (not e!443063))))

(declare-datatypes ((SeekEntryResult!8392 0))(
  ( (MissingZero!8392 (index!35936 (_ BitVec 32))) (Found!8392 (index!35937 (_ BitVec 32))) (Intermediate!8392 (undefined!9204 Bool) (index!35938 (_ BitVec 32)) (x!66825 (_ BitVec 32))) (Undefined!8392) (MissingVacant!8392 (index!35939 (_ BitVec 32))) )
))
(declare-fun lt!356607 () SeekEntryResult!8392)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356603 () (_ BitVec 32))

(declare-fun lt!356602 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356604 () array!43447)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43447 (_ BitVec 32)) SeekEntryResult!8392)

(assert (=> b!798948 (= res!543608 (= lt!356607 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356603 vacantAfter!23 lt!356602 lt!356604 mask!3266)))))

(declare-fun res!543610 () Bool)

(declare-fun e!443068 () Bool)

(assert (=> start!68640 (=> (not res!543610) (not e!443068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68640 (= res!543610 (validMask!0 mask!3266))))

(assert (=> start!68640 e!443068))

(assert (=> start!68640 true))

(declare-fun array_inv!16687 (array!43447) Bool)

(assert (=> start!68640 (array_inv!16687 a!3170)))

(declare-fun b!798949 () Bool)

(declare-fun res!543611 () Bool)

(assert (=> b!798949 (=> (not res!543611) (not e!443068))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798949 (= res!543611 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798950 () Bool)

(declare-fun res!543607 () Bool)

(assert (=> b!798950 (=> (not res!543607) (not e!443068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798950 (= res!543607 (validKeyInArray!0 k0!2044))))

(declare-fun b!798951 () Bool)

(declare-fun res!543606 () Bool)

(assert (=> b!798951 (=> (not res!543606) (not e!443065))))

(declare-datatypes ((List!14806 0))(
  ( (Nil!14803) (Cons!14802 (h!15931 (_ BitVec 64)) (t!21112 List!14806)) )
))
(declare-fun arrayNoDuplicates!0 (array!43447 (_ BitVec 32) List!14806) Bool)

(assert (=> b!798951 (= res!543606 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14803))))

(declare-fun b!798952 () Bool)

(declare-fun res!543618 () Bool)

(assert (=> b!798952 (=> (not res!543618) (not e!443065))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798952 (= res!543618 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21225 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20804 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21225 a!3170)) (= (select (arr!20804 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798953 () Bool)

(declare-fun res!543614 () Bool)

(assert (=> b!798953 (=> (not res!543614) (not e!443068))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798953 (= res!543614 (and (= (size!21225 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21225 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21225 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798954 () Bool)

(declare-fun e!443066 () Bool)

(assert (=> b!798954 (= e!443065 e!443066)))

(declare-fun res!543612 () Bool)

(assert (=> b!798954 (=> (not res!543612) (not e!443066))))

(assert (=> b!798954 (= res!543612 (= lt!356607 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356602 lt!356604 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43447 (_ BitVec 32)) SeekEntryResult!8392)

(assert (=> b!798954 (= lt!356607 (seekEntryOrOpen!0 lt!356602 lt!356604 mask!3266))))

(assert (=> b!798954 (= lt!356602 (select (store (arr!20804 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798954 (= lt!356604 (array!43448 (store (arr!20804 a!3170) i!1163 k0!2044) (size!21225 a!3170)))))

(declare-fun b!798955 () Bool)

(declare-fun e!443064 () Bool)

(assert (=> b!798955 (= e!443064 e!443063)))

(declare-fun res!543616 () Bool)

(assert (=> b!798955 (=> (not res!543616) (not e!443063))))

(assert (=> b!798955 (= res!543616 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356603 #b00000000000000000000000000000000) (bvslt lt!356603 (size!21225 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!798955 (= lt!356603 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!798956 () Bool)

(declare-fun res!543613 () Bool)

(assert (=> b!798956 (=> (not res!543613) (not e!443068))))

(assert (=> b!798956 (= res!543613 (validKeyInArray!0 (select (arr!20804 a!3170) j!153)))))

(declare-fun b!798957 () Bool)

(assert (=> b!798957 (= e!443068 e!443065)))

(declare-fun res!543615 () Bool)

(assert (=> b!798957 (=> (not res!543615) (not e!443065))))

(declare-fun lt!356605 () SeekEntryResult!8392)

(assert (=> b!798957 (= res!543615 (or (= lt!356605 (MissingZero!8392 i!1163)) (= lt!356605 (MissingVacant!8392 i!1163))))))

(assert (=> b!798957 (= lt!356605 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798958 () Bool)

(assert (=> b!798958 (= e!443066 e!443064)))

(declare-fun res!543617 () Bool)

(assert (=> b!798958 (=> (not res!543617) (not e!443064))))

(declare-fun lt!356608 () SeekEntryResult!8392)

(declare-fun lt!356606 () SeekEntryResult!8392)

(assert (=> b!798958 (= res!543617 (and (= lt!356606 lt!356608) (= lt!356608 (Found!8392 j!153)) (not (= (select (arr!20804 a!3170) index!1236) (select (arr!20804 a!3170) j!153)))))))

(assert (=> b!798958 (= lt!356608 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20804 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798958 (= lt!356606 (seekEntryOrOpen!0 (select (arr!20804 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798959 () Bool)

(assert (=> b!798959 (= e!443063 false)))

(declare-fun lt!356609 () SeekEntryResult!8392)

(assert (=> b!798959 (= lt!356609 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356603 vacantBefore!23 (select (arr!20804 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68640 res!543610) b!798953))

(assert (= (and b!798953 res!543614) b!798956))

(assert (= (and b!798956 res!543613) b!798950))

(assert (= (and b!798950 res!543607) b!798949))

(assert (= (and b!798949 res!543611) b!798957))

(assert (= (and b!798957 res!543615) b!798947))

(assert (= (and b!798947 res!543609) b!798951))

(assert (= (and b!798951 res!543606) b!798952))

(assert (= (and b!798952 res!543618) b!798954))

(assert (= (and b!798954 res!543612) b!798958))

(assert (= (and b!798958 res!543617) b!798955))

(assert (= (and b!798955 res!543616) b!798948))

(assert (= (and b!798948 res!543608) b!798959))

(declare-fun m!739447 () Bool)

(assert (=> b!798955 m!739447))

(declare-fun m!739449 () Bool)

(assert (=> b!798947 m!739449))

(declare-fun m!739451 () Bool)

(assert (=> b!798958 m!739451))

(declare-fun m!739453 () Bool)

(assert (=> b!798958 m!739453))

(assert (=> b!798958 m!739453))

(declare-fun m!739455 () Bool)

(assert (=> b!798958 m!739455))

(assert (=> b!798958 m!739453))

(declare-fun m!739457 () Bool)

(assert (=> b!798958 m!739457))

(declare-fun m!739459 () Bool)

(assert (=> b!798948 m!739459))

(declare-fun m!739461 () Bool)

(assert (=> b!798952 m!739461))

(declare-fun m!739463 () Bool)

(assert (=> b!798952 m!739463))

(assert (=> b!798959 m!739453))

(assert (=> b!798959 m!739453))

(declare-fun m!739465 () Bool)

(assert (=> b!798959 m!739465))

(declare-fun m!739467 () Bool)

(assert (=> b!798957 m!739467))

(declare-fun m!739469 () Bool)

(assert (=> start!68640 m!739469))

(declare-fun m!739471 () Bool)

(assert (=> start!68640 m!739471))

(declare-fun m!739473 () Bool)

(assert (=> b!798954 m!739473))

(declare-fun m!739475 () Bool)

(assert (=> b!798954 m!739475))

(declare-fun m!739477 () Bool)

(assert (=> b!798954 m!739477))

(declare-fun m!739479 () Bool)

(assert (=> b!798954 m!739479))

(declare-fun m!739481 () Bool)

(assert (=> b!798951 m!739481))

(declare-fun m!739483 () Bool)

(assert (=> b!798950 m!739483))

(declare-fun m!739485 () Bool)

(assert (=> b!798949 m!739485))

(assert (=> b!798956 m!739453))

(assert (=> b!798956 m!739453))

(declare-fun m!739487 () Bool)

(assert (=> b!798956 m!739487))

(check-sat (not b!798956) (not start!68640) (not b!798957) (not b!798958) (not b!798948) (not b!798950) (not b!798955) (not b!798954) (not b!798949) (not b!798959) (not b!798951) (not b!798947))
(check-sat)
