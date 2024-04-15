; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67322 () Bool)

(assert start!67322)

(declare-fun b!778440 () Bool)

(declare-fun res!526630 () Bool)

(declare-fun e!433081 () Bool)

(assert (=> b!778440 (=> (not res!526630) (not e!433081))))

(declare-fun e!433084 () Bool)

(assert (=> b!778440 (= res!526630 e!433084)))

(declare-fun c!86313 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!778440 (= c!86313 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778441 () Bool)

(declare-fun e!433086 () Bool)

(assert (=> b!778441 (= e!433086 e!433081)))

(declare-fun res!526622 () Bool)

(assert (=> b!778441 (=> (not res!526622) (not e!433081))))

(declare-datatypes ((array!42570 0))(
  ( (array!42571 (arr!20378 (Array (_ BitVec 32) (_ BitVec 64))) (size!20799 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42570)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7975 0))(
  ( (MissingZero!7975 (index!34268 (_ BitVec 32))) (Found!7975 (index!34269 (_ BitVec 32))) (Intermediate!7975 (undefined!8787 Bool) (index!34270 (_ BitVec 32)) (x!65227 (_ BitVec 32))) (Undefined!7975) (MissingVacant!7975 (index!34271 (_ BitVec 32))) )
))
(declare-fun lt!346674 () SeekEntryResult!7975)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42570 (_ BitVec 32)) SeekEntryResult!7975)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778441 (= res!526622 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20378 a!3186) j!159) mask!3328) (select (arr!20378 a!3186) j!159) a!3186 mask!3328) lt!346674))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!778441 (= lt!346674 (Intermediate!7975 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778442 () Bool)

(declare-fun e!433085 () Bool)

(assert (=> b!778442 (= e!433085 e!433086)))

(declare-fun res!526632 () Bool)

(assert (=> b!778442 (=> (not res!526632) (not e!433086))))

(declare-fun lt!346678 () SeekEntryResult!7975)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!778442 (= res!526632 (or (= lt!346678 (MissingZero!7975 i!1173)) (= lt!346678 (MissingVacant!7975 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42570 (_ BitVec 32)) SeekEntryResult!7975)

(assert (=> b!778442 (= lt!346678 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!778443 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!778443 (= e!433084 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20378 a!3186) j!159) a!3186 mask!3328) lt!346674))))

(declare-fun b!778444 () Bool)

(declare-fun e!433080 () Bool)

(declare-fun e!433079 () Bool)

(assert (=> b!778444 (= e!433080 (not e!433079))))

(declare-fun res!526633 () Bool)

(assert (=> b!778444 (=> res!526633 e!433079)))

(declare-fun lt!346679 () SeekEntryResult!7975)

(get-info :version)

(assert (=> b!778444 (= res!526633 (or (not ((_ is Intermediate!7975) lt!346679)) (bvslt x!1131 (x!65227 lt!346679)) (not (= x!1131 (x!65227 lt!346679))) (not (= index!1321 (index!34270 lt!346679)))))))

(declare-fun e!433087 () Bool)

(assert (=> b!778444 e!433087))

(declare-fun res!526634 () Bool)

(assert (=> b!778444 (=> (not res!526634) (not e!433087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42570 (_ BitVec 32)) Bool)

(assert (=> b!778444 (= res!526634 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26816 0))(
  ( (Unit!26817) )
))
(declare-fun lt!346682 () Unit!26816)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26816)

(assert (=> b!778444 (= lt!346682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!778445 () Bool)

(assert (=> b!778445 (= e!433081 e!433080)))

(declare-fun res!526635 () Bool)

(assert (=> b!778445 (=> (not res!526635) (not e!433080))))

(declare-fun lt!346680 () SeekEntryResult!7975)

(assert (=> b!778445 (= res!526635 (= lt!346680 lt!346679))))

(declare-fun lt!346681 () (_ BitVec 64))

(declare-fun lt!346675 () array!42570)

(assert (=> b!778445 (= lt!346679 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346681 lt!346675 mask!3328))))

(assert (=> b!778445 (= lt!346680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346681 mask!3328) lt!346681 lt!346675 mask!3328))))

