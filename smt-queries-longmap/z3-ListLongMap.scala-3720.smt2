; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51294 () Bool)

(assert start!51294)

(declare-fun b!559683 () Bool)

(declare-fun e!322451 () Bool)

(declare-fun e!322453 () Bool)

(assert (=> b!559683 (= e!322451 e!322453)))

(declare-fun res!350977 () Bool)

(assert (=> b!559683 (=> res!350977 e!322453)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!35169 0))(
  ( (array!35170 (arr!16885 (Array (_ BitVec 32) (_ BitVec 64))) (size!17249 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35169)

(declare-datatypes ((SeekEntryResult!5290 0))(
  ( (MissingZero!5290 (index!23387 (_ BitVec 32))) (Found!5290 (index!23388 (_ BitVec 32))) (Intermediate!5290 (undefined!6102 Bool) (index!23389 (_ BitVec 32)) (x!52451 (_ BitVec 32))) (Undefined!5290) (MissingVacant!5290 (index!23390 (_ BitVec 32))) )
))
(declare-fun lt!254382 () SeekEntryResult!5290)

(get-info :version)

(assert (=> b!559683 (= res!350977 (or (undefined!6102 lt!254382) (not ((_ is Intermediate!5290) lt!254382)) (= (select (arr!16885 a!3118) (index!23389 lt!254382)) (select (arr!16885 a!3118) j!142)) (= (select (arr!16885 a!3118) (index!23389 lt!254382)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559684 () Bool)

(declare-fun e!322452 () Bool)

(declare-fun e!322454 () Bool)

(assert (=> b!559684 (= e!322452 e!322454)))

(declare-fun res!350968 () Bool)

(assert (=> b!559684 (=> (not res!350968) (not e!322454))))

(declare-fun lt!254378 () SeekEntryResult!5290)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!559684 (= res!350968 (or (= lt!254378 (MissingZero!5290 i!1132)) (= lt!254378 (MissingVacant!5290 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35169 (_ BitVec 32)) SeekEntryResult!5290)

(assert (=> b!559684 (= lt!254378 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!559685 () Bool)

(declare-fun res!350967 () Bool)

(assert (=> b!559685 (=> (not res!350967) (not e!322454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35169 (_ BitVec 32)) Bool)

(assert (=> b!559685 (= res!350967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559686 () Bool)

(declare-fun res!350975 () Bool)

(assert (=> b!559686 (=> (not res!350975) (not e!322452))))

(declare-fun arrayContainsKey!0 (array!35169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559686 (= res!350975 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!559687 () Bool)

(declare-fun res!350971 () Bool)

(assert (=> b!559687 (=> (not res!350971) (not e!322454))))

(declare-datatypes ((List!10872 0))(
  ( (Nil!10869) (Cons!10868 (h!11871 (_ BitVec 64)) (t!17092 List!10872)) )
))
(declare-fun arrayNoDuplicates!0 (array!35169 (_ BitVec 32) List!10872) Bool)

(assert (=> b!559687 (= res!350971 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10869))))

(declare-fun b!559688 () Bool)

(declare-fun e!322450 () Bool)

(assert (=> b!559688 (= e!322454 e!322450)))

(declare-fun res!350976 () Bool)

(assert (=> b!559688 (=> (not res!350976) (not e!322450))))

(declare-fun lt!254379 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35169 (_ BitVec 32)) SeekEntryResult!5290)

(assert (=> b!559688 (= res!350976 (= lt!254382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254379 (select (store (arr!16885 a!3118) i!1132 k0!1914) j!142) (array!35170 (store (arr!16885 a!3118) i!1132 k0!1914) (size!17249 a!3118)) mask!3119)))))

(declare-fun lt!254383 () (_ BitVec 32))

(assert (=> b!559688 (= lt!254382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254383 (select (arr!16885 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559688 (= lt!254379 (toIndex!0 (select (store (arr!16885 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!559688 (= lt!254383 (toIndex!0 (select (arr!16885 a!3118) j!142) mask!3119))))

(declare-fun b!559689 () Bool)

(declare-fun lt!254380 () SeekEntryResult!5290)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35169 (_ BitVec 32)) SeekEntryResult!5290)

(assert (=> b!559689 (= e!322453 (= lt!254380 (seekKeyOrZeroReturnVacant!0 (x!52451 lt!254382) (index!23389 lt!254382) (index!23389 lt!254382) (select (arr!16885 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559690 () Bool)

(declare-fun res!350969 () Bool)

(assert (=> b!559690 (=> (not res!350969) (not e!322452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559690 (= res!350969 (validKeyInArray!0 (select (arr!16885 a!3118) j!142)))))

(declare-fun b!559691 () Bool)

(declare-fun res!350973 () Bool)

(assert (=> b!559691 (=> (not res!350973) (not e!322452))))

(assert (=> b!559691 (= res!350973 (and (= (size!17249 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17249 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17249 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!559692 () Bool)

(declare-fun res!350970 () Bool)

(assert (=> b!559692 (=> (not res!350970) (not e!322452))))

(assert (=> b!559692 (= res!350970 (validKeyInArray!0 k0!1914))))

(declare-fun res!350974 () Bool)

(assert (=> start!51294 (=> (not res!350974) (not e!322452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51294 (= res!350974 (validMask!0 mask!3119))))

(assert (=> start!51294 e!322452))

(assert (=> start!51294 true))

(declare-fun array_inv!12744 (array!35169) Bool)

(assert (=> start!51294 (array_inv!12744 a!3118)))

(declare-fun b!559693 () Bool)

(assert (=> b!559693 (= e!322450 (not true))))

(assert (=> b!559693 e!322451))

(declare-fun res!350972 () Bool)

(assert (=> b!559693 (=> (not res!350972) (not e!322451))))

(assert (=> b!559693 (= res!350972 (= lt!254380 (Found!5290 j!142)))))

(assert (=> b!559693 (= lt!254380 (seekEntryOrOpen!0 (select (arr!16885 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!559693 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17425 0))(
  ( (Unit!17426) )
))
(declare-fun lt!254381 () Unit!17425)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17425)

(assert (=> b!559693 (= lt!254381 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51294 res!350974) b!559691))

(assert (= (and b!559691 res!350973) b!559690))

(assert (= (and b!559690 res!350969) b!559692))

(assert (= (and b!559692 res!350970) b!559686))

(assert (= (and b!559686 res!350975) b!559684))

(assert (= (and b!559684 res!350968) b!559685))

(assert (= (and b!559685 res!350967) b!559687))

(assert (= (and b!559687 res!350971) b!559688))

(assert (= (and b!559688 res!350976) b!559693))

(assert (= (and b!559693 res!350972) b!559683))

(assert (= (and b!559683 (not res!350977)) b!559689))

(declare-fun m!537629 () Bool)

(assert (=> start!51294 m!537629))

(declare-fun m!537631 () Bool)

(assert (=> start!51294 m!537631))

(declare-fun m!537633 () Bool)

(assert (=> b!559690 m!537633))

(assert (=> b!559690 m!537633))

(declare-fun m!537635 () Bool)

(assert (=> b!559690 m!537635))

(declare-fun m!537637 () Bool)

(assert (=> b!559687 m!537637))

(assert (=> b!559693 m!537633))

(assert (=> b!559693 m!537633))

(declare-fun m!537639 () Bool)

(assert (=> b!559693 m!537639))

(declare-fun m!537641 () Bool)

(assert (=> b!559693 m!537641))

(declare-fun m!537643 () Bool)

(assert (=> b!559693 m!537643))

(declare-fun m!537645 () Bool)

(assert (=> b!559683 m!537645))

(assert (=> b!559683 m!537633))

(declare-fun m!537647 () Bool)

(assert (=> b!559692 m!537647))

(declare-fun m!537649 () Bool)

(assert (=> b!559686 m!537649))

(assert (=> b!559689 m!537633))

(assert (=> b!559689 m!537633))

(declare-fun m!537651 () Bool)

(assert (=> b!559689 m!537651))

(assert (=> b!559688 m!537633))

(declare-fun m!537653 () Bool)

(assert (=> b!559688 m!537653))

(declare-fun m!537655 () Bool)

(assert (=> b!559688 m!537655))

(declare-fun m!537657 () Bool)

(assert (=> b!559688 m!537657))

(assert (=> b!559688 m!537655))

(declare-fun m!537659 () Bool)

(assert (=> b!559688 m!537659))

(assert (=> b!559688 m!537655))

(declare-fun m!537661 () Bool)

(assert (=> b!559688 m!537661))

(assert (=> b!559688 m!537633))

(declare-fun m!537663 () Bool)

(assert (=> b!559688 m!537663))

(assert (=> b!559688 m!537633))

(declare-fun m!537665 () Bool)

(assert (=> b!559684 m!537665))

(declare-fun m!537667 () Bool)

(assert (=> b!559685 m!537667))

(check-sat (not b!559685) (not start!51294) (not b!559686) (not b!559692) (not b!559688) (not b!559684) (not b!559693) (not b!559687) (not b!559689) (not b!559690))
(check-sat)
