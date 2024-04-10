; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67132 () Bool)

(assert start!67132)

(declare-datatypes ((array!42487 0))(
  ( (array!42488 (arr!20339 (Array (_ BitVec 32) (_ BitVec 64))) (size!20760 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42487)

(declare-datatypes ((SeekEntryResult!7939 0))(
  ( (MissingZero!7939 (index!34124 (_ BitVec 32))) (Found!7939 (index!34125 (_ BitVec 32))) (Intermediate!7939 (undefined!8751 Bool) (index!34126 (_ BitVec 32)) (x!65066 (_ BitVec 32))) (Undefined!7939) (MissingVacant!7939 (index!34127 (_ BitVec 32))) )
))
(declare-fun lt!345515 () SeekEntryResult!7939)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!775572 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!431641 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42487 (_ BitVec 32)) SeekEntryResult!7939)

(assert (=> b!775572 (= e!431641 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20339 a!3186) j!159) a!3186 mask!3328) lt!345515))))

(declare-fun b!775573 () Bool)

(declare-fun res!524483 () Bool)

(declare-fun e!431643 () Bool)

(assert (=> b!775573 (=> res!524483 e!431643)))

(declare-fun lt!345513 () SeekEntryResult!7939)

(declare-fun lt!345518 () array!42487)

(declare-fun lt!345519 () (_ BitVec 64))

(declare-fun lt!345509 () (_ BitVec 32))

(assert (=> b!775573 (= res!524483 (not (= lt!345513 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345509 lt!345519 lt!345518 mask!3328))))))

(declare-fun b!775574 () Bool)

(declare-fun e!431640 () Bool)

(declare-fun e!431645 () Bool)

(assert (=> b!775574 (= e!431640 e!431645)))

(declare-fun res!524487 () Bool)

(assert (=> b!775574 (=> (not res!524487) (not e!431645))))

(declare-fun lt!345512 () SeekEntryResult!7939)

(assert (=> b!775574 (= res!524487 (= lt!345513 lt!345512))))

