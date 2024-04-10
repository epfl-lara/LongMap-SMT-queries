; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67696 () Bool)

(assert start!67696)

(declare-fun b!784724 () Bool)

(declare-fun res!531083 () Bool)

(declare-fun e!436291 () Bool)

(assert (=> b!784724 (=> (not res!531083) (not e!436291))))

(declare-datatypes ((array!42736 0))(
  ( (array!42737 (arr!20456 (Array (_ BitVec 32) (_ BitVec 64))) (size!20877 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42736)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!784724 (= res!531083 (and (= (size!20877 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20877 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20877 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784725 () Bool)

(declare-fun e!436285 () Bool)

(declare-fun e!436281 () Bool)

(assert (=> b!784725 (= e!436285 e!436281)))

(declare-fun res!531082 () Bool)

(assert (=> b!784725 (=> (not res!531082) (not e!436281))))

(declare-datatypes ((SeekEntryResult!8056 0))(
  ( (MissingZero!8056 (index!34592 (_ BitVec 32))) (Found!8056 (index!34593 (_ BitVec 32))) (Intermediate!8056 (undefined!8868 Bool) (index!34594 (_ BitVec 32)) (x!65540 (_ BitVec 32))) (Undefined!8056) (MissingVacant!8056 (index!34595 (_ BitVec 32))) )
))
(declare-fun lt!349835 () SeekEntryResult!8056)

(declare-fun lt!349833 () SeekEntryResult!8056)

(assert (=> b!784725 (= res!531082 (= lt!349835 lt!349833))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!349844 () array!42736)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!349838 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42736 (_ BitVec 32)) SeekEntryResult!8056)

(assert (=> b!784725 (= lt!349833 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349838 lt!349844 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784725 (= lt!349835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349838 mask!3328) lt!349838 lt!349844 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!784725 (= lt!349838 (select (store (arr!20456 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!784725 (= lt!349844 (array!42737 (store (arr!20456 a!3186) i!1173 k!2102) (size!20877 a!3186)))))

(declare-fun b!784726 () Bool)

(declare-fun res!531088 () Bool)

(declare-fun e!436288 () Bool)

(assert (=> b!784726 (=> (not res!531088) (not e!436288))))

(declare-datatypes ((List!14458 0))(
  ( (Nil!14455) (Cons!14454 (h!15577 (_ BitVec 64)) (t!20773 List!14458)) )
))
(declare-fun arrayNoDuplicates!0 (array!42736 (_ BitVec 32) List!14458) Bool)

(assert (=> b!784726 (= res!531088 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14455))))

(declare-fun b!784727 () Bool)

(declare-fun res!531072 () Bool)

(assert (=> b!784727 (=> (not res!531072) (not e!436288))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784727 (= res!531072 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20877 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20877 a!3186))))))

(declare-fun b!784728 () Bool)

(declare-fun res!531071 () Bool)

(assert (=> b!784728 (=> (not res!531071) (not e!436285))))

(declare-fun e!436287 () Bool)

(assert (=> b!784728 (= res!531071 e!436287)))

(declare-fun c!87234 () Bool)

(assert (=> b!784728 (= c!87234 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784729 () Bool)

(declare-fun e!436286 () Bool)

(declare-fun e!436292 () Bool)

(assert (=> b!784729 (= e!436286 e!436292)))

(declare-fun res!531084 () Bool)

(assert (=> b!784729 (=> res!531084 e!436292)))

(declare-fun lt!349834 () SeekEntryResult!8056)

(declare-fun lt!349842 () SeekEntryResult!8056)

(assert (=> b!784729 (= res!531084 (not (= lt!349834 lt!349842)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42736 (_ BitVec 32)) SeekEntryResult!8056)

(assert (=> b!784729 (= lt!349834 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20456 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784730 () Bool)

(declare-fun res!531076 () Bool)

(assert (=> b!784730 (=> (not res!531076) (not e!436291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784730 (= res!531076 (validKeyInArray!0 (select (arr!20456 a!3186) j!159)))))

(declare-fun b!784731 () Bool)

(declare-datatypes ((Unit!27112 0))(
  ( (Unit!27113) )
))
(declare-fun e!436282 () Unit!27112)

(declare-fun Unit!27114 () Unit!27112)

(assert (=> b!784731 (= e!436282 Unit!27114)))

(declare-fun b!784732 () Bool)

(assert (=> b!784732 (= e!436288 e!436285)))

(declare-fun res!531073 () Bool)

(assert (=> b!784732 (=> (not res!531073) (not e!436285))))

(declare-fun lt!349841 () SeekEntryResult!8056)

(assert (=> b!784732 (= res!531073 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20456 a!3186) j!159) mask!3328) (select (arr!20456 a!3186) j!159) a!3186 mask!3328) lt!349841))))

(assert (=> b!784732 (= lt!349841 (Intermediate!8056 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784733 () Bool)

(declare-fun res!531079 () Bool)

(assert (=> b!784733 (=> (not res!531079) (not e!436291))))

(assert (=> b!784733 (= res!531079 (validKeyInArray!0 k!2102))))

(declare-fun b!784734 () Bool)

(declare-fun Unit!27115 () Unit!27112)

(assert (=> b!784734 (= e!436282 Unit!27115)))

(assert (=> b!784734 false))

(declare-fun b!784735 () Bool)

(declare-fun res!531075 () Bool)

(declare-fun e!436284 () Bool)

(assert (=> b!784735 (=> (not res!531075) (not e!436284))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42736 (_ BitVec 32)) SeekEntryResult!8056)

(assert (=> b!784735 (= res!531075 (= (seekEntryOrOpen!0 lt!349838 lt!349844 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349838 lt!349844 mask!3328)))))

(declare-fun b!784736 () Bool)

(declare-fun res!531087 () Bool)

(assert (=> b!784736 (=> (not res!531087) (not e!436291))))

(declare-fun arrayContainsKey!0 (array!42736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784736 (= res!531087 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784737 () Bool)

(declare-fun res!531080 () Bool)

(assert (=> b!784737 (=> (not res!531080) (not e!436285))))

(assert (=> b!784737 (= res!531080 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20456 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!531085 () Bool)

(assert (=> start!67696 (=> (not res!531085) (not e!436291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67696 (= res!531085 (validMask!0 mask!3328))))

(assert (=> start!67696 e!436291))

(assert (=> start!67696 true))

(declare-fun array_inv!16252 (array!42736) Bool)

(assert (=> start!67696 (array_inv!16252 a!3186)))

(declare-fun b!784738 () Bool)

(assert (=> b!784738 (= e!436287 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20456 a!3186) j!159) a!3186 mask!3328) (Found!8056 j!159)))))

(declare-fun b!784739 () Bool)

(assert (=> b!784739 (= e!436281 (not e!436286))))

(declare-fun res!531078 () Bool)

(assert (=> b!784739 (=> res!531078 e!436286)))

(assert (=> b!784739 (= res!531078 (or (not (is-Intermediate!8056 lt!349833)) (bvslt x!1131 (x!65540 lt!349833)) (not (= x!1131 (x!65540 lt!349833))) (not (= index!1321 (index!34594 lt!349833)))))))

(declare-fun e!436289 () Bool)

(assert (=> b!784739 e!436289))

(declare-fun res!531089 () Bool)

(assert (=> b!784739 (=> (not res!531089) (not e!436289))))

(declare-fun lt!349843 () SeekEntryResult!8056)

(assert (=> b!784739 (= res!531089 (= lt!349843 lt!349842))))

(assert (=> b!784739 (= lt!349842 (Found!8056 j!159))))

(assert (=> b!784739 (= lt!349843 (seekEntryOrOpen!0 (select (arr!20456 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42736 (_ BitVec 32)) Bool)

(assert (=> b!784739 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349840 () Unit!27112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42736 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27112)

(assert (=> b!784739 (= lt!349840 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784740 () Bool)

(assert (=> b!784740 (= e!436289 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20456 a!3186) j!159) a!3186 mask!3328) lt!349842))))

(declare-fun b!784741 () Bool)

(assert (=> b!784741 (= e!436291 e!436288)))

(declare-fun res!531077 () Bool)

(assert (=> b!784741 (=> (not res!531077) (not e!436288))))

(declare-fun lt!349836 () SeekEntryResult!8056)

(assert (=> b!784741 (= res!531077 (or (= lt!349836 (MissingZero!8056 i!1173)) (= lt!349836 (MissingVacant!8056 i!1173))))))

(assert (=> b!784741 (= lt!349836 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!784742 () Bool)

(declare-fun e!436283 () Bool)

(assert (=> b!784742 (= e!436283 true)))

(assert (=> b!784742 e!436284))

(declare-fun res!531074 () Bool)

(assert (=> b!784742 (=> (not res!531074) (not e!436284))))

(declare-fun lt!349837 () (_ BitVec 64))

(assert (=> b!784742 (= res!531074 (= lt!349837 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349839 () Unit!27112)

(assert (=> b!784742 (= lt!349839 e!436282)))

(declare-fun c!87235 () Bool)

(assert (=> b!784742 (= c!87235 (= lt!349837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784743 () Bool)

(assert (=> b!784743 (= e!436287 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20456 a!3186) j!159) a!3186 mask!3328) lt!349841))))

(declare-fun b!784744 () Bool)

(declare-fun res!531086 () Bool)

(assert (=> b!784744 (=> (not res!531086) (not e!436288))))

(assert (=> b!784744 (= res!531086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784745 () Bool)

(assert (=> b!784745 (= e!436284 (= lt!349843 lt!349834))))

(declare-fun b!784746 () Bool)

(assert (=> b!784746 (= e!436292 e!436283)))

(declare-fun res!531081 () Bool)

(assert (=> b!784746 (=> res!531081 e!436283)))

(assert (=> b!784746 (= res!531081 (= lt!349837 lt!349838))))

(assert (=> b!784746 (= lt!349837 (select (store (arr!20456 a!3186) i!1173 k!2102) index!1321))))

(assert (= (and start!67696 res!531085) b!784724))

(assert (= (and b!784724 res!531083) b!784730))

(assert (= (and b!784730 res!531076) b!784733))

(assert (= (and b!784733 res!531079) b!784736))

(assert (= (and b!784736 res!531087) b!784741))

(assert (= (and b!784741 res!531077) b!784744))

(assert (= (and b!784744 res!531086) b!784726))

(assert (= (and b!784726 res!531088) b!784727))

(assert (= (and b!784727 res!531072) b!784732))

(assert (= (and b!784732 res!531073) b!784737))

(assert (= (and b!784737 res!531080) b!784728))

(assert (= (and b!784728 c!87234) b!784743))

(assert (= (and b!784728 (not c!87234)) b!784738))

(assert (= (and b!784728 res!531071) b!784725))

(assert (= (and b!784725 res!531082) b!784739))

(assert (= (and b!784739 res!531089) b!784740))

(assert (= (and b!784739 (not res!531078)) b!784729))

(assert (= (and b!784729 (not res!531084)) b!784746))

(assert (= (and b!784746 (not res!531081)) b!784742))

(assert (= (and b!784742 c!87235) b!784734))

(assert (= (and b!784742 (not c!87235)) b!784731))

(assert (= (and b!784742 res!531074) b!784735))

(assert (= (and b!784735 res!531075) b!784745))

(declare-fun m!726973 () Bool)

(assert (=> b!784725 m!726973))

(declare-fun m!726975 () Bool)

(assert (=> b!784725 m!726975))

(assert (=> b!784725 m!726973))

(declare-fun m!726977 () Bool)

(assert (=> b!784725 m!726977))

(declare-fun m!726979 () Bool)

(assert (=> b!784725 m!726979))

(declare-fun m!726981 () Bool)

(assert (=> b!784725 m!726981))

(declare-fun m!726983 () Bool)

(assert (=> b!784738 m!726983))

(assert (=> b!784738 m!726983))

(declare-fun m!726985 () Bool)

(assert (=> b!784738 m!726985))

(assert (=> b!784743 m!726983))

(assert (=> b!784743 m!726983))

(declare-fun m!726987 () Bool)

(assert (=> b!784743 m!726987))

(assert (=> b!784729 m!726983))

(assert (=> b!784729 m!726983))

(assert (=> b!784729 m!726985))

(declare-fun m!726989 () Bool)

(assert (=> b!784741 m!726989))

(declare-fun m!726991 () Bool)

(assert (=> b!784744 m!726991))

(declare-fun m!726993 () Bool)

(assert (=> start!67696 m!726993))

(declare-fun m!726995 () Bool)

(assert (=> start!67696 m!726995))

(assert (=> b!784730 m!726983))

(assert (=> b!784730 m!726983))

(declare-fun m!726997 () Bool)

(assert (=> b!784730 m!726997))

(assert (=> b!784746 m!726979))

(declare-fun m!726999 () Bool)

(assert (=> b!784746 m!726999))

(declare-fun m!727001 () Bool)

(assert (=> b!784726 m!727001))

(declare-fun m!727003 () Bool)

(assert (=> b!784737 m!727003))

(assert (=> b!784732 m!726983))

(assert (=> b!784732 m!726983))

(declare-fun m!727005 () Bool)

(assert (=> b!784732 m!727005))

(assert (=> b!784732 m!727005))

(assert (=> b!784732 m!726983))

(declare-fun m!727007 () Bool)

(assert (=> b!784732 m!727007))

(declare-fun m!727009 () Bool)

(assert (=> b!784733 m!727009))

(assert (=> b!784740 m!726983))

(assert (=> b!784740 m!726983))

(declare-fun m!727011 () Bool)

(assert (=> b!784740 m!727011))

(assert (=> b!784739 m!726983))

(assert (=> b!784739 m!726983))

(declare-fun m!727013 () Bool)

(assert (=> b!784739 m!727013))

(declare-fun m!727015 () Bool)

(assert (=> b!784739 m!727015))

(declare-fun m!727017 () Bool)

(assert (=> b!784739 m!727017))

(declare-fun m!727019 () Bool)

(assert (=> b!784736 m!727019))

(declare-fun m!727021 () Bool)

(assert (=> b!784735 m!727021))

(declare-fun m!727023 () Bool)

(assert (=> b!784735 m!727023))

(push 1)

