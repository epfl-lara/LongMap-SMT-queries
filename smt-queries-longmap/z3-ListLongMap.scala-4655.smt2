; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64830 () Bool)

(assert start!64830)

(declare-fun b!730457 () Bool)

(declare-fun e!408881 () Bool)

(assert (=> b!730457 (= e!408881 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!323617 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730457 (= lt!323617 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun e!408883 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41149 0))(
  ( (array!41150 (arr!19690 (Array (_ BitVec 32) (_ BitVec 64))) (size!20110 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41149)

(declare-fun b!730458 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7246 0))(
  ( (MissingZero!7246 (index!31352 (_ BitVec 32))) (Found!7246 (index!31353 (_ BitVec 32))) (Intermediate!7246 (undefined!8058 Bool) (index!31354 (_ BitVec 32)) (x!62496 (_ BitVec 32))) (Undefined!7246) (MissingVacant!7246 (index!31355 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41149 (_ BitVec 32)) SeekEntryResult!7246)

(assert (=> b!730458 (= e!408883 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19690 a!3186) j!159) a!3186 mask!3328) (Found!7246 j!159)))))

(declare-fun b!730459 () Bool)

(declare-fun res!490391 () Bool)

(declare-fun e!408880 () Bool)

(assert (=> b!730459 (=> (not res!490391) (not e!408880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730459 (= res!490391 (validKeyInArray!0 (select (arr!19690 a!3186) j!159)))))

(declare-fun b!730460 () Bool)

(declare-fun res!490399 () Bool)

(declare-fun e!408882 () Bool)

(assert (=> b!730460 (=> (not res!490399) (not e!408882))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730460 (= res!490399 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19690 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730461 () Bool)

(declare-fun e!408885 () Bool)

(assert (=> b!730461 (= e!408885 (not e!408881))))

(declare-fun res!490395 () Bool)

(assert (=> b!730461 (=> res!490395 e!408881)))

(declare-fun lt!323618 () SeekEntryResult!7246)

(get-info :version)

(assert (=> b!730461 (= res!490395 (or (not ((_ is Intermediate!7246) lt!323618)) (bvsge x!1131 (x!62496 lt!323618))))))

(declare-fun e!408884 () Bool)

(assert (=> b!730461 e!408884))

(declare-fun res!490403 () Bool)

(assert (=> b!730461 (=> (not res!490403) (not e!408884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41149 (_ BitVec 32)) Bool)

(assert (=> b!730461 (= res!490403 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24889 0))(
  ( (Unit!24890) )
))
(declare-fun lt!323612 () Unit!24889)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24889)

(assert (=> b!730461 (= lt!323612 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730462 () Bool)

(declare-fun res!490401 () Bool)

(declare-fun e!408877 () Bool)

(assert (=> b!730462 (=> (not res!490401) (not e!408877))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730462 (= res!490401 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20110 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20110 a!3186))))))

(declare-fun b!730463 () Bool)

(declare-fun res!490396 () Bool)

(assert (=> b!730463 (=> (not res!490396) (not e!408877))))

(declare-datatypes ((List!13599 0))(
  ( (Nil!13596) (Cons!13595 (h!14661 (_ BitVec 64)) (t!19906 List!13599)) )
))
(declare-fun arrayNoDuplicates!0 (array!41149 (_ BitVec 32) List!13599) Bool)

(assert (=> b!730463 (= res!490396 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13596))))

(declare-fun b!730464 () Bool)

(assert (=> b!730464 (= e!408880 e!408877)))

(declare-fun res!490402 () Bool)

(assert (=> b!730464 (=> (not res!490402) (not e!408877))))

(declare-fun lt!323615 () SeekEntryResult!7246)

(assert (=> b!730464 (= res!490402 (or (= lt!323615 (MissingZero!7246 i!1173)) (= lt!323615 (MissingVacant!7246 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41149 (_ BitVec 32)) SeekEntryResult!7246)

(assert (=> b!730464 (= lt!323615 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!490390 () Bool)

(assert (=> start!64830 (=> (not res!490390) (not e!408880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64830 (= res!490390 (validMask!0 mask!3328))))

(assert (=> start!64830 e!408880))

(assert (=> start!64830 true))

(declare-fun array_inv!15549 (array!41149) Bool)

(assert (=> start!64830 (array_inv!15549 a!3186)))

(declare-fun b!730465 () Bool)

(declare-fun res!490397 () Bool)

(assert (=> b!730465 (=> (not res!490397) (not e!408882))))

(assert (=> b!730465 (= res!490397 e!408883)))

(declare-fun c!80411 () Bool)

(assert (=> b!730465 (= c!80411 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730466 () Bool)

(declare-fun res!490394 () Bool)

(assert (=> b!730466 (=> (not res!490394) (not e!408880))))

(assert (=> b!730466 (= res!490394 (validKeyInArray!0 k0!2102))))

(declare-fun b!730467 () Bool)

(assert (=> b!730467 (= e!408877 e!408882)))

(declare-fun res!490404 () Bool)

(assert (=> b!730467 (=> (not res!490404) (not e!408882))))

(declare-fun lt!323616 () SeekEntryResult!7246)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41149 (_ BitVec 32)) SeekEntryResult!7246)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730467 (= res!490404 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19690 a!3186) j!159) mask!3328) (select (arr!19690 a!3186) j!159) a!3186 mask!3328) lt!323616))))

(assert (=> b!730467 (= lt!323616 (Intermediate!7246 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730468 () Bool)

(declare-fun e!408878 () Bool)

(assert (=> b!730468 (= e!408884 e!408878)))

(declare-fun res!490392 () Bool)

(assert (=> b!730468 (=> (not res!490392) (not e!408878))))

(declare-fun lt!323611 () SeekEntryResult!7246)

(assert (=> b!730468 (= res!490392 (= (seekEntryOrOpen!0 (select (arr!19690 a!3186) j!159) a!3186 mask!3328) lt!323611))))

(assert (=> b!730468 (= lt!323611 (Found!7246 j!159))))

(declare-fun b!730469 () Bool)

(assert (=> b!730469 (= e!408882 e!408885)))

(declare-fun res!490400 () Bool)

(assert (=> b!730469 (=> (not res!490400) (not e!408885))))

(declare-fun lt!323619 () SeekEntryResult!7246)

(assert (=> b!730469 (= res!490400 (= lt!323619 lt!323618))))

(declare-fun lt!323614 () array!41149)

(declare-fun lt!323613 () (_ BitVec 64))

(assert (=> b!730469 (= lt!323618 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323613 lt!323614 mask!3328))))

(assert (=> b!730469 (= lt!323619 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323613 mask!3328) lt!323613 lt!323614 mask!3328))))

(assert (=> b!730469 (= lt!323613 (select (store (arr!19690 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730469 (= lt!323614 (array!41150 (store (arr!19690 a!3186) i!1173 k0!2102) (size!20110 a!3186)))))

(declare-fun b!730470 () Bool)

(assert (=> b!730470 (= e!408883 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19690 a!3186) j!159) a!3186 mask!3328) lt!323616))))

(declare-fun b!730471 () Bool)

(declare-fun res!490405 () Bool)

(assert (=> b!730471 (=> (not res!490405) (not e!408880))))

(declare-fun arrayContainsKey!0 (array!41149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730471 (= res!490405 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730472 () Bool)

(declare-fun res!490398 () Bool)

(assert (=> b!730472 (=> (not res!490398) (not e!408880))))

(assert (=> b!730472 (= res!490398 (and (= (size!20110 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20110 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20110 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730473 () Bool)

(declare-fun res!490393 () Bool)

(assert (=> b!730473 (=> (not res!490393) (not e!408877))))

(assert (=> b!730473 (= res!490393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730474 () Bool)

(assert (=> b!730474 (= e!408878 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19690 a!3186) j!159) a!3186 mask!3328) lt!323611))))

(assert (= (and start!64830 res!490390) b!730472))

(assert (= (and b!730472 res!490398) b!730459))

(assert (= (and b!730459 res!490391) b!730466))

(assert (= (and b!730466 res!490394) b!730471))

(assert (= (and b!730471 res!490405) b!730464))

(assert (= (and b!730464 res!490402) b!730473))

(assert (= (and b!730473 res!490393) b!730463))

(assert (= (and b!730463 res!490396) b!730462))

(assert (= (and b!730462 res!490401) b!730467))

(assert (= (and b!730467 res!490404) b!730460))

(assert (= (and b!730460 res!490399) b!730465))

(assert (= (and b!730465 c!80411) b!730470))

(assert (= (and b!730465 (not c!80411)) b!730458))

(assert (= (and b!730465 res!490397) b!730469))

(assert (= (and b!730469 res!490400) b!730461))

(assert (= (and b!730461 res!490403) b!730468))

(assert (= (and b!730468 res!490392) b!730474))

(assert (= (and b!730461 (not res!490395)) b!730457))

(declare-fun m!684459 () Bool)

(assert (=> b!730460 m!684459))

(declare-fun m!684461 () Bool)

(assert (=> start!64830 m!684461))

(declare-fun m!684463 () Bool)

(assert (=> start!64830 m!684463))

(declare-fun m!684465 () Bool)

(assert (=> b!730457 m!684465))

(declare-fun m!684467 () Bool)

(assert (=> b!730474 m!684467))

(assert (=> b!730474 m!684467))

(declare-fun m!684469 () Bool)

(assert (=> b!730474 m!684469))

(assert (=> b!730459 m!684467))

(assert (=> b!730459 m!684467))

(declare-fun m!684471 () Bool)

(assert (=> b!730459 m!684471))

(assert (=> b!730467 m!684467))

(assert (=> b!730467 m!684467))

(declare-fun m!684473 () Bool)

(assert (=> b!730467 m!684473))

(assert (=> b!730467 m!684473))

(assert (=> b!730467 m!684467))

(declare-fun m!684475 () Bool)

(assert (=> b!730467 m!684475))

(declare-fun m!684477 () Bool)

(assert (=> b!730473 m!684477))

(assert (=> b!730458 m!684467))

(assert (=> b!730458 m!684467))

(declare-fun m!684479 () Bool)

(assert (=> b!730458 m!684479))

(declare-fun m!684481 () Bool)

(assert (=> b!730469 m!684481))

(declare-fun m!684483 () Bool)

(assert (=> b!730469 m!684483))

(assert (=> b!730469 m!684481))

(declare-fun m!684485 () Bool)

(assert (=> b!730469 m!684485))

(declare-fun m!684487 () Bool)

(assert (=> b!730469 m!684487))

(declare-fun m!684489 () Bool)

(assert (=> b!730469 m!684489))

(assert (=> b!730470 m!684467))

(assert (=> b!730470 m!684467))

(declare-fun m!684491 () Bool)

(assert (=> b!730470 m!684491))

(assert (=> b!730468 m!684467))

(assert (=> b!730468 m!684467))

(declare-fun m!684493 () Bool)

(assert (=> b!730468 m!684493))

(declare-fun m!684495 () Bool)

(assert (=> b!730471 m!684495))

(declare-fun m!684497 () Bool)

(assert (=> b!730463 m!684497))

(declare-fun m!684499 () Bool)

(assert (=> b!730466 m!684499))

(declare-fun m!684501 () Bool)

(assert (=> b!730461 m!684501))

(declare-fun m!684503 () Bool)

(assert (=> b!730461 m!684503))

(declare-fun m!684505 () Bool)

(assert (=> b!730464 m!684505))

(check-sat (not b!730470) (not b!730466) (not b!730474) (not b!730458) (not b!730464) (not b!730471) (not b!730459) (not b!730457) (not b!730473) (not b!730469) (not start!64830) (not b!730467) (not b!730463) (not b!730468) (not b!730461))
(check-sat)
