; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65484 () Bool)

(assert start!65484)

(declare-fun b!746527 () Bool)

(declare-fun res!503286 () Bool)

(declare-fun e!416892 () Bool)

(assert (=> b!746527 (=> (not res!503286) (not e!416892))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746527 (= res!503286 (validKeyInArray!0 k0!2102))))

(declare-fun b!746528 () Bool)

(declare-fun res!503287 () Bool)

(declare-fun e!416893 () Bool)

(assert (=> b!746528 (=> (not res!503287) (not e!416893))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41657 0))(
  ( (array!41658 (arr!19942 (Array (_ BitVec 32) (_ BitVec 64))) (size!20363 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41657)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746528 (= res!503287 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20363 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20363 a!3186))))))

(declare-fun b!746529 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!416889 () Bool)

(assert (=> b!746529 (= e!416889 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-datatypes ((SeekEntryResult!7542 0))(
  ( (MissingZero!7542 (index!32536 (_ BitVec 32))) (Found!7542 (index!32537 (_ BitVec 32))) (Intermediate!7542 (undefined!8354 Bool) (index!32538 (_ BitVec 32)) (x!63484 (_ BitVec 32))) (Undefined!7542) (MissingVacant!7542 (index!32539 (_ BitVec 32))) )
))
(declare-fun lt!331767 () SeekEntryResult!7542)

(declare-fun lt!331774 () SeekEntryResult!7542)

(assert (=> b!746529 (= lt!331767 lt!331774)))

(declare-fun b!746530 () Bool)

(declare-fun res!503288 () Bool)

(assert (=> b!746530 (=> (not res!503288) (not e!416892))))

(declare-fun arrayContainsKey!0 (array!41657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746530 (= res!503288 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!503291 () Bool)

(assert (=> start!65484 (=> (not res!503291) (not e!416892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65484 (= res!503291 (validMask!0 mask!3328))))

(assert (=> start!65484 e!416892))

(assert (=> start!65484 true))

(declare-fun array_inv!15738 (array!41657) Bool)

(assert (=> start!65484 (array_inv!15738 a!3186)))

(declare-fun b!746531 () Bool)

(declare-fun res!503297 () Bool)

(assert (=> b!746531 (=> (not res!503297) (not e!416893))))

(declare-datatypes ((List!13944 0))(
  ( (Nil!13941) (Cons!13940 (h!15012 (_ BitVec 64)) (t!20259 List!13944)) )
))
(declare-fun arrayNoDuplicates!0 (array!41657 (_ BitVec 32) List!13944) Bool)

(assert (=> b!746531 (= res!503297 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13941))))

(declare-fun e!416890 () Bool)

(declare-fun b!746532 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!331772 () SeekEntryResult!7542)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41657 (_ BitVec 32)) SeekEntryResult!7542)

(assert (=> b!746532 (= e!416890 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19942 a!3186) j!159) a!3186 mask!3328) lt!331772))))

(declare-fun b!746533 () Bool)

(declare-fun res!503282 () Bool)

(declare-fun e!416888 () Bool)

(assert (=> b!746533 (=> (not res!503282) (not e!416888))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746533 (= res!503282 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19942 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!331773 () SeekEntryResult!7542)

(declare-fun b!746534 () Bool)

(declare-fun e!416886 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41657 (_ BitVec 32)) SeekEntryResult!7542)

(assert (=> b!746534 (= e!416886 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19942 a!3186) j!159) a!3186 mask!3328) lt!331773))))

(declare-fun b!746535 () Bool)

(declare-fun res!503285 () Bool)

