; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67964 () Bool)

(assert start!67964)

(declare-fun b!790693 () Bool)

(declare-fun res!535645 () Bool)

(declare-fun e!439449 () Bool)

(assert (=> b!790693 (=> (not res!535645) (not e!439449))))

(declare-datatypes ((array!42897 0))(
  ( (array!42898 (arr!20534 (Array (_ BitVec 32) (_ BitVec 64))) (size!20955 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42897)

(declare-datatypes ((List!14575 0))(
  ( (Nil!14572) (Cons!14571 (h!15700 (_ BitVec 64)) (t!20881 List!14575)) )
))
(declare-fun arrayNoDuplicates!0 (array!42897 (_ BitVec 32) List!14575) Bool)

(assert (=> b!790693 (= res!535645 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14572))))

(declare-fun b!790694 () Bool)

(declare-fun res!535644 () Bool)

(assert (=> b!790694 (=> (not res!535644) (not e!439449))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!790694 (= res!535644 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20955 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20955 a!3186))))))

(declare-fun b!790695 () Bool)

(declare-fun e!439450 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8131 0))(
  ( (MissingZero!8131 (index!34892 (_ BitVec 32))) (Found!8131 (index!34893 (_ BitVec 32))) (Intermediate!8131 (undefined!8943 Bool) (index!34894 (_ BitVec 32)) (x!65844 (_ BitVec 32))) (Undefined!8131) (MissingVacant!8131 (index!34895 (_ BitVec 32))) )
))
(declare-fun lt!352846 () SeekEntryResult!8131)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42897 (_ BitVec 32)) SeekEntryResult!8131)

(assert (=> b!790695 (= e!439450 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20534 a!3186) j!159) a!3186 mask!3328) lt!352846))))

(declare-fun b!790696 () Bool)

(declare-fun res!535639 () Bool)

(declare-fun e!439451 () Bool)

(assert (=> b!790696 (=> (not res!535639) (not e!439451))))

(assert (=> b!790696 (= res!535639 e!439450)))

(declare-fun c!87939 () Bool)

