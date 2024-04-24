; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65502 () Bool)

(assert start!65502)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41545 0))(
  ( (array!41546 (arr!19882 (Array (_ BitVec 32) (_ BitVec 64))) (size!20302 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41545)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!415882 () Bool)

(declare-fun b!744238 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7438 0))(
  ( (MissingZero!7438 (index!32120 (_ BitVec 32))) (Found!7438 (index!32121 (_ BitVec 32))) (Intermediate!7438 (undefined!8250 Bool) (index!32122 (_ BitVec 32)) (x!63248 (_ BitVec 32))) (Undefined!7438) (MissingVacant!7438 (index!32123 (_ BitVec 32))) )
))
(declare-fun lt!330590 () SeekEntryResult!7438)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41545 (_ BitVec 32)) SeekEntryResult!7438)

(assert (=> b!744238 (= e!415882 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19882 a!3186) j!159) a!3186 mask!3328) lt!330590))))

(declare-fun b!744239 () Bool)

(declare-fun e!415885 () Bool)

(assert (=> b!744239 (= e!415885 e!415882)))

(declare-fun res!500898 () Bool)

(assert (=> b!744239 (=> (not res!500898) (not e!415882))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41545 (_ BitVec 32)) SeekEntryResult!7438)

(assert (=> b!744239 (= res!500898 (= (seekEntryOrOpen!0 (select (arr!19882 a!3186) j!159) a!3186 mask!3328) lt!330590))))

(assert (=> b!744239 (= lt!330590 (Found!7438 j!159))))

(declare-fun b!744240 () Bool)

(declare-fun res!500890 () Bool)

(declare-fun e!415883 () Bool)

(assert (=> b!744240 (=> res!500890 e!415883)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lt!330591 () SeekEntryResult!7438)

(declare-fun lt!330587 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!744240 (= res!500890 (or (not (= (select (store (arr!19882 a!3186) i!1173 k0!2102) index!1321) lt!330587)) (undefined!8250 lt!330591)))))

(declare-fun b!744241 () Bool)

(declare-fun res!500894 () Bool)

(assert (=> b!744241 (=> res!500894 e!415883)))

(declare-fun lt!330589 () array!41545)

(assert (=> b!744241 (= res!500894 (not (= (seekEntryOrOpen!0 lt!330587 lt!330589 mask!3328) (Found!7438 index!1321))))))

(declare-fun b!744242 () Bool)

(declare-fun res!500891 () Bool)

(assert (=> b!744242 (=> res!500891 e!415883)))

