; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47538 () Bool)

(assert start!47538)

(declare-fun b!523207 () Bool)

(declare-fun res!320602 () Bool)

(declare-fun e!305145 () Bool)

(assert (=> b!523207 (=> (not res!320602) (not e!305145))))

(declare-datatypes ((array!33301 0))(
  ( (array!33302 (arr!16005 (Array (_ BitVec 32) (_ BitVec 64))) (size!16369 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33301)

(declare-datatypes ((List!10163 0))(
  ( (Nil!10160) (Cons!10159 (h!11084 (_ BitVec 64)) (t!16391 List!10163)) )
))
(declare-fun arrayNoDuplicates!0 (array!33301 (_ BitVec 32) List!10163) Bool)

(assert (=> b!523207 (= res!320602 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10160))))

(declare-fun b!523208 () Bool)

(declare-fun e!305151 () Bool)

(assert (=> b!523208 (= e!305145 (not e!305151))))

(declare-fun res!320598 () Bool)

(assert (=> b!523208 (=> res!320598 e!305151)))

(declare-fun lt!240031 () (_ BitVec 32))

(declare-fun lt!240035 () array!33301)

(declare-fun lt!240034 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4472 0))(
  ( (MissingZero!4472 (index!20094 (_ BitVec 32))) (Found!4472 (index!20095 (_ BitVec 32))) (Intermediate!4472 (undefined!5284 Bool) (index!20096 (_ BitVec 32)) (x!49075 (_ BitVec 32))) (Undefined!4472) (MissingVacant!4472 (index!20097 (_ BitVec 32))) )
))
(declare-fun lt!240033 () SeekEntryResult!4472)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33301 (_ BitVec 32)) SeekEntryResult!4472)

