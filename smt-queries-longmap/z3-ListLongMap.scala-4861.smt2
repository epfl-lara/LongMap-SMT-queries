; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66986 () Bool)

(assert start!66986)

(declare-fun b!772990 () Bool)

(declare-fun res!522821 () Bool)

(declare-fun e!430293 () Bool)

(assert (=> b!772990 (=> (not res!522821) (not e!430293))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42429 0))(
  ( (array!42430 (arr!20312 (Array (_ BitVec 32) (_ BitVec 64))) (size!20733 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42429)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!772990 (= res!522821 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20733 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20733 a!3186))))))

(declare-fun b!772991 () Bool)

(declare-fun res!522823 () Bool)

(assert (=> b!772991 (=> (not res!522823) (not e!430293))))

(declare-datatypes ((List!14353 0))(
  ( (Nil!14350) (Cons!14349 (h!15454 (_ BitVec 64)) (t!20659 List!14353)) )
))
(declare-fun arrayNoDuplicates!0 (array!42429 (_ BitVec 32) List!14353) Bool)

(assert (=> b!772991 (= res!522823 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14350))))

(declare-fun b!772992 () Bool)

(declare-fun e!430292 () Bool)

(declare-fun e!430296 () Bool)

(assert (=> b!772992 (= e!430292 e!430296)))

(declare-fun res!522813 () Bool)

(assert (=> b!772992 (=> (not res!522813) (not e!430296))))

(declare-datatypes ((SeekEntryResult!7909 0))(
  ( (MissingZero!7909 (index!34004 (_ BitVec 32))) (Found!7909 (index!34005 (_ BitVec 32))) (Intermediate!7909 (undefined!8721 Bool) (index!34006 (_ BitVec 32)) (x!64955 (_ BitVec 32))) (Undefined!7909) (MissingVacant!7909 (index!34007 (_ BitVec 32))) )
))
(declare-fun lt!344060 () SeekEntryResult!7909)

(declare-fun lt!344065 () SeekEntryResult!7909)

(assert (=> b!772992 (= res!522813 (= lt!344060 lt!344065))))

(declare-fun lt!344066 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!344067 () array!42429)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42429 (_ BitVec 32)) SeekEntryResult!7909)

