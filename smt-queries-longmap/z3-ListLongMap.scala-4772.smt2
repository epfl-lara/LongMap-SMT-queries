; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65672 () Bool)

(assert start!65672)

(declare-fun b!753037 () Bool)

(declare-fun e!419996 () Bool)

(declare-datatypes ((SeekEntryResult!7642 0))(
  ( (MissingZero!7642 (index!32936 (_ BitVec 32))) (Found!7642 (index!32937 (_ BitVec 32))) (Intermediate!7642 (undefined!8454 Bool) (index!32938 (_ BitVec 32)) (x!63859 (_ BitVec 32))) (Undefined!7642) (MissingVacant!7642 (index!32939 (_ BitVec 32))) )
))
(declare-fun lt!334902 () SeekEntryResult!7642)

(declare-fun lt!334908 () SeekEntryResult!7642)

(assert (=> b!753037 (= e!419996 (= lt!334902 lt!334908))))

(declare-fun b!753038 () Bool)

(declare-fun e!420004 () Bool)

(assert (=> b!753038 (= e!420004 true)))

(assert (=> b!753038 e!419996))

(declare-fun res!508738 () Bool)

(assert (=> b!753038 (=> (not res!508738) (not e!419996))))

(declare-fun lt!334911 () (_ BitVec 64))

