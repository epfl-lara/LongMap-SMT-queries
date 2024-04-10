; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67672 () Bool)

(assert start!67672)

(declare-fun b!783896 () Bool)

(declare-fun e!435849 () Bool)

(declare-datatypes ((SeekEntryResult!8044 0))(
  ( (MissingZero!8044 (index!34544 (_ BitVec 32))) (Found!8044 (index!34545 (_ BitVec 32))) (Intermediate!8044 (undefined!8856 Bool) (index!34546 (_ BitVec 32)) (x!65496 (_ BitVec 32))) (Undefined!8044) (MissingVacant!8044 (index!34547 (_ BitVec 32))) )
))
(declare-fun lt!349405 () SeekEntryResult!8044)

(declare-fun lt!349402 () SeekEntryResult!8044)

(assert (=> b!783896 (= e!435849 (= lt!349405 lt!349402))))

(declare-fun b!783898 () Bool)

(declare-fun res!530405 () Bool)

(declare-fun e!435860 () Bool)

(assert (=> b!783898 (=> (not res!530405) (not e!435860))))

(declare-datatypes ((array!42712 0))(
  ( (array!42713 (arr!20444 (Array (_ BitVec 32) (_ BitVec 64))) (size!20865 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42712)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!783898 (= res!530405 (and (= (size!20865 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20865 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20865 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!435857 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!783899 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42712 (_ BitVec 32)) SeekEntryResult!8044)

(assert (=> b!783899 (= e!435857 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20444 a!3186) j!159) a!3186 mask!3328) (Found!8044 j!159)))))

(declare-fun b!783900 () Bool)

(declare-fun e!435852 () Bool)

(declare-fun e!435850 () Bool)

(assert (=> b!783900 (= e!435852 e!435850)))

(declare-fun res!530387 () Bool)

(assert (=> b!783900 (=> res!530387 e!435850)))

(declare-fun lt!349410 () (_ BitVec 64))

(declare-fun lt!349401 () (_ BitVec 64))

(assert (=> b!783900 (= res!530387 (= lt!349410 lt!349401))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!783900 (= lt!349410 (select (store (arr!20444 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!783901 () Bool)

(declare-fun res!530393 () Bool)

(assert (=> b!783901 (=> (not res!530393) (not e!435849))))

(declare-fun lt!349409 () array!42712)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42712 (_ BitVec 32)) SeekEntryResult!8044)

(assert (=> b!783901 (= res!530393 (= (seekEntryOrOpen!0 lt!349401 lt!349409 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349401 lt!349409 mask!3328)))))

(declare-fun b!783902 () Bool)

(declare-fun e!435853 () Bool)

(assert (=> b!783902 (= e!435860 e!435853)))

(declare-fun res!530404 () Bool)

(assert (=> b!783902 (=> (not res!530404) (not e!435853))))

(declare-fun lt!349406 () SeekEntryResult!8044)

(assert (=> b!783902 (= res!530404 (or (= lt!349406 (MissingZero!8044 i!1173)) (= lt!349406 (MissingVacant!8044 i!1173))))))

(assert (=> b!783902 (= lt!349406 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!783903 () Bool)

(declare-fun e!435854 () Bool)

(declare-fun lt!349407 () SeekEntryResult!8044)

(assert (=> b!783903 (= e!435854 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20444 a!3186) j!159) a!3186 mask!3328) lt!349407))))

(declare-fun b!783904 () Bool)

(declare-fun res!530398 () Bool)

(assert (=> b!783904 (=> (not res!530398) (not e!435853))))

(assert (=> b!783904 (= res!530398 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20865 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20865 a!3186))))))

(declare-fun b!783905 () Bool)

(declare-fun lt!349412 () SeekEntryResult!8044)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42712 (_ BitVec 32)) SeekEntryResult!8044)

(assert (=> b!783905 (= e!435857 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20444 a!3186) j!159) a!3186 mask!3328) lt!349412))))

(declare-fun b!783906 () Bool)

(declare-fun e!435859 () Bool)

(assert (=> b!783906 (= e!435859 e!435852)))

(declare-fun res!530397 () Bool)

(assert (=> b!783906 (=> res!530397 e!435852)))

(assert (=> b!783906 (= res!530397 (not (= lt!349402 lt!349407)))))

