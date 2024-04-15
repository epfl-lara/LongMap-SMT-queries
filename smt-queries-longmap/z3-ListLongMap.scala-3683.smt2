; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50702 () Bool)

(assert start!50702)

(declare-fun b!554361 () Bool)

(declare-fun e!319603 () Bool)

(assert (=> b!554361 (= e!319603 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5224 0))(
  ( (MissingZero!5224 (index!23123 (_ BitVec 32))) (Found!5224 (index!23124 (_ BitVec 32))) (Intermediate!5224 (undefined!6036 Bool) (index!23125 (_ BitVec 32)) (x!52045 (_ BitVec 32))) (Undefined!5224) (MissingVacant!5224 (index!23126 (_ BitVec 32))) )
))
(declare-fun lt!251646 () SeekEntryResult!5224)

(declare-datatypes ((array!34936 0))(
  ( (array!34937 (arr!16778 (Array (_ BitVec 32) (_ BitVec 64))) (size!17143 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34936)

(declare-fun lt!251644 () SeekEntryResult!5224)

(get-info :version)

(assert (=> b!554361 (and (= lt!251644 (Found!5224 j!142)) (or (undefined!6036 lt!251646) (not ((_ is Intermediate!5224) lt!251646)) (= (select (arr!16778 a!3118) (index!23125 lt!251646)) (select (arr!16778 a!3118) j!142)) (not (= (select (arr!16778 a!3118) (index!23125 lt!251646)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251644 (MissingZero!5224 (index!23125 lt!251646)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34936 (_ BitVec 32)) SeekEntryResult!5224)

(assert (=> b!554361 (= lt!251644 (seekEntryOrOpen!0 (select (arr!16778 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34936 (_ BitVec 32)) Bool)

(assert (=> b!554361 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17208 0))(
  ( (Unit!17209) )
))
(declare-fun lt!251645 () Unit!17208)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17208)

(assert (=> b!554361 (= lt!251645 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554362 () Bool)

(declare-fun res!346919 () Bool)

(declare-fun e!319605 () Bool)

(assert (=> b!554362 (=> (not res!346919) (not e!319605))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554362 (= res!346919 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554363 () Bool)

(declare-fun res!346920 () Bool)

(assert (=> b!554363 (=> (not res!346920) (not e!319605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554363 (= res!346920 (validKeyInArray!0 (select (arr!16778 a!3118) j!142)))))

(declare-fun b!554364 () Bool)

(declare-fun res!346914 () Bool)

(assert (=> b!554364 (=> (not res!346914) (not e!319605))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554364 (= res!346914 (and (= (size!17143 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17143 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17143 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554365 () Bool)

(declare-fun res!346921 () Bool)

(declare-fun e!319604 () Bool)

(assert (=> b!554365 (=> (not res!346921) (not e!319604))))

(declare-datatypes ((List!10897 0))(
  ( (Nil!10894) (Cons!10893 (h!11878 (_ BitVec 64)) (t!17116 List!10897)) )
))
(declare-fun arrayNoDuplicates!0 (array!34936 (_ BitVec 32) List!10897) Bool)

(assert (=> b!554365 (= res!346921 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10894))))

(declare-fun b!554366 () Bool)

(declare-fun res!346922 () Bool)

(assert (=> b!554366 (=> (not res!346922) (not e!319605))))

(assert (=> b!554366 (= res!346922 (validKeyInArray!0 k0!1914))))

(declare-fun b!554367 () Bool)

(assert (=> b!554367 (= e!319604 e!319603)))

(declare-fun res!346917 () Bool)

(assert (=> b!554367 (=> (not res!346917) (not e!319603))))

(declare-fun lt!251647 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34936 (_ BitVec 32)) SeekEntryResult!5224)

(assert (=> b!554367 (= res!346917 (= lt!251646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251647 (select (store (arr!16778 a!3118) i!1132 k0!1914) j!142) (array!34937 (store (arr!16778 a!3118) i!1132 k0!1914) (size!17143 a!3118)) mask!3119)))))

(declare-fun lt!251642 () (_ BitVec 32))

(assert (=> b!554367 (= lt!251646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251642 (select (arr!16778 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554367 (= lt!251647 (toIndex!0 (select (store (arr!16778 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554367 (= lt!251642 (toIndex!0 (select (arr!16778 a!3118) j!142) mask!3119))))

(declare-fun b!554368 () Bool)

(declare-fun res!346915 () Bool)

(assert (=> b!554368 (=> (not res!346915) (not e!319604))))

(assert (=> b!554368 (= res!346915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554360 () Bool)

(assert (=> b!554360 (= e!319605 e!319604)))

(declare-fun res!346916 () Bool)

(assert (=> b!554360 (=> (not res!346916) (not e!319604))))

(declare-fun lt!251643 () SeekEntryResult!5224)

(assert (=> b!554360 (= res!346916 (or (= lt!251643 (MissingZero!5224 i!1132)) (= lt!251643 (MissingVacant!5224 i!1132))))))

(assert (=> b!554360 (= lt!251643 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!346918 () Bool)

(assert (=> start!50702 (=> (not res!346918) (not e!319605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50702 (= res!346918 (validMask!0 mask!3119))))

(assert (=> start!50702 e!319605))

(assert (=> start!50702 true))

(declare-fun array_inv!12661 (array!34936) Bool)

(assert (=> start!50702 (array_inv!12661 a!3118)))

(assert (= (and start!50702 res!346918) b!554364))

(assert (= (and b!554364 res!346914) b!554363))

(assert (= (and b!554363 res!346920) b!554366))

(assert (= (and b!554366 res!346922) b!554362))

(assert (= (and b!554362 res!346919) b!554360))

(assert (= (and b!554360 res!346916) b!554368))

(assert (= (and b!554368 res!346915) b!554365))

(assert (= (and b!554365 res!346921) b!554367))

(assert (= (and b!554367 res!346917) b!554361))

(declare-fun m!531215 () Bool)

(assert (=> b!554361 m!531215))

(declare-fun m!531217 () Bool)

(assert (=> b!554361 m!531217))

(declare-fun m!531219 () Bool)

(assert (=> b!554361 m!531219))

(declare-fun m!531221 () Bool)

(assert (=> b!554361 m!531221))

(assert (=> b!554361 m!531215))

(declare-fun m!531223 () Bool)

(assert (=> b!554361 m!531223))

(declare-fun m!531225 () Bool)

(assert (=> b!554368 m!531225))

(assert (=> b!554367 m!531215))

(declare-fun m!531227 () Bool)

(assert (=> b!554367 m!531227))

(assert (=> b!554367 m!531215))

(declare-fun m!531229 () Bool)

(assert (=> b!554367 m!531229))

(assert (=> b!554367 m!531215))

(declare-fun m!531231 () Bool)

(assert (=> b!554367 m!531231))

(assert (=> b!554367 m!531231))

(declare-fun m!531233 () Bool)

(assert (=> b!554367 m!531233))

(declare-fun m!531235 () Bool)

(assert (=> b!554367 m!531235))

(assert (=> b!554367 m!531231))

(declare-fun m!531237 () Bool)

(assert (=> b!554367 m!531237))

(declare-fun m!531239 () Bool)

(assert (=> start!50702 m!531239))

(declare-fun m!531241 () Bool)

(assert (=> start!50702 m!531241))

(declare-fun m!531243 () Bool)

(assert (=> b!554366 m!531243))

(declare-fun m!531245 () Bool)

(assert (=> b!554362 m!531245))

(assert (=> b!554363 m!531215))

(assert (=> b!554363 m!531215))

(declare-fun m!531247 () Bool)

(assert (=> b!554363 m!531247))

(declare-fun m!531249 () Bool)

(assert (=> b!554365 m!531249))

(declare-fun m!531251 () Bool)

(assert (=> b!554360 m!531251))

(check-sat (not b!554360) (not b!554362) (not start!50702) (not b!554361) (not b!554365) (not b!554366) (not b!554363) (not b!554368) (not b!554367))
(check-sat)
