; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51076 () Bool)

(assert start!51076)

(declare-fun b!558115 () Bool)

(declare-fun e!321522 () Bool)

(declare-fun e!321520 () Bool)

(assert (=> b!558115 (= e!321522 e!321520)))

(declare-fun res!349988 () Bool)

(assert (=> b!558115 (=> (not res!349988) (not e!321520))))

(declare-datatypes ((SeekEntryResult!5319 0))(
  ( (MissingZero!5319 (index!23503 (_ BitVec 32))) (Found!5319 (index!23504 (_ BitVec 32))) (Intermediate!5319 (undefined!6131 Bool) (index!23505 (_ BitVec 32)) (x!52403 (_ BitVec 32))) (Undefined!5319) (MissingVacant!5319 (index!23506 (_ BitVec 32))) )
))
(declare-fun lt!253609 () SeekEntryResult!5319)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558115 (= res!349988 (or (= lt!253609 (MissingZero!5319 i!1132)) (= lt!253609 (MissingVacant!5319 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35130 0))(
  ( (array!35131 (arr!16870 (Array (_ BitVec 32) (_ BitVec 64))) (size!17234 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35130)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35130 (_ BitVec 32)) SeekEntryResult!5319)

(assert (=> b!558115 (= lt!253609 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!253607 () SeekEntryResult!5319)

(declare-fun b!558116 () Bool)

(declare-fun lt!253606 () SeekEntryResult!5319)

(declare-fun e!321517 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35130 (_ BitVec 32)) SeekEntryResult!5319)

(assert (=> b!558116 (= e!321517 (= lt!253607 (seekKeyOrZeroReturnVacant!0 (x!52403 lt!253606) (index!23505 lt!253606) (index!23505 lt!253606) (select (arr!16870 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558117 () Bool)

(declare-fun res!349984 () Bool)

(assert (=> b!558117 (=> (not res!349984) (not e!321522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558117 (= res!349984 (validKeyInArray!0 (select (arr!16870 a!3118) j!142)))))

(declare-fun res!349986 () Bool)

(assert (=> start!51076 (=> (not res!349986) (not e!321522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51076 (= res!349986 (validMask!0 mask!3119))))

(assert (=> start!51076 e!321522))

(assert (=> start!51076 true))

(declare-fun array_inv!12666 (array!35130) Bool)

(assert (=> start!51076 (array_inv!12666 a!3118)))

(declare-fun b!558118 () Bool)

(declare-fun res!349987 () Bool)

(assert (=> b!558118 (=> (not res!349987) (not e!321520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35130 (_ BitVec 32)) Bool)

(assert (=> b!558118 (= res!349987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558119 () Bool)

(declare-fun res!349979 () Bool)

(assert (=> b!558119 (=> (not res!349979) (not e!321522))))

(assert (=> b!558119 (= res!349979 (and (= (size!17234 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17234 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17234 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558120 () Bool)

(declare-fun res!349982 () Bool)

(assert (=> b!558120 (=> (not res!349982) (not e!321520))))

(declare-datatypes ((List!10950 0))(
  ( (Nil!10947) (Cons!10946 (h!11940 (_ BitVec 64)) (t!17178 List!10950)) )
))
(declare-fun arrayNoDuplicates!0 (array!35130 (_ BitVec 32) List!10950) Bool)

(assert (=> b!558120 (= res!349982 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10947))))

(declare-fun b!558121 () Bool)

(declare-fun res!349981 () Bool)

(assert (=> b!558121 (=> (not res!349981) (not e!321522))))

(assert (=> b!558121 (= res!349981 (validKeyInArray!0 k0!1914))))

(declare-fun b!558122 () Bool)

(declare-fun e!321518 () Bool)

(assert (=> b!558122 (= e!321518 e!321517)))

(declare-fun res!349985 () Bool)

(assert (=> b!558122 (=> res!349985 e!321517)))

(get-info :version)

(assert (=> b!558122 (= res!349985 (or (undefined!6131 lt!253606) (not ((_ is Intermediate!5319) lt!253606)) (= (select (arr!16870 a!3118) (index!23505 lt!253606)) (select (arr!16870 a!3118) j!142)) (= (select (arr!16870 a!3118) (index!23505 lt!253606)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558123 () Bool)

(declare-fun e!321521 () Bool)

(assert (=> b!558123 (= e!321520 e!321521)))

(declare-fun res!349980 () Bool)

(assert (=> b!558123 (=> (not res!349980) (not e!321521))))

(declare-fun lt!253608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35130 (_ BitVec 32)) SeekEntryResult!5319)

(assert (=> b!558123 (= res!349980 (= lt!253606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253608 (select (store (arr!16870 a!3118) i!1132 k0!1914) j!142) (array!35131 (store (arr!16870 a!3118) i!1132 k0!1914) (size!17234 a!3118)) mask!3119)))))

(declare-fun lt!253604 () (_ BitVec 32))

(assert (=> b!558123 (= lt!253606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253604 (select (arr!16870 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558123 (= lt!253608 (toIndex!0 (select (store (arr!16870 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558123 (= lt!253604 (toIndex!0 (select (arr!16870 a!3118) j!142) mask!3119))))

(declare-fun b!558124 () Bool)

(assert (=> b!558124 (= e!321521 (not true))))

(assert (=> b!558124 e!321518))

(declare-fun res!349978 () Bool)

(assert (=> b!558124 (=> (not res!349978) (not e!321518))))

(assert (=> b!558124 (= res!349978 (= lt!253607 (Found!5319 j!142)))))

(assert (=> b!558124 (= lt!253607 (seekEntryOrOpen!0 (select (arr!16870 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558124 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17412 0))(
  ( (Unit!17413) )
))
(declare-fun lt!253605 () Unit!17412)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17412)

(assert (=> b!558124 (= lt!253605 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558125 () Bool)

(declare-fun res!349983 () Bool)

(assert (=> b!558125 (=> (not res!349983) (not e!321522))))

(declare-fun arrayContainsKey!0 (array!35130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558125 (= res!349983 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51076 res!349986) b!558119))

(assert (= (and b!558119 res!349979) b!558117))

(assert (= (and b!558117 res!349984) b!558121))

(assert (= (and b!558121 res!349981) b!558125))

(assert (= (and b!558125 res!349983) b!558115))

(assert (= (and b!558115 res!349988) b!558118))

(assert (= (and b!558118 res!349987) b!558120))

(assert (= (and b!558120 res!349982) b!558123))

(assert (= (and b!558123 res!349980) b!558124))

(assert (= (and b!558124 res!349978) b!558122))

(assert (= (and b!558122 (not res!349985)) b!558116))

(declare-fun m!536029 () Bool)

(assert (=> b!558115 m!536029))

(declare-fun m!536031 () Bool)

(assert (=> b!558123 m!536031))

(declare-fun m!536033 () Bool)

(assert (=> b!558123 m!536033))

(assert (=> b!558123 m!536031))

(declare-fun m!536035 () Bool)

(assert (=> b!558123 m!536035))

(assert (=> b!558123 m!536035))

(declare-fun m!536037 () Bool)

(assert (=> b!558123 m!536037))

(assert (=> b!558123 m!536031))

(declare-fun m!536039 () Bool)

(assert (=> b!558123 m!536039))

(declare-fun m!536041 () Bool)

(assert (=> b!558123 m!536041))

(assert (=> b!558123 m!536035))

(declare-fun m!536043 () Bool)

(assert (=> b!558123 m!536043))

(assert (=> b!558124 m!536031))

(assert (=> b!558124 m!536031))

(declare-fun m!536045 () Bool)

(assert (=> b!558124 m!536045))

(declare-fun m!536047 () Bool)

(assert (=> b!558124 m!536047))

(declare-fun m!536049 () Bool)

(assert (=> b!558124 m!536049))

(assert (=> b!558117 m!536031))

(assert (=> b!558117 m!536031))

(declare-fun m!536051 () Bool)

(assert (=> b!558117 m!536051))

(declare-fun m!536053 () Bool)

(assert (=> b!558122 m!536053))

(assert (=> b!558122 m!536031))

(declare-fun m!536055 () Bool)

(assert (=> b!558118 m!536055))

(declare-fun m!536057 () Bool)

(assert (=> b!558121 m!536057))

(declare-fun m!536059 () Bool)

(assert (=> start!51076 m!536059))

(declare-fun m!536061 () Bool)

(assert (=> start!51076 m!536061))

(declare-fun m!536063 () Bool)

(assert (=> b!558125 m!536063))

(declare-fun m!536065 () Bool)

(assert (=> b!558120 m!536065))

(assert (=> b!558116 m!536031))

(assert (=> b!558116 m!536031))

(declare-fun m!536067 () Bool)

(assert (=> b!558116 m!536067))

(check-sat (not b!558120) (not b!558118) (not b!558125) (not b!558123) (not b!558116) (not b!558117) (not start!51076) (not b!558115) (not b!558124) (not b!558121))
(check-sat)
