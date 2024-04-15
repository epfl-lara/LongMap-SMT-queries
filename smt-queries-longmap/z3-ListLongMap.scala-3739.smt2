; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51416 () Bool)

(assert start!51416)

(declare-fun res!353062 () Bool)

(declare-fun e!323716 () Bool)

(assert (=> start!51416 (=> (not res!353062) (not e!323716))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51416 (= res!353062 (validMask!0 mask!3119))))

(assert (=> start!51416 e!323716))

(assert (=> start!51416 true))

(declare-datatypes ((array!35290 0))(
  ( (array!35291 (arr!16946 (Array (_ BitVec 32) (_ BitVec 64))) (size!17311 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35290)

(declare-fun array_inv!12829 (array!35290) Bool)

(assert (=> start!51416 (array_inv!12829 a!3118)))

(declare-fun b!561766 () Bool)

(declare-fun res!353061 () Bool)

(declare-fun e!323720 () Bool)

(assert (=> b!561766 (=> (not res!353061) (not e!323720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35290 (_ BitVec 32)) Bool)

(assert (=> b!561766 (= res!353061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561767 () Bool)

(declare-fun res!353072 () Bool)

(assert (=> b!561767 (=> (not res!353072) (not e!323716))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561767 (= res!353072 (validKeyInArray!0 (select (arr!16946 a!3118) j!142)))))

(declare-fun b!561768 () Bool)

(declare-fun res!353066 () Bool)

(assert (=> b!561768 (=> (not res!353066) (not e!323716))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!561768 (= res!353066 (validKeyInArray!0 k0!1914))))

(declare-fun b!561769 () Bool)

(declare-fun res!353064 () Bool)

(assert (=> b!561769 (=> (not res!353064) (not e!323716))))

(declare-fun arrayContainsKey!0 (array!35290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561769 (= res!353064 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561770 () Bool)

(declare-fun res!353060 () Bool)

(assert (=> b!561770 (=> (not res!353060) (not e!323720))))

(declare-datatypes ((List!11065 0))(
  ( (Nil!11062) (Cons!11061 (h!12064 (_ BitVec 64)) (t!17284 List!11065)) )
))
(declare-fun arrayNoDuplicates!0 (array!35290 (_ BitVec 32) List!11065) Bool)

(assert (=> b!561770 (= res!353060 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11062))))

(declare-fun b!561771 () Bool)

(declare-fun e!323718 () Bool)

(declare-fun e!323719 () Bool)

(assert (=> b!561771 (= e!323718 e!323719)))

(declare-fun res!353068 () Bool)

(assert (=> b!561771 (=> (not res!353068) (not e!323719))))

(declare-datatypes ((SeekEntryResult!5392 0))(
  ( (MissingZero!5392 (index!23795 (_ BitVec 32))) (Found!5392 (index!23796 (_ BitVec 32))) (Intermediate!5392 (undefined!6204 Bool) (index!23797 (_ BitVec 32)) (x!52706 (_ BitVec 32))) (Undefined!5392) (MissingVacant!5392 (index!23798 (_ BitVec 32))) )
))
(declare-fun lt!255692 () SeekEntryResult!5392)

(declare-fun lt!255696 () SeekEntryResult!5392)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35290 (_ BitVec 32)) SeekEntryResult!5392)

(assert (=> b!561771 (= res!353068 (= lt!255692 (seekKeyOrZeroReturnVacant!0 (x!52706 lt!255696) (index!23797 lt!255696) (index!23797 lt!255696) (select (arr!16946 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561772 () Bool)

(declare-fun e!323715 () Bool)

(assert (=> b!561772 (= e!323715 (not true))))

(declare-fun e!323714 () Bool)

(assert (=> b!561772 e!323714))

(declare-fun res!353063 () Bool)

(assert (=> b!561772 (=> (not res!353063) (not e!323714))))

(assert (=> b!561772 (= res!353063 (= lt!255692 (Found!5392 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35290 (_ BitVec 32)) SeekEntryResult!5392)

(assert (=> b!561772 (= lt!255692 (seekEntryOrOpen!0 (select (arr!16946 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561772 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17544 0))(
  ( (Unit!17545) )
))
(declare-fun lt!255695 () Unit!17544)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17544)

(assert (=> b!561772 (= lt!255695 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561773 () Bool)

(assert (=> b!561773 (= e!323720 e!323715)))

(declare-fun res!353069 () Bool)

(assert (=> b!561773 (=> (not res!353069) (not e!323715))))

(declare-fun lt!255690 () (_ BitVec 32))

(declare-fun lt!255693 () array!35290)

(declare-fun lt!255694 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35290 (_ BitVec 32)) SeekEntryResult!5392)

(assert (=> b!561773 (= res!353069 (= lt!255696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255690 lt!255694 lt!255693 mask!3119)))))

(declare-fun lt!255689 () (_ BitVec 32))

(assert (=> b!561773 (= lt!255696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255689 (select (arr!16946 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561773 (= lt!255690 (toIndex!0 lt!255694 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561773 (= lt!255694 (select (store (arr!16946 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561773 (= lt!255689 (toIndex!0 (select (arr!16946 a!3118) j!142) mask!3119))))

(assert (=> b!561773 (= lt!255693 (array!35291 (store (arr!16946 a!3118) i!1132 k0!1914) (size!17311 a!3118)))))

(declare-fun b!561774 () Bool)

(declare-fun res!353071 () Bool)

(assert (=> b!561774 (=> (not res!353071) (not e!323716))))

(assert (=> b!561774 (= res!353071 (and (= (size!17311 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17311 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17311 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561775 () Bool)

(declare-fun e!323721 () Bool)

(assert (=> b!561775 (= e!323721 e!323718)))

(declare-fun res!353070 () Bool)

(assert (=> b!561775 (=> res!353070 e!323718)))

(declare-fun lt!255691 () (_ BitVec 64))

(assert (=> b!561775 (= res!353070 (or (= lt!255691 (select (arr!16946 a!3118) j!142)) (= lt!255691 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561775 (= lt!255691 (select (arr!16946 a!3118) (index!23797 lt!255696)))))

(declare-fun b!561776 () Bool)

(assert (=> b!561776 (= e!323719 (= (seekEntryOrOpen!0 lt!255694 lt!255693 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52706 lt!255696) (index!23797 lt!255696) (index!23797 lt!255696) lt!255694 lt!255693 mask!3119)))))

(declare-fun b!561777 () Bool)

(assert (=> b!561777 (= e!323716 e!323720)))

(declare-fun res!353067 () Bool)

(assert (=> b!561777 (=> (not res!353067) (not e!323720))))

(declare-fun lt!255697 () SeekEntryResult!5392)

(assert (=> b!561777 (= res!353067 (or (= lt!255697 (MissingZero!5392 i!1132)) (= lt!255697 (MissingVacant!5392 i!1132))))))

(assert (=> b!561777 (= lt!255697 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561778 () Bool)

(assert (=> b!561778 (= e!323714 e!323721)))

(declare-fun res!353065 () Bool)

(assert (=> b!561778 (=> res!353065 e!323721)))

(get-info :version)

(assert (=> b!561778 (= res!353065 (or (undefined!6204 lt!255696) (not ((_ is Intermediate!5392) lt!255696))))))

(assert (= (and start!51416 res!353062) b!561774))

(assert (= (and b!561774 res!353071) b!561767))

(assert (= (and b!561767 res!353072) b!561768))

(assert (= (and b!561768 res!353066) b!561769))

(assert (= (and b!561769 res!353064) b!561777))

(assert (= (and b!561777 res!353067) b!561766))

(assert (= (and b!561766 res!353061) b!561770))

(assert (= (and b!561770 res!353060) b!561773))

(assert (= (and b!561773 res!353069) b!561772))

(assert (= (and b!561772 res!353063) b!561778))

(assert (= (and b!561778 (not res!353065)) b!561775))

(assert (= (and b!561775 (not res!353070)) b!561771))

(assert (= (and b!561771 res!353068) b!561776))

(declare-fun m!539237 () Bool)

(assert (=> b!561766 m!539237))

(declare-fun m!539239 () Bool)

(assert (=> b!561777 m!539239))

(declare-fun m!539241 () Bool)

(assert (=> start!51416 m!539241))

(declare-fun m!539243 () Bool)

(assert (=> start!51416 m!539243))

(declare-fun m!539245 () Bool)

(assert (=> b!561767 m!539245))

(assert (=> b!561767 m!539245))

(declare-fun m!539247 () Bool)

(assert (=> b!561767 m!539247))

(declare-fun m!539249 () Bool)

(assert (=> b!561776 m!539249))

(declare-fun m!539251 () Bool)

(assert (=> b!561776 m!539251))

(assert (=> b!561775 m!539245))

(declare-fun m!539253 () Bool)

(assert (=> b!561775 m!539253))

(declare-fun m!539255 () Bool)

(assert (=> b!561769 m!539255))

(assert (=> b!561771 m!539245))

(assert (=> b!561771 m!539245))

(declare-fun m!539257 () Bool)

(assert (=> b!561771 m!539257))

(declare-fun m!539259 () Bool)

(assert (=> b!561768 m!539259))

(assert (=> b!561772 m!539245))

(assert (=> b!561772 m!539245))

(declare-fun m!539261 () Bool)

(assert (=> b!561772 m!539261))

(declare-fun m!539263 () Bool)

(assert (=> b!561772 m!539263))

(declare-fun m!539265 () Bool)

(assert (=> b!561772 m!539265))

(assert (=> b!561773 m!539245))

(declare-fun m!539267 () Bool)

(assert (=> b!561773 m!539267))

(assert (=> b!561773 m!539245))

(declare-fun m!539269 () Bool)

(assert (=> b!561773 m!539269))

(declare-fun m!539271 () Bool)

(assert (=> b!561773 m!539271))

(declare-fun m!539273 () Bool)

(assert (=> b!561773 m!539273))

(assert (=> b!561773 m!539245))

(declare-fun m!539275 () Bool)

(assert (=> b!561773 m!539275))

(declare-fun m!539277 () Bool)

(assert (=> b!561773 m!539277))

(declare-fun m!539279 () Bool)

(assert (=> b!561770 m!539279))

(check-sat (not b!561766) (not start!51416) (not b!561770) (not b!561772) (not b!561777) (not b!561768) (not b!561771) (not b!561769) (not b!561773) (not b!561767) (not b!561776))
(check-sat)
