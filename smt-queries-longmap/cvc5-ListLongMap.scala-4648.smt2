; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64660 () Bool)

(assert start!64660)

(declare-fun b!728578 () Bool)

(declare-fun res!489088 () Bool)

(declare-fun e!407838 () Bool)

(assert (=> b!728578 (=> (not res!489088) (not e!407838))))

(declare-datatypes ((array!41109 0))(
  ( (array!41110 (arr!19674 (Array (_ BitVec 32) (_ BitVec 64))) (size!20095 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41109)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728578 (= res!489088 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728579 () Bool)

(declare-fun e!407840 () Bool)

(declare-fun e!407839 () Bool)

(assert (=> b!728579 (= e!407840 (not e!407839))))

(declare-fun res!489086 () Bool)

(assert (=> b!728579 (=> res!489086 e!407839)))

(declare-datatypes ((SeekEntryResult!7274 0))(
  ( (MissingZero!7274 (index!31464 (_ BitVec 32))) (Found!7274 (index!31465 (_ BitVec 32))) (Intermediate!7274 (undefined!8086 Bool) (index!31466 (_ BitVec 32)) (x!62456 (_ BitVec 32))) (Undefined!7274) (MissingVacant!7274 (index!31467 (_ BitVec 32))) )
))
(declare-fun lt!322738 () SeekEntryResult!7274)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!728579 (= res!489086 (or (not (is-Intermediate!7274 lt!322738)) (bvsge x!1131 (x!62456 lt!322738))))))

(declare-fun e!407834 () Bool)

(assert (=> b!728579 e!407834))

(declare-fun res!489082 () Bool)

(assert (=> b!728579 (=> (not res!489082) (not e!407834))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41109 (_ BitVec 32)) Bool)

(assert (=> b!728579 (= res!489082 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24866 0))(
  ( (Unit!24867) )
))
(declare-fun lt!322735 () Unit!24866)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24866)

(assert (=> b!728579 (= lt!322735 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728580 () Bool)

(declare-fun res!489090 () Bool)

(assert (=> b!728580 (=> (not res!489090) (not e!407838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728580 (= res!489090 (validKeyInArray!0 k!2102))))

(declare-fun lt!322732 () SeekEntryResult!7274)

(declare-fun e!407836 () Bool)

(declare-fun b!728581 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41109 (_ BitVec 32)) SeekEntryResult!7274)

(assert (=> b!728581 (= e!407836 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19674 a!3186) j!159) a!3186 mask!3328) lt!322732))))

(declare-fun b!728582 () Bool)

(declare-fun res!489083 () Bool)

(assert (=> b!728582 (=> (not res!489083) (not e!407838))))

(assert (=> b!728582 (= res!489083 (validKeyInArray!0 (select (arr!19674 a!3186) j!159)))))

(declare-fun b!728583 () Bool)

(assert (=> b!728583 (= e!407839 true)))

