; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64108 () Bool)

(assert start!64108)

(declare-fun b!720176 () Bool)

(declare-fun e!403946 () Bool)

(declare-fun e!403944 () Bool)

(assert (=> b!720176 (= e!403946 e!403944)))

(declare-fun res!482552 () Bool)

(assert (=> b!720176 (=> (not res!482552) (not e!403944))))

(declare-datatypes ((SeekEntryResult!7127 0))(
  ( (MissingZero!7127 (index!30876 (_ BitVec 32))) (Found!7127 (index!30877 (_ BitVec 32))) (Intermediate!7127 (undefined!7939 Bool) (index!30878 (_ BitVec 32)) (x!61878 (_ BitVec 32))) (Undefined!7127) (MissingVacant!7127 (index!30879 (_ BitVec 32))) )
))
(declare-fun lt!319720 () SeekEntryResult!7127)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720176 (= res!482552 (or (= lt!319720 (MissingZero!7127 i!1173)) (= lt!319720 (MissingVacant!7127 i!1173))))))

(declare-datatypes ((array!40803 0))(
  ( (array!40804 (arr!19527 (Array (_ BitVec 32) (_ BitVec 64))) (size!19948 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40803)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40803 (_ BitVec 32)) SeekEntryResult!7127)

(assert (=> b!720176 (= lt!319720 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!720177 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!403942 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40803 (_ BitVec 32)) SeekEntryResult!7127)

(assert (=> b!720177 (= e!403942 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19527 a!3186) j!159) a!3186 mask!3328) (Found!7127 j!159)))))

(declare-fun b!720178 () Bool)

(declare-fun res!482547 () Bool)

(assert (=> b!720178 (=> (not res!482547) (not e!403946))))

