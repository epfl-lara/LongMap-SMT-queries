; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64422 () Bool)

(assert start!64422)

(declare-fun b!723937 () Bool)

(declare-fun e!405601 () Bool)

(assert (=> b!723937 (= e!405601 (not true))))

(declare-fun e!405598 () Bool)

(assert (=> b!723937 e!405598))

(declare-fun res!485349 () Bool)

(assert (=> b!723937 (=> (not res!485349) (not e!405598))))

(declare-datatypes ((array!40936 0))(
  ( (array!40937 (arr!19588 (Array (_ BitVec 32) (_ BitVec 64))) (size!20008 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40936)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40936 (_ BitVec 32)) Bool)

(assert (=> b!723937 (= res!485349 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24685 0))(
  ( (Unit!24686) )
))
(declare-fun lt!320856 () Unit!24685)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24685)

(assert (=> b!723937 (= lt!320856 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723938 () Bool)

(declare-fun res!485347 () Bool)

(declare-fun e!405602 () Bool)

(assert (=> b!723938 (=> (not res!485347) (not e!405602))))

(assert (=> b!723938 (= res!485347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723939 () Bool)

(declare-fun res!485346 () Bool)

(declare-fun e!405600 () Bool)

(assert (=> b!723939 (=> (not res!485346) (not e!405600))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723939 (= res!485346 (validKeyInArray!0 k0!2102))))

(declare-fun res!485338 () Bool)

(assert (=> start!64422 (=> (not res!485338) (not e!405600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64422 (= res!485338 (validMask!0 mask!3328))))

(assert (=> start!64422 e!405600))

(assert (=> start!64422 true))

(declare-fun array_inv!15447 (array!40936) Bool)

(assert (=> start!64422 (array_inv!15447 a!3186)))

(declare-fun b!723940 () Bool)

(declare-fun res!485342 () Bool)

(declare-fun e!405603 () Bool)

(assert (=> b!723940 (=> (not res!485342) (not e!405603))))

(declare-fun e!405597 () Bool)

(assert (=> b!723940 (= res!485342 e!405597)))

(declare-fun c!79673 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723940 (= c!79673 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723941 () Bool)

(assert (=> b!723941 (= e!405603 e!405601)))

(declare-fun res!485343 () Bool)

(assert (=> b!723941 (=> (not res!485343) (not e!405601))))

(declare-fun lt!320855 () (_ BitVec 64))

(declare-fun lt!320858 () array!40936)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7144 0))(
  ( (MissingZero!7144 (index!30944 (_ BitVec 32))) (Found!7144 (index!30945 (_ BitVec 32))) (Intermediate!7144 (undefined!7956 Bool) (index!30946 (_ BitVec 32)) (x!62092 (_ BitVec 32))) (Undefined!7144) (MissingVacant!7144 (index!30947 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40936 (_ BitVec 32)) SeekEntryResult!7144)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723941 (= res!485343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320855 mask!3328) lt!320855 lt!320858 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320855 lt!320858 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723941 (= lt!320855 (select (store (arr!19588 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723941 (= lt!320858 (array!40937 (store (arr!19588 a!3186) i!1173 k0!2102) (size!20008 a!3186)))))

(declare-fun b!723942 () Bool)

(declare-fun res!485348 () Bool)

(assert (=> b!723942 (=> (not res!485348) (not e!405600))))

(assert (=> b!723942 (= res!485348 (validKeyInArray!0 (select (arr!19588 a!3186) j!159)))))

(declare-fun b!723943 () Bool)

(declare-fun res!485345 () Bool)

(assert (=> b!723943 (=> (not res!485345) (not e!405603))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!723943 (= res!485345 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19588 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723944 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40936 (_ BitVec 32)) SeekEntryResult!7144)

(assert (=> b!723944 (= e!405597 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19588 a!3186) j!159) a!3186 mask!3328) (Found!7144 j!159)))))

(declare-fun b!723945 () Bool)

(assert (=> b!723945 (= e!405602 e!405603)))

(declare-fun res!485340 () Bool)

(assert (=> b!723945 (=> (not res!485340) (not e!405603))))

(declare-fun lt!320857 () SeekEntryResult!7144)

(assert (=> b!723945 (= res!485340 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19588 a!3186) j!159) mask!3328) (select (arr!19588 a!3186) j!159) a!3186 mask!3328) lt!320857))))

(assert (=> b!723945 (= lt!320857 (Intermediate!7144 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723946 () Bool)

(declare-fun res!485350 () Bool)

(assert (=> b!723946 (=> (not res!485350) (not e!405600))))

(assert (=> b!723946 (= res!485350 (and (= (size!20008 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20008 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20008 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723947 () Bool)

(assert (=> b!723947 (= e!405600 e!405602)))

(declare-fun res!485341 () Bool)

(assert (=> b!723947 (=> (not res!485341) (not e!405602))))

(declare-fun lt!320859 () SeekEntryResult!7144)

(assert (=> b!723947 (= res!485341 (or (= lt!320859 (MissingZero!7144 i!1173)) (= lt!320859 (MissingVacant!7144 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40936 (_ BitVec 32)) SeekEntryResult!7144)

(assert (=> b!723947 (= lt!320859 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723948 () Bool)

(assert (=> b!723948 (= e!405598 (= (seekEntryOrOpen!0 (select (arr!19588 a!3186) j!159) a!3186 mask!3328) (Found!7144 j!159)))))

(declare-fun b!723949 () Bool)

(declare-fun res!485337 () Bool)

(assert (=> b!723949 (=> (not res!485337) (not e!405602))))

(declare-datatypes ((List!13497 0))(
  ( (Nil!13494) (Cons!13493 (h!14550 (_ BitVec 64)) (t!19804 List!13497)) )
))
(declare-fun arrayNoDuplicates!0 (array!40936 (_ BitVec 32) List!13497) Bool)

(assert (=> b!723949 (= res!485337 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13494))))

(declare-fun b!723950 () Bool)

(declare-fun res!485344 () Bool)

(assert (=> b!723950 (=> (not res!485344) (not e!405600))))

(declare-fun arrayContainsKey!0 (array!40936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723950 (= res!485344 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723951 () Bool)

(assert (=> b!723951 (= e!405597 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19588 a!3186) j!159) a!3186 mask!3328) lt!320857))))

(declare-fun b!723952 () Bool)

(declare-fun res!485339 () Bool)

(assert (=> b!723952 (=> (not res!485339) (not e!405602))))

(assert (=> b!723952 (= res!485339 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20008 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20008 a!3186))))))

(assert (= (and start!64422 res!485338) b!723946))

(assert (= (and b!723946 res!485350) b!723942))

(assert (= (and b!723942 res!485348) b!723939))

(assert (= (and b!723939 res!485346) b!723950))

(assert (= (and b!723950 res!485344) b!723947))

(assert (= (and b!723947 res!485341) b!723938))

(assert (= (and b!723938 res!485347) b!723949))

(assert (= (and b!723949 res!485337) b!723952))

(assert (= (and b!723952 res!485339) b!723945))

(assert (= (and b!723945 res!485340) b!723943))

(assert (= (and b!723943 res!485345) b!723940))

(assert (= (and b!723940 c!79673) b!723951))

(assert (= (and b!723940 (not c!79673)) b!723944))

(assert (= (and b!723940 res!485342) b!723941))

(assert (= (and b!723941 res!485343) b!723937))

(assert (= (and b!723937 res!485349) b!723948))

(declare-fun m!678885 () Bool)

(assert (=> b!723939 m!678885))

(declare-fun m!678887 () Bool)

(assert (=> b!723943 m!678887))

(declare-fun m!678889 () Bool)

(assert (=> b!723944 m!678889))

(assert (=> b!723944 m!678889))

(declare-fun m!678891 () Bool)

(assert (=> b!723944 m!678891))

(declare-fun m!678893 () Bool)

(assert (=> b!723949 m!678893))

(declare-fun m!678895 () Bool)

(assert (=> b!723938 m!678895))

(declare-fun m!678897 () Bool)

(assert (=> b!723937 m!678897))

(declare-fun m!678899 () Bool)

(assert (=> b!723937 m!678899))

(declare-fun m!678901 () Bool)

(assert (=> b!723941 m!678901))

(declare-fun m!678903 () Bool)

(assert (=> b!723941 m!678903))

(assert (=> b!723941 m!678901))

(declare-fun m!678905 () Bool)

(assert (=> b!723941 m!678905))

(declare-fun m!678907 () Bool)

(assert (=> b!723941 m!678907))

(declare-fun m!678909 () Bool)

(assert (=> b!723941 m!678909))

(declare-fun m!678911 () Bool)

(assert (=> b!723950 m!678911))

(declare-fun m!678913 () Bool)

(assert (=> b!723947 m!678913))

(declare-fun m!678915 () Bool)

(assert (=> start!64422 m!678915))

(declare-fun m!678917 () Bool)

(assert (=> start!64422 m!678917))

(assert (=> b!723945 m!678889))

(assert (=> b!723945 m!678889))

(declare-fun m!678919 () Bool)

(assert (=> b!723945 m!678919))

(assert (=> b!723945 m!678919))

(assert (=> b!723945 m!678889))

(declare-fun m!678921 () Bool)

(assert (=> b!723945 m!678921))

(assert (=> b!723948 m!678889))

(assert (=> b!723948 m!678889))

(declare-fun m!678923 () Bool)

(assert (=> b!723948 m!678923))

(assert (=> b!723942 m!678889))

(assert (=> b!723942 m!678889))

(declare-fun m!678925 () Bool)

(assert (=> b!723942 m!678925))

(assert (=> b!723951 m!678889))

(assert (=> b!723951 m!678889))

(declare-fun m!678927 () Bool)

(assert (=> b!723951 m!678927))

(check-sat (not b!723945) (not b!723951) (not start!64422) (not b!723944) (not b!723949) (not b!723939) (not b!723948) (not b!723937) (not b!723942) (not b!723938) (not b!723950) (not b!723941) (not b!723947))
(check-sat)
