; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47392 () Bool)

(assert start!47392)

(declare-fun b!521200 () Bool)

(declare-fun res!319040 () Bool)

(declare-fun e!304098 () Bool)

(assert (=> b!521200 (=> (not res!319040) (not e!304098))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521200 (= res!319040 (validKeyInArray!0 k!2280))))

(declare-fun b!521201 () Bool)

(declare-fun res!319039 () Bool)

(declare-fun e!304096 () Bool)

(assert (=> b!521201 (=> (not res!319039) (not e!304096))))

(declare-datatypes ((array!33218 0))(
  ( (array!33219 (arr!15965 (Array (_ BitVec 32) (_ BitVec 64))) (size!16329 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33218)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33218 (_ BitVec 32)) Bool)

(assert (=> b!521201 (= res!319039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521202 () Bool)

(declare-datatypes ((Unit!16180 0))(
  ( (Unit!16181) )
))
(declare-fun e!304101 () Unit!16180)

(declare-fun Unit!16182 () Unit!16180)

(assert (=> b!521202 (= e!304101 Unit!16182)))

(declare-fun b!521203 () Bool)

(assert (=> b!521203 (= e!304098 e!304096)))

(declare-fun res!319041 () Bool)

(assert (=> b!521203 (=> (not res!319041) (not e!304096))))

(declare-datatypes ((SeekEntryResult!4432 0))(
  ( (MissingZero!4432 (index!19931 (_ BitVec 32))) (Found!4432 (index!19932 (_ BitVec 32))) (Intermediate!4432 (undefined!5244 Bool) (index!19933 (_ BitVec 32)) (x!48914 (_ BitVec 32))) (Undefined!4432) (MissingVacant!4432 (index!19934 (_ BitVec 32))) )
))
(declare-fun lt!238811 () SeekEntryResult!4432)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521203 (= res!319041 (or (= lt!238811 (MissingZero!4432 i!1204)) (= lt!238811 (MissingVacant!4432 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33218 (_ BitVec 32)) SeekEntryResult!4432)

(assert (=> b!521203 (= lt!238811 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!521204 () Bool)

(declare-fun res!319032 () Bool)

(assert (=> b!521204 (=> (not res!319032) (not e!304098))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521204 (= res!319032 (and (= (size!16329 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16329 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16329 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521205 () Bool)

(declare-fun e!304097 () Bool)

(assert (=> b!521205 (= e!304097 true)))

(declare-fun lt!238810 () SeekEntryResult!4432)

(assert (=> b!521205 (and (or (= (select (arr!15965 a!3235) (index!19933 lt!238810)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15965 a!3235) (index!19933 lt!238810)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15965 a!3235) (index!19933 lt!238810)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15965 a!3235) (index!19933 lt!238810)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238808 () Unit!16180)

(assert (=> b!521205 (= lt!238808 e!304101)))

(declare-fun c!61385 () Bool)

(assert (=> b!521205 (= c!61385 (= (select (arr!15965 a!3235) (index!19933 lt!238810)) (select (arr!15965 a!3235) j!176)))))

(assert (=> b!521205 (and (bvslt (x!48914 lt!238810) #b01111111111111111111111111111110) (or (= (select (arr!15965 a!3235) (index!19933 lt!238810)) (select (arr!15965 a!3235) j!176)) (= (select (arr!15965 a!3235) (index!19933 lt!238810)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15965 a!3235) (index!19933 lt!238810)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521206 () Bool)

(declare-fun e!304100 () Bool)

(assert (=> b!521206 (= e!304100 false)))

(declare-fun b!521207 () Bool)

(declare-fun e!304095 () Bool)

(assert (=> b!521207 (= e!304095 (= (seekEntryOrOpen!0 (select (arr!15965 a!3235) j!176) a!3235 mask!3524) (Found!4432 j!176)))))

(declare-fun b!521208 () Bool)

(declare-fun Unit!16183 () Unit!16180)

(assert (=> b!521208 (= e!304101 Unit!16183)))

(declare-fun lt!238807 () Unit!16180)

(declare-fun lt!238813 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33218 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16180)

(assert (=> b!521208 (= lt!238807 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238813 #b00000000000000000000000000000000 (index!19933 lt!238810) (x!48914 lt!238810) mask!3524))))

(declare-fun lt!238809 () array!33218)

(declare-fun res!319034 () Bool)

(declare-fun lt!238806 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33218 (_ BitVec 32)) SeekEntryResult!4432)

(assert (=> b!521208 (= res!319034 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238813 lt!238806 lt!238809 mask!3524) (Intermediate!4432 false (index!19933 lt!238810) (x!48914 lt!238810))))))

(assert (=> b!521208 (=> (not res!319034) (not e!304100))))

(assert (=> b!521208 e!304100))

(declare-fun b!521209 () Bool)

(assert (=> b!521209 (= e!304096 (not e!304097))))

(declare-fun res!319035 () Bool)

(assert (=> b!521209 (=> res!319035 e!304097)))

(declare-fun lt!238812 () (_ BitVec 32))

(assert (=> b!521209 (= res!319035 (= lt!238810 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238812 lt!238806 lt!238809 mask!3524)))))

(assert (=> b!521209 (= lt!238810 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238813 (select (arr!15965 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521209 (= lt!238812 (toIndex!0 lt!238806 mask!3524))))

(assert (=> b!521209 (= lt!238806 (select (store (arr!15965 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521209 (= lt!238813 (toIndex!0 (select (arr!15965 a!3235) j!176) mask!3524))))

(assert (=> b!521209 (= lt!238809 (array!33219 (store (arr!15965 a!3235) i!1204 k!2280) (size!16329 a!3235)))))

(assert (=> b!521209 e!304095))

(declare-fun res!319042 () Bool)

(assert (=> b!521209 (=> (not res!319042) (not e!304095))))

(assert (=> b!521209 (= res!319042 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238805 () Unit!16180)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16180)

(assert (=> b!521209 (= lt!238805 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521210 () Bool)

(declare-fun res!319043 () Bool)

(assert (=> b!521210 (=> (not res!319043) (not e!304098))))

(declare-fun arrayContainsKey!0 (array!33218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521210 (= res!319043 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!319036 () Bool)

(assert (=> start!47392 (=> (not res!319036) (not e!304098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47392 (= res!319036 (validMask!0 mask!3524))))

(assert (=> start!47392 e!304098))

(assert (=> start!47392 true))

(declare-fun array_inv!11761 (array!33218) Bool)

(assert (=> start!47392 (array_inv!11761 a!3235)))

(declare-fun b!521211 () Bool)

(declare-fun res!319033 () Bool)

(assert (=> b!521211 (=> (not res!319033) (not e!304096))))

(declare-datatypes ((List!10123 0))(
  ( (Nil!10120) (Cons!10119 (h!11041 (_ BitVec 64)) (t!16351 List!10123)) )
))
(declare-fun arrayNoDuplicates!0 (array!33218 (_ BitVec 32) List!10123) Bool)

(assert (=> b!521211 (= res!319033 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10120))))

(declare-fun b!521212 () Bool)

(declare-fun res!319038 () Bool)

(assert (=> b!521212 (=> (not res!319038) (not e!304098))))

(assert (=> b!521212 (= res!319038 (validKeyInArray!0 (select (arr!15965 a!3235) j!176)))))

(declare-fun b!521213 () Bool)

(declare-fun res!319037 () Bool)

(assert (=> b!521213 (=> res!319037 e!304097)))

(assert (=> b!521213 (= res!319037 (or (undefined!5244 lt!238810) (not (is-Intermediate!4432 lt!238810))))))

(assert (= (and start!47392 res!319036) b!521204))

(assert (= (and b!521204 res!319032) b!521212))

(assert (= (and b!521212 res!319038) b!521200))

(assert (= (and b!521200 res!319040) b!521210))

(assert (= (and b!521210 res!319043) b!521203))

(assert (= (and b!521203 res!319041) b!521201))

(assert (= (and b!521201 res!319039) b!521211))

(assert (= (and b!521211 res!319033) b!521209))

(assert (= (and b!521209 res!319042) b!521207))

(assert (= (and b!521209 (not res!319035)) b!521213))

(assert (= (and b!521213 (not res!319037)) b!521205))

(assert (= (and b!521205 c!61385) b!521208))

(assert (= (and b!521205 (not c!61385)) b!521202))

(assert (= (and b!521208 res!319034) b!521206))

(declare-fun m!502113 () Bool)

(assert (=> b!521210 m!502113))

(declare-fun m!502115 () Bool)

(assert (=> b!521212 m!502115))

(assert (=> b!521212 m!502115))

(declare-fun m!502117 () Bool)

(assert (=> b!521212 m!502117))

(declare-fun m!502119 () Bool)

(assert (=> b!521200 m!502119))

(declare-fun m!502121 () Bool)

(assert (=> b!521209 m!502121))

(declare-fun m!502123 () Bool)

(assert (=> b!521209 m!502123))

(declare-fun m!502125 () Bool)

(assert (=> b!521209 m!502125))

(declare-fun m!502127 () Bool)

(assert (=> b!521209 m!502127))

(assert (=> b!521209 m!502115))

(declare-fun m!502129 () Bool)

(assert (=> b!521209 m!502129))

(assert (=> b!521209 m!502115))

(declare-fun m!502131 () Bool)

(assert (=> b!521209 m!502131))

(assert (=> b!521209 m!502115))

(declare-fun m!502133 () Bool)

(assert (=> b!521209 m!502133))

(declare-fun m!502135 () Bool)

(assert (=> b!521209 m!502135))

(declare-fun m!502137 () Bool)

(assert (=> b!521208 m!502137))

(declare-fun m!502139 () Bool)

(assert (=> b!521208 m!502139))

(assert (=> b!521207 m!502115))

(assert (=> b!521207 m!502115))

(declare-fun m!502141 () Bool)

(assert (=> b!521207 m!502141))

(declare-fun m!502143 () Bool)

(assert (=> b!521205 m!502143))

(assert (=> b!521205 m!502115))

(declare-fun m!502145 () Bool)

(assert (=> b!521211 m!502145))

(declare-fun m!502147 () Bool)

(assert (=> b!521201 m!502147))

(declare-fun m!502149 () Bool)

(assert (=> b!521203 m!502149))

(declare-fun m!502151 () Bool)

(assert (=> start!47392 m!502151))

(declare-fun m!502153 () Bool)

(assert (=> start!47392 m!502153))

(push 1)

