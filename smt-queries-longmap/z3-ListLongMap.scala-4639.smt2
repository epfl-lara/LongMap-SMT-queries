; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64514 () Bool)

(assert start!64514)

(declare-fun b!726453 () Bool)

(declare-fun res!487551 () Bool)

(declare-fun e!406699 () Bool)

(assert (=> b!726453 (=> (not res!487551) (not e!406699))))

(declare-datatypes ((array!41049 0))(
  ( (array!41050 (arr!19646 (Array (_ BitVec 32) (_ BitVec 64))) (size!20067 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41049)

(declare-datatypes ((List!13687 0))(
  ( (Nil!13684) (Cons!13683 (h!14740 (_ BitVec 64)) (t!19993 List!13687)) )
))
(declare-fun arrayNoDuplicates!0 (array!41049 (_ BitVec 32) List!13687) Bool)

(assert (=> b!726453 (= res!487551 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13684))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!726454 () Bool)

(declare-fun e!406703 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7243 0))(
  ( (MissingZero!7243 (index!31340 (_ BitVec 32))) (Found!7243 (index!31341 (_ BitVec 32))) (Intermediate!7243 (undefined!8055 Bool) (index!31342 (_ BitVec 32)) (x!62336 (_ BitVec 32))) (Undefined!7243) (MissingVacant!7243 (index!31343 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41049 (_ BitVec 32)) SeekEntryResult!7243)

(assert (=> b!726454 (= e!406703 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19646 a!3186) j!159) a!3186 mask!3328) (Found!7243 j!159)))))

(declare-fun b!726455 () Bool)

(declare-fun e!406700 () Bool)

(declare-fun e!406704 () Bool)

(assert (=> b!726455 (= e!406700 e!406704)))

(declare-fun res!487555 () Bool)

(assert (=> b!726455 (=> (not res!487555) (not e!406704))))

(declare-fun lt!321595 () SeekEntryResult!7243)

(declare-fun lt!321593 () SeekEntryResult!7243)

(assert (=> b!726455 (= res!487555 (= lt!321595 lt!321593))))

(declare-fun lt!321588 () (_ BitVec 64))

(declare-fun lt!321589 () array!41049)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41049 (_ BitVec 32)) SeekEntryResult!7243)

