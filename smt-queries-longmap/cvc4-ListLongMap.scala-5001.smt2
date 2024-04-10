; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68520 () Bool)

(assert start!68520)

(declare-fun res!541306 () Bool)

(declare-fun e!442092 () Bool)

(assert (=> start!68520 (=> (not res!541306) (not e!442092))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68520 (= res!541306 (validMask!0 mask!3266))))

(assert (=> start!68520 e!442092))

(assert (=> start!68520 true))

(declare-datatypes ((array!43310 0))(
  ( (array!43311 (arr!20735 (Array (_ BitVec 32) (_ BitVec 64))) (size!21156 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43310)

(declare-fun array_inv!16531 (array!43310) Bool)

(assert (=> start!68520 (array_inv!16531 a!3170)))

(declare-fun b!796783 () Bool)

(declare-fun e!442095 () Bool)

(declare-fun e!442094 () Bool)

(assert (=> b!796783 (= e!442095 (not e!442094))))

(declare-fun res!541307 () Bool)

(assert (=> b!796783 (=> res!541307 e!442094)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796783 (= res!541307 (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20735 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((SeekEntryResult!8326 0))(
  ( (MissingZero!8326 (index!35672 (_ BitVec 32))) (Found!8326 (index!35673 (_ BitVec 32))) (Intermediate!8326 (undefined!9138 Bool) (index!35674 (_ BitVec 32)) (x!66572 (_ BitVec 32))) (Undefined!8326) (MissingVacant!8326 (index!35675 (_ BitVec 32))) )
))
(declare-fun lt!355348 () SeekEntryResult!8326)

(assert (=> b!796783 (= lt!355348 (Found!8326 index!1236))))

(declare-fun b!796784 () Bool)

(declare-fun res!541302 () Bool)

(assert (=> b!796784 (=> (not res!541302) (not e!442092))))

(declare-fun arrayContainsKey!0 (array!43310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796784 (= res!541302 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796785 () Bool)

(declare-fun lt!355344 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796785 (= e!442094 (validKeyInArray!0 lt!355344))))

(declare-fun b!796786 () Bool)

(declare-fun res!541304 () Bool)

(declare-fun e!442096 () Bool)

(assert (=> b!796786 (=> (not res!541304) (not e!442096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43310 (_ BitVec 32)) Bool)

(assert (=> b!796786 (= res!541304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796787 () Bool)

(assert (=> b!796787 (= e!442092 e!442096)))

(declare-fun res!541312 () Bool)

(assert (=> b!796787 (=> (not res!541312) (not e!442096))))

(declare-fun lt!355345 () SeekEntryResult!8326)

(assert (=> b!796787 (= res!541312 (or (= lt!355345 (MissingZero!8326 i!1163)) (= lt!355345 (MissingVacant!8326 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43310 (_ BitVec 32)) SeekEntryResult!8326)

(assert (=> b!796787 (= lt!355345 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796788 () Bool)

(declare-fun res!541313 () Bool)

(assert (=> b!796788 (=> (not res!541313) (not e!442092))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796788 (= res!541313 (and (= (size!21156 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21156 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21156 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796789 () Bool)

(declare-fun res!541310 () Bool)

(assert (=> b!796789 (=> (not res!541310) (not e!442092))))

(assert (=> b!796789 (= res!541310 (validKeyInArray!0 k!2044))))

(declare-fun b!796790 () Bool)

(declare-fun res!541311 () Bool)

(assert (=> b!796790 (=> (not res!541311) (not e!442092))))

(assert (=> b!796790 (= res!541311 (validKeyInArray!0 (select (arr!20735 a!3170) j!153)))))

(declare-fun b!796791 () Bool)

(declare-fun res!541308 () Bool)

(assert (=> b!796791 (=> (not res!541308) (not e!442096))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796791 (= res!541308 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21156 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20735 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21156 a!3170)) (= (select (arr!20735 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796792 () Bool)

(declare-fun res!541309 () Bool)

(assert (=> b!796792 (=> (not res!541309) (not e!442096))))

(declare-datatypes ((List!14698 0))(
  ( (Nil!14695) (Cons!14694 (h!15823 (_ BitVec 64)) (t!21013 List!14698)) )
))
(declare-fun arrayNoDuplicates!0 (array!43310 (_ BitVec 32) List!14698) Bool)

(assert (=> b!796792 (= res!541309 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14695))))

(declare-fun b!796793 () Bool)

(declare-fun e!442093 () Bool)

(assert (=> b!796793 (= e!442093 e!442095)))

(declare-fun res!541305 () Bool)

(assert (=> b!796793 (=> (not res!541305) (not e!442095))))

(declare-fun lt!355343 () SeekEntryResult!8326)

(declare-fun lt!355349 () SeekEntryResult!8326)

(assert (=> b!796793 (= res!541305 (and (= lt!355349 lt!355343) (= lt!355343 (Found!8326 j!153)) (= (select (arr!20735 a!3170) index!1236) (select (arr!20735 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43310 (_ BitVec 32)) SeekEntryResult!8326)

(assert (=> b!796793 (= lt!355343 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20735 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796793 (= lt!355349 (seekEntryOrOpen!0 (select (arr!20735 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796794 () Bool)

(assert (=> b!796794 (= e!442096 e!442093)))

(declare-fun res!541303 () Bool)

(assert (=> b!796794 (=> (not res!541303) (not e!442093))))

(declare-fun lt!355346 () SeekEntryResult!8326)

(assert (=> b!796794 (= res!541303 (= lt!355346 lt!355348))))

(declare-fun lt!355347 () array!43310)

(assert (=> b!796794 (= lt!355348 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355344 lt!355347 mask!3266))))

(assert (=> b!796794 (= lt!355346 (seekEntryOrOpen!0 lt!355344 lt!355347 mask!3266))))

(assert (=> b!796794 (= lt!355344 (select (store (arr!20735 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796794 (= lt!355347 (array!43311 (store (arr!20735 a!3170) i!1163 k!2044) (size!21156 a!3170)))))

(assert (= (and start!68520 res!541306) b!796788))

(assert (= (and b!796788 res!541313) b!796790))

(assert (= (and b!796790 res!541311) b!796789))

(assert (= (and b!796789 res!541310) b!796784))

(assert (= (and b!796784 res!541302) b!796787))

(assert (= (and b!796787 res!541312) b!796786))

(assert (= (and b!796786 res!541304) b!796792))

(assert (= (and b!796792 res!541309) b!796791))

(assert (= (and b!796791 res!541308) b!796794))

(assert (= (and b!796794 res!541303) b!796793))

(assert (= (and b!796793 res!541305) b!796783))

(assert (= (and b!796783 (not res!541307)) b!796785))

(declare-fun m!737605 () Bool)

(assert (=> b!796794 m!737605))

(declare-fun m!737607 () Bool)

(assert (=> b!796794 m!737607))

(declare-fun m!737609 () Bool)

(assert (=> b!796794 m!737609))

(declare-fun m!737611 () Bool)

(assert (=> b!796794 m!737611))

(declare-fun m!737613 () Bool)

(assert (=> b!796787 m!737613))

(declare-fun m!737615 () Bool)

(assert (=> b!796790 m!737615))

(assert (=> b!796790 m!737615))

(declare-fun m!737617 () Bool)

(assert (=> b!796790 m!737617))

(declare-fun m!737619 () Bool)

(assert (=> b!796786 m!737619))

(declare-fun m!737621 () Bool)

(assert (=> start!68520 m!737621))

(declare-fun m!737623 () Bool)

(assert (=> start!68520 m!737623))

(declare-fun m!737625 () Bool)

(assert (=> b!796789 m!737625))

(declare-fun m!737627 () Bool)

(assert (=> b!796784 m!737627))

(assert (=> b!796783 m!737609))

(declare-fun m!737629 () Bool)

(assert (=> b!796783 m!737629))

(declare-fun m!737631 () Bool)

(assert (=> b!796785 m!737631))

(declare-fun m!737633 () Bool)

(assert (=> b!796792 m!737633))

(declare-fun m!737635 () Bool)

(assert (=> b!796793 m!737635))

(assert (=> b!796793 m!737615))

(assert (=> b!796793 m!737615))

(declare-fun m!737637 () Bool)

(assert (=> b!796793 m!737637))

(assert (=> b!796793 m!737615))

(declare-fun m!737639 () Bool)

(assert (=> b!796793 m!737639))

(declare-fun m!737641 () Bool)

(assert (=> b!796791 m!737641))

(declare-fun m!737643 () Bool)

(assert (=> b!796791 m!737643))

(push 1)

(assert (not start!68520))

(assert (not b!796794))

(assert (not b!796787))

(assert (not b!796789))

(assert (not b!796793))

(assert (not b!796792))

