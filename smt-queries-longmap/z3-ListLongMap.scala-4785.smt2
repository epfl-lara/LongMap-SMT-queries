; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65750 () Bool)

(assert start!65750)

(declare-fun res!510953 () Bool)

(declare-fun e!421409 () Bool)

(assert (=> start!65750 (=> (not res!510953) (not e!421409))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65750 (= res!510953 (validMask!0 mask!3328))))

(assert (=> start!65750 e!421409))

(assert (=> start!65750 true))

(declare-datatypes ((array!41940 0))(
  ( (array!41941 (arr!20084 (Array (_ BitVec 32) (_ BitVec 64))) (size!20505 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41940)

(declare-fun array_inv!15967 (array!41940) Bool)

(assert (=> start!65750 (array_inv!15967 a!3186)))

(declare-fun b!755728 () Bool)

(declare-fun e!421403 () Bool)

(declare-fun e!421404 () Bool)

(assert (=> b!755728 (= e!421403 e!421404)))

(declare-fun res!510951 () Bool)

(assert (=> b!755728 (=> res!510951 e!421404)))

(declare-datatypes ((SeekEntryResult!7681 0))(
  ( (MissingZero!7681 (index!33092 (_ BitVec 32))) (Found!7681 (index!33093 (_ BitVec 32))) (Intermediate!7681 (undefined!8493 Bool) (index!33094 (_ BitVec 32)) (x!64002 (_ BitVec 32))) (Undefined!7681) (MissingVacant!7681 (index!33095 (_ BitVec 32))) )
))
(declare-fun lt!336313 () SeekEntryResult!7681)

(declare-fun lt!336312 () SeekEntryResult!7681)

(assert (=> b!755728 (= res!510951 (not (= lt!336313 lt!336312)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41940 (_ BitVec 32)) SeekEntryResult!7681)

(assert (=> b!755728 (= lt!336313 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20084 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755729 () Bool)

(declare-fun res!510961 () Bool)

(assert (=> b!755729 (=> (not res!510961) (not e!421409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755729 (= res!510961 (validKeyInArray!0 (select (arr!20084 a!3186) j!159)))))

(declare-fun e!421410 () Bool)

(declare-fun b!755730 () Bool)

(assert (=> b!755730 (= e!421410 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20084 a!3186) j!159) a!3186 mask!3328) (Found!7681 j!159)))))

(declare-fun b!755731 () Bool)

(declare-fun e!421405 () Bool)

(assert (=> b!755731 (= e!421409 e!421405)))

(declare-fun res!510965 () Bool)

(assert (=> b!755731 (=> (not res!510965) (not e!421405))))

(declare-fun lt!336315 () SeekEntryResult!7681)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755731 (= res!510965 (or (= lt!336315 (MissingZero!7681 i!1173)) (= lt!336315 (MissingVacant!7681 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41940 (_ BitVec 32)) SeekEntryResult!7681)

(assert (=> b!755731 (= lt!336315 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755732 () Bool)

(declare-fun res!510967 () Bool)

(declare-fun e!421411 () Bool)

(assert (=> b!755732 (=> (not res!510967) (not e!421411))))

(declare-fun lt!336309 () (_ BitVec 64))

(declare-fun lt!336307 () array!41940)

(assert (=> b!755732 (= res!510967 (= (seekEntryOrOpen!0 lt!336309 lt!336307 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336309 lt!336307 mask!3328)))))

(declare-fun b!755733 () Bool)

(declare-fun res!510964 () Bool)

(declare-fun e!421401 () Bool)

(assert (=> b!755733 (=> (not res!510964) (not e!421401))))

(assert (=> b!755733 (= res!510964 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20084 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!755734 () Bool)

(declare-fun e!421400 () Bool)

(assert (=> b!755734 (= e!421400 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20084 a!3186) j!159) a!3186 mask!3328) lt!336312))))

(declare-fun b!755735 () Bool)

(declare-fun e!421408 () Bool)

(assert (=> b!755735 (= e!421404 e!421408)))

(declare-fun res!510960 () Bool)

(assert (=> b!755735 (=> res!510960 e!421408)))

(declare-fun lt!336306 () (_ BitVec 64))

(assert (=> b!755735 (= res!510960 (= lt!336306 lt!336309))))

(assert (=> b!755735 (= lt!336306 (select (store (arr!20084 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!755736 () Bool)

(declare-fun res!510955 () Bool)

(assert (=> b!755736 (=> (not res!510955) (not e!421405))))

(assert (=> b!755736 (= res!510955 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20505 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20505 a!3186))))))

(declare-fun b!755737 () Bool)

(declare-fun res!510958 () Bool)

(assert (=> b!755737 (=> (not res!510958) (not e!421405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41940 (_ BitVec 32)) Bool)

(assert (=> b!755737 (= res!510958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755738 () Bool)

(declare-fun lt!336316 () SeekEntryResult!7681)

(assert (=> b!755738 (= e!421411 (= lt!336316 lt!336313))))

(declare-fun b!755739 () Bool)

(declare-fun res!510952 () Bool)

(assert (=> b!755739 (=> (not res!510952) (not e!421409))))

(assert (=> b!755739 (= res!510952 (validKeyInArray!0 k0!2102))))

(declare-fun b!755740 () Bool)

(declare-fun e!421407 () Bool)

(assert (=> b!755740 (= e!421407 (not e!421403))))

(declare-fun res!510954 () Bool)

(assert (=> b!755740 (=> res!510954 e!421403)))

(declare-fun lt!336310 () SeekEntryResult!7681)

(get-info :version)

(assert (=> b!755740 (= res!510954 (or (not ((_ is Intermediate!7681) lt!336310)) (bvslt x!1131 (x!64002 lt!336310)) (not (= x!1131 (x!64002 lt!336310))) (not (= index!1321 (index!33094 lt!336310)))))))

(assert (=> b!755740 e!421400))

(declare-fun res!510956 () Bool)

(assert (=> b!755740 (=> (not res!510956) (not e!421400))))

(assert (=> b!755740 (= res!510956 (= lt!336316 lt!336312))))

(assert (=> b!755740 (= lt!336312 (Found!7681 j!159))))

(assert (=> b!755740 (= lt!336316 (seekEntryOrOpen!0 (select (arr!20084 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755740 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26084 0))(
  ( (Unit!26085) )
))
(declare-fun lt!336308 () Unit!26084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41940 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26084)

(assert (=> b!755740 (= lt!336308 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755741 () Bool)

(declare-fun lt!336317 () SeekEntryResult!7681)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41940 (_ BitVec 32)) SeekEntryResult!7681)

(assert (=> b!755741 (= e!421410 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20084 a!3186) j!159) a!3186 mask!3328) lt!336317))))

(declare-fun b!755742 () Bool)

(declare-fun e!421406 () Unit!26084)

(declare-fun Unit!26086 () Unit!26084)

(assert (=> b!755742 (= e!421406 Unit!26086)))

(assert (=> b!755742 false))

(declare-fun b!755743 () Bool)

(declare-fun res!510962 () Bool)

(assert (=> b!755743 (=> (not res!510962) (not e!421401))))

(assert (=> b!755743 (= res!510962 e!421410)))

(declare-fun c!82769 () Bool)

(assert (=> b!755743 (= c!82769 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755744 () Bool)

(declare-fun Unit!26087 () Unit!26084)

(assert (=> b!755744 (= e!421406 Unit!26087)))

(declare-fun b!755745 () Bool)

(assert (=> b!755745 (= e!421405 e!421401)))

(declare-fun res!510963 () Bool)

(assert (=> b!755745 (=> (not res!510963) (not e!421401))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755745 (= res!510963 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20084 a!3186) j!159) mask!3328) (select (arr!20084 a!3186) j!159) a!3186 mask!3328) lt!336317))))

(assert (=> b!755745 (= lt!336317 (Intermediate!7681 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755746 () Bool)

(assert (=> b!755746 (= e!421401 e!421407)))

(declare-fun res!510957 () Bool)

(assert (=> b!755746 (=> (not res!510957) (not e!421407))))

(declare-fun lt!336314 () SeekEntryResult!7681)

(assert (=> b!755746 (= res!510957 (= lt!336314 lt!336310))))

(assert (=> b!755746 (= lt!336310 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336309 lt!336307 mask!3328))))

(assert (=> b!755746 (= lt!336314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336309 mask!3328) lt!336309 lt!336307 mask!3328))))

(assert (=> b!755746 (= lt!336309 (select (store (arr!20084 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755746 (= lt!336307 (array!41941 (store (arr!20084 a!3186) i!1173 k0!2102) (size!20505 a!3186)))))

(declare-fun b!755747 () Bool)

(declare-fun res!510969 () Bool)

(assert (=> b!755747 (=> (not res!510969) (not e!421405))))

(declare-datatypes ((List!14125 0))(
  ( (Nil!14122) (Cons!14121 (h!15193 (_ BitVec 64)) (t!20431 List!14125)) )
))
(declare-fun arrayNoDuplicates!0 (array!41940 (_ BitVec 32) List!14125) Bool)

(assert (=> b!755747 (= res!510969 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14122))))

(declare-fun b!755748 () Bool)

(declare-fun res!510959 () Bool)

(assert (=> b!755748 (=> (not res!510959) (not e!421409))))

(assert (=> b!755748 (= res!510959 (and (= (size!20505 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20505 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20505 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755749 () Bool)

(declare-fun res!510968 () Bool)

(assert (=> b!755749 (=> (not res!510968) (not e!421409))))

(declare-fun arrayContainsKey!0 (array!41940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755749 (= res!510968 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755750 () Bool)

(assert (=> b!755750 (= e!421408 true)))

(assert (=> b!755750 e!421411))

(declare-fun res!510966 () Bool)

(assert (=> b!755750 (=> (not res!510966) (not e!421411))))

(assert (=> b!755750 (= res!510966 (= lt!336306 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336311 () Unit!26084)

(assert (=> b!755750 (= lt!336311 e!421406)))

(declare-fun c!82770 () Bool)

(assert (=> b!755750 (= c!82770 (= lt!336306 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65750 res!510953) b!755748))

(assert (= (and b!755748 res!510959) b!755729))

(assert (= (and b!755729 res!510961) b!755739))

(assert (= (and b!755739 res!510952) b!755749))

(assert (= (and b!755749 res!510968) b!755731))

(assert (= (and b!755731 res!510965) b!755737))

(assert (= (and b!755737 res!510958) b!755747))

(assert (= (and b!755747 res!510969) b!755736))

(assert (= (and b!755736 res!510955) b!755745))

(assert (= (and b!755745 res!510963) b!755733))

(assert (= (and b!755733 res!510964) b!755743))

(assert (= (and b!755743 c!82769) b!755741))

(assert (= (and b!755743 (not c!82769)) b!755730))

(assert (= (and b!755743 res!510962) b!755746))

(assert (= (and b!755746 res!510957) b!755740))

(assert (= (and b!755740 res!510956) b!755734))

(assert (= (and b!755740 (not res!510954)) b!755728))

(assert (= (and b!755728 (not res!510951)) b!755735))

(assert (= (and b!755735 (not res!510960)) b!755750))

(assert (= (and b!755750 c!82770) b!755742))

(assert (= (and b!755750 (not c!82770)) b!755744))

(assert (= (and b!755750 res!510966) b!755732))

(assert (= (and b!755732 res!510967) b!755738))

(declare-fun m!703289 () Bool)

(assert (=> b!755747 m!703289))

(declare-fun m!703291 () Bool)

(assert (=> b!755734 m!703291))

(assert (=> b!755734 m!703291))

(declare-fun m!703293 () Bool)

(assert (=> b!755734 m!703293))

(assert (=> b!755741 m!703291))

(assert (=> b!755741 m!703291))

(declare-fun m!703295 () Bool)

(assert (=> b!755741 m!703295))

(declare-fun m!703297 () Bool)

(assert (=> b!755731 m!703297))

(assert (=> b!755729 m!703291))

(assert (=> b!755729 m!703291))

(declare-fun m!703299 () Bool)

(assert (=> b!755729 m!703299))

(assert (=> b!755740 m!703291))

(assert (=> b!755740 m!703291))

(declare-fun m!703301 () Bool)

(assert (=> b!755740 m!703301))

(declare-fun m!703303 () Bool)

(assert (=> b!755740 m!703303))

(declare-fun m!703305 () Bool)

(assert (=> b!755740 m!703305))

(assert (=> b!755745 m!703291))

(assert (=> b!755745 m!703291))

(declare-fun m!703307 () Bool)

(assert (=> b!755745 m!703307))

(assert (=> b!755745 m!703307))

(assert (=> b!755745 m!703291))

(declare-fun m!703309 () Bool)

(assert (=> b!755745 m!703309))

(assert (=> b!755728 m!703291))

(assert (=> b!755728 m!703291))

(declare-fun m!703311 () Bool)

(assert (=> b!755728 m!703311))

(assert (=> b!755730 m!703291))

(assert (=> b!755730 m!703291))

(assert (=> b!755730 m!703311))

(declare-fun m!703313 () Bool)

(assert (=> b!755732 m!703313))

(declare-fun m!703315 () Bool)

(assert (=> b!755732 m!703315))

(declare-fun m!703317 () Bool)

(assert (=> b!755746 m!703317))

(declare-fun m!703319 () Bool)

(assert (=> b!755746 m!703319))

(declare-fun m!703321 () Bool)

(assert (=> b!755746 m!703321))

(declare-fun m!703323 () Bool)

(assert (=> b!755746 m!703323))

(assert (=> b!755746 m!703317))

(declare-fun m!703325 () Bool)

(assert (=> b!755746 m!703325))

(declare-fun m!703327 () Bool)

(assert (=> b!755749 m!703327))

(declare-fun m!703329 () Bool)

(assert (=> b!755733 m!703329))

(declare-fun m!703331 () Bool)

(assert (=> b!755739 m!703331))

(assert (=> b!755735 m!703319))

(declare-fun m!703333 () Bool)

(assert (=> b!755735 m!703333))

(declare-fun m!703335 () Bool)

(assert (=> b!755737 m!703335))

(declare-fun m!703337 () Bool)

(assert (=> start!65750 m!703337))

(declare-fun m!703339 () Bool)

(assert (=> start!65750 m!703339))

(check-sat (not b!755739) (not b!755729) (not b!755745) (not b!755747) (not b!755740) (not start!65750) (not b!755732) (not b!755741) (not b!755737) (not b!755728) (not b!755734) (not b!755746) (not b!755730) (not b!755749) (not b!755731))
(check-sat)
