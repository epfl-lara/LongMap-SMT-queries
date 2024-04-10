; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68248 () Bool)

(assert start!68248)

(declare-fun b!792843 () Bool)

(declare-fun res!537364 () Bool)

(declare-fun e!440530 () Bool)

(assert (=> b!792843 (=> (not res!537364) (not e!440530))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43038 0))(
  ( (array!43039 (arr!20599 (Array (_ BitVec 32) (_ BitVec 64))) (size!21020 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43038)

(assert (=> b!792843 (= res!537364 (and (= (size!21020 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21020 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21020 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792844 () Bool)

(declare-fun res!537366 () Bool)

(assert (=> b!792844 (=> (not res!537366) (not e!440530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792844 (= res!537366 (validKeyInArray!0 (select (arr!20599 a!3170) j!153)))))

(declare-fun b!792845 () Bool)

(declare-fun res!537368 () Bool)

(declare-fun e!440529 () Bool)

(assert (=> b!792845 (=> (not res!537368) (not e!440529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43038 (_ BitVec 32)) Bool)

(assert (=> b!792845 (= res!537368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792846 () Bool)

(assert (=> b!792846 (= e!440529 false)))

(declare-fun lt!353596 () Bool)

(declare-datatypes ((List!14562 0))(
  ( (Nil!14559) (Cons!14558 (h!15687 (_ BitVec 64)) (t!20877 List!14562)) )
))
(declare-fun arrayNoDuplicates!0 (array!43038 (_ BitVec 32) List!14562) Bool)

(assert (=> b!792846 (= lt!353596 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14559))))

(declare-fun res!537367 () Bool)

(assert (=> start!68248 (=> (not res!537367) (not e!440530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68248 (= res!537367 (validMask!0 mask!3266))))

(assert (=> start!68248 e!440530))

(assert (=> start!68248 true))

(declare-fun array_inv!16395 (array!43038) Bool)

(assert (=> start!68248 (array_inv!16395 a!3170)))

(declare-fun b!792847 () Bool)

(declare-fun res!537365 () Bool)

(assert (=> b!792847 (=> (not res!537365) (not e!440530))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!792847 (= res!537365 (validKeyInArray!0 k0!2044))))

(declare-fun b!792848 () Bool)

(declare-fun res!537363 () Bool)

(assert (=> b!792848 (=> (not res!537363) (not e!440530))))

(declare-fun arrayContainsKey!0 (array!43038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792848 (= res!537363 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792849 () Bool)

(assert (=> b!792849 (= e!440530 e!440529)))

(declare-fun res!537362 () Bool)

(assert (=> b!792849 (=> (not res!537362) (not e!440529))))

(declare-datatypes ((SeekEntryResult!8190 0))(
  ( (MissingZero!8190 (index!35128 (_ BitVec 32))) (Found!8190 (index!35129 (_ BitVec 32))) (Intermediate!8190 (undefined!9002 Bool) (index!35130 (_ BitVec 32)) (x!66076 (_ BitVec 32))) (Undefined!8190) (MissingVacant!8190 (index!35131 (_ BitVec 32))) )
))
(declare-fun lt!353597 () SeekEntryResult!8190)

(assert (=> b!792849 (= res!537362 (or (= lt!353597 (MissingZero!8190 i!1163)) (= lt!353597 (MissingVacant!8190 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43038 (_ BitVec 32)) SeekEntryResult!8190)

(assert (=> b!792849 (= lt!353597 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68248 res!537367) b!792843))

(assert (= (and b!792843 res!537364) b!792844))

(assert (= (and b!792844 res!537366) b!792847))

(assert (= (and b!792847 res!537365) b!792848))

(assert (= (and b!792848 res!537363) b!792849))

(assert (= (and b!792849 res!537362) b!792845))

(assert (= (and b!792845 res!537368) b!792846))

(declare-fun m!733355 () Bool)

(assert (=> b!792847 m!733355))

(declare-fun m!733357 () Bool)

(assert (=> start!68248 m!733357))

(declare-fun m!733359 () Bool)

(assert (=> start!68248 m!733359))

(declare-fun m!733361 () Bool)

(assert (=> b!792848 m!733361))

(declare-fun m!733363 () Bool)

(assert (=> b!792849 m!733363))

(declare-fun m!733365 () Bool)

(assert (=> b!792844 m!733365))

(assert (=> b!792844 m!733365))

(declare-fun m!733367 () Bool)

(assert (=> b!792844 m!733367))

(declare-fun m!733369 () Bool)

(assert (=> b!792845 m!733369))

(declare-fun m!733371 () Bool)

(assert (=> b!792846 m!733371))

(check-sat (not b!792849) (not b!792846) (not b!792847) (not start!68248) (not b!792845) (not b!792844) (not b!792848))
(check-sat)
