; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65402 () Bool)

(assert start!65402)

(declare-fun b!744286 () Bool)

(declare-fun e!415779 () Bool)

(declare-fun e!415780 () Bool)

(assert (=> b!744286 (= e!415779 e!415780)))

(declare-fun res!501298 () Bool)

(assert (=> b!744286 (=> (not res!501298) (not e!415780))))

(declare-datatypes ((array!41575 0))(
  ( (array!41576 (arr!19901 (Array (_ BitVec 32) (_ BitVec 64))) (size!20322 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41575)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7501 0))(
  ( (MissingZero!7501 (index!32372 (_ BitVec 32))) (Found!7501 (index!32373 (_ BitVec 32))) (Intermediate!7501 (undefined!8313 Bool) (index!32374 (_ BitVec 32)) (x!63331 (_ BitVec 32))) (Undefined!7501) (MissingVacant!7501 (index!32375 (_ BitVec 32))) )
))
(declare-fun lt!330643 () SeekEntryResult!7501)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41575 (_ BitVec 32)) SeekEntryResult!7501)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744286 (= res!501298 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19901 a!3186) j!159) mask!3328) (select (arr!19901 a!3186) j!159) a!3186 mask!3328) lt!330643))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744286 (= lt!330643 (Intermediate!7501 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744287 () Bool)

(declare-fun res!501294 () Bool)

(declare-fun e!415787 () Bool)

(assert (=> b!744287 (=> (not res!501294) (not e!415787))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744287 (= res!501294 (and (= (size!20322 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20322 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20322 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744288 () Bool)

(declare-fun res!501295 () Bool)

(assert (=> b!744288 (=> (not res!501295) (not e!415787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744288 (= res!501295 (validKeyInArray!0 (select (arr!19901 a!3186) j!159)))))

(declare-fun b!744289 () Bool)

(declare-fun e!415785 () Bool)

(assert (=> b!744289 (= e!415785 true)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!330644 () SeekEntryResult!7501)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41575 (_ BitVec 32)) SeekEntryResult!7501)

(assert (=> b!744289 (= lt!330644 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19901 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744290 () Bool)

(declare-fun e!415781 () Bool)

(assert (=> b!744290 (= e!415781 (not e!415785))))

(declare-fun res!501287 () Bool)

(assert (=> b!744290 (=> res!501287 e!415785)))

(declare-fun lt!330637 () SeekEntryResult!7501)

(assert (=> b!744290 (= res!501287 (or (not (is-Intermediate!7501 lt!330637)) (bvslt x!1131 (x!63331 lt!330637)) (not (= x!1131 (x!63331 lt!330637))) (not (= index!1321 (index!32374 lt!330637)))))))

(declare-fun e!415784 () Bool)

(assert (=> b!744290 e!415784))

(declare-fun res!501291 () Bool)

(assert (=> b!744290 (=> (not res!501291) (not e!415784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41575 (_ BitVec 32)) Bool)

(assert (=> b!744290 (= res!501291 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25482 0))(
  ( (Unit!25483) )
))
(declare-fun lt!330642 () Unit!25482)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25482)

(assert (=> b!744290 (= lt!330642 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744291 () Bool)

(assert (=> b!744291 (= e!415787 e!415779)))

(declare-fun res!501299 () Bool)

(assert (=> b!744291 (=> (not res!501299) (not e!415779))))

(declare-fun lt!330640 () SeekEntryResult!7501)

(assert (=> b!744291 (= res!501299 (or (= lt!330640 (MissingZero!7501 i!1173)) (= lt!330640 (MissingVacant!7501 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41575 (_ BitVec 32)) SeekEntryResult!7501)

(assert (=> b!744291 (= lt!330640 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!744292 () Bool)

(declare-fun res!501300 () Bool)

(assert (=> b!744292 (=> (not res!501300) (not e!415779))))

(assert (=> b!744292 (= res!501300 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20322 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20322 a!3186))))))

(declare-fun res!501292 () Bool)

(assert (=> start!65402 (=> (not res!501292) (not e!415787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65402 (= res!501292 (validMask!0 mask!3328))))

(assert (=> start!65402 e!415787))

(assert (=> start!65402 true))

(declare-fun array_inv!15697 (array!41575) Bool)

(assert (=> start!65402 (array_inv!15697 a!3186)))

(declare-fun b!744293 () Bool)

(assert (=> b!744293 (= e!415780 e!415781)))

(declare-fun res!501296 () Bool)

(assert (=> b!744293 (=> (not res!501296) (not e!415781))))

(declare-fun lt!330641 () SeekEntryResult!7501)

(assert (=> b!744293 (= res!501296 (= lt!330641 lt!330637))))

(declare-fun lt!330639 () (_ BitVec 64))

(declare-fun lt!330636 () array!41575)

(assert (=> b!744293 (= lt!330637 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330639 lt!330636 mask!3328))))

(assert (=> b!744293 (= lt!330641 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330639 mask!3328) lt!330639 lt!330636 mask!3328))))

(assert (=> b!744293 (= lt!330639 (select (store (arr!19901 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!744293 (= lt!330636 (array!41576 (store (arr!19901 a!3186) i!1173 k!2102) (size!20322 a!3186)))))

(declare-fun b!744294 () Bool)

(declare-fun res!501290 () Bool)

(assert (=> b!744294 (=> (not res!501290) (not e!415779))))

(declare-datatypes ((List!13903 0))(
  ( (Nil!13900) (Cons!13899 (h!14971 (_ BitVec 64)) (t!20218 List!13903)) )
))
(declare-fun arrayNoDuplicates!0 (array!41575 (_ BitVec 32) List!13903) Bool)

(assert (=> b!744294 (= res!501290 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13900))))

(declare-fun b!744295 () Bool)

(declare-fun res!501302 () Bool)

(assert (=> b!744295 (=> (not res!501302) (not e!415779))))

(assert (=> b!744295 (= res!501302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744296 () Bool)

(declare-fun res!501293 () Bool)

(assert (=> b!744296 (=> (not res!501293) (not e!415787))))

(declare-fun arrayContainsKey!0 (array!41575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744296 (= res!501293 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744297 () Bool)

(declare-fun lt!330638 () SeekEntryResult!7501)

(declare-fun e!415783 () Bool)

(assert (=> b!744297 (= e!415783 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19901 a!3186) j!159) a!3186 mask!3328) lt!330638))))

(declare-fun b!744298 () Bool)

(declare-fun res!501297 () Bool)

(assert (=> b!744298 (=> (not res!501297) (not e!415787))))

(assert (=> b!744298 (= res!501297 (validKeyInArray!0 k!2102))))

(declare-fun b!744299 () Bool)

(declare-fun res!501288 () Bool)

(assert (=> b!744299 (=> (not res!501288) (not e!415780))))

(declare-fun e!415786 () Bool)

(assert (=> b!744299 (= res!501288 e!415786)))

(declare-fun c!81880 () Bool)

(assert (=> b!744299 (= c!81880 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744300 () Bool)

(assert (=> b!744300 (= e!415786 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19901 a!3186) j!159) a!3186 mask!3328) (Found!7501 j!159)))))

(declare-fun b!744301 () Bool)

(assert (=> b!744301 (= e!415784 e!415783)))

(declare-fun res!501301 () Bool)

(assert (=> b!744301 (=> (not res!501301) (not e!415783))))

(assert (=> b!744301 (= res!501301 (= (seekEntryOrOpen!0 (select (arr!19901 a!3186) j!159) a!3186 mask!3328) lt!330638))))

(assert (=> b!744301 (= lt!330638 (Found!7501 j!159))))

(declare-fun b!744302 () Bool)

(assert (=> b!744302 (= e!415786 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19901 a!3186) j!159) a!3186 mask!3328) lt!330643))))

(declare-fun b!744303 () Bool)

(declare-fun res!501289 () Bool)

(assert (=> b!744303 (=> (not res!501289) (not e!415780))))

(assert (=> b!744303 (= res!501289 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19901 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65402 res!501292) b!744287))

(assert (= (and b!744287 res!501294) b!744288))

(assert (= (and b!744288 res!501295) b!744298))

(assert (= (and b!744298 res!501297) b!744296))

(assert (= (and b!744296 res!501293) b!744291))

(assert (= (and b!744291 res!501299) b!744295))

(assert (= (and b!744295 res!501302) b!744294))

(assert (= (and b!744294 res!501290) b!744292))

(assert (= (and b!744292 res!501300) b!744286))

(assert (= (and b!744286 res!501298) b!744303))

(assert (= (and b!744303 res!501289) b!744299))

(assert (= (and b!744299 c!81880) b!744302))

(assert (= (and b!744299 (not c!81880)) b!744300))

(assert (= (and b!744299 res!501288) b!744293))

(assert (= (and b!744293 res!501296) b!744290))

(assert (= (and b!744290 res!501291) b!744301))

(assert (= (and b!744301 res!501301) b!744297))

(assert (= (and b!744290 (not res!501287)) b!744289))

(declare-fun m!694839 () Bool)

(assert (=> b!744290 m!694839))

(declare-fun m!694841 () Bool)

(assert (=> b!744290 m!694841))

(declare-fun m!694843 () Bool)

(assert (=> start!65402 m!694843))

(declare-fun m!694845 () Bool)

(assert (=> start!65402 m!694845))

(declare-fun m!694847 () Bool)

(assert (=> b!744295 m!694847))

(declare-fun m!694849 () Bool)

(assert (=> b!744289 m!694849))

(assert (=> b!744289 m!694849))

(declare-fun m!694851 () Bool)

(assert (=> b!744289 m!694851))

(declare-fun m!694853 () Bool)

(assert (=> b!744296 m!694853))

(declare-fun m!694855 () Bool)

(assert (=> b!744291 m!694855))

(assert (=> b!744288 m!694849))

(assert (=> b!744288 m!694849))

(declare-fun m!694857 () Bool)

(assert (=> b!744288 m!694857))

(assert (=> b!744300 m!694849))

(assert (=> b!744300 m!694849))

(assert (=> b!744300 m!694851))

(assert (=> b!744286 m!694849))

(assert (=> b!744286 m!694849))

(declare-fun m!694859 () Bool)

(assert (=> b!744286 m!694859))

(assert (=> b!744286 m!694859))

(assert (=> b!744286 m!694849))

(declare-fun m!694861 () Bool)

(assert (=> b!744286 m!694861))

(assert (=> b!744302 m!694849))

(assert (=> b!744302 m!694849))

(declare-fun m!694863 () Bool)

(assert (=> b!744302 m!694863))

(declare-fun m!694865 () Bool)

(assert (=> b!744294 m!694865))

(declare-fun m!694867 () Bool)

(assert (=> b!744298 m!694867))

(assert (=> b!744301 m!694849))

(assert (=> b!744301 m!694849))

(declare-fun m!694869 () Bool)

(assert (=> b!744301 m!694869))

(assert (=> b!744297 m!694849))

(assert (=> b!744297 m!694849))

(declare-fun m!694871 () Bool)

(assert (=> b!744297 m!694871))

(declare-fun m!694873 () Bool)

(assert (=> b!744303 m!694873))

(declare-fun m!694875 () Bool)

(assert (=> b!744293 m!694875))

(declare-fun m!694877 () Bool)

(assert (=> b!744293 m!694877))

(declare-fun m!694879 () Bool)

(assert (=> b!744293 m!694879))

(declare-fun m!694881 () Bool)

(assert (=> b!744293 m!694881))

(declare-fun m!694883 () Bool)

(assert (=> b!744293 m!694883))

(assert (=> b!744293 m!694877))

(push 1)

