; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65480 () Bool)

(assert start!65480)

(declare-fun b!746419 () Bool)

(declare-fun res!503188 () Bool)

(declare-fun e!416836 () Bool)

(assert (=> b!746419 (=> (not res!503188) (not e!416836))))

(declare-datatypes ((array!41653 0))(
  ( (array!41654 (arr!19940 (Array (_ BitVec 32) (_ BitVec 64))) (size!20361 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41653)

(declare-datatypes ((List!13942 0))(
  ( (Nil!13939) (Cons!13938 (h!15010 (_ BitVec 64)) (t!20257 List!13942)) )
))
(declare-fun arrayNoDuplicates!0 (array!41653 (_ BitVec 32) List!13942) Bool)

(assert (=> b!746419 (= res!503188 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13939))))

(declare-fun b!746420 () Bool)

(declare-fun res!503196 () Bool)

(declare-fun e!416837 () Bool)

(assert (=> b!746420 (=> (not res!503196) (not e!416837))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746420 (= res!503196 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746421 () Bool)

(declare-fun res!503194 () Bool)

(declare-fun e!416835 () Bool)

(assert (=> b!746421 (=> (not res!503194) (not e!416835))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746421 (= res!503194 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19940 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746422 () Bool)

(declare-fun e!416833 () Bool)

(assert (=> b!746422 (= e!416835 e!416833)))

(declare-fun res!503199 () Bool)

(assert (=> b!746422 (=> (not res!503199) (not e!416833))))

(declare-datatypes ((SeekEntryResult!7540 0))(
  ( (MissingZero!7540 (index!32528 (_ BitVec 32))) (Found!7540 (index!32529 (_ BitVec 32))) (Intermediate!7540 (undefined!8352 Bool) (index!32530 (_ BitVec 32)) (x!63474 (_ BitVec 32))) (Undefined!7540) (MissingVacant!7540 (index!32531 (_ BitVec 32))) )
))
(declare-fun lt!331715 () SeekEntryResult!7540)

(declare-fun lt!331714 () SeekEntryResult!7540)

(assert (=> b!746422 (= res!503199 (= lt!331715 lt!331714))))

(declare-fun lt!331711 () array!41653)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!331713 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41653 (_ BitVec 32)) SeekEntryResult!7540)

(assert (=> b!746422 (= lt!331714 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331713 lt!331711 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746422 (= lt!331715 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331713 mask!3328) lt!331713 lt!331711 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!746422 (= lt!331713 (select (store (arr!19940 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!746422 (= lt!331711 (array!41654 (store (arr!19940 a!3186) i!1173 k!2102) (size!20361 a!3186)))))

(declare-fun b!746423 () Bool)

(assert (=> b!746423 (= e!416837 e!416836)))

(declare-fun res!503189 () Bool)

(assert (=> b!746423 (=> (not res!503189) (not e!416836))))

(declare-fun lt!331710 () SeekEntryResult!7540)

(assert (=> b!746423 (= res!503189 (or (= lt!331710 (MissingZero!7540 i!1173)) (= lt!331710 (MissingVacant!7540 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41653 (_ BitVec 32)) SeekEntryResult!7540)

(assert (=> b!746423 (= lt!331710 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!746425 () Bool)

(declare-fun res!503193 () Bool)

(assert (=> b!746425 (=> (not res!503193) (not e!416837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746425 (= res!503193 (validKeyInArray!0 k!2102))))

(declare-fun b!746426 () Bool)

(declare-fun e!416834 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41653 (_ BitVec 32)) SeekEntryResult!7540)

(assert (=> b!746426 (= e!416834 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19940 a!3186) j!159) a!3186 mask!3328) (Found!7540 j!159)))))

(declare-fun b!746427 () Bool)

(declare-fun res!503192 () Bool)

(assert (=> b!746427 (=> (not res!503192) (not e!416836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41653 (_ BitVec 32)) Bool)

(assert (=> b!746427 (= res!503192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746428 () Bool)

(declare-fun e!416840 () Bool)

(declare-fun e!416838 () Bool)

(assert (=> b!746428 (= e!416840 e!416838)))

(declare-fun res!503200 () Bool)

(assert (=> b!746428 (=> res!503200 e!416838)))

(declare-fun lt!331712 () SeekEntryResult!7540)

(declare-fun lt!331708 () SeekEntryResult!7540)

(assert (=> b!746428 (= res!503200 (or (not (= lt!331712 lt!331708)) (= (select (store (arr!19940 a!3186) i!1173 k!2102) index!1321) lt!331713) (not (= (select (store (arr!19940 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746428 (= lt!331712 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19940 a!3186) j!159) a!3186 mask!3328))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!416832 () Bool)

(declare-fun b!746429 () Bool)

(assert (=> b!746429 (= e!416832 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19940 a!3186) j!159) a!3186 mask!3328) lt!331708))))

(declare-fun b!746430 () Bool)

(declare-fun res!503191 () Bool)

(assert (=> b!746430 (=> (not res!503191) (not e!416837))))

(assert (=> b!746430 (= res!503191 (validKeyInArray!0 (select (arr!19940 a!3186) j!159)))))

(declare-fun b!746431 () Bool)

(declare-fun res!503187 () Bool)

(assert (=> b!746431 (=> (not res!503187) (not e!416835))))

(assert (=> b!746431 (= res!503187 e!416834)))

(declare-fun c!81997 () Bool)

(assert (=> b!746431 (= c!81997 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746432 () Bool)

(declare-fun res!503198 () Bool)

(assert (=> b!746432 (=> (not res!503198) (not e!416837))))

(assert (=> b!746432 (= res!503198 (and (= (size!20361 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20361 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20361 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746424 () Bool)

(assert (=> b!746424 (= e!416833 (not e!416840))))

(declare-fun res!503201 () Bool)

(assert (=> b!746424 (=> res!503201 e!416840)))

(assert (=> b!746424 (= res!503201 (or (not (is-Intermediate!7540 lt!331714)) (bvslt x!1131 (x!63474 lt!331714)) (not (= x!1131 (x!63474 lt!331714))) (not (= index!1321 (index!32530 lt!331714)))))))

(assert (=> b!746424 e!416832))

(declare-fun res!503190 () Bool)

(assert (=> b!746424 (=> (not res!503190) (not e!416832))))

(declare-fun lt!331709 () SeekEntryResult!7540)

(assert (=> b!746424 (= res!503190 (= lt!331709 lt!331708))))

(assert (=> b!746424 (= lt!331708 (Found!7540 j!159))))

(assert (=> b!746424 (= lt!331709 (seekEntryOrOpen!0 (select (arr!19940 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746424 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25560 0))(
  ( (Unit!25561) )
))
(declare-fun lt!331707 () Unit!25560)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25560)

(assert (=> b!746424 (= lt!331707 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!503195 () Bool)

(assert (=> start!65480 (=> (not res!503195) (not e!416837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65480 (= res!503195 (validMask!0 mask!3328))))

(assert (=> start!65480 e!416837))

(assert (=> start!65480 true))

(declare-fun array_inv!15736 (array!41653) Bool)

(assert (=> start!65480 (array_inv!15736 a!3186)))

(declare-fun b!746433 () Bool)

(assert (=> b!746433 (= e!416836 e!416835)))

(declare-fun res!503197 () Bool)

(assert (=> b!746433 (=> (not res!503197) (not e!416835))))

(declare-fun lt!331706 () SeekEntryResult!7540)

(assert (=> b!746433 (= res!503197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19940 a!3186) j!159) mask!3328) (select (arr!19940 a!3186) j!159) a!3186 mask!3328) lt!331706))))

(assert (=> b!746433 (= lt!331706 (Intermediate!7540 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746434 () Bool)

(assert (=> b!746434 (= e!416834 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19940 a!3186) j!159) a!3186 mask!3328) lt!331706))))

(declare-fun b!746435 () Bool)

(assert (=> b!746435 (= e!416838 true)))

(assert (=> b!746435 (= lt!331709 lt!331712)))

(declare-fun b!746436 () Bool)

(declare-fun res!503186 () Bool)

(assert (=> b!746436 (=> (not res!503186) (not e!416836))))

(assert (=> b!746436 (= res!503186 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20361 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20361 a!3186))))))

(assert (= (and start!65480 res!503195) b!746432))

(assert (= (and b!746432 res!503198) b!746430))

(assert (= (and b!746430 res!503191) b!746425))

(assert (= (and b!746425 res!503193) b!746420))

(assert (= (and b!746420 res!503196) b!746423))

(assert (= (and b!746423 res!503189) b!746427))

(assert (= (and b!746427 res!503192) b!746419))

(assert (= (and b!746419 res!503188) b!746436))

(assert (= (and b!746436 res!503186) b!746433))

(assert (= (and b!746433 res!503197) b!746421))

(assert (= (and b!746421 res!503194) b!746431))

(assert (= (and b!746431 c!81997) b!746434))

(assert (= (and b!746431 (not c!81997)) b!746426))

(assert (= (and b!746431 res!503187) b!746422))

(assert (= (and b!746422 res!503199) b!746424))

(assert (= (and b!746424 res!503190) b!746429))

(assert (= (and b!746424 (not res!503201)) b!746428))

(assert (= (and b!746428 (not res!503200)) b!746435))

(declare-fun m!696679 () Bool)

(assert (=> b!746434 m!696679))

(assert (=> b!746434 m!696679))

(declare-fun m!696681 () Bool)

(assert (=> b!746434 m!696681))

(declare-fun m!696683 () Bool)

(assert (=> b!746421 m!696683))

(assert (=> b!746430 m!696679))

(assert (=> b!746430 m!696679))

(declare-fun m!696685 () Bool)

(assert (=> b!746430 m!696685))

(declare-fun m!696687 () Bool)

(assert (=> b!746427 m!696687))

(declare-fun m!696689 () Bool)

(assert (=> b!746422 m!696689))

(declare-fun m!696691 () Bool)

(assert (=> b!746422 m!696691))

(declare-fun m!696693 () Bool)

(assert (=> b!746422 m!696693))

(declare-fun m!696695 () Bool)

(assert (=> b!746422 m!696695))

(assert (=> b!746422 m!696689))

(declare-fun m!696697 () Bool)

(assert (=> b!746422 m!696697))

(declare-fun m!696699 () Bool)

(assert (=> start!65480 m!696699))

(declare-fun m!696701 () Bool)

(assert (=> start!65480 m!696701))

(declare-fun m!696703 () Bool)

(assert (=> b!746420 m!696703))

(assert (=> b!746426 m!696679))

(assert (=> b!746426 m!696679))

(declare-fun m!696705 () Bool)

(assert (=> b!746426 m!696705))

(declare-fun m!696707 () Bool)

(assert (=> b!746423 m!696707))

(assert (=> b!746424 m!696679))

(assert (=> b!746424 m!696679))

(declare-fun m!696709 () Bool)

(assert (=> b!746424 m!696709))

(declare-fun m!696711 () Bool)

(assert (=> b!746424 m!696711))

(declare-fun m!696713 () Bool)

(assert (=> b!746424 m!696713))

(declare-fun m!696715 () Bool)

(assert (=> b!746419 m!696715))

(assert (=> b!746429 m!696679))

(assert (=> b!746429 m!696679))

(declare-fun m!696717 () Bool)

(assert (=> b!746429 m!696717))

(assert (=> b!746433 m!696679))

(assert (=> b!746433 m!696679))

(declare-fun m!696719 () Bool)

(assert (=> b!746433 m!696719))

(assert (=> b!746433 m!696719))

(assert (=> b!746433 m!696679))

(declare-fun m!696721 () Bool)

(assert (=> b!746433 m!696721))

(assert (=> b!746428 m!696693))

(declare-fun m!696723 () Bool)

(assert (=> b!746428 m!696723))

(assert (=> b!746428 m!696679))

(assert (=> b!746428 m!696679))

(assert (=> b!746428 m!696705))

(declare-fun m!696725 () Bool)

(assert (=> b!746425 m!696725))

(push 1)