(assert (=> b!746535 (=> (not res!503285) (not e!416893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41657 (_ BitVec 32)) Bool)

(assert (=> b!746535 (= res!503285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746536 () Bool)

(declare-fun e!416891 () Bool)

(assert (=> b!746536 (= e!416888 e!416891)))

(declare-fun res!503293 () Bool)

(assert (=> b!746536 (=> (not res!503293) (not e!416891))))

(declare-fun lt!331775 () SeekEntryResult!7542)

(declare-fun lt!331769 () SeekEntryResult!7542)

(assert (=> b!746536 (= res!503293 (= lt!331775 lt!331769))))

(declare-fun lt!331768 () (_ BitVec 64))

(declare-fun lt!331771 () array!41657)

(assert (=> b!746536 (= lt!331769 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331768 lt!331771 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746536 (= lt!331775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331768 mask!3328) lt!331768 lt!331771 mask!3328))))

(assert (=> b!746536 (= lt!331768 (select (store (arr!19942 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746536 (= lt!331771 (array!41658 (store (arr!19942 a!3186) i!1173 k0!2102) (size!20363 a!3186)))))

(declare-fun b!746537 () Bool)

(declare-fun res!503296 () Bool)

(assert (=> b!746537 (=> (not res!503296) (not e!416892))))

(assert (=> b!746537 (= res!503296 (and (= (size!20363 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20363 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20363 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746538 () Bool)

(assert (=> b!746538 (= e!416892 e!416893)))

(declare-fun res!503283 () Bool)

(assert (=> b!746538 (=> (not res!503283) (not e!416893))))

(declare-fun lt!331770 () SeekEntryResult!7542)

(assert (=> b!746538 (= res!503283 (or (= lt!331770 (MissingZero!7542 i!1173)) (= lt!331770 (MissingVacant!7542 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41657 (_ BitVec 32)) SeekEntryResult!7542)

(assert (=> b!746538 (= lt!331770 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!746539 () Bool)

(declare-fun e!416887 () Bool)

(assert (=> b!746539 (= e!416891 (not e!416887))))

(declare-fun res!503292 () Bool)

(assert (=> b!746539 (=> res!503292 e!416887)))

(get-info :version)

(assert (=> b!746539 (= res!503292 (or (not ((_ is Intermediate!7542) lt!331769)) (bvslt x!1131 (x!63484 lt!331769)) (not (= x!1131 (x!63484 lt!331769))) (not (= index!1321 (index!32538 lt!331769)))))))

(assert (=> b!746539 e!416890))

(declare-fun res!503289 () Bool)

(assert (=> b!746539 (=> (not res!503289) (not e!416890))))

(assert (=> b!746539 (= res!503289 (= lt!331767 lt!331772))))

(assert (=> b!746539 (= lt!331772 (Found!7542 j!159))))

(assert (=> b!746539 (= lt!331767 (seekEntryOrOpen!0 (select (arr!19942 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746539 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25564 0))(
  ( (Unit!25565) )
))
(declare-fun lt!331766 () Unit!25564)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25564)

(assert (=> b!746539 (= lt!331766 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746540 () Bool)

(declare-fun res!503290 () Bool)

(assert (=> b!746540 (=> (not res!503290) (not e!416888))))

(assert (=> b!746540 (= res!503290 e!416886)))

(declare-fun c!82003 () Bool)

(assert (=> b!746540 (= c!82003 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746541 () Bool)

(assert (=> b!746541 (= e!416887 e!416889)))

(declare-fun res!503294 () Bool)

(assert (=> b!746541 (=> res!503294 e!416889)))

(assert (=> b!746541 (= res!503294 (or (not (= lt!331774 lt!331772)) (= (select (store (arr!19942 a!3186) i!1173 k0!2102) index!1321) lt!331768) (not (= (select (store (arr!19942 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746541 (= lt!331774 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19942 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746542 () Bool)

(assert (=> b!746542 (= e!416893 e!416888)))

(declare-fun res!503295 () Bool)

(assert (=> b!746542 (=> (not res!503295) (not e!416888))))

(assert (=> b!746542 (= res!503295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19942 a!3186) j!159) mask!3328) (select (arr!19942 a!3186) j!159) a!3186 mask!3328) lt!331773))))

(assert (=> b!746542 (= lt!331773 (Intermediate!7542 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746543 () Bool)

(assert (=> b!746543 (= e!416886 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19942 a!3186) j!159) a!3186 mask!3328) (Found!7542 j!159)))))

(declare-fun b!746544 () Bool)

(declare-fun res!503284 () Bool)

(assert (=> b!746544 (=> (not res!503284) (not e!416892))))

(assert (=> b!746544 (= res!503284 (validKeyInArray!0 (select (arr!19942 a!3186) j!159)))))

(assert (= (and start!65484 res!503291) b!746537))

(assert (= (and b!746537 res!503296) b!746544))

(assert (= (and b!746544 res!503284) b!746527))

(assert (= (and b!746527 res!503286) b!746530))

(assert (= (and b!746530 res!503288) b!746538))

(assert (= (and b!746538 res!503283) b!746535))

(assert (= (and b!746535 res!503285) b!746531))

(assert (= (and b!746531 res!503297) b!746528))

(assert (= (and b!746528 res!503287) b!746542))

(assert (= (and b!746542 res!503295) b!746533))

(assert (= (and b!746533 res!503282) b!746540))

(assert (= (and b!746540 c!82003) b!746534))

(assert (= (and b!746540 (not c!82003)) b!746543))

(assert (= (and b!746540 res!503290) b!746536))

(assert (= (and b!746536 res!503293) b!746539))

(assert (= (and b!746539 res!503289) b!746532))

(assert (= (and b!746539 (not res!503292)) b!746541))

(assert (= (and b!746541 (not res!503294)) b!746529))

(declare-fun m!696775 () Bool)

(assert (=> b!746532 m!696775))

(assert (=> b!746532 m!696775))

(declare-fun m!696777 () Bool)

(assert (=> b!746532 m!696777))

(assert (=> b!746542 m!696775))

(assert (=> b!746542 m!696775))

(declare-fun m!696779 () Bool)

(assert (=> b!746542 m!696779))

(assert (=> b!746542 m!696779))

(assert (=> b!746542 m!696775))

(declare-fun m!696781 () Bool)

(assert (=> b!746542 m!696781))

(assert (=> b!746539 m!696775))

(assert (=> b!746539 m!696775))

(declare-fun m!696783 () Bool)

(assert (=> b!746539 m!696783))

(declare-fun m!696785 () Bool)

(assert (=> b!746539 m!696785))

(declare-fun m!696787 () Bool)

(assert (=> b!746539 m!696787))

(declare-fun m!696789 () Bool)

(assert (=> b!746536 m!696789))

(declare-fun m!696791 () Bool)

(assert (=> b!746536 m!696791))

(declare-fun m!696793 () Bool)

(assert (=> b!746536 m!696793))

(declare-fun m!696795 () Bool)

(assert (=> b!746536 m!696795))

(assert (=> b!746536 m!696791))

(declare-fun m!696797 () Bool)

(assert (=> b!746536 m!696797))

(declare-fun m!696799 () Bool)

(assert (=> b!746538 m!696799))

(assert (=> b!746534 m!696775))

(assert (=> b!746534 m!696775))

(declare-fun m!696801 () Bool)

(assert (=> b!746534 m!696801))

(assert (=> b!746541 m!696789))

(declare-fun m!696803 () Bool)

(assert (=> b!746541 m!696803))

(assert (=> b!746541 m!696775))

(assert (=> b!746541 m!696775))

(declare-fun m!696805 () Bool)

(assert (=> b!746541 m!696805))

(declare-fun m!696807 () Bool)

(assert (=> b!746533 m!696807))

(declare-fun m!696809 () Bool)

(assert (=> start!65484 m!696809))

(declare-fun m!696811 () Bool)

(assert (=> start!65484 m!696811))

(declare-fun m!696813 () Bool)

(assert (=> b!746527 m!696813))

(declare-fun m!696815 () Bool)

(assert (=> b!746531 m!696815))

(declare-fun m!696817 () Bool)

(assert (=> b!746530 m!696817))

(declare-fun m!696819 () Bool)

(assert (=> b!746535 m!696819))

(assert (=> b!746544 m!696775))

(assert (=> b!746544 m!696775))

(declare-fun m!696821 () Bool)

(assert (=> b!746544 m!696821))

(assert (=> b!746543 m!696775))

(assert (=> b!746543 m!696775))

(assert (=> b!746543 m!696805))

(check-sat (not b!746531) (not b!746541) (not b!746539) (not b!746542) (not b!746534) (not b!746530) (not start!65484) (not b!746535) (not b!746536) (not b!746538) (not b!746527) (not b!746544) (not b!746532) (not b!746543))
(check-sat)
