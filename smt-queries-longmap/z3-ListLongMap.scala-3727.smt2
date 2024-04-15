; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51344 () Bool)

(assert start!51344)

(declare-fun b!560362 () Bool)

(declare-fun res!351657 () Bool)

(declare-fun e!322855 () Bool)

(assert (=> b!560362 (=> (not res!351657) (not e!322855))))

(declare-datatypes ((array!35218 0))(
  ( (array!35219 (arr!16910 (Array (_ BitVec 32) (_ BitVec 64))) (size!17275 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35218)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560362 (= res!351657 (validKeyInArray!0 (select (arr!16910 a!3118) j!142)))))

(declare-fun b!560363 () Bool)

(declare-fun res!351668 () Bool)

(assert (=> b!560363 (=> (not res!351668) (not e!322855))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560363 (= res!351668 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560364 () Bool)

(declare-fun e!322853 () Bool)

(assert (=> b!560364 (= e!322855 e!322853)))

(declare-fun res!351658 () Bool)

(assert (=> b!560364 (=> (not res!351658) (not e!322853))))

(declare-datatypes ((SeekEntryResult!5356 0))(
  ( (MissingZero!5356 (index!23651 (_ BitVec 32))) (Found!5356 (index!23652 (_ BitVec 32))) (Intermediate!5356 (undefined!6168 Bool) (index!23653 (_ BitVec 32)) (x!52574 (_ BitVec 32))) (Undefined!5356) (MissingVacant!5356 (index!23654 (_ BitVec 32))) )
))
(declare-fun lt!254719 () SeekEntryResult!5356)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560364 (= res!351658 (or (= lt!254719 (MissingZero!5356 i!1132)) (= lt!254719 (MissingVacant!5356 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35218 (_ BitVec 32)) SeekEntryResult!5356)

(assert (=> b!560364 (= lt!254719 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560365 () Bool)

(declare-fun e!322850 () Bool)

(declare-fun e!322851 () Bool)

(assert (=> b!560365 (= e!322850 e!322851)))

(declare-fun res!351665 () Bool)

(assert (=> b!560365 (=> res!351665 e!322851)))

(declare-fun lt!254720 () (_ BitVec 64))

(assert (=> b!560365 (= res!351665 (or (= lt!254720 (select (arr!16910 a!3118) j!142)) (= lt!254720 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!254724 () SeekEntryResult!5356)

(assert (=> b!560365 (= lt!254720 (select (arr!16910 a!3118) (index!23653 lt!254724)))))

(declare-fun b!560366 () Bool)

(declare-fun res!351661 () Bool)

(assert (=> b!560366 (=> (not res!351661) (not e!322855))))

(assert (=> b!560366 (= res!351661 (validKeyInArray!0 k0!1914))))

(declare-fun b!560367 () Bool)

(declare-fun e!322852 () Bool)

(assert (=> b!560367 (= e!322853 e!322852)))

(declare-fun res!351664 () Bool)

(assert (=> b!560367 (=> (not res!351664) (not e!322852))))

(declare-fun lt!254723 () (_ BitVec 32))

(declare-fun lt!254718 () array!35218)

(declare-fun lt!254721 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35218 (_ BitVec 32)) SeekEntryResult!5356)

(assert (=> b!560367 (= res!351664 (= lt!254724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254723 lt!254721 lt!254718 mask!3119)))))

(declare-fun lt!254717 () (_ BitVec 32))

(assert (=> b!560367 (= lt!254724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254717 (select (arr!16910 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560367 (= lt!254723 (toIndex!0 lt!254721 mask!3119))))

(assert (=> b!560367 (= lt!254721 (select (store (arr!16910 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560367 (= lt!254717 (toIndex!0 (select (arr!16910 a!3118) j!142) mask!3119))))

(assert (=> b!560367 (= lt!254718 (array!35219 (store (arr!16910 a!3118) i!1132 k0!1914) (size!17275 a!3118)))))

(declare-fun b!560368 () Bool)

(assert (=> b!560368 (= e!322852 (not true))))

(declare-fun e!322857 () Bool)

(assert (=> b!560368 e!322857))

(declare-fun res!351667 () Bool)

(assert (=> b!560368 (=> (not res!351667) (not e!322857))))

(declare-fun lt!254725 () SeekEntryResult!5356)

(assert (=> b!560368 (= res!351667 (= lt!254725 (Found!5356 j!142)))))

(assert (=> b!560368 (= lt!254725 (seekEntryOrOpen!0 (select (arr!16910 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35218 (_ BitVec 32)) Bool)

(assert (=> b!560368 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17472 0))(
  ( (Unit!17473) )
))
(declare-fun lt!254722 () Unit!17472)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17472)

(assert (=> b!560368 (= lt!254722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560370 () Bool)

(assert (=> b!560370 (= e!322857 e!322850)))

(declare-fun res!351662 () Bool)

(assert (=> b!560370 (=> res!351662 e!322850)))

(get-info :version)

(assert (=> b!560370 (= res!351662 (or (undefined!6168 lt!254724) (not ((_ is Intermediate!5356) lt!254724))))))

(declare-fun b!560371 () Bool)

(declare-fun res!351660 () Bool)

(assert (=> b!560371 (=> (not res!351660) (not e!322855))))

(assert (=> b!560371 (= res!351660 (and (= (size!17275 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17275 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17275 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!322856 () Bool)

(declare-fun b!560372 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35218 (_ BitVec 32)) SeekEntryResult!5356)

(assert (=> b!560372 (= e!322856 (= (seekEntryOrOpen!0 lt!254721 lt!254718 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52574 lt!254724) (index!23653 lt!254724) (index!23653 lt!254724) lt!254721 lt!254718 mask!3119)))))

(declare-fun b!560373 () Bool)

(assert (=> b!560373 (= e!322851 e!322856)))

(declare-fun res!351666 () Bool)

(assert (=> b!560373 (=> (not res!351666) (not e!322856))))

(assert (=> b!560373 (= res!351666 (= lt!254725 (seekKeyOrZeroReturnVacant!0 (x!52574 lt!254724) (index!23653 lt!254724) (index!23653 lt!254724) (select (arr!16910 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560374 () Bool)

(declare-fun res!351663 () Bool)

(assert (=> b!560374 (=> (not res!351663) (not e!322853))))

(declare-datatypes ((List!11029 0))(
  ( (Nil!11026) (Cons!11025 (h!12028 (_ BitVec 64)) (t!17248 List!11029)) )
))
(declare-fun arrayNoDuplicates!0 (array!35218 (_ BitVec 32) List!11029) Bool)

(assert (=> b!560374 (= res!351663 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11026))))

(declare-fun res!351656 () Bool)

(assert (=> start!51344 (=> (not res!351656) (not e!322855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51344 (= res!351656 (validMask!0 mask!3119))))

(assert (=> start!51344 e!322855))

(assert (=> start!51344 true))

(declare-fun array_inv!12793 (array!35218) Bool)

(assert (=> start!51344 (array_inv!12793 a!3118)))

(declare-fun b!560369 () Bool)

(declare-fun res!351659 () Bool)

(assert (=> b!560369 (=> (not res!351659) (not e!322853))))

(assert (=> b!560369 (= res!351659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51344 res!351656) b!560371))

(assert (= (and b!560371 res!351660) b!560362))

(assert (= (and b!560362 res!351657) b!560366))

(assert (= (and b!560366 res!351661) b!560363))

(assert (= (and b!560363 res!351668) b!560364))

(assert (= (and b!560364 res!351658) b!560369))

(assert (= (and b!560369 res!351659) b!560374))

(assert (= (and b!560374 res!351663) b!560367))

(assert (= (and b!560367 res!351664) b!560368))

(assert (= (and b!560368 res!351667) b!560370))

(assert (= (and b!560370 (not res!351662)) b!560365))

(assert (= (and b!560365 (not res!351665)) b!560373))

(assert (= (and b!560373 res!351666) b!560372))

(declare-fun m!537653 () Bool)

(assert (=> b!560372 m!537653))

(declare-fun m!537655 () Bool)

(assert (=> b!560372 m!537655))

(declare-fun m!537657 () Bool)

(assert (=> b!560362 m!537657))

(assert (=> b!560362 m!537657))

(declare-fun m!537659 () Bool)

(assert (=> b!560362 m!537659))

(declare-fun m!537661 () Bool)

(assert (=> b!560364 m!537661))

(declare-fun m!537663 () Bool)

(assert (=> b!560363 m!537663))

(assert (=> b!560367 m!537657))

(declare-fun m!537665 () Bool)

(assert (=> b!560367 m!537665))

(assert (=> b!560367 m!537657))

(declare-fun m!537667 () Bool)

(assert (=> b!560367 m!537667))

(declare-fun m!537669 () Bool)

(assert (=> b!560367 m!537669))

(declare-fun m!537671 () Bool)

(assert (=> b!560367 m!537671))

(declare-fun m!537673 () Bool)

(assert (=> b!560367 m!537673))

(assert (=> b!560367 m!537657))

(declare-fun m!537675 () Bool)

(assert (=> b!560367 m!537675))

(declare-fun m!537677 () Bool)

(assert (=> b!560374 m!537677))

(assert (=> b!560373 m!537657))

(assert (=> b!560373 m!537657))

(declare-fun m!537679 () Bool)

(assert (=> b!560373 m!537679))

(declare-fun m!537681 () Bool)

(assert (=> start!51344 m!537681))

(declare-fun m!537683 () Bool)

(assert (=> start!51344 m!537683))

(declare-fun m!537685 () Bool)

(assert (=> b!560366 m!537685))

(assert (=> b!560365 m!537657))

(declare-fun m!537687 () Bool)

(assert (=> b!560365 m!537687))

(assert (=> b!560368 m!537657))

(assert (=> b!560368 m!537657))

(declare-fun m!537689 () Bool)

(assert (=> b!560368 m!537689))

(declare-fun m!537691 () Bool)

(assert (=> b!560368 m!537691))

(declare-fun m!537693 () Bool)

(assert (=> b!560368 m!537693))

(declare-fun m!537695 () Bool)

(assert (=> b!560369 m!537695))

(check-sat (not b!560373) (not b!560372) (not b!560374) (not b!560364) (not b!560366) (not b!560363) (not b!560368) (not b!560369) (not start!51344) (not b!560362) (not b!560367))
(check-sat)
