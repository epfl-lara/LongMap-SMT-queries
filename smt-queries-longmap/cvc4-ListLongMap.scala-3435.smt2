; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47734 () Bool)

(assert start!47734)

(declare-fun res!322012 () Bool)

(declare-fun e!306246 () Bool)

(assert (=> start!47734 (=> (not res!322012) (not e!306246))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47734 (= res!322012 (validMask!0 mask!3524))))

(assert (=> start!47734 e!306246))

(assert (=> start!47734 true))

(declare-datatypes ((array!33371 0))(
  ( (array!33372 (arr!16037 (Array (_ BitVec 32) (_ BitVec 64))) (size!16401 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33371)

(declare-fun array_inv!11833 (array!33371) Bool)

(assert (=> start!47734 (array_inv!11833 a!3235)))

(declare-fun b!525214 () Bool)

(declare-fun res!322022 () Bool)

(assert (=> b!525214 (=> (not res!322022) (not e!306246))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525214 (= res!322022 (validKeyInArray!0 k!2280))))

(declare-fun b!525215 () Bool)

(declare-fun res!322020 () Bool)

(assert (=> b!525215 (=> (not res!322020) (not e!306246))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525215 (= res!322020 (and (= (size!16401 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16401 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16401 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525216 () Bool)

(declare-fun res!322014 () Bool)

(assert (=> b!525216 (=> (not res!322014) (not e!306246))))

(declare-fun arrayContainsKey!0 (array!33371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525216 (= res!322014 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525217 () Bool)

(declare-fun res!322015 () Bool)

(assert (=> b!525217 (=> (not res!322015) (not e!306246))))

(assert (=> b!525217 (= res!322015 (validKeyInArray!0 (select (arr!16037 a!3235) j!176)))))

(declare-fun b!525218 () Bool)

(declare-fun res!322017 () Bool)

(declare-fun e!306250 () Bool)

(assert (=> b!525218 (=> res!322017 e!306250)))

(declare-datatypes ((SeekEntryResult!4504 0))(
  ( (MissingZero!4504 (index!20228 (_ BitVec 32))) (Found!4504 (index!20229 (_ BitVec 32))) (Intermediate!4504 (undefined!5316 Bool) (index!20230 (_ BitVec 32)) (x!49205 (_ BitVec 32))) (Undefined!4504) (MissingVacant!4504 (index!20231 (_ BitVec 32))) )
))
(declare-fun lt!241240 () SeekEntryResult!4504)

(assert (=> b!525218 (= res!322017 (or (undefined!5316 lt!241240) (not (is-Intermediate!4504 lt!241240))))))

(declare-fun b!525219 () Bool)

(assert (=> b!525219 (= e!306250 true)))

(assert (=> b!525219 (= (index!20230 lt!241240) i!1204)))

(declare-datatypes ((Unit!16468 0))(
  ( (Unit!16469) )
))
(declare-fun lt!241241 () Unit!16468)

(declare-fun lt!241239 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16468)

(assert (=> b!525219 (= lt!241241 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241239 #b00000000000000000000000000000000 (index!20230 lt!241240) (x!49205 lt!241240) mask!3524))))

(assert (=> b!525219 (and (or (= (select (arr!16037 a!3235) (index!20230 lt!241240)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16037 a!3235) (index!20230 lt!241240)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16037 a!3235) (index!20230 lt!241240)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16037 a!3235) (index!20230 lt!241240)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241237 () Unit!16468)

(declare-fun e!306247 () Unit!16468)

(assert (=> b!525219 (= lt!241237 e!306247)))

(declare-fun c!61907 () Bool)

(assert (=> b!525219 (= c!61907 (= (select (arr!16037 a!3235) (index!20230 lt!241240)) (select (arr!16037 a!3235) j!176)))))

(assert (=> b!525219 (and (bvslt (x!49205 lt!241240) #b01111111111111111111111111111110) (or (= (select (arr!16037 a!3235) (index!20230 lt!241240)) (select (arr!16037 a!3235) j!176)) (= (select (arr!16037 a!3235) (index!20230 lt!241240)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16037 a!3235) (index!20230 lt!241240)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525220 () Bool)

(declare-fun res!322016 () Bool)

(declare-fun e!306249 () Bool)

(assert (=> b!525220 (=> (not res!322016) (not e!306249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33371 (_ BitVec 32)) Bool)

(assert (=> b!525220 (= res!322016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525221 () Bool)

(declare-fun res!322018 () Bool)

(assert (=> b!525221 (=> (not res!322018) (not e!306249))))

(declare-datatypes ((List!10195 0))(
  ( (Nil!10192) (Cons!10191 (h!11122 (_ BitVec 64)) (t!16423 List!10195)) )
))
(declare-fun arrayNoDuplicates!0 (array!33371 (_ BitVec 32) List!10195) Bool)

(assert (=> b!525221 (= res!322018 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10192))))

(declare-fun b!525222 () Bool)

(assert (=> b!525222 (= e!306249 (not e!306250))))

(declare-fun res!322021 () Bool)

(assert (=> b!525222 (=> res!322021 e!306250)))

(declare-fun lt!241236 () array!33371)

(declare-fun lt!241238 () (_ BitVec 64))

(declare-fun lt!241242 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33371 (_ BitVec 32)) SeekEntryResult!4504)

(assert (=> b!525222 (= res!322021 (= lt!241240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241242 lt!241238 lt!241236 mask!3524)))))

(assert (=> b!525222 (= lt!241240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241239 (select (arr!16037 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525222 (= lt!241242 (toIndex!0 lt!241238 mask!3524))))

(assert (=> b!525222 (= lt!241238 (select (store (arr!16037 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525222 (= lt!241239 (toIndex!0 (select (arr!16037 a!3235) j!176) mask!3524))))

(assert (=> b!525222 (= lt!241236 (array!33372 (store (arr!16037 a!3235) i!1204 k!2280) (size!16401 a!3235)))))

(declare-fun e!306251 () Bool)

(assert (=> b!525222 e!306251))

(declare-fun res!322019 () Bool)

(assert (=> b!525222 (=> (not res!322019) (not e!306251))))

(assert (=> b!525222 (= res!322019 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241234 () Unit!16468)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16468)

(assert (=> b!525222 (= lt!241234 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525223 () Bool)

(declare-fun Unit!16470 () Unit!16468)

(assert (=> b!525223 (= e!306247 Unit!16470)))

(declare-fun b!525224 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33371 (_ BitVec 32)) SeekEntryResult!4504)

(assert (=> b!525224 (= e!306251 (= (seekEntryOrOpen!0 (select (arr!16037 a!3235) j!176) a!3235 mask!3524) (Found!4504 j!176)))))

(declare-fun b!525225 () Bool)

(declare-fun e!306252 () Bool)

(assert (=> b!525225 (= e!306252 false)))

(declare-fun b!525226 () Bool)

(declare-fun Unit!16471 () Unit!16468)

(assert (=> b!525226 (= e!306247 Unit!16471)))

(declare-fun lt!241235 () Unit!16468)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16468)

(assert (=> b!525226 (= lt!241235 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241239 #b00000000000000000000000000000000 (index!20230 lt!241240) (x!49205 lt!241240) mask!3524))))

(declare-fun res!322011 () Bool)

(assert (=> b!525226 (= res!322011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241239 lt!241238 lt!241236 mask!3524) (Intermediate!4504 false (index!20230 lt!241240) (x!49205 lt!241240))))))

(assert (=> b!525226 (=> (not res!322011) (not e!306252))))

(assert (=> b!525226 e!306252))

(declare-fun b!525227 () Bool)

(assert (=> b!525227 (= e!306246 e!306249)))

(declare-fun res!322013 () Bool)

(assert (=> b!525227 (=> (not res!322013) (not e!306249))))

(declare-fun lt!241243 () SeekEntryResult!4504)

(assert (=> b!525227 (= res!322013 (or (= lt!241243 (MissingZero!4504 i!1204)) (= lt!241243 (MissingVacant!4504 i!1204))))))

(assert (=> b!525227 (= lt!241243 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!47734 res!322012) b!525215))

(assert (= (and b!525215 res!322020) b!525217))

(assert (= (and b!525217 res!322015) b!525214))

(assert (= (and b!525214 res!322022) b!525216))

(assert (= (and b!525216 res!322014) b!525227))

(assert (= (and b!525227 res!322013) b!525220))

(assert (= (and b!525220 res!322016) b!525221))

(assert (= (and b!525221 res!322018) b!525222))

(assert (= (and b!525222 res!322019) b!525224))

(assert (= (and b!525222 (not res!322021)) b!525218))

(assert (= (and b!525218 (not res!322017)) b!525219))

(assert (= (and b!525219 c!61907) b!525226))

(assert (= (and b!525219 (not c!61907)) b!525223))

(assert (= (and b!525226 res!322011) b!525225))

(declare-fun m!505861 () Bool)

(assert (=> b!525221 m!505861))

(declare-fun m!505863 () Bool)

(assert (=> b!525220 m!505863))

(declare-fun m!505865 () Bool)

(assert (=> b!525222 m!505865))

(declare-fun m!505867 () Bool)

(assert (=> b!525222 m!505867))

(declare-fun m!505869 () Bool)

(assert (=> b!525222 m!505869))

(declare-fun m!505871 () Bool)

(assert (=> b!525222 m!505871))

(declare-fun m!505873 () Bool)

(assert (=> b!525222 m!505873))

(declare-fun m!505875 () Bool)

(assert (=> b!525222 m!505875))

(assert (=> b!525222 m!505873))

(declare-fun m!505877 () Bool)

(assert (=> b!525222 m!505877))

(declare-fun m!505879 () Bool)

(assert (=> b!525222 m!505879))

(declare-fun m!505881 () Bool)

(assert (=> b!525222 m!505881))

(assert (=> b!525222 m!505873))

(declare-fun m!505883 () Bool)

(assert (=> b!525226 m!505883))

(declare-fun m!505885 () Bool)

(assert (=> b!525226 m!505885))

(declare-fun m!505887 () Bool)

(assert (=> b!525219 m!505887))

(declare-fun m!505889 () Bool)

(assert (=> b!525219 m!505889))

(assert (=> b!525219 m!505873))

(assert (=> b!525224 m!505873))

(assert (=> b!525224 m!505873))

(declare-fun m!505891 () Bool)

(assert (=> b!525224 m!505891))

(assert (=> b!525217 m!505873))

(assert (=> b!525217 m!505873))

(declare-fun m!505893 () Bool)

(assert (=> b!525217 m!505893))

(declare-fun m!505895 () Bool)

(assert (=> b!525216 m!505895))

(declare-fun m!505897 () Bool)

(assert (=> b!525214 m!505897))

(declare-fun m!505899 () Bool)

(assert (=> b!525227 m!505899))

(declare-fun m!505901 () Bool)

(assert (=> start!47734 m!505901))

(declare-fun m!505903 () Bool)

(assert (=> start!47734 m!505903))

(push 1)