(assert (=> b!772992 (= lt!344065 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344066 lt!344067 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772992 (= lt!344060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344066 mask!3328) lt!344066 lt!344067 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!772992 (= lt!344066 (select (store (arr!20312 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!772992 (= lt!344067 (array!42430 (store (arr!20312 a!3186) i!1173 k0!2102) (size!20733 a!3186)))))

(declare-fun b!772993 () Bool)

(declare-fun res!522819 () Bool)

(declare-fun e!430290 () Bool)

(assert (=> b!772993 (=> (not res!522819) (not e!430290))))

(declare-fun arrayContainsKey!0 (array!42429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772993 (= res!522819 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772994 () Bool)

(declare-fun e!430291 () Bool)

(declare-fun lt!344062 () SeekEntryResult!7909)

(assert (=> b!772994 (= e!430291 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20312 a!3186) j!159) a!3186 mask!3328) lt!344062))))

(declare-fun res!522815 () Bool)

(assert (=> start!66986 (=> (not res!522815) (not e!430290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66986 (= res!522815 (validMask!0 mask!3328))))

(assert (=> start!66986 e!430290))

(assert (=> start!66986 true))

(declare-fun array_inv!16195 (array!42429) Bool)

(assert (=> start!66986 (array_inv!16195 a!3186)))

(declare-fun b!772995 () Bool)

(declare-fun res!522820 () Bool)

(assert (=> b!772995 (=> (not res!522820) (not e!430290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772995 (= res!522820 (validKeyInArray!0 k0!2102))))

(declare-fun b!772996 () Bool)

(declare-fun e!430297 () Bool)

(declare-fun e!430289 () Bool)

(assert (=> b!772996 (= e!430297 e!430289)))

(declare-fun res!522817 () Bool)

(assert (=> b!772996 (=> (not res!522817) (not e!430289))))

(declare-fun lt!344059 () SeekEntryResult!7909)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42429 (_ BitVec 32)) SeekEntryResult!7909)

(assert (=> b!772996 (= res!522817 (= (seekEntryOrOpen!0 (select (arr!20312 a!3186) j!159) a!3186 mask!3328) lt!344059))))

(assert (=> b!772996 (= lt!344059 (Found!7909 j!159))))

(declare-fun b!772997 () Bool)

(declare-fun res!522814 () Bool)

(assert (=> b!772997 (=> (not res!522814) (not e!430293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42429 (_ BitVec 32)) Bool)

(assert (=> b!772997 (= res!522814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!772998 () Bool)

(declare-fun e!430295 () Bool)

(assert (=> b!772998 (= e!430296 (not e!430295))))

(declare-fun res!522825 () Bool)

(assert (=> b!772998 (=> res!522825 e!430295)))

(get-info :version)

(assert (=> b!772998 (= res!522825 (or (not ((_ is Intermediate!7909) lt!344065)) (bvsge x!1131 (x!64955 lt!344065))))))

(assert (=> b!772998 e!430297))

(declare-fun res!522827 () Bool)

(assert (=> b!772998 (=> (not res!522827) (not e!430297))))

(assert (=> b!772998 (= res!522827 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26630 0))(
  ( (Unit!26631) )
))
(declare-fun lt!344064 () Unit!26630)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42429 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26630)

(assert (=> b!772998 (= lt!344064 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!772999 () Bool)

(assert (=> b!772999 (= e!430290 e!430293)))

(declare-fun res!522816 () Bool)

(assert (=> b!772999 (=> (not res!522816) (not e!430293))))

(declare-fun lt!344068 () SeekEntryResult!7909)

(assert (=> b!772999 (= res!522816 (or (= lt!344068 (MissingZero!7909 i!1173)) (= lt!344068 (MissingVacant!7909 i!1173))))))

(assert (=> b!772999 (= lt!344068 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!773000 () Bool)

(declare-fun e!430288 () Unit!26630)

(declare-fun Unit!26632 () Unit!26630)

(assert (=> b!773000 (= e!430288 Unit!26632)))

(declare-fun lt!344063 () SeekEntryResult!7909)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42429 (_ BitVec 32)) SeekEntryResult!7909)

(assert (=> b!773000 (= lt!344063 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20312 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!344069 () (_ BitVec 32))

(assert (=> b!773000 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344069 resIntermediateIndex!5 (select (arr!20312 a!3186) j!159) a!3186 mask!3328) (Found!7909 j!159))))

(declare-fun b!773001 () Bool)

(assert (=> b!773001 (= e!430289 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20312 a!3186) j!159) a!3186 mask!3328) lt!344059))))

(declare-fun b!773002 () Bool)

(assert (=> b!773002 (= e!430293 e!430292)))

(declare-fun res!522822 () Bool)

(assert (=> b!773002 (=> (not res!522822) (not e!430292))))

(assert (=> b!773002 (= res!522822 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20312 a!3186) j!159) mask!3328) (select (arr!20312 a!3186) j!159) a!3186 mask!3328) lt!344062))))

(assert (=> b!773002 (= lt!344062 (Intermediate!7909 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773003 () Bool)

(assert (=> b!773003 (= e!430291 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20312 a!3186) j!159) a!3186 mask!3328) (Found!7909 j!159)))))

(declare-fun b!773004 () Bool)

(declare-fun res!522818 () Bool)

(assert (=> b!773004 (=> (not res!522818) (not e!430292))))

