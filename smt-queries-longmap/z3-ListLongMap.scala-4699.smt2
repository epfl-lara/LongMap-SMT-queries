; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65256 () Bool)

(assert start!65256)

(declare-fun b!739996 () Bool)

(declare-datatypes ((Unit!25308 0))(
  ( (Unit!25309) )
))
(declare-fun e!413760 () Unit!25308)

(declare-fun Unit!25310 () Unit!25308)

(assert (=> b!739996 (= e!413760 Unit!25310)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41429 0))(
  ( (array!41430 (arr!19828 (Array (_ BitVec 32) (_ BitVec 64))) (size!20249 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41429)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7428 0))(
  ( (MissingZero!7428 (index!32080 (_ BitVec 32))) (Found!7428 (index!32081 (_ BitVec 32))) (Intermediate!7428 (undefined!8240 Bool) (index!32082 (_ BitVec 32)) (x!63066 (_ BitVec 32))) (Undefined!7428) (MissingVacant!7428 (index!32083 (_ BitVec 32))) )
))
(declare-fun lt!328683 () SeekEntryResult!7428)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41429 (_ BitVec 32)) SeekEntryResult!7428)

(assert (=> b!739996 (= lt!328683 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19828 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!328673 () SeekEntryResult!7428)

(declare-fun lt!328674 () (_ BitVec 32))

(assert (=> b!739996 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328674 resIntermediateIndex!5 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!328673)))

(declare-fun lt!328684 () SeekEntryResult!7428)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!739997 () Bool)

(declare-fun e!413762 () Bool)

(assert (=> b!739997 (= e!413762 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!328684))))

(declare-fun b!739998 () Bool)

(declare-fun res!497610 () Bool)

(declare-fun e!413751 () Bool)

(assert (=> b!739998 (=> (not res!497610) (not e!413751))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739998 (= res!497610 (and (= (size!20249 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20249 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20249 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739999 () Bool)

(declare-fun res!497605 () Bool)

(declare-fun e!413759 () Bool)

(assert (=> b!739999 (=> (not res!497605) (not e!413759))))

(declare-datatypes ((List!13830 0))(
  ( (Nil!13827) (Cons!13826 (h!14898 (_ BitVec 64)) (t!20145 List!13830)) )
))
(declare-fun arrayNoDuplicates!0 (array!41429 (_ BitVec 32) List!13830) Bool)

(assert (=> b!739999 (= res!497605 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13827))))

(declare-fun e!413754 () Bool)

(declare-fun b!740000 () Bool)

(declare-fun lt!328679 () SeekEntryResult!7428)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41429 (_ BitVec 32)) SeekEntryResult!7428)

(assert (=> b!740000 (= e!413754 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328674 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!328679)))))

(declare-fun b!740001 () Bool)

(declare-fun e!413755 () Bool)

(declare-fun e!413756 () Bool)

(assert (=> b!740001 (= e!413755 (not e!413756))))

(declare-fun res!497608 () Bool)

(assert (=> b!740001 (=> res!497608 e!413756)))

(declare-fun lt!328675 () SeekEntryResult!7428)

(get-info :version)

(assert (=> b!740001 (= res!497608 (or (not ((_ is Intermediate!7428) lt!328675)) (bvsge x!1131 (x!63066 lt!328675))))))

(assert (=> b!740001 (= lt!328673 (Found!7428 j!159))))

(declare-fun e!413758 () Bool)

(assert (=> b!740001 e!413758))

(declare-fun res!497597 () Bool)

