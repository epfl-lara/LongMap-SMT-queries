; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50244 () Bool)

(assert start!50244)

(declare-fun b!549634 () Bool)

(declare-fun res!342675 () Bool)

(declare-fun e!317467 () Bool)

(assert (=> b!549634 (=> (not res!342675) (not e!317467))))

(declare-datatypes ((array!34644 0))(
  ( (array!34645 (arr!16636 (Array (_ BitVec 32) (_ BitVec 64))) (size!17000 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34644)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549634 (= res!342675 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549635 () Bool)

(declare-fun res!342679 () Bool)

(assert (=> b!549635 (=> (not res!342679) (not e!317467))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549635 (= res!342679 (and (= (size!17000 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17000 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17000 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549636 () Bool)

(declare-fun e!317468 () Bool)

(assert (=> b!549636 (= e!317468 false)))

(declare-fun lt!250239 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5041 0))(
  ( (MissingZero!5041 (index!22391 (_ BitVec 32))) (Found!5041 (index!22392 (_ BitVec 32))) (Intermediate!5041 (undefined!5853 Bool) (index!22393 (_ BitVec 32)) (x!51478 (_ BitVec 32))) (Undefined!5041) (MissingVacant!5041 (index!22394 (_ BitVec 32))) )
))
(declare-fun lt!250236 () SeekEntryResult!5041)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34644 (_ BitVec 32)) SeekEntryResult!5041)

(assert (=> b!549636 (= lt!250236 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250239 (select (store (arr!16636 a!3118) i!1132 k0!1914) j!142) (array!34645 (store (arr!16636 a!3118) i!1132 k0!1914) (size!17000 a!3118)) mask!3119))))

(declare-fun lt!250238 () (_ BitVec 32))

(declare-fun lt!250237 () SeekEntryResult!5041)

(assert (=> b!549636 (= lt!250237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250238 (select (arr!16636 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549636 (= lt!250239 (toIndex!0 (select (store (arr!16636 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549636 (= lt!250238 (toIndex!0 (select (arr!16636 a!3118) j!142) mask!3119))))

(declare-fun b!549637 () Bool)

(assert (=> b!549637 (= e!317467 e!317468)))

(declare-fun res!342677 () Bool)

(assert (=> b!549637 (=> (not res!342677) (not e!317468))))

(declare-fun lt!250240 () SeekEntryResult!5041)

(assert (=> b!549637 (= res!342677 (or (= lt!250240 (MissingZero!5041 i!1132)) (= lt!250240 (MissingVacant!5041 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34644 (_ BitVec 32)) SeekEntryResult!5041)

(assert (=> b!549637 (= lt!250240 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549638 () Bool)

(declare-fun res!342676 () Bool)

(assert (=> b!549638 (=> (not res!342676) (not e!317468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34644 (_ BitVec 32)) Bool)

(assert (=> b!549638 (= res!342676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549633 () Bool)

(declare-fun res!342678 () Bool)

(assert (=> b!549633 (=> (not res!342678) (not e!317467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549633 (= res!342678 (validKeyInArray!0 k0!1914))))

(declare-fun res!342673 () Bool)

(assert (=> start!50244 (=> (not res!342673) (not e!317467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50244 (= res!342673 (validMask!0 mask!3119))))

(assert (=> start!50244 e!317467))

(assert (=> start!50244 true))

(declare-fun array_inv!12495 (array!34644) Bool)

(assert (=> start!50244 (array_inv!12495 a!3118)))

(declare-fun b!549639 () Bool)

(declare-fun res!342672 () Bool)

(assert (=> b!549639 (=> (not res!342672) (not e!317468))))

(declare-datatypes ((List!10623 0))(
  ( (Nil!10620) (Cons!10619 (h!11595 (_ BitVec 64)) (t!16843 List!10623)) )
))
(declare-fun arrayNoDuplicates!0 (array!34644 (_ BitVec 32) List!10623) Bool)

(assert (=> b!549639 (= res!342672 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10620))))

(declare-fun b!549640 () Bool)

(declare-fun res!342674 () Bool)

(assert (=> b!549640 (=> (not res!342674) (not e!317467))))

(assert (=> b!549640 (= res!342674 (validKeyInArray!0 (select (arr!16636 a!3118) j!142)))))

(assert (= (and start!50244 res!342673) b!549635))

(assert (= (and b!549635 res!342679) b!549640))

(assert (= (and b!549640 res!342674) b!549633))

(assert (= (and b!549633 res!342678) b!549634))

(assert (= (and b!549634 res!342675) b!549637))

(assert (= (and b!549637 res!342677) b!549638))

(assert (= (and b!549638 res!342676) b!549639))

(assert (= (and b!549639 res!342672) b!549636))

(declare-fun m!526619 () Bool)

(assert (=> b!549640 m!526619))

(assert (=> b!549640 m!526619))

(declare-fun m!526621 () Bool)

(assert (=> b!549640 m!526621))

(declare-fun m!526623 () Bool)

(assert (=> b!549634 m!526623))

(declare-fun m!526625 () Bool)

(assert (=> b!549638 m!526625))

(declare-fun m!526627 () Bool)

(assert (=> start!50244 m!526627))

(declare-fun m!526629 () Bool)

(assert (=> start!50244 m!526629))

(declare-fun m!526631 () Bool)

(assert (=> b!549639 m!526631))

(assert (=> b!549636 m!526619))

(declare-fun m!526633 () Bool)

(assert (=> b!549636 m!526633))

(assert (=> b!549636 m!526619))

(declare-fun m!526635 () Bool)

(assert (=> b!549636 m!526635))

(assert (=> b!549636 m!526619))

(declare-fun m!526637 () Bool)

(assert (=> b!549636 m!526637))

(assert (=> b!549636 m!526635))

(declare-fun m!526639 () Bool)

(assert (=> b!549636 m!526639))

(assert (=> b!549636 m!526635))

(declare-fun m!526641 () Bool)

(assert (=> b!549636 m!526641))

(declare-fun m!526643 () Bool)

(assert (=> b!549636 m!526643))

(declare-fun m!526645 () Bool)

(assert (=> b!549637 m!526645))

(declare-fun m!526647 () Bool)

(assert (=> b!549633 m!526647))

(check-sat (not b!549633) (not b!549638) (not b!549636) (not b!549634) (not start!50244) (not b!549639) (not b!549640) (not b!549637))
(check-sat)
