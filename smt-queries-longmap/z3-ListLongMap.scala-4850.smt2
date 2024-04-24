; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66916 () Bool)

(assert start!66916)

(declare-fun b!770981 () Bool)

(declare-fun e!429321 () Bool)

(declare-fun e!429322 () Bool)

(assert (=> b!770981 (= e!429321 e!429322)))

(declare-fun res!521340 () Bool)

(assert (=> b!770981 (=> (not res!521340) (not e!429322))))

(declare-datatypes ((array!42358 0))(
  ( (array!42359 (arr!20275 (Array (_ BitVec 32) (_ BitVec 64))) (size!20695 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42358)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7831 0))(
  ( (MissingZero!7831 (index!33692 (_ BitVec 32))) (Found!7831 (index!33693 (_ BitVec 32))) (Intermediate!7831 (undefined!8643 Bool) (index!33694 (_ BitVec 32)) (x!64781 (_ BitVec 32))) (Undefined!7831) (MissingVacant!7831 (index!33695 (_ BitVec 32))) )
))
(declare-fun lt!343114 () SeekEntryResult!7831)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42358 (_ BitVec 32)) SeekEntryResult!7831)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770981 (= res!521340 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20275 a!3186) j!159) mask!3328) (select (arr!20275 a!3186) j!159) a!3186 mask!3328) lt!343114))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770981 (= lt!343114 (Intermediate!7831 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770982 () Bool)

(declare-fun res!521341 () Bool)

(declare-fun e!429324 () Bool)

(assert (=> b!770982 (=> (not res!521341) (not e!429324))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770982 (= res!521341 (validKeyInArray!0 k0!2102))))

(declare-fun b!770983 () Bool)

(declare-datatypes ((Unit!26515 0))(
  ( (Unit!26516) )
))
(declare-fun e!429318 () Unit!26515)

(declare-fun Unit!26517 () Unit!26515)

(assert (=> b!770983 (= e!429318 Unit!26517)))

(declare-fun lt!343117 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!770983 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343117 (select (arr!20275 a!3186) j!159) a!3186 mask!3328) lt!343114)))

(declare-fun b!770984 () Bool)

(declare-fun res!521349 () Bool)