(assert (=> b!778445 (= lt!346681 (select (store (arr!20378 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!778445 (= lt!346675 (array!42571 (store (arr!20378 a!3186) i!1173 k0!2102) (size!20799 a!3186)))))

(declare-fun b!778446 () Bool)

(declare-fun res!526627 () Bool)

(assert (=> b!778446 (=> (not res!526627) (not e!433086))))

(declare-datatypes ((List!14419 0))(
  ( (Nil!14416) (Cons!14415 (h!15529 (_ BitVec 64)) (t!20725 List!14419)) )
))
(declare-fun arrayNoDuplicates!0 (array!42570 (_ BitVec 32) List!14419) Bool)

(assert (=> b!778446 (= res!526627 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14416))))

(declare-fun b!778447 () Bool)

(assert (=> b!778447 (= e!433079 true)))

(declare-fun lt!346676 () SeekEntryResult!7975)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42570 (_ BitVec 32)) SeekEntryResult!7975)

(assert (=> b!778447 (= lt!346676 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20378 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778449 () Bool)

(declare-fun res!526623 () Bool)

(assert (=> b!778449 (=> (not res!526623) (not e!433085))))

(assert (=> b!778449 (= res!526623 (and (= (size!20799 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20799 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20799 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778450 () Bool)

(declare-fun res!526631 () Bool)

(assert (=> b!778450 (=> (not res!526631) (not e!433086))))

(assert (=> b!778450 (= res!526631 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20799 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20799 a!3186))))))

(declare-fun b!778451 () Bool)

(declare-fun res!526625 () Bool)

(assert (=> b!778451 (=> (not res!526625) (not e!433085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778451 (= res!526625 (validKeyInArray!0 (select (arr!20378 a!3186) j!159)))))

(declare-fun b!778452 () Bool)

(assert (=> b!778452 (= e!433084 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20378 a!3186) j!159) a!3186 mask!3328) (Found!7975 j!159)))))

(declare-fun b!778453 () Bool)

(declare-fun res!526621 () Bool)

(assert (=> b!778453 (=> (not res!526621) (not e!433085))))

(assert (=> b!778453 (= res!526621 (validKeyInArray!0 k0!2102))))

(declare-fun lt!346677 () SeekEntryResult!7975)

(declare-fun e!433082 () Bool)

(declare-fun b!778454 () Bool)

(assert (=> b!778454 (= e!433082 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20378 a!3186) j!159) a!3186 mask!3328) lt!346677))))

(declare-fun b!778455 () Bool)

(declare-fun res!526629 () Bool)

(assert (=> b!778455 (=> (not res!526629) (not e!433086))))

