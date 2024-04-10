; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52154 () Bool)

(assert start!52154)

(declare-fun b!569238 () Bool)

(declare-fun res!359258 () Bool)

(declare-fun e!327492 () Bool)

(assert (=> b!569238 (=> (not res!359258) (not e!327492))))

(declare-datatypes ((array!35677 0))(
  ( (array!35678 (arr!17130 (Array (_ BitVec 32) (_ BitVec 64))) (size!17494 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35677)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35677 (_ BitVec 32)) Bool)

(assert (=> b!569238 (= res!359258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569239 () Bool)

(declare-fun res!359261 () Bool)

(declare-fun e!327491 () Bool)

(assert (=> b!569239 (=> (not res!359261) (not e!327491))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569239 (= res!359261 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569240 () Bool)

(declare-fun e!327490 () Bool)

(assert (=> b!569240 (= e!327490 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5579 0))(
  ( (MissingZero!5579 (index!24543 (_ BitVec 32))) (Found!5579 (index!24544 (_ BitVec 32))) (Intermediate!5579 (undefined!6391 Bool) (index!24545 (_ BitVec 32)) (x!53422 (_ BitVec 32))) (Undefined!5579) (MissingVacant!5579 (index!24546 (_ BitVec 32))) )
))
(declare-fun lt!259409 () SeekEntryResult!5579)

(declare-fun lt!259414 () SeekEntryResult!5579)

(assert (=> b!569240 (and (= lt!259414 (Found!5579 j!142)) (or (undefined!6391 lt!259409) (not (is-Intermediate!5579 lt!259409)) (= (select (arr!17130 a!3118) (index!24545 lt!259409)) (select (arr!17130 a!3118) j!142)) (not (= (select (arr!17130 a!3118) (index!24545 lt!259409)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259414 (MissingZero!5579 (index!24545 lt!259409)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35677 (_ BitVec 32)) SeekEntryResult!5579)

(assert (=> b!569240 (= lt!259414 (seekEntryOrOpen!0 (select (arr!17130 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569240 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17860 0))(
  ( (Unit!17861) )
))
(declare-fun lt!259412 () Unit!17860)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17860)

(assert (=> b!569240 (= lt!259412 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569241 () Bool)

(assert (=> b!569241 (= e!327491 e!327492)))

(declare-fun res!359263 () Bool)

(assert (=> b!569241 (=> (not res!359263) (not e!327492))))

(declare-fun lt!259410 () SeekEntryResult!5579)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569241 (= res!359263 (or (= lt!259410 (MissingZero!5579 i!1132)) (= lt!259410 (MissingVacant!5579 i!1132))))))

(assert (=> b!569241 (= lt!259410 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569242 () Bool)

(declare-fun res!359256 () Bool)

(assert (=> b!569242 (=> (not res!359256) (not e!327491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569242 (= res!359256 (validKeyInArray!0 (select (arr!17130 a!3118) j!142)))))

(declare-fun b!569243 () Bool)

(declare-fun res!359260 () Bool)

(assert (=> b!569243 (=> (not res!359260) (not e!327491))))

(assert (=> b!569243 (= res!359260 (validKeyInArray!0 k!1914))))

(declare-fun b!569244 () Bool)

(assert (=> b!569244 (= e!327492 e!327490)))

(declare-fun res!359259 () Bool)

(assert (=> b!569244 (=> (not res!359259) (not e!327490))))

(declare-fun lt!259411 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35677 (_ BitVec 32)) SeekEntryResult!5579)

(assert (=> b!569244 (= res!359259 (= lt!259409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259411 (select (store (arr!17130 a!3118) i!1132 k!1914) j!142) (array!35678 (store (arr!17130 a!3118) i!1132 k!1914) (size!17494 a!3118)) mask!3119)))))

(declare-fun lt!259413 () (_ BitVec 32))

(assert (=> b!569244 (= lt!259409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259413 (select (arr!17130 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569244 (= lt!259411 (toIndex!0 (select (store (arr!17130 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569244 (= lt!259413 (toIndex!0 (select (arr!17130 a!3118) j!142) mask!3119))))

(declare-fun res!359262 () Bool)

(assert (=> start!52154 (=> (not res!359262) (not e!327491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52154 (= res!359262 (validMask!0 mask!3119))))

(assert (=> start!52154 e!327491))

(assert (=> start!52154 true))

(declare-fun array_inv!12926 (array!35677) Bool)

(assert (=> start!52154 (array_inv!12926 a!3118)))

(declare-fun b!569245 () Bool)

(declare-fun res!359257 () Bool)

(assert (=> b!569245 (=> (not res!359257) (not e!327492))))

(declare-datatypes ((List!11210 0))(
  ( (Nil!11207) (Cons!11206 (h!12227 (_ BitVec 64)) (t!17438 List!11210)) )
))
(declare-fun arrayNoDuplicates!0 (array!35677 (_ BitVec 32) List!11210) Bool)

(assert (=> b!569245 (= res!359257 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11207))))

(declare-fun b!569246 () Bool)

(declare-fun res!359264 () Bool)

(assert (=> b!569246 (=> (not res!359264) (not e!327491))))

(assert (=> b!569246 (= res!359264 (and (= (size!17494 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17494 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17494 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52154 res!359262) b!569246))

(assert (= (and b!569246 res!359264) b!569242))

(assert (= (and b!569242 res!359256) b!569243))

(assert (= (and b!569243 res!359260) b!569239))

(assert (= (and b!569239 res!359261) b!569241))

(assert (= (and b!569241 res!359263) b!569238))

(assert (= (and b!569238 res!359258) b!569245))

(assert (= (and b!569245 res!359257) b!569244))

(assert (= (and b!569244 res!359259) b!569240))

(declare-fun m!547887 () Bool)

(assert (=> b!569245 m!547887))

(declare-fun m!547889 () Bool)

(assert (=> start!52154 m!547889))

(declare-fun m!547891 () Bool)

(assert (=> start!52154 m!547891))

(declare-fun m!547893 () Bool)

(assert (=> b!569238 m!547893))

(declare-fun m!547895 () Bool)

(assert (=> b!569239 m!547895))

(declare-fun m!547897 () Bool)

(assert (=> b!569241 m!547897))

(declare-fun m!547899 () Bool)

(assert (=> b!569242 m!547899))

(assert (=> b!569242 m!547899))

(declare-fun m!547901 () Bool)

(assert (=> b!569242 m!547901))

(assert (=> b!569240 m!547899))

(declare-fun m!547903 () Bool)

(assert (=> b!569240 m!547903))

(declare-fun m!547905 () Bool)

(assert (=> b!569240 m!547905))

(declare-fun m!547907 () Bool)

(assert (=> b!569240 m!547907))

(assert (=> b!569240 m!547899))

(declare-fun m!547909 () Bool)

(assert (=> b!569240 m!547909))

(declare-fun m!547911 () Bool)

(assert (=> b!569243 m!547911))

(assert (=> b!569244 m!547899))

(declare-fun m!547913 () Bool)

(assert (=> b!569244 m!547913))

(assert (=> b!569244 m!547899))

(declare-fun m!547915 () Bool)

(assert (=> b!569244 m!547915))

(assert (=> b!569244 m!547899))

(declare-fun m!547917 () Bool)

(assert (=> b!569244 m!547917))

(declare-fun m!547919 () Bool)

(assert (=> b!569244 m!547919))

(assert (=> b!569244 m!547917))

(declare-fun m!547921 () Bool)

(assert (=> b!569244 m!547921))

(assert (=> b!569244 m!547917))

(declare-fun m!547923 () Bool)

(assert (=> b!569244 m!547923))

(push 1)