(assert (=> b!770984 (=> (not res!521349) (not e!429322))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770984 (= res!521349 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20275 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770985 () Bool)

(assert (=> b!770985 (= e!429324 e!429321)))

(declare-fun res!521347 () Bool)

(assert (=> b!770985 (=> (not res!521347) (not e!429321))))

(declare-fun lt!343111 () SeekEntryResult!7831)

(assert (=> b!770985 (= res!521347 (or (= lt!343111 (MissingZero!7831 i!1173)) (= lt!343111 (MissingVacant!7831 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42358 (_ BitVec 32)) SeekEntryResult!7831)

(assert (=> b!770985 (= lt!343111 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770986 () Bool)

(declare-fun e!429320 () Bool)

(assert (=> b!770986 (= e!429320 true)))

(declare-fun lt!343120 () Unit!26515)

(assert (=> b!770986 (= lt!343120 e!429318)))

(declare-fun c!85219 () Bool)

(assert (=> b!770986 (= c!85219 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770986 (= lt!343117 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!770987 () Bool)

(declare-fun e!429316 () Bool)

(assert (=> b!770987 (= e!429316 (not e!429320))))

(declare-fun res!521348 () Bool)

(assert (=> b!770987 (=> res!521348 e!429320)))

(declare-fun lt!343119 () SeekEntryResult!7831)

(get-info :version)

(assert (=> b!770987 (= res!521348 (or (not ((_ is Intermediate!7831) lt!343119)) (bvsge x!1131 (x!64781 lt!343119))))))

(declare-fun e!429323 () Bool)

(assert (=> b!770987 e!429323))

(declare-fun res!521344 () Bool)

(assert (=> b!770987 (=> (not res!521344) (not e!429323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42358 (_ BitVec 32)) Bool)

(assert (=> b!770987 (= res!521344 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343113 () Unit!26515)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26515)

(assert (=> b!770987 (= lt!343113 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770988 () Bool)

(declare-fun res!521353 () Bool)

(assert (=> b!770988 (=> (not res!521353) (not e!429321))))

(declare-datatypes ((List!14184 0))(
  ( (Nil!14181) (Cons!14180 (h!15285 (_ BitVec 64)) (t!20491 List!14184)) )
))
(declare-fun arrayNoDuplicates!0 (array!42358 (_ BitVec 32) List!14184) Bool)

(assert (=> b!770988 (= res!521353 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14181))))

(declare-fun b!770989 () Bool)

(assert (=> b!770989 (= e!429322 e!429316)))

(declare-fun res!521345 () Bool)

(assert (=> b!770989 (=> (not res!521345) (not e!429316))))

(declare-fun lt!343112 () SeekEntryResult!7831)

(assert (=> b!770989 (= res!521345 (= lt!343112 lt!343119))))

(declare-fun lt!343110 () (_ BitVec 64))

(declare-fun lt!343116 () array!42358)

(assert (=> b!770989 (= lt!343119 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343110 lt!343116 mask!3328))))

(assert (=> b!770989 (= lt!343112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343110 mask!3328) lt!343110 lt!343116 mask!3328))))

(assert (=> b!770989 (= lt!343110 (select (store (arr!20275 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770989 (= lt!343116 (array!42359 (store (arr!20275 a!3186) i!1173 k0!2102) (size!20695 a!3186)))))

(declare-fun b!770990 () Bool)

(declare-fun res!521355 () Bool)

(assert (=> b!770990 (=> (not res!521355) (not e!429321))))

(assert (=> b!770990 (= res!521355 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20695 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20695 a!3186))))))

(declare-fun b!770991 () Bool)

(declare-fun e!429319 () Bool)

(assert (=> b!770991 (= e!429323 e!429319)))

(declare-fun res!521350 () Bool)

(assert (=> b!770991 (=> (not res!521350) (not e!429319))))

(declare-fun lt!343118 () SeekEntryResult!7831)

(assert (=> b!770991 (= res!521350 (= (seekEntryOrOpen!0 (select (arr!20275 a!3186) j!159) a!3186 mask!3328) lt!343118))))

(assert (=> b!770991 (= lt!343118 (Found!7831 j!159))))

(declare-fun b!770992 () Bool)

(declare-fun Unit!26518 () Unit!26515)

(assert (=> b!770992 (= e!429318 Unit!26518)))

(declare-fun lt!343115 () SeekEntryResult!7831)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42358 (_ BitVec 32)) SeekEntryResult!7831)

(assert (=> b!770992 (= lt!343115 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20275 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770992 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343117 resIntermediateIndex!5 (select (arr!20275 a!3186) j!159) a!3186 mask!3328) (Found!7831 j!159))))

(declare-fun b!770993 () Bool)

(declare-fun res!521352 () Bool)

(assert (=> b!770993 (=> (not res!521352) (not e!429322))))

(declare-fun e!429325 () Bool)

(assert (=> b!770993 (= res!521352 e!429325)))

(declare-fun c!85220 () Bool)

(assert (=> b!770993 (= c!85220 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770994 () Bool)

(assert (=> b!770994 (= e!429325 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20275 a!3186) j!159) a!3186 mask!3328) lt!343114))))

(declare-fun b!770995 () Bool)

(assert (=> b!770995 (= e!429325 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20275 a!3186) j!159) a!3186 mask!3328) (Found!7831 j!159)))))

(declare-fun b!770996 () Bool)

(assert (=> b!770996 (= e!429319 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20275 a!3186) j!159) a!3186 mask!3328) lt!343118))))

(declare-fun b!770997 () Bool)

(declare-fun res!521343 () Bool)

(assert (=> b!770997 (=> (not res!521343) (not e!429324))))

