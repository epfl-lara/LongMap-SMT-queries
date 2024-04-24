; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65868 () Bool)

(assert start!65868)

(declare-fun b!755688 () Bool)

(declare-fun res!510512 () Bool)

(declare-fun e!421503 () Bool)

(assert (=> b!755688 (=> (not res!510512) (not e!421503))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!336322 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41911 0))(
  ( (array!41912 (arr!20065 (Array (_ BitVec 32) (_ BitVec 64))) (size!20485 (_ BitVec 32))) )
))
(declare-fun lt!336329 () array!41911)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7621 0))(
  ( (MissingZero!7621 (index!32852 (_ BitVec 32))) (Found!7621 (index!32853 (_ BitVec 32))) (Intermediate!7621 (undefined!8433 Bool) (index!32854 (_ BitVec 32)) (x!63919 (_ BitVec 32))) (Undefined!7621) (MissingVacant!7621 (index!32855 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41911 (_ BitVec 32)) SeekEntryResult!7621)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41911 (_ BitVec 32)) SeekEntryResult!7621)

(assert (=> b!755688 (= res!510512 (= (seekEntryOrOpen!0 lt!336322 lt!336329 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336322 lt!336329 mask!3328)))))

(declare-fun res!510529 () Bool)

(declare-fun e!421501 () Bool)

(assert (=> start!65868 (=> (not res!510529) (not e!421501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65868 (= res!510529 (validMask!0 mask!3328))))

(assert (=> start!65868 e!421501))

(assert (=> start!65868 true))

(declare-fun a!3186 () array!41911)

(declare-fun array_inv!15924 (array!41911) Bool)

(assert (=> start!65868 (array_inv!15924 a!3186)))

(declare-fun b!755689 () Bool)

(declare-fun res!510524 () Bool)

(declare-fun e!421499 () Bool)

(assert (=> b!755689 (=> (not res!510524) (not e!421499))))

(declare-fun e!421494 () Bool)

(assert (=> b!755689 (= res!510524 e!421494)))

(declare-fun c!82973 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755689 (= c!82973 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755690 () Bool)

(declare-datatypes ((Unit!26041 0))(
  ( (Unit!26042) )
))
(declare-fun e!421493 () Unit!26041)

(declare-fun Unit!26043 () Unit!26041)

(assert (=> b!755690 (= e!421493 Unit!26043)))

(assert (=> b!755690 false))

(declare-fun b!755691 () Bool)

(declare-fun res!510513 () Bool)

(assert (=> b!755691 (=> (not res!510513) (not e!421501))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755691 (= res!510513 (validKeyInArray!0 k0!2102))))

(declare-fun b!755692 () Bool)

(declare-fun e!421498 () Bool)

(assert (=> b!755692 (= e!421498 e!421499)))

(declare-fun res!510523 () Bool)

(assert (=> b!755692 (=> (not res!510523) (not e!421499))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!336326 () SeekEntryResult!7621)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41911 (_ BitVec 32)) SeekEntryResult!7621)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755692 (= res!510523 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20065 a!3186) j!159) mask!3328) (select (arr!20065 a!3186) j!159) a!3186 mask!3328) lt!336326))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!755692 (= lt!336326 (Intermediate!7621 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755693 () Bool)

(declare-fun res!510517 () Bool)

(assert (=> b!755693 (=> (not res!510517) (not e!421501))))

(assert (=> b!755693 (= res!510517 (validKeyInArray!0 (select (arr!20065 a!3186) j!159)))))

(declare-fun b!755694 () Bool)

(declare-fun lt!336327 () SeekEntryResult!7621)

(declare-fun lt!336323 () SeekEntryResult!7621)

(assert (=> b!755694 (= e!421503 (= lt!336327 lt!336323))))

(declare-fun b!755695 () Bool)

(declare-fun e!421495 () Bool)

(assert (=> b!755695 (= e!421495 true)))

(assert (=> b!755695 e!421503))

(declare-fun res!510519 () Bool)

(assert (=> b!755695 (=> (not res!510519) (not e!421503))))

(declare-fun lt!336324 () (_ BitVec 64))

(assert (=> b!755695 (= res!510519 (= lt!336324 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336321 () Unit!26041)

(assert (=> b!755695 (= lt!336321 e!421493)))

(declare-fun c!82972 () Bool)

(assert (=> b!755695 (= c!82972 (= lt!336324 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755696 () Bool)

(assert (=> b!755696 (= e!421494 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20065 a!3186) j!159) a!3186 mask!3328) lt!336326))))

(declare-fun b!755697 () Bool)

(declare-fun res!510527 () Bool)

(assert (=> b!755697 (=> (not res!510527) (not e!421499))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755697 (= res!510527 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20065 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!421502 () Bool)

(declare-fun b!755698 () Bool)

(declare-fun lt!336330 () SeekEntryResult!7621)

(assert (=> b!755698 (= e!421502 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20065 a!3186) j!159) a!3186 mask!3328) lt!336330))))

(declare-fun b!755699 () Bool)

(assert (=> b!755699 (= e!421501 e!421498)))

(declare-fun res!510518 () Bool)

(assert (=> b!755699 (=> (not res!510518) (not e!421498))))

(declare-fun lt!336320 () SeekEntryResult!7621)

(assert (=> b!755699 (= res!510518 (or (= lt!336320 (MissingZero!7621 i!1173)) (= lt!336320 (MissingVacant!7621 i!1173))))))

(assert (=> b!755699 (= lt!336320 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755700 () Bool)

(declare-fun res!510520 () Bool)

(assert (=> b!755700 (=> (not res!510520) (not e!421498))))

(assert (=> b!755700 (= res!510520 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20485 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20485 a!3186))))))

