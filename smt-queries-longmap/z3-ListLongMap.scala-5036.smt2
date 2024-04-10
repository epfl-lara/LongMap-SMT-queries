; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68728 () Bool)

(assert start!68728)

(declare-fun b!800523 () Bool)

(declare-fun res!545051 () Bool)

(declare-fun e!443833 () Bool)

(assert (=> b!800523 (=> (not res!545051) (not e!443833))))

(declare-datatypes ((array!43518 0))(
  ( (array!43519 (arr!20839 (Array (_ BitVec 32) (_ BitVec 64))) (size!21260 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43518)

(declare-datatypes ((List!14802 0))(
  ( (Nil!14799) (Cons!14798 (h!15927 (_ BitVec 64)) (t!21117 List!14802)) )
))
(declare-fun arrayNoDuplicates!0 (array!43518 (_ BitVec 32) List!14802) Bool)

(assert (=> b!800523 (= res!545051 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14799))))

(declare-fun b!800524 () Bool)

(declare-fun res!545046 () Bool)

(declare-fun e!443831 () Bool)

(assert (=> b!800524 (=> (not res!545046) (not e!443831))))

(declare-fun lt!357661 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8430 0))(
  ( (MissingZero!8430 (index!36088 (_ BitVec 32))) (Found!8430 (index!36089 (_ BitVec 32))) (Intermediate!8430 (undefined!9242 Bool) (index!36090 (_ BitVec 32)) (x!66956 (_ BitVec 32))) (Undefined!8430) (MissingVacant!8430 (index!36091 (_ BitVec 32))) )
))
(declare-fun lt!357660 () SeekEntryResult!8430)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!357662 () (_ BitVec 32))

(declare-fun lt!357665 () array!43518)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43518 (_ BitVec 32)) SeekEntryResult!8430)

(assert (=> b!800524 (= res!545046 (= lt!357660 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357662 vacantAfter!23 lt!357661 lt!357665 mask!3266)))))

(declare-fun b!800526 () Bool)

(declare-fun res!545042 () Bool)

(declare-fun e!443834 () Bool)