(declare-fun lt!322733 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728583 (= lt!322733 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728584 () Bool)

(declare-fun res!489091 () Bool)

(assert (=> b!728584 (=> (not res!489091) (not e!407838))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728584 (= res!489091 (and (= (size!20095 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20095 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20095 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728585 () Bool)

(declare-fun res!489079 () Bool)

(declare-fun e!407837 () Bool)

(assert (=> b!728585 (=> (not res!489079) (not e!407837))))

(assert (=> b!728585 (= res!489079 e!407836)))

(declare-fun c!80125 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728585 (= c!80125 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728586 () Bool)

(declare-fun e!407833 () Bool)

(assert (=> b!728586 (= e!407834 e!407833)))

(declare-fun res!489077 () Bool)

(assert (=> b!728586 (=> (not res!489077) (not e!407833))))

(declare-fun lt!322739 () SeekEntryResult!7274)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41109 (_ BitVec 32)) SeekEntryResult!7274)

(assert (=> b!728586 (= res!489077 (= (seekEntryOrOpen!0 (select (arr!19674 a!3186) j!159) a!3186 mask!3328) lt!322739))))

(assert (=> b!728586 (= lt!322739 (Found!7274 j!159))))

(declare-fun b!728587 () Bool)

(declare-fun res!489085 () Bool)

(declare-fun e!407835 () Bool)

(assert (=> b!728587 (=> (not res!489085) (not e!407835))))

(assert (=> b!728587 (= res!489085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!728588 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41109 (_ BitVec 32)) SeekEntryResult!7274)

(assert (=> b!728588 (= e!407836 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19674 a!3186) j!159) a!3186 mask!3328) (Found!7274 j!159)))))

(declare-fun b!728589 () Bool)

(declare-fun res!489087 () Bool)

(assert (=> b!728589 (=> (not res!489087) (not e!407837))))

(assert (=> b!728589 (= res!489087 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19674 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728590 () Bool)

(assert (=> b!728590 (= e!407837 e!407840)))

(declare-fun res!489080 () Bool)

(assert (=> b!728590 (=> (not res!489080) (not e!407840))))

(declare-fun lt!322731 () SeekEntryResult!7274)

(assert (=> b!728590 (= res!489080 (= lt!322731 lt!322738))))

(declare-fun lt!322737 () (_ BitVec 64))

(declare-fun lt!322734 () array!41109)

(assert (=> b!728590 (= lt!322738 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322737 lt!322734 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728590 (= lt!322731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322737 mask!3328) lt!322737 lt!322734 mask!3328))))

(assert (=> b!728590 (= lt!322737 (select (store (arr!19674 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!728590 (= lt!322734 (array!41110 (store (arr!19674 a!3186) i!1173 k!2102) (size!20095 a!3186)))))

(declare-fun b!728591 () Bool)

(assert (=> b!728591 (= e!407838 e!407835)))

(declare-fun res!489081 () Bool)

(assert (=> b!728591 (=> (not res!489081) (not e!407835))))

(declare-fun lt!322736 () SeekEntryResult!7274)

(assert (=> b!728591 (= res!489081 (or (= lt!322736 (MissingZero!7274 i!1173)) (= lt!322736 (MissingVacant!7274 i!1173))))))

(assert (=> b!728591 (= lt!322736 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!728592 () Bool)

(declare-fun res!489078 () Bool)

(assert (=> b!728592 (=> (not res!489078) (not e!407835))))

(declare-datatypes ((List!13676 0))(
  ( (Nil!13673) (Cons!13672 (h!14732 (_ BitVec 64)) (t!19991 List!13676)) )
))
(declare-fun arrayNoDuplicates!0 (array!41109 (_ BitVec 32) List!13676) Bool)

(assert (=> b!728592 (= res!489078 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13673))))

(declare-fun b!728593 () Bool)

(assert (=> b!728593 (= e!407833 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19674 a!3186) j!159) a!3186 mask!3328) lt!322739))))

(declare-fun b!728595 () Bool)

(assert (=> b!728595 (= e!407835 e!407837)))

(declare-fun res!489092 () Bool)

(assert (=> b!728595 (=> (not res!489092) (not e!407837))))

(assert (=> b!728595 (= res!489092 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19674 a!3186) j!159) mask!3328) (select (arr!19674 a!3186) j!159) a!3186 mask!3328) lt!322732))))

