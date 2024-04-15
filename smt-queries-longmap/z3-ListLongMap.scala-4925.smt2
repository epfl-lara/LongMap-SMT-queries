; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67772 () Bool)

(assert start!67772)

(declare-fun b!787855 () Bool)

(declare-fun res!533759 () Bool)

(declare-fun e!437896 () Bool)

(assert (=> b!787855 (=> (not res!533759) (not e!437896))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42831 0))(
  ( (array!42832 (arr!20504 (Array (_ BitVec 32) (_ BitVec 64))) (size!20925 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42831)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787855 (= res!533759 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20925 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20925 a!3186))))))

(declare-fun b!787856 () Bool)

(declare-fun res!533772 () Bool)

(declare-fun e!437897 () Bool)

(assert (=> b!787856 (=> (not res!533772) (not e!437897))))

(declare-fun lt!351368 () array!42831)

(declare-fun lt!351367 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8101 0))(
  ( (MissingZero!8101 (index!34772 (_ BitVec 32))) (Found!8101 (index!34773 (_ BitVec 32))) (Intermediate!8101 (undefined!8913 Bool) (index!34774 (_ BitVec 32)) (x!65716 (_ BitVec 32))) (Undefined!8101) (MissingVacant!8101 (index!34775 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42831 (_ BitVec 32)) SeekEntryResult!8101)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42831 (_ BitVec 32)) SeekEntryResult!8101)

(assert (=> b!787856 (= res!533772 (= (seekEntryOrOpen!0 lt!351367 lt!351368 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351367 lt!351368 mask!3328)))))

(declare-fun b!787857 () Bool)

(declare-fun e!437893 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!787857 (= e!437893 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20504 a!3186) j!159) a!3186 mask!3328) (Found!8101 j!159)))))

(declare-fun b!787858 () Bool)

(declare-fun e!437902 () Bool)

(declare-fun e!437901 () Bool)

(assert (=> b!787858 (= e!437902 (not e!437901))))

(declare-fun res!533761 () Bool)

(assert (=> b!787858 (=> res!533761 e!437901)))

(declare-fun lt!351366 () SeekEntryResult!8101)

(get-info :version)

(assert (=> b!787858 (= res!533761 (or (not ((_ is Intermediate!8101) lt!351366)) (bvslt x!1131 (x!65716 lt!351366)) (not (= x!1131 (x!65716 lt!351366))) (not (= index!1321 (index!34774 lt!351366)))))))

(declare-fun e!437899 () Bool)

(assert (=> b!787858 e!437899))

(declare-fun res!533767 () Bool)

(assert (=> b!787858 (=> (not res!533767) (not e!437899))))

(declare-fun lt!351357 () SeekEntryResult!8101)

(declare-fun lt!351365 () SeekEntryResult!8101)

(assert (=> b!787858 (= res!533767 (= lt!351357 lt!351365))))

(assert (=> b!787858 (= lt!351365 (Found!8101 j!159))))

