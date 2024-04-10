; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47736 () Bool)

(assert start!47736)

(declare-fun b!525256 () Bool)

(declare-fun res!322053 () Bool)

(declare-fun e!306268 () Bool)

(assert (=> b!525256 (=> (not res!322053) (not e!306268))))

(declare-datatypes ((array!33373 0))(
  ( (array!33374 (arr!16038 (Array (_ BitVec 32) (_ BitVec 64))) (size!16402 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33373)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33373 (_ BitVec 32)) Bool)

(assert (=> b!525256 (= res!322053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525257 () Bool)

(declare-datatypes ((Unit!16472 0))(
  ( (Unit!16473) )
))
(declare-fun e!306270 () Unit!16472)

(declare-fun Unit!16474 () Unit!16472)

(assert (=> b!525257 (= e!306270 Unit!16474)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!241268 () Unit!16472)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!241269 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4505 0))(
  ( (MissingZero!4505 (index!20232 (_ BitVec 32))) (Found!4505 (index!20233 (_ BitVec 32))) (Intermediate!4505 (undefined!5317 Bool) (index!20234 (_ BitVec 32)) (x!49214 (_ BitVec 32))) (Undefined!4505) (MissingVacant!4505 (index!20235 (_ BitVec 32))) )
))
(declare-fun lt!241273 () SeekEntryResult!4505)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33373 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16472)

(assert (=> b!525257 (= lt!241268 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241269 #b00000000000000000000000000000000 (index!20234 lt!241273) (x!49214 lt!241273) mask!3524))))

(declare-fun lt!241264 () (_ BitVec 64))

(declare-fun lt!241266 () array!33373)

(declare-fun res!322055 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33373 (_ BitVec 32)) SeekEntryResult!4505)

(assert (=> b!525257 (= res!322055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241269 lt!241264 lt!241266 mask!3524) (Intermediate!4505 false (index!20234 lt!241273) (x!49214 lt!241273))))))

(declare-fun e!306267 () Bool)

(assert (=> b!525257 (=> (not res!322055) (not e!306267))))

(assert (=> b!525257 e!306267))

(declare-fun b!525258 () Bool)

(declare-fun res!322047 () Bool)

(declare-fun e!306271 () Bool)

(assert (=> b!525258 (=> (not res!322047) (not e!306271))))

(assert (=> b!525258 (= res!322047 (and (= (size!16402 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16402 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16402 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525259 () Bool)

(declare-fun e!306269 () Bool)

(assert (=> b!525259 (= e!306268 (not e!306269))))

(declare-fun res!322048 () Bool)

(assert (=> b!525259 (=> res!322048 e!306269)))

(declare-fun lt!241265 () (_ BitVec 32))

(assert (=> b!525259 (= res!322048 (= lt!241273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241265 lt!241264 lt!241266 mask!3524)))))

(assert (=> b!525259 (= lt!241273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241269 (select (arr!16038 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525259 (= lt!241265 (toIndex!0 lt!241264 mask!3524))))

(assert (=> b!525259 (= lt!241264 (select (store (arr!16038 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525259 (= lt!241269 (toIndex!0 (select (arr!16038 a!3235) j!176) mask!3524))))

(assert (=> b!525259 (= lt!241266 (array!33374 (store (arr!16038 a!3235) i!1204 k!2280) (size!16402 a!3235)))))

(declare-fun e!306272 () Bool)

(assert (=> b!525259 e!306272))

(declare-fun res!322056 () Bool)

(assert (=> b!525259 (=> (not res!322056) (not e!306272))))

(assert (=> b!525259 (= res!322056 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241272 () Unit!16472)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33373 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16472)

(assert (=> b!525259 (= lt!241272 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525260 () Bool)

(assert (=> b!525260 (= e!306269 true)))

(assert (=> b!525260 (= (index!20234 lt!241273) i!1204)))

(declare-fun lt!241271 () Unit!16472)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33373 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16472)

(assert (=> b!525260 (= lt!241271 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241269 #b00000000000000000000000000000000 (index!20234 lt!241273) (x!49214 lt!241273) mask!3524))))

(assert (=> b!525260 (and (or (= (select (arr!16038 a!3235) (index!20234 lt!241273)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16038 a!3235) (index!20234 lt!241273)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16038 a!3235) (index!20234 lt!241273)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16038 a!3235) (index!20234 lt!241273)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241267 () Unit!16472)

(assert (=> b!525260 (= lt!241267 e!306270)))

(declare-fun c!61910 () Bool)

(assert (=> b!525260 (= c!61910 (= (select (arr!16038 a!3235) (index!20234 lt!241273)) (select (arr!16038 a!3235) j!176)))))

(assert (=> b!525260 (and (bvslt (x!49214 lt!241273) #b01111111111111111111111111111110) (or (= (select (arr!16038 a!3235) (index!20234 lt!241273)) (select (arr!16038 a!3235) j!176)) (= (select (arr!16038 a!3235) (index!20234 lt!241273)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16038 a!3235) (index!20234 lt!241273)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525261 () Bool)

(declare-fun res!322052 () Bool)

(assert (=> b!525261 (=> (not res!322052) (not e!306271))))

(declare-fun arrayContainsKey!0 (array!33373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525261 (= res!322052 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525262 () Bool)

(declare-fun res!322058 () Bool)

(assert (=> b!525262 (=> (not res!322058) (not e!306268))))

(declare-datatypes ((List!10196 0))(
  ( (Nil!10193) (Cons!10192 (h!11123 (_ BitVec 64)) (t!16424 List!10196)) )
))
(declare-fun arrayNoDuplicates!0 (array!33373 (_ BitVec 32) List!10196) Bool)

(assert (=> b!525262 (= res!322058 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10193))))

(declare-fun b!525263 () Bool)

(declare-fun Unit!16475 () Unit!16472)

(assert (=> b!525263 (= e!306270 Unit!16475)))

(declare-fun b!525264 () Bool)

(declare-fun res!322051 () Bool)

(assert (=> b!525264 (=> res!322051 e!306269)))

(assert (=> b!525264 (= res!322051 (or (undefined!5317 lt!241273) (not (is-Intermediate!4505 lt!241273))))))

(declare-fun res!322054 () Bool)

(assert (=> start!47736 (=> (not res!322054) (not e!306271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47736 (= res!322054 (validMask!0 mask!3524))))

(assert (=> start!47736 e!306271))

(assert (=> start!47736 true))

(declare-fun array_inv!11834 (array!33373) Bool)

(assert (=> start!47736 (array_inv!11834 a!3235)))

(declare-fun b!525265 () Bool)

(declare-fun res!322049 () Bool)

(assert (=> b!525265 (=> (not res!322049) (not e!306271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525265 (= res!322049 (validKeyInArray!0 k!2280))))

(declare-fun b!525266 () Bool)

(declare-fun res!322057 () Bool)

(assert (=> b!525266 (=> (not res!322057) (not e!306271))))

(assert (=> b!525266 (= res!322057 (validKeyInArray!0 (select (arr!16038 a!3235) j!176)))))

(declare-fun b!525267 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33373 (_ BitVec 32)) SeekEntryResult!4505)

(assert (=> b!525267 (= e!306272 (= (seekEntryOrOpen!0 (select (arr!16038 a!3235) j!176) a!3235 mask!3524) (Found!4505 j!176)))))

(declare-fun b!525268 () Bool)

(assert (=> b!525268 (= e!306267 false)))

(declare-fun b!525269 () Bool)

(assert (=> b!525269 (= e!306271 e!306268)))

(declare-fun res!322050 () Bool)

(assert (=> b!525269 (=> (not res!322050) (not e!306268))))

(declare-fun lt!241270 () SeekEntryResult!4505)

(assert (=> b!525269 (= res!322050 (or (= lt!241270 (MissingZero!4505 i!1204)) (= lt!241270 (MissingVacant!4505 i!1204))))))

(assert (=> b!525269 (= lt!241270 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!47736 res!322054) b!525258))

(assert (= (and b!525258 res!322047) b!525266))

(assert (= (and b!525266 res!322057) b!525265))

(assert (= (and b!525265 res!322049) b!525261))

(assert (= (and b!525261 res!322052) b!525269))

(assert (= (and b!525269 res!322050) b!525256))

(assert (= (and b!525256 res!322053) b!525262))

(assert (= (and b!525262 res!322058) b!525259))

(assert (= (and b!525259 res!322056) b!525267))

(assert (= (and b!525259 (not res!322048)) b!525264))

(assert (= (and b!525264 (not res!322051)) b!525260))

(assert (= (and b!525260 c!61910) b!525257))

(assert (= (and b!525260 (not c!61910)) b!525263))

(assert (= (and b!525257 res!322055) b!525268))

(declare-fun m!505905 () Bool)

(assert (=> b!525262 m!505905))

(declare-fun m!505907 () Bool)

(assert (=> b!525269 m!505907))

(declare-fun m!505909 () Bool)

(assert (=> b!525256 m!505909))

(declare-fun m!505911 () Bool)

(assert (=> b!525266 m!505911))

(assert (=> b!525266 m!505911))

(declare-fun m!505913 () Bool)

(assert (=> b!525266 m!505913))

(declare-fun m!505915 () Bool)

(assert (=> start!47736 m!505915))

(declare-fun m!505917 () Bool)

(assert (=> start!47736 m!505917))

(declare-fun m!505919 () Bool)

(assert (=> b!525260 m!505919))

(declare-fun m!505921 () Bool)

(assert (=> b!525260 m!505921))

(assert (=> b!525260 m!505911))

(declare-fun m!505923 () Bool)

(assert (=> b!525259 m!505923))

(declare-fun m!505925 () Bool)

(assert (=> b!525259 m!505925))

(declare-fun m!505927 () Bool)

(assert (=> b!525259 m!505927))

(declare-fun m!505929 () Bool)

(assert (=> b!525259 m!505929))

(assert (=> b!525259 m!505911))

(declare-fun m!505931 () Bool)

(assert (=> b!525259 m!505931))

(assert (=> b!525259 m!505911))

(declare-fun m!505933 () Bool)

(assert (=> b!525259 m!505933))

(declare-fun m!505935 () Bool)

(assert (=> b!525259 m!505935))

(assert (=> b!525259 m!505911))

(declare-fun m!505937 () Bool)

(assert (=> b!525259 m!505937))

(assert (=> b!525267 m!505911))

(assert (=> b!525267 m!505911))

(declare-fun m!505939 () Bool)

(assert (=> b!525267 m!505939))

(declare-fun m!505941 () Bool)

(assert (=> b!525261 m!505941))

(declare-fun m!505943 () Bool)

(assert (=> b!525257 m!505943))

(declare-fun m!505945 () Bool)

(assert (=> b!525257 m!505945))

(declare-fun m!505947 () Bool)

(assert (=> b!525265 m!505947))

(push 1)