(assert (=> b!775574 (= lt!345512 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345519 lt!345518 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775574 (= lt!345513 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345519 mask!3328) lt!345519 lt!345518 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!775574 (= lt!345519 (select (store (arr!20339 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!775574 (= lt!345518 (array!42488 (store (arr!20339 a!3186) i!1173 k!2102) (size!20760 a!3186)))))

(declare-fun b!775575 () Bool)

(declare-fun res!524492 () Bool)

(assert (=> b!775575 (=> (not res!524492) (not e!431640))))

(assert (=> b!775575 (= res!524492 e!431641)))

(declare-fun c!85949 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775575 (= c!85949 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!431647 () Bool)

(declare-fun lt!345508 () SeekEntryResult!7939)

(declare-fun b!775576 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42487 (_ BitVec 32)) SeekEntryResult!7939)

(assert (=> b!775576 (= e!431647 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345509 resIntermediateIndex!5 (select (arr!20339 a!3186) j!159) a!3186 mask!3328) lt!345508)))))

(declare-fun b!775577 () Bool)

(declare-fun res!524490 () Bool)

(declare-fun e!431639 () Bool)

(assert (=> b!775577 (=> (not res!524490) (not e!431639))))

(assert (=> b!775577 (= res!524490 (and (= (size!20760 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20760 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20760 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775578 () Bool)

(declare-fun e!431638 () Bool)

(assert (=> b!775578 (= e!431638 e!431643)))

(declare-fun res!524488 () Bool)

(assert (=> b!775578 (=> res!524488 e!431643)))

(assert (=> b!775578 (= res!524488 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345509 #b00000000000000000000000000000000) (bvsge lt!345509 (size!20760 a!3186))))))

(declare-datatypes ((Unit!26770 0))(
  ( (Unit!26771) )
))
(declare-fun lt!345520 () Unit!26770)

(declare-fun e!431648 () Unit!26770)

(assert (=> b!775578 (= lt!345520 e!431648)))

(declare-fun c!85950 () Bool)

(declare-fun lt!345511 () Bool)

(assert (=> b!775578 (= c!85950 lt!345511)))

(assert (=> b!775578 (= lt!345511 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775578 (= lt!345509 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!775579 () Bool)

(assert (=> b!775579 (= e!431647 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345509 (select (arr!20339 a!3186) j!159) a!3186 mask!3328) lt!345515)))))

(declare-fun res!524476 () Bool)

(assert (=> start!67132 (=> (not res!524476) (not e!431639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67132 (= res!524476 (validMask!0 mask!3328))))

(assert (=> start!67132 e!431639))

(assert (=> start!67132 true))

(declare-fun array_inv!16135 (array!42487) Bool)

(assert (=> start!67132 (array_inv!16135 a!3186)))

(declare-fun b!775580 () Bool)

(declare-fun res!524479 () Bool)

(declare-fun e!431637 () Bool)

(assert (=> b!775580 (=> (not res!524479) (not e!431637))))

(assert (=> b!775580 (= res!524479 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20760 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20760 a!3186))))))

(declare-fun b!775581 () Bool)

(declare-fun res!524475 () Bool)

(assert (=> b!775581 (=> (not res!524475) (not e!431637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42487 (_ BitVec 32)) Bool)

(assert (=> b!775581 (= res!524475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775582 () Bool)

(assert (=> b!775582 (= e!431643 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42487 (_ BitVec 32)) SeekEntryResult!7939)

(assert (=> b!775582 (= (seekEntryOrOpen!0 lt!345519 lt!345518 mask!3328) lt!345508)))

(declare-fun lt!345510 () Unit!26770)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42487 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26770)

(assert (=> b!775582 (= lt!345510 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!345509 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!775583 () Bool)

(declare-fun e!431644 () Bool)

(declare-fun e!431642 () Bool)

(assert (=> b!775583 (= e!431644 e!431642)))

(declare-fun res!524481 () Bool)

(assert (=> b!775583 (=> (not res!524481) (not e!431642))))

(declare-fun lt!345517 () SeekEntryResult!7939)

(assert (=> b!775583 (= res!524481 (= (seekEntryOrOpen!0 (select (arr!20339 a!3186) j!159) a!3186 mask!3328) lt!345517))))

(assert (=> b!775583 (= lt!345517 (Found!7939 j!159))))

(declare-fun b!775584 () Bool)

(assert (=> b!775584 (= e!431639 e!431637)))

(declare-fun res!524484 () Bool)

(assert (=> b!775584 (=> (not res!524484) (not e!431637))))

(declare-fun lt!345516 () SeekEntryResult!7939)

(assert (=> b!775584 (= res!524484 (or (= lt!345516 (MissingZero!7939 i!1173)) (= lt!345516 (MissingVacant!7939 i!1173))))))

(assert (=> b!775584 (= lt!345516 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!775585 () Bool)

(declare-fun res!524480 () Bool)

(assert (=> b!775585 (=> (not res!524480) (not e!431640))))

(assert (=> b!775585 (= res!524480 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20339 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775586 () Bool)

(declare-fun res!524486 () Bool)

(assert (=> b!775586 (=> (not res!524486) (not e!431637))))

(declare-datatypes ((List!14341 0))(
  ( (Nil!14338) (Cons!14337 (h!15445 (_ BitVec 64)) (t!20656 List!14341)) )
))
(declare-fun arrayNoDuplicates!0 (array!42487 (_ BitVec 32) List!14341) Bool)

(assert (=> b!775586 (= res!524486 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14338))))

(declare-fun b!775587 () Bool)

(declare-fun res!524485 () Bool)

(assert (=> b!775587 (=> (not res!524485) (not e!431639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775587 (= res!524485 (validKeyInArray!0 (select (arr!20339 a!3186) j!159)))))

(declare-fun b!775588 () Bool)

(declare-fun Unit!26772 () Unit!26770)

(assert (=> b!775588 (= e!431648 Unit!26772)))

(assert (=> b!775588 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345509 (select (arr!20339 a!3186) j!159) a!3186 mask!3328) lt!345515)))

(declare-fun b!775589 () Bool)

(assert (=> b!775589 (= e!431637 e!431640)))

(declare-fun res!524482 () Bool)

(assert (=> b!775589 (=> (not res!524482) (not e!431640))))

(assert (=> b!775589 (= res!524482 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20339 a!3186) j!159) mask!3328) (select (arr!20339 a!3186) j!159) a!3186 mask!3328) lt!345515))))

(assert (=> b!775589 (= lt!345515 (Intermediate!7939 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775590 () Bool)

(assert (=> b!775590 (= e!431645 (not e!431638))))

(declare-fun res!524489 () Bool)

(assert (=> b!775590 (=> res!524489 e!431638)))

(assert (=> b!775590 (= res!524489 (or (not (is-Intermediate!7939 lt!345512)) (bvsge x!1131 (x!65066 lt!345512))))))

(assert (=> b!775590 (= lt!345508 (Found!7939 j!159))))

(assert (=> b!775590 e!431644))

(declare-fun res!524474 () Bool)

(assert (=> b!775590 (=> (not res!524474) (not e!431644))))

(assert (=> b!775590 (= res!524474 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345514 () Unit!26770)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26770)

(assert (=> b!775590 (= lt!345514 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775591 () Bool)

(declare-fun res!524477 () Bool)

(assert (=> b!775591 (=> (not res!524477) (not e!431639))))

(assert (=> b!775591 (= res!524477 (validKeyInArray!0 k!2102))))

(declare-fun b!775592 () Bool)

(declare-fun Unit!26773 () Unit!26770)

(assert (=> b!775592 (= e!431648 Unit!26773)))

(declare-fun lt!345521 () SeekEntryResult!7939)

(assert (=> b!775592 (= lt!345521 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20339 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!775592 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345509 resIntermediateIndex!5 (select (arr!20339 a!3186) j!159) a!3186 mask!3328) lt!345508)))

(declare-fun b!775593 () Bool)

(declare-fun res!524491 () Bool)

(assert (=> b!775593 (=> res!524491 e!431643)))

(assert (=> b!775593 (= res!524491 e!431647)))

(declare-fun c!85951 () Bool)

(assert (=> b!775593 (= c!85951 lt!345511)))

(declare-fun b!775594 () Bool)

(assert (=> b!775594 (= e!431642 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20339 a!3186) j!159) a!3186 mask!3328) lt!345517))))

(declare-fun b!775595 () Bool)

(assert (=> b!775595 (= e!431641 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20339 a!3186) j!159) a!3186 mask!3328) (Found!7939 j!159)))))

(declare-fun b!775596 () Bool)

(declare-fun res!524478 () Bool)

(assert (=> b!775596 (=> (not res!524478) (not e!431639))))

(declare-fun arrayContainsKey!0 (array!42487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775596 (= res!524478 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!67132 res!524476) b!775577))

(assert (= (and b!775577 res!524490) b!775587))

(assert (= (and b!775587 res!524485) b!775591))

(assert (= (and b!775591 res!524477) b!775596))

(assert (= (and b!775596 res!524478) b!775584))

(assert (= (and b!775584 res!524484) b!775581))

(assert (= (and b!775581 res!524475) b!775586))

(assert (= (and b!775586 res!524486) b!775580))

(assert (= (and b!775580 res!524479) b!775589))

(assert (= (and b!775589 res!524482) b!775585))

(assert (= (and b!775585 res!524480) b!775575))

(assert (= (and b!775575 c!85949) b!775572))

(assert (= (and b!775575 (not c!85949)) b!775595))

(assert (= (and b!775575 res!524492) b!775574))

(assert (= (and b!775574 res!524487) b!775590))

(assert (= (and b!775590 res!524474) b!775583))

(assert (= (and b!775583 res!524481) b!775594))

(assert (= (and b!775590 (not res!524489)) b!775578))

(assert (= (and b!775578 c!85950) b!775588))

(assert (= (and b!775578 (not c!85950)) b!775592))

(assert (= (and b!775578 (not res!524488)) b!775593))

(assert (= (and b!775593 c!85951) b!775579))

(assert (= (and b!775593 (not c!85951)) b!775576))

(assert (= (and b!775593 (not res!524491)) b!775573))

(assert (= (and b!775573 (not res!524483)) b!775582))

(declare-fun m!719767 () Bool)

(assert (=> b!775584 m!719767))

(declare-fun m!719769 () Bool)

(assert (=> b!775583 m!719769))

(assert (=> b!775583 m!719769))

(declare-fun m!719771 () Bool)

(assert (=> b!775583 m!719771))

(declare-fun m!719773 () Bool)

(assert (=> b!775578 m!719773))

(declare-fun m!719775 () Bool)

(assert (=> b!775574 m!719775))

(declare-fun m!719777 () Bool)

(assert (=> b!775574 m!719777))

(declare-fun m!719779 () Bool)

(assert (=> b!775574 m!719779))

(declare-fun m!719781 () Bool)

(assert (=> b!775574 m!719781))

(declare-fun m!719783 () Bool)

(assert (=> b!775574 m!719783))

(assert (=> b!775574 m!719775))

(declare-fun m!719785 () Bool)

(assert (=> b!775582 m!719785))

(declare-fun m!719787 () Bool)

(assert (=> b!775582 m!719787))

(declare-fun m!719789 () Bool)

(assert (=> b!775590 m!719789))

(declare-fun m!719791 () Bool)

(assert (=> b!775590 m!719791))

(declare-fun m!719793 () Bool)

(assert (=> b!775585 m!719793))

(declare-fun m!719795 () Bool)

(assert (=> b!775591 m!719795))

(assert (=> b!775595 m!719769))

(assert (=> b!775595 m!719769))

(declare-fun m!719797 () Bool)

(assert (=> b!775595 m!719797))

(declare-fun m!719799 () Bool)

(assert (=> b!775581 m!719799))

(assert (=> b!775588 m!719769))

(assert (=> b!775588 m!719769))

(declare-fun m!719801 () Bool)

(assert (=> b!775588 m!719801))

(assert (=> b!775594 m!719769))

(assert (=> b!775594 m!719769))

(declare-fun m!719803 () Bool)

(assert (=> b!775594 m!719803))

(declare-fun m!719805 () Bool)

(assert (=> start!67132 m!719805))

(declare-fun m!719807 () Bool)

(assert (=> start!67132 m!719807))

(assert (=> b!775579 m!719769))

(assert (=> b!775579 m!719769))

(assert (=> b!775579 m!719801))

(declare-fun m!719809 () Bool)

(assert (=> b!775573 m!719809))

(assert (=> b!775572 m!719769))

(assert (=> b!775572 m!719769))

(declare-fun m!719811 () Bool)

(assert (=> b!775572 m!719811))

(declare-fun m!719813 () Bool)

(assert (=> b!775586 m!719813))

(assert (=> b!775589 m!719769))

(assert (=> b!775589 m!719769))

(declare-fun m!719815 () Bool)

(assert (=> b!775589 m!719815))

(assert (=> b!775589 m!719815))

(assert (=> b!775589 m!719769))

(declare-fun m!719817 () Bool)

(assert (=> b!775589 m!719817))

(declare-fun m!719819 () Bool)

(assert (=> b!775596 m!719819))

(assert (=> b!775592 m!719769))

(assert (=> b!775592 m!719769))

(assert (=> b!775592 m!719797))

(assert (=> b!775592 m!719769))

(declare-fun m!719821 () Bool)

(assert (=> b!775592 m!719821))

(assert (=> b!775587 m!719769))

(assert (=> b!775587 m!719769))

(declare-fun m!719823 () Bool)

(assert (=> b!775587 m!719823))

(assert (=> b!775576 m!719769))

(assert (=> b!775576 m!719769))

(assert (=> b!775576 m!719821))

(push 1)