(assert (=> b!783906 (= lt!349402 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20444 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!530389 () Bool)

(assert (=> start!67672 (=> (not res!530389) (not e!435860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67672 (= res!530389 (validMask!0 mask!3328))))

(assert (=> start!67672 e!435860))

(assert (=> start!67672 true))

(declare-fun array_inv!16240 (array!42712) Bool)

(assert (=> start!67672 (array_inv!16240 a!3186)))

(declare-fun b!783897 () Bool)

(declare-datatypes ((Unit!27064 0))(
  ( (Unit!27065) )
))
(declare-fun e!435856 () Unit!27064)

(declare-fun Unit!27066 () Unit!27064)

(assert (=> b!783897 (= e!435856 Unit!27066)))

(assert (=> b!783897 false))

(declare-fun b!783907 () Bool)

(declare-fun res!530394 () Bool)

(assert (=> b!783907 (=> (not res!530394) (not e!435860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783907 (= res!530394 (validKeyInArray!0 (select (arr!20444 a!3186) j!159)))))

(declare-fun b!783908 () Bool)

(assert (=> b!783908 (= e!435850 true)))

(assert (=> b!783908 e!435849))

(declare-fun res!530401 () Bool)

(assert (=> b!783908 (=> (not res!530401) (not e!435849))))

(assert (=> b!783908 (= res!530401 (= lt!349410 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349404 () Unit!27064)

(assert (=> b!783908 (= lt!349404 e!435856)))

(declare-fun c!87162 () Bool)

(assert (=> b!783908 (= c!87162 (= lt!349410 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783909 () Bool)

(declare-fun res!530395 () Bool)

(assert (=> b!783909 (=> (not res!530395) (not e!435853))))

(declare-datatypes ((List!14446 0))(
  ( (Nil!14443) (Cons!14442 (h!15565 (_ BitVec 64)) (t!20761 List!14446)) )
))
(declare-fun arrayNoDuplicates!0 (array!42712 (_ BitVec 32) List!14446) Bool)

(assert (=> b!783909 (= res!530395 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14443))))

(declare-fun b!783910 () Bool)

(declare-fun res!530392 () Bool)

(assert (=> b!783910 (=> (not res!530392) (not e!435860))))

(assert (=> b!783910 (= res!530392 (validKeyInArray!0 k!2102))))

(declare-fun b!783911 () Bool)

(declare-fun res!530402 () Bool)

(declare-fun e!435851 () Bool)

(assert (=> b!783911 (=> (not res!530402) (not e!435851))))

(assert (=> b!783911 (= res!530402 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20444 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783912 () Bool)

(declare-fun Unit!27067 () Unit!27064)

(assert (=> b!783912 (= e!435856 Unit!27067)))

(declare-fun b!783913 () Bool)

(assert (=> b!783913 (= e!435853 e!435851)))

(declare-fun res!530388 () Bool)

(assert (=> b!783913 (=> (not res!530388) (not e!435851))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783913 (= res!530388 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20444 a!3186) j!159) mask!3328) (select (arr!20444 a!3186) j!159) a!3186 mask!3328) lt!349412))))

(assert (=> b!783913 (= lt!349412 (Intermediate!8044 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783914 () Bool)

(declare-fun res!530400 () Bool)

(assert (=> b!783914 (=> (not res!530400) (not e!435851))))

(assert (=> b!783914 (= res!530400 e!435857)))

(declare-fun c!87163 () Bool)

(assert (=> b!783914 (= c!87163 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783915 () Bool)

(declare-fun e!435858 () Bool)

(assert (=> b!783915 (= e!435858 (not e!435859))))

(declare-fun res!530391 () Bool)

(assert (=> b!783915 (=> res!530391 e!435859)))

(declare-fun lt!349403 () SeekEntryResult!8044)

(assert (=> b!783915 (= res!530391 (or (not (is-Intermediate!8044 lt!349403)) (bvslt x!1131 (x!65496 lt!349403)) (not (= x!1131 (x!65496 lt!349403))) (not (= index!1321 (index!34546 lt!349403)))))))

(assert (=> b!783915 e!435854))

(declare-fun res!530399 () Bool)

(assert (=> b!783915 (=> (not res!530399) (not e!435854))))

(assert (=> b!783915 (= res!530399 (= lt!349405 lt!349407))))

(assert (=> b!783915 (= lt!349407 (Found!8044 j!159))))

(assert (=> b!783915 (= lt!349405 (seekEntryOrOpen!0 (select (arr!20444 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42712 (_ BitVec 32)) Bool)

(assert (=> b!783915 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349411 () Unit!27064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27064)

(assert (=> b!783915 (= lt!349411 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783916 () Bool)

(declare-fun res!530403 () Bool)

(assert (=> b!783916 (=> (not res!530403) (not e!435853))))

(assert (=> b!783916 (= res!530403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783917 () Bool)

(declare-fun res!530396 () Bool)

(assert (=> b!783917 (=> (not res!530396) (not e!435860))))

(declare-fun arrayContainsKey!0 (array!42712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783917 (= res!530396 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783918 () Bool)

(assert (=> b!783918 (= e!435851 e!435858)))

(declare-fun res!530390 () Bool)

(assert (=> b!783918 (=> (not res!530390) (not e!435858))))

(declare-fun lt!349408 () SeekEntryResult!8044)

(assert (=> b!783918 (= res!530390 (= lt!349408 lt!349403))))

(assert (=> b!783918 (= lt!349403 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349401 lt!349409 mask!3328))))

(assert (=> b!783918 (= lt!349408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349401 mask!3328) lt!349401 lt!349409 mask!3328))))

(assert (=> b!783918 (= lt!349401 (select (store (arr!20444 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!783918 (= lt!349409 (array!42713 (store (arr!20444 a!3186) i!1173 k!2102) (size!20865 a!3186)))))

(assert (= (and start!67672 res!530389) b!783898))

(assert (= (and b!783898 res!530405) b!783907))

(assert (= (and b!783907 res!530394) b!783910))

(assert (= (and b!783910 res!530392) b!783917))

(assert (= (and b!783917 res!530396) b!783902))

(assert (= (and b!783902 res!530404) b!783916))

(assert (= (and b!783916 res!530403) b!783909))

(assert (= (and b!783909 res!530395) b!783904))

(assert (= (and b!783904 res!530398) b!783913))

(assert (= (and b!783913 res!530388) b!783911))

(assert (= (and b!783911 res!530402) b!783914))

(assert (= (and b!783914 c!87163) b!783905))

(assert (= (and b!783914 (not c!87163)) b!783899))

(assert (= (and b!783914 res!530400) b!783918))

(assert (= (and b!783918 res!530390) b!783915))

(assert (= (and b!783915 res!530399) b!783903))

(assert (= (and b!783915 (not res!530391)) b!783906))

(assert (= (and b!783906 (not res!530397)) b!783900))

(assert (= (and b!783900 (not res!530387)) b!783908))

(assert (= (and b!783908 c!87162) b!783897))

(assert (= (and b!783908 (not c!87162)) b!783912))

(assert (= (and b!783908 res!530401) b!783901))

(assert (= (and b!783901 res!530393) b!783896))

(declare-fun m!726349 () Bool)

(assert (=> b!783905 m!726349))

(assert (=> b!783905 m!726349))

(declare-fun m!726351 () Bool)

(assert (=> b!783905 m!726351))

(assert (=> b!783903 m!726349))

(assert (=> b!783903 m!726349))

(declare-fun m!726353 () Bool)

(assert (=> b!783903 m!726353))

(declare-fun m!726355 () Bool)

(assert (=> b!783910 m!726355))

(declare-fun m!726357 () Bool)

(assert (=> b!783917 m!726357))

(declare-fun m!726359 () Bool)

(assert (=> b!783918 m!726359))

(declare-fun m!726361 () Bool)

(assert (=> b!783918 m!726361))

(assert (=> b!783918 m!726359))

(declare-fun m!726363 () Bool)

(assert (=> b!783918 m!726363))

(declare-fun m!726365 () Bool)

(assert (=> b!783918 m!726365))

(declare-fun m!726367 () Bool)

(assert (=> b!783918 m!726367))

(declare-fun m!726369 () Bool)

(assert (=> b!783902 m!726369))

(declare-fun m!726371 () Bool)

(assert (=> b!783911 m!726371))

(declare-fun m!726373 () Bool)

(assert (=> b!783916 m!726373))

(declare-fun m!726375 () Bool)

(assert (=> b!783901 m!726375))

(declare-fun m!726377 () Bool)

(assert (=> b!783901 m!726377))

(assert (=> b!783906 m!726349))

(assert (=> b!783906 m!726349))

(declare-fun m!726379 () Bool)

(assert (=> b!783906 m!726379))

(assert (=> b!783899 m!726349))

(assert (=> b!783899 m!726349))

(assert (=> b!783899 m!726379))

(assert (=> b!783900 m!726361))

(declare-fun m!726381 () Bool)

(assert (=> b!783900 m!726381))

(assert (=> b!783915 m!726349))

(assert (=> b!783915 m!726349))

(declare-fun m!726383 () Bool)

(assert (=> b!783915 m!726383))

(declare-fun m!726385 () Bool)

(assert (=> b!783915 m!726385))

(declare-fun m!726387 () Bool)

(assert (=> b!783915 m!726387))

(assert (=> b!783907 m!726349))

(assert (=> b!783907 m!726349))

(declare-fun m!726389 () Bool)

(assert (=> b!783907 m!726389))

(declare-fun m!726391 () Bool)

(assert (=> start!67672 m!726391))

(declare-fun m!726393 () Bool)

(assert (=> start!67672 m!726393))

(assert (=> b!783913 m!726349))

(assert (=> b!783913 m!726349))

(declare-fun m!726395 () Bool)

(assert (=> b!783913 m!726395))

(assert (=> b!783913 m!726395))

(assert (=> b!783913 m!726349))

(declare-fun m!726397 () Bool)

(assert (=> b!783913 m!726397))

(declare-fun m!726399 () Bool)

(assert (=> b!783909 m!726399))

(push 1)

(assert (not b!783902))

(assert (not b!783916))

(assert (not b!783909))

(assert (not b!783906))

(assert (not b!783899))

(assert (not b!783913))

(assert (not start!67672))

(assert (not b!783903))

(assert (not b!783907))

(assert (not b!783901))

(assert (not b!783905))

(assert (not b!783910))

(assert (not b!783918))

