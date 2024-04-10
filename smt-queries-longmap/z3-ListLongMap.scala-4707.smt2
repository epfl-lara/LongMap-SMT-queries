; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65304 () Bool)

(assert start!65304)

(declare-fun b!741545 () Bool)

(declare-fun res!498851 () Bool)

(declare-fun e!414498 () Bool)

(assert (=> b!741545 (=> (not res!498851) (not e!414498))))

(declare-fun e!414496 () Bool)

(assert (=> b!741545 (= res!498851 e!414496)))

(declare-fun c!81733 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741545 (= c!81733 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741546 () Bool)

(declare-fun res!498846 () Bool)

(assert (=> b!741546 (=> (not res!498846) (not e!414498))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41477 0))(
  ( (array!41478 (arr!19852 (Array (_ BitVec 32) (_ BitVec 64))) (size!20273 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41477)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741546 (= res!498846 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19852 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!7452 0))(
  ( (MissingZero!7452 (index!32176 (_ BitVec 32))) (Found!7452 (index!32177 (_ BitVec 32))) (Intermediate!7452 (undefined!8264 Bool) (index!32178 (_ BitVec 32)) (x!63154 (_ BitVec 32))) (Undefined!7452) (MissingVacant!7452 (index!32179 (_ BitVec 32))) )
))
(declare-fun lt!329454 () SeekEntryResult!7452)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!741547 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41477 (_ BitVec 32)) SeekEntryResult!7452)

(assert (=> b!741547 (= e!414496 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19852 a!3186) j!159) a!3186 mask!3328) lt!329454))))

(declare-fun b!741548 () Bool)

(declare-fun lt!329459 () SeekEntryResult!7452)

(declare-fun e!414501 () Bool)

(get-info :version)

(assert (=> b!741548 (= e!414501 (not (or (not ((_ is Intermediate!7452) lt!329459)) (not (= x!1131 (x!63154 lt!329459))) (not (= index!1321 (index!32178 lt!329459))) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun e!414499 () Bool)

(assert (=> b!741548 e!414499))

(declare-fun res!498852 () Bool)

(assert (=> b!741548 (=> (not res!498852) (not e!414499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41477 (_ BitVec 32)) Bool)

(assert (=> b!741548 (= res!498852 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25384 0))(
  ( (Unit!25385) )
))
(declare-fun lt!329458 () Unit!25384)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25384)

(assert (=> b!741548 (= lt!329458 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741549 () Bool)

(declare-fun res!498850 () Bool)

(declare-fun e!414502 () Bool)

(assert (=> b!741549 (=> (not res!498850) (not e!414502))))

(assert (=> b!741549 (= res!498850 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20273 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20273 a!3186))))))

(declare-fun b!741550 () Bool)

(declare-fun e!414500 () Bool)

(assert (=> b!741550 (= e!414499 e!414500)))

(declare-fun res!498844 () Bool)

(assert (=> b!741550 (=> (not res!498844) (not e!414500))))

(declare-fun lt!329453 () SeekEntryResult!7452)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41477 (_ BitVec 32)) SeekEntryResult!7452)

(assert (=> b!741550 (= res!498844 (= (seekEntryOrOpen!0 (select (arr!19852 a!3186) j!159) a!3186 mask!3328) lt!329453))))

(assert (=> b!741550 (= lt!329453 (Found!7452 j!159))))

(declare-fun b!741551 () Bool)

(assert (=> b!741551 (= e!414502 e!414498)))

(declare-fun res!498847 () Bool)

(assert (=> b!741551 (=> (not res!498847) (not e!414498))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741551 (= res!498847 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19852 a!3186) j!159) mask!3328) (select (arr!19852 a!3186) j!159) a!3186 mask!3328) lt!329454))))

(assert (=> b!741551 (= lt!329454 (Intermediate!7452 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!498840 () Bool)

(declare-fun e!414503 () Bool)

(assert (=> start!65304 (=> (not res!498840) (not e!414503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65304 (= res!498840 (validMask!0 mask!3328))))

(assert (=> start!65304 e!414503))

(assert (=> start!65304 true))

(declare-fun array_inv!15648 (array!41477) Bool)

(assert (=> start!65304 (array_inv!15648 a!3186)))

(declare-fun b!741552 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41477 (_ BitVec 32)) SeekEntryResult!7452)

(assert (=> b!741552 (= e!414496 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19852 a!3186) j!159) a!3186 mask!3328) (Found!7452 j!159)))))

(declare-fun b!741553 () Bool)

(declare-fun res!498841 () Bool)

(assert (=> b!741553 (=> (not res!498841) (not e!414503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741553 (= res!498841 (validKeyInArray!0 (select (arr!19852 a!3186) j!159)))))

(declare-fun b!741554 () Bool)

(declare-fun res!498842 () Bool)

(assert (=> b!741554 (=> (not res!498842) (not e!414503))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!741554 (= res!498842 (validKeyInArray!0 k0!2102))))

(declare-fun b!741555 () Bool)

(declare-fun res!498853 () Bool)

(assert (=> b!741555 (=> (not res!498853) (not e!414502))))

(declare-datatypes ((List!13854 0))(
  ( (Nil!13851) (Cons!13850 (h!14922 (_ BitVec 64)) (t!20169 List!13854)) )
))
(declare-fun arrayNoDuplicates!0 (array!41477 (_ BitVec 32) List!13854) Bool)

(assert (=> b!741555 (= res!498853 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13851))))

(declare-fun b!741556 () Bool)

(assert (=> b!741556 (= e!414498 e!414501)))

(declare-fun res!498849 () Bool)

(assert (=> b!741556 (=> (not res!498849) (not e!414501))))

(declare-fun lt!329456 () SeekEntryResult!7452)

(assert (=> b!741556 (= res!498849 (= lt!329456 lt!329459))))

(declare-fun lt!329452 () (_ BitVec 64))

(declare-fun lt!329455 () array!41477)

(assert (=> b!741556 (= lt!329459 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329452 lt!329455 mask!3328))))

