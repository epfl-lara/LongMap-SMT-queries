; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65706 () Bool)

(assert start!65706)

(declare-fun b!750196 () Bool)

(declare-datatypes ((Unit!25717 0))(
  ( (Unit!25718) )
))
(declare-fun e!418677 () Unit!25717)

(declare-fun Unit!25719 () Unit!25717)

(assert (=> b!750196 (= e!418677 Unit!25719)))

(assert (=> b!750196 false))

(declare-fun b!750198 () Bool)

(declare-fun res!505999 () Bool)

(declare-fun e!418680 () Bool)

(assert (=> b!750198 (=> res!505999 e!418680)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41749 0))(
  ( (array!41750 (arr!19984 (Array (_ BitVec 32) (_ BitVec 64))) (size!20404 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41749)

(declare-datatypes ((SeekEntryResult!7540 0))(
  ( (MissingZero!7540 (index!32528 (_ BitVec 32))) (Found!7540 (index!32529 (_ BitVec 32))) (Intermediate!7540 (undefined!8352 Bool) (index!32530 (_ BitVec 32)) (x!63622 (_ BitVec 32))) (Undefined!7540) (MissingVacant!7540 (index!32531 (_ BitVec 32))) )
))
(declare-fun lt!333503 () SeekEntryResult!7540)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41749 (_ BitVec 32)) SeekEntryResult!7540)

(assert (=> b!750198 (= res!505999 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19984 a!3186) j!159) a!3186 mask!3328) lt!333503)))))

(declare-fun b!750199 () Bool)

(declare-fun res!506002 () Bool)

(declare-fun e!418674 () Bool)

(assert (=> b!750199 (=> (not res!506002) (not e!418674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750199 (= res!506002 (validKeyInArray!0 (select (arr!19984 a!3186) j!159)))))

(declare-fun e!418675 () Bool)

(declare-fun b!750200 () Bool)

(assert (=> b!750200 (= e!418675 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19984 a!3186) j!159) a!3186 mask!3328) (Found!7540 j!159)))))

(declare-fun b!750201 () Bool)

(declare-fun e!418683 () Bool)

