; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65584 () Bool)

(assert start!65584)

(declare-fun b!749649 () Bool)

(declare-fun res!505865 () Bool)

(declare-fun e!418304 () Bool)

(assert (=> b!749649 (=> (not res!505865) (not e!418304))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41757 0))(
  ( (array!41758 (arr!19992 (Array (_ BitVec 32) (_ BitVec 64))) (size!20413 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41757)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749649 (= res!505865 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20413 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20413 a!3186))))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!749650 () Bool)

(declare-fun e!418297 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7592 0))(
  ( (MissingZero!7592 (index!32736 (_ BitVec 32))) (Found!7592 (index!32737 (_ BitVec 32))) (Intermediate!7592 (undefined!8404 Bool) (index!32738 (_ BitVec 32)) (x!63670 (_ BitVec 32))) (Undefined!7592) (MissingVacant!7592 (index!32739 (_ BitVec 32))) )
))
(declare-fun lt!333288 () SeekEntryResult!7592)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41757 (_ BitVec 32)) SeekEntryResult!7592)

(assert (=> b!749650 (= e!418297 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19992 a!3186) j!159) a!3186 mask!3328) lt!333288))))

(declare-fun b!749651 () Bool)

(declare-fun e!418303 () Bool)

(declare-fun e!418300 () Bool)

(assert (=> b!749651 (= e!418303 (not e!418300))))

(declare-fun res!505859 () Bool)

(assert (=> b!749651 (=> res!505859 e!418300)))

(declare-fun lt!333291 () SeekEntryResult!7592)

(assert (=> b!749651 (= res!505859 (or (not (is-Intermediate!7592 lt!333291)) (bvslt x!1131 (x!63670 lt!333291)) (not (= x!1131 (x!63670 lt!333291))) (not (= index!1321 (index!32738 lt!333291)))))))

(assert (=> b!749651 e!418297))

(declare-fun res!505860 () Bool)

(assert (=> b!749651 (=> (not res!505860) (not e!418297))))

(declare-fun lt!333294 () SeekEntryResult!7592)

(assert (=> b!749651 (= res!505860 (= lt!333294 lt!333288))))