(assert (=> b!741556 (= lt!329456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329452 mask!3328) lt!329452 lt!329455 mask!3328))))

(assert (=> b!741556 (= lt!329452 (select (store (arr!19852 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741556 (= lt!329455 (array!41478 (store (arr!19852 a!3186) i!1173 k0!2102) (size!20273 a!3186)))))

(declare-fun b!741557 () Bool)

(assert (=> b!741557 (= e!414500 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19852 a!3186) j!159) a!3186 mask!3328) lt!329453))))

(declare-fun b!741558 () Bool)

(assert (=> b!741558 (= e!414503 e!414502)))

(declare-fun res!498854 () Bool)

(assert (=> b!741558 (=> (not res!498854) (not e!414502))))

(declare-fun lt!329457 () SeekEntryResult!7452)

(assert (=> b!741558 (= res!498854 (or (= lt!329457 (MissingZero!7452 i!1173)) (= lt!329457 (MissingVacant!7452 i!1173))))))

(assert (=> b!741558 (= lt!329457 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741559 () Bool)

(declare-fun res!498848 () Bool)

(assert (=> b!741559 (=> (not res!498848) (not e!414502))))

(assert (=> b!741559 (= res!498848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741560 () Bool)

(declare-fun res!498845 () Bool)

(assert (=> b!741560 (=> (not res!498845) (not e!414503))))

(declare-fun arrayContainsKey!0 (array!41477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741560 (= res!498845 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741561 () Bool)

(declare-fun res!498843 () Bool)

(assert (=> b!741561 (=> (not res!498843) (not e!414503))))

(assert (=> b!741561 (= res!498843 (and (= (size!20273 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20273 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20273 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65304 res!498840) b!741561))

(assert (= (and b!741561 res!498843) b!741553))

(assert (= (and b!741553 res!498841) b!741554))

(assert (= (and b!741554 res!498842) b!741560))

(assert (= (and b!741560 res!498845) b!741558))

(assert (= (and b!741558 res!498854) b!741559))

(assert (= (and b!741559 res!498848) b!741555))

(assert (= (and b!741555 res!498853) b!741549))

(assert (= (and b!741549 res!498850) b!741551))

(assert (= (and b!741551 res!498847) b!741546))

(assert (= (and b!741546 res!498846) b!741545))

(assert (= (and b!741545 c!81733) b!741547))

(assert (= (and b!741545 (not c!81733)) b!741552))

(assert (= (and b!741545 res!498851) b!741556))

(assert (= (and b!741556 res!498849) b!741548))

(assert (= (and b!741548 res!498852) b!741550))

(assert (= (and b!741550 res!498844) b!741557))

(declare-fun m!692507 () Bool)

(assert (=> start!65304 m!692507))

(declare-fun m!692509 () Bool)

(assert (=> start!65304 m!692509))

(declare-fun m!692511 () Bool)

(assert (=> b!741560 m!692511))

(declare-fun m!692513 () Bool)

(assert (=> b!741556 m!692513))

(declare-fun m!692515 () Bool)

(assert (=> b!741556 m!692515))

(declare-fun m!692517 () Bool)

(assert (=> b!741556 m!692517))

(assert (=> b!741556 m!692513))

(declare-fun m!692519 () Bool)

(assert (=> b!741556 m!692519))

(declare-fun m!692521 () Bool)

(assert (=> b!741556 m!692521))

(declare-fun m!692523 () Bool)

(assert (=> b!741550 m!692523))

(assert (=> b!741550 m!692523))

(declare-fun m!692525 () Bool)

(assert (=> b!741550 m!692525))

(declare-fun m!692527 () Bool)

(assert (=> b!741554 m!692527))

(declare-fun m!692529 () Bool)

(assert (=> b!741546 m!692529))

(assert (=> b!741551 m!692523))

(assert (=> b!741551 m!692523))

(declare-fun m!692531 () Bool)

(assert (=> b!741551 m!692531))

(assert (=> b!741551 m!692531))

(assert (=> b!741551 m!692523))

(declare-fun m!692533 () Bool)

(assert (=> b!741551 m!692533))

(assert (=> b!741547 m!692523))

(assert (=> b!741547 m!692523))

(declare-fun m!692535 () Bool)

(assert (=> b!741547 m!692535))

(assert (=> b!741552 m!692523))

(assert (=> b!741552 m!692523))

(declare-fun m!692537 () Bool)

(assert (=> b!741552 m!692537))

(declare-fun m!692539 () Bool)

(assert (=> b!741548 m!692539))

(declare-fun m!692541 () Bool)

(assert (=> b!741548 m!692541))

(assert (=> b!741553 m!692523))

(assert (=> b!741553 m!692523))

(declare-fun m!692543 () Bool)

(assert (=> b!741553 m!692543))

(declare-fun m!692545 () Bool)

(assert (=> b!741559 m!692545))

(declare-fun m!692547 () Bool)

(assert (=> b!741555 m!692547))

(declare-fun m!692549 () Bool)

(assert (=> b!741558 m!692549))

(assert (=> b!741557 m!692523))

(assert (=> b!741557 m!692523))

(declare-fun m!692551 () Bool)

(assert (=> b!741557 m!692551))

(check-sat (not b!741560) (not b!741547) (not b!741559) (not b!741550) (not b!741551) (not b!741557) (not b!741558) (not b!741555) (not b!741548) (not start!65304) (not b!741552) (not b!741554) (not b!741556) (not b!741553))
(check-sat)
