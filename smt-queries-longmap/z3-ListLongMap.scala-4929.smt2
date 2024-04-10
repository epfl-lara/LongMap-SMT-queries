; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67886 () Bool)

(assert start!67886)

(declare-fun b!789455 () Bool)

(declare-fun e!438791 () Bool)

(declare-fun e!438793 () Bool)

(assert (=> b!789455 (= e!438791 e!438793)))

(declare-fun res!534732 () Bool)

(assert (=> b!789455 (=> (not res!534732) (not e!438793))))

(declare-datatypes ((SeekEntryResult!8118 0))(
  ( (MissingZero!8118 (index!34840 (_ BitVec 32))) (Found!8118 (index!34841 (_ BitVec 32))) (Intermediate!8118 (undefined!8930 Bool) (index!34842 (_ BitVec 32)) (x!65779 (_ BitVec 32))) (Undefined!8118) (MissingVacant!8118 (index!34843 (_ BitVec 32))) )
))
(declare-fun lt!352256 () SeekEntryResult!8118)

(declare-fun lt!352250 () SeekEntryResult!8118)

(assert (=> b!789455 (= res!534732 (= lt!352256 lt!352250))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!352254 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42863 0))(
  ( (array!42864 (arr!20518 (Array (_ BitVec 32) (_ BitVec 64))) (size!20939 (_ BitVec 32))) )
))
(declare-fun lt!352249 () array!42863)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42863 (_ BitVec 32)) SeekEntryResult!8118)

(assert (=> b!789455 (= lt!352250 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352254 lt!352249 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789455 (= lt!352256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352254 mask!3328) lt!352254 lt!352249 mask!3328))))

