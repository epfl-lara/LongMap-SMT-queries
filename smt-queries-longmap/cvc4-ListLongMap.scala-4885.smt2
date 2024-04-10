; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67360 () Bool)

(assert start!67360)

(declare-fun b!779122 () Bool)

(declare-fun e!433457 () Bool)

(declare-fun e!433449 () Bool)

(assert (=> b!779122 (= e!433457 e!433449)))

(declare-fun res!527121 () Bool)

(assert (=> b!779122 (=> (not res!527121) (not e!433449))))

(declare-datatypes ((SeekEntryResult!7987 0))(
  ( (MissingZero!7987 (index!34316 (_ BitVec 32))) (Found!7987 (index!34317 (_ BitVec 32))) (Intermediate!7987 (undefined!8799 Bool) (index!34318 (_ BitVec 32)) (x!65260 (_ BitVec 32))) (Undefined!7987) (MissingVacant!7987 (index!34319 (_ BitVec 32))) )
))
(declare-fun lt!347133 () SeekEntryResult!7987)

(declare-fun lt!347136 () SeekEntryResult!7987)

(assert (=> b!779122 (= res!527121 (= lt!347133 lt!347136))))

(declare-fun lt!347135 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42589 0))(
  ( (array!42590 (arr!20387 (Array (_ BitVec 32) (_ BitVec 64))) (size!20808 (_ BitVec 32))) )
))
(declare-fun lt!347137 () array!42589)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42589 (_ BitVec 32)) SeekEntryResult!7987)

(assert (=> b!779122 (= lt!347136 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347135 lt!347137 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779122 (= lt!347133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347135 mask!3328) lt!347135 lt!347137 mask!3328))))

