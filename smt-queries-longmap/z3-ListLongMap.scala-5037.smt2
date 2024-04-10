; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68734 () Bool)

(assert start!68734)

(declare-fun b!800640 () Bool)

(declare-fun res!545159 () Bool)

(declare-fun e!443883 () Bool)

(assert (=> b!800640 (=> (not res!545159) (not e!443883))))

(declare-datatypes ((array!43524 0))(
  ( (array!43525 (arr!20842 (Array (_ BitVec 32) (_ BitVec 64))) (size!21263 (_ BitVec 32))) )
))
(declare-fun lt!357731 () array!43524)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!357730 () (_ BitVec 32))

(declare-fun lt!357737 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8433 0))(
  ( (MissingZero!8433 (index!36100 (_ BitVec 32))) (Found!8433 (index!36101 (_ BitVec 32))) (Intermediate!8433 (undefined!9245 Bool) (index!36102 (_ BitVec 32)) (x!66967 (_ BitVec 32))) (Undefined!8433) (MissingVacant!8433 (index!36103 (_ BitVec 32))) )
))
(declare-fun lt!357734 () SeekEntryResult!8433)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43524 (_ BitVec 32)) SeekEntryResult!8433)

(assert (=> b!800640 (= res!545159 (= lt!357734 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357730 vacantAfter!23 lt!357737 lt!357731 mask!3266)))))

(declare-fun b!800641 () Bool)

(declare-fun res!545163 () Bool)

(declare-fun e!443887 () Bool)

(assert (=> b!800641 (=> (not res!545163) (not e!443887))))

(declare-fun a!3170 () array!43524)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43524 (_ BitVec 32)) Bool)

