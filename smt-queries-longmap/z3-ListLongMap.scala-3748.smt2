; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51470 () Bool)

(assert start!51470)

(declare-fun b!562763 () Bool)

(declare-fun res!354058 () Bool)

(declare-fun e!324308 () Bool)

(assert (=> b!562763 (=> (not res!354058) (not e!324308))))

(declare-datatypes ((array!35344 0))(
  ( (array!35345 (arr!16973 (Array (_ BitVec 32) (_ BitVec 64))) (size!17338 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35344)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562763 (= res!354058 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562764 () Bool)

(declare-fun e!324306 () Bool)

(declare-fun e!324312 () Bool)

(assert (=> b!562764 (= e!324306 e!324312)))

(declare-fun res!354063 () Bool)

(assert (=> b!562764 (=> res!354063 e!324312)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5419 0))(
  ( (MissingZero!5419 (index!23903 (_ BitVec 32))) (Found!5419 (index!23904 (_ BitVec 32))) (Intermediate!5419 (undefined!6231 Bool) (index!23905 (_ BitVec 32)) (x!52805 (_ BitVec 32))) (Undefined!5419) (MissingVacant!5419 (index!23906 (_ BitVec 32))) )
))
(declare-fun lt!256704 () SeekEntryResult!5419)

(declare-fun lt!256698 () (_ BitVec 64))

(declare-fun lt!256709 () SeekEntryResult!5419)

(declare-fun lt!256705 () SeekEntryResult!5419)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562764 (= res!354063 (or (bvslt (index!23905 lt!256709) #b00000000000000000000000000000000) (bvsge (index!23905 lt!256709) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52805 lt!256709) #b01111111111111111111111111111110) (bvslt (x!52805 lt!256709) #b00000000000000000000000000000000) (not (= lt!256698 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16973 a!3118) i!1132 k0!1914) (index!23905 lt!256709)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256704 lt!256705))))))

(declare-fun lt!256708 () SeekEntryResult!5419)

(declare-fun lt!256710 () SeekEntryResult!5419)

(assert (=> b!562764 (= lt!256708 lt!256710)))

(declare-fun lt!256707 () (_ BitVec 64))

(declare-fun lt!256700 () array!35344)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35344 (_ BitVec 32)) SeekEntryResult!5419)

(assert (=> b!562764 (= lt!256710 (seekKeyOrZeroReturnVacant!0 (x!52805 lt!256709) (index!23905 lt!256709) (index!23905 lt!256709) lt!256707 lt!256700 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35344 (_ BitVec 32)) SeekEntryResult!5419)

(assert (=> b!562764 (= lt!256708 (seekEntryOrOpen!0 lt!256707 lt!256700 mask!3119))))

(declare-fun lt!256703 () SeekEntryResult!5419)

(assert (=> b!562764 (= lt!256703 lt!256704)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562764 (= lt!256704 (seekKeyOrZeroReturnVacant!0 (x!52805 lt!256709) (index!23905 lt!256709) (index!23905 lt!256709) (select (arr!16973 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562765 () Bool)

(declare-fun e!324311 () Bool)

(declare-fun e!324309 () Bool)

(assert (=> b!562765 (= e!324311 e!324309)))

(declare-fun res!354059 () Bool)

(assert (=> b!562765 (=> (not res!354059) (not e!324309))))

(declare-fun lt!256699 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35344 (_ BitVec 32)) SeekEntryResult!5419)

(assert (=> b!562765 (= res!354059 (= lt!256709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256699 lt!256707 lt!256700 mask!3119)))))

(declare-fun lt!256701 () (_ BitVec 32))

(assert (=> b!562765 (= lt!256709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256701 (select (arr!16973 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562765 (= lt!256699 (toIndex!0 lt!256707 mask!3119))))

(assert (=> b!562765 (= lt!256707 (select (store (arr!16973 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562765 (= lt!256701 (toIndex!0 (select (arr!16973 a!3118) j!142) mask!3119))))

(assert (=> b!562765 (= lt!256700 (array!35345 (store (arr!16973 a!3118) i!1132 k0!1914) (size!17338 a!3118)))))

(declare-fun b!562766 () Bool)

(declare-fun res!354066 () Bool)

(assert (=> b!562766 (=> (not res!354066) (not e!324308))))

(assert (=> b!562766 (= res!354066 (and (= (size!17338 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17338 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17338 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562767 () Bool)

(declare-fun res!354067 () Bool)

(assert (=> b!562767 (=> (not res!354067) (not e!324311))))

(declare-datatypes ((List!11092 0))(
  ( (Nil!11089) (Cons!11088 (h!12091 (_ BitVec 64)) (t!17311 List!11092)) )
))
(declare-fun arrayNoDuplicates!0 (array!35344 (_ BitVec 32) List!11092) Bool)

(assert (=> b!562767 (= res!354067 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11089))))

(declare-fun b!562768 () Bool)

(declare-fun e!324307 () Bool)

(assert (=> b!562768 (= e!324309 (not e!324307))))

(declare-fun res!354065 () Bool)

(assert (=> b!562768 (=> res!354065 e!324307)))

(get-info :version)

(assert (=> b!562768 (= res!354065 (or (undefined!6231 lt!256709) (not ((_ is Intermediate!5419) lt!256709))))))

(assert (=> b!562768 (= lt!256703 lt!256705)))

(assert (=> b!562768 (= lt!256705 (Found!5419 j!142))))

(assert (=> b!562768 (= lt!256703 (seekEntryOrOpen!0 (select (arr!16973 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35344 (_ BitVec 32)) Bool)

(assert (=> b!562768 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17598 0))(
  ( (Unit!17599) )
))
(declare-fun lt!256702 () Unit!17598)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17598)

(assert (=> b!562768 (= lt!256702 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562769 () Bool)

(assert (=> b!562769 (= e!324312 true)))

(assert (=> b!562769 (= lt!256704 lt!256710)))

(declare-fun lt!256706 () Unit!17598)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35344 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17598)

(assert (=> b!562769 (= lt!256706 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52805 lt!256709) (index!23905 lt!256709) (index!23905 lt!256709) mask!3119))))

(declare-fun res!354062 () Bool)

(assert (=> start!51470 (=> (not res!354062) (not e!324308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51470 (= res!354062 (validMask!0 mask!3119))))

(assert (=> start!51470 e!324308))

(assert (=> start!51470 true))

(declare-fun array_inv!12856 (array!35344) Bool)

(assert (=> start!51470 (array_inv!12856 a!3118)))

(declare-fun b!562770 () Bool)

(declare-fun res!354061 () Bool)

(assert (=> b!562770 (=> (not res!354061) (not e!324308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562770 (= res!354061 (validKeyInArray!0 (select (arr!16973 a!3118) j!142)))))

(declare-fun b!562771 () Bool)

(declare-fun res!354064 () Bool)

(assert (=> b!562771 (=> (not res!354064) (not e!324311))))

(assert (=> b!562771 (= res!354064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562772 () Bool)

(declare-fun res!354068 () Bool)

(assert (=> b!562772 (=> (not res!354068) (not e!324308))))

(assert (=> b!562772 (= res!354068 (validKeyInArray!0 k0!1914))))

(declare-fun b!562773 () Bool)

(assert (=> b!562773 (= e!324308 e!324311)))

(declare-fun res!354057 () Bool)

(assert (=> b!562773 (=> (not res!354057) (not e!324311))))

(declare-fun lt!256711 () SeekEntryResult!5419)

(assert (=> b!562773 (= res!354057 (or (= lt!256711 (MissingZero!5419 i!1132)) (= lt!256711 (MissingVacant!5419 i!1132))))))

(assert (=> b!562773 (= lt!256711 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562774 () Bool)

(assert (=> b!562774 (= e!324307 e!324306)))

(declare-fun res!354060 () Bool)

(assert (=> b!562774 (=> res!354060 e!324306)))

(assert (=> b!562774 (= res!354060 (or (= lt!256698 (select (arr!16973 a!3118) j!142)) (= lt!256698 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562774 (= lt!256698 (select (arr!16973 a!3118) (index!23905 lt!256709)))))

(assert (= (and start!51470 res!354062) b!562766))

(assert (= (and b!562766 res!354066) b!562770))

(assert (= (and b!562770 res!354061) b!562772))

(assert (= (and b!562772 res!354068) b!562763))

(assert (= (and b!562763 res!354058) b!562773))

(assert (= (and b!562773 res!354057) b!562771))

(assert (= (and b!562771 res!354064) b!562767))

(assert (= (and b!562767 res!354067) b!562765))

(assert (= (and b!562765 res!354059) b!562768))

(assert (= (and b!562768 (not res!354065)) b!562774))

(assert (= (and b!562774 (not res!354060)) b!562764))

(assert (= (and b!562764 (not res!354063)) b!562769))

(declare-fun m!540497 () Bool)

(assert (=> b!562769 m!540497))

(declare-fun m!540499 () Bool)

(assert (=> b!562767 m!540499))

(declare-fun m!540501 () Bool)

(assert (=> b!562774 m!540501))

(declare-fun m!540503 () Bool)

(assert (=> b!562774 m!540503))

(assert (=> b!562765 m!540501))

(declare-fun m!540505 () Bool)

(assert (=> b!562765 m!540505))

(declare-fun m!540507 () Bool)

(assert (=> b!562765 m!540507))

(declare-fun m!540509 () Bool)

(assert (=> b!562765 m!540509))

(declare-fun m!540511 () Bool)

(assert (=> b!562765 m!540511))

(assert (=> b!562765 m!540501))

(declare-fun m!540513 () Bool)

(assert (=> b!562765 m!540513))

(assert (=> b!562765 m!540501))

(declare-fun m!540515 () Bool)

(assert (=> b!562765 m!540515))

(declare-fun m!540517 () Bool)

(assert (=> b!562763 m!540517))

(assert (=> b!562770 m!540501))

(assert (=> b!562770 m!540501))

(declare-fun m!540519 () Bool)

(assert (=> b!562770 m!540519))

(declare-fun m!540521 () Bool)

(assert (=> b!562773 m!540521))

(assert (=> b!562768 m!540501))

(assert (=> b!562768 m!540501))

(declare-fun m!540523 () Bool)

(assert (=> b!562768 m!540523))

(declare-fun m!540525 () Bool)

(assert (=> b!562768 m!540525))

(declare-fun m!540527 () Bool)

(assert (=> b!562768 m!540527))

(declare-fun m!540529 () Bool)

(assert (=> start!51470 m!540529))

(declare-fun m!540531 () Bool)

(assert (=> start!51470 m!540531))

(declare-fun m!540533 () Bool)

(assert (=> b!562771 m!540533))

(declare-fun m!540535 () Bool)

(assert (=> b!562764 m!540535))

(assert (=> b!562764 m!540501))

(assert (=> b!562764 m!540501))

(declare-fun m!540537 () Bool)

(assert (=> b!562764 m!540537))

(declare-fun m!540539 () Bool)

(assert (=> b!562764 m!540539))

(assert (=> b!562764 m!540511))

(declare-fun m!540541 () Bool)

(assert (=> b!562764 m!540541))

(declare-fun m!540543 () Bool)

(assert (=> b!562772 m!540543))

(check-sat (not b!562767) (not b!562771) (not b!562763) (not b!562765) (not start!51470) (not b!562764) (not b!562773) (not b!562772) (not b!562769) (not b!562768) (not b!562770))
(check-sat)
