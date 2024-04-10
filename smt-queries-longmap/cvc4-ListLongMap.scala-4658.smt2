; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64724 () Bool)

(assert start!64724)

(declare-fun b!730306 () Bool)

(declare-fun e!408702 () Bool)

(declare-fun e!408696 () Bool)

(assert (=> b!730306 (= e!408702 e!408696)))

(declare-fun res!490613 () Bool)

(assert (=> b!730306 (=> (not res!490613) (not e!408696))))

(declare-datatypes ((array!41173 0))(
  ( (array!41174 (arr!19706 (Array (_ BitVec 32) (_ BitVec 64))) (size!20127 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41173)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7306 0))(
  ( (MissingZero!7306 (index!31592 (_ BitVec 32))) (Found!7306 (index!31593 (_ BitVec 32))) (Intermediate!7306 (undefined!8118 Bool) (index!31594 (_ BitVec 32)) (x!62568 (_ BitVec 32))) (Undefined!7306) (MissingVacant!7306 (index!31595 (_ BitVec 32))) )
))
(declare-fun lt!323600 () SeekEntryResult!7306)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41173 (_ BitVec 32)) SeekEntryResult!7306)

(assert (=> b!730306 (= res!490613 (= (seekEntryOrOpen!0 (select (arr!19706 a!3186) j!159) a!3186 mask!3328) lt!323600))))

(assert (=> b!730306 (= lt!323600 (Found!7306 j!159))))

(declare-fun b!730307 () Bool)

(declare-fun e!408699 () Bool)

(declare-fun e!408701 () Bool)

(assert (=> b!730307 (= e!408699 e!408701)))

(declare-fun res!490618 () Bool)

(assert (=> b!730307 (=> (not res!490618) (not e!408701))))

(declare-fun lt!323595 () SeekEntryResult!7306)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41173 (_ BitVec 32)) SeekEntryResult!7306)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730307 (= res!490618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19706 a!3186) j!159) mask!3328) (select (arr!19706 a!3186) j!159) a!3186 mask!3328) lt!323595))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730307 (= lt!323595 (Intermediate!7306 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730308 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!408697 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41173 (_ BitVec 32)) SeekEntryResult!7306)

(assert (=> b!730308 (= e!408697 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19706 a!3186) j!159) a!3186 mask!3328) (Found!7306 j!159)))))

(declare-fun b!730309 () Bool)

(declare-fun e!408703 () Bool)

(declare-fun e!408700 () Bool)

(assert (=> b!730309 (= e!408703 (not e!408700))))

(declare-fun res!490624 () Bool)

(assert (=> b!730309 (=> res!490624 e!408700)))

(declare-fun lt!323603 () SeekEntryResult!7306)

(assert (=> b!730309 (= res!490624 (or (not (is-Intermediate!7306 lt!323603)) (bvsge x!1131 (x!62568 lt!323603))))))

(assert (=> b!730309 e!408702))

(declare-fun res!490627 () Bool)

