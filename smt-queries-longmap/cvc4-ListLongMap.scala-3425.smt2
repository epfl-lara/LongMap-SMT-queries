; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47542 () Bool)

(assert start!47542)

(declare-fun b!523291 () Bool)

(declare-fun e!305189 () Bool)

(declare-fun e!305192 () Bool)

(assert (=> b!523291 (= e!305189 e!305192)))

(declare-fun res!320672 () Bool)

(assert (=> b!523291 (=> (not res!320672) (not e!305192))))

(declare-datatypes ((SeekEntryResult!4474 0))(
  ( (MissingZero!4474 (index!20102 (_ BitVec 32))) (Found!4474 (index!20103 (_ BitVec 32))) (Intermediate!4474 (undefined!5286 Bool) (index!20104 (_ BitVec 32)) (x!49077 (_ BitVec 32))) (Undefined!4474) (MissingVacant!4474 (index!20105 (_ BitVec 32))) )
))
(declare-fun lt!240089 () SeekEntryResult!4474)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!523291 (= res!320672 (or (= lt!240089 (MissingZero!4474 i!1204)) (= lt!240089 (MissingVacant!4474 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33305 0))(
  ( (array!33306 (arr!16007 (Array (_ BitVec 32) (_ BitVec 64))) (size!16371 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33305)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33305 (_ BitVec 32)) SeekEntryResult!4474)

(assert (=> b!523291 (= lt!240089 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!523292 () Bool)

(declare-fun res!320676 () Bool)

(assert (=> b!523292 (=> (not res!320676) (not e!305192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33305 (_ BitVec 32)) Bool)

(assert (=> b!523292 (= res!320676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523293 () Bool)

(declare-fun res!320671 () Bool)

(assert (=> b!523293 (=> (not res!320671) (not e!305192))))

(declare-datatypes ((List!10165 0))(
  ( (Nil!10162) (Cons!10161 (h!11086 (_ BitVec 64)) (t!16393 List!10165)) )
))
(declare-fun arrayNoDuplicates!0 (array!33305 (_ BitVec 32) List!10165) Bool)

(assert (=> b!523293 (= res!320671 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10162))))

(declare-fun b!523294 () Bool)

(declare-fun res!320678 () Bool)

(assert (=> b!523294 (=> (not res!320678) (not e!305189))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523294 (= res!320678 (validKeyInArray!0 (select (arr!16007 a!3235) j!176)))))

(declare-fun b!523295 () Bool)

(declare-fun res!320674 () Bool)

(declare-fun e!305191 () Bool)

(assert (=> b!523295 (=> res!320674 e!305191)))

(declare-fun lt!240087 () SeekEntryResult!4474)

(assert (=> b!523295 (= res!320674 (or (undefined!5286 lt!240087) (not (is-Intermediate!4474 lt!240087))))))

(declare-fun b!523296 () Bool)

(declare-fun e!305188 () Bool)

(assert (=> b!523296 (= e!305188 (= (seekEntryOrOpen!0 (select (arr!16007 a!3235) j!176) a!3235 mask!3524) (Found!4474 j!176)))))

(declare-fun b!523298 () Bool)

(declare-fun res!320673 () Bool)

(assert (=> b!523298 (=> (not res!320673) (not e!305189))))

(assert (=> b!523298 (= res!320673 (and (= (size!16371 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16371 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16371 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523299 () Bool)

(declare-datatypes ((Unit!16348 0))(
  ( (Unit!16349) )
))
(declare-fun e!305187 () Unit!16348)

(declare-fun Unit!16350 () Unit!16348)

(assert (=> b!523299 (= e!305187 Unit!16350)))

(declare-fun b!523300 () Bool)

(assert (=> b!523300 (= e!305191 (or (bvsgt #b00000000000000000000000000000000 (x!49077 lt!240087)) (bvsle (x!49077 lt!240087) #b01111111111111111111111111111110)))))

(assert (=> b!523300 (and (or (= (select (arr!16007 a!3235) (index!20104 lt!240087)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16007 a!3235) (index!20104 lt!240087)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16007 a!3235) (index!20104 lt!240087)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16007 a!3235) (index!20104 lt!240087)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240086 () Unit!16348)

(assert (=> b!523300 (= lt!240086 e!305187)))

(declare-fun c!61613 () Bool)

(assert (=> b!523300 (= c!61613 (= (select (arr!16007 a!3235) (index!20104 lt!240087)) (select (arr!16007 a!3235) j!176)))))

(assert (=> b!523300 (and (bvslt (x!49077 lt!240087) #b01111111111111111111111111111110) (or (= (select (arr!16007 a!3235) (index!20104 lt!240087)) (select (arr!16007 a!3235) j!176)) (= (select (arr!16007 a!3235) (index!20104 lt!240087)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16007 a!3235) (index!20104 lt!240087)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523301 () Bool)

(declare-fun e!305190 () Bool)

(assert (=> b!523301 (= e!305190 false)))

(declare-fun b!523302 () Bool)

(declare-fun res!320679 () Bool)

(assert (=> b!523302 (=> (not res!320679) (not e!305189))))

(assert (=> b!523302 (= res!320679 (validKeyInArray!0 k!2280))))

(declare-fun b!523303 () Bool)

(assert (=> b!523303 (= e!305192 (not e!305191))))

(declare-fun res!320670 () Bool)

(assert (=> b!523303 (=> res!320670 e!305191)))

(declare-fun lt!240083 () array!33305)

(declare-fun lt!240088 () (_ BitVec 32))

(declare-fun lt!240085 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33305 (_ BitVec 32)) SeekEntryResult!4474)

(assert (=> b!523303 (= res!320670 (= lt!240087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240088 lt!240085 lt!240083 mask!3524)))))

(declare-fun lt!240090 () (_ BitVec 32))

(assert (=> b!523303 (= lt!240087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240090 (select (arr!16007 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523303 (= lt!240088 (toIndex!0 lt!240085 mask!3524))))

(assert (=> b!523303 (= lt!240085 (select (store (arr!16007 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!523303 (= lt!240090 (toIndex!0 (select (arr!16007 a!3235) j!176) mask!3524))))

(assert (=> b!523303 (= lt!240083 (array!33306 (store (arr!16007 a!3235) i!1204 k!2280) (size!16371 a!3235)))))

(assert (=> b!523303 e!305188))

(declare-fun res!320680 () Bool)

(assert (=> b!523303 (=> (not res!320680) (not e!305188))))

(assert (=> b!523303 (= res!320680 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240091 () Unit!16348)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16348)

(assert (=> b!523303 (= lt!240091 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523304 () Bool)

(declare-fun Unit!16351 () Unit!16348)

(assert (=> b!523304 (= e!305187 Unit!16351)))

(declare-fun lt!240084 () Unit!16348)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16348)

(assert (=> b!523304 (= lt!240084 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240090 #b00000000000000000000000000000000 (index!20104 lt!240087) (x!49077 lt!240087) mask!3524))))

(declare-fun res!320677 () Bool)

(assert (=> b!523304 (= res!320677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240090 lt!240085 lt!240083 mask!3524) (Intermediate!4474 false (index!20104 lt!240087) (x!49077 lt!240087))))))

(assert (=> b!523304 (=> (not res!320677) (not e!305190))))

(assert (=> b!523304 e!305190))

(declare-fun res!320675 () Bool)

(assert (=> start!47542 (=> (not res!320675) (not e!305189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47542 (= res!320675 (validMask!0 mask!3524))))

(assert (=> start!47542 e!305189))

(assert (=> start!47542 true))

(declare-fun array_inv!11803 (array!33305) Bool)

(assert (=> start!47542 (array_inv!11803 a!3235)))

(declare-fun b!523297 () Bool)

(declare-fun res!320681 () Bool)

(assert (=> b!523297 (=> (not res!320681) (not e!305189))))

(declare-fun arrayContainsKey!0 (array!33305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523297 (= res!320681 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!47542 res!320675) b!523298))

(assert (= (and b!523298 res!320673) b!523294))

(assert (= (and b!523294 res!320678) b!523302))

(assert (= (and b!523302 res!320679) b!523297))

(assert (= (and b!523297 res!320681) b!523291))

(assert (= (and b!523291 res!320672) b!523292))

(assert (= (and b!523292 res!320676) b!523293))

(assert (= (and b!523293 res!320671) b!523303))

(assert (= (and b!523303 res!320680) b!523296))

(assert (= (and b!523303 (not res!320670)) b!523295))

(assert (= (and b!523295 (not res!320674)) b!523300))

(assert (= (and b!523300 c!61613) b!523304))

(assert (= (and b!523300 (not c!61613)) b!523299))

(assert (= (and b!523304 res!320677) b!523301))

(declare-fun m!504111 () Bool)

(assert (=> b!523304 m!504111))

(declare-fun m!504113 () Bool)

(assert (=> b!523304 m!504113))

(declare-fun m!504115 () Bool)

(assert (=> b!523292 m!504115))

(declare-fun m!504117 () Bool)

(assert (=> b!523300 m!504117))

(declare-fun m!504119 () Bool)

(assert (=> b!523300 m!504119))

(declare-fun m!504121 () Bool)

(assert (=> b!523303 m!504121))

(declare-fun m!504123 () Bool)

(assert (=> b!523303 m!504123))

(declare-fun m!504125 () Bool)

(assert (=> b!523303 m!504125))

(declare-fun m!504127 () Bool)

(assert (=> b!523303 m!504127))

(assert (=> b!523303 m!504119))

(declare-fun m!504129 () Bool)

(assert (=> b!523303 m!504129))

(assert (=> b!523303 m!504119))

(declare-fun m!504131 () Bool)

(assert (=> b!523303 m!504131))

(assert (=> b!523303 m!504119))

(declare-fun m!504133 () Bool)

(assert (=> b!523303 m!504133))

(declare-fun m!504135 () Bool)

(assert (=> b!523303 m!504135))

(assert (=> b!523294 m!504119))

(assert (=> b!523294 m!504119))

(declare-fun m!504137 () Bool)

(assert (=> b!523294 m!504137))

(declare-fun m!504139 () Bool)

(assert (=> b!523291 m!504139))

(assert (=> b!523296 m!504119))

(assert (=> b!523296 m!504119))

(declare-fun m!504141 () Bool)

(assert (=> b!523296 m!504141))

(declare-fun m!504143 () Bool)

(assert (=> b!523302 m!504143))

(declare-fun m!504145 () Bool)

(assert (=> b!523297 m!504145))

(declare-fun m!504147 () Bool)

(assert (=> start!47542 m!504147))

(declare-fun m!504149 () Bool)

(assert (=> start!47542 m!504149))

(declare-fun m!504151 () Bool)

(assert (=> b!523293 m!504151))

(push 1)

(assert (not b!523303))

(assert (not start!47542))

(assert (not b!523291))

(assert (not b!523292))

(assert (not b!523304))

