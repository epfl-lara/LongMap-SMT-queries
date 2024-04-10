; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65776 () Bool)

(assert start!65776)

(declare-fun b!756185 () Bool)

(declare-datatypes ((Unit!26132 0))(
  ( (Unit!26133) )
))
(declare-fun e!421670 () Unit!26132)

(declare-fun Unit!26134 () Unit!26132)

(assert (=> b!756185 (= e!421670 Unit!26134)))

(declare-fun b!756186 () Bool)

(declare-fun e!421663 () Bool)

(declare-fun e!421664 () Bool)

(assert (=> b!756186 (= e!421663 e!421664)))

(declare-fun res!511234 () Bool)

(assert (=> b!756186 (=> (not res!511234) (not e!421664))))

(declare-datatypes ((SeekEntryResult!7688 0))(
  ( (MissingZero!7688 (index!33120 (_ BitVec 32))) (Found!7688 (index!33121 (_ BitVec 32))) (Intermediate!7688 (undefined!8500 Bool) (index!33122 (_ BitVec 32)) (x!64022 (_ BitVec 32))) (Undefined!7688) (MissingVacant!7688 (index!33123 (_ BitVec 32))) )
))
(declare-fun lt!336661 () SeekEntryResult!7688)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!756186 (= res!511234 (or (= lt!336661 (MissingZero!7688 i!1173)) (= lt!336661 (MissingVacant!7688 i!1173))))))

(declare-datatypes ((array!41949 0))(
  ( (array!41950 (arr!20088 (Array (_ BitVec 32) (_ BitVec 64))) (size!20509 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41949)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41949 (_ BitVec 32)) SeekEntryResult!7688)

(assert (=> b!756186 (= lt!336661 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!756187 () Bool)

(declare-fun res!511232 () Bool)

(declare-fun e!421673 () Bool)

(assert (=> b!756187 (=> (not res!511232) (not e!421673))))

(declare-fun e!421672 () Bool)

(assert (=> b!756187 (= res!511232 e!421672)))

(declare-fun c!82858 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756187 (= c!82858 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756188 () Bool)

(declare-fun res!511237 () Bool)

(assert (=> b!756188 (=> (not res!511237) (not e!421673))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!756188 (= res!511237 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20088 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756189 () Bool)

(declare-fun res!511235 () Bool)

(assert (=> b!756189 (=> (not res!511235) (not e!421664))))

(declare-datatypes ((List!14090 0))(
  ( (Nil!14087) (Cons!14086 (h!15158 (_ BitVec 64)) (t!20405 List!14090)) )
))
(declare-fun arrayNoDuplicates!0 (array!41949 (_ BitVec 32) List!14090) Bool)

(assert (=> b!756189 (= res!511235 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14087))))

(declare-fun b!756190 () Bool)

(declare-fun e!421662 () Bool)

(assert (=> b!756190 (= e!421662 true)))

(declare-fun e!421669 () Bool)

(assert (=> b!756190 e!421669))

(declare-fun res!511243 () Bool)

(assert (=> b!756190 (=> (not res!511243) (not e!421669))))

(declare-fun lt!336664 () (_ BitVec 64))

(assert (=> b!756190 (= res!511243 (= lt!336664 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336656 () Unit!26132)

(assert (=> b!756190 (= lt!336656 e!421670)))

(declare-fun c!82857 () Bool)

(assert (=> b!756190 (= c!82857 (= lt!336664 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!756191 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41949 (_ BitVec 32)) SeekEntryResult!7688)

(assert (=> b!756191 (= e!421672 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20088 a!3186) j!159) a!3186 mask!3328) (Found!7688 j!159)))))

(declare-fun b!756192 () Bool)

(declare-fun e!421671 () Bool)

(assert (=> b!756192 (= e!421671 e!421662)))

(declare-fun res!511241 () Bool)

(assert (=> b!756192 (=> res!511241 e!421662)))

(declare-fun lt!336660 () (_ BitVec 64))

(assert (=> b!756192 (= res!511241 (= lt!336664 lt!336660))))

(assert (=> b!756192 (= lt!336664 (select (store (arr!20088 a!3186) i!1173 k!2102) index!1321))))

(declare-fun lt!336665 () SeekEntryResult!7688)

(declare-fun e!421666 () Bool)

(declare-fun b!756193 () Bool)

(assert (=> b!756193 (= e!421666 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20088 a!3186) j!159) a!3186 mask!3328) lt!336665))))

(declare-fun b!756194 () Bool)

(declare-fun e!421665 () Bool)

(assert (=> b!756194 (= e!421673 e!421665)))

(declare-fun res!511242 () Bool)

(assert (=> b!756194 (=> (not res!511242) (not e!421665))))

(declare-fun lt!336663 () SeekEntryResult!7688)

(declare-fun lt!336655 () SeekEntryResult!7688)

(assert (=> b!756194 (= res!511242 (= lt!336663 lt!336655))))

(declare-fun lt!336657 () array!41949)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41949 (_ BitVec 32)) SeekEntryResult!7688)

(assert (=> b!756194 (= lt!336655 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336660 lt!336657 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756194 (= lt!336663 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336660 mask!3328) lt!336660 lt!336657 mask!3328))))

