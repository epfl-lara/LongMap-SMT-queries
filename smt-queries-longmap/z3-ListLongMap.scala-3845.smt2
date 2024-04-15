; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52868 () Bool)

(assert start!52868)

(declare-fun b!576181 () Bool)

(declare-fun res!364556 () Bool)

(declare-fun e!331472 () Bool)

(assert (=> b!576181 (=> (not res!364556) (not e!331472))))

(declare-datatypes ((array!35965 0))(
  ( (array!35966 (arr!17264 (Array (_ BitVec 32) (_ BitVec 64))) (size!17629 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35965)

(declare-datatypes ((List!11383 0))(
  ( (Nil!11380) (Cons!11379 (h!12421 (_ BitVec 64)) (t!17602 List!11383)) )
))
(declare-fun arrayNoDuplicates!0 (array!35965 (_ BitVec 32) List!11383) Bool)

(assert (=> b!576181 (= res!364556 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11380))))

(declare-fun b!576182 () Bool)

(assert (=> b!576182 (= e!331472 (not true))))

(declare-fun e!331473 () Bool)

(assert (=> b!576182 e!331473))

(declare-fun res!364557 () Bool)

(assert (=> b!576182 (=> (not res!364557) (not e!331473))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35965 (_ BitVec 32)) Bool)

(assert (=> b!576182 (= res!364557 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18108 0))(
  ( (Unit!18109) )
))
(declare-fun lt!263431 () Unit!18108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18108)

(assert (=> b!576182 (= lt!263431 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576183 () Bool)

(declare-fun res!364559 () Bool)

(assert (=> b!576183 (=> (not res!364559) (not e!331472))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5710 0))(
  ( (MissingZero!5710 (index!25067 (_ BitVec 32))) (Found!5710 (index!25068 (_ BitVec 32))) (Intermediate!5710 (undefined!6522 Bool) (index!25069 (_ BitVec 32)) (x!53968 (_ BitVec 32))) (Undefined!5710) (MissingVacant!5710 (index!25070 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35965 (_ BitVec 32)) SeekEntryResult!5710)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576183 (= res!364559 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17264 a!3118) j!142) mask!3119) (select (arr!17264 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17264 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17264 a!3118) i!1132 k0!1914) j!142) (array!35966 (store (arr!17264 a!3118) i!1132 k0!1914) (size!17629 a!3118)) mask!3119)))))

(declare-fun b!576184 () Bool)

(declare-fun res!364564 () Bool)

(declare-fun e!331470 () Bool)

(assert (=> b!576184 (=> (not res!364564) (not e!331470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576184 (= res!364564 (validKeyInArray!0 (select (arr!17264 a!3118) j!142)))))

(declare-fun b!576185 () Bool)

(declare-fun res!364561 () Bool)

(assert (=> b!576185 (=> (not res!364561) (not e!331470))))

(assert (=> b!576185 (= res!364561 (and (= (size!17629 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17629 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17629 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576186 () Bool)

(declare-fun res!364563 () Bool)

(assert (=> b!576186 (=> (not res!364563) (not e!331472))))

(assert (=> b!576186 (= res!364563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576187 () Bool)

(declare-fun res!364560 () Bool)

(assert (=> b!576187 (=> (not res!364560) (not e!331470))))

(declare-fun arrayContainsKey!0 (array!35965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576187 (= res!364560 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!364565 () Bool)

(assert (=> start!52868 (=> (not res!364565) (not e!331470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52868 (= res!364565 (validMask!0 mask!3119))))

(assert (=> start!52868 e!331470))

(assert (=> start!52868 true))

(declare-fun array_inv!13147 (array!35965) Bool)

(assert (=> start!52868 (array_inv!13147 a!3118)))

(declare-fun b!576188 () Bool)

(declare-fun res!364558 () Bool)

(assert (=> b!576188 (=> (not res!364558) (not e!331470))))

(assert (=> b!576188 (= res!364558 (validKeyInArray!0 k0!1914))))

(declare-fun b!576189 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35965 (_ BitVec 32)) SeekEntryResult!5710)

(assert (=> b!576189 (= e!331473 (= (seekEntryOrOpen!0 (select (arr!17264 a!3118) j!142) a!3118 mask!3119) (Found!5710 j!142)))))

(declare-fun b!576190 () Bool)

(assert (=> b!576190 (= e!331470 e!331472)))

(declare-fun res!364562 () Bool)

(assert (=> b!576190 (=> (not res!364562) (not e!331472))))

(declare-fun lt!263430 () SeekEntryResult!5710)

(assert (=> b!576190 (= res!364562 (or (= lt!263430 (MissingZero!5710 i!1132)) (= lt!263430 (MissingVacant!5710 i!1132))))))

(assert (=> b!576190 (= lt!263430 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52868 res!364565) b!576185))

(assert (= (and b!576185 res!364561) b!576184))

(assert (= (and b!576184 res!364564) b!576188))

(assert (= (and b!576188 res!364558) b!576187))

(assert (= (and b!576187 res!364560) b!576190))

(assert (= (and b!576190 res!364562) b!576186))

(assert (= (and b!576186 res!364563) b!576181))

(assert (= (and b!576181 res!364556) b!576183))

(assert (= (and b!576183 res!364559) b!576182))

(assert (= (and b!576182 res!364557) b!576189))

(declare-fun m!554645 () Bool)

(assert (=> b!576188 m!554645))

(declare-fun m!554647 () Bool)

(assert (=> b!576187 m!554647))

(declare-fun m!554649 () Bool)

(assert (=> b!576189 m!554649))

(assert (=> b!576189 m!554649))

(declare-fun m!554651 () Bool)

(assert (=> b!576189 m!554651))

(declare-fun m!554653 () Bool)

(assert (=> b!576190 m!554653))

(declare-fun m!554655 () Bool)

(assert (=> b!576186 m!554655))

(declare-fun m!554657 () Bool)

(assert (=> b!576182 m!554657))

(declare-fun m!554659 () Bool)

(assert (=> b!576182 m!554659))

(assert (=> b!576183 m!554649))

(declare-fun m!554661 () Bool)

(assert (=> b!576183 m!554661))

(assert (=> b!576183 m!554649))

(declare-fun m!554663 () Bool)

(assert (=> b!576183 m!554663))

(declare-fun m!554665 () Bool)

(assert (=> b!576183 m!554665))

(assert (=> b!576183 m!554663))

(declare-fun m!554667 () Bool)

(assert (=> b!576183 m!554667))

(assert (=> b!576183 m!554661))

(assert (=> b!576183 m!554649))

(declare-fun m!554669 () Bool)

(assert (=> b!576183 m!554669))

(declare-fun m!554671 () Bool)

(assert (=> b!576183 m!554671))

(assert (=> b!576183 m!554663))

(assert (=> b!576183 m!554665))

(assert (=> b!576184 m!554649))

(assert (=> b!576184 m!554649))

(declare-fun m!554673 () Bool)

(assert (=> b!576184 m!554673))

(declare-fun m!554675 () Bool)

(assert (=> start!52868 m!554675))

(declare-fun m!554677 () Bool)

(assert (=> start!52868 m!554677))

(declare-fun m!554679 () Bool)

(assert (=> b!576181 m!554679))

(check-sat (not b!576183) (not b!576189) (not b!576184) (not b!576190) (not b!576188) (not b!576186) (not b!576182) (not b!576181) (not start!52868) (not b!576187))
(check-sat)
