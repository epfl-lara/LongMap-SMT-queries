; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69226 () Bool)

(assert start!69226)

(declare-fun b!807569 () Bool)

(declare-fun res!551692 () Bool)

(declare-fun e!447109 () Bool)

(assert (=> b!807569 (=> (not res!551692) (not e!447109))))

(declare-datatypes ((array!43926 0))(
  ( (array!43927 (arr!21040 (Array (_ BitVec 32) (_ BitVec 64))) (size!21461 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43926)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807569 (= res!551692 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807570 () Bool)

(declare-fun e!447110 () Bool)

(assert (=> b!807570 (= e!447109 e!447110)))

(declare-fun res!551702 () Bool)

(assert (=> b!807570 (=> (not res!551702) (not e!447110))))

(declare-datatypes ((SeekEntryResult!8631 0))(
  ( (MissingZero!8631 (index!36892 (_ BitVec 32))) (Found!8631 (index!36893 (_ BitVec 32))) (Intermediate!8631 (undefined!9443 Bool) (index!36894 (_ BitVec 32)) (x!67699 (_ BitVec 32))) (Undefined!8631) (MissingVacant!8631 (index!36895 (_ BitVec 32))) )
))
(declare-fun lt!361805 () SeekEntryResult!8631)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807570 (= res!551702 (or (= lt!361805 (MissingZero!8631 i!1163)) (= lt!361805 (MissingVacant!8631 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43926 (_ BitVec 32)) SeekEntryResult!8631)

(assert (=> b!807570 (= lt!361805 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807571 () Bool)

(declare-fun e!447111 () Bool)

(assert (=> b!807571 (= e!447111 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!361802 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807571 (= lt!361802 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807572 () Bool)

(declare-fun res!551695 () Bool)

(assert (=> b!807572 (=> (not res!551695) (not e!447110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43926 (_ BitVec 32)) Bool)

(assert (=> b!807572 (= res!551695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807573 () Bool)

(declare-fun res!551696 () Bool)

(assert (=> b!807573 (=> (not res!551696) (not e!447109))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807573 (= res!551696 (validKeyInArray!0 (select (arr!21040 a!3170) j!153)))))

(declare-fun b!807574 () Bool)

(declare-fun res!551700 () Bool)

(assert (=> b!807574 (=> (not res!551700) (not e!447110))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807574 (= res!551700 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21461 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21040 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21461 a!3170)) (= (select (arr!21040 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807576 () Bool)

(declare-fun res!551694 () Bool)

(assert (=> b!807576 (=> (not res!551694) (not e!447109))))

(assert (=> b!807576 (= res!551694 (and (= (size!21461 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21461 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21461 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807577 () Bool)

(declare-fun e!447112 () Bool)

(assert (=> b!807577 (= e!447112 e!447111)))

(declare-fun res!551701 () Bool)

(assert (=> b!807577 (=> (not res!551701) (not e!447111))))

(declare-fun lt!361804 () SeekEntryResult!8631)

(declare-fun lt!361803 () SeekEntryResult!8631)

(assert (=> b!807577 (= res!551701 (and (= lt!361804 lt!361803) (= lt!361803 (Found!8631 j!153)) (not (= (select (arr!21040 a!3170) index!1236) (select (arr!21040 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43926 (_ BitVec 32)) SeekEntryResult!8631)

(assert (=> b!807577 (= lt!361803 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21040 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807577 (= lt!361804 (seekEntryOrOpen!0 (select (arr!21040 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807578 () Bool)

(declare-fun res!551698 () Bool)

(assert (=> b!807578 (=> (not res!551698) (not e!447109))))

(assert (=> b!807578 (= res!551698 (validKeyInArray!0 k0!2044))))

(declare-fun b!807579 () Bool)

(declare-fun res!551699 () Bool)

(assert (=> b!807579 (=> (not res!551699) (not e!447110))))

(declare-datatypes ((List!15003 0))(
  ( (Nil!15000) (Cons!14999 (h!16128 (_ BitVec 64)) (t!21318 List!15003)) )
))
(declare-fun arrayNoDuplicates!0 (array!43926 (_ BitVec 32) List!15003) Bool)

(assert (=> b!807579 (= res!551699 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15000))))

(declare-fun res!551693 () Bool)

(assert (=> start!69226 (=> (not res!551693) (not e!447109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69226 (= res!551693 (validMask!0 mask!3266))))

(assert (=> start!69226 e!447109))

(assert (=> start!69226 true))

(declare-fun array_inv!16836 (array!43926) Bool)

(assert (=> start!69226 (array_inv!16836 a!3170)))

(declare-fun b!807575 () Bool)

(assert (=> b!807575 (= e!447110 e!447112)))

(declare-fun res!551697 () Bool)

(assert (=> b!807575 (=> (not res!551697) (not e!447112))))

(declare-fun lt!361801 () array!43926)

(declare-fun lt!361800 () (_ BitVec 64))

(assert (=> b!807575 (= res!551697 (= (seekEntryOrOpen!0 lt!361800 lt!361801 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361800 lt!361801 mask!3266)))))

(assert (=> b!807575 (= lt!361800 (select (store (arr!21040 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807575 (= lt!361801 (array!43927 (store (arr!21040 a!3170) i!1163 k0!2044) (size!21461 a!3170)))))

(assert (= (and start!69226 res!551693) b!807576))

(assert (= (and b!807576 res!551694) b!807573))

(assert (= (and b!807573 res!551696) b!807578))

(assert (= (and b!807578 res!551698) b!807569))

(assert (= (and b!807569 res!551692) b!807570))

(assert (= (and b!807570 res!551702) b!807572))

(assert (= (and b!807572 res!551695) b!807579))

(assert (= (and b!807579 res!551699) b!807574))

(assert (= (and b!807574 res!551700) b!807575))

(assert (= (and b!807575 res!551697) b!807577))

(assert (= (and b!807577 res!551701) b!807571))

(declare-fun m!749623 () Bool)

(assert (=> b!807573 m!749623))

(assert (=> b!807573 m!749623))

(declare-fun m!749625 () Bool)

(assert (=> b!807573 m!749625))

(declare-fun m!749627 () Bool)

(assert (=> start!69226 m!749627))

(declare-fun m!749629 () Bool)

(assert (=> start!69226 m!749629))

(declare-fun m!749631 () Bool)

(assert (=> b!807574 m!749631))

(declare-fun m!749633 () Bool)

(assert (=> b!807574 m!749633))

(declare-fun m!749635 () Bool)

(assert (=> b!807578 m!749635))

(declare-fun m!749637 () Bool)

(assert (=> b!807579 m!749637))

(declare-fun m!749639 () Bool)

(assert (=> b!807570 m!749639))

(declare-fun m!749641 () Bool)

(assert (=> b!807571 m!749641))

(declare-fun m!749643 () Bool)

(assert (=> b!807572 m!749643))

(declare-fun m!749645 () Bool)

(assert (=> b!807575 m!749645))

(declare-fun m!749647 () Bool)

(assert (=> b!807575 m!749647))

(declare-fun m!749649 () Bool)

(assert (=> b!807575 m!749649))

(declare-fun m!749651 () Bool)

(assert (=> b!807575 m!749651))

(declare-fun m!749653 () Bool)

(assert (=> b!807569 m!749653))

(declare-fun m!749655 () Bool)

(assert (=> b!807577 m!749655))

(assert (=> b!807577 m!749623))

(assert (=> b!807577 m!749623))

(declare-fun m!749657 () Bool)

(assert (=> b!807577 m!749657))

(assert (=> b!807577 m!749623))

(declare-fun m!749659 () Bool)

(assert (=> b!807577 m!749659))

(check-sat (not b!807571) (not b!807573) (not b!807578) (not b!807569) (not b!807570) (not b!807575) (not start!69226) (not b!807579) (not b!807577) (not b!807572))
(check-sat)
