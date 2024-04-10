; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64312 () Bool)

(assert start!64312)

(declare-fun b!722561 () Bool)

(declare-fun res!484259 () Bool)

(declare-fun e!404973 () Bool)

(assert (=> b!722561 (=> (not res!484259) (not e!404973))))

(declare-datatypes ((array!40893 0))(
  ( (array!40894 (arr!19569 (Array (_ BitVec 32) (_ BitVec 64))) (size!19990 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40893)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!722561 (= res!484259 (and (= (size!19990 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19990 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19990 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722562 () Bool)

(declare-fun res!484264 () Bool)

(declare-fun e!404974 () Bool)

(assert (=> b!722562 (=> (not res!484264) (not e!404974))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722562 (= res!484264 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19990 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19990 a!3186))))))

(declare-fun b!722563 () Bool)

(declare-fun e!404971 () Bool)

(assert (=> b!722563 (= e!404974 e!404971)))

(declare-fun res!484262 () Bool)

(assert (=> b!722563 (=> (not res!484262) (not e!404971))))

(declare-datatypes ((SeekEntryResult!7169 0))(
  ( (MissingZero!7169 (index!31044 (_ BitVec 32))) (Found!7169 (index!31045 (_ BitVec 32))) (Intermediate!7169 (undefined!7981 Bool) (index!31046 (_ BitVec 32)) (x!62050 (_ BitVec 32))) (Undefined!7169) (MissingVacant!7169 (index!31047 (_ BitVec 32))) )
))
(declare-fun lt!320336 () SeekEntryResult!7169)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40893 (_ BitVec 32)) SeekEntryResult!7169)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722563 (= res!484262 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19569 a!3186) j!159) mask!3328) (select (arr!19569 a!3186) j!159) a!3186 mask!3328) lt!320336))))

