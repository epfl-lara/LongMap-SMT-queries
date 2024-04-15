; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46668 () Bool)

(assert start!46668)

(declare-fun b!514812 () Bool)

(declare-fun e!300611 () Bool)

(declare-fun e!300615 () Bool)

(assert (=> b!514812 (= e!300611 e!300615)))

(declare-fun res!314519 () Bool)

(assert (=> b!514812 (=> (not res!314519) (not e!300615))))

(declare-datatypes ((SeekEntryResult!4327 0))(
  ( (MissingZero!4327 (index!19496 (_ BitVec 32))) (Found!4327 (index!19497 (_ BitVec 32))) (Intermediate!4327 (undefined!5139 Bool) (index!19498 (_ BitVec 32)) (x!48477 (_ BitVec 32))) (Undefined!4327) (MissingVacant!4327 (index!19499 (_ BitVec 32))) )
))
(declare-fun lt!235568 () SeekEntryResult!4327)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!514812 (= res!314519 (or (= lt!235568 (MissingZero!4327 i!1204)) (= lt!235568 (MissingVacant!4327 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32990 0))(
  ( (array!32991 (arr!15863 (Array (_ BitVec 32) (_ BitVec 64))) (size!16228 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32990)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32990 (_ BitVec 32)) SeekEntryResult!4327)

(assert (=> b!514812 (= lt!235568 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!514813 () Bool)

(declare-fun res!314523 () Bool)

(declare-fun e!300614 () Bool)

(assert (=> b!514813 (=> res!314523 e!300614)))

(declare-fun lt!235567 () SeekEntryResult!4327)

(get-info :version)

(assert (=> b!514813 (= res!314523 (or (undefined!5139 lt!235567) (not ((_ is Intermediate!4327) lt!235567))))))

(declare-fun b!514814 () Bool)

(assert (=> b!514814 (= e!300615 (not e!300614))))

(declare-fun res!314528 () Bool)

(assert (=> b!514814 (=> res!314528 e!300614)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!235570 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32990 (_ BitVec 32)) SeekEntryResult!4327)

(assert (=> b!514814 (= res!314528 (= lt!235567 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235570 (select (store (arr!15863 a!3235) i!1204 k0!2280) j!176) (array!32991 (store (arr!15863 a!3235) i!1204 k0!2280) (size!16228 a!3235)) mask!3524)))))

(declare-fun lt!235566 () (_ BitVec 32))

(assert (=> b!514814 (= lt!235567 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235566 (select (arr!15863 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514814 (= lt!235570 (toIndex!0 (select (store (arr!15863 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!514814 (= lt!235566 (toIndex!0 (select (arr!15863 a!3235) j!176) mask!3524))))

(declare-fun e!300613 () Bool)

(assert (=> b!514814 e!300613))

(declare-fun res!314521 () Bool)

(assert (=> b!514814 (=> (not res!314521) (not e!300613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32990 (_ BitVec 32)) Bool)

(assert (=> b!514814 (= res!314521 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15898 0))(
  ( (Unit!15899) )
))
(declare-fun lt!235569 () Unit!15898)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15898)

(assert (=> b!514814 (= lt!235569 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!514816 () Bool)

(declare-fun res!314520 () Bool)

(assert (=> b!514816 (=> (not res!314520) (not e!300611))))

(assert (=> b!514816 (= res!314520 (and (= (size!16228 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16228 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16228 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!514817 () Bool)

(declare-fun res!314527 () Bool)

(assert (=> b!514817 (=> (not res!314527) (not e!300615))))

(assert (=> b!514817 (= res!314527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!514818 () Bool)

(declare-fun res!314525 () Bool)

(assert (=> b!514818 (=> (not res!314525) (not e!300611))))

(declare-fun arrayContainsKey!0 (array!32990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!514818 (= res!314525 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!514819 () Bool)

(declare-fun res!314522 () Bool)

(assert (=> b!514819 (=> (not res!314522) (not e!300615))))

(declare-datatypes ((List!10060 0))(
  ( (Nil!10057) (Cons!10056 (h!10954 (_ BitVec 64)) (t!16279 List!10060)) )
))
(declare-fun arrayNoDuplicates!0 (array!32990 (_ BitVec 32) List!10060) Bool)

(assert (=> b!514819 (= res!314522 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10057))))

(declare-fun b!514820 () Bool)

(assert (=> b!514820 (= e!300613 (= (seekEntryOrOpen!0 (select (arr!15863 a!3235) j!176) a!3235 mask!3524) (Found!4327 j!176)))))

(declare-fun b!514815 () Bool)

(declare-fun res!314526 () Bool)

(assert (=> b!514815 (=> (not res!314526) (not e!300611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!514815 (= res!314526 (validKeyInArray!0 (select (arr!15863 a!3235) j!176)))))

(declare-fun res!314524 () Bool)

(assert (=> start!46668 (=> (not res!314524) (not e!300611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46668 (= res!314524 (validMask!0 mask!3524))))

(assert (=> start!46668 e!300611))

(assert (=> start!46668 true))

(declare-fun array_inv!11746 (array!32990) Bool)

(assert (=> start!46668 (array_inv!11746 a!3235)))

(declare-fun b!514821 () Bool)

(assert (=> b!514821 (= e!300614 true)))

(assert (=> b!514821 (and (bvslt (x!48477 lt!235567) #b01111111111111111111111111111110) (or (= (select (arr!15863 a!3235) (index!19498 lt!235567)) (select (arr!15863 a!3235) j!176)) (= (select (arr!15863 a!3235) (index!19498 lt!235567)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15863 a!3235) (index!19498 lt!235567)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514822 () Bool)

(declare-fun res!314518 () Bool)

(assert (=> b!514822 (=> (not res!314518) (not e!300611))))

(assert (=> b!514822 (= res!314518 (validKeyInArray!0 k0!2280))))

(assert (= (and start!46668 res!314524) b!514816))

(assert (= (and b!514816 res!314520) b!514815))

(assert (= (and b!514815 res!314526) b!514822))

(assert (= (and b!514822 res!314518) b!514818))

(assert (= (and b!514818 res!314525) b!514812))

(assert (= (and b!514812 res!314519) b!514817))

(assert (= (and b!514817 res!314527) b!514819))

(assert (= (and b!514819 res!314522) b!514814))

(assert (= (and b!514814 res!314521) b!514820))

(assert (= (and b!514814 (not res!314528)) b!514813))

(assert (= (and b!514813 (not res!314523)) b!514821))

(declare-fun m!495613 () Bool)

(assert (=> start!46668 m!495613))

(declare-fun m!495615 () Bool)

(assert (=> start!46668 m!495615))

(declare-fun m!495617 () Bool)

(assert (=> b!514821 m!495617))

(declare-fun m!495619 () Bool)

(assert (=> b!514821 m!495619))

(assert (=> b!514820 m!495619))

(assert (=> b!514820 m!495619))

(declare-fun m!495621 () Bool)

(assert (=> b!514820 m!495621))

(declare-fun m!495623 () Bool)

(assert (=> b!514818 m!495623))

(declare-fun m!495625 () Bool)

(assert (=> b!514819 m!495625))

(declare-fun m!495627 () Bool)

(assert (=> b!514822 m!495627))

(declare-fun m!495629 () Bool)

(assert (=> b!514814 m!495629))

(declare-fun m!495631 () Bool)

(assert (=> b!514814 m!495631))

(declare-fun m!495633 () Bool)

(assert (=> b!514814 m!495633))

(declare-fun m!495635 () Bool)

(assert (=> b!514814 m!495635))

(assert (=> b!514814 m!495631))

(assert (=> b!514814 m!495619))

(declare-fun m!495637 () Bool)

(assert (=> b!514814 m!495637))

(assert (=> b!514814 m!495619))

(declare-fun m!495639 () Bool)

(assert (=> b!514814 m!495639))

(assert (=> b!514814 m!495619))

(declare-fun m!495641 () Bool)

(assert (=> b!514814 m!495641))

(assert (=> b!514814 m!495631))

(declare-fun m!495643 () Bool)

(assert (=> b!514814 m!495643))

(assert (=> b!514815 m!495619))

(assert (=> b!514815 m!495619))

(declare-fun m!495645 () Bool)

(assert (=> b!514815 m!495645))

(declare-fun m!495647 () Bool)

(assert (=> b!514817 m!495647))

(declare-fun m!495649 () Bool)

(assert (=> b!514812 m!495649))

(check-sat (not b!514820) (not b!514822) (not b!514817) (not b!514818) (not b!514819) (not start!46668) (not b!514815) (not b!514814) (not b!514812))
(check-sat)