(assert (=> b!740001 (=> (not res!497597) (not e!413758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41429 (_ BitVec 32)) Bool)

(assert (=> b!740001 (= res!497597 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328680 () Unit!25308)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41429 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25308)

(assert (=> b!740001 (= lt!328680 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740002 () Bool)

(declare-fun res!497602 () Bool)

(declare-fun e!413752 () Bool)

(assert (=> b!740002 (=> (not res!497602) (not e!413752))))

(declare-fun e!413761 () Bool)

(assert (=> b!740002 (= res!497602 e!413761)))

(declare-fun c!81583 () Bool)

(assert (=> b!740002 (= c!81583 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740003 () Bool)

(declare-fun Unit!25311 () Unit!25308)

(assert (=> b!740003 (= e!413760 Unit!25311)))

(assert (=> b!740003 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328674 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!328679)))

(declare-fun b!740004 () Bool)

(assert (=> b!740004 (= e!413752 e!413755)))

(declare-fun res!497601 () Bool)

(assert (=> b!740004 (=> (not res!497601) (not e!413755))))

(declare-fun lt!328672 () SeekEntryResult!7428)

(assert (=> b!740004 (= res!497601 (= lt!328672 lt!328675))))

(declare-fun lt!328681 () (_ BitVec 64))

(declare-fun lt!328676 () array!41429)

(assert (=> b!740004 (= lt!328675 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328681 lt!328676 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740004 (= lt!328672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328681 mask!3328) lt!328681 lt!328676 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!740004 (= lt!328681 (select (store (arr!19828 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740004 (= lt!328676 (array!41430 (store (arr!19828 a!3186) i!1173 k0!2102) (size!20249 a!3186)))))

(declare-fun b!740005 () Bool)

(declare-fun e!413757 () Bool)

(assert (=> b!740005 (= e!413757 true)))

(declare-fun lt!328685 () SeekEntryResult!7428)

(assert (=> b!740005 (= lt!328685 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328674 lt!328681 lt!328676 mask!3328))))

(declare-fun b!740006 () Bool)

(assert (=> b!740006 (= e!413761 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!328679))))

(declare-fun b!740007 () Bool)

(declare-fun res!497609 () Bool)

(assert (=> b!740007 (=> (not res!497609) (not e!413752))))

(assert (=> b!740007 (= res!497609 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19828 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740008 () Bool)

(assert (=> b!740008 (= e!413751 e!413759)))

(declare-fun res!497606 () Bool)

(assert (=> b!740008 (=> (not res!497606) (not e!413759))))

(declare-fun lt!328677 () SeekEntryResult!7428)

(assert (=> b!740008 (= res!497606 (or (= lt!328677 (MissingZero!7428 i!1173)) (= lt!328677 (MissingVacant!7428 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41429 (_ BitVec 32)) SeekEntryResult!7428)

(assert (=> b!740008 (= lt!328677 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!497607 () Bool)

(assert (=> start!65256 (=> (not res!497607) (not e!413751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65256 (= res!497607 (validMask!0 mask!3328))))

(assert (=> start!65256 e!413751))

(assert (=> start!65256 true))

(declare-fun array_inv!15624 (array!41429) Bool)

(assert (=> start!65256 (array_inv!15624 a!3186)))

(declare-fun b!740009 () Bool)

(declare-fun res!497595 () Bool)

(assert (=> b!740009 (=> (not res!497595) (not e!413751))))

(declare-fun arrayContainsKey!0 (array!41429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740009 (= res!497595 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740010 () Bool)

(assert (=> b!740010 (= e!413758 e!413762)))

(declare-fun res!497598 () Bool)

(assert (=> b!740010 (=> (not res!497598) (not e!413762))))

(assert (=> b!740010 (= res!497598 (= (seekEntryOrOpen!0 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!328684))))

(assert (=> b!740010 (= lt!328684 (Found!7428 j!159))))

(declare-fun b!740011 () Bool)

(assert (=> b!740011 (= e!413754 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328674 resIntermediateIndex!5 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!328673)))))

(declare-fun b!740012 () Bool)

(declare-fun res!497600 () Bool)

(assert (=> b!740012 (=> res!497600 e!413757)))

(assert (=> b!740012 (= res!497600 e!413754)))

(declare-fun c!81581 () Bool)

(declare-fun lt!328682 () Bool)

(assert (=> b!740012 (= c!81581 lt!328682)))

(declare-fun b!740013 () Bool)

(declare-fun res!497604 () Bool)

(assert (=> b!740013 (=> (not res!497604) (not e!413751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740013 (= res!497604 (validKeyInArray!0 (select (arr!19828 a!3186) j!159)))))

(declare-fun b!740014 () Bool)

(assert (=> b!740014 (= e!413759 e!413752)))

(declare-fun res!497596 () Bool)

(assert (=> b!740014 (=> (not res!497596) (not e!413752))))

(assert (=> b!740014 (= res!497596 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19828 a!3186) j!159) mask!3328) (select (arr!19828 a!3186) j!159) a!3186 mask!3328) lt!328679))))

(assert (=> b!740014 (= lt!328679 (Intermediate!7428 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740015 () Bool)

(assert (=> b!740015 (= e!413756 e!413757)))

(declare-fun res!497599 () Bool)

(assert (=> b!740015 (=> res!497599 e!413757)))

(assert (=> b!740015 (= res!497599 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328674 #b00000000000000000000000000000000) (bvsge lt!328674 (size!20249 a!3186))))))

(declare-fun lt!328678 () Unit!25308)

(assert (=> b!740015 (= lt!328678 e!413760)))

(declare-fun c!81582 () Bool)

(assert (=> b!740015 (= c!81582 lt!328682)))

(assert (=> b!740015 (= lt!328682 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740015 (= lt!328674 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!740016 () Bool)

(declare-fun res!497612 () Bool)

(assert (=> b!740016 (=> (not res!497612) (not e!413759))))

(assert (=> b!740016 (= res!497612 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20249 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20249 a!3186))))))

(declare-fun b!740017 () Bool)

(assert (=> b!740017 (= e!413761 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19828 a!3186) j!159) a!3186 mask!3328) (Found!7428 j!159)))))

(declare-fun b!740018 () Bool)

(declare-fun res!497611 () Bool)

(assert (=> b!740018 (=> (not res!497611) (not e!413759))))

(assert (=> b!740018 (= res!497611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740019 () Bool)

(declare-fun res!497603 () Bool)

(assert (=> b!740019 (=> (not res!497603) (not e!413751))))

(assert (=> b!740019 (= res!497603 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65256 res!497607) b!739998))

(assert (= (and b!739998 res!497610) b!740013))

(assert (= (and b!740013 res!497604) b!740019))

(assert (= (and b!740019 res!497603) b!740009))

(assert (= (and b!740009 res!497595) b!740008))

(assert (= (and b!740008 res!497606) b!740018))

(assert (= (and b!740018 res!497611) b!739999))

(assert (= (and b!739999 res!497605) b!740016))

(assert (= (and b!740016 res!497612) b!740014))

(assert (= (and b!740014 res!497596) b!740007))

(assert (= (and b!740007 res!497609) b!740002))

(assert (= (and b!740002 c!81583) b!740006))

(assert (= (and b!740002 (not c!81583)) b!740017))

(assert (= (and b!740002 res!497602) b!740004))

(assert (= (and b!740004 res!497601) b!740001))

(assert (= (and b!740001 res!497597) b!740010))

(assert (= (and b!740010 res!497598) b!739997))

(assert (= (and b!740001 (not res!497608)) b!740015))

(assert (= (and b!740015 c!81582) b!740003))

(assert (= (and b!740015 (not c!81582)) b!739996))

(assert (= (and b!740015 (not res!497599)) b!740012))

(assert (= (and b!740012 c!81581) b!740000))

(assert (= (and b!740012 (not c!81581)) b!740011))

(assert (= (and b!740012 (not res!497600)) b!740005))

(declare-fun m!691237 () Bool)

(assert (=> b!740011 m!691237))

(assert (=> b!740011 m!691237))

(declare-fun m!691239 () Bool)

(assert (=> b!740011 m!691239))

(declare-fun m!691241 () Bool)

(assert (=> b!740008 m!691241))

(assert (=> b!739997 m!691237))

(assert (=> b!739997 m!691237))

(declare-fun m!691243 () Bool)

(assert (=> b!739997 m!691243))

(declare-fun m!691245 () Bool)

(assert (=> b!740015 m!691245))

(assert (=> b!740013 m!691237))

(assert (=> b!740013 m!691237))

(declare-fun m!691247 () Bool)

(assert (=> b!740013 m!691247))

(declare-fun m!691249 () Bool)

(assert (=> b!739999 m!691249))

(assert (=> b!740003 m!691237))

(assert (=> b!740003 m!691237))

(declare-fun m!691251 () Bool)

(assert (=> b!740003 m!691251))

(declare-fun m!691253 () Bool)

(assert (=> start!65256 m!691253))

(declare-fun m!691255 () Bool)

(assert (=> start!65256 m!691255))

(assert (=> b!740014 m!691237))

(assert (=> b!740014 m!691237))

(declare-fun m!691257 () Bool)

(assert (=> b!740014 m!691257))

(assert (=> b!740014 m!691257))

(assert (=> b!740014 m!691237))

(declare-fun m!691259 () Bool)

(assert (=> b!740014 m!691259))

(assert (=> b!739996 m!691237))

(assert (=> b!739996 m!691237))

(declare-fun m!691261 () Bool)

(assert (=> b!739996 m!691261))

(assert (=> b!739996 m!691237))

(assert (=> b!739996 m!691239))

(declare-fun m!691263 () Bool)

(assert (=> b!740001 m!691263))

(declare-fun m!691265 () Bool)

(assert (=> b!740001 m!691265))

(assert (=> b!740017 m!691237))

(assert (=> b!740017 m!691237))

(assert (=> b!740017 m!691261))

(assert (=> b!740010 m!691237))

(assert (=> b!740010 m!691237))

(declare-fun m!691267 () Bool)

(assert (=> b!740010 m!691267))

(assert (=> b!740000 m!691237))

(assert (=> b!740000 m!691237))

(assert (=> b!740000 m!691251))

(declare-fun m!691269 () Bool)

(assert (=> b!740004 m!691269))

(declare-fun m!691271 () Bool)

(assert (=> b!740004 m!691271))

(declare-fun m!691273 () Bool)

(assert (=> b!740004 m!691273))

(declare-fun m!691275 () Bool)

(assert (=> b!740004 m!691275))

(assert (=> b!740004 m!691269))

(declare-fun m!691277 () Bool)

(assert (=> b!740004 m!691277))

(assert (=> b!740006 m!691237))

(assert (=> b!740006 m!691237))

(declare-fun m!691279 () Bool)

(assert (=> b!740006 m!691279))

(declare-fun m!691281 () Bool)

(assert (=> b!740018 m!691281))

(declare-fun m!691283 () Bool)

(assert (=> b!740005 m!691283))

(declare-fun m!691285 () Bool)

(assert (=> b!740009 m!691285))

(declare-fun m!691287 () Bool)

(assert (=> b!740019 m!691287))

(declare-fun m!691289 () Bool)

(assert (=> b!740007 m!691289))

(check-sat (not b!740004) (not b!740018) (not b!740005) (not b!739996) (not b!740013) (not b!740000) (not b!740019) (not b!740003) (not b!740001) (not b!740011) (not b!740010) (not b!740009) (not b!739997) (not b!740014) (not b!740008) (not b!740017) (not b!740006) (not b!740015) (not b!739999) (not start!65256))
(check-sat)