(assert (=> b!730309 (=> (not res!490627) (not e!408702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41173 (_ BitVec 32)) Bool)

(assert (=> b!730309 (= res!490627 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24930 0))(
  ( (Unit!24931) )
))
(declare-fun lt!323599 () Unit!24930)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24930)

(assert (=> b!730309 (= lt!323599 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730310 () Bool)

(declare-fun res!490625 () Bool)

(declare-fun e!408704 () Bool)

(assert (=> b!730310 (=> (not res!490625) (not e!408704))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730310 (= res!490625 (and (= (size!20127 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20127 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20127 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730311 () Bool)

(declare-fun res!490628 () Bool)

(assert (=> b!730311 (=> (not res!490628) (not e!408699))))

(assert (=> b!730311 (= res!490628 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20127 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20127 a!3186))))))

(declare-fun b!730312 () Bool)

(declare-fun res!490616 () Bool)

(assert (=> b!730312 (=> (not res!490616) (not e!408704))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730312 (= res!490616 (validKeyInArray!0 k!2102))))

(declare-fun b!730313 () Bool)

(declare-fun res!490617 () Bool)

(assert (=> b!730313 (=> (not res!490617) (not e!408699))))

(assert (=> b!730313 (= res!490617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730314 () Bool)

(declare-fun res!490623 () Bool)

(assert (=> b!730314 (=> (not res!490623) (not e!408704))))

(assert (=> b!730314 (= res!490623 (validKeyInArray!0 (select (arr!19706 a!3186) j!159)))))

(declare-fun b!730315 () Bool)

(assert (=> b!730315 (= e!408701 e!408703)))

(declare-fun res!490621 () Bool)

(assert (=> b!730315 (=> (not res!490621) (not e!408703))))

(declare-fun lt!323597 () SeekEntryResult!7306)

(assert (=> b!730315 (= res!490621 (= lt!323597 lt!323603))))

(declare-fun lt!323596 () (_ BitVec 64))

(declare-fun lt!323598 () array!41173)

(assert (=> b!730315 (= lt!323603 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323596 lt!323598 mask!3328))))

(assert (=> b!730315 (= lt!323597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323596 mask!3328) lt!323596 lt!323598 mask!3328))))

(assert (=> b!730315 (= lt!323596 (select (store (arr!19706 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!730315 (= lt!323598 (array!41174 (store (arr!19706 a!3186) i!1173 k!2102) (size!20127 a!3186)))))

(declare-fun b!730316 () Bool)

(assert (=> b!730316 (= e!408696 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19706 a!3186) j!159) a!3186 mask!3328) lt!323600))))

(declare-fun b!730317 () Bool)

(assert (=> b!730317 (= e!408700 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!323601 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730317 (= lt!323601 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730319 () Bool)

(declare-fun res!490620 () Bool)

(assert (=> b!730319 (=> (not res!490620) (not e!408704))))

(declare-fun arrayContainsKey!0 (array!41173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730319 (= res!490620 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730320 () Bool)

(assert (=> b!730320 (= e!408704 e!408699)))

(declare-fun res!490615 () Bool)

(assert (=> b!730320 (=> (not res!490615) (not e!408699))))

(declare-fun lt!323602 () SeekEntryResult!7306)

(assert (=> b!730320 (= res!490615 (or (= lt!323602 (MissingZero!7306 i!1173)) (= lt!323602 (MissingVacant!7306 i!1173))))))

(assert (=> b!730320 (= lt!323602 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!730321 () Bool)

(declare-fun res!490614 () Bool)

(assert (=> b!730321 (=> (not res!490614) (not e!408701))))

(assert (=> b!730321 (= res!490614 e!408697)))

(declare-fun c!80221 () Bool)

(assert (=> b!730321 (= c!80221 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730322 () Bool)

(declare-fun res!490619 () Bool)

(assert (=> b!730322 (=> (not res!490619) (not e!408701))))

(assert (=> b!730322 (= res!490619 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19706 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730323 () Bool)

(assert (=> b!730323 (= e!408697 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19706 a!3186) j!159) a!3186 mask!3328) lt!323595))))

(declare-fun res!490626 () Bool)

(assert (=> start!64724 (=> (not res!490626) (not e!408704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64724 (= res!490626 (validMask!0 mask!3328))))

(assert (=> start!64724 e!408704))

(assert (=> start!64724 true))

(declare-fun array_inv!15502 (array!41173) Bool)

(assert (=> start!64724 (array_inv!15502 a!3186)))

(declare-fun b!730318 () Bool)

(declare-fun res!490622 () Bool)

(assert (=> b!730318 (=> (not res!490622) (not e!408699))))

(declare-datatypes ((List!13708 0))(
  ( (Nil!13705) (Cons!13704 (h!14764 (_ BitVec 64)) (t!20023 List!13708)) )
))
(declare-fun arrayNoDuplicates!0 (array!41173 (_ BitVec 32) List!13708) Bool)

(assert (=> b!730318 (= res!490622 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13705))))

(assert (= (and start!64724 res!490626) b!730310))

(assert (= (and b!730310 res!490625) b!730314))

(assert (= (and b!730314 res!490623) b!730312))

(assert (= (and b!730312 res!490616) b!730319))

(assert (= (and b!730319 res!490620) b!730320))

(assert (= (and b!730320 res!490615) b!730313))

(assert (= (and b!730313 res!490617) b!730318))

(assert (= (and b!730318 res!490622) b!730311))

(assert (= (and b!730311 res!490628) b!730307))

(assert (= (and b!730307 res!490618) b!730322))

(assert (= (and b!730322 res!490619) b!730321))

(assert (= (and b!730321 c!80221) b!730323))

(assert (= (and b!730321 (not c!80221)) b!730308))

(assert (= (and b!730321 res!490614) b!730315))

(assert (= (and b!730315 res!490621) b!730309))

(assert (= (and b!730309 res!490627) b!730306))

(assert (= (and b!730306 res!490613) b!730316))

(assert (= (and b!730309 (not res!490624)) b!730317))

(declare-fun m!683851 () Bool)

(assert (=> b!730319 m!683851))

(declare-fun m!683853 () Bool)

(assert (=> b!730320 m!683853))

(declare-fun m!683855 () Bool)

(assert (=> b!730308 m!683855))

(assert (=> b!730308 m!683855))

(declare-fun m!683857 () Bool)

(assert (=> b!730308 m!683857))

(declare-fun m!683859 () Bool)

(assert (=> b!730309 m!683859))

(declare-fun m!683861 () Bool)

(assert (=> b!730309 m!683861))

(assert (=> b!730306 m!683855))

(assert (=> b!730306 m!683855))

(declare-fun m!683863 () Bool)

(assert (=> b!730306 m!683863))

(declare-fun m!683865 () Bool)

(assert (=> start!64724 m!683865))

(declare-fun m!683867 () Bool)

(assert (=> start!64724 m!683867))

(declare-fun m!683869 () Bool)

(assert (=> b!730313 m!683869))

(assert (=> b!730314 m!683855))

(assert (=> b!730314 m!683855))

(declare-fun m!683871 () Bool)

(assert (=> b!730314 m!683871))

(assert (=> b!730307 m!683855))

(assert (=> b!730307 m!683855))

(declare-fun m!683873 () Bool)

(assert (=> b!730307 m!683873))

(assert (=> b!730307 m!683873))

(assert (=> b!730307 m!683855))

(declare-fun m!683875 () Bool)

(assert (=> b!730307 m!683875))

(assert (=> b!730316 m!683855))

(assert (=> b!730316 m!683855))

(declare-fun m!683877 () Bool)

(assert (=> b!730316 m!683877))

(declare-fun m!683879 () Bool)

(assert (=> b!730315 m!683879))

(declare-fun m!683881 () Bool)

(assert (=> b!730315 m!683881))

(declare-fun m!683883 () Bool)

(assert (=> b!730315 m!683883))

(declare-fun m!683885 () Bool)

(assert (=> b!730315 m!683885))

(declare-fun m!683887 () Bool)

(assert (=> b!730315 m!683887))

(assert (=> b!730315 m!683885))

(declare-fun m!683889 () Bool)

(assert (=> b!730318 m!683889))

(declare-fun m!683891 () Bool)

(assert (=> b!730312 m!683891))

(declare-fun m!683893 () Bool)

(assert (=> b!730322 m!683893))

(assert (=> b!730323 m!683855))

(assert (=> b!730323 m!683855))

(declare-fun m!683895 () Bool)

(assert (=> b!730323 m!683895))

(declare-fun m!683897 () Bool)

(assert (=> b!730317 m!683897))

(push 1)

(assert (not b!730312))

(assert (not b!730319))

(assert (not b!730308))

(assert (not b!730316))

(assert (not b!730314))

(assert (not b!730318))

(assert (not start!64724))

(assert (not b!730315))

(assert (not b!730317))

(assert (not b!730323))

(assert (not b!730306))

(assert (not b!730307))

(assert (not b!730320))

(assert (not b!730313))

(assert (not b!730309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