(assert (=> b!756194 (= lt!336660 (select (store (arr!20088 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!756194 (= lt!336657 (array!41950 (store (arr!20088 a!3186) i!1173 k!2102) (size!20509 a!3186)))))

(declare-fun b!756195 () Bool)

(declare-fun res!511240 () Bool)

(assert (=> b!756195 (=> (not res!511240) (not e!421669))))

(assert (=> b!756195 (= res!511240 (= (seekEntryOrOpen!0 lt!336660 lt!336657 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336660 lt!336657 mask!3328)))))

(declare-fun b!756196 () Bool)

(declare-fun res!511239 () Bool)

(assert (=> b!756196 (=> (not res!511239) (not e!421664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41949 (_ BitVec 32)) Bool)

(assert (=> b!756196 (= res!511239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756197 () Bool)

(declare-fun lt!336659 () SeekEntryResult!7688)

(declare-fun lt!336658 () SeekEntryResult!7688)

(assert (=> b!756197 (= e!421669 (= lt!336659 lt!336658))))

(declare-fun b!756198 () Bool)

(declare-fun res!511233 () Bool)

(assert (=> b!756198 (=> (not res!511233) (not e!421663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756198 (= res!511233 (validKeyInArray!0 (select (arr!20088 a!3186) j!159)))))

(declare-fun b!756199 () Bool)

(declare-fun res!511244 () Bool)

(assert (=> b!756199 (=> (not res!511244) (not e!421663))))

(assert (=> b!756199 (= res!511244 (validKeyInArray!0 k!2102))))

(declare-fun res!511238 () Bool)

(assert (=> start!65776 (=> (not res!511238) (not e!421663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65776 (= res!511238 (validMask!0 mask!3328))))

(assert (=> start!65776 e!421663))

(assert (=> start!65776 true))

(declare-fun array_inv!15884 (array!41949) Bool)

(assert (=> start!65776 (array_inv!15884 a!3186)))

(declare-fun b!756200 () Bool)

(declare-fun res!511250 () Bool)

(assert (=> b!756200 (=> (not res!511250) (not e!421664))))

(assert (=> b!756200 (= res!511250 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20509 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20509 a!3186))))))

(declare-fun b!756201 () Bool)

(declare-fun Unit!26135 () Unit!26132)

(assert (=> b!756201 (= e!421670 Unit!26135)))

(assert (=> b!756201 false))

(declare-fun b!756202 () Bool)

(declare-fun res!511245 () Bool)

(assert (=> b!756202 (=> (not res!511245) (not e!421663))))

(declare-fun arrayContainsKey!0 (array!41949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756202 (= res!511245 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756203 () Bool)

(declare-fun e!421668 () Bool)

(assert (=> b!756203 (= e!421665 (not e!421668))))

(declare-fun res!511249 () Bool)

(assert (=> b!756203 (=> res!511249 e!421668)))

(assert (=> b!756203 (= res!511249 (or (not (is-Intermediate!7688 lt!336655)) (bvslt x!1131 (x!64022 lt!336655)) (not (= x!1131 (x!64022 lt!336655))) (not (= index!1321 (index!33122 lt!336655)))))))

(assert (=> b!756203 e!421666))

(declare-fun res!511247 () Bool)

(assert (=> b!756203 (=> (not res!511247) (not e!421666))))

(assert (=> b!756203 (= res!511247 (= lt!336659 lt!336665))))

(assert (=> b!756203 (= lt!336665 (Found!7688 j!159))))

(assert (=> b!756203 (= lt!336659 (seekEntryOrOpen!0 (select (arr!20088 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!756203 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336654 () Unit!26132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41949 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26132)

(assert (=> b!756203 (= lt!336654 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!336662 () SeekEntryResult!7688)

(declare-fun b!756204 () Bool)

(assert (=> b!756204 (= e!421672 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20088 a!3186) j!159) a!3186 mask!3328) lt!336662))))

(declare-fun b!756205 () Bool)

(assert (=> b!756205 (= e!421664 e!421673)))

(declare-fun res!511236 () Bool)

(assert (=> b!756205 (=> (not res!511236) (not e!421673))))

(assert (=> b!756205 (= res!511236 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20088 a!3186) j!159) mask!3328) (select (arr!20088 a!3186) j!159) a!3186 mask!3328) lt!336662))))

(assert (=> b!756205 (= lt!336662 (Intermediate!7688 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756206 () Bool)

(declare-fun res!511246 () Bool)

(assert (=> b!756206 (=> (not res!511246) (not e!421663))))

(assert (=> b!756206 (= res!511246 (and (= (size!20509 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20509 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20509 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756207 () Bool)

(assert (=> b!756207 (= e!421668 e!421671)))

(declare-fun res!511248 () Bool)

(assert (=> b!756207 (=> res!511248 e!421671)))

(assert (=> b!756207 (= res!511248 (not (= lt!336658 lt!336665)))))

(assert (=> b!756207 (= lt!336658 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20088 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65776 res!511238) b!756206))

(assert (= (and b!756206 res!511246) b!756198))

(assert (= (and b!756198 res!511233) b!756199))

(assert (= (and b!756199 res!511244) b!756202))

(assert (= (and b!756202 res!511245) b!756186))

(assert (= (and b!756186 res!511234) b!756196))

(assert (= (and b!756196 res!511239) b!756189))

(assert (= (and b!756189 res!511235) b!756200))

(assert (= (and b!756200 res!511250) b!756205))

(assert (= (and b!756205 res!511236) b!756188))

(assert (= (and b!756188 res!511237) b!756187))

(assert (= (and b!756187 c!82858) b!756204))

(assert (= (and b!756187 (not c!82858)) b!756191))

(assert (= (and b!756187 res!511232) b!756194))

(assert (= (and b!756194 res!511242) b!756203))

(assert (= (and b!756203 res!511247) b!756193))

(assert (= (and b!756203 (not res!511249)) b!756207))

(assert (= (and b!756207 (not res!511248)) b!756192))

(assert (= (and b!756192 (not res!511241)) b!756190))

(assert (= (and b!756190 c!82857) b!756201))

(assert (= (and b!756190 (not c!82857)) b!756185))

(assert (= (and b!756190 res!511243) b!756195))

(assert (= (and b!756195 res!511240) b!756197))

(declare-fun m!704203 () Bool)

(assert (=> b!756191 m!704203))

(assert (=> b!756191 m!704203))

(declare-fun m!704205 () Bool)

(assert (=> b!756191 m!704205))

(assert (=> b!756198 m!704203))

(assert (=> b!756198 m!704203))

(declare-fun m!704207 () Bool)

(assert (=> b!756198 m!704207))

(assert (=> b!756207 m!704203))

(assert (=> b!756207 m!704203))

(assert (=> b!756207 m!704205))

(declare-fun m!704209 () Bool)

(assert (=> b!756192 m!704209))

(declare-fun m!704211 () Bool)

(assert (=> b!756192 m!704211))

(declare-fun m!704213 () Bool)

(assert (=> b!756189 m!704213))

(assert (=> b!756193 m!704203))

(assert (=> b!756193 m!704203))

(declare-fun m!704215 () Bool)

(assert (=> b!756193 m!704215))

(assert (=> b!756204 m!704203))

(assert (=> b!756204 m!704203))

(declare-fun m!704217 () Bool)

(assert (=> b!756204 m!704217))

(declare-fun m!704219 () Bool)

(assert (=> b!756195 m!704219))

(declare-fun m!704221 () Bool)

(assert (=> b!756195 m!704221))

(declare-fun m!704223 () Bool)

(assert (=> b!756188 m!704223))

(declare-fun m!704225 () Bool)

(assert (=> b!756186 m!704225))

(declare-fun m!704227 () Bool)

(assert (=> b!756202 m!704227))

(declare-fun m!704229 () Bool)

(assert (=> b!756199 m!704229))

(declare-fun m!704231 () Bool)

(assert (=> start!65776 m!704231))

(declare-fun m!704233 () Bool)

(assert (=> start!65776 m!704233))

(assert (=> b!756203 m!704203))

(assert (=> b!756203 m!704203))

(declare-fun m!704235 () Bool)

(assert (=> b!756203 m!704235))

(declare-fun m!704237 () Bool)

(assert (=> b!756203 m!704237))

(declare-fun m!704239 () Bool)

(assert (=> b!756203 m!704239))

(assert (=> b!756205 m!704203))

(assert (=> b!756205 m!704203))

(declare-fun m!704241 () Bool)

(assert (=> b!756205 m!704241))

(assert (=> b!756205 m!704241))

(assert (=> b!756205 m!704203))

(declare-fun m!704243 () Bool)

(assert (=> b!756205 m!704243))

(declare-fun m!704245 () Bool)

(assert (=> b!756196 m!704245))

(declare-fun m!704247 () Bool)

(assert (=> b!756194 m!704247))

(declare-fun m!704249 () Bool)

(assert (=> b!756194 m!704249))

(assert (=> b!756194 m!704247))

(assert (=> b!756194 m!704209))

(declare-fun m!704251 () Bool)

(assert (=> b!756194 m!704251))

(declare-fun m!704253 () Bool)

(assert (=> b!756194 m!704253))

(push 1)

