; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67256 () Bool)

(assert start!67256)

(declare-fun b!777599 () Bool)

(declare-fun res!526019 () Bool)

(declare-fun e!432677 () Bool)

(assert (=> b!777599 (=> (not res!526019) (not e!432677))))

(declare-datatypes ((array!42548 0))(
  ( (array!42549 (arr!20368 (Array (_ BitVec 32) (_ BitVec 64))) (size!20789 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42548)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777599 (= res!526019 (validKeyInArray!0 (select (arr!20368 a!3186) j!159)))))

(declare-fun b!777600 () Bool)

(declare-fun res!526015 () Bool)

(declare-fun e!432675 () Bool)

(assert (=> b!777600 (=> (not res!526015) (not e!432675))))

(declare-fun e!432681 () Bool)

(assert (=> b!777600 (= res!526015 e!432681)))

(declare-fun c!86194 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!777600 (= c!86194 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!777601 () Bool)

(declare-fun e!432683 () Bool)

(assert (=> b!777601 (= e!432677 e!432683)))

(declare-fun res!526026 () Bool)

(assert (=> b!777601 (=> (not res!526026) (not e!432683))))

(declare-datatypes ((SeekEntryResult!7968 0))(
  ( (MissingZero!7968 (index!34240 (_ BitVec 32))) (Found!7968 (index!34241 (_ BitVec 32))) (Intermediate!7968 (undefined!8780 Bool) (index!34242 (_ BitVec 32)) (x!65184 (_ BitVec 32))) (Undefined!7968) (MissingVacant!7968 (index!34243 (_ BitVec 32))) )
))
(declare-fun lt!346435 () SeekEntryResult!7968)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!777601 (= res!526026 (or (= lt!346435 (MissingZero!7968 i!1173)) (= lt!346435 (MissingVacant!7968 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42548 (_ BitVec 32)) SeekEntryResult!7968)

(assert (=> b!777601 (= lt!346435 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!777602 () Bool)

(declare-fun res!526020 () Bool)

(declare-fun e!432676 () Bool)

(assert (=> b!777602 (=> res!526020 e!432676)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42548 (_ BitVec 32)) SeekEntryResult!7968)

(assert (=> b!777602 (= res!526020 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20368 a!3186) j!159) a!3186 mask!3328) (Found!7968 j!159))))))

(declare-fun b!777603 () Bool)

(declare-fun res!526017 () Bool)

(assert (=> b!777603 (=> (not res!526017) (not e!432677))))

(assert (=> b!777603 (= res!526017 (validKeyInArray!0 k0!2102))))

(declare-fun b!777604 () Bool)

(declare-fun res!526025 () Bool)

(assert (=> b!777604 (=> (not res!526025) (not e!432677))))

(assert (=> b!777604 (= res!526025 (and (= (size!20789 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20789 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20789 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777605 () Bool)

(declare-fun e!432678 () Bool)

(assert (=> b!777605 (= e!432675 e!432678)))

(declare-fun res!526027 () Bool)

(assert (=> b!777605 (=> (not res!526027) (not e!432678))))

(declare-fun lt!346434 () SeekEntryResult!7968)

(declare-fun lt!346436 () SeekEntryResult!7968)

(assert (=> b!777605 (= res!526027 (= lt!346434 lt!346436))))

(declare-fun lt!346439 () (_ BitVec 64))

(declare-fun lt!346437 () array!42548)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42548 (_ BitVec 32)) SeekEntryResult!7968)

(assert (=> b!777605 (= lt!346436 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346439 lt!346437 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777605 (= lt!346434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346439 mask!3328) lt!346439 lt!346437 mask!3328))))

(assert (=> b!777605 (= lt!346439 (select (store (arr!20368 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!777605 (= lt!346437 (array!42549 (store (arr!20368 a!3186) i!1173 k0!2102) (size!20789 a!3186)))))

(declare-fun b!777606 () Bool)

(declare-fun res!526014 () Bool)

(assert (=> b!777606 (=> res!526014 e!432676)))

(assert (=> b!777606 (= res!526014 (or (not (= (select (store (arr!20368 a!3186) i!1173 k0!2102) index!1321) lt!346439)) (undefined!8780 lt!346436)))))

(declare-fun b!777607 () Bool)

(assert (=> b!777607 (= e!432678 (not e!432676))))

(declare-fun res!526030 () Bool)

(assert (=> b!777607 (=> res!526030 e!432676)))

(get-info :version)

(assert (=> b!777607 (= res!526030 (or (not ((_ is Intermediate!7968) lt!346436)) (bvslt x!1131 (x!65184 lt!346436)) (not (= x!1131 (x!65184 lt!346436))) (not (= index!1321 (index!34242 lt!346436)))))))

(declare-fun e!432679 () Bool)

(assert (=> b!777607 e!432679))

(declare-fun res!526018 () Bool)

(assert (=> b!777607 (=> (not res!526018) (not e!432679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42548 (_ BitVec 32)) Bool)

(assert (=> b!777607 (= res!526018 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26830 0))(
  ( (Unit!26831) )
))
(declare-fun lt!346442 () Unit!26830)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26830)

(assert (=> b!777607 (= lt!346442 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777608 () Bool)

(assert (=> b!777608 (= e!432681 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20368 a!3186) j!159) a!3186 mask!3328) (Found!7968 j!159)))))

(declare-fun res!526021 () Bool)

(assert (=> start!67256 (=> (not res!526021) (not e!432677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67256 (= res!526021 (validMask!0 mask!3328))))

(assert (=> start!67256 e!432677))

(assert (=> start!67256 true))

(declare-fun array_inv!16164 (array!42548) Bool)

(assert (=> start!67256 (array_inv!16164 a!3186)))

(declare-fun lt!346441 () SeekEntryResult!7968)

(declare-fun e!432680 () Bool)

(declare-fun b!777609 () Bool)

(assert (=> b!777609 (= e!432680 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20368 a!3186) j!159) a!3186 mask!3328) lt!346441))))

(declare-fun b!777610 () Bool)

(declare-fun res!526024 () Bool)

(assert (=> b!777610 (=> (not res!526024) (not e!432675))))

(assert (=> b!777610 (= res!526024 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20368 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777611 () Bool)

(assert (=> b!777611 (= e!432679 e!432680)))

(declare-fun res!526022 () Bool)

(assert (=> b!777611 (=> (not res!526022) (not e!432680))))

(assert (=> b!777611 (= res!526022 (= (seekEntryOrOpen!0 (select (arr!20368 a!3186) j!159) a!3186 mask!3328) lt!346441))))

(assert (=> b!777611 (= lt!346441 (Found!7968 j!159))))

(declare-fun b!777612 () Bool)

(declare-fun res!526016 () Bool)

(assert (=> b!777612 (=> (not res!526016) (not e!432683))))

(assert (=> b!777612 (= res!526016 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20789 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20789 a!3186))))))

(declare-fun lt!346438 () SeekEntryResult!7968)

(declare-fun b!777613 () Bool)

(assert (=> b!777613 (= e!432681 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20368 a!3186) j!159) a!3186 mask!3328) lt!346438))))