(assert (=> b!770997 (= res!521343 (and (= (size!20695 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20695 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20695 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770998 () Bool)

(declare-fun res!521346 () Bool)

(assert (=> b!770998 (=> (not res!521346) (not e!429324))))

(assert (=> b!770998 (= res!521346 (validKeyInArray!0 (select (arr!20275 a!3186) j!159)))))

(declare-fun b!770999 () Bool)

(declare-fun res!521354 () Bool)

(assert (=> b!770999 (=> (not res!521354) (not e!429321))))

(assert (=> b!770999 (= res!521354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!521351 () Bool)

(assert (=> start!66916 (=> (not res!521351) (not e!429324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66916 (= res!521351 (validMask!0 mask!3328))))

(assert (=> start!66916 e!429324))

(assert (=> start!66916 true))

(declare-fun array_inv!16134 (array!42358) Bool)

(assert (=> start!66916 (array_inv!16134 a!3186)))

(declare-fun b!771000 () Bool)

(declare-fun res!521342 () Bool)

(assert (=> b!771000 (=> (not res!521342) (not e!429324))))

(declare-fun arrayContainsKey!0 (array!42358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771000 (= res!521342 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66916 res!521351) b!770997))

(assert (= (and b!770997 res!521343) b!770998))

(assert (= (and b!770998 res!521346) b!770982))

(assert (= (and b!770982 res!521341) b!771000))

(assert (= (and b!771000 res!521342) b!770985))

(assert (= (and b!770985 res!521347) b!770999))

(assert (= (and b!770999 res!521354) b!770988))

(assert (= (and b!770988 res!521353) b!770990))

(assert (= (and b!770990 res!521355) b!770981))

(assert (= (and b!770981 res!521340) b!770984))

(assert (= (and b!770984 res!521349) b!770993))

(assert (= (and b!770993 c!85220) b!770994))

(assert (= (and b!770993 (not c!85220)) b!770995))

(assert (= (and b!770993 res!521352) b!770989))

(assert (= (and b!770989 res!521345) b!770987))

(assert (= (and b!770987 res!521344) b!770991))

(assert (= (and b!770991 res!521350) b!770996))

(assert (= (and b!770987 (not res!521348)) b!770986))

(assert (= (and b!770986 c!85219) b!770983))

(assert (= (and b!770986 (not c!85219)) b!770992))

(declare-fun m!716675 () Bool)

(assert (=> b!770984 m!716675))

(declare-fun m!716677 () Bool)

(assert (=> start!66916 m!716677))

(declare-fun m!716679 () Bool)

(assert (=> start!66916 m!716679))

(declare-fun m!716681 () Bool)

(assert (=> b!770995 m!716681))

(assert (=> b!770995 m!716681))

(declare-fun m!716683 () Bool)

(assert (=> b!770995 m!716683))

(declare-fun m!716685 () Bool)

(assert (=> b!770985 m!716685))

(declare-fun m!716687 () Bool)

(assert (=> b!771000 m!716687))

(assert (=> b!770996 m!716681))

(assert (=> b!770996 m!716681))

(declare-fun m!716689 () Bool)

(assert (=> b!770996 m!716689))

(assert (=> b!770983 m!716681))

(assert (=> b!770983 m!716681))

(declare-fun m!716691 () Bool)

(assert (=> b!770983 m!716691))

(assert (=> b!770991 m!716681))

(assert (=> b!770991 m!716681))

(declare-fun m!716693 () Bool)

(assert (=> b!770991 m!716693))

(declare-fun m!716695 () Bool)

(assert (=> b!770987 m!716695))

(declare-fun m!716697 () Bool)

(assert (=> b!770987 m!716697))

(assert (=> b!770994 m!716681))

(assert (=> b!770994 m!716681))

(declare-fun m!716699 () Bool)

(assert (=> b!770994 m!716699))

(assert (=> b!770981 m!716681))

(assert (=> b!770981 m!716681))

(declare-fun m!716701 () Bool)

(assert (=> b!770981 m!716701))

(assert (=> b!770981 m!716701))

(assert (=> b!770981 m!716681))

(declare-fun m!716703 () Bool)

(assert (=> b!770981 m!716703))

(assert (=> b!770998 m!716681))

(assert (=> b!770998 m!716681))

(declare-fun m!716705 () Bool)

(assert (=> b!770998 m!716705))

(declare-fun m!716707 () Bool)

(assert (=> b!770982 m!716707))

(declare-fun m!716709 () Bool)

(assert (=> b!770986 m!716709))

(declare-fun m!716711 () Bool)

(assert (=> b!770999 m!716711))

(declare-fun m!716713 () Bool)

(assert (=> b!770989 m!716713))

(declare-fun m!716715 () Bool)

(assert (=> b!770989 m!716715))

(declare-fun m!716717 () Bool)

(assert (=> b!770989 m!716717))

(assert (=> b!770989 m!716715))

(declare-fun m!716719 () Bool)

(assert (=> b!770989 m!716719))

(declare-fun m!716721 () Bool)

(assert (=> b!770989 m!716721))

(declare-fun m!716723 () Bool)

(assert (=> b!770988 m!716723))

(assert (=> b!770992 m!716681))

(assert (=> b!770992 m!716681))

(assert (=> b!770992 m!716683))

(assert (=> b!770992 m!716681))

(declare-fun m!716725 () Bool)

(assert (=> b!770992 m!716725))

(check-sat (not b!771000) (not b!770982) (not b!770994) (not b!770991) (not b!770989) (not b!770999) (not b!770983) (not b!770985) (not b!770992) (not b!770995) (not b!770998) (not b!770988) (not b!770981) (not b!770996) (not start!66916) (not b!770986) (not b!770987))
(check-sat)
