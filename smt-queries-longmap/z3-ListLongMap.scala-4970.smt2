; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68310 () Bool)

(assert start!68310)

(declare-fun b!793611 () Bool)

(declare-fun res!538272 () Bool)

(declare-fun e!440753 () Bool)

(assert (=> b!793611 (=> (not res!538272) (not e!440753))))

(declare-datatypes ((array!43117 0))(
  ( (array!43118 (arr!20639 (Array (_ BitVec 32) (_ BitVec 64))) (size!21060 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43117)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793611 (= res!538272 (validKeyInArray!0 (select (arr!20639 a!3170) j!153)))))

(declare-fun b!793612 () Bool)

(declare-fun res!538277 () Bool)

(assert (=> b!793612 (=> (not res!538277) (not e!440753))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793612 (= res!538277 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793613 () Bool)

(declare-fun res!538278 () Bool)

(assert (=> b!793613 (=> (not res!538278) (not e!440753))))

(assert (=> b!793613 (= res!538278 (validKeyInArray!0 k0!2044))))

(declare-fun res!538275 () Bool)

(assert (=> start!68310 (=> (not res!538275) (not e!440753))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68310 (= res!538275 (validMask!0 mask!3266))))

(assert (=> start!68310 e!440753))

(assert (=> start!68310 true))

(declare-fun array_inv!16522 (array!43117) Bool)

(assert (=> start!68310 (array_inv!16522 a!3170)))

(declare-fun b!793614 () Bool)

(declare-fun res!538274 () Bool)

(declare-fun e!440755 () Bool)

(assert (=> b!793614 (=> (not res!538274) (not e!440755))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793614 (= res!538274 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21060 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20639 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21060 a!3170)) (= (select (arr!20639 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793615 () Bool)

(assert (=> b!793615 (= e!440755 false)))

(declare-fun lt!353647 () (_ BitVec 64))

(declare-fun lt!353648 () array!43117)

(declare-datatypes ((SeekEntryResult!8227 0))(
  ( (MissingZero!8227 (index!35276 (_ BitVec 32))) (Found!8227 (index!35277 (_ BitVec 32))) (Intermediate!8227 (undefined!9039 Bool) (index!35278 (_ BitVec 32)) (x!66220 (_ BitVec 32))) (Undefined!8227) (MissingVacant!8227 (index!35279 (_ BitVec 32))) )
))
(declare-fun lt!353646 () SeekEntryResult!8227)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43117 (_ BitVec 32)) SeekEntryResult!8227)

(assert (=> b!793615 (= lt!353646 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353647 lt!353648 mask!3266))))

(declare-fun lt!353645 () SeekEntryResult!8227)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43117 (_ BitVec 32)) SeekEntryResult!8227)

(assert (=> b!793615 (= lt!353645 (seekEntryOrOpen!0 lt!353647 lt!353648 mask!3266))))

(assert (=> b!793615 (= lt!353647 (select (store (arr!20639 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793615 (= lt!353648 (array!43118 (store (arr!20639 a!3170) i!1163 k0!2044) (size!21060 a!3170)))))

(declare-fun b!793616 () Bool)

(assert (=> b!793616 (= e!440753 e!440755)))

(declare-fun res!538276 () Bool)

(assert (=> b!793616 (=> (not res!538276) (not e!440755))))

(declare-fun lt!353644 () SeekEntryResult!8227)

(assert (=> b!793616 (= res!538276 (or (= lt!353644 (MissingZero!8227 i!1163)) (= lt!353644 (MissingVacant!8227 i!1163))))))

(assert (=> b!793616 (= lt!353644 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793617 () Bool)

(declare-fun res!538271 () Bool)

(assert (=> b!793617 (=> (not res!538271) (not e!440753))))

(assert (=> b!793617 (= res!538271 (and (= (size!21060 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21060 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21060 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793618 () Bool)

(declare-fun res!538270 () Bool)

(assert (=> b!793618 (=> (not res!538270) (not e!440755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43117 (_ BitVec 32)) Bool)

(assert (=> b!793618 (= res!538270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793619 () Bool)

(declare-fun res!538273 () Bool)

(assert (=> b!793619 (=> (not res!538273) (not e!440755))))

(declare-datatypes ((List!14641 0))(
  ( (Nil!14638) (Cons!14637 (h!15766 (_ BitVec 64)) (t!20947 List!14641)) )
))
(declare-fun arrayNoDuplicates!0 (array!43117 (_ BitVec 32) List!14641) Bool)

(assert (=> b!793619 (= res!538273 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14638))))

(assert (= (and start!68310 res!538275) b!793617))

(assert (= (and b!793617 res!538271) b!793611))

(assert (= (and b!793611 res!538272) b!793613))

(assert (= (and b!793613 res!538278) b!793612))

(assert (= (and b!793612 res!538277) b!793616))

(assert (= (and b!793616 res!538276) b!793618))

(assert (= (and b!793618 res!538270) b!793619))

(assert (= (and b!793619 res!538273) b!793614))

(assert (= (and b!793614 res!538274) b!793615))

(declare-fun m!733621 () Bool)

(assert (=> b!793611 m!733621))

(assert (=> b!793611 m!733621))

(declare-fun m!733623 () Bool)

(assert (=> b!793611 m!733623))

(declare-fun m!733625 () Bool)

(assert (=> b!793615 m!733625))

(declare-fun m!733627 () Bool)

(assert (=> b!793615 m!733627))

(declare-fun m!733629 () Bool)

(assert (=> b!793615 m!733629))

(declare-fun m!733631 () Bool)

(assert (=> b!793615 m!733631))

(declare-fun m!733633 () Bool)

(assert (=> b!793613 m!733633))

(declare-fun m!733635 () Bool)

(assert (=> start!68310 m!733635))

(declare-fun m!733637 () Bool)

(assert (=> start!68310 m!733637))

(declare-fun m!733639 () Bool)

(assert (=> b!793618 m!733639))

(declare-fun m!733641 () Bool)

(assert (=> b!793616 m!733641))

(declare-fun m!733643 () Bool)

(assert (=> b!793614 m!733643))

(declare-fun m!733645 () Bool)

(assert (=> b!793614 m!733645))

(declare-fun m!733647 () Bool)

(assert (=> b!793612 m!733647))

(declare-fun m!733649 () Bool)

(assert (=> b!793619 m!733649))

(check-sat (not b!793613) (not b!793616) (not b!793619) (not start!68310) (not b!793615) (not b!793618) (not b!793611) (not b!793612))
(check-sat)
