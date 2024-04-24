; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52218 () Bool)

(assert start!52218)

(declare-fun b!569681 () Bool)

(declare-fun res!359597 () Bool)

(declare-fun e!327729 () Bool)

(assert (=> b!569681 (=> (not res!359597) (not e!327729))))

(declare-datatypes ((array!35688 0))(
  ( (array!35689 (arr!17134 (Array (_ BitVec 32) (_ BitVec 64))) (size!17498 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35688)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569681 (= res!359597 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569683 () Bool)

(declare-fun e!327728 () Bool)

(declare-fun e!327727 () Bool)

(assert (=> b!569683 (= e!327728 e!327727)))

(declare-fun res!359594 () Bool)

(assert (=> b!569683 (=> (not res!359594) (not e!327727))))

(declare-fun lt!259687 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5539 0))(
  ( (MissingZero!5539 (index!24383 (_ BitVec 32))) (Found!5539 (index!24384 (_ BitVec 32))) (Intermediate!5539 (undefined!6351 Bool) (index!24385 (_ BitVec 32)) (x!53409 (_ BitVec 32))) (Undefined!5539) (MissingVacant!5539 (index!24386 (_ BitVec 32))) )
))
(declare-fun lt!259684 () SeekEntryResult!5539)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35688 (_ BitVec 32)) SeekEntryResult!5539)

(assert (=> b!569683 (= res!359594 (= lt!259684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259687 (select (store (arr!17134 a!3118) i!1132 k0!1914) j!142) (array!35689 (store (arr!17134 a!3118) i!1132 k0!1914) (size!17498 a!3118)) mask!3119)))))

(declare-fun lt!259682 () (_ BitVec 32))

