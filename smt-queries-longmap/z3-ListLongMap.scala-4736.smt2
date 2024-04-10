; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65478 () Bool)

(assert start!65478)

(declare-fun b!746365 () Bool)

(declare-fun e!416806 () Bool)

(declare-fun e!416808 () Bool)

(assert (=> b!746365 (= e!416806 e!416808)))

(declare-fun res!503141 () Bool)

(assert (=> b!746365 (=> (not res!503141) (not e!416808))))

(declare-datatypes ((SeekEntryResult!7539 0))(
  ( (MissingZero!7539 (index!32524 (_ BitVec 32))) (Found!7539 (index!32525 (_ BitVec 32))) (Intermediate!7539 (undefined!8351 Bool) (index!32526 (_ BitVec 32)) (x!63473 (_ BitVec 32))) (Undefined!7539) (MissingVacant!7539 (index!32527 (_ BitVec 32))) )
))
(declare-fun lt!331677 () SeekEntryResult!7539)

(declare-fun lt!331682 () SeekEntryResult!7539)

(assert (=> b!746365 (= res!503141 (= lt!331677 lt!331682))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41651 0))(
  ( (array!41652 (arr!19939 (Array (_ BitVec 32) (_ BitVec 64))) (size!20360 (_ BitVec 32))) )
))
(declare-fun lt!331683 () array!41651)

(declare-fun lt!331685 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41651 (_ BitVec 32)) SeekEntryResult!7539)

(assert (=> b!746365 (= lt!331682 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331685 lt!331683 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746365 (= lt!331677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331685 mask!3328) lt!331685 lt!331683 mask!3328))))

(declare-fun a!3186 () array!41651)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!746365 (= lt!331685 (select (store (arr!19939 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746365 (= lt!331683 (array!41652 (store (arr!19939 a!3186) i!1173 k0!2102) (size!20360 a!3186)))))

(declare-fun b!746366 () Bool)

(declare-fun res!503148 () Bool)

(assert (=> b!746366 (=> (not res!503148) (not e!416806))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!746366 (= res!503148 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19939 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746367 () Bool)

(declare-fun res!503140 () Bool)

(assert (=> b!746367 (=> (not res!503140) (not e!416806))))

(declare-fun e!416810 () Bool)

(assert (=> b!746367 (= res!503140 e!416810)))

(declare-fun c!81994 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746367 (= c!81994 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746368 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41651 (_ BitVec 32)) SeekEntryResult!7539)

(assert (=> b!746368 (= e!416810 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19939 a!3186) j!159) a!3186 mask!3328) (Found!7539 j!159)))))

(declare-fun lt!331676 () SeekEntryResult!7539)

(declare-fun b!746369 () Bool)

(assert (=> b!746369 (= e!416810 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19939 a!3186) j!159) a!3186 mask!3328) lt!331676))))

(declare-fun b!746370 () Bool)

(declare-fun e!416809 () Bool)

(assert (=> b!746370 (= e!416808 (not e!416809))))

(declare-fun res!503143 () Bool)

(assert (=> b!746370 (=> res!503143 e!416809)))

(get-info :version)

(assert (=> b!746370 (= res!503143 (or (not ((_ is Intermediate!7539) lt!331682)) (bvslt x!1131 (x!63473 lt!331682)) (not (= x!1131 (x!63473 lt!331682))) (not (= index!1321 (index!32526 lt!331682)))))))

(declare-fun e!416812 () Bool)

(assert (=> b!746370 e!416812))

(declare-fun res!503146 () Bool)

(assert (=> b!746370 (=> (not res!503146) (not e!416812))))

(declare-fun lt!331684 () SeekEntryResult!7539)

(declare-fun lt!331678 () SeekEntryResult!7539)

(assert (=> b!746370 (= res!503146 (= lt!331684 lt!331678))))

