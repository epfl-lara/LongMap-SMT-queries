; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64922 () Bool)

(assert start!64922)

(declare-fun res!492672 () Bool)

(declare-fun e!410139 () Bool)

(assert (=> start!64922 (=> (not res!492672) (not e!410139))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64922 (= res!492672 (validMask!0 mask!3328))))

(assert (=> start!64922 e!410139))

(assert (=> start!64922 true))

(declare-datatypes ((array!41250 0))(
  ( (array!41251 (arr!19742 (Array (_ BitVec 32) (_ BitVec 64))) (size!20163 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41250)

(declare-fun array_inv!15625 (array!41250) Bool)

(assert (=> start!64922 (array_inv!15625 a!3186)))

(declare-datatypes ((SeekEntryResult!7339 0))(
  ( (MissingZero!7339 (index!31724 (_ BitVec 32))) (Found!7339 (index!31725 (_ BitVec 32))) (Intermediate!7339 (undefined!8151 Bool) (index!31726 (_ BitVec 32)) (x!62724 (_ BitVec 32))) (Undefined!7339) (MissingVacant!7339 (index!31727 (_ BitVec 32))) )
))
(declare-fun lt!324751 () SeekEntryResult!7339)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!733025 () Bool)

(declare-fun e!410143 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41250 (_ BitVec 32)) SeekEntryResult!7339)

(assert (=> b!733025 (= e!410143 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19742 a!3186) j!159) a!3186 mask!3328) lt!324751))))

(declare-fun b!733026 () Bool)

(declare-fun res!492684 () Bool)

(declare-fun e!410141 () Bool)

