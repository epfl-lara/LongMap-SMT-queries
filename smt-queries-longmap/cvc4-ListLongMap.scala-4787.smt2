; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65786 () Bool)

(assert start!65786)

(declare-fun b!756530 () Bool)

(declare-fun e!421842 () Bool)

(declare-fun e!421844 () Bool)

(assert (=> b!756530 (= e!421842 e!421844)))

(declare-fun res!511531 () Bool)

(assert (=> b!756530 (=> (not res!511531) (not e!421844))))

(declare-datatypes ((array!41959 0))(
  ( (array!41960 (arr!20093 (Array (_ BitVec 32) (_ BitVec 64))) (size!20514 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41959)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7693 0))(
  ( (MissingZero!7693 (index!33140 (_ BitVec 32))) (Found!7693 (index!33141 (_ BitVec 32))) (Intermediate!7693 (undefined!8505 Bool) (index!33142 (_ BitVec 32)) (x!64035 (_ BitVec 32))) (Undefined!7693) (MissingVacant!7693 (index!33143 (_ BitVec 32))) )
))
(declare-fun lt!336834 () SeekEntryResult!7693)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41959 (_ BitVec 32)) SeekEntryResult!7693)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756530 (= res!511531 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20093 a!3186) j!159) mask!3328) (select (arr!20093 a!3186) j!159) a!3186 mask!3328) lt!336834))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756530 (= lt!336834 (Intermediate!7693 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756531 () Bool)

(declare-fun res!511524 () Bool)

(declare-fun e!421853 () Bool)

(assert (=> b!756531 (=> (not res!511524) (not e!421853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756531 (= res!511524 (validKeyInArray!0 (select (arr!20093 a!3186) j!159)))))

(declare-fun b!756532 () Bool)

(declare-fun res!511525 () Bool)

(assert (=> b!756532 (=> (not res!511525) (not e!421844))))

(declare-fun e!421852 () Bool)

(assert (=> b!756532 (= res!511525 e!421852)))

(declare-fun c!82888 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!756532 (= c!82888 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756534 () Bool)

(declare-fun res!511533 () Bool)

(assert (=> b!756534 (=> (not res!511533) (not e!421853))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!756534 (= res!511533 (validKeyInArray!0 k!2102))))

(declare-fun b!756535 () Bool)

(declare-fun e!421849 () Bool)

(assert (=> b!756535 (= e!421844 e!421849)))

(declare-fun res!511521 () Bool)

(assert (=> b!756535 (=> (not res!511521) (not e!421849))))

(declare-fun lt!336842 () SeekEntryResult!7693)

(declare-fun lt!336841 () SeekEntryResult!7693)

(assert (=> b!756535 (= res!511521 (= lt!336842 lt!336841))))

(declare-fun lt!336836 () array!41959)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!336835 () (_ BitVec 64))

(assert (=> b!756535 (= lt!336841 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336835 lt!336836 mask!3328))))

(assert (=> b!756535 (= lt!336842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336835 mask!3328) lt!336835 lt!336836 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!756535 (= lt!336835 (select (store (arr!20093 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!756535 (= lt!336836 (array!41960 (store (arr!20093 a!3186) i!1173 k!2102) (size!20514 a!3186)))))

(declare-fun b!756536 () Bool)

(declare-fun res!511532 () Bool)

(assert (=> b!756536 (=> (not res!511532) (not e!421844))))

(assert (=> b!756536 (= res!511532 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20093 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756537 () Bool)

(declare-fun res!511534 () Bool)

(declare-fun e!421851 () Bool)

(assert (=> b!756537 (=> (not res!511534) (not e!421851))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41959 (_ BitVec 32)) SeekEntryResult!7693)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41959 (_ BitVec 32)) SeekEntryResult!7693)

(assert (=> b!756537 (= res!511534 (= (seekEntryOrOpen!0 lt!336835 lt!336836 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336835 lt!336836 mask!3328)))))

(declare-fun b!756538 () Bool)

(declare-fun res!511530 () Bool)

(assert (=> b!756538 (=> (not res!511530) (not e!421842))))

(declare-datatypes ((List!14095 0))(
  ( (Nil!14092) (Cons!14091 (h!15163 (_ BitVec 64)) (t!20410 List!14095)) )
))
(declare-fun arrayNoDuplicates!0 (array!41959 (_ BitVec 32) List!14095) Bool)

(assert (=> b!756538 (= res!511530 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14092))))

(declare-fun b!756539 () Bool)

(declare-fun lt!336845 () SeekEntryResult!7693)

(declare-fun e!421845 () Bool)

(assert (=> b!756539 (= e!421845 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20093 a!3186) j!159) a!3186 mask!3328) lt!336845))))

(declare-fun b!756540 () Bool)

(declare-fun res!511517 () Bool)

(assert (=> b!756540 (=> (not res!511517) (not e!421853))))

(assert (=> b!756540 (= res!511517 (and (= (size!20514 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20514 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20514 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756541 () Bool)

(assert (=> b!756541 (= e!421852 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20093 a!3186) j!159) a!3186 mask!3328) (Found!7693 j!159)))))

(declare-fun b!756542 () Bool)

(declare-fun lt!336837 () SeekEntryResult!7693)

(declare-fun lt!336840 () SeekEntryResult!7693)

(assert (=> b!756542 (= e!421851 (= lt!336837 lt!336840))))

(declare-fun b!756543 () Bool)

(declare-datatypes ((Unit!26152 0))(
  ( (Unit!26153) )
))
(declare-fun e!421848 () Unit!26152)

(declare-fun Unit!26154 () Unit!26152)

(assert (=> b!756543 (= e!421848 Unit!26154)))

(assert (=> b!756543 false))

(declare-fun b!756544 () Bool)

(declare-fun res!511528 () Bool)

(assert (=> b!756544 (=> (not res!511528) (not e!421842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41959 (_ BitVec 32)) Bool)

(assert (=> b!756544 (= res!511528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756545 () Bool)

(declare-fun Unit!26155 () Unit!26152)

(assert (=> b!756545 (= e!421848 Unit!26155)))

(declare-fun res!511535 () Bool)

(assert (=> start!65786 (=> (not res!511535) (not e!421853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65786 (= res!511535 (validMask!0 mask!3328))))

(assert (=> start!65786 e!421853))

(assert (=> start!65786 true))

(declare-fun array_inv!15889 (array!41959) Bool)

(assert (=> start!65786 (array_inv!15889 a!3186)))

(declare-fun b!756533 () Bool)

(assert (=> b!756533 (= e!421852 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20093 a!3186) j!159) a!3186 mask!3328) lt!336834))))

(declare-fun b!756546 () Bool)

(assert (=> b!756546 (= e!421853 e!421842)))

(declare-fun res!511519 () Bool)

(assert (=> b!756546 (=> (not res!511519) (not e!421842))))

(declare-fun lt!336839 () SeekEntryResult!7693)

(assert (=> b!756546 (= res!511519 (or (= lt!336839 (MissingZero!7693 i!1173)) (= lt!336839 (MissingVacant!7693 i!1173))))))

(assert (=> b!756546 (= lt!336839 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!756547 () Bool)

(declare-fun e!421850 () Bool)

(assert (=> b!756547 (= e!421850 true)))

(assert (=> b!756547 e!421851))

(declare-fun res!511526 () Bool)

(assert (=> b!756547 (=> (not res!511526) (not e!421851))))

(declare-fun lt!336844 () (_ BitVec 64))

(assert (=> b!756547 (= res!511526 (= lt!336844 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336843 () Unit!26152)

(assert (=> b!756547 (= lt!336843 e!421848)))

(declare-fun c!82887 () Bool)

(assert (=> b!756547 (= c!82887 (= lt!336844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756548 () Bool)

(declare-fun e!421846 () Bool)

(assert (=> b!756548 (= e!421849 (not e!421846))))

(declare-fun res!511523 () Bool)

(assert (=> b!756548 (=> res!511523 e!421846)))

(assert (=> b!756548 (= res!511523 (or (not (is-Intermediate!7693 lt!336841)) (bvslt x!1131 (x!64035 lt!336841)) (not (= x!1131 (x!64035 lt!336841))) (not (= index!1321 (index!33142 lt!336841)))))))

(assert (=> b!756548 e!421845))

(declare-fun res!511522 () Bool)

(assert (=> b!756548 (=> (not res!511522) (not e!421845))))

(assert (=> b!756548 (= res!511522 (= lt!336837 lt!336845))))

(assert (=> b!756548 (= lt!336845 (Found!7693 j!159))))

(assert (=> b!756548 (= lt!336837 (seekEntryOrOpen!0 (select (arr!20093 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!756548 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336838 () Unit!26152)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41959 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26152)

(assert (=> b!756548 (= lt!336838 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756549 () Bool)

(declare-fun res!511527 () Bool)

(assert (=> b!756549 (=> (not res!511527) (not e!421842))))

(assert (=> b!756549 (= res!511527 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20514 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20514 a!3186))))))

(declare-fun b!756550 () Bool)

(declare-fun e!421847 () Bool)

(assert (=> b!756550 (= e!421846 e!421847)))

(declare-fun res!511520 () Bool)

(assert (=> b!756550 (=> res!511520 e!421847)))

(assert (=> b!756550 (= res!511520 (not (= lt!336840 lt!336845)))))

(assert (=> b!756550 (= lt!336840 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20093 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756551 () Bool)

(assert (=> b!756551 (= e!421847 e!421850)))

(declare-fun res!511529 () Bool)

(assert (=> b!756551 (=> res!511529 e!421850)))

(assert (=> b!756551 (= res!511529 (= lt!336844 lt!336835))))

(assert (=> b!756551 (= lt!336844 (select (store (arr!20093 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!756552 () Bool)

(declare-fun res!511518 () Bool)

(assert (=> b!756552 (=> (not res!511518) (not e!421853))))

(declare-fun arrayContainsKey!0 (array!41959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756552 (= res!511518 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65786 res!511535) b!756540))

(assert (= (and b!756540 res!511517) b!756531))

(assert (= (and b!756531 res!511524) b!756534))

(assert (= (and b!756534 res!511533) b!756552))

(assert (= (and b!756552 res!511518) b!756546))

(assert (= (and b!756546 res!511519) b!756544))

(assert (= (and b!756544 res!511528) b!756538))

(assert (= (and b!756538 res!511530) b!756549))

(assert (= (and b!756549 res!511527) b!756530))

(assert (= (and b!756530 res!511531) b!756536))

(assert (= (and b!756536 res!511532) b!756532))

(assert (= (and b!756532 c!82888) b!756533))

(assert (= (and b!756532 (not c!82888)) b!756541))

(assert (= (and b!756532 res!511525) b!756535))

(assert (= (and b!756535 res!511521) b!756548))

(assert (= (and b!756548 res!511522) b!756539))

(assert (= (and b!756548 (not res!511523)) b!756550))

(assert (= (and b!756550 (not res!511520)) b!756551))

(assert (= (and b!756551 (not res!511529)) b!756547))

(assert (= (and b!756547 c!82887) b!756543))

(assert (= (and b!756547 (not c!82887)) b!756545))

(assert (= (and b!756547 res!511526) b!756537))

(assert (= (and b!756537 res!511534) b!756542))

(declare-fun m!704463 () Bool)

(assert (=> b!756551 m!704463))

(declare-fun m!704465 () Bool)

(assert (=> b!756551 m!704465))

(declare-fun m!704467 () Bool)

(assert (=> b!756550 m!704467))

(assert (=> b!756550 m!704467))

(declare-fun m!704469 () Bool)

(assert (=> b!756550 m!704469))

(assert (=> b!756533 m!704467))

(assert (=> b!756533 m!704467))

(declare-fun m!704471 () Bool)

(assert (=> b!756533 m!704471))

(declare-fun m!704473 () Bool)

(assert (=> b!756546 m!704473))

(declare-fun m!704475 () Bool)

(assert (=> b!756535 m!704475))

(assert (=> b!756535 m!704475))

(declare-fun m!704477 () Bool)

(assert (=> b!756535 m!704477))

(declare-fun m!704479 () Bool)

(assert (=> b!756535 m!704479))

(assert (=> b!756535 m!704463))

(declare-fun m!704481 () Bool)

(assert (=> b!756535 m!704481))

(assert (=> b!756548 m!704467))

(assert (=> b!756548 m!704467))

(declare-fun m!704483 () Bool)

(assert (=> b!756548 m!704483))

(declare-fun m!704485 () Bool)

(assert (=> b!756548 m!704485))

(declare-fun m!704487 () Bool)

(assert (=> b!756548 m!704487))

(assert (=> b!756539 m!704467))

(assert (=> b!756539 m!704467))

(declare-fun m!704489 () Bool)

(assert (=> b!756539 m!704489))

(assert (=> b!756531 m!704467))

(assert (=> b!756531 m!704467))

(declare-fun m!704491 () Bool)

(assert (=> b!756531 m!704491))

(declare-fun m!704493 () Bool)

(assert (=> b!756538 m!704493))

(declare-fun m!704495 () Bool)

(assert (=> b!756552 m!704495))

(declare-fun m!704497 () Bool)

(assert (=> start!65786 m!704497))

(declare-fun m!704499 () Bool)

(assert (=> start!65786 m!704499))

(declare-fun m!704501 () Bool)

(assert (=> b!756544 m!704501))

(assert (=> b!756530 m!704467))

(assert (=> b!756530 m!704467))

(declare-fun m!704503 () Bool)

(assert (=> b!756530 m!704503))

(assert (=> b!756530 m!704503))

(assert (=> b!756530 m!704467))

(declare-fun m!704505 () Bool)

(assert (=> b!756530 m!704505))

(assert (=> b!756541 m!704467))

(assert (=> b!756541 m!704467))

(assert (=> b!756541 m!704469))

(declare-fun m!704507 () Bool)

(assert (=> b!756534 m!704507))

(declare-fun m!704509 () Bool)

(assert (=> b!756536 m!704509))

(declare-fun m!704511 () Bool)

(assert (=> b!756537 m!704511))

(declare-fun m!704513 () Bool)

(assert (=> b!756537 m!704513))

(push 1)

