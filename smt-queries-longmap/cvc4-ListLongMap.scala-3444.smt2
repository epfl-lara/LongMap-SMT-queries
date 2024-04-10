; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47788 () Bool)

(assert start!47788)

(declare-fun b!526348 () Bool)

(declare-fun e!306817 () Bool)

(declare-fun e!306814 () Bool)

(assert (=> b!526348 (= e!306817 e!306814)))

(declare-fun res!322985 () Bool)

(assert (=> b!526348 (=> (not res!322985) (not e!306814))))

(declare-datatypes ((SeekEntryResult!4531 0))(
  ( (MissingZero!4531 (index!20336 (_ BitVec 32))) (Found!4531 (index!20337 (_ BitVec 32))) (Intermediate!4531 (undefined!5343 Bool) (index!20338 (_ BitVec 32)) (x!49304 (_ BitVec 32))) (Undefined!4531) (MissingVacant!4531 (index!20339 (_ BitVec 32))) )
))
(declare-fun lt!242052 () SeekEntryResult!4531)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526348 (= res!322985 (or (= lt!242052 (MissingZero!4531 i!1204)) (= lt!242052 (MissingVacant!4531 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33425 0))(
  ( (array!33426 (arr!16064 (Array (_ BitVec 32) (_ BitVec 64))) (size!16428 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33425)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33425 (_ BitVec 32)) SeekEntryResult!4531)

(assert (=> b!526348 (= lt!242052 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!526349 () Bool)

(declare-fun res!322987 () Bool)

(declare-fun e!306818 () Bool)

(assert (=> b!526349 (=> res!322987 e!306818)))

(declare-fun lt!242045 () SeekEntryResult!4531)

(assert (=> b!526349 (= res!322987 (or (undefined!5343 lt!242045) (not (is-Intermediate!4531 lt!242045))))))

(declare-fun b!526350 () Bool)

(declare-fun res!322993 () Bool)

(assert (=> b!526350 (=> (not res!322993) (not e!306814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33425 (_ BitVec 32)) Bool)

(assert (=> b!526350 (= res!322993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526351 () Bool)

(declare-fun res!322990 () Bool)

(assert (=> b!526351 (=> (not res!322990) (not e!306817))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526351 (= res!322990 (validKeyInArray!0 (select (arr!16064 a!3235) j!176)))))

(declare-fun b!526352 () Bool)

(declare-datatypes ((Unit!16576 0))(
  ( (Unit!16577) )
))
(declare-fun e!306816 () Unit!16576)

(declare-fun Unit!16578 () Unit!16576)

(assert (=> b!526352 (= e!306816 Unit!16578)))

(declare-fun b!526353 () Bool)

(declare-fun res!322991 () Bool)

(assert (=> b!526353 (=> (not res!322991) (not e!306817))))

(assert (=> b!526353 (= res!322991 (and (= (size!16428 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16428 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16428 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526354 () Bool)

(declare-fun e!306815 () Bool)

(assert (=> b!526354 (= e!306815 false)))

(declare-fun b!526355 () Bool)

(declare-fun res!322988 () Bool)

(assert (=> b!526355 (=> (not res!322988) (not e!306817))))

(declare-fun arrayContainsKey!0 (array!33425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526355 (= res!322988 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526356 () Bool)

(declare-fun res!322986 () Bool)

(assert (=> b!526356 (=> (not res!322986) (not e!306814))))

(declare-datatypes ((List!10222 0))(
  ( (Nil!10219) (Cons!10218 (h!11149 (_ BitVec 64)) (t!16450 List!10222)) )
))
(declare-fun arrayNoDuplicates!0 (array!33425 (_ BitVec 32) List!10222) Bool)

(assert (=> b!526356 (= res!322986 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10219))))

(declare-fun b!526358 () Bool)

(declare-fun res!322983 () Bool)

(assert (=> b!526358 (=> (not res!322983) (not e!306817))))

(assert (=> b!526358 (= res!322983 (validKeyInArray!0 k!2280))))

(declare-fun b!526359 () Bool)

(declare-fun Unit!16579 () Unit!16576)

(assert (=> b!526359 (= e!306816 Unit!16579)))

(declare-fun lt!242051 () (_ BitVec 32))

(declare-fun lt!242048 () Unit!16576)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16576)

(assert (=> b!526359 (= lt!242048 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242051 #b00000000000000000000000000000000 (index!20338 lt!242045) (x!49304 lt!242045) mask!3524))))

(declare-fun res!322989 () Bool)

(declare-fun lt!242046 () array!33425)

(declare-fun lt!242047 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33425 (_ BitVec 32)) SeekEntryResult!4531)

(assert (=> b!526359 (= res!322989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242051 lt!242047 lt!242046 mask!3524) (Intermediate!4531 false (index!20338 lt!242045) (x!49304 lt!242045))))))

(assert (=> b!526359 (=> (not res!322989) (not e!306815))))

(assert (=> b!526359 e!306815))

(declare-fun b!526360 () Bool)

(declare-fun e!306813 () Bool)

(assert (=> b!526360 (= e!306813 (= (seekEntryOrOpen!0 (select (arr!16064 a!3235) j!176) a!3235 mask!3524) (Found!4531 j!176)))))

(declare-fun b!526361 () Bool)

(assert (=> b!526361 (= e!306814 (not e!306818))))

(declare-fun res!322992 () Bool)

(assert (=> b!526361 (=> res!322992 e!306818)))

(declare-fun lt!242044 () (_ BitVec 32))

(assert (=> b!526361 (= res!322992 (= lt!242045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242044 lt!242047 lt!242046 mask!3524)))))

(assert (=> b!526361 (= lt!242045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242051 (select (arr!16064 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526361 (= lt!242044 (toIndex!0 lt!242047 mask!3524))))

(assert (=> b!526361 (= lt!242047 (select (store (arr!16064 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526361 (= lt!242051 (toIndex!0 (select (arr!16064 a!3235) j!176) mask!3524))))

(assert (=> b!526361 (= lt!242046 (array!33426 (store (arr!16064 a!3235) i!1204 k!2280) (size!16428 a!3235)))))

(assert (=> b!526361 e!306813))

(declare-fun res!322994 () Bool)

(assert (=> b!526361 (=> (not res!322994) (not e!306813))))

(assert (=> b!526361 (= res!322994 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242049 () Unit!16576)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16576)

(assert (=> b!526361 (= lt!242049 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526357 () Bool)

(assert (=> b!526357 (= e!306818 true)))

(assert (=> b!526357 (= (index!20338 lt!242045) i!1204)))

(declare-fun lt!242053 () Unit!16576)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16576)

(assert (=> b!526357 (= lt!242053 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242051 #b00000000000000000000000000000000 (index!20338 lt!242045) (x!49304 lt!242045) mask!3524))))

(assert (=> b!526357 (and (or (= (select (arr!16064 a!3235) (index!20338 lt!242045)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16064 a!3235) (index!20338 lt!242045)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16064 a!3235) (index!20338 lt!242045)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16064 a!3235) (index!20338 lt!242045)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242050 () Unit!16576)

(assert (=> b!526357 (= lt!242050 e!306816)))

(declare-fun c!61988 () Bool)

(assert (=> b!526357 (= c!61988 (= (select (arr!16064 a!3235) (index!20338 lt!242045)) (select (arr!16064 a!3235) j!176)))))

(assert (=> b!526357 (and (bvslt (x!49304 lt!242045) #b01111111111111111111111111111110) (or (= (select (arr!16064 a!3235) (index!20338 lt!242045)) (select (arr!16064 a!3235) j!176)) (= (select (arr!16064 a!3235) (index!20338 lt!242045)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16064 a!3235) (index!20338 lt!242045)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!322984 () Bool)

(assert (=> start!47788 (=> (not res!322984) (not e!306817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47788 (= res!322984 (validMask!0 mask!3524))))

(assert (=> start!47788 e!306817))

(assert (=> start!47788 true))

(declare-fun array_inv!11860 (array!33425) Bool)

(assert (=> start!47788 (array_inv!11860 a!3235)))

(assert (= (and start!47788 res!322984) b!526353))

(assert (= (and b!526353 res!322991) b!526351))

(assert (= (and b!526351 res!322990) b!526358))

(assert (= (and b!526358 res!322983) b!526355))

(assert (= (and b!526355 res!322988) b!526348))

(assert (= (and b!526348 res!322985) b!526350))

(assert (= (and b!526350 res!322993) b!526356))

(assert (= (and b!526356 res!322986) b!526361))

(assert (= (and b!526361 res!322994) b!526360))

(assert (= (and b!526361 (not res!322992)) b!526349))

(assert (= (and b!526349 (not res!322987)) b!526357))

(assert (= (and b!526357 c!61988) b!526359))

(assert (= (and b!526357 (not c!61988)) b!526352))

(assert (= (and b!526359 res!322989) b!526354))

(declare-fun m!507049 () Bool)

(assert (=> b!526361 m!507049))

(declare-fun m!507051 () Bool)

(assert (=> b!526361 m!507051))

(declare-fun m!507053 () Bool)

(assert (=> b!526361 m!507053))

(declare-fun m!507055 () Bool)

(assert (=> b!526361 m!507055))

(declare-fun m!507057 () Bool)

(assert (=> b!526361 m!507057))

(assert (=> b!526361 m!507055))

(declare-fun m!507059 () Bool)

(assert (=> b!526361 m!507059))

(declare-fun m!507061 () Bool)

(assert (=> b!526361 m!507061))

(assert (=> b!526361 m!507055))

(declare-fun m!507063 () Bool)

(assert (=> b!526361 m!507063))

(declare-fun m!507065 () Bool)

(assert (=> b!526361 m!507065))

(declare-fun m!507067 () Bool)

(assert (=> b!526358 m!507067))

(declare-fun m!507069 () Bool)

(assert (=> b!526357 m!507069))

(declare-fun m!507071 () Bool)

(assert (=> b!526357 m!507071))

(assert (=> b!526357 m!507055))

(declare-fun m!507073 () Bool)

(assert (=> b!526359 m!507073))

(declare-fun m!507075 () Bool)

(assert (=> b!526359 m!507075))

(assert (=> b!526360 m!507055))

(assert (=> b!526360 m!507055))

(declare-fun m!507077 () Bool)

(assert (=> b!526360 m!507077))

(declare-fun m!507079 () Bool)

(assert (=> b!526348 m!507079))

(declare-fun m!507081 () Bool)

(assert (=> b!526355 m!507081))

(declare-fun m!507083 () Bool)

(assert (=> b!526350 m!507083))

(declare-fun m!507085 () Bool)

(assert (=> start!47788 m!507085))

(declare-fun m!507087 () Bool)

(assert (=> start!47788 m!507087))

(assert (=> b!526351 m!507055))

(assert (=> b!526351 m!507055))

(declare-fun m!507089 () Bool)

(assert (=> b!526351 m!507089))

(declare-fun m!507091 () Bool)

(assert (=> b!526356 m!507091))

(push 1)