(assert (=> b!749651 (= lt!333288 (Found!7592 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41757 (_ BitVec 32)) SeekEntryResult!7592)

(assert (=> b!749651 (= lt!333294 (seekEntryOrOpen!0 (select (arr!19992 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41757 (_ BitVec 32)) Bool)

(assert (=> b!749651 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25748 0))(
  ( (Unit!25749) )
))
(declare-fun lt!333289 () Unit!25748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25748)

(assert (=> b!749651 (= lt!333289 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749652 () Bool)

(declare-fun res!505852 () Bool)

(assert (=> b!749652 (=> res!505852 e!418300)))

(assert (=> b!749652 (= res!505852 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19992 a!3186) j!159) a!3186 mask!3328) lt!333288)))))

(declare-fun b!749653 () Bool)

(declare-fun res!505853 () Bool)

(declare-fun e!418301 () Bool)

(assert (=> b!749653 (=> (not res!505853) (not e!418301))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749653 (= res!505853 (and (= (size!20413 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20413 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20413 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749654 () Bool)

(declare-fun e!418296 () Bool)

(assert (=> b!749654 (= e!418296 true)))

(declare-fun e!418294 () Bool)

(assert (=> b!749654 e!418294))

(declare-fun res!505862 () Bool)

(assert (=> b!749654 (=> (not res!505862) (not e!418294))))

(declare-fun lt!333296 () (_ BitVec 64))

(assert (=> b!749654 (= res!505862 (= lt!333296 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333287 () Unit!25748)

(declare-fun e!418298 () Unit!25748)

(assert (=> b!749654 (= lt!333287 e!418298)))

(declare-fun c!82281 () Bool)

(assert (=> b!749654 (= c!82281 (= lt!333296 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749655 () Bool)

(declare-fun res!505851 () Bool)

(assert (=> b!749655 (=> (not res!505851) (not e!418301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749655 (= res!505851 (validKeyInArray!0 (select (arr!19992 a!3186) j!159)))))

(declare-fun b!749656 () Bool)

(declare-fun res!505861 () Bool)

(assert (=> b!749656 (=> (not res!505861) (not e!418304))))

(declare-datatypes ((List!13994 0))(
  ( (Nil!13991) (Cons!13990 (h!15062 (_ BitVec 64)) (t!20309 List!13994)) )
))
(declare-fun arrayNoDuplicates!0 (array!41757 (_ BitVec 32) List!13994) Bool)

(assert (=> b!749656 (= res!505861 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13991))))

(declare-fun b!749657 () Bool)

(declare-fun res!505855 () Bool)

(declare-fun e!418295 () Bool)

(assert (=> b!749657 (=> (not res!505855) (not e!418295))))

(assert (=> b!749657 (= res!505855 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19992 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749658 () Bool)

(assert (=> b!749658 (= e!418304 e!418295)))

(declare-fun res!505858 () Bool)

(assert (=> b!749658 (=> (not res!505858) (not e!418295))))

(declare-fun lt!333290 () SeekEntryResult!7592)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41757 (_ BitVec 32)) SeekEntryResult!7592)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749658 (= res!505858 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19992 a!3186) j!159) mask!3328) (select (arr!19992 a!3186) j!159) a!3186 mask!3328) lt!333290))))

(assert (=> b!749658 (= lt!333290 (Intermediate!7592 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749659 () Bool)

(declare-fun res!505856 () Bool)

(assert (=> b!749659 (=> (not res!505856) (not e!418304))))

(assert (=> b!749659 (= res!505856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!505848 () Bool)

(assert (=> start!65584 (=> (not res!505848) (not e!418301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65584 (= res!505848 (validMask!0 mask!3328))))

(assert (=> start!65584 e!418301))

(assert (=> start!65584 true))

(declare-fun array_inv!15788 (array!41757) Bool)

(assert (=> start!65584 (array_inv!15788 a!3186)))

(declare-fun b!749660 () Bool)

(assert (=> b!749660 (= e!418300 e!418296)))

(declare-fun res!505849 () Bool)

(assert (=> b!749660 (=> res!505849 e!418296)))

(declare-fun lt!333286 () (_ BitVec 64))

(assert (=> b!749660 (= res!505849 (= lt!333296 lt!333286))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!749660 (= lt!333296 (select (store (arr!19992 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!749661 () Bool)

(assert (=> b!749661 (= e!418295 e!418303)))

(declare-fun res!505857 () Bool)

(assert (=> b!749661 (=> (not res!505857) (not e!418303))))

(declare-fun lt!333292 () SeekEntryResult!7592)

(assert (=> b!749661 (= res!505857 (= lt!333292 lt!333291))))

(declare-fun lt!333295 () array!41757)

(assert (=> b!749661 (= lt!333291 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333286 lt!333295 mask!3328))))

(assert (=> b!749661 (= lt!333292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333286 mask!3328) lt!333286 lt!333295 mask!3328))))

(assert (=> b!749661 (= lt!333286 (select (store (arr!19992 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!749661 (= lt!333295 (array!41758 (store (arr!19992 a!3186) i!1173 k!2102) (size!20413 a!3186)))))

(declare-fun b!749662 () Bool)

(assert (=> b!749662 (= e!418301 e!418304)))

(declare-fun res!505864 () Bool)

(assert (=> b!749662 (=> (not res!505864) (not e!418304))))

(declare-fun lt!333293 () SeekEntryResult!7592)

(assert (=> b!749662 (= res!505864 (or (= lt!333293 (MissingZero!7592 i!1173)) (= lt!333293 (MissingVacant!7592 i!1173))))))

(assert (=> b!749662 (= lt!333293 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!749663 () Bool)

(declare-fun res!505854 () Bool)

(assert (=> b!749663 (=> (not res!505854) (not e!418295))))

(declare-fun e!418299 () Bool)

(assert (=> b!749663 (= res!505854 e!418299)))

(declare-fun c!82282 () Bool)

(assert (=> b!749663 (= c!82282 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749664 () Bool)

(assert (=> b!749664 (= e!418294 (= (seekEntryOrOpen!0 lt!333286 lt!333295 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333286 lt!333295 mask!3328)))))

(declare-fun b!749665 () Bool)

(declare-fun res!505850 () Bool)

(assert (=> b!749665 (=> (not res!505850) (not e!418301))))

(declare-fun arrayContainsKey!0 (array!41757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749665 (= res!505850 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749666 () Bool)

(assert (=> b!749666 (= e!418299 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19992 a!3186) j!159) a!3186 mask!3328) (Found!7592 j!159)))))

(declare-fun b!749667 () Bool)

(declare-fun res!505863 () Bool)

(assert (=> b!749667 (=> (not res!505863) (not e!418301))))

(assert (=> b!749667 (= res!505863 (validKeyInArray!0 k!2102))))

(declare-fun b!749668 () Bool)

(assert (=> b!749668 (= e!418299 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19992 a!3186) j!159) a!3186 mask!3328) lt!333290))))

(declare-fun b!749669 () Bool)

(declare-fun Unit!25750 () Unit!25748)

(assert (=> b!749669 (= e!418298 Unit!25750)))

(assert (=> b!749669 false))

(declare-fun b!749670 () Bool)

(declare-fun Unit!25751 () Unit!25748)

(assert (=> b!749670 (= e!418298 Unit!25751)))

(assert (= (and start!65584 res!505848) b!749653))

(assert (= (and b!749653 res!505853) b!749655))

(assert (= (and b!749655 res!505851) b!749667))

(assert (= (and b!749667 res!505863) b!749665))

(assert (= (and b!749665 res!505850) b!749662))

(assert (= (and b!749662 res!505864) b!749659))

(assert (= (and b!749659 res!505856) b!749656))

(assert (= (and b!749656 res!505861) b!749649))

(assert (= (and b!749649 res!505865) b!749658))

(assert (= (and b!749658 res!505858) b!749657))

(assert (= (and b!749657 res!505855) b!749663))

(assert (= (and b!749663 c!82282) b!749668))

(assert (= (and b!749663 (not c!82282)) b!749666))

(assert (= (and b!749663 res!505854) b!749661))

(assert (= (and b!749661 res!505857) b!749651))

(assert (= (and b!749651 res!505860) b!749650))

(assert (= (and b!749651 (not res!505859)) b!749652))

(assert (= (and b!749652 (not res!505852)) b!749660))

(assert (= (and b!749660 (not res!505849)) b!749654))

(assert (= (and b!749654 c!82281) b!749669))

(assert (= (and b!749654 (not c!82281)) b!749670))

(assert (= (and b!749654 res!505862) b!749664))

(declare-fun m!699211 () Bool)

(assert (=> b!749665 m!699211))

(declare-fun m!699213 () Bool)

(assert (=> b!749664 m!699213))

(declare-fun m!699215 () Bool)

(assert (=> b!749664 m!699215))

(declare-fun m!699217 () Bool)

(assert (=> b!749666 m!699217))

(assert (=> b!749666 m!699217))

(declare-fun m!699219 () Bool)

(assert (=> b!749666 m!699219))

(declare-fun m!699221 () Bool)

(assert (=> b!749659 m!699221))

(assert (=> b!749650 m!699217))

(assert (=> b!749650 m!699217))

(declare-fun m!699223 () Bool)

(assert (=> b!749650 m!699223))

(assert (=> b!749658 m!699217))

(assert (=> b!749658 m!699217))

(declare-fun m!699225 () Bool)

(assert (=> b!749658 m!699225))

(assert (=> b!749658 m!699225))

(assert (=> b!749658 m!699217))

(declare-fun m!699227 () Bool)

(assert (=> b!749658 m!699227))

(assert (=> b!749652 m!699217))

(assert (=> b!749652 m!699217))

(assert (=> b!749652 m!699219))

(declare-fun m!699229 () Bool)

(assert (=> b!749657 m!699229))

(declare-fun m!699231 () Bool)

(assert (=> b!749667 m!699231))

(declare-fun m!699233 () Bool)

(assert (=> b!749656 m!699233))

(declare-fun m!699235 () Bool)

(assert (=> b!749661 m!699235))

(declare-fun m!699237 () Bool)

(assert (=> b!749661 m!699237))

(declare-fun m!699239 () Bool)

(assert (=> b!749661 m!699239))

(declare-fun m!699241 () Bool)

(assert (=> b!749661 m!699241))

(assert (=> b!749661 m!699235))

(declare-fun m!699243 () Bool)

(assert (=> b!749661 m!699243))

(assert (=> b!749660 m!699243))

(declare-fun m!699245 () Bool)

(assert (=> b!749660 m!699245))

(assert (=> b!749655 m!699217))

(assert (=> b!749655 m!699217))

(declare-fun m!699247 () Bool)

(assert (=> b!749655 m!699247))

(assert (=> b!749668 m!699217))

(assert (=> b!749668 m!699217))

(declare-fun m!699249 () Bool)

(assert (=> b!749668 m!699249))

(assert (=> b!749651 m!699217))

(assert (=> b!749651 m!699217))

(declare-fun m!699251 () Bool)

(assert (=> b!749651 m!699251))

(declare-fun m!699253 () Bool)

(assert (=> b!749651 m!699253))

(declare-fun m!699255 () Bool)

(assert (=> b!749651 m!699255))

(declare-fun m!699257 () Bool)

(assert (=> b!749662 m!699257))

(declare-fun m!699259 () Bool)

(assert (=> start!65584 m!699259))

(declare-fun m!699261 () Bool)

(assert (=> start!65584 m!699261))

(push 1)