(assert (=> b!750201 (= e!418683 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun e!418682 () Bool)

(assert (=> b!750201 e!418682))

(declare-fun res!505991 () Bool)

(assert (=> b!750201 (=> (not res!505991) (not e!418682))))

(declare-fun lt!333506 () (_ BitVec 64))

(assert (=> b!750201 (= res!505991 (= lt!333506 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333504 () Unit!25717)

(assert (=> b!750201 (= lt!333504 e!418677)))

(declare-fun c!82487 () Bool)

(assert (=> b!750201 (= c!82487 (= lt!333506 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750202 () Bool)

(declare-fun lt!333508 () (_ BitVec 64))

(declare-fun lt!333505 () array!41749)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41749 (_ BitVec 32)) SeekEntryResult!7540)

(assert (=> b!750202 (= e!418682 (= (seekEntryOrOpen!0 lt!333508 lt!333505 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333508 lt!333505 mask!3328)))))

(declare-fun b!750203 () Bool)

(declare-fun res!505998 () Bool)

(declare-fun e!418681 () Bool)

(assert (=> b!750203 (=> (not res!505998) (not e!418681))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750203 (= res!505998 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20404 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20404 a!3186))))))

(declare-fun b!750204 () Bool)

(declare-fun res!505992 () Bool)

(assert (=> b!750204 (=> (not res!505992) (not e!418681))))

(declare-datatypes ((List!13893 0))(
  ( (Nil!13890) (Cons!13889 (h!14967 (_ BitVec 64)) (t!20200 List!13893)) )
))
(declare-fun arrayNoDuplicates!0 (array!41749 (_ BitVec 32) List!13893) Bool)

(assert (=> b!750204 (= res!505992 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13890))))

(declare-fun b!750205 () Bool)

(declare-fun res!505997 () Bool)

(assert (=> b!750205 (=> (not res!505997) (not e!418674))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750205 (= res!505997 (and (= (size!20404 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20404 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20404 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750206 () Bool)

(declare-fun e!418673 () Bool)

(assert (=> b!750206 (= e!418673 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19984 a!3186) j!159) a!3186 mask!3328) lt!333503))))

(declare-fun b!750207 () Bool)

(declare-fun e!418678 () Bool)

(declare-fun e!418676 () Bool)

(assert (=> b!750207 (= e!418678 e!418676)))

(declare-fun res!506007 () Bool)

(assert (=> b!750207 (=> (not res!506007) (not e!418676))))

(declare-fun lt!333509 () SeekEntryResult!7540)

(declare-fun lt!333500 () SeekEntryResult!7540)

(assert (=> b!750207 (= res!506007 (= lt!333509 lt!333500))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41749 (_ BitVec 32)) SeekEntryResult!7540)

(assert (=> b!750207 (= lt!333500 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333508 lt!333505 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750207 (= lt!333509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333508 mask!3328) lt!333508 lt!333505 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!750207 (= lt!333508 (select (store (arr!19984 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750207 (= lt!333505 (array!41750 (store (arr!19984 a!3186) i!1173 k0!2102) (size!20404 a!3186)))))

(declare-fun b!750208 () Bool)

(declare-fun res!506003 () Bool)

(assert (=> b!750208 (=> (not res!506003) (not e!418678))))

(assert (=> b!750208 (= res!506003 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19984 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!506008 () Bool)

(assert (=> start!65706 (=> (not res!506008) (not e!418674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65706 (= res!506008 (validMask!0 mask!3328))))

(assert (=> start!65706 e!418674))

(assert (=> start!65706 true))

(declare-fun array_inv!15843 (array!41749) Bool)

(assert (=> start!65706 (array_inv!15843 a!3186)))

(declare-fun b!750197 () Bool)

(declare-fun res!506000 () Bool)

(assert (=> b!750197 (=> (not res!506000) (not e!418674))))

(assert (=> b!750197 (= res!506000 (validKeyInArray!0 k0!2102))))

(declare-fun b!750209 () Bool)

(declare-fun Unit!25720 () Unit!25717)

(assert (=> b!750209 (= e!418677 Unit!25720)))

(declare-fun b!750210 () Bool)

(declare-fun res!506001 () Bool)

(assert (=> b!750210 (=> (not res!506001) (not e!418678))))

(assert (=> b!750210 (= res!506001 e!418675)))

(declare-fun c!82486 () Bool)

(assert (=> b!750210 (= c!82486 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750211 () Bool)

(declare-fun res!505994 () Bool)

(assert (=> b!750211 (=> (not res!505994) (not e!418674))))

(declare-fun arrayContainsKey!0 (array!41749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750211 (= res!505994 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750212 () Bool)

(assert (=> b!750212 (= e!418676 (not e!418680))))

(declare-fun res!506006 () Bool)

(assert (=> b!750212 (=> res!506006 e!418680)))

(get-info :version)

(assert (=> b!750212 (= res!506006 (or (not ((_ is Intermediate!7540) lt!333500)) (bvslt x!1131 (x!63622 lt!333500)) (not (= x!1131 (x!63622 lt!333500))) (not (= index!1321 (index!32530 lt!333500)))))))

(assert (=> b!750212 e!418673))

(declare-fun res!505995 () Bool)

(assert (=> b!750212 (=> (not res!505995) (not e!418673))))

(declare-fun lt!333507 () SeekEntryResult!7540)

(assert (=> b!750212 (= res!505995 (= lt!333507 lt!333503))))

(assert (=> b!750212 (= lt!333503 (Found!7540 j!159))))

(assert (=> b!750212 (= lt!333507 (seekEntryOrOpen!0 (select (arr!19984 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41749 (_ BitVec 32)) Bool)

(assert (=> b!750212 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333502 () Unit!25717)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25717)

(assert (=> b!750212 (= lt!333502 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750213 () Bool)

(assert (=> b!750213 (= e!418680 e!418683)))

(declare-fun res!506004 () Bool)

(assert (=> b!750213 (=> res!506004 e!418683)))

(assert (=> b!750213 (= res!506004 (= lt!333506 lt!333508))))

(assert (=> b!750213 (= lt!333506 (select (store (arr!19984 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750214 () Bool)

(declare-fun res!506005 () Bool)

(assert (=> b!750214 (=> (not res!506005) (not e!418681))))

(assert (=> b!750214 (= res!506005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750215 () Bool)

(assert (=> b!750215 (= e!418681 e!418678)))

(declare-fun res!505993 () Bool)

(assert (=> b!750215 (=> (not res!505993) (not e!418678))))

(declare-fun lt!333510 () SeekEntryResult!7540)

(assert (=> b!750215 (= res!505993 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19984 a!3186) j!159) mask!3328) (select (arr!19984 a!3186) j!159) a!3186 mask!3328) lt!333510))))

(assert (=> b!750215 (= lt!333510 (Intermediate!7540 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750216 () Bool)

(assert (=> b!750216 (= e!418674 e!418681)))

(declare-fun res!505996 () Bool)

(assert (=> b!750216 (=> (not res!505996) (not e!418681))))

(declare-fun lt!333501 () SeekEntryResult!7540)

(assert (=> b!750216 (= res!505996 (or (= lt!333501 (MissingZero!7540 i!1173)) (= lt!333501 (MissingVacant!7540 i!1173))))))

(assert (=> b!750216 (= lt!333501 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750217 () Bool)

(assert (=> b!750217 (= e!418675 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19984 a!3186) j!159) a!3186 mask!3328) lt!333510))))

(assert (= (and start!65706 res!506008) b!750205))

(assert (= (and b!750205 res!505997) b!750199))

(assert (= (and b!750199 res!506002) b!750197))

(assert (= (and b!750197 res!506000) b!750211))

(assert (= (and b!750211 res!505994) b!750216))

(assert (= (and b!750216 res!505996) b!750214))

(assert (= (and b!750214 res!506005) b!750204))

(assert (= (and b!750204 res!505992) b!750203))

(assert (= (and b!750203 res!505998) b!750215))

(assert (= (and b!750215 res!505993) b!750208))

(assert (= (and b!750208 res!506003) b!750210))

(assert (= (and b!750210 c!82486) b!750217))

(assert (= (and b!750210 (not c!82486)) b!750200))

(assert (= (and b!750210 res!506001) b!750207))

(assert (= (and b!750207 res!506007) b!750212))

(assert (= (and b!750212 res!505995) b!750206))

(assert (= (and b!750212 (not res!506006)) b!750198))

(assert (= (and b!750198 (not res!505999)) b!750213))

(assert (= (and b!750213 (not res!506004)) b!750201))

(assert (= (and b!750201 c!82487) b!750196))

(assert (= (and b!750201 (not c!82487)) b!750209))

(assert (= (and b!750201 res!505991) b!750202))

(declare-fun m!700215 () Bool)

(assert (=> b!750212 m!700215))

(assert (=> b!750212 m!700215))

(declare-fun m!700217 () Bool)

(assert (=> b!750212 m!700217))

(declare-fun m!700219 () Bool)

(assert (=> b!750212 m!700219))

(declare-fun m!700221 () Bool)

(assert (=> b!750212 m!700221))

(assert (=> b!750217 m!700215))

(assert (=> b!750217 m!700215))

(declare-fun m!700223 () Bool)

(assert (=> b!750217 m!700223))

(declare-fun m!700225 () Bool)

(assert (=> start!65706 m!700225))

(declare-fun m!700227 () Bool)

(assert (=> start!65706 m!700227))

(declare-fun m!700229 () Bool)

(assert (=> b!750213 m!700229))

(declare-fun m!700231 () Bool)

(assert (=> b!750213 m!700231))

(declare-fun m!700233 () Bool)

(assert (=> b!750214 m!700233))

(declare-fun m!700235 () Bool)

(assert (=> b!750208 m!700235))

(assert (=> b!750215 m!700215))

(assert (=> b!750215 m!700215))

(declare-fun m!700237 () Bool)

(assert (=> b!750215 m!700237))

(assert (=> b!750215 m!700237))

(assert (=> b!750215 m!700215))

(declare-fun m!700239 () Bool)

(assert (=> b!750215 m!700239))

(declare-fun m!700241 () Bool)

(assert (=> b!750204 m!700241))

(assert (=> b!750199 m!700215))

(assert (=> b!750199 m!700215))

(declare-fun m!700243 () Bool)

(assert (=> b!750199 m!700243))

(declare-fun m!700245 () Bool)

(assert (=> b!750207 m!700245))

(assert (=> b!750207 m!700229))

(declare-fun m!700247 () Bool)

(assert (=> b!750207 m!700247))

(declare-fun m!700249 () Bool)

(assert (=> b!750207 m!700249))

(assert (=> b!750207 m!700249))

(declare-fun m!700251 () Bool)

(assert (=> b!750207 m!700251))

(assert (=> b!750198 m!700215))

(assert (=> b!750198 m!700215))

(declare-fun m!700253 () Bool)

(assert (=> b!750198 m!700253))

(declare-fun m!700255 () Bool)

(assert (=> b!750202 m!700255))

(declare-fun m!700257 () Bool)

(assert (=> b!750202 m!700257))

(declare-fun m!700259 () Bool)

(assert (=> b!750197 m!700259))

(assert (=> b!750206 m!700215))

(assert (=> b!750206 m!700215))

(declare-fun m!700261 () Bool)

(assert (=> b!750206 m!700261))

(assert (=> b!750200 m!700215))

(assert (=> b!750200 m!700215))

(assert (=> b!750200 m!700253))

(declare-fun m!700263 () Bool)

(assert (=> b!750211 m!700263))

(declare-fun m!700265 () Bool)

(assert (=> b!750216 m!700265))

(check-sat (not b!750211) (not start!65706) (not b!750214) (not b!750202) (not b!750217) (not b!750207) (not b!750215) (not b!750199) (not b!750206) (not b!750198) (not b!750212) (not b!750200) (not b!750216) (not b!750197) (not b!750204))
(check-sat)