(assert (=> b!733026 (=> (not res!492684) (not e!410141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41250 (_ BitVec 32)) Bool)

(assert (=> b!733026 (= res!492684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733027 () Bool)

(declare-fun res!492674 () Bool)

(assert (=> b!733027 (=> (not res!492674) (not e!410139))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!733027 (= res!492674 (and (= (size!20163 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20163 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20163 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733028 () Bool)

(declare-fun e!410145 () Bool)

(declare-fun e!410146 () Bool)

(assert (=> b!733028 (= e!410145 e!410146)))

(declare-fun res!492670 () Bool)

(assert (=> b!733028 (=> (not res!492670) (not e!410146))))

(declare-fun lt!324757 () SeekEntryResult!7339)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41250 (_ BitVec 32)) SeekEntryResult!7339)

(assert (=> b!733028 (= res!492670 (= (seekEntryOrOpen!0 (select (arr!19742 a!3186) j!159) a!3186 mask!3328) lt!324757))))

(assert (=> b!733028 (= lt!324757 (Found!7339 j!159))))

(declare-fun b!733029 () Bool)

(declare-fun res!492677 () Bool)

(declare-fun e!410137 () Bool)

(assert (=> b!733029 (=> (not res!492677) (not e!410137))))

(assert (=> b!733029 (= res!492677 e!410143)))

(declare-fun c!80556 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733029 (= c!80556 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733030 () Bool)

(declare-fun res!492682 () Bool)

(assert (=> b!733030 (=> (not res!492682) (not e!410141))))

(declare-datatypes ((List!13783 0))(
  ( (Nil!13780) (Cons!13779 (h!14845 (_ BitVec 64)) (t!20089 List!13783)) )
))
(declare-fun arrayNoDuplicates!0 (array!41250 (_ BitVec 32) List!13783) Bool)

(assert (=> b!733030 (= res!492682 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13780))))

(declare-fun b!733031 () Bool)

(declare-fun res!492668 () Bool)

(assert (=> b!733031 (=> (not res!492668) (not e!410137))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!733031 (= res!492668 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19742 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733032 () Bool)

(declare-fun res!492678 () Bool)

(assert (=> b!733032 (=> (not res!492678) (not e!410141))))

(assert (=> b!733032 (= res!492678 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20163 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20163 a!3186))))))

(declare-fun b!733033 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41250 (_ BitVec 32)) SeekEntryResult!7339)

(assert (=> b!733033 (= e!410143 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19742 a!3186) j!159) a!3186 mask!3328) (Found!7339 j!159)))))

(declare-fun b!733034 () Bool)

(declare-fun res!492676 () Bool)

(assert (=> b!733034 (=> (not res!492676) (not e!410139))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733034 (= res!492676 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733035 () Bool)

(declare-fun e!410142 () Bool)

(declare-fun e!410140 () Bool)

(assert (=> b!733035 (= e!410142 (not e!410140))))

(declare-fun res!492669 () Bool)

(assert (=> b!733035 (=> res!492669 e!410140)))

(declare-fun lt!324750 () SeekEntryResult!7339)

(get-info :version)

(assert (=> b!733035 (= res!492669 (or (not ((_ is Intermediate!7339) lt!324750)) (bvsge x!1131 (x!62724 lt!324750))))))

(assert (=> b!733035 e!410145))

(declare-fun res!492683 () Bool)

(assert (=> b!733035 (=> (not res!492683) (not e!410145))))

(assert (=> b!733035 (= res!492683 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24968 0))(
  ( (Unit!24969) )
))
(declare-fun lt!324749 () Unit!24968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24968)

(assert (=> b!733035 (= lt!324749 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733036 () Bool)

(assert (=> b!733036 (= e!410146 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19742 a!3186) j!159) a!3186 mask!3328) lt!324757))))

(declare-fun b!733037 () Bool)

(declare-fun e!410138 () Bool)

(assert (=> b!733037 (= e!410140 e!410138)))

(declare-fun res!492679 () Bool)

(assert (=> b!733037 (=> res!492679 e!410138)))

(assert (=> b!733037 (= res!492679 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324755 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733037 (= lt!324755 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!733038 () Bool)

(assert (=> b!733038 (= e!410137 e!410142)))

(declare-fun res!492675 () Bool)

(assert (=> b!733038 (=> (not res!492675) (not e!410142))))

(declare-fun lt!324752 () SeekEntryResult!7339)

(assert (=> b!733038 (= res!492675 (= lt!324752 lt!324750))))

(declare-fun lt!324753 () array!41250)

(declare-fun lt!324754 () (_ BitVec 64))

(assert (=> b!733038 (= lt!324750 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324754 lt!324753 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733038 (= lt!324752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324754 mask!3328) lt!324754 lt!324753 mask!3328))))

(assert (=> b!733038 (= lt!324754 (select (store (arr!19742 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!733038 (= lt!324753 (array!41251 (store (arr!19742 a!3186) i!1173 k0!2102) (size!20163 a!3186)))))

(declare-fun b!733039 () Bool)

(assert (=> b!733039 (= e!410139 e!410141)))

(declare-fun res!492680 () Bool)

(assert (=> b!733039 (=> (not res!492680) (not e!410141))))

(declare-fun lt!324756 () SeekEntryResult!7339)

(assert (=> b!733039 (= res!492680 (or (= lt!324756 (MissingZero!7339 i!1173)) (= lt!324756 (MissingVacant!7339 i!1173))))))

(assert (=> b!733039 (= lt!324756 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!733040 () Bool)

(assert (=> b!733040 (= e!410141 e!410137)))

(declare-fun res!492681 () Bool)

(assert (=> b!733040 (=> (not res!492681) (not e!410137))))

(assert (=> b!733040 (= res!492681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19742 a!3186) j!159) mask!3328) (select (arr!19742 a!3186) j!159) a!3186 mask!3328) lt!324751))))

(assert (=> b!733040 (= lt!324751 (Intermediate!7339 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733041 () Bool)

(declare-fun res!492673 () Bool)

(assert (=> b!733041 (=> (not res!492673) (not e!410139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733041 (= res!492673 (validKeyInArray!0 k0!2102))))

(declare-fun b!733042 () Bool)

(assert (=> b!733042 (= e!410138 true)))

(declare-fun lt!324758 () SeekEntryResult!7339)

(assert (=> b!733042 (= lt!324758 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19742 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733043 () Bool)

(declare-fun res!492671 () Bool)

(assert (=> b!733043 (=> (not res!492671) (not e!410139))))

(assert (=> b!733043 (= res!492671 (validKeyInArray!0 (select (arr!19742 a!3186) j!159)))))

(assert (= (and start!64922 res!492672) b!733027))

(assert (= (and b!733027 res!492674) b!733043))

(assert (= (and b!733043 res!492671) b!733041))

(assert (= (and b!733041 res!492673) b!733034))

(assert (= (and b!733034 res!492676) b!733039))

(assert (= (and b!733039 res!492680) b!733026))

(assert (= (and b!733026 res!492684) b!733030))

(assert (= (and b!733030 res!492682) b!733032))

(assert (= (and b!733032 res!492678) b!733040))

(assert (= (and b!733040 res!492681) b!733031))

(assert (= (and b!733031 res!492668) b!733029))

(assert (= (and b!733029 c!80556) b!733025))

(assert (= (and b!733029 (not c!80556)) b!733033))

(assert (= (and b!733029 res!492677) b!733038))

(assert (= (and b!733038 res!492675) b!733035))

(assert (= (and b!733035 res!492683) b!733028))

(assert (= (and b!733028 res!492670) b!733036))

(assert (= (and b!733035 (not res!492669)) b!733037))

(assert (= (and b!733037 (not res!492679)) b!733042))

(declare-fun m!685433 () Bool)

(assert (=> b!733042 m!685433))

(assert (=> b!733042 m!685433))

(declare-fun m!685435 () Bool)

(assert (=> b!733042 m!685435))

(declare-fun m!685437 () Bool)

(assert (=> b!733034 m!685437))

(assert (=> b!733033 m!685433))

(assert (=> b!733033 m!685433))

(assert (=> b!733033 m!685435))

(declare-fun m!685439 () Bool)

(assert (=> b!733037 m!685439))

(assert (=> b!733036 m!685433))

(assert (=> b!733036 m!685433))

(declare-fun m!685441 () Bool)

(assert (=> b!733036 m!685441))

(assert (=> b!733028 m!685433))

(assert (=> b!733028 m!685433))

(declare-fun m!685443 () Bool)

(assert (=> b!733028 m!685443))

(declare-fun m!685445 () Bool)

(assert (=> b!733035 m!685445))

(declare-fun m!685447 () Bool)

(assert (=> b!733035 m!685447))

(declare-fun m!685449 () Bool)

(assert (=> b!733026 m!685449))

(declare-fun m!685451 () Bool)

(assert (=> start!64922 m!685451))

(declare-fun m!685453 () Bool)

(assert (=> start!64922 m!685453))

(assert (=> b!733043 m!685433))

(assert (=> b!733043 m!685433))

(declare-fun m!685455 () Bool)

(assert (=> b!733043 m!685455))

(assert (=> b!733040 m!685433))

(assert (=> b!733040 m!685433))

(declare-fun m!685457 () Bool)

(assert (=> b!733040 m!685457))

(assert (=> b!733040 m!685457))

(assert (=> b!733040 m!685433))

(declare-fun m!685459 () Bool)

(assert (=> b!733040 m!685459))

(declare-fun m!685461 () Bool)

(assert (=> b!733031 m!685461))

(declare-fun m!685463 () Bool)

(assert (=> b!733030 m!685463))

(declare-fun m!685465 () Bool)

(assert (=> b!733039 m!685465))

(assert (=> b!733025 m!685433))

(assert (=> b!733025 m!685433))

(declare-fun m!685467 () Bool)

(assert (=> b!733025 m!685467))

(declare-fun m!685469 () Bool)

(assert (=> b!733041 m!685469))

(declare-fun m!685471 () Bool)

(assert (=> b!733038 m!685471))

(declare-fun m!685473 () Bool)

(assert (=> b!733038 m!685473))

(declare-fun m!685475 () Bool)

(assert (=> b!733038 m!685475))

(declare-fun m!685477 () Bool)

(assert (=> b!733038 m!685477))

(declare-fun m!685479 () Bool)

(assert (=> b!733038 m!685479))

(assert (=> b!733038 m!685473))

(check-sat (not b!733035) (not b!733033) (not b!733025) (not b!733036) (not b!733039) (not b!733041) (not b!733030) (not b!733038) (not b!733034) (not start!64922) (not b!733042) (not b!733026) (not b!733040) (not b!733043) (not b!733037) (not b!733028))
(check-sat)