(assert (=> b!728595 (= lt!322732 (Intermediate!7274 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!489084 () Bool)

(assert (=> start!64660 (=> (not res!489084) (not e!407838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64660 (= res!489084 (validMask!0 mask!3328))))

(assert (=> start!64660 e!407838))

(assert (=> start!64660 true))

(declare-fun array_inv!15470 (array!41109) Bool)

(assert (=> start!64660 (array_inv!15470 a!3186)))

(declare-fun b!728594 () Bool)

(declare-fun res!489089 () Bool)

(assert (=> b!728594 (=> (not res!489089) (not e!407835))))

(assert (=> b!728594 (= res!489089 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20095 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20095 a!3186))))))

(assert (= (and start!64660 res!489084) b!728584))

(assert (= (and b!728584 res!489091) b!728582))

(assert (= (and b!728582 res!489083) b!728580))

(assert (= (and b!728580 res!489090) b!728578))

(assert (= (and b!728578 res!489088) b!728591))

(assert (= (and b!728591 res!489081) b!728587))

(assert (= (and b!728587 res!489085) b!728592))

(assert (= (and b!728592 res!489078) b!728594))

(assert (= (and b!728594 res!489089) b!728595))

(assert (= (and b!728595 res!489092) b!728589))

(assert (= (and b!728589 res!489087) b!728585))

(assert (= (and b!728585 c!80125) b!728581))

(assert (= (and b!728585 (not c!80125)) b!728588))

(assert (= (and b!728585 res!489079) b!728590))

(assert (= (and b!728590 res!489080) b!728579))

(assert (= (and b!728579 res!489082) b!728586))

(assert (= (and b!728586 res!489077) b!728593))

(assert (= (and b!728579 (not res!489086)) b!728583))

(declare-fun m!682315 () Bool)

(assert (=> b!728586 m!682315))

(assert (=> b!728586 m!682315))

(declare-fun m!682317 () Bool)

(assert (=> b!728586 m!682317))

(declare-fun m!682319 () Bool)

(assert (=> b!728590 m!682319))

(declare-fun m!682321 () Bool)

(assert (=> b!728590 m!682321))

(declare-fun m!682323 () Bool)

(assert (=> b!728590 m!682323))

(assert (=> b!728590 m!682319))

(declare-fun m!682325 () Bool)

(assert (=> b!728590 m!682325))

(declare-fun m!682327 () Bool)

(assert (=> b!728590 m!682327))

(declare-fun m!682329 () Bool)

(assert (=> b!728579 m!682329))

(declare-fun m!682331 () Bool)

(assert (=> b!728579 m!682331))

(assert (=> b!728593 m!682315))

(assert (=> b!728593 m!682315))

(declare-fun m!682333 () Bool)

(assert (=> b!728593 m!682333))

(assert (=> b!728595 m!682315))

(assert (=> b!728595 m!682315))

(declare-fun m!682335 () Bool)

(assert (=> b!728595 m!682335))

(assert (=> b!728595 m!682335))

(assert (=> b!728595 m!682315))

(declare-fun m!682337 () Bool)

(assert (=> b!728595 m!682337))

(declare-fun m!682339 () Bool)

(assert (=> b!728583 m!682339))

(declare-fun m!682341 () Bool)

(assert (=> b!728578 m!682341))

(declare-fun m!682343 () Bool)

(assert (=> b!728591 m!682343))

(declare-fun m!682345 () Bool)

(assert (=> b!728587 m!682345))

(assert (=> b!728582 m!682315))

(assert (=> b!728582 m!682315))

(declare-fun m!682347 () Bool)

(assert (=> b!728582 m!682347))

(declare-fun m!682349 () Bool)

(assert (=> b!728589 m!682349))

(declare-fun m!682351 () Bool)

(assert (=> b!728580 m!682351))

(assert (=> b!728588 m!682315))

(assert (=> b!728588 m!682315))

(declare-fun m!682353 () Bool)

(assert (=> b!728588 m!682353))

(declare-fun m!682355 () Bool)

(assert (=> start!64660 m!682355))

(declare-fun m!682357 () Bool)

(assert (=> start!64660 m!682357))

(assert (=> b!728581 m!682315))

(assert (=> b!728581 m!682315))

(declare-fun m!682359 () Bool)

(assert (=> b!728581 m!682359))

(declare-fun m!682361 () Bool)

(assert (=> b!728592 m!682361))

(push 1)

