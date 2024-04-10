; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47388 () Bool)

(assert start!47388)

(declare-fun b!521116 () Bool)

(declare-datatypes ((Unit!16172 0))(
  ( (Unit!16173) )
))
(declare-fun e!304055 () Unit!16172)

(declare-fun Unit!16174 () Unit!16172)

(assert (=> b!521116 (= e!304055 Unit!16174)))

(declare-fun b!521117 () Bool)

(declare-fun res!318969 () Bool)

(declare-fun e!304053 () Bool)

(assert (=> b!521117 (=> (not res!318969) (not e!304053))))

(declare-datatypes ((array!33214 0))(
  ( (array!33215 (arr!15963 (Array (_ BitVec 32) (_ BitVec 64))) (size!16327 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33214)

(declare-datatypes ((List!10121 0))(
  ( (Nil!10118) (Cons!10117 (h!11039 (_ BitVec 64)) (t!16349 List!10121)) )
))
(declare-fun arrayNoDuplicates!0 (array!33214 (_ BitVec 32) List!10121) Bool)

(assert (=> b!521117 (= res!318969 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10118))))

(declare-fun b!521118 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!304056 () Bool)

(declare-datatypes ((SeekEntryResult!4430 0))(
  ( (MissingZero!4430 (index!19923 (_ BitVec 32))) (Found!4430 (index!19924 (_ BitVec 32))) (Intermediate!4430 (undefined!5242 Bool) (index!19925 (_ BitVec 32)) (x!48912 (_ BitVec 32))) (Undefined!4430) (MissingVacant!4430 (index!19926 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33214 (_ BitVec 32)) SeekEntryResult!4430)

(assert (=> b!521118 (= e!304056 (= (seekEntryOrOpen!0 (select (arr!15963 a!3235) j!176) a!3235 mask!3524) (Found!4430 j!176)))))

(declare-fun b!521119 () Bool)

(declare-fun e!304058 () Bool)

(assert (=> b!521119 (= e!304058 true)))

(declare-fun lt!238752 () SeekEntryResult!4430)

(assert (=> b!521119 (and (or (= (select (arr!15963 a!3235) (index!19925 lt!238752)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15963 a!3235) (index!19925 lt!238752)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15963 a!3235) (index!19925 lt!238752)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15963 a!3235) (index!19925 lt!238752)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238758 () Unit!16172)

(assert (=> b!521119 (= lt!238758 e!304055)))

(declare-fun c!61379 () Bool)

(assert (=> b!521119 (= c!61379 (= (select (arr!15963 a!3235) (index!19925 lt!238752)) (select (arr!15963 a!3235) j!176)))))

(assert (=> b!521119 (and (bvslt (x!48912 lt!238752) #b01111111111111111111111111111110) (or (= (select (arr!15963 a!3235) (index!19925 lt!238752)) (select (arr!15963 a!3235) j!176)) (= (select (arr!15963 a!3235) (index!19925 lt!238752)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15963 a!3235) (index!19925 lt!238752)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!318960 () Bool)

(declare-fun e!304057 () Bool)

(assert (=> start!47388 (=> (not res!318960) (not e!304057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47388 (= res!318960 (validMask!0 mask!3524))))

(assert (=> start!47388 e!304057))

(assert (=> start!47388 true))

(declare-fun array_inv!11759 (array!33214) Bool)

(assert (=> start!47388 (array_inv!11759 a!3235)))

(declare-fun b!521120 () Bool)

(declare-fun res!318967 () Bool)

(assert (=> b!521120 (=> (not res!318967) (not e!304053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33214 (_ BitVec 32)) Bool)

(assert (=> b!521120 (= res!318967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521121 () Bool)

(declare-fun res!318962 () Bool)

(assert (=> b!521121 (=> (not res!318962) (not e!304057))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521121 (= res!318962 (and (= (size!16327 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16327 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16327 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521122 () Bool)

(assert (=> b!521122 (= e!304053 (not e!304058))))

(declare-fun res!318961 () Bool)

(assert (=> b!521122 (=> res!318961 e!304058)))

(declare-fun lt!238754 () (_ BitVec 32))

(declare-fun lt!238757 () array!33214)

(declare-fun lt!238756 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33214 (_ BitVec 32)) SeekEntryResult!4430)

(assert (=> b!521122 (= res!318961 (= lt!238752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238754 lt!238756 lt!238757 mask!3524)))))

(declare-fun lt!238759 () (_ BitVec 32))

(assert (=> b!521122 (= lt!238752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238759 (select (arr!15963 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521122 (= lt!238754 (toIndex!0 lt!238756 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!521122 (= lt!238756 (select (store (arr!15963 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521122 (= lt!238759 (toIndex!0 (select (arr!15963 a!3235) j!176) mask!3524))))

(assert (=> b!521122 (= lt!238757 (array!33215 (store (arr!15963 a!3235) i!1204 k!2280) (size!16327 a!3235)))))

(assert (=> b!521122 e!304056))

(declare-fun res!318964 () Bool)

(assert (=> b!521122 (=> (not res!318964) (not e!304056))))

(assert (=> b!521122 (= res!318964 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238755 () Unit!16172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16172)

(assert (=> b!521122 (= lt!238755 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521123 () Bool)

(declare-fun e!304054 () Bool)

(assert (=> b!521123 (= e!304054 false)))

(declare-fun b!521124 () Bool)

(declare-fun Unit!16175 () Unit!16172)

(assert (=> b!521124 (= e!304055 Unit!16175)))

(declare-fun lt!238753 () Unit!16172)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33214 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16172)

(assert (=> b!521124 (= lt!238753 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238759 #b00000000000000000000000000000000 (index!19925 lt!238752) (x!48912 lt!238752) mask!3524))))

(declare-fun res!318968 () Bool)

(assert (=> b!521124 (= res!318968 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238759 lt!238756 lt!238757 mask!3524) (Intermediate!4430 false (index!19925 lt!238752) (x!48912 lt!238752))))))

(assert (=> b!521124 (=> (not res!318968) (not e!304054))))

(assert (=> b!521124 e!304054))

(declare-fun b!521125 () Bool)

(assert (=> b!521125 (= e!304057 e!304053)))

(declare-fun res!318966 () Bool)

(assert (=> b!521125 (=> (not res!318966) (not e!304053))))

(declare-fun lt!238751 () SeekEntryResult!4430)

(assert (=> b!521125 (= res!318966 (or (= lt!238751 (MissingZero!4430 i!1204)) (= lt!238751 (MissingVacant!4430 i!1204))))))

(assert (=> b!521125 (= lt!238751 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!521126 () Bool)

(declare-fun res!318963 () Bool)

(assert (=> b!521126 (=> (not res!318963) (not e!304057))))

(declare-fun arrayContainsKey!0 (array!33214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521126 (= res!318963 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521127 () Bool)

(declare-fun res!318970 () Bool)

(assert (=> b!521127 (=> (not res!318970) (not e!304057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521127 (= res!318970 (validKeyInArray!0 k!2280))))

(declare-fun b!521128 () Bool)

(declare-fun res!318965 () Bool)

(assert (=> b!521128 (=> res!318965 e!304058)))

(assert (=> b!521128 (= res!318965 (or (undefined!5242 lt!238752) (not (is-Intermediate!4430 lt!238752))))))

(declare-fun b!521129 () Bool)

(declare-fun res!318971 () Bool)

(assert (=> b!521129 (=> (not res!318971) (not e!304057))))

(assert (=> b!521129 (= res!318971 (validKeyInArray!0 (select (arr!15963 a!3235) j!176)))))

(assert (= (and start!47388 res!318960) b!521121))

(assert (= (and b!521121 res!318962) b!521129))

(assert (= (and b!521129 res!318971) b!521127))

(assert (= (and b!521127 res!318970) b!521126))

(assert (= (and b!521126 res!318963) b!521125))

(assert (= (and b!521125 res!318966) b!521120))

(assert (= (and b!521120 res!318967) b!521117))

(assert (= (and b!521117 res!318969) b!521122))

(assert (= (and b!521122 res!318964) b!521118))

(assert (= (and b!521122 (not res!318961)) b!521128))

(assert (= (and b!521128 (not res!318965)) b!521119))

(assert (= (and b!521119 c!61379) b!521124))

(assert (= (and b!521119 (not c!61379)) b!521116))

(assert (= (and b!521124 res!318968) b!521123))

(declare-fun m!502029 () Bool)

(assert (=> b!521129 m!502029))

(assert (=> b!521129 m!502029))

(declare-fun m!502031 () Bool)

(assert (=> b!521129 m!502031))

(declare-fun m!502033 () Bool)

(assert (=> b!521124 m!502033))

(declare-fun m!502035 () Bool)

(assert (=> b!521124 m!502035))

(declare-fun m!502037 () Bool)

(assert (=> start!47388 m!502037))

(declare-fun m!502039 () Bool)

(assert (=> start!47388 m!502039))

(declare-fun m!502041 () Bool)

(assert (=> b!521125 m!502041))

(declare-fun m!502043 () Bool)

(assert (=> b!521119 m!502043))

(assert (=> b!521119 m!502029))

(declare-fun m!502045 () Bool)

(assert (=> b!521122 m!502045))

(declare-fun m!502047 () Bool)

(assert (=> b!521122 m!502047))

(declare-fun m!502049 () Bool)

(assert (=> b!521122 m!502049))

(assert (=> b!521122 m!502029))

(declare-fun m!502051 () Bool)

(assert (=> b!521122 m!502051))

(assert (=> b!521122 m!502029))

(declare-fun m!502053 () Bool)

(assert (=> b!521122 m!502053))

(assert (=> b!521122 m!502029))

(declare-fun m!502055 () Bool)

(assert (=> b!521122 m!502055))

(declare-fun m!502057 () Bool)

(assert (=> b!521122 m!502057))

(declare-fun m!502059 () Bool)

(assert (=> b!521122 m!502059))

(assert (=> b!521118 m!502029))

(assert (=> b!521118 m!502029))

(declare-fun m!502061 () Bool)

(assert (=> b!521118 m!502061))

(declare-fun m!502063 () Bool)

(assert (=> b!521126 m!502063))

(declare-fun m!502065 () Bool)

(assert (=> b!521120 m!502065))

(declare-fun m!502067 () Bool)

(assert (=> b!521117 m!502067))

(declare-fun m!502069 () Bool)

(assert (=> b!521127 m!502069))

(push 1)

