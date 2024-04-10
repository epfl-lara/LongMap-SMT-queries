; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66656 () Bool)

(assert start!66656)

(declare-fun b!768002 () Bool)

(declare-fun res!519447 () Bool)

(declare-fun e!427676 () Bool)

(assert (=> b!768002 (=> (not res!519447) (not e!427676))))

(declare-datatypes ((array!42297 0))(
  ( (array!42298 (arr!20250 (Array (_ BitVec 32) (_ BitVec 64))) (size!20671 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42297)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42297 (_ BitVec 32)) Bool)

(assert (=> b!768002 (= res!519447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!768003 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7850 0))(
  ( (MissingZero!7850 (index!33768 (_ BitVec 32))) (Found!7850 (index!33769 (_ BitVec 32))) (Intermediate!7850 (undefined!8662 Bool) (index!33770 (_ BitVec 32)) (x!64696 (_ BitVec 32))) (Undefined!7850) (MissingVacant!7850 (index!33771 (_ BitVec 32))) )
))
(declare-fun lt!341651 () SeekEntryResult!7850)

(declare-fun e!427681 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42297 (_ BitVec 32)) SeekEntryResult!7850)

(assert (=> b!768003 (= e!427681 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20250 a!3186) j!159) a!3186 mask!3328) lt!341651))))

(declare-fun b!768004 () Bool)

(declare-fun res!519452 () Bool)

(assert (=> b!768004 (=> (not res!519452) (not e!427676))))

(declare-datatypes ((List!14252 0))(
  ( (Nil!14249) (Cons!14248 (h!15344 (_ BitVec 64)) (t!20567 List!14252)) )
))
(declare-fun arrayNoDuplicates!0 (array!42297 (_ BitVec 32) List!14252) Bool)

(assert (=> b!768004 (= res!519452 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14249))))

(declare-fun b!768005 () Bool)

(declare-fun e!427678 () Bool)

(declare-fun e!427682 () Bool)

(assert (=> b!768005 (= e!427678 (not e!427682))))

(declare-fun res!519454 () Bool)

(assert (=> b!768005 (=> res!519454 e!427682)))

(declare-fun lt!341648 () SeekEntryResult!7850)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!768005 (= res!519454 (or (not (is-Intermediate!7850 lt!341648)) (bvsge x!1131 (x!64696 lt!341648))))))

(declare-fun e!427677 () Bool)

(assert (=> b!768005 e!427677))

(declare-fun res!519457 () Bool)

(assert (=> b!768005 (=> (not res!519457) (not e!427677))))

(assert (=> b!768005 (= res!519457 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26426 0))(
  ( (Unit!26427) )
))
(declare-fun lt!341649 () Unit!26426)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26426)

