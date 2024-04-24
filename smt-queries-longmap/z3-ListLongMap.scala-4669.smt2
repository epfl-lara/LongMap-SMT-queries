; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65058 () Bool)

(assert start!65058)

(declare-fun b!733669 () Bool)

(declare-fun e!410596 () Bool)

(assert (=> b!733669 (= e!410596 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41239 0))(
  ( (array!41240 (arr!19732 (Array (_ BitVec 32) (_ BitVec 64))) (size!20152 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41239)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7288 0))(
  ( (MissingZero!7288 (index!31520 (_ BitVec 32))) (Found!7288 (index!31521 (_ BitVec 32))) (Intermediate!7288 (undefined!8100 Bool) (index!31522 (_ BitVec 32)) (x!62674 (_ BitVec 32))) (Undefined!7288) (MissingVacant!7288 (index!31523 (_ BitVec 32))) )
))
(declare-fun lt!325140 () SeekEntryResult!7288)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41239 (_ BitVec 32)) SeekEntryResult!7288)

(assert (=> b!733669 (= lt!325140 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19732 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733670 () Bool)

(declare-fun e!410598 () Bool)

(declare-fun e!410597 () Bool)

(assert (=> b!733670 (= e!410598 e!410597)))

(declare-fun res!492780 () Bool)

(assert (=> b!733670 (=> (not res!492780) (not e!410597))))

(declare-fun lt!325137 () SeekEntryResult!7288)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!733670 (= res!492780 (or (= lt!325137 (MissingZero!7288 i!1173)) (= lt!325137 (MissingVacant!7288 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41239 (_ BitVec 32)) SeekEntryResult!7288)

(assert (=> b!733670 (= lt!325137 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!733671 () Bool)

(declare-fun res!492784 () Bool)

(assert (=> b!733671 (=> (not res!492784) (not e!410598))))

(assert (=> b!733671 (= res!492784 (and (= (size!20152 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20152 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20152 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733672 () Bool)

(declare-fun res!492778 () Bool)

(assert (=> b!733672 (=> (not res!492778) (not e!410598))))

(declare-fun arrayContainsKey!0 (array!41239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733672 (= res!492778 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!492769 () Bool)

(assert (=> start!65058 (=> (not res!492769) (not e!410598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65058 (= res!492769 (validMask!0 mask!3328))))

(assert (=> start!65058 e!410598))

(assert (=> start!65058 true))

(declare-fun array_inv!15591 (array!41239) Bool)

(assert (=> start!65058 (array_inv!15591 a!3186)))

(declare-fun b!733673 () Bool)

(declare-fun e!410592 () Bool)

(assert (=> b!733673 (= e!410592 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19732 a!3186) j!159) a!3186 mask!3328) (Found!7288 j!159)))))

(declare-fun b!733674 () Bool)

(declare-fun res!492781 () Bool)

(assert (=> b!733674 (=> (not res!492781) (not e!410598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733674 (= res!492781 (validKeyInArray!0 k0!2102))))

(declare-fun lt!325132 () SeekEntryResult!7288)

(declare-fun b!733675 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!410594 () Bool)

(assert (=> b!733675 (= e!410594 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19732 a!3186) j!159) a!3186 mask!3328) lt!325132))))

(declare-fun b!733676 () Bool)

(declare-fun res!492774 () Bool)

(assert (=> b!733676 (=> (not res!492774) (not e!410598))))

(assert (=> b!733676 (= res!492774 (validKeyInArray!0 (select (arr!19732 a!3186) j!159)))))

(declare-fun b!733677 () Bool)

(declare-fun lt!325138 () SeekEntryResult!7288)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41239 (_ BitVec 32)) SeekEntryResult!7288)

(assert (=> b!733677 (= e!410592 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19732 a!3186) j!159) a!3186 mask!3328) lt!325138))))

(declare-fun b!733678 () Bool)

(declare-fun res!492775 () Bool)

(assert (=> b!733678 (=> (not res!492775) (not e!410597))))

(assert (=> b!733678 (= res!492775 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20152 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20152 a!3186))))))

(declare-fun b!733679 () Bool)

(declare-fun res!492782 () Bool)

(declare-fun e!410591 () Bool)

