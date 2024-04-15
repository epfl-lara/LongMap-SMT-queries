; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65576 () Bool)

(assert start!65576)

(declare-fun b!749795 () Bool)

(declare-fun e!418341 () Bool)

(declare-fun e!418348 () Bool)

(assert (=> b!749795 (= e!418341 (not e!418348))))

(declare-fun res!506063 () Bool)

(assert (=> b!749795 (=> res!506063 e!418348)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7594 0))(
  ( (MissingZero!7594 (index!32744 (_ BitVec 32))) (Found!7594 (index!32745 (_ BitVec 32))) (Intermediate!7594 (undefined!8406 Bool) (index!32746 (_ BitVec 32)) (x!63683 (_ BitVec 32))) (Undefined!7594) (MissingVacant!7594 (index!32747 (_ BitVec 32))) )
))
(declare-fun lt!333253 () SeekEntryResult!7594)

(get-info :version)

(assert (=> b!749795 (= res!506063 (or (not ((_ is Intermediate!7594) lt!333253)) (bvslt x!1131 (x!63683 lt!333253)) (not (= x!1131 (x!63683 lt!333253))) (not (= index!1321 (index!32746 lt!333253)))))))

(declare-fun e!418347 () Bool)

(assert (=> b!749795 e!418347))

(declare-fun res!506069 () Bool)

(assert (=> b!749795 (=> (not res!506069) (not e!418347))))

(declare-fun lt!333244 () SeekEntryResult!7594)

(declare-fun lt!333246 () SeekEntryResult!7594)

(assert (=> b!749795 (= res!506069 (= lt!333244 lt!333246))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!749795 (= lt!333246 (Found!7594 j!159))))

(declare-datatypes ((array!41766 0))(
  ( (array!41767 (arr!19997 (Array (_ BitVec 32) (_ BitVec 64))) (size!20418 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41766)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41766 (_ BitVec 32)) SeekEntryResult!7594)

(assert (=> b!749795 (= lt!333244 (seekEntryOrOpen!0 (select (arr!19997 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41766 (_ BitVec 32)) Bool)

(assert (=> b!749795 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25736 0))(
  ( (Unit!25737) )
))
(declare-fun lt!333247 () Unit!25736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25736)

(assert (=> b!749795 (= lt!333247 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!418346 () Bool)

(declare-fun b!749796 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41766 (_ BitVec 32)) SeekEntryResult!7594)

(assert (=> b!749796 (= e!418346 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19997 a!3186) j!159) a!3186 mask!3328) (Found!7594 j!159)))))

(declare-fun b!749797 () Bool)

(declare-fun e!418344 () Bool)

(assert (=> b!749797 (= e!418344 e!418341)))

(declare-fun res!506068 () Bool)

(assert (=> b!749797 (=> (not res!506068) (not e!418341))))

(declare-fun lt!333249 () SeekEntryResult!7594)

(assert (=> b!749797 (= res!506068 (= lt!333249 lt!333253))))

(declare-fun lt!333251 () (_ BitVec 64))

(declare-fun lt!333245 () array!41766)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41766 (_ BitVec 32)) SeekEntryResult!7594)

(assert (=> b!749797 (= lt!333253 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333251 lt!333245 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749797 (= lt!333249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333251 mask!3328) lt!333251 lt!333245 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!749797 (= lt!333251 (select (store (arr!19997 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749797 (= lt!333245 (array!41767 (store (arr!19997 a!3186) i!1173 k0!2102) (size!20418 a!3186)))))

(declare-fun b!749798 () Bool)

(declare-fun res!506077 () Bool)

(assert (=> b!749798 (=> res!506077 e!418348)))

(assert (=> b!749798 (= res!506077 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19997 a!3186) j!159) a!3186 mask!3328) lt!333246)))))

(declare-fun b!749799 () Bool)

(declare-fun e!418343 () Unit!25736)

(declare-fun Unit!25738 () Unit!25736)

(assert (=> b!749799 (= e!418343 Unit!25738)))

(declare-fun res!506070 () Bool)

(declare-fun e!418338 () Bool)

