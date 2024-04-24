; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65304 () Bool)

(assert start!65304)

(declare-fun b!737861 () Bool)

(declare-fun res!495744 () Bool)

(declare-fun e!412794 () Bool)

(assert (=> b!737861 (=> (not res!495744) (not e!412794))))

(declare-datatypes ((array!41347 0))(
  ( (array!41348 (arr!19783 (Array (_ BitVec 32) (_ BitVec 64))) (size!20203 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41347)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!737861 (= res!495744 (and (= (size!20203 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20203 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20203 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737862 () Bool)

(declare-fun e!412796 () Bool)

(assert (=> b!737862 (= e!412794 e!412796)))

(declare-fun res!495742 () Bool)

(assert (=> b!737862 (=> (not res!495742) (not e!412796))))

(declare-datatypes ((SeekEntryResult!7339 0))(
  ( (MissingZero!7339 (index!31724 (_ BitVec 32))) (Found!7339 (index!31725 (_ BitVec 32))) (Intermediate!7339 (undefined!8151 Bool) (index!31726 (_ BitVec 32)) (x!62885 (_ BitVec 32))) (Undefined!7339) (MissingVacant!7339 (index!31727 (_ BitVec 32))) )
))
(declare-fun lt!327305 () SeekEntryResult!7339)

(assert (=> b!737862 (= res!495742 (or (= lt!327305 (MissingZero!7339 i!1173)) (= lt!327305 (MissingVacant!7339 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41347 (_ BitVec 32)) SeekEntryResult!7339)

(assert (=> b!737862 (= lt!327305 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!495747 () Bool)

(assert (=> start!65304 (=> (not res!495747) (not e!412794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65304 (= res!495747 (validMask!0 mask!3328))))

(assert (=> start!65304 e!412794))

(assert (=> start!65304 true))

(declare-fun array_inv!15642 (array!41347) Bool)

(assert (=> start!65304 (array_inv!15642 a!3186)))

(declare-fun e!412791 () Bool)

(declare-fun lt!327309 () (_ BitVec 32))

(declare-fun lt!327318 () SeekEntryResult!7339)

(declare-fun b!737863 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41347 (_ BitVec 32)) SeekEntryResult!7339)

(assert (=> b!737863 (= e!412791 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327309 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!327318)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!412793 () Bool)

(declare-fun b!737864 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41347 (_ BitVec 32)) SeekEntryResult!7339)

(assert (=> b!737864 (= e!412793 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) (Found!7339 j!159)))))

(declare-fun b!737865 () Bool)

(declare-fun res!495756 () Bool)

(declare-fun e!412790 () Bool)

(assert (=> b!737865 (=> (not res!495756) (not e!412790))))

(assert (=> b!737865 (= res!495756 e!412793)))

(declare-fun c!81446 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737865 (= c!81446 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!737866 () Bool)

(declare-fun res!495741 () Bool)

(assert (=> b!737866 (=> (not res!495741) (not e!412796))))

(declare-datatypes ((List!13692 0))(
  ( (Nil!13689) (Cons!13688 (h!14766 (_ BitVec 64)) (t!19999 List!13692)) )
))
(declare-fun arrayNoDuplicates!0 (array!41347 (_ BitVec 32) List!13692) Bool)

(assert (=> b!737866 (= res!495741 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13689))))

(declare-fun e!412797 () Bool)

(declare-fun lt!327307 () SeekEntryResult!7339)

(declare-fun b!737867 () Bool)

(assert (=> b!737867 (= e!412797 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!327307))))

(declare-fun b!737868 () Bool)

(declare-datatypes ((Unit!25129 0))(
  ( (Unit!25130) )
))
(declare-fun e!412800 () Unit!25129)

(declare-fun Unit!25131 () Unit!25129)

(assert (=> b!737868 (= e!412800 Unit!25131)))

(assert (=> b!737868 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327309 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!327318)))

(declare-fun lt!327315 () SeekEntryResult!7339)

(declare-fun b!737869 () Bool)

(assert (=> b!737869 (= e!412791 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327309 resIntermediateIndex!5 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!327315)))))

(declare-fun b!737870 () Bool)

(assert (=> b!737870 (= e!412793 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!327318))))

(declare-fun b!737871 () Bool)

(declare-fun e!412795 () Bool)

(declare-fun e!412792 () Bool)

(assert (=> b!737871 (= e!412795 e!412792)))

(declare-fun res!495740 () Bool)

(assert (=> b!737871 (=> res!495740 e!412792)))

(assert (=> b!737871 (= res!495740 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327309 #b00000000000000000000000000000000) (bvsge lt!327309 (size!20203 a!3186))))))

(declare-fun lt!327317 () Unit!25129)

(assert (=> b!737871 (= lt!327317 e!412800)))

(declare-fun c!81444 () Bool)

(declare-fun lt!327311 () Bool)

(assert (=> b!737871 (= c!81444 lt!327311)))

(assert (=> b!737871 (= lt!327311 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737871 (= lt!327309 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!737872 () Bool)

(declare-fun res!495753 () Bool)

(assert (=> b!737872 (=> (not res!495753) (not e!412796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41347 (_ BitVec 32)) Bool)

(assert (=> b!737872 (= res!495753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737873 () Bool)

(declare-fun res!495754 () Bool)

(assert (=> b!737873 (=> (not res!495754) (not e!412794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737873 (= res!495754 (validKeyInArray!0 k0!2102))))

(declare-fun b!737874 () Bool)

(declare-fun res!495749 () Bool)

(assert (=> b!737874 (=> res!495749 e!412792)))

(assert (=> b!737874 (= res!495749 e!412791)))

(declare-fun c!81445 () Bool)

(assert (=> b!737874 (= c!81445 lt!327311)))

(declare-fun b!737875 () Bool)

(declare-fun res!495755 () Bool)

(assert (=> b!737875 (=> (not res!495755) (not e!412796))))

(assert (=> b!737875 (= res!495755 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20203 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20203 a!3186))))))

(declare-fun b!737876 () Bool)

(declare-fun e!412798 () Bool)

(assert (=> b!737876 (= e!412790 e!412798)))

(declare-fun res!495748 () Bool)

(assert (=> b!737876 (=> (not res!495748) (not e!412798))))

(declare-fun lt!327314 () SeekEntryResult!7339)

(declare-fun lt!327306 () SeekEntryResult!7339)

(assert (=> b!737876 (= res!495748 (= lt!327314 lt!327306))))

(declare-fun lt!327313 () array!41347)

(declare-fun lt!327308 () (_ BitVec 64))

(assert (=> b!737876 (= lt!327306 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327308 lt!327313 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737876 (= lt!327314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327308 mask!3328) lt!327308 lt!327313 mask!3328))))

(assert (=> b!737876 (= lt!327308 (select (store (arr!19783 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737876 (= lt!327313 (array!41348 (store (arr!19783 a!3186) i!1173 k0!2102) (size!20203 a!3186)))))

(declare-fun b!737877 () Bool)

(declare-fun res!495746 () Bool)

(assert (=> b!737877 (=> (not res!495746) (not e!412794))))

(declare-fun arrayContainsKey!0 (array!41347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737877 (= res!495746 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737878 () Bool)

(declare-fun e!412789 () Bool)

(assert (=> b!737878 (= e!412789 e!412797)))

(declare-fun res!495757 () Bool)

(assert (=> b!737878 (=> (not res!495757) (not e!412797))))

(assert (=> b!737878 (= res!495757 (= (seekEntryOrOpen!0 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!327307))))

(assert (=> b!737878 (= lt!327307 (Found!7339 j!159))))

(declare-fun b!737879 () Bool)

(declare-fun res!495743 () Bool)

(assert (=> b!737879 (=> (not res!495743) (not e!412790))))

(assert (=> b!737879 (= res!495743 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19783 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737880 () Bool)

(assert (=> b!737880 (= e!412792 true)))

(declare-fun lt!327312 () SeekEntryResult!7339)

(assert (=> b!737880 (= lt!327312 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327309 lt!327308 lt!327313 mask!3328))))

(declare-fun b!737881 () Bool)

(assert (=> b!737881 (= e!412796 e!412790)))

(declare-fun res!495751 () Bool)

(assert (=> b!737881 (=> (not res!495751) (not e!412790))))

(assert (=> b!737881 (= res!495751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19783 a!3186) j!159) mask!3328) (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!327318))))

(assert (=> b!737881 (= lt!327318 (Intermediate!7339 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737882 () Bool)

(assert (=> b!737882 (= e!412798 (not e!412795))))

(declare-fun res!495752 () Bool)

(assert (=> b!737882 (=> res!495752 e!412795)))

(get-info :version)

(assert (=> b!737882 (= res!495752 (or (not ((_ is Intermediate!7339) lt!327306)) (bvsge x!1131 (x!62885 lt!327306))))))

(assert (=> b!737882 (= lt!327315 (Found!7339 j!159))))

(assert (=> b!737882 e!412789))

(declare-fun res!495750 () Bool)

(assert (=> b!737882 (=> (not res!495750) (not e!412789))))

(assert (=> b!737882 (= res!495750 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327310 () Unit!25129)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25129)

(assert (=> b!737882 (= lt!327310 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737883 () Bool)

(declare-fun Unit!25132 () Unit!25129)

(assert (=> b!737883 (= e!412800 Unit!25132)))

(declare-fun lt!327316 () SeekEntryResult!7339)

(assert (=> b!737883 (= lt!327316 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19783 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!737883 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327309 resIntermediateIndex!5 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!327315)))

(declare-fun b!737884 () Bool)

(declare-fun res!495745 () Bool)

(assert (=> b!737884 (=> (not res!495745) (not e!412794))))

(assert (=> b!737884 (= res!495745 (validKeyInArray!0 (select (arr!19783 a!3186) j!159)))))

(assert (= (and start!65304 res!495747) b!737861))

(assert (= (and b!737861 res!495744) b!737884))

(assert (= (and b!737884 res!495745) b!737873))

(assert (= (and b!737873 res!495754) b!737877))

(assert (= (and b!737877 res!495746) b!737862))

(assert (= (and b!737862 res!495742) b!737872))

(assert (= (and b!737872 res!495753) b!737866))

(assert (= (and b!737866 res!495741) b!737875))

(assert (= (and b!737875 res!495755) b!737881))

(assert (= (and b!737881 res!495751) b!737879))

(assert (= (and b!737879 res!495743) b!737865))

(assert (= (and b!737865 c!81446) b!737870))

(assert (= (and b!737865 (not c!81446)) b!737864))

(assert (= (and b!737865 res!495756) b!737876))

(assert (= (and b!737876 res!495748) b!737882))

(assert (= (and b!737882 res!495750) b!737878))

(assert (= (and b!737878 res!495757) b!737867))

(assert (= (and b!737882 (not res!495752)) b!737871))

(assert (= (and b!737871 c!81444) b!737868))

(assert (= (and b!737871 (not c!81444)) b!737883))

(assert (= (and b!737871 (not res!495740)) b!737874))

(assert (= (and b!737874 c!81445) b!737863))

(assert (= (and b!737874 (not c!81445)) b!737869))

(assert (= (and b!737874 (not res!495749)) b!737880))

(declare-fun m!690237 () Bool)

(assert (=> b!737870 m!690237))

(assert (=> b!737870 m!690237))

(declare-fun m!690239 () Bool)

(assert (=> b!737870 m!690239))

(declare-fun m!690241 () Bool)

(assert (=> b!737877 m!690241))

(declare-fun m!690243 () Bool)

(assert (=> b!737871 m!690243))

(assert (=> b!737883 m!690237))

(assert (=> b!737883 m!690237))

(declare-fun m!690245 () Bool)

(assert (=> b!737883 m!690245))

(assert (=> b!737883 m!690237))

(declare-fun m!690247 () Bool)

(assert (=> b!737883 m!690247))

(assert (=> b!737881 m!690237))

(assert (=> b!737881 m!690237))

(declare-fun m!690249 () Bool)

(assert (=> b!737881 m!690249))

(assert (=> b!737881 m!690249))

(assert (=> b!737881 m!690237))

(declare-fun m!690251 () Bool)

(assert (=> b!737881 m!690251))

(declare-fun m!690253 () Bool)

(assert (=> b!737866 m!690253))

(assert (=> b!737878 m!690237))

(assert (=> b!737878 m!690237))

(declare-fun m!690255 () Bool)

(assert (=> b!737878 m!690255))

(assert (=> b!737864 m!690237))

(assert (=> b!737864 m!690237))

(assert (=> b!737864 m!690245))

(declare-fun m!690257 () Bool)

(assert (=> b!737876 m!690257))

(declare-fun m!690259 () Bool)

(assert (=> b!737876 m!690259))

(assert (=> b!737876 m!690257))

(declare-fun m!690261 () Bool)

(assert (=> b!737876 m!690261))

(declare-fun m!690263 () Bool)

(assert (=> b!737876 m!690263))

(declare-fun m!690265 () Bool)

(assert (=> b!737876 m!690265))

(declare-fun m!690267 () Bool)

(assert (=> b!737872 m!690267))

(assert (=> b!737868 m!690237))

(assert (=> b!737868 m!690237))

(declare-fun m!690269 () Bool)

(assert (=> b!737868 m!690269))

(declare-fun m!690271 () Bool)

(assert (=> b!737879 m!690271))

(declare-fun m!690273 () Bool)

(assert (=> b!737862 m!690273))

(assert (=> b!737869 m!690237))

(assert (=> b!737869 m!690237))

(assert (=> b!737869 m!690247))

(assert (=> b!737867 m!690237))

(assert (=> b!737867 m!690237))

(declare-fun m!690275 () Bool)

(assert (=> b!737867 m!690275))

(declare-fun m!690277 () Bool)

(assert (=> start!65304 m!690277))

(declare-fun m!690279 () Bool)

(assert (=> start!65304 m!690279))

(declare-fun m!690281 () Bool)

(assert (=> b!737873 m!690281))

(declare-fun m!690283 () Bool)

(assert (=> b!737882 m!690283))

(declare-fun m!690285 () Bool)

(assert (=> b!737882 m!690285))

(assert (=> b!737863 m!690237))

(assert (=> b!737863 m!690237))

(assert (=> b!737863 m!690269))

(assert (=> b!737884 m!690237))

(assert (=> b!737884 m!690237))

(declare-fun m!690287 () Bool)

(assert (=> b!737884 m!690287))

(declare-fun m!690289 () Bool)

(assert (=> b!737880 m!690289))

(check-sat (not b!737882) (not b!737877) (not b!737864) (not b!737868) (not b!737876) (not b!737873) (not b!737872) (not b!737871) (not start!65304) (not b!737867) (not b!737880) (not b!737866) (not b!737883) (not b!737870) (not b!737878) (not b!737881) (not b!737863) (not b!737869) (not b!737862) (not b!737884))
(check-sat)
