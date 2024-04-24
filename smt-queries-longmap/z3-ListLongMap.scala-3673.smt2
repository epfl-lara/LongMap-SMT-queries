; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50700 () Bool)

(assert start!50700)

(declare-fun b!553933 () Bool)

(declare-fun e!319510 () Bool)

(assert (=> b!553933 (= e!319510 (not true))))

(declare-fun e!319512 () Bool)

(assert (=> b!553933 e!319512))

(declare-fun res!346243 () Bool)

(assert (=> b!553933 (=> (not res!346243) (not e!319512))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34872 0))(
  ( (array!34873 (arr!16744 (Array (_ BitVec 32) (_ BitVec 64))) (size!17108 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34872)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34872 (_ BitVec 32)) Bool)

(assert (=> b!553933 (= res!346243 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17143 0))(
  ( (Unit!17144) )
))
(declare-fun lt!251682 () Unit!17143)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17143)

(assert (=> b!553933 (= lt!251682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553934 () Bool)

(declare-fun res!346249 () Bool)

(assert (=> b!553934 (=> (not res!346249) (not e!319510))))

(declare-datatypes ((List!10731 0))(
  ( (Nil!10728) (Cons!10727 (h!11715 (_ BitVec 64)) (t!16951 List!10731)) )
))
(declare-fun arrayNoDuplicates!0 (array!34872 (_ BitVec 32) List!10731) Bool)

(assert (=> b!553934 (= res!346249 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10728))))

(declare-fun res!346241 () Bool)

(declare-fun e!319511 () Bool)

(assert (=> start!50700 (=> (not res!346241) (not e!319511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50700 (= res!346241 (validMask!0 mask!3119))))

(assert (=> start!50700 e!319511))

(assert (=> start!50700 true))

(declare-fun array_inv!12603 (array!34872) Bool)

(assert (=> start!50700 (array_inv!12603 a!3118)))

(declare-fun b!553935 () Bool)

(declare-fun res!346245 () Bool)

(assert (=> b!553935 (=> (not res!346245) (not e!319511))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553935 (= res!346245 (and (= (size!17108 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17108 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17108 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553936 () Bool)

(assert (=> b!553936 (= e!319511 e!319510)))

(declare-fun res!346244 () Bool)

(assert (=> b!553936 (=> (not res!346244) (not e!319510))))

(declare-datatypes ((SeekEntryResult!5149 0))(
  ( (MissingZero!5149 (index!22823 (_ BitVec 32))) (Found!5149 (index!22824 (_ BitVec 32))) (Intermediate!5149 (undefined!5961 Bool) (index!22825 (_ BitVec 32)) (x!51898 (_ BitVec 32))) (Undefined!5149) (MissingVacant!5149 (index!22826 (_ BitVec 32))) )
))
(declare-fun lt!251683 () SeekEntryResult!5149)

(assert (=> b!553936 (= res!346244 (or (= lt!251683 (MissingZero!5149 i!1132)) (= lt!251683 (MissingVacant!5149 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34872 (_ BitVec 32)) SeekEntryResult!5149)

(assert (=> b!553936 (= lt!251683 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553937 () Bool)

(declare-fun res!346247 () Bool)

(assert (=> b!553937 (=> (not res!346247) (not e!319511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553937 (= res!346247 (validKeyInArray!0 (select (arr!16744 a!3118) j!142)))))

(declare-fun b!553938 () Bool)

(assert (=> b!553938 (= e!319512 (= (seekEntryOrOpen!0 (select (arr!16744 a!3118) j!142) a!3118 mask!3119) (Found!5149 j!142)))))

(declare-fun b!553939 () Bool)

(declare-fun res!346246 () Bool)

(assert (=> b!553939 (=> (not res!346246) (not e!319510))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34872 (_ BitVec 32)) SeekEntryResult!5149)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553939 (= res!346246 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16744 a!3118) j!142) mask!3119) (select (arr!16744 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16744 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16744 a!3118) i!1132 k0!1914) j!142) (array!34873 (store (arr!16744 a!3118) i!1132 k0!1914) (size!17108 a!3118)) mask!3119)))))

(declare-fun b!553940 () Bool)

(declare-fun res!346240 () Bool)

(assert (=> b!553940 (=> (not res!346240) (not e!319511))))

(assert (=> b!553940 (= res!346240 (validKeyInArray!0 k0!1914))))

(declare-fun b!553941 () Bool)

(declare-fun res!346242 () Bool)

(assert (=> b!553941 (=> (not res!346242) (not e!319511))))

(declare-fun arrayContainsKey!0 (array!34872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553941 (= res!346242 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553942 () Bool)

(declare-fun res!346248 () Bool)

(assert (=> b!553942 (=> (not res!346248) (not e!319510))))

(assert (=> b!553942 (= res!346248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50700 res!346241) b!553935))

(assert (= (and b!553935 res!346245) b!553937))

(assert (= (and b!553937 res!346247) b!553940))

(assert (= (and b!553940 res!346240) b!553941))

(assert (= (and b!553941 res!346242) b!553936))

(assert (= (and b!553936 res!346244) b!553942))

(assert (= (and b!553942 res!346248) b!553934))

(assert (= (and b!553934 res!346249) b!553939))

(assert (= (and b!553939 res!346246) b!553933))

(assert (= (and b!553933 res!346243) b!553938))

(declare-fun m!531215 () Bool)

(assert (=> b!553934 m!531215))

(declare-fun m!531217 () Bool)

(assert (=> b!553933 m!531217))

(declare-fun m!531219 () Bool)

(assert (=> b!553933 m!531219))

(declare-fun m!531221 () Bool)

(assert (=> start!50700 m!531221))

(declare-fun m!531223 () Bool)

(assert (=> start!50700 m!531223))

(declare-fun m!531225 () Bool)

(assert (=> b!553938 m!531225))

(assert (=> b!553938 m!531225))

(declare-fun m!531227 () Bool)

(assert (=> b!553938 m!531227))

(assert (=> b!553937 m!531225))

(assert (=> b!553937 m!531225))

(declare-fun m!531229 () Bool)

(assert (=> b!553937 m!531229))

(declare-fun m!531231 () Bool)

(assert (=> b!553941 m!531231))

(assert (=> b!553939 m!531225))

(declare-fun m!531233 () Bool)

(assert (=> b!553939 m!531233))

(assert (=> b!553939 m!531225))

(declare-fun m!531235 () Bool)

(assert (=> b!553939 m!531235))

(declare-fun m!531237 () Bool)

(assert (=> b!553939 m!531237))

(assert (=> b!553939 m!531235))

(declare-fun m!531239 () Bool)

(assert (=> b!553939 m!531239))

(assert (=> b!553939 m!531233))

(assert (=> b!553939 m!531225))

(declare-fun m!531241 () Bool)

(assert (=> b!553939 m!531241))

(declare-fun m!531243 () Bool)

(assert (=> b!553939 m!531243))

(assert (=> b!553939 m!531235))

(assert (=> b!553939 m!531237))

(declare-fun m!531245 () Bool)

(assert (=> b!553942 m!531245))

(declare-fun m!531247 () Bool)

(assert (=> b!553940 m!531247))

(declare-fun m!531249 () Bool)

(assert (=> b!553936 m!531249))

(check-sat (not b!553933) (not b!553941) (not start!50700) (not b!553939) (not b!553936) (not b!553940) (not b!553938) (not b!553934) (not b!553937) (not b!553942))
(check-sat)