(assert (=> b!746370 (= lt!331678 (Found!7539 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41651 (_ BitVec 32)) SeekEntryResult!7539)

(assert (=> b!746370 (= lt!331684 (seekEntryOrOpen!0 (select (arr!19939 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41651 (_ BitVec 32)) Bool)

(assert (=> b!746370 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25558 0))(
  ( (Unit!25559) )
))
(declare-fun lt!331679 () Unit!25558)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25558)

(assert (=> b!746370 (= lt!331679 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746371 () Bool)

(assert (=> b!746371 (= e!416812 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19939 a!3186) j!159) a!3186 mask!3328) lt!331678))))

(declare-fun b!746372 () Bool)

(declare-fun e!416807 () Bool)

(assert (=> b!746372 (= e!416807 e!416806)))

(declare-fun res!503138 () Bool)

(assert (=> b!746372 (=> (not res!503138) (not e!416806))))

(assert (=> b!746372 (= res!503138 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19939 a!3186) j!159) mask!3328) (select (arr!19939 a!3186) j!159) a!3186 mask!3328) lt!331676))))

(assert (=> b!746372 (= lt!331676 (Intermediate!7539 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746373 () Bool)

(declare-fun e!416813 () Bool)

(assert (=> b!746373 (= e!416809 e!416813)))

(declare-fun res!503144 () Bool)

(assert (=> b!746373 (=> res!503144 e!416813)))

(declare-fun lt!331681 () SeekEntryResult!7539)

(assert (=> b!746373 (= res!503144 (or (not (= lt!331681 lt!331678)) (= (select (store (arr!19939 a!3186) i!1173 k0!2102) index!1321) lt!331685) (not (= (select (store (arr!19939 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746373 (= lt!331681 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19939 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746374 () Bool)

(declare-fun res!503151 () Bool)

(declare-fun e!416811 () Bool)

(assert (=> b!746374 (=> (not res!503151) (not e!416811))))

(assert (=> b!746374 (= res!503151 (and (= (size!20360 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20360 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20360 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746375 () Bool)

(declare-fun res!503153 () Bool)

(assert (=> b!746375 (=> (not res!503153) (not e!416811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746375 (= res!503153 (validKeyInArray!0 (select (arr!19939 a!3186) j!159)))))

(declare-fun b!746376 () Bool)

(declare-fun res!503142 () Bool)

(assert (=> b!746376 (=> (not res!503142) (not e!416807))))

(assert (=> b!746376 (= res!503142 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20360 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20360 a!3186))))))

(declare-fun b!746377 () Bool)

(declare-fun res!503149 () Bool)

(assert (=> b!746377 (=> (not res!503149) (not e!416807))))

(declare-datatypes ((List!13941 0))(
  ( (Nil!13938) (Cons!13937 (h!15009 (_ BitVec 64)) (t!20256 List!13941)) )
))
(declare-fun arrayNoDuplicates!0 (array!41651 (_ BitVec 32) List!13941) Bool)

(assert (=> b!746377 (= res!503149 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13938))))

(declare-fun b!746378 () Bool)

(declare-fun res!503139 () Bool)

(assert (=> b!746378 (=> (not res!503139) (not e!416811))))

(declare-fun arrayContainsKey!0 (array!41651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746378 (= res!503139 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746379 () Bool)

(assert (=> b!746379 (= e!416813 true)))

(assert (=> b!746379 (= lt!331684 lt!331681)))

(declare-fun b!746380 () Bool)

(declare-fun res!503147 () Bool)

(assert (=> b!746380 (=> (not res!503147) (not e!416811))))

(assert (=> b!746380 (= res!503147 (validKeyInArray!0 k0!2102))))

(declare-fun b!746381 () Bool)

(declare-fun res!503150 () Bool)

(assert (=> b!746381 (=> (not res!503150) (not e!416807))))

(assert (=> b!746381 (= res!503150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746382 () Bool)

(assert (=> b!746382 (= e!416811 e!416807)))

(declare-fun res!503152 () Bool)

(assert (=> b!746382 (=> (not res!503152) (not e!416807))))

(declare-fun lt!331680 () SeekEntryResult!7539)

(assert (=> b!746382 (= res!503152 (or (= lt!331680 (MissingZero!7539 i!1173)) (= lt!331680 (MissingVacant!7539 i!1173))))))

(assert (=> b!746382 (= lt!331680 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!503145 () Bool)

(assert (=> start!65478 (=> (not res!503145) (not e!416811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65478 (= res!503145 (validMask!0 mask!3328))))

(assert (=> start!65478 e!416811))

(assert (=> start!65478 true))

(declare-fun array_inv!15735 (array!41651) Bool)

(assert (=> start!65478 (array_inv!15735 a!3186)))

(assert (= (and start!65478 res!503145) b!746374))

(assert (= (and b!746374 res!503151) b!746375))

(assert (= (and b!746375 res!503153) b!746380))

(assert (= (and b!746380 res!503147) b!746378))

(assert (= (and b!746378 res!503139) b!746382))

(assert (= (and b!746382 res!503152) b!746381))

(assert (= (and b!746381 res!503150) b!746377))

(assert (= (and b!746377 res!503149) b!746376))

(assert (= (and b!746376 res!503142) b!746372))

(assert (= (and b!746372 res!503138) b!746366))

(assert (= (and b!746366 res!503148) b!746367))

(assert (= (and b!746367 c!81994) b!746369))

(assert (= (and b!746367 (not c!81994)) b!746368))

(assert (= (and b!746367 res!503140) b!746365))

(assert (= (and b!746365 res!503141) b!746370))

(assert (= (and b!746370 res!503146) b!746371))

(assert (= (and b!746370 (not res!503143)) b!746373))

(assert (= (and b!746373 (not res!503144)) b!746379))

(declare-fun m!696631 () Bool)

(assert (=> b!746371 m!696631))

(assert (=> b!746371 m!696631))

(declare-fun m!696633 () Bool)

(assert (=> b!746371 m!696633))

(declare-fun m!696635 () Bool)

(assert (=> b!746378 m!696635))

(assert (=> b!746375 m!696631))

(assert (=> b!746375 m!696631))

(declare-fun m!696637 () Bool)

(assert (=> b!746375 m!696637))

(declare-fun m!696639 () Bool)

(assert (=> b!746381 m!696639))

(declare-fun m!696641 () Bool)

(assert (=> b!746380 m!696641))

(assert (=> b!746368 m!696631))

(assert (=> b!746368 m!696631))

(declare-fun m!696643 () Bool)

(assert (=> b!746368 m!696643))

(declare-fun m!696645 () Bool)

(assert (=> start!65478 m!696645))

(declare-fun m!696647 () Bool)

(assert (=> start!65478 m!696647))

(declare-fun m!696649 () Bool)

(assert (=> b!746366 m!696649))

(declare-fun m!696651 () Bool)

(assert (=> b!746373 m!696651))

(declare-fun m!696653 () Bool)

(assert (=> b!746373 m!696653))

(assert (=> b!746373 m!696631))

(assert (=> b!746373 m!696631))

(assert (=> b!746373 m!696643))

(assert (=> b!746365 m!696651))

(declare-fun m!696655 () Bool)

(assert (=> b!746365 m!696655))

(declare-fun m!696657 () Bool)

(assert (=> b!746365 m!696657))

(declare-fun m!696659 () Bool)

(assert (=> b!746365 m!696659))

(assert (=> b!746365 m!696659))

(declare-fun m!696661 () Bool)

(assert (=> b!746365 m!696661))

(declare-fun m!696663 () Bool)

(assert (=> b!746377 m!696663))

(assert (=> b!746370 m!696631))

(assert (=> b!746370 m!696631))

(declare-fun m!696665 () Bool)

(assert (=> b!746370 m!696665))

(declare-fun m!696667 () Bool)

(assert (=> b!746370 m!696667))

(declare-fun m!696669 () Bool)

(assert (=> b!746370 m!696669))

(declare-fun m!696671 () Bool)

(assert (=> b!746382 m!696671))

(assert (=> b!746372 m!696631))

(assert (=> b!746372 m!696631))

(declare-fun m!696673 () Bool)

(assert (=> b!746372 m!696673))

(assert (=> b!746372 m!696673))

(assert (=> b!746372 m!696631))

(declare-fun m!696675 () Bool)

(assert (=> b!746372 m!696675))

(assert (=> b!746369 m!696631))

(assert (=> b!746369 m!696631))

(declare-fun m!696677 () Bool)

(assert (=> b!746369 m!696677))

(check-sat (not b!746372) (not b!746365) (not b!746371) (not b!746370) (not b!746373) (not b!746375) (not b!746380) (not b!746377) (not start!65478) (not b!746382) (not b!746378) (not b!746369) (not b!746368) (not b!746381))
(check-sat)
