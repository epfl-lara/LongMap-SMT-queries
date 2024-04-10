; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48016 () Bool)

(assert start!48016)

(declare-fun res!324717 () Bool)

(declare-fun e!308146 () Bool)

(assert (=> start!48016 (=> (not res!324717) (not e!308146))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48016 (= res!324717 (validMask!0 mask!3524))))

(assert (=> start!48016 e!308146))

(assert (=> start!48016 true))

(declare-datatypes ((array!33509 0))(
  ( (array!33510 (arr!16103 (Array (_ BitVec 32) (_ BitVec 64))) (size!16467 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33509)

(declare-fun array_inv!11899 (array!33509) Bool)

(assert (=> start!48016 (array_inv!11899 a!3235)))

(declare-fun b!528772 () Bool)

(declare-fun res!324724 () Bool)

(assert (=> b!528772 (=> (not res!324724) (not e!308146))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528772 (= res!324724 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528773 () Bool)

(declare-fun res!324719 () Bool)

(assert (=> b!528773 (=> (not res!324719) (not e!308146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528773 (= res!324719 (validKeyInArray!0 k!2280))))

(declare-fun b!528774 () Bool)

(declare-fun res!324718 () Bool)

(declare-fun e!308144 () Bool)

(assert (=> b!528774 (=> res!324718 e!308144)))

(declare-fun e!308142 () Bool)

(assert (=> b!528774 (= res!324718 e!308142)))

(declare-fun res!324726 () Bool)

(assert (=> b!528774 (=> (not res!324726) (not e!308142))))

(declare-datatypes ((SeekEntryResult!4570 0))(
  ( (MissingZero!4570 (index!20504 (_ BitVec 32))) (Found!4570 (index!20505 (_ BitVec 32))) (Intermediate!4570 (undefined!5382 Bool) (index!20506 (_ BitVec 32)) (x!49474 (_ BitVec 32))) (Undefined!4570) (MissingVacant!4570 (index!20507 (_ BitVec 32))) )
))
(declare-fun lt!243603 () SeekEntryResult!4570)

(assert (=> b!528774 (= res!324726 (bvsgt #b00000000000000000000000000000000 (x!49474 lt!243603)))))

(declare-fun b!528775 () Bool)

(declare-fun e!308143 () Bool)

(assert (=> b!528775 (= e!308143 false)))

(declare-fun b!528776 () Bool)

(declare-fun e!308148 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33509 (_ BitVec 32)) SeekEntryResult!4570)

(assert (=> b!528776 (= e!308148 (= (seekEntryOrOpen!0 (select (arr!16103 a!3235) j!176) a!3235 mask!3524) (Found!4570 j!176)))))

(declare-fun b!528777 () Bool)

(declare-fun res!324727 () Bool)

(assert (=> b!528777 (=> res!324727 e!308144)))

(declare-fun lt!243607 () SeekEntryResult!4570)

(declare-fun lt!243609 () (_ BitVec 64))

(declare-fun lt!243600 () (_ BitVec 32))

(declare-fun lt!243602 () array!33509)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33509 (_ BitVec 32)) SeekEntryResult!4570)

(assert (=> b!528777 (= res!324727 (not (= lt!243607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243600 lt!243609 lt!243602 mask!3524))))))

(declare-fun b!528778 () Bool)

(declare-datatypes ((Unit!16732 0))(
  ( (Unit!16733) )
))
(declare-fun e!308145 () Unit!16732)

(declare-fun Unit!16734 () Unit!16732)

(assert (=> b!528778 (= e!308145 Unit!16734)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!243598 () Unit!16732)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33509 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16732)

(assert (=> b!528778 (= lt!243598 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243600 #b00000000000000000000000000000000 (index!20506 lt!243603) (x!49474 lt!243603) mask!3524))))

(declare-fun res!324723 () Bool)

(assert (=> b!528778 (= res!324723 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243600 lt!243609 lt!243602 mask!3524) (Intermediate!4570 false (index!20506 lt!243603) (x!49474 lt!243603))))))

(assert (=> b!528778 (=> (not res!324723) (not e!308143))))

(assert (=> b!528778 e!308143))

(declare-fun b!528779 () Bool)

(declare-fun res!324730 () Bool)

(assert (=> b!528779 (=> (not res!324730) (not e!308146))))

(assert (=> b!528779 (= res!324730 (and (= (size!16467 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16467 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16467 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528780 () Bool)

(declare-fun e!308140 () Bool)

(assert (=> b!528780 (= e!308146 e!308140)))

(declare-fun res!324731 () Bool)

(assert (=> b!528780 (=> (not res!324731) (not e!308140))))

(declare-fun lt!243606 () SeekEntryResult!4570)

(assert (=> b!528780 (= res!324731 (or (= lt!243606 (MissingZero!4570 i!1204)) (= lt!243606 (MissingVacant!4570 i!1204))))))

(assert (=> b!528780 (= lt!243606 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun lt!243601 () SeekEntryResult!4570)

(declare-fun b!528781 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33509 (_ BitVec 32)) SeekEntryResult!4570)

(assert (=> b!528781 (= e!308142 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243600 (index!20506 lt!243603) (select (arr!16103 a!3235) j!176) a!3235 mask!3524) lt!243601)))))

(declare-fun b!528782 () Bool)

(declare-fun res!324728 () Bool)

(assert (=> b!528782 (=> (not res!324728) (not e!308140))))

(declare-datatypes ((List!10261 0))(
  ( (Nil!10258) (Cons!10257 (h!11194 (_ BitVec 64)) (t!16489 List!10261)) )
))
(declare-fun arrayNoDuplicates!0 (array!33509 (_ BitVec 32) List!10261) Bool)

(assert (=> b!528782 (= res!324728 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10258))))

(declare-fun b!528783 () Bool)

(declare-fun e!308141 () Bool)

(assert (=> b!528783 (= e!308141 e!308144)))

(declare-fun res!324729 () Bool)

(assert (=> b!528783 (=> res!324729 e!308144)))

(assert (=> b!528783 (= res!324729 (or (bvsgt (x!49474 lt!243603) #b01111111111111111111111111111110) (bvslt lt!243600 #b00000000000000000000000000000000) (bvsge lt!243600 (size!16467 a!3235)) (bvslt (index!20506 lt!243603) #b00000000000000000000000000000000) (bvsge (index!20506 lt!243603) (size!16467 a!3235)) (not (= lt!243603 (Intermediate!4570 false (index!20506 lt!243603) (x!49474 lt!243603))))))))

(assert (=> b!528783 (= (index!20506 lt!243603) i!1204)))

(declare-fun lt!243610 () Unit!16732)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33509 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16732)

(assert (=> b!528783 (= lt!243610 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243600 #b00000000000000000000000000000000 (index!20506 lt!243603) (x!49474 lt!243603) mask!3524))))

(assert (=> b!528783 (and (or (= (select (arr!16103 a!3235) (index!20506 lt!243603)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16103 a!3235) (index!20506 lt!243603)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16103 a!3235) (index!20506 lt!243603)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16103 a!3235) (index!20506 lt!243603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243599 () Unit!16732)

(assert (=> b!528783 (= lt!243599 e!308145)))

(declare-fun c!62336 () Bool)

(assert (=> b!528783 (= c!62336 (= (select (arr!16103 a!3235) (index!20506 lt!243603)) (select (arr!16103 a!3235) j!176)))))

(assert (=> b!528783 (and (bvslt (x!49474 lt!243603) #b01111111111111111111111111111110) (or (= (select (arr!16103 a!3235) (index!20506 lt!243603)) (select (arr!16103 a!3235) j!176)) (= (select (arr!16103 a!3235) (index!20506 lt!243603)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16103 a!3235) (index!20506 lt!243603)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528784 () Bool)

(assert (=> b!528784 (= e!308144 true)))

(assert (=> b!528784 (= (seekEntryOrOpen!0 lt!243609 lt!243602 mask!3524) lt!243601)))

(declare-fun lt!243605 () Unit!16732)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33509 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16732)

(assert (=> b!528784 (= lt!243605 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!243600 #b00000000000000000000000000000000 (index!20506 lt!243603) (x!49474 lt!243603) mask!3524))))

(declare-fun b!528785 () Bool)

(declare-fun res!324721 () Bool)

(assert (=> b!528785 (=> (not res!324721) (not e!308140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33509 (_ BitVec 32)) Bool)

(assert (=> b!528785 (= res!324721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528786 () Bool)

(declare-fun res!324720 () Bool)

(assert (=> b!528786 (=> (not res!324720) (not e!308146))))

(assert (=> b!528786 (= res!324720 (validKeyInArray!0 (select (arr!16103 a!3235) j!176)))))

(declare-fun b!528787 () Bool)

(declare-fun Unit!16735 () Unit!16732)

(assert (=> b!528787 (= e!308145 Unit!16735)))

(declare-fun b!528788 () Bool)

(assert (=> b!528788 (= e!308140 (not e!308141))))

(declare-fun res!324722 () Bool)

(assert (=> b!528788 (=> res!324722 e!308141)))

(assert (=> b!528788 (= res!324722 (or (= lt!243603 lt!243607) (undefined!5382 lt!243603) (not (is-Intermediate!4570 lt!243603))))))

(declare-fun lt!243608 () (_ BitVec 32))

(assert (=> b!528788 (= lt!243607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243608 lt!243609 lt!243602 mask!3524))))

(assert (=> b!528788 (= lt!243603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243600 (select (arr!16103 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528788 (= lt!243608 (toIndex!0 lt!243609 mask!3524))))

(assert (=> b!528788 (= lt!243609 (select (store (arr!16103 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!528788 (= lt!243600 (toIndex!0 (select (arr!16103 a!3235) j!176) mask!3524))))

(assert (=> b!528788 (= lt!243602 (array!33510 (store (arr!16103 a!3235) i!1204 k!2280) (size!16467 a!3235)))))

(assert (=> b!528788 (= lt!243601 (Found!4570 j!176))))

(assert (=> b!528788 e!308148))

(declare-fun res!324725 () Bool)

(assert (=> b!528788 (=> (not res!324725) (not e!308148))))

(assert (=> b!528788 (= res!324725 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243604 () Unit!16732)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16732)

(assert (=> b!528788 (= lt!243604 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!48016 res!324717) b!528779))

(assert (= (and b!528779 res!324730) b!528786))

(assert (= (and b!528786 res!324720) b!528773))

(assert (= (and b!528773 res!324719) b!528772))

(assert (= (and b!528772 res!324724) b!528780))

(assert (= (and b!528780 res!324731) b!528785))

(assert (= (and b!528785 res!324721) b!528782))

(assert (= (and b!528782 res!324728) b!528788))

(assert (= (and b!528788 res!324725) b!528776))

(assert (= (and b!528788 (not res!324722)) b!528783))

(assert (= (and b!528783 c!62336) b!528778))

(assert (= (and b!528783 (not c!62336)) b!528787))

(assert (= (and b!528778 res!324723) b!528775))

(assert (= (and b!528783 (not res!324729)) b!528774))

(assert (= (and b!528774 res!324726) b!528781))

(assert (= (and b!528774 (not res!324718)) b!528777))

(assert (= (and b!528777 (not res!324727)) b!528784))

(declare-fun m!509305 () Bool)

(assert (=> b!528784 m!509305))

(declare-fun m!509307 () Bool)

(assert (=> b!528784 m!509307))

(declare-fun m!509309 () Bool)

(assert (=> start!48016 m!509309))

(declare-fun m!509311 () Bool)

(assert (=> start!48016 m!509311))

(declare-fun m!509313 () Bool)

(assert (=> b!528786 m!509313))

(assert (=> b!528786 m!509313))

(declare-fun m!509315 () Bool)

(assert (=> b!528786 m!509315))

(declare-fun m!509317 () Bool)

(assert (=> b!528772 m!509317))

(declare-fun m!509319 () Bool)

(assert (=> b!528782 m!509319))

(declare-fun m!509321 () Bool)

(assert (=> b!528773 m!509321))

(declare-fun m!509323 () Bool)

(assert (=> b!528778 m!509323))

(declare-fun m!509325 () Bool)

(assert (=> b!528778 m!509325))

(declare-fun m!509327 () Bool)

(assert (=> b!528785 m!509327))

(declare-fun m!509329 () Bool)

(assert (=> b!528780 m!509329))

(declare-fun m!509331 () Bool)

(assert (=> b!528783 m!509331))

(declare-fun m!509333 () Bool)

(assert (=> b!528783 m!509333))

(assert (=> b!528783 m!509313))

(assert (=> b!528776 m!509313))

(assert (=> b!528776 m!509313))

(declare-fun m!509335 () Bool)

(assert (=> b!528776 m!509335))

(assert (=> b!528781 m!509313))

(assert (=> b!528781 m!509313))

(declare-fun m!509337 () Bool)

(assert (=> b!528781 m!509337))

(declare-fun m!509339 () Bool)

(assert (=> b!528788 m!509339))

(declare-fun m!509341 () Bool)

(assert (=> b!528788 m!509341))

(assert (=> b!528788 m!509313))

(declare-fun m!509343 () Bool)

(assert (=> b!528788 m!509343))

(assert (=> b!528788 m!509313))

(declare-fun m!509345 () Bool)

(assert (=> b!528788 m!509345))

(assert (=> b!528788 m!509313))

(declare-fun m!509347 () Bool)

(assert (=> b!528788 m!509347))

(declare-fun m!509349 () Bool)

(assert (=> b!528788 m!509349))

(declare-fun m!509351 () Bool)

(assert (=> b!528788 m!509351))

(declare-fun m!509353 () Bool)

(assert (=> b!528788 m!509353))

(assert (=> b!528777 m!509325))

(push 1)

