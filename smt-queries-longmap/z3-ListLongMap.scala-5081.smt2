; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68976 () Bool)

(assert start!68976)

(declare-fun b!804629 () Bool)

(declare-fun e!445672 () Bool)

(declare-fun e!445669 () Bool)

(assert (=> b!804629 (= e!445672 e!445669)))

(declare-fun res!549290 () Bool)

(assert (=> b!804629 (=> (not res!549290) (not e!445669))))

(declare-datatypes ((SeekEntryResult!8560 0))(
  ( (MissingZero!8560 (index!36608 (_ BitVec 32))) (Found!8560 (index!36609 (_ BitVec 32))) (Intermediate!8560 (undefined!9372 Bool) (index!36610 (_ BitVec 32)) (x!67441 (_ BitVec 32))) (Undefined!8560) (MissingVacant!8560 (index!36611 (_ BitVec 32))) )
))
(declare-fun lt!360108 () SeekEntryResult!8560)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804629 (= res!549290 (or (= lt!360108 (MissingZero!8560 i!1163)) (= lt!360108 (MissingVacant!8560 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43783 0))(
  ( (array!43784 (arr!20972 (Array (_ BitVec 32) (_ BitVec 64))) (size!21393 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43783)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43783 (_ BitVec 32)) SeekEntryResult!8560)

(assert (=> b!804629 (= lt!360108 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804630 () Bool)

(declare-fun res!549291 () Bool)

(assert (=> b!804630 (=> (not res!549291) (not e!445672))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804630 (= res!549291 (validKeyInArray!0 (select (arr!20972 a!3170) j!153)))))

(declare-fun b!804631 () Bool)

(declare-fun res!549295 () Bool)

(assert (=> b!804631 (=> (not res!549295) (not e!445669))))

(declare-datatypes ((List!14974 0))(
  ( (Nil!14971) (Cons!14970 (h!16099 (_ BitVec 64)) (t!21280 List!14974)) )
))
(declare-fun arrayNoDuplicates!0 (array!43783 (_ BitVec 32) List!14974) Bool)

(assert (=> b!804631 (= res!549295 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14971))))

(declare-fun b!804632 () Bool)

(declare-fun res!549294 () Bool)

(assert (=> b!804632 (=> (not res!549294) (not e!445672))))

(assert (=> b!804632 (= res!549294 (validKeyInArray!0 k0!2044))))

(declare-fun b!804633 () Bool)

(declare-fun res!549293 () Bool)

(assert (=> b!804633 (=> (not res!549293) (not e!445669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43783 (_ BitVec 32)) Bool)

(assert (=> b!804633 (= res!549293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804634 () Bool)

(declare-fun res!549288 () Bool)

(assert (=> b!804634 (=> (not res!549288) (not e!445669))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804634 (= res!549288 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21393 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20972 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21393 a!3170)) (= (select (arr!20972 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!549297 () Bool)

(assert (=> start!68976 (=> (not res!549297) (not e!445672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68976 (= res!549297 (validMask!0 mask!3266))))

(assert (=> start!68976 e!445672))

(assert (=> start!68976 true))

(declare-fun array_inv!16855 (array!43783) Bool)

(assert (=> start!68976 (array_inv!16855 a!3170)))

(declare-fun b!804635 () Bool)

(declare-fun e!445670 () Bool)

(assert (=> b!804635 (= e!445669 e!445670)))

(declare-fun res!549296 () Bool)

(assert (=> b!804635 (=> (not res!549296) (not e!445670))))

(declare-fun lt!360110 () array!43783)

(declare-fun lt!360109 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43783 (_ BitVec 32)) SeekEntryResult!8560)

(assert (=> b!804635 (= res!549296 (= (seekEntryOrOpen!0 lt!360109 lt!360110 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360109 lt!360110 mask!3266)))))

(assert (=> b!804635 (= lt!360109 (select (store (arr!20972 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804635 (= lt!360110 (array!43784 (store (arr!20972 a!3170) i!1163 k0!2044) (size!21393 a!3170)))))

(declare-fun b!804636 () Bool)

(declare-fun res!549289 () Bool)

(assert (=> b!804636 (=> (not res!549289) (not e!445672))))

(declare-fun arrayContainsKey!0 (array!43783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804636 (= res!549289 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804637 () Bool)

(assert (=> b!804637 (= e!445670 false)))

(declare-fun lt!360107 () SeekEntryResult!8560)

(assert (=> b!804637 (= lt!360107 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20972 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360106 () SeekEntryResult!8560)

(assert (=> b!804637 (= lt!360106 (seekEntryOrOpen!0 (select (arr!20972 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804638 () Bool)

(declare-fun res!549292 () Bool)

(assert (=> b!804638 (=> (not res!549292) (not e!445672))))

(assert (=> b!804638 (= res!549292 (and (= (size!21393 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21393 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21393 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68976 res!549297) b!804638))

(assert (= (and b!804638 res!549292) b!804630))

(assert (= (and b!804630 res!549291) b!804632))

(assert (= (and b!804632 res!549294) b!804636))

(assert (= (and b!804636 res!549289) b!804629))

(assert (= (and b!804629 res!549290) b!804633))

(assert (= (and b!804633 res!549293) b!804631))

(assert (= (and b!804631 res!549295) b!804634))

(assert (= (and b!804634 res!549288) b!804635))

(assert (= (and b!804635 res!549296) b!804637))

(declare-fun m!746011 () Bool)

(assert (=> b!804630 m!746011))

(assert (=> b!804630 m!746011))

(declare-fun m!746013 () Bool)

(assert (=> b!804630 m!746013))

(declare-fun m!746015 () Bool)

(assert (=> b!804636 m!746015))

(declare-fun m!746017 () Bool)

(assert (=> b!804632 m!746017))

(declare-fun m!746019 () Bool)

(assert (=> start!68976 m!746019))

(declare-fun m!746021 () Bool)

(assert (=> start!68976 m!746021))

(declare-fun m!746023 () Bool)

(assert (=> b!804635 m!746023))

(declare-fun m!746025 () Bool)

(assert (=> b!804635 m!746025))

(declare-fun m!746027 () Bool)

(assert (=> b!804635 m!746027))

(declare-fun m!746029 () Bool)

(assert (=> b!804635 m!746029))

(declare-fun m!746031 () Bool)

(assert (=> b!804633 m!746031))

(declare-fun m!746033 () Bool)

(assert (=> b!804629 m!746033))

(assert (=> b!804637 m!746011))

(assert (=> b!804637 m!746011))

(declare-fun m!746035 () Bool)

(assert (=> b!804637 m!746035))

(assert (=> b!804637 m!746011))

(declare-fun m!746037 () Bool)

(assert (=> b!804637 m!746037))

(declare-fun m!746039 () Bool)

(assert (=> b!804634 m!746039))

(declare-fun m!746041 () Bool)

(assert (=> b!804634 m!746041))

(declare-fun m!746043 () Bool)

(assert (=> b!804631 m!746043))

(check-sat (not b!804633) (not b!804632) (not b!804631) (not b!804635) (not b!804636) (not b!804630) (not b!804629) (not b!804637) (not start!68976))
(check-sat)
