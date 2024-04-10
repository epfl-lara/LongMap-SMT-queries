; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65286 () Bool)

(assert start!65286)

(declare-fun b!741086 () Bool)

(declare-fun e!414283 () Bool)

(declare-fun e!414282 () Bool)

(assert (=> b!741086 (= e!414283 e!414282)))

(declare-fun res!498441 () Bool)

(assert (=> b!741086 (=> (not res!498441) (not e!414282))))

(declare-datatypes ((array!41459 0))(
  ( (array!41460 (arr!19843 (Array (_ BitVec 32) (_ BitVec 64))) (size!20264 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41459)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7443 0))(
  ( (MissingZero!7443 (index!32140 (_ BitVec 32))) (Found!7443 (index!32141 (_ BitVec 32))) (Intermediate!7443 (undefined!8255 Bool) (index!32142 (_ BitVec 32)) (x!63121 (_ BitVec 32))) (Undefined!7443) (MissingVacant!7443 (index!32143 (_ BitVec 32))) )
))
(declare-fun lt!329264 () SeekEntryResult!7443)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41459 (_ BitVec 32)) SeekEntryResult!7443)

(assert (=> b!741086 (= res!498441 (= (seekEntryOrOpen!0 (select (arr!19843 a!3186) j!159) a!3186 mask!3328) lt!329264))))

(assert (=> b!741086 (= lt!329264 (Found!7443 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!741087 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41459 (_ BitVec 32)) SeekEntryResult!7443)

(assert (=> b!741087 (= e!414282 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19843 a!3186) j!159) a!3186 mask!3328) lt!329264))))

(declare-fun b!741088 () Bool)

(declare-fun res!498437 () Bool)

(declare-fun e!414285 () Bool)

(assert (=> b!741088 (=> (not res!498437) (not e!414285))))

(declare-datatypes ((List!13845 0))(
  ( (Nil!13842) (Cons!13841 (h!14913 (_ BitVec 64)) (t!20160 List!13845)) )
))
(declare-fun arrayNoDuplicates!0 (array!41459 (_ BitVec 32) List!13845) Bool)

(assert (=> b!741088 (= res!498437 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13842))))

(declare-fun b!741089 () Bool)

(declare-fun res!498449 () Bool)

(declare-fun e!414287 () Bool)

(assert (=> b!741089 (=> (not res!498449) (not e!414287))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741089 (= res!498449 (and (= (size!20264 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20264 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20264 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741090 () Bool)

(declare-fun res!498440 () Bool)

(assert (=> b!741090 (=> (not res!498440) (not e!414285))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!741090 (= res!498440 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20264 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20264 a!3186))))))

(declare-fun b!741091 () Bool)

(declare-fun res!498435 () Bool)

(assert (=> b!741091 (=> (not res!498435) (not e!414287))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741091 (= res!498435 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741092 () Bool)

(declare-fun lt!329263 () SeekEntryResult!7443)

(declare-fun e!414281 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41459 (_ BitVec 32)) SeekEntryResult!7443)

(assert (=> b!741092 (= e!414281 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19843 a!3186) j!159) a!3186 mask!3328) lt!329263))))

(declare-fun b!741093 () Bool)

(declare-fun e!414284 () Bool)

(assert (=> b!741093 (= e!414284 (not true))))

(assert (=> b!741093 e!414283))

(declare-fun res!498436 () Bool)