(assert (=> b!523208 (= res!320598 (= lt!240033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240031 lt!240034 lt!240035 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!240037 () (_ BitVec 32))

(assert (=> b!523208 (= lt!240033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240037 (select (arr!16005 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523208 (= lt!240031 (toIndex!0 lt!240034 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!523208 (= lt!240034 (select (store (arr!16005 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!523208 (= lt!240037 (toIndex!0 (select (arr!16005 a!3235) j!176) mask!3524))))

(assert (=> b!523208 (= lt!240035 (array!33302 (store (arr!16005 a!3235) i!1204 k!2280) (size!16369 a!3235)))))

(declare-fun e!305148 () Bool)

(assert (=> b!523208 e!305148))

(declare-fun res!320606 () Bool)

(assert (=> b!523208 (=> (not res!320606) (not e!305148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33301 (_ BitVec 32)) Bool)

(assert (=> b!523208 (= res!320606 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16340 0))(
  ( (Unit!16341) )
))
(declare-fun lt!240036 () Unit!16340)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16340)

(assert (=> b!523208 (= lt!240036 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523209 () Bool)

(declare-fun e!305149 () Unit!16340)

(declare-fun Unit!16342 () Unit!16340)

(assert (=> b!523209 (= e!305149 Unit!16342)))

(declare-fun lt!240032 () Unit!16340)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33301 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16340)

(assert (=> b!523209 (= lt!240032 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240037 #b00000000000000000000000000000000 (index!20096 lt!240033) (x!49075 lt!240033) mask!3524))))

(declare-fun res!320609 () Bool)

(assert (=> b!523209 (= res!320609 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240037 lt!240034 lt!240035 mask!3524) (Intermediate!4472 false (index!20096 lt!240033) (x!49075 lt!240033))))))

(declare-fun e!305147 () Bool)

(assert (=> b!523209 (=> (not res!320609) (not e!305147))))

(assert (=> b!523209 e!305147))

(declare-fun b!523210 () Bool)

(declare-fun e!305146 () Bool)

(assert (=> b!523210 (= e!305146 e!305145)))

(declare-fun res!320600 () Bool)

(assert (=> b!523210 (=> (not res!320600) (not e!305145))))

(declare-fun lt!240030 () SeekEntryResult!4472)

(assert (=> b!523210 (= res!320600 (or (= lt!240030 (MissingZero!4472 i!1204)) (= lt!240030 (MissingVacant!4472 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33301 (_ BitVec 32)) SeekEntryResult!4472)

(assert (=> b!523210 (= lt!240030 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!523211 () Bool)

(declare-fun res!320599 () Bool)

(assert (=> b!523211 (=> res!320599 e!305151)))

(assert (=> b!523211 (= res!320599 (or (undefined!5284 lt!240033) (not (is-Intermediate!4472 lt!240033))))))

(declare-fun b!523212 () Bool)

(assert (=> b!523212 (= e!305148 (= (seekEntryOrOpen!0 (select (arr!16005 a!3235) j!176) a!3235 mask!3524) (Found!4472 j!176)))))

(declare-fun b!523213 () Bool)

(declare-fun res!320605 () Bool)

(assert (=> b!523213 (=> (not res!320605) (not e!305146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523213 (= res!320605 (validKeyInArray!0 (select (arr!16005 a!3235) j!176)))))

(declare-fun b!523214 () Bool)

(declare-fun res!320603 () Bool)

(assert (=> b!523214 (=> (not res!320603) (not e!305146))))

(assert (=> b!523214 (= res!320603 (and (= (size!16369 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16369 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16369 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523215 () Bool)

(declare-fun res!320604 () Bool)

(assert (=> b!523215 (=> (not res!320604) (not e!305145))))

(assert (=> b!523215 (= res!320604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523217 () Bool)

(assert (=> b!523217 (= e!305151 (or (bvsgt #b00000000000000000000000000000000 (x!49075 lt!240033)) (bvsle (x!49075 lt!240033) #b01111111111111111111111111111110)))))

(assert (=> b!523217 (and (or (= (select (arr!16005 a!3235) (index!20096 lt!240033)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16005 a!3235) (index!20096 lt!240033)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16005 a!3235) (index!20096 lt!240033)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16005 a!3235) (index!20096 lt!240033)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240029 () Unit!16340)

(assert (=> b!523217 (= lt!240029 e!305149)))

(declare-fun c!61607 () Bool)

(assert (=> b!523217 (= c!61607 (= (select (arr!16005 a!3235) (index!20096 lt!240033)) (select (arr!16005 a!3235) j!176)))))

(assert (=> b!523217 (and (bvslt (x!49075 lt!240033) #b01111111111111111111111111111110) (or (= (select (arr!16005 a!3235) (index!20096 lt!240033)) (select (arr!16005 a!3235) j!176)) (= (select (arr!16005 a!3235) (index!20096 lt!240033)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16005 a!3235) (index!20096 lt!240033)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523218 () Bool)

(declare-fun Unit!16343 () Unit!16340)

(assert (=> b!523218 (= e!305149 Unit!16343)))

(declare-fun b!523219 () Bool)

(declare-fun res!320601 () Bool)

(assert (=> b!523219 (=> (not res!320601) (not e!305146))))

(assert (=> b!523219 (= res!320601 (validKeyInArray!0 k!2280))))

(declare-fun b!523220 () Bool)

(declare-fun res!320608 () Bool)

(assert (=> b!523220 (=> (not res!320608) (not e!305146))))

(declare-fun arrayContainsKey!0 (array!33301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523220 (= res!320608 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523216 () Bool)

(assert (=> b!523216 (= e!305147 false)))

(declare-fun res!320607 () Bool)

(assert (=> start!47538 (=> (not res!320607) (not e!305146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47538 (= res!320607 (validMask!0 mask!3524))))

(assert (=> start!47538 e!305146))

(assert (=> start!47538 true))

(declare-fun array_inv!11801 (array!33301) Bool)

(assert (=> start!47538 (array_inv!11801 a!3235)))

(assert (= (and start!47538 res!320607) b!523214))

(assert (= (and b!523214 res!320603) b!523213))

(assert (= (and b!523213 res!320605) b!523219))

(assert (= (and b!523219 res!320601) b!523220))

(assert (= (and b!523220 res!320608) b!523210))

(assert (= (and b!523210 res!320600) b!523215))

(assert (= (and b!523215 res!320604) b!523207))

(assert (= (and b!523207 res!320602) b!523208))

(assert (= (and b!523208 res!320606) b!523212))

(assert (= (and b!523208 (not res!320598)) b!523211))

(assert (= (and b!523211 (not res!320599)) b!523217))

(assert (= (and b!523217 c!61607) b!523209))

(assert (= (and b!523217 (not c!61607)) b!523218))

(assert (= (and b!523209 res!320609) b!523216))

(declare-fun m!504027 () Bool)

(assert (=> b!523219 m!504027))

(declare-fun m!504029 () Bool)

(assert (=> b!523208 m!504029))

(declare-fun m!504031 () Bool)

(assert (=> b!523208 m!504031))

(declare-fun m!504033 () Bool)

(assert (=> b!523208 m!504033))

(declare-fun m!504035 () Bool)

(assert (=> b!523208 m!504035))

(assert (=> b!523208 m!504033))

(declare-fun m!504037 () Bool)

(assert (=> b!523208 m!504037))

(declare-fun m!504039 () Bool)

(assert (=> b!523208 m!504039))

(declare-fun m!504041 () Bool)

(assert (=> b!523208 m!504041))

(assert (=> b!523208 m!504033))

(declare-fun m!504043 () Bool)

(assert (=> b!523208 m!504043))

(declare-fun m!504045 () Bool)

(assert (=> b!523208 m!504045))

(declare-fun m!504047 () Bool)

(assert (=> b!523209 m!504047))

(declare-fun m!504049 () Bool)

(assert (=> b!523209 m!504049))

(assert (=> b!523212 m!504033))

(assert (=> b!523212 m!504033))

(declare-fun m!504051 () Bool)

(assert (=> b!523212 m!504051))

(declare-fun m!504053 () Bool)

(assert (=> start!47538 m!504053))

(declare-fun m!504055 () Bool)

(assert (=> start!47538 m!504055))

(declare-fun m!504057 () Bool)

(assert (=> b!523210 m!504057))

(declare-fun m!504059 () Bool)

(assert (=> b!523220 m!504059))

(declare-fun m!504061 () Bool)

(assert (=> b!523215 m!504061))

(assert (=> b!523213 m!504033))

(assert (=> b!523213 m!504033))

(declare-fun m!504063 () Bool)

(assert (=> b!523213 m!504063))

(declare-fun m!504065 () Bool)

(assert (=> b!523217 m!504065))

(assert (=> b!523217 m!504033))

(declare-fun m!504067 () Bool)

(assert (=> b!523207 m!504067))

(push 1)