(assert (=> b!768005 (= lt!341649 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!519443 () Bool)

(declare-fun e!427679 () Bool)

(assert (=> start!66656 (=> (not res!519443) (not e!427679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66656 (= res!519443 (validMask!0 mask!3328))))

(assert (=> start!66656 e!427679))

(assert (=> start!66656 true))

(declare-fun array_inv!16046 (array!42297) Bool)

(assert (=> start!66656 (array_inv!16046 a!3186)))

(declare-fun b!768006 () Bool)

(declare-fun res!519449 () Bool)

(assert (=> b!768006 (=> (not res!519449) (not e!427679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!768006 (= res!519449 (validKeyInArray!0 (select (arr!20250 a!3186) j!159)))))

(declare-fun b!768007 () Bool)

(declare-fun res!519441 () Bool)

(assert (=> b!768007 (=> (not res!519441) (not e!427679))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!768007 (= res!519441 (and (= (size!20671 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20671 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20671 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!768008 () Bool)

(declare-fun res!519444 () Bool)

(declare-fun e!427683 () Bool)

(assert (=> b!768008 (=> (not res!519444) (not e!427683))))

(declare-fun e!427680 () Bool)

(assert (=> b!768008 (= res!519444 e!427680)))

(declare-fun c!84673 () Bool)

(assert (=> b!768008 (= c!84673 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!768009 () Bool)

(declare-fun res!519445 () Bool)

(assert (=> b!768009 (=> (not res!519445) (not e!427676))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!768009 (= res!519445 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20671 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20671 a!3186))))))

(declare-fun lt!341644 () SeekEntryResult!7850)

(declare-fun b!768010 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42297 (_ BitVec 32)) SeekEntryResult!7850)

(assert (=> b!768010 (= e!427680 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20250 a!3186) j!159) a!3186 mask!3328) lt!341644))))

(declare-fun b!768011 () Bool)

(declare-fun res!519450 () Bool)

(assert (=> b!768011 (=> (not res!519450) (not e!427679))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!768011 (= res!519450 (validKeyInArray!0 k!2102))))

(declare-fun b!768012 () Bool)

(declare-fun res!519453 () Bool)

(assert (=> b!768012 (=> (not res!519453) (not e!427683))))

(assert (=> b!768012 (= res!519453 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20250 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768013 () Bool)

(assert (=> b!768013 (= e!427683 e!427678)))

(declare-fun res!519446 () Bool)

(assert (=> b!768013 (=> (not res!519446) (not e!427678))))

(declare-fun lt!341647 () SeekEntryResult!7850)

(assert (=> b!768013 (= res!519446 (= lt!341647 lt!341648))))

(declare-fun lt!341642 () array!42297)

(declare-fun lt!341646 () (_ BitVec 64))

(assert (=> b!768013 (= lt!341648 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341646 lt!341642 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768013 (= lt!341647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341646 mask!3328) lt!341646 lt!341642 mask!3328))))

(assert (=> b!768013 (= lt!341646 (select (store (arr!20250 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!768013 (= lt!341642 (array!42298 (store (arr!20250 a!3186) i!1173 k!2102) (size!20671 a!3186)))))

(declare-fun b!768014 () Bool)

(assert (=> b!768014 (= e!427679 e!427676)))

(declare-fun res!519456 () Bool)

(assert (=> b!768014 (=> (not res!519456) (not e!427676))))

(declare-fun lt!341643 () SeekEntryResult!7850)

(assert (=> b!768014 (= res!519456 (or (= lt!341643 (MissingZero!7850 i!1173)) (= lt!341643 (MissingVacant!7850 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42297 (_ BitVec 32)) SeekEntryResult!7850)

(assert (=> b!768014 (= lt!341643 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!768015 () Bool)

(assert (=> b!768015 (= e!427680 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20250 a!3186) j!159) a!3186 mask!3328) (Found!7850 j!159)))))

(declare-fun b!768016 () Bool)

(assert (=> b!768016 (= e!427677 e!427681)))

(declare-fun res!519455 () Bool)

(assert (=> b!768016 (=> (not res!519455) (not e!427681))))

(assert (=> b!768016 (= res!519455 (= (seekEntryOrOpen!0 (select (arr!20250 a!3186) j!159) a!3186 mask!3328) lt!341651))))

(assert (=> b!768016 (= lt!341651 (Found!7850 j!159))))

(declare-fun b!768017 () Bool)

(assert (=> b!768017 (= e!427676 e!427683)))

(declare-fun res!519451 () Bool)

(assert (=> b!768017 (=> (not res!519451) (not e!427683))))

(assert (=> b!768017 (= res!519451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20250 a!3186) j!159) mask!3328) (select (arr!20250 a!3186) j!159) a!3186 mask!3328) lt!341644))))

(assert (=> b!768017 (= lt!341644 (Intermediate!7850 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!768018 () Bool)

(declare-fun e!427675 () Bool)

(assert (=> b!768018 (= e!427675 true)))

(declare-fun lt!341645 () SeekEntryResult!7850)

(assert (=> b!768018 (= lt!341645 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20250 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768019 () Bool)

(declare-fun res!519442 () Bool)

(assert (=> b!768019 (=> (not res!519442) (not e!427679))))

(declare-fun arrayContainsKey!0 (array!42297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!768019 (= res!519442 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!768020 () Bool)

(assert (=> b!768020 (= e!427682 e!427675)))

(declare-fun res!519448 () Bool)

(assert (=> b!768020 (=> res!519448 e!427675)))

(assert (=> b!768020 (= res!519448 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341650 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768020 (= lt!341650 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!66656 res!519443) b!768007))

(assert (= (and b!768007 res!519441) b!768006))

(assert (= (and b!768006 res!519449) b!768011))

(assert (= (and b!768011 res!519450) b!768019))

(assert (= (and b!768019 res!519442) b!768014))

(assert (= (and b!768014 res!519456) b!768002))

(assert (= (and b!768002 res!519447) b!768004))

(assert (= (and b!768004 res!519452) b!768009))

(assert (= (and b!768009 res!519445) b!768017))

(assert (= (and b!768017 res!519451) b!768012))

(assert (= (and b!768012 res!519453) b!768008))

(assert (= (and b!768008 c!84673) b!768010))

(assert (= (and b!768008 (not c!84673)) b!768015))

(assert (= (and b!768008 res!519444) b!768013))

(assert (= (and b!768013 res!519446) b!768005))

(assert (= (and b!768005 res!519457) b!768016))

(assert (= (and b!768016 res!519455) b!768003))

(assert (= (and b!768005 (not res!519454)) b!768020))

(assert (= (and b!768020 (not res!519448)) b!768018))

(declare-fun m!713631 () Bool)

(assert (=> b!768010 m!713631))

(assert (=> b!768010 m!713631))

(declare-fun m!713633 () Bool)

(assert (=> b!768010 m!713633))

(assert (=> b!768015 m!713631))

(assert (=> b!768015 m!713631))

(declare-fun m!713635 () Bool)

(assert (=> b!768015 m!713635))

(declare-fun m!713637 () Bool)

(assert (=> b!768005 m!713637))

(declare-fun m!713639 () Bool)

(assert (=> b!768005 m!713639))

(declare-fun m!713641 () Bool)

(assert (=> b!768012 m!713641))

(declare-fun m!713643 () Bool)

(assert (=> b!768014 m!713643))

(declare-fun m!713645 () Bool)

(assert (=> b!768019 m!713645))

(declare-fun m!713647 () Bool)

(assert (=> start!66656 m!713647))

(declare-fun m!713649 () Bool)

(assert (=> start!66656 m!713649))

(assert (=> b!768006 m!713631))

(assert (=> b!768006 m!713631))

(declare-fun m!713651 () Bool)

(assert (=> b!768006 m!713651))

(assert (=> b!768003 m!713631))

(assert (=> b!768003 m!713631))

(declare-fun m!713653 () Bool)

(assert (=> b!768003 m!713653))

(declare-fun m!713655 () Bool)

(assert (=> b!768020 m!713655))

(declare-fun m!713657 () Bool)

(assert (=> b!768004 m!713657))

(declare-fun m!713659 () Bool)

(assert (=> b!768002 m!713659))

(declare-fun m!713661 () Bool)

(assert (=> b!768011 m!713661))

(assert (=> b!768017 m!713631))

(assert (=> b!768017 m!713631))

(declare-fun m!713663 () Bool)

(assert (=> b!768017 m!713663))

(assert (=> b!768017 m!713663))

(assert (=> b!768017 m!713631))

(declare-fun m!713665 () Bool)

(assert (=> b!768017 m!713665))

(assert (=> b!768016 m!713631))

(assert (=> b!768016 m!713631))

(declare-fun m!713667 () Bool)

(assert (=> b!768016 m!713667))

(declare-fun m!713669 () Bool)

(assert (=> b!768013 m!713669))

(declare-fun m!713671 () Bool)

(assert (=> b!768013 m!713671))

(assert (=> b!768013 m!713669))

(declare-fun m!713673 () Bool)

(assert (=> b!768013 m!713673))

(declare-fun m!713675 () Bool)

(assert (=> b!768013 m!713675))

(declare-fun m!713677 () Bool)

(assert (=> b!768013 m!713677))

(assert (=> b!768018 m!713631))

(assert (=> b!768018 m!713631))

(assert (=> b!768018 m!713635))

(push 1)