(declare-fun b!777614 () Bool)

(assert (=> b!777614 (= e!432676 true)))

(declare-fun lt!346440 () SeekEntryResult!7968)

(assert (=> b!777614 (= lt!346440 (seekEntryOrOpen!0 lt!346439 lt!346437 mask!3328))))

(declare-fun b!777615 () Bool)

(assert (=> b!777615 (= e!432683 e!432675)))

(declare-fun res!526029 () Bool)

(assert (=> b!777615 (=> (not res!526029) (not e!432675))))

(assert (=> b!777615 (= res!526029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20368 a!3186) j!159) mask!3328) (select (arr!20368 a!3186) j!159) a!3186 mask!3328) lt!346438))))

(assert (=> b!777615 (= lt!346438 (Intermediate!7968 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777616 () Bool)

(declare-fun res!526028 () Bool)

(assert (=> b!777616 (=> (not res!526028) (not e!432677))))

(declare-fun arrayContainsKey!0 (array!42548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777616 (= res!526028 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777617 () Bool)

(declare-fun res!526023 () Bool)

(assert (=> b!777617 (=> (not res!526023) (not e!432683))))

(assert (=> b!777617 (= res!526023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777618 () Bool)

(declare-fun res!526031 () Bool)

(assert (=> b!777618 (=> (not res!526031) (not e!432683))))

(declare-datatypes ((List!14370 0))(
  ( (Nil!14367) (Cons!14366 (h!15477 (_ BitVec 64)) (t!20685 List!14370)) )
))
(declare-fun arrayNoDuplicates!0 (array!42548 (_ BitVec 32) List!14370) Bool)

(assert (=> b!777618 (= res!526031 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14367))))

(assert (= (and start!67256 res!526021) b!777604))

(assert (= (and b!777604 res!526025) b!777599))

(assert (= (and b!777599 res!526019) b!777603))

(assert (= (and b!777603 res!526017) b!777616))

(assert (= (and b!777616 res!526028) b!777601))

(assert (= (and b!777601 res!526026) b!777617))

(assert (= (and b!777617 res!526023) b!777618))

(assert (= (and b!777618 res!526031) b!777612))

(assert (= (and b!777612 res!526016) b!777615))

(assert (= (and b!777615 res!526029) b!777610))

(assert (= (and b!777610 res!526024) b!777600))

(assert (= (and b!777600 c!86194) b!777613))

(assert (= (and b!777600 (not c!86194)) b!777608))

(assert (= (and b!777600 res!526015) b!777605))

(assert (= (and b!777605 res!526027) b!777607))

(assert (= (and b!777607 res!526018) b!777611))

(assert (= (and b!777611 res!526022) b!777609))

(assert (= (and b!777607 (not res!526030)) b!777602))

(assert (= (and b!777602 (not res!526020)) b!777606))

(assert (= (and b!777606 (not res!526014)) b!777614))

(declare-fun m!721441 () Bool)

(assert (=> b!777610 m!721441))

(declare-fun m!721443 () Bool)

(assert (=> b!777615 m!721443))

(assert (=> b!777615 m!721443))

(declare-fun m!721445 () Bool)

(assert (=> b!777615 m!721445))

(assert (=> b!777615 m!721445))

(assert (=> b!777615 m!721443))

(declare-fun m!721447 () Bool)

(assert (=> b!777615 m!721447))

(assert (=> b!777602 m!721443))

(assert (=> b!777602 m!721443))

(declare-fun m!721449 () Bool)

(assert (=> b!777602 m!721449))

(assert (=> b!777611 m!721443))

(assert (=> b!777611 m!721443))

(declare-fun m!721451 () Bool)

(assert (=> b!777611 m!721451))

(declare-fun m!721453 () Bool)

(assert (=> start!67256 m!721453))

(declare-fun m!721455 () Bool)

(assert (=> start!67256 m!721455))

(declare-fun m!721457 () Bool)

(assert (=> b!777617 m!721457))

(declare-fun m!721459 () Bool)

(assert (=> b!777614 m!721459))

(declare-fun m!721461 () Bool)

(assert (=> b!777616 m!721461))

(assert (=> b!777609 m!721443))

(assert (=> b!777609 m!721443))

(declare-fun m!721463 () Bool)

(assert (=> b!777609 m!721463))

(declare-fun m!721465 () Bool)

(assert (=> b!777618 m!721465))

(declare-fun m!721467 () Bool)

(assert (=> b!777606 m!721467))

(declare-fun m!721469 () Bool)

(assert (=> b!777606 m!721469))

(declare-fun m!721471 () Bool)

(assert (=> b!777603 m!721471))

(declare-fun m!721473 () Bool)

(assert (=> b!777601 m!721473))

(declare-fun m!721475 () Bool)

(assert (=> b!777607 m!721475))

(declare-fun m!721477 () Bool)

(assert (=> b!777607 m!721477))

(assert (=> b!777613 m!721443))

(assert (=> b!777613 m!721443))

(declare-fun m!721479 () Bool)

(assert (=> b!777613 m!721479))

(assert (=> b!777599 m!721443))

(assert (=> b!777599 m!721443))

(declare-fun m!721481 () Bool)

(assert (=> b!777599 m!721481))

(declare-fun m!721483 () Bool)

(assert (=> b!777605 m!721483))

(declare-fun m!721485 () Bool)

(assert (=> b!777605 m!721485))

(assert (=> b!777605 m!721483))

(assert (=> b!777605 m!721467))

(declare-fun m!721487 () Bool)

(assert (=> b!777605 m!721487))

(declare-fun m!721489 () Bool)

(assert (=> b!777605 m!721489))

(assert (=> b!777608 m!721443))

(assert (=> b!777608 m!721443))

(assert (=> b!777608 m!721449))

(check-sat (not b!777616) (not b!777601) (not b!777603) (not b!777614) (not b!777599) (not b!777613) (not b!777608) (not b!777605) (not b!777607) (not b!777611) (not b!777609) (not b!777602) (not b!777617) (not b!777618) (not b!777615) (not start!67256))
(check-sat)