(assert (=> b!800526 (=> (not res!545042) (not e!443834))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800526 (= res!545042 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800527 () Bool)

(declare-fun e!443832 () Bool)

(assert (=> b!800527 (= e!443833 e!443832)))

(declare-fun res!545052 () Bool)

(assert (=> b!800527 (=> (not res!545052) (not e!443832))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800527 (= res!545052 (= lt!357660 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357661 lt!357665 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43518 (_ BitVec 32)) SeekEntryResult!8430)

(assert (=> b!800527 (= lt!357660 (seekEntryOrOpen!0 lt!357661 lt!357665 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800527 (= lt!357661 (select (store (arr!20839 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800527 (= lt!357665 (array!43519 (store (arr!20839 a!3170) i!1163 k0!2044) (size!21260 a!3170)))))

(declare-fun b!800528 () Bool)

(assert (=> b!800528 (= e!443831 false)))

(declare-fun lt!357658 () SeekEntryResult!8430)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800528 (= lt!357658 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357662 vacantBefore!23 (select (arr!20839 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800529 () Bool)

(declare-fun res!545054 () Bool)

(assert (=> b!800529 (=> (not res!545054) (not e!443834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800529 (= res!545054 (validKeyInArray!0 k0!2044))))

(declare-fun b!800530 () Bool)

(declare-fun res!545044 () Bool)

(assert (=> b!800530 (=> (not res!545044) (not e!443833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43518 (_ BitVec 32)) Bool)

(assert (=> b!800530 (= res!545044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800531 () Bool)

(declare-fun res!545045 () Bool)

(assert (=> b!800531 (=> (not res!545045) (not e!443834))))

(assert (=> b!800531 (= res!545045 (and (= (size!21260 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21260 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21260 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800532 () Bool)

(declare-fun e!443829 () Bool)

(assert (=> b!800532 (= e!443832 e!443829)))

(declare-fun res!545048 () Bool)

(assert (=> b!800532 (=> (not res!545048) (not e!443829))))

(declare-fun lt!357663 () SeekEntryResult!8430)

(declare-fun lt!357664 () SeekEntryResult!8430)

(assert (=> b!800532 (= res!545048 (and (= lt!357663 lt!357664) (= lt!357664 (Found!8430 j!153)) (not (= (select (arr!20839 a!3170) index!1236) (select (arr!20839 a!3170) j!153)))))))

(assert (=> b!800532 (= lt!357664 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20839 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800532 (= lt!357663 (seekEntryOrOpen!0 (select (arr!20839 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800533 () Bool)

(declare-fun res!545043 () Bool)

(assert (=> b!800533 (=> (not res!545043) (not e!443833))))

(assert (=> b!800533 (= res!545043 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21260 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20839 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21260 a!3170)) (= (select (arr!20839 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800525 () Bool)

(assert (=> b!800525 (= e!443834 e!443833)))

(declare-fun res!545049 () Bool)

(assert (=> b!800525 (=> (not res!545049) (not e!443833))))

(declare-fun lt!357659 () SeekEntryResult!8430)

(assert (=> b!800525 (= res!545049 (or (= lt!357659 (MissingZero!8430 i!1163)) (= lt!357659 (MissingVacant!8430 i!1163))))))

(assert (=> b!800525 (= lt!357659 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!545047 () Bool)

(assert (=> start!68728 (=> (not res!545047) (not e!443834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68728 (= res!545047 (validMask!0 mask!3266))))

(assert (=> start!68728 e!443834))

(assert (=> start!68728 true))

(declare-fun array_inv!16635 (array!43518) Bool)

(assert (=> start!68728 (array_inv!16635 a!3170)))

(declare-fun b!800534 () Bool)

(declare-fun res!545050 () Bool)

(assert (=> b!800534 (=> (not res!545050) (not e!443834))))

(assert (=> b!800534 (= res!545050 (validKeyInArray!0 (select (arr!20839 a!3170) j!153)))))

(declare-fun b!800535 () Bool)

(assert (=> b!800535 (= e!443829 e!443831)))

(declare-fun res!545053 () Bool)

(assert (=> b!800535 (=> (not res!545053) (not e!443831))))

(assert (=> b!800535 (= res!545053 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357662 #b00000000000000000000000000000000) (bvslt lt!357662 (size!21260 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800535 (= lt!357662 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68728 res!545047) b!800531))

(assert (= (and b!800531 res!545045) b!800534))

(assert (= (and b!800534 res!545050) b!800529))

(assert (= (and b!800529 res!545054) b!800526))

(assert (= (and b!800526 res!545042) b!800525))

(assert (= (and b!800525 res!545049) b!800530))

(assert (= (and b!800530 res!545044) b!800523))

(assert (= (and b!800523 res!545051) b!800533))

(assert (= (and b!800533 res!545043) b!800527))

(assert (= (and b!800527 res!545052) b!800532))

(assert (= (and b!800532 res!545048) b!800535))

(assert (= (and b!800535 res!545053) b!800524))

(assert (= (and b!800524 res!545046) b!800528))

(declare-fun m!741617 () Bool)

(assert (=> b!800525 m!741617))

(declare-fun m!741619 () Bool)

(assert (=> b!800533 m!741619))

(declare-fun m!741621 () Bool)

(assert (=> b!800533 m!741621))

(declare-fun m!741623 () Bool)

(assert (=> b!800527 m!741623))

(declare-fun m!741625 () Bool)

(assert (=> b!800527 m!741625))

(declare-fun m!741627 () Bool)

(assert (=> b!800527 m!741627))

(declare-fun m!741629 () Bool)

(assert (=> b!800527 m!741629))

(declare-fun m!741631 () Bool)

(assert (=> start!68728 m!741631))

(declare-fun m!741633 () Bool)

(assert (=> start!68728 m!741633))

(declare-fun m!741635 () Bool)

(assert (=> b!800523 m!741635))

(declare-fun m!741637 () Bool)

(assert (=> b!800535 m!741637))

(declare-fun m!741639 () Bool)

(assert (=> b!800529 m!741639))

(declare-fun m!741641 () Bool)

(assert (=> b!800524 m!741641))

(declare-fun m!741643 () Bool)

(assert (=> b!800534 m!741643))

(assert (=> b!800534 m!741643))

(declare-fun m!741645 () Bool)

(assert (=> b!800534 m!741645))

(assert (=> b!800528 m!741643))

(assert (=> b!800528 m!741643))

(declare-fun m!741647 () Bool)

(assert (=> b!800528 m!741647))

(declare-fun m!741649 () Bool)

(assert (=> b!800532 m!741649))

(assert (=> b!800532 m!741643))

(assert (=> b!800532 m!741643))

(declare-fun m!741651 () Bool)

(assert (=> b!800532 m!741651))

(assert (=> b!800532 m!741643))

(declare-fun m!741653 () Bool)

(assert (=> b!800532 m!741653))

(declare-fun m!741655 () Bool)

(assert (=> b!800530 m!741655))

(declare-fun m!741657 () Bool)

(assert (=> b!800526 m!741657))

(check-sat (not b!800530) (not b!800523) (not b!800529) (not b!800525) (not b!800528) (not b!800534) (not b!800526) (not b!800535) (not b!800532) (not b!800524) (not start!68728) (not b!800527))
(check-sat)
