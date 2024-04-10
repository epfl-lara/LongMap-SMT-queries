; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67988 () Bool)

(assert start!67988)

(declare-fun b!790994 () Bool)

(declare-fun res!535794 () Bool)

(declare-fun e!439629 () Bool)

(assert (=> b!790994 (=> (not res!535794) (not e!439629))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42902 0))(
  ( (array!42903 (arr!20536 (Array (_ BitVec 32) (_ BitVec 64))) (size!20957 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42902)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790994 (= res!535794 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20536 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!439631 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!790995 () Bool)

(declare-datatypes ((SeekEntryResult!8136 0))(
  ( (MissingZero!8136 (index!34912 (_ BitVec 32))) (Found!8136 (index!34913 (_ BitVec 32))) (Intermediate!8136 (undefined!8948 Bool) (index!34914 (_ BitVec 32)) (x!65854 (_ BitVec 32))) (Undefined!8136) (MissingVacant!8136 (index!34915 (_ BitVec 32))) )
))
(declare-fun lt!353104 () SeekEntryResult!8136)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42902 (_ BitVec 32)) SeekEntryResult!8136)

(assert (=> b!790995 (= e!439631 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20536 a!3186) j!159) a!3186 mask!3328) lt!353104))))

(declare-fun res!535802 () Bool)

(declare-fun e!439628 () Bool)

(assert (=> start!67988 (=> (not res!535802) (not e!439628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67988 (= res!535802 (validMask!0 mask!3328))))

(assert (=> start!67988 e!439628))

(assert (=> start!67988 true))

(declare-fun array_inv!16332 (array!42902) Bool)

(assert (=> start!67988 (array_inv!16332 a!3186)))

(declare-fun b!790996 () Bool)

(declare-fun res!535791 () Bool)

(declare-fun e!439630 () Bool)

(assert (=> b!790996 (=> (not res!535791) (not e!439630))))

(declare-datatypes ((List!14538 0))(
  ( (Nil!14535) (Cons!14534 (h!15663 (_ BitVec 64)) (t!20853 List!14538)) )
))
(declare-fun arrayNoDuplicates!0 (array!42902 (_ BitVec 32) List!14538) Bool)

(assert (=> b!790996 (= res!535791 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14535))))

(declare-fun b!790997 () Bool)

(declare-fun e!439627 () Bool)

(assert (=> b!790997 (= e!439627 (not true))))

(declare-fun e!439634 () Bool)

(assert (=> b!790997 e!439634))

(declare-fun res!535797 () Bool)

(assert (=> b!790997 (=> (not res!535797) (not e!439634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42902 (_ BitVec 32)) Bool)

(assert (=> b!790997 (= res!535797 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27424 0))(
  ( (Unit!27425) )
))
(declare-fun lt!353105 () Unit!27424)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27424)

(assert (=> b!790997 (= lt!353105 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!439632 () Bool)

(declare-fun b!790998 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!353103 () SeekEntryResult!8136)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42902 (_ BitVec 32)) SeekEntryResult!8136)

(assert (=> b!790998 (= e!439632 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20536 a!3186) j!159) a!3186 mask!3328) lt!353103))))

(declare-fun b!790999 () Bool)

(assert (=> b!790999 (= e!439634 e!439632)))

(declare-fun res!535795 () Bool)

(assert (=> b!790999 (=> (not res!535795) (not e!439632))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42902 (_ BitVec 32)) SeekEntryResult!8136)

(assert (=> b!790999 (= res!535795 (= (seekEntryOrOpen!0 (select (arr!20536 a!3186) j!159) a!3186 mask!3328) lt!353103))))

(assert (=> b!790999 (= lt!353103 (Found!8136 j!159))))

(declare-fun b!791000 () Bool)

(declare-fun res!535805 () Bool)

(assert (=> b!791000 (=> (not res!535805) (not e!439628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791000 (= res!535805 (validKeyInArray!0 (select (arr!20536 a!3186) j!159)))))

(declare-fun b!791001 () Bool)

(declare-fun res!535803 () Bool)

(assert (=> b!791001 (=> (not res!535803) (not e!439630))))

(assert (=> b!791001 (= res!535803 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20957 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20957 a!3186))))))

(declare-fun b!791002 () Bool)

(declare-fun res!535796 () Bool)

(assert (=> b!791002 (=> (not res!535796) (not e!439630))))