(assert (=> b!800641 (= res!545163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800642 () Bool)

(declare-fun e!443886 () Bool)

(assert (=> b!800642 (= e!443887 e!443886)))

(declare-fun res!545169 () Bool)

(assert (=> b!800642 (=> (not res!545169) (not e!443886))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800642 (= res!545169 (= lt!357734 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357737 lt!357731 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43524 (_ BitVec 32)) SeekEntryResult!8433)

(assert (=> b!800642 (= lt!357734 (seekEntryOrOpen!0 lt!357737 lt!357731 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800642 (= lt!357737 (select (store (arr!20842 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800642 (= lt!357731 (array!43525 (store (arr!20842 a!3170) i!1163 k0!2044) (size!21263 a!3170)))))

(declare-fun b!800643 () Bool)

(declare-fun e!443885 () Bool)

(assert (=> b!800643 (= e!443886 e!443885)))

(declare-fun res!545166 () Bool)

(assert (=> b!800643 (=> (not res!545166) (not e!443885))))

(declare-fun lt!357735 () SeekEntryResult!8433)

(declare-fun lt!357736 () SeekEntryResult!8433)

(assert (=> b!800643 (= res!545166 (and (= lt!357736 lt!357735) (= lt!357735 (Found!8433 j!153)) (not (= (select (arr!20842 a!3170) index!1236) (select (arr!20842 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800643 (= lt!357735 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20842 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800643 (= lt!357736 (seekEntryOrOpen!0 (select (arr!20842 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!545164 () Bool)

(declare-fun e!443888 () Bool)

(assert (=> start!68734 (=> (not res!545164) (not e!443888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68734 (= res!545164 (validMask!0 mask!3266))))

(assert (=> start!68734 e!443888))

(assert (=> start!68734 true))

(declare-fun array_inv!16638 (array!43524) Bool)

(assert (=> start!68734 (array_inv!16638 a!3170)))

(declare-fun b!800644 () Bool)

(declare-fun res!545167 () Bool)

(assert (=> b!800644 (=> (not res!545167) (not e!443887))))

(declare-datatypes ((List!14805 0))(
  ( (Nil!14802) (Cons!14801 (h!15930 (_ BitVec 64)) (t!21120 List!14805)) )
))
(declare-fun arrayNoDuplicates!0 (array!43524 (_ BitVec 32) List!14805) Bool)

(assert (=> b!800644 (= res!545167 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14802))))

(declare-fun b!800645 () Bool)

(assert (=> b!800645 (= e!443888 e!443887)))

(declare-fun res!545161 () Bool)

(assert (=> b!800645 (=> (not res!545161) (not e!443887))))

(declare-fun lt!357733 () SeekEntryResult!8433)

(assert (=> b!800645 (= res!545161 (or (= lt!357733 (MissingZero!8433 i!1163)) (= lt!357733 (MissingVacant!8433 i!1163))))))

(assert (=> b!800645 (= lt!357733 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800646 () Bool)

(declare-fun res!545160 () Bool)

(assert (=> b!800646 (=> (not res!545160) (not e!443888))))

(assert (=> b!800646 (= res!545160 (and (= (size!21263 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21263 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21263 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800647 () Bool)

(declare-fun res!545171 () Bool)

(assert (=> b!800647 (=> (not res!545171) (not e!443888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800647 (= res!545171 (validKeyInArray!0 (select (arr!20842 a!3170) j!153)))))

(declare-fun b!800648 () Bool)

(declare-fun res!545170 () Bool)

(assert (=> b!800648 (=> (not res!545170) (not e!443888))))

(declare-fun arrayContainsKey!0 (array!43524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800648 (= res!545170 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800649 () Bool)

(assert (=> b!800649 (= e!443883 false)))

(declare-fun lt!357732 () SeekEntryResult!8433)

(assert (=> b!800649 (= lt!357732 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357730 vacantBefore!23 (select (arr!20842 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800650 () Bool)

(declare-fun res!545162 () Bool)

(assert (=> b!800650 (=> (not res!545162) (not e!443887))))

(assert (=> b!800650 (= res!545162 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21263 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20842 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21263 a!3170)) (= (select (arr!20842 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800651 () Bool)

(assert (=> b!800651 (= e!443885 e!443883)))

(declare-fun res!545168 () Bool)

(assert (=> b!800651 (=> (not res!545168) (not e!443883))))

(assert (=> b!800651 (= res!545168 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357730 #b00000000000000000000000000000000) (bvslt lt!357730 (size!21263 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800651 (= lt!357730 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800652 () Bool)

(declare-fun res!545165 () Bool)

(assert (=> b!800652 (=> (not res!545165) (not e!443888))))

(assert (=> b!800652 (= res!545165 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68734 res!545164) b!800646))

(assert (= (and b!800646 res!545160) b!800647))

(assert (= (and b!800647 res!545171) b!800652))

(assert (= (and b!800652 res!545165) b!800648))

(assert (= (and b!800648 res!545170) b!800645))

(assert (= (and b!800645 res!545161) b!800641))

(assert (= (and b!800641 res!545163) b!800644))

(assert (= (and b!800644 res!545167) b!800650))

(assert (= (and b!800650 res!545162) b!800642))

(assert (= (and b!800642 res!545169) b!800643))

(assert (= (and b!800643 res!545166) b!800651))

(assert (= (and b!800651 res!545168) b!800640))

(assert (= (and b!800640 res!545159) b!800649))

(declare-fun m!741743 () Bool)

(assert (=> b!800640 m!741743))

(declare-fun m!741745 () Bool)

(assert (=> b!800642 m!741745))

(declare-fun m!741747 () Bool)

(assert (=> b!800642 m!741747))

(declare-fun m!741749 () Bool)

(assert (=> b!800642 m!741749))

(declare-fun m!741751 () Bool)

(assert (=> b!800642 m!741751))

(declare-fun m!741753 () Bool)

(assert (=> b!800649 m!741753))

(assert (=> b!800649 m!741753))

(declare-fun m!741755 () Bool)

(assert (=> b!800649 m!741755))

(declare-fun m!741757 () Bool)

(assert (=> b!800645 m!741757))

(declare-fun m!741759 () Bool)

(assert (=> b!800648 m!741759))

(declare-fun m!741761 () Bool)

(assert (=> b!800641 m!741761))

(declare-fun m!741763 () Bool)

(assert (=> b!800650 m!741763))

(declare-fun m!741765 () Bool)

(assert (=> b!800650 m!741765))

(declare-fun m!741767 () Bool)

(assert (=> start!68734 m!741767))

(declare-fun m!741769 () Bool)

(assert (=> start!68734 m!741769))

(declare-fun m!741771 () Bool)

(assert (=> b!800652 m!741771))

(declare-fun m!741773 () Bool)

(assert (=> b!800643 m!741773))

(assert (=> b!800643 m!741753))

(assert (=> b!800643 m!741753))

(declare-fun m!741775 () Bool)

(assert (=> b!800643 m!741775))

(assert (=> b!800643 m!741753))

(declare-fun m!741777 () Bool)

(assert (=> b!800643 m!741777))

(declare-fun m!741779 () Bool)

(assert (=> b!800651 m!741779))

(assert (=> b!800647 m!741753))

(assert (=> b!800647 m!741753))

(declare-fun m!741781 () Bool)

(assert (=> b!800647 m!741781))

(declare-fun m!741783 () Bool)

(assert (=> b!800644 m!741783))

(check-sat (not b!800652) (not b!800645) (not b!800643) (not start!68734) (not b!800648) (not b!800641) (not b!800644) (not b!800651) (not b!800642) (not b!800640) (not b!800649) (not b!800647))
(check-sat)
