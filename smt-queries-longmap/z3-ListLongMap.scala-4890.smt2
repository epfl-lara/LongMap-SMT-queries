; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67454 () Bool)

(assert start!67454)

(declare-fun b!780286 () Bool)

(declare-fun res!527910 () Bool)

(declare-fun e!434076 () Bool)

(assert (=> b!780286 (=> (not res!527910) (not e!434076))))

(declare-fun e!434073 () Bool)

(assert (=> b!780286 (= res!527910 e!434073)))

(declare-fun c!86596 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!780286 (= c!86596 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!527909 () Bool)

(declare-fun e!434078 () Bool)

(assert (=> start!67454 (=> (not res!527909) (not e!434078))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67454 (= res!527909 (validMask!0 mask!3328))))

(assert (=> start!67454 e!434078))

(assert (=> start!67454 true))

(declare-datatypes ((array!42620 0))(
  ( (array!42621 (arr!20401 (Array (_ BitVec 32) (_ BitVec 64))) (size!20822 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42620)

(declare-fun array_inv!16197 (array!42620) Bool)

(assert (=> start!67454 (array_inv!16197 a!3186)))

(declare-fun b!780287 () Bool)

(declare-fun e!434072 () Bool)

(assert (=> b!780287 (= e!434078 e!434072)))

(declare-fun res!527913 () Bool)

(assert (=> b!780287 (=> (not res!527913) (not e!434072))))

(declare-datatypes ((SeekEntryResult!8001 0))(
  ( (MissingZero!8001 (index!34372 (_ BitVec 32))) (Found!8001 (index!34373 (_ BitVec 32))) (Intermediate!8001 (undefined!8813 Bool) (index!34374 (_ BitVec 32)) (x!65323 (_ BitVec 32))) (Undefined!8001) (MissingVacant!8001 (index!34375 (_ BitVec 32))) )
))
(declare-fun lt!347709 () SeekEntryResult!8001)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!780287 (= res!527913 (or (= lt!347709 (MissingZero!8001 i!1173)) (= lt!347709 (MissingVacant!8001 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42620 (_ BitVec 32)) SeekEntryResult!8001)

(assert (=> b!780287 (= lt!347709 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!780288 () Bool)

(declare-fun res!527903 () Bool)

(assert (=> b!780288 (=> (not res!527903) (not e!434072))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!780288 (= res!527903 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20822 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20822 a!3186))))))

(declare-fun e!434070 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!347706 () SeekEntryResult!8001)

(declare-fun b!780289 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42620 (_ BitVec 32)) SeekEntryResult!8001)

(assert (=> b!780289 (= e!434070 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20401 a!3186) j!159) a!3186 mask!3328) lt!347706))))

(declare-fun b!780290 () Bool)

(declare-fun res!527911 () Bool)

(assert (=> b!780290 (=> (not res!527911) (not e!434078))))

(assert (=> b!780290 (= res!527911 (and (= (size!20822 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20822 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20822 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780291 () Bool)

(declare-fun res!527912 () Bool)

(assert (=> b!780291 (=> (not res!527912) (not e!434078))))

(declare-fun arrayContainsKey!0 (array!42620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780291 (= res!527912 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780292 () Bool)

(declare-fun res!527914 () Bool)

(assert (=> b!780292 (=> (not res!527914) (not e!434078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780292 (= res!527914 (validKeyInArray!0 (select (arr!20401 a!3186) j!159)))))

(declare-fun b!780293 () Bool)

(declare-fun lt!347712 () SeekEntryResult!8001)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42620 (_ BitVec 32)) SeekEntryResult!8001)

(assert (=> b!780293 (= e!434073 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20401 a!3186) j!159) a!3186 mask!3328) lt!347712))))

(declare-fun b!780294 () Bool)

(declare-fun res!527908 () Bool)

(assert (=> b!780294 (=> (not res!527908) (not e!434076))))

(assert (=> b!780294 (= res!527908 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20401 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780295 () Bool)

(declare-fun res!527918 () Bool)

(assert (=> b!780295 (=> (not res!527918) (not e!434078))))

(assert (=> b!780295 (= res!527918 (validKeyInArray!0 k0!2102))))

(declare-fun b!780296 () Bool)

(declare-fun e!434074 () Bool)

(declare-fun e!434071 () Bool)

(assert (=> b!780296 (= e!434074 e!434071)))

(declare-fun res!527917 () Bool)

(assert (=> b!780296 (=> res!527917 e!434071)))

(declare-fun lt!347708 () (_ BitVec 64))

(declare-fun lt!347705 () SeekEntryResult!8001)

(assert (=> b!780296 (= res!527917 (or (not (= lt!347705 lt!347706)) (= (select (store (arr!20401 a!3186) i!1173 k0!2102) index!1321) lt!347708) (not (= (select (store (arr!20401 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!780296 (= lt!347705 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20401 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780297 () Bool)

(assert (=> b!780297 (= e!434071 false)))

(declare-fun lt!347711 () SeekEntryResult!8001)

(assert (=> b!780297 (and (= lt!347711 lt!347705) (= lt!347705 (MissingVacant!8001 resIntermediateIndex!5)))))

(declare-fun b!780298 () Bool)

(declare-fun res!527904 () Bool)

(assert (=> b!780298 (=> (not res!527904) (not e!434072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42620 (_ BitVec 32)) Bool)

(assert (=> b!780298 (= res!527904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780299 () Bool)

(declare-fun e!434077 () Bool)

(assert (=> b!780299 (= e!434077 (not e!434074))))

(declare-fun res!527907 () Bool)

(assert (=> b!780299 (=> res!527907 e!434074)))

(declare-fun lt!347707 () SeekEntryResult!8001)

(get-info :version)

(assert (=> b!780299 (= res!527907 (or (not ((_ is Intermediate!8001) lt!347707)) (bvslt x!1131 (x!65323 lt!347707)) (not (= x!1131 (x!65323 lt!347707))) (not (= index!1321 (index!34374 lt!347707)))))))

(assert (=> b!780299 e!434070))

(declare-fun res!527905 () Bool)

(assert (=> b!780299 (=> (not res!527905) (not e!434070))))

(assert (=> b!780299 (= res!527905 (= lt!347711 lt!347706))))

(assert (=> b!780299 (= lt!347706 (Found!8001 j!159))))

(assert (=> b!780299 (= lt!347711 (seekEntryOrOpen!0 (select (arr!20401 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!780299 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26896 0))(
  ( (Unit!26897) )
))
(declare-fun lt!347710 () Unit!26896)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26896)

(assert (=> b!780299 (= lt!347710 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780300 () Bool)

(assert (=> b!780300 (= e!434072 e!434076)))

(declare-fun res!527906 () Bool)

(assert (=> b!780300 (=> (not res!527906) (not e!434076))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780300 (= res!527906 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20401 a!3186) j!159) mask!3328) (select (arr!20401 a!3186) j!159) a!3186 mask!3328) lt!347712))))

(assert (=> b!780300 (= lt!347712 (Intermediate!8001 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780301 () Bool)

(assert (=> b!780301 (= e!434076 e!434077)))

(declare-fun res!527916 () Bool)

(assert (=> b!780301 (=> (not res!527916) (not e!434077))))

(declare-fun lt!347714 () SeekEntryResult!8001)

(assert (=> b!780301 (= res!527916 (= lt!347714 lt!347707))))

(declare-fun lt!347713 () array!42620)

(assert (=> b!780301 (= lt!347707 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347708 lt!347713 mask!3328))))

(assert (=> b!780301 (= lt!347714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347708 mask!3328) lt!347708 lt!347713 mask!3328))))

(assert (=> b!780301 (= lt!347708 (select (store (arr!20401 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!780301 (= lt!347713 (array!42621 (store (arr!20401 a!3186) i!1173 k0!2102) (size!20822 a!3186)))))

(declare-fun b!780302 () Bool)

(declare-fun res!527915 () Bool)

(assert (=> b!780302 (=> (not res!527915) (not e!434072))))

(declare-datatypes ((List!14403 0))(
  ( (Nil!14400) (Cons!14399 (h!15516 (_ BitVec 64)) (t!20718 List!14403)) )
))
(declare-fun arrayNoDuplicates!0 (array!42620 (_ BitVec 32) List!14403) Bool)

(assert (=> b!780302 (= res!527915 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14400))))

(declare-fun b!780303 () Bool)

(assert (=> b!780303 (= e!434073 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20401 a!3186) j!159) a!3186 mask!3328) (Found!8001 j!159)))))

(assert (= (and start!67454 res!527909) b!780290))

(assert (= (and b!780290 res!527911) b!780292))

(assert (= (and b!780292 res!527914) b!780295))

(assert (= (and b!780295 res!527918) b!780291))

(assert (= (and b!780291 res!527912) b!780287))

(assert (= (and b!780287 res!527913) b!780298))

(assert (= (and b!780298 res!527904) b!780302))

(assert (= (and b!780302 res!527915) b!780288))

(assert (= (and b!780288 res!527903) b!780300))

(assert (= (and b!780300 res!527906) b!780294))

(assert (= (and b!780294 res!527908) b!780286))

(assert (= (and b!780286 c!86596) b!780293))

(assert (= (and b!780286 (not c!86596)) b!780303))

(assert (= (and b!780286 res!527910) b!780301))

(assert (= (and b!780301 res!527916) b!780299))

(assert (= (and b!780299 res!527905) b!780289))

(assert (= (and b!780299 (not res!527907)) b!780296))

(assert (= (and b!780296 (not res!527917)) b!780297))

(declare-fun m!723617 () Bool)

(assert (=> b!780293 m!723617))

(assert (=> b!780293 m!723617))

(declare-fun m!723619 () Bool)

(assert (=> b!780293 m!723619))

(assert (=> b!780300 m!723617))

(assert (=> b!780300 m!723617))

(declare-fun m!723621 () Bool)

(assert (=> b!780300 m!723621))

(assert (=> b!780300 m!723621))

(assert (=> b!780300 m!723617))

(declare-fun m!723623 () Bool)

(assert (=> b!780300 m!723623))

(assert (=> b!780292 m!723617))

(assert (=> b!780292 m!723617))

(declare-fun m!723625 () Bool)

(assert (=> b!780292 m!723625))

(assert (=> b!780299 m!723617))

(assert (=> b!780299 m!723617))

(declare-fun m!723627 () Bool)

(assert (=> b!780299 m!723627))

(declare-fun m!723629 () Bool)

(assert (=> b!780299 m!723629))

(declare-fun m!723631 () Bool)

(assert (=> b!780299 m!723631))

(declare-fun m!723633 () Bool)

(assert (=> b!780301 m!723633))

(declare-fun m!723635 () Bool)

(assert (=> b!780301 m!723635))

(declare-fun m!723637 () Bool)

(assert (=> b!780301 m!723637))

(declare-fun m!723639 () Bool)

(assert (=> b!780301 m!723639))

(assert (=> b!780301 m!723635))

(declare-fun m!723641 () Bool)

(assert (=> b!780301 m!723641))

(declare-fun m!723643 () Bool)

(assert (=> b!780302 m!723643))

(assert (=> b!780289 m!723617))

(assert (=> b!780289 m!723617))

(declare-fun m!723645 () Bool)

(assert (=> b!780289 m!723645))

(declare-fun m!723647 () Bool)

(assert (=> b!780294 m!723647))

(declare-fun m!723649 () Bool)

(assert (=> b!780291 m!723649))

(assert (=> b!780303 m!723617))

(assert (=> b!780303 m!723617))

(declare-fun m!723651 () Bool)

(assert (=> b!780303 m!723651))

(declare-fun m!723653 () Bool)

(assert (=> b!780295 m!723653))

(declare-fun m!723655 () Bool)

(assert (=> b!780298 m!723655))

(declare-fun m!723657 () Bool)

(assert (=> b!780287 m!723657))

(assert (=> b!780296 m!723633))

(declare-fun m!723659 () Bool)

(assert (=> b!780296 m!723659))

(assert (=> b!780296 m!723617))

(assert (=> b!780296 m!723617))

(assert (=> b!780296 m!723651))

(declare-fun m!723661 () Bool)

(assert (=> start!67454 m!723661))

(declare-fun m!723663 () Bool)

(assert (=> start!67454 m!723663))

(check-sat (not b!780302) (not b!780301) (not b!780292) (not b!780300) (not b!780296) (not b!780293) (not b!780299) (not start!67454) (not b!780298) (not b!780291) (not b!780295) (not b!780303) (not b!780287) (not b!780289))
(check-sat)
