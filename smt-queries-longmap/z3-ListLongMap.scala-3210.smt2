; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45008 () Bool)

(assert start!45008)

(declare-fun b!493766 () Bool)

(declare-fun res!296344 () Bool)

(declare-fun e!289916 () Bool)

(assert (=> b!493766 (=> (not res!296344) (not e!289916))))

(declare-datatypes ((array!31953 0))(
  ( (array!31954 (arr!15361 (Array (_ BitVec 32) (_ BitVec 64))) (size!15725 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31953)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493766 (= res!296344 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493767 () Bool)

(declare-fun res!296338 () Bool)

(assert (=> b!493767 (=> (not res!296338) (not e!289916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493767 (= res!296338 (validKeyInArray!0 k0!2280))))

(declare-fun b!493768 () Bool)

(declare-fun res!296337 () Bool)

(declare-fun e!289917 () Bool)

(assert (=> b!493768 (=> res!296337 e!289917)))

(declare-datatypes ((SeekEntryResult!3828 0))(
  ( (MissingZero!3828 (index!17491 (_ BitVec 32))) (Found!3828 (index!17492 (_ BitVec 32))) (Intermediate!3828 (undefined!4640 Bool) (index!17493 (_ BitVec 32)) (x!46570 (_ BitVec 32))) (Undefined!3828) (MissingVacant!3828 (index!17494 (_ BitVec 32))) )
))
(declare-fun lt!223368 () SeekEntryResult!3828)

(get-info :version)

(assert (=> b!493768 (= res!296337 (or (not ((_ is Intermediate!3828) lt!223368)) (not (undefined!4640 lt!223368))))))

(declare-fun res!296340 () Bool)

(assert (=> start!45008 (=> (not res!296340) (not e!289916))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45008 (= res!296340 (validMask!0 mask!3524))))

(assert (=> start!45008 e!289916))

(assert (=> start!45008 true))

(declare-fun array_inv!11157 (array!31953) Bool)

(assert (=> start!45008 (array_inv!11157 a!3235)))

(declare-fun b!493769 () Bool)

(declare-fun e!289914 () Bool)

(assert (=> b!493769 (= e!289916 e!289914)))

(declare-fun res!296345 () Bool)

(assert (=> b!493769 (=> (not res!296345) (not e!289914))))

(declare-fun lt!223372 () SeekEntryResult!3828)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493769 (= res!296345 (or (= lt!223372 (MissingZero!3828 i!1204)) (= lt!223372 (MissingVacant!3828 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31953 (_ BitVec 32)) SeekEntryResult!3828)

(assert (=> b!493769 (= lt!223372 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493770 () Bool)

(declare-fun res!296342 () Bool)

(assert (=> b!493770 (=> (not res!296342) (not e!289914))))

(declare-datatypes ((List!9519 0))(
  ( (Nil!9516) (Cons!9515 (h!10383 (_ BitVec 64)) (t!15747 List!9519)) )
))
(declare-fun arrayNoDuplicates!0 (array!31953 (_ BitVec 32) List!9519) Bool)

(assert (=> b!493770 (= res!296342 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9516))))

(declare-fun b!493771 () Bool)

(declare-fun res!296339 () Bool)

(assert (=> b!493771 (=> (not res!296339) (not e!289916))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493771 (= res!296339 (and (= (size!15725 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15725 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15725 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493772 () Bool)

(declare-fun res!296341 () Bool)

(assert (=> b!493772 (=> (not res!296341) (not e!289914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31953 (_ BitVec 32)) Bool)

(assert (=> b!493772 (= res!296341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493773 () Bool)

(assert (=> b!493773 (= e!289917 true)))

(declare-fun lt!223367 () SeekEntryResult!3828)

(assert (=> b!493773 (= lt!223367 Undefined!3828)))

(declare-fun b!493774 () Bool)

(assert (=> b!493774 (= e!289914 (not e!289917))))

(declare-fun res!296336 () Bool)

(assert (=> b!493774 (=> res!296336 e!289917)))

(declare-fun lt!223369 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31953 (_ BitVec 32)) SeekEntryResult!3828)

(assert (=> b!493774 (= res!296336 (= lt!223368 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223369 (select (store (arr!15361 a!3235) i!1204 k0!2280) j!176) (array!31954 (store (arr!15361 a!3235) i!1204 k0!2280) (size!15725 a!3235)) mask!3524)))))

(declare-fun lt!223370 () (_ BitVec 32))

(assert (=> b!493774 (= lt!223368 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223370 (select (arr!15361 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493774 (= lt!223369 (toIndex!0 (select (store (arr!15361 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493774 (= lt!223370 (toIndex!0 (select (arr!15361 a!3235) j!176) mask!3524))))

(assert (=> b!493774 (= lt!223367 (Found!3828 j!176))))

(assert (=> b!493774 (= lt!223367 (seekEntryOrOpen!0 (select (arr!15361 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493774 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14602 0))(
  ( (Unit!14603) )
))
(declare-fun lt!223371 () Unit!14602)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14602)

(assert (=> b!493774 (= lt!223371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493775 () Bool)

(declare-fun res!296343 () Bool)

(assert (=> b!493775 (=> (not res!296343) (not e!289916))))

(assert (=> b!493775 (= res!296343 (validKeyInArray!0 (select (arr!15361 a!3235) j!176)))))

(assert (= (and start!45008 res!296340) b!493771))

(assert (= (and b!493771 res!296339) b!493775))

(assert (= (and b!493775 res!296343) b!493767))

(assert (= (and b!493767 res!296338) b!493766))

(assert (= (and b!493766 res!296344) b!493769))

(assert (= (and b!493769 res!296345) b!493772))

(assert (= (and b!493772 res!296341) b!493770))

(assert (= (and b!493770 res!296342) b!493774))

(assert (= (and b!493774 (not res!296336)) b!493768))

(assert (= (and b!493768 (not res!296337)) b!493773))

(declare-fun m!474675 () Bool)

(assert (=> start!45008 m!474675))

(declare-fun m!474677 () Bool)

(assert (=> start!45008 m!474677))

(declare-fun m!474679 () Bool)

(assert (=> b!493766 m!474679))

(declare-fun m!474681 () Bool)

(assert (=> b!493774 m!474681))

(declare-fun m!474683 () Bool)

(assert (=> b!493774 m!474683))

(assert (=> b!493774 m!474683))

(declare-fun m!474685 () Bool)

(assert (=> b!493774 m!474685))

(declare-fun m!474687 () Bool)

(assert (=> b!493774 m!474687))

(declare-fun m!474689 () Bool)

(assert (=> b!493774 m!474689))

(assert (=> b!493774 m!474687))

(declare-fun m!474691 () Bool)

(assert (=> b!493774 m!474691))

(assert (=> b!493774 m!474687))

(declare-fun m!474693 () Bool)

(assert (=> b!493774 m!474693))

(assert (=> b!493774 m!474683))

(declare-fun m!474695 () Bool)

(assert (=> b!493774 m!474695))

(assert (=> b!493774 m!474687))

(declare-fun m!474697 () Bool)

(assert (=> b!493774 m!474697))

(declare-fun m!474699 () Bool)

(assert (=> b!493774 m!474699))

(declare-fun m!474701 () Bool)

(assert (=> b!493769 m!474701))

(declare-fun m!474703 () Bool)

(assert (=> b!493770 m!474703))

(declare-fun m!474705 () Bool)

(assert (=> b!493767 m!474705))

(assert (=> b!493775 m!474687))

(assert (=> b!493775 m!474687))

(declare-fun m!474707 () Bool)

(assert (=> b!493775 m!474707))

(declare-fun m!474709 () Bool)

(assert (=> b!493772 m!474709))

(check-sat (not start!45008) (not b!493774) (not b!493769) (not b!493770) (not b!493775) (not b!493766) (not b!493767) (not b!493772))
(check-sat)
