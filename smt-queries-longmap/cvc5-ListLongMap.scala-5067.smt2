; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68896 () Bool)

(assert start!68896)

(declare-fun res!548304 () Bool)

(declare-fun e!445259 () Bool)

(assert (=> start!68896 (=> (not res!548304) (not e!445259))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68896 (= res!548304 (validMask!0 mask!3266))))

(assert (=> start!68896 e!445259))

(assert (=> start!68896 true))

(declare-datatypes ((array!43703 0))(
  ( (array!43704 (arr!20932 (Array (_ BitVec 32) (_ BitVec 64))) (size!21353 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43703)

(declare-fun array_inv!16815 (array!43703) Bool)

(assert (=> start!68896 (array_inv!16815 a!3170)))

(declare-fun b!803634 () Bool)

(declare-fun res!548293 () Bool)

(declare-fun e!445260 () Bool)

(assert (=> b!803634 (=> (not res!548293) (not e!445260))))

(declare-datatypes ((List!14934 0))(
  ( (Nil!14931) (Cons!14930 (h!16059 (_ BitVec 64)) (t!21240 List!14934)) )
))
(declare-fun arrayNoDuplicates!0 (array!43703 (_ BitVec 32) List!14934) Bool)

(assert (=> b!803634 (= res!548293 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14931))))

(declare-fun b!803635 () Bool)

(declare-fun e!445262 () Bool)

(declare-fun e!445264 () Bool)

(assert (=> b!803635 (= e!445262 e!445264)))

(declare-fun res!548303 () Bool)

(assert (=> b!803635 (=> (not res!548303) (not e!445264))))

(declare-datatypes ((SeekEntryResult!8520 0))(
  ( (MissingZero!8520 (index!36448 (_ BitVec 32))) (Found!8520 (index!36449 (_ BitVec 32))) (Intermediate!8520 (undefined!9332 Bool) (index!36450 (_ BitVec 32)) (x!67289 (_ BitVec 32))) (Undefined!8520) (MissingVacant!8520 (index!36451 (_ BitVec 32))) )
))
(declare-fun lt!359692 () SeekEntryResult!8520)

(declare-fun lt!359699 () SeekEntryResult!8520)

(assert (=> b!803635 (= res!548303 (= lt!359692 lt!359699))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43703 (_ BitVec 32)) SeekEntryResult!8520)

(assert (=> b!803635 (= lt!359699 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20932 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43703 (_ BitVec 32)) SeekEntryResult!8520)

(assert (=> b!803635 (= lt!359692 (seekEntryOrOpen!0 (select (arr!20932 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803636 () Bool)

(declare-fun e!445261 () Bool)

(declare-fun lt!359695 () SeekEntryResult!8520)

(declare-fun lt!359694 () SeekEntryResult!8520)

(assert (=> b!803636 (= e!445261 (not (or (not (= lt!359695 lt!359694)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (and (bvsge vacantBefore!23 #b00000000000000000000000000000000) (bvslt vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))))

(declare-fun lt!359690 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359696 () (_ BitVec 32))

(declare-fun lt!359697 () array!43703)

(assert (=> b!803636 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359696 vacantAfter!23 lt!359690 lt!359697 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359696 vacantBefore!23 (select (arr!20932 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27554 0))(
  ( (Unit!27555) )
))
(declare-fun lt!359693 () Unit!27554)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43703 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27554)

(assert (=> b!803636 (= lt!359693 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359696 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803636 (= lt!359696 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803637 () Bool)

(declare-fun res!548296 () Bool)

(assert (=> b!803637 (=> (not res!548296) (not e!445259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803637 (= res!548296 (validKeyInArray!0 (select (arr!20932 a!3170) j!153)))))

(declare-fun b!803638 () Bool)

(assert (=> b!803638 (= e!445259 e!445260)))

(declare-fun res!548299 () Bool)

(assert (=> b!803638 (=> (not res!548299) (not e!445260))))

(declare-fun lt!359691 () SeekEntryResult!8520)

(assert (=> b!803638 (= res!548299 (or (= lt!359691 (MissingZero!8520 i!1163)) (= lt!359691 (MissingVacant!8520 i!1163))))))

(assert (=> b!803638 (= lt!359691 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803639 () Bool)

(assert (=> b!803639 (= e!445264 e!445261)))

(declare-fun res!548295 () Bool)

(assert (=> b!803639 (=> (not res!548295) (not e!445261))))

(assert (=> b!803639 (= res!548295 (and (= lt!359699 lt!359694) (not (= (select (arr!20932 a!3170) index!1236) (select (arr!20932 a!3170) j!153)))))))

(assert (=> b!803639 (= lt!359694 (Found!8520 j!153))))

(declare-fun b!803640 () Bool)

(declare-fun res!548300 () Bool)

(assert (=> b!803640 (=> (not res!548300) (not e!445259))))

(assert (=> b!803640 (= res!548300 (and (= (size!21353 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21353 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21353 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803641 () Bool)

(declare-fun res!548294 () Bool)

(assert (=> b!803641 (=> (not res!548294) (not e!445260))))

(assert (=> b!803641 (= res!548294 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21353 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20932 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21353 a!3170)) (= (select (arr!20932 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803642 () Bool)

(assert (=> b!803642 (= e!445260 e!445262)))

(declare-fun res!548298 () Bool)

(assert (=> b!803642 (=> (not res!548298) (not e!445262))))

(declare-fun lt!359698 () SeekEntryResult!8520)

(assert (=> b!803642 (= res!548298 (= lt!359698 lt!359695))))

(assert (=> b!803642 (= lt!359695 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359690 lt!359697 mask!3266))))

(assert (=> b!803642 (= lt!359698 (seekEntryOrOpen!0 lt!359690 lt!359697 mask!3266))))

(assert (=> b!803642 (= lt!359690 (select (store (arr!20932 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803642 (= lt!359697 (array!43704 (store (arr!20932 a!3170) i!1163 k!2044) (size!21353 a!3170)))))

(declare-fun b!803643 () Bool)

(declare-fun res!548301 () Bool)

(assert (=> b!803643 (=> (not res!548301) (not e!445259))))

(declare-fun arrayContainsKey!0 (array!43703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803643 (= res!548301 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803644 () Bool)

(declare-fun res!548297 () Bool)

(assert (=> b!803644 (=> (not res!548297) (not e!445260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43703 (_ BitVec 32)) Bool)

(assert (=> b!803644 (= res!548297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803645 () Bool)

(declare-fun res!548302 () Bool)

(assert (=> b!803645 (=> (not res!548302) (not e!445259))))

(assert (=> b!803645 (= res!548302 (validKeyInArray!0 k!2044))))

(assert (= (and start!68896 res!548304) b!803640))

(assert (= (and b!803640 res!548300) b!803637))

(assert (= (and b!803637 res!548296) b!803645))

(assert (= (and b!803645 res!548302) b!803643))

(assert (= (and b!803643 res!548301) b!803638))

(assert (= (and b!803638 res!548299) b!803644))

(assert (= (and b!803644 res!548297) b!803634))

(assert (= (and b!803634 res!548293) b!803641))

(assert (= (and b!803641 res!548294) b!803642))

(assert (= (and b!803642 res!548298) b!803635))

(assert (= (and b!803635 res!548303) b!803639))

(assert (= (and b!803639 res!548295) b!803636))

(declare-fun m!744989 () Bool)

(assert (=> b!803644 m!744989))

(declare-fun m!744991 () Bool)

(assert (=> b!803642 m!744991))

(declare-fun m!744993 () Bool)

(assert (=> b!803642 m!744993))

(declare-fun m!744995 () Bool)

(assert (=> b!803642 m!744995))

(declare-fun m!744997 () Bool)

(assert (=> b!803642 m!744997))

(declare-fun m!744999 () Bool)

(assert (=> b!803638 m!744999))

(declare-fun m!745001 () Bool)

(assert (=> b!803636 m!745001))

(assert (=> b!803636 m!745001))

(declare-fun m!745003 () Bool)

(assert (=> b!803636 m!745003))

(declare-fun m!745005 () Bool)

(assert (=> b!803636 m!745005))

(declare-fun m!745007 () Bool)

(assert (=> b!803636 m!745007))

(declare-fun m!745009 () Bool)

(assert (=> b!803636 m!745009))

(assert (=> b!803637 m!745001))

(assert (=> b!803637 m!745001))

(declare-fun m!745011 () Bool)

(assert (=> b!803637 m!745011))

(declare-fun m!745013 () Bool)

(assert (=> b!803645 m!745013))

(declare-fun m!745015 () Bool)

(assert (=> b!803634 m!745015))

(declare-fun m!745017 () Bool)

(assert (=> b!803643 m!745017))

(declare-fun m!745019 () Bool)

(assert (=> b!803641 m!745019))

(declare-fun m!745021 () Bool)

(assert (=> b!803641 m!745021))

(declare-fun m!745023 () Bool)

(assert (=> b!803639 m!745023))

(assert (=> b!803639 m!745001))

(assert (=> b!803635 m!745001))

(assert (=> b!803635 m!745001))

(declare-fun m!745025 () Bool)

(assert (=> b!803635 m!745025))

(assert (=> b!803635 m!745001))

(declare-fun m!745027 () Bool)

(assert (=> b!803635 m!745027))

(declare-fun m!745029 () Bool)

(assert (=> start!68896 m!745029))

(declare-fun m!745031 () Bool)

(assert (=> start!68896 m!745031))

(push 1)

(assert (not start!68896))

(assert (not b!803635))

(assert (not b!803637))

(assert (not b!803644))

(assert (not b!803636))

(assert (not b!803643))

(assert (not b!803642))

(assert (not b!803645))

(assert (not b!803634))

(assert (not b!803638))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