(assert (=> start!65576 (=> (not res!506070) (not e!418338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65576 (= res!506070 (validMask!0 mask!3328))))

(assert (=> start!65576 e!418338))

(assert (=> start!65576 true))

(declare-fun array_inv!15880 (array!41766) Bool)

(assert (=> start!65576 (array_inv!15880 a!3186)))

(declare-fun b!749800 () Bool)

(declare-fun res!506073 () Bool)

(assert (=> b!749800 (=> (not res!506073) (not e!418338))))

(assert (=> b!749800 (= res!506073 (and (= (size!20418 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20418 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20418 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749801 () Bool)

(declare-fun res!506067 () Bool)

(assert (=> b!749801 (=> (not res!506067) (not e!418344))))

(assert (=> b!749801 (= res!506067 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19997 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749802 () Bool)

(declare-fun res!506076 () Bool)

(declare-fun e!418340 () Bool)

(assert (=> b!749802 (=> (not res!506076) (not e!418340))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749802 (= res!506076 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20418 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20418 a!3186))))))

(declare-fun b!749803 () Bool)

(declare-fun res!506062 () Bool)

(assert (=> b!749803 (=> (not res!506062) (not e!418338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749803 (= res!506062 (validKeyInArray!0 (select (arr!19997 a!3186) j!159)))))

(declare-fun b!749804 () Bool)

(declare-fun Unit!25739 () Unit!25736)

(assert (=> b!749804 (= e!418343 Unit!25739)))

(assert (=> b!749804 false))

(declare-fun b!749805 () Bool)

(declare-fun res!506065 () Bool)

(assert (=> b!749805 (=> (not res!506065) (not e!418338))))

(assert (=> b!749805 (= res!506065 (validKeyInArray!0 k0!2102))))

(declare-fun b!749806 () Bool)

(declare-fun e!418342 () Bool)

(assert (=> b!749806 (= e!418342 (= (seekEntryOrOpen!0 lt!333251 lt!333245 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333251 lt!333245 mask!3328)))))

(declare-fun b!749807 () Bool)

(declare-fun e!418339 () Bool)

(assert (=> b!749807 (= e!418348 e!418339)))

(declare-fun res!506072 () Bool)

(assert (=> b!749807 (=> res!506072 e!418339)))

(declare-fun lt!333254 () (_ BitVec 64))

(assert (=> b!749807 (= res!506072 (= lt!333254 lt!333251))))

(assert (=> b!749807 (= lt!333254 (select (store (arr!19997 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!749808 () Bool)

(assert (=> b!749808 (= e!418338 e!418340)))

(declare-fun res!506074 () Bool)

(assert (=> b!749808 (=> (not res!506074) (not e!418340))))

(declare-fun lt!333252 () SeekEntryResult!7594)

(assert (=> b!749808 (= res!506074 (or (= lt!333252 (MissingZero!7594 i!1173)) (= lt!333252 (MissingVacant!7594 i!1173))))))

(assert (=> b!749808 (= lt!333252 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!749809 () Bool)

(declare-fun res!506071 () Bool)

(assert (=> b!749809 (=> (not res!506071) (not e!418344))))

(assert (=> b!749809 (= res!506071 e!418346)))

(declare-fun c!82248 () Bool)

(assert (=> b!749809 (= c!82248 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749810 () Bool)

(assert (=> b!749810 (= e!418339 true)))

(assert (=> b!749810 e!418342))

(declare-fun res!506066 () Bool)

(assert (=> b!749810 (=> (not res!506066) (not e!418342))))

(assert (=> b!749810 (= res!506066 (= lt!333254 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333248 () Unit!25736)

(assert (=> b!749810 (= lt!333248 e!418343)))

(declare-fun c!82247 () Bool)

(assert (=> b!749810 (= c!82247 (= lt!333254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749811 () Bool)

(declare-fun res!506078 () Bool)

(assert (=> b!749811 (=> (not res!506078) (not e!418338))))

(declare-fun arrayContainsKey!0 (array!41766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749811 (= res!506078 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749812 () Bool)

(assert (=> b!749812 (= e!418347 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19997 a!3186) j!159) a!3186 mask!3328) lt!333246))))

(declare-fun b!749813 () Bool)

(assert (=> b!749813 (= e!418340 e!418344)))

(declare-fun res!506064 () Bool)

(assert (=> b!749813 (=> (not res!506064) (not e!418344))))

(declare-fun lt!333250 () SeekEntryResult!7594)

(assert (=> b!749813 (= res!506064 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19997 a!3186) j!159) mask!3328) (select (arr!19997 a!3186) j!159) a!3186 mask!3328) lt!333250))))

(assert (=> b!749813 (= lt!333250 (Intermediate!7594 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749814 () Bool)

(assert (=> b!749814 (= e!418346 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19997 a!3186) j!159) a!3186 mask!3328) lt!333250))))

(declare-fun b!749815 () Bool)

(declare-fun res!506079 () Bool)

(assert (=> b!749815 (=> (not res!506079) (not e!418340))))

(declare-datatypes ((List!14038 0))(
  ( (Nil!14035) (Cons!14034 (h!15106 (_ BitVec 64)) (t!20344 List!14038)) )
))
(declare-fun arrayNoDuplicates!0 (array!41766 (_ BitVec 32) List!14038) Bool)

(assert (=> b!749815 (= res!506079 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14035))))

(declare-fun b!749816 () Bool)

(declare-fun res!506075 () Bool)

(assert (=> b!749816 (=> (not res!506075) (not e!418340))))

(assert (=> b!749816 (= res!506075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65576 res!506070) b!749800))

(assert (= (and b!749800 res!506073) b!749803))

(assert (= (and b!749803 res!506062) b!749805))

(assert (= (and b!749805 res!506065) b!749811))

(assert (= (and b!749811 res!506078) b!749808))

(assert (= (and b!749808 res!506074) b!749816))

(assert (= (and b!749816 res!506075) b!749815))

(assert (= (and b!749815 res!506079) b!749802))

(assert (= (and b!749802 res!506076) b!749813))

(assert (= (and b!749813 res!506064) b!749801))

(assert (= (and b!749801 res!506067) b!749809))

(assert (= (and b!749809 c!82248) b!749814))

(assert (= (and b!749809 (not c!82248)) b!749796))

(assert (= (and b!749809 res!506071) b!749797))

(assert (= (and b!749797 res!506068) b!749795))

(assert (= (and b!749795 res!506069) b!749812))

(assert (= (and b!749795 (not res!506063)) b!749798))

(assert (= (and b!749798 (not res!506077)) b!749807))

(assert (= (and b!749807 (not res!506072)) b!749810))

(assert (= (and b!749810 c!82247) b!749804))

(assert (= (and b!749810 (not c!82247)) b!749799))

(assert (= (and b!749810 res!506066) b!749806))

(declare-fun m!698765 () Bool)

(assert (=> b!749798 m!698765))

(assert (=> b!749798 m!698765))

(declare-fun m!698767 () Bool)

(assert (=> b!749798 m!698767))

(assert (=> b!749796 m!698765))

(assert (=> b!749796 m!698765))

(assert (=> b!749796 m!698767))

(assert (=> b!749795 m!698765))

(assert (=> b!749795 m!698765))

(declare-fun m!698769 () Bool)

(assert (=> b!749795 m!698769))

(declare-fun m!698771 () Bool)

(assert (=> b!749795 m!698771))

(declare-fun m!698773 () Bool)

(assert (=> b!749795 m!698773))

(declare-fun m!698775 () Bool)

(assert (=> b!749801 m!698775))

(declare-fun m!698777 () Bool)

(assert (=> b!749816 m!698777))

(assert (=> b!749812 m!698765))

(assert (=> b!749812 m!698765))

(declare-fun m!698779 () Bool)

(assert (=> b!749812 m!698779))

(assert (=> b!749813 m!698765))

(assert (=> b!749813 m!698765))

(declare-fun m!698781 () Bool)

(assert (=> b!749813 m!698781))

(assert (=> b!749813 m!698781))

(assert (=> b!749813 m!698765))

(declare-fun m!698783 () Bool)

(assert (=> b!749813 m!698783))

(assert (=> b!749803 m!698765))

(assert (=> b!749803 m!698765))

(declare-fun m!698785 () Bool)

(assert (=> b!749803 m!698785))

(declare-fun m!698787 () Bool)

(assert (=> b!749815 m!698787))

(declare-fun m!698789 () Bool)

(assert (=> b!749797 m!698789))

(declare-fun m!698791 () Bool)

(assert (=> b!749797 m!698791))

(assert (=> b!749797 m!698791))

(declare-fun m!698793 () Bool)

(assert (=> b!749797 m!698793))

(declare-fun m!698795 () Bool)

(assert (=> b!749797 m!698795))

(declare-fun m!698797 () Bool)

(assert (=> b!749797 m!698797))

(declare-fun m!698799 () Bool)

(assert (=> b!749806 m!698799))

(declare-fun m!698801 () Bool)

(assert (=> b!749806 m!698801))

(assert (=> b!749814 m!698765))

(assert (=> b!749814 m!698765))

(declare-fun m!698803 () Bool)

(assert (=> b!749814 m!698803))

(declare-fun m!698805 () Bool)

(assert (=> start!65576 m!698805))

(declare-fun m!698807 () Bool)

(assert (=> start!65576 m!698807))

(declare-fun m!698809 () Bool)

(assert (=> b!749805 m!698809))

(assert (=> b!749807 m!698795))

(declare-fun m!698811 () Bool)

(assert (=> b!749807 m!698811))

(declare-fun m!698813 () Bool)

(assert (=> b!749811 m!698813))

(declare-fun m!698815 () Bool)

(assert (=> b!749808 m!698815))

(check-sat (not b!749806) (not b!749812) (not b!749795) (not b!749796) (not start!65576) (not b!749805) (not b!749813) (not b!749803) (not b!749811) (not b!749808) (not b!749815) (not b!749798) (not b!749797) (not b!749816) (not b!749814))
(check-sat)
