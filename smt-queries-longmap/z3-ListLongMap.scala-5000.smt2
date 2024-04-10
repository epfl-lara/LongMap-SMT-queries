; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68512 () Bool)

(assert start!68512)

(declare-fun b!796643 () Bool)

(declare-fun res!541172 () Bool)

(declare-fun e!442027 () Bool)

(assert (=> b!796643 (=> (not res!541172) (not e!442027))))

(declare-datatypes ((array!43302 0))(
  ( (array!43303 (arr!20731 (Array (_ BitVec 32) (_ BitVec 64))) (size!21152 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43302)

(declare-datatypes ((List!14694 0))(
  ( (Nil!14691) (Cons!14690 (h!15819 (_ BitVec 64)) (t!21009 List!14694)) )
))
(declare-fun arrayNoDuplicates!0 (array!43302 (_ BitVec 32) List!14694) Bool)

(assert (=> b!796643 (= res!541172 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14691))))

(declare-fun b!796644 () Bool)

(declare-fun e!442026 () Bool)

(assert (=> b!796644 (= e!442027 e!442026)))

(declare-fun res!541169 () Bool)

(assert (=> b!796644 (=> (not res!541169) (not e!442026))))

(declare-datatypes ((SeekEntryResult!8322 0))(
  ( (MissingZero!8322 (index!35656 (_ BitVec 32))) (Found!8322 (index!35657 (_ BitVec 32))) (Intermediate!8322 (undefined!9134 Bool) (index!35658 (_ BitVec 32)) (x!66560 (_ BitVec 32))) (Undefined!8322) (MissingVacant!8322 (index!35659 (_ BitVec 32))) )
))
(declare-fun lt!355260 () SeekEntryResult!8322)

(declare-fun lt!355259 () SeekEntryResult!8322)

(assert (=> b!796644 (= res!541169 (= lt!355260 lt!355259))))

(declare-fun lt!355263 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355264 () array!43302)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43302 (_ BitVec 32)) SeekEntryResult!8322)

(assert (=> b!796644 (= lt!355259 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355263 lt!355264 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43302 (_ BitVec 32)) SeekEntryResult!8322)

(assert (=> b!796644 (= lt!355260 (seekEntryOrOpen!0 lt!355263 lt!355264 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796644 (= lt!355263 (select (store (arr!20731 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796644 (= lt!355264 (array!43303 (store (arr!20731 a!3170) i!1163 k0!2044) (size!21152 a!3170)))))

(declare-fun b!796645 () Bool)

(declare-fun res!541167 () Bool)

(assert (=> b!796645 (=> (not res!541167) (not e!442027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43302 (_ BitVec 32)) Bool)

(assert (=> b!796645 (= res!541167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796646 () Bool)

(declare-fun e!442025 () Bool)

(assert (=> b!796646 (= e!442026 e!442025)))

(declare-fun res!541168 () Bool)

(assert (=> b!796646 (=> (not res!541168) (not e!442025))))

(declare-fun lt!355262 () SeekEntryResult!8322)

(declare-fun lt!355265 () SeekEntryResult!8322)

(assert (=> b!796646 (= res!541168 (and (= lt!355265 lt!355262) (= lt!355262 (Found!8322 j!153)) (= (select (arr!20731 a!3170) index!1236) (select (arr!20731 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796646 (= lt!355262 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20731 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796646 (= lt!355265 (seekEntryOrOpen!0 (select (arr!20731 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796647 () Bool)

(declare-fun res!541165 () Bool)

(declare-fun e!442024 () Bool)

(assert (=> b!796647 (=> (not res!541165) (not e!442024))))

(declare-fun arrayContainsKey!0 (array!43302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796647 (= res!541165 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796648 () Bool)

(assert (=> b!796648 (= e!442025 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20731 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!796648 (= lt!355259 (Found!8322 index!1236))))

(declare-fun b!796649 () Bool)

(declare-fun res!541170 () Bool)

(assert (=> b!796649 (=> (not res!541170) (not e!442024))))

(assert (=> b!796649 (= res!541170 (and (= (size!21152 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21152 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21152 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796650 () Bool)

(declare-fun res!541166 () Bool)

(assert (=> b!796650 (=> (not res!541166) (not e!442024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796650 (= res!541166 (validKeyInArray!0 k0!2044))))

(declare-fun b!796652 () Bool)

(declare-fun res!541164 () Bool)

(assert (=> b!796652 (=> (not res!541164) (not e!442027))))

(assert (=> b!796652 (= res!541164 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21152 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20731 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21152 a!3170)) (= (select (arr!20731 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796653 () Bool)

(declare-fun res!541171 () Bool)

(assert (=> b!796653 (=> (not res!541171) (not e!442024))))

(assert (=> b!796653 (= res!541171 (validKeyInArray!0 (select (arr!20731 a!3170) j!153)))))

(declare-fun b!796651 () Bool)

(assert (=> b!796651 (= e!442024 e!442027)))

(declare-fun res!541163 () Bool)

(assert (=> b!796651 (=> (not res!541163) (not e!442027))))

(declare-fun lt!355261 () SeekEntryResult!8322)

(assert (=> b!796651 (= res!541163 (or (= lt!355261 (MissingZero!8322 i!1163)) (= lt!355261 (MissingVacant!8322 i!1163))))))

(assert (=> b!796651 (= lt!355261 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!541162 () Bool)

(assert (=> start!68512 (=> (not res!541162) (not e!442024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68512 (= res!541162 (validMask!0 mask!3266))))

(assert (=> start!68512 e!442024))

(assert (=> start!68512 true))

(declare-fun array_inv!16527 (array!43302) Bool)

(assert (=> start!68512 (array_inv!16527 a!3170)))

(assert (= (and start!68512 res!541162) b!796649))

(assert (= (and b!796649 res!541170) b!796653))

(assert (= (and b!796653 res!541171) b!796650))

(assert (= (and b!796650 res!541166) b!796647))

(assert (= (and b!796647 res!541165) b!796651))

(assert (= (and b!796651 res!541163) b!796645))

(assert (= (and b!796645 res!541167) b!796643))

(assert (= (and b!796643 res!541172) b!796652))

(assert (= (and b!796652 res!541164) b!796644))

(assert (= (and b!796644 res!541169) b!796646))

(assert (= (and b!796646 res!541168) b!796648))

(declare-fun m!737449 () Bool)

(assert (=> b!796652 m!737449))

(declare-fun m!737451 () Bool)

(assert (=> b!796652 m!737451))

(declare-fun m!737453 () Bool)

(assert (=> b!796648 m!737453))

(declare-fun m!737455 () Bool)

(assert (=> b!796648 m!737455))

(declare-fun m!737457 () Bool)

(assert (=> b!796643 m!737457))

(declare-fun m!737459 () Bool)

(assert (=> b!796646 m!737459))

(declare-fun m!737461 () Bool)

(assert (=> b!796646 m!737461))

(assert (=> b!796646 m!737461))

(declare-fun m!737463 () Bool)

(assert (=> b!796646 m!737463))

(assert (=> b!796646 m!737461))

(declare-fun m!737465 () Bool)

(assert (=> b!796646 m!737465))

(declare-fun m!737467 () Bool)

(assert (=> b!796645 m!737467))

(declare-fun m!737469 () Bool)

(assert (=> b!796644 m!737469))

(declare-fun m!737471 () Bool)

(assert (=> b!796644 m!737471))

(assert (=> b!796644 m!737453))

(declare-fun m!737473 () Bool)

(assert (=> b!796644 m!737473))

(declare-fun m!737475 () Bool)

(assert (=> start!68512 m!737475))

(declare-fun m!737477 () Bool)

(assert (=> start!68512 m!737477))

(assert (=> b!796653 m!737461))

(assert (=> b!796653 m!737461))

(declare-fun m!737479 () Bool)

(assert (=> b!796653 m!737479))

(declare-fun m!737481 () Bool)

(assert (=> b!796647 m!737481))

(declare-fun m!737483 () Bool)

(assert (=> b!796651 m!737483))

(declare-fun m!737485 () Bool)

(assert (=> b!796650 m!737485))

(check-sat (not b!796643) (not b!796645) (not b!796651) (not b!796646) (not b!796644) (not b!796653) (not b!796650) (not start!68512) (not b!796647))
(check-sat)
