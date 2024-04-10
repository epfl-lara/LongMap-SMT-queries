; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51470 () Bool)

(assert start!51470)

(declare-fun b!562818 () Bool)

(declare-fun res!353978 () Bool)

(declare-fun e!324360 () Bool)

(assert (=> b!562818 (=> (not res!353978) (not e!324360))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35335 0))(
  ( (array!35336 (arr!16968 (Array (_ BitVec 32) (_ BitVec 64))) (size!17332 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35335)

(assert (=> b!562818 (= res!353978 (and (= (size!17332 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17332 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17332 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562819 () Bool)

(declare-fun e!324356 () Bool)

(declare-fun e!324357 () Bool)

(assert (=> b!562819 (= e!324356 (not e!324357))))

(declare-fun res!353980 () Bool)

(assert (=> b!562819 (=> res!353980 e!324357)))

(declare-datatypes ((SeekEntryResult!5417 0))(
  ( (MissingZero!5417 (index!23895 (_ BitVec 32))) (Found!5417 (index!23896 (_ BitVec 32))) (Intermediate!5417 (undefined!6229 Bool) (index!23897 (_ BitVec 32)) (x!52792 (_ BitVec 32))) (Undefined!5417) (MissingVacant!5417 (index!23898 (_ BitVec 32))) )
))
(declare-fun lt!256680 () SeekEntryResult!5417)

(assert (=> b!562819 (= res!353980 (or (undefined!6229 lt!256680) (not (is-Intermediate!5417 lt!256680))))))

(declare-fun lt!256685 () SeekEntryResult!5417)

(declare-fun lt!256684 () SeekEntryResult!5417)

(assert (=> b!562819 (= lt!256685 lt!256684)))

(assert (=> b!562819 (= lt!256684 (Found!5417 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35335 (_ BitVec 32)) SeekEntryResult!5417)

(assert (=> b!562819 (= lt!256685 (seekEntryOrOpen!0 (select (arr!16968 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35335 (_ BitVec 32)) Bool)

(assert (=> b!562819 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17608 0))(
  ( (Unit!17609) )
))
(declare-fun lt!256681 () Unit!17608)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17608)

(assert (=> b!562819 (= lt!256681 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562820 () Bool)

(declare-fun e!324354 () Bool)

(declare-fun e!324355 () Bool)

(assert (=> b!562820 (= e!324354 e!324355)))

(declare-fun res!353970 () Bool)

(assert (=> b!562820 (=> res!353970 e!324355)))

(declare-fun lt!256693 () SeekEntryResult!5417)

(declare-fun lt!256692 () (_ BitVec 64))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!562820 (= res!353970 (or (bvslt (index!23897 lt!256680) #b00000000000000000000000000000000) (bvsge (index!23897 lt!256680) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52792 lt!256680) #b01111111111111111111111111111110) (bvslt (x!52792 lt!256680) #b00000000000000000000000000000000) (not (= lt!256692 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16968 a!3118) i!1132 k!1914) (index!23897 lt!256680)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256693 lt!256684))))))

(declare-fun lt!256682 () SeekEntryResult!5417)

(declare-fun lt!256688 () SeekEntryResult!5417)

(assert (=> b!562820 (= lt!256682 lt!256688)))

(declare-fun lt!256690 () (_ BitVec 64))

(declare-fun lt!256687 () array!35335)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35335 (_ BitVec 32)) SeekEntryResult!5417)

(assert (=> b!562820 (= lt!256688 (seekKeyOrZeroReturnVacant!0 (x!52792 lt!256680) (index!23897 lt!256680) (index!23897 lt!256680) lt!256690 lt!256687 mask!3119))))

(assert (=> b!562820 (= lt!256682 (seekEntryOrOpen!0 lt!256690 lt!256687 mask!3119))))

(assert (=> b!562820 (= lt!256685 lt!256693)))

(assert (=> b!562820 (= lt!256693 (seekKeyOrZeroReturnVacant!0 (x!52792 lt!256680) (index!23897 lt!256680) (index!23897 lt!256680) (select (arr!16968 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562821 () Bool)

(declare-fun res!353975 () Bool)

(assert (=> b!562821 (=> (not res!353975) (not e!324360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562821 (= res!353975 (validKeyInArray!0 k!1914))))

(declare-fun b!562822 () Bool)

(declare-fun e!324359 () Bool)

(assert (=> b!562822 (= e!324359 e!324356)))

(declare-fun res!353976 () Bool)

(assert (=> b!562822 (=> (not res!353976) (not e!324356))))

(declare-fun lt!256683 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35335 (_ BitVec 32)) SeekEntryResult!5417)

(assert (=> b!562822 (= res!353976 (= lt!256680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256683 lt!256690 lt!256687 mask!3119)))))

(declare-fun lt!256686 () (_ BitVec 32))

(assert (=> b!562822 (= lt!256680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256686 (select (arr!16968 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562822 (= lt!256683 (toIndex!0 lt!256690 mask!3119))))

(assert (=> b!562822 (= lt!256690 (select (store (arr!16968 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562822 (= lt!256686 (toIndex!0 (select (arr!16968 a!3118) j!142) mask!3119))))

(assert (=> b!562822 (= lt!256687 (array!35336 (store (arr!16968 a!3118) i!1132 k!1914) (size!17332 a!3118)))))

(declare-fun b!562823 () Bool)

(assert (=> b!562823 (= e!324360 e!324359)))

(declare-fun res!353974 () Bool)

(assert (=> b!562823 (=> (not res!353974) (not e!324359))))

(declare-fun lt!256689 () SeekEntryResult!5417)

(assert (=> b!562823 (= res!353974 (or (= lt!256689 (MissingZero!5417 i!1132)) (= lt!256689 (MissingVacant!5417 i!1132))))))

(assert (=> b!562823 (= lt!256689 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562824 () Bool)

(declare-fun res!353977 () Bool)

(assert (=> b!562824 (=> (not res!353977) (not e!324359))))

(declare-datatypes ((List!11048 0))(
  ( (Nil!11045) (Cons!11044 (h!12047 (_ BitVec 64)) (t!17276 List!11048)) )
))
(declare-fun arrayNoDuplicates!0 (array!35335 (_ BitVec 32) List!11048) Bool)

(assert (=> b!562824 (= res!353977 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11045))))

(declare-fun b!562825 () Bool)

(assert (=> b!562825 (= e!324357 e!324354)))

(declare-fun res!353979 () Bool)

(assert (=> b!562825 (=> res!353979 e!324354)))

(assert (=> b!562825 (= res!353979 (or (= lt!256692 (select (arr!16968 a!3118) j!142)) (= lt!256692 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562825 (= lt!256692 (select (arr!16968 a!3118) (index!23897 lt!256680)))))

(declare-fun b!562826 () Bool)

(declare-fun res!353981 () Bool)

(assert (=> b!562826 (=> (not res!353981) (not e!324359))))

(assert (=> b!562826 (= res!353981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562827 () Bool)

(declare-fun res!353972 () Bool)

(assert (=> b!562827 (=> (not res!353972) (not e!324360))))

(assert (=> b!562827 (= res!353972 (validKeyInArray!0 (select (arr!16968 a!3118) j!142)))))

(declare-fun b!562829 () Bool)

(declare-fun res!353973 () Bool)

(assert (=> b!562829 (=> (not res!353973) (not e!324360))))

(declare-fun arrayContainsKey!0 (array!35335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562829 (= res!353973 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!353971 () Bool)

(assert (=> start!51470 (=> (not res!353971) (not e!324360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51470 (= res!353971 (validMask!0 mask!3119))))

(assert (=> start!51470 e!324360))

(assert (=> start!51470 true))

(declare-fun array_inv!12764 (array!35335) Bool)

(assert (=> start!51470 (array_inv!12764 a!3118)))

(declare-fun b!562828 () Bool)

(assert (=> b!562828 (= e!324355 true)))

(assert (=> b!562828 (= lt!256693 lt!256688)))

(declare-fun lt!256691 () Unit!17608)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35335 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17608)

(assert (=> b!562828 (= lt!256691 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52792 lt!256680) (index!23897 lt!256680) (index!23897 lt!256680) mask!3119))))

(assert (= (and start!51470 res!353971) b!562818))

(assert (= (and b!562818 res!353978) b!562827))

(assert (= (and b!562827 res!353972) b!562821))

(assert (= (and b!562821 res!353975) b!562829))

(assert (= (and b!562829 res!353973) b!562823))

(assert (= (and b!562823 res!353974) b!562826))

(assert (= (and b!562826 res!353981) b!562824))

(assert (= (and b!562824 res!353977) b!562822))

(assert (= (and b!562822 res!353976) b!562819))

(assert (= (and b!562819 (not res!353980)) b!562825))

(assert (= (and b!562825 (not res!353979)) b!562820))

(assert (= (and b!562820 (not res!353970)) b!562828))

(declare-fun m!540981 () Bool)

(assert (=> b!562828 m!540981))

(declare-fun m!540983 () Bool)

(assert (=> b!562824 m!540983))

(declare-fun m!540985 () Bool)

(assert (=> b!562826 m!540985))

(declare-fun m!540987 () Bool)

(assert (=> b!562825 m!540987))

(declare-fun m!540989 () Bool)

(assert (=> b!562825 m!540989))

(assert (=> b!562819 m!540987))

(assert (=> b!562819 m!540987))

(declare-fun m!540991 () Bool)

(assert (=> b!562819 m!540991))

(declare-fun m!540993 () Bool)

(assert (=> b!562819 m!540993))

(declare-fun m!540995 () Bool)

(assert (=> b!562819 m!540995))

(declare-fun m!540997 () Bool)

(assert (=> b!562829 m!540997))

(declare-fun m!540999 () Bool)

(assert (=> b!562821 m!540999))

(assert (=> b!562820 m!540987))

(declare-fun m!541001 () Bool)

(assert (=> b!562820 m!541001))

(declare-fun m!541003 () Bool)

(assert (=> b!562820 m!541003))

(declare-fun m!541005 () Bool)

(assert (=> b!562820 m!541005))

(assert (=> b!562820 m!540987))

(declare-fun m!541007 () Bool)

(assert (=> b!562820 m!541007))

(declare-fun m!541009 () Bool)

(assert (=> b!562820 m!541009))

(assert (=> b!562822 m!540987))

(declare-fun m!541011 () Bool)

(assert (=> b!562822 m!541011))

(declare-fun m!541013 () Bool)

(assert (=> b!562822 m!541013))

(assert (=> b!562822 m!540987))

(declare-fun m!541015 () Bool)

(assert (=> b!562822 m!541015))

(declare-fun m!541017 () Bool)

(assert (=> b!562822 m!541017))

(assert (=> b!562822 m!540987))

(declare-fun m!541019 () Bool)

(assert (=> b!562822 m!541019))

(assert (=> b!562822 m!541009))

(declare-fun m!541021 () Bool)

(assert (=> b!562823 m!541021))

(assert (=> b!562827 m!540987))

(assert (=> b!562827 m!540987))

(declare-fun m!541023 () Bool)

(assert (=> b!562827 m!541023))

(declare-fun m!541025 () Bool)

(assert (=> start!51470 m!541025))

(declare-fun m!541027 () Bool)

(assert (=> start!51470 m!541027))

(push 1)

