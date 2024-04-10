; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44206 () Bool)

(assert start!44206)

(declare-fun b!486509 () Bool)

(declare-fun res!289971 () Bool)

(declare-fun e!286355 () Bool)

(assert (=> b!486509 (=> (not res!289971) (not e!286355))))

(declare-datatypes ((array!31502 0))(
  ( (array!31503 (arr!15146 (Array (_ BitVec 32) (_ BitVec 64))) (size!15510 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31502)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31502 (_ BitVec 32)) Bool)

(assert (=> b!486509 (= res!289971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486510 () Bool)

(declare-fun res!289970 () Bool)

(declare-fun e!286353 () Bool)

(assert (=> b!486510 (=> (not res!289970) (not e!286353))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486510 (= res!289970 (and (= (size!15510 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15510 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15510 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486511 () Bool)

(declare-fun res!289969 () Bool)

(assert (=> b!486511 (=> (not res!289969) (not e!286355))))

(declare-datatypes ((List!9304 0))(
  ( (Nil!9301) (Cons!9300 (h!10156 (_ BitVec 64)) (t!15532 List!9304)) )
))
(declare-fun noDuplicate!212 (List!9304) Bool)

(assert (=> b!486511 (= res!289969 (noDuplicate!212 Nil!9301))))

(declare-fun b!486512 () Bool)

(declare-fun res!289972 () Bool)

(assert (=> b!486512 (=> (not res!289972) (not e!286353))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486512 (= res!289972 (validKeyInArray!0 k!2280))))

(declare-fun res!289974 () Bool)

(assert (=> start!44206 (=> (not res!289974) (not e!286353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44206 (= res!289974 (validMask!0 mask!3524))))

(assert (=> start!44206 e!286353))

(assert (=> start!44206 true))

(declare-fun array_inv!10942 (array!31502) Bool)

(assert (=> start!44206 (array_inv!10942 a!3235)))

(declare-fun b!486513 () Bool)

(declare-fun e!286354 () Bool)

(assert (=> b!486513 (= e!286355 e!286354)))

(declare-fun res!289973 () Bool)

(assert (=> b!486513 (=> res!289973 e!286354)))

(declare-fun contains!2698 (List!9304 (_ BitVec 64)) Bool)

(assert (=> b!486513 (= res!289973 (contains!2698 Nil!9301 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!486514 () Bool)

(declare-fun res!289975 () Bool)

(assert (=> b!486514 (=> (not res!289975) (not e!286355))))

(assert (=> b!486514 (= res!289975 (and (bvsle #b00000000000000000000000000000000 (size!15510 a!3235)) (bvslt (size!15510 a!3235) #b01111111111111111111111111111111)))))

(declare-fun b!486515 () Bool)

(assert (=> b!486515 (= e!286354 (contains!2698 Nil!9301 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!486516 () Bool)

(declare-fun res!289967 () Bool)

(assert (=> b!486516 (=> (not res!289967) (not e!286353))))

(declare-fun arrayContainsKey!0 (array!31502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486516 (= res!289967 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486517 () Bool)

(assert (=> b!486517 (= e!286353 e!286355)))

(declare-fun res!289968 () Bool)

(assert (=> b!486517 (=> (not res!289968) (not e!286355))))

(declare-datatypes ((SeekEntryResult!3613 0))(
  ( (MissingZero!3613 (index!16631 (_ BitVec 32))) (Found!3613 (index!16632 (_ BitVec 32))) (Intermediate!3613 (undefined!4425 Bool) (index!16633 (_ BitVec 32)) (x!45761 (_ BitVec 32))) (Undefined!3613) (MissingVacant!3613 (index!16634 (_ BitVec 32))) )
))
(declare-fun lt!219754 () SeekEntryResult!3613)

(assert (=> b!486517 (= res!289968 (or (= lt!219754 (MissingZero!3613 i!1204)) (= lt!219754 (MissingVacant!3613 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31502 (_ BitVec 32)) SeekEntryResult!3613)

(assert (=> b!486517 (= lt!219754 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!486518 () Bool)

(declare-fun res!289976 () Bool)

(assert (=> b!486518 (=> (not res!289976) (not e!286353))))

(assert (=> b!486518 (= res!289976 (validKeyInArray!0 (select (arr!15146 a!3235) j!176)))))

(assert (= (and start!44206 res!289974) b!486510))

(assert (= (and b!486510 res!289970) b!486518))

(assert (= (and b!486518 res!289976) b!486512))

(assert (= (and b!486512 res!289972) b!486516))

(assert (= (and b!486516 res!289967) b!486517))

(assert (= (and b!486517 res!289968) b!486509))

(assert (= (and b!486509 res!289971) b!486514))

(assert (= (and b!486514 res!289975) b!486511))

(assert (= (and b!486511 res!289969) b!486513))

(assert (= (and b!486513 (not res!289973)) b!486515))

(declare-fun m!466439 () Bool)

(assert (=> b!486509 m!466439))

(declare-fun m!466441 () Bool)

(assert (=> b!486516 m!466441))

(declare-fun m!466443 () Bool)

(assert (=> b!486512 m!466443))

(declare-fun m!466445 () Bool)

(assert (=> b!486518 m!466445))

(assert (=> b!486518 m!466445))

(declare-fun m!466447 () Bool)

(assert (=> b!486518 m!466447))

(declare-fun m!466449 () Bool)

(assert (=> b!486515 m!466449))

(declare-fun m!466451 () Bool)

(assert (=> start!44206 m!466451))

(declare-fun m!466453 () Bool)

(assert (=> start!44206 m!466453))

(declare-fun m!466455 () Bool)

(assert (=> b!486513 m!466455))

(declare-fun m!466457 () Bool)

(assert (=> b!486511 m!466457))

(declare-fun m!466459 () Bool)

(assert (=> b!486517 m!466459))

(push 1)

(assert (not start!44206))

(assert (not b!486515))

(assert (not b!486509))

(assert (not b!486518))

(assert (not b!486512))

(assert (not b!486513))

(assert (not b!486517))

(assert (not b!486511))

(assert (not b!486516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77557 () Bool)

(declare-fun lt!219760 () Bool)

(declare-fun content!220 (List!9304) (Set (_ BitVec 64)))

(assert (=> d!77557 (= lt!219760 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!220 Nil!9301)))))

(declare-fun e!286368 () Bool)

(assert (=> d!77557 (= lt!219760 e!286368)))

(declare-fun res!289988 () Bool)

(assert (=> d!77557 (=> (not res!289988) (not e!286368))))

(assert (=> d!77557 (= res!289988 (is-Cons!9300 Nil!9301))))

(assert (=> d!77557 (= (contains!2698 Nil!9301 #b0000000000000000000000000000000000000000000000000000000000000000) lt!219760)))

(declare-fun b!486529 () Bool)

(declare-fun e!286367 () Bool)

(assert (=> b!486529 (= e!286368 e!286367)))

(declare-fun res!289987 () Bool)

(assert (=> b!486529 (=> res!289987 e!286367)))

(assert (=> b!486529 (= res!289987 (= (h!10156 Nil!9301) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!486530 () Bool)

(assert (=> b!486530 (= e!286367 (contains!2698 (t!15532 Nil!9301) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!77557 res!289988) b!486529))

(assert (= (and b!486529 (not res!289987)) b!486530))

(declare-fun m!466467 () Bool)

(assert (=> d!77557 m!466467))

(declare-fun m!466469 () Bool)

(assert (=> d!77557 m!466469))

(declare-fun m!466471 () Bool)

(assert (=> b!486530 m!466471))

(assert (=> b!486513 d!77557))

(declare-fun b!486553 () Bool)

(declare-fun e!286389 () Bool)

(declare-fun e!286388 () Bool)

(assert (=> b!486553 (= e!286389 e!286388)))

(declare-fun c!58543 () Bool)

(assert (=> b!486553 (= c!58543 (validKeyInArray!0 (select (arr!15146 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!486554 () Bool)

(declare-fun e!286387 () Bool)

(declare-fun call!31279 () Bool)

(assert (=> b!486554 (= e!286387 call!31279)))

(declare-fun b!486555 () Bool)

(assert (=> b!486555 (= e!286388 e!286387)))

(declare-fun lt!219775 () (_ BitVec 64))

(assert (=> b!486555 (= lt!219775 (select (arr!15146 a!3235) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14198 0))(
  ( (Unit!14199) )
))
(declare-fun lt!219773 () Unit!14198)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31502 (_ BitVec 64) (_ BitVec 32)) Unit!14198)

(assert (=> b!486555 (= lt!219773 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219775 #b00000000000000000000000000000000))))

(assert (=> b!486555 (arrayContainsKey!0 a!3235 lt!219775 #b00000000000000000000000000000000)))

(declare-fun lt!219774 () Unit!14198)

(assert (=> b!486555 (= lt!219774 lt!219773)))

(declare-fun res!290004 () Bool)

(assert (=> b!486555 (= res!290004 (= (seekEntryOrOpen!0 (select (arr!15146 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3613 #b00000000000000000000000000000000)))))

(assert (=> b!486555 (=> (not res!290004) (not e!286387))))

(declare-fun b!486556 () Bool)

(assert (=> b!486556 (= e!286388 call!31279)))

(declare-fun d!77563 () Bool)

(declare-fun res!290003 () Bool)

(assert (=> d!77563 (=> res!290003 e!286389)))

(assert (=> d!77563 (= res!290003 (bvsge #b00000000000000000000000000000000 (size!15510 a!3235)))))

(assert (=> d!77563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286389)))

(declare-fun bm!31276 () Bool)

(assert (=> bm!31276 (= call!31279 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!77563 (not res!290003)) b!486553))

(assert (= (and b!486553 c!58543) b!486555))

(assert (= (and b!486553 (not c!58543)) b!486556))

(assert (= (and b!486555 res!290004) b!486554))

(assert (= (or b!486554 b!486556) bm!31276))

(declare-fun m!466477 () Bool)

(assert (=> b!486553 m!466477))

(assert (=> b!486553 m!466477))

(declare-fun m!466479 () Bool)

(assert (=> b!486553 m!466479))

(assert (=> b!486555 m!466477))

(declare-fun m!466481 () Bool)

(assert (=> b!486555 m!466481))

(declare-fun m!466483 () Bool)

(assert (=> b!486555 m!466483))

(assert (=> b!486555 m!466477))

(declare-fun m!466485 () Bool)

(assert (=> b!486555 m!466485))

(declare-fun m!466487 () Bool)

(assert (=> bm!31276 m!466487))

(assert (=> b!486509 d!77563))

(declare-fun d!77567 () Bool)

(declare-fun lt!219776 () Bool)

(assert (=> d!77567 (= lt!219776 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!220 Nil!9301)))))

(declare-fun e!286391 () Bool)

(assert (=> d!77567 (= lt!219776 e!286391)))

(declare-fun res!290006 () Bool)

(assert (=> d!77567 (=> (not res!290006) (not e!286391))))

(assert (=> d!77567 (= res!290006 (is-Cons!9300 Nil!9301))))

(assert (=> d!77567 (= (contains!2698 Nil!9301 #b1000000000000000000000000000000000000000000000000000000000000000) lt!219776)))

(declare-fun b!486557 () Bool)

(declare-fun e!286390 () Bool)

(assert (=> b!486557 (= e!286391 e!286390)))

(declare-fun res!290005 () Bool)

(assert (=> b!486557 (=> res!290005 e!286390)))

(assert (=> b!486557 (= res!290005 (= (h!10156 Nil!9301) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!486558 () Bool)

(assert (=> b!486558 (= e!286390 (contains!2698 (t!15532 Nil!9301) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!77567 res!290006) b!486557))

(assert (= (and b!486557 (not res!290005)) b!486558))

(assert (=> d!77567 m!466467))

(declare-fun m!466489 () Bool)

(assert (=> d!77567 m!466489))

(declare-fun m!466491 () Bool)

(assert (=> b!486558 m!466491))

(assert (=> b!486515 d!77567))

(declare-fun d!77569 () Bool)

(declare-fun res!290019 () Bool)

(declare-fun e!286407 () Bool)

(assert (=> d!77569 (=> res!290019 e!286407)))

(assert (=> d!77569 (= res!290019 (= (select (arr!15146 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!77569 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!286407)))

(declare-fun b!486577 () Bool)

(declare-fun e!286408 () Bool)

(assert (=> b!486577 (= e!286407 e!286408)))

(declare-fun res!290020 () Bool)

(assert (=> b!486577 (=> (not res!290020) (not e!286408))))

(assert (=> b!486577 (= res!290020 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15510 a!3235)))))

(declare-fun b!486578 () Bool)

(assert (=> b!486578 (= e!286408 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77569 (not res!290019)) b!486577))

(assert (= (and b!486577 res!290020) b!486578))

(assert (=> d!77569 m!466477))

(declare-fun m!466507 () Bool)

(assert (=> b!486578 m!466507))

(assert (=> b!486516 d!77569))

(declare-fun d!77575 () Bool)

(declare-fun res!290031 () Bool)

(declare-fun e!286419 () Bool)

(assert (=> d!77575 (=> res!290031 e!286419)))

(assert (=> d!77575 (= res!290031 (is-Nil!9301 Nil!9301))))

(assert (=> d!77575 (= (noDuplicate!212 Nil!9301) e!286419)))

(declare-fun b!486589 () Bool)

(declare-fun e!286420 () Bool)

(assert (=> b!486589 (= e!286419 e!286420)))

(declare-fun res!290032 () Bool)

(assert (=> b!486589 (=> (not res!290032) (not e!286420))))

(assert (=> b!486589 (= res!290032 (not (contains!2698 (t!15532 Nil!9301) (h!10156 Nil!9301))))))

(declare-fun b!486590 () Bool)

(assert (=> b!486590 (= e!286420 (noDuplicate!212 (t!15532 Nil!9301)))))

(assert (= (and d!77575 (not res!290031)) b!486589))

(assert (= (and b!486589 res!290032) b!486590))

(declare-fun m!466513 () Bool)

(assert (=> b!486589 m!466513))

(declare-fun m!466515 () Bool)

(assert (=> b!486590 m!466515))

(assert (=> b!486511 d!77575))

(declare-fun d!77579 () Bool)

(declare-fun lt!219799 () SeekEntryResult!3613)

(assert (=> d!77579 (and (or (is-Undefined!3613 lt!219799) (not (is-Found!3613 lt!219799)) (and (bvsge (index!16632 lt!219799) #b00000000000000000000000000000000) (bvslt (index!16632 lt!219799) (size!15510 a!3235)))) (or (is-Undefined!3613 lt!219799) (is-Found!3613 lt!219799) (not (is-MissingZero!3613 lt!219799)) (and (bvsge (index!16631 lt!219799) #b00000000000000000000000000000000) (bvslt (index!16631 lt!219799) (size!15510 a!3235)))) (or (is-Undefined!3613 lt!219799) (is-Found!3613 lt!219799) (is-MissingZero!3613 lt!219799) (not (is-MissingVacant!3613 lt!219799)) (and (bvsge (index!16634 lt!219799) #b00000000000000000000000000000000) (bvslt (index!16634 lt!219799) (size!15510 a!3235)))) (or (is-Undefined!3613 lt!219799) (ite (is-Found!3613 lt!219799) (= (select (arr!15146 a!3235) (index!16632 lt!219799)) k!2280) (ite (is-MissingZero!3613 lt!219799) (= (select (arr!15146 a!3235) (index!16631 lt!219799)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3613 lt!219799) (= (select (arr!15146 a!3235) (index!16634 lt!219799)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!286437 () SeekEntryResult!3613)

(assert (=> d!77579 (= lt!219799 e!286437)))

(declare-fun c!58556 () Bool)

(declare-fun lt!219801 () SeekEntryResult!3613)

(assert (=> d!77579 (= c!58556 (and (is-Intermediate!3613 lt!219801) (undefined!4425 lt!219801)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31502 (_ BitVec 32)) SeekEntryResult!3613)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77579 (= lt!219801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!77579 (validMask!0 mask!3524)))

(assert (=> d!77579 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!219799)))

(declare-fun b!486613 () Bool)

(declare-fun e!286438 () SeekEntryResult!3613)

(assert (=> b!486613 (= e!286438 (Found!3613 (index!16633 lt!219801)))))

(declare-fun b!486614 () Bool)

(declare-fun e!286436 () SeekEntryResult!3613)

(assert (=> b!486614 (= e!286436 (MissingZero!3613 (index!16633 lt!219801)))))

(declare-fun b!486615 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31502 (_ BitVec 32)) SeekEntryResult!3613)

(assert (=> b!486615 (= e!286436 (seekKeyOrZeroReturnVacant!0 (x!45761 lt!219801) (index!16633 lt!219801) (index!16633 lt!219801) k!2280 a!3235 mask!3524))))

(declare-fun b!486616 () Bool)

(assert (=> b!486616 (= e!286437 Undefined!3613)))

(declare-fun b!486617 () Bool)

(assert (=> b!486617 (= e!286437 e!286438)))

(declare-fun lt!219800 () (_ BitVec 64))

(assert (=> b!486617 (= lt!219800 (select (arr!15146 a!3235) (index!16633 lt!219801)))))

(declare-fun c!58554 () Bool)

(assert (=> b!486617 (= c!58554 (= lt!219800 k!2280))))

(declare-fun b!486618 () Bool)

(declare-fun c!58555 () Bool)

(assert (=> b!486618 (= c!58555 (= lt!219800 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!486618 (= e!286438 e!286436)))

(assert (= (and d!77579 c!58556) b!486616))

(assert (= (and d!77579 (not c!58556)) b!486617))

(assert (= (and b!486617 c!58554) b!486613))

(assert (= (and b!486617 (not c!58554)) b!486618))

(assert (= (and b!486618 c!58555) b!486614))

(assert (= (and b!486618 (not c!58555)) b!486615))

(declare-fun m!466535 () Bool)

(assert (=> d!77579 m!466535))

(declare-fun m!466537 () Bool)

(assert (=> d!77579 m!466537))

(declare-fun m!466539 () Bool)

(assert (=> d!77579 m!466539))

(declare-fun m!466541 () Bool)

(assert (=> d!77579 m!466541))

(assert (=> d!77579 m!466539))

(declare-fun m!466543 () Bool)

(assert (=> d!77579 m!466543))

(assert (=> d!77579 m!466451))

(declare-fun m!466545 () Bool)

(assert (=> b!486615 m!466545))

(declare-fun m!466547 () Bool)

(assert (=> b!486617 m!466547))

(assert (=> b!486517 d!77579))

(declare-fun d!77589 () Bool)

(assert (=> d!77589 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486512 d!77589))

(declare-fun d!77591 () Bool)

(assert (=> d!77591 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

