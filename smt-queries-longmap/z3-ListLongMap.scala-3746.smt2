; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51472 () Bool)

(assert start!51472)

(declare-fun res!354015 () Bool)

(declare-fun e!324381 () Bool)

(assert (=> start!51472 (=> (not res!354015) (not e!324381))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51472 (= res!354015 (validMask!0 mask!3119))))

(assert (=> start!51472 e!324381))

(assert (=> start!51472 true))

(declare-datatypes ((array!35337 0))(
  ( (array!35338 (arr!16969 (Array (_ BitVec 32) (_ BitVec 64))) (size!17333 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35337)

(declare-fun array_inv!12765 (array!35337) Bool)

(assert (=> start!51472 (array_inv!12765 a!3118)))

(declare-fun b!562854 () Bool)

(declare-fun e!324378 () Bool)

(declare-fun e!324375 () Bool)

(assert (=> b!562854 (= e!324378 e!324375)))

(declare-fun res!354010 () Bool)

(assert (=> b!562854 (=> res!354010 e!324375)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!256735 () (_ BitVec 64))

(assert (=> b!562854 (= res!354010 (or (= lt!256735 (select (arr!16969 a!3118) j!142)) (= lt!256735 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5418 0))(
  ( (MissingZero!5418 (index!23899 (_ BitVec 32))) (Found!5418 (index!23900 (_ BitVec 32))) (Intermediate!5418 (undefined!6230 Bool) (index!23901 (_ BitVec 32)) (x!52793 (_ BitVec 32))) (Undefined!5418) (MissingVacant!5418 (index!23902 (_ BitVec 32))) )
))
(declare-fun lt!256729 () SeekEntryResult!5418)

(assert (=> b!562854 (= lt!256735 (select (arr!16969 a!3118) (index!23901 lt!256729)))))

(declare-fun b!562855 () Bool)

(declare-fun res!354016 () Bool)

(assert (=> b!562855 (=> (not res!354016) (not e!324381))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562855 (= res!354016 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562856 () Bool)

(declare-fun e!324380 () Bool)

(declare-fun e!324376 () Bool)

(assert (=> b!562856 (= e!324380 e!324376)))

(declare-fun res!354009 () Bool)

(assert (=> b!562856 (=> (not res!354009) (not e!324376))))

(declare-fun lt!256734 () (_ BitVec 64))

(declare-fun lt!256725 () (_ BitVec 32))

(declare-fun lt!256731 () array!35337)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35337 (_ BitVec 32)) SeekEntryResult!5418)

(assert (=> b!562856 (= res!354009 (= lt!256729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256725 lt!256734 lt!256731 mask!3119)))))

(declare-fun lt!256730 () (_ BitVec 32))

(assert (=> b!562856 (= lt!256729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256730 (select (arr!16969 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562856 (= lt!256725 (toIndex!0 lt!256734 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562856 (= lt!256734 (select (store (arr!16969 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562856 (= lt!256730 (toIndex!0 (select (arr!16969 a!3118) j!142) mask!3119))))

(assert (=> b!562856 (= lt!256731 (array!35338 (store (arr!16969 a!3118) i!1132 k0!1914) (size!17333 a!3118)))))

(declare-fun b!562857 () Bool)

(declare-fun res!354006 () Bool)

(assert (=> b!562857 (=> (not res!354006) (not e!324381))))

(assert (=> b!562857 (= res!354006 (and (= (size!17333 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17333 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17333 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562858 () Bool)

(declare-fun res!354013 () Bool)

(assert (=> b!562858 (=> (not res!354013) (not e!324381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562858 (= res!354013 (validKeyInArray!0 (select (arr!16969 a!3118) j!142)))))

(declare-fun b!562859 () Bool)

(declare-fun res!354008 () Bool)

(assert (=> b!562859 (=> (not res!354008) (not e!324381))))

(assert (=> b!562859 (= res!354008 (validKeyInArray!0 k0!1914))))

(declare-fun b!562860 () Bool)

(assert (=> b!562860 (= e!324381 e!324380)))

(declare-fun res!354011 () Bool)

(assert (=> b!562860 (=> (not res!354011) (not e!324380))))

(declare-fun lt!256727 () SeekEntryResult!5418)

(assert (=> b!562860 (= res!354011 (or (= lt!256727 (MissingZero!5418 i!1132)) (= lt!256727 (MissingVacant!5418 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35337 (_ BitVec 32)) SeekEntryResult!5418)

(assert (=> b!562860 (= lt!256727 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562861 () Bool)

(declare-fun res!354014 () Bool)

(assert (=> b!562861 (=> (not res!354014) (not e!324380))))

(declare-datatypes ((List!11049 0))(
  ( (Nil!11046) (Cons!11045 (h!12048 (_ BitVec 64)) (t!17277 List!11049)) )
))
(declare-fun arrayNoDuplicates!0 (array!35337 (_ BitVec 32) List!11049) Bool)

(assert (=> b!562861 (= res!354014 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11046))))

(declare-fun b!562862 () Bool)

(declare-fun e!324379 () Bool)

(assert (=> b!562862 (= e!324375 e!324379)))

(declare-fun res!354007 () Bool)

(assert (=> b!562862 (=> res!354007 e!324379)))

(declare-fun lt!256723 () SeekEntryResult!5418)

(declare-fun lt!256724 () SeekEntryResult!5418)

(assert (=> b!562862 (= res!354007 (or (bvslt (index!23901 lt!256729) #b00000000000000000000000000000000) (bvsge (index!23901 lt!256729) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52793 lt!256729) #b01111111111111111111111111111110) (bvslt (x!52793 lt!256729) #b00000000000000000000000000000000) (not (= lt!256735 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16969 a!3118) i!1132 k0!1914) (index!23901 lt!256729)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256724 lt!256723))))))

(declare-fun lt!256728 () SeekEntryResult!5418)

(declare-fun lt!256733 () SeekEntryResult!5418)

(assert (=> b!562862 (= lt!256728 lt!256733)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35337 (_ BitVec 32)) SeekEntryResult!5418)

(assert (=> b!562862 (= lt!256733 (seekKeyOrZeroReturnVacant!0 (x!52793 lt!256729) (index!23901 lt!256729) (index!23901 lt!256729) lt!256734 lt!256731 mask!3119))))

(assert (=> b!562862 (= lt!256728 (seekEntryOrOpen!0 lt!256734 lt!256731 mask!3119))))

(declare-fun lt!256732 () SeekEntryResult!5418)

(assert (=> b!562862 (= lt!256732 lt!256724)))

(assert (=> b!562862 (= lt!256724 (seekKeyOrZeroReturnVacant!0 (x!52793 lt!256729) (index!23901 lt!256729) (index!23901 lt!256729) (select (arr!16969 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562863 () Bool)

(assert (=> b!562863 (= e!324379 true)))

(assert (=> b!562863 (= lt!256724 lt!256733)))

(declare-datatypes ((Unit!17610 0))(
  ( (Unit!17611) )
))
(declare-fun lt!256722 () Unit!17610)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17610)

(assert (=> b!562863 (= lt!256722 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52793 lt!256729) (index!23901 lt!256729) (index!23901 lt!256729) mask!3119))))

(declare-fun b!562864 () Bool)

(assert (=> b!562864 (= e!324376 (not e!324378))))

(declare-fun res!354017 () Bool)

(assert (=> b!562864 (=> res!354017 e!324378)))

(get-info :version)

(assert (=> b!562864 (= res!354017 (or (undefined!6230 lt!256729) (not ((_ is Intermediate!5418) lt!256729))))))

(assert (=> b!562864 (= lt!256732 lt!256723)))

(assert (=> b!562864 (= lt!256723 (Found!5418 j!142))))

(assert (=> b!562864 (= lt!256732 (seekEntryOrOpen!0 (select (arr!16969 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35337 (_ BitVec 32)) Bool)

(assert (=> b!562864 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256726 () Unit!17610)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17610)

(assert (=> b!562864 (= lt!256726 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562865 () Bool)

(declare-fun res!354012 () Bool)

(assert (=> b!562865 (=> (not res!354012) (not e!324380))))

(assert (=> b!562865 (= res!354012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51472 res!354015) b!562857))

(assert (= (and b!562857 res!354006) b!562858))

(assert (= (and b!562858 res!354013) b!562859))

(assert (= (and b!562859 res!354008) b!562855))

(assert (= (and b!562855 res!354016) b!562860))

(assert (= (and b!562860 res!354011) b!562865))

(assert (= (and b!562865 res!354012) b!562861))

(assert (= (and b!562861 res!354014) b!562856))

(assert (= (and b!562856 res!354009) b!562864))

(assert (= (and b!562864 (not res!354017)) b!562854))

(assert (= (and b!562854 (not res!354010)) b!562862))

(assert (= (and b!562862 (not res!354007)) b!562863))

(declare-fun m!541029 () Bool)

(assert (=> b!562856 m!541029))

(declare-fun m!541031 () Bool)

(assert (=> b!562856 m!541031))

(declare-fun m!541033 () Bool)

(assert (=> b!562856 m!541033))

(declare-fun m!541035 () Bool)

(assert (=> b!562856 m!541035))

(assert (=> b!562856 m!541031))

(declare-fun m!541037 () Bool)

(assert (=> b!562856 m!541037))

(declare-fun m!541039 () Bool)

(assert (=> b!562856 m!541039))

(declare-fun m!541041 () Bool)

(assert (=> b!562856 m!541041))

(assert (=> b!562856 m!541031))

(declare-fun m!541043 () Bool)

(assert (=> b!562865 m!541043))

(assert (=> b!562858 m!541031))

(assert (=> b!562858 m!541031))

(declare-fun m!541045 () Bool)

(assert (=> b!562858 m!541045))

(declare-fun m!541047 () Bool)

(assert (=> b!562860 m!541047))

(assert (=> b!562854 m!541031))

(declare-fun m!541049 () Bool)

(assert (=> b!562854 m!541049))

(declare-fun m!541051 () Bool)

(assert (=> b!562859 m!541051))

(declare-fun m!541053 () Bool)

(assert (=> start!51472 m!541053))

(declare-fun m!541055 () Bool)

(assert (=> start!51472 m!541055))

(declare-fun m!541057 () Bool)

(assert (=> b!562862 m!541057))

(declare-fun m!541059 () Bool)

(assert (=> b!562862 m!541059))

(assert (=> b!562862 m!541031))

(declare-fun m!541061 () Bool)

(assert (=> b!562862 m!541061))

(assert (=> b!562862 m!541035))

(declare-fun m!541063 () Bool)

(assert (=> b!562862 m!541063))

(assert (=> b!562862 m!541031))

(declare-fun m!541065 () Bool)

(assert (=> b!562861 m!541065))

(declare-fun m!541067 () Bool)

(assert (=> b!562855 m!541067))

(assert (=> b!562864 m!541031))

(assert (=> b!562864 m!541031))

(declare-fun m!541069 () Bool)

(assert (=> b!562864 m!541069))

(declare-fun m!541071 () Bool)

(assert (=> b!562864 m!541071))

(declare-fun m!541073 () Bool)

(assert (=> b!562864 m!541073))

(declare-fun m!541075 () Bool)

(assert (=> b!562863 m!541075))

(check-sat (not b!562860) (not b!562863) (not b!562864) (not start!51472) (not b!562856) (not b!562858) (not b!562855) (not b!562865) (not b!562862) (not b!562861) (not b!562859))
(check-sat)
