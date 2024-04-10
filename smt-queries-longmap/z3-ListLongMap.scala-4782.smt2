; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65754 () Bool)

(assert start!65754)

(declare-fun b!755426 () Bool)

(declare-fun res!510605 () Bool)

(declare-fun e!421268 () Bool)

(assert (=> b!755426 (=> (not res!510605) (not e!421268))))

(declare-datatypes ((array!41927 0))(
  ( (array!41928 (arr!20077 (Array (_ BitVec 32) (_ BitVec 64))) (size!20498 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41927)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41927 (_ BitVec 32)) Bool)

(assert (=> b!755426 (= res!510605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755427 () Bool)

(declare-fun e!421274 () Bool)

(assert (=> b!755427 (= e!421268 e!421274)))

(declare-fun res!510622 () Bool)

(assert (=> b!755427 (=> (not res!510622) (not e!421274))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7677 0))(
  ( (MissingZero!7677 (index!33076 (_ BitVec 32))) (Found!7677 (index!33077 (_ BitVec 32))) (Intermediate!7677 (undefined!8489 Bool) (index!33078 (_ BitVec 32)) (x!63979 (_ BitVec 32))) (Undefined!7677) (MissingVacant!7677 (index!33079 (_ BitVec 32))) )
))
(declare-fun lt!336269 () SeekEntryResult!7677)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41927 (_ BitVec 32)) SeekEntryResult!7677)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755427 (= res!510622 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20077 a!3186) j!159) mask!3328) (select (arr!20077 a!3186) j!159) a!3186 mask!3328) lt!336269))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755427 (= lt!336269 (Intermediate!7677 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755428 () Bool)

(declare-fun res!510613 () Bool)

(assert (=> b!755428 (=> (not res!510613) (not e!421274))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755428 (= res!510613 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20077 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755429 () Bool)

(declare-fun res!510618 () Bool)

(declare-fun e!421277 () Bool)

(assert (=> b!755429 (=> (not res!510618) (not e!421277))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755429 (= res!510618 (validKeyInArray!0 k0!2102))))

(declare-fun b!755430 () Bool)

(declare-fun res!510607 () Bool)

(assert (=> b!755430 (=> (not res!510607) (not e!421277))))

(assert (=> b!755430 (= res!510607 (and (= (size!20498 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20498 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20498 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755431 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!421271 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!755431 (= e!421271 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20077 a!3186) j!159) a!3186 mask!3328) lt!336269))))

(declare-fun b!755432 () Bool)

(declare-fun res!510615 () Bool)

(assert (=> b!755432 (=> (not res!510615) (not e!421277))))

(declare-fun arrayContainsKey!0 (array!41927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755432 (= res!510615 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755434 () Bool)

(declare-fun e!421270 () Bool)

(declare-fun lt!336266 () SeekEntryResult!7677)

(declare-fun lt!336263 () SeekEntryResult!7677)

(assert (=> b!755434 (= e!421270 (= lt!336266 lt!336263))))

(declare-fun b!755435 () Bool)

(declare-fun e!421266 () Bool)

(declare-fun e!421269 () Bool)

(assert (=> b!755435 (= e!421266 (not e!421269))))

(declare-fun res!510609 () Bool)

(assert (=> b!755435 (=> res!510609 e!421269)))

(declare-fun lt!336259 () SeekEntryResult!7677)

(get-info :version)

(assert (=> b!755435 (= res!510609 (or (not ((_ is Intermediate!7677) lt!336259)) (bvslt x!1131 (x!63979 lt!336259)) (not (= x!1131 (x!63979 lt!336259))) (not (= index!1321 (index!33078 lt!336259)))))))

(declare-fun e!421276 () Bool)

(assert (=> b!755435 e!421276))

(declare-fun res!510614 () Bool)

(assert (=> b!755435 (=> (not res!510614) (not e!421276))))

(declare-fun lt!336265 () SeekEntryResult!7677)

(assert (=> b!755435 (= res!510614 (= lt!336266 lt!336265))))

(assert (=> b!755435 (= lt!336265 (Found!7677 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41927 (_ BitVec 32)) SeekEntryResult!7677)

(assert (=> b!755435 (= lt!336266 (seekEntryOrOpen!0 (select (arr!20077 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755435 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26088 0))(
  ( (Unit!26089) )
))
(declare-fun lt!336258 () Unit!26088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26088)

(assert (=> b!755435 (= lt!336258 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755436 () Bool)

(assert (=> b!755436 (= e!421277 e!421268)))

(declare-fun res!510610 () Bool)

(assert (=> b!755436 (=> (not res!510610) (not e!421268))))

(declare-fun lt!336264 () SeekEntryResult!7677)

(assert (=> b!755436 (= res!510610 (or (= lt!336264 (MissingZero!7677 i!1173)) (= lt!336264 (MissingVacant!7677 i!1173))))))

(assert (=> b!755436 (= lt!336264 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755437 () Bool)

(declare-fun res!510617 () Bool)

(assert (=> b!755437 (=> (not res!510617) (not e!421274))))

(assert (=> b!755437 (= res!510617 e!421271)))

(declare-fun c!82791 () Bool)

(assert (=> b!755437 (= c!82791 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755438 () Bool)

(declare-fun res!510620 () Bool)

(assert (=> b!755438 (=> (not res!510620) (not e!421277))))

(assert (=> b!755438 (= res!510620 (validKeyInArray!0 (select (arr!20077 a!3186) j!159)))))

(declare-fun b!755439 () Bool)

(declare-fun res!510608 () Bool)

(assert (=> b!755439 (=> (not res!510608) (not e!421268))))

(declare-datatypes ((List!14079 0))(
  ( (Nil!14076) (Cons!14075 (h!15147 (_ BitVec 64)) (t!20394 List!14079)) )
))
(declare-fun arrayNoDuplicates!0 (array!41927 (_ BitVec 32) List!14079) Bool)

(assert (=> b!755439 (= res!510608 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14076))))

(declare-fun b!755440 () Bool)

(declare-fun res!510623 () Bool)

(assert (=> b!755440 (=> (not res!510623) (not e!421270))))

(declare-fun lt!336268 () (_ BitVec 64))

(declare-fun lt!336262 () array!41927)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41927 (_ BitVec 32)) SeekEntryResult!7677)

(assert (=> b!755440 (= res!510623 (= (seekEntryOrOpen!0 lt!336268 lt!336262 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336268 lt!336262 mask!3328)))))

(declare-fun b!755441 () Bool)

(declare-fun e!421267 () Bool)

(assert (=> b!755441 (= e!421267 true)))

(assert (=> b!755441 e!421270))

(declare-fun res!510619 () Bool)

(assert (=> b!755441 (=> (not res!510619) (not e!421270))))

(declare-fun lt!336267 () (_ BitVec 64))

(assert (=> b!755441 (= res!510619 (= lt!336267 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336260 () Unit!26088)

(declare-fun e!421272 () Unit!26088)

(assert (=> b!755441 (= lt!336260 e!421272)))

(declare-fun c!82792 () Bool)

(assert (=> b!755441 (= c!82792 (= lt!336267 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755442 () Bool)

(assert (=> b!755442 (= e!421276 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20077 a!3186) j!159) a!3186 mask!3328) lt!336265))))

(declare-fun b!755443 () Bool)

(assert (=> b!755443 (= e!421271 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20077 a!3186) j!159) a!3186 mask!3328) (Found!7677 j!159)))))

(declare-fun b!755444 () Bool)

(declare-fun e!421275 () Bool)

(assert (=> b!755444 (= e!421275 e!421267)))

(declare-fun res!510612 () Bool)

(assert (=> b!755444 (=> res!510612 e!421267)))

(assert (=> b!755444 (= res!510612 (= lt!336267 lt!336268))))

(assert (=> b!755444 (= lt!336267 (select (store (arr!20077 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!755445 () Bool)

(declare-fun res!510621 () Bool)

(assert (=> b!755445 (=> (not res!510621) (not e!421268))))

(assert (=> b!755445 (= res!510621 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20498 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20498 a!3186))))))

(declare-fun b!755433 () Bool)

(declare-fun Unit!26090 () Unit!26088)

(assert (=> b!755433 (= e!421272 Unit!26090)))

(declare-fun res!510611 () Bool)

(assert (=> start!65754 (=> (not res!510611) (not e!421277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65754 (= res!510611 (validMask!0 mask!3328))))

(assert (=> start!65754 e!421277))

(assert (=> start!65754 true))

(declare-fun array_inv!15873 (array!41927) Bool)

(assert (=> start!65754 (array_inv!15873 a!3186)))

(declare-fun b!755446 () Bool)

(assert (=> b!755446 (= e!421269 e!421275)))

(declare-fun res!510606 () Bool)

(assert (=> b!755446 (=> res!510606 e!421275)))

(assert (=> b!755446 (= res!510606 (not (= lt!336263 lt!336265)))))

(assert (=> b!755446 (= lt!336263 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20077 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755447 () Bool)

(declare-fun Unit!26091 () Unit!26088)

(assert (=> b!755447 (= e!421272 Unit!26091)))

(assert (=> b!755447 false))

(declare-fun b!755448 () Bool)

(assert (=> b!755448 (= e!421274 e!421266)))

(declare-fun res!510616 () Bool)

(assert (=> b!755448 (=> (not res!510616) (not e!421266))))

(declare-fun lt!336261 () SeekEntryResult!7677)

(assert (=> b!755448 (= res!510616 (= lt!336261 lt!336259))))

(assert (=> b!755448 (= lt!336259 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336268 lt!336262 mask!3328))))

(assert (=> b!755448 (= lt!336261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336268 mask!3328) lt!336268 lt!336262 mask!3328))))

(assert (=> b!755448 (= lt!336268 (select (store (arr!20077 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755448 (= lt!336262 (array!41928 (store (arr!20077 a!3186) i!1173 k0!2102) (size!20498 a!3186)))))

(assert (= (and start!65754 res!510611) b!755430))

(assert (= (and b!755430 res!510607) b!755438))

(assert (= (and b!755438 res!510620) b!755429))

(assert (= (and b!755429 res!510618) b!755432))

(assert (= (and b!755432 res!510615) b!755436))

(assert (= (and b!755436 res!510610) b!755426))

(assert (= (and b!755426 res!510605) b!755439))

(assert (= (and b!755439 res!510608) b!755445))

(assert (= (and b!755445 res!510621) b!755427))

(assert (= (and b!755427 res!510622) b!755428))

(assert (= (and b!755428 res!510613) b!755437))

(assert (= (and b!755437 c!82791) b!755431))

(assert (= (and b!755437 (not c!82791)) b!755443))

(assert (= (and b!755437 res!510617) b!755448))

(assert (= (and b!755448 res!510616) b!755435))

(assert (= (and b!755435 res!510614) b!755442))

(assert (= (and b!755435 (not res!510609)) b!755446))

(assert (= (and b!755446 (not res!510606)) b!755444))

(assert (= (and b!755444 (not res!510612)) b!755441))

(assert (= (and b!755441 c!82792) b!755447))

(assert (= (and b!755441 (not c!82792)) b!755433))

(assert (= (and b!755441 res!510619) b!755440))

(assert (= (and b!755440 res!510623) b!755434))

(declare-fun m!703631 () Bool)

(assert (=> b!755439 m!703631))

(declare-fun m!703633 () Bool)

(assert (=> b!755444 m!703633))

(declare-fun m!703635 () Bool)

(assert (=> b!755444 m!703635))

(declare-fun m!703637 () Bool)

(assert (=> b!755448 m!703637))

(assert (=> b!755448 m!703633))

(declare-fun m!703639 () Bool)

(assert (=> b!755448 m!703639))

(declare-fun m!703641 () Bool)

(assert (=> b!755448 m!703641))

(assert (=> b!755448 m!703637))

(declare-fun m!703643 () Bool)

(assert (=> b!755448 m!703643))

(declare-fun m!703645 () Bool)

(assert (=> b!755427 m!703645))

(assert (=> b!755427 m!703645))

(declare-fun m!703647 () Bool)

(assert (=> b!755427 m!703647))

(assert (=> b!755427 m!703647))

(assert (=> b!755427 m!703645))

(declare-fun m!703649 () Bool)

(assert (=> b!755427 m!703649))

(assert (=> b!755438 m!703645))

(assert (=> b!755438 m!703645))

(declare-fun m!703651 () Bool)

(assert (=> b!755438 m!703651))

(assert (=> b!755431 m!703645))

(assert (=> b!755431 m!703645))

(declare-fun m!703653 () Bool)

(assert (=> b!755431 m!703653))

(assert (=> b!755435 m!703645))

(assert (=> b!755435 m!703645))

(declare-fun m!703655 () Bool)

(assert (=> b!755435 m!703655))

(declare-fun m!703657 () Bool)

(assert (=> b!755435 m!703657))

(declare-fun m!703659 () Bool)

(assert (=> b!755435 m!703659))

(declare-fun m!703661 () Bool)

(assert (=> b!755436 m!703661))

(declare-fun m!703663 () Bool)

(assert (=> b!755428 m!703663))

(assert (=> b!755443 m!703645))

(assert (=> b!755443 m!703645))

(declare-fun m!703665 () Bool)

(assert (=> b!755443 m!703665))

(declare-fun m!703667 () Bool)

(assert (=> b!755429 m!703667))

(declare-fun m!703669 () Bool)

(assert (=> start!65754 m!703669))

(declare-fun m!703671 () Bool)

(assert (=> start!65754 m!703671))

(declare-fun m!703673 () Bool)

(assert (=> b!755432 m!703673))

(assert (=> b!755446 m!703645))

(assert (=> b!755446 m!703645))

(assert (=> b!755446 m!703665))

(declare-fun m!703675 () Bool)

(assert (=> b!755426 m!703675))

(declare-fun m!703677 () Bool)

(assert (=> b!755440 m!703677))

(declare-fun m!703679 () Bool)

(assert (=> b!755440 m!703679))

(assert (=> b!755442 m!703645))

(assert (=> b!755442 m!703645))

(declare-fun m!703681 () Bool)

(assert (=> b!755442 m!703681))

(check-sat (not b!755439) (not b!755442) (not b!755440) (not start!65754) (not b!755438) (not b!755426) (not b!755431) (not b!755427) (not b!755435) (not b!755436) (not b!755448) (not b!755429) (not b!755446) (not b!755432) (not b!755443))
(check-sat)