(assert (=> b!787858 (= lt!351357 (seekEntryOrOpen!0 (select (arr!20504 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42831 (_ BitVec 32)) Bool)

(assert (=> b!787858 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27272 0))(
  ( (Unit!27273) )
))
(declare-fun lt!351364 () Unit!27272)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27272)

(assert (=> b!787858 (= lt!351364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787859 () Bool)

(declare-fun res!533760 () Bool)

(declare-fun e!437898 () Bool)

(assert (=> b!787859 (=> (not res!533760) (not e!437898))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787859 (= res!533760 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20504 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787860 () Bool)

(assert (=> b!787860 (= e!437899 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20504 a!3186) j!159) a!3186 mask!3328) lt!351365))))

(declare-fun b!787861 () Bool)

(declare-fun res!533754 () Bool)

(assert (=> b!787861 (=> (not res!533754) (not e!437896))))

(declare-datatypes ((List!14545 0))(
  ( (Nil!14542) (Cons!14541 (h!15664 (_ BitVec 64)) (t!20851 List!14545)) )
))
(declare-fun arrayNoDuplicates!0 (array!42831 (_ BitVec 32) List!14545) Bool)

(assert (=> b!787861 (= res!533754 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14542))))

(declare-fun b!787862 () Bool)

(assert (=> b!787862 (= e!437898 e!437902)))

(declare-fun res!533755 () Bool)

(assert (=> b!787862 (=> (not res!533755) (not e!437902))))

(declare-fun lt!351363 () SeekEntryResult!8101)

(assert (=> b!787862 (= res!533755 (= lt!351363 lt!351366))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42831 (_ BitVec 32)) SeekEntryResult!8101)

(assert (=> b!787862 (= lt!351366 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351367 lt!351368 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787862 (= lt!351363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351367 mask!3328) lt!351367 lt!351368 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!787862 (= lt!351367 (select (store (arr!20504 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787862 (= lt!351368 (array!42832 (store (arr!20504 a!3186) i!1173 k0!2102) (size!20925 a!3186)))))

(declare-fun b!787863 () Bool)

(declare-fun res!533758 () Bool)

(declare-fun e!437891 () Bool)

(assert (=> b!787863 (=> (not res!533758) (not e!437891))))

(assert (=> b!787863 (= res!533758 (and (= (size!20925 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20925 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20925 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787864 () Bool)

(declare-fun res!533771 () Bool)

(assert (=> b!787864 (=> (not res!533771) (not e!437891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787864 (= res!533771 (validKeyInArray!0 k0!2102))))

(declare-fun b!787865 () Bool)

(declare-fun res!533768 () Bool)

(assert (=> b!787865 (=> (not res!533768) (not e!437898))))

(assert (=> b!787865 (= res!533768 e!437893)))

(declare-fun c!87459 () Bool)

(assert (=> b!787865 (= c!87459 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787866 () Bool)

(declare-fun e!437895 () Unit!27272)

(declare-fun Unit!27274 () Unit!27272)

(assert (=> b!787866 (= e!437895 Unit!27274)))

(assert (=> b!787866 false))

(declare-fun b!787867 () Bool)

(declare-fun res!533764 () Bool)

(assert (=> b!787867 (=> (not res!533764) (not e!437891))))

(declare-fun arrayContainsKey!0 (array!42831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787867 (= res!533764 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787868 () Bool)

(assert (=> b!787868 (= e!437891 e!437896)))

(declare-fun res!533762 () Bool)

(assert (=> b!787868 (=> (not res!533762) (not e!437896))))

(declare-fun lt!351360 () SeekEntryResult!8101)

(assert (=> b!787868 (= res!533762 (or (= lt!351360 (MissingZero!8101 i!1173)) (= lt!351360 (MissingVacant!8101 i!1173))))))

(assert (=> b!787868 (= lt!351360 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787869 () Bool)

(declare-fun res!533769 () Bool)

(assert (=> b!787869 (=> (not res!533769) (not e!437896))))

(assert (=> b!787869 (= res!533769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787870 () Bool)

(declare-fun e!437900 () Bool)

(assert (=> b!787870 (= e!437900 (= (select (arr!20504 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!787870 e!437897))

(declare-fun res!533757 () Bool)

(assert (=> b!787870 (=> (not res!533757) (not e!437897))))

(declare-fun lt!351359 () (_ BitVec 64))

(assert (=> b!787870 (= res!533757 (= lt!351359 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351361 () Unit!27272)

(assert (=> b!787870 (= lt!351361 e!437895)))

(declare-fun c!87458 () Bool)

(assert (=> b!787870 (= c!87458 (= lt!351359 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787871 () Bool)

(declare-fun lt!351362 () SeekEntryResult!8101)

(assert (=> b!787871 (= e!437897 (= lt!351357 lt!351362))))

(declare-fun b!787872 () Bool)

(declare-fun e!437892 () Bool)

(assert (=> b!787872 (= e!437892 e!437900)))

(declare-fun res!533756 () Bool)

(assert (=> b!787872 (=> res!533756 e!437900)))

(assert (=> b!787872 (= res!533756 (= lt!351359 lt!351367))))

(assert (=> b!787872 (= lt!351359 (select (store (arr!20504 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787873 () Bool)

(assert (=> b!787873 (= e!437896 e!437898)))

(declare-fun res!533765 () Bool)

(assert (=> b!787873 (=> (not res!533765) (not e!437898))))

(declare-fun lt!351358 () SeekEntryResult!8101)

(assert (=> b!787873 (= res!533765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20504 a!3186) j!159) mask!3328) (select (arr!20504 a!3186) j!159) a!3186 mask!3328) lt!351358))))

(assert (=> b!787873 (= lt!351358 (Intermediate!8101 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!533763 () Bool)

(assert (=> start!67772 (=> (not res!533763) (not e!437891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67772 (= res!533763 (validMask!0 mask!3328))))

(assert (=> start!67772 e!437891))

(assert (=> start!67772 true))

(declare-fun array_inv!16387 (array!42831) Bool)

(assert (=> start!67772 (array_inv!16387 a!3186)))

(declare-fun b!787874 () Bool)

(assert (=> b!787874 (= e!437893 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20504 a!3186) j!159) a!3186 mask!3328) lt!351358))))

(declare-fun b!787875 () Bool)

(assert (=> b!787875 (= e!437901 e!437892)))

(declare-fun res!533766 () Bool)

(assert (=> b!787875 (=> res!533766 e!437892)))

(assert (=> b!787875 (= res!533766 (not (= lt!351362 lt!351365)))))

(assert (=> b!787875 (= lt!351362 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20504 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787876 () Bool)

(declare-fun res!533770 () Bool)

(assert (=> b!787876 (=> (not res!533770) (not e!437891))))

(assert (=> b!787876 (= res!533770 (validKeyInArray!0 (select (arr!20504 a!3186) j!159)))))

(declare-fun b!787877 () Bool)

(declare-fun Unit!27275 () Unit!27272)

(assert (=> b!787877 (= e!437895 Unit!27275)))

(assert (= (and start!67772 res!533763) b!787863))

(assert (= (and b!787863 res!533758) b!787876))

(assert (= (and b!787876 res!533770) b!787864))

(assert (= (and b!787864 res!533771) b!787867))

(assert (= (and b!787867 res!533764) b!787868))

(assert (= (and b!787868 res!533762) b!787869))

(assert (= (and b!787869 res!533769) b!787861))

(assert (= (and b!787861 res!533754) b!787855))

(assert (= (and b!787855 res!533759) b!787873))

(assert (= (and b!787873 res!533765) b!787859))

(assert (= (and b!787859 res!533760) b!787865))

(assert (= (and b!787865 c!87459) b!787874))

(assert (= (and b!787865 (not c!87459)) b!787857))

(assert (= (and b!787865 res!533768) b!787862))

(assert (= (and b!787862 res!533755) b!787858))

(assert (= (and b!787858 res!533767) b!787860))

(assert (= (and b!787858 (not res!533761)) b!787875))

(assert (= (and b!787875 (not res!533766)) b!787872))

(assert (= (and b!787872 (not res!533756)) b!787870))

(assert (= (and b!787870 c!87458) b!787866))

(assert (= (and b!787870 (not c!87458)) b!787877))

(assert (= (and b!787870 res!533757) b!787856))

(assert (= (and b!787856 res!533772) b!787871))

(declare-fun m!728763 () Bool)

(assert (=> b!787859 m!728763))

(declare-fun m!728765 () Bool)

(assert (=> b!787857 m!728765))

(assert (=> b!787857 m!728765))

(declare-fun m!728767 () Bool)

(assert (=> b!787857 m!728767))

(assert (=> b!787858 m!728765))

(assert (=> b!787858 m!728765))

(declare-fun m!728769 () Bool)

(assert (=> b!787858 m!728769))

(declare-fun m!728771 () Bool)

(assert (=> b!787858 m!728771))

(declare-fun m!728773 () Bool)

(assert (=> b!787858 m!728773))

(declare-fun m!728775 () Bool)

(assert (=> b!787869 m!728775))

(declare-fun m!728777 () Bool)

(assert (=> b!787862 m!728777))

(declare-fun m!728779 () Bool)

(assert (=> b!787862 m!728779))

(declare-fun m!728781 () Bool)

(assert (=> b!787862 m!728781))

(declare-fun m!728783 () Bool)

(assert (=> b!787862 m!728783))

(declare-fun m!728785 () Bool)

(assert (=> b!787862 m!728785))

(assert (=> b!787862 m!728777))

(assert (=> b!787872 m!728783))

(declare-fun m!728787 () Bool)

(assert (=> b!787872 m!728787))

(declare-fun m!728789 () Bool)

(assert (=> start!67772 m!728789))

(declare-fun m!728791 () Bool)

(assert (=> start!67772 m!728791))

(declare-fun m!728793 () Bool)

(assert (=> b!787861 m!728793))

(assert (=> b!787860 m!728765))

(assert (=> b!787860 m!728765))

(declare-fun m!728795 () Bool)

(assert (=> b!787860 m!728795))

(assert (=> b!787875 m!728765))

(assert (=> b!787875 m!728765))

(assert (=> b!787875 m!728767))

(declare-fun m!728797 () Bool)

(assert (=> b!787868 m!728797))

(assert (=> b!787873 m!728765))

(assert (=> b!787873 m!728765))

(declare-fun m!728799 () Bool)

(assert (=> b!787873 m!728799))

(assert (=> b!787873 m!728799))

(assert (=> b!787873 m!728765))

(declare-fun m!728801 () Bool)

(assert (=> b!787873 m!728801))

(declare-fun m!728803 () Bool)

(assert (=> b!787864 m!728803))

(declare-fun m!728805 () Bool)

(assert (=> b!787867 m!728805))

(assert (=> b!787876 m!728765))

(assert (=> b!787876 m!728765))

(declare-fun m!728807 () Bool)

(assert (=> b!787876 m!728807))

(declare-fun m!728809 () Bool)

(assert (=> b!787856 m!728809))

(declare-fun m!728811 () Bool)

(assert (=> b!787856 m!728811))

(declare-fun m!728813 () Bool)

(assert (=> b!787870 m!728813))

(assert (=> b!787874 m!728765))

(assert (=> b!787874 m!728765))

(declare-fun m!728815 () Bool)

(assert (=> b!787874 m!728815))

(check-sat (not b!787861) (not b!787856) (not b!787874) (not b!787858) (not b!787875) (not start!67772) (not b!787862) (not b!787864) (not b!787873) (not b!787868) (not b!787876) (not b!787869) (not b!787867) (not b!787860) (not b!787857))
(check-sat)
