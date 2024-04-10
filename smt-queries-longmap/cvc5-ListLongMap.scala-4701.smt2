; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65266 () Bool)

(assert start!65266)

(declare-fun b!740367 () Bool)

(declare-fun e!413937 () Bool)

(declare-fun e!413940 () Bool)

(assert (=> b!740367 (= e!413937 (not e!413940))))

(declare-fun res!497886 () Bool)

(assert (=> b!740367 (=> res!497886 e!413940)))

(declare-datatypes ((SeekEntryResult!7433 0))(
  ( (MissingZero!7433 (index!32100 (_ BitVec 32))) (Found!7433 (index!32101 (_ BitVec 32))) (Intermediate!7433 (undefined!8245 Bool) (index!32102 (_ BitVec 32)) (x!63087 (_ BitVec 32))) (Undefined!7433) (MissingVacant!7433 (index!32103 (_ BitVec 32))) )
))
(declare-fun lt!328889 () SeekEntryResult!7433)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!740367 (= res!497886 (or (not (is-Intermediate!7433 lt!328889)) (bvsge x!1131 (x!63087 lt!328889))))))

(declare-fun lt!328895 () SeekEntryResult!7433)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!740367 (= lt!328895 (Found!7433 j!159))))

(declare-fun e!413934 () Bool)

(assert (=> b!740367 e!413934))

(declare-fun res!497877 () Bool)

(assert (=> b!740367 (=> (not res!497877) (not e!413934))))

(declare-datatypes ((array!41439 0))(
  ( (array!41440 (arr!19833 (Array (_ BitVec 32) (_ BitVec 64))) (size!20254 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41439)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41439 (_ BitVec 32)) Bool)

(assert (=> b!740367 (= res!497877 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25328 0))(
  ( (Unit!25329) )
))
(declare-fun lt!328890 () Unit!25328)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25328)

(assert (=> b!740367 (= lt!328890 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740368 () Bool)

(declare-fun e!413931 () Bool)

(assert (=> b!740368 (= e!413931 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun lt!328888 () (_ BitVec 64))

(declare-fun lt!328884 () array!41439)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41439 (_ BitVec 32)) SeekEntryResult!7433)

(assert (=> b!740368 (= (seekEntryOrOpen!0 lt!328888 lt!328884 mask!3328) lt!328895)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!328887 () Unit!25328)

(declare-fun lt!328885 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41439 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25328)

(assert (=> b!740368 (= lt!328887 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!328885 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!740369 () Bool)

(assert (=> b!740369 (= e!413940 e!413931)))

(declare-fun res!497878 () Bool)

(assert (=> b!740369 (=> res!497878 e!413931)))

(assert (=> b!740369 (= res!497878 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328885 #b00000000000000000000000000000000) (bvsge lt!328885 (size!20254 a!3186))))))

(declare-fun lt!328894 () Unit!25328)

(declare-fun e!413939 () Unit!25328)

(assert (=> b!740369 (= lt!328894 e!413939)))

(declare-fun c!81628 () Bool)

(declare-fun lt!328892 () Bool)

(assert (=> b!740369 (= c!81628 lt!328892)))

(assert (=> b!740369 (= lt!328892 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740369 (= lt!328885 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun e!413933 () Bool)

(declare-fun b!740370 () Bool)

(declare-fun lt!328891 () SeekEntryResult!7433)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41439 (_ BitVec 32)) SeekEntryResult!7433)

(assert (=> b!740370 (= e!413933 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19833 a!3186) j!159) a!3186 mask!3328) lt!328891))))

(declare-fun b!740371 () Bool)

(declare-fun e!413941 () Bool)

(declare-fun e!413932 () Bool)

(assert (=> b!740371 (= e!413941 e!413932)))

(declare-fun res!497890 () Bool)

(assert (=> b!740371 (=> (not res!497890) (not e!413932))))

(declare-fun lt!328883 () SeekEntryResult!7433)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41439 (_ BitVec 32)) SeekEntryResult!7433)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740371 (= res!497890 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19833 a!3186) j!159) mask!3328) (select (arr!19833 a!3186) j!159) a!3186 mask!3328) lt!328883))))

