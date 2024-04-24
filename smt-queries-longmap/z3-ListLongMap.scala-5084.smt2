; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69182 () Bool)

(assert start!69182)

(declare-fun b!806037 () Bool)

(declare-fun res!550010 () Bool)

(declare-fun e!446503 () Bool)

(assert (=> b!806037 (=> (not res!550010) (not e!446503))))

(declare-datatypes ((array!43804 0))(
  ( (array!43805 (arr!20977 (Array (_ BitVec 32) (_ BitVec 64))) (size!21397 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43804)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806037 (= res!550010 (validKeyInArray!0 (select (arr!20977 a!3170) j!153)))))

(declare-fun b!806038 () Bool)

(declare-fun res!550013 () Bool)

(declare-fun e!446505 () Bool)

(assert (=> b!806038 (=> (not res!550013) (not e!446505))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806038 (= res!550013 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21397 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20977 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21397 a!3170)) (= (select (arr!20977 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806039 () Bool)

(declare-fun res!550011 () Bool)

(assert (=> b!806039 (=> (not res!550011) (not e!446503))))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!806039 (= res!550011 (and (= (size!21397 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21397 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21397 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806040 () Bool)

(declare-fun e!446506 () Bool)

(assert (=> b!806040 (= e!446506 false)))

(declare-datatypes ((SeekEntryResult!8524 0))(
  ( (MissingZero!8524 (index!36464 (_ BitVec 32))) (Found!8524 (index!36465 (_ BitVec 32))) (Intermediate!8524 (undefined!9336 Bool) (index!36466 (_ BitVec 32)) (x!67448 (_ BitVec 32))) (Undefined!8524) (MissingVacant!8524 (index!36467 (_ BitVec 32))) )
))
(declare-fun lt!360838 () SeekEntryResult!8524)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43804 (_ BitVec 32)) SeekEntryResult!8524)

(assert (=> b!806040 (= lt!360838 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20977 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360840 () SeekEntryResult!8524)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43804 (_ BitVec 32)) SeekEntryResult!8524)

(assert (=> b!806040 (= lt!360840 (seekEntryOrOpen!0 (select (arr!20977 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806041 () Bool)

(declare-fun res!550012 () Bool)

(assert (=> b!806041 (=> (not res!550012) (not e!446503))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!806041 (= res!550012 (validKeyInArray!0 k0!2044))))

(declare-fun b!806042 () Bool)

(declare-fun res!550017 () Bool)

(assert (=> b!806042 (=> (not res!550017) (not e!446505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43804 (_ BitVec 32)) Bool)

(assert (=> b!806042 (= res!550017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806043 () Bool)

(declare-fun res!550009 () Bool)

(assert (=> b!806043 (=> (not res!550009) (not e!446505))))

(declare-datatypes ((List!14847 0))(
  ( (Nil!14844) (Cons!14843 (h!15978 (_ BitVec 64)) (t!21154 List!14847)) )
))
(declare-fun arrayNoDuplicates!0 (array!43804 (_ BitVec 32) List!14847) Bool)

(assert (=> b!806043 (= res!550009 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14844))))

(declare-fun res!550016 () Bool)

(assert (=> start!69182 (=> (not res!550016) (not e!446503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69182 (= res!550016 (validMask!0 mask!3266))))

(assert (=> start!69182 e!446503))

(assert (=> start!69182 true))

(declare-fun array_inv!16836 (array!43804) Bool)

(assert (=> start!69182 (array_inv!16836 a!3170)))

(declare-fun b!806044 () Bool)

(declare-fun res!550014 () Bool)

(assert (=> b!806044 (=> (not res!550014) (not e!446503))))

(declare-fun arrayContainsKey!0 (array!43804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806044 (= res!550014 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806045 () Bool)

(assert (=> b!806045 (= e!446505 e!446506)))

(declare-fun res!550008 () Bool)

(assert (=> b!806045 (=> (not res!550008) (not e!446506))))

(declare-fun lt!360841 () array!43804)

(declare-fun lt!360842 () (_ BitVec 64))

(assert (=> b!806045 (= res!550008 (= (seekEntryOrOpen!0 lt!360842 lt!360841 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360842 lt!360841 mask!3266)))))

(assert (=> b!806045 (= lt!360842 (select (store (arr!20977 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806045 (= lt!360841 (array!43805 (store (arr!20977 a!3170) i!1163 k0!2044) (size!21397 a!3170)))))

(declare-fun b!806046 () Bool)

(assert (=> b!806046 (= e!446503 e!446505)))

(declare-fun res!550015 () Bool)

(assert (=> b!806046 (=> (not res!550015) (not e!446505))))

(declare-fun lt!360839 () SeekEntryResult!8524)

(assert (=> b!806046 (= res!550015 (or (= lt!360839 (MissingZero!8524 i!1163)) (= lt!360839 (MissingVacant!8524 i!1163))))))

(assert (=> b!806046 (= lt!360839 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69182 res!550016) b!806039))

(assert (= (and b!806039 res!550011) b!806037))

(assert (= (and b!806037 res!550010) b!806041))

(assert (= (and b!806041 res!550012) b!806044))

(assert (= (and b!806044 res!550014) b!806046))

(assert (= (and b!806046 res!550015) b!806042))

(assert (= (and b!806042 res!550017) b!806043))

(assert (= (and b!806043 res!550009) b!806038))

(assert (= (and b!806038 res!550013) b!806045))

(assert (= (and b!806045 res!550008) b!806040))

(declare-fun m!748315 () Bool)

(assert (=> b!806043 m!748315))

(declare-fun m!748317 () Bool)

(assert (=> b!806040 m!748317))

(assert (=> b!806040 m!748317))

(declare-fun m!748319 () Bool)

(assert (=> b!806040 m!748319))

(assert (=> b!806040 m!748317))

(declare-fun m!748321 () Bool)

(assert (=> b!806040 m!748321))

(declare-fun m!748323 () Bool)

(assert (=> b!806044 m!748323))

(declare-fun m!748325 () Bool)

(assert (=> b!806046 m!748325))

(declare-fun m!748327 () Bool)

(assert (=> b!806038 m!748327))

(declare-fun m!748329 () Bool)

(assert (=> b!806038 m!748329))

(declare-fun m!748331 () Bool)

(assert (=> b!806041 m!748331))

(declare-fun m!748333 () Bool)

(assert (=> b!806042 m!748333))

(declare-fun m!748335 () Bool)

(assert (=> start!69182 m!748335))

(declare-fun m!748337 () Bool)

(assert (=> start!69182 m!748337))

(declare-fun m!748339 () Bool)

(assert (=> b!806045 m!748339))

(declare-fun m!748341 () Bool)

(assert (=> b!806045 m!748341))

(declare-fun m!748343 () Bool)

(assert (=> b!806045 m!748343))

(declare-fun m!748345 () Bool)

(assert (=> b!806045 m!748345))

(assert (=> b!806037 m!748317))

(assert (=> b!806037 m!748317))

(declare-fun m!748347 () Bool)

(assert (=> b!806037 m!748347))

(check-sat (not start!69182) (not b!806043) (not b!806041) (not b!806040) (not b!806044) (not b!806042) (not b!806045) (not b!806037) (not b!806046))
(check-sat)
