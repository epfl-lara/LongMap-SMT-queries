; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66360 () Bool)

(assert start!66360)

(declare-fun b!764695 () Bool)

(declare-fun e!425883 () Bool)

(assert (=> b!764695 (= e!425883 (not true))))

(declare-fun e!425884 () Bool)

(assert (=> b!764695 e!425884))

(declare-fun res!517389 () Bool)

(assert (=> b!764695 (=> (not res!517389) (not e!425884))))

(declare-datatypes ((array!42219 0))(
  ( (array!42220 (arr!20216 (Array (_ BitVec 32) (_ BitVec 64))) (size!20637 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42219)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42219 (_ BitVec 32)) Bool)

(assert (=> b!764695 (= res!517389 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26324 0))(
  ( (Unit!26325) )
))
(declare-fun lt!340114 () Unit!26324)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42219 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26324)

(assert (=> b!764695 (= lt!340114 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!764696 () Bool)

(declare-fun res!517381 () Bool)

(declare-fun e!425880 () Bool)

(assert (=> b!764696 (=> (not res!517381) (not e!425880))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764696 (= res!517381 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20216 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!425881 () Bool)

(declare-fun b!764697 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7813 0))(
  ( (MissingZero!7813 (index!33620 (_ BitVec 32))) (Found!7813 (index!33621 (_ BitVec 32))) (Intermediate!7813 (undefined!8625 Bool) (index!33622 (_ BitVec 32)) (x!64533 (_ BitVec 32))) (Undefined!7813) (MissingVacant!7813 (index!33623 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42219 (_ BitVec 32)) SeekEntryResult!7813)

(assert (=> b!764697 (= e!425881 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20216 a!3186) j!159) a!3186 mask!3328) (Found!7813 j!159)))))

(declare-fun b!764698 () Bool)

(declare-fun res!517388 () Bool)

(declare-fun e!425879 () Bool)

(assert (=> b!764698 (=> (not res!517388) (not e!425879))))

(declare-datatypes ((List!14257 0))(
  ( (Nil!14254) (Cons!14253 (h!15340 (_ BitVec 64)) (t!20563 List!14257)) )
))
(declare-fun arrayNoDuplicates!0 (array!42219 (_ BitVec 32) List!14257) Bool)

(assert (=> b!764698 (= res!517388 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14254))))

(declare-fun b!764699 () Bool)

(declare-fun e!425885 () Bool)

(assert (=> b!764699 (= e!425885 e!425879)))

(declare-fun res!517392 () Bool)

(assert (=> b!764699 (=> (not res!517392) (not e!425879))))

(declare-fun lt!340112 () SeekEntryResult!7813)

(assert (=> b!764699 (= res!517392 (or (= lt!340112 (MissingZero!7813 i!1173)) (= lt!340112 (MissingVacant!7813 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42219 (_ BitVec 32)) SeekEntryResult!7813)

(assert (=> b!764699 (= lt!340112 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!764701 () Bool)

(assert (=> b!764701 (= e!425884 (= (seekEntryOrOpen!0 (select (arr!20216 a!3186) j!159) a!3186 mask!3328) (Found!7813 j!159)))))

(declare-fun b!764702 () Bool)

(declare-fun res!517387 () Bool)

(assert (=> b!764702 (=> (not res!517387) (not e!425885))))

(assert (=> b!764702 (= res!517387 (and (= (size!20637 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20637 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20637 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764703 () Bool)

(declare-fun res!517386 () Bool)

(assert (=> b!764703 (=> (not res!517386) (not e!425885))))

(declare-fun arrayContainsKey!0 (array!42219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764703 (= res!517386 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764704 () Bool)

(declare-fun res!517391 () Bool)

(assert (=> b!764704 (=> (not res!517391) (not e!425879))))

(assert (=> b!764704 (= res!517391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764705 () Bool)

(assert (=> b!764705 (= e!425879 e!425880)))

(declare-fun res!517394 () Bool)

(assert (=> b!764705 (=> (not res!517394) (not e!425880))))

(declare-fun lt!340113 () SeekEntryResult!7813)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42219 (_ BitVec 32)) SeekEntryResult!7813)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764705 (= res!517394 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20216 a!3186) j!159) mask!3328) (select (arr!20216 a!3186) j!159) a!3186 mask!3328) lt!340113))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764705 (= lt!340113 (Intermediate!7813 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764706 () Bool)

(declare-fun res!517384 () Bool)

(assert (=> b!764706 (=> (not res!517384) (not e!425879))))

(assert (=> b!764706 (= res!517384 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20637 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20637 a!3186))))))

(declare-fun b!764707 () Bool)

(declare-fun res!517382 () Bool)

(assert (=> b!764707 (=> (not res!517382) (not e!425885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764707 (= res!517382 (validKeyInArray!0 k0!2102))))

(declare-fun b!764708 () Bool)

(declare-fun res!517390 () Bool)

(assert (=> b!764708 (=> (not res!517390) (not e!425885))))

(assert (=> b!764708 (= res!517390 (validKeyInArray!0 (select (arr!20216 a!3186) j!159)))))

(declare-fun b!764709 () Bool)

(assert (=> b!764709 (= e!425880 e!425883)))

(declare-fun res!517393 () Bool)

(assert (=> b!764709 (=> (not res!517393) (not e!425883))))

(declare-fun lt!340111 () (_ BitVec 64))

(declare-fun lt!340115 () array!42219)

(assert (=> b!764709 (= res!517393 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340111 mask!3328) lt!340111 lt!340115 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340111 lt!340115 mask!3328)))))

(assert (=> b!764709 (= lt!340111 (select (store (arr!20216 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764709 (= lt!340115 (array!42220 (store (arr!20216 a!3186) i!1173 k0!2102) (size!20637 a!3186)))))

(declare-fun b!764710 () Bool)

(declare-fun res!517383 () Bool)

(assert (=> b!764710 (=> (not res!517383) (not e!425880))))

(assert (=> b!764710 (= res!517383 e!425881)))

(declare-fun c!84045 () Bool)

(assert (=> b!764710 (= c!84045 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764700 () Bool)

(assert (=> b!764700 (= e!425881 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20216 a!3186) j!159) a!3186 mask!3328) lt!340113))))

(declare-fun res!517385 () Bool)

(assert (=> start!66360 (=> (not res!517385) (not e!425885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66360 (= res!517385 (validMask!0 mask!3328))))

(assert (=> start!66360 e!425885))

(assert (=> start!66360 true))

(declare-fun array_inv!16099 (array!42219) Bool)

(assert (=> start!66360 (array_inv!16099 a!3186)))

(assert (= (and start!66360 res!517385) b!764702))

(assert (= (and b!764702 res!517387) b!764708))

(assert (= (and b!764708 res!517390) b!764707))

(assert (= (and b!764707 res!517382) b!764703))

(assert (= (and b!764703 res!517386) b!764699))

(assert (= (and b!764699 res!517392) b!764704))

(assert (= (and b!764704 res!517391) b!764698))

(assert (= (and b!764698 res!517388) b!764706))

(assert (= (and b!764706 res!517384) b!764705))

(assert (= (and b!764705 res!517394) b!764696))

(assert (= (and b!764696 res!517381) b!764710))

(assert (= (and b!764710 c!84045) b!764700))

(assert (= (and b!764710 (not c!84045)) b!764697))

(assert (= (and b!764710 res!517383) b!764709))

(assert (= (and b!764709 res!517393) b!764695))

(assert (= (and b!764695 res!517389) b!764701))

(declare-fun m!710413 () Bool)

(assert (=> b!764699 m!710413))

(declare-fun m!710415 () Bool)

(assert (=> b!764707 m!710415))

(declare-fun m!710417 () Bool)

(assert (=> b!764700 m!710417))

(assert (=> b!764700 m!710417))

(declare-fun m!710419 () Bool)

(assert (=> b!764700 m!710419))

(declare-fun m!710421 () Bool)

(assert (=> b!764703 m!710421))

(assert (=> b!764697 m!710417))

(assert (=> b!764697 m!710417))

(declare-fun m!710423 () Bool)

(assert (=> b!764697 m!710423))

(declare-fun m!710425 () Bool)

(assert (=> b!764709 m!710425))

(declare-fun m!710427 () Bool)

(assert (=> b!764709 m!710427))

(declare-fun m!710429 () Bool)

(assert (=> b!764709 m!710429))

(assert (=> b!764709 m!710427))

(declare-fun m!710431 () Bool)

(assert (=> b!764709 m!710431))

(declare-fun m!710433 () Bool)

(assert (=> b!764709 m!710433))

(declare-fun m!710435 () Bool)

(assert (=> b!764696 m!710435))

(assert (=> b!764708 m!710417))

(assert (=> b!764708 m!710417))

(declare-fun m!710437 () Bool)

(assert (=> b!764708 m!710437))

(declare-fun m!710439 () Bool)

(assert (=> b!764695 m!710439))

(declare-fun m!710441 () Bool)

(assert (=> b!764695 m!710441))

(declare-fun m!710443 () Bool)

(assert (=> b!764698 m!710443))

(assert (=> b!764701 m!710417))

(assert (=> b!764701 m!710417))

(declare-fun m!710445 () Bool)

(assert (=> b!764701 m!710445))

(declare-fun m!710447 () Bool)

(assert (=> start!66360 m!710447))

(declare-fun m!710449 () Bool)

(assert (=> start!66360 m!710449))

(declare-fun m!710451 () Bool)

(assert (=> b!764704 m!710451))

(assert (=> b!764705 m!710417))

(assert (=> b!764705 m!710417))

(declare-fun m!710453 () Bool)

(assert (=> b!764705 m!710453))

(assert (=> b!764705 m!710453))

(assert (=> b!764705 m!710417))

(declare-fun m!710455 () Bool)

(assert (=> b!764705 m!710455))

(check-sat (not b!764698) (not b!764708) (not b!764700) (not b!764701) (not start!66360) (not b!764709) (not b!764697) (not b!764705) (not b!764704) (not b!764699) (not b!764707) (not b!764695) (not b!764703))
(check-sat)
