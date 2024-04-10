; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64110 () Bool)

(assert start!64110)

(declare-fun b!720218 () Bool)

(declare-fun res!482586 () Bool)

(declare-fun e!403959 () Bool)

(assert (=> b!720218 (=> (not res!482586) (not e!403959))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40805 0))(
  ( (array!40806 (arr!19528 (Array (_ BitVec 32) (_ BitVec 64))) (size!19949 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40805)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720218 (= res!482586 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19528 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!482590 () Bool)

(declare-fun e!403960 () Bool)

(assert (=> start!64110 (=> (not res!482590) (not e!403960))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64110 (= res!482590 (validMask!0 mask!3328))))

(assert (=> start!64110 e!403960))

(assert (=> start!64110 true))

(declare-fun array_inv!15324 (array!40805) Bool)

(assert (=> start!64110 (array_inv!15324 a!3186)))

(declare-fun b!720219 () Bool)

(declare-fun res!482585 () Bool)

(declare-fun e!403957 () Bool)

(assert (=> b!720219 (=> (not res!482585) (not e!403957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40805 (_ BitVec 32)) Bool)

(assert (=> b!720219 (= res!482585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720220 () Bool)

(declare-fun res!482587 () Bool)

(assert (=> b!720220 (=> (not res!482587) (not e!403960))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720220 (= res!482587 (validKeyInArray!0 (select (arr!19528 a!3186) j!159)))))

(declare-fun b!720221 () Bool)

(assert (=> b!720221 (= e!403959 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsgt mask!3328 #b00111111111111111111111111111111)))))

(declare-fun b!720222 () Bool)

(declare-fun res!482594 () Bool)

(assert (=> b!720222 (=> (not res!482594) (not e!403959))))

(declare-fun e!403958 () Bool)

(assert (=> b!720222 (= res!482594 e!403958)))

(declare-fun c!79186 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720222 (= c!79186 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720223 () Bool)

(declare-fun res!482592 () Bool)

(assert (=> b!720223 (=> (not res!482592) (not e!403960))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!720223 (= res!482592 (validKeyInArray!0 k0!2102))))

(declare-fun b!720224 () Bool)

(declare-fun res!482588 () Bool)

(assert (=> b!720224 (=> (not res!482588) (not e!403960))))

(declare-fun arrayContainsKey!0 (array!40805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720224 (= res!482588 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720225 () Bool)

(assert (=> b!720225 (= e!403960 e!403957)))

(declare-fun res!482591 () Bool)

(assert (=> b!720225 (=> (not res!482591) (not e!403957))))

(declare-datatypes ((SeekEntryResult!7128 0))(
  ( (MissingZero!7128 (index!30880 (_ BitVec 32))) (Found!7128 (index!30881 (_ BitVec 32))) (Intermediate!7128 (undefined!7940 Bool) (index!30882 (_ BitVec 32)) (x!61879 (_ BitVec 32))) (Undefined!7128) (MissingVacant!7128 (index!30883 (_ BitVec 32))) )
))
(declare-fun lt!319727 () SeekEntryResult!7128)

(assert (=> b!720225 (= res!482591 (or (= lt!319727 (MissingZero!7128 i!1173)) (= lt!319727 (MissingVacant!7128 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40805 (_ BitVec 32)) SeekEntryResult!7128)

(assert (=> b!720225 (= lt!319727 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!720226 () Bool)

(declare-fun res!482593 () Bool)

(assert (=> b!720226 (=> (not res!482593) (not e!403957))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!720226 (= res!482593 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19949 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19949 a!3186))))))

(declare-fun b!720227 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40805 (_ BitVec 32)) SeekEntryResult!7128)

(assert (=> b!720227 (= e!403958 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19528 a!3186) j!159) a!3186 mask!3328) (Found!7128 j!159)))))

(declare-fun b!720228 () Bool)

(declare-fun res!482583 () Bool)

(assert (=> b!720228 (=> (not res!482583) (not e!403957))))

(declare-datatypes ((List!13530 0))(
  ( (Nil!13527) (Cons!13526 (h!14574 (_ BitVec 64)) (t!19845 List!13530)) )
))
(declare-fun arrayNoDuplicates!0 (array!40805 (_ BitVec 32) List!13530) Bool)

(assert (=> b!720228 (= res!482583 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13527))))

(declare-fun b!720229 () Bool)

(declare-fun res!482589 () Bool)

(assert (=> b!720229 (=> (not res!482589) (not e!403960))))

(assert (=> b!720229 (= res!482589 (and (= (size!19949 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19949 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19949 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720230 () Bool)

(assert (=> b!720230 (= e!403957 e!403959)))

(declare-fun res!482584 () Bool)

(assert (=> b!720230 (=> (not res!482584) (not e!403959))))

(declare-fun lt!319726 () SeekEntryResult!7128)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40805 (_ BitVec 32)) SeekEntryResult!7128)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720230 (= res!482584 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19528 a!3186) j!159) mask!3328) (select (arr!19528 a!3186) j!159) a!3186 mask!3328) lt!319726))))

(assert (=> b!720230 (= lt!319726 (Intermediate!7128 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720231 () Bool)

(assert (=> b!720231 (= e!403958 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19528 a!3186) j!159) a!3186 mask!3328) lt!319726))))

(assert (= (and start!64110 res!482590) b!720229))

(assert (= (and b!720229 res!482589) b!720220))

(assert (= (and b!720220 res!482587) b!720223))

(assert (= (and b!720223 res!482592) b!720224))

(assert (= (and b!720224 res!482588) b!720225))

(assert (= (and b!720225 res!482591) b!720219))

(assert (= (and b!720219 res!482585) b!720228))

(assert (= (and b!720228 res!482583) b!720226))

(assert (= (and b!720226 res!482593) b!720230))

(assert (= (and b!720230 res!482584) b!720218))

(assert (= (and b!720218 res!482586) b!720222))

(assert (= (and b!720222 c!79186) b!720231))

(assert (= (and b!720222 (not c!79186)) b!720227))

(assert (= (and b!720222 res!482594) b!720221))

(declare-fun m!675443 () Bool)

(assert (=> b!720231 m!675443))

(assert (=> b!720231 m!675443))

(declare-fun m!675445 () Bool)

(assert (=> b!720231 m!675445))

(assert (=> b!720220 m!675443))

(assert (=> b!720220 m!675443))

(declare-fun m!675447 () Bool)

(assert (=> b!720220 m!675447))

(declare-fun m!675449 () Bool)

(assert (=> b!720228 m!675449))

(assert (=> b!720227 m!675443))

(assert (=> b!720227 m!675443))

(declare-fun m!675451 () Bool)

(assert (=> b!720227 m!675451))

(declare-fun m!675453 () Bool)

(assert (=> b!720225 m!675453))

(declare-fun m!675455 () Bool)

(assert (=> start!64110 m!675455))

(declare-fun m!675457 () Bool)

(assert (=> start!64110 m!675457))

(declare-fun m!675459 () Bool)

(assert (=> b!720218 m!675459))

(declare-fun m!675461 () Bool)

(assert (=> b!720219 m!675461))

(assert (=> b!720230 m!675443))

(assert (=> b!720230 m!675443))

(declare-fun m!675463 () Bool)

(assert (=> b!720230 m!675463))

(assert (=> b!720230 m!675463))

(assert (=> b!720230 m!675443))

(declare-fun m!675465 () Bool)

(assert (=> b!720230 m!675465))

(declare-fun m!675467 () Bool)

(assert (=> b!720224 m!675467))

(declare-fun m!675469 () Bool)

(assert (=> b!720223 m!675469))

(check-sat (not start!64110) (not b!720227) (not b!720219) (not b!720223) (not b!720224) (not b!720228) (not b!720220) (not b!720230) (not b!720231) (not b!720225))
(check-sat)
(get-model)

(declare-fun b!720282 () Bool)

(declare-fun e!403984 () Bool)

(declare-fun e!403983 () Bool)

(assert (=> b!720282 (= e!403984 e!403983)))

(declare-fun c!79192 () Bool)

(assert (=> b!720282 (= c!79192 (validKeyInArray!0 (select (arr!19528 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34749 () Bool)

(declare-fun call!34752 () Bool)

(assert (=> bm!34749 (= call!34752 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!720283 () Bool)

(assert (=> b!720283 (= e!403983 call!34752)))

(declare-fun b!720284 () Bool)

(declare-fun e!403985 () Bool)

(assert (=> b!720284 (= e!403985 call!34752)))

(declare-fun d!99103 () Bool)

(declare-fun res!482636 () Bool)

(assert (=> d!99103 (=> res!482636 e!403984)))

(assert (=> d!99103 (= res!482636 (bvsge #b00000000000000000000000000000000 (size!19949 a!3186)))))

(assert (=> d!99103 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403984)))

(declare-fun b!720285 () Bool)

(assert (=> b!720285 (= e!403983 e!403985)))

(declare-fun lt!319742 () (_ BitVec 64))

(assert (=> b!720285 (= lt!319742 (select (arr!19528 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24672 0))(
  ( (Unit!24673) )
))
(declare-fun lt!319741 () Unit!24672)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40805 (_ BitVec 64) (_ BitVec 32)) Unit!24672)

(assert (=> b!720285 (= lt!319741 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319742 #b00000000000000000000000000000000))))

(assert (=> b!720285 (arrayContainsKey!0 a!3186 lt!319742 #b00000000000000000000000000000000)))

(declare-fun lt!319740 () Unit!24672)

(assert (=> b!720285 (= lt!319740 lt!319741)))

(declare-fun res!482635 () Bool)

(assert (=> b!720285 (= res!482635 (= (seekEntryOrOpen!0 (select (arr!19528 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7128 #b00000000000000000000000000000000)))))

(assert (=> b!720285 (=> (not res!482635) (not e!403985))))

(assert (= (and d!99103 (not res!482636)) b!720282))

(assert (= (and b!720282 c!79192) b!720285))

(assert (= (and b!720282 (not c!79192)) b!720283))

(assert (= (and b!720285 res!482635) b!720284))

(assert (= (or b!720284 b!720283) bm!34749))

(declare-fun m!675499 () Bool)

(assert (=> b!720282 m!675499))

(assert (=> b!720282 m!675499))

(declare-fun m!675501 () Bool)

(assert (=> b!720282 m!675501))

(declare-fun m!675503 () Bool)

(assert (=> bm!34749 m!675503))

(assert (=> b!720285 m!675499))

(declare-fun m!675505 () Bool)

(assert (=> b!720285 m!675505))

(declare-fun m!675507 () Bool)

(assert (=> b!720285 m!675507))

(assert (=> b!720285 m!675499))

(declare-fun m!675509 () Bool)

(assert (=> b!720285 m!675509))

(assert (=> b!720219 d!99103))

(declare-fun d!99105 () Bool)

(declare-fun res!482641 () Bool)

(declare-fun e!403990 () Bool)

(assert (=> d!99105 (=> res!482641 e!403990)))

(assert (=> d!99105 (= res!482641 (= (select (arr!19528 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99105 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!403990)))

(declare-fun b!720290 () Bool)

(declare-fun e!403991 () Bool)

(assert (=> b!720290 (= e!403990 e!403991)))

(declare-fun res!482642 () Bool)

(assert (=> b!720290 (=> (not res!482642) (not e!403991))))

(assert (=> b!720290 (= res!482642 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19949 a!3186)))))

(declare-fun b!720291 () Bool)

(assert (=> b!720291 (= e!403991 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99105 (not res!482641)) b!720290))

(assert (= (and b!720290 res!482642) b!720291))

(assert (=> d!99105 m!675499))

(declare-fun m!675511 () Bool)

(assert (=> b!720291 m!675511))

(assert (=> b!720224 d!99105))

(declare-fun d!99107 () Bool)

(declare-fun lt!319750 () SeekEntryResult!7128)

(get-info :version)

(assert (=> d!99107 (and (or ((_ is Undefined!7128) lt!319750) (not ((_ is Found!7128) lt!319750)) (and (bvsge (index!30881 lt!319750) #b00000000000000000000000000000000) (bvslt (index!30881 lt!319750) (size!19949 a!3186)))) (or ((_ is Undefined!7128) lt!319750) ((_ is Found!7128) lt!319750) (not ((_ is MissingZero!7128) lt!319750)) (and (bvsge (index!30880 lt!319750) #b00000000000000000000000000000000) (bvslt (index!30880 lt!319750) (size!19949 a!3186)))) (or ((_ is Undefined!7128) lt!319750) ((_ is Found!7128) lt!319750) ((_ is MissingZero!7128) lt!319750) (not ((_ is MissingVacant!7128) lt!319750)) (and (bvsge (index!30883 lt!319750) #b00000000000000000000000000000000) (bvslt (index!30883 lt!319750) (size!19949 a!3186)))) (or ((_ is Undefined!7128) lt!319750) (ite ((_ is Found!7128) lt!319750) (= (select (arr!19528 a!3186) (index!30881 lt!319750)) k0!2102) (ite ((_ is MissingZero!7128) lt!319750) (= (select (arr!19528 a!3186) (index!30880 lt!319750)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7128) lt!319750) (= (select (arr!19528 a!3186) (index!30883 lt!319750)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!404011 () SeekEntryResult!7128)

(assert (=> d!99107 (= lt!319750 e!404011)))

(declare-fun c!79202 () Bool)

(declare-fun lt!319749 () SeekEntryResult!7128)

(assert (=> d!99107 (= c!79202 (and ((_ is Intermediate!7128) lt!319749) (undefined!7940 lt!319749)))))

(assert (=> d!99107 (= lt!319749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99107 (validMask!0 mask!3328)))

(assert (=> d!99107 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!319750)))

(declare-fun b!720319 () Bool)

(declare-fun c!79203 () Bool)

(declare-fun lt!319751 () (_ BitVec 64))

(assert (=> b!720319 (= c!79203 (= lt!319751 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404012 () SeekEntryResult!7128)

(declare-fun e!404010 () SeekEntryResult!7128)

(assert (=> b!720319 (= e!404012 e!404010)))

(declare-fun b!720320 () Bool)

(assert (=> b!720320 (= e!404011 e!404012)))

(assert (=> b!720320 (= lt!319751 (select (arr!19528 a!3186) (index!30882 lt!319749)))))

(declare-fun c!79204 () Bool)

(assert (=> b!720320 (= c!79204 (= lt!319751 k0!2102))))

(declare-fun b!720321 () Bool)

(assert (=> b!720321 (= e!404010 (MissingZero!7128 (index!30882 lt!319749)))))

(declare-fun b!720322 () Bool)

(assert (=> b!720322 (= e!404012 (Found!7128 (index!30882 lt!319749)))))

(declare-fun b!720323 () Bool)

(assert (=> b!720323 (= e!404011 Undefined!7128)))

(declare-fun b!720324 () Bool)

(assert (=> b!720324 (= e!404010 (seekKeyOrZeroReturnVacant!0 (x!61879 lt!319749) (index!30882 lt!319749) (index!30882 lt!319749) k0!2102 a!3186 mask!3328))))

(assert (= (and d!99107 c!79202) b!720323))

(assert (= (and d!99107 (not c!79202)) b!720320))

(assert (= (and b!720320 c!79204) b!720322))

(assert (= (and b!720320 (not c!79204)) b!720319))

(assert (= (and b!720319 c!79203) b!720321))

(assert (= (and b!720319 (not c!79203)) b!720324))

(declare-fun m!675521 () Bool)

(assert (=> d!99107 m!675521))

(declare-fun m!675523 () Bool)

(assert (=> d!99107 m!675523))

(assert (=> d!99107 m!675521))

(declare-fun m!675525 () Bool)

(assert (=> d!99107 m!675525))

(declare-fun m!675527 () Bool)

(assert (=> d!99107 m!675527))

(declare-fun m!675529 () Bool)

(assert (=> d!99107 m!675529))

(assert (=> d!99107 m!675455))

(declare-fun m!675531 () Bool)

(assert (=> b!720320 m!675531))

(declare-fun m!675533 () Bool)

(assert (=> b!720324 m!675533))

(assert (=> b!720225 d!99107))

(declare-fun d!99115 () Bool)

(assert (=> d!99115 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64110 d!99115))

(declare-fun d!99117 () Bool)

(assert (=> d!99117 (= (array_inv!15324 a!3186) (bvsge (size!19949 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64110 d!99117))

(declare-fun e!404032 () SeekEntryResult!7128)

(declare-fun b!720361 () Bool)

(assert (=> b!720361 (= e!404032 (Intermediate!7128 true (toIndex!0 (select (arr!19528 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!720362 () Bool)

(declare-fun e!404036 () Bool)

(declare-fun e!404034 () Bool)

(assert (=> b!720362 (= e!404036 e!404034)))

(declare-fun res!482658 () Bool)

(declare-fun lt!319762 () SeekEntryResult!7128)

(assert (=> b!720362 (= res!482658 (and ((_ is Intermediate!7128) lt!319762) (not (undefined!7940 lt!319762)) (bvslt (x!61879 lt!319762) #b01111111111111111111111111111110) (bvsge (x!61879 lt!319762) #b00000000000000000000000000000000) (bvsge (x!61879 lt!319762) #b00000000000000000000000000000000)))))

(assert (=> b!720362 (=> (not res!482658) (not e!404034))))

(declare-fun b!720363 () Bool)

(assert (=> b!720363 (and (bvsge (index!30882 lt!319762) #b00000000000000000000000000000000) (bvslt (index!30882 lt!319762) (size!19949 a!3186)))))

(declare-fun res!482659 () Bool)

(assert (=> b!720363 (= res!482659 (= (select (arr!19528 a!3186) (index!30882 lt!319762)) (select (arr!19528 a!3186) j!159)))))

(declare-fun e!404033 () Bool)

(assert (=> b!720363 (=> res!482659 e!404033)))

(assert (=> b!720363 (= e!404034 e!404033)))

(declare-fun d!99119 () Bool)

(assert (=> d!99119 e!404036))

(declare-fun c!79222 () Bool)

(assert (=> d!99119 (= c!79222 (and ((_ is Intermediate!7128) lt!319762) (undefined!7940 lt!319762)))))

(assert (=> d!99119 (= lt!319762 e!404032)))

(declare-fun c!79220 () Bool)

(assert (=> d!99119 (= c!79220 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!319763 () (_ BitVec 64))

(assert (=> d!99119 (= lt!319763 (select (arr!19528 a!3186) (toIndex!0 (select (arr!19528 a!3186) j!159) mask!3328)))))

(assert (=> d!99119 (validMask!0 mask!3328)))

(assert (=> d!99119 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19528 a!3186) j!159) mask!3328) (select (arr!19528 a!3186) j!159) a!3186 mask!3328) lt!319762)))

(declare-fun b!720364 () Bool)

(declare-fun e!404035 () SeekEntryResult!7128)

(assert (=> b!720364 (= e!404035 (Intermediate!7128 false (toIndex!0 (select (arr!19528 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!720365 () Bool)

(assert (=> b!720365 (and (bvsge (index!30882 lt!319762) #b00000000000000000000000000000000) (bvslt (index!30882 lt!319762) (size!19949 a!3186)))))

(declare-fun res!482660 () Bool)

(assert (=> b!720365 (= res!482660 (= (select (arr!19528 a!3186) (index!30882 lt!319762)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!720365 (=> res!482660 e!404033)))

(declare-fun b!720366 () Bool)

(assert (=> b!720366 (= e!404032 e!404035)))

(declare-fun c!79221 () Bool)

(assert (=> b!720366 (= c!79221 (or (= lt!319763 (select (arr!19528 a!3186) j!159)) (= (bvadd lt!319763 lt!319763) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720367 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720367 (= e!404035 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19528 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19528 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!720368 () Bool)

(assert (=> b!720368 (and (bvsge (index!30882 lt!319762) #b00000000000000000000000000000000) (bvslt (index!30882 lt!319762) (size!19949 a!3186)))))

(assert (=> b!720368 (= e!404033 (= (select (arr!19528 a!3186) (index!30882 lt!319762)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!720369 () Bool)

(assert (=> b!720369 (= e!404036 (bvsge (x!61879 lt!319762) #b01111111111111111111111111111110))))

(assert (= (and d!99119 c!79220) b!720361))

(assert (= (and d!99119 (not c!79220)) b!720366))

(assert (= (and b!720366 c!79221) b!720364))

(assert (= (and b!720366 (not c!79221)) b!720367))

(assert (= (and d!99119 c!79222) b!720369))

(assert (= (and d!99119 (not c!79222)) b!720362))

(assert (= (and b!720362 res!482658) b!720363))

(assert (= (and b!720363 (not res!482659)) b!720365))

(assert (= (and b!720365 (not res!482660)) b!720368))

(declare-fun m!675545 () Bool)

(assert (=> b!720363 m!675545))

(assert (=> b!720365 m!675545))

(assert (=> b!720368 m!675545))

(assert (=> b!720367 m!675463))

(declare-fun m!675547 () Bool)

(assert (=> b!720367 m!675547))

(assert (=> b!720367 m!675547))

(assert (=> b!720367 m!675443))

(declare-fun m!675549 () Bool)

(assert (=> b!720367 m!675549))

(assert (=> d!99119 m!675463))

(declare-fun m!675551 () Bool)

(assert (=> d!99119 m!675551))

(assert (=> d!99119 m!675455))

(assert (=> b!720230 d!99119))

(declare-fun d!99127 () Bool)

(declare-fun lt!319773 () (_ BitVec 32))

(declare-fun lt!319772 () (_ BitVec 32))

(assert (=> d!99127 (= lt!319773 (bvmul (bvxor lt!319772 (bvlshr lt!319772 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99127 (= lt!319772 ((_ extract 31 0) (bvand (bvxor (select (arr!19528 a!3186) j!159) (bvlshr (select (arr!19528 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99127 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!482661 (let ((h!14576 ((_ extract 31 0) (bvand (bvxor (select (arr!19528 a!3186) j!159) (bvlshr (select (arr!19528 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61884 (bvmul (bvxor h!14576 (bvlshr h!14576 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61884 (bvlshr x!61884 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!482661 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!482661 #b00000000000000000000000000000000))))))

(assert (=> d!99127 (= (toIndex!0 (select (arr!19528 a!3186) j!159) mask!3328) (bvand (bvxor lt!319773 (bvlshr lt!319773 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!720230 d!99127))

(declare-fun d!99129 () Bool)

(assert (=> d!99129 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!720223 d!99129))

(declare-fun b!720402 () Bool)

(declare-fun e!404058 () Bool)

(declare-fun call!34758 () Bool)

(assert (=> b!720402 (= e!404058 call!34758)))

(declare-fun bm!34755 () Bool)

(declare-fun c!79234 () Bool)

(assert (=> bm!34755 (= call!34758 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79234 (Cons!13526 (select (arr!19528 a!3186) #b00000000000000000000000000000000) Nil!13527) Nil!13527)))))

(declare-fun b!720403 () Bool)

(declare-fun e!404059 () Bool)

(declare-fun contains!4040 (List!13530 (_ BitVec 64)) Bool)

(assert (=> b!720403 (= e!404059 (contains!4040 Nil!13527 (select (arr!19528 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99131 () Bool)

(declare-fun res!482674 () Bool)

(declare-fun e!404061 () Bool)

(assert (=> d!99131 (=> res!482674 e!404061)))

(assert (=> d!99131 (= res!482674 (bvsge #b00000000000000000000000000000000 (size!19949 a!3186)))))

(assert (=> d!99131 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13527) e!404061)))

(declare-fun b!720404 () Bool)

(declare-fun e!404060 () Bool)

(assert (=> b!720404 (= e!404060 e!404058)))

(assert (=> b!720404 (= c!79234 (validKeyInArray!0 (select (arr!19528 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!720405 () Bool)

(assert (=> b!720405 (= e!404061 e!404060)))

(declare-fun res!482673 () Bool)

(assert (=> b!720405 (=> (not res!482673) (not e!404060))))

(assert (=> b!720405 (= res!482673 (not e!404059))))

(declare-fun res!482672 () Bool)

(assert (=> b!720405 (=> (not res!482672) (not e!404059))))

(assert (=> b!720405 (= res!482672 (validKeyInArray!0 (select (arr!19528 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!720406 () Bool)

(assert (=> b!720406 (= e!404058 call!34758)))

(assert (= (and d!99131 (not res!482674)) b!720405))

(assert (= (and b!720405 res!482672) b!720403))

(assert (= (and b!720405 res!482673) b!720404))

(assert (= (and b!720404 c!79234) b!720406))

(assert (= (and b!720404 (not c!79234)) b!720402))

(assert (= (or b!720406 b!720402) bm!34755))

(assert (=> bm!34755 m!675499))

(declare-fun m!675563 () Bool)

(assert (=> bm!34755 m!675563))

(assert (=> b!720403 m!675499))

(assert (=> b!720403 m!675499))

(declare-fun m!675565 () Bool)

(assert (=> b!720403 m!675565))

(assert (=> b!720404 m!675499))

(assert (=> b!720404 m!675499))

(assert (=> b!720404 m!675501))

(assert (=> b!720405 m!675499))

(assert (=> b!720405 m!675499))

(assert (=> b!720405 m!675501))

(assert (=> b!720228 d!99131))

(declare-fun b!720451 () Bool)

(declare-fun e!404088 () SeekEntryResult!7128)

(assert (=> b!720451 (= e!404088 Undefined!7128)))

(declare-fun b!720452 () Bool)

(declare-fun c!79255 () Bool)

(declare-fun lt!319798 () (_ BitVec 64))

(assert (=> b!720452 (= c!79255 (= lt!319798 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404090 () SeekEntryResult!7128)

(declare-fun e!404089 () SeekEntryResult!7128)

(assert (=> b!720452 (= e!404090 e!404089)))

(declare-fun lt!319799 () SeekEntryResult!7128)

(declare-fun d!99139 () Bool)

(assert (=> d!99139 (and (or ((_ is Undefined!7128) lt!319799) (not ((_ is Found!7128) lt!319799)) (and (bvsge (index!30881 lt!319799) #b00000000000000000000000000000000) (bvslt (index!30881 lt!319799) (size!19949 a!3186)))) (or ((_ is Undefined!7128) lt!319799) ((_ is Found!7128) lt!319799) (not ((_ is MissingVacant!7128) lt!319799)) (not (= (index!30883 lt!319799) resIntermediateIndex!5)) (and (bvsge (index!30883 lt!319799) #b00000000000000000000000000000000) (bvslt (index!30883 lt!319799) (size!19949 a!3186)))) (or ((_ is Undefined!7128) lt!319799) (ite ((_ is Found!7128) lt!319799) (= (select (arr!19528 a!3186) (index!30881 lt!319799)) (select (arr!19528 a!3186) j!159)) (and ((_ is MissingVacant!7128) lt!319799) (= (index!30883 lt!319799) resIntermediateIndex!5) (= (select (arr!19528 a!3186) (index!30883 lt!319799)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99139 (= lt!319799 e!404088)))

(declare-fun c!79254 () Bool)

(assert (=> d!99139 (= c!79254 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99139 (= lt!319798 (select (arr!19528 a!3186) index!1321))))

(assert (=> d!99139 (validMask!0 mask!3328)))

(assert (=> d!99139 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19528 a!3186) j!159) a!3186 mask!3328) lt!319799)))

(declare-fun b!720453 () Bool)

(assert (=> b!720453 (= e!404089 (MissingVacant!7128 resIntermediateIndex!5))))

(declare-fun b!720454 () Bool)

(assert (=> b!720454 (= e!404088 e!404090)))

(declare-fun c!79253 () Bool)

(assert (=> b!720454 (= c!79253 (= lt!319798 (select (arr!19528 a!3186) j!159)))))

(declare-fun b!720455 () Bool)

(assert (=> b!720455 (= e!404090 (Found!7128 index!1321))))

(declare-fun b!720456 () Bool)

(assert (=> b!720456 (= e!404089 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19528 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!99139 c!79254) b!720451))

(assert (= (and d!99139 (not c!79254)) b!720454))

(assert (= (and b!720454 c!79253) b!720455))

(assert (= (and b!720454 (not c!79253)) b!720452))

(assert (= (and b!720452 c!79255) b!720453))

(assert (= (and b!720452 (not c!79255)) b!720456))

(declare-fun m!675591 () Bool)

(assert (=> d!99139 m!675591))

(declare-fun m!675593 () Bool)

(assert (=> d!99139 m!675593))

(declare-fun m!675595 () Bool)

(assert (=> d!99139 m!675595))

(assert (=> d!99139 m!675455))

(declare-fun m!675597 () Bool)

(assert (=> b!720456 m!675597))

(assert (=> b!720456 m!675597))

(assert (=> b!720456 m!675443))

(declare-fun m!675599 () Bool)

(assert (=> b!720456 m!675599))

(assert (=> b!720227 d!99139))

(declare-fun b!720457 () Bool)

(declare-fun e!404091 () SeekEntryResult!7128)

(assert (=> b!720457 (= e!404091 (Intermediate!7128 true index!1321 x!1131))))

(declare-fun b!720458 () Bool)

(declare-fun e!404095 () Bool)

(declare-fun e!404093 () Bool)

(assert (=> b!720458 (= e!404095 e!404093)))

(declare-fun res!482683 () Bool)

(declare-fun lt!319800 () SeekEntryResult!7128)

(assert (=> b!720458 (= res!482683 (and ((_ is Intermediate!7128) lt!319800) (not (undefined!7940 lt!319800)) (bvslt (x!61879 lt!319800) #b01111111111111111111111111111110) (bvsge (x!61879 lt!319800) #b00000000000000000000000000000000) (bvsge (x!61879 lt!319800) x!1131)))))

(assert (=> b!720458 (=> (not res!482683) (not e!404093))))

(declare-fun b!720459 () Bool)

(assert (=> b!720459 (and (bvsge (index!30882 lt!319800) #b00000000000000000000000000000000) (bvslt (index!30882 lt!319800) (size!19949 a!3186)))))

(declare-fun res!482684 () Bool)

(assert (=> b!720459 (= res!482684 (= (select (arr!19528 a!3186) (index!30882 lt!319800)) (select (arr!19528 a!3186) j!159)))))

(declare-fun e!404092 () Bool)

(assert (=> b!720459 (=> res!482684 e!404092)))

(assert (=> b!720459 (= e!404093 e!404092)))

(declare-fun d!99149 () Bool)

(assert (=> d!99149 e!404095))

(declare-fun c!79258 () Bool)

(assert (=> d!99149 (= c!79258 (and ((_ is Intermediate!7128) lt!319800) (undefined!7940 lt!319800)))))

(assert (=> d!99149 (= lt!319800 e!404091)))

(declare-fun c!79256 () Bool)

(assert (=> d!99149 (= c!79256 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!319801 () (_ BitVec 64))

(assert (=> d!99149 (= lt!319801 (select (arr!19528 a!3186) index!1321))))

(assert (=> d!99149 (validMask!0 mask!3328)))

(assert (=> d!99149 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19528 a!3186) j!159) a!3186 mask!3328) lt!319800)))

(declare-fun b!720460 () Bool)

(declare-fun e!404094 () SeekEntryResult!7128)

(assert (=> b!720460 (= e!404094 (Intermediate!7128 false index!1321 x!1131))))

(declare-fun b!720461 () Bool)

(assert (=> b!720461 (and (bvsge (index!30882 lt!319800) #b00000000000000000000000000000000) (bvslt (index!30882 lt!319800) (size!19949 a!3186)))))

(declare-fun res!482685 () Bool)

(assert (=> b!720461 (= res!482685 (= (select (arr!19528 a!3186) (index!30882 lt!319800)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!720461 (=> res!482685 e!404092)))

(declare-fun b!720462 () Bool)

(assert (=> b!720462 (= e!404091 e!404094)))

(declare-fun c!79257 () Bool)

(assert (=> b!720462 (= c!79257 (or (= lt!319801 (select (arr!19528 a!3186) j!159)) (= (bvadd lt!319801 lt!319801) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720463 () Bool)

(assert (=> b!720463 (= e!404094 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19528 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!720464 () Bool)

(assert (=> b!720464 (and (bvsge (index!30882 lt!319800) #b00000000000000000000000000000000) (bvslt (index!30882 lt!319800) (size!19949 a!3186)))))

(assert (=> b!720464 (= e!404092 (= (select (arr!19528 a!3186) (index!30882 lt!319800)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!720465 () Bool)

(assert (=> b!720465 (= e!404095 (bvsge (x!61879 lt!319800) #b01111111111111111111111111111110))))

(assert (= (and d!99149 c!79256) b!720457))

(assert (= (and d!99149 (not c!79256)) b!720462))

(assert (= (and b!720462 c!79257) b!720460))

(assert (= (and b!720462 (not c!79257)) b!720463))

(assert (= (and d!99149 c!79258) b!720465))

(assert (= (and d!99149 (not c!79258)) b!720458))

(assert (= (and b!720458 res!482683) b!720459))

(assert (= (and b!720459 (not res!482684)) b!720461))

(assert (= (and b!720461 (not res!482685)) b!720464))

(declare-fun m!675601 () Bool)

(assert (=> b!720459 m!675601))

(assert (=> b!720461 m!675601))

(assert (=> b!720464 m!675601))

(assert (=> b!720463 m!675597))

(assert (=> b!720463 m!675597))

(assert (=> b!720463 m!675443))

(declare-fun m!675603 () Bool)

(assert (=> b!720463 m!675603))

(assert (=> d!99149 m!675595))

(assert (=> d!99149 m!675455))

(assert (=> b!720231 d!99149))

(declare-fun d!99151 () Bool)

(assert (=> d!99151 (= (validKeyInArray!0 (select (arr!19528 a!3186) j!159)) (and (not (= (select (arr!19528 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19528 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!720220 d!99151))

(check-sat (not b!720291) (not b!720324) (not b!720285) (not bm!34755) (not d!99149) (not d!99107) (not b!720463) (not b!720456) (not b!720367) (not d!99119) (not b!720404) (not d!99139) (not bm!34749) (not b!720282) (not b!720403) (not b!720405))
(check-sat)
