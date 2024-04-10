; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45164 () Bool)

(assert start!45164)

(declare-fun b!495530 () Bool)

(declare-fun res!297926 () Bool)

(declare-fun e!290709 () Bool)

(assert (=> b!495530 (=> res!297926 e!290709)))

(declare-datatypes ((SeekEntryResult!3876 0))(
  ( (MissingZero!3876 (index!17683 (_ BitVec 32))) (Found!3876 (index!17684 (_ BitVec 32))) (Intermediate!3876 (undefined!4688 Bool) (index!17685 (_ BitVec 32)) (x!46752 (_ BitVec 32))) (Undefined!3876) (MissingVacant!3876 (index!17686 (_ BitVec 32))) )
))
(declare-fun lt!224328 () SeekEntryResult!3876)

(get-info :version)

(assert (=> b!495530 (= res!297926 (or (undefined!4688 lt!224328) (not ((_ is Intermediate!3876) lt!224328))))))

(declare-fun b!495531 () Bool)

(declare-fun res!297921 () Bool)

(declare-fun e!290708 () Bool)

(assert (=> b!495531 (=> (not res!297921) (not e!290708))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32052 0))(
  ( (array!32053 (arr!15409 (Array (_ BitVec 32) (_ BitVec 64))) (size!15773 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32052)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495531 (= res!297921 (and (= (size!15773 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15773 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15773 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495532 () Bool)

(declare-fun res!297920 () Bool)

(assert (=> b!495532 (=> (not res!297920) (not e!290708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495532 (= res!297920 (validKeyInArray!0 (select (arr!15409 a!3235) j!176)))))

(declare-fun b!495533 () Bool)

(assert (=> b!495533 (= e!290709 true)))

(assert (=> b!495533 (and (bvslt (x!46752 lt!224328) #b01111111111111111111111111111110) (or (= (select (arr!15409 a!3235) (index!17685 lt!224328)) (select (arr!15409 a!3235) j!176)) (= (select (arr!15409 a!3235) (index!17685 lt!224328)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15409 a!3235) (index!17685 lt!224328)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495534 () Bool)

(declare-fun res!297919 () Bool)

(assert (=> b!495534 (=> (not res!297919) (not e!290708))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495534 (= res!297919 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!297916 () Bool)

(assert (=> start!45164 (=> (not res!297916) (not e!290708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45164 (= res!297916 (validMask!0 mask!3524))))

(assert (=> start!45164 e!290708))

(assert (=> start!45164 true))

(declare-fun array_inv!11205 (array!32052) Bool)

(assert (=> start!45164 (array_inv!11205 a!3235)))

(declare-fun b!495529 () Bool)

(declare-fun res!297925 () Bool)

(declare-fun e!290712 () Bool)

(assert (=> b!495529 (=> (not res!297925) (not e!290712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32052 (_ BitVec 32)) Bool)

(assert (=> b!495529 (= res!297925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495535 () Bool)

(declare-fun res!297922 () Bool)

(assert (=> b!495535 (=> (not res!297922) (not e!290708))))

(assert (=> b!495535 (= res!297922 (validKeyInArray!0 k0!2280))))

(declare-fun b!495536 () Bool)

(assert (=> b!495536 (= e!290708 e!290712)))

(declare-fun res!297917 () Bool)

(assert (=> b!495536 (=> (not res!297917) (not e!290712))))

(declare-fun lt!224329 () SeekEntryResult!3876)

(assert (=> b!495536 (= res!297917 (or (= lt!224329 (MissingZero!3876 i!1204)) (= lt!224329 (MissingVacant!3876 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32052 (_ BitVec 32)) SeekEntryResult!3876)

(assert (=> b!495536 (= lt!224329 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun e!290710 () Bool)

(declare-fun b!495537 () Bool)

(assert (=> b!495537 (= e!290710 (= (seekEntryOrOpen!0 (select (arr!15409 a!3235) j!176) a!3235 mask!3524) (Found!3876 j!176)))))

(declare-fun b!495538 () Bool)

(declare-fun res!297924 () Bool)

(assert (=> b!495538 (=> (not res!297924) (not e!290712))))

(declare-datatypes ((List!9567 0))(
  ( (Nil!9564) (Cons!9563 (h!10434 (_ BitVec 64)) (t!15795 List!9567)) )
))
(declare-fun arrayNoDuplicates!0 (array!32052 (_ BitVec 32) List!9567) Bool)

(assert (=> b!495538 (= res!297924 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9564))))

(declare-fun b!495539 () Bool)

(assert (=> b!495539 (= e!290712 (not e!290709))))

(declare-fun res!297918 () Bool)

(assert (=> b!495539 (=> res!297918 e!290709)))

(declare-fun lt!224332 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32052 (_ BitVec 32)) SeekEntryResult!3876)

(assert (=> b!495539 (= res!297918 (= lt!224328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224332 (select (store (arr!15409 a!3235) i!1204 k0!2280) j!176) (array!32053 (store (arr!15409 a!3235) i!1204 k0!2280) (size!15773 a!3235)) mask!3524)))))

(declare-fun lt!224331 () (_ BitVec 32))

(assert (=> b!495539 (= lt!224328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224331 (select (arr!15409 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495539 (= lt!224332 (toIndex!0 (select (store (arr!15409 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495539 (= lt!224331 (toIndex!0 (select (arr!15409 a!3235) j!176) mask!3524))))

(assert (=> b!495539 e!290710))

(declare-fun res!297923 () Bool)

(assert (=> b!495539 (=> (not res!297923) (not e!290710))))

(assert (=> b!495539 (= res!297923 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14698 0))(
  ( (Unit!14699) )
))
(declare-fun lt!224330 () Unit!14698)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14698)

(assert (=> b!495539 (= lt!224330 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45164 res!297916) b!495531))

(assert (= (and b!495531 res!297921) b!495532))

(assert (= (and b!495532 res!297920) b!495535))

(assert (= (and b!495535 res!297922) b!495534))

(assert (= (and b!495534 res!297919) b!495536))

(assert (= (and b!495536 res!297917) b!495529))

(assert (= (and b!495529 res!297925) b!495538))

(assert (= (and b!495538 res!297924) b!495539))

(assert (= (and b!495539 res!297923) b!495537))

(assert (= (and b!495539 (not res!297918)) b!495530))

(assert (= (and b!495530 (not res!297926)) b!495533))

(declare-fun m!476627 () Bool)

(assert (=> b!495532 m!476627))

(assert (=> b!495532 m!476627))

(declare-fun m!476629 () Bool)

(assert (=> b!495532 m!476629))

(declare-fun m!476631 () Bool)

(assert (=> b!495534 m!476631))

(declare-fun m!476633 () Bool)

(assert (=> b!495536 m!476633))

(declare-fun m!476635 () Bool)

(assert (=> start!45164 m!476635))

(declare-fun m!476637 () Bool)

(assert (=> start!45164 m!476637))

(declare-fun m!476639 () Bool)

(assert (=> b!495529 m!476639))

(assert (=> b!495537 m!476627))

(assert (=> b!495537 m!476627))

(declare-fun m!476641 () Bool)

(assert (=> b!495537 m!476641))

(assert (=> b!495539 m!476627))

(declare-fun m!476643 () Bool)

(assert (=> b!495539 m!476643))

(declare-fun m!476645 () Bool)

(assert (=> b!495539 m!476645))

(declare-fun m!476647 () Bool)

(assert (=> b!495539 m!476647))

(declare-fun m!476649 () Bool)

(assert (=> b!495539 m!476649))

(assert (=> b!495539 m!476627))

(declare-fun m!476651 () Bool)

(assert (=> b!495539 m!476651))

(assert (=> b!495539 m!476649))

(declare-fun m!476653 () Bool)

(assert (=> b!495539 m!476653))

(assert (=> b!495539 m!476627))

(declare-fun m!476655 () Bool)

(assert (=> b!495539 m!476655))

(assert (=> b!495539 m!476649))

(declare-fun m!476657 () Bool)

(assert (=> b!495539 m!476657))

(declare-fun m!476659 () Bool)

(assert (=> b!495533 m!476659))

(assert (=> b!495533 m!476627))

(declare-fun m!476661 () Bool)

(assert (=> b!495538 m!476661))

(declare-fun m!476663 () Bool)

(assert (=> b!495535 m!476663))

(check-sat (not b!495539) (not b!495529) (not b!495537) (not b!495535) (not b!495536) (not start!45164) (not b!495538) (not b!495532) (not b!495534))
(check-sat)
