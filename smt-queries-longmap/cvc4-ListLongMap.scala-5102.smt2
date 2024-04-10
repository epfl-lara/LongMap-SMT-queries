; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69222 () Bool)

(assert start!69222)

(declare-fun b!807503 () Bool)

(declare-fun e!447079 () Bool)

(declare-fun e!447080 () Bool)

(assert (=> b!807503 (= e!447079 e!447080)))

(declare-fun res!551628 () Bool)

(assert (=> b!807503 (=> (not res!551628) (not e!447080))))

(declare-datatypes ((array!43922 0))(
  ( (array!43923 (arr!21038 (Array (_ BitVec 32) (_ BitVec 64))) (size!21459 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43922)

(declare-datatypes ((SeekEntryResult!8629 0))(
  ( (MissingZero!8629 (index!36884 (_ BitVec 32))) (Found!8629 (index!36885 (_ BitVec 32))) (Intermediate!8629 (undefined!9441 Bool) (index!36886 (_ BitVec 32)) (x!67689 (_ BitVec 32))) (Undefined!8629) (MissingVacant!8629 (index!36887 (_ BitVec 32))) )
))
(declare-fun lt!361764 () SeekEntryResult!8629)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!361765 () SeekEntryResult!8629)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807503 (= res!551628 (and (= lt!361765 lt!361764) (= lt!361764 (Found!8629 j!153)) (not (= (select (arr!21038 a!3170) index!1236) (select (arr!21038 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43922 (_ BitVec 32)) SeekEntryResult!8629)

(assert (=> b!807503 (= lt!361764 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21038 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43922 (_ BitVec 32)) SeekEntryResult!8629)

(assert (=> b!807503 (= lt!361765 (seekEntryOrOpen!0 (select (arr!21038 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807504 () Bool)

(declare-fun res!551627 () Bool)

(declare-fun e!447083 () Bool)

(assert (=> b!807504 (=> (not res!551627) (not e!447083))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807504 (= res!551627 (validKeyInArray!0 k!2044))))

(declare-fun b!807505 () Bool)

(declare-fun res!551636 () Bool)

(assert (=> b!807505 (=> (not res!551636) (not e!447083))))

(declare-fun arrayContainsKey!0 (array!43922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807505 (= res!551636 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807506 () Bool)

(declare-fun res!551626 () Bool)

(declare-fun e!447082 () Bool)

(assert (=> b!807506 (=> (not res!551626) (not e!447082))))

(declare-datatypes ((List!15001 0))(
  ( (Nil!14998) (Cons!14997 (h!16126 (_ BitVec 64)) (t!21316 List!15001)) )
))
(declare-fun arrayNoDuplicates!0 (array!43922 (_ BitVec 32) List!15001) Bool)

(assert (=> b!807506 (= res!551626 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14998))))

(declare-fun res!551630 () Bool)

(assert (=> start!69222 (=> (not res!551630) (not e!447083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69222 (= res!551630 (validMask!0 mask!3266))))

(assert (=> start!69222 e!447083))

(assert (=> start!69222 true))

(declare-fun array_inv!16834 (array!43922) Bool)

(assert (=> start!69222 (array_inv!16834 a!3170)))

(declare-fun b!807507 () Bool)

(declare-fun res!551634 () Bool)

(assert (=> b!807507 (=> (not res!551634) (not e!447083))))

(assert (=> b!807507 (= res!551634 (validKeyInArray!0 (select (arr!21038 a!3170) j!153)))))

(declare-fun b!807508 () Bool)

(assert (=> b!807508 (= e!447080 false)))

(declare-fun lt!361769 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807508 (= lt!361769 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807509 () Bool)

(declare-fun res!551633 () Bool)

(assert (=> b!807509 (=> (not res!551633) (not e!447082))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807509 (= res!551633 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21459 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21038 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21459 a!3170)) (= (select (arr!21038 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807510 () Bool)

(declare-fun res!551635 () Bool)

(assert (=> b!807510 (=> (not res!551635) (not e!447082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43922 (_ BitVec 32)) Bool)

(assert (=> b!807510 (= res!551635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807511 () Bool)

(declare-fun res!551629 () Bool)

(assert (=> b!807511 (=> (not res!551629) (not e!447083))))

(assert (=> b!807511 (= res!551629 (and (= (size!21459 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21459 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21459 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807512 () Bool)

(assert (=> b!807512 (= e!447082 e!447079)))

(declare-fun res!551631 () Bool)

(assert (=> b!807512 (=> (not res!551631) (not e!447079))))

(declare-fun lt!361766 () (_ BitVec 64))

(declare-fun lt!361768 () array!43922)

(assert (=> b!807512 (= res!551631 (= (seekEntryOrOpen!0 lt!361766 lt!361768 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361766 lt!361768 mask!3266)))))

(assert (=> b!807512 (= lt!361766 (select (store (arr!21038 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807512 (= lt!361768 (array!43923 (store (arr!21038 a!3170) i!1163 k!2044) (size!21459 a!3170)))))

(declare-fun b!807513 () Bool)

(assert (=> b!807513 (= e!447083 e!447082)))

(declare-fun res!551632 () Bool)

(assert (=> b!807513 (=> (not res!551632) (not e!447082))))

(declare-fun lt!361767 () SeekEntryResult!8629)

(assert (=> b!807513 (= res!551632 (or (= lt!361767 (MissingZero!8629 i!1163)) (= lt!361767 (MissingVacant!8629 i!1163))))))

(assert (=> b!807513 (= lt!361767 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69222 res!551630) b!807511))

(assert (= (and b!807511 res!551629) b!807507))

(assert (= (and b!807507 res!551634) b!807504))

(assert (= (and b!807504 res!551627) b!807505))

(assert (= (and b!807505 res!551636) b!807513))

(assert (= (and b!807513 res!551632) b!807510))

(assert (= (and b!807510 res!551635) b!807506))

(assert (= (and b!807506 res!551626) b!807509))

(assert (= (and b!807509 res!551633) b!807512))

(assert (= (and b!807512 res!551631) b!807503))

(assert (= (and b!807503 res!551628) b!807508))

(declare-fun m!749547 () Bool)

(assert (=> b!807509 m!749547))

(declare-fun m!749549 () Bool)

(assert (=> b!807509 m!749549))

(declare-fun m!749551 () Bool)

(assert (=> b!807510 m!749551))

(declare-fun m!749553 () Bool)

(assert (=> b!807507 m!749553))

(assert (=> b!807507 m!749553))

(declare-fun m!749555 () Bool)

(assert (=> b!807507 m!749555))

(declare-fun m!749557 () Bool)

(assert (=> b!807513 m!749557))

(declare-fun m!749559 () Bool)

(assert (=> b!807512 m!749559))

(declare-fun m!749561 () Bool)

(assert (=> b!807512 m!749561))

(declare-fun m!749563 () Bool)

(assert (=> b!807512 m!749563))

(declare-fun m!749565 () Bool)

(assert (=> b!807512 m!749565))

(declare-fun m!749567 () Bool)

(assert (=> b!807504 m!749567))

(declare-fun m!749569 () Bool)

(assert (=> b!807506 m!749569))

(declare-fun m!749571 () Bool)

(assert (=> b!807503 m!749571))

(assert (=> b!807503 m!749553))

(assert (=> b!807503 m!749553))

(declare-fun m!749573 () Bool)

(assert (=> b!807503 m!749573))

(assert (=> b!807503 m!749553))

(declare-fun m!749575 () Bool)

(assert (=> b!807503 m!749575))

(declare-fun m!749577 () Bool)

(assert (=> b!807508 m!749577))

(declare-fun m!749579 () Bool)

(assert (=> b!807505 m!749579))

(declare-fun m!749581 () Bool)

(assert (=> start!69222 m!749581))

(declare-fun m!749583 () Bool)

(assert (=> start!69222 m!749583))

(push 1)

