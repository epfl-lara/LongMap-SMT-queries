; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69172 () Bool)

(assert start!69172)

(declare-fun b!806669 () Bool)

(declare-fun res!550802 () Bool)

(declare-fun e!446697 () Bool)

(assert (=> b!806669 (=> (not res!550802) (not e!446697))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806669 (= res!550802 (validKeyInArray!0 k0!2044))))

(declare-fun b!806670 () Bool)

(declare-fun e!446698 () Bool)

(declare-fun e!446699 () Bool)

(assert (=> b!806670 (= e!446698 e!446699)))

(declare-fun res!550793 () Bool)

(assert (=> b!806670 (=> (not res!550793) (not e!446699))))

(declare-datatypes ((SeekEntryResult!8604 0))(
  ( (MissingZero!8604 (index!36784 (_ BitVec 32))) (Found!8604 (index!36785 (_ BitVec 32))) (Intermediate!8604 (undefined!9416 Bool) (index!36786 (_ BitVec 32)) (x!67600 (_ BitVec 32))) (Undefined!8604) (MissingVacant!8604 (index!36787 (_ BitVec 32))) )
))
(declare-fun lt!361284 () SeekEntryResult!8604)

(declare-fun lt!361283 () SeekEntryResult!8604)

(declare-datatypes ((array!43872 0))(
  ( (array!43873 (arr!21013 (Array (_ BitVec 32) (_ BitVec 64))) (size!21434 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43872)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806670 (= res!550793 (and (= lt!361283 lt!361284) (= lt!361284 (Found!8604 j!153)) (= (select (arr!21013 a!3170) index!1236) (select (arr!21013 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43872 (_ BitVec 32)) SeekEntryResult!8604)

(assert (=> b!806670 (= lt!361284 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21013 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43872 (_ BitVec 32)) SeekEntryResult!8604)

(assert (=> b!806670 (= lt!361283 (seekEntryOrOpen!0 (select (arr!21013 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806671 () Bool)

(declare-fun e!446695 () Bool)

(assert (=> b!806671 (= e!446697 e!446695)))

(declare-fun res!550796 () Bool)

(assert (=> b!806671 (=> (not res!550796) (not e!446695))))

(declare-fun lt!361285 () SeekEntryResult!8604)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806671 (= res!550796 (or (= lt!361285 (MissingZero!8604 i!1163)) (= lt!361285 (MissingVacant!8604 i!1163))))))

(assert (=> b!806671 (= lt!361285 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806672 () Bool)

(declare-fun res!550797 () Bool)

(assert (=> b!806672 (=> (not res!550797) (not e!446695))))

(declare-datatypes ((List!14976 0))(
  ( (Nil!14973) (Cons!14972 (h!16101 (_ BitVec 64)) (t!21291 List!14976)) )
))
(declare-fun arrayNoDuplicates!0 (array!43872 (_ BitVec 32) List!14976) Bool)

(assert (=> b!806672 (= res!550797 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14973))))

(declare-fun b!806673 () Bool)

(declare-fun res!550799 () Bool)

(assert (=> b!806673 (=> (not res!550799) (not e!446697))))

(declare-fun arrayContainsKey!0 (array!43872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806673 (= res!550799 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806674 () Bool)

(assert (=> b!806674 (= e!446695 e!446698)))

(declare-fun res!550801 () Bool)

(assert (=> b!806674 (=> (not res!550801) (not e!446698))))

(declare-fun lt!361286 () SeekEntryResult!8604)

(declare-fun lt!361287 () SeekEntryResult!8604)

(assert (=> b!806674 (= res!550801 (= lt!361286 lt!361287))))

(declare-fun lt!361289 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361288 () array!43872)

(assert (=> b!806674 (= lt!361287 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361289 lt!361288 mask!3266))))

(assert (=> b!806674 (= lt!361286 (seekEntryOrOpen!0 lt!361289 lt!361288 mask!3266))))

(assert (=> b!806674 (= lt!361289 (select (store (arr!21013 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806674 (= lt!361288 (array!43873 (store (arr!21013 a!3170) i!1163 k0!2044) (size!21434 a!3170)))))

(declare-fun res!550792 () Bool)

(assert (=> start!69172 (=> (not res!550792) (not e!446697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69172 (= res!550792 (validMask!0 mask!3266))))

(assert (=> start!69172 e!446697))

(assert (=> start!69172 true))

(declare-fun array_inv!16809 (array!43872) Bool)

(assert (=> start!69172 (array_inv!16809 a!3170)))

(declare-fun b!806675 () Bool)

(declare-fun res!550798 () Bool)

(assert (=> b!806675 (=> (not res!550798) (not e!446695))))

(assert (=> b!806675 (= res!550798 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21434 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21013 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21434 a!3170)) (= (select (arr!21013 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806676 () Bool)

(declare-fun res!550800 () Bool)

(assert (=> b!806676 (=> (not res!550800) (not e!446697))))

(assert (=> b!806676 (= res!550800 (and (= (size!21434 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21434 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21434 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806677 () Bool)

(assert (=> b!806677 (= e!446699 (not true))))

(assert (=> b!806677 (= lt!361287 (Found!8604 index!1236))))

(declare-fun b!806678 () Bool)

(declare-fun res!550795 () Bool)

(assert (=> b!806678 (=> (not res!550795) (not e!446697))))

(assert (=> b!806678 (= res!550795 (validKeyInArray!0 (select (arr!21013 a!3170) j!153)))))

(declare-fun b!806679 () Bool)

(declare-fun res!550794 () Bool)

(assert (=> b!806679 (=> (not res!550794) (not e!446695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43872 (_ BitVec 32)) Bool)

(assert (=> b!806679 (= res!550794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69172 res!550792) b!806676))

(assert (= (and b!806676 res!550800) b!806678))

(assert (= (and b!806678 res!550795) b!806669))

(assert (= (and b!806669 res!550802) b!806673))

(assert (= (and b!806673 res!550799) b!806671))

(assert (= (and b!806671 res!550796) b!806679))

(assert (= (and b!806679 res!550794) b!806672))

(assert (= (and b!806672 res!550797) b!806675))

(assert (= (and b!806675 res!550798) b!806674))

(assert (= (and b!806674 res!550801) b!806670))

(assert (= (and b!806670 res!550793) b!806677))

(declare-fun m!748613 () Bool)

(assert (=> b!806669 m!748613))

(declare-fun m!748615 () Bool)

(assert (=> b!806674 m!748615))

(declare-fun m!748617 () Bool)

(assert (=> b!806674 m!748617))

(declare-fun m!748619 () Bool)

(assert (=> b!806674 m!748619))

(declare-fun m!748621 () Bool)

(assert (=> b!806674 m!748621))

(declare-fun m!748623 () Bool)

(assert (=> b!806670 m!748623))

(declare-fun m!748625 () Bool)

(assert (=> b!806670 m!748625))

(assert (=> b!806670 m!748625))

(declare-fun m!748627 () Bool)

(assert (=> b!806670 m!748627))

(assert (=> b!806670 m!748625))

(declare-fun m!748629 () Bool)

(assert (=> b!806670 m!748629))

(declare-fun m!748631 () Bool)

(assert (=> b!806672 m!748631))

(assert (=> b!806678 m!748625))

(assert (=> b!806678 m!748625))

(declare-fun m!748633 () Bool)

(assert (=> b!806678 m!748633))

(declare-fun m!748635 () Bool)

(assert (=> b!806673 m!748635))

(declare-fun m!748637 () Bool)

(assert (=> b!806671 m!748637))

(declare-fun m!748639 () Bool)

(assert (=> b!806675 m!748639))

(declare-fun m!748641 () Bool)

(assert (=> b!806675 m!748641))

(declare-fun m!748643 () Bool)

(assert (=> start!69172 m!748643))

(declare-fun m!748645 () Bool)

(assert (=> start!69172 m!748645))

(declare-fun m!748647 () Bool)

(assert (=> b!806679 m!748647))

(check-sat (not b!806672) (not b!806678) (not b!806679) (not b!806669) (not b!806673) (not b!806671) (not start!69172) (not b!806670) (not b!806674))
(check-sat)
