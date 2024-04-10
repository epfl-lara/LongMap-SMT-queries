; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65220 () Bool)

(assert start!65220)

(declare-fun b!738700 () Bool)

(declare-fun e!413104 () Bool)

(declare-fun e!413105 () Bool)

(assert (=> b!738700 (= e!413104 e!413105)))

(declare-fun res!496624 () Bool)

(assert (=> b!738700 (=> (not res!496624) (not e!413105))))

(declare-datatypes ((SeekEntryResult!7410 0))(
  ( (MissingZero!7410 (index!32008 (_ BitVec 32))) (Found!7410 (index!32009 (_ BitVec 32))) (Intermediate!7410 (undefined!8222 Bool) (index!32010 (_ BitVec 32)) (x!63000 (_ BitVec 32))) (Undefined!7410) (MissingVacant!7410 (index!32011 (_ BitVec 32))) )
))
(declare-fun lt!327927 () SeekEntryResult!7410)

(declare-fun lt!327926 () SeekEntryResult!7410)

(assert (=> b!738700 (= res!496624 (= lt!327927 lt!327926))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41393 0))(
  ( (array!41394 (arr!19810 (Array (_ BitVec 32) (_ BitVec 64))) (size!20231 (_ BitVec 32))) )
))
(declare-fun lt!327928 () array!41393)

(declare-fun lt!327920 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41393 (_ BitVec 32)) SeekEntryResult!7410)

(assert (=> b!738700 (= lt!327926 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327920 lt!327928 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738700 (= lt!327927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327920 mask!3328) lt!327920 lt!327928 mask!3328))))

