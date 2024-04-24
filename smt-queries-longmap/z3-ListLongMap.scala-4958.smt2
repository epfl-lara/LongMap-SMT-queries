; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68382 () Bool)

(assert start!68382)

(declare-fun b!793617 () Bool)

(declare-fun res!537766 () Bool)

(declare-fun e!440998 () Bool)

(assert (=> b!793617 (=> (not res!537766) (not e!440998))))

(declare-datatypes ((array!43046 0))(
  ( (array!43047 (arr!20599 (Array (_ BitVec 32) (_ BitVec 64))) (size!21019 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43046)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793617 (= res!537766 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793618 () Bool)

(declare-fun res!537764 () Bool)

(assert (=> b!793618 (=> (not res!537764) (not e!440998))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!793618 (= res!537764 (and (= (size!21019 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21019 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21019 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!537765 () Bool)

(assert (=> start!68382 (=> (not res!537765) (not e!440998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68382 (= res!537765 (validMask!0 mask!3266))))

(assert (=> start!68382 e!440998))

(assert (=> start!68382 true))

(declare-fun array_inv!16458 (array!43046) Bool)

(assert (=> start!68382 (array_inv!16458 a!3170)))

(declare-fun b!793619 () Bool)

(declare-fun e!440997 () Bool)

(assert (=> b!793619 (= e!440998 e!440997)))

(declare-fun res!537763 () Bool)

(assert (=> b!793619 (=> (not res!537763) (not e!440997))))

(declare-datatypes ((SeekEntryResult!8146 0))(
  ( (MissingZero!8146 (index!34952 (_ BitVec 32))) (Found!8146 (index!34953 (_ BitVec 32))) (Intermediate!8146 (undefined!8958 Bool) (index!34954 (_ BitVec 32)) (x!66059 (_ BitVec 32))) (Undefined!8146) (MissingVacant!8146 (index!34955 (_ BitVec 32))) )
))
(declare-fun lt!353890 () SeekEntryResult!8146)

(assert (=> b!793619 (= res!537763 (or (= lt!353890 (MissingZero!8146 i!1163)) (= lt!353890 (MissingVacant!8146 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43046 (_ BitVec 32)) SeekEntryResult!8146)

(assert (=> b!793619 (= lt!353890 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793620 () Bool)

(assert (=> b!793620 (= e!440997 false)))

(declare-fun lt!353889 () Bool)

(declare-datatypes ((List!14469 0))(
  ( (Nil!14466) (Cons!14465 (h!15600 (_ BitVec 64)) (t!20776 List!14469)) )
))
(declare-fun arrayNoDuplicates!0 (array!43046 (_ BitVec 32) List!14469) Bool)

(assert (=> b!793620 (= lt!353889 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14466))))

(declare-fun b!793621 () Bool)

(declare-fun res!537767 () Bool)

(assert (=> b!793621 (=> (not res!537767) (not e!440998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793621 (= res!537767 (validKeyInArray!0 k0!2044))))

(declare-fun b!793622 () Bool)

(declare-fun res!537768 () Bool)

(assert (=> b!793622 (=> (not res!537768) (not e!440998))))

(assert (=> b!793622 (= res!537768 (validKeyInArray!0 (select (arr!20599 a!3170) j!153)))))

(declare-fun b!793623 () Bool)

(declare-fun res!537762 () Bool)

(assert (=> b!793623 (=> (not res!537762) (not e!440997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43046 (_ BitVec 32)) Bool)

(assert (=> b!793623 (= res!537762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68382 res!537765) b!793618))

(assert (= (and b!793618 res!537764) b!793622))

(assert (= (and b!793622 res!537768) b!793621))

(assert (= (and b!793621 res!537767) b!793617))

(assert (= (and b!793617 res!537766) b!793619))

(assert (= (and b!793619 res!537763) b!793623))

(assert (= (and b!793623 res!537762) b!793620))

(declare-fun m!734555 () Bool)

(assert (=> start!68382 m!734555))

(declare-fun m!734557 () Bool)

(assert (=> start!68382 m!734557))

(declare-fun m!734559 () Bool)

(assert (=> b!793619 m!734559))

(declare-fun m!734561 () Bool)

(assert (=> b!793621 m!734561))

(declare-fun m!734563 () Bool)

(assert (=> b!793623 m!734563))

(declare-fun m!734565 () Bool)

(assert (=> b!793622 m!734565))

(assert (=> b!793622 m!734565))

(declare-fun m!734567 () Bool)

(assert (=> b!793622 m!734567))

(declare-fun m!734569 () Bool)

(assert (=> b!793617 m!734569))

(declare-fun m!734571 () Bool)

(assert (=> b!793620 m!734571))

(check-sat (not b!793620) (not b!793622) (not b!793623) (not b!793617) (not start!68382) (not b!793619) (not b!793621))
(check-sat)
