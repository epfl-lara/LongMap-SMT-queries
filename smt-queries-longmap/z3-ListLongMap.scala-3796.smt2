; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52176 () Bool)

(assert start!52176)

(declare-fun b!569114 () Bool)

(declare-fun res!359034 () Bool)

(declare-fun e!327476 () Bool)

(assert (=> b!569114 (=> (not res!359034) (not e!327476))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569114 (= res!359034 (validKeyInArray!0 k0!1914))))

(declare-fun b!569115 () Bool)

(declare-fun e!327475 () Bool)

(assert (=> b!569115 (= e!327476 e!327475)))

(declare-fun res!359027 () Bool)

(assert (=> b!569115 (=> (not res!359027) (not e!327475))))

(declare-datatypes ((SeekEntryResult!5518 0))(
  ( (MissingZero!5518 (index!24299 (_ BitVec 32))) (Found!5518 (index!24300 (_ BitVec 32))) (Intermediate!5518 (undefined!6330 Bool) (index!24301 (_ BitVec 32)) (x!53332 (_ BitVec 32))) (Undefined!5518) (MissingVacant!5518 (index!24302 (_ BitVec 32))) )
))
(declare-fun lt!259309 () SeekEntryResult!5518)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569115 (= res!359027 (or (= lt!259309 (MissingZero!5518 i!1132)) (= lt!259309 (MissingVacant!5518 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35646 0))(
  ( (array!35647 (arr!17113 (Array (_ BitVec 32) (_ BitVec 64))) (size!17477 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35646)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35646 (_ BitVec 32)) SeekEntryResult!5518)

(assert (=> b!569115 (= lt!259309 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569116 () Bool)

(declare-fun res!359033 () Bool)

(assert (=> b!569116 (=> (not res!359033) (not e!327475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35646 (_ BitVec 32)) Bool)

(assert (=> b!569116 (= res!359033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569117 () Bool)

(declare-fun res!359035 () Bool)

(assert (=> b!569117 (=> (not res!359035) (not e!327476))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!569117 (= res!359035 (and (= (size!17477 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17477 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17477 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!359031 () Bool)

(assert (=> start!52176 (=> (not res!359031) (not e!327476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52176 (= res!359031 (validMask!0 mask!3119))))

(assert (=> start!52176 e!327476))

(assert (=> start!52176 true))

(declare-fun array_inv!12972 (array!35646) Bool)

(assert (=> start!52176 (array_inv!12972 a!3118)))

(declare-fun b!569118 () Bool)

(declare-fun res!359028 () Bool)

(assert (=> b!569118 (=> (not res!359028) (not e!327475))))

(declare-datatypes ((List!11100 0))(
  ( (Nil!11097) (Cons!11096 (h!12120 (_ BitVec 64)) (t!17320 List!11100)) )
))
(declare-fun arrayNoDuplicates!0 (array!35646 (_ BitVec 32) List!11100) Bool)

(assert (=> b!569118 (= res!359028 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11097))))

(declare-fun b!569119 () Bool)

(declare-fun res!359030 () Bool)

(assert (=> b!569119 (=> (not res!359030) (not e!327476))))

(declare-fun arrayContainsKey!0 (array!35646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569119 (= res!359030 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569120 () Bool)

(declare-fun e!327474 () Bool)

(assert (=> b!569120 (= e!327474 (not true))))

(declare-fun lt!259305 () SeekEntryResult!5518)

(declare-fun lt!259304 () SeekEntryResult!5518)

(get-info :version)

(assert (=> b!569120 (and (= lt!259305 (Found!5518 j!142)) (or (undefined!6330 lt!259304) (not ((_ is Intermediate!5518) lt!259304)) (= (select (arr!17113 a!3118) (index!24301 lt!259304)) (select (arr!17113 a!3118) j!142)) (not (= (select (arr!17113 a!3118) (index!24301 lt!259304)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259305 (MissingZero!5518 (index!24301 lt!259304)))))))

(assert (=> b!569120 (= lt!259305 (seekEntryOrOpen!0 (select (arr!17113 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569120 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17809 0))(
  ( (Unit!17810) )
))
(declare-fun lt!259308 () Unit!17809)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17809)

(assert (=> b!569120 (= lt!259308 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569121 () Bool)

(assert (=> b!569121 (= e!327475 e!327474)))

(declare-fun res!359032 () Bool)

(assert (=> b!569121 (=> (not res!359032) (not e!327474))))

(declare-fun lt!259307 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35646 (_ BitVec 32)) SeekEntryResult!5518)

(assert (=> b!569121 (= res!359032 (= lt!259304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259307 (select (store (arr!17113 a!3118) i!1132 k0!1914) j!142) (array!35647 (store (arr!17113 a!3118) i!1132 k0!1914) (size!17477 a!3118)) mask!3119)))))

(declare-fun lt!259306 () (_ BitVec 32))

(assert (=> b!569121 (= lt!259304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259306 (select (arr!17113 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569121 (= lt!259307 (toIndex!0 (select (store (arr!17113 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569121 (= lt!259306 (toIndex!0 (select (arr!17113 a!3118) j!142) mask!3119))))

(declare-fun b!569122 () Bool)

(declare-fun res!359029 () Bool)

(assert (=> b!569122 (=> (not res!359029) (not e!327476))))

(assert (=> b!569122 (= res!359029 (validKeyInArray!0 (select (arr!17113 a!3118) j!142)))))

(assert (= (and start!52176 res!359031) b!569117))

(assert (= (and b!569117 res!359035) b!569122))

(assert (= (and b!569122 res!359029) b!569114))

(assert (= (and b!569114 res!359034) b!569119))

(assert (= (and b!569119 res!359030) b!569115))

(assert (= (and b!569115 res!359027) b!569116))

(assert (= (and b!569116 res!359033) b!569118))

(assert (= (and b!569118 res!359028) b!569121))

(assert (= (and b!569121 res!359032) b!569120))

(declare-fun m!547769 () Bool)

(assert (=> b!569116 m!547769))

(declare-fun m!547771 () Bool)

(assert (=> b!569121 m!547771))

(declare-fun m!547773 () Bool)

(assert (=> b!569121 m!547773))

(assert (=> b!569121 m!547771))

(assert (=> b!569121 m!547771))

(declare-fun m!547775 () Bool)

(assert (=> b!569121 m!547775))

(declare-fun m!547777 () Bool)

(assert (=> b!569121 m!547777))

(declare-fun m!547779 () Bool)

(assert (=> b!569121 m!547779))

(assert (=> b!569121 m!547777))

(declare-fun m!547781 () Bool)

(assert (=> b!569121 m!547781))

(assert (=> b!569121 m!547777))

(declare-fun m!547783 () Bool)

(assert (=> b!569121 m!547783))

(declare-fun m!547785 () Bool)

(assert (=> b!569114 m!547785))

(assert (=> b!569120 m!547771))

(declare-fun m!547787 () Bool)

(assert (=> b!569120 m!547787))

(declare-fun m!547789 () Bool)

(assert (=> b!569120 m!547789))

(declare-fun m!547791 () Bool)

(assert (=> b!569120 m!547791))

(assert (=> b!569120 m!547771))

(declare-fun m!547793 () Bool)

(assert (=> b!569120 m!547793))

(declare-fun m!547795 () Bool)

(assert (=> b!569119 m!547795))

(declare-fun m!547797 () Bool)

(assert (=> b!569115 m!547797))

(assert (=> b!569122 m!547771))

(assert (=> b!569122 m!547771))

(declare-fun m!547799 () Bool)

(assert (=> b!569122 m!547799))

(declare-fun m!547801 () Bool)

(assert (=> b!569118 m!547801))

(declare-fun m!547803 () Bool)

(assert (=> start!52176 m!547803))

(declare-fun m!547805 () Bool)

(assert (=> start!52176 m!547805))

(check-sat (not b!569122) (not start!52176) (not b!569114) (not b!569120) (not b!569121) (not b!569118) (not b!569116) (not b!569115) (not b!569119))
(check-sat)