(declare-fun a!3186 () array!41393)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!738700 (= lt!327920 (select (store (arr!19810 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738700 (= lt!327928 (array!41394 (store (arr!19810 a!3186) i!1173 k0!2102) (size!20231 a!3186)))))

(declare-fun res!496627 () Bool)

(declare-fun e!413113 () Bool)

(assert (=> start!65220 (=> (not res!496627) (not e!413113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65220 (= res!496627 (validMask!0 mask!3328))))

(assert (=> start!65220 e!413113))

(assert (=> start!65220 true))

(declare-fun array_inv!15606 (array!41393) Bool)

(assert (=> start!65220 (array_inv!15606 a!3186)))

(declare-fun b!738701 () Bool)

(declare-fun e!413111 () Bool)

(declare-fun e!413108 () Bool)

(assert (=> b!738701 (= e!413111 e!413108)))

(declare-fun res!496623 () Bool)

(assert (=> b!738701 (=> (not res!496623) (not e!413108))))

(declare-fun lt!327919 () SeekEntryResult!7410)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41393 (_ BitVec 32)) SeekEntryResult!7410)

(assert (=> b!738701 (= res!496623 (= (seekEntryOrOpen!0 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!327919))))

(assert (=> b!738701 (= lt!327919 (Found!7410 j!159))))

(declare-fun b!738702 () Bool)

(declare-datatypes ((Unit!25236 0))(
  ( (Unit!25237) )
))
(declare-fun e!413109 () Unit!25236)

(declare-fun Unit!25238 () Unit!25236)

(assert (=> b!738702 (= e!413109 Unit!25238)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!327917 () SeekEntryResult!7410)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41393 (_ BitVec 32)) SeekEntryResult!7410)

(assert (=> b!738702 (= lt!327917 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19810 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327929 () SeekEntryResult!7410)

(declare-fun lt!327921 () (_ BitVec 32))

(assert (=> b!738702 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327921 resIntermediateIndex!5 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!327929)))

(declare-fun b!738703 () Bool)

(declare-fun res!496638 () Bool)

(assert (=> b!738703 (=> (not res!496638) (not e!413113))))

(declare-fun arrayContainsKey!0 (array!41393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738703 (= res!496638 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738704 () Bool)

(declare-fun res!496637 () Bool)

(assert (=> b!738704 (=> (not res!496637) (not e!413113))))

(assert (=> b!738704 (= res!496637 (and (= (size!20231 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20231 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20231 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!413103 () Bool)

(declare-fun lt!327916 () SeekEntryResult!7410)

(declare-fun b!738705 () Bool)

(assert (=> b!738705 (= e!413103 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327921 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!327916)))))

(declare-fun b!738706 () Bool)

(declare-fun Unit!25239 () Unit!25236)

(assert (=> b!738706 (= e!413109 Unit!25239)))

(assert (=> b!738706 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327921 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!327916)))

(declare-fun b!738707 () Bool)

(assert (=> b!738707 (= e!413103 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327921 resIntermediateIndex!5 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!327929)))))

(declare-fun b!738708 () Bool)

(declare-fun res!496626 () Bool)

(declare-fun e!413106 () Bool)

(assert (=> b!738708 (=> (not res!496626) (not e!413106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41393 (_ BitVec 32)) Bool)

(assert (=> b!738708 (= res!496626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738709 () Bool)

(declare-fun res!496629 () Bool)

(assert (=> b!738709 (=> (not res!496629) (not e!413113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738709 (= res!496629 (validKeyInArray!0 (select (arr!19810 a!3186) j!159)))))

(declare-fun b!738710 () Bool)

(declare-fun e!413114 () Bool)

(assert (=> b!738710 (= e!413114 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!327916))))

(declare-fun b!738711 () Bool)

(assert (=> b!738711 (= e!413114 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) (Found!7410 j!159)))))

(declare-fun b!738712 () Bool)

(declare-fun res!496625 () Bool)

(assert (=> b!738712 (=> (not res!496625) (not e!413106))))

(declare-datatypes ((List!13812 0))(
  ( (Nil!13809) (Cons!13808 (h!14880 (_ BitVec 64)) (t!20127 List!13812)) )
))
(declare-fun arrayNoDuplicates!0 (array!41393 (_ BitVec 32) List!13812) Bool)

(assert (=> b!738712 (= res!496625 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13809))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!738713 () Bool)

(assert (=> b!738713 (= e!413108 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!327919))))

(declare-fun b!738714 () Bool)

(declare-fun e!413107 () Bool)

(assert (=> b!738714 (= e!413107 true)))

(declare-fun lt!327918 () SeekEntryResult!7410)

(assert (=> b!738714 (= lt!327918 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327921 lt!327920 lt!327928 mask!3328))))

(declare-fun b!738715 () Bool)

(assert (=> b!738715 (= e!413113 e!413106)))

(declare-fun res!496635 () Bool)

(assert (=> b!738715 (=> (not res!496635) (not e!413106))))

(declare-fun lt!327924 () SeekEntryResult!7410)

(assert (=> b!738715 (= res!496635 (or (= lt!327924 (MissingZero!7410 i!1173)) (= lt!327924 (MissingVacant!7410 i!1173))))))

(assert (=> b!738715 (= lt!327924 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!738716 () Bool)

(assert (=> b!738716 (= e!413106 e!413104)))

(declare-fun res!496636 () Bool)

(assert (=> b!738716 (=> (not res!496636) (not e!413104))))

(assert (=> b!738716 (= res!496636 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19810 a!3186) j!159) mask!3328) (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!327916))))

(assert (=> b!738716 (= lt!327916 (Intermediate!7410 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738717 () Bool)

(declare-fun res!496639 () Bool)

(assert (=> b!738717 (=> (not res!496639) (not e!413106))))

(assert (=> b!738717 (= res!496639 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20231 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20231 a!3186))))))

(declare-fun b!738718 () Bool)

(declare-fun res!496630 () Bool)

(assert (=> b!738718 (=> (not res!496630) (not e!413104))))

(assert (=> b!738718 (= res!496630 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19810 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738719 () Bool)

(declare-fun res!496632 () Bool)

(assert (=> b!738719 (=> (not res!496632) (not e!413104))))

(assert (=> b!738719 (= res!496632 e!413114)))

(declare-fun c!81420 () Bool)

(assert (=> b!738719 (= c!81420 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738720 () Bool)

(declare-fun res!496634 () Bool)

(assert (=> b!738720 (=> res!496634 e!413107)))

(assert (=> b!738720 (= res!496634 e!413103)))

(declare-fun c!81421 () Bool)

(declare-fun lt!327925 () Bool)

(assert (=> b!738720 (= c!81421 lt!327925)))

(declare-fun b!738721 () Bool)

(declare-fun e!413112 () Bool)

(assert (=> b!738721 (= e!413105 (not e!413112))))

(declare-fun res!496628 () Bool)

(assert (=> b!738721 (=> res!496628 e!413112)))

(get-info :version)

(assert (=> b!738721 (= res!496628 (or (not ((_ is Intermediate!7410) lt!327926)) (bvsge x!1131 (x!63000 lt!327926))))))

(assert (=> b!738721 (= lt!327929 (Found!7410 j!159))))

(assert (=> b!738721 e!413111))

(declare-fun res!496640 () Bool)

(assert (=> b!738721 (=> (not res!496640) (not e!413111))))

(assert (=> b!738721 (= res!496640 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327923 () Unit!25236)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41393 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25236)

(assert (=> b!738721 (= lt!327923 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738722 () Bool)

(assert (=> b!738722 (= e!413112 e!413107)))

(declare-fun res!496631 () Bool)

(assert (=> b!738722 (=> res!496631 e!413107)))

(assert (=> b!738722 (= res!496631 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327921 #b00000000000000000000000000000000) (bvsge lt!327921 (size!20231 a!3186))))))

(declare-fun lt!327922 () Unit!25236)

(assert (=> b!738722 (= lt!327922 e!413109)))

(declare-fun c!81419 () Bool)

(assert (=> b!738722 (= c!81419 lt!327925)))

(assert (=> b!738722 (= lt!327925 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738722 (= lt!327921 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738723 () Bool)

(declare-fun res!496633 () Bool)

(assert (=> b!738723 (=> (not res!496633) (not e!413113))))

(assert (=> b!738723 (= res!496633 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65220 res!496627) b!738704))

(assert (= (and b!738704 res!496637) b!738709))

(assert (= (and b!738709 res!496629) b!738723))

(assert (= (and b!738723 res!496633) b!738703))

(assert (= (and b!738703 res!496638) b!738715))

(assert (= (and b!738715 res!496635) b!738708))

(assert (= (and b!738708 res!496626) b!738712))

(assert (= (and b!738712 res!496625) b!738717))

(assert (= (and b!738717 res!496639) b!738716))

(assert (= (and b!738716 res!496636) b!738718))

(assert (= (and b!738718 res!496630) b!738719))

(assert (= (and b!738719 c!81420) b!738710))

(assert (= (and b!738719 (not c!81420)) b!738711))

(assert (= (and b!738719 res!496632) b!738700))

(assert (= (and b!738700 res!496624) b!738721))

(assert (= (and b!738721 res!496640) b!738701))

(assert (= (and b!738701 res!496623) b!738713))

(assert (= (and b!738721 (not res!496628)) b!738722))

(assert (= (and b!738722 c!81419) b!738706))

(assert (= (and b!738722 (not c!81419)) b!738702))

(assert (= (and b!738722 (not res!496631)) b!738720))

(assert (= (and b!738720 c!81421) b!738705))

(assert (= (and b!738720 (not c!81421)) b!738707))

(assert (= (and b!738720 (not res!496634)) b!738714))

(declare-fun m!690265 () Bool)

(assert (=> b!738713 m!690265))

(assert (=> b!738713 m!690265))

(declare-fun m!690267 () Bool)

(assert (=> b!738713 m!690267))

(assert (=> b!738716 m!690265))

(assert (=> b!738716 m!690265))

(declare-fun m!690269 () Bool)

(assert (=> b!738716 m!690269))

(assert (=> b!738716 m!690269))

(assert (=> b!738716 m!690265))

(declare-fun m!690271 () Bool)

(assert (=> b!738716 m!690271))

(declare-fun m!690273 () Bool)

(assert (=> b!738723 m!690273))

(assert (=> b!738705 m!690265))

(assert (=> b!738705 m!690265))

(declare-fun m!690275 () Bool)

(assert (=> b!738705 m!690275))

(declare-fun m!690277 () Bool)

(assert (=> b!738714 m!690277))

(declare-fun m!690279 () Bool)

(assert (=> b!738700 m!690279))

(assert (=> b!738700 m!690279))

(declare-fun m!690281 () Bool)

(assert (=> b!738700 m!690281))

(declare-fun m!690283 () Bool)

(assert (=> b!738700 m!690283))

(declare-fun m!690285 () Bool)

(assert (=> b!738700 m!690285))

(declare-fun m!690287 () Bool)

(assert (=> b!738700 m!690287))

(declare-fun m!690289 () Bool)

(assert (=> start!65220 m!690289))

(declare-fun m!690291 () Bool)

(assert (=> start!65220 m!690291))

(declare-fun m!690293 () Bool)

(assert (=> b!738718 m!690293))

(assert (=> b!738710 m!690265))

(assert (=> b!738710 m!690265))

(declare-fun m!690295 () Bool)

(assert (=> b!738710 m!690295))

(declare-fun m!690297 () Bool)

(assert (=> b!738722 m!690297))

(declare-fun m!690299 () Bool)

(assert (=> b!738703 m!690299))

(assert (=> b!738706 m!690265))

(assert (=> b!738706 m!690265))

(assert (=> b!738706 m!690275))

(declare-fun m!690301 () Bool)

(assert (=> b!738712 m!690301))

(declare-fun m!690303 () Bool)

(assert (=> b!738715 m!690303))

(assert (=> b!738709 m!690265))

(assert (=> b!738709 m!690265))

(declare-fun m!690305 () Bool)

(assert (=> b!738709 m!690305))

(declare-fun m!690307 () Bool)

(assert (=> b!738708 m!690307))

(assert (=> b!738701 m!690265))

(assert (=> b!738701 m!690265))

(declare-fun m!690309 () Bool)

(assert (=> b!738701 m!690309))

(assert (=> b!738702 m!690265))

(assert (=> b!738702 m!690265))

(declare-fun m!690311 () Bool)

(assert (=> b!738702 m!690311))

(assert (=> b!738702 m!690265))

(declare-fun m!690313 () Bool)

(assert (=> b!738702 m!690313))

(assert (=> b!738711 m!690265))

(assert (=> b!738711 m!690265))

(assert (=> b!738711 m!690311))

(declare-fun m!690315 () Bool)

(assert (=> b!738721 m!690315))

(declare-fun m!690317 () Bool)

(assert (=> b!738721 m!690317))

(assert (=> b!738707 m!690265))

(assert (=> b!738707 m!690265))

(assert (=> b!738707 m!690313))

(check-sat (not b!738713) (not b!738711) (not b!738722) (not b!738705) (not b!738723) (not b!738702) (not b!738716) (not b!738715) (not b!738706) (not b!738707) (not b!738712) (not b!738721) (not b!738703) (not start!65220) (not b!738700) (not b!738701) (not b!738710) (not b!738709) (not b!738714) (not b!738708))
(check-sat)
