; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65790 () Bool)

(assert start!65790)

(declare-fun b!752997 () Bool)

(declare-fun res!508290 () Bool)

(declare-fun e!420094 () Bool)

(assert (=> b!752997 (=> (not res!508290) (not e!420094))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41833 0))(
  ( (array!41834 (arr!20026 (Array (_ BitVec 32) (_ BitVec 64))) (size!20446 (_ BitVec 32))) )
))
(declare-fun lt!334920 () array!41833)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!334918 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7582 0))(
  ( (MissingZero!7582 (index!32696 (_ BitVec 32))) (Found!7582 (index!32697 (_ BitVec 32))) (Intermediate!7582 (undefined!8394 Bool) (index!32698 (_ BitVec 32)) (x!63776 (_ BitVec 32))) (Undefined!7582) (MissingVacant!7582 (index!32699 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41833 (_ BitVec 32)) SeekEntryResult!7582)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41833 (_ BitVec 32)) SeekEntryResult!7582)

(assert (=> b!752997 (= res!508290 (= (seekEntryOrOpen!0 lt!334918 lt!334920 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334918 lt!334920 mask!3328)))))

(declare-fun b!752998 () Bool)

(declare-fun e!420098 () Bool)

(declare-fun e!420099 () Bool)

(assert (=> b!752998 (= e!420098 (not e!420099))))

(declare-fun res!508296 () Bool)

(assert (=> b!752998 (=> res!508296 e!420099)))

(declare-fun lt!334915 () SeekEntryResult!7582)

(get-info :version)

(assert (=> b!752998 (= res!508296 (or (not ((_ is Intermediate!7582) lt!334915)) (bvslt x!1131 (x!63776 lt!334915)) (not (= x!1131 (x!63776 lt!334915))) (not (= index!1321 (index!32698 lt!334915)))))))

(declare-fun e!420096 () Bool)

(assert (=> b!752998 e!420096))

(declare-fun res!508306 () Bool)

(assert (=> b!752998 (=> (not res!508306) (not e!420096))))

(declare-fun lt!334922 () SeekEntryResult!7582)

(declare-fun lt!334924 () SeekEntryResult!7582)

(assert (=> b!752998 (= res!508306 (= lt!334922 lt!334924))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!752998 (= lt!334924 (Found!7582 j!159))))

(declare-fun a!3186 () array!41833)

(assert (=> b!752998 (= lt!334922 (seekEntryOrOpen!0 (select (arr!20026 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41833 (_ BitVec 32)) Bool)

(assert (=> b!752998 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25885 0))(
  ( (Unit!25886) )
))
(declare-fun lt!334919 () Unit!25885)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25885)

(assert (=> b!752998 (= lt!334919 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!508289 () Bool)

(declare-fun e!420093 () Bool)

(assert (=> start!65790 (=> (not res!508289) (not e!420093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65790 (= res!508289 (validMask!0 mask!3328))))

(assert (=> start!65790 e!420093))

(assert (=> start!65790 true))

(declare-fun array_inv!15885 (array!41833) Bool)

(assert (=> start!65790 (array_inv!15885 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!752999 () Bool)

(declare-fun e!420095 () Bool)

(assert (=> b!752999 (= e!420095 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20026 a!3186) j!159) a!3186 mask!3328) (Found!7582 j!159)))))

(declare-fun b!753000 () Bool)

(declare-fun e!420092 () Bool)

(declare-fun e!420091 () Bool)

(assert (=> b!753000 (= e!420092 e!420091)))

(declare-fun res!508297 () Bool)

(assert (=> b!753000 (=> (not res!508297) (not e!420091))))

(declare-fun lt!334916 () SeekEntryResult!7582)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41833 (_ BitVec 32)) SeekEntryResult!7582)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753000 (= res!508297 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20026 a!3186) j!159) mask!3328) (select (arr!20026 a!3186) j!159) a!3186 mask!3328) lt!334916))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753000 (= lt!334916 (Intermediate!7582 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753001 () Bool)

(assert (=> b!753001 (= e!420096 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20026 a!3186) j!159) a!3186 mask!3328) lt!334924))))

(declare-fun b!753002 () Bool)

(declare-fun lt!334925 () SeekEntryResult!7582)

(assert (=> b!753002 (= e!420094 (= lt!334922 lt!334925))))

(declare-fun b!753003 () Bool)

(declare-fun res!508303 () Bool)

