; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68562 () Bool)

(assert start!68562)

(declare-fun b!797620 () Bool)

(declare-fun res!542287 () Bool)

(declare-fun e!442471 () Bool)

(assert (=> b!797620 (=> (not res!542287) (not e!442471))))

(declare-datatypes ((array!43369 0))(
  ( (array!43370 (arr!20765 (Array (_ BitVec 32) (_ BitVec 64))) (size!21186 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43369)

(declare-datatypes ((List!14767 0))(
  ( (Nil!14764) (Cons!14763 (h!15892 (_ BitVec 64)) (t!21073 List!14767)) )
))
(declare-fun arrayNoDuplicates!0 (array!43369 (_ BitVec 32) List!14767) Bool)

(assert (=> b!797620 (= res!542287 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14764))))

(declare-fun b!797621 () Bool)

(declare-fun e!442469 () Bool)

(assert (=> b!797621 (= e!442469 e!442471)))

(declare-fun res!542289 () Bool)

(assert (=> b!797621 (=> (not res!542289) (not e!442471))))

(declare-datatypes ((SeekEntryResult!8353 0))(
  ( (MissingZero!8353 (index!35780 (_ BitVec 32))) (Found!8353 (index!35781 (_ BitVec 32))) (Intermediate!8353 (undefined!9165 Bool) (index!35782 (_ BitVec 32)) (x!66682 (_ BitVec 32))) (Undefined!8353) (MissingVacant!8353 (index!35783 (_ BitVec 32))) )
))
(declare-fun lt!355811 () SeekEntryResult!8353)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797621 (= res!542289 (or (= lt!355811 (MissingZero!8353 i!1163)) (= lt!355811 (MissingVacant!8353 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43369 (_ BitVec 32)) SeekEntryResult!8353)

(assert (=> b!797621 (= lt!355811 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797622 () Bool)

(declare-fun res!542286 () Bool)

(assert (=> b!797622 (=> (not res!542286) (not e!442469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797622 (= res!542286 (validKeyInArray!0 k0!2044))))

(declare-fun b!797623 () Bool)

(declare-fun res!542283 () Bool)

(assert (=> b!797623 (=> (not res!542283) (not e!442469))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797623 (= res!542283 (validKeyInArray!0 (select (arr!20765 a!3170) j!153)))))

(declare-fun b!797624 () Bool)

(declare-fun e!442468 () Bool)

(declare-fun e!442470 () Bool)

(assert (=> b!797624 (= e!442468 e!442470)))

(declare-fun res!542285 () Bool)

(assert (=> b!797624 (=> (not res!542285) (not e!442470))))

(declare-fun lt!355810 () SeekEntryResult!8353)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!355814 () SeekEntryResult!8353)

(assert (=> b!797624 (= res!542285 (and (= lt!355814 lt!355810) (= lt!355810 (Found!8353 j!153)) (= (select (arr!20765 a!3170) index!1236) (select (arr!20765 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43369 (_ BitVec 32)) SeekEntryResult!8353)

(assert (=> b!797624 (= lt!355810 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20765 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797624 (= lt!355814 (seekEntryOrOpen!0 (select (arr!20765 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797625 () Bool)

(assert (=> b!797625 (= e!442471 e!442468)))

(declare-fun res!542284 () Bool)

(assert (=> b!797625 (=> (not res!542284) (not e!442468))))

(declare-fun lt!355808 () SeekEntryResult!8353)

(declare-fun lt!355812 () SeekEntryResult!8353)

(assert (=> b!797625 (= res!542284 (= lt!355808 lt!355812))))

(declare-fun lt!355809 () array!43369)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!355813 () (_ BitVec 64))

(assert (=> b!797625 (= lt!355812 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355813 lt!355809 mask!3266))))

(assert (=> b!797625 (= lt!355808 (seekEntryOrOpen!0 lt!355813 lt!355809 mask!3266))))

(assert (=> b!797625 (= lt!355813 (select (store (arr!20765 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797625 (= lt!355809 (array!43370 (store (arr!20765 a!3170) i!1163 k0!2044) (size!21186 a!3170)))))

(declare-fun b!797626 () Bool)

(declare-fun res!542280 () Bool)

(assert (=> b!797626 (=> (not res!542280) (not e!442469))))

(declare-fun arrayContainsKey!0 (array!43369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797626 (= res!542280 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797627 () Bool)

(declare-fun res!542281 () Bool)

(assert (=> b!797627 (=> (not res!542281) (not e!442471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43369 (_ BitVec 32)) Bool)

(assert (=> b!797627 (= res!542281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797628 () Bool)

(assert (=> b!797628 (= e!442470 (not true))))

(assert (=> b!797628 (= lt!355812 (Found!8353 index!1236))))

(declare-fun b!797629 () Bool)

(declare-fun res!542282 () Bool)

(assert (=> b!797629 (=> (not res!542282) (not e!442471))))

(assert (=> b!797629 (= res!542282 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21186 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20765 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21186 a!3170)) (= (select (arr!20765 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!542288 () Bool)

(assert (=> start!68562 (=> (not res!542288) (not e!442469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68562 (= res!542288 (validMask!0 mask!3266))))

(assert (=> start!68562 e!442469))

(assert (=> start!68562 true))

(declare-fun array_inv!16648 (array!43369) Bool)

(assert (=> start!68562 (array_inv!16648 a!3170)))

(declare-fun b!797630 () Bool)

(declare-fun res!542279 () Bool)

(assert (=> b!797630 (=> (not res!542279) (not e!442469))))

(assert (=> b!797630 (= res!542279 (and (= (size!21186 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21186 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21186 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68562 res!542288) b!797630))

(assert (= (and b!797630 res!542279) b!797623))

(assert (= (and b!797623 res!542283) b!797622))

(assert (= (and b!797622 res!542286) b!797626))

(assert (= (and b!797626 res!542280) b!797621))

(assert (= (and b!797621 res!542289) b!797627))

(assert (= (and b!797627 res!542281) b!797620))

(assert (= (and b!797620 res!542287) b!797629))

(assert (= (and b!797629 res!542282) b!797625))

(assert (= (and b!797625 res!542284) b!797624))

(assert (= (and b!797624 res!542285) b!797628))

(declare-fun m!738001 () Bool)

(assert (=> b!797625 m!738001))

(declare-fun m!738003 () Bool)

(assert (=> b!797625 m!738003))

(declare-fun m!738005 () Bool)

(assert (=> b!797625 m!738005))

(declare-fun m!738007 () Bool)

(assert (=> b!797625 m!738007))

(declare-fun m!738009 () Bool)

(assert (=> b!797623 m!738009))

(assert (=> b!797623 m!738009))

(declare-fun m!738011 () Bool)

(assert (=> b!797623 m!738011))

(declare-fun m!738013 () Bool)

(assert (=> b!797624 m!738013))

(assert (=> b!797624 m!738009))

(assert (=> b!797624 m!738009))

(declare-fun m!738015 () Bool)

(assert (=> b!797624 m!738015))

(assert (=> b!797624 m!738009))

(declare-fun m!738017 () Bool)

(assert (=> b!797624 m!738017))

(declare-fun m!738019 () Bool)

(assert (=> start!68562 m!738019))

(declare-fun m!738021 () Bool)

(assert (=> start!68562 m!738021))

(declare-fun m!738023 () Bool)

(assert (=> b!797626 m!738023))

(declare-fun m!738025 () Bool)

(assert (=> b!797629 m!738025))

(declare-fun m!738027 () Bool)

(assert (=> b!797629 m!738027))

(declare-fun m!738029 () Bool)

(assert (=> b!797621 m!738029))

(declare-fun m!738031 () Bool)

(assert (=> b!797622 m!738031))

(declare-fun m!738033 () Bool)

(assert (=> b!797620 m!738033))

(declare-fun m!738035 () Bool)

(assert (=> b!797627 m!738035))

(check-sat (not b!797621) (not start!68562) (not b!797627) (not b!797626) (not b!797620) (not b!797625) (not b!797624) (not b!797622) (not b!797623))
(check-sat)