(assert (=> b!778455 (= res!526629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778456 () Bool)

(declare-fun res!526626 () Bool)

(assert (=> b!778456 (=> (not res!526626) (not e!433081))))

(assert (=> b!778456 (= res!526626 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20378 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778457 () Bool)

(assert (=> b!778457 (= e!433087 e!433082)))

(declare-fun res!526624 () Bool)

(assert (=> b!778457 (=> (not res!526624) (not e!433082))))

(assert (=> b!778457 (= res!526624 (= (seekEntryOrOpen!0 (select (arr!20378 a!3186) j!159) a!3186 mask!3328) lt!346677))))

(assert (=> b!778457 (= lt!346677 (Found!7975 j!159))))

(declare-fun b!778448 () Bool)

(declare-fun res!526628 () Bool)

(assert (=> b!778448 (=> (not res!526628) (not e!433085))))

(declare-fun arrayContainsKey!0 (array!42570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778448 (= res!526628 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!526620 () Bool)

(assert (=> start!67322 (=> (not res!526620) (not e!433085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67322 (= res!526620 (validMask!0 mask!3328))))

(assert (=> start!67322 e!433085))

(assert (=> start!67322 true))

(declare-fun array_inv!16261 (array!42570) Bool)

(assert (=> start!67322 (array_inv!16261 a!3186)))

(assert (= (and start!67322 res!526620) b!778449))

(assert (= (and b!778449 res!526623) b!778451))

(assert (= (and b!778451 res!526625) b!778453))

(assert (= (and b!778453 res!526621) b!778448))

(assert (= (and b!778448 res!526628) b!778442))

(assert (= (and b!778442 res!526632) b!778455))

(assert (= (and b!778455 res!526629) b!778446))

(assert (= (and b!778446 res!526627) b!778450))

(assert (= (and b!778450 res!526631) b!778441))

(assert (= (and b!778441 res!526622) b!778456))

(assert (= (and b!778456 res!526626) b!778440))

(assert (= (and b!778440 c!86313) b!778443))

(assert (= (and b!778440 (not c!86313)) b!778452))

(assert (= (and b!778440 res!526630) b!778445))

(assert (= (and b!778445 res!526635) b!778444))

(assert (= (and b!778444 res!526634) b!778457))

(assert (= (and b!778457 res!526624) b!778454))

(assert (= (and b!778444 (not res!526633)) b!778447))

(declare-fun m!721545 () Bool)

(assert (=> b!778441 m!721545))

(assert (=> b!778441 m!721545))

(declare-fun m!721547 () Bool)

(assert (=> b!778441 m!721547))

(assert (=> b!778441 m!721547))

(assert (=> b!778441 m!721545))

(declare-fun m!721549 () Bool)

(assert (=> b!778441 m!721549))

(assert (=> b!778451 m!721545))

(assert (=> b!778451 m!721545))

(declare-fun m!721551 () Bool)

(assert (=> b!778451 m!721551))

(declare-fun m!721553 () Bool)

(assert (=> b!778444 m!721553))

(declare-fun m!721555 () Bool)

(assert (=> b!778444 m!721555))

(assert (=> b!778443 m!721545))

(assert (=> b!778443 m!721545))

(declare-fun m!721557 () Bool)

(assert (=> b!778443 m!721557))

(assert (=> b!778452 m!721545))

(assert (=> b!778452 m!721545))

(declare-fun m!721559 () Bool)

(assert (=> b!778452 m!721559))

(assert (=> b!778454 m!721545))

(assert (=> b!778454 m!721545))

(declare-fun m!721561 () Bool)

(assert (=> b!778454 m!721561))

(assert (=> b!778447 m!721545))

(assert (=> b!778447 m!721545))

(assert (=> b!778447 m!721559))

(declare-fun m!721563 () Bool)

(assert (=> b!778442 m!721563))

(declare-fun m!721565 () Bool)

(assert (=> start!67322 m!721565))

(declare-fun m!721567 () Bool)

(assert (=> start!67322 m!721567))

(declare-fun m!721569 () Bool)

(assert (=> b!778453 m!721569))

(declare-fun m!721571 () Bool)

(assert (=> b!778455 m!721571))

(declare-fun m!721573 () Bool)

(assert (=> b!778456 m!721573))

(declare-fun m!721575 () Bool)

(assert (=> b!778445 m!721575))

(declare-fun m!721577 () Bool)

(assert (=> b!778445 m!721577))

(declare-fun m!721579 () Bool)

(assert (=> b!778445 m!721579))

(assert (=> b!778445 m!721577))

(declare-fun m!721581 () Bool)

(assert (=> b!778445 m!721581))

(declare-fun m!721583 () Bool)

(assert (=> b!778445 m!721583))

(declare-fun m!721585 () Bool)

(assert (=> b!778446 m!721585))

(declare-fun m!721587 () Bool)

(assert (=> b!778448 m!721587))

(assert (=> b!778457 m!721545))

(assert (=> b!778457 m!721545))

(declare-fun m!721589 () Bool)

(assert (=> b!778457 m!721589))

(check-sat (not b!778457) (not b!778445) (not b!778453) (not b!778443) (not b!778455) (not b!778442) (not b!778447) (not start!67322) (not b!778451) (not b!778444) (not b!778452) (not b!778446) (not b!778454) (not b!778441) (not b!778448))
(check-sat)
