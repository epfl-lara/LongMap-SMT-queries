; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65538 () Bool)

(assert start!65538)

(declare-fun res!501802 () Bool)

(declare-fun e!416365 () Bool)

(assert (=> start!65538 (=> (not res!501802) (not e!416365))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65538 (= res!501802 (validMask!0 mask!3328))))

(assert (=> start!65538 e!416365))

(assert (=> start!65538 true))

(declare-datatypes ((array!41581 0))(
  ( (array!41582 (arr!19900 (Array (_ BitVec 32) (_ BitVec 64))) (size!20320 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41581)

(declare-fun array_inv!15759 (array!41581) Bool)

(assert (=> start!65538 (array_inv!15759 a!3186)))

(declare-fun b!745249 () Bool)

(declare-fun res!501789 () Bool)

(assert (=> b!745249 (=> (not res!501789) (not e!416365))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745249 (= res!501789 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!416372 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!745250 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7456 0))(
  ( (MissingZero!7456 (index!32192 (_ BitVec 32))) (Found!7456 (index!32193 (_ BitVec 32))) (Intermediate!7456 (undefined!8268 Bool) (index!32194 (_ BitVec 32)) (x!63314 (_ BitVec 32))) (Undefined!7456) (MissingVacant!7456 (index!32195 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41581 (_ BitVec 32)) SeekEntryResult!7456)

(assert (=> b!745250 (= e!416372 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19900 a!3186) j!159) a!3186 mask!3328) (Found!7456 j!159)))))

(declare-fun b!745251 () Bool)

(declare-fun e!416367 () Bool)

(assert (=> b!745251 (= e!416365 e!416367)))

(declare-fun res!501791 () Bool)

(assert (=> b!745251 (=> (not res!501791) (not e!416367))))

(declare-fun lt!331058 () SeekEntryResult!7456)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745251 (= res!501791 (or (= lt!331058 (MissingZero!7456 i!1173)) (= lt!331058 (MissingVacant!7456 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41581 (_ BitVec 32)) SeekEntryResult!7456)

(assert (=> b!745251 (= lt!331058 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!331062 () SeekEntryResult!7456)

(declare-fun b!745252 () Bool)

(declare-fun e!416373 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745252 (= e!416373 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19900 a!3186) j!159) a!3186 mask!3328) lt!331062))))

(declare-fun b!745253 () Bool)

(declare-fun lt!331059 () (_ BitVec 64))

(declare-fun e!416369 () Bool)

(assert (=> b!745253 (= e!416369 (or (= (select (store (arr!19900 a!3186) i!1173 k0!2102) index!1321) lt!331059) (not (= (select (store (arr!19900 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!745254 () Bool)

(declare-fun res!501790 () Bool)

(assert (=> b!745254 (=> (not res!501790) (not e!416367))))

(declare-datatypes ((List!13809 0))(
  ( (Nil!13806) (Cons!13805 (h!14883 (_ BitVec 64)) (t!20116 List!13809)) )
))
(declare-fun arrayNoDuplicates!0 (array!41581 (_ BitVec 32) List!13809) Bool)

(assert (=> b!745254 (= res!501790 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13806))))

(declare-fun b!745255 () Bool)

(declare-fun e!416370 () Bool)

(declare-fun e!416368 () Bool)

(assert (=> b!745255 (= e!416370 e!416368)))

(declare-fun res!501787 () Bool)

(assert (=> b!745255 (=> (not res!501787) (not e!416368))))

(declare-fun lt!331060 () SeekEntryResult!7456)

(declare-fun lt!331061 () SeekEntryResult!7456)

(assert (=> b!745255 (= res!501787 (= lt!331060 lt!331061))))

(declare-fun lt!331057 () array!41581)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41581 (_ BitVec 32)) SeekEntryResult!7456)

(assert (=> b!745255 (= lt!331061 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331059 lt!331057 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745255 (= lt!331060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331059 mask!3328) lt!331059 lt!331057 mask!3328))))

(assert (=> b!745255 (= lt!331059 (select (store (arr!19900 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745255 (= lt!331057 (array!41582 (store (arr!19900 a!3186) i!1173 k0!2102) (size!20320 a!3186)))))

(declare-fun b!745256 () Bool)

(declare-fun res!501797 () Bool)

(assert (=> b!745256 (=> (not res!501797) (not e!416365))))

(assert (=> b!745256 (= res!501797 (and (= (size!20320 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20320 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20320 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745257 () Bool)

(declare-fun res!501794 () Bool)

(assert (=> b!745257 (=> (not res!501794) (not e!416367))))

(assert (=> b!745257 (= res!501794 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20320 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20320 a!3186))))))

(declare-fun b!745258 () Bool)

(declare-fun res!501800 () Bool)

(assert (=> b!745258 (=> (not res!501800) (not e!416365))))

(declare-fun arrayContainsKey!0 (array!41581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745258 (= res!501800 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745259 () Bool)

(declare-fun res!501788 () Bool)

(assert (=> b!745259 (=> (not res!501788) (not e!416370))))

(assert (=> b!745259 (= res!501788 e!416372)))

(declare-fun c!82115 () Bool)

(assert (=> b!745259 (= c!82115 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745260 () Bool)

(assert (=> b!745260 (= e!416367 e!416370)))

(declare-fun res!501792 () Bool)

(assert (=> b!745260 (=> (not res!501792) (not e!416370))))

(declare-fun lt!331056 () SeekEntryResult!7456)

(assert (=> b!745260 (= res!501792 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19900 a!3186) j!159) mask!3328) (select (arr!19900 a!3186) j!159) a!3186 mask!3328) lt!331056))))

(assert (=> b!745260 (= lt!331056 (Intermediate!7456 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745261 () Bool)

(declare-fun e!416371 () Bool)

(assert (=> b!745261 (= e!416371 e!416373)))

(declare-fun res!501796 () Bool)

(assert (=> b!745261 (=> (not res!501796) (not e!416373))))

(assert (=> b!745261 (= res!501796 (= (seekEntryOrOpen!0 (select (arr!19900 a!3186) j!159) a!3186 mask!3328) lt!331062))))

(assert (=> b!745261 (= lt!331062 (Found!7456 j!159))))

(declare-fun b!745262 () Bool)

(assert (=> b!745262 (= e!416368 (not e!416369))))

(declare-fun res!501786 () Bool)

(assert (=> b!745262 (=> res!501786 e!416369)))

(get-info :version)

(assert (=> b!745262 (= res!501786 (or (not ((_ is Intermediate!7456) lt!331061)) (bvslt x!1131 (x!63314 lt!331061)) (not (= x!1131 (x!63314 lt!331061))) (not (= index!1321 (index!32194 lt!331061)))))))

(assert (=> b!745262 e!416371))

(declare-fun res!501798 () Bool)

(assert (=> b!745262 (=> (not res!501798) (not e!416371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41581 (_ BitVec 32)) Bool)

(assert (=> b!745262 (= res!501798 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25471 0))(
  ( (Unit!25472) )
))
(declare-fun lt!331055 () Unit!25471)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25471)

(assert (=> b!745262 (= lt!331055 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745263 () Bool)

(declare-fun res!501801 () Bool)

(assert (=> b!745263 (=> (not res!501801) (not e!416370))))

(assert (=> b!745263 (= res!501801 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19900 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745264 () Bool)

(declare-fun res!501799 () Bool)

(assert (=> b!745264 (=> (not res!501799) (not e!416367))))

(assert (=> b!745264 (= res!501799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745265 () Bool)

(assert (=> b!745265 (= e!416372 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19900 a!3186) j!159) a!3186 mask!3328) lt!331056))))

(declare-fun b!745266 () Bool)

(declare-fun res!501795 () Bool)

(assert (=> b!745266 (=> (not res!501795) (not e!416365))))

(assert (=> b!745266 (= res!501795 (validKeyInArray!0 (select (arr!19900 a!3186) j!159)))))

(declare-fun b!745267 () Bool)

(declare-fun res!501793 () Bool)

(assert (=> b!745267 (=> res!501793 e!416369)))

(assert (=> b!745267 (= res!501793 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19900 a!3186) j!159) a!3186 mask!3328) (Found!7456 j!159))))))

(assert (= (and start!65538 res!501802) b!745256))

(assert (= (and b!745256 res!501797) b!745266))

(assert (= (and b!745266 res!501795) b!745249))

(assert (= (and b!745249 res!501789) b!745258))

(assert (= (and b!745258 res!501800) b!745251))

(assert (= (and b!745251 res!501791) b!745264))

(assert (= (and b!745264 res!501799) b!745254))

(assert (= (and b!745254 res!501790) b!745257))

(assert (= (and b!745257 res!501794) b!745260))

(assert (= (and b!745260 res!501792) b!745263))

(assert (= (and b!745263 res!501801) b!745259))

(assert (= (and b!745259 c!82115) b!745265))

(assert (= (and b!745259 (not c!82115)) b!745250))

(assert (= (and b!745259 res!501788) b!745255))

(assert (= (and b!745255 res!501787) b!745262))

(assert (= (and b!745262 res!501798) b!745261))

(assert (= (and b!745261 res!501796) b!745252))

(assert (= (and b!745262 (not res!501786)) b!745267))

(assert (= (and b!745267 (not res!501793)) b!745253))

(declare-fun m!696183 () Bool)

(assert (=> b!745261 m!696183))

(assert (=> b!745261 m!696183))

(declare-fun m!696185 () Bool)

(assert (=> b!745261 m!696185))

(assert (=> b!745265 m!696183))

(assert (=> b!745265 m!696183))

(declare-fun m!696187 () Bool)

(assert (=> b!745265 m!696187))

(declare-fun m!696189 () Bool)

(assert (=> b!745249 m!696189))

(declare-fun m!696191 () Bool)

(assert (=> b!745264 m!696191))

(declare-fun m!696193 () Bool)

(assert (=> b!745251 m!696193))

(declare-fun m!696195 () Bool)

(assert (=> b!745254 m!696195))

(assert (=> b!745250 m!696183))

(assert (=> b!745250 m!696183))

(declare-fun m!696197 () Bool)

(assert (=> b!745250 m!696197))

(assert (=> b!745260 m!696183))

(assert (=> b!745260 m!696183))

(declare-fun m!696199 () Bool)

(assert (=> b!745260 m!696199))

(assert (=> b!745260 m!696199))

(assert (=> b!745260 m!696183))

(declare-fun m!696201 () Bool)

(assert (=> b!745260 m!696201))

(declare-fun m!696203 () Bool)

(assert (=> b!745253 m!696203))

(declare-fun m!696205 () Bool)

(assert (=> b!745253 m!696205))

(declare-fun m!696207 () Bool)

(assert (=> start!65538 m!696207))

(declare-fun m!696209 () Bool)

(assert (=> start!65538 m!696209))

(assert (=> b!745252 m!696183))

(assert (=> b!745252 m!696183))

(declare-fun m!696211 () Bool)

(assert (=> b!745252 m!696211))

(assert (=> b!745266 m!696183))

(assert (=> b!745266 m!696183))

(declare-fun m!696213 () Bool)

(assert (=> b!745266 m!696213))

(declare-fun m!696215 () Bool)

(assert (=> b!745262 m!696215))

(declare-fun m!696217 () Bool)

(assert (=> b!745262 m!696217))

(declare-fun m!696219 () Bool)

(assert (=> b!745258 m!696219))

(declare-fun m!696221 () Bool)

(assert (=> b!745255 m!696221))

(assert (=> b!745255 m!696203))

(declare-fun m!696223 () Bool)

(assert (=> b!745255 m!696223))

(declare-fun m!696225 () Bool)

(assert (=> b!745255 m!696225))

(declare-fun m!696227 () Bool)

(assert (=> b!745255 m!696227))

(assert (=> b!745255 m!696223))

(declare-fun m!696229 () Bool)

(assert (=> b!745263 m!696229))

(assert (=> b!745267 m!696183))

(assert (=> b!745267 m!696183))

(assert (=> b!745267 m!696197))

(check-sat (not b!745255) (not b!745262) (not b!745250) (not b!745261) (not start!65538) (not b!745258) (not b!745260) (not b!745267) (not b!745249) (not b!745251) (not b!745265) (not b!745264) (not b!745266) (not b!745254) (not b!745252))
(check-sat)