(assert (=> b!753003 (=> (not res!508303) (not e!420093))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753003 (= res!508303 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753004 () Bool)

(declare-fun e!420090 () Unit!25885)

(declare-fun Unit!25887 () Unit!25885)

(assert (=> b!753004 (= e!420090 Unit!25887)))

(declare-fun b!753005 () Bool)

(declare-fun res!508288 () Bool)

(assert (=> b!753005 (=> (not res!508288) (not e!420093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753005 (= res!508288 (validKeyInArray!0 (select (arr!20026 a!3186) j!159)))))

(declare-fun b!753006 () Bool)

(assert (=> b!753006 (= e!420093 e!420092)))

(declare-fun res!508291 () Bool)

(assert (=> b!753006 (=> (not res!508291) (not e!420092))))

(declare-fun lt!334917 () SeekEntryResult!7582)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753006 (= res!508291 (or (= lt!334917 (MissingZero!7582 i!1173)) (= lt!334917 (MissingVacant!7582 i!1173))))))

(assert (=> b!753006 (= lt!334917 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!753007 () Bool)

(declare-fun res!508304 () Bool)

(assert (=> b!753007 (=> (not res!508304) (not e!420092))))

(declare-datatypes ((List!13935 0))(
  ( (Nil!13932) (Cons!13931 (h!15009 (_ BitVec 64)) (t!20242 List!13935)) )
))
(declare-fun arrayNoDuplicates!0 (array!41833 (_ BitVec 32) List!13935) Bool)

(assert (=> b!753007 (= res!508304 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13932))))

(declare-fun b!753008 () Bool)

(assert (=> b!753008 (= e!420095 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20026 a!3186) j!159) a!3186 mask!3328) lt!334916))))

(declare-fun b!753009 () Bool)

(declare-fun e!420097 () Bool)

(assert (=> b!753009 (= e!420099 e!420097)))

(declare-fun res!508292 () Bool)

(assert (=> b!753009 (=> res!508292 e!420097)))

(assert (=> b!753009 (= res!508292 (not (= lt!334925 lt!334924)))))