(assert (=> b!733679 (=> (not res!492782) (not e!410591))))

(assert (=> b!733679 (= res!492782 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19732 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733680 () Bool)

(declare-fun res!492777 () Bool)

(assert (=> b!733680 (=> (not res!492777) (not e!410597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41239 (_ BitVec 32)) Bool)

(assert (=> b!733680 (= res!492777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733681 () Bool)

(declare-fun e!410593 () Bool)

(declare-fun e!410595 () Bool)

(assert (=> b!733681 (= e!410593 (not e!410595))))

(declare-fun res!492771 () Bool)

(assert (=> b!733681 (=> res!492771 e!410595)))

(declare-fun lt!325134 () SeekEntryResult!7288)

(get-info :version)

(assert (=> b!733681 (= res!492771 (or (not ((_ is Intermediate!7288) lt!325134)) (bvsge x!1131 (x!62674 lt!325134))))))

(declare-fun e!410590 () Bool)

(assert (=> b!733681 e!410590))

(declare-fun res!492773 () Bool)

(assert (=> b!733681 (=> (not res!492773) (not e!410590))))

(assert (=> b!733681 (= res!492773 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24973 0))(
  ( (Unit!24974) )
))
(declare-fun lt!325136 () Unit!24973)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24973)

(assert (=> b!733681 (= lt!325136 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733682 () Bool)

(declare-fun res!492772 () Bool)

(assert (=> b!733682 (=> (not res!492772) (not e!410597))))

(declare-datatypes ((List!13641 0))(
  ( (Nil!13638) (Cons!13637 (h!14709 (_ BitVec 64)) (t!19948 List!13641)) )
))
(declare-fun arrayNoDuplicates!0 (array!41239 (_ BitVec 32) List!13641) Bool)

(assert (=> b!733682 (= res!492772 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13638))))

(declare-fun b!733683 () Bool)

(assert (=> b!733683 (= e!410597 e!410591)))

(declare-fun res!492776 () Bool)

(assert (=> b!733683 (=> (not res!492776) (not e!410591))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733683 (= res!492776 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19732 a!3186) j!159) mask!3328) (select (arr!19732 a!3186) j!159) a!3186 mask!3328) lt!325138))))

(assert (=> b!733683 (= lt!325138 (Intermediate!7288 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733684 () Bool)

(declare-fun res!492770 () Bool)

(assert (=> b!733684 (=> (not res!492770) (not e!410591))))

(assert (=> b!733684 (= res!492770 e!410592)))

(declare-fun c!80831 () Bool)

(assert (=> b!733684 (= c!80831 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733685 () Bool)

(assert (=> b!733685 (= e!410591 e!410593)))

(declare-fun res!492783 () Bool)

(assert (=> b!733685 (=> (not res!492783) (not e!410593))))

(declare-fun lt!325131 () SeekEntryResult!7288)

(assert (=> b!733685 (= res!492783 (= lt!325131 lt!325134))))

(declare-fun lt!325139 () array!41239)

(declare-fun lt!325133 () (_ BitVec 64))

(assert (=> b!733685 (= lt!325134 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325133 lt!325139 mask!3328))))

(assert (=> b!733685 (= lt!325131 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325133 mask!3328) lt!325133 lt!325139 mask!3328))))

(assert (=> b!733685 (= lt!325133 (select (store (arr!19732 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!733685 (= lt!325139 (array!41240 (store (arr!19732 a!3186) i!1173 k0!2102) (size!20152 a!3186)))))

(declare-fun b!733686 () Bool)

(assert (=> b!733686 (= e!410595 e!410596)))

(declare-fun res!492768 () Bool)

(assert (=> b!733686 (=> res!492768 e!410596)))

(assert (=> b!733686 (= res!492768 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325135 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733686 (= lt!325135 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!733687 () Bool)

(assert (=> b!733687 (= e!410590 e!410594)))

(declare-fun res!492779 () Bool)

(assert (=> b!733687 (=> (not res!492779) (not e!410594))))

(assert (=> b!733687 (= res!492779 (= (seekEntryOrOpen!0 (select (arr!19732 a!3186) j!159) a!3186 mask!3328) lt!325132))))

(assert (=> b!733687 (= lt!325132 (Found!7288 j!159))))

(assert (= (and start!65058 res!492769) b!733671))

(assert (= (and b!733671 res!492784) b!733676))

(assert (= (and b!733676 res!492774) b!733674))

(assert (= (and b!733674 res!492781) b!733672))

(assert (= (and b!733672 res!492778) b!733670))

(assert (= (and b!733670 res!492780) b!733680))

(assert (= (and b!733680 res!492777) b!733682))

(assert (= (and b!733682 res!492772) b!733678))

(assert (= (and b!733678 res!492775) b!733683))

(assert (= (and b!733683 res!492776) b!733679))

(assert (= (and b!733679 res!492782) b!733684))

(assert (= (and b!733684 c!80831) b!733677))

(assert (= (and b!733684 (not c!80831)) b!733673))

(assert (= (and b!733684 res!492770) b!733685))

(assert (= (and b!733685 res!492783) b!733681))

(assert (= (and b!733681 res!492773) b!733687))

(assert (= (and b!733687 res!492779) b!733675))

(assert (= (and b!733681 (not res!492771)) b!733686))

(assert (= (and b!733686 (not res!492768)) b!733669))

(declare-fun m!687051 () Bool)

(assert (=> b!733670 m!687051))

(declare-fun m!687053 () Bool)

(assert (=> b!733679 m!687053))

(declare-fun m!687055 () Bool)

(assert (=> b!733673 m!687055))

(assert (=> b!733673 m!687055))

(declare-fun m!687057 () Bool)

(assert (=> b!733673 m!687057))

(assert (=> b!733683 m!687055))

(assert (=> b!733683 m!687055))

(declare-fun m!687059 () Bool)

(assert (=> b!733683 m!687059))

(assert (=> b!733683 m!687059))

(assert (=> b!733683 m!687055))

(declare-fun m!687061 () Bool)

(assert (=> b!733683 m!687061))

(assert (=> b!733676 m!687055))

(assert (=> b!733676 m!687055))

(declare-fun m!687063 () Bool)

(assert (=> b!733676 m!687063))

(declare-fun m!687065 () Bool)

(assert (=> b!733680 m!687065))

(assert (=> b!733675 m!687055))

(assert (=> b!733675 m!687055))

(declare-fun m!687067 () Bool)

(assert (=> b!733675 m!687067))

(declare-fun m!687069 () Bool)

(assert (=> b!733681 m!687069))

(declare-fun m!687071 () Bool)

(assert (=> b!733681 m!687071))

(assert (=> b!733677 m!687055))

(assert (=> b!733677 m!687055))

(declare-fun m!687073 () Bool)

(assert (=> b!733677 m!687073))

(declare-fun m!687075 () Bool)

(assert (=> b!733674 m!687075))

(declare-fun m!687077 () Bool)

(assert (=> b!733685 m!687077))

(assert (=> b!733685 m!687077))

(declare-fun m!687079 () Bool)

(assert (=> b!733685 m!687079))

(declare-fun m!687081 () Bool)

(assert (=> b!733685 m!687081))

(declare-fun m!687083 () Bool)

(assert (=> b!733685 m!687083))

(declare-fun m!687085 () Bool)

(assert (=> b!733685 m!687085))

(declare-fun m!687087 () Bool)

(assert (=> b!733682 m!687087))

(assert (=> b!733687 m!687055))

(assert (=> b!733687 m!687055))

(declare-fun m!687089 () Bool)

(assert (=> b!733687 m!687089))

(assert (=> b!733669 m!687055))

(assert (=> b!733669 m!687055))

(assert (=> b!733669 m!687057))

(declare-fun m!687091 () Bool)

(assert (=> start!65058 m!687091))

(declare-fun m!687093 () Bool)

(assert (=> start!65058 m!687093))

(declare-fun m!687095 () Bool)

(assert (=> b!733686 m!687095))

(declare-fun m!687097 () Bool)

(assert (=> b!733672 m!687097))

(check-sat (not b!733682) (not b!733675) (not b!733669) (not b!733681) (not b!733676) (not b!733670) (not b!733673) (not b!733672) (not b!733685) (not b!733686) (not b!733677) (not b!733674) (not b!733680) (not b!733683) (not b!733687) (not start!65058))
(check-sat)
