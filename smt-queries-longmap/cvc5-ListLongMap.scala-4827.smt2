; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66302 () Bool)

(assert start!66302)

(declare-datatypes ((array!42207 0))(
  ( (array!42208 (arr!20211 (Array (_ BitVec 32) (_ BitVec 64))) (size!20632 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42207)

(declare-fun b!764274 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7811 0))(
  ( (MissingZero!7811 (index!33612 (_ BitVec 32))) (Found!7811 (index!33613 (_ BitVec 32))) (Intermediate!7811 (undefined!8623 Bool) (index!33614 (_ BitVec 32)) (x!64511 (_ BitVec 32))) (Undefined!7811) (MissingVacant!7811 (index!33615 (_ BitVec 32))) )
))
(declare-fun lt!340102 () SeekEntryResult!7811)

(declare-fun e!425684 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42207 (_ BitVec 32)) SeekEntryResult!7811)

(assert (=> b!764274 (= e!425684 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20211 a!3186) j!159) a!3186 mask!3328) lt!340102))))

(declare-fun res!517135 () Bool)

(declare-fun e!425681 () Bool)

(assert (=> start!66302 (=> (not res!517135) (not e!425681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66302 (= res!517135 (validMask!0 mask!3328))))

(assert (=> start!66302 e!425681))

(assert (=> start!66302 true))

(declare-fun array_inv!16007 (array!42207) Bool)

(assert (=> start!66302 (array_inv!16007 a!3186)))

(declare-fun b!764275 () Bool)

(declare-fun e!425685 () Bool)

(assert (=> b!764275 (= e!425681 e!425685)))

(declare-fun res!517134 () Bool)

(assert (=> b!764275 (=> (not res!517134) (not e!425685))))

(declare-fun lt!340104 () SeekEntryResult!7811)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764275 (= res!517134 (or (= lt!340104 (MissingZero!7811 i!1173)) (= lt!340104 (MissingVacant!7811 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42207 (_ BitVec 32)) SeekEntryResult!7811)

(assert (=> b!764275 (= lt!340104 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!764276 () Bool)

(declare-fun res!517136 () Bool)

(assert (=> b!764276 (=> (not res!517136) (not e!425681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764276 (= res!517136 (validKeyInArray!0 (select (arr!20211 a!3186) j!159)))))

(declare-fun b!764277 () Bool)

(declare-fun res!517137 () Bool)

(declare-fun e!425682 () Bool)

(assert (=> b!764277 (=> (not res!517137) (not e!425682))))

(assert (=> b!764277 (= res!517137 e!425684)))

(declare-fun c!83959 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764277 (= c!83959 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!764278 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42207 (_ BitVec 32)) SeekEntryResult!7811)

(assert (=> b!764278 (= e!425684 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20211 a!3186) j!159) a!3186 mask!3328) (Found!7811 j!159)))))

(declare-fun b!764279 () Bool)

(declare-fun res!517140 () Bool)

(assert (=> b!764279 (=> (not res!517140) (not e!425685))))

(declare-datatypes ((List!14213 0))(
  ( (Nil!14210) (Cons!14209 (h!15293 (_ BitVec 64)) (t!20528 List!14213)) )
))
(declare-fun arrayNoDuplicates!0 (array!42207 (_ BitVec 32) List!14213) Bool)

(assert (=> b!764279 (= res!517140 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14210))))

(declare-fun b!764280 () Bool)

(declare-fun e!425680 () Bool)

(assert (=> b!764280 (= e!425682 e!425680)))

(declare-fun res!517133 () Bool)

(assert (=> b!764280 (=> (not res!517133) (not e!425680))))

(declare-fun lt!340103 () array!42207)

(declare-fun lt!340106 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764280 (= res!517133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340106 mask!3328) lt!340106 lt!340103 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340106 lt!340103 mask!3328)))))

