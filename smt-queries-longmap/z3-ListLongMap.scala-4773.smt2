; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65678 () Bool)

(assert start!65678)

(declare-fun b!753244 () Bool)

(declare-datatypes ((Unit!25940 0))(
  ( (Unit!25941) )
))
(declare-fun e!420105 () Unit!25940)

(declare-fun Unit!25942 () Unit!25940)

(assert (=> b!753244 (= e!420105 Unit!25942)))

(assert (=> b!753244 false))

(declare-fun b!753245 () Bool)

(declare-fun res!508905 () Bool)

(declare-fun e!420106 () Bool)

(assert (=> b!753245 (=> (not res!508905) (not e!420106))))

(declare-fun lt!335013 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41868 0))(
  ( (array!41869 (arr!20048 (Array (_ BitVec 32) (_ BitVec 64))) (size!20469 (_ BitVec 32))) )
))
(declare-fun lt!335010 () array!41868)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7645 0))(
  ( (MissingZero!7645 (index!32948 (_ BitVec 32))) (Found!7645 (index!32949 (_ BitVec 32))) (Intermediate!7645 (undefined!8457 Bool) (index!32950 (_ BitVec 32)) (x!63870 (_ BitVec 32))) (Undefined!7645) (MissingVacant!7645 (index!32951 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41868 (_ BitVec 32)) SeekEntryResult!7645)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41868 (_ BitVec 32)) SeekEntryResult!7645)

(assert (=> b!753245 (= res!508905 (= (seekEntryOrOpen!0 lt!335013 lt!335010 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335013 lt!335010 mask!3328)))))

(declare-fun b!753246 () Bool)

(declare-fun e!420114 () Bool)

(declare-fun e!420108 () Bool)

(assert (=> b!753246 (= e!420114 e!420108)))

(declare-fun res!508906 () Bool)

(assert (=> b!753246 (=> res!508906 e!420108)))

(declare-fun lt!335021 () SeekEntryResult!7645)

(declare-fun lt!335019 () SeekEntryResult!7645)

(assert (=> b!753246 (= res!508906 (not (= lt!335021 lt!335019)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun a!3186 () array!41868)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!753246 (= lt!335021 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20048 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753247 () Bool)

(declare-fun res!508916 () Bool)

(declare-fun e!420104 () Bool)

(assert (=> b!753247 (=> (not res!508916) (not e!420104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753247 (= res!508916 (validKeyInArray!0 (select (arr!20048 a!3186) j!159)))))

(declare-fun b!753249 () Bool)

(declare-fun res!508914 () Bool)

(assert (=> b!753249 (=> (not res!508914) (not e!420104))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!753249 (= res!508914 (validKeyInArray!0 k0!2102))))

(declare-fun e!420113 () Bool)

(declare-fun b!753250 () Bool)

(declare-fun lt!335015 () SeekEntryResult!7645)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41868 (_ BitVec 32)) SeekEntryResult!7645)

(assert (=> b!753250 (= e!420113 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20048 a!3186) j!159) a!3186 mask!3328) lt!335015))))

(declare-fun b!753251 () Bool)

(declare-fun e!420109 () Bool)

(assert (=> b!753251 (= e!420108 e!420109)))

(declare-fun res!508910 () Bool)

(assert (=> b!753251 (=> res!508910 e!420109)))

(declare-fun lt!335020 () (_ BitVec 64))

(assert (=> b!753251 (= res!508910 (= lt!335020 lt!335013))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753251 (= lt!335020 (select (store (arr!20048 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753252 () Bool)

(declare-fun res!508917 () Bool)

(declare-fun e!420110 () Bool)

(assert (=> b!753252 (=> (not res!508917) (not e!420110))))

(declare-datatypes ((List!14089 0))(
  ( (Nil!14086) (Cons!14085 (h!15157 (_ BitVec 64)) (t!20395 List!14089)) )
))
(declare-fun arrayNoDuplicates!0 (array!41868 (_ BitVec 32) List!14089) Bool)

(assert (=> b!753252 (= res!508917 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14086))))

(declare-fun e!420107 () Bool)

(declare-fun b!753253 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753253 (= e!420107 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20048 a!3186) j!159) a!3186 mask!3328) lt!335019))))

(declare-fun b!753254 () Bool)

(assert (=> b!753254 (= e!420113 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20048 a!3186) j!159) a!3186 mask!3328) (Found!7645 j!159)))))

(declare-fun b!753255 () Bool)

(declare-fun lt!335014 () SeekEntryResult!7645)

(assert (=> b!753255 (= e!420106 (= lt!335014 lt!335021))))

(declare-fun b!753256 () Bool)

(declare-fun res!508904 () Bool)

(declare-fun e!420115 () Bool)

(assert (=> b!753256 (=> (not res!508904) (not e!420115))))

(assert (=> b!753256 (= res!508904 e!420113)))

(declare-fun c!82553 () Bool)