(declare-fun b!755701 () Bool)

(declare-fun e!421492 () Bool)

(declare-fun e!421500 () Bool)

(assert (=> b!755701 (= e!421492 (not e!421500))))

(declare-fun res!510511 () Bool)

(assert (=> b!755701 (=> res!510511 e!421500)))

(declare-fun lt!336328 () SeekEntryResult!7621)

(get-info :version)

(assert (=> b!755701 (= res!510511 (or (not ((_ is Intermediate!7621) lt!336328)) (bvslt x!1131 (x!63919 lt!336328)) (not (= x!1131 (x!63919 lt!336328))) (not (= index!1321 (index!32854 lt!336328)))))))

(assert (=> b!755701 e!421502))

(declare-fun res!510526 () Bool)

(assert (=> b!755701 (=> (not res!510526) (not e!421502))))

(assert (=> b!755701 (= res!510526 (= lt!336327 lt!336330))))

(assert (=> b!755701 (= lt!336330 (Found!7621 j!159))))

(assert (=> b!755701 (= lt!336327 (seekEntryOrOpen!0 (select (arr!20065 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41911 (_ BitVec 32)) Bool)

(assert (=> b!755701 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336319 () Unit!26041)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26041)

(assert (=> b!755701 (= lt!336319 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755702 () Bool)

(assert (=> b!755702 (= e!421499 e!421492)))

(declare-fun res!510516 () Bool)

(assert (=> b!755702 (=> (not res!510516) (not e!421492))))

(declare-fun lt!336325 () SeekEntryResult!7621)

(assert (=> b!755702 (= res!510516 (= lt!336325 lt!336328))))

(assert (=> b!755702 (= lt!336328 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336322 lt!336329 mask!3328))))

(assert (=> b!755702 (= lt!336325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336322 mask!3328) lt!336322 lt!336329 mask!3328))))

(assert (=> b!755702 (= lt!336322 (select (store (arr!20065 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755702 (= lt!336329 (array!41912 (store (arr!20065 a!3186) i!1173 k0!2102) (size!20485 a!3186)))))

(declare-fun b!755703 () Bool)

(declare-fun Unit!26044 () Unit!26041)

(assert (=> b!755703 (= e!421493 Unit!26044)))

(declare-fun b!755704 () Bool)

(declare-fun res!510522 () Bool)

(assert (=> b!755704 (=> (not res!510522) (not e!421498))))

(assert (=> b!755704 (= res!510522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755705 () Bool)

(assert (=> b!755705 (= e!421494 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20065 a!3186) j!159) a!3186 mask!3328) (Found!7621 j!159)))))

(declare-fun b!755706 () Bool)

(declare-fun res!510528 () Bool)

(assert (=> b!755706 (=> (not res!510528) (not e!421498))))

(declare-datatypes ((List!13974 0))(
  ( (Nil!13971) (Cons!13970 (h!15048 (_ BitVec 64)) (t!20281 List!13974)) )
))
(declare-fun arrayNoDuplicates!0 (array!41911 (_ BitVec 32) List!13974) Bool)

(assert (=> b!755706 (= res!510528 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13971))))

(declare-fun b!755707 () Bool)

(declare-fun e!421497 () Bool)

(assert (=> b!755707 (= e!421500 e!421497)))

(declare-fun res!510525 () Bool)

(assert (=> b!755707 (=> res!510525 e!421497)))

(assert (=> b!755707 (= res!510525 (not (= lt!336323 lt!336330)))))

(assert (=> b!755707 (= lt!336323 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20065 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755708 () Bool)

(declare-fun res!510514 () Bool)

(assert (=> b!755708 (=> (not res!510514) (not e!421501))))

(assert (=> b!755708 (= res!510514 (and (= (size!20485 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20485 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20485 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755709 () Bool)

(assert (=> b!755709 (= e!421497 e!421495)))

(declare-fun res!510515 () Bool)

(assert (=> b!755709 (=> res!510515 e!421495)))

(assert (=> b!755709 (= res!510515 (= lt!336324 lt!336322))))

(assert (=> b!755709 (= lt!336324 (select (store (arr!20065 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!755710 () Bool)

(declare-fun res!510521 () Bool)

(assert (=> b!755710 (=> (not res!510521) (not e!421501))))

(declare-fun arrayContainsKey!0 (array!41911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755710 (= res!510521 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65868 res!510529) b!755708))

(assert (= (and b!755708 res!510514) b!755693))

(assert (= (and b!755693 res!510517) b!755691))

(assert (= (and b!755691 res!510513) b!755710))

(assert (= (and b!755710 res!510521) b!755699))

(assert (= (and b!755699 res!510518) b!755704))

(assert (= (and b!755704 res!510522) b!755706))

(assert (= (and b!755706 res!510528) b!755700))

(assert (= (and b!755700 res!510520) b!755692))

(assert (= (and b!755692 res!510523) b!755697))

(assert (= (and b!755697 res!510527) b!755689))

(assert (= (and b!755689 c!82973) b!755696))

(assert (= (and b!755689 (not c!82973)) b!755705))

(assert (= (and b!755689 res!510524) b!755702))

(assert (= (and b!755702 res!510516) b!755701))

(assert (= (and b!755701 res!510526) b!755698))

(assert (= (and b!755701 (not res!510511)) b!755707))

(assert (= (and b!755707 (not res!510525)) b!755709))

(assert (= (and b!755709 (not res!510515)) b!755695))

(assert (= (and b!755695 c!82972) b!755690))

(assert (= (and b!755695 (not c!82972)) b!755703))

(assert (= (and b!755695 res!510519) b!755688))

(assert (= (and b!755688 res!510512) b!755694))

(declare-fun m!704427 () Bool)

(assert (=> b!755697 m!704427))

(declare-fun m!704429 () Bool)

(assert (=> b!755693 m!704429))

(assert (=> b!755693 m!704429))

(declare-fun m!704431 () Bool)

(assert (=> b!755693 m!704431))

(declare-fun m!704433 () Bool)

(assert (=> b!755699 m!704433))

(declare-fun m!704435 () Bool)

(assert (=> b!755709 m!704435))

(declare-fun m!704437 () Bool)

(assert (=> b!755709 m!704437))

(declare-fun m!704439 () Bool)

(assert (=> b!755710 m!704439))

(declare-fun m!704441 () Bool)

(assert (=> b!755702 m!704441))

(declare-fun m!704443 () Bool)

(assert (=> b!755702 m!704443))

(assert (=> b!755702 m!704435))

(declare-fun m!704445 () Bool)

(assert (=> b!755702 m!704445))

(declare-fun m!704447 () Bool)

(assert (=> b!755702 m!704447))

(assert (=> b!755702 m!704441))

(declare-fun m!704449 () Bool)

(assert (=> start!65868 m!704449))

(declare-fun m!704451 () Bool)

(assert (=> start!65868 m!704451))

(assert (=> b!755692 m!704429))

(assert (=> b!755692 m!704429))

(declare-fun m!704453 () Bool)

(assert (=> b!755692 m!704453))

(assert (=> b!755692 m!704453))

(assert (=> b!755692 m!704429))

(declare-fun m!704455 () Bool)

(assert (=> b!755692 m!704455))

(declare-fun m!704457 () Bool)

(assert (=> b!755688 m!704457))

(declare-fun m!704459 () Bool)

(assert (=> b!755688 m!704459))

(assert (=> b!755698 m!704429))

(assert (=> b!755698 m!704429))

(declare-fun m!704461 () Bool)

(assert (=> b!755698 m!704461))

(declare-fun m!704463 () Bool)

(assert (=> b!755691 m!704463))

(declare-fun m!704465 () Bool)

(assert (=> b!755704 m!704465))

(assert (=> b!755701 m!704429))

(assert (=> b!755701 m!704429))

(declare-fun m!704467 () Bool)

(assert (=> b!755701 m!704467))

(declare-fun m!704469 () Bool)

(assert (=> b!755701 m!704469))

(declare-fun m!704471 () Bool)

(assert (=> b!755701 m!704471))

(assert (=> b!755705 m!704429))

(assert (=> b!755705 m!704429))

(declare-fun m!704473 () Bool)

(assert (=> b!755705 m!704473))

(assert (=> b!755707 m!704429))

(assert (=> b!755707 m!704429))

(assert (=> b!755707 m!704473))

(declare-fun m!704475 () Bool)

(assert (=> b!755706 m!704475))

(assert (=> b!755696 m!704429))

(assert (=> b!755696 m!704429))

(declare-fun m!704477 () Bool)

(assert (=> b!755696 m!704477))

(check-sat (not b!755710) (not b!755707) (not b!755702) (not b!755688) (not b!755701) (not b!755693) (not b!755692) (not b!755706) (not b!755705) (not b!755696) (not b!755699) (not start!65868) (not b!755704) (not b!755698) (not b!755691))
(check-sat)
