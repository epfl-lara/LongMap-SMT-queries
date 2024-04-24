; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69332 () Bool)

(assert start!69332)

(declare-fun b!807425 () Bool)

(declare-fun res!551010 () Bool)

(declare-fun e!447211 () Bool)

(assert (=> b!807425 (=> (not res!551010) (not e!447211))))

(declare-datatypes ((array!43864 0))(
  ( (array!43865 (arr!21004 (Array (_ BitVec 32) (_ BitVec 64))) (size!21424 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43864)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807425 (= res!551010 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!551008 () Bool)

(assert (=> start!69332 (=> (not res!551008) (not e!447211))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69332 (= res!551008 (validMask!0 mask!3266))))

(assert (=> start!69332 e!447211))

(assert (=> start!69332 true))

(declare-fun array_inv!16863 (array!43864) Bool)

(assert (=> start!69332 (array_inv!16863 a!3170)))

(declare-fun b!807426 () Bool)

(declare-fun e!447210 () Bool)

(declare-fun e!447208 () Bool)

(assert (=> b!807426 (= e!447210 e!447208)))

(declare-fun res!551005 () Bool)

(assert (=> b!807426 (=> (not res!551005) (not e!447208))))

(declare-datatypes ((SeekEntryResult!8551 0))(
  ( (MissingZero!8551 (index!36572 (_ BitVec 32))) (Found!8551 (index!36573 (_ BitVec 32))) (Intermediate!8551 (undefined!9363 Bool) (index!36574 (_ BitVec 32)) (x!67553 (_ BitVec 32))) (Undefined!8551) (MissingVacant!8551 (index!36575 (_ BitVec 32))) )
))
(declare-fun lt!361559 () SeekEntryResult!8551)

(declare-fun lt!361558 () SeekEntryResult!8551)

(assert (=> b!807426 (= res!551005 (= lt!361559 lt!361558))))

(declare-fun lt!361561 () array!43864)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361556 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43864 (_ BitVec 32)) SeekEntryResult!8551)

(assert (=> b!807426 (= lt!361558 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361556 lt!361561 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43864 (_ BitVec 32)) SeekEntryResult!8551)

(assert (=> b!807426 (= lt!361559 (seekEntryOrOpen!0 lt!361556 lt!361561 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807426 (= lt!361556 (select (store (arr!21004 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807426 (= lt!361561 (array!43865 (store (arr!21004 a!3170) i!1163 k0!2044) (size!21424 a!3170)))))

(declare-fun b!807427 () Bool)

(declare-fun res!551009 () Bool)

(assert (=> b!807427 (=> (not res!551009) (not e!447210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43864 (_ BitVec 32)) Bool)

(assert (=> b!807427 (= res!551009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807428 () Bool)

(declare-fun e!447209 () Bool)

(assert (=> b!807428 (= e!447208 e!447209)))

(declare-fun res!551002 () Bool)

(assert (=> b!807428 (=> (not res!551002) (not e!447209))))

(declare-fun lt!361562 () SeekEntryResult!8551)

(declare-fun lt!361557 () SeekEntryResult!8551)

(assert (=> b!807428 (= res!551002 (and (= lt!361557 lt!361562) (= lt!361562 (Found!8551 j!153)) (= (select (arr!21004 a!3170) index!1236) (select (arr!21004 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807428 (= lt!361562 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21004 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807428 (= lt!361557 (seekEntryOrOpen!0 (select (arr!21004 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807429 () Bool)

(declare-fun res!551006 () Bool)

(assert (=> b!807429 (=> (not res!551006) (not e!447211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807429 (= res!551006 (validKeyInArray!0 k0!2044))))

(declare-fun b!807430 () Bool)

(declare-fun res!551007 () Bool)

(assert (=> b!807430 (=> (not res!551007) (not e!447210))))

(declare-datatypes ((List!14874 0))(
  ( (Nil!14871) (Cons!14870 (h!16005 (_ BitVec 64)) (t!21181 List!14874)) )
))
(declare-fun arrayNoDuplicates!0 (array!43864 (_ BitVec 32) List!14874) Bool)

(assert (=> b!807430 (= res!551007 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14871))))

(declare-fun b!807431 () Bool)

(assert (=> b!807431 (= e!447211 e!447210)))

(declare-fun res!551003 () Bool)

(assert (=> b!807431 (=> (not res!551003) (not e!447210))))

(declare-fun lt!361560 () SeekEntryResult!8551)

(assert (=> b!807431 (= res!551003 (or (= lt!361560 (MissingZero!8551 i!1163)) (= lt!361560 (MissingVacant!8551 i!1163))))))

(assert (=> b!807431 (= lt!361560 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807432 () Bool)

(assert (=> b!807432 (= e!447209 (not true))))

(assert (=> b!807432 (= lt!361558 (Found!8551 index!1236))))

(declare-fun b!807433 () Bool)

(declare-fun res!551001 () Bool)

(assert (=> b!807433 (=> (not res!551001) (not e!447210))))

(assert (=> b!807433 (= res!551001 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21424 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21004 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21424 a!3170)) (= (select (arr!21004 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807434 () Bool)

(declare-fun res!551004 () Bool)

(assert (=> b!807434 (=> (not res!551004) (not e!447211))))

(assert (=> b!807434 (= res!551004 (validKeyInArray!0 (select (arr!21004 a!3170) j!153)))))

(declare-fun b!807435 () Bool)

(declare-fun res!551000 () Bool)

(assert (=> b!807435 (=> (not res!551000) (not e!447211))))

(assert (=> b!807435 (= res!551000 (and (= (size!21424 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21424 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21424 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69332 res!551008) b!807435))

(assert (= (and b!807435 res!551000) b!807434))

(assert (= (and b!807434 res!551004) b!807429))

(assert (= (and b!807429 res!551006) b!807425))

(assert (= (and b!807425 res!551010) b!807431))

(assert (= (and b!807431 res!551003) b!807427))

(assert (= (and b!807427 res!551009) b!807430))

(assert (= (and b!807430 res!551007) b!807433))

(assert (= (and b!807433 res!551001) b!807426))

(assert (= (and b!807426 res!551005) b!807428))

(assert (= (and b!807428 res!551002) b!807432))

(declare-fun m!749725 () Bool)

(assert (=> b!807427 m!749725))

(declare-fun m!749727 () Bool)

(assert (=> b!807429 m!749727))

(declare-fun m!749729 () Bool)

(assert (=> b!807431 m!749729))

(declare-fun m!749731 () Bool)

(assert (=> b!807434 m!749731))

(assert (=> b!807434 m!749731))

(declare-fun m!749733 () Bool)

(assert (=> b!807434 m!749733))

(declare-fun m!749735 () Bool)

(assert (=> b!807425 m!749735))

(declare-fun m!749737 () Bool)

(assert (=> b!807430 m!749737))

(declare-fun m!749739 () Bool)

(assert (=> b!807433 m!749739))

(declare-fun m!749741 () Bool)

(assert (=> b!807433 m!749741))

(declare-fun m!749743 () Bool)

(assert (=> start!69332 m!749743))

(declare-fun m!749745 () Bool)

(assert (=> start!69332 m!749745))

(declare-fun m!749747 () Bool)

(assert (=> b!807428 m!749747))

(assert (=> b!807428 m!749731))

(assert (=> b!807428 m!749731))

(declare-fun m!749749 () Bool)

(assert (=> b!807428 m!749749))

(assert (=> b!807428 m!749731))

(declare-fun m!749751 () Bool)

(assert (=> b!807428 m!749751))

(declare-fun m!749753 () Bool)

(assert (=> b!807426 m!749753))

(declare-fun m!749755 () Bool)

(assert (=> b!807426 m!749755))

(declare-fun m!749757 () Bool)

(assert (=> b!807426 m!749757))

(declare-fun m!749759 () Bool)

(assert (=> b!807426 m!749759))

(check-sat (not b!807427) (not start!69332) (not b!807431) (not b!807426) (not b!807429) (not b!807434) (not b!807428) (not b!807430) (not b!807425))
(check-sat)