(assert (=> b!753256 (= c!82553 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753257 () Bool)

(declare-fun res!508912 () Bool)

(assert (=> b!753257 (=> (not res!508912) (not e!420115))))

(assert (=> b!753257 (= res!508912 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20048 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753258 () Bool)

(declare-fun res!508902 () Bool)

(assert (=> b!753258 (=> (not res!508902) (not e!420104))))

(declare-fun arrayContainsKey!0 (array!41868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753258 (= res!508902 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753259 () Bool)

(assert (=> b!753259 (= e!420109 true)))

(assert (=> b!753259 e!420106))

(declare-fun res!508907 () Bool)

(assert (=> b!753259 (=> (not res!508907) (not e!420106))))

(assert (=> b!753259 (= res!508907 (= lt!335020 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335016 () Unit!25940)

(assert (=> b!753259 (= lt!335016 e!420105)))

(declare-fun c!82554 () Bool)

(assert (=> b!753259 (= c!82554 (= lt!335020 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753260 () Bool)

(assert (=> b!753260 (= e!420104 e!420110)))

(declare-fun res!508903 () Bool)

(assert (=> b!753260 (=> (not res!508903) (not e!420110))))

(declare-fun lt!335011 () SeekEntryResult!7645)

(assert (=> b!753260 (= res!508903 (or (= lt!335011 (MissingZero!7645 i!1173)) (= lt!335011 (MissingVacant!7645 i!1173))))))

(assert (=> b!753260 (= lt!335011 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!753261 () Bool)

(declare-fun res!508908 () Bool)

(assert (=> b!753261 (=> (not res!508908) (not e!420104))))

(assert (=> b!753261 (= res!508908 (and (= (size!20469 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20469 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20469 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!508915 () Bool)

(assert (=> start!65678 (=> (not res!508915) (not e!420104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65678 (= res!508915 (validMask!0 mask!3328))))

(assert (=> start!65678 e!420104))

(assert (=> start!65678 true))

(declare-fun array_inv!15931 (array!41868) Bool)

(assert (=> start!65678 (array_inv!15931 a!3186)))

(declare-fun b!753248 () Bool)

(declare-fun res!508899 () Bool)

(assert (=> b!753248 (=> (not res!508899) (not e!420110))))

(assert (=> b!753248 (= res!508899 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20469 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20469 a!3186))))))

(declare-fun b!753262 () Bool)

(declare-fun e!420111 () Bool)

(assert (=> b!753262 (= e!420111 (not e!420114))))

(declare-fun res!508900 () Bool)

(assert (=> b!753262 (=> res!508900 e!420114)))

(declare-fun lt!335012 () SeekEntryResult!7645)

(get-info :version)

(assert (=> b!753262 (= res!508900 (or (not ((_ is Intermediate!7645) lt!335012)) (bvslt x!1131 (x!63870 lt!335012)) (not (= x!1131 (x!63870 lt!335012))) (not (= index!1321 (index!32950 lt!335012)))))))

(assert (=> b!753262 e!420107))

(declare-fun res!508913 () Bool)

(assert (=> b!753262 (=> (not res!508913) (not e!420107))))

(assert (=> b!753262 (= res!508913 (= lt!335014 lt!335019))))

(assert (=> b!753262 (= lt!335019 (Found!7645 j!159))))

(assert (=> b!753262 (= lt!335014 (seekEntryOrOpen!0 (select (arr!20048 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41868 (_ BitVec 32)) Bool)

(assert (=> b!753262 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335017 () Unit!25940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25940)

(assert (=> b!753262 (= lt!335017 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753263 () Bool)

(declare-fun Unit!25943 () Unit!25940)

(assert (=> b!753263 (= e!420105 Unit!25943)))

(declare-fun b!753264 () Bool)

(assert (=> b!753264 (= e!420115 e!420111)))

(declare-fun res!508901 () Bool)

(assert (=> b!753264 (=> (not res!508901) (not e!420111))))

(declare-fun lt!335018 () SeekEntryResult!7645)

(assert (=> b!753264 (= res!508901 (= lt!335018 lt!335012))))

(assert (=> b!753264 (= lt!335012 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335013 lt!335010 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753264 (= lt!335018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335013 mask!3328) lt!335013 lt!335010 mask!3328))))

(assert (=> b!753264 (= lt!335013 (select (store (arr!20048 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753264 (= lt!335010 (array!41869 (store (arr!20048 a!3186) i!1173 k0!2102) (size!20469 a!3186)))))

(declare-fun b!753265 () Bool)

(declare-fun res!508911 () Bool)

(assert (=> b!753265 (=> (not res!508911) (not e!420110))))

(assert (=> b!753265 (= res!508911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753266 () Bool)

(assert (=> b!753266 (= e!420110 e!420115)))

(declare-fun res!508909 () Bool)

(assert (=> b!753266 (=> (not res!508909) (not e!420115))))

(assert (=> b!753266 (= res!508909 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20048 a!3186) j!159) mask!3328) (select (arr!20048 a!3186) j!159) a!3186 mask!3328) lt!335015))))

(assert (=> b!753266 (= lt!335015 (Intermediate!7645 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65678 res!508915) b!753261))

(assert (= (and b!753261 res!508908) b!753247))

(assert (= (and b!753247 res!508916) b!753249))

(assert (= (and b!753249 res!508914) b!753258))

(assert (= (and b!753258 res!508902) b!753260))

(assert (= (and b!753260 res!508903) b!753265))

(assert (= (and b!753265 res!508911) b!753252))

(assert (= (and b!753252 res!508917) b!753248))

(assert (= (and b!753248 res!508899) b!753266))

(assert (= (and b!753266 res!508909) b!753257))

(assert (= (and b!753257 res!508912) b!753256))

(assert (= (and b!753256 c!82553) b!753250))

(assert (= (and b!753256 (not c!82553)) b!753254))

(assert (= (and b!753256 res!508904) b!753264))

(assert (= (and b!753264 res!508901) b!753262))

(assert (= (and b!753262 res!508913) b!753253))

(assert (= (and b!753262 (not res!508900)) b!753246))

(assert (= (and b!753246 (not res!508906)) b!753251))

(assert (= (and b!753251 (not res!508910)) b!753259))

(assert (= (and b!753259 c!82554) b!753244))

(assert (= (and b!753259 (not c!82554)) b!753263))

(assert (= (and b!753259 res!508907) b!753245))

(assert (= (and b!753245 res!508905) b!753255))

(declare-fun m!701417 () Bool)

(assert (=> b!753250 m!701417))

(assert (=> b!753250 m!701417))

(declare-fun m!701419 () Bool)

(assert (=> b!753250 m!701419))

(assert (=> b!753253 m!701417))

(assert (=> b!753253 m!701417))

(declare-fun m!701421 () Bool)

(assert (=> b!753253 m!701421))

(declare-fun m!701423 () Bool)

(assert (=> b!753251 m!701423))

(declare-fun m!701425 () Bool)

(assert (=> b!753251 m!701425))

(assert (=> b!753262 m!701417))

(assert (=> b!753262 m!701417))

(declare-fun m!701427 () Bool)

(assert (=> b!753262 m!701427))

(declare-fun m!701429 () Bool)

(assert (=> b!753262 m!701429))

(declare-fun m!701431 () Bool)

(assert (=> b!753262 m!701431))

(declare-fun m!701433 () Bool)

(assert (=> b!753258 m!701433))

(declare-fun m!701435 () Bool)

(assert (=> b!753245 m!701435))

(declare-fun m!701437 () Bool)

(assert (=> b!753245 m!701437))

(assert (=> b!753264 m!701423))

(declare-fun m!701439 () Bool)

(assert (=> b!753264 m!701439))

(declare-fun m!701441 () Bool)

(assert (=> b!753264 m!701441))

(declare-fun m!701443 () Bool)

(assert (=> b!753264 m!701443))

(assert (=> b!753264 m!701439))

(declare-fun m!701445 () Bool)

(assert (=> b!753264 m!701445))

(declare-fun m!701447 () Bool)

(assert (=> b!753252 m!701447))

(assert (=> b!753266 m!701417))

(assert (=> b!753266 m!701417))

(declare-fun m!701449 () Bool)

(assert (=> b!753266 m!701449))

(assert (=> b!753266 m!701449))

(assert (=> b!753266 m!701417))

(declare-fun m!701451 () Bool)

(assert (=> b!753266 m!701451))

(declare-fun m!701453 () Bool)

(assert (=> start!65678 m!701453))

(declare-fun m!701455 () Bool)

(assert (=> start!65678 m!701455))

(declare-fun m!701457 () Bool)

(assert (=> b!753260 m!701457))

(declare-fun m!701459 () Bool)

(assert (=> b!753249 m!701459))

(assert (=> b!753247 m!701417))

(assert (=> b!753247 m!701417))

(declare-fun m!701461 () Bool)

(assert (=> b!753247 m!701461))

(assert (=> b!753254 m!701417))

(assert (=> b!753254 m!701417))

(declare-fun m!701463 () Bool)

(assert (=> b!753254 m!701463))

(declare-fun m!701465 () Bool)

(assert (=> b!753257 m!701465))

(declare-fun m!701467 () Bool)

(assert (=> b!753265 m!701467))

(assert (=> b!753246 m!701417))

(assert (=> b!753246 m!701417))

(assert (=> b!753246 m!701463))

(check-sat (not b!753254) (not b!753258) (not b!753250) (not b!753247) (not b!753246) (not b!753266) (not start!65678) (not b!753252) (not b!753264) (not b!753253) (not b!753260) (not b!753245) (not b!753249) (not b!753262) (not b!753265))
(check-sat)