(assert (=> b!744242 (= res!500891 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun res!500901 () Bool)

(declare-fun e!415881 () Bool)

(assert (=> start!65502 (=> (not res!500901) (not e!415881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65502 (= res!500901 (validMask!0 mask!3328))))

(assert (=> start!65502 e!415881))

(assert (=> start!65502 true))

(declare-fun array_inv!15741 (array!41545) Bool)

(assert (=> start!65502 (array_inv!15741 a!3186)))

(declare-fun b!744243 () Bool)

(declare-fun res!500884 () Bool)

(assert (=> b!744243 (=> (not res!500884) (not e!415881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744243 (= res!500884 (validKeyInArray!0 (select (arr!19882 a!3186) j!159)))))

(declare-fun b!744244 () Bool)

(declare-fun res!500892 () Bool)

(declare-fun e!415880 () Bool)

(assert (=> b!744244 (=> (not res!500892) (not e!415880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41545 (_ BitVec 32)) Bool)

(assert (=> b!744244 (= res!500892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744245 () Bool)

(declare-fun res!500885 () Bool)

(declare-fun e!415884 () Bool)

(assert (=> b!744245 (=> (not res!500885) (not e!415884))))

(declare-fun e!415887 () Bool)

(assert (=> b!744245 (= res!500885 e!415887)))

(declare-fun c!82061 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!744245 (= c!82061 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744246 () Bool)

(declare-fun e!415886 () Bool)

(assert (=> b!744246 (= e!415886 (not e!415883))))

(declare-fun res!500902 () Bool)

(assert (=> b!744246 (=> res!500902 e!415883)))

(get-info :version)

(assert (=> b!744246 (= res!500902 (or (not ((_ is Intermediate!7438) lt!330591)) (bvslt x!1131 (x!63248 lt!330591)) (not (= x!1131 (x!63248 lt!330591))) (not (= index!1321 (index!32122 lt!330591)))))))

(assert (=> b!744246 e!415885))

(declare-fun res!500896 () Bool)

(assert (=> b!744246 (=> (not res!500896) (not e!415885))))

(assert (=> b!744246 (= res!500896 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25435 0))(
  ( (Unit!25436) )
))
(declare-fun lt!330593 () Unit!25435)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25435)

(assert (=> b!744246 (= lt!330593 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744247 () Bool)

(assert (=> b!744247 (= e!415881 e!415880)))

(declare-fun res!500899 () Bool)

(assert (=> b!744247 (=> (not res!500899) (not e!415880))))

(declare-fun lt!330592 () SeekEntryResult!7438)

(assert (=> b!744247 (= res!500899 (or (= lt!330592 (MissingZero!7438 i!1173)) (= lt!330592 (MissingVacant!7438 i!1173))))))

(assert (=> b!744247 (= lt!330592 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744248 () Bool)

(declare-fun lt!330588 () SeekEntryResult!7438)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41545 (_ BitVec 32)) SeekEntryResult!7438)

(assert (=> b!744248 (= e!415887 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19882 a!3186) j!159) a!3186 mask!3328) lt!330588))))

(declare-fun b!744249 () Bool)

(declare-fun res!500889 () Bool)

(assert (=> b!744249 (=> (not res!500889) (not e!415880))))

(declare-datatypes ((List!13791 0))(
  ( (Nil!13788) (Cons!13787 (h!14865 (_ BitVec 64)) (t!20098 List!13791)) )
))
(declare-fun arrayNoDuplicates!0 (array!41545 (_ BitVec 32) List!13791) Bool)

(assert (=> b!744249 (= res!500889 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13788))))

(declare-fun b!744250 () Bool)

(declare-fun res!500888 () Bool)

(assert (=> b!744250 (=> (not res!500888) (not e!415881))))

(assert (=> b!744250 (= res!500888 (validKeyInArray!0 k0!2102))))

(declare-fun b!744251 () Bool)

(assert (=> b!744251 (= e!415883 (validKeyInArray!0 lt!330587))))

(declare-fun b!744252 () Bool)

(assert (=> b!744252 (= e!415887 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19882 a!3186) j!159) a!3186 mask!3328) (Found!7438 j!159)))))

(declare-fun b!744253 () Bool)

(declare-fun res!500886 () Bool)

(assert (=> b!744253 (=> (not res!500886) (not e!415881))))

(assert (=> b!744253 (= res!500886 (and (= (size!20302 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20302 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20302 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744254 () Bool)

(assert (=> b!744254 (= e!415880 e!415884)))

(declare-fun res!500887 () Bool)

(assert (=> b!744254 (=> (not res!500887) (not e!415884))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744254 (= res!500887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19882 a!3186) j!159) mask!3328) (select (arr!19882 a!3186) j!159) a!3186 mask!3328) lt!330588))))

(assert (=> b!744254 (= lt!330588 (Intermediate!7438 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744255 () Bool)

(declare-fun res!500897 () Bool)

(assert (=> b!744255 (=> (not res!500897) (not e!415884))))

(assert (=> b!744255 (= res!500897 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19882 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744256 () Bool)

(declare-fun res!500895 () Bool)

(assert (=> b!744256 (=> res!500895 e!415883)))

(assert (=> b!744256 (= res!500895 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19882 a!3186) j!159) a!3186 mask!3328) (Found!7438 j!159))))))

(declare-fun b!744257 () Bool)

(declare-fun res!500883 () Bool)

(assert (=> b!744257 (=> (not res!500883) (not e!415881))))

(declare-fun arrayContainsKey!0 (array!41545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744257 (= res!500883 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744258 () Bool)

(declare-fun res!500893 () Bool)

(assert (=> b!744258 (=> (not res!500893) (not e!415880))))

(assert (=> b!744258 (= res!500893 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20302 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20302 a!3186))))))

(declare-fun b!744259 () Bool)

(assert (=> b!744259 (= e!415884 e!415886)))

(declare-fun res!500900 () Bool)

(assert (=> b!744259 (=> (not res!500900) (not e!415886))))

(declare-fun lt!330594 () SeekEntryResult!7438)

(assert (=> b!744259 (= res!500900 (= lt!330594 lt!330591))))

(assert (=> b!744259 (= lt!330591 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330587 lt!330589 mask!3328))))

(assert (=> b!744259 (= lt!330594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330587 mask!3328) lt!330587 lt!330589 mask!3328))))

