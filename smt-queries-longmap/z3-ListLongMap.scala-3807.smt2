; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52242 () Bool)

(assert start!52242)

(declare-fun b!570007 () Bool)

(declare-fun e!327872 () Bool)

(declare-fun e!327871 () Bool)

(assert (=> b!570007 (= e!327872 e!327871)))

(declare-fun res!359927 () Bool)

(assert (=> b!570007 (=> (not res!359927) (not e!327871))))

(declare-datatypes ((SeekEntryResult!5551 0))(
  ( (MissingZero!5551 (index!24431 (_ BitVec 32))) (Found!5551 (index!24432 (_ BitVec 32))) (Intermediate!5551 (undefined!6363 Bool) (index!24433 (_ BitVec 32)) (x!53453 (_ BitVec 32))) (Undefined!5551) (MissingVacant!5551 (index!24434 (_ BitVec 32))) )
))
(declare-fun lt!259890 () SeekEntryResult!5551)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570007 (= res!359927 (or (= lt!259890 (MissingZero!5551 i!1132)) (= lt!259890 (MissingVacant!5551 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35712 0))(
  ( (array!35713 (arr!17146 (Array (_ BitVec 32) (_ BitVec 64))) (size!17510 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35712)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35712 (_ BitVec 32)) SeekEntryResult!5551)

(assert (=> b!570007 (= lt!259890 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570008 () Bool)

(declare-fun res!359924 () Bool)

(assert (=> b!570008 (=> (not res!359924) (not e!327871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35712 (_ BitVec 32)) Bool)

(assert (=> b!570008 (= res!359924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570009 () Bool)

(declare-fun res!359920 () Bool)

(assert (=> b!570009 (=> (not res!359920) (not e!327871))))

(declare-datatypes ((List!11133 0))(
  ( (Nil!11130) (Cons!11129 (h!12153 (_ BitVec 64)) (t!17353 List!11133)) )
))
(declare-fun arrayNoDuplicates!0 (array!35712 (_ BitVec 32) List!11133) Bool)

(assert (=> b!570009 (= res!359920 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11130))))

(declare-fun b!570010 () Bool)

(declare-fun res!359925 () Bool)

(assert (=> b!570010 (=> (not res!359925) (not e!327872))))

(declare-fun arrayContainsKey!0 (array!35712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570010 (= res!359925 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!327870 () Bool)

(declare-fun b!570011 () Bool)

(assert (=> b!570011 (= e!327870 (= (seekEntryOrOpen!0 (select (arr!17146 a!3118) j!142) a!3118 mask!3119) (Found!5551 j!142)))))

(declare-fun b!570012 () Bool)

(assert (=> b!570012 (= e!327871 (not true))))

(assert (=> b!570012 e!327870))

(declare-fun res!359921 () Bool)

(assert (=> b!570012 (=> (not res!359921) (not e!327870))))

(assert (=> b!570012 (= res!359921 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17875 0))(
  ( (Unit!17876) )
))
(declare-fun lt!259891 () Unit!17875)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17875)

(assert (=> b!570012 (= lt!259891 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!359923 () Bool)

(assert (=> start!52242 (=> (not res!359923) (not e!327872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52242 (= res!359923 (validMask!0 mask!3119))))

(assert (=> start!52242 e!327872))

(assert (=> start!52242 true))

(declare-fun array_inv!13005 (array!35712) Bool)

(assert (=> start!52242 (array_inv!13005 a!3118)))

(declare-fun b!570013 () Bool)

(declare-fun res!359926 () Bool)

(assert (=> b!570013 (=> (not res!359926) (not e!327872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570013 (= res!359926 (validKeyInArray!0 (select (arr!17146 a!3118) j!142)))))

(declare-fun b!570014 () Bool)

(declare-fun res!359922 () Bool)

(assert (=> b!570014 (=> (not res!359922) (not e!327872))))

(assert (=> b!570014 (= res!359922 (validKeyInArray!0 k0!1914))))

(declare-fun b!570015 () Bool)

(declare-fun res!359929 () Bool)

(assert (=> b!570015 (=> (not res!359929) (not e!327872))))

(assert (=> b!570015 (= res!359929 (and (= (size!17510 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17510 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17510 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570016 () Bool)

(declare-fun res!359928 () Bool)

(assert (=> b!570016 (=> (not res!359928) (not e!327871))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35712 (_ BitVec 32)) SeekEntryResult!5551)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570016 (= res!359928 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17146 a!3118) j!142) mask!3119) (select (arr!17146 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17146 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17146 a!3118) i!1132 k0!1914) j!142) (array!35713 (store (arr!17146 a!3118) i!1132 k0!1914) (size!17510 a!3118)) mask!3119)))))

(assert (= (and start!52242 res!359923) b!570015))

(assert (= (and b!570015 res!359929) b!570013))

(assert (= (and b!570013 res!359926) b!570014))

(assert (= (and b!570014 res!359922) b!570010))

(assert (= (and b!570010 res!359925) b!570007))

(assert (= (and b!570007 res!359927) b!570008))

(assert (= (and b!570008 res!359924) b!570009))

(assert (= (and b!570009 res!359920) b!570016))

(assert (= (and b!570016 res!359928) b!570012))

(assert (= (and b!570012 res!359921) b!570011))

(declare-fun m!549023 () Bool)

(assert (=> b!570011 m!549023))

(assert (=> b!570011 m!549023))

(declare-fun m!549025 () Bool)

(assert (=> b!570011 m!549025))

(declare-fun m!549027 () Bool)

(assert (=> b!570010 m!549027))

(assert (=> b!570013 m!549023))

(assert (=> b!570013 m!549023))

(declare-fun m!549029 () Bool)

(assert (=> b!570013 m!549029))

(declare-fun m!549031 () Bool)

(assert (=> b!570012 m!549031))

(declare-fun m!549033 () Bool)

(assert (=> b!570012 m!549033))

(declare-fun m!549035 () Bool)

(assert (=> b!570007 m!549035))

(declare-fun m!549037 () Bool)

(assert (=> b!570009 m!549037))

(assert (=> b!570016 m!549023))

(declare-fun m!549039 () Bool)

(assert (=> b!570016 m!549039))

(assert (=> b!570016 m!549023))

(declare-fun m!549041 () Bool)

(assert (=> b!570016 m!549041))

(declare-fun m!549043 () Bool)

(assert (=> b!570016 m!549043))

(assert (=> b!570016 m!549041))

(declare-fun m!549045 () Bool)

(assert (=> b!570016 m!549045))

(assert (=> b!570016 m!549039))

(assert (=> b!570016 m!549023))

(declare-fun m!549047 () Bool)

(assert (=> b!570016 m!549047))

(declare-fun m!549049 () Bool)

(assert (=> b!570016 m!549049))

(assert (=> b!570016 m!549041))

(assert (=> b!570016 m!549043))

(declare-fun m!549051 () Bool)

(assert (=> start!52242 m!549051))

(declare-fun m!549053 () Bool)

(assert (=> start!52242 m!549053))

(declare-fun m!549055 () Bool)

(assert (=> b!570008 m!549055))

(declare-fun m!549057 () Bool)

(assert (=> b!570014 m!549057))

(check-sat (not b!570007) (not b!570009) (not b!570011) (not start!52242) (not b!570016) (not b!570013) (not b!570012) (not b!570008) (not b!570014) (not b!570010))
(check-sat)
