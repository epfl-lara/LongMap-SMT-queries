; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51594 () Bool)

(assert start!51594)

(declare-fun b!564586 () Bool)

(declare-fun e!325174 () Bool)

(assert (=> b!564586 (= e!325174 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5479 0))(
  ( (MissingZero!5479 (index!24143 (_ BitVec 32))) (Found!5479 (index!24144 (_ BitVec 32))) (Intermediate!5479 (undefined!6291 Bool) (index!24145 (_ BitVec 32)) (x!53014 (_ BitVec 32))) (Undefined!5479) (MissingVacant!5479 (index!24146 (_ BitVec 32))) )
))
(declare-fun lt!257592 () SeekEntryResult!5479)

(declare-datatypes ((array!35459 0))(
  ( (array!35460 (arr!17030 (Array (_ BitVec 32) (_ BitVec 64))) (size!17394 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35459)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!257593 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35459 (_ BitVec 32)) SeekEntryResult!5479)

(assert (=> b!564586 (= lt!257592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257593 (select (store (arr!17030 a!3118) i!1132 k!1914) j!142) (array!35460 (store (arr!17030 a!3118) i!1132 k!1914) (size!17394 a!3118)) mask!3119))))

(declare-fun lt!257596 () SeekEntryResult!5479)

(declare-fun lt!257594 () (_ BitVec 32))

(assert (=> b!564586 (= lt!257596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257594 (select (arr!17030 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564586 (= lt!257593 (toIndex!0 (select (store (arr!17030 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!564586 (= lt!257594 (toIndex!0 (select (arr!17030 a!3118) j!142) mask!3119))))

(declare-fun b!564587 () Bool)

(declare-fun res!355739 () Bool)

(declare-fun e!325176 () Bool)

(assert (=> b!564587 (=> (not res!355739) (not e!325176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564587 (= res!355739 (validKeyInArray!0 k!1914))))

(declare-fun b!564588 () Bool)

(declare-fun res!355741 () Bool)

(assert (=> b!564588 (=> (not res!355741) (not e!325176))))

(assert (=> b!564588 (= res!355741 (validKeyInArray!0 (select (arr!17030 a!3118) j!142)))))

(declare-fun b!564589 () Bool)

(declare-fun res!355743 () Bool)

(assert (=> b!564589 (=> (not res!355743) (not e!325174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35459 (_ BitVec 32)) Bool)

(assert (=> b!564589 (= res!355743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564590 () Bool)

(assert (=> b!564590 (= e!325176 e!325174)))

(declare-fun res!355744 () Bool)

(assert (=> b!564590 (=> (not res!355744) (not e!325174))))

(declare-fun lt!257595 () SeekEntryResult!5479)

(assert (=> b!564590 (= res!355744 (or (= lt!257595 (MissingZero!5479 i!1132)) (= lt!257595 (MissingVacant!5479 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35459 (_ BitVec 32)) SeekEntryResult!5479)

(assert (=> b!564590 (= lt!257595 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564591 () Bool)

(declare-fun res!355738 () Bool)

(assert (=> b!564591 (=> (not res!355738) (not e!325176))))

(assert (=> b!564591 (= res!355738 (and (= (size!17394 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17394 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17394 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564592 () Bool)

(declare-fun res!355745 () Bool)

(assert (=> b!564592 (=> (not res!355745) (not e!325174))))

(declare-datatypes ((List!11110 0))(
  ( (Nil!11107) (Cons!11106 (h!12109 (_ BitVec 64)) (t!17338 List!11110)) )
))
(declare-fun arrayNoDuplicates!0 (array!35459 (_ BitVec 32) List!11110) Bool)

(assert (=> b!564592 (= res!355745 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11107))))

(declare-fun b!564593 () Bool)

(declare-fun res!355740 () Bool)

(assert (=> b!564593 (=> (not res!355740) (not e!325176))))

(declare-fun arrayContainsKey!0 (array!35459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564593 (= res!355740 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!355742 () Bool)

(assert (=> start!51594 (=> (not res!355742) (not e!325176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51594 (= res!355742 (validMask!0 mask!3119))))

(assert (=> start!51594 e!325176))

(assert (=> start!51594 true))

(declare-fun array_inv!12826 (array!35459) Bool)

(assert (=> start!51594 (array_inv!12826 a!3118)))

(assert (= (and start!51594 res!355742) b!564591))

(assert (= (and b!564591 res!355738) b!564588))

(assert (= (and b!564588 res!355741) b!564587))

(assert (= (and b!564587 res!355739) b!564593))

(assert (= (and b!564593 res!355740) b!564590))

(assert (= (and b!564590 res!355744) b!564589))

(assert (= (and b!564589 res!355743) b!564592))

(assert (= (and b!564592 res!355745) b!564586))

(declare-fun m!543021 () Bool)

(assert (=> b!564590 m!543021))

(declare-fun m!543023 () Bool)

(assert (=> b!564592 m!543023))

(declare-fun m!543025 () Bool)

(assert (=> b!564587 m!543025))

(declare-fun m!543027 () Bool)

(assert (=> start!51594 m!543027))

(declare-fun m!543029 () Bool)

(assert (=> start!51594 m!543029))

(declare-fun m!543031 () Bool)

(assert (=> b!564586 m!543031))

(declare-fun m!543033 () Bool)

(assert (=> b!564586 m!543033))

(assert (=> b!564586 m!543031))

(assert (=> b!564586 m!543031))

(declare-fun m!543035 () Bool)

(assert (=> b!564586 m!543035))

(declare-fun m!543037 () Bool)

(assert (=> b!564586 m!543037))

(declare-fun m!543039 () Bool)

(assert (=> b!564586 m!543039))

(assert (=> b!564586 m!543037))

(declare-fun m!543041 () Bool)

(assert (=> b!564586 m!543041))

(assert (=> b!564586 m!543037))

(declare-fun m!543043 () Bool)

(assert (=> b!564586 m!543043))

(declare-fun m!543045 () Bool)

(assert (=> b!564589 m!543045))

(assert (=> b!564588 m!543031))

(assert (=> b!564588 m!543031))

(declare-fun m!543047 () Bool)

(assert (=> b!564588 m!543047))

(declare-fun m!543049 () Bool)

(assert (=> b!564593 m!543049))

(push 1)

