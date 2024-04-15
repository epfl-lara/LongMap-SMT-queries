; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47706 () Bool)

(assert start!47706)

(declare-fun b!524607 () Bool)

(declare-fun e!305906 () Bool)

(assert (=> b!524607 (= e!305906 false)))

(declare-fun b!524608 () Bool)

(declare-datatypes ((Unit!16414 0))(
  ( (Unit!16415) )
))
(declare-fun e!305910 () Unit!16414)

(declare-fun Unit!16416 () Unit!16414)

(assert (=> b!524608 (= e!305910 Unit!16416)))

(declare-fun b!524609 () Bool)

(declare-fun res!321594 () Bool)

(declare-fun e!305905 () Bool)

(assert (=> b!524609 (=> (not res!321594) (not e!305905))))

(declare-datatypes ((array!33353 0))(
  ( (array!33354 (arr!16028 (Array (_ BitVec 32) (_ BitVec 64))) (size!16393 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33353)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33353 (_ BitVec 32)) Bool)

(assert (=> b!524609 (= res!321594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524610 () Bool)

(declare-fun res!321605 () Bool)

(assert (=> b!524610 (=> (not res!321605) (not e!305905))))

(declare-datatypes ((List!10225 0))(
  ( (Nil!10222) (Cons!10221 (h!11152 (_ BitVec 64)) (t!16444 List!10225)) )
))
(declare-fun arrayNoDuplicates!0 (array!33353 (_ BitVec 32) List!10225) Bool)

(assert (=> b!524610 (= res!321605 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10222))))

(declare-fun res!321601 () Bool)

(declare-fun e!305904 () Bool)

(assert (=> start!47706 (=> (not res!321601) (not e!305904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47706 (= res!321601 (validMask!0 mask!3524))))

(assert (=> start!47706 e!305904))

(assert (=> start!47706 true))

(declare-fun array_inv!11911 (array!33353) Bool)

(assert (=> start!47706 (array_inv!11911 a!3235)))

(declare-fun b!524611 () Bool)

(declare-fun e!305909 () Bool)

(assert (=> b!524611 (= e!305909 true)))

(declare-datatypes ((SeekEntryResult!4492 0))(
  ( (MissingZero!4492 (index!20180 (_ BitVec 32))) (Found!4492 (index!20181 (_ BitVec 32))) (Intermediate!4492 (undefined!5304 Bool) (index!20182 (_ BitVec 32)) (x!49172 (_ BitVec 32))) (Undefined!4492) (MissingVacant!4492 (index!20183 (_ BitVec 32))) )
))
(declare-fun lt!240766 () SeekEntryResult!4492)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524611 (= (index!20182 lt!240766) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!240764 () (_ BitVec 32))

(declare-fun lt!240760 () Unit!16414)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16414)

(assert (=> b!524611 (= lt!240760 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!240764 #b00000000000000000000000000000000 (index!20182 lt!240766) (x!49172 lt!240766) mask!3524))))

(assert (=> b!524611 (and (or (= (select (arr!16028 a!3235) (index!20182 lt!240766)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16028 a!3235) (index!20182 lt!240766)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16028 a!3235) (index!20182 lt!240766)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16028 a!3235) (index!20182 lt!240766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240761 () Unit!16414)

(assert (=> b!524611 (= lt!240761 e!305910)))

(declare-fun c!61812 () Bool)

(assert (=> b!524611 (= c!61812 (= (select (arr!16028 a!3235) (index!20182 lt!240766)) (select (arr!16028 a!3235) j!176)))))

(assert (=> b!524611 (and (bvslt (x!49172 lt!240766) #b01111111111111111111111111111110) (or (= (select (arr!16028 a!3235) (index!20182 lt!240766)) (select (arr!16028 a!3235) j!176)) (= (select (arr!16028 a!3235) (index!20182 lt!240766)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16028 a!3235) (index!20182 lt!240766)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524612 () Bool)

(declare-fun res!321604 () Bool)

(assert (=> b!524612 (=> res!321604 e!305909)))

(get-info :version)

(assert (=> b!524612 (= res!321604 (or (undefined!5304 lt!240766) (not ((_ is Intermediate!4492) lt!240766))))))

(declare-fun e!305907 () Bool)

(declare-fun b!524613 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33353 (_ BitVec 32)) SeekEntryResult!4492)

(assert (=> b!524613 (= e!305907 (= (seekEntryOrOpen!0 (select (arr!16028 a!3235) j!176) a!3235 mask!3524) (Found!4492 j!176)))))

(declare-fun b!524614 () Bool)

(declare-fun res!321599 () Bool)

(assert (=> b!524614 (=> (not res!321599) (not e!305904))))

(assert (=> b!524614 (= res!321599 (and (= (size!16393 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16393 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16393 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524615 () Bool)

(declare-fun res!321602 () Bool)

(assert (=> b!524615 (=> (not res!321602) (not e!305904))))

(declare-fun arrayContainsKey!0 (array!33353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524615 (= res!321602 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524616 () Bool)

(declare-fun res!321595 () Bool)

(assert (=> b!524616 (=> (not res!321595) (not e!305904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524616 (= res!321595 (validKeyInArray!0 k0!2280))))

(declare-fun b!524617 () Bool)

(assert (=> b!524617 (= e!305904 e!305905)))

(declare-fun res!321598 () Bool)

(assert (=> b!524617 (=> (not res!321598) (not e!305905))))

(declare-fun lt!240768 () SeekEntryResult!4492)

(assert (=> b!524617 (= res!321598 (or (= lt!240768 (MissingZero!4492 i!1204)) (= lt!240768 (MissingVacant!4492 i!1204))))))

(assert (=> b!524617 (= lt!240768 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524618 () Bool)

(declare-fun res!321596 () Bool)

(assert (=> b!524618 (=> (not res!321596) (not e!305904))))

(assert (=> b!524618 (= res!321596 (validKeyInArray!0 (select (arr!16028 a!3235) j!176)))))

(declare-fun b!524619 () Bool)

(declare-fun Unit!16417 () Unit!16414)

(assert (=> b!524619 (= e!305910 Unit!16417)))

(declare-fun lt!240762 () Unit!16414)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16414)

(assert (=> b!524619 (= lt!240762 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240764 #b00000000000000000000000000000000 (index!20182 lt!240766) (x!49172 lt!240766) mask!3524))))

(declare-fun lt!240769 () array!33353)

(declare-fun res!321603 () Bool)

(declare-fun lt!240763 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33353 (_ BitVec 32)) SeekEntryResult!4492)

(assert (=> b!524619 (= res!321603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240764 lt!240763 lt!240769 mask!3524) (Intermediate!4492 false (index!20182 lt!240766) (x!49172 lt!240766))))))

(assert (=> b!524619 (=> (not res!321603) (not e!305906))))

(assert (=> b!524619 e!305906))

(declare-fun b!524620 () Bool)

(assert (=> b!524620 (= e!305905 (not e!305909))))

(declare-fun res!321597 () Bool)

(assert (=> b!524620 (=> res!321597 e!305909)))

(declare-fun lt!240765 () (_ BitVec 32))

(assert (=> b!524620 (= res!321597 (= lt!240766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240765 lt!240763 lt!240769 mask!3524)))))

(assert (=> b!524620 (= lt!240766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240764 (select (arr!16028 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524620 (= lt!240765 (toIndex!0 lt!240763 mask!3524))))

(assert (=> b!524620 (= lt!240763 (select (store (arr!16028 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524620 (= lt!240764 (toIndex!0 (select (arr!16028 a!3235) j!176) mask!3524))))

(assert (=> b!524620 (= lt!240769 (array!33354 (store (arr!16028 a!3235) i!1204 k0!2280) (size!16393 a!3235)))))

(assert (=> b!524620 e!305907))

(declare-fun res!321600 () Bool)

(assert (=> b!524620 (=> (not res!321600) (not e!305907))))

(assert (=> b!524620 (= res!321600 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240767 () Unit!16414)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16414)

(assert (=> b!524620 (= lt!240767 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!47706 res!321601) b!524614))

(assert (= (and b!524614 res!321599) b!524618))

(assert (= (and b!524618 res!321596) b!524616))

(assert (= (and b!524616 res!321595) b!524615))

(assert (= (and b!524615 res!321602) b!524617))

(assert (= (and b!524617 res!321598) b!524609))

(assert (= (and b!524609 res!321594) b!524610))

(assert (= (and b!524610 res!321605) b!524620))

(assert (= (and b!524620 res!321600) b!524613))

(assert (= (and b!524620 (not res!321597)) b!524612))

(assert (= (and b!524612 (not res!321604)) b!524611))

(assert (= (and b!524611 c!61812) b!524619))

(assert (= (and b!524611 (not c!61812)) b!524608))

(assert (= (and b!524619 res!321603) b!524607))

(declare-fun m!504757 () Bool)

(assert (=> b!524610 m!504757))

(declare-fun m!504759 () Bool)

(assert (=> b!524617 m!504759))

(declare-fun m!504761 () Bool)

(assert (=> b!524613 m!504761))

(assert (=> b!524613 m!504761))

(declare-fun m!504763 () Bool)

(assert (=> b!524613 m!504763))

(declare-fun m!504765 () Bool)

(assert (=> start!47706 m!504765))

(declare-fun m!504767 () Bool)

(assert (=> start!47706 m!504767))

(declare-fun m!504769 () Bool)

(assert (=> b!524619 m!504769))

(declare-fun m!504771 () Bool)

(assert (=> b!524619 m!504771))

(declare-fun m!504773 () Bool)

(assert (=> b!524620 m!504773))

(declare-fun m!504775 () Bool)

(assert (=> b!524620 m!504775))

(assert (=> b!524620 m!504761))

(declare-fun m!504777 () Bool)

(assert (=> b!524620 m!504777))

(assert (=> b!524620 m!504761))

(declare-fun m!504779 () Bool)

(assert (=> b!524620 m!504779))

(assert (=> b!524620 m!504761))

(declare-fun m!504781 () Bool)

(assert (=> b!524620 m!504781))

(declare-fun m!504783 () Bool)

(assert (=> b!524620 m!504783))

(declare-fun m!504785 () Bool)

(assert (=> b!524620 m!504785))

(declare-fun m!504787 () Bool)

(assert (=> b!524620 m!504787))

(declare-fun m!504789 () Bool)

(assert (=> b!524615 m!504789))

(assert (=> b!524618 m!504761))

(assert (=> b!524618 m!504761))

(declare-fun m!504791 () Bool)

(assert (=> b!524618 m!504791))

(declare-fun m!504793 () Bool)

(assert (=> b!524609 m!504793))

(declare-fun m!504795 () Bool)

(assert (=> b!524616 m!504795))

(declare-fun m!504797 () Bool)

(assert (=> b!524611 m!504797))

(declare-fun m!504799 () Bool)

(assert (=> b!524611 m!504799))

(assert (=> b!524611 m!504761))

(check-sat (not b!524610) (not b!524609) (not b!524616) (not b!524615) (not start!47706) (not b!524613) (not b!524619) (not b!524620) (not b!524617) (not b!524618) (not b!524611))
(check-sat)