(assert (=> b!753038 (= res!508738 (= lt!334911 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25928 0))(
  ( (Unit!25929) )
))
(declare-fun lt!334909 () Unit!25928)

(declare-fun e!420001 () Unit!25928)

(assert (=> b!753038 (= lt!334909 e!420001)))

(declare-fun c!82536 () Bool)

(assert (=> b!753038 (= c!82536 (= lt!334911 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753039 () Bool)

(declare-fun res!508729 () Bool)

(declare-fun e!420006 () Bool)

(assert (=> b!753039 (=> (not res!508729) (not e!420006))))

(declare-datatypes ((array!41862 0))(
  ( (array!41863 (arr!20045 (Array (_ BitVec 32) (_ BitVec 64))) (size!20466 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41862)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!753039 (= res!508729 (and (= (size!20466 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20466 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20466 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753040 () Bool)

(declare-fun res!508745 () Bool)

(assert (=> b!753040 (=> (not res!508745) (not e!420006))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753040 (= res!508745 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!753041 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!420007 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41862 (_ BitVec 32)) SeekEntryResult!7642)

(assert (=> b!753041 (= e!420007 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20045 a!3186) j!159) a!3186 mask!3328) (Found!7642 j!159)))))

(declare-fun b!753042 () Bool)

(declare-fun Unit!25930 () Unit!25928)

(assert (=> b!753042 (= e!420001 Unit!25930)))

(assert (=> b!753042 false))

(declare-fun res!508730 () Bool)

(assert (=> start!65672 (=> (not res!508730) (not e!420006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65672 (= res!508730 (validMask!0 mask!3328))))

(assert (=> start!65672 e!420006))

(assert (=> start!65672 true))

(declare-fun array_inv!15928 (array!41862) Bool)

(assert (=> start!65672 (array_inv!15928 a!3186)))

(declare-fun b!753043 () Bool)

(declare-fun res!508728 () Bool)

(declare-fun e!420002 () Bool)

(assert (=> b!753043 (=> (not res!508728) (not e!420002))))

(declare-datatypes ((List!14086 0))(
  ( (Nil!14083) (Cons!14082 (h!15154 (_ BitVec 64)) (t!20392 List!14086)) )
))
(declare-fun arrayNoDuplicates!0 (array!41862 (_ BitVec 32) List!14086) Bool)

(assert (=> b!753043 (= res!508728 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14083))))

(declare-fun b!753044 () Bool)

(declare-fun res!508744 () Bool)

(assert (=> b!753044 (=> (not res!508744) (not e!420002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41862 (_ BitVec 32)) Bool)

(assert (=> b!753044 (= res!508744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753045 () Bool)

(declare-fun e!419999 () Bool)

(assert (=> b!753045 (= e!419999 e!420004)))

(declare-fun res!508740 () Bool)

(assert (=> b!753045 (=> res!508740 e!420004)))

(declare-fun lt!334910 () (_ BitVec 64))

(assert (=> b!753045 (= res!508740 (= lt!334911 lt!334910))))

(assert (=> b!753045 (= lt!334911 (select (store (arr!20045 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753046 () Bool)

(declare-fun res!508737 () Bool)

(assert (=> b!753046 (=> (not res!508737) (not e!420002))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753046 (= res!508737 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20466 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20466 a!3186))))))

(declare-fun b!753047 () Bool)

(declare-fun lt!334904 () SeekEntryResult!7642)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41862 (_ BitVec 32)) SeekEntryResult!7642)

(assert (=> b!753047 (= e!420007 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20045 a!3186) j!159) a!3186 mask!3328) lt!334904))))

(declare-fun b!753048 () Bool)

(declare-fun e!419997 () Bool)

(declare-fun e!420003 () Bool)

(assert (=> b!753048 (= e!419997 (not e!420003))))

(declare-fun res!508731 () Bool)

(assert (=> b!753048 (=> res!508731 e!420003)))

(declare-fun lt!334903 () SeekEntryResult!7642)

(get-info :version)

(assert (=> b!753048 (= res!508731 (or (not ((_ is Intermediate!7642) lt!334903)) (bvslt x!1131 (x!63859 lt!334903)) (not (= x!1131 (x!63859 lt!334903))) (not (= index!1321 (index!32938 lt!334903)))))))

(declare-fun e!419998 () Bool)

(assert (=> b!753048 e!419998))

(declare-fun res!508743 () Bool)

(assert (=> b!753048 (=> (not res!508743) (not e!419998))))

(declare-fun lt!334907 () SeekEntryResult!7642)

(assert (=> b!753048 (= res!508743 (= lt!334902 lt!334907))))

(assert (=> b!753048 (= lt!334907 (Found!7642 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41862 (_ BitVec 32)) SeekEntryResult!7642)

(assert (=> b!753048 (= lt!334902 (seekEntryOrOpen!0 (select (arr!20045 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!753048 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334913 () Unit!25928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25928)

(assert (=> b!753048 (= lt!334913 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753049 () Bool)

(declare-fun res!508739 () Bool)

(declare-fun e!420000 () Bool)

(assert (=> b!753049 (=> (not res!508739) (not e!420000))))

(assert (=> b!753049 (= res!508739 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20045 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753050 () Bool)

(declare-fun res!508735 () Bool)

(assert (=> b!753050 (=> (not res!508735) (not e!419996))))

(declare-fun lt!334905 () array!41862)

(assert (=> b!753050 (= res!508735 (= (seekEntryOrOpen!0 lt!334910 lt!334905 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334910 lt!334905 mask!3328)))))

(declare-fun b!753051 () Bool)

(declare-fun Unit!25931 () Unit!25928)

(assert (=> b!753051 (= e!420001 Unit!25931)))

(declare-fun b!753052 () Bool)

(assert (=> b!753052 (= e!420002 e!420000)))

(declare-fun res!508732 () Bool)

(assert (=> b!753052 (=> (not res!508732) (not e!420000))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753052 (= res!508732 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20045 a!3186) j!159) mask!3328) (select (arr!20045 a!3186) j!159) a!3186 mask!3328) lt!334904))))

(assert (=> b!753052 (= lt!334904 (Intermediate!7642 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753053 () Bool)

(declare-fun res!508733 () Bool)

(assert (=> b!753053 (=> (not res!508733) (not e!420000))))

(assert (=> b!753053 (= res!508733 e!420007)))

(declare-fun c!82535 () Bool)

(assert (=> b!753053 (= c!82535 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753054 () Bool)

(assert (=> b!753054 (= e!420000 e!419997)))

(declare-fun res!508742 () Bool)

(assert (=> b!753054 (=> (not res!508742) (not e!419997))))

(declare-fun lt!334906 () SeekEntryResult!7642)

(assert (=> b!753054 (= res!508742 (= lt!334906 lt!334903))))

(assert (=> b!753054 (= lt!334903 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334910 lt!334905 mask!3328))))

(assert (=> b!753054 (= lt!334906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334910 mask!3328) lt!334910 lt!334905 mask!3328))))

(assert (=> b!753054 (= lt!334910 (select (store (arr!20045 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753054 (= lt!334905 (array!41863 (store (arr!20045 a!3186) i!1173 k0!2102) (size!20466 a!3186)))))

(declare-fun b!753055 () Bool)

(declare-fun res!508741 () Bool)

(assert (=> b!753055 (=> (not res!508741) (not e!420006))))

(assert (=> b!753055 (= res!508741 (validKeyInArray!0 (select (arr!20045 a!3186) j!159)))))

(declare-fun b!753056 () Bool)

(assert (=> b!753056 (= e!420003 e!419999)))

(declare-fun res!508734 () Bool)

(assert (=> b!753056 (=> res!508734 e!419999)))

(assert (=> b!753056 (= res!508734 (not (= lt!334908 lt!334907)))))

(assert (=> b!753056 (= lt!334908 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20045 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753057 () Bool)

(declare-fun res!508746 () Bool)

(assert (=> b!753057 (=> (not res!508746) (not e!420006))))

(declare-fun arrayContainsKey!0 (array!41862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753057 (= res!508746 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753058 () Bool)

(assert (=> b!753058 (= e!419998 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20045 a!3186) j!159) a!3186 mask!3328) lt!334907))))

(declare-fun b!753059 () Bool)

(assert (=> b!753059 (= e!420006 e!420002)))

(declare-fun res!508736 () Bool)

(assert (=> b!753059 (=> (not res!508736) (not e!420002))))

(declare-fun lt!334912 () SeekEntryResult!7642)

(assert (=> b!753059 (= res!508736 (or (= lt!334912 (MissingZero!7642 i!1173)) (= lt!334912 (MissingVacant!7642 i!1173))))))

(assert (=> b!753059 (= lt!334912 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65672 res!508730) b!753039))

(assert (= (and b!753039 res!508729) b!753055))

(assert (= (and b!753055 res!508741) b!753040))

(assert (= (and b!753040 res!508745) b!753057))

(assert (= (and b!753057 res!508746) b!753059))

(assert (= (and b!753059 res!508736) b!753044))

(assert (= (and b!753044 res!508744) b!753043))

(assert (= (and b!753043 res!508728) b!753046))

(assert (= (and b!753046 res!508737) b!753052))

(assert (= (and b!753052 res!508732) b!753049))

(assert (= (and b!753049 res!508739) b!753053))

(assert (= (and b!753053 c!82535) b!753047))

(assert (= (and b!753053 (not c!82535)) b!753041))

(assert (= (and b!753053 res!508733) b!753054))

(assert (= (and b!753054 res!508742) b!753048))

(assert (= (and b!753048 res!508743) b!753058))

(assert (= (and b!753048 (not res!508731)) b!753056))

(assert (= (and b!753056 (not res!508734)) b!753045))

(assert (= (and b!753045 (not res!508740)) b!753038))

(assert (= (and b!753038 c!82536) b!753042))

(assert (= (and b!753038 (not c!82536)) b!753051))

(assert (= (and b!753038 res!508738) b!753050))

(assert (= (and b!753050 res!508735) b!753037))

(declare-fun m!701261 () Bool)

(assert (=> b!753049 m!701261))

(declare-fun m!701263 () Bool)

(assert (=> b!753044 m!701263))

(declare-fun m!701265 () Bool)

(assert (=> b!753056 m!701265))

(assert (=> b!753056 m!701265))

(declare-fun m!701267 () Bool)

(assert (=> b!753056 m!701267))

(declare-fun m!701269 () Bool)

(assert (=> b!753054 m!701269))

(declare-fun m!701271 () Bool)

(assert (=> b!753054 m!701271))

(declare-fun m!701273 () Bool)

(assert (=> b!753054 m!701273))

(declare-fun m!701275 () Bool)

(assert (=> b!753054 m!701275))

(assert (=> b!753054 m!701269))

(declare-fun m!701277 () Bool)

(assert (=> b!753054 m!701277))

(declare-fun m!701279 () Bool)

(assert (=> b!753050 m!701279))

(declare-fun m!701281 () Bool)

(assert (=> b!753050 m!701281))

(assert (=> b!753048 m!701265))

(assert (=> b!753048 m!701265))

(declare-fun m!701283 () Bool)

(assert (=> b!753048 m!701283))

(declare-fun m!701285 () Bool)

(assert (=> b!753048 m!701285))

(declare-fun m!701287 () Bool)

(assert (=> b!753048 m!701287))

(declare-fun m!701289 () Bool)

(assert (=> b!753040 m!701289))

(declare-fun m!701291 () Bool)

(assert (=> b!753057 m!701291))

(assert (=> b!753047 m!701265))

(assert (=> b!753047 m!701265))

(declare-fun m!701293 () Bool)

(assert (=> b!753047 m!701293))

(assert (=> b!753058 m!701265))

(assert (=> b!753058 m!701265))

(declare-fun m!701295 () Bool)

(assert (=> b!753058 m!701295))

(declare-fun m!701297 () Bool)

(assert (=> start!65672 m!701297))

(declare-fun m!701299 () Bool)

(assert (=> start!65672 m!701299))

(declare-fun m!701301 () Bool)

(assert (=> b!753043 m!701301))

(assert (=> b!753041 m!701265))

(assert (=> b!753041 m!701265))

(assert (=> b!753041 m!701267))

(declare-fun m!701303 () Bool)

(assert (=> b!753059 m!701303))

(assert (=> b!753055 m!701265))

(assert (=> b!753055 m!701265))

(declare-fun m!701305 () Bool)

(assert (=> b!753055 m!701305))

(assert (=> b!753045 m!701275))

(declare-fun m!701307 () Bool)

(assert (=> b!753045 m!701307))

(assert (=> b!753052 m!701265))

(assert (=> b!753052 m!701265))

(declare-fun m!701309 () Bool)

(assert (=> b!753052 m!701309))

(assert (=> b!753052 m!701309))

(assert (=> b!753052 m!701265))

(declare-fun m!701311 () Bool)

(assert (=> b!753052 m!701311))

(check-sat (not b!753057) (not b!753047) (not b!753059) (not b!753043) (not b!753044) (not b!753052) (not b!753054) (not b!753048) (not b!753041) (not b!753058) (not b!753055) (not b!753050) (not b!753040) (not b!753056) (not start!65672))
(check-sat)