(declare-fun a!3186 () array!42589)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!779122 (= lt!347135 (select (store (arr!20387 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!779122 (= lt!347137 (array!42590 (store (arr!20387 a!3186) i!1173 k!2102) (size!20808 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!433450 () Bool)

(declare-fun b!779123 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42589 (_ BitVec 32)) SeekEntryResult!7987)

(assert (=> b!779123 (= e!433450 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20387 a!3186) j!159) a!3186 mask!3328) (Found!7987 j!159)))))

(declare-fun b!779124 () Bool)

(declare-fun res!527123 () Bool)

(declare-fun e!433455 () Bool)

(assert (=> b!779124 (=> (not res!527123) (not e!433455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779124 (= res!527123 (validKeyInArray!0 k!2102))))

(declare-fun b!779125 () Bool)

(declare-fun res!527120 () Bool)

(declare-fun e!433453 () Bool)

(assert (=> b!779125 (=> (not res!527120) (not e!433453))))

(declare-datatypes ((List!14389 0))(
  ( (Nil!14386) (Cons!14385 (h!15499 (_ BitVec 64)) (t!20704 List!14389)) )
))
(declare-fun arrayNoDuplicates!0 (array!42589 (_ BitVec 32) List!14389) Bool)

(assert (=> b!779125 (= res!527120 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14386))))

(declare-fun b!779126 () Bool)

(declare-fun res!527118 () Bool)

(assert (=> b!779126 (=> (not res!527118) (not e!433455))))

(declare-fun arrayContainsKey!0 (array!42589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779126 (= res!527118 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779127 () Bool)

(declare-fun e!433451 () Bool)

(assert (=> b!779127 (= e!433449 (not e!433451))))

(declare-fun res!527129 () Bool)

(assert (=> b!779127 (=> res!527129 e!433451)))

(assert (=> b!779127 (= res!527129 (or (not (is-Intermediate!7987 lt!347136)) (bvslt x!1131 (x!65260 lt!347136)) (not (= x!1131 (x!65260 lt!347136))) (not (= index!1321 (index!34318 lt!347136)))))))

(declare-fun e!433454 () Bool)

(assert (=> b!779127 e!433454))

(declare-fun res!527122 () Bool)

(assert (=> b!779127 (=> (not res!527122) (not e!433454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42589 (_ BitVec 32)) Bool)

(assert (=> b!779127 (= res!527122 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26868 0))(
  ( (Unit!26869) )
))
(declare-fun lt!347134 () Unit!26868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42589 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26868)

(assert (=> b!779127 (= lt!347134 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779128 () Bool)

(assert (=> b!779128 (= e!433455 e!433453)))

(declare-fun res!527115 () Bool)

(assert (=> b!779128 (=> (not res!527115) (not e!433453))))

(declare-fun lt!347130 () SeekEntryResult!7987)

(assert (=> b!779128 (= res!527115 (or (= lt!347130 (MissingZero!7987 i!1173)) (= lt!347130 (MissingVacant!7987 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42589 (_ BitVec 32)) SeekEntryResult!7987)

(assert (=> b!779128 (= lt!347130 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!779129 () Bool)

(declare-fun res!527125 () Bool)

(assert (=> b!779129 (=> (not res!527125) (not e!433455))))

(assert (=> b!779129 (= res!527125 (and (= (size!20808 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20808 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20808 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779130 () Bool)

(assert (=> b!779130 (= e!433451 true)))

(declare-fun lt!347132 () SeekEntryResult!7987)

(assert (=> b!779130 (= lt!347132 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20387 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779131 () Bool)

(declare-fun res!527119 () Bool)

(assert (=> b!779131 (=> (not res!527119) (not e!433453))))

(assert (=> b!779131 (= res!527119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779132 () Bool)

(declare-fun res!527117 () Bool)

(assert (=> b!779132 (=> (not res!527117) (not e!433457))))

(assert (=> b!779132 (= res!527117 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20387 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!347138 () SeekEntryResult!7987)

(declare-fun e!433456 () Bool)

(declare-fun b!779133 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779133 (= e!433456 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20387 a!3186) j!159) a!3186 mask!3328) lt!347138))))

(declare-fun b!779134 () Bool)

(declare-fun res!527124 () Bool)

(assert (=> b!779134 (=> (not res!527124) (not e!433455))))

(assert (=> b!779134 (= res!527124 (validKeyInArray!0 (select (arr!20387 a!3186) j!159)))))

(declare-fun b!779135 () Bool)

(declare-fun lt!347131 () SeekEntryResult!7987)

(assert (=> b!779135 (= e!433450 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20387 a!3186) j!159) a!3186 mask!3328) lt!347131))))

(declare-fun b!779136 () Bool)

(declare-fun res!527126 () Bool)

(assert (=> b!779136 (=> (not res!527126) (not e!433453))))

(assert (=> b!779136 (= res!527126 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20808 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20808 a!3186))))))

(declare-fun b!779137 () Bool)

(declare-fun res!527127 () Bool)

(assert (=> b!779137 (=> (not res!527127) (not e!433457))))

(assert (=> b!779137 (= res!527127 e!433450)))

(declare-fun c!86407 () Bool)

(assert (=> b!779137 (= c!86407 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!527116 () Bool)

(assert (=> start!67360 (=> (not res!527116) (not e!433455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67360 (= res!527116 (validMask!0 mask!3328))))

(assert (=> start!67360 e!433455))

(assert (=> start!67360 true))

(declare-fun array_inv!16183 (array!42589) Bool)

(assert (=> start!67360 (array_inv!16183 a!3186)))

(declare-fun b!779138 () Bool)

(assert (=> b!779138 (= e!433453 e!433457)))

(declare-fun res!527128 () Bool)

(assert (=> b!779138 (=> (not res!527128) (not e!433457))))

(assert (=> b!779138 (= res!527128 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20387 a!3186) j!159) mask!3328) (select (arr!20387 a!3186) j!159) a!3186 mask!3328) lt!347131))))

(assert (=> b!779138 (= lt!347131 (Intermediate!7987 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779139 () Bool)

(assert (=> b!779139 (= e!433454 e!433456)))

(declare-fun res!527114 () Bool)

(assert (=> b!779139 (=> (not res!527114) (not e!433456))))

(assert (=> b!779139 (= res!527114 (= (seekEntryOrOpen!0 (select (arr!20387 a!3186) j!159) a!3186 mask!3328) lt!347138))))

(assert (=> b!779139 (= lt!347138 (Found!7987 j!159))))

(assert (= (and start!67360 res!527116) b!779129))

(assert (= (and b!779129 res!527125) b!779134))

(assert (= (and b!779134 res!527124) b!779124))

(assert (= (and b!779124 res!527123) b!779126))

(assert (= (and b!779126 res!527118) b!779128))

(assert (= (and b!779128 res!527115) b!779131))

(assert (= (and b!779131 res!527119) b!779125))

(assert (= (and b!779125 res!527120) b!779136))

(assert (= (and b!779136 res!527126) b!779138))

(assert (= (and b!779138 res!527128) b!779132))

(assert (= (and b!779132 res!527117) b!779137))

(assert (= (and b!779137 c!86407) b!779135))

(assert (= (and b!779137 (not c!86407)) b!779123))

(assert (= (and b!779137 res!527127) b!779122))

(assert (= (and b!779122 res!527121) b!779127))

(assert (= (and b!779127 res!527122) b!779139))

(assert (= (and b!779139 res!527114) b!779133))

(assert (= (and b!779127 (not res!527129)) b!779130))

(declare-fun m!722671 () Bool)

(assert (=> b!779133 m!722671))

(assert (=> b!779133 m!722671))

(declare-fun m!722673 () Bool)

(assert (=> b!779133 m!722673))

(assert (=> b!779135 m!722671))

(assert (=> b!779135 m!722671))

(declare-fun m!722675 () Bool)

(assert (=> b!779135 m!722675))

(declare-fun m!722677 () Bool)

(assert (=> b!779128 m!722677))

(declare-fun m!722679 () Bool)

(assert (=> b!779132 m!722679))

(declare-fun m!722681 () Bool)

(assert (=> b!779122 m!722681))

(declare-fun m!722683 () Bool)

(assert (=> b!779122 m!722683))

(declare-fun m!722685 () Bool)

(assert (=> b!779122 m!722685))

(declare-fun m!722687 () Bool)

(assert (=> b!779122 m!722687))

(declare-fun m!722689 () Bool)

(assert (=> b!779122 m!722689))

(assert (=> b!779122 m!722681))

(declare-fun m!722691 () Bool)

(assert (=> b!779125 m!722691))

(declare-fun m!722693 () Bool)

(assert (=> b!779124 m!722693))

(declare-fun m!722695 () Bool)

(assert (=> b!779126 m!722695))

(declare-fun m!722697 () Bool)

(assert (=> b!779127 m!722697))

(declare-fun m!722699 () Bool)

(assert (=> b!779127 m!722699))

(assert (=> b!779130 m!722671))

(assert (=> b!779130 m!722671))

(declare-fun m!722701 () Bool)

(assert (=> b!779130 m!722701))

(assert (=> b!779134 m!722671))

(assert (=> b!779134 m!722671))

(declare-fun m!722703 () Bool)

(assert (=> b!779134 m!722703))

(assert (=> b!779139 m!722671))

(assert (=> b!779139 m!722671))

(declare-fun m!722705 () Bool)

(assert (=> b!779139 m!722705))

(declare-fun m!722707 () Bool)

(assert (=> start!67360 m!722707))

(declare-fun m!722709 () Bool)

(assert (=> start!67360 m!722709))

(assert (=> b!779123 m!722671))

(assert (=> b!779123 m!722671))

(assert (=> b!779123 m!722701))

(assert (=> b!779138 m!722671))

(assert (=> b!779138 m!722671))

(declare-fun m!722711 () Bool)

(assert (=> b!779138 m!722711))

(assert (=> b!779138 m!722711))

(assert (=> b!779138 m!722671))

(declare-fun m!722713 () Bool)

(assert (=> b!779138 m!722713))

(declare-fun m!722715 () Bool)

(assert (=> b!779131 m!722715))

(push 1)