(declare-fun arrayContainsKey!0 (array!40803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720178 (= res!482547 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720179 () Bool)

(declare-fun e!403945 () Bool)

(assert (=> b!720179 (= e!403945 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsgt mask!3328 #b00111111111111111111111111111111)))))

(declare-fun b!720180 () Bool)

(declare-fun res!482553 () Bool)

(assert (=> b!720180 (=> (not res!482553) (not e!403946))))

(assert (=> b!720180 (= res!482553 (and (= (size!19948 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19948 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19948 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720181 () Bool)

(declare-fun res!482555 () Bool)

(assert (=> b!720181 (=> (not res!482555) (not e!403944))))

(declare-datatypes ((List!13529 0))(
  ( (Nil!13526) (Cons!13525 (h!14573 (_ BitVec 64)) (t!19844 List!13529)) )
))
(declare-fun arrayNoDuplicates!0 (array!40803 (_ BitVec 32) List!13529) Bool)

(assert (=> b!720181 (= res!482555 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13526))))

(declare-fun b!720182 () Bool)

(declare-fun res!482557 () Bool)

(assert (=> b!720182 (=> (not res!482557) (not e!403945))))

(assert (=> b!720182 (= res!482557 e!403942)))

(declare-fun c!79183 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720182 (= c!79183 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720183 () Bool)

(declare-fun res!482548 () Bool)

(assert (=> b!720183 (=> (not res!482548) (not e!403945))))

(assert (=> b!720183 (= res!482548 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19527 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720184 () Bool)

(declare-fun res!482554 () Bool)

(assert (=> b!720184 (=> (not res!482554) (not e!403944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40803 (_ BitVec 32)) Bool)

(assert (=> b!720184 (= res!482554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720185 () Bool)

(declare-fun lt!319721 () SeekEntryResult!7127)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40803 (_ BitVec 32)) SeekEntryResult!7127)

(assert (=> b!720185 (= e!403942 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19527 a!3186) j!159) a!3186 mask!3328) lt!319721))))

(declare-fun res!482549 () Bool)

(assert (=> start!64108 (=> (not res!482549) (not e!403946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64108 (= res!482549 (validMask!0 mask!3328))))

(assert (=> start!64108 e!403946))

(assert (=> start!64108 true))

(declare-fun array_inv!15323 (array!40803) Bool)

(assert (=> start!64108 (array_inv!15323 a!3186)))

(declare-fun b!720186 () Bool)

(declare-fun res!482556 () Bool)

(assert (=> b!720186 (=> (not res!482556) (not e!403944))))

(assert (=> b!720186 (= res!482556 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19948 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19948 a!3186))))))

(declare-fun b!720187 () Bool)

(declare-fun res!482551 () Bool)

(assert (=> b!720187 (=> (not res!482551) (not e!403946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720187 (= res!482551 (validKeyInArray!0 (select (arr!19527 a!3186) j!159)))))

(declare-fun b!720188 () Bool)

(assert (=> b!720188 (= e!403944 e!403945)))

(declare-fun res!482550 () Bool)

(assert (=> b!720188 (=> (not res!482550) (not e!403945))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720188 (= res!482550 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19527 a!3186) j!159) mask!3328) (select (arr!19527 a!3186) j!159) a!3186 mask!3328) lt!319721))))

(assert (=> b!720188 (= lt!319721 (Intermediate!7127 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720189 () Bool)

(declare-fun res!482558 () Bool)

(assert (=> b!720189 (=> (not res!482558) (not e!403946))))

(assert (=> b!720189 (= res!482558 (validKeyInArray!0 k!2102))))

(assert (= (and start!64108 res!482549) b!720180))

(assert (= (and b!720180 res!482553) b!720187))

(assert (= (and b!720187 res!482551) b!720189))

(assert (= (and b!720189 res!482558) b!720178))

(assert (= (and b!720178 res!482547) b!720176))

(assert (= (and b!720176 res!482552) b!720184))

(assert (= (and b!720184 res!482554) b!720181))

(assert (= (and b!720181 res!482555) b!720186))

(assert (= (and b!720186 res!482556) b!720188))

(assert (= (and b!720188 res!482550) b!720183))

(assert (= (and b!720183 res!482548) b!720182))

(assert (= (and b!720182 c!79183) b!720185))

(assert (= (and b!720182 (not c!79183)) b!720177))

(assert (= (and b!720182 res!482557) b!720179))

(declare-fun m!675415 () Bool)

(assert (=> b!720183 m!675415))

(declare-fun m!675417 () Bool)

(assert (=> b!720187 m!675417))

(assert (=> b!720187 m!675417))

(declare-fun m!675419 () Bool)

(assert (=> b!720187 m!675419))

(assert (=> b!720185 m!675417))

(assert (=> b!720185 m!675417))

(declare-fun m!675421 () Bool)

(assert (=> b!720185 m!675421))

(declare-fun m!675423 () Bool)

(assert (=> b!720178 m!675423))

(declare-fun m!675425 () Bool)

(assert (=> b!720184 m!675425))

(assert (=> b!720177 m!675417))

(assert (=> b!720177 m!675417))

(declare-fun m!675427 () Bool)

(assert (=> b!720177 m!675427))

(declare-fun m!675429 () Bool)

(assert (=> b!720189 m!675429))

(declare-fun m!675431 () Bool)

(assert (=> b!720176 m!675431))

(assert (=> b!720188 m!675417))

(assert (=> b!720188 m!675417))

(declare-fun m!675433 () Bool)

(assert (=> b!720188 m!675433))

(assert (=> b!720188 m!675433))

(assert (=> b!720188 m!675417))

(declare-fun m!675435 () Bool)

(assert (=> b!720188 m!675435))

(declare-fun m!675437 () Bool)

(assert (=> b!720181 m!675437))

(declare-fun m!675439 () Bool)

(assert (=> start!64108 m!675439))

(declare-fun m!675441 () Bool)

(assert (=> start!64108 m!675441))

(push 1)

(assert (not b!720185))

(assert (not b!720188))

(assert (not b!720184))

(assert (not b!720176))

(assert (not b!720181))

(assert (not start!64108))

(assert (not b!720178))

(assert (not b!720187))

(assert (not b!720189))

(assert (not b!720177))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99113 () Bool)

(declare-fun lt!319756 () SeekEntryResult!7127)

(assert (=> d!99113 (and (or (is-Undefined!7127 lt!319756) (not (is-Found!7127 lt!319756)) (and (bvsge (index!30877 lt!319756) #b00000000000000000000000000000000) (bvslt (index!30877 lt!319756) (size!19948 a!3186)))) (or (is-Undefined!7127 lt!319756) (is-Found!7127 lt!319756) (not (is-MissingVacant!7127 lt!319756)) (not (= (index!30879 lt!319756) resIntermediateIndex!5)) (and (bvsge (index!30879 lt!319756) #b00000000000000000000000000000000) (bvslt (index!30879 lt!319756) (size!19948 a!3186)))) (or (is-Undefined!7127 lt!319756) (ite (is-Found!7127 lt!319756) (= (select (arr!19527 a!3186) (index!30877 lt!319756)) (select (arr!19527 a!3186) j!159)) (and (is-MissingVacant!7127 lt!319756) (= (index!30879 lt!319756) resIntermediateIndex!5) (= (select (arr!19527 a!3186) (index!30879 lt!319756)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!404021 () SeekEntryResult!7127)

(assert (=> d!99113 (= lt!319756 e!404021)))

(declare-fun c!79213 () Bool)

(assert (=> d!99113 (= c!79213 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!319757 () (_ BitVec 64))

(assert (=> d!99113 (= lt!319757 (select (arr!19527 a!3186) index!1321))))

(assert (=> d!99113 (validMask!0 mask!3328)))

(assert (=> d!99113 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19527 a!3186) j!159) a!3186 mask!3328) lt!319756)))

(declare-fun b!720337 () Bool)

(declare-fun e!404019 () SeekEntryResult!7127)

(assert (=> b!720337 (= e!404019 (Found!7127 index!1321))))

(declare-fun b!720338 () Bool)

(declare-fun e!404020 () SeekEntryResult!7127)

(assert (=> b!720338 (= e!404020 (MissingVacant!7127 resIntermediateIndex!5))))

(declare-fun b!720339 () Bool)

(assert (=> b!720339 (= e!404021 Undefined!7127)))

(declare-fun b!720340 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720340 (= e!404020 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19527 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!720341 () Bool)

(declare-fun c!79212 () Bool)

(assert (=> b!720341 (= c!79212 (= lt!319757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!720341 (= e!404019 e!404020)))

(declare-fun b!720342 () Bool)

(assert (=> b!720342 (= e!404021 e!404019)))

(declare-fun c!79211 () Bool)

(assert (=> b!720342 (= c!79211 (= lt!319757 (select (arr!19527 a!3186) j!159)))))

(assert (= (and d!99113 c!79213) b!720339))

(assert (= (and d!99113 (not c!79213)) b!720342))

(assert (= (and b!720342 c!79211) b!720337))

(assert (= (and b!720342 (not c!79211)) b!720341))

(assert (= (and b!720341 c!79212) b!720338))

(assert (= (and b!720341 (not c!79212)) b!720340))

(declare-fun m!675535 () Bool)

(assert (=> d!99113 m!675535))

(declare-fun m!675537 () Bool)

(assert (=> d!99113 m!675537))

(declare-fun m!675539 () Bool)

(assert (=> d!99113 m!675539))

(assert (=> d!99113 m!675439))

(declare-fun m!675541 () Bool)

(assert (=> b!720340 m!675541))

(assert (=> b!720340 m!675541))

(assert (=> b!720340 m!675417))

(declare-fun m!675543 () Bool)

(assert (=> b!720340 m!675543))

(assert (=> b!720177 d!99113))

(declare-fun b!720429 () Bool)

(declare-fun e!404076 () SeekEntryResult!7127)

(assert (=> b!720429 (= e!404076 Undefined!7127)))

(declare-fun b!720431 () Bool)

(declare-fun c!79244 () Bool)

(declare-fun lt!319788 () (_ BitVec 64))

(assert (=> b!720431 (= c!79244 (= lt!319788 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404078 () SeekEntryResult!7127)

(declare-fun e!404077 () SeekEntryResult!7127)

(assert (=> b!720431 (= e!404078 e!404077)))

(declare-fun b!720432 () Bool)

(declare-fun lt!319789 () SeekEntryResult!7127)

(assert (=> b!720432 (= e!404077 (MissingZero!7127 (index!30878 lt!319789)))))

(declare-fun b!720430 () Bool)

(assert (=> b!720430 (= e!404078 (Found!7127 (index!30878 lt!319789)))))

(declare-fun d!99125 () Bool)

(declare-fun lt!319790 () SeekEntryResult!7127)

(assert (=> d!99125 (and (or (is-Undefined!7127 lt!319790) (not (is-Found!7127 lt!319790)) (and (bvsge (index!30877 lt!319790) #b00000000000000000000000000000000) (bvslt (index!30877 lt!319790) (size!19948 a!3186)))) (or (is-Undefined!7127 lt!319790) (is-Found!7127 lt!319790) (not (is-MissingZero!7127 lt!319790)) (and (bvsge (index!30876 lt!319790) #b00000000000000000000000000000000) (bvslt (index!30876 lt!319790) (size!19948 a!3186)))) (or (is-Undefined!7127 lt!319790) (is-Found!7127 lt!319790) (is-MissingZero!7127 lt!319790) (not (is-MissingVacant!7127 lt!319790)) (and (bvsge (index!30879 lt!319790) #b00000000000000000000000000000000) (bvslt (index!30879 lt!319790) (size!19948 a!3186)))) (or (is-Undefined!7127 lt!319790) (ite (is-Found!7127 lt!319790) (= (select (arr!19527 a!3186) (index!30877 lt!319790)) k!2102) (ite (is-MissingZero!7127 lt!319790) (= (select (arr!19527 a!3186) (index!30876 lt!319790)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7127 lt!319790) (= (select (arr!19527 a!3186) (index!30879 lt!319790)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99125 (= lt!319790 e!404076)))

(declare-fun c!79245 () Bool)

(assert (=> d!99125 (= c!79245 (and (is-Intermediate!7127 lt!319789) (undefined!7939 lt!319789)))))

(assert (=> d!99125 (= lt!319789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!99125 (validMask!0 mask!3328)))

(assert (=> d!99125 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!319790)))

(declare-fun b!720433 () Bool)

(assert (=> b!720433 (= e!404077 (seekKeyOrZeroReturnVacant!0 (x!61878 lt!319789) (index!30878 lt!319789) (index!30878 lt!319789) k!2102 a!3186 mask!3328))))

(declare-fun b!720434 () Bool)

(assert (=> b!720434 (= e!404076 e!404078)))

(assert (=> b!720434 (= lt!319788 (select (arr!19527 a!3186) (index!30878 lt!319789)))))

(declare-fun c!79243 () Bool)

(assert (=> b!720434 (= c!79243 (= lt!319788 k!2102))))

(assert (= (and d!99125 c!79245) b!720429))

(assert (= (and d!99125 (not c!79245)) b!720434))

(assert (= (and b!720434 c!79243) b!720430))

(assert (= (and b!720434 (not c!79243)) b!720431))

(assert (= (and b!720431 c!79244) b!720432))

(assert (= (and b!720431 (not c!79244)) b!720433))

(declare-fun m!675569 () Bool)

(assert (=> d!99125 m!675569))

(declare-fun m!675571 () Bool)

(assert (=> d!99125 m!675571))

(declare-fun m!675573 () Bool)

(assert (=> d!99125 m!675573))

(declare-fun m!675575 () Bool)

(assert (=> d!99125 m!675575))

(assert (=> d!99125 m!675571))

(declare-fun m!675577 () Bool)

(assert (=> d!99125 m!675577))

(assert (=> d!99125 m!675439))

(declare-fun m!675579 () Bool)

(assert (=> b!720433 m!675579))

(declare-fun m!675581 () Bool)

(assert (=> b!720434 m!675581))

(assert (=> b!720176 d!99125))

(declare-fun d!99143 () Bool)

(assert (=> d!99143 (= (validKeyInArray!0 (select (arr!19527 a!3186) j!159)) (and (not (= (select (arr!19527 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19527 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!720187 d!99143))

(declare-fun b!720476 () Bool)

(declare-fun e!404106 () Bool)

(declare-fun e!404107 () Bool)

(assert (=> b!720476 (= e!404106 e!404107)))

(declare-fun res!482692 () Bool)

(assert (=> b!720476 (=> (not res!482692) (not e!404107))))

(declare-fun e!404105 () Bool)

(assert (=> b!720476 (= res!482692 (not e!404105))))

(declare-fun res!482693 () Bool)

(assert (=> b!720476 (=> (not res!482693) (not e!404105))))

(assert (=> b!720476 (= res!482693 (validKeyInArray!0 (select (arr!19527 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!720478 () Bool)

(declare-fun e!404104 () Bool)

(declare-fun call!34764 () Bool)

(assert (=> b!720478 (= e!404104 call!34764)))

(declare-fun b!720479 () Bool)

(assert (=> b!720479 (= e!404104 call!34764)))

(declare-fun bm!34761 () Bool)

(declare-fun c!79261 () Bool)

(assert (=> bm!34761 (= call!34764 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79261 (Cons!13525 (select (arr!19527 a!3186) #b00000000000000000000000000000000) Nil!13526) Nil!13526)))))

(declare-fun b!720480 () Bool)

(declare-fun contains!4042 (List!13529 (_ BitVec 64)) Bool)

(assert (=> b!720480 (= e!404105 (contains!4042 Nil!13526 (select (arr!19527 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99145 () Bool)

(declare-fun res!482694 () Bool)

(assert (=> d!99145 (=> res!482694 e!404106)))

(assert (=> d!99145 (= res!482694 (bvsge #b00000000000000000000000000000000 (size!19948 a!3186)))))

(assert (=> d!99145 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13526) e!404106)))

(declare-fun b!720477 () Bool)

(assert (=> b!720477 (= e!404107 e!404104)))

(assert (=> b!720477 (= c!79261 (validKeyInArray!0 (select (arr!19527 a!3186) 