; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65090 () Bool)

(assert start!65090)

(declare-fun e!411001 () Bool)

(declare-fun b!734570 () Bool)

(declare-datatypes ((array!41280 0))(
  ( (array!41281 (arr!19754 (Array (_ BitVec 32) (_ BitVec 64))) (size!20175 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41280)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7351 0))(
  ( (MissingZero!7351 (index!31772 (_ BitVec 32))) (Found!7351 (index!31773 (_ BitVec 32))) (Intermediate!7351 (undefined!8163 Bool) (index!31774 (_ BitVec 32)) (x!62792 (_ BitVec 32))) (Undefined!7351) (MissingVacant!7351 (index!31775 (_ BitVec 32))) )
))
(declare-fun lt!325435 () SeekEntryResult!7351)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41280 (_ BitVec 32)) SeekEntryResult!7351)

(assert (=> b!734570 (= e!411001 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19754 a!3186) j!159) a!3186 mask!3328) lt!325435))))

(declare-fun b!734571 () Bool)

(declare-fun res!493564 () Bool)

(declare-fun e!411009 () Bool)

(assert (=> b!734571 (=> (not res!493564) (not e!411009))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!734571 (= res!493564 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19754 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734572 () Bool)

(declare-fun res!493575 () Bool)

(declare-fun e!411004 () Bool)

(assert (=> b!734572 (=> (not res!493575) (not e!411004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41280 (_ BitVec 32)) Bool)

(assert (=> b!734572 (= res!493575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!734573 () Bool)

(declare-fun res!493572 () Bool)

(assert (=> b!734573 (=> (not res!493572) (not e!411009))))

(assert (=> b!734573 (= res!493572 e!411001)))

(declare-fun c!80886 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!734573 (= c!80886 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!734574 () Bool)

(declare-fun res!493565 () Bool)

(declare-fun e!411006 () Bool)

(assert (=> b!734574 (=> (not res!493565) (not e!411006))))

(assert (=> b!734574 (= res!493565 (and (= (size!20175 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20175 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20175 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!734575 () Bool)

(assert (=> b!734575 (= e!411004 e!411009)))

(declare-fun res!493569 () Bool)

(assert (=> b!734575 (=> (not res!493569) (not e!411009))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734575 (= res!493569 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19754 a!3186) j!159) mask!3328) (select (arr!19754 a!3186) j!159) a!3186 mask!3328) lt!325435))))

(assert (=> b!734575 (= lt!325435 (Intermediate!7351 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734576 () Bool)

(declare-fun e!411002 () Bool)

(declare-fun e!411007 () Bool)

(assert (=> b!734576 (= e!411002 e!411007)))

(declare-fun res!493562 () Bool)

(assert (=> b!734576 (=> res!493562 e!411007)))

(assert (=> b!734576 (= res!493562 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325436 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734576 (= lt!325436 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!734577 () Bool)

(declare-fun res!493567 () Bool)

(assert (=> b!734577 (=> (not res!493567) (not e!411006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734577 (= res!493567 (validKeyInArray!0 (select (arr!19754 a!3186) j!159)))))

(declare-fun lt!325434 () SeekEntryResult!7351)

(declare-fun e!411003 () Bool)

(declare-fun b!734578 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41280 (_ BitVec 32)) SeekEntryResult!7351)

(assert (=> b!734578 (= e!411003 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19754 a!3186) j!159) a!3186 mask!3328) lt!325434))))

(declare-fun b!734579 () Bool)

(declare-fun res!493561 () Bool)

(assert (=> b!734579 (=> (not res!493561) (not e!411004))))

(assert (=> b!734579 (= res!493561 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20175 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20175 a!3186))))))

(declare-fun b!734580 () Bool)

(declare-fun e!411008 () Bool)

(assert (=> b!734580 (= e!411009 e!411008)))

(declare-fun res!493566 () Bool)

(assert (=> b!734580 (=> (not res!493566) (not e!411008))))

(declare-fun lt!325437 () SeekEntryResult!7351)

(declare-fun lt!325432 () SeekEntryResult!7351)

(assert (=> b!734580 (= res!493566 (= lt!325437 lt!325432))))

(declare-fun lt!325431 () (_ BitVec 64))

(declare-fun lt!325439 () array!41280)

(assert (=> b!734580 (= lt!325432 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325431 lt!325439 mask!3328))))

(assert (=> b!734580 (= lt!325437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325431 mask!3328) lt!325431 lt!325439 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!734580 (= lt!325431 (select (store (arr!19754 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!734580 (= lt!325439 (array!41281 (store (arr!19754 a!3186) i!1173 k0!2102) (size!20175 a!3186)))))

(declare-fun b!734581 () Bool)

(declare-fun res!493570 () Bool)

(assert (=> b!734581 (=> (not res!493570) (not e!411004))))

(declare-datatypes ((List!13795 0))(
  ( (Nil!13792) (Cons!13791 (h!14863 (_ BitVec 64)) (t!20101 List!13795)) )
))
(declare-fun arrayNoDuplicates!0 (array!41280 (_ BitVec 32) List!13795) Bool)

(assert (=> b!734581 (= res!493570 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13792))))

(declare-fun b!734582 () Bool)

(assert (=> b!734582 (= e!411001 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19754 a!3186) j!159) a!3186 mask!3328) (Found!7351 j!159)))))

(declare-fun b!734583 () Bool)

(assert (=> b!734583 (= e!411006 e!411004)))

(declare-fun res!493571 () Bool)

(assert (=> b!734583 (=> (not res!493571) (not e!411004))))

(declare-fun lt!325430 () SeekEntryResult!7351)

(assert (=> b!734583 (= res!493571 (or (= lt!325430 (MissingZero!7351 i!1173)) (= lt!325430 (MissingVacant!7351 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41280 (_ BitVec 32)) SeekEntryResult!7351)

(assert (=> b!734583 (= lt!325430 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!734584 () Bool)

(declare-fun res!493573 () Bool)

(assert (=> b!734584 (=> (not res!493573) (not e!411006))))

(declare-fun arrayContainsKey!0 (array!41280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734584 (= res!493573 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!493559 () Bool)

(assert (=> start!65090 (=> (not res!493559) (not e!411006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65090 (= res!493559 (validMask!0 mask!3328))))

(assert (=> start!65090 e!411006))

(assert (=> start!65090 true))

(declare-fun array_inv!15637 (array!41280) Bool)

(assert (=> start!65090 (array_inv!15637 a!3186)))

(declare-fun b!734585 () Bool)

(declare-fun e!411005 () Bool)

(assert (=> b!734585 (= e!411005 e!411003)))

(declare-fun res!493568 () Bool)

(assert (=> b!734585 (=> (not res!493568) (not e!411003))))

(assert (=> b!734585 (= res!493568 (= (seekEntryOrOpen!0 (select (arr!19754 a!3186) j!159) a!3186 mask!3328) lt!325434))))

(assert (=> b!734585 (= lt!325434 (Found!7351 j!159))))

(declare-fun b!734586 () Bool)

(assert (=> b!734586 (= e!411007 true)))

(declare-fun lt!325433 () SeekEntryResult!7351)

(assert (=> b!734586 (= lt!325433 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19754 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734587 () Bool)

(assert (=> b!734587 (= e!411008 (not e!411002))))

(declare-fun res!493563 () Bool)

(assert (=> b!734587 (=> res!493563 e!411002)))

(get-info :version)

(assert (=> b!734587 (= res!493563 (or (not ((_ is Intermediate!7351) lt!325432)) (bvsge x!1131 (x!62792 lt!325432))))))

(assert (=> b!734587 e!411005))

(declare-fun res!493560 () Bool)

(assert (=> b!734587 (=> (not res!493560) (not e!411005))))

(assert (=> b!734587 (= res!493560 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24992 0))(
  ( (Unit!24993) )
))
(declare-fun lt!325438 () Unit!24992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24992)

(assert (=> b!734587 (= lt!325438 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!734588 () Bool)

(declare-fun res!493574 () Bool)

(assert (=> b!734588 (=> (not res!493574) (not e!411006))))

(assert (=> b!734588 (= res!493574 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65090 res!493559) b!734574))

(assert (= (and b!734574 res!493565) b!734577))

(assert (= (and b!734577 res!493567) b!734588))

(assert (= (and b!734588 res!493574) b!734584))

(assert (= (and b!734584 res!493573) b!734583))

(assert (= (and b!734583 res!493571) b!734572))

(assert (= (and b!734572 res!493575) b!734581))

(assert (= (and b!734581 res!493570) b!734579))

(assert (= (and b!734579 res!493561) b!734575))

(assert (= (and b!734575 res!493569) b!734571))

(assert (= (and b!734571 res!493564) b!734573))

(assert (= (and b!734573 c!80886) b!734570))

(assert (= (and b!734573 (not c!80886)) b!734582))

(assert (= (and b!734573 res!493572) b!734580))

(assert (= (and b!734580 res!493566) b!734587))

(assert (= (and b!734587 res!493560) b!734585))

(assert (= (and b!734585 res!493568) b!734578))

(assert (= (and b!734587 (not res!493563)) b!734576))

(assert (= (and b!734576 (not res!493562)) b!734586))

(declare-fun m!686573 () Bool)

(assert (=> b!734570 m!686573))

(assert (=> b!734570 m!686573))

(declare-fun m!686575 () Bool)

(assert (=> b!734570 m!686575))

(declare-fun m!686577 () Bool)

(assert (=> b!734588 m!686577))

(assert (=> b!734585 m!686573))

(assert (=> b!734585 m!686573))

(declare-fun m!686579 () Bool)

(assert (=> b!734585 m!686579))

(assert (=> b!734578 m!686573))

(assert (=> b!734578 m!686573))

(declare-fun m!686581 () Bool)

(assert (=> b!734578 m!686581))

(declare-fun m!686583 () Bool)

(assert (=> b!734580 m!686583))

(declare-fun m!686585 () Bool)

(assert (=> b!734580 m!686585))

(assert (=> b!734580 m!686583))

(declare-fun m!686587 () Bool)

(assert (=> b!734580 m!686587))

(declare-fun m!686589 () Bool)

(assert (=> b!734580 m!686589))

(declare-fun m!686591 () Bool)

(assert (=> b!734580 m!686591))

(declare-fun m!686593 () Bool)

(assert (=> b!734572 m!686593))

(declare-fun m!686595 () Bool)

(assert (=> b!734581 m!686595))

(assert (=> b!734575 m!686573))

(assert (=> b!734575 m!686573))

(declare-fun m!686597 () Bool)

(assert (=> b!734575 m!686597))

(assert (=> b!734575 m!686597))

(assert (=> b!734575 m!686573))

(declare-fun m!686599 () Bool)

(assert (=> b!734575 m!686599))

(declare-fun m!686601 () Bool)

(assert (=> b!734576 m!686601))

(declare-fun m!686603 () Bool)

(assert (=> start!65090 m!686603))

(declare-fun m!686605 () Bool)

(assert (=> start!65090 m!686605))

(declare-fun m!686607 () Bool)

(assert (=> b!734587 m!686607))

(declare-fun m!686609 () Bool)

(assert (=> b!734587 m!686609))

(assert (=> b!734586 m!686573))

(assert (=> b!734586 m!686573))

(declare-fun m!686611 () Bool)

(assert (=> b!734586 m!686611))

(assert (=> b!734582 m!686573))

(assert (=> b!734582 m!686573))

(assert (=> b!734582 m!686611))

(declare-fun m!686613 () Bool)

(assert (=> b!734583 m!686613))

(declare-fun m!686615 () Bool)

(assert (=> b!734571 m!686615))

(declare-fun m!686617 () Bool)

(assert (=> b!734584 m!686617))

(assert (=> b!734577 m!686573))

(assert (=> b!734577 m!686573))

(declare-fun m!686619 () Bool)

(assert (=> b!734577 m!686619))

(check-sat (not b!734583) (not b!734587) (not start!65090) (not b!734570) (not b!734572) (not b!734575) (not b!734581) (not b!734578) (not b!734586) (not b!734585) (not b!734580) (not b!734588) (not b!734577) (not b!734584) (not b!734582) (not b!734576))
(check-sat)
