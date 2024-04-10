; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64102 () Bool)

(assert start!64102)

(declare-fun b!720050 () Bool)

(declare-fun res!482441 () Bool)

(declare-fun e!403901 () Bool)

(assert (=> b!720050 (=> (not res!482441) (not e!403901))))

(declare-datatypes ((array!40797 0))(
  ( (array!40798 (arr!19524 (Array (_ BitVec 32) (_ BitVec 64))) (size!19945 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40797)

(declare-datatypes ((List!13526 0))(
  ( (Nil!13523) (Cons!13522 (h!14570 (_ BitVec 64)) (t!19841 List!13526)) )
))
(declare-fun arrayNoDuplicates!0 (array!40797 (_ BitVec 32) List!13526) Bool)

(assert (=> b!720050 (= res!482441 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13523))))

(declare-fun b!720051 () Bool)

(declare-fun res!482447 () Bool)

(declare-fun e!403897 () Bool)

(assert (=> b!720051 (=> (not res!482447) (not e!403897))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720051 (= res!482447 (validKeyInArray!0 k!2102))))

(declare-fun b!720052 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7124 0))(
  ( (MissingZero!7124 (index!30864 (_ BitVec 32))) (Found!7124 (index!30865 (_ BitVec 32))) (Intermediate!7124 (undefined!7936 Bool) (index!30866 (_ BitVec 32)) (x!61867 (_ BitVec 32))) (Undefined!7124) (MissingVacant!7124 (index!30867 (_ BitVec 32))) )
))
(declare-fun lt!319703 () SeekEntryResult!7124)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!403900 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40797 (_ BitVec 32)) SeekEntryResult!7124)

(assert (=> b!720052 (= e!403900 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19524 a!3186) j!159) a!3186 mask!3328) lt!319703))))

(declare-fun b!720053 () Bool)

(declare-fun e!403898 () Bool)

(assert (=> b!720053 (= e!403901 e!403898)))

(declare-fun res!482448 () Bool)

(assert (=> b!720053 (=> (not res!482448) (not e!403898))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720053 (= res!482448 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19524 a!3186) j!159) mask!3328) (select (arr!19524 a!3186) j!159) a!3186 mask!3328) lt!319703))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720053 (= lt!319703 (Intermediate!7124 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!482442 () Bool)

(assert (=> start!64102 (=> (not res!482442) (not e!403897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64102 (= res!482442 (validMask!0 mask!3328))))

(assert (=> start!64102 e!403897))

(assert (=> start!64102 true))

(declare-fun array_inv!15320 (array!40797) Bool)

(assert (=> start!64102 (array_inv!15320 a!3186)))

(declare-fun b!720054 () Bool)

(declare-fun res!482444 () Bool)

(assert (=> b!720054 (=> (not res!482444) (not e!403897))))

(assert (=> b!720054 (= res!482444 (validKeyInArray!0 (select (arr!19524 a!3186) j!159)))))

(declare-fun b!720055 () Bool)

(declare-fun res!482443 () Bool)

(assert (=> b!720055 (=> (not res!482443) (not e!403898))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720055 (= res!482443 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19524 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720056 () Bool)

(declare-fun res!482449 () Bool)

(assert (=> b!720056 (=> (not res!482449) (not e!403897))))

(assert (=> b!720056 (= res!482449 (and (= (size!19945 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19945 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19945 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720057 () Bool)

(assert (=> b!720057 (= e!403898 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!720058 () Bool)

(declare-fun res!482445 () Bool)

(assert (=> b!720058 (=> (not res!482445) (not e!403898))))

(assert (=> b!720058 (= res!482445 e!403900)))

(declare-fun c!79174 () Bool)

(assert (=> b!720058 (= c!79174 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720059 () Bool)

(declare-fun res!482440 () Bool)

(assert (=> b!720059 (=> (not res!482440) (not e!403901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40797 (_ BitVec 32)) Bool)

(assert (=> b!720059 (= res!482440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720060 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40797 (_ BitVec 32)) SeekEntryResult!7124)

(assert (=> b!720060 (= e!403900 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19524 a!3186) j!159) a!3186 mask!3328) (Found!7124 j!159)))))

(declare-fun b!720061 () Bool)

(declare-fun res!482446 () Bool)

(assert (=> b!720061 (=> (not res!482446) (not e!403897))))

(declare-fun arrayContainsKey!0 (array!40797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720061 (= res!482446 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720062 () Bool)

(assert (=> b!720062 (= e!403897 e!403901)))

(declare-fun res!482439 () Bool)

(assert (=> b!720062 (=> (not res!482439) (not e!403901))))

(declare-fun lt!319702 () SeekEntryResult!7124)

(assert (=> b!720062 (= res!482439 (or (= lt!319702 (MissingZero!7124 i!1173)) (= lt!319702 (MissingVacant!7124 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40797 (_ BitVec 32)) SeekEntryResult!7124)

(assert (=> b!720062 (= lt!319702 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!720063 () Bool)

(declare-fun res!482450 () Bool)

(assert (=> b!720063 (=> (not res!482450) (not e!403901))))

(assert (=> b!720063 (= res!482450 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19945 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19945 a!3186))))))

(assert (= (and start!64102 res!482442) b!720056))

(assert (= (and b!720056 res!482449) b!720054))

(assert (= (and b!720054 res!482444) b!720051))

(assert (= (and b!720051 res!482447) b!720061))

(assert (= (and b!720061 res!482446) b!720062))

(assert (= (and b!720062 res!482439) b!720059))

(assert (= (and b!720059 res!482440) b!720050))

(assert (= (and b!720050 res!482441) b!720063))

(assert (= (and b!720063 res!482450) b!720053))

(assert (= (and b!720053 res!482448) b!720055))

(assert (= (and b!720055 res!482443) b!720058))

(assert (= (and b!720058 c!79174) b!720052))

(assert (= (and b!720058 (not c!79174)) b!720060))

(assert (= (and b!720058 res!482445) b!720057))

(declare-fun m!675331 () Bool)

(assert (=> b!720062 m!675331))

(declare-fun m!675333 () Bool)

(assert (=> b!720060 m!675333))

(assert (=> b!720060 m!675333))

(declare-fun m!675335 () Bool)

(assert (=> b!720060 m!675335))

(declare-fun m!675337 () Bool)

(assert (=> b!720055 m!675337))

(declare-fun m!675339 () Bool)

(assert (=> b!720059 m!675339))

(assert (=> b!720052 m!675333))

(assert (=> b!720052 m!675333))

(declare-fun m!675341 () Bool)

(assert (=> b!720052 m!675341))

(assert (=> b!720054 m!675333))

(assert (=> b!720054 m!675333))

(declare-fun m!675343 () Bool)

(assert (=> b!720054 m!675343))

(declare-fun m!675345 () Bool)

(assert (=> start!64102 m!675345))

(declare-fun m!675347 () Bool)

(assert (=> start!64102 m!675347))

(declare-fun m!675349 () Bool)

(assert (=> b!720050 m!675349))

(declare-fun m!675351 () Bool)

(assert (=> b!720061 m!675351))

(declare-fun m!675353 () Bool)

(assert (=> b!720051 m!675353))

(assert (=> b!720053 m!675333))

(assert (=> b!720053 m!675333))

(declare-fun m!675355 () Bool)

(assert (=> b!720053 m!675355))

(assert (=> b!720053 m!675355))

(assert (=> b!720053 m!675333))

(declare-fun m!675357 () Bool)

(assert (=> b!720053 m!675357))

(push 1)

