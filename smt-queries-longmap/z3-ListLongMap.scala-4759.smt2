; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65616 () Bool)

(assert start!65616)

(declare-fun b!750705 () Bool)

(declare-datatypes ((Unit!25812 0))(
  ( (Unit!25813) )
))
(declare-fun e!418827 () Unit!25812)

(declare-fun Unit!25814 () Unit!25812)

(assert (=> b!750705 (= e!418827 Unit!25814)))

(declare-fun b!750706 () Bool)

(declare-fun res!506721 () Bool)

(declare-fun e!418828 () Bool)

(assert (=> b!750706 (=> (not res!506721) (not e!418828))))

(declare-datatypes ((array!41789 0))(
  ( (array!41790 (arr!20008 (Array (_ BitVec 32) (_ BitVec 64))) (size!20429 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41789)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41789 (_ BitVec 32)) Bool)

(assert (=> b!750706 (= res!506721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750707 () Bool)

(declare-fun e!418826 () Bool)

(assert (=> b!750707 (= e!418826 e!418828)))

(declare-fun res!506714 () Bool)

(assert (=> b!750707 (=> (not res!506714) (not e!418828))))

(declare-datatypes ((SeekEntryResult!7608 0))(
  ( (MissingZero!7608 (index!32800 (_ BitVec 32))) (Found!7608 (index!32801 (_ BitVec 32))) (Intermediate!7608 (undefined!8420 Bool) (index!32802 (_ BitVec 32)) (x!63726 (_ BitVec 32))) (Undefined!7608) (MissingVacant!7608 (index!32803 (_ BitVec 32))) )
))
(declare-fun lt!333817 () SeekEntryResult!7608)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750707 (= res!506714 (or (= lt!333817 (MissingZero!7608 i!1173)) (= lt!333817 (MissingVacant!7608 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41789 (_ BitVec 32)) SeekEntryResult!7608)

(assert (=> b!750707 (= lt!333817 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750708 () Bool)

(declare-fun res!506719 () Bool)

(assert (=> b!750708 (=> (not res!506719) (not e!418826))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750708 (= res!506719 (validKeyInArray!0 (select (arr!20008 a!3186) j!159)))))

(declare-fun b!750709 () Bool)

(declare-fun e!418831 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!333816 () SeekEntryResult!7608)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41789 (_ BitVec 32)) SeekEntryResult!7608)

(assert (=> b!750709 (= e!418831 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20008 a!3186) j!159) a!3186 mask!3328) lt!333816))))

(declare-fun b!750710 () Bool)

(declare-fun res!506718 () Bool)

(declare-fun e!418829 () Bool)

(assert (=> b!750710 (=> (not res!506718) (not e!418829))))

(assert (=> b!750710 (= res!506718 e!418831)))

(declare-fun c!82378 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750710 (= c!82378 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750711 () Bool)

(declare-fun res!506727 () Bool)

(assert (=> b!750711 (=> (not res!506727) (not e!418829))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!750711 (= res!506727 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20008 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750712 () Bool)

(declare-fun e!418830 () Bool)

(assert (=> b!750712 (= e!418830 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!418823 () Bool)

(assert (=> b!750712 e!418823))

(declare-fun res!506722 () Bool)

(assert (=> b!750712 (=> (not res!506722) (not e!418823))))

(declare-fun lt!333815 () (_ BitVec 64))

(assert (=> b!750712 (= res!506722 (= lt!333815 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333823 () Unit!25812)

(assert (=> b!750712 (= lt!333823 e!418827)))

(declare-fun c!82377 () Bool)

(assert (=> b!750712 (= c!82377 (= lt!333815 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750713 () Bool)

(declare-fun res!506723 () Bool)

(declare-fun e!418824 () Bool)

(assert (=> b!750713 (=> res!506723 e!418824)))

(declare-fun lt!333820 () SeekEntryResult!7608)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41789 (_ BitVec 32)) SeekEntryResult!7608)

(assert (=> b!750713 (= res!506723 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20008 a!3186) j!159) a!3186 mask!3328) lt!333820)))))

(declare-fun b!750714 () Bool)

(declare-fun res!506715 () Bool)

(assert (=> b!750714 (=> (not res!506715) (not e!418826))))

(assert (=> b!750714 (= res!506715 (and (= (size!20429 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20429 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20429 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!506712 () Bool)

(assert (=> start!65616 (=> (not res!506712) (not e!418826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65616 (= res!506712 (validMask!0 mask!3328))))

(assert (=> start!65616 e!418826))

(assert (=> start!65616 true))

(declare-fun array_inv!15804 (array!41789) Bool)

(assert (=> start!65616 (array_inv!15804 a!3186)))

(declare-fun b!750715 () Bool)

(assert (=> b!750715 (= e!418828 e!418829)))

(declare-fun res!506716 () Bool)

(assert (=> b!750715 (=> (not res!506716) (not e!418829))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750715 (= res!506716 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20008 a!3186) j!159) mask!3328) (select (arr!20008 a!3186) j!159) a!3186 mask!3328) lt!333816))))

(assert (=> b!750715 (= lt!333816 (Intermediate!7608 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750716 () Bool)

(declare-fun res!506729 () Bool)

(assert (=> b!750716 (=> (not res!506729) (not e!418826))))

(declare-fun arrayContainsKey!0 (array!41789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750716 (= res!506729 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750717 () Bool)

(declare-fun res!506728 () Bool)

(assert (=> b!750717 (=> (not res!506728) (not e!418828))))

(assert (=> b!750717 (= res!506728 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20429 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20429 a!3186))))))

(declare-fun b!750718 () Bool)

(declare-fun e!418825 () Bool)

(assert (=> b!750718 (= e!418825 (not e!418824))))

(declare-fun res!506726 () Bool)

(assert (=> b!750718 (=> res!506726 e!418824)))

(declare-fun lt!333819 () SeekEntryResult!7608)

(get-info :version)

(assert (=> b!750718 (= res!506726 (or (not ((_ is Intermediate!7608) lt!333819)) (bvslt x!1131 (x!63726 lt!333819)) (not (= x!1131 (x!63726 lt!333819))) (not (= index!1321 (index!32802 lt!333819)))))))

(declare-fun e!418822 () Bool)

(assert (=> b!750718 e!418822))

(declare-fun res!506725 () Bool)

(assert (=> b!750718 (=> (not res!506725) (not e!418822))))

(declare-fun lt!333824 () SeekEntryResult!7608)

(assert (=> b!750718 (= res!506725 (= lt!333824 lt!333820))))

(assert (=> b!750718 (= lt!333820 (Found!7608 j!159))))

(assert (=> b!750718 (= lt!333824 (seekEntryOrOpen!0 (select (arr!20008 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!750718 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333822 () Unit!25812)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25812)

(assert (=> b!750718 (= lt!333822 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750719 () Bool)

(declare-fun res!506713 () Bool)

(assert (=> b!750719 (=> (not res!506713) (not e!418828))))

(declare-datatypes ((List!14010 0))(
  ( (Nil!14007) (Cons!14006 (h!15078 (_ BitVec 64)) (t!20325 List!14010)) )
))
(declare-fun arrayNoDuplicates!0 (array!41789 (_ BitVec 32) List!14010) Bool)

(assert (=> b!750719 (= res!506713 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14007))))

(declare-fun b!750720 () Bool)

(assert (=> b!750720 (= e!418822 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20008 a!3186) j!159) a!3186 mask!3328) lt!333820))))

(declare-fun b!750721 () Bool)

(declare-fun res!506720 () Bool)

(assert (=> b!750721 (=> (not res!506720) (not e!418826))))

(assert (=> b!750721 (= res!506720 (validKeyInArray!0 k0!2102))))

(declare-fun b!750722 () Bool)

(assert (=> b!750722 (= e!418824 e!418830)))

(declare-fun res!506717 () Bool)

(assert (=> b!750722 (=> res!506717 e!418830)))

(declare-fun lt!333821 () (_ BitVec 64))

(assert (=> b!750722 (= res!506717 (= lt!333815 lt!333821))))

(assert (=> b!750722 (= lt!333815 (select (store (arr!20008 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750723 () Bool)

(assert (=> b!750723 (= e!418829 e!418825)))

(declare-fun res!506724 () Bool)

(assert (=> b!750723 (=> (not res!506724) (not e!418825))))

(declare-fun lt!333814 () SeekEntryResult!7608)

(assert (=> b!750723 (= res!506724 (= lt!333814 lt!333819))))

(declare-fun lt!333818 () array!41789)

(assert (=> b!750723 (= lt!333819 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333821 lt!333818 mask!3328))))

(assert (=> b!750723 (= lt!333814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333821 mask!3328) lt!333821 lt!333818 mask!3328))))

(assert (=> b!750723 (= lt!333821 (select (store (arr!20008 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750723 (= lt!333818 (array!41790 (store (arr!20008 a!3186) i!1173 k0!2102) (size!20429 a!3186)))))

(declare-fun b!750724 () Bool)

(assert (=> b!750724 (= e!418831 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20008 a!3186) j!159) a!3186 mask!3328) (Found!7608 j!159)))))

(declare-fun b!750725 () Bool)

(declare-fun Unit!25815 () Unit!25812)

(assert (=> b!750725 (= e!418827 Unit!25815)))

(assert (=> b!750725 false))

(declare-fun b!750726 () Bool)

(assert (=> b!750726 (= e!418823 (= (seekEntryOrOpen!0 lt!333821 lt!333818 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333821 lt!333818 mask!3328)))))

(assert (= (and start!65616 res!506712) b!750714))

(assert (= (and b!750714 res!506715) b!750708))

(assert (= (and b!750708 res!506719) b!750721))

(assert (= (and b!750721 res!506720) b!750716))

(assert (= (and b!750716 res!506729) b!750707))

(assert (= (and b!750707 res!506714) b!750706))

(assert (= (and b!750706 res!506721) b!750719))

(assert (= (and b!750719 res!506713) b!750717))

(assert (= (and b!750717 res!506728) b!750715))

(assert (= (and b!750715 res!506716) b!750711))

(assert (= (and b!750711 res!506727) b!750710))

(assert (= (and b!750710 c!82378) b!750709))

(assert (= (and b!750710 (not c!82378)) b!750724))

(assert (= (and b!750710 res!506718) b!750723))

(assert (= (and b!750723 res!506724) b!750718))

(assert (= (and b!750718 res!506725) b!750720))

(assert (= (and b!750718 (not res!506726)) b!750713))

(assert (= (and b!750713 (not res!506723)) b!750722))

(assert (= (and b!750722 (not res!506717)) b!750712))

(assert (= (and b!750712 c!82377) b!750725))

(assert (= (and b!750712 (not c!82377)) b!750705))

(assert (= (and b!750712 res!506722) b!750726))

(declare-fun m!700043 () Bool)

(assert (=> b!750708 m!700043))

(assert (=> b!750708 m!700043))

(declare-fun m!700045 () Bool)

(assert (=> b!750708 m!700045))

(assert (=> b!750713 m!700043))

(assert (=> b!750713 m!700043))

(declare-fun m!700047 () Bool)

(assert (=> b!750713 m!700047))

(assert (=> b!750709 m!700043))

(assert (=> b!750709 m!700043))

(declare-fun m!700049 () Bool)

(assert (=> b!750709 m!700049))

(declare-fun m!700051 () Bool)

(assert (=> b!750722 m!700051))

(declare-fun m!700053 () Bool)

(assert (=> b!750722 m!700053))

(declare-fun m!700055 () Bool)

(assert (=> b!750726 m!700055))

(declare-fun m!700057 () Bool)

(assert (=> b!750726 m!700057))

(declare-fun m!700059 () Bool)

(assert (=> b!750721 m!700059))

(declare-fun m!700061 () Bool)

(assert (=> b!750706 m!700061))

(assert (=> b!750715 m!700043))

(assert (=> b!750715 m!700043))

(declare-fun m!700063 () Bool)

(assert (=> b!750715 m!700063))

(assert (=> b!750715 m!700063))

(assert (=> b!750715 m!700043))

(declare-fun m!700065 () Bool)

(assert (=> b!750715 m!700065))

(declare-fun m!700067 () Bool)

(assert (=> b!750723 m!700067))

(declare-fun m!700069 () Bool)

(assert (=> b!750723 m!700069))

(declare-fun m!700071 () Bool)

(assert (=> b!750723 m!700071))

(assert (=> b!750723 m!700051))

(declare-fun m!700073 () Bool)

(assert (=> b!750723 m!700073))

(assert (=> b!750723 m!700069))

(declare-fun m!700075 () Bool)

(assert (=> b!750707 m!700075))

(declare-fun m!700077 () Bool)

(assert (=> b!750716 m!700077))

(assert (=> b!750720 m!700043))

(assert (=> b!750720 m!700043))

(declare-fun m!700079 () Bool)

(assert (=> b!750720 m!700079))

(declare-fun m!700081 () Bool)

(assert (=> b!750719 m!700081))

(declare-fun m!700083 () Bool)

(assert (=> start!65616 m!700083))

(declare-fun m!700085 () Bool)

(assert (=> start!65616 m!700085))

(assert (=> b!750718 m!700043))

(assert (=> b!750718 m!700043))

(declare-fun m!700087 () Bool)

(assert (=> b!750718 m!700087))

(declare-fun m!700089 () Bool)

(assert (=> b!750718 m!700089))

(declare-fun m!700091 () Bool)

(assert (=> b!750718 m!700091))

(declare-fun m!700093 () Bool)

(assert (=> b!750711 m!700093))

(assert (=> b!750724 m!700043))

(assert (=> b!750724 m!700043))

(assert (=> b!750724 m!700047))

(check-sat (not b!750720) (not b!750709) (not b!750708) (not b!750718) (not b!750706) (not b!750707) (not b!750719) (not b!750715) (not b!750724) (not b!750723) (not start!65616) (not b!750713) (not b!750726) (not b!750716) (not b!750721))
(check-sat)
