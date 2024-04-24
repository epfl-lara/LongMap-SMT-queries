; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51504 () Bool)

(assert start!51504)

(declare-fun b!562802 () Bool)

(declare-fun e!324362 () Bool)

(declare-fun e!324357 () Bool)

(assert (=> b!562802 (= e!324362 e!324357)))

(declare-fun res!353849 () Bool)

(assert (=> b!562802 (=> res!353849 e!324357)))

(declare-datatypes ((SeekEntryResult!5362 0))(
  ( (MissingZero!5362 (index!23675 (_ BitVec 32))) (Found!5362 (index!23676 (_ BitVec 32))) (Intermediate!5362 (undefined!6174 Bool) (index!23677 (_ BitVec 32)) (x!52724 (_ BitVec 32))) (Undefined!5362) (MissingVacant!5362 (index!23678 (_ BitVec 32))) )
))
(declare-fun lt!256544 () SeekEntryResult!5362)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!256551 () (_ BitVec 64))

(declare-fun lt!256550 () SeekEntryResult!5362)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!256541 () SeekEntryResult!5362)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35316 0))(
  ( (array!35317 (arr!16957 (Array (_ BitVec 32) (_ BitVec 64))) (size!17321 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35316)

(assert (=> b!562802 (= res!353849 (or (bvslt (index!23677 lt!256541) #b00000000000000000000000000000000) (bvsge (index!23677 lt!256541) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52724 lt!256541) #b01111111111111111111111111111110) (bvslt (x!52724 lt!256541) #b00000000000000000000000000000000) (not (= lt!256551 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16957 a!3118) i!1132 k0!1914) (index!23677 lt!256541)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256550 lt!256544))))))

(declare-fun lt!256542 () SeekEntryResult!5362)

(declare-fun lt!256539 () SeekEntryResult!5362)

(assert (=> b!562802 (= lt!256542 lt!256539)))

(declare-fun lt!256548 () array!35316)

(declare-fun lt!256546 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35316 (_ BitVec 32)) SeekEntryResult!5362)

(assert (=> b!562802 (= lt!256539 (seekKeyOrZeroReturnVacant!0 (x!52724 lt!256541) (index!23677 lt!256541) (index!23677 lt!256541) lt!256546 lt!256548 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35316 (_ BitVec 32)) SeekEntryResult!5362)

(assert (=> b!562802 (= lt!256542 (seekEntryOrOpen!0 lt!256546 lt!256548 mask!3119))))

(declare-fun lt!256549 () SeekEntryResult!5362)

(assert (=> b!562802 (= lt!256549 lt!256550)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562802 (= lt!256550 (seekKeyOrZeroReturnVacant!0 (x!52724 lt!256541) (index!23677 lt!256541) (index!23677 lt!256541) (select (arr!16957 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562803 () Bool)

(declare-fun res!353859 () Bool)

(declare-fun e!324358 () Bool)

(assert (=> b!562803 (=> (not res!353859) (not e!324358))))

(assert (=> b!562803 (= res!353859 (and (= (size!17321 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17321 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17321 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562804 () Bool)

(declare-fun res!353856 () Bool)

(declare-fun e!324359 () Bool)

(assert (=> b!562804 (=> (not res!353856) (not e!324359))))

(declare-datatypes ((List!10944 0))(
  ( (Nil!10941) (Cons!10940 (h!11946 (_ BitVec 64)) (t!17164 List!10944)) )
))
(declare-fun arrayNoDuplicates!0 (array!35316 (_ BitVec 32) List!10944) Bool)

(assert (=> b!562804 (= res!353856 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10941))))

(declare-fun b!562805 () Bool)

(assert (=> b!562805 (= e!324357 true)))

(assert (=> b!562805 (= lt!256550 lt!256539)))

(declare-datatypes ((Unit!17569 0))(
  ( (Unit!17570) )
))
(declare-fun lt!256540 () Unit!17569)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35316 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17569)

(assert (=> b!562805 (= lt!256540 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52724 lt!256541) (index!23677 lt!256541) (index!23677 lt!256541) mask!3119))))

(declare-fun b!562806 () Bool)

(declare-fun res!353850 () Bool)

(assert (=> b!562806 (=> (not res!353850) (not e!324358))))

(declare-fun arrayContainsKey!0 (array!35316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562806 (= res!353850 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562807 () Bool)

(declare-fun res!353855 () Bool)

(assert (=> b!562807 (=> (not res!353855) (not e!324358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562807 (= res!353855 (validKeyInArray!0 k0!1914))))

(declare-fun b!562808 () Bool)

(declare-fun e!324361 () Bool)

(declare-fun e!324360 () Bool)

(assert (=> b!562808 (= e!324361 (not e!324360))))

(declare-fun res!353860 () Bool)

(assert (=> b!562808 (=> res!353860 e!324360)))

(get-info :version)

(assert (=> b!562808 (= res!353860 (or (undefined!6174 lt!256541) (not ((_ is Intermediate!5362) lt!256541))))))

(assert (=> b!562808 (= lt!256549 lt!256544)))

(assert (=> b!562808 (= lt!256544 (Found!5362 j!142))))

(assert (=> b!562808 (= lt!256549 (seekEntryOrOpen!0 (select (arr!16957 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35316 (_ BitVec 32)) Bool)

(assert (=> b!562808 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256543 () Unit!17569)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17569)

(assert (=> b!562808 (= lt!256543 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562809 () Bool)

(assert (=> b!562809 (= e!324358 e!324359)))

(declare-fun res!353857 () Bool)

(assert (=> b!562809 (=> (not res!353857) (not e!324359))))

(declare-fun lt!256545 () SeekEntryResult!5362)

(assert (=> b!562809 (= res!353857 (or (= lt!256545 (MissingZero!5362 i!1132)) (= lt!256545 (MissingVacant!5362 i!1132))))))

(assert (=> b!562809 (= lt!256545 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562811 () Bool)

(declare-fun res!353852 () Bool)

(assert (=> b!562811 (=> (not res!353852) (not e!324358))))

(assert (=> b!562811 (= res!353852 (validKeyInArray!0 (select (arr!16957 a!3118) j!142)))))

(declare-fun res!353854 () Bool)

(assert (=> start!51504 (=> (not res!353854) (not e!324358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51504 (= res!353854 (validMask!0 mask!3119))))

(assert (=> start!51504 e!324358))

(assert (=> start!51504 true))

(declare-fun array_inv!12816 (array!35316) Bool)

(assert (=> start!51504 (array_inv!12816 a!3118)))

(declare-fun b!562810 () Bool)

(declare-fun res!353851 () Bool)

(assert (=> b!562810 (=> (not res!353851) (not e!324359))))

(assert (=> b!562810 (= res!353851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562812 () Bool)

(assert (=> b!562812 (= e!324359 e!324361)))

(declare-fun res!353853 () Bool)

(assert (=> b!562812 (=> (not res!353853) (not e!324361))))

(declare-fun lt!256552 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35316 (_ BitVec 32)) SeekEntryResult!5362)

(assert (=> b!562812 (= res!353853 (= lt!256541 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256552 lt!256546 lt!256548 mask!3119)))))

(declare-fun lt!256547 () (_ BitVec 32))

(assert (=> b!562812 (= lt!256541 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256547 (select (arr!16957 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562812 (= lt!256552 (toIndex!0 lt!256546 mask!3119))))

(assert (=> b!562812 (= lt!256546 (select (store (arr!16957 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562812 (= lt!256547 (toIndex!0 (select (arr!16957 a!3118) j!142) mask!3119))))

(assert (=> b!562812 (= lt!256548 (array!35317 (store (arr!16957 a!3118) i!1132 k0!1914) (size!17321 a!3118)))))

(declare-fun b!562813 () Bool)

(assert (=> b!562813 (= e!324360 e!324362)))

(declare-fun res!353858 () Bool)

(assert (=> b!562813 (=> res!353858 e!324362)))

(assert (=> b!562813 (= res!353858 (or (= lt!256551 (select (arr!16957 a!3118) j!142)) (= lt!256551 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562813 (= lt!256551 (select (arr!16957 a!3118) (index!23677 lt!256541)))))

(assert (= (and start!51504 res!353854) b!562803))

(assert (= (and b!562803 res!353859) b!562811))

(assert (= (and b!562811 res!353852) b!562807))

(assert (= (and b!562807 res!353855) b!562806))

(assert (= (and b!562806 res!353850) b!562809))

(assert (= (and b!562809 res!353857) b!562810))

(assert (= (and b!562810 res!353851) b!562804))

(assert (= (and b!562804 res!353856) b!562812))

(assert (= (and b!562812 res!353853) b!562808))

(assert (= (and b!562808 (not res!353860)) b!562813))

(assert (= (and b!562813 (not res!353858)) b!562802))

(assert (= (and b!562802 (not res!353849)) b!562805))

(declare-fun m!541031 () Bool)

(assert (=> b!562804 m!541031))

(declare-fun m!541033 () Bool)

(assert (=> b!562802 m!541033))

(declare-fun m!541035 () Bool)

(assert (=> b!562802 m!541035))

(declare-fun m!541037 () Bool)

(assert (=> b!562802 m!541037))

(declare-fun m!541039 () Bool)

(assert (=> b!562802 m!541039))

(declare-fun m!541041 () Bool)

(assert (=> b!562802 m!541041))

(assert (=> b!562802 m!541037))

(declare-fun m!541043 () Bool)

(assert (=> b!562802 m!541043))

(declare-fun m!541045 () Bool)

(assert (=> b!562810 m!541045))

(declare-fun m!541047 () Bool)

(assert (=> b!562806 m!541047))

(declare-fun m!541049 () Bool)

(assert (=> b!562807 m!541049))

(declare-fun m!541051 () Bool)

(assert (=> b!562809 m!541051))

(assert (=> b!562808 m!541037))

(assert (=> b!562808 m!541037))

(declare-fun m!541053 () Bool)

(assert (=> b!562808 m!541053))

(declare-fun m!541055 () Bool)

(assert (=> b!562808 m!541055))

(declare-fun m!541057 () Bool)

(assert (=> b!562808 m!541057))

(assert (=> b!562812 m!541037))

(declare-fun m!541059 () Bool)

(assert (=> b!562812 m!541059))

(assert (=> b!562812 m!541037))

(declare-fun m!541061 () Bool)

(assert (=> b!562812 m!541061))

(assert (=> b!562812 m!541037))

(declare-fun m!541063 () Bool)

(assert (=> b!562812 m!541063))

(assert (=> b!562812 m!541041))

(declare-fun m!541065 () Bool)

(assert (=> b!562812 m!541065))

(declare-fun m!541067 () Bool)

(assert (=> b!562812 m!541067))

(declare-fun m!541069 () Bool)

(assert (=> b!562805 m!541069))

(assert (=> b!562813 m!541037))

(declare-fun m!541071 () Bool)

(assert (=> b!562813 m!541071))

(declare-fun m!541073 () Bool)

(assert (=> start!51504 m!541073))

(declare-fun m!541075 () Bool)

(assert (=> start!51504 m!541075))

(assert (=> b!562811 m!541037))

(assert (=> b!562811 m!541037))

(declare-fun m!541077 () Bool)

(assert (=> b!562811 m!541077))

(check-sat (not b!562805) (not b!562802) (not b!562807) (not b!562809) (not start!51504) (not b!562811) (not b!562808) (not b!562806) (not b!562810) (not b!562804) (not b!562812))
(check-sat)
