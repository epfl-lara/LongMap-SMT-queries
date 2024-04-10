; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66808 () Bool)

(assert start!66808)

(declare-fun b!770636 () Bool)

(declare-fun e!429051 () Bool)

(declare-fun e!429050 () Bool)

(assert (=> b!770636 (= e!429051 e!429050)))

(declare-fun res!521324 () Bool)

(assert (=> b!770636 (=> (not res!521324) (not e!429050))))

(declare-datatypes ((array!42370 0))(
  ( (array!42371 (arr!20285 (Array (_ BitVec 32) (_ BitVec 64))) (size!20706 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42370)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7885 0))(
  ( (MissingZero!7885 (index!33908 (_ BitVec 32))) (Found!7885 (index!33909 (_ BitVec 32))) (Intermediate!7885 (undefined!8697 Bool) (index!33910 (_ BitVec 32)) (x!64832 (_ BitVec 32))) (Undefined!7885) (MissingVacant!7885 (index!33911 (_ BitVec 32))) )
))
(declare-fun lt!343007 () SeekEntryResult!7885)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42370 (_ BitVec 32)) SeekEntryResult!7885)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770636 (= res!521324 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20285 a!3186) j!159) mask!3328) (select (arr!20285 a!3186) j!159) a!3186 mask!3328) lt!343007))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770636 (= lt!343007 (Intermediate!7885 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770637 () Bool)

(declare-datatypes ((Unit!26554 0))(
  ( (Unit!26555) )
))
(declare-fun e!429054 () Unit!26554)

(declare-fun Unit!26556 () Unit!26554)

(assert (=> b!770637 (= e!429054 Unit!26556)))

(declare-fun lt!343011 () SeekEntryResult!7885)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42370 (_ BitVec 32)) SeekEntryResult!7885)

(assert (=> b!770637 (= lt!343011 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20285 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343005 () (_ BitVec 32))

(assert (=> b!770637 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343005 resIntermediateIndex!5 (select (arr!20285 a!3186) j!159) a!3186 mask!3328) (Found!7885 j!159))))

(declare-fun b!770638 () Bool)

(declare-fun res!521316 () Bool)

(assert (=> b!770638 (=> (not res!521316) (not e!429051))))

(declare-datatypes ((List!14287 0))(
  ( (Nil!14284) (Cons!14283 (h!15382 (_ BitVec 64)) (t!20602 List!14287)) )
))
(declare-fun arrayNoDuplicates!0 (array!42370 (_ BitVec 32) List!14287) Bool)

(assert (=> b!770638 (= res!521316 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14284))))

(declare-fun e!429057 () Bool)

(declare-fun b!770639 () Bool)

(assert (=> b!770639 (= e!429057 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20285 a!3186) j!159) a!3186 mask!3328) lt!343007))))

(declare-fun b!770640 () Bool)

(declare-fun lt!343003 () SeekEntryResult!7885)

(declare-fun e!429053 () Bool)

(assert (=> b!770640 (= e!429053 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20285 a!3186) j!159) a!3186 mask!3328) lt!343003))))

(declare-fun b!770641 () Bool)

(declare-fun e!429056 () Bool)

(assert (=> b!770641 (= e!429056 e!429053)))

(declare-fun res!521313 () Bool)

(assert (=> b!770641 (=> (not res!521313) (not e!429053))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42370 (_ BitVec 32)) SeekEntryResult!7885)

(assert (=> b!770641 (= res!521313 (= (seekEntryOrOpen!0 (select (arr!20285 a!3186) j!159) a!3186 mask!3328) lt!343003))))

(assert (=> b!770641 (= lt!343003 (Found!7885 j!159))))

(declare-fun b!770642 () Bool)

(declare-fun res!521310 () Bool)

(declare-fun e!429055 () Bool)

