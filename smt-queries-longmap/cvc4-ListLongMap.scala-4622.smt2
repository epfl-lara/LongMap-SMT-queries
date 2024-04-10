; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64370 () Bool)

(assert start!64370)

(declare-fun b!723849 () Bool)

(declare-fun res!485370 () Bool)

(declare-fun e!405479 () Bool)

(assert (=> b!723849 (=> (not res!485370) (not e!405479))))

(declare-fun e!405477 () Bool)

(assert (=> b!723849 (= res!485370 e!405477)))

(declare-fun c!79612 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723849 (= c!79612 (bvsle x!1131 resIntermediateX!5))))

(declare-datatypes ((array!40951 0))(
  ( (array!40952 (arr!19598 (Array (_ BitVec 32) (_ BitVec 64))) (size!20019 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40951)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!723850 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!405478 () Bool)

(declare-datatypes ((SeekEntryResult!7198 0))(
  ( (MissingZero!7198 (index!31160 (_ BitVec 32))) (Found!7198 (index!31161 (_ BitVec 32))) (Intermediate!7198 (undefined!8010 Bool) (index!31162 (_ BitVec 32)) (x!62151 (_ BitVec 32))) (Undefined!7198) (MissingVacant!7198 (index!31163 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40951 (_ BitVec 32)) SeekEntryResult!7198)

(assert (=> b!723850 (= e!405478 (= (seekEntryOrOpen!0 (select (arr!19598 a!3186) j!159) a!3186 mask!3328) (Found!7198 j!159)))))

(declare-fun res!485374 () Bool)

(declare-fun e!405482 () Bool)

(assert (=> start!64370 (=> (not res!485374) (not e!405482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64370 (= res!485374 (validMask!0 mask!3328))))

(assert (=> start!64370 e!405482))

(assert (=> start!64370 true))

(declare-fun array_inv!15394 (array!40951) Bool)

(assert (=> start!64370 (array_inv!15394 a!3186)))

(declare-fun b!723851 () Bool)

(declare-fun res!485377 () Bool)

(declare-fun e!405480 () Bool)

(assert (=> b!723851 (=> (not res!485377) (not e!405480))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!723851 (= res!485377 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20019 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20019 a!3186))))))

(declare-fun b!723852 () Bool)

(declare-fun res!485371 () Bool)

(assert (=> b!723852 (=> (not res!485371) (not e!405482))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723852 (= res!485371 (and (= (size!20019 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20019 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20019 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723853 () Bool)

(assert (=> b!723853 (= e!405480 e!405479)))

(declare-fun res!485379 () Bool)

(assert (=> b!723853 (=> (not res!485379) (not e!405479))))

(declare-fun lt!320800 () SeekEntryResult!7198)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40951 (_ BitVec 32)) SeekEntryResult!7198)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723853 (= res!485379 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19598 a!3186) j!159) mask!3328) (select (arr!19598 a!3186) j!159) a!3186 mask!3328) lt!320800))))

(assert (=> b!723853 (= lt!320800 (Intermediate!7198 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723854 () Bool)

(declare-fun res!485380 () Bool)

(assert (=> b!723854 (=> (not res!485380) (not e!405482))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723854 (= res!485380 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723855 () Bool)

(declare-fun e!405476 () Bool)

(assert (=> b!723855 (= e!405476 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(assert (=> b!723855 e!405478))

(declare-fun res!485376 () Bool)

(assert (=> b!723855 (=> (not res!485376) (not e!405478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40951 (_ BitVec 32)) Bool)

(assert (=> b!723855 (= res!485376 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24714 0))(
  ( (Unit!24715) )
))
(declare-fun lt!320801 () Unit!24714)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24714)

(assert (=> b!723855 (= lt!320801 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723856 () Bool)

(declare-fun res!485381 () Bool)

(assert (=> b!723856 (=> (not res!485381) (not e!405480))))

(assert (=> b!723856 (= res!485381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723857 () Bool)

(assert (=> b!723857 (= e!405477 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19598 a!3186) j!159) a!3186 mask!3328) lt!320800))))

(declare-fun b!723858 () Bool)

(declare-fun res!485368 () Bool)

(assert (=> b!723858 (=> (not res!485368) (not e!405482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723858 (= res!485368 (validKeyInArray!0 (select (arr!19598 a!3186) j!159)))))

(declare-fun b!723859 () Bool)

(declare-fun res!485378 () Bool)

(assert (=> b!723859 (=> (not res!485378) (not e!405479))))

(assert (=> b!723859 (= res!485378 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19598 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723860 () Bool)

(assert (=> b!723860 (= e!405479 e!405476)))

(declare-fun res!485372 () Bool)

(assert (=> b!723860 (=> (not res!485372) (not e!405476))))

(declare-fun lt!320803 () (_ BitVec 64))

(declare-fun lt!320802 () array!40951)

(assert (=> b!723860 (= res!485372 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320803 mask!3328) lt!320803 lt!320802 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320803 lt!320802 mask!3328)))))

(assert (=> b!723860 (= lt!320803 (select (store (arr!19598 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723860 (= lt!320802 (array!40952 (store (arr!19598 a!3186) i!1173 k!2102) (size!20019 a!3186)))))

(declare-fun b!723861 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40951 (_ BitVec 32)) SeekEntryResult!7198)

(assert (=> b!723861 (= e!405477 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19598 a!3186) j!159) a!3186 mask!3328) (Found!7198 j!159)))))

(declare-fun b!723862 () Bool)

(declare-fun res!485369 () Bool)

(assert (=> b!723862 (=> (not res!485369) (not e!405482))))

(assert (=> b!723862 (= res!485369 (validKeyInArray!0 k!2102))))

(declare-fun b!723863 () Bool)

(declare-fun res!485373 () Bool)

(assert (=> b!723863 (=> (not res!485373) (not e!405480))))

(declare-datatypes ((List!13600 0))(
  ( (Nil!13597) (Cons!13596 (h!14650 (_ BitVec 64)) (t!19915 List!13600)) )
))
(declare-fun arrayNoDuplicates!0 (array!40951 (_ BitVec 32) List!13600) Bool)

(assert (=> b!723863 (= res!485373 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13597))))

(declare-fun b!723864 () Bool)

(assert (=> b!723864 (= e!405482 e!405480)))

(declare-fun res!485375 () Bool)

(assert (=> b!723864 (=> (not res!485375) (not e!405480))))

(declare-fun lt!320804 () SeekEntryResult!7198)

(assert (=> b!723864 (= res!485375 (or (= lt!320804 (MissingZero!7198 i!1173)) (= lt!320804 (MissingVacant!7198 i!1173))))))

(assert (=> b!723864 (= lt!320804 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64370 res!485374) b!723852))

(assert (= (and b!723852 res!485371) b!723858))

(assert (= (and b!723858 res!485368) b!723862))

(assert (= (and b!723862 res!485369) b!723854))

(assert (= (and b!723854 res!485380) b!723864))

(assert (= (and b!723864 res!485375) b!723856))

(assert (= (and b!723856 res!485381) b!723863))

(assert (= (and b!723863 res!485373) b!723851))

(assert (= (and b!723851 res!485377) b!723853))

(assert (= (and b!723853 res!485379) b!723859))

(assert (= (and b!723859 res!485378) b!723849))

(assert (= (and b!723849 c!79612) b!723857))

(assert (= (and b!723849 (not c!79612)) b!723861))

(assert (= (and b!723849 res!485370) b!723860))

(assert (= (and b!723860 res!485372) b!723855))

(assert (= (and b!723855 res!485376) b!723850))

(declare-fun m!678257 () Bool)

(assert (=> b!723853 m!678257))

(assert (=> b!723853 m!678257))

(declare-fun m!678259 () Bool)

(assert (=> b!723853 m!678259))

(assert (=> b!723853 m!678259))

(assert (=> b!723853 m!678257))

(declare-fun m!678261 () Bool)

(assert (=> b!723853 m!678261))

(assert (=> b!723857 m!678257))

(assert (=> b!723857 m!678257))

(declare-fun m!678263 () Bool)

(assert (=> b!723857 m!678263))

(declare-fun m!678265 () Bool)

(assert (=> b!723859 m!678265))

(assert (=> b!723858 m!678257))

(assert (=> b!723858 m!678257))

(declare-fun m!678267 () Bool)

(assert (=> b!723858 m!678267))

(declare-fun m!678269 () Bool)

(assert (=> b!723862 m!678269))

(assert (=> b!723861 m!678257))

(assert (=> b!723861 m!678257))

(declare-fun m!678271 () Bool)

(assert (=> b!723861 m!678271))

(assert (=> b!723850 m!678257))

(assert (=> b!723850 m!678257))

(declare-fun m!678273 () Bool)

(assert (=> b!723850 m!678273))

(declare-fun m!678275 () Bool)

(assert (=> b!723855 m!678275))

(declare-fun m!678277 () Bool)

(assert (=> b!723855 m!678277))

(declare-fun m!678279 () Bool)

(assert (=> b!723854 m!678279))

(declare-fun m!678281 () Bool)

(assert (=> b!723856 m!678281))

(declare-fun m!678283 () Bool)

(assert (=> b!723860 m!678283))

(declare-fun m!678285 () Bool)

(assert (=> b!723860 m!678285))

(declare-fun m!678287 () Bool)

(assert (=> b!723860 m!678287))

(declare-fun m!678289 () Bool)

(assert (=> b!723860 m!678289))

(assert (=> b!723860 m!678287))

(declare-fun m!678291 () Bool)

(assert (=> b!723860 m!678291))

(declare-fun m!678293 () Bool)

(assert (=> b!723864 m!678293))

(declare-fun m!678295 () Bool)

(assert (=> b!723863 m!678295))

(declare-fun m!678297 () Bool)

(assert (=> start!64370 m!678297))

(declare-fun m!678299 () Bool)

(assert (=> start!64370 m!678299))

(push 1)

(assert (not b!723857))