(assert (=> b!764280 (= lt!340106 (select (store (arr!20211 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!764280 (= lt!340103 (array!42208 (store (arr!20211 a!3186) i!1173 k!2102) (size!20632 a!3186)))))

(declare-fun b!764281 () Bool)

(assert (=> b!764281 (= e!425680 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42207 (_ BitVec 32)) Bool)

(assert (=> b!764281 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26348 0))(
  ( (Unit!26349) )
))
(declare-fun lt!340105 () Unit!26348)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26348)

(assert (=> b!764281 (= lt!340105 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!764282 () Bool)

(declare-fun res!517129 () Bool)

(assert (=> b!764282 (=> (not res!517129) (not e!425681))))

(declare-fun arrayContainsKey!0 (array!42207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764282 (= res!517129 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764283 () Bool)

(declare-fun res!517131 () Bool)

(assert (=> b!764283 (=> (not res!517131) (not e!425682))))

(assert (=> b!764283 (= res!517131 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20211 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764284 () Bool)

(declare-fun res!517141 () Bool)

(assert (=> b!764284 (=> (not res!517141) (not e!425685))))

(assert (=> b!764284 (= res!517141 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20632 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20632 a!3186))))))

(declare-fun b!764285 () Bool)

(declare-fun res!517139 () Bool)

(assert (=> b!764285 (=> (not res!517139) (not e!425685))))

(assert (=> b!764285 (= res!517139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764286 () Bool)

(declare-fun res!517132 () Bool)

(assert (=> b!764286 (=> (not res!517132) (not e!425681))))

(assert (=> b!764286 (= res!517132 (validKeyInArray!0 k!2102))))

(declare-fun b!764287 () Bool)

(declare-fun res!517130 () Bool)

(assert (=> b!764287 (=> (not res!517130) (not e!425681))))

(assert (=> b!764287 (= res!517130 (and (= (size!20632 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20632 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20632 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764288 () Bool)

(assert (=> b!764288 (= e!425685 e!425682)))

(declare-fun res!517138 () Bool)

(assert (=> b!764288 (=> (not res!517138) (not e!425682))))

(assert (=> b!764288 (= res!517138 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20211 a!3186) j!159) mask!3328) (select (arr!20211 a!3186) j!159) a!3186 mask!3328) lt!340102))))

(assert (=> b!764288 (= lt!340102 (Intermediate!7811 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66302 res!517135) b!764287))

(assert (= (and b!764287 res!517130) b!764276))

(assert (= (and b!764276 res!517136) b!764286))

(assert (= (and b!764286 res!517132) b!764282))

(assert (= (and b!764282 res!517129) b!764275))

(assert (= (and b!764275 res!517134) b!764285))

(assert (= (and b!764285 res!517139) b!764279))

(assert (= (and b!764279 res!517140) b!764284))

(assert (= (and b!764284 res!517141) b!764288))

(assert (= (and b!764288 res!517138) b!764283))

(assert (= (and b!764283 res!517131) b!764277))

(assert (= (and b!764277 c!83959) b!764274))

(assert (= (and b!764277 (not c!83959)) b!764278))

(assert (= (and b!764277 res!517137) b!764280))

(assert (= (and b!764280 res!517133) b!764281))

(declare-fun m!710655 () Bool)

(assert (=> b!764282 m!710655))

(declare-fun m!710657 () Bool)

(assert (=> b!764281 m!710657))

(declare-fun m!710659 () Bool)

(assert (=> b!764281 m!710659))

(declare-fun m!710661 () Bool)

(assert (=> b!764275 m!710661))

(declare-fun m!710663 () Bool)

(assert (=> b!764279 m!710663))

(declare-fun m!710665 () Bool)

(assert (=> b!764288 m!710665))

(assert (=> b!764288 m!710665))

(declare-fun m!710667 () Bool)

(assert (=> b!764288 m!710667))

(assert (=> b!764288 m!710667))

(assert (=> b!764288 m!710665))

(declare-fun m!710669 () Bool)

(assert (=> b!764288 m!710669))

(assert (=> b!764274 m!710665))

(assert (=> b!764274 m!710665))

(declare-fun m!710671 () Bool)

(assert (=> b!764274 m!710671))

(assert (=> b!764278 m!710665))

(assert (=> b!764278 m!710665))

(declare-fun m!710673 () Bool)

(assert (=> b!764278 m!710673))

(assert (=> b!764276 m!710665))

(assert (=> b!764276 m!710665))

(declare-fun m!710675 () Bool)

(assert (=> b!764276 m!710675))

(declare-fun m!710677 () Bool)

(assert (=> start!66302 m!710677))

(declare-fun m!710679 () Bool)

(assert (=> start!66302 m!710679))

(declare-fun m!710681 () Bool)

(assert (=> b!764285 m!710681))

(declare-fun m!710683 () Bool)

(assert (=> b!764280 m!710683))

(declare-fun m!710685 () Bool)

(assert (=> b!764280 m!710685))

(declare-fun m!710687 () Bool)

(assert (=> b!764280 m!710687))

(assert (=> b!764280 m!710683))

(declare-fun m!710689 () Bool)

(assert (=> b!764280 m!710689))

(declare-fun m!710691 () Bool)

(assert (=> b!764280 m!710691))

(declare-fun m!710693 () Bool)

(assert (=> b!764283 m!710693))

(declare-fun m!710695 () Bool)

(assert (=> b!764286 m!710695))

(push 1)

