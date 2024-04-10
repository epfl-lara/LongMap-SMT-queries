; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65294 () Bool)

(assert start!65294)

(declare-fun b!741290 () Bool)

(declare-fun e!414380 () Bool)

(declare-fun e!414377 () Bool)

(assert (=> b!741290 (= e!414380 e!414377)))

(declare-fun res!498626 () Bool)

(assert (=> b!741290 (=> (not res!498626) (not e!414377))))

(declare-datatypes ((array!41467 0))(
  ( (array!41468 (arr!19847 (Array (_ BitVec 32) (_ BitVec 64))) (size!20268 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41467)

(declare-datatypes ((SeekEntryResult!7447 0))(
  ( (MissingZero!7447 (index!32156 (_ BitVec 32))) (Found!7447 (index!32157 (_ BitVec 32))) (Intermediate!7447 (undefined!8259 Bool) (index!32158 (_ BitVec 32)) (x!63133 (_ BitVec 32))) (Undefined!7447) (MissingVacant!7447 (index!32159 (_ BitVec 32))) )
))
(declare-fun lt!329353 () SeekEntryResult!7447)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41467 (_ BitVec 32)) SeekEntryResult!7447)

(assert (=> b!741290 (= res!498626 (= (seekEntryOrOpen!0 (select (arr!19847 a!3186) j!159) a!3186 mask!3328) lt!329353))))

(assert (=> b!741290 (= lt!329353 (Found!7447 j!159))))

(declare-fun b!741291 () Bool)

(declare-fun res!498621 () Bool)

(declare-fun e!414376 () Bool)

(assert (=> b!741291 (=> (not res!498621) (not e!414376))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741291 (= res!498621 (and (= (size!20268 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20268 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20268 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741292 () Bool)

(declare-fun e!414381 () Bool)

(declare-fun e!414382 () Bool)

(assert (=> b!741292 (= e!414381 e!414382)))

(declare-fun res!498625 () Bool)

(assert (=> b!741292 (=> (not res!498625) (not e!414382))))

(declare-fun lt!329355 () SeekEntryResult!7447)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41467 (_ BitVec 32)) SeekEntryResult!7447)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741292 (= res!498625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19847 a!3186) j!159) mask!3328) (select (arr!19847 a!3186) j!159) a!3186 mask!3328) lt!329355))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741292 (= lt!329355 (Intermediate!7447 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741293 () Bool)

(assert (=> b!741293 (= e!414376 e!414381)))

(declare-fun res!498616 () Bool)

(assert (=> b!741293 (=> (not res!498616) (not e!414381))))

(declare-fun lt!329350 () SeekEntryResult!7447)

(assert (=> b!741293 (= res!498616 (or (= lt!329350 (MissingZero!7447 i!1173)) (= lt!329350 (MissingVacant!7447 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!741293 (= lt!329350 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun lt!329351 () SeekEntryResult!7447)

(declare-fun b!741294 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!414379 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!741294 (= e!414379 (not (or (not (is-Intermediate!7447 lt!329351)) (not (= x!1131 (x!63133 lt!329351))) (not (= index!1321 (index!32158 lt!329351))) (bvsge mask!3328 #b00000000000000000000000000000000))))))

(assert (=> b!741294 e!414380))

(declare-fun res!498628 () Bool)

(assert (=> b!741294 (=> (not res!498628) (not e!414380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41467 (_ BitVec 32)) Bool)

(assert (=> b!741294 (= res!498628 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25374 0))(
  ( (Unit!25375) )
))
(declare-fun lt!329356 () Unit!25374)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25374)

(assert (=> b!741294 (= lt!329356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741295 () Bool)

(declare-fun res!498617 () Bool)

(assert (=> b!741295 (=> (not res!498617) (not e!414382))))

(declare-fun e!414378 () Bool)

(assert (=> b!741295 (= res!498617 e!414378)))

(declare-fun c!81718 () Bool)

(assert (=> b!741295 (= c!81718 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741296 () Bool)

(declare-fun res!498627 () Bool)

(assert (=> b!741296 (=> (not res!498627) (not e!414376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741296 (= res!498627 (validKeyInArray!0 k!2102))))

(declare-fun res!498623 () Bool)

(assert (=> start!65294 (=> (not res!498623) (not e!414376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65294 (= res!498623 (validMask!0 mask!3328))))

(assert (=> start!65294 e!414376))

(assert (=> start!65294 true))

(declare-fun array_inv!15643 (array!41467) Bool)

(assert (=> start!65294 (array_inv!15643 a!3186)))

(declare-fun b!741297 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41467 (_ BitVec 32)) SeekEntryResult!7447)

(assert (=> b!741297 (= e!414378 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19847 a!3186) j!159) a!3186 mask!3328) (Found!7447 j!159)))))

(declare-fun b!741298 () Bool)

(assert (=> b!741298 (= e!414382 e!414379)))

(declare-fun res!498619 () Bool)

(assert (=> b!741298 (=> (not res!498619) (not e!414379))))

(declare-fun lt!329354 () SeekEntryResult!7447)

(assert (=> b!741298 (= res!498619 (= lt!329354 lt!329351))))

(declare-fun lt!329357 () (_ BitVec 64))

(declare-fun lt!329352 () array!41467)

(assert (=> b!741298 (= lt!329351 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329357 lt!329352 mask!3328))))

(assert (=> b!741298 (= lt!329354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329357 mask!3328) lt!329357 lt!329352 mask!3328))))

(assert (=> b!741298 (= lt!329357 (select (store (arr!19847 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!741298 (= lt!329352 (array!41468 (store (arr!19847 a!3186) i!1173 k!2102) (size!20268 a!3186)))))

(declare-fun b!741299 () Bool)

(declare-fun res!498620 () Bool)

(assert (=> b!741299 (=> (not res!498620) (not e!414382))))

(assert (=> b!741299 (= res!498620 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19847 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741300 () Bool)

(declare-fun res!498624 () Bool)

(assert (=> b!741300 (=> (not res!498624) (not e!414381))))

(assert (=> b!741300 (= res!498624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741301 () Bool)

(declare-fun res!498618 () Bool)

(assert (=> b!741301 (=> (not res!498618) (not e!414376))))

(assert (=> b!741301 (= res!498618 (validKeyInArray!0 (select (arr!19847 a!3186) j!159)))))

(declare-fun b!741302 () Bool)

(declare-fun res!498622 () Bool)

(assert (=> b!741302 (=> (not res!498622) (not e!414381))))

(declare-datatypes ((List!13849 0))(
  ( (Nil!13846) (Cons!13845 (h!14917 (_ BitVec 64)) (t!20164 List!13849)) )
))
(declare-fun arrayNoDuplicates!0 (array!41467 (_ BitVec 32) List!13849) Bool)

(assert (=> b!741302 (= res!498622 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13846))))

(declare-fun b!741303 () Bool)

(declare-fun res!498615 () Bool)

(assert (=> b!741303 (=> (not res!498615) (not e!414381))))

(assert (=> b!741303 (= res!498615 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20268 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20268 a!3186))))))

(declare-fun b!741304 () Bool)

(declare-fun res!498629 () Bool)

(assert (=> b!741304 (=> (not res!498629) (not e!414376))))

(declare-fun arrayContainsKey!0 (array!41467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741304 (= res!498629 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741305 () Bool)

(assert (=> b!741305 (= e!414377 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19847 a!3186) j!159) a!3186 mask!3328) lt!329353))))

(declare-fun b!741306 () Bool)

(assert (=> b!741306 (= e!414378 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19847 a!3186) j!159) a!3186 mask!3328) lt!329355))))

(assert (= (and start!65294 res!498623) b!741291))

(assert (= (and b!741291 res!498621) b!741301))

(assert (= (and b!741301 res!498618) b!741296))

(assert (= (and b!741296 res!498627) b!741304))

(assert (= (and b!741304 res!498629) b!741293))

(assert (= (and b!741293 res!498616) b!741300))

(assert (= (and b!741300 res!498624) b!741302))

(assert (= (and b!741302 res!498622) b!741303))

(assert (= (and b!741303 res!498615) b!741292))

(assert (= (and b!741292 res!498625) b!741299))

(assert (= (and b!741299 res!498620) b!741295))

(assert (= (and b!741295 c!81718) b!741306))

(assert (= (and b!741295 (not c!81718)) b!741297))

(assert (= (and b!741295 res!498617) b!741298))

(assert (= (and b!741298 res!498619) b!741294))

(assert (= (and b!741294 res!498628) b!741290))

(assert (= (and b!741290 res!498626) b!741305))

(declare-fun m!692277 () Bool)

(assert (=> b!741305 m!692277))

(assert (=> b!741305 m!692277))

(declare-fun m!692279 () Bool)

(assert (=> b!741305 m!692279))

(declare-fun m!692281 () Bool)

(assert (=> b!741304 m!692281))

(assert (=> b!741292 m!692277))

(assert (=> b!741292 m!692277))

(declare-fun m!692283 () Bool)

(assert (=> b!741292 m!692283))

(assert (=> b!741292 m!692283))

(assert (=> b!741292 m!692277))

(declare-fun m!692285 () Bool)

(assert (=> b!741292 m!692285))

(declare-fun m!692287 () Bool)

(assert (=> b!741294 m!692287))

(declare-fun m!692289 () Bool)

(assert (=> b!741294 m!692289))

(declare-fun m!692291 () Bool)

(assert (=> b!741300 m!692291))

(declare-fun m!692293 () Bool)

(assert (=> b!741302 m!692293))

(declare-fun m!692295 () Bool)

(assert (=> start!65294 m!692295))

(declare-fun m!692297 () Bool)

(assert (=> start!65294 m!692297))

(assert (=> b!741297 m!692277))

(assert (=> b!741297 m!692277))

(declare-fun m!692299 () Bool)

(assert (=> b!741297 m!692299))

(declare-fun m!692301 () Bool)

(assert (=> b!741298 m!692301))

(declare-fun m!692303 () Bool)

(assert (=> b!741298 m!692303))

(declare-fun m!692305 () Bool)

(assert (=> b!741298 m!692305))

(declare-fun m!692307 () Bool)

(assert (=> b!741298 m!692307))

(declare-fun m!692309 () Bool)

(assert (=> b!741298 m!692309))

(assert (=> b!741298 m!692307))

(assert (=> b!741306 m!692277))

(assert (=> b!741306 m!692277))

(declare-fun m!692311 () Bool)

(assert (=> b!741306 m!692311))

(declare-fun m!692313 () Bool)

(assert (=> b!741296 m!692313))

(assert (=> b!741290 m!692277))

(assert (=> b!741290 m!692277))

(declare-fun m!692315 () Bool)

(assert (=> b!741290 m!692315))

(assert (=> b!741301 m!692277))

(assert (=> b!741301 m!692277))

(declare-fun m!692317 () Bool)

(assert (=> b!741301 m!692317))

(declare-fun m!692319 () Bool)

(assert (=> b!741299 m!692319))

(declare-fun m!692321 () Bool)

(assert (=> b!741293 m!692321))

(push 1)