(assert (=> b!741093 (=> (not res!498436) (not e!414283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41459 (_ BitVec 32)) Bool)

(assert (=> b!741093 (= res!498436 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25366 0))(
  ( (Unit!25367) )
))
(declare-fun lt!329267 () Unit!25366)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41459 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25366)

(assert (=> b!741093 (= lt!329267 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741094 () Bool)

(declare-fun res!498446 () Bool)

(assert (=> b!741094 (=> (not res!498446) (not e!414287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741094 (= res!498446 (validKeyInArray!0 k0!2102))))

(declare-fun b!741095 () Bool)

(declare-fun res!498447 () Bool)

(declare-fun e!414286 () Bool)

(assert (=> b!741095 (=> (not res!498447) (not e!414286))))

(assert (=> b!741095 (= res!498447 e!414281)))

(declare-fun c!81706 () Bool)

(assert (=> b!741095 (= c!81706 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741096 () Bool)

(assert (=> b!741096 (= e!414285 e!414286)))

(declare-fun res!498445 () Bool)

(assert (=> b!741096 (=> (not res!498445) (not e!414286))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741096 (= res!498445 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19843 a!3186) j!159) mask!3328) (select (arr!19843 a!3186) j!159) a!3186 mask!3328) lt!329263))))

(assert (=> b!741096 (= lt!329263 (Intermediate!7443 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741097 () Bool)

(declare-fun res!498444 () Bool)

(assert (=> b!741097 (=> (not res!498444) (not e!414287))))

(assert (=> b!741097 (= res!498444 (validKeyInArray!0 (select (arr!19843 a!3186) j!159)))))

(declare-fun b!741098 () Bool)

(assert (=> b!741098 (= e!414286 e!414284)))

(declare-fun res!498442 () Bool)

(assert (=> b!741098 (=> (not res!498442) (not e!414284))))

(declare-fun lt!329265 () (_ BitVec 64))

(declare-fun lt!329262 () array!41459)

(assert (=> b!741098 (= res!498442 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329265 mask!3328) lt!329265 lt!329262 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329265 lt!329262 mask!3328)))))

(assert (=> b!741098 (= lt!329265 (select (store (arr!19843 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741098 (= lt!329262 (array!41460 (store (arr!19843 a!3186) i!1173 k0!2102) (size!20264 a!3186)))))

(declare-fun b!741099 () Bool)

(assert (=> b!741099 (= e!414281 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19843 a!3186) j!159) a!3186 mask!3328) (Found!7443 j!159)))))

(declare-fun b!741100 () Bool)

(declare-fun res!498448 () Bool)

(assert (=> b!741100 (=> (not res!498448) (not e!414285))))

(assert (=> b!741100 (= res!498448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741101 () Bool)

(assert (=> b!741101 (= e!414287 e!414285)))

(declare-fun res!498439 () Bool)

(assert (=> b!741101 (=> (not res!498439) (not e!414285))))

(declare-fun lt!329266 () SeekEntryResult!7443)

(assert (=> b!741101 (= res!498439 (or (= lt!329266 (MissingZero!7443 i!1173)) (= lt!329266 (MissingVacant!7443 i!1173))))))

(assert (=> b!741101 (= lt!329266 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!498438 () Bool)

(assert (=> start!65286 (=> (not res!498438) (not e!414287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65286 (= res!498438 (validMask!0 mask!3328))))

(assert (=> start!65286 e!414287))

(assert (=> start!65286 true))

(declare-fun array_inv!15639 (array!41459) Bool)

(assert (=> start!65286 (array_inv!15639 a!3186)))

(declare-fun b!741102 () Bool)

(declare-fun res!498443 () Bool)

(assert (=> b!741102 (=> (not res!498443) (not e!414286))))

(assert (=> b!741102 (= res!498443 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19843 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65286 res!498438) b!741089))

(assert (= (and b!741089 res!498449) b!741097))

(assert (= (and b!741097 res!498444) b!741094))

(assert (= (and b!741094 res!498446) b!741091))

(assert (= (and b!741091 res!498435) b!741101))

(assert (= (and b!741101 res!498439) b!741100))

(assert (= (and b!741100 res!498448) b!741088))

(assert (= (and b!741088 res!498437) b!741090))

(assert (= (and b!741090 res!498440) b!741096))

(assert (= (and b!741096 res!498445) b!741102))

(assert (= (and b!741102 res!498443) b!741095))

(assert (= (and b!741095 c!81706) b!741092))

(assert (= (and b!741095 (not c!81706)) b!741099))

(assert (= (and b!741095 res!498447) b!741098))

(assert (= (and b!741098 res!498442) b!741093))

(assert (= (and b!741093 res!498436) b!741086))

(assert (= (and b!741086 res!498441) b!741087))

(declare-fun m!692093 () Bool)

(assert (=> start!65286 m!692093))

(declare-fun m!692095 () Bool)

(assert (=> start!65286 m!692095))

(declare-fun m!692097 () Bool)

(assert (=> b!741094 m!692097))

(declare-fun m!692099 () Bool)

(assert (=> b!741102 m!692099))

(declare-fun m!692101 () Bool)

(assert (=> b!741100 m!692101))

(declare-fun m!692103 () Bool)

(assert (=> b!741093 m!692103))

(declare-fun m!692105 () Bool)

(assert (=> b!741093 m!692105))

(declare-fun m!692107 () Bool)

(assert (=> b!741096 m!692107))

(assert (=> b!741096 m!692107))

(declare-fun m!692109 () Bool)

(assert (=> b!741096 m!692109))

(assert (=> b!741096 m!692109))

(assert (=> b!741096 m!692107))

(declare-fun m!692111 () Bool)

(assert (=> b!741096 m!692111))

(assert (=> b!741087 m!692107))

(assert (=> b!741087 m!692107))

(declare-fun m!692113 () Bool)

(assert (=> b!741087 m!692113))

(assert (=> b!741092 m!692107))

(assert (=> b!741092 m!692107))

(declare-fun m!692115 () Bool)

(assert (=> b!741092 m!692115))

(assert (=> b!741086 m!692107))

(assert (=> b!741086 m!692107))

(declare-fun m!692117 () Bool)

(assert (=> b!741086 m!692117))

(assert (=> b!741099 m!692107))

(assert (=> b!741099 m!692107))

(declare-fun m!692119 () Bool)

(assert (=> b!741099 m!692119))

(declare-fun m!692121 () Bool)

(assert (=> b!741091 m!692121))

(declare-fun m!692123 () Bool)

(assert (=> b!741088 m!692123))

(declare-fun m!692125 () Bool)

(assert (=> b!741098 m!692125))

(declare-fun m!692127 () Bool)

(assert (=> b!741098 m!692127))

(assert (=> b!741098 m!692125))

(declare-fun m!692129 () Bool)

(assert (=> b!741098 m!692129))

(declare-fun m!692131 () Bool)

(assert (=> b!741098 m!692131))

(declare-fun m!692133 () Bool)

(assert (=> b!741098 m!692133))

(declare-fun m!692135 () Bool)

(assert (=> b!741101 m!692135))

(assert (=> b!741097 m!692107))

(assert (=> b!741097 m!692107))

(declare-fun m!692137 () Bool)

(assert (=> b!741097 m!692137))

(check-sat (not b!741094) (not b!741098) (not b!741101) (not b!741086) (not b!741087) (not b!741097) (not start!65286) (not b!741091) (not b!741100) (not b!741093) (not b!741088) (not b!741099) (not b!741096) (not b!741092))
(check-sat)