(assert (=> b!740371 (= lt!328883 (Intermediate!7433 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740372 () Bool)

(declare-fun res!497881 () Bool)

(assert (=> b!740372 (=> (not res!497881) (not e!413941))))

(assert (=> b!740372 (= res!497881 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20254 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20254 a!3186))))))

(declare-fun e!413942 () Bool)

(declare-fun b!740373 () Bool)

(assert (=> b!740373 (= e!413942 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328885 (select (arr!19833 a!3186) j!159) a!3186 mask!3328) lt!328883)))))

(declare-fun b!740374 () Bool)

(declare-fun e!413935 () Bool)

(assert (=> b!740374 (= e!413935 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19833 a!3186) j!159) a!3186 mask!3328) (Found!7433 j!159)))))

(declare-fun b!740375 () Bool)

(assert (=> b!740375 (= e!413932 e!413937)))

(declare-fun res!497884 () Bool)

(assert (=> b!740375 (=> (not res!497884) (not e!413937))))

(declare-fun lt!328882 () SeekEntryResult!7433)

(assert (=> b!740375 (= res!497884 (= lt!328882 lt!328889))))

(assert (=> b!740375 (= lt!328889 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328888 lt!328884 mask!3328))))

(assert (=> b!740375 (= lt!328882 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328888 mask!3328) lt!328888 lt!328884 mask!3328))))

