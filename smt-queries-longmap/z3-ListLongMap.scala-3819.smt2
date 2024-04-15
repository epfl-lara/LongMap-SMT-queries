; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52388 () Bool)

(assert start!52388)

(declare-fun b!571492 () Bool)

(declare-fun e!328691 () Bool)

(assert (=> b!571492 (= e!328691 (not true))))

(declare-fun e!328692 () Bool)

(assert (=> b!571492 e!328692))

(declare-fun res!361148 () Bool)

(assert (=> b!571492 (=> (not res!361148) (not e!328692))))

(declare-datatypes ((SeekEntryResult!5632 0))(
  ( (MissingZero!5632 (index!24755 (_ BitVec 32))) (Found!5632 (index!24756 (_ BitVec 32))) (Intermediate!5632 (undefined!6444 Bool) (index!24757 (_ BitVec 32)) (x!53640 (_ BitVec 32))) (Undefined!5632) (MissingVacant!5632 (index!24758 (_ BitVec 32))) )
))
(declare-fun lt!260537 () SeekEntryResult!5632)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!571492 (= res!361148 (= lt!260537 (Found!5632 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35794 0))(
  ( (array!35795 (arr!17186 (Array (_ BitVec 32) (_ BitVec 64))) (size!17551 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35794)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35794 (_ BitVec 32)) SeekEntryResult!5632)

(assert (=> b!571492 (= lt!260537 (seekEntryOrOpen!0 (select (arr!17186 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35794 (_ BitVec 32)) Bool)

(assert (=> b!571492 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17952 0))(
  ( (Unit!17953) )
))
(declare-fun lt!260538 () Unit!17952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17952)

(assert (=> b!571492 (= lt!260538 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun lt!260542 () (_ BitVec 64))

(declare-fun e!328686 () Bool)

(declare-fun lt!260534 () array!35794)

(declare-fun lt!260541 () SeekEntryResult!5632)

(declare-fun b!571493 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35794 (_ BitVec 32)) SeekEntryResult!5632)

(assert (=> b!571493 (= e!328686 (= (seekEntryOrOpen!0 lt!260542 lt!260534 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53640 lt!260541) (index!24757 lt!260541) (index!24757 lt!260541) lt!260542 lt!260534 mask!3119)))))

(declare-fun b!571494 () Bool)

(declare-fun res!361153 () Bool)

(declare-fun e!328685 () Bool)

(assert (=> b!571494 (=> (not res!361153) (not e!328685))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571494 (= res!361153 (validKeyInArray!0 k0!1914))))

(declare-fun b!571495 () Bool)

(declare-fun e!328687 () Bool)

(assert (=> b!571495 (= e!328687 e!328691)))

(declare-fun res!361151 () Bool)

(assert (=> b!571495 (=> (not res!361151) (not e!328691))))

(declare-fun lt!260540 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35794 (_ BitVec 32)) SeekEntryResult!5632)

(assert (=> b!571495 (= res!361151 (= lt!260541 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260540 lt!260542 lt!260534 mask!3119)))))

(declare-fun lt!260536 () (_ BitVec 32))

(assert (=> b!571495 (= lt!260541 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260536 (select (arr!17186 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571495 (= lt!260540 (toIndex!0 lt!260542 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571495 (= lt!260542 (select (store (arr!17186 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571495 (= lt!260536 (toIndex!0 (select (arr!17186 a!3118) j!142) mask!3119))))

(assert (=> b!571495 (= lt!260534 (array!35795 (store (arr!17186 a!3118) i!1132 k0!1914) (size!17551 a!3118)))))

(declare-fun b!571496 () Bool)

(declare-fun e!328688 () Bool)

(declare-fun e!328689 () Bool)

(assert (=> b!571496 (= e!328688 e!328689)))

(declare-fun res!361152 () Bool)

(assert (=> b!571496 (=> res!361152 e!328689)))

(declare-fun lt!260535 () (_ BitVec 64))

(assert (=> b!571496 (= res!361152 (or (= lt!260535 (select (arr!17186 a!3118) j!142)) (= lt!260535 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571496 (= lt!260535 (select (arr!17186 a!3118) (index!24757 lt!260541)))))

(declare-fun b!571497 () Bool)

(declare-fun res!361145 () Bool)

(assert (=> b!571497 (=> (not res!361145) (not e!328685))))

(assert (=> b!571497 (= res!361145 (validKeyInArray!0 (select (arr!17186 a!3118) j!142)))))

(declare-fun res!361149 () Bool)

(assert (=> start!52388 (=> (not res!361149) (not e!328685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52388 (= res!361149 (validMask!0 mask!3119))))

(assert (=> start!52388 e!328685))

(assert (=> start!52388 true))

(declare-fun array_inv!13069 (array!35794) Bool)

(assert (=> start!52388 (array_inv!13069 a!3118)))

(declare-fun b!571498 () Bool)

(declare-fun res!361142 () Bool)

(assert (=> b!571498 (=> (not res!361142) (not e!328685))))

(assert (=> b!571498 (= res!361142 (and (= (size!17551 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17551 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17551 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571499 () Bool)

(assert (=> b!571499 (= e!328689 e!328686)))

(declare-fun res!361143 () Bool)

(assert (=> b!571499 (=> (not res!361143) (not e!328686))))

(assert (=> b!571499 (= res!361143 (= lt!260537 (seekKeyOrZeroReturnVacant!0 (x!53640 lt!260541) (index!24757 lt!260541) (index!24757 lt!260541) (select (arr!17186 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571500 () Bool)

(declare-fun res!361154 () Bool)

(assert (=> b!571500 (=> (not res!361154) (not e!328687))))

(declare-datatypes ((List!11305 0))(
  ( (Nil!11302) (Cons!11301 (h!12328 (_ BitVec 64)) (t!17524 List!11305)) )
))
(declare-fun arrayNoDuplicates!0 (array!35794 (_ BitVec 32) List!11305) Bool)

(assert (=> b!571500 (= res!361154 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11302))))

(declare-fun b!571501 () Bool)

(declare-fun res!361146 () Bool)

(assert (=> b!571501 (=> (not res!361146) (not e!328685))))

(declare-fun arrayContainsKey!0 (array!35794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571501 (= res!361146 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571502 () Bool)

(assert (=> b!571502 (= e!328692 e!328688)))

(declare-fun res!361144 () Bool)

(assert (=> b!571502 (=> res!361144 e!328688)))

(get-info :version)

(assert (=> b!571502 (= res!361144 (or (undefined!6444 lt!260541) (not ((_ is Intermediate!5632) lt!260541))))))

(declare-fun b!571503 () Bool)

(assert (=> b!571503 (= e!328685 e!328687)))

(declare-fun res!361150 () Bool)

(assert (=> b!571503 (=> (not res!361150) (not e!328687))))

(declare-fun lt!260539 () SeekEntryResult!5632)

(assert (=> b!571503 (= res!361150 (or (= lt!260539 (MissingZero!5632 i!1132)) (= lt!260539 (MissingVacant!5632 i!1132))))))

(assert (=> b!571503 (= lt!260539 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571504 () Bool)

(declare-fun res!361147 () Bool)

(assert (=> b!571504 (=> (not res!361147) (not e!328687))))

(assert (=> b!571504 (= res!361147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52388 res!361149) b!571498))

(assert (= (and b!571498 res!361142) b!571497))

(assert (= (and b!571497 res!361145) b!571494))

(assert (= (and b!571494 res!361153) b!571501))

(assert (= (and b!571501 res!361146) b!571503))

(assert (= (and b!571503 res!361150) b!571504))

(assert (= (and b!571504 res!361147) b!571500))

(assert (= (and b!571500 res!361154) b!571495))

(assert (= (and b!571495 res!361151) b!571492))

(assert (= (and b!571492 res!361148) b!571502))

(assert (= (and b!571502 (not res!361144)) b!571496))

(assert (= (and b!571496 (not res!361152)) b!571499))

(assert (= (and b!571499 res!361143) b!571493))

(declare-fun m!549881 () Bool)

(assert (=> b!571500 m!549881))

(declare-fun m!549883 () Bool)

(assert (=> b!571493 m!549883))

(declare-fun m!549885 () Bool)

(assert (=> b!571493 m!549885))

(declare-fun m!549887 () Bool)

(assert (=> b!571492 m!549887))

(assert (=> b!571492 m!549887))

(declare-fun m!549889 () Bool)

(assert (=> b!571492 m!549889))

(declare-fun m!549891 () Bool)

(assert (=> b!571492 m!549891))

(declare-fun m!549893 () Bool)

(assert (=> b!571492 m!549893))

(declare-fun m!549895 () Bool)

(assert (=> b!571494 m!549895))

(assert (=> b!571497 m!549887))

(assert (=> b!571497 m!549887))

(declare-fun m!549897 () Bool)

(assert (=> b!571497 m!549897))

(assert (=> b!571495 m!549887))

(declare-fun m!549899 () Bool)

(assert (=> b!571495 m!549899))

(assert (=> b!571495 m!549887))

(declare-fun m!549901 () Bool)

(assert (=> b!571495 m!549901))

(declare-fun m!549903 () Bool)

(assert (=> b!571495 m!549903))

(declare-fun m!549905 () Bool)

(assert (=> b!571495 m!549905))

(assert (=> b!571495 m!549887))

(declare-fun m!549907 () Bool)

(assert (=> b!571495 m!549907))

(declare-fun m!549909 () Bool)

(assert (=> b!571495 m!549909))

(declare-fun m!549911 () Bool)

(assert (=> b!571501 m!549911))

(declare-fun m!549913 () Bool)

(assert (=> b!571504 m!549913))

(assert (=> b!571499 m!549887))

(assert (=> b!571499 m!549887))

(declare-fun m!549915 () Bool)

(assert (=> b!571499 m!549915))

(declare-fun m!549917 () Bool)

(assert (=> b!571503 m!549917))

(declare-fun m!549919 () Bool)

(assert (=> start!52388 m!549919))

(declare-fun m!549921 () Bool)

(assert (=> start!52388 m!549921))

(assert (=> b!571496 m!549887))

(declare-fun m!549923 () Bool)

(assert (=> b!571496 m!549923))

(check-sat (not b!571493) (not b!571504) (not b!571497) (not start!52388) (not b!571500) (not b!571503) (not b!571501) (not b!571492) (not b!571499) (not b!571495) (not b!571494))
(check-sat)
