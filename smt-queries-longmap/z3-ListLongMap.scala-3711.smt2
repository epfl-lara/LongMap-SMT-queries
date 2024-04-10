; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51064 () Bool)

(assert start!51064)

(declare-datatypes ((SeekEntryResult!5313 0))(
  ( (MissingZero!5313 (index!23479 (_ BitVec 32))) (Found!5313 (index!23480 (_ BitVec 32))) (Intermediate!5313 (undefined!6125 Bool) (index!23481 (_ BitVec 32)) (x!52381 (_ BitVec 32))) (Undefined!5313) (MissingVacant!5313 (index!23482 (_ BitVec 32))) )
))
(declare-fun lt!253496 () SeekEntryResult!5313)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!253497 () SeekEntryResult!5313)

(declare-fun b!557917 () Bool)

(declare-fun e!321414 () Bool)

(declare-datatypes ((array!35118 0))(
  ( (array!35119 (arr!16864 (Array (_ BitVec 32) (_ BitVec 64))) (size!17228 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35118)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35118 (_ BitVec 32)) SeekEntryResult!5313)

(assert (=> b!557917 (= e!321414 (= lt!253496 (seekKeyOrZeroReturnVacant!0 (x!52381 lt!253497) (index!23481 lt!253497) (index!23481 lt!253497) (select (arr!16864 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!557918 () Bool)

(declare-fun res!349784 () Bool)

(declare-fun e!321409 () Bool)

(assert (=> b!557918 (=> (not res!349784) (not e!321409))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557918 (= res!349784 (and (= (size!17228 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17228 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17228 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557919 () Bool)

(declare-fun e!321411 () Bool)

(assert (=> b!557919 (= e!321411 e!321414)))

(declare-fun res!349786 () Bool)

(assert (=> b!557919 (=> res!349786 e!321414)))

(get-info :version)

(assert (=> b!557919 (= res!349786 (or (undefined!6125 lt!253497) (not ((_ is Intermediate!5313) lt!253497)) (= (select (arr!16864 a!3118) (index!23481 lt!253497)) (select (arr!16864 a!3118) j!142)) (= (select (arr!16864 a!3118) (index!23481 lt!253497)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557920 () Bool)

(declare-fun e!321412 () Bool)

(assert (=> b!557920 (= e!321412 (not true))))

(assert (=> b!557920 e!321411))

(declare-fun res!349788 () Bool)

(assert (=> b!557920 (=> (not res!349788) (not e!321411))))

(assert (=> b!557920 (= res!349788 (= lt!253496 (Found!5313 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35118 (_ BitVec 32)) SeekEntryResult!5313)

(assert (=> b!557920 (= lt!253496 (seekEntryOrOpen!0 (select (arr!16864 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35118 (_ BitVec 32)) Bool)

(assert (=> b!557920 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17400 0))(
  ( (Unit!17401) )
))
(declare-fun lt!253500 () Unit!17400)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17400)

(assert (=> b!557920 (= lt!253500 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557921 () Bool)

(declare-fun res!349783 () Bool)

(assert (=> b!557921 (=> (not res!349783) (not e!321409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557921 (= res!349783 (validKeyInArray!0 (select (arr!16864 a!3118) j!142)))))

(declare-fun b!557922 () Bool)

(declare-fun e!321410 () Bool)

(assert (=> b!557922 (= e!321410 e!321412)))

(declare-fun res!349785 () Bool)

(assert (=> b!557922 (=> (not res!349785) (not e!321412))))

(declare-fun lt!253498 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35118 (_ BitVec 32)) SeekEntryResult!5313)

(assert (=> b!557922 (= res!349785 (= lt!253497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253498 (select (store (arr!16864 a!3118) i!1132 k0!1914) j!142) (array!35119 (store (arr!16864 a!3118) i!1132 k0!1914) (size!17228 a!3118)) mask!3119)))))

(declare-fun lt!253499 () (_ BitVec 32))

(assert (=> b!557922 (= lt!253497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253499 (select (arr!16864 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557922 (= lt!253498 (toIndex!0 (select (store (arr!16864 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!557922 (= lt!253499 (toIndex!0 (select (arr!16864 a!3118) j!142) mask!3119))))

(declare-fun b!557923 () Bool)

(declare-fun res!349782 () Bool)

(assert (=> b!557923 (=> (not res!349782) (not e!321409))))

(declare-fun arrayContainsKey!0 (array!35118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557923 (= res!349782 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557925 () Bool)

(assert (=> b!557925 (= e!321409 e!321410)))

(declare-fun res!349781 () Bool)

(assert (=> b!557925 (=> (not res!349781) (not e!321410))))

(declare-fun lt!253501 () SeekEntryResult!5313)

(assert (=> b!557925 (= res!349781 (or (= lt!253501 (MissingZero!5313 i!1132)) (= lt!253501 (MissingVacant!5313 i!1132))))))

(assert (=> b!557925 (= lt!253501 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557926 () Bool)

(declare-fun res!349790 () Bool)

(assert (=> b!557926 (=> (not res!349790) (not e!321410))))

(declare-datatypes ((List!10944 0))(
  ( (Nil!10941) (Cons!10940 (h!11934 (_ BitVec 64)) (t!17172 List!10944)) )
))
(declare-fun arrayNoDuplicates!0 (array!35118 (_ BitVec 32) List!10944) Bool)

(assert (=> b!557926 (= res!349790 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10941))))

(declare-fun b!557927 () Bool)

(declare-fun res!349789 () Bool)

(assert (=> b!557927 (=> (not res!349789) (not e!321409))))

(assert (=> b!557927 (= res!349789 (validKeyInArray!0 k0!1914))))

(declare-fun res!349787 () Bool)

(assert (=> start!51064 (=> (not res!349787) (not e!321409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51064 (= res!349787 (validMask!0 mask!3119))))

(assert (=> start!51064 e!321409))

(assert (=> start!51064 true))

(declare-fun array_inv!12660 (array!35118) Bool)

(assert (=> start!51064 (array_inv!12660 a!3118)))

(declare-fun b!557924 () Bool)

(declare-fun res!349780 () Bool)

(assert (=> b!557924 (=> (not res!349780) (not e!321410))))

(assert (=> b!557924 (= res!349780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51064 res!349787) b!557918))

(assert (= (and b!557918 res!349784) b!557921))

(assert (= (and b!557921 res!349783) b!557927))

(assert (= (and b!557927 res!349789) b!557923))

(assert (= (and b!557923 res!349782) b!557925))

(assert (= (and b!557925 res!349781) b!557924))

(assert (= (and b!557924 res!349780) b!557926))

(assert (= (and b!557926 res!349790) b!557922))

(assert (= (and b!557922 res!349785) b!557920))

(assert (= (and b!557920 res!349788) b!557919))

(assert (= (and b!557919 (not res!349786)) b!557917))

(declare-fun m!535789 () Bool)

(assert (=> b!557924 m!535789))

(declare-fun m!535791 () Bool)

(assert (=> b!557927 m!535791))

(declare-fun m!535793 () Bool)

(assert (=> start!51064 m!535793))

(declare-fun m!535795 () Bool)

(assert (=> start!51064 m!535795))

(declare-fun m!535797 () Bool)

(assert (=> b!557917 m!535797))

(assert (=> b!557917 m!535797))

(declare-fun m!535799 () Bool)

(assert (=> b!557917 m!535799))

(assert (=> b!557920 m!535797))

(assert (=> b!557920 m!535797))

(declare-fun m!535801 () Bool)

(assert (=> b!557920 m!535801))

(declare-fun m!535803 () Bool)

(assert (=> b!557920 m!535803))

(declare-fun m!535805 () Bool)

(assert (=> b!557920 m!535805))

(declare-fun m!535807 () Bool)

(assert (=> b!557923 m!535807))

(declare-fun m!535809 () Bool)

(assert (=> b!557922 m!535809))

(declare-fun m!535811 () Bool)

(assert (=> b!557922 m!535811))

(assert (=> b!557922 m!535797))

(declare-fun m!535813 () Bool)

(assert (=> b!557922 m!535813))

(assert (=> b!557922 m!535797))

(assert (=> b!557922 m!535797))

(declare-fun m!535815 () Bool)

(assert (=> b!557922 m!535815))

(assert (=> b!557922 m!535809))

(declare-fun m!535817 () Bool)

(assert (=> b!557922 m!535817))

(assert (=> b!557922 m!535809))

(declare-fun m!535819 () Bool)

(assert (=> b!557922 m!535819))

(declare-fun m!535821 () Bool)

(assert (=> b!557919 m!535821))

(assert (=> b!557919 m!535797))

(declare-fun m!535823 () Bool)

(assert (=> b!557926 m!535823))

(declare-fun m!535825 () Bool)

(assert (=> b!557925 m!535825))

(assert (=> b!557921 m!535797))

(assert (=> b!557921 m!535797))

(declare-fun m!535827 () Bool)

(assert (=> b!557921 m!535827))

(check-sat (not b!557925) (not b!557924) (not b!557922) (not b!557920) (not b!557921) (not b!557926) (not b!557923) (not start!51064) (not b!557917) (not b!557927))
(check-sat)