(assert (=> b!740375 (= lt!328888 (select (store (arr!19833 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!740375 (= lt!328884 (array!41440 (store (arr!19833 a!3186) i!1173 k!2102) (size!20254 a!3186)))))

(declare-fun b!740376 () Bool)

(declare-fun res!497892 () Bool)

(assert (=> b!740376 (=> (not res!497892) (not e!413941))))

(assert (=> b!740376 (= res!497892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740377 () Bool)

(declare-fun res!497882 () Bool)

(declare-fun e!413938 () Bool)

(assert (=> b!740377 (=> (not res!497882) (not e!413938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740377 (= res!497882 (validKeyInArray!0 k!2102))))

(declare-fun b!740379 () Bool)

(declare-fun Unit!25330 () Unit!25328)

(assert (=> b!740379 (= e!413939 Unit!25330)))

(assert (=> b!740379 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328885 (select (arr!19833 a!3186) j!159) a!3186 mask!3328) lt!328883)))

(declare-fun b!740380 () Bool)

(declare-fun res!497894 () Bool)

(assert (=> b!740380 (=> (not res!497894) (not e!413932))))

(assert (=> b!740380 (= res!497894 e!413935)))

(declare-fun c!81627 () Bool)

(assert (=> b!740380 (= c!81627 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740381 () Bool)

(declare-fun res!497891 () Bool)

(assert (=> b!740381 (=> res!497891 e!413931)))

(assert (=> b!740381 (= res!497891 e!413942)))

(declare-fun c!81626 () Bool)

(assert (=> b!740381 (= c!81626 lt!328892)))

(declare-fun b!740382 () Bool)

(assert (=> b!740382 (= e!413938 e!413941)))

(declare-fun res!497879 () Bool)

(assert (=> b!740382 (=> (not res!497879) (not e!413941))))

(declare-fun lt!328893 () SeekEntryResult!7433)

(assert (=> b!740382 (= res!497879 (or (= lt!328893 (MissingZero!7433 i!1173)) (= lt!328893 (MissingVacant!7433 i!1173))))))

(assert (=> b!740382 (= lt!328893 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!740383 () Bool)

(declare-fun res!497885 () Bool)

(assert (=> b!740383 (=> (not res!497885) (not e!413941))))

(declare-datatypes ((List!13835 0))(
  ( (Nil!13832) (Cons!13831 (h!14903 (_ BitVec 64)) (t!20150 List!13835)) )
))
(declare-fun arrayNoDuplicates!0 (array!41439 (_ BitVec 32) List!13835) Bool)

(assert (=> b!740383 (= res!497885 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13832))))

(declare-fun b!740384 () Bool)

(declare-fun res!497887 () Bool)

(assert (=> b!740384 (=> res!497887 e!413931)))

(assert (=> b!740384 (= res!497887 (not (= lt!328882 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328885 lt!328888 lt!328884 mask!3328))))))

(declare-fun b!740385 () Bool)

(declare-fun Unit!25331 () Unit!25328)

(assert (=> b!740385 (= e!413939 Unit!25331)))

(declare-fun lt!328886 () SeekEntryResult!7433)

(assert (=> b!740385 (= lt!328886 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19833 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!740385 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328885 resIntermediateIndex!5 (select (arr!19833 a!3186) j!159) a!3186 mask!3328) lt!328895)))

(declare-fun b!740386 () Bool)

(declare-fun res!497883 () Bool)

(assert (=> b!740386 (=> (not res!497883) (not e!413938))))

(assert (=> b!740386 (= res!497883 (validKeyInArray!0 (select (arr!19833 a!3186) j!159)))))

(declare-fun b!740387 () Bool)

(declare-fun res!497893 () Bool)

(assert (=> b!740387 (=> (not res!497893) (not e!413938))))

(assert (=> b!740387 (= res!497893 (and (= (size!20254 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20254 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20254 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740388 () Bool)

(assert (=> b!740388 (= e!413935 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19833 a!3186) j!159) a!3186 mask!3328) lt!328883))))

(declare-fun b!740389 () Bool)

(assert (=> b!740389 (= e!413942 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328885 resIntermediateIndex!5 (select (arr!19833 a!3186) j!159) a!3186 mask!3328) lt!328895)))))

(declare-fun b!740378 () Bool)

(declare-fun res!497889 () Bool)

(assert (=> b!740378 (=> (not res!497889) (not e!413938))))

(declare-fun arrayContainsKey!0 (array!41439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740378 (= res!497889 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!497876 () Bool)

(assert (=> start!65266 (=> (not res!497876) (not e!413938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65266 (= res!497876 (validMask!0 mask!3328))))

(assert (=> start!65266 e!413938))

(assert (=> start!65266 true))

(declare-fun array_inv!15629 (array!41439) Bool)

(assert (=> start!65266 (array_inv!15629 a!3186)))

(declare-fun b!740390 () Bool)

(declare-fun res!497888 () Bool)

(assert (=> b!740390 (=> (not res!497888) (not e!413932))))

(assert (=> b!740390 (= res!497888 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19833 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740391 () Bool)

(assert (=> b!740391 (= e!413934 e!413933)))

(declare-fun res!497880 () Bool)

(assert (=> b!740391 (=> (not res!497880) (not e!413933))))

(assert (=> b!740391 (= res!497880 (= (seekEntryOrOpen!0 (select (arr!19833 a!3186) j!159) a!3186 mask!3328) lt!328891))))

(assert (=> b!740391 (= lt!328891 (Found!7433 j!159))))

(assert (= (and start!65266 res!497876) b!740387))

(assert (= (and b!740387 res!497893) b!740386))

(assert (= (and b!740386 res!497883) b!740377))

(assert (= (and b!740377 res!497882) b!740378))

(assert (= (and b!740378 res!497889) b!740382))

(assert (= (and b!740382 res!497879) b!740376))

(assert (= (and b!740376 res!497892) b!740383))

(assert (= (and b!740383 res!497885) b!740372))

(assert (= (and b!740372 res!497881) b!740371))

(assert (= (and b!740371 res!497890) b!740390))

(assert (= (and b!740390 res!497888) b!740380))

(assert (= (and b!740380 c!81627) b!740388))

(assert (= (and b!740380 (not c!81627)) b!740374))

(assert (= (and b!740380 res!497894) b!740375))

(assert (= (and b!740375 res!497884) b!740367))

(assert (= (and b!740367 res!497877) b!740391))

(assert (= (and b!740391 res!497880) b!740370))

(assert (= (and b!740367 (not res!497886)) b!740369))

(assert (= (and b!740369 c!81628) b!740379))

(assert (= (and b!740369 (not c!81628)) b!740385))

(assert (= (and b!740369 (not res!497878)) b!740381))

(assert (= (and b!740381 c!81626) b!740373))

(assert (= (and b!740381 (not c!81626)) b!740389))

(assert (= (and b!740381 (not res!497891)) b!740384))

(assert (= (and b!740384 (not res!497887)) b!740368))

(declare-fun m!691519 () Bool)

(assert (=> b!740382 m!691519))

(declare-fun m!691521 () Bool)

(assert (=> b!740388 m!691521))

(assert (=> b!740388 m!691521))

(declare-fun m!691523 () Bool)

(assert (=> b!740388 m!691523))

(assert (=> b!740386 m!691521))

(assert (=> b!740386 m!691521))

(declare-fun m!691525 () Bool)

(assert (=> b!740386 m!691525))

(declare-fun m!691527 () Bool)

(assert (=> b!740383 m!691527))

(assert (=> b!740374 m!691521))

(assert (=> b!740374 m!691521))

(declare-fun m!691529 () Bool)

(assert (=> b!740374 m!691529))

(declare-fun m!691531 () Bool)

(assert (=> b!740384 m!691531))

(declare-fun m!691533 () Bool)

(assert (=> b!740368 m!691533))

(declare-fun m!691535 () Bool)

(assert (=> b!740368 m!691535))

(assert (=> b!740385 m!691521))

(assert (=> b!740385 m!691521))

(assert (=> b!740385 m!691529))

(assert (=> b!740385 m!691521))

(declare-fun m!691537 () Bool)

(assert (=> b!740385 m!691537))

(declare-fun m!691539 () Bool)

(assert (=> start!65266 m!691539))

(declare-fun m!691541 () Bool)

(assert (=> start!65266 m!691541))

(declare-fun m!691543 () Bool)

(assert (=> b!740367 m!691543))

(declare-fun m!691545 () Bool)

(assert (=> b!740367 m!691545))

(declare-fun m!691547 () Bool)

(assert (=> b!740375 m!691547))

(declare-fun m!691549 () Bool)

(assert (=> b!740375 m!691549))

(assert (=> b!740375 m!691547))

(declare-fun m!691551 () Bool)

(assert (=> b!740375 m!691551))

(declare-fun m!691553 () Bool)

(assert (=> b!740375 m!691553))

(declare-fun m!691555 () Bool)

(assert (=> b!740375 m!691555))

(assert (=> b!740370 m!691521))

(assert (=> b!740370 m!691521))

(declare-fun m!691557 () Bool)

(assert (=> b!740370 m!691557))

(assert (=> b!740371 m!691521))

(assert (=> b!740371 m!691521))

(declare-fun m!691559 () Bool)

(assert (=> b!740371 m!691559))

(assert (=> b!740371 m!691559))

(assert (=> b!740371 m!691521))

(declare-fun m!691561 () Bool)

(assert (=> b!740371 m!691561))

(declare-fun m!691563 () Bool)

(assert (=> b!740377 m!691563))

(declare-fun m!691565 () Bool)

(assert (=> b!740369 m!691565))

(assert (=> b!740391 m!691521))

(assert (=> b!740391 m!691521))

(declare-fun m!691567 () Bool)

(assert (=> b!740391 m!691567))

(assert (=> b!740379 m!691521))

(assert (=> b!740379 m!691521))

(declare-fun m!691569 () Bool)

(assert (=> b!740379 m!691569))

(declare-fun m!691571 () Bool)

(assert (=> b!740376 m!691571))

(declare-fun m!691573 () Bool)

(assert (=> b!740378 m!691573))

(assert (=> b!740389 m!691521))

(assert (=> b!740389 m!691521))

(assert (=> b!740389 m!691537))

(assert (=> b!740373 m!691521))

(assert (=> b!740373 m!691521))

(assert (=> b!740373 m!691569))

(declare-fun m!691575 () Bool)

(assert (=> b!740390 m!691575))

(push 1)

