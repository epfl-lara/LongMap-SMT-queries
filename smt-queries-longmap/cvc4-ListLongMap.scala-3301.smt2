; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45754 () Bool)

(assert start!45754)

(declare-fun b!506155 () Bool)

(declare-fun res!307148 () Bool)

(declare-fun e!296267 () Bool)

(assert (=> b!506155 (=> (not res!307148) (not e!296267))))

(declare-datatypes ((array!32510 0))(
  ( (array!32511 (arr!15635 (Array (_ BitVec 32) (_ BitVec 64))) (size!15999 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32510)

(declare-datatypes ((List!9793 0))(
  ( (Nil!9790) (Cons!9789 (h!10666 (_ BitVec 64)) (t!16021 List!9793)) )
))
(declare-fun arrayNoDuplicates!0 (array!32510 (_ BitVec 32) List!9793) Bool)

(assert (=> b!506155 (= res!307148 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9790))))

(declare-fun b!506156 () Bool)

(declare-fun res!307144 () Bool)

(assert (=> b!506156 (=> (not res!307144) (not e!296267))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32510 (_ BitVec 32)) Bool)

(assert (=> b!506156 (= res!307144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506157 () Bool)

(declare-fun res!307135 () Bool)

(declare-fun e!296266 () Bool)

(assert (=> b!506157 (=> (not res!307135) (not e!296266))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506157 (= res!307135 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506158 () Bool)

(declare-fun e!296264 () Bool)

(declare-fun e!296260 () Bool)

(assert (=> b!506158 (= e!296264 e!296260)))

(declare-fun res!307143 () Bool)

(assert (=> b!506158 (=> res!307143 e!296260)))

(declare-datatypes ((SeekEntryResult!4102 0))(
  ( (MissingZero!4102 (index!18596 (_ BitVec 32))) (Found!4102 (index!18597 (_ BitVec 32))) (Intermediate!4102 (undefined!4914 Bool) (index!18598 (_ BitVec 32)) (x!47599 (_ BitVec 32))) (Undefined!4102) (MissingVacant!4102 (index!18599 (_ BitVec 32))) )
))
(declare-fun lt!230908 () SeekEntryResult!4102)

(declare-fun lt!230905 () (_ BitVec 32))

(assert (=> b!506158 (= res!307143 (or (bvsgt (x!47599 lt!230908) #b01111111111111111111111111111110) (bvslt lt!230905 #b00000000000000000000000000000000) (bvsge lt!230905 (size!15999 a!3235)) (bvslt (index!18598 lt!230908) #b00000000000000000000000000000000) (bvsge (index!18598 lt!230908) (size!15999 a!3235)) (not (= lt!230908 (Intermediate!4102 false (index!18598 lt!230908) (x!47599 lt!230908))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506158 (= (index!18598 lt!230908) i!1204)))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15484 0))(
  ( (Unit!15485) )
))
(declare-fun lt!230911 () Unit!15484)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32510 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15484)

(assert (=> b!506158 (= lt!230911 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230905 #b00000000000000000000000000000000 (index!18598 lt!230908) (x!47599 lt!230908) mask!3524))))

(assert (=> b!506158 (and (or (= (select (arr!15635 a!3235) (index!18598 lt!230908)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15635 a!3235) (index!18598 lt!230908)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15635 a!3235) (index!18598 lt!230908)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15635 a!3235) (index!18598 lt!230908)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230917 () Unit!15484)

(declare-fun e!296261 () Unit!15484)

(assert (=> b!506158 (= lt!230917 e!296261)))

(declare-fun c!59789 () Bool)

(assert (=> b!506158 (= c!59789 (= (select (arr!15635 a!3235) (index!18598 lt!230908)) (select (arr!15635 a!3235) j!176)))))

(assert (=> b!506158 (and (bvslt (x!47599 lt!230908) #b01111111111111111111111111111110) (or (= (select (arr!15635 a!3235) (index!18598 lt!230908)) (select (arr!15635 a!3235) j!176)) (= (select (arr!15635 a!3235) (index!18598 lt!230908)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15635 a!3235) (index!18598 lt!230908)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!296263 () Bool)

(declare-fun b!506159 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32510 (_ BitVec 32)) SeekEntryResult!4102)

(assert (=> b!506159 (= e!296263 (= (seekEntryOrOpen!0 (select (arr!15635 a!3235) j!176) a!3235 mask!3524) (Found!4102 j!176)))))

(declare-fun b!506160 () Bool)

(declare-fun res!307134 () Bool)

(assert (=> b!506160 (=> res!307134 e!296260)))

(declare-fun lt!230915 () array!32510)

(declare-fun lt!230907 () (_ BitVec 64))

(declare-fun lt!230914 () SeekEntryResult!4102)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32510 (_ BitVec 32)) SeekEntryResult!4102)

(assert (=> b!506160 (= res!307134 (not (= lt!230914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230905 lt!230907 lt!230915 mask!3524))))))

(declare-fun b!506161 () Bool)

(declare-fun Unit!15486 () Unit!15484)

(assert (=> b!506161 (= e!296261 Unit!15486)))

(declare-fun lt!230910 () Unit!15484)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32510 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15484)

(assert (=> b!506161 (= lt!230910 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230905 #b00000000000000000000000000000000 (index!18598 lt!230908) (x!47599 lt!230908) mask!3524))))

(declare-fun res!307140 () Bool)

(assert (=> b!506161 (= res!307140 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230905 lt!230907 lt!230915 mask!3524) (Intermediate!4102 false (index!18598 lt!230908) (x!47599 lt!230908))))))

(declare-fun e!296262 () Bool)

(assert (=> b!506161 (=> (not res!307140) (not e!296262))))

(assert (=> b!506161 e!296262))

(declare-fun e!296265 () Bool)

(declare-fun lt!230913 () SeekEntryResult!4102)

(declare-fun b!506162 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32510 (_ BitVec 32)) SeekEntryResult!4102)

(assert (=> b!506162 (= e!296265 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230905 (index!18598 lt!230908) (select (arr!15635 a!3235) j!176) a!3235 mask!3524) lt!230913)))))

(declare-fun b!506163 () Bool)

(declare-fun res!307139 () Bool)

(assert (=> b!506163 (=> (not res!307139) (not e!296266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506163 (= res!307139 (validKeyInArray!0 k!2280))))

(declare-fun b!506164 () Bool)

(assert (=> b!506164 (= e!296262 false)))

(declare-fun b!506165 () Bool)

(declare-fun res!307138 () Bool)

(assert (=> b!506165 (=> res!307138 e!296260)))

(assert (=> b!506165 (= res!307138 e!296265)))

(declare-fun res!307145 () Bool)

(assert (=> b!506165 (=> (not res!307145) (not e!296265))))

(assert (=> b!506165 (= res!307145 (bvsgt #b00000000000000000000000000000000 (x!47599 lt!230908)))))

(declare-fun b!506166 () Bool)

(declare-fun Unit!15487 () Unit!15484)

(assert (=> b!506166 (= e!296261 Unit!15487)))

(declare-fun b!506167 () Bool)

(declare-fun res!307147 () Bool)

(assert (=> b!506167 (=> (not res!307147) (not e!296266))))

(assert (=> b!506167 (= res!307147 (and (= (size!15999 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15999 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15999 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!307136 () Bool)

(assert (=> start!45754 (=> (not res!307136) (not e!296266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45754 (= res!307136 (validMask!0 mask!3524))))

(assert (=> start!45754 e!296266))

(assert (=> start!45754 true))

(declare-fun array_inv!11431 (array!32510) Bool)

(assert (=> start!45754 (array_inv!11431 a!3235)))

(declare-fun b!506168 () Bool)

(assert (=> b!506168 (= e!296267 (not e!296264))))

(declare-fun res!307146 () Bool)

(assert (=> b!506168 (=> res!307146 e!296264)))

(assert (=> b!506168 (= res!307146 (or (= lt!230908 lt!230914) (undefined!4914 lt!230908) (not (is-Intermediate!4102 lt!230908))))))

(declare-fun lt!230906 () (_ BitVec 32))

(assert (=> b!506168 (= lt!230914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230906 lt!230907 lt!230915 mask!3524))))

(assert (=> b!506168 (= lt!230908 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230905 (select (arr!15635 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506168 (= lt!230906 (toIndex!0 lt!230907 mask!3524))))

(assert (=> b!506168 (= lt!230907 (select (store (arr!15635 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!506168 (= lt!230905 (toIndex!0 (select (arr!15635 a!3235) j!176) mask!3524))))

(assert (=> b!506168 (= lt!230915 (array!32511 (store (arr!15635 a!3235) i!1204 k!2280) (size!15999 a!3235)))))

(assert (=> b!506168 (= lt!230913 (Found!4102 j!176))))

(assert (=> b!506168 e!296263))

(declare-fun res!307142 () Bool)

(assert (=> b!506168 (=> (not res!307142) (not e!296263))))

(assert (=> b!506168 (= res!307142 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230912 () Unit!15484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15484)

(assert (=> b!506168 (= lt!230912 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506169 () Bool)

(declare-fun res!307141 () Bool)

(assert (=> b!506169 (=> (not res!307141) (not e!296266))))

(assert (=> b!506169 (= res!307141 (validKeyInArray!0 (select (arr!15635 a!3235) j!176)))))

(declare-fun b!506170 () Bool)

(assert (=> b!506170 (= e!296260 true)))

(assert (=> b!506170 (= (seekEntryOrOpen!0 lt!230907 lt!230915 mask!3524) lt!230913)))

(declare-fun lt!230909 () Unit!15484)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32510 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15484)

(assert (=> b!506170 (= lt!230909 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230905 #b00000000000000000000000000000000 (index!18598 lt!230908) (x!47599 lt!230908) mask!3524))))

(declare-fun b!506171 () Bool)

(assert (=> b!506171 (= e!296266 e!296267)))

(declare-fun res!307137 () Bool)

(assert (=> b!506171 (=> (not res!307137) (not e!296267))))

(declare-fun lt!230916 () SeekEntryResult!4102)

(assert (=> b!506171 (= res!307137 (or (= lt!230916 (MissingZero!4102 i!1204)) (= lt!230916 (MissingVacant!4102 i!1204))))))

(assert (=> b!506171 (= lt!230916 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45754 res!307136) b!506167))

(assert (= (and b!506167 res!307147) b!506169))

(assert (= (and b!506169 res!307141) b!506163))

(assert (= (and b!506163 res!307139) b!506157))

(assert (= (and b!506157 res!307135) b!506171))

(assert (= (and b!506171 res!307137) b!506156))

(assert (= (and b!506156 res!307144) b!506155))

(assert (= (and b!506155 res!307148) b!506168))

(assert (= (and b!506168 res!307142) b!506159))

(assert (= (and b!506168 (not res!307146)) b!506158))

(assert (= (and b!506158 c!59789) b!506161))

(assert (= (and b!506158 (not c!59789)) b!506166))

(assert (= (and b!506161 res!307140) b!506164))

(assert (= (and b!506158 (not res!307143)) b!506165))

(assert (= (and b!506165 res!307145) b!506162))

(assert (= (and b!506165 (not res!307138)) b!506160))

(assert (= (and b!506160 (not res!307134)) b!506170))

(declare-fun m!486805 () Bool)

(assert (=> b!506155 m!486805))

(declare-fun m!486807 () Bool)

(assert (=> b!506159 m!486807))

(assert (=> b!506159 m!486807))

(declare-fun m!486809 () Bool)

(assert (=> b!506159 m!486809))

(assert (=> b!506169 m!486807))

(assert (=> b!506169 m!486807))

(declare-fun m!486811 () Bool)

(assert (=> b!506169 m!486811))

(assert (=> b!506162 m!486807))

(assert (=> b!506162 m!486807))

(declare-fun m!486813 () Bool)

(assert (=> b!506162 m!486813))

(declare-fun m!486815 () Bool)

(assert (=> b!506160 m!486815))

(declare-fun m!486817 () Bool)

(assert (=> b!506158 m!486817))

(declare-fun m!486819 () Bool)

(assert (=> b!506158 m!486819))

(assert (=> b!506158 m!486807))

(declare-fun m!486821 () Bool)

(assert (=> b!506163 m!486821))

(declare-fun m!486823 () Bool)

(assert (=> b!506170 m!486823))

(declare-fun m!486825 () Bool)

(assert (=> b!506170 m!486825))

(declare-fun m!486827 () Bool)

(assert (=> b!506171 m!486827))

(declare-fun m!486829 () Bool)

(assert (=> start!45754 m!486829))

(declare-fun m!486831 () Bool)

(assert (=> start!45754 m!486831))

(declare-fun m!486833 () Bool)

(assert (=> b!506168 m!486833))

(declare-fun m!486835 () Bool)

(assert (=> b!506168 m!486835))

(declare-fun m!486837 () Bool)

(assert (=> b!506168 m!486837))

(assert (=> b!506168 m!486807))

(declare-fun m!486839 () Bool)

(assert (=> b!506168 m!486839))

(declare-fun m!486841 () Bool)

(assert (=> b!506168 m!486841))

(declare-fun m!486843 () Bool)

(assert (=> b!506168 m!486843))

(assert (=> b!506168 m!486807))

(declare-fun m!486845 () Bool)

(assert (=> b!506168 m!486845))

(assert (=> b!506168 m!486807))

(declare-fun m!486847 () Bool)

(assert (=> b!506168 m!486847))

(declare-fun m!486849 () Bool)

(assert (=> b!506161 m!486849))

(assert (=> b!506161 m!486815))

(declare-fun m!486851 () Bool)

(assert (=> b!506157 m!486851))

(declare-fun m!486853 () Bool)

(assert (=> b!506156 m!486853))

(push 1)