(assert (=> b!773004 (= res!522818 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20312 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773005 () Bool)

(declare-fun res!522828 () Bool)

(assert (=> b!773005 (=> (not res!522828) (not e!430290))))

(assert (=> b!773005 (= res!522828 (validKeyInArray!0 (select (arr!20312 a!3186) j!159)))))

(declare-fun b!773006 () Bool)

(assert (=> b!773006 (= e!430295 true)))

(declare-fun lt!344061 () Unit!26630)

(assert (=> b!773006 (= lt!344061 e!430288)))

(declare-fun c!85488 () Bool)

(assert (=> b!773006 (= c!85488 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773006 (= lt!344069 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773007 () Bool)

(declare-fun res!522824 () Bool)

(assert (=> b!773007 (=> (not res!522824) (not e!430290))))

(assert (=> b!773007 (= res!522824 (and (= (size!20733 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20733 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20733 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773008 () Bool)

(declare-fun res!522826 () Bool)

(assert (=> b!773008 (=> (not res!522826) (not e!430292))))

(assert (=> b!773008 (= res!522826 e!430291)))

(declare-fun c!85487 () Bool)

(assert (=> b!773008 (= c!85487 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773009 () Bool)

(declare-fun Unit!26633 () Unit!26630)

(assert (=> b!773009 (= e!430288 Unit!26633)))

(assert (=> b!773009 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344069 (select (arr!20312 a!3186) j!159) a!3186 mask!3328) lt!344062)))

(assert (= (and start!66986 res!522815) b!773007))

(assert (= (and b!773007 res!522824) b!773005))

(assert (= (and b!773005 res!522828) b!772995))

(assert (= (and b!772995 res!522820) b!772993))

(assert (= (and b!772993 res!522819) b!772999))

(assert (= (and b!772999 res!522816) b!772997))

(assert (= (and b!772997 res!522814) b!772991))

(assert (= (and b!772991 res!522823) b!772990))

(assert (= (and b!772990 res!522821) b!773002))

(assert (= (and b!773002 res!522822) b!773004))

(assert (= (and b!773004 res!522818) b!773008))

(assert (= (and b!773008 c!85487) b!772994))

(assert (= (and b!773008 (not c!85487)) b!773003))

(assert (= (and b!773008 res!522826) b!772992))

(assert (= (and b!772992 res!522813) b!772998))

(assert (= (and b!772998 res!522827) b!772996))

(assert (= (and b!772996 res!522817) b!773001))

(assert (= (and b!772998 (not res!522825)) b!773006))

(assert (= (and b!773006 c!85488) b!773009))

(assert (= (and b!773006 (not c!85488)) b!773000))

(declare-fun m!717237 () Bool)

(assert (=> b!773009 m!717237))

(assert (=> b!773009 m!717237))

(declare-fun m!717239 () Bool)

(assert (=> b!773009 m!717239))

(assert (=> b!772994 m!717237))

(assert (=> b!772994 m!717237))

(declare-fun m!717241 () Bool)

(assert (=> b!772994 m!717241))

(declare-fun m!717243 () Bool)

(assert (=> b!772998 m!717243))

(declare-fun m!717245 () Bool)

(assert (=> b!772998 m!717245))

(assert (=> b!773003 m!717237))

(assert (=> b!773003 m!717237))

(declare-fun m!717247 () Bool)

(assert (=> b!773003 m!717247))

(declare-fun m!717249 () Bool)

(assert (=> b!772999 m!717249))

(assert (=> b!773001 m!717237))

(assert (=> b!773001 m!717237))

(declare-fun m!717251 () Bool)

(assert (=> b!773001 m!717251))

(declare-fun m!717253 () Bool)

(assert (=> b!772995 m!717253))

(assert (=> b!773002 m!717237))

(assert (=> b!773002 m!717237))

(declare-fun m!717255 () Bool)

(assert (=> b!773002 m!717255))

(assert (=> b!773002 m!717255))

(assert (=> b!773002 m!717237))

(declare-fun m!717257 () Bool)

(assert (=> b!773002 m!717257))

(assert (=> b!773000 m!717237))

(assert (=> b!773000 m!717237))

(assert (=> b!773000 m!717247))

(assert (=> b!773000 m!717237))

(declare-fun m!717259 () Bool)

(assert (=> b!773000 m!717259))

(declare-fun m!717261 () Bool)

(assert (=> b!773004 m!717261))

(assert (=> b!772996 m!717237))

(assert (=> b!772996 m!717237))

(declare-fun m!717263 () Bool)

(assert (=> b!772996 m!717263))

(assert (=> b!773005 m!717237))

(assert (=> b!773005 m!717237))

(declare-fun m!717265 () Bool)

(assert (=> b!773005 m!717265))

(declare-fun m!717267 () Bool)

(assert (=> b!772991 m!717267))

(declare-fun m!717269 () Bool)

(assert (=> start!66986 m!717269))

(declare-fun m!717271 () Bool)

(assert (=> start!66986 m!717271))

(declare-fun m!717273 () Bool)

(assert (=> b!772997 m!717273))

(declare-fun m!717275 () Bool)

(assert (=> b!772993 m!717275))

(declare-fun m!717277 () Bool)

(assert (=> b!773006 m!717277))

(declare-fun m!717279 () Bool)

(assert (=> b!772992 m!717279))

(declare-fun m!717281 () Bool)

(assert (=> b!772992 m!717281))

(declare-fun m!717283 () Bool)

(assert (=> b!772992 m!717283))

(declare-fun m!717285 () Bool)

(assert (=> b!772992 m!717285))

(declare-fun m!717287 () Bool)

(assert (=> b!772992 m!717287))

(assert (=> b!772992 m!717285))

(check-sat (not b!773000) (not b!772997) (not b!772993) (not b!772999) (not b!773001) (not b!773009) (not b!772995) (not b!772998) (not b!773005) (not b!773002) (not b!772994) (not b!773003) (not b!772991) (not b!773006) (not b!772996) (not b!772992) (not start!66986))
(check-sat)
