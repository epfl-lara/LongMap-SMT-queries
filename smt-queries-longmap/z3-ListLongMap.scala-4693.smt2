; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65198 () Bool)

(assert start!65198)

(declare-fun b!738378 () Bool)

(declare-fun e!412921 () Bool)

(declare-fun e!412920 () Bool)

(assert (=> b!738378 (= e!412921 (not e!412920))))

(declare-fun res!496476 () Bool)

(assert (=> b!738378 (=> res!496476 e!412920)))

(declare-datatypes ((SeekEntryResult!7405 0))(
  ( (MissingZero!7405 (index!31988 (_ BitVec 32))) (Found!7405 (index!31989 (_ BitVec 32))) (Intermediate!7405 (undefined!8217 Bool) (index!31990 (_ BitVec 32)) (x!62990 (_ BitVec 32))) (Undefined!7405) (MissingVacant!7405 (index!31991 (_ BitVec 32))) )
))
(declare-fun lt!327638 () SeekEntryResult!7405)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!738378 (= res!496476 (or (not ((_ is Intermediate!7405) lt!327638)) (bvsge x!1131 (x!62990 lt!327638))))))

(declare-fun lt!327634 () SeekEntryResult!7405)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!738378 (= lt!327634 (Found!7405 j!159))))

(declare-fun e!412916 () Bool)

(assert (=> b!738378 e!412916))

(declare-fun res!496463 () Bool)

(assert (=> b!738378 (=> (not res!496463) (not e!412916))))

