; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50732 () Bool)

(assert start!50732)

(declare-fun b!554765 () Bool)

(declare-fun res!347324 () Bool)

(declare-fun e!319782 () Bool)

(assert (=> b!554765 (=> (not res!347324) (not e!319782))))

(declare-datatypes ((array!34966 0))(
  ( (array!34967 (arr!16793 (Array (_ BitVec 32) (_ BitVec 64))) (size!17158 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34966)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34966 (_ BitVec 32)) Bool)

(assert (=> b!554765 (= res!347324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554766 () Bool)

(declare-fun res!347320 () Bool)

(declare-fun e!319784 () Bool)

(assert (=> b!554766 (=> (not res!347320) (not e!319784))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554766 (= res!347320 (validKeyInArray!0 (select (arr!16793 a!3118) j!142)))))

(declare-fun b!554767 () Bool)

(assert (=> b!554767 (= e!319784 e!319782)))

(declare-fun res!347322 () Bool)

(assert (=> b!554767 (=> (not res!347322) (not e!319782))))

(declare-datatypes ((SeekEntryResult!5239 0))(
  ( (MissingZero!5239 (index!23183 (_ BitVec 32))) (Found!5239 (index!23184 (_ BitVec 32))) (Intermediate!5239 (undefined!6051 Bool) (index!23185 (_ BitVec 32)) (x!52100 (_ BitVec 32))) (Undefined!5239) (MissingVacant!5239 (index!23186 (_ BitVec 32))) )
))
(declare-fun lt!251912 () SeekEntryResult!5239)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554767 (= res!347322 (or (= lt!251912 (MissingZero!5239 i!1132)) (= lt!251912 (MissingVacant!5239 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34966 (_ BitVec 32)) SeekEntryResult!5239)

(assert (=> b!554767 (= lt!251912 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554768 () Bool)

(declare-fun res!347327 () Bool)

(assert (=> b!554768 (=> (not res!347327) (not e!319784))))

(declare-fun arrayContainsKey!0 (array!34966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554768 (= res!347327 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!347319 () Bool)

(assert (=> start!50732 (=> (not res!347319) (not e!319784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50732 (= res!347319 (validMask!0 mask!3119))))

(assert (=> start!50732 e!319784))

(assert (=> start!50732 true))

(declare-fun array_inv!12676 (array!34966) Bool)

(assert (=> start!50732 (array_inv!12676 a!3118)))

(declare-fun b!554769 () Bool)

(declare-fun res!347326 () Bool)

(assert (=> b!554769 (=> (not res!347326) (not e!319782))))

(declare-datatypes ((List!10912 0))(
  ( (Nil!10909) (Cons!10908 (h!11893 (_ BitVec 64)) (t!17131 List!10912)) )
))
(declare-fun arrayNoDuplicates!0 (array!34966 (_ BitVec 32) List!10912) Bool)

(assert (=> b!554769 (= res!347326 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10909))))

(declare-fun b!554770 () Bool)

(declare-fun res!347323 () Bool)

(assert (=> b!554770 (=> (not res!347323) (not e!319784))))

(assert (=> b!554770 (= res!347323 (validKeyInArray!0 k0!1914))))

(declare-fun b!554771 () Bool)

(declare-fun e!319783 () Bool)

(assert (=> b!554771 (= e!319783 (not true))))

(declare-fun lt!251916 () SeekEntryResult!5239)

(declare-fun lt!251914 () SeekEntryResult!5239)

(get-info :version)

(assert (=> b!554771 (and (= lt!251916 (Found!5239 j!142)) (or (undefined!6051 lt!251914) (not ((_ is Intermediate!5239) lt!251914)) (= (select (arr!16793 a!3118) (index!23185 lt!251914)) (select (arr!16793 a!3118) j!142)) (not (= (select (arr!16793 a!3118) (index!23185 lt!251914)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251916 (MissingZero!5239 (index!23185 lt!251914)))))))

(assert (=> b!554771 (= lt!251916 (seekEntryOrOpen!0 (select (arr!16793 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554771 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17238 0))(
  ( (Unit!17239) )
))
(declare-fun lt!251915 () Unit!17238)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17238)

(assert (=> b!554771 (= lt!251915 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554772 () Bool)

(declare-fun res!347325 () Bool)

(assert (=> b!554772 (=> (not res!347325) (not e!319784))))

(assert (=> b!554772 (= res!347325 (and (= (size!17158 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17158 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17158 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554773 () Bool)

(assert (=> b!554773 (= e!319782 e!319783)))

(declare-fun res!347321 () Bool)

(assert (=> b!554773 (=> (not res!347321) (not e!319783))))

(declare-fun lt!251917 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34966 (_ BitVec 32)) SeekEntryResult!5239)

(assert (=> b!554773 (= res!347321 (= lt!251914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251917 (select (store (arr!16793 a!3118) i!1132 k0!1914) j!142) (array!34967 (store (arr!16793 a!3118) i!1132 k0!1914) (size!17158 a!3118)) mask!3119)))))

(declare-fun lt!251913 () (_ BitVec 32))

(assert (=> b!554773 (= lt!251914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251913 (select (arr!16793 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554773 (= lt!251917 (toIndex!0 (select (store (arr!16793 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554773 (= lt!251913 (toIndex!0 (select (arr!16793 a!3118) j!142) mask!3119))))

(assert (= (and start!50732 res!347319) b!554772))

(assert (= (and b!554772 res!347325) b!554766))

(assert (= (and b!554766 res!347320) b!554770))

(assert (= (and b!554770 res!347323) b!554768))

(assert (= (and b!554768 res!347327) b!554767))

(assert (= (and b!554767 res!347322) b!554765))

(assert (= (and b!554765 res!347324) b!554769))

(assert (= (and b!554769 res!347326) b!554773))

(assert (= (and b!554773 res!347321) b!554771))

(declare-fun m!531785 () Bool)

(assert (=> b!554773 m!531785))

(declare-fun m!531787 () Bool)

(assert (=> b!554773 m!531787))

(assert (=> b!554773 m!531785))

(declare-fun m!531789 () Bool)

(assert (=> b!554773 m!531789))

(assert (=> b!554773 m!531785))

(declare-fun m!531791 () Bool)

(assert (=> b!554773 m!531791))

(declare-fun m!531793 () Bool)

(assert (=> b!554773 m!531793))

(assert (=> b!554773 m!531791))

(declare-fun m!531795 () Bool)

(assert (=> b!554773 m!531795))

(assert (=> b!554773 m!531791))

(declare-fun m!531797 () Bool)

(assert (=> b!554773 m!531797))

(declare-fun m!531799 () Bool)

(assert (=> b!554770 m!531799))

(declare-fun m!531801 () Bool)

(assert (=> b!554765 m!531801))

(assert (=> b!554766 m!531785))

(assert (=> b!554766 m!531785))

(declare-fun m!531803 () Bool)

(assert (=> b!554766 m!531803))

(declare-fun m!531805 () Bool)

(assert (=> b!554768 m!531805))

(declare-fun m!531807 () Bool)

(assert (=> b!554767 m!531807))

(declare-fun m!531809 () Bool)

(assert (=> b!554771 m!531809))

(assert (=> b!554771 m!531785))

(declare-fun m!531811 () Bool)

(assert (=> b!554771 m!531811))

(declare-fun m!531813 () Bool)

(assert (=> b!554771 m!531813))

(assert (=> b!554771 m!531785))

(declare-fun m!531815 () Bool)

(assert (=> b!554771 m!531815))

(declare-fun m!531817 () Bool)

(assert (=> start!50732 m!531817))

(declare-fun m!531819 () Bool)

(assert (=> start!50732 m!531819))

(declare-fun m!531821 () Bool)

(assert (=> b!554769 m!531821))

(check-sat (not b!554769) (not b!554773) (not b!554765) (not b!554770) (not b!554771) (not b!554768) (not b!554766) (not b!554767) (not start!50732))
(check-sat)
