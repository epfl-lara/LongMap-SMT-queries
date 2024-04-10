; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47436 () Bool)

(assert start!47436)

(declare-fun b!522124 () Bool)

(declare-fun res!319831 () Bool)

(declare-fun e!304560 () Bool)

(assert (=> b!522124 (=> (not res!319831) (not e!304560))))

(declare-datatypes ((array!33262 0))(
  ( (array!33263 (arr!15987 (Array (_ BitVec 32) (_ BitVec 64))) (size!16351 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33262)

(declare-datatypes ((List!10145 0))(
  ( (Nil!10142) (Cons!10141 (h!11063 (_ BitVec 64)) (t!16373 List!10145)) )
))
(declare-fun arrayNoDuplicates!0 (array!33262 (_ BitVec 32) List!10145) Bool)

(assert (=> b!522124 (= res!319831 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10142))))

(declare-fun res!319824 () Bool)

(declare-fun e!304559 () Bool)

(assert (=> start!47436 (=> (not res!319824) (not e!304559))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47436 (= res!319824 (validMask!0 mask!3524))))

(assert (=> start!47436 e!304559))

(assert (=> start!47436 true))

(declare-fun array_inv!11783 (array!33262) Bool)

(assert (=> start!47436 (array_inv!11783 a!3235)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!522125 () Bool)

(declare-fun e!304562 () Bool)

(declare-datatypes ((SeekEntryResult!4454 0))(
  ( (MissingZero!4454 (index!20019 (_ BitVec 32))) (Found!4454 (index!20020 (_ BitVec 32))) (Intermediate!4454 (undefined!5266 Bool) (index!20021 (_ BitVec 32)) (x!49000 (_ BitVec 32))) (Undefined!4454) (MissingVacant!4454 (index!20022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33262 (_ BitVec 32)) SeekEntryResult!4454)

(assert (=> b!522125 (= e!304562 (= (seekEntryOrOpen!0 (select (arr!15987 a!3235) j!176) a!3235 mask!3524) (Found!4454 j!176)))))

(declare-fun b!522126 () Bool)

(declare-fun res!319829 () Bool)

(assert (=> b!522126 (=> (not res!319829) (not e!304559))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522126 (= res!319829 (and (= (size!16351 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16351 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16351 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522127 () Bool)

(declare-fun e!304561 () Bool)

(assert (=> b!522127 (= e!304560 (not e!304561))))

(declare-fun res!319825 () Bool)

(assert (=> b!522127 (=> res!319825 e!304561)))

(declare-fun lt!239401 () (_ BitVec 32))

(declare-fun lt!239399 () array!33262)

(declare-fun lt!239404 () SeekEntryResult!4454)

(declare-fun lt!239406 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33262 (_ BitVec 32)) SeekEntryResult!4454)

(assert (=> b!522127 (= res!319825 (= lt!239404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239401 lt!239406 lt!239399 mask!3524)))))

(declare-fun lt!239405 () (_ BitVec 32))

(assert (=> b!522127 (= lt!239404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239405 (select (arr!15987 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522127 (= lt!239401 (toIndex!0 lt!239406 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!522127 (= lt!239406 (select (store (arr!15987 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!522127 (= lt!239405 (toIndex!0 (select (arr!15987 a!3235) j!176) mask!3524))))

(assert (=> b!522127 (= lt!239399 (array!33263 (store (arr!15987 a!3235) i!1204 k!2280) (size!16351 a!3235)))))

(assert (=> b!522127 e!304562))

(declare-fun res!319832 () Bool)

(assert (=> b!522127 (=> (not res!319832) (not e!304562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33262 (_ BitVec 32)) Bool)

(assert (=> b!522127 (= res!319832 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16268 0))(
  ( (Unit!16269) )
))
(declare-fun lt!239403 () Unit!16268)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16268)

(assert (=> b!522127 (= lt!239403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522128 () Bool)

(declare-fun res!319828 () Bool)

(assert (=> b!522128 (=> (not res!319828) (not e!304559))))

(declare-fun arrayContainsKey!0 (array!33262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522128 (= res!319828 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522129 () Bool)

(assert (=> b!522129 (= e!304561 true)))

(assert (=> b!522129 (and (or (= (select (arr!15987 a!3235) (index!20021 lt!239404)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15987 a!3235) (index!20021 lt!239404)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15987 a!3235) (index!20021 lt!239404)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15987 a!3235) (index!20021 lt!239404)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239400 () Unit!16268)

(declare-fun e!304557 () Unit!16268)

(assert (=> b!522129 (= lt!239400 e!304557)))

(declare-fun c!61451 () Bool)

(assert (=> b!522129 (= c!61451 (= (select (arr!15987 a!3235) (index!20021 lt!239404)) (select (arr!15987 a!3235) j!176)))))

(assert (=> b!522129 (and (bvslt (x!49000 lt!239404) #b01111111111111111111111111111110) (or (= (select (arr!15987 a!3235) (index!20021 lt!239404)) (select (arr!15987 a!3235) j!176)) (= (select (arr!15987 a!3235) (index!20021 lt!239404)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15987 a!3235) (index!20021 lt!239404)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522130 () Bool)

(declare-fun Unit!16270 () Unit!16268)

(assert (=> b!522130 (= e!304557 Unit!16270)))

(declare-fun lt!239407 () Unit!16268)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33262 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16268)

(assert (=> b!522130 (= lt!239407 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239405 #b00000000000000000000000000000000 (index!20021 lt!239404) (x!49000 lt!239404) mask!3524))))

(declare-fun res!319833 () Bool)

(assert (=> b!522130 (= res!319833 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239405 lt!239406 lt!239399 mask!3524) (Intermediate!4454 false (index!20021 lt!239404) (x!49000 lt!239404))))))

(declare-fun e!304558 () Bool)

(assert (=> b!522130 (=> (not res!319833) (not e!304558))))

(assert (=> b!522130 e!304558))

(declare-fun b!522131 () Bool)

(assert (=> b!522131 (= e!304559 e!304560)))

(declare-fun res!319827 () Bool)

(assert (=> b!522131 (=> (not res!319827) (not e!304560))))

(declare-fun lt!239402 () SeekEntryResult!4454)

(assert (=> b!522131 (= res!319827 (or (= lt!239402 (MissingZero!4454 i!1204)) (= lt!239402 (MissingVacant!4454 i!1204))))))

(assert (=> b!522131 (= lt!239402 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!522132 () Bool)

(assert (=> b!522132 (= e!304558 false)))

(declare-fun b!522133 () Bool)

(declare-fun res!319826 () Bool)

(assert (=> b!522133 (=> (not res!319826) (not e!304560))))

(assert (=> b!522133 (= res!319826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522134 () Bool)

(declare-fun Unit!16271 () Unit!16268)

(assert (=> b!522134 (= e!304557 Unit!16271)))

(declare-fun b!522135 () Bool)

(declare-fun res!319834 () Bool)

(assert (=> b!522135 (=> (not res!319834) (not e!304559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522135 (= res!319834 (validKeyInArray!0 (select (arr!15987 a!3235) j!176)))))

(declare-fun b!522136 () Bool)

(declare-fun res!319830 () Bool)

(assert (=> b!522136 (=> (not res!319830) (not e!304559))))

(assert (=> b!522136 (= res!319830 (validKeyInArray!0 k!2280))))

(declare-fun b!522137 () Bool)

(declare-fun res!319835 () Bool)

(assert (=> b!522137 (=> res!319835 e!304561)))

(assert (=> b!522137 (= res!319835 (or (undefined!5266 lt!239404) (not (is-Intermediate!4454 lt!239404))))))

(assert (= (and start!47436 res!319824) b!522126))

(assert (= (and b!522126 res!319829) b!522135))

(assert (= (and b!522135 res!319834) b!522136))

(assert (= (and b!522136 res!319830) b!522128))

(assert (= (and b!522128 res!319828) b!522131))

(assert (= (and b!522131 res!319827) b!522133))

(assert (= (and b!522133 res!319826) b!522124))

(assert (= (and b!522124 res!319831) b!522127))

(assert (= (and b!522127 res!319832) b!522125))

(assert (= (and b!522127 (not res!319825)) b!522137))

(assert (= (and b!522137 (not res!319835)) b!522129))

(assert (= (and b!522129 c!61451) b!522130))

(assert (= (and b!522129 (not c!61451)) b!522134))

(assert (= (and b!522130 res!319833) b!522132))

(declare-fun m!503037 () Bool)

(assert (=> b!522124 m!503037))

(declare-fun m!503039 () Bool)

(assert (=> b!522131 m!503039))

(declare-fun m!503041 () Bool)

(assert (=> start!47436 m!503041))

(declare-fun m!503043 () Bool)

(assert (=> start!47436 m!503043))

(declare-fun m!503045 () Bool)

(assert (=> b!522129 m!503045))

(declare-fun m!503047 () Bool)

(assert (=> b!522129 m!503047))

(assert (=> b!522135 m!503047))

(assert (=> b!522135 m!503047))

(declare-fun m!503049 () Bool)

(assert (=> b!522135 m!503049))

(declare-fun m!503051 () Bool)

(assert (=> b!522127 m!503051))

(declare-fun m!503053 () Bool)

(assert (=> b!522127 m!503053))

(declare-fun m!503055 () Bool)

(assert (=> b!522127 m!503055))

(declare-fun m!503057 () Bool)

(assert (=> b!522127 m!503057))

(assert (=> b!522127 m!503047))

(declare-fun m!503059 () Bool)

(assert (=> b!522127 m!503059))

(declare-fun m!503061 () Bool)

(assert (=> b!522127 m!503061))

(assert (=> b!522127 m!503047))

(assert (=> b!522127 m!503047))

(declare-fun m!503063 () Bool)

(assert (=> b!522127 m!503063))

(declare-fun m!503065 () Bool)

(assert (=> b!522127 m!503065))

(declare-fun m!503067 () Bool)

(assert (=> b!522128 m!503067))

(declare-fun m!503069 () Bool)

(assert (=> b!522136 m!503069))

(declare-fun m!503071 () Bool)

(assert (=> b!522133 m!503071))

(declare-fun m!503073 () Bool)

(assert (=> b!522130 m!503073))

(declare-fun m!503075 () Bool)

(assert (=> b!522130 m!503075))

(assert (=> b!522125 m!503047))

(assert (=> b!522125 m!503047))

(declare-fun m!503077 () Bool)

(assert (=> b!522125 m!503077))

(push 1)