(declare-datatypes ((array!41388 0))(
  ( (array!41389 (arr!19808 (Array (_ BitVec 32) (_ BitVec 64))) (size!20229 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41388)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41388 (_ BitVec 32)) Bool)

(assert (=> b!738378 (= res!496463 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25196 0))(
  ( (Unit!25197) )
))
(declare-fun lt!327635 () Unit!25196)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25196)

(assert (=> b!738378 (= lt!327635 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!496468 () Bool)

(declare-fun e!412923 () Bool)

(assert (=> start!65198 (=> (not res!496468) (not e!412923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65198 (= res!496468 (validMask!0 mask!3328))))

(assert (=> start!65198 e!412923))

(assert (=> start!65198 true))

(declare-fun array_inv!15691 (array!41388) Bool)

(assert (=> start!65198 (array_inv!15691 a!3186)))

(declare-fun b!738379 () Bool)

(declare-fun res!496473 () Bool)

(declare-fun e!412917 () Bool)

(assert (=> b!738379 (=> (not res!496473) (not e!412917))))

(declare-datatypes ((List!13849 0))(
  ( (Nil!13846) (Cons!13845 (h!14917 (_ BitVec 64)) (t!20155 List!13849)) )
))
(declare-fun arrayNoDuplicates!0 (array!41388 (_ BitVec 32) List!13849) Bool)

(assert (=> b!738379 (= res!496473 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13846))))

(declare-fun b!738380 () Bool)

(declare-fun e!412922 () Bool)

(assert (=> b!738380 (= e!412920 e!412922)))

(declare-fun res!496461 () Bool)

(assert (=> b!738380 (=> res!496461 e!412922)))

(declare-fun lt!327647 () (_ BitVec 32))

(assert (=> b!738380 (= res!496461 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327647 #b00000000000000000000000000000000) (bvsge lt!327647 (size!20229 a!3186))))))

(declare-fun lt!327637 () Unit!25196)

(declare-fun e!412914 () Unit!25196)

(assert (=> b!738380 (= lt!327637 e!412914)))

(declare-fun c!81341 () Bool)

(declare-fun lt!327644 () Bool)

(assert (=> b!738380 (= c!81341 lt!327644)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738380 (= lt!327644 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738380 (= lt!327647 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun e!412915 () Bool)

(declare-fun b!738381 () Bool)

(declare-fun lt!327642 () SeekEntryResult!7405)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41388 (_ BitVec 32)) SeekEntryResult!7405)

(assert (=> b!738381 (= e!412915 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327642))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!738382 () Bool)

(declare-fun e!412918 () Bool)

(declare-fun lt!327636 () SeekEntryResult!7405)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41388 (_ BitVec 32)) SeekEntryResult!7405)

(assert (=> b!738382 (= e!412918 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327636))))

(declare-fun b!738383 () Bool)

(assert (=> b!738383 (= e!412916 e!412918)))

(declare-fun res!496474 () Bool)

(assert (=> b!738383 (=> (not res!496474) (not e!412918))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41388 (_ BitVec 32)) SeekEntryResult!7405)

(assert (=> b!738383 (= res!496474 (= (seekEntryOrOpen!0 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327636))))

(assert (=> b!738383 (= lt!327636 (Found!7405 j!159))))

(declare-fun b!738384 () Bool)

(declare-fun res!496475 () Bool)

(assert (=> b!738384 (=> (not res!496475) (not e!412923))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738384 (= res!496475 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738385 () Bool)

(assert (=> b!738385 (= e!412923 e!412917)))

(declare-fun res!496471 () Bool)

(assert (=> b!738385 (=> (not res!496471) (not e!412917))))

(declare-fun lt!327640 () SeekEntryResult!7405)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738385 (= res!496471 (or (= lt!327640 (MissingZero!7405 i!1173)) (= lt!327640 (MissingVacant!7405 i!1173))))))

(assert (=> b!738385 (= lt!327640 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!412919 () Bool)

(declare-fun b!738386 () Bool)

(assert (=> b!738386 (= e!412919 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327647 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327642)))))

(declare-fun b!738387 () Bool)

(declare-fun res!496470 () Bool)

(assert (=> b!738387 (=> res!496470 e!412922)))

(assert (=> b!738387 (= res!496470 e!412919)))

(declare-fun c!81340 () Bool)

(assert (=> b!738387 (= c!81340 lt!327644)))

(declare-fun b!738388 () Bool)

(declare-fun res!496469 () Bool)

(assert (=> b!738388 (=> (not res!496469) (not e!412923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738388 (= res!496469 (validKeyInArray!0 (select (arr!19808 a!3186) j!159)))))

(declare-fun b!738389 () Bool)

(declare-fun Unit!25198 () Unit!25196)

(assert (=> b!738389 (= e!412914 Unit!25198)))

(assert (=> b!738389 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327647 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327642)))

(declare-fun b!738390 () Bool)

(assert (=> b!738390 (= e!412922 true)))

(declare-fun lt!327639 () SeekEntryResult!7405)

(declare-fun lt!327643 () array!41388)

(declare-fun lt!327646 () (_ BitVec 64))

(assert (=> b!738390 (= lt!327639 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327647 lt!327646 lt!327643 mask!3328))))

(declare-fun b!738391 () Bool)

(declare-fun e!412913 () Bool)

(assert (=> b!738391 (= e!412913 e!412921)))

(declare-fun res!496466 () Bool)

(assert (=> b!738391 (=> (not res!496466) (not e!412921))))

(declare-fun lt!327645 () SeekEntryResult!7405)

(assert (=> b!738391 (= res!496466 (= lt!327645 lt!327638))))

(assert (=> b!738391 (= lt!327638 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327646 lt!327643 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738391 (= lt!327645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327646 mask!3328) lt!327646 lt!327643 mask!3328))))

(assert (=> b!738391 (= lt!327646 (select (store (arr!19808 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738391 (= lt!327643 (array!41389 (store (arr!19808 a!3186) i!1173 k0!2102) (size!20229 a!3186)))))

(declare-fun b!738392 () Bool)

(assert (=> b!738392 (= e!412917 e!412913)))

(declare-fun res!496467 () Bool)

(assert (=> b!738392 (=> (not res!496467) (not e!412913))))

(assert (=> b!738392 (= res!496467 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19808 a!3186) j!159) mask!3328) (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327642))))

(assert (=> b!738392 (= lt!327642 (Intermediate!7405 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738393 () Bool)

(declare-fun Unit!25199 () Unit!25196)

(assert (=> b!738393 (= e!412914 Unit!25199)))

(declare-fun lt!327641 () SeekEntryResult!7405)

(assert (=> b!738393 (= lt!327641 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19808 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738393 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327647 resIntermediateIndex!5 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327634)))

(declare-fun b!738394 () Bool)

(declare-fun res!496472 () Bool)

(assert (=> b!738394 (=> (not res!496472) (not e!412913))))

(assert (=> b!738394 (= res!496472 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19808 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738395 () Bool)

(assert (=> b!738395 (= e!412915 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) (Found!7405 j!159)))))

(declare-fun b!738396 () Bool)

(assert (=> b!738396 (= e!412919 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327647 resIntermediateIndex!5 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327634)))))

(declare-fun b!738397 () Bool)

(declare-fun res!496464 () Bool)

(assert (=> b!738397 (=> (not res!496464) (not e!412913))))

(assert (=> b!738397 (= res!496464 e!412915)))

(declare-fun c!81342 () Bool)

(assert (=> b!738397 (= c!81342 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738398 () Bool)

(declare-fun res!496460 () Bool)

(assert (=> b!738398 (=> (not res!496460) (not e!412917))))

(assert (=> b!738398 (= res!496460 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20229 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20229 a!3186))))))

(declare-fun b!738399 () Bool)

(declare-fun res!496465 () Bool)

(assert (=> b!738399 (=> (not res!496465) (not e!412923))))

(assert (=> b!738399 (= res!496465 (and (= (size!20229 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20229 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20229 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738400 () Bool)

(declare-fun res!496462 () Bool)

(assert (=> b!738400 (=> (not res!496462) (not e!412923))))

(assert (=> b!738400 (= res!496462 (validKeyInArray!0 k0!2102))))

(declare-fun b!738401 () Bool)

(declare-fun res!496459 () Bool)

(assert (=> b!738401 (=> (not res!496459) (not e!412917))))

(assert (=> b!738401 (= res!496459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65198 res!496468) b!738399))

(assert (= (and b!738399 res!496465) b!738388))

(assert (= (and b!738388 res!496469) b!738400))

(assert (= (and b!738400 res!496462) b!738384))

(assert (= (and b!738384 res!496475) b!738385))

(assert (= (and b!738385 res!496471) b!738401))

(assert (= (and b!738401 res!496459) b!738379))

(assert (= (and b!738379 res!496473) b!738398))

(assert (= (and b!738398 res!496460) b!738392))

(assert (= (and b!738392 res!496467) b!738394))

(assert (= (and b!738394 res!496472) b!738397))

(assert (= (and b!738397 c!81342) b!738381))

(assert (= (and b!738397 (not c!81342)) b!738395))

(assert (= (and b!738397 res!496464) b!738391))

(assert (= (and b!738391 res!496466) b!738378))

(assert (= (and b!738378 res!496463) b!738383))

(assert (= (and b!738383 res!496474) b!738382))

(assert (= (and b!738378 (not res!496476)) b!738380))

(assert (= (and b!738380 c!81341) b!738389))

(assert (= (and b!738380 (not c!81341)) b!738393))

(assert (= (and b!738380 (not res!496461)) b!738387))

(assert (= (and b!738387 c!81340) b!738386))

(assert (= (and b!738387 (not c!81340)) b!738396))

(assert (= (and b!738387 (not res!496470)) b!738390))

(declare-fun m!689453 () Bool)

(assert (=> b!738401 m!689453))

(declare-fun m!689455 () Bool)

(assert (=> b!738394 m!689455))

(declare-fun m!689457 () Bool)

(assert (=> b!738391 m!689457))

(declare-fun m!689459 () Bool)

(assert (=> b!738391 m!689459))

(declare-fun m!689461 () Bool)

(assert (=> b!738391 m!689461))

(declare-fun m!689463 () Bool)

(assert (=> b!738391 m!689463))

(assert (=> b!738391 m!689463))

(declare-fun m!689465 () Bool)

(assert (=> b!738391 m!689465))

(declare-fun m!689467 () Bool)

(assert (=> b!738379 m!689467))

(declare-fun m!689469 () Bool)

(assert (=> b!738388 m!689469))

(assert (=> b!738388 m!689469))

(declare-fun m!689471 () Bool)

(assert (=> b!738388 m!689471))

(assert (=> b!738389 m!689469))

(assert (=> b!738389 m!689469))

(declare-fun m!689473 () Bool)

(assert (=> b!738389 m!689473))

(declare-fun m!689475 () Bool)

(assert (=> b!738384 m!689475))

(declare-fun m!689477 () Bool)

(assert (=> b!738385 m!689477))

(assert (=> b!738386 m!689469))

(assert (=> b!738386 m!689469))

(assert (=> b!738386 m!689473))

(assert (=> b!738395 m!689469))

(assert (=> b!738395 m!689469))

(declare-fun m!689479 () Bool)

(assert (=> b!738395 m!689479))

(declare-fun m!689481 () Bool)

(assert (=> b!738380 m!689481))

(assert (=> b!738392 m!689469))

(assert (=> b!738392 m!689469))

(declare-fun m!689483 () Bool)

(assert (=> b!738392 m!689483))

(assert (=> b!738392 m!689483))

(assert (=> b!738392 m!689469))

(declare-fun m!689485 () Bool)

(assert (=> b!738392 m!689485))

(declare-fun m!689487 () Bool)

(assert (=> b!738378 m!689487))

(declare-fun m!689489 () Bool)

(assert (=> b!738378 m!689489))

(assert (=> b!738381 m!689469))

(assert (=> b!738381 m!689469))

(declare-fun m!689491 () Bool)

(assert (=> b!738381 m!689491))

(declare-fun m!689493 () Bool)

(assert (=> b!738400 m!689493))

(declare-fun m!689495 () Bool)

(assert (=> start!65198 m!689495))

(declare-fun m!689497 () Bool)

(assert (=> start!65198 m!689497))

(assert (=> b!738393 m!689469))

(assert (=> b!738393 m!689469))

(assert (=> b!738393 m!689479))

(assert (=> b!738393 m!689469))

(declare-fun m!689499 () Bool)

(assert (=> b!738393 m!689499))

(assert (=> b!738396 m!689469))

(assert (=> b!738396 m!689469))

(assert (=> b!738396 m!689499))

(declare-fun m!689501 () Bool)

(assert (=> b!738390 m!689501))

(assert (=> b!738383 m!689469))

(assert (=> b!738383 m!689469))

(declare-fun m!689503 () Bool)

(assert (=> b!738383 m!689503))

(assert (=> b!738382 m!689469))

(assert (=> b!738382 m!689469))

(declare-fun m!689505 () Bool)

(assert (=> b!738382 m!689505))

(check-sat (not b!738395) (not b!738384) (not b!738401) (not b!738400) (not b!738380) (not b!738378) (not b!738385) (not b!738391) (not b!738383) (not b!738386) (not b!738390) (not start!65198) (not b!738388) (not b!738381) (not b!738389) (not b!738382) (not b!738393) (not b!738379) (not b!738396) (not b!738392))
(check-sat)