(assert (=> b!790696 (= c!87939 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!535650 () Bool)

(declare-fun e!439455 () Bool)

(assert (=> start!67964 (=> (not res!535650) (not e!439455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67964 (= res!535650 (validMask!0 mask!3328))))

(assert (=> start!67964 e!439455))

(assert (=> start!67964 true))

(declare-fun array_inv!16417 (array!42897) Bool)

(assert (=> start!67964 (array_inv!16417 a!3186)))

(declare-fun b!790697 () Bool)

(assert (=> b!790697 (= e!439455 e!439449)))

(declare-fun res!535647 () Bool)

(assert (=> b!790697 (=> (not res!535647) (not e!439449))))

(declare-fun lt!352843 () SeekEntryResult!8131)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790697 (= res!535647 (or (= lt!352843 (MissingZero!8131 i!1173)) (= lt!352843 (MissingVacant!8131 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42897 (_ BitVec 32)) SeekEntryResult!8131)

(assert (=> b!790697 (= lt!352843 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!790698 () Bool)

(declare-fun res!535641 () Bool)

(assert (=> b!790698 (=> (not res!535641) (not e!439455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790698 (= res!535641 (validKeyInArray!0 (select (arr!20534 a!3186) j!159)))))

(declare-fun b!790699 () Bool)

(declare-fun e!439453 () Bool)

(assert (=> b!790699 (= e!439451 e!439453)))

(declare-fun res!535643 () Bool)

(assert (=> b!790699 (=> (not res!535643) (not e!439453))))

(declare-fun lt!352842 () array!42897)

(declare-fun lt!352847 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790699 (= res!535643 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352847 mask!3328) lt!352847 lt!352842 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352847 lt!352842 mask!3328)))))

(assert (=> b!790699 (= lt!352847 (select (store (arr!20534 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!790699 (= lt!352842 (array!42898 (store (arr!20534 a!3186) i!1173 k0!2102) (size!20955 a!3186)))))

(declare-fun b!790700 () Bool)

(declare-fun res!535649 () Bool)

(assert (=> b!790700 (=> (not res!535649) (not e!439455))))

(assert (=> b!790700 (= res!535649 (and (= (size!20955 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20955 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20955 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790701 () Bool)

(declare-fun e!439456 () Bool)

(declare-fun lt!352844 () SeekEntryResult!8131)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42897 (_ BitVec 32)) SeekEntryResult!8131)

(assert (=> b!790701 (= e!439456 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20534 a!3186) j!159) a!3186 mask!3328) lt!352844))))

(declare-fun b!790702 () Bool)

(declare-fun e!439454 () Bool)

(assert (=> b!790702 (= e!439454 e!439456)))

(declare-fun res!535646 () Bool)

(assert (=> b!790702 (=> (not res!535646) (not e!439456))))

(assert (=> b!790702 (= res!535646 (= (seekEntryOrOpen!0 (select (arr!20534 a!3186) j!159) a!3186 mask!3328) lt!352844))))

(assert (=> b!790702 (= lt!352844 (Found!8131 j!159))))

(declare-fun b!790703 () Bool)

(declare-fun res!535640 () Bool)

(assert (=> b!790703 (=> (not res!535640) (not e!439449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42897 (_ BitVec 32)) Bool)

(assert (=> b!790703 (= res!535640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790704 () Bool)

(assert (=> b!790704 (= e!439453 (not true))))

(assert (=> b!790704 e!439454))

(declare-fun res!535637 () Bool)

(assert (=> b!790704 (=> (not res!535637) (not e!439454))))

(assert (=> b!790704 (= res!535637 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27386 0))(
  ( (Unit!27387) )
))
(declare-fun lt!352845 () Unit!27386)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42897 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27386)

(assert (=> b!790704 (= lt!352845 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790705 () Bool)

(assert (=> b!790705 (= e!439450 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20534 a!3186) j!159) a!3186 mask!3328) (Found!8131 j!159)))))

(declare-fun b!790706 () Bool)

(declare-fun res!535648 () Bool)

(assert (=> b!790706 (=> (not res!535648) (not e!439455))))

(declare-fun arrayContainsKey!0 (array!42897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790706 (= res!535648 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790707 () Bool)

(declare-fun res!535642 () Bool)

(assert (=> b!790707 (=> (not res!535642) (not e!439451))))

(assert (=> b!790707 (= res!535642 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20534 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790708 () Bool)

(assert (=> b!790708 (= e!439449 e!439451)))

(declare-fun res!535638 () Bool)

(assert (=> b!790708 (=> (not res!535638) (not e!439451))))

(assert (=> b!790708 (= res!535638 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20534 a!3186) j!159) mask!3328) (select (arr!20534 a!3186) j!159) a!3186 mask!3328) lt!352846))))

(assert (=> b!790708 (= lt!352846 (Intermediate!8131 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790709 () Bool)

(declare-fun res!535636 () Bool)

(assert (=> b!790709 (=> (not res!535636) (not e!439455))))

(assert (=> b!790709 (= res!535636 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67964 res!535650) b!790700))

(assert (= (and b!790700 res!535649) b!790698))

(assert (= (and b!790698 res!535641) b!790709))

(assert (= (and b!790709 res!535636) b!790706))

(assert (= (and b!790706 res!535648) b!790697))

(assert (= (and b!790697 res!535647) b!790703))

(assert (= (and b!790703 res!535640) b!790693))

(assert (= (and b!790693 res!535645) b!790694))

(assert (= (and b!790694 res!535644) b!790708))

(assert (= (and b!790708 res!535638) b!790707))

(assert (= (and b!790707 res!535642) b!790696))

(assert (= (and b!790696 c!87939) b!790695))

(assert (= (and b!790696 (not c!87939)) b!790705))

(assert (= (and b!790696 res!535639) b!790699))

(assert (= (and b!790699 res!535643) b!790704))

(assert (= (and b!790704 res!535637) b!790702))

(assert (= (and b!790702 res!535646) b!790701))

(declare-fun m!730971 () Bool)

(assert (=> b!790706 m!730971))

(declare-fun m!730973 () Bool)

(assert (=> start!67964 m!730973))

(declare-fun m!730975 () Bool)

(assert (=> start!67964 m!730975))

(declare-fun m!730977 () Bool)

(assert (=> b!790701 m!730977))

(assert (=> b!790701 m!730977))

(declare-fun m!730979 () Bool)

(assert (=> b!790701 m!730979))

(assert (=> b!790705 m!730977))

(assert (=> b!790705 m!730977))

(declare-fun m!730981 () Bool)

(assert (=> b!790705 m!730981))

(assert (=> b!790698 m!730977))

(assert (=> b!790698 m!730977))

(declare-fun m!730983 () Bool)

(assert (=> b!790698 m!730983))

(declare-fun m!730985 () Bool)

(assert (=> b!790703 m!730985))

(assert (=> b!790708 m!730977))

(assert (=> b!790708 m!730977))

(declare-fun m!730987 () Bool)

(assert (=> b!790708 m!730987))

(assert (=> b!790708 m!730987))

(assert (=> b!790708 m!730977))

(declare-fun m!730989 () Bool)

(assert (=> b!790708 m!730989))

(declare-fun m!730991 () Bool)

(assert (=> b!790693 m!730991))

(declare-fun m!730993 () Bool)

(assert (=> b!790707 m!730993))

(declare-fun m!730995 () Bool)

(assert (=> b!790697 m!730995))

(assert (=> b!790695 m!730977))

(assert (=> b!790695 m!730977))

(declare-fun m!730997 () Bool)

(assert (=> b!790695 m!730997))

(declare-fun m!730999 () Bool)

(assert (=> b!790704 m!730999))

(declare-fun m!731001 () Bool)

(assert (=> b!790704 m!731001))

(declare-fun m!731003 () Bool)

(assert (=> b!790709 m!731003))

(declare-fun m!731005 () Bool)

(assert (=> b!790699 m!731005))

(assert (=> b!790699 m!731005))

(declare-fun m!731007 () Bool)

(assert (=> b!790699 m!731007))

(declare-fun m!731009 () Bool)

(assert (=> b!790699 m!731009))

(declare-fun m!731011 () Bool)

(assert (=> b!790699 m!731011))

(declare-fun m!731013 () Bool)

(assert (=> b!790699 m!731013))

(assert (=> b!790702 m!730977))

(assert (=> b!790702 m!730977))

(declare-fun m!731015 () Bool)

(assert (=> b!790702 m!731015))

(check-sat (not b!790695) (not b!790704) (not b!790698) (not b!790697) (not b!790709) (not b!790706) (not b!790708) (not b!790693) (not b!790699) (not b!790702) (not b!790701) (not b!790705) (not start!67964) (not b!790703))
(check-sat)