(assert (=> b!569683 (= lt!259684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259682 (select (arr!17134 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569683 (= lt!259687 (toIndex!0 (select (store (arr!17134 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569683 (= lt!259682 (toIndex!0 (select (arr!17134 a!3118) j!142) mask!3119))))

(declare-fun b!569684 () Bool)

(declare-fun res!359598 () Bool)

(assert (=> b!569684 (=> (not res!359598) (not e!327729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569684 (= res!359598 (validKeyInArray!0 (select (arr!17134 a!3118) j!142)))))

(declare-fun b!569685 () Bool)

(declare-fun res!359600 () Bool)

(assert (=> b!569685 (=> (not res!359600) (not e!327729))))

(assert (=> b!569685 (= res!359600 (and (= (size!17498 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17498 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17498 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569686 () Bool)

(assert (=> b!569686 (= e!327727 (not true))))

(declare-fun lt!259686 () SeekEntryResult!5539)

(get-info :version)

(assert (=> b!569686 (and (= lt!259686 (Found!5539 j!142)) (or (undefined!6351 lt!259684) (not ((_ is Intermediate!5539) lt!259684)) (= (select (arr!17134 a!3118) (index!24385 lt!259684)) (select (arr!17134 a!3118) j!142)) (not (= (select (arr!17134 a!3118) (index!24385 lt!259684)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259686 (MissingZero!5539 (index!24385 lt!259684)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35688 (_ BitVec 32)) SeekEntryResult!5539)

(assert (=> b!569686 (= lt!259686 (seekEntryOrOpen!0 (select (arr!17134 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35688 (_ BitVec 32)) Bool)

(assert (=> b!569686 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17851 0))(
  ( (Unit!17852) )
))
(declare-fun lt!259683 () Unit!17851)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17851)

(assert (=> b!569686 (= lt!259683 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569687 () Bool)

(assert (=> b!569687 (= e!327729 e!327728)))

(declare-fun res!359599 () Bool)

(assert (=> b!569687 (=> (not res!359599) (not e!327728))))

(declare-fun lt!259685 () SeekEntryResult!5539)

(assert (=> b!569687 (= res!359599 (or (= lt!259685 (MissingZero!5539 i!1132)) (= lt!259685 (MissingVacant!5539 i!1132))))))

(assert (=> b!569687 (= lt!259685 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!359601 () Bool)

(assert (=> start!52218 (=> (not res!359601) (not e!327729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52218 (= res!359601 (validMask!0 mask!3119))))

(assert (=> start!52218 e!327729))

(assert (=> start!52218 true))

(declare-fun array_inv!12993 (array!35688) Bool)

(assert (=> start!52218 (array_inv!12993 a!3118)))

(declare-fun b!569682 () Bool)

(declare-fun res!359595 () Bool)

(assert (=> b!569682 (=> (not res!359595) (not e!327728))))

(declare-datatypes ((List!11121 0))(
  ( (Nil!11118) (Cons!11117 (h!12141 (_ BitVec 64)) (t!17341 List!11121)) )
))
(declare-fun arrayNoDuplicates!0 (array!35688 (_ BitVec 32) List!11121) Bool)

(assert (=> b!569682 (= res!359595 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11118))))

(declare-fun b!569688 () Bool)

(declare-fun res!359602 () Bool)

(assert (=> b!569688 (=> (not res!359602) (not e!327729))))

(assert (=> b!569688 (= res!359602 (validKeyInArray!0 k0!1914))))

(declare-fun b!569689 () Bool)

(declare-fun res!359596 () Bool)

(assert (=> b!569689 (=> (not res!359596) (not e!327728))))

(assert (=> b!569689 (= res!359596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52218 res!359601) b!569685))

(assert (= (and b!569685 res!359600) b!569684))

(assert (= (and b!569684 res!359598) b!569688))

(assert (= (and b!569688 res!359602) b!569681))

(assert (= (and b!569681 res!359597) b!569687))

(assert (= (and b!569687 res!359599) b!569689))

(assert (= (and b!569689 res!359596) b!569682))

(assert (= (and b!569682 res!359595) b!569683))

(assert (= (and b!569683 res!359594) b!569686))

(declare-fun m!548567 () Bool)

(assert (=> b!569688 m!548567))

(declare-fun m!548569 () Bool)

(assert (=> b!569686 m!548569))

(declare-fun m!548571 () Bool)

(assert (=> b!569686 m!548571))

(declare-fun m!548573 () Bool)

(assert (=> b!569686 m!548573))

(declare-fun m!548575 () Bool)

(assert (=> b!569686 m!548575))

(assert (=> b!569686 m!548569))

(declare-fun m!548577 () Bool)

(assert (=> b!569686 m!548577))

(declare-fun m!548579 () Bool)

(assert (=> b!569681 m!548579))

(declare-fun m!548581 () Bool)

(assert (=> b!569682 m!548581))

(declare-fun m!548583 () Bool)

(assert (=> b!569687 m!548583))

(declare-fun m!548585 () Bool)

(assert (=> b!569689 m!548585))

(declare-fun m!548587 () Bool)

(assert (=> start!52218 m!548587))

(declare-fun m!548589 () Bool)

(assert (=> start!52218 m!548589))

(assert (=> b!569684 m!548569))

(assert (=> b!569684 m!548569))

(declare-fun m!548591 () Bool)

(assert (=> b!569684 m!548591))

(assert (=> b!569683 m!548569))

(declare-fun m!548593 () Bool)

(assert (=> b!569683 m!548593))

(assert (=> b!569683 m!548569))

(declare-fun m!548595 () Bool)

(assert (=> b!569683 m!548595))

(declare-fun m!548597 () Bool)

(assert (=> b!569683 m!548597))

(assert (=> b!569683 m!548595))

(declare-fun m!548599 () Bool)

(assert (=> b!569683 m!548599))

(assert (=> b!569683 m!548569))

(declare-fun m!548601 () Bool)

(assert (=> b!569683 m!548601))

(assert (=> b!569683 m!548595))

(declare-fun m!548603 () Bool)

(assert (=> b!569683 m!548603))

(check-sat (not b!569687) (not b!569689) (not b!569682) (not b!569681) (not b!569683) (not b!569688) (not b!569684) (not b!569686) (not start!52218))
(check-sat)