(assert (=> b!726455 (= lt!321593 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321588 lt!321589 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726455 (= lt!321595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321588 mask!3328) lt!321588 lt!321589 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!726455 (= lt!321588 (select (store (arr!19646 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726455 (= lt!321589 (array!41050 (store (arr!19646 a!3186) i!1173 k0!2102) (size!20067 a!3186)))))

(declare-fun b!726456 () Bool)

(declare-fun res!487557 () Bool)

(assert (=> b!726456 (=> (not res!487557) (not e!406700))))

(assert (=> b!726456 (= res!487557 e!406703)))

(declare-fun c!79827 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726456 (= c!79827 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726457 () Bool)

(declare-fun res!487546 () Bool)

(assert (=> b!726457 (=> (not res!487546) (not e!406699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41049 (_ BitVec 32)) Bool)

(assert (=> b!726457 (= res!487546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726458 () Bool)

(declare-fun res!487550 () Bool)

(assert (=> b!726458 (=> (not res!487550) (not e!406700))))

(assert (=> b!726458 (= res!487550 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19646 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726459 () Bool)

(declare-fun e!406697 () Bool)

(assert (=> b!726459 (= e!406704 (not e!406697))))

(declare-fun res!487558 () Bool)

(assert (=> b!726459 (=> res!487558 e!406697)))

(get-info :version)

(assert (=> b!726459 (= res!487558 (or (not ((_ is Intermediate!7243) lt!321593)) (bvsge x!1131 (x!62336 lt!321593))))))

(declare-fun e!406698 () Bool)

(assert (=> b!726459 e!406698))

(declare-fun res!487554 () Bool)

(assert (=> b!726459 (=> (not res!487554) (not e!406698))))

(assert (=> b!726459 (= res!487554 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24776 0))(
  ( (Unit!24777) )
))
(declare-fun lt!321592 () Unit!24776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41049 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24776)

(assert (=> b!726459 (= lt!321592 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!321596 () SeekEntryResult!7243)

(declare-fun b!726460 () Bool)

(declare-fun e!406705 () Bool)

(assert (=> b!726460 (= e!406705 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19646 a!3186) j!159) a!3186 mask!3328) lt!321596))))

(declare-fun b!726461 () Bool)

(declare-fun res!487545 () Bool)

(declare-fun e!406701 () Bool)

(assert (=> b!726461 (=> (not res!487545) (not e!406701))))

(assert (=> b!726461 (= res!487545 (and (= (size!20067 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20067 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20067 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!487548 () Bool)

(assert (=> start!64514 (=> (not res!487548) (not e!406701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64514 (= res!487548 (validMask!0 mask!3328))))

(assert (=> start!64514 e!406701))

(assert (=> start!64514 true))

(declare-fun array_inv!15529 (array!41049) Bool)

(assert (=> start!64514 (array_inv!15529 a!3186)))

(declare-fun b!726462 () Bool)

(declare-fun res!487559 () Bool)

(assert (=> b!726462 (=> (not res!487559) (not e!406701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726462 (= res!487559 (validKeyInArray!0 (select (arr!19646 a!3186) j!159)))))

(declare-fun b!726463 () Bool)

(assert (=> b!726463 (= e!406699 e!406700)))

(declare-fun res!487556 () Bool)

(assert (=> b!726463 (=> (not res!487556) (not e!406700))))

(declare-fun lt!321590 () SeekEntryResult!7243)

(assert (=> b!726463 (= res!487556 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19646 a!3186) j!159) mask!3328) (select (arr!19646 a!3186) j!159) a!3186 mask!3328) lt!321590))))

(assert (=> b!726463 (= lt!321590 (Intermediate!7243 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726464 () Bool)

(declare-fun res!487552 () Bool)

(assert (=> b!726464 (=> (not res!487552) (not e!406701))))

(assert (=> b!726464 (= res!487552 (validKeyInArray!0 k0!2102))))

(declare-fun b!726465 () Bool)

(declare-fun res!487553 () Bool)

(assert (=> b!726465 (=> (not res!487553) (not e!406699))))

(assert (=> b!726465 (= res!487553 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20067 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20067 a!3186))))))

(declare-fun b!726466 () Bool)

(assert (=> b!726466 (= e!406701 e!406699)))

(declare-fun res!487549 () Bool)

(assert (=> b!726466 (=> (not res!487549) (not e!406699))))

(declare-fun lt!321594 () SeekEntryResult!7243)

(assert (=> b!726466 (= res!487549 (or (= lt!321594 (MissingZero!7243 i!1173)) (= lt!321594 (MissingVacant!7243 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41049 (_ BitVec 32)) SeekEntryResult!7243)

(assert (=> b!726466 (= lt!321594 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!726467 () Bool)

(declare-fun res!487547 () Bool)

(assert (=> b!726467 (=> (not res!487547) (not e!406701))))

(declare-fun arrayContainsKey!0 (array!41049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726467 (= res!487547 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726468 () Bool)

(assert (=> b!726468 (= e!406697 true)))

(declare-fun lt!321591 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726468 (= lt!321591 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!726469 () Bool)

(assert (=> b!726469 (= e!406703 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19646 a!3186) j!159) a!3186 mask!3328) lt!321590))))

(declare-fun b!726470 () Bool)

(assert (=> b!726470 (= e!406698 e!406705)))

(declare-fun res!487560 () Bool)

(assert (=> b!726470 (=> (not res!487560) (not e!406705))))

(assert (=> b!726470 (= res!487560 (= (seekEntryOrOpen!0 (select (arr!19646 a!3186) j!159) a!3186 mask!3328) lt!321596))))

(assert (=> b!726470 (= lt!321596 (Found!7243 j!159))))

(assert (= (and start!64514 res!487548) b!726461))

(assert (= (and b!726461 res!487545) b!726462))

(assert (= (and b!726462 res!487559) b!726464))

(assert (= (and b!726464 res!487552) b!726467))

(assert (= (and b!726467 res!487547) b!726466))

(assert (= (and b!726466 res!487549) b!726457))

(assert (= (and b!726457 res!487546) b!726453))

(assert (= (and b!726453 res!487551) b!726465))

(assert (= (and b!726465 res!487553) b!726463))

(assert (= (and b!726463 res!487556) b!726458))

(assert (= (and b!726458 res!487550) b!726456))

(assert (= (and b!726456 c!79827) b!726469))

(assert (= (and b!726456 (not c!79827)) b!726454))

(assert (= (and b!726456 res!487557) b!726455))

(assert (= (and b!726455 res!487555) b!726459))

(assert (= (and b!726459 res!487554) b!726470))

(assert (= (and b!726470 res!487560) b!726460))

(assert (= (and b!726459 (not res!487558)) b!726468))

(declare-fun m!679979 () Bool)

(assert (=> b!726462 m!679979))

(assert (=> b!726462 m!679979))

(declare-fun m!679981 () Bool)

(assert (=> b!726462 m!679981))

(declare-fun m!679983 () Bool)

(assert (=> b!726466 m!679983))

(declare-fun m!679985 () Bool)

(assert (=> b!726468 m!679985))

(declare-fun m!679987 () Bool)

(assert (=> b!726458 m!679987))

(assert (=> b!726463 m!679979))

(assert (=> b!726463 m!679979))

(declare-fun m!679989 () Bool)

(assert (=> b!726463 m!679989))

(assert (=> b!726463 m!679989))

(assert (=> b!726463 m!679979))

(declare-fun m!679991 () Bool)

(assert (=> b!726463 m!679991))

(declare-fun m!679993 () Bool)

(assert (=> b!726453 m!679993))

(declare-fun m!679995 () Bool)

(assert (=> b!726459 m!679995))

(declare-fun m!679997 () Bool)

(assert (=> b!726459 m!679997))

(assert (=> b!726460 m!679979))

(assert (=> b!726460 m!679979))

(declare-fun m!679999 () Bool)

(assert (=> b!726460 m!679999))

(declare-fun m!680001 () Bool)

(assert (=> b!726467 m!680001))

(declare-fun m!680003 () Bool)

(assert (=> b!726457 m!680003))

(declare-fun m!680005 () Bool)

(assert (=> start!64514 m!680005))

(declare-fun m!680007 () Bool)

(assert (=> start!64514 m!680007))

(assert (=> b!726470 m!679979))

(assert (=> b!726470 m!679979))

(declare-fun m!680009 () Bool)

(assert (=> b!726470 m!680009))

(assert (=> b!726469 m!679979))

(assert (=> b!726469 m!679979))

(declare-fun m!680011 () Bool)

(assert (=> b!726469 m!680011))

(declare-fun m!680013 () Bool)

(assert (=> b!726464 m!680013))

(assert (=> b!726454 m!679979))

(assert (=> b!726454 m!679979))

(declare-fun m!680015 () Bool)

(assert (=> b!726454 m!680015))

(declare-fun m!680017 () Bool)

(assert (=> b!726455 m!680017))

(declare-fun m!680019 () Bool)

(assert (=> b!726455 m!680019))

(declare-fun m!680021 () Bool)

(assert (=> b!726455 m!680021))

(assert (=> b!726455 m!680017))

(declare-fun m!680023 () Bool)

(assert (=> b!726455 m!680023))

(declare-fun m!680025 () Bool)

(assert (=> b!726455 m!680025))

(check-sat (not b!726469) (not b!726463) (not b!726468) (not b!726466) (not b!726453) (not start!64514) (not b!726470) (not b!726455) (not b!726467) (not b!726459) (not b!726460) (not b!726462) (not b!726457) (not b!726464) (not b!726454))
(check-sat)
