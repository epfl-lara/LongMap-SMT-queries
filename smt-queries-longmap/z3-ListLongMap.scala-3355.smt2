; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46112 () Bool)

(assert start!46112)

(declare-fun b!510884 () Bool)

(declare-fun res!311790 () Bool)

(declare-fun e!298551 () Bool)

(assert (=> b!510884 (=> (not res!311790) (not e!298551))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510884 (= res!311790 (validKeyInArray!0 k0!2280))))

(declare-fun b!510885 () Bool)

(declare-fun res!311789 () Bool)

(declare-fun e!298552 () Bool)

(assert (=> b!510885 (=> (not res!311789) (not e!298552))))

(declare-datatypes ((array!32824 0))(
  ( (array!32825 (arr!15790 (Array (_ BitVec 32) (_ BitVec 64))) (size!16154 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32824)

(declare-datatypes ((List!9855 0))(
  ( (Nil!9852) (Cons!9851 (h!10728 (_ BitVec 64)) (t!16075 List!9855)) )
))
(declare-fun arrayNoDuplicates!0 (array!32824 (_ BitVec 32) List!9855) Bool)

(assert (=> b!510885 (= res!311789 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9852))))

(declare-fun b!510886 () Bool)

(assert (=> b!510886 (= e!298551 e!298552)))

(declare-fun res!311786 () Bool)

(assert (=> b!510886 (=> (not res!311786) (not e!298552))))

(declare-datatypes ((SeekEntryResult!4213 0))(
  ( (MissingZero!4213 (index!19040 (_ BitVec 32))) (Found!4213 (index!19041 (_ BitVec 32))) (Intermediate!4213 (undefined!5025 Bool) (index!19042 (_ BitVec 32)) (x!48139 (_ BitVec 32))) (Undefined!4213) (MissingVacant!4213 (index!19043 (_ BitVec 32))) )
))
(declare-fun lt!233735 () SeekEntryResult!4213)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510886 (= res!311786 (or (= lt!233735 (MissingZero!4213 i!1204)) (= lt!233735 (MissingVacant!4213 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32824 (_ BitVec 32)) SeekEntryResult!4213)

(assert (=> b!510886 (= lt!233735 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun e!298553 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!510887 () Bool)

(assert (=> b!510887 (= e!298553 (= (seekEntryOrOpen!0 (select (arr!15790 a!3235) j!176) a!3235 mask!3524) (Found!4213 j!176)))))

(declare-fun b!510888 () Bool)

(declare-fun res!311783 () Bool)

(assert (=> b!510888 (=> (not res!311783) (not e!298551))))

(declare-fun arrayContainsKey!0 (array!32824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510888 (= res!311783 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510889 () Bool)

(declare-fun res!311785 () Bool)

(assert (=> b!510889 (=> (not res!311785) (not e!298551))))

(assert (=> b!510889 (= res!311785 (and (= (size!16154 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16154 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16154 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!311788 () Bool)

(assert (=> start!46112 (=> (not res!311788) (not e!298551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46112 (= res!311788 (validMask!0 mask!3524))))

(assert (=> start!46112 e!298551))

(assert (=> start!46112 true))

(declare-fun array_inv!11649 (array!32824) Bool)

(assert (=> start!46112 (array_inv!11649 a!3235)))

(declare-fun b!510890 () Bool)

(assert (=> b!510890 (= e!298552 (not true))))

(declare-fun lt!233734 () SeekEntryResult!4213)

(declare-fun lt!233732 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32824 (_ BitVec 32)) SeekEntryResult!4213)

(assert (=> b!510890 (= lt!233734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233732 (select (store (arr!15790 a!3235) i!1204 k0!2280) j!176) (array!32825 (store (arr!15790 a!3235) i!1204 k0!2280) (size!16154 a!3235)) mask!3524))))

(declare-fun lt!233736 () SeekEntryResult!4213)

(declare-fun lt!233733 () (_ BitVec 32))

(assert (=> b!510890 (= lt!233736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233733 (select (arr!15790 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510890 (= lt!233732 (toIndex!0 (select (store (arr!15790 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!510890 (= lt!233733 (toIndex!0 (select (arr!15790 a!3235) j!176) mask!3524))))

(assert (=> b!510890 e!298553))

(declare-fun res!311791 () Bool)

(assert (=> b!510890 (=> (not res!311791) (not e!298553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32824 (_ BitVec 32)) Bool)

(assert (=> b!510890 (= res!311791 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15745 0))(
  ( (Unit!15746) )
))
(declare-fun lt!233737 () Unit!15745)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15745)

(assert (=> b!510890 (= lt!233737 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510891 () Bool)

(declare-fun res!311784 () Bool)

(assert (=> b!510891 (=> (not res!311784) (not e!298551))))

(assert (=> b!510891 (= res!311784 (validKeyInArray!0 (select (arr!15790 a!3235) j!176)))))

(declare-fun b!510892 () Bool)

(declare-fun res!311787 () Bool)

(assert (=> b!510892 (=> (not res!311787) (not e!298552))))

(assert (=> b!510892 (= res!311787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46112 res!311788) b!510889))

(assert (= (and b!510889 res!311785) b!510891))

(assert (= (and b!510891 res!311784) b!510884))

(assert (= (and b!510884 res!311790) b!510888))

(assert (= (and b!510888 res!311783) b!510886))

(assert (= (and b!510886 res!311786) b!510892))

(assert (= (and b!510892 res!311787) b!510885))

(assert (= (and b!510885 res!311789) b!510890))

(assert (= (and b!510890 res!311791) b!510887))

(declare-fun m!492613 () Bool)

(assert (=> b!510885 m!492613))

(declare-fun m!492615 () Bool)

(assert (=> b!510884 m!492615))

(declare-fun m!492617 () Bool)

(assert (=> b!510886 m!492617))

(declare-fun m!492619 () Bool)

(assert (=> b!510892 m!492619))

(declare-fun m!492621 () Bool)

(assert (=> b!510891 m!492621))

(assert (=> b!510891 m!492621))

(declare-fun m!492623 () Bool)

(assert (=> b!510891 m!492623))

(declare-fun m!492625 () Bool)

(assert (=> start!46112 m!492625))

(declare-fun m!492627 () Bool)

(assert (=> start!46112 m!492627))

(assert (=> b!510887 m!492621))

(assert (=> b!510887 m!492621))

(declare-fun m!492629 () Bool)

(assert (=> b!510887 m!492629))

(declare-fun m!492631 () Bool)

(assert (=> b!510888 m!492631))

(declare-fun m!492633 () Bool)

(assert (=> b!510890 m!492633))

(declare-fun m!492635 () Bool)

(assert (=> b!510890 m!492635))

(declare-fun m!492637 () Bool)

(assert (=> b!510890 m!492637))

(declare-fun m!492639 () Bool)

(assert (=> b!510890 m!492639))

(assert (=> b!510890 m!492633))

(assert (=> b!510890 m!492621))

(declare-fun m!492641 () Bool)

(assert (=> b!510890 m!492641))

(assert (=> b!510890 m!492621))

(declare-fun m!492643 () Bool)

(assert (=> b!510890 m!492643))

(assert (=> b!510890 m!492633))

(declare-fun m!492645 () Bool)

(assert (=> b!510890 m!492645))

(assert (=> b!510890 m!492621))

(declare-fun m!492647 () Bool)

(assert (=> b!510890 m!492647))

(check-sat (not b!510891) (not b!510884) (not b!510887) (not b!510885) (not b!510892) (not b!510888) (not start!46112) (not b!510886) (not b!510890))
(check-sat)
