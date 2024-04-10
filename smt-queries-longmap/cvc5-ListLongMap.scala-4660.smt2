; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64732 () Bool)

(assert start!64732)

(declare-fun b!730522 () Bool)

(declare-fun e!408805 () Bool)

(declare-fun e!408807 () Bool)

(assert (=> b!730522 (= e!408805 e!408807)))

(declare-fun res!490816 () Bool)

(assert (=> b!730522 (=> (not res!490816) (not e!408807))))

(declare-datatypes ((SeekEntryResult!7310 0))(
  ( (MissingZero!7310 (index!31608 (_ BitVec 32))) (Found!7310 (index!31609 (_ BitVec 32))) (Intermediate!7310 (undefined!8122 Bool) (index!31610 (_ BitVec 32)) (x!62588 (_ BitVec 32))) (Undefined!7310) (MissingVacant!7310 (index!31611 (_ BitVec 32))) )
))
(declare-fun lt!323704 () SeekEntryResult!7310)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730522 (= res!490816 (or (= lt!323704 (MissingZero!7310 i!1173)) (= lt!323704 (MissingVacant!7310 i!1173))))))

(declare-datatypes ((array!41181 0))(
  ( (array!41182 (arr!19710 (Array (_ BitVec 32) (_ BitVec 64))) (size!20131 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41181)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41181 (_ BitVec 32)) SeekEntryResult!7310)

(assert (=> b!730522 (= lt!323704 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!490813 () Bool)

(assert (=> start!64732 (=> (not res!490813) (not e!408805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64732 (= res!490813 (validMask!0 mask!3328))))

(assert (=> start!64732 e!408805))

(assert (=> start!64732 true))

(declare-fun array_inv!15506 (array!41181) Bool)

(assert (=> start!64732 (array_inv!15506 a!3186)))

(declare-fun b!730523 () Bool)

(declare-fun res!490807 () Bool)

(assert (=> b!730523 (=> (not res!490807) (not e!408805))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730523 (= res!490807 (validKeyInArray!0 (select (arr!19710 a!3186) j!159)))))

(declare-fun b!730524 () Bool)

(declare-fun res!490817 () Bool)

(assert (=> b!730524 (=> (not res!490817) (not e!408805))))

(assert (=> b!730524 (= res!490817 (and (= (size!20131 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20131 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20131 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730525 () Bool)

(declare-fun e!408806 () Bool)

(declare-fun e!408810 () Bool)

(assert (=> b!730525 (= e!408806 (not e!408810))))

(declare-fun res!490819 () Bool)

(assert (=> b!730525 (=> res!490819 e!408810)))

(declare-fun lt!323705 () SeekEntryResult!7310)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!730525 (= res!490819 (or (not (is-Intermediate!7310 lt!323705)) (bvsge x!1131 (x!62588 lt!323705))))))

(declare-fun e!408811 () Bool)

(assert (=> b!730525 e!408811))

(declare-fun res!490815 () Bool)

(assert (=> b!730525 (=> (not res!490815) (not e!408811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41181 (_ BitVec 32)) Bool)

(assert (=> b!730525 (= res!490815 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24938 0))(
  ( (Unit!24939) )
))
(declare-fun lt!323709 () Unit!24938)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24938)

(assert (=> b!730525 (= lt!323709 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!730526 () Bool)

(declare-fun lt!323707 () SeekEntryResult!7310)

(declare-fun e!408804 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41181 (_ BitVec 32)) SeekEntryResult!7310)

(assert (=> b!730526 (= e!408804 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19710 a!3186) j!159) a!3186 mask!3328) lt!323707))))

(declare-fun b!730527 () Bool)

(assert (=> b!730527 (= e!408810 true)))

(declare-fun lt!323711 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730527 (= lt!323711 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730528 () Bool)

(declare-fun res!490810 () Bool)

(declare-fun e!408808 () Bool)

(assert (=> b!730528 (=> (not res!490810) (not e!408808))))

(declare-fun e!408812 () Bool)

(assert (=> b!730528 (= res!490810 e!408812)))

(declare-fun c!80233 () Bool)

(assert (=> b!730528 (= c!80233 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730529 () Bool)

(assert (=> b!730529 (= e!408812 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19710 a!3186) j!159) a!3186 mask!3328) (Found!7310 j!159)))))

(declare-fun b!730530 () Bool)

(assert (=> b!730530 (= e!408808 e!408806)))

(declare-fun res!490809 () Bool)

(assert (=> b!730530 (=> (not res!490809) (not e!408806))))

(declare-fun lt!323710 () SeekEntryResult!7310)

(assert (=> b!730530 (= res!490809 (= lt!323710 lt!323705))))

(declare-fun lt!323703 () (_ BitVec 64))

(declare-fun lt!323708 () array!41181)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41181 (_ BitVec 32)) SeekEntryResult!7310)

(assert (=> b!730530 (= lt!323705 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323703 lt!323708 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730530 (= lt!323710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323703 mask!3328) lt!323703 lt!323708 mask!3328))))

(assert (=> b!730530 (= lt!323703 (select (store (arr!19710 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!730530 (= lt!323708 (array!41182 (store (arr!19710 a!3186) i!1173 k!2102) (size!20131 a!3186)))))

(declare-fun b!730531 () Bool)

(declare-fun res!490818 () Bool)

(assert (=> b!730531 (=> (not res!490818) (not e!408807))))

(assert (=> b!730531 (= res!490818 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20131 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20131 a!3186))))))

(declare-fun b!730532 () Bool)

(declare-fun res!490808 () Bool)

(assert (=> b!730532 (=> (not res!490808) (not e!408805))))

(declare-fun arrayContainsKey!0 (array!41181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730532 (= res!490808 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730533 () Bool)

(declare-fun res!490811 () Bool)

(assert (=> b!730533 (=> (not res!490811) (not e!408807))))

(assert (=> b!730533 (= res!490811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730534 () Bool)

(assert (=> b!730534 (= e!408807 e!408808)))

(declare-fun res!490814 () Bool)

(assert (=> b!730534 (=> (not res!490814) (not e!408808))))

(declare-fun lt!323706 () SeekEntryResult!7310)

(assert (=> b!730534 (= res!490814 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19710 a!3186) j!159) mask!3328) (select (arr!19710 a!3186) j!159) a!3186 mask!3328) lt!323706))))

(assert (=> b!730534 (= lt!323706 (Intermediate!7310 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730535 () Bool)

(declare-fun res!490812 () Bool)

(assert (=> b!730535 (=> (not res!490812) (not e!408805))))

(assert (=> b!730535 (= res!490812 (validKeyInArray!0 k!2102))))

(declare-fun b!730536 () Bool)

(declare-fun res!490820 () Bool)

(assert (=> b!730536 (=> (not res!490820) (not e!408807))))

(declare-datatypes ((List!13712 0))(
  ( (Nil!13709) (Cons!13708 (h!14768 (_ BitVec 64)) (t!20027 List!13712)) )
))
(declare-fun arrayNoDuplicates!0 (array!41181 (_ BitVec 32) List!13712) Bool)

(assert (=> b!730536 (= res!490820 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13709))))

(declare-fun b!730537 () Bool)

(declare-fun res!490806 () Bool)

(assert (=> b!730537 (=> (not res!490806) (not e!408808))))

(assert (=> b!730537 (= res!490806 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19710 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730538 () Bool)

(assert (=> b!730538 (= e!408811 e!408804)))

(declare-fun res!490805 () Bool)

(assert (=> b!730538 (=> (not res!490805) (not e!408804))))

(assert (=> b!730538 (= res!490805 (= (seekEntryOrOpen!0 (select (arr!19710 a!3186) j!159) a!3186 mask!3328) lt!323707))))

(assert (=> b!730538 (= lt!323707 (Found!7310 j!159))))

(declare-fun b!730539 () Bool)

(assert (=> b!730539 (= e!408812 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19710 a!3186) j!159) a!3186 mask!3328) lt!323706))))

(assert (= (and start!64732 res!490813) b!730524))

(assert (= (and b!730524 res!490817) b!730523))

(assert (= (and b!730523 res!490807) b!730535))

(assert (= (and b!730535 res!490812) b!730532))

(assert (= (and b!730532 res!490808) b!730522))

(assert (= (and b!730522 res!490816) b!730533))

(assert (= (and b!730533 res!490811) b!730536))

(assert (= (and b!730536 res!490820) b!730531))

(assert (= (and b!730531 res!490818) b!730534))

(assert (= (and b!730534 res!490814) b!730537))

(assert (= (and b!730537 res!490806) b!730528))

(assert (= (and b!730528 c!80233) b!730539))

(assert (= (and b!730528 (not c!80233)) b!730529))

(assert (= (and b!730528 res!490810) b!730530))

(assert (= (and b!730530 res!490809) b!730525))

(assert (= (and b!730525 res!490815) b!730538))

(assert (= (and b!730538 res!490805) b!730526))

(assert (= (and b!730525 (not res!490819)) b!730527))

(declare-fun m!684043 () Bool)

(assert (=> start!64732 m!684043))

(declare-fun m!684045 () Bool)

(assert (=> start!64732 m!684045))

(declare-fun m!684047 () Bool)

(assert (=> b!730526 m!684047))

(assert (=> b!730526 m!684047))

(declare-fun m!684049 () Bool)

(assert (=> b!730526 m!684049))

(declare-fun m!684051 () Bool)

(assert (=> b!730525 m!684051))

(declare-fun m!684053 () Bool)

(assert (=> b!730525 m!684053))

(declare-fun m!684055 () Bool)

(assert (=> b!730537 m!684055))

(declare-fun m!684057 () Bool)

(assert (=> b!730522 m!684057))

(assert (=> b!730538 m!684047))

(assert (=> b!730538 m!684047))

(declare-fun m!684059 () Bool)

(assert (=> b!730538 m!684059))

(declare-fun m!684061 () Bool)

(assert (=> b!730536 m!684061))

(declare-fun m!684063 () Bool)

(assert (=> b!730530 m!684063))

(declare-fun m!684065 () Bool)

(assert (=> b!730530 m!684065))

(declare-fun m!684067 () Bool)

(assert (=> b!730530 m!684067))

(declare-fun m!684069 () Bool)

(assert (=> b!730530 m!684069))

(declare-fun m!684071 () Bool)

(assert (=> b!730530 m!684071))

(assert (=> b!730530 m!684069))

(declare-fun m!684073 () Bool)

(assert (=> b!730533 m!684073))

(declare-fun m!684075 () Bool)

(assert (=> b!730532 m!684075))

(assert (=> b!730523 m!684047))

(assert (=> b!730523 m!684047))

(declare-fun m!684077 () Bool)

(assert (=> b!730523 m!684077))

(assert (=> b!730539 m!684047))

(assert (=> b!730539 m!684047))

(declare-fun m!684079 () Bool)

(assert (=> b!730539 m!684079))

(assert (=> b!730529 m!684047))

(assert (=> b!730529 m!684047))

(declare-fun m!684081 () Bool)

(assert (=> b!730529 m!684081))

(declare-fun m!684083 () Bool)

(assert (=> b!730527 m!684083))

(declare-fun m!684085 () Bool)

(assert (=> b!730535 m!684085))

(assert (=> b!730534 m!684047))

(assert (=> b!730534 m!684047))

(declare-fun m!684087 () Bool)

(assert (=> b!730534 m!684087))

(assert (=> b!730534 m!684087))

(assert (=> b!730534 m!684047))

(declare-fun m!684089 () Bool)

(assert (=> b!730534 m!684089))

(push 1)