(assert (=> b!770642 (=> (not res!521310) (not e!429055))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770642 (= res!521310 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!521314 () Bool)

(assert (=> start!66808 (=> (not res!521314) (not e!429055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66808 (= res!521314 (validMask!0 mask!3328))))

(assert (=> start!66808 e!429055))

(assert (=> start!66808 true))

(declare-fun array_inv!16081 (array!42370) Bool)

(assert (=> start!66808 (array_inv!16081 a!3186)))

(declare-fun b!770643 () Bool)

(declare-fun res!521319 () Bool)

(assert (=> b!770643 (=> (not res!521319) (not e!429055))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770643 (= res!521319 (and (= (size!20706 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20706 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20706 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770644 () Bool)

(declare-fun res!521315 () Bool)

(assert (=> b!770644 (=> (not res!521315) (not e!429050))))

(assert (=> b!770644 (= res!521315 e!429057)))

(declare-fun c!85060 () Bool)

(assert (=> b!770644 (= c!85060 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770645 () Bool)

(declare-fun e!429052 () Bool)

(assert (=> b!770645 (= e!429052 true)))

(declare-fun lt!343009 () Unit!26554)

(assert (=> b!770645 (= lt!343009 e!429054)))

(declare-fun c!85059 () Bool)

(assert (=> b!770645 (= c!85059 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770645 (= lt!343005 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770646 () Bool)

(declare-fun res!521320 () Bool)

(assert (=> b!770646 (=> (not res!521320) (not e!429051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42370 (_ BitVec 32)) Bool)

(assert (=> b!770646 (= res!521320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770647 () Bool)

(assert (=> b!770647 (= e!429057 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20285 a!3186) j!159) a!3186 mask!3328) (Found!7885 j!159)))))

(declare-fun b!770648 () Bool)

(declare-fun e!429059 () Bool)

(assert (=> b!770648 (= e!429050 e!429059)))

(declare-fun res!521311 () Bool)

(assert (=> b!770648 (=> (not res!521311) (not e!429059))))

(declare-fun lt!343004 () SeekEntryResult!7885)

(declare-fun lt!343013 () SeekEntryResult!7885)

(assert (=> b!770648 (= res!521311 (= lt!343004 lt!343013))))

(declare-fun lt!343010 () array!42370)

(declare-fun lt!343008 () (_ BitVec 64))

(assert (=> b!770648 (= lt!343013 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343008 lt!343010 mask!3328))))

(assert (=> b!770648 (= lt!343004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343008 mask!3328) lt!343008 lt!343010 mask!3328))))

(assert (=> b!770648 (= lt!343008 (select (store (arr!20285 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!770648 (= lt!343010 (array!42371 (store (arr!20285 a!3186) i!1173 k!2102) (size!20706 a!3186)))))

(declare-fun b!770649 () Bool)

(assert (=> b!770649 (= e!429055 e!429051)))

(declare-fun res!521318 () Bool)

(assert (=> b!770649 (=> (not res!521318) (not e!429051))))

(declare-fun lt!343012 () SeekEntryResult!7885)

(assert (=> b!770649 (= res!521318 (or (= lt!343012 (MissingZero!7885 i!1173)) (= lt!343012 (MissingVacant!7885 i!1173))))))

(assert (=> b!770649 (= lt!343012 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!770650 () Bool)

(assert (=> b!770650 (= e!429059 (not e!429052))))

(declare-fun res!521309 () Bool)

(assert (=> b!770650 (=> res!521309 e!429052)))

(assert (=> b!770650 (= res!521309 (or (not (is-Intermediate!7885 lt!343013)) (bvsge x!1131 (x!64832 lt!343013))))))

(assert (=> b!770650 e!429056))

(declare-fun res!521322 () Bool)

(assert (=> b!770650 (=> (not res!521322) (not e!429056))))

(assert (=> b!770650 (= res!521322 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343006 () Unit!26554)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26554)

(assert (=> b!770650 (= lt!343006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770651 () Bool)

(declare-fun res!521323 () Bool)

(assert (=> b!770651 (=> (not res!521323) (not e!429055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770651 (= res!521323 (validKeyInArray!0 (select (arr!20285 a!3186) j!159)))))

(declare-fun b!770652 () Bool)

(declare-fun Unit!26557 () Unit!26554)

(assert (=> b!770652 (= e!429054 Unit!26557)))

(assert (=> b!770652 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343005 (select (arr!20285 a!3186) j!159) a!3186 mask!3328) lt!343007)))

(declare-fun b!770653 () Bool)

(declare-fun res!521312 () Bool)

(assert (=> b!770653 (=> (not res!521312) (not e!429050))))

(assert (=> b!770653 (= res!521312 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20285 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770654 () Bool)

(declare-fun res!521317 () Bool)

(assert (=> b!770654 (=> (not res!521317) (not e!429055))))

(assert (=> b!770654 (= res!521317 (validKeyInArray!0 k!2102))))

(declare-fun b!770655 () Bool)

(declare-fun res!521321 () Bool)

(assert (=> b!770655 (=> (not res!521321) (not e!429051))))

(assert (=> b!770655 (= res!521321 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20706 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20706 a!3186))))))

(assert (= (and start!66808 res!521314) b!770643))

(assert (= (and b!770643 res!521319) b!770651))

(assert (= (and b!770651 res!521323) b!770654))

(assert (= (and b!770654 res!521317) b!770642))

(assert (= (and b!770642 res!521310) b!770649))

(assert (= (and b!770649 res!521318) b!770646))

(assert (= (and b!770646 res!521320) b!770638))

(assert (= (and b!770638 res!521316) b!770655))

(assert (= (and b!770655 res!521321) b!770636))

(assert (= (and b!770636 res!521324) b!770653))

(assert (= (and b!770653 res!521312) b!770644))

(assert (= (and b!770644 c!85060) b!770639))

(assert (= (and b!770644 (not c!85060)) b!770647))

(assert (= (and b!770644 res!521315) b!770648))

(assert (= (and b!770648 res!521311) b!770650))

(assert (= (and b!770650 res!521322) b!770641))

(assert (= (and b!770641 res!521313) b!770640))

(assert (= (and b!770650 (not res!521309)) b!770645))

(assert (= (and b!770645 c!85059) b!770652))

(assert (= (and b!770645 (not c!85059)) b!770637))

(declare-fun m!715891 () Bool)

(assert (=> b!770636 m!715891))

(assert (=> b!770636 m!715891))

(declare-fun m!715893 () Bool)

(assert (=> b!770636 m!715893))

(assert (=> b!770636 m!715893))

(assert (=> b!770636 m!715891))

(declare-fun m!715895 () Bool)

(assert (=> b!770636 m!715895))

(declare-fun m!715897 () Bool)

(assert (=> b!770646 m!715897))

(declare-fun m!715899 () Bool)

(assert (=> b!770649 m!715899))

(declare-fun m!715901 () Bool)

(assert (=> b!770638 m!715901))

(assert (=> b!770651 m!715891))

(assert (=> b!770651 m!715891))

(declare-fun m!715903 () Bool)

(assert (=> b!770651 m!715903))

(assert (=> b!770641 m!715891))

(assert (=> b!770641 m!715891))

(declare-fun m!715905 () Bool)

(assert (=> b!770641 m!715905))

(assert (=> b!770652 m!715891))

(assert (=> b!770652 m!715891))

(declare-fun m!715907 () Bool)

(assert (=> b!770652 m!715907))

(declare-fun m!715909 () Bool)

(assert (=> b!770650 m!715909))

(declare-fun m!715911 () Bool)

(assert (=> b!770650 m!715911))

(declare-fun m!715913 () Bool)

(assert (=> b!770648 m!715913))

(declare-fun m!715915 () Bool)

(assert (=> b!770648 m!715915))

(declare-fun m!715917 () Bool)

(assert (=> b!770648 m!715917))

(declare-fun m!715919 () Bool)

(assert (=> b!770648 m!715919))

(declare-fun m!715921 () Bool)

(assert (=> b!770648 m!715921))

(assert (=> b!770648 m!715917))

(declare-fun m!715923 () Bool)

(assert (=> b!770642 m!715923))

(declare-fun m!715925 () Bool)

(assert (=> b!770645 m!715925))

(assert (=> b!770640 m!715891))

(assert (=> b!770640 m!715891))

(declare-fun m!715927 () Bool)

(assert (=> b!770640 m!715927))

(assert (=> b!770639 m!715891))

(assert (=> b!770639 m!715891))

(declare-fun m!715929 () Bool)

(assert (=> b!770639 m!715929))

(declare-fun m!715931 () Bool)

(assert (=> b!770653 m!715931))

(assert (=> b!770647 m!715891))

(assert (=> b!770647 m!715891))

(declare-fun m!715933 () Bool)

(assert (=> b!770647 m!715933))

(declare-fun m!715935 () Bool)

(assert (=> start!66808 m!715935))

(declare-fun m!715937 () Bool)

(assert (=> start!66808 m!715937))

(assert (=> b!770637 m!715891))

(assert (=> b!770637 m!715891))

(assert (=> b!770637 m!715933))

(assert (=> b!770637 m!715891))

(declare-fun m!715939 () Bool)

(assert (=> b!770637 m!715939))

(declare-fun m!715941 () Bool)

(assert (=> b!770654 m!715941))

(push 1)