(assert (=> b!722563 (= lt!320336 (Intermediate!7169 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722564 () Bool)

(assert (=> b!722564 (= e!404973 e!404974)))

(declare-fun res!484256 () Bool)

(assert (=> b!722564 (=> (not res!484256) (not e!404974))))

(declare-fun lt!320332 () SeekEntryResult!7169)

(assert (=> b!722564 (= res!484256 (or (= lt!320332 (MissingZero!7169 i!1173)) (= lt!320332 (MissingVacant!7169 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40893 (_ BitVec 32)) SeekEntryResult!7169)

(assert (=> b!722564 (= lt!320332 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!722565 () Bool)

(declare-fun res!484257 () Bool)

(assert (=> b!722565 (=> (not res!484257) (not e!404973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722565 (= res!484257 (validKeyInArray!0 (select (arr!19569 a!3186) j!159)))))

(declare-fun b!722566 () Bool)

(declare-fun res!484261 () Bool)

(assert (=> b!722566 (=> (not res!484261) (not e!404974))))

(declare-datatypes ((List!13571 0))(
  ( (Nil!13568) (Cons!13567 (h!14621 (_ BitVec 64)) (t!19886 List!13571)) )
))
(declare-fun arrayNoDuplicates!0 (array!40893 (_ BitVec 32) List!13571) Bool)

(assert (=> b!722566 (= res!484261 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13568))))

(declare-fun b!722567 () Bool)

(declare-fun e!404975 () Bool)

(assert (=> b!722567 (= e!404975 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19569 a!3186) j!159) a!3186 mask!3328) lt!320336))))

(declare-fun b!722569 () Bool)

(declare-fun res!484265 () Bool)

(assert (=> b!722569 (=> (not res!484265) (not e!404973))))

(declare-fun arrayContainsKey!0 (array!40893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722569 (= res!484265 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722570 () Bool)

(declare-fun res!484260 () Bool)

(assert (=> b!722570 (=> (not res!484260) (not e!404971))))

(assert (=> b!722570 (= res!484260 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19569 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!484255 () Bool)

(assert (=> start!64312 (=> (not res!484255) (not e!404973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64312 (= res!484255 (validMask!0 mask!3328))))

(assert (=> start!64312 e!404973))

(assert (=> start!64312 true))

(declare-fun array_inv!15365 (array!40893) Bool)

(assert (=> start!64312 (array_inv!15365 a!3186)))

(declare-fun b!722568 () Bool)

(declare-fun res!484263 () Bool)

(assert (=> b!722568 (=> (not res!484263) (not e!404971))))

(assert (=> b!722568 (= res!484263 e!404975)))

(declare-fun c!79525 () Bool)

(assert (=> b!722568 (= c!79525 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722571 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40893 (_ BitVec 32)) SeekEntryResult!7169)

(assert (=> b!722571 (= e!404975 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19569 a!3186) j!159) a!3186 mask!3328) (Found!7169 j!159)))))

(declare-fun b!722572 () Bool)

(declare-fun res!484258 () Bool)

(assert (=> b!722572 (=> (not res!484258) (not e!404973))))

(assert (=> b!722572 (= res!484258 (validKeyInArray!0 k!2102))))

(declare-fun b!722573 () Bool)

(assert (=> b!722573 (= e!404971 false)))

(declare-fun lt!320335 () SeekEntryResult!7169)

(declare-fun lt!320331 () array!40893)

(declare-fun lt!320334 () (_ BitVec 64))

(assert (=> b!722573 (= lt!320335 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320334 lt!320331 mask!3328))))

(declare-fun lt!320333 () SeekEntryResult!7169)

(assert (=> b!722573 (= lt!320333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320334 mask!3328) lt!320334 lt!320331 mask!3328))))

(assert (=> b!722573 (= lt!320334 (select (store (arr!19569 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!722573 (= lt!320331 (array!40894 (store (arr!19569 a!3186) i!1173 k!2102) (size!19990 a!3186)))))

(declare-fun b!722574 () Bool)

(declare-fun res!484254 () Bool)

(assert (=> b!722574 (=> (not res!484254) (not e!404974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40893 (_ BitVec 32)) Bool)

(assert (=> b!722574 (= res!484254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64312 res!484255) b!722561))

(assert (= (and b!722561 res!484259) b!722565))

(assert (= (and b!722565 res!484257) b!722572))

(assert (= (and b!722572 res!484258) b!722569))

(assert (= (and b!722569 res!484265) b!722564))

(assert (= (and b!722564 res!484256) b!722574))

(assert (= (and b!722574 res!484254) b!722566))

(assert (= (and b!722566 res!484261) b!722562))

(assert (= (and b!722562 res!484264) b!722563))

(assert (= (and b!722563 res!484262) b!722570))

(assert (= (and b!722570 res!484260) b!722568))

(assert (= (and b!722568 c!79525) b!722567))

(assert (= (and b!722568 (not c!79525)) b!722571))

(assert (= (and b!722568 res!484263) b!722573))

(declare-fun m!677077 () Bool)

(assert (=> b!722571 m!677077))

(assert (=> b!722571 m!677077))

(declare-fun m!677079 () Bool)

(assert (=> b!722571 m!677079))

(declare-fun m!677081 () Bool)

(assert (=> b!722569 m!677081))

(declare-fun m!677083 () Bool)

(assert (=> b!722570 m!677083))

(assert (=> b!722567 m!677077))

(assert (=> b!722567 m!677077))

(declare-fun m!677085 () Bool)

(assert (=> b!722567 m!677085))

(assert (=> b!722565 m!677077))

(assert (=> b!722565 m!677077))

(declare-fun m!677087 () Bool)

(assert (=> b!722565 m!677087))

(declare-fun m!677089 () Bool)

(assert (=> b!722572 m!677089))

(declare-fun m!677091 () Bool)

(assert (=> start!64312 m!677091))

(declare-fun m!677093 () Bool)

(assert (=> start!64312 m!677093))

(declare-fun m!677095 () Bool)

(assert (=> b!722573 m!677095))

(declare-fun m!677097 () Bool)

(assert (=> b!722573 m!677097))

(assert (=> b!722573 m!677095))

(declare-fun m!677099 () Bool)

(assert (=> b!722573 m!677099))

(declare-fun m!677101 () Bool)

(assert (=> b!722573 m!677101))

(declare-fun m!677103 () Bool)

(assert (=> b!722573 m!677103))

(declare-fun m!677105 () Bool)

(assert (=> b!722564 m!677105))

(declare-fun m!677107 () Bool)

(assert (=> b!722574 m!677107))

(declare-fun m!677109 () Bool)

(assert (=> b!722566 m!677109))

(assert (=> b!722563 m!677077))

(assert (=> b!722563 m!677077))

(declare-fun m!677111 () Bool)

(assert (=> b!722563 m!677111))

(assert (=> b!722563 m!677111))

(assert (=> b!722563 m!677077))

(declare-fun m!677113 () Bool)

(assert (=> b!722563 m!677113))

(push 1)