(assert (=> b!791002 (= res!535796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791003 () Bool)

(assert (=> b!791003 (= e!439628 e!439630)))

(declare-fun res!535792 () Bool)

(assert (=> b!791003 (=> (not res!535792) (not e!439630))))

(declare-fun lt!353101 () SeekEntryResult!8136)

(assert (=> b!791003 (= res!535792 (or (= lt!353101 (MissingZero!8136 i!1173)) (= lt!353101 (MissingVacant!8136 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!791003 (= lt!353101 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!791004 () Bool)

(declare-fun res!535801 () Bool)

(assert (=> b!791004 (=> (not res!535801) (not e!439628))))

(assert (=> b!791004 (= res!535801 (and (= (size!20957 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20957 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20957 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791005 () Bool)

(declare-fun res!535804 () Bool)

(assert (=> b!791005 (=> (not res!535804) (not e!439629))))

(assert (=> b!791005 (= res!535804 e!439631)))

(declare-fun c!88012 () Bool)

(assert (=> b!791005 (= c!88012 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791006 () Bool)

(assert (=> b!791006 (= e!439630 e!439629)))

(declare-fun res!535799 () Bool)

(assert (=> b!791006 (=> (not res!535799) (not e!439629))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791006 (= res!535799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20536 a!3186) j!159) mask!3328) (select (arr!20536 a!3186) j!159) a!3186 mask!3328) lt!353104))))

(assert (=> b!791006 (= lt!353104 (Intermediate!8136 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791007 () Bool)

(declare-fun res!535800 () Bool)

(assert (=> b!791007 (=> (not res!535800) (not e!439628))))

(declare-fun arrayContainsKey!0 (array!42902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791007 (= res!535800 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!791008 () Bool)

(declare-fun res!535793 () Bool)

(assert (=> b!791008 (=> (not res!535793) (not e!439628))))

(assert (=> b!791008 (= res!535793 (validKeyInArray!0 k0!2102))))

(declare-fun b!791009 () Bool)

(assert (=> b!791009 (= e!439629 e!439627)))

(declare-fun res!535798 () Bool)

(assert (=> b!791009 (=> (not res!535798) (not e!439627))))

(declare-fun lt!353102 () array!42902)

(declare-fun lt!353100 () (_ BitVec 64))

(assert (=> b!791009 (= res!535798 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353100 mask!3328) lt!353100 lt!353102 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353100 lt!353102 mask!3328)))))

(assert (=> b!791009 (= lt!353100 (select (store (arr!20536 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!791009 (= lt!353102 (array!42903 (store (arr!20536 a!3186) i!1173 k0!2102) (size!20957 a!3186)))))

(declare-fun b!791010 () Bool)

(assert (=> b!791010 (= e!439631 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20536 a!3186) j!159) a!3186 mask!3328) (Found!8136 j!159)))))

(assert (= (and start!67988 res!535802) b!791004))

(assert (= (and b!791004 res!535801) b!791000))

(assert (= (and b!791000 res!535805) b!791008))

(assert (= (and b!791008 res!535793) b!791007))

(assert (= (and b!791007 res!535800) b!791003))

(assert (= (and b!791003 res!535792) b!791002))

(assert (= (and b!791002 res!535796) b!790996))

(assert (= (and b!790996 res!535791) b!791001))

(assert (= (and b!791001 res!535803) b!791006))

(assert (= (and b!791006 res!535799) b!790994))

(assert (= (and b!790994 res!535794) b!791005))

(assert (= (and b!791005 c!88012) b!790995))

(assert (= (and b!791005 (not c!88012)) b!791010))

(assert (= (and b!791005 res!535804) b!791009))

(assert (= (and b!791009 res!535798) b!790997))

(assert (= (and b!790997 res!535797) b!790999))

(assert (= (and b!790999 res!535795) b!790998))

(declare-fun m!731775 () Bool)

(assert (=> b!791000 m!731775))

(assert (=> b!791000 m!731775))

(declare-fun m!731777 () Bool)

(assert (=> b!791000 m!731777))

(declare-fun m!731779 () Bool)

(assert (=> b!791008 m!731779))

(assert (=> b!790999 m!731775))

(assert (=> b!790999 m!731775))

(declare-fun m!731781 () Bool)

(assert (=> b!790999 m!731781))

(declare-fun m!731783 () Bool)

(assert (=> start!67988 m!731783))

(declare-fun m!731785 () Bool)

(assert (=> start!67988 m!731785))

(declare-fun m!731787 () Bool)

(assert (=> b!791003 m!731787))

(assert (=> b!791006 m!731775))

(assert (=> b!791006 m!731775))

(declare-fun m!731789 () Bool)

(assert (=> b!791006 m!731789))

(assert (=> b!791006 m!731789))

(assert (=> b!791006 m!731775))

(declare-fun m!731791 () Bool)

(assert (=> b!791006 m!731791))

(declare-fun m!731793 () Bool)

(assert (=> b!791002 m!731793))

(assert (=> b!791010 m!731775))

(assert (=> b!791010 m!731775))

(declare-fun m!731795 () Bool)

(assert (=> b!791010 m!731795))

(declare-fun m!731797 () Bool)

(assert (=> b!790994 m!731797))

(assert (=> b!790995 m!731775))

(assert (=> b!790995 m!731775))

(declare-fun m!731799 () Bool)

(assert (=> b!790995 m!731799))

(declare-fun m!731801 () Bool)

(assert (=> b!791009 m!731801))

(declare-fun m!731803 () Bool)

(assert (=> b!791009 m!731803))

(declare-fun m!731805 () Bool)

(assert (=> b!791009 m!731805))

(declare-fun m!731807 () Bool)

(assert (=> b!791009 m!731807))

(assert (=> b!791009 m!731801))

(declare-fun m!731809 () Bool)

(assert (=> b!791009 m!731809))

(declare-fun m!731811 () Bool)

(assert (=> b!790996 m!731811))

(declare-fun m!731813 () Bool)

(assert (=> b!790997 m!731813))

(declare-fun m!731815 () Bool)

(assert (=> b!790997 m!731815))

(declare-fun m!731817 () Bool)

(assert (=> b!791007 m!731817))

(assert (=> b!790998 m!731775))

(assert (=> b!790998 m!731775))

(declare-fun m!731819 () Bool)

(assert (=> b!790998 m!731819))

(check-sat (not start!67988) (not b!790996) (not b!791009) (not b!791000) (not b!791002) (not b!790997) (not b!790998) (not b!791008) (not b!791007) (not b!791010) (not b!791003) (not b!790999) (not b!790995) (not b!791006))
(check-sat)