(assert (=> b!753009 (= lt!334925 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20026 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753010 () Bool)

(declare-fun res!508302 () Bool)

(assert (=> b!753010 (=> (not res!508302) (not e!420093))))

(assert (=> b!753010 (= res!508302 (validKeyInArray!0 k0!2102))))

(declare-fun b!753011 () Bool)

(declare-fun res!508299 () Bool)

(assert (=> b!753011 (=> (not res!508299) (not e!420091))))

(assert (=> b!753011 (= res!508299 e!420095)))

(declare-fun c!82739 () Bool)

(assert (=> b!753011 (= c!82739 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753012 () Bool)

(declare-fun res!508301 () Bool)

(assert (=> b!753012 (=> (not res!508301) (not e!420092))))

(assert (=> b!753012 (= res!508301 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20446 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20446 a!3186))))))

(declare-fun b!753013 () Bool)

(declare-fun res!508293 () Bool)

(assert (=> b!753013 (=> (not res!508293) (not e!420091))))

(assert (=> b!753013 (= res!508293 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20026 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753014 () Bool)

(declare-fun e!420088 () Bool)

(assert (=> b!753014 (= e!420097 e!420088)))

(declare-fun res!508300 () Bool)

(assert (=> b!753014 (=> res!508300 e!420088)))

(declare-fun lt!334921 () (_ BitVec 64))

(assert (=> b!753014 (= res!508300 (= lt!334921 lt!334918))))

(assert (=> b!753014 (= lt!334921 (select (store (arr!20026 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753015 () Bool)

(declare-fun Unit!25888 () Unit!25885)

(assert (=> b!753015 (= e!420090 Unit!25888)))

(assert (=> b!753015 false))

(declare-fun b!753016 () Bool)

(assert (=> b!753016 (= e!420091 e!420098)))

(declare-fun res!508295 () Bool)

(assert (=> b!753016 (=> (not res!508295) (not e!420098))))

(declare-fun lt!334926 () SeekEntryResult!7582)

(assert (=> b!753016 (= res!508295 (= lt!334926 lt!334915))))

(assert (=> b!753016 (= lt!334915 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334918 lt!334920 mask!3328))))

(assert (=> b!753016 (= lt!334926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334918 mask!3328) lt!334918 lt!334920 mask!3328))))

(assert (=> b!753016 (= lt!334918 (select (store (arr!20026 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753016 (= lt!334920 (array!41834 (store (arr!20026 a!3186) i!1173 k0!2102) (size!20446 a!3186)))))

(declare-fun b!753017 () Bool)

(assert (=> b!753017 (= e!420088 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!753017 e!420094))

(declare-fun res!508305 () Bool)

(assert (=> b!753017 (=> (not res!508305) (not e!420094))))

(assert (=> b!753017 (= res!508305 (= lt!334921 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334923 () Unit!25885)

(assert (=> b!753017 (= lt!334923 e!420090)))

(declare-fun c!82738 () Bool)

(assert (=> b!753017 (= c!82738 (= lt!334921 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753018 () Bool)

(declare-fun res!508294 () Bool)

(assert (=> b!753018 (=> (not res!508294) (not e!420092))))

(assert (=> b!753018 (= res!508294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753019 () Bool)

(declare-fun res!508298 () Bool)

(assert (=> b!753019 (=> (not res!508298) (not e!420093))))

(assert (=> b!753019 (= res!508298 (and (= (size!20446 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20446 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20446 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65790 res!508289) b!753019))

(assert (= (and b!753019 res!508298) b!753005))

(assert (= (and b!753005 res!508288) b!753010))

(assert (= (and b!753010 res!508302) b!753003))

(assert (= (and b!753003 res!508303) b!753006))

(assert (= (and b!753006 res!508291) b!753018))

(assert (= (and b!753018 res!508294) b!753007))

(assert (= (and b!753007 res!508304) b!753012))

(assert (= (and b!753012 res!508301) b!753000))

(assert (= (and b!753000 res!508297) b!753013))

(assert (= (and b!753013 res!508293) b!753011))

(assert (= (and b!753011 c!82739) b!753008))

(assert (= (and b!753011 (not c!82739)) b!752999))

(assert (= (and b!753011 res!508299) b!753016))

(assert (= (and b!753016 res!508295) b!752998))

(assert (= (and b!752998 res!508306) b!753001))

(assert (= (and b!752998 (not res!508296)) b!753009))

(assert (= (and b!753009 (not res!508292)) b!753014))

(assert (= (and b!753014 (not res!508300)) b!753017))

(assert (= (and b!753017 c!82738) b!753015))

(assert (= (and b!753017 (not c!82738)) b!753004))

(assert (= (and b!753017 res!508305) b!752997))

(assert (= (and b!752997 res!508290) b!753002))

(declare-fun m!702399 () Bool)

(assert (=> b!753006 m!702399))

(declare-fun m!702401 () Bool)

(assert (=> b!753000 m!702401))

(assert (=> b!753000 m!702401))

(declare-fun m!702403 () Bool)

(assert (=> b!753000 m!702403))

(assert (=> b!753000 m!702403))

(assert (=> b!753000 m!702401))

(declare-fun m!702405 () Bool)

(assert (=> b!753000 m!702405))

(assert (=> b!752999 m!702401))

(assert (=> b!752999 m!702401))

(declare-fun m!702407 () Bool)

(assert (=> b!752999 m!702407))

(declare-fun m!702409 () Bool)

(assert (=> b!753010 m!702409))

(assert (=> b!753005 m!702401))

(assert (=> b!753005 m!702401))

(declare-fun m!702411 () Bool)

(assert (=> b!753005 m!702411))

(assert (=> b!753009 m!702401))

(assert (=> b!753009 m!702401))

(assert (=> b!753009 m!702407))

(declare-fun m!702413 () Bool)

(assert (=> b!753003 m!702413))

(declare-fun m!702415 () Bool)

(assert (=> b!753016 m!702415))

(declare-fun m!702417 () Bool)

(assert (=> b!753016 m!702417))

(declare-fun m!702419 () Bool)

(assert (=> b!753016 m!702419))

(assert (=> b!753016 m!702415))

(declare-fun m!702421 () Bool)

(assert (=> b!753016 m!702421))

(declare-fun m!702423 () Bool)

(assert (=> b!753016 m!702423))

(declare-fun m!702425 () Bool)

(assert (=> b!752997 m!702425))

(declare-fun m!702427 () Bool)

(assert (=> b!752997 m!702427))

(declare-fun m!702429 () Bool)

(assert (=> b!753018 m!702429))

(assert (=> b!752998 m!702401))

(assert (=> b!752998 m!702401))

(declare-fun m!702431 () Bool)

(assert (=> b!752998 m!702431))

(declare-fun m!702433 () Bool)

(assert (=> b!752998 m!702433))

(declare-fun m!702435 () Bool)

(assert (=> b!752998 m!702435))

(declare-fun m!702437 () Bool)

(assert (=> start!65790 m!702437))

(declare-fun m!702439 () Bool)

(assert (=> start!65790 m!702439))

(assert (=> b!753001 m!702401))

(assert (=> b!753001 m!702401))

(declare-fun m!702441 () Bool)

(assert (=> b!753001 m!702441))

(assert (=> b!753014 m!702419))

(declare-fun m!702443 () Bool)

(assert (=> b!753014 m!702443))

(declare-fun m!702445 () Bool)

(assert (=> b!753007 m!702445))

(assert (=> b!753008 m!702401))

(assert (=> b!753008 m!702401))

(declare-fun m!702447 () Bool)

(assert (=> b!753008 m!702447))

(declare-fun m!702449 () Bool)

(assert (=> b!753013 m!702449))

(check-sat (not b!753010) (not b!752999) (not b!753009) (not b!753000) (not b!753006) (not b!752998) (not b!753001) (not b!753003) (not b!753008) (not start!65790) (not b!753016) (not b!753007) (not b!752997) (not b!753005) (not b!753018))
(check-sat)
