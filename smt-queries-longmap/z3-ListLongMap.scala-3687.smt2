; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50784 () Bool)

(assert start!50784)

(declare-fun b!555155 () Bool)

(declare-fun e!320051 () Bool)

(declare-fun e!320049 () Bool)

(assert (=> b!555155 (= e!320051 e!320049)))

(declare-fun res!347470 () Bool)

(assert (=> b!555155 (=> (not res!347470) (not e!320049))))

(declare-fun lt!252203 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5191 0))(
  ( (MissingZero!5191 (index!22991 (_ BitVec 32))) (Found!5191 (index!22992 (_ BitVec 32))) (Intermediate!5191 (undefined!6003 Bool) (index!22993 (_ BitVec 32)) (x!52052 (_ BitVec 32))) (Undefined!5191) (MissingVacant!5191 (index!22994 (_ BitVec 32))) )
))
(declare-fun lt!252205 () SeekEntryResult!5191)

(declare-datatypes ((array!34956 0))(
  ( (array!34957 (arr!16786 (Array (_ BitVec 32) (_ BitVec 64))) (size!17150 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34956)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34956 (_ BitVec 32)) SeekEntryResult!5191)

(assert (=> b!555155 (= res!347470 (= lt!252205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252203 (select (store (arr!16786 a!3118) i!1132 k0!1914) j!142) (array!34957 (store (arr!16786 a!3118) i!1132 k0!1914) (size!17150 a!3118)) mask!3119)))))

(declare-fun lt!252207 () (_ BitVec 32))

(assert (=> b!555155 (= lt!252205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252207 (select (arr!16786 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555155 (= lt!252203 (toIndex!0 (select (store (arr!16786 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555155 (= lt!252207 (toIndex!0 (select (arr!16786 a!3118) j!142) mask!3119))))

(declare-fun b!555156 () Bool)

(declare-fun res!347469 () Bool)

(assert (=> b!555156 (=> (not res!347469) (not e!320051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34956 (_ BitVec 32)) Bool)

(assert (=> b!555156 (= res!347469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555157 () Bool)

(declare-fun e!320052 () Bool)

(assert (=> b!555157 (= e!320052 e!320051)))

(declare-fun res!347468 () Bool)

(assert (=> b!555157 (=> (not res!347468) (not e!320051))))

(declare-fun lt!252204 () SeekEntryResult!5191)

(assert (=> b!555157 (= res!347468 (or (= lt!252204 (MissingZero!5191 i!1132)) (= lt!252204 (MissingVacant!5191 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34956 (_ BitVec 32)) SeekEntryResult!5191)

(assert (=> b!555157 (= lt!252204 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555158 () Bool)

(declare-fun res!347466 () Bool)

(assert (=> b!555158 (=> (not res!347466) (not e!320052))))

(assert (=> b!555158 (= res!347466 (and (= (size!17150 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17150 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17150 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555159 () Bool)

(declare-fun res!347463 () Bool)

(assert (=> b!555159 (=> (not res!347463) (not e!320052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555159 (= res!347463 (validKeyInArray!0 k0!1914))))

(declare-fun b!555160 () Bool)

(assert (=> b!555160 (= e!320049 (not true))))

(declare-fun lt!252206 () SeekEntryResult!5191)

(get-info :version)

(assert (=> b!555160 (and (= lt!252206 (Found!5191 j!142)) (or (undefined!6003 lt!252205) (not ((_ is Intermediate!5191) lt!252205)) (= (select (arr!16786 a!3118) (index!22993 lt!252205)) (select (arr!16786 a!3118) j!142)) (not (= (select (arr!16786 a!3118) (index!22993 lt!252205)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252206 (MissingZero!5191 (index!22993 lt!252205)))))))

(assert (=> b!555160 (= lt!252206 (seekEntryOrOpen!0 (select (arr!16786 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555160 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17227 0))(
  ( (Unit!17228) )
))
(declare-fun lt!252208 () Unit!17227)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17227)

(assert (=> b!555160 (= lt!252208 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!347464 () Bool)

(assert (=> start!50784 (=> (not res!347464) (not e!320052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50784 (= res!347464 (validMask!0 mask!3119))))

(assert (=> start!50784 e!320052))

(assert (=> start!50784 true))

(declare-fun array_inv!12645 (array!34956) Bool)

(assert (=> start!50784 (array_inv!12645 a!3118)))

(declare-fun b!555161 () Bool)

(declare-fun res!347465 () Bool)

(assert (=> b!555161 (=> (not res!347465) (not e!320051))))

(declare-datatypes ((List!10773 0))(
  ( (Nil!10770) (Cons!10769 (h!11757 (_ BitVec 64)) (t!16993 List!10773)) )
))
(declare-fun arrayNoDuplicates!0 (array!34956 (_ BitVec 32) List!10773) Bool)

(assert (=> b!555161 (= res!347465 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10770))))

(declare-fun b!555162 () Bool)

(declare-fun res!347467 () Bool)

(assert (=> b!555162 (=> (not res!347467) (not e!320052))))

(assert (=> b!555162 (= res!347467 (validKeyInArray!0 (select (arr!16786 a!3118) j!142)))))

(declare-fun b!555163 () Bool)

(declare-fun res!347462 () Bool)

(assert (=> b!555163 (=> (not res!347462) (not e!320052))))

(declare-fun arrayContainsKey!0 (array!34956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555163 (= res!347462 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50784 res!347464) b!555158))

(assert (= (and b!555158 res!347466) b!555162))

(assert (= (and b!555162 res!347467) b!555159))

(assert (= (and b!555159 res!347463) b!555163))

(assert (= (and b!555163 res!347462) b!555157))

(assert (= (and b!555157 res!347468) b!555156))

(assert (= (and b!555156 res!347469) b!555161))

(assert (= (and b!555161 res!347465) b!555155))

(assert (= (and b!555155 res!347470) b!555160))

(declare-fun m!532781 () Bool)

(assert (=> b!555155 m!532781))

(declare-fun m!532783 () Bool)

(assert (=> b!555155 m!532783))

(assert (=> b!555155 m!532781))

(declare-fun m!532785 () Bool)

(assert (=> b!555155 m!532785))

(assert (=> b!555155 m!532781))

(declare-fun m!532787 () Bool)

(assert (=> b!555155 m!532787))

(declare-fun m!532789 () Bool)

(assert (=> b!555155 m!532789))

(assert (=> b!555155 m!532787))

(declare-fun m!532791 () Bool)

(assert (=> b!555155 m!532791))

(assert (=> b!555155 m!532787))

(declare-fun m!532793 () Bool)

(assert (=> b!555155 m!532793))

(declare-fun m!532795 () Bool)

(assert (=> b!555163 m!532795))

(declare-fun m!532797 () Bool)

(assert (=> b!555156 m!532797))

(declare-fun m!532799 () Bool)

(assert (=> b!555157 m!532799))

(declare-fun m!532801 () Bool)

(assert (=> b!555159 m!532801))

(declare-fun m!532803 () Bool)

(assert (=> start!50784 m!532803))

(declare-fun m!532805 () Bool)

(assert (=> start!50784 m!532805))

(assert (=> b!555160 m!532781))

(declare-fun m!532807 () Bool)

(assert (=> b!555160 m!532807))

(declare-fun m!532809 () Bool)

(assert (=> b!555160 m!532809))

(declare-fun m!532811 () Bool)

(assert (=> b!555160 m!532811))

(assert (=> b!555160 m!532781))

(declare-fun m!532813 () Bool)

(assert (=> b!555160 m!532813))

(assert (=> b!555162 m!532781))

(assert (=> b!555162 m!532781))

(declare-fun m!532815 () Bool)

(assert (=> b!555162 m!532815))

(declare-fun m!532817 () Bool)

(assert (=> b!555161 m!532817))

(check-sat (not b!555162) (not start!50784) (not b!555161) (not b!555156) (not b!555160) (not b!555157) (not b!555155) (not b!555159) (not b!555163))
(check-sat)