(declare-fun a!3186 () array!42863)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!789455 (= lt!352254 (select (store (arr!20518 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!789455 (= lt!352249 (array!42864 (store (arr!20518 a!3186) i!1173 k0!2102) (size!20939 a!3186)))))

(declare-fun b!789456 () Bool)

(declare-fun e!438786 () Bool)

(declare-fun lt!352251 () SeekEntryResult!8118)

(declare-fun lt!352248 () SeekEntryResult!8118)

(assert (=> b!789456 (= e!438786 (= lt!352251 lt!352248))))

(declare-fun b!789457 () Bool)

(declare-fun e!438783 () Bool)

(declare-fun e!438784 () Bool)

(assert (=> b!789457 (= e!438783 e!438784)))

(declare-fun res!534745 () Bool)

(assert (=> b!789457 (=> res!534745 e!438784)))

(declare-fun lt!352247 () SeekEntryResult!8118)

(assert (=> b!789457 (= res!534745 (not (= lt!352248 lt!352247)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42863 (_ BitVec 32)) SeekEntryResult!8118)

(assert (=> b!789457 (= lt!352248 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20518 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789458 () Bool)

(declare-fun res!534737 () Bool)

(assert (=> b!789458 (=> (not res!534737) (not e!438786))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42863 (_ BitVec 32)) SeekEntryResult!8118)

(assert (=> b!789458 (= res!534737 (= (seekEntryOrOpen!0 lt!352254 lt!352249 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352254 lt!352249 mask!3328)))))

(declare-fun b!789459 () Bool)

(declare-fun e!438792 () Bool)

(declare-fun lt!352253 () SeekEntryResult!8118)

(assert (=> b!789459 (= e!438792 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20518 a!3186) j!159) a!3186 mask!3328) lt!352253))))

(declare-fun b!789460 () Bool)

(declare-fun res!534736 () Bool)

(assert (=> b!789460 (=> (not res!534736) (not e!438791))))

(assert (=> b!789460 (= res!534736 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20518 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789461 () Bool)

(declare-fun res!534731 () Bool)

(declare-fun e!438790 () Bool)

(assert (=> b!789461 (=> (not res!534731) (not e!438790))))

(declare-fun arrayContainsKey!0 (array!42863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789461 (= res!534731 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789462 () Bool)

(declare-fun res!534738 () Bool)

(assert (=> b!789462 (=> (not res!534738) (not e!438790))))

(assert (=> b!789462 (= res!534738 (and (= (size!20939 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20939 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20939 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789463 () Bool)

(declare-datatypes ((Unit!27360 0))(
  ( (Unit!27361) )
))
(declare-fun e!438785 () Unit!27360)

(declare-fun Unit!27362 () Unit!27360)

(assert (=> b!789463 (= e!438785 Unit!27362)))

(assert (=> b!789463 false))

(declare-fun res!534749 () Bool)

(assert (=> start!67886 (=> (not res!534749) (not e!438790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67886 (= res!534749 (validMask!0 mask!3328))))

(assert (=> start!67886 e!438790))

(assert (=> start!67886 true))

(declare-fun array_inv!16314 (array!42863) Bool)

(assert (=> start!67886 (array_inv!16314 a!3186)))

(declare-fun b!789464 () Bool)

(assert (=> b!789464 (= e!438793 (not e!438783))))

(declare-fun res!534742 () Bool)

(assert (=> b!789464 (=> res!534742 e!438783)))

(get-info :version)

(assert (=> b!789464 (= res!534742 (or (not ((_ is Intermediate!8118) lt!352250)) (bvslt x!1131 (x!65779 lt!352250)) (not (= x!1131 (x!65779 lt!352250))) (not (= index!1321 (index!34842 lt!352250)))))))

(declare-fun e!438787 () Bool)

(assert (=> b!789464 e!438787))

(declare-fun res!534743 () Bool)

(assert (=> b!789464 (=> (not res!534743) (not e!438787))))

(assert (=> b!789464 (= res!534743 (= lt!352251 lt!352247))))

(assert (=> b!789464 (= lt!352247 (Found!8118 j!159))))

(assert (=> b!789464 (= lt!352251 (seekEntryOrOpen!0 (select (arr!20518 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42863 (_ BitVec 32)) Bool)

(assert (=> b!789464 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352245 () Unit!27360)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27360)

(assert (=> b!789464 (= lt!352245 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789465 () Bool)

(declare-fun res!534744 () Bool)

(declare-fun e!438789 () Bool)

(assert (=> b!789465 (=> (not res!534744) (not e!438789))))

(assert (=> b!789465 (= res!534744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789466 () Bool)

(assert (=> b!789466 (= e!438792 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20518 a!3186) j!159) a!3186 mask!3328) (Found!8118 j!159)))))

(declare-fun b!789467 () Bool)

(assert (=> b!789467 (= e!438789 e!438791)))

(declare-fun res!534748 () Bool)

(assert (=> b!789467 (=> (not res!534748) (not e!438791))))

(assert (=> b!789467 (= res!534748 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20518 a!3186) j!159) mask!3328) (select (arr!20518 a!3186) j!159) a!3186 mask!3328) lt!352253))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789467 (= lt!352253 (Intermediate!8118 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789468 () Bool)

(declare-fun e!438788 () Bool)

(assert (=> b!789468 (= e!438784 e!438788)))

(declare-fun res!534747 () Bool)

(assert (=> b!789468 (=> res!534747 e!438788)))

(declare-fun lt!352252 () (_ BitVec 64))

(assert (=> b!789468 (= res!534747 (= lt!352252 lt!352254))))

(assert (=> b!789468 (= lt!352252 (select (store (arr!20518 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!789469 () Bool)

(declare-fun res!534739 () Bool)

(assert (=> b!789469 (=> (not res!534739) (not e!438791))))

(assert (=> b!789469 (= res!534739 e!438792)))

(declare-fun c!87772 () Bool)

(assert (=> b!789469 (= c!87772 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789470 () Bool)

(assert (=> b!789470 (= e!438790 e!438789)))

(declare-fun res!534746 () Bool)

(assert (=> b!789470 (=> (not res!534746) (not e!438789))))

(declare-fun lt!352246 () SeekEntryResult!8118)

(assert (=> b!789470 (= res!534746 (or (= lt!352246 (MissingZero!8118 i!1173)) (= lt!352246 (MissingVacant!8118 i!1173))))))

(assert (=> b!789470 (= lt!352246 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!789471 () Bool)

(assert (=> b!789471 (= e!438788 true)))

(assert (=> b!789471 e!438786))

(declare-fun res!534734 () Bool)

(assert (=> b!789471 (=> (not res!534734) (not e!438786))))

(assert (=> b!789471 (= res!534734 (= lt!352252 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!352255 () Unit!27360)

(assert (=> b!789471 (= lt!352255 e!438785)))

(declare-fun c!87771 () Bool)

(assert (=> b!789471 (= c!87771 (= lt!352252 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789472 () Bool)

(declare-fun res!534735 () Bool)

(assert (=> b!789472 (=> (not res!534735) (not e!438789))))

(declare-datatypes ((List!14520 0))(
  ( (Nil!14517) (Cons!14516 (h!15642 (_ BitVec 64)) (t!20835 List!14520)) )
))
(declare-fun arrayNoDuplicates!0 (array!42863 (_ BitVec 32) List!14520) Bool)

(assert (=> b!789472 (= res!534735 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14517))))

(declare-fun b!789473 () Bool)

(declare-fun Unit!27363 () Unit!27360)

(assert (=> b!789473 (= e!438785 Unit!27363)))

(declare-fun b!789474 () Bool)

(declare-fun res!534741 () Bool)

(assert (=> b!789474 (=> (not res!534741) (not e!438790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789474 (= res!534741 (validKeyInArray!0 (select (arr!20518 a!3186) j!159)))))

(declare-fun b!789475 () Bool)

(declare-fun res!534733 () Bool)

(assert (=> b!789475 (=> (not res!534733) (not e!438789))))

(assert (=> b!789475 (= res!534733 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20939 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20939 a!3186))))))

(declare-fun b!789476 () Bool)

(assert (=> b!789476 (= e!438787 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20518 a!3186) j!159) a!3186 mask!3328) lt!352247))))

(declare-fun b!789477 () Bool)

(declare-fun res!534740 () Bool)

(assert (=> b!789477 (=> (not res!534740) (not e!438790))))

(assert (=> b!789477 (= res!534740 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67886 res!534749) b!789462))

(assert (= (and b!789462 res!534738) b!789474))

(assert (= (and b!789474 res!534741) b!789477))

(assert (= (and b!789477 res!534740) b!789461))

(assert (= (and b!789461 res!534731) b!789470))

(assert (= (and b!789470 res!534746) b!789465))

(assert (= (and b!789465 res!534744) b!789472))

(assert (= (and b!789472 res!534735) b!789475))

(assert (= (and b!789475 res!534733) b!789467))

(assert (= (and b!789467 res!534748) b!789460))

(assert (= (and b!789460 res!534736) b!789469))

(assert (= (and b!789469 c!87772) b!789459))

(assert (= (and b!789469 (not c!87772)) b!789466))

(assert (= (and b!789469 res!534739) b!789455))

(assert (= (and b!789455 res!534732) b!789464))

(assert (= (and b!789464 res!534743) b!789476))

(assert (= (and b!789464 (not res!534742)) b!789457))

(assert (= (and b!789457 (not res!534745)) b!789468))

(assert (= (and b!789468 (not res!534747)) b!789471))

(assert (= (and b!789471 c!87771) b!789463))

(assert (= (and b!789471 (not c!87771)) b!789473))

(assert (= (and b!789471 res!534734) b!789458))

(assert (= (and b!789458 res!534737) b!789456))

(declare-fun m!730533 () Bool)

(assert (=> b!789461 m!730533))

(declare-fun m!730535 () Bool)

(assert (=> b!789457 m!730535))

(assert (=> b!789457 m!730535))

(declare-fun m!730537 () Bool)

(assert (=> b!789457 m!730537))

(declare-fun m!730539 () Bool)

(assert (=> b!789460 m!730539))

(declare-fun m!730541 () Bool)

(assert (=> b!789455 m!730541))

(declare-fun m!730543 () Bool)

(assert (=> b!789455 m!730543))

(declare-fun m!730545 () Bool)

(assert (=> b!789455 m!730545))

(declare-fun m!730547 () Bool)

(assert (=> b!789455 m!730547))

(assert (=> b!789455 m!730547))

(declare-fun m!730549 () Bool)

(assert (=> b!789455 m!730549))

(assert (=> b!789459 m!730535))

(assert (=> b!789459 m!730535))

(declare-fun m!730551 () Bool)

(assert (=> b!789459 m!730551))

(declare-fun m!730553 () Bool)

(assert (=> b!789470 m!730553))

(assert (=> b!789466 m!730535))

(assert (=> b!789466 m!730535))

(assert (=> b!789466 m!730537))

(assert (=> b!789474 m!730535))

(assert (=> b!789474 m!730535))

(declare-fun m!730555 () Bool)

(assert (=> b!789474 m!730555))

(declare-fun m!730557 () Bool)

(assert (=> start!67886 m!730557))

(declare-fun m!730559 () Bool)

(assert (=> start!67886 m!730559))

(assert (=> b!789476 m!730535))

(assert (=> b!789476 m!730535))

(declare-fun m!730561 () Bool)

(assert (=> b!789476 m!730561))

(assert (=> b!789467 m!730535))

(assert (=> b!789467 m!730535))

(declare-fun m!730563 () Bool)

(assert (=> b!789467 m!730563))

(assert (=> b!789467 m!730563))

(assert (=> b!789467 m!730535))

(declare-fun m!730565 () Bool)

(assert (=> b!789467 m!730565))

(declare-fun m!730567 () Bool)

(assert (=> b!789472 m!730567))

(declare-fun m!730569 () Bool)

(assert (=> b!789458 m!730569))

(declare-fun m!730571 () Bool)

(assert (=> b!789458 m!730571))

(declare-fun m!730573 () Bool)

(assert (=> b!789477 m!730573))

(assert (=> b!789464 m!730535))

(assert (=> b!789464 m!730535))

(declare-fun m!730575 () Bool)

(assert (=> b!789464 m!730575))

(declare-fun m!730577 () Bool)

(assert (=> b!789464 m!730577))

(declare-fun m!730579 () Bool)

(assert (=> b!789464 m!730579))

(assert (=> b!789468 m!730541))

(declare-fun m!730581 () Bool)

(assert (=> b!789468 m!730581))

(declare-fun m!730583 () Bool)

(assert (=> b!789465 m!730583))

(check-sat (not b!789458) (not b!789470) (not b!789459) (not b!789465) (not b!789455) (not b!789474) (not b!789466) (not b!789477) (not b!789461) (not b!789476) (not start!67886) (not b!789467) (not b!789472) (not b!789457) (not b!789464))
(check-sat)
