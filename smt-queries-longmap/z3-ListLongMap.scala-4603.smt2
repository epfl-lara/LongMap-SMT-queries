; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64254 () Bool)

(assert start!64254)

(declare-fun b!721323 () Bool)

(declare-fun res!483261 () Bool)

(declare-fun e!404544 () Bool)

(assert (=> b!721323 (=> (not res!483261) (not e!404544))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40825 0))(
  ( (array!40826 (arr!19534 (Array (_ BitVec 32) (_ BitVec 64))) (size!19954 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40825)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721323 (= res!483261 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19534 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!721324 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!404547 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7090 0))(
  ( (MissingZero!7090 (index!30728 (_ BitVec 32))) (Found!7090 (index!30729 (_ BitVec 32))) (Intermediate!7090 (undefined!7902 Bool) (index!30730 (_ BitVec 32)) (x!61885 (_ BitVec 32))) (Undefined!7090) (MissingVacant!7090 (index!30731 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40825 (_ BitVec 32)) SeekEntryResult!7090)

(assert (=> b!721324 (= e!404547 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19534 a!3186) j!159) a!3186 mask!3328) (Found!7090 j!159)))))

(declare-fun b!721325 () Bool)

(declare-fun lt!320065 () (_ BitVec 32))

(assert (=> b!721325 (= e!404544 (and (bvsge mask!3328 #b00000000000000000000000000000000) (or (bvslt lt!320065 #b00000000000000000000000000000000) (bvsge lt!320065 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721325 (= lt!320065 (toIndex!0 (select (store (arr!19534 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!721326 () Bool)

(declare-fun res!483269 () Bool)

(declare-fun e!404545 () Bool)

(assert (=> b!721326 (=> (not res!483269) (not e!404545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721326 (= res!483269 (validKeyInArray!0 (select (arr!19534 a!3186) j!159)))))

(declare-fun b!721327 () Bool)

(declare-fun lt!320067 () SeekEntryResult!7090)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40825 (_ BitVec 32)) SeekEntryResult!7090)

(assert (=> b!721327 (= e!404547 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19534 a!3186) j!159) a!3186 mask!3328) lt!320067))))

(declare-fun b!721328 () Bool)

(declare-fun e!404543 () Bool)

(assert (=> b!721328 (= e!404545 e!404543)))

(declare-fun res!483270 () Bool)

(assert (=> b!721328 (=> (not res!483270) (not e!404543))))

(declare-fun lt!320066 () SeekEntryResult!7090)

(assert (=> b!721328 (= res!483270 (or (= lt!320066 (MissingZero!7090 i!1173)) (= lt!320066 (MissingVacant!7090 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40825 (_ BitVec 32)) SeekEntryResult!7090)

(assert (=> b!721328 (= lt!320066 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721329 () Bool)

(declare-fun res!483264 () Bool)

(assert (=> b!721329 (=> (not res!483264) (not e!404543))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721329 (= res!483264 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19954 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19954 a!3186))))))

(declare-fun b!721330 () Bool)

(declare-fun res!483266 () Bool)

(assert (=> b!721330 (=> (not res!483266) (not e!404545))))

(assert (=> b!721330 (= res!483266 (and (= (size!19954 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19954 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19954 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!483262 () Bool)

(assert (=> start!64254 (=> (not res!483262) (not e!404545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64254 (= res!483262 (validMask!0 mask!3328))))

(assert (=> start!64254 e!404545))

(assert (=> start!64254 true))

(declare-fun array_inv!15393 (array!40825) Bool)

(assert (=> start!64254 (array_inv!15393 a!3186)))

(declare-fun b!721331 () Bool)

(declare-fun res!483263 () Bool)

(assert (=> b!721331 (=> (not res!483263) (not e!404545))))

(declare-fun arrayContainsKey!0 (array!40825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721331 (= res!483263 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721332 () Bool)

(assert (=> b!721332 (= e!404543 e!404544)))

(declare-fun res!483268 () Bool)

(assert (=> b!721332 (=> (not res!483268) (not e!404544))))

(assert (=> b!721332 (= res!483268 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19534 a!3186) j!159) mask!3328) (select (arr!19534 a!3186) j!159) a!3186 mask!3328) lt!320067))))

(assert (=> b!721332 (= lt!320067 (Intermediate!7090 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721333 () Bool)

(declare-fun res!483271 () Bool)

(assert (=> b!721333 (=> (not res!483271) (not e!404543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40825 (_ BitVec 32)) Bool)

(assert (=> b!721333 (= res!483271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721334 () Bool)

(declare-fun res!483267 () Bool)

(assert (=> b!721334 (=> (not res!483267) (not e!404544))))

(assert (=> b!721334 (= res!483267 e!404547)))

(declare-fun c!79403 () Bool)

(assert (=> b!721334 (= c!79403 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721335 () Bool)

(declare-fun res!483265 () Bool)

(assert (=> b!721335 (=> (not res!483265) (not e!404545))))

(assert (=> b!721335 (= res!483265 (validKeyInArray!0 k0!2102))))

(declare-fun b!721336 () Bool)

(declare-fun res!483260 () Bool)

(assert (=> b!721336 (=> (not res!483260) (not e!404543))))

(declare-datatypes ((List!13443 0))(
  ( (Nil!13440) (Cons!13439 (h!14493 (_ BitVec 64)) (t!19750 List!13443)) )
))
(declare-fun arrayNoDuplicates!0 (array!40825 (_ BitVec 32) List!13443) Bool)

(assert (=> b!721336 (= res!483260 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13440))))

(assert (= (and start!64254 res!483262) b!721330))

(assert (= (and b!721330 res!483266) b!721326))

(assert (= (and b!721326 res!483269) b!721335))

(assert (= (and b!721335 res!483265) b!721331))

(assert (= (and b!721331 res!483263) b!721328))

(assert (= (and b!721328 res!483270) b!721333))

(assert (= (and b!721333 res!483271) b!721336))

(assert (= (and b!721336 res!483260) b!721329))

(assert (= (and b!721329 res!483264) b!721332))

(assert (= (and b!721332 res!483268) b!721323))

(assert (= (and b!721323 res!483261) b!721334))

(assert (= (and b!721334 c!79403) b!721327))

(assert (= (and b!721334 (not c!79403)) b!721324))

(assert (= (and b!721334 res!483267) b!721325))

(declare-fun m!676815 () Bool)

(assert (=> b!721336 m!676815))

(declare-fun m!676817 () Bool)

(assert (=> start!64254 m!676817))

(declare-fun m!676819 () Bool)

(assert (=> start!64254 m!676819))

(declare-fun m!676821 () Bool)

(assert (=> b!721332 m!676821))

(assert (=> b!721332 m!676821))

(declare-fun m!676823 () Bool)

(assert (=> b!721332 m!676823))

(assert (=> b!721332 m!676823))

(assert (=> b!721332 m!676821))

(declare-fun m!676825 () Bool)

(assert (=> b!721332 m!676825))

(declare-fun m!676827 () Bool)

(assert (=> b!721331 m!676827))

(assert (=> b!721326 m!676821))

(assert (=> b!721326 m!676821))

(declare-fun m!676829 () Bool)

(assert (=> b!721326 m!676829))

(assert (=> b!721327 m!676821))

(assert (=> b!721327 m!676821))

(declare-fun m!676831 () Bool)

(assert (=> b!721327 m!676831))

(declare-fun m!676833 () Bool)

(assert (=> b!721333 m!676833))

(declare-fun m!676835 () Bool)

(assert (=> b!721325 m!676835))

(declare-fun m!676837 () Bool)

(assert (=> b!721325 m!676837))

(assert (=> b!721325 m!676837))

(declare-fun m!676839 () Bool)

(assert (=> b!721325 m!676839))

(declare-fun m!676841 () Bool)

(assert (=> b!721328 m!676841))

(declare-fun m!676843 () Bool)

(assert (=> b!721323 m!676843))

(assert (=> b!721324 m!676821))

(assert (=> b!721324 m!676821))

(declare-fun m!676845 () Bool)

(assert (=> b!721324 m!676845))

(declare-fun m!676847 () Bool)

(assert (=> b!721335 m!676847))

(check-sat (not b!721326) (not b!721335) (not b!721336) (not start!64254) (not b!721333) (not b!721325) (not b!721331) (not b!721324) (not b!721328) (not b!721327) (not b!721332))
(check-sat)
(get-model)

(declare-fun d!99375 () Bool)

(assert (=> d!99375 (= (validKeyInArray!0 (select (arr!19534 a!3186) j!159)) (and (not (= (select (arr!19534 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19534 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!721326 d!99375))

(declare-fun b!721439 () Bool)

(declare-fun e!404589 () SeekEntryResult!7090)

(assert (=> b!721439 (= e!404589 (Intermediate!7090 true index!1321 x!1131))))

(declare-fun b!721440 () Bool)

(declare-fun e!404588 () Bool)

(declare-fun e!404592 () Bool)

(assert (=> b!721440 (= e!404588 e!404592)))

(declare-fun res!483352 () Bool)

(declare-fun lt!320091 () SeekEntryResult!7090)

(get-info :version)

(assert (=> b!721440 (= res!483352 (and ((_ is Intermediate!7090) lt!320091) (not (undefined!7902 lt!320091)) (bvslt (x!61885 lt!320091) #b01111111111111111111111111111110) (bvsge (x!61885 lt!320091) #b00000000000000000000000000000000) (bvsge (x!61885 lt!320091) x!1131)))))

(assert (=> b!721440 (=> (not res!483352) (not e!404592))))

(declare-fun b!721441 () Bool)

(declare-fun e!404591 () SeekEntryResult!7090)

(assert (=> b!721441 (= e!404589 e!404591)))

(declare-fun c!79418 () Bool)

(declare-fun lt!320090 () (_ BitVec 64))

(assert (=> b!721441 (= c!79418 (or (= lt!320090 (select (arr!19534 a!3186) j!159)) (= (bvadd lt!320090 lt!320090) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721442 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721442 (= e!404591 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!19534 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!721443 () Bool)

(assert (=> b!721443 (and (bvsge (index!30730 lt!320091) #b00000000000000000000000000000000) (bvslt (index!30730 lt!320091) (size!19954 a!3186)))))

(declare-fun res!483351 () Bool)

(assert (=> b!721443 (= res!483351 (= (select (arr!19534 a!3186) (index!30730 lt!320091)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404590 () Bool)

(assert (=> b!721443 (=> res!483351 e!404590)))

(declare-fun b!721445 () Bool)

(assert (=> b!721445 (and (bvsge (index!30730 lt!320091) #b00000000000000000000000000000000) (bvslt (index!30730 lt!320091) (size!19954 a!3186)))))

(assert (=> b!721445 (= e!404590 (= (select (arr!19534 a!3186) (index!30730 lt!320091)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!721446 () Bool)

(assert (=> b!721446 (= e!404588 (bvsge (x!61885 lt!320091) #b01111111111111111111111111111110))))

(declare-fun b!721447 () Bool)

(assert (=> b!721447 (= e!404591 (Intermediate!7090 false index!1321 x!1131))))

(declare-fun d!99377 () Bool)

(assert (=> d!99377 e!404588))

(declare-fun c!79416 () Bool)

(assert (=> d!99377 (= c!79416 (and ((_ is Intermediate!7090) lt!320091) (undefined!7902 lt!320091)))))

(assert (=> d!99377 (= lt!320091 e!404589)))

(declare-fun c!79417 () Bool)

(assert (=> d!99377 (= c!79417 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99377 (= lt!320090 (select (arr!19534 a!3186) index!1321))))

(assert (=> d!99377 (validMask!0 mask!3328)))

(assert (=> d!99377 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19534 a!3186) j!159) a!3186 mask!3328) lt!320091)))

(declare-fun b!721444 () Bool)

(assert (=> b!721444 (and (bvsge (index!30730 lt!320091) #b00000000000000000000000000000000) (bvslt (index!30730 lt!320091) (size!19954 a!3186)))))

(declare-fun res!483350 () Bool)

(assert (=> b!721444 (= res!483350 (= (select (arr!19534 a!3186) (index!30730 lt!320091)) (select (arr!19534 a!3186) j!159)))))

(assert (=> b!721444 (=> res!483350 e!404590)))

(assert (=> b!721444 (= e!404592 e!404590)))

(assert (= (and d!99377 c!79417) b!721439))

(assert (= (and d!99377 (not c!79417)) b!721441))

(assert (= (and b!721441 c!79418) b!721447))

(assert (= (and b!721441 (not c!79418)) b!721442))

(assert (= (and d!99377 c!79416) b!721446))

(assert (= (and d!99377 (not c!79416)) b!721440))

(assert (= (and b!721440 res!483352) b!721444))

(assert (= (and b!721444 (not res!483350)) b!721443))

(assert (= (and b!721443 (not res!483351)) b!721445))

(declare-fun m!676917 () Bool)

(assert (=> d!99377 m!676917))

(assert (=> d!99377 m!676817))

(declare-fun m!676919 () Bool)

(assert (=> b!721444 m!676919))

(declare-fun m!676921 () Bool)

(assert (=> b!721442 m!676921))

(assert (=> b!721442 m!676921))

(assert (=> b!721442 m!676821))

(declare-fun m!676923 () Bool)

(assert (=> b!721442 m!676923))

(assert (=> b!721443 m!676919))

(assert (=> b!721445 m!676919))

(assert (=> b!721327 d!99377))

(declare-fun d!99383 () Bool)

(assert (=> d!99383 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64254 d!99383))

(declare-fun d!99387 () Bool)

(assert (=> d!99387 (= (array_inv!15393 a!3186) (bvsge (size!19954 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64254 d!99387))

(declare-fun b!721448 () Bool)

(declare-fun e!404594 () SeekEntryResult!7090)

(assert (=> b!721448 (= e!404594 (Intermediate!7090 true (toIndex!0 (select (arr!19534 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!721449 () Bool)

(declare-fun e!404593 () Bool)

(declare-fun e!404597 () Bool)

(assert (=> b!721449 (= e!404593 e!404597)))

(declare-fun res!483355 () Bool)

(declare-fun lt!320093 () SeekEntryResult!7090)

(assert (=> b!721449 (= res!483355 (and ((_ is Intermediate!7090) lt!320093) (not (undefined!7902 lt!320093)) (bvslt (x!61885 lt!320093) #b01111111111111111111111111111110) (bvsge (x!61885 lt!320093) #b00000000000000000000000000000000) (bvsge (x!61885 lt!320093) #b00000000000000000000000000000000)))))

(assert (=> b!721449 (=> (not res!483355) (not e!404597))))

(declare-fun b!721450 () Bool)

(declare-fun e!404596 () SeekEntryResult!7090)

(assert (=> b!721450 (= e!404594 e!404596)))

(declare-fun c!79421 () Bool)

(declare-fun lt!320092 () (_ BitVec 64))

(assert (=> b!721450 (= c!79421 (or (= lt!320092 (select (arr!19534 a!3186) j!159)) (= (bvadd lt!320092 lt!320092) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721451 () Bool)

(assert (=> b!721451 (= e!404596 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19534 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!19534 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!721452 () Bool)

(assert (=> b!721452 (and (bvsge (index!30730 lt!320093) #b00000000000000000000000000000000) (bvslt (index!30730 lt!320093) (size!19954 a!3186)))))

(declare-fun res!483354 () Bool)

(assert (=> b!721452 (= res!483354 (= (select (arr!19534 a!3186) (index!30730 lt!320093)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404595 () Bool)

(assert (=> b!721452 (=> res!483354 e!404595)))

(declare-fun b!721454 () Bool)

(assert (=> b!721454 (and (bvsge (index!30730 lt!320093) #b00000000000000000000000000000000) (bvslt (index!30730 lt!320093) (size!19954 a!3186)))))

(assert (=> b!721454 (= e!404595 (= (select (arr!19534 a!3186) (index!30730 lt!320093)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!721455 () Bool)

(assert (=> b!721455 (= e!404593 (bvsge (x!61885 lt!320093) #b01111111111111111111111111111110))))

(declare-fun b!721456 () Bool)

(assert (=> b!721456 (= e!404596 (Intermediate!7090 false (toIndex!0 (select (arr!19534 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!99389 () Bool)

(assert (=> d!99389 e!404593))

(declare-fun c!79419 () Bool)

(assert (=> d!99389 (= c!79419 (and ((_ is Intermediate!7090) lt!320093) (undefined!7902 lt!320093)))))

(assert (=> d!99389 (= lt!320093 e!404594)))

(declare-fun c!79420 () Bool)

(assert (=> d!99389 (= c!79420 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99389 (= lt!320092 (select (arr!19534 a!3186) (toIndex!0 (select (arr!19534 a!3186) j!159) mask!3328)))))

(assert (=> d!99389 (validMask!0 mask!3328)))

(assert (=> d!99389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19534 a!3186) j!159) mask!3328) (select (arr!19534 a!3186) j!159) a!3186 mask!3328) lt!320093)))

(declare-fun b!721453 () Bool)

(assert (=> b!721453 (and (bvsge (index!30730 lt!320093) #b00000000000000000000000000000000) (bvslt (index!30730 lt!320093) (size!19954 a!3186)))))

(declare-fun res!483353 () Bool)

(assert (=> b!721453 (= res!483353 (= (select (arr!19534 a!3186) (index!30730 lt!320093)) (select (arr!19534 a!3186) j!159)))))

(assert (=> b!721453 (=> res!483353 e!404595)))

(assert (=> b!721453 (= e!404597 e!404595)))

(assert (= (and d!99389 c!79420) b!721448))

(assert (= (and d!99389 (not c!79420)) b!721450))

(assert (= (and b!721450 c!79421) b!721456))

(assert (= (and b!721450 (not c!79421)) b!721451))

(assert (= (and d!99389 c!79419) b!721455))

(assert (= (and d!99389 (not c!79419)) b!721449))

(assert (= (and b!721449 res!483355) b!721453))

(assert (= (and b!721453 (not res!483353)) b!721452))

(assert (= (and b!721452 (not res!483354)) b!721454))

(assert (=> d!99389 m!676823))

(declare-fun m!676925 () Bool)

(assert (=> d!99389 m!676925))

(assert (=> d!99389 m!676817))

(declare-fun m!676927 () Bool)

(assert (=> b!721453 m!676927))

(assert (=> b!721451 m!676823))

(declare-fun m!676929 () Bool)

(assert (=> b!721451 m!676929))

(assert (=> b!721451 m!676929))

(assert (=> b!721451 m!676821))

(declare-fun m!676931 () Bool)

(assert (=> b!721451 m!676931))

(assert (=> b!721452 m!676927))

(assert (=> b!721454 m!676927))

(assert (=> b!721332 d!99389))

(declare-fun d!99391 () Bool)

(declare-fun lt!320103 () (_ BitVec 32))

(declare-fun lt!320102 () (_ BitVec 32))

(assert (=> d!99391 (= lt!320103 (bvmul (bvxor lt!320102 (bvlshr lt!320102 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99391 (= lt!320102 ((_ extract 31 0) (bvand (bvxor (select (arr!19534 a!3186) j!159) (bvlshr (select (arr!19534 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99391 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!483356 (let ((h!14496 ((_ extract 31 0) (bvand (bvxor (select (arr!19534 a!3186) j!159) (bvlshr (select (arr!19534 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61890 (bvmul (bvxor h!14496 (bvlshr h!14496 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61890 (bvlshr x!61890 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!483356 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!483356 #b00000000000000000000000000000000))))))

(assert (=> d!99391 (= (toIndex!0 (select (arr!19534 a!3186) j!159) mask!3328) (bvand (bvxor lt!320103 (bvlshr lt!320103 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!721332 d!99391))

(declare-fun bm!34776 () Bool)

(declare-fun call!34779 () Bool)

(assert (=> bm!34776 (= call!34779 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!721510 () Bool)

(declare-fun e!404628 () Bool)

(declare-fun e!404630 () Bool)

(assert (=> b!721510 (= e!404628 e!404630)))

(declare-fun lt!320128 () (_ BitVec 64))

(assert (=> b!721510 (= lt!320128 (select (arr!19534 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24655 0))(
  ( (Unit!24656) )
))
(declare-fun lt!320127 () Unit!24655)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40825 (_ BitVec 64) (_ BitVec 32)) Unit!24655)

(assert (=> b!721510 (= lt!320127 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!320128 #b00000000000000000000000000000000))))

(assert (=> b!721510 (arrayContainsKey!0 a!3186 lt!320128 #b00000000000000000000000000000000)))

(declare-fun lt!320129 () Unit!24655)

(assert (=> b!721510 (= lt!320129 lt!320127)))

(declare-fun res!483371 () Bool)

(assert (=> b!721510 (= res!483371 (= (seekEntryOrOpen!0 (select (arr!19534 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7090 #b00000000000000000000000000000000)))))

(assert (=> b!721510 (=> (not res!483371) (not e!404630))))

(declare-fun b!721512 () Bool)

(assert (=> b!721512 (= e!404630 call!34779)))

(declare-fun b!721513 () Bool)

(assert (=> b!721513 (= e!404628 call!34779)))

(declare-fun d!99393 () Bool)

(declare-fun res!483372 () Bool)

(declare-fun e!404629 () Bool)

(assert (=> d!99393 (=> res!483372 e!404629)))

(assert (=> d!99393 (= res!483372 (bvsge #b00000000000000000000000000000000 (size!19954 a!3186)))))

(assert (=> d!99393 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!404629)))

(declare-fun b!721511 () Bool)

(assert (=> b!721511 (= e!404629 e!404628)))

(declare-fun c!79442 () Bool)

(assert (=> b!721511 (= c!79442 (validKeyInArray!0 (select (arr!19534 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99393 (not res!483372)) b!721511))

(assert (= (and b!721511 c!79442) b!721510))

(assert (= (and b!721511 (not c!79442)) b!721513))

(assert (= (and b!721510 res!483371) b!721512))

(assert (= (or b!721512 b!721513) bm!34776))

(declare-fun m!676955 () Bool)

(assert (=> bm!34776 m!676955))

(declare-fun m!676957 () Bool)

(assert (=> b!721510 m!676957))

(declare-fun m!676959 () Bool)

(assert (=> b!721510 m!676959))

(declare-fun m!676961 () Bool)

(assert (=> b!721510 m!676961))

(assert (=> b!721510 m!676957))

(declare-fun m!676963 () Bool)

(assert (=> b!721510 m!676963))

(assert (=> b!721511 m!676957))

(assert (=> b!721511 m!676957))

(declare-fun m!676965 () Bool)

(assert (=> b!721511 m!676965))

(assert (=> b!721333 d!99393))

(declare-fun b!721562 () Bool)

(declare-fun e!404664 () SeekEntryResult!7090)

(declare-fun lt!320148 () SeekEntryResult!7090)

(assert (=> b!721562 (= e!404664 (seekKeyOrZeroReturnVacant!0 (x!61885 lt!320148) (index!30730 lt!320148) (index!30730 lt!320148) k0!2102 a!3186 mask!3328))))

(declare-fun b!721563 () Bool)

(declare-fun e!404665 () SeekEntryResult!7090)

(declare-fun e!404663 () SeekEntryResult!7090)

(assert (=> b!721563 (= e!404665 e!404663)))

(declare-fun lt!320149 () (_ BitVec 64))

(assert (=> b!721563 (= lt!320149 (select (arr!19534 a!3186) (index!30730 lt!320148)))))

(declare-fun c!79459 () Bool)

(assert (=> b!721563 (= c!79459 (= lt!320149 k0!2102))))

(declare-fun b!721564 () Bool)

(assert (=> b!721564 (= e!404663 (Found!7090 (index!30730 lt!320148)))))

(declare-fun d!99403 () Bool)

(declare-fun lt!320147 () SeekEntryResult!7090)

(assert (=> d!99403 (and (or ((_ is Undefined!7090) lt!320147) (not ((_ is Found!7090) lt!320147)) (and (bvsge (index!30729 lt!320147) #b00000000000000000000000000000000) (bvslt (index!30729 lt!320147) (size!19954 a!3186)))) (or ((_ is Undefined!7090) lt!320147) ((_ is Found!7090) lt!320147) (not ((_ is MissingZero!7090) lt!320147)) (and (bvsge (index!30728 lt!320147) #b00000000000000000000000000000000) (bvslt (index!30728 lt!320147) (size!19954 a!3186)))) (or ((_ is Undefined!7090) lt!320147) ((_ is Found!7090) lt!320147) ((_ is MissingZero!7090) lt!320147) (not ((_ is MissingVacant!7090) lt!320147)) (and (bvsge (index!30731 lt!320147) #b00000000000000000000000000000000) (bvslt (index!30731 lt!320147) (size!19954 a!3186)))) (or ((_ is Undefined!7090) lt!320147) (ite ((_ is Found!7090) lt!320147) (= (select (arr!19534 a!3186) (index!30729 lt!320147)) k0!2102) (ite ((_ is MissingZero!7090) lt!320147) (= (select (arr!19534 a!3186) (index!30728 lt!320147)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7090) lt!320147) (= (select (arr!19534 a!3186) (index!30731 lt!320147)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99403 (= lt!320147 e!404665)))

(declare-fun c!79460 () Bool)

(assert (=> d!99403 (= c!79460 (and ((_ is Intermediate!7090) lt!320148) (undefined!7902 lt!320148)))))

(assert (=> d!99403 (= lt!320148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99403 (validMask!0 mask!3328)))

(assert (=> d!99403 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!320147)))

(declare-fun b!721565 () Bool)

(assert (=> b!721565 (= e!404664 (MissingZero!7090 (index!30730 lt!320148)))))

(declare-fun b!721566 () Bool)

(declare-fun c!79458 () Bool)

(assert (=> b!721566 (= c!79458 (= lt!320149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!721566 (= e!404663 e!404664)))

(declare-fun b!721567 () Bool)

(assert (=> b!721567 (= e!404665 Undefined!7090)))

(assert (= (and d!99403 c!79460) b!721567))

(assert (= (and d!99403 (not c!79460)) b!721563))

(assert (= (and b!721563 c!79459) b!721564))

(assert (= (and b!721563 (not c!79459)) b!721566))

(assert (= (and b!721566 c!79458) b!721565))

(assert (= (and b!721566 (not c!79458)) b!721562))

(declare-fun m!676995 () Bool)

(assert (=> b!721562 m!676995))

(declare-fun m!676997 () Bool)

(assert (=> b!721563 m!676997))

(declare-fun m!676999 () Bool)

(assert (=> d!99403 m!676999))

(assert (=> d!99403 m!676817))

(declare-fun m!677001 () Bool)

(assert (=> d!99403 m!677001))

(assert (=> d!99403 m!676999))

(declare-fun m!677003 () Bool)

(assert (=> d!99403 m!677003))

(declare-fun m!677005 () Bool)

(assert (=> d!99403 m!677005))

(declare-fun m!677007 () Bool)

(assert (=> d!99403 m!677007))

(assert (=> b!721328 d!99403))

(declare-fun d!99415 () Bool)

(assert (=> d!99415 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!721335 d!99415))

(declare-fun b!721616 () Bool)

(declare-fun e!404692 () SeekEntryResult!7090)

(assert (=> b!721616 (= e!404692 (MissingVacant!7090 resIntermediateIndex!5))))

(declare-fun d!99417 () Bool)

(declare-fun lt!320167 () SeekEntryResult!7090)

(assert (=> d!99417 (and (or ((_ is Undefined!7090) lt!320167) (not ((_ is Found!7090) lt!320167)) (and (bvsge (index!30729 lt!320167) #b00000000000000000000000000000000) (bvslt (index!30729 lt!320167) (size!19954 a!3186)))) (or ((_ is Undefined!7090) lt!320167) ((_ is Found!7090) lt!320167) (not ((_ is MissingVacant!7090) lt!320167)) (not (= (index!30731 lt!320167) resIntermediateIndex!5)) (and (bvsge (index!30731 lt!320167) #b00000000000000000000000000000000) (bvslt (index!30731 lt!320167) (size!19954 a!3186)))) (or ((_ is Undefined!7090) lt!320167) (ite ((_ is Found!7090) lt!320167) (= (select (arr!19534 a!3186) (index!30729 lt!320167)) (select (arr!19534 a!3186) j!159)) (and ((_ is MissingVacant!7090) lt!320167) (= (index!30731 lt!320167) resIntermediateIndex!5) (= (select (arr!19534 a!3186) (index!30731 lt!320167)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!404691 () SeekEntryResult!7090)

(assert (=> d!99417 (= lt!320167 e!404691)))

(declare-fun c!79485 () Bool)

(assert (=> d!99417 (= c!79485 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!320166 () (_ BitVec 64))

(assert (=> d!99417 (= lt!320166 (select (arr!19534 a!3186) index!1321))))

(assert (=> d!99417 (validMask!0 mask!3328)))

(assert (=> d!99417 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19534 a!3186) j!159) a!3186 mask!3328) lt!320167)))

(declare-fun b!721617 () Bool)

(declare-fun e!404690 () SeekEntryResult!7090)

(assert (=> b!721617 (= e!404691 e!404690)))

(declare-fun c!79487 () Bool)

(assert (=> b!721617 (= c!79487 (= lt!320166 (select (arr!19534 a!3186) j!159)))))

(declare-fun b!721618 () Bool)

(assert (=> b!721618 (= e!404691 Undefined!7090)))

(declare-fun b!721619 () Bool)

(assert (=> b!721619 (= e!404692 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!19534 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!721620 () Bool)

(assert (=> b!721620 (= e!404690 (Found!7090 index!1321))))

(declare-fun b!721621 () Bool)

(declare-fun c!79486 () Bool)

(assert (=> b!721621 (= c!79486 (= lt!320166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!721621 (= e!404690 e!404692)))

(assert (= (and d!99417 c!79485) b!721618))

(assert (= (and d!99417 (not c!79485)) b!721617))

(assert (= (and b!721617 c!79487) b!721620))

(assert (= (and b!721617 (not c!79487)) b!721621))

(assert (= (and b!721621 c!79486) b!721616))

(assert (= (and b!721621 (not c!79486)) b!721619))

(declare-fun m!677025 () Bool)

(assert (=> d!99417 m!677025))

(declare-fun m!677027 () Bool)

(assert (=> d!99417 m!677027))

(assert (=> d!99417 m!676917))

(assert (=> d!99417 m!676817))

(assert (=> b!721619 m!676921))

(assert (=> b!721619 m!676921))

(assert (=> b!721619 m!676821))

(declare-fun m!677029 () Bool)

(assert (=> b!721619 m!677029))

(assert (=> b!721324 d!99417))

(declare-fun d!99423 () Bool)

(declare-fun lt!320169 () (_ BitVec 32))

(declare-fun lt!320168 () (_ BitVec 32))

(assert (=> d!99423 (= lt!320169 (bvmul (bvxor lt!320168 (bvlshr lt!320168 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99423 (= lt!320168 ((_ extract 31 0) (bvand (bvxor (select (store (arr!19534 a!3186) i!1173 k0!2102) j!159) (bvlshr (select (store (arr!19534 a!3186) i!1173 k0!2102) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99423 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!483356 (let ((h!14496 ((_ extract 31 0) (bvand (bvxor (select (store (arr!19534 a!3186) i!1173 k0!2102) j!159) (bvlshr (select (store (arr!19534 a!3186) i!1173 k0!2102) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61890 (bvmul (bvxor h!14496 (bvlshr h!14496 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61890 (bvlshr x!61890 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!483356 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!483356 #b00000000000000000000000000000000))))))

(assert (=> d!99423 (= (toIndex!0 (select (store (arr!19534 a!3186) i!1173 k0!2102) j!159) mask!3328) (bvand (bvxor lt!320169 (bvlshr lt!320169 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!721325 d!99423))

(declare-fun d!99425 () Bool)

(declare-fun res!483395 () Bool)

(declare-fun e!404701 () Bool)

(assert (=> d!99425 (=> res!483395 e!404701)))

(assert (=> d!99425 (= res!483395 (= (select (arr!19534 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99425 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!404701)))

(declare-fun b!721634 () Bool)

(declare-fun e!404702 () Bool)

(assert (=> b!721634 (= e!404701 e!404702)))

(declare-fun res!483396 () Bool)

(assert (=> b!721634 (=> (not res!483396) (not e!404702))))

(assert (=> b!721634 (= res!483396 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19954 a!3186)))))

(declare-fun b!721635 () Bool)

(assert (=> b!721635 (= e!404702 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99425 (not res!483395)) b!721634))

(assert (= (and b!721634 res!483396) b!721635))

(assert (=> d!99425 m!676957))

(declare-fun m!677031 () Bool)

(assert (=> b!721635 m!677031))

(assert (=> b!721331 d!99425))

(declare-fun b!721665 () Bool)

(declare-fun e!404725 () Bool)

(declare-fun call!34788 () Bool)

(assert (=> b!721665 (= e!404725 call!34788)))

(declare-fun bm!34785 () Bool)

(declare-fun c!79499 () Bool)

(assert (=> bm!34785 (= call!34788 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79499 (Cons!13439 (select (arr!19534 a!3186) #b00000000000000000000000000000000) Nil!13440) Nil!13440)))))

(declare-fun b!721666 () Bool)

(declare-fun e!404724 () Bool)

(declare-fun contains!4022 (List!13443 (_ BitVec 64)) Bool)

(assert (=> b!721666 (= e!404724 (contains!4022 Nil!13440 (select (arr!19534 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!721667 () Bool)

(declare-fun e!404722 () Bool)

(declare-fun e!404723 () Bool)

(assert (=> b!721667 (= e!404722 e!404723)))

(declare-fun res!483414 () Bool)

(assert (=> b!721667 (=> (not res!483414) (not e!404723))))

(assert (=> b!721667 (= res!483414 (not e!404724))))

(declare-fun res!483413 () Bool)

(assert (=> b!721667 (=> (not res!483413) (not e!404724))))

(assert (=> b!721667 (= res!483413 (validKeyInArray!0 (select (arr!19534 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!721668 () Bool)

(assert (=> b!721668 (= e!404723 e!404725)))

(assert (=> b!721668 (= c!79499 (validKeyInArray!0 (select (arr!19534 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!721669 () Bool)

(assert (=> b!721669 (= e!404725 call!34788)))

(declare-fun d!99427 () Bool)

(declare-fun res!483415 () Bool)

(assert (=> d!99427 (=> res!483415 e!404722)))

(assert (=> d!99427 (= res!483415 (bvsge #b00000000000000000000000000000000 (size!19954 a!3186)))))

(assert (=> d!99427 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13440) e!404722)))

(assert (= (and d!99427 (not res!483415)) b!721667))

(assert (= (and b!721667 res!483413) b!721666))

(assert (= (and b!721667 res!483414) b!721668))

(assert (= (and b!721668 c!79499) b!721669))

(assert (= (and b!721668 (not c!79499)) b!721665))

(assert (= (or b!721669 b!721665) bm!34785))

(assert (=> bm!34785 m!676957))

(declare-fun m!677037 () Bool)

(assert (=> bm!34785 m!677037))

(assert (=> b!721666 m!676957))

(assert (=> b!721666 m!676957))

(declare-fun m!677039 () Bool)

(assert (=> b!721666 m!677039))

(assert (=> b!721667 m!676957))

(assert (=> b!721667 m!676957))

(assert (=> b!721667 m!676965))

(assert (=> b!721668 m!676957))

(assert (=> b!721668 m!676957))

(assert (=> b!721668 m!676965))

(assert (=> b!721336 d!99427))

(check-sat (not d!99403) (not b!721562) (not b!721666) (not b!721510) (not b!721619) (not b!721451) (not b!721442) (not b!721635) (not d!99417) (not bm!34785) (not d!99389) (not d!99377) (not b!721667) (not bm!34776) (not b!721511) (not b!721668))
(check-sat)