(assert (=> b!744259 (= lt!330587 (select (store (arr!19882 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744259 (= lt!330589 (array!41546 (store (arr!19882 a!3186) i!1173 k0!2102) (size!20302 a!3186)))))

(assert (= (and start!65502 res!500901) b!744253))

(assert (= (and b!744253 res!500886) b!744243))

(assert (= (and b!744243 res!500884) b!744250))

(assert (= (and b!744250 res!500888) b!744257))

(assert (= (and b!744257 res!500883) b!744247))

(assert (= (and b!744247 res!500899) b!744244))

(assert (= (and b!744244 res!500892) b!744249))

(assert (= (and b!744249 res!500889) b!744258))

(assert (= (and b!744258 res!500893) b!744254))

(assert (= (and b!744254 res!500887) b!744255))

(assert (= (and b!744255 res!500897) b!744245))

(assert (= (and b!744245 c!82061) b!744248))

(assert (= (and b!744245 (not c!82061)) b!744252))

(assert (= (and b!744245 res!500885) b!744259))

(assert (= (and b!744259 res!500900) b!744246))

(assert (= (and b!744246 res!500896) b!744239))

(assert (= (and b!744239 res!500898) b!744238))

(assert (= (and b!744246 (not res!500902)) b!744256))

(assert (= (and b!744256 (not res!500895)) b!744240))

(assert (= (and b!744240 (not res!500890)) b!744241))

(assert (= (and b!744241 (not res!500894)) b!744242))

(assert (= (and b!744242 (not res!500891)) b!744251))

(declare-fun m!695331 () Bool)

(assert (=> b!744248 m!695331))

(assert (=> b!744248 m!695331))

(declare-fun m!695333 () Bool)

(assert (=> b!744248 m!695333))

(declare-fun m!695335 () Bool)

(assert (=> b!744257 m!695335))

(assert (=> b!744243 m!695331))

(assert (=> b!744243 m!695331))

(declare-fun m!695337 () Bool)

(assert (=> b!744243 m!695337))

(declare-fun m!695339 () Bool)

(assert (=> b!744249 m!695339))

(declare-fun m!695341 () Bool)

(assert (=> b!744247 m!695341))

(declare-fun m!695343 () Bool)

(assert (=> b!744246 m!695343))

(declare-fun m!695345 () Bool)

(assert (=> b!744246 m!695345))

(declare-fun m!695347 () Bool)

(assert (=> b!744255 m!695347))

(declare-fun m!695349 () Bool)

(assert (=> b!744250 m!695349))

(declare-fun m!695351 () Bool)

(assert (=> b!744259 m!695351))

(declare-fun m!695353 () Bool)

(assert (=> b!744259 m!695353))

(declare-fun m!695355 () Bool)

(assert (=> b!744259 m!695355))

(declare-fun m!695357 () Bool)

(assert (=> b!744259 m!695357))

(assert (=> b!744259 m!695357))

(declare-fun m!695359 () Bool)

(assert (=> b!744259 m!695359))

(assert (=> b!744239 m!695331))

(assert (=> b!744239 m!695331))

(declare-fun m!695361 () Bool)

(assert (=> b!744239 m!695361))

(declare-fun m!695363 () Bool)

(assert (=> b!744241 m!695363))

(declare-fun m!695365 () Bool)

(assert (=> start!65502 m!695365))

(declare-fun m!695367 () Bool)

(assert (=> start!65502 m!695367))

(assert (=> b!744240 m!695351))

(declare-fun m!695369 () Bool)

(assert (=> b!744240 m!695369))

(assert (=> b!744254 m!695331))

(assert (=> b!744254 m!695331))

(declare-fun m!695371 () Bool)

(assert (=> b!744254 m!695371))

(assert (=> b!744254 m!695371))

(assert (=> b!744254 m!695331))

(declare-fun m!695373 () Bool)

(assert (=> b!744254 m!695373))

(declare-fun m!695375 () Bool)

(assert (=> b!744251 m!695375))

(assert (=> b!744252 m!695331))

(assert (=> b!744252 m!695331))

(declare-fun m!695377 () Bool)

(assert (=> b!744252 m!695377))

(declare-fun m!695379 () Bool)

(assert (=> b!744244 m!695379))

(assert (=> b!744238 m!695331))

(assert (=> b!744238 m!695331))

(declare-fun m!695381 () Bool)

(assert (=> b!744238 m!695381))

(assert (=> b!744256 m!695331))

(assert (=> b!744256 m!695331))

(assert (=> b!744256 m!695377))

(check-sat (not b!744259) (not b!744249) (not b!744239) (not start!65502) (not b!744248) (not b!744238) (not b!744254) (not b!744251) (not b!744256) (not b!744252) (not b!744257) (not b!744241) (not b!744244) (not b!744246) (not b!744243) (not b!744247) (not b!744250))
(check-sat)
