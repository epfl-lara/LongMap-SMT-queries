; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52182 () Bool)

(assert start!52182)

(declare-fun b!569195 () Bool)

(declare-fun res!359114 () Bool)

(declare-fun e!327512 () Bool)

(assert (=> b!569195 (=> (not res!359114) (not e!327512))))

(declare-datatypes ((array!35652 0))(
  ( (array!35653 (arr!17116 (Array (_ BitVec 32) (_ BitVec 64))) (size!17480 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35652)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35652 (_ BitVec 32)) Bool)

(assert (=> b!569195 (= res!359114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569196 () Bool)

(declare-fun res!359112 () Bool)

(declare-fun e!327513 () Bool)

(assert (=> b!569196 (=> (not res!359112) (not e!327513))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569196 (= res!359112 (validKeyInArray!0 (select (arr!17116 a!3118) j!142)))))

(declare-fun b!569197 () Bool)

(declare-fun res!359116 () Bool)

(assert (=> b!569197 (=> (not res!359116) (not e!327513))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569197 (= res!359116 (and (= (size!17480 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17480 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17480 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569198 () Bool)

(declare-fun res!359111 () Bool)

(assert (=> b!569198 (=> (not res!359111) (not e!327512))))

(declare-datatypes ((List!11103 0))(
  ( (Nil!11100) (Cons!11099 (h!12123 (_ BitVec 64)) (t!17323 List!11103)) )
))
(declare-fun arrayNoDuplicates!0 (array!35652 (_ BitVec 32) List!11103) Bool)

(assert (=> b!569198 (= res!359111 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11100))))

(declare-fun b!569199 () Bool)

(declare-fun res!359108 () Bool)

(assert (=> b!569199 (=> (not res!359108) (not e!327513))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!569199 (= res!359108 (validKeyInArray!0 k0!1914))))

(declare-fun res!359113 () Bool)

(assert (=> start!52182 (=> (not res!359113) (not e!327513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52182 (= res!359113 (validMask!0 mask!3119))))

(assert (=> start!52182 e!327513))

(assert (=> start!52182 true))

(declare-fun array_inv!12975 (array!35652) Bool)

(assert (=> start!52182 (array_inv!12975 a!3118)))

(declare-fun b!569200 () Bool)

(declare-fun e!327510 () Bool)

(assert (=> b!569200 (= e!327512 e!327510)))

(declare-fun res!359109 () Bool)

(assert (=> b!569200 (=> (not res!359109) (not e!327510))))

(declare-fun lt!259358 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5521 0))(
  ( (MissingZero!5521 (index!24311 (_ BitVec 32))) (Found!5521 (index!24312 (_ BitVec 32))) (Intermediate!5521 (undefined!6333 Bool) (index!24313 (_ BitVec 32)) (x!53343 (_ BitVec 32))) (Undefined!5521) (MissingVacant!5521 (index!24314 (_ BitVec 32))) )
))
(declare-fun lt!259361 () SeekEntryResult!5521)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35652 (_ BitVec 32)) SeekEntryResult!5521)

(assert (=> b!569200 (= res!359109 (= lt!259361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259358 (select (store (arr!17116 a!3118) i!1132 k0!1914) j!142) (array!35653 (store (arr!17116 a!3118) i!1132 k0!1914) (size!17480 a!3118)) mask!3119)))))

(declare-fun lt!259363 () (_ BitVec 32))

(assert (=> b!569200 (= lt!259361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259363 (select (arr!17116 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569200 (= lt!259358 (toIndex!0 (select (store (arr!17116 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569200 (= lt!259363 (toIndex!0 (select (arr!17116 a!3118) j!142) mask!3119))))

(declare-fun b!569201 () Bool)

(assert (=> b!569201 (= e!327513 e!327512)))

(declare-fun res!359115 () Bool)

(assert (=> b!569201 (=> (not res!359115) (not e!327512))))

(declare-fun lt!259360 () SeekEntryResult!5521)

(assert (=> b!569201 (= res!359115 (or (= lt!259360 (MissingZero!5521 i!1132)) (= lt!259360 (MissingVacant!5521 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35652 (_ BitVec 32)) SeekEntryResult!5521)

(assert (=> b!569201 (= lt!259360 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569202 () Bool)

(declare-fun res!359110 () Bool)

(assert (=> b!569202 (=> (not res!359110) (not e!327513))))

(declare-fun arrayContainsKey!0 (array!35652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569202 (= res!359110 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569203 () Bool)

(assert (=> b!569203 (= e!327510 (not true))))

(declare-fun lt!259359 () SeekEntryResult!5521)

(get-info :version)

(assert (=> b!569203 (and (= lt!259359 (Found!5521 j!142)) (or (undefined!6333 lt!259361) (not ((_ is Intermediate!5521) lt!259361)) (= (select (arr!17116 a!3118) (index!24313 lt!259361)) (select (arr!17116 a!3118) j!142)) (not (= (select (arr!17116 a!3118) (index!24313 lt!259361)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259359 (MissingZero!5521 (index!24313 lt!259361)))))))

(assert (=> b!569203 (= lt!259359 (seekEntryOrOpen!0 (select (arr!17116 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569203 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17815 0))(
  ( (Unit!17816) )
))
(declare-fun lt!259362 () Unit!17815)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17815)

(assert (=> b!569203 (= lt!259362 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52182 res!359113) b!569197))

(assert (= (and b!569197 res!359116) b!569196))

(assert (= (and b!569196 res!359112) b!569199))

(assert (= (and b!569199 res!359108) b!569202))

(assert (= (and b!569202 res!359110) b!569201))

(assert (= (and b!569201 res!359115) b!569195))

(assert (= (and b!569195 res!359114) b!569198))

(assert (= (and b!569198 res!359111) b!569200))

(assert (= (and b!569200 res!359109) b!569203))

(declare-fun m!547883 () Bool)

(assert (=> b!569201 m!547883))

(declare-fun m!547885 () Bool)

(assert (=> b!569195 m!547885))

(declare-fun m!547887 () Bool)

(assert (=> b!569203 m!547887))

(declare-fun m!547889 () Bool)

(assert (=> b!569203 m!547889))

(declare-fun m!547891 () Bool)

(assert (=> b!569203 m!547891))

(declare-fun m!547893 () Bool)

(assert (=> b!569203 m!547893))

(assert (=> b!569203 m!547887))

(declare-fun m!547895 () Bool)

(assert (=> b!569203 m!547895))

(assert (=> b!569200 m!547887))

(declare-fun m!547897 () Bool)

(assert (=> b!569200 m!547897))

(declare-fun m!547899 () Bool)

(assert (=> b!569200 m!547899))

(declare-fun m!547901 () Bool)

(assert (=> b!569200 m!547901))

(assert (=> b!569200 m!547887))

(assert (=> b!569200 m!547899))

(assert (=> b!569200 m!547887))

(declare-fun m!547903 () Bool)

(assert (=> b!569200 m!547903))

(declare-fun m!547905 () Bool)

(assert (=> b!569200 m!547905))

(assert (=> b!569200 m!547899))

(declare-fun m!547907 () Bool)

(assert (=> b!569200 m!547907))

(declare-fun m!547909 () Bool)

(assert (=> b!569202 m!547909))

(assert (=> b!569196 m!547887))

(assert (=> b!569196 m!547887))

(declare-fun m!547911 () Bool)

(assert (=> b!569196 m!547911))

(declare-fun m!547913 () Bool)

(assert (=> start!52182 m!547913))

(declare-fun m!547915 () Bool)

(assert (=> start!52182 m!547915))

(declare-fun m!547917 () Bool)

(assert (=> b!569199 m!547917))

(declare-fun m!547919 () Bool)

(assert (=> b!569198 m!547919))

(check-sat (not b!569195) (not b!569196) (not start!52182) (not b!569203) (not b!569200) (not b!569202) (not b!569198) (not b!569199) (not b!569201))
(check-sat)
