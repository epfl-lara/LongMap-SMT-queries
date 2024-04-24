; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65280 () Bool)

(assert start!65280)

(declare-fun b!736997 () Bool)

(declare-fun res!495107 () Bool)

(declare-fun e!412368 () Bool)

(assert (=> b!736997 (=> (not res!495107) (not e!412368))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((array!41323 0))(
  ( (array!41324 (arr!19771 (Array (_ BitVec 32) (_ BitVec 64))) (size!20191 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41323)

(assert (=> b!736997 (= res!495107 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20191 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20191 a!3186))))))

(declare-fun e!412367 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7327 0))(
  ( (MissingZero!7327 (index!31676 (_ BitVec 32))) (Found!7327 (index!31677 (_ BitVec 32))) (Intermediate!7327 (undefined!8139 Bool) (index!31678 (_ BitVec 32)) (x!62841 (_ BitVec 32))) (Undefined!7327) (MissingVacant!7327 (index!31679 (_ BitVec 32))) )
))
(declare-fun lt!326808 () SeekEntryResult!7327)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!736998 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41323 (_ BitVec 32)) SeekEntryResult!7327)

(assert (=> b!736998 (= e!412367 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326808))))

(declare-fun b!736999 () Bool)

(declare-fun res!495103 () Bool)

(declare-fun e!412359 () Bool)

(assert (=> b!736999 (=> (not res!495103) (not e!412359))))

(declare-fun e!412360 () Bool)

(assert (=> b!736999 (= res!495103 e!412360)))

(declare-fun c!81337 () Bool)

(assert (=> b!736999 (= c!81337 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!495108 () Bool)

(declare-fun e!412366 () Bool)

(assert (=> start!65280 (=> (not res!495108) (not e!412366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65280 (= res!495108 (validMask!0 mask!3328))))

(assert (=> start!65280 e!412366))

(assert (=> start!65280 true))

(declare-fun array_inv!15630 (array!41323) Bool)

(assert (=> start!65280 (array_inv!15630 a!3186)))

(declare-fun b!737000 () Bool)

(declare-fun e!412357 () Bool)

(assert (=> b!737000 (= e!412357 true)))

(declare-fun lt!326803 () SeekEntryResult!7327)

(declare-fun lt!326809 () (_ BitVec 64))

(declare-fun lt!326807 () array!41323)

(declare-fun lt!326806 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41323 (_ BitVec 32)) SeekEntryResult!7327)

(assert (=> b!737000 (= lt!326803 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326806 lt!326809 lt!326807 mask!3328))))

(declare-fun e!412363 () Bool)

(declare-fun b!737001 () Bool)

(declare-fun lt!326802 () SeekEntryResult!7327)

(assert (=> b!737001 (= e!412363 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326806 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326802)))))

(declare-fun b!737002 () Bool)

(declare-fun res!495095 () Bool)

(assert (=> b!737002 (=> (not res!495095) (not e!412366))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737002 (= res!495095 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737003 () Bool)

(assert (=> b!737003 (= e!412368 e!412359)))

(declare-fun res!495093 () Bool)

(assert (=> b!737003 (=> (not res!495093) (not e!412359))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737003 (= res!495093 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19771 a!3186) j!159) mask!3328) (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326802))))

(assert (=> b!737003 (= lt!326802 (Intermediate!7327 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737004 () Bool)

(declare-fun res!495098 () Bool)

(assert (=> b!737004 (=> (not res!495098) (not e!412366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737004 (= res!495098 (validKeyInArray!0 k0!2102))))

(declare-fun b!737005 () Bool)

(assert (=> b!737005 (= e!412360 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) (Found!7327 j!159)))))

(declare-fun b!737006 () Bool)

(declare-datatypes ((Unit!25081 0))(
  ( (Unit!25082) )
))
(declare-fun e!412364 () Unit!25081)

(declare-fun Unit!25083 () Unit!25081)

(assert (=> b!737006 (= e!412364 Unit!25083)))

(declare-fun lt!326810 () SeekEntryResult!7327)

(assert (=> b!737006 (= lt!326810 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19771 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!326813 () SeekEntryResult!7327)

(assert (=> b!737006 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326806 resIntermediateIndex!5 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326813)))

(declare-fun b!737007 () Bool)

(declare-fun res!495100 () Bool)

(assert (=> b!737007 (=> (not res!495100) (not e!412366))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737007 (= res!495100 (and (= (size!20191 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20191 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20191 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737008 () Bool)

(assert (=> b!737008 (= e!412363 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326806 resIntermediateIndex!5 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326813)))))

(declare-fun b!737009 () Bool)

(declare-fun res!495104 () Bool)

(assert (=> b!737009 (=> res!495104 e!412357)))

(assert (=> b!737009 (= res!495104 e!412363)))

(declare-fun c!81336 () Bool)

(declare-fun lt!326811 () Bool)

(assert (=> b!737009 (= c!81336 lt!326811)))

(declare-fun b!737010 () Bool)

(declare-fun e!412358 () Bool)

(assert (=> b!737010 (= e!412358 e!412357)))

(declare-fun res!495097 () Bool)

(assert (=> b!737010 (=> res!495097 e!412357)))

(assert (=> b!737010 (= res!495097 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326806 #b00000000000000000000000000000000) (bvsge lt!326806 (size!20191 a!3186))))))

(declare-fun lt!326805 () Unit!25081)

(assert (=> b!737010 (= lt!326805 e!412364)))

(declare-fun c!81338 () Bool)

(assert (=> b!737010 (= c!81338 lt!326811)))

(assert (=> b!737010 (= lt!326811 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737010 (= lt!326806 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!737011 () Bool)

(declare-fun res!495094 () Bool)

(assert (=> b!737011 (=> (not res!495094) (not e!412359))))

(assert (=> b!737011 (= res!495094 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19771 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737012 () Bool)

(declare-fun e!412365 () Bool)

(assert (=> b!737012 (= e!412359 e!412365)))

(declare-fun res!495099 () Bool)

(assert (=> b!737012 (=> (not res!495099) (not e!412365))))

(declare-fun lt!326812 () SeekEntryResult!7327)

(declare-fun lt!326801 () SeekEntryResult!7327)

(assert (=> b!737012 (= res!495099 (= lt!326812 lt!326801))))

(assert (=> b!737012 (= lt!326801 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326809 lt!326807 mask!3328))))

(assert (=> b!737012 (= lt!326812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326809 mask!3328) lt!326809 lt!326807 mask!3328))))

(assert (=> b!737012 (= lt!326809 (select (store (arr!19771 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737012 (= lt!326807 (array!41324 (store (arr!19771 a!3186) i!1173 k0!2102) (size!20191 a!3186)))))

(declare-fun b!737013 () Bool)

(declare-fun res!495105 () Bool)

(assert (=> b!737013 (=> (not res!495105) (not e!412368))))

(declare-datatypes ((List!13680 0))(
  ( (Nil!13677) (Cons!13676 (h!14754 (_ BitVec 64)) (t!19987 List!13680)) )
))
(declare-fun arrayNoDuplicates!0 (array!41323 (_ BitVec 32) List!13680) Bool)

(assert (=> b!737013 (= res!495105 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13677))))

(declare-fun b!737014 () Bool)

(declare-fun res!495101 () Bool)

(assert (=> b!737014 (=> (not res!495101) (not e!412368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41323 (_ BitVec 32)) Bool)

(assert (=> b!737014 (= res!495101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737015 () Bool)

(declare-fun e!412362 () Bool)

(assert (=> b!737015 (= e!412362 e!412367)))

(declare-fun res!495096 () Bool)

(assert (=> b!737015 (=> (not res!495096) (not e!412367))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41323 (_ BitVec 32)) SeekEntryResult!7327)

(assert (=> b!737015 (= res!495096 (= (seekEntryOrOpen!0 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326808))))

(assert (=> b!737015 (= lt!326808 (Found!7327 j!159))))

(declare-fun b!737016 () Bool)

(declare-fun Unit!25084 () Unit!25081)

(assert (=> b!737016 (= e!412364 Unit!25084)))

(assert (=> b!737016 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326806 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326802)))

(declare-fun b!737017 () Bool)

(assert (=> b!737017 (= e!412360 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19771 a!3186) j!159) a!3186 mask!3328) lt!326802))))

(declare-fun b!737018 () Bool)

(assert (=> b!737018 (= e!412365 (not e!412358))))

(declare-fun res!495109 () Bool)

(assert (=> b!737018 (=> res!495109 e!412358)))

(get-info :version)

(assert (=> b!737018 (= res!495109 (or (not ((_ is Intermediate!7327) lt!326801)) (bvsge x!1131 (x!62841 lt!326801))))))

(assert (=> b!737018 (= lt!326813 (Found!7327 j!159))))

(assert (=> b!737018 e!412362))

(declare-fun res!495092 () Bool)

(assert (=> b!737018 (=> (not res!495092) (not e!412362))))

(assert (=> b!737018 (= res!495092 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326814 () Unit!25081)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25081)

(assert (=> b!737018 (= lt!326814 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737019 () Bool)

(assert (=> b!737019 (= e!412366 e!412368)))

(declare-fun res!495106 () Bool)

(assert (=> b!737019 (=> (not res!495106) (not e!412368))))

(declare-fun lt!326804 () SeekEntryResult!7327)

(assert (=> b!737019 (= res!495106 (or (= lt!326804 (MissingZero!7327 i!1173)) (= lt!326804 (MissingVacant!7327 i!1173))))))

(assert (=> b!737019 (= lt!326804 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!737020 () Bool)

(declare-fun res!495102 () Bool)

(assert (=> b!737020 (=> (not res!495102) (not e!412366))))

(assert (=> b!737020 (= res!495102 (validKeyInArray!0 (select (arr!19771 a!3186) j!159)))))

(assert (= (and start!65280 res!495108) b!737007))

(assert (= (and b!737007 res!495100) b!737020))

(assert (= (and b!737020 res!495102) b!737004))

(assert (= (and b!737004 res!495098) b!737002))

(assert (= (and b!737002 res!495095) b!737019))

(assert (= (and b!737019 res!495106) b!737014))

(assert (= (and b!737014 res!495101) b!737013))

(assert (= (and b!737013 res!495105) b!736997))

(assert (= (and b!736997 res!495107) b!737003))

(assert (= (and b!737003 res!495093) b!737011))

(assert (= (and b!737011 res!495094) b!736999))

(assert (= (and b!736999 c!81337) b!737017))

(assert (= (and b!736999 (not c!81337)) b!737005))

(assert (= (and b!736999 res!495103) b!737012))

(assert (= (and b!737012 res!495099) b!737018))

(assert (= (and b!737018 res!495092) b!737015))

(assert (= (and b!737015 res!495096) b!736998))

(assert (= (and b!737018 (not res!495109)) b!737010))

(assert (= (and b!737010 c!81338) b!737016))

(assert (= (and b!737010 (not c!81338)) b!737006))

(assert (= (and b!737010 (not res!495097)) b!737009))

(assert (= (and b!737009 c!81336) b!737001))

(assert (= (and b!737009 (not c!81336)) b!737008))

(assert (= (and b!737009 (not res!495104)) b!737000))

(declare-fun m!689589 () Bool)

(assert (=> b!737012 m!689589))

(declare-fun m!689591 () Bool)

(assert (=> b!737012 m!689591))

(declare-fun m!689593 () Bool)

(assert (=> b!737012 m!689593))

(declare-fun m!689595 () Bool)

(assert (=> b!737012 m!689595))

(assert (=> b!737012 m!689589))

(declare-fun m!689597 () Bool)

(assert (=> b!737012 m!689597))

(declare-fun m!689599 () Bool)

(assert (=> b!737016 m!689599))

(assert (=> b!737016 m!689599))

(declare-fun m!689601 () Bool)

(assert (=> b!737016 m!689601))

(assert (=> b!737003 m!689599))

(assert (=> b!737003 m!689599))

(declare-fun m!689603 () Bool)

(assert (=> b!737003 m!689603))

(assert (=> b!737003 m!689603))

(assert (=> b!737003 m!689599))

(declare-fun m!689605 () Bool)

(assert (=> b!737003 m!689605))

(declare-fun m!689607 () Bool)

(assert (=> start!65280 m!689607))

(declare-fun m!689609 () Bool)

(assert (=> start!65280 m!689609))

(assert (=> b!736998 m!689599))

(assert (=> b!736998 m!689599))

(declare-fun m!689611 () Bool)

(assert (=> b!736998 m!689611))

(declare-fun m!689613 () Bool)

(assert (=> b!737019 m!689613))

(declare-fun m!689615 () Bool)

(assert (=> b!737002 m!689615))

(assert (=> b!737001 m!689599))

(assert (=> b!737001 m!689599))

(assert (=> b!737001 m!689601))

(declare-fun m!689617 () Bool)

(assert (=> b!737014 m!689617))

(assert (=> b!737008 m!689599))

(assert (=> b!737008 m!689599))

(declare-fun m!689619 () Bool)

(assert (=> b!737008 m!689619))

(assert (=> b!737005 m!689599))

(assert (=> b!737005 m!689599))

(declare-fun m!689621 () Bool)

(assert (=> b!737005 m!689621))

(assert (=> b!737020 m!689599))

(assert (=> b!737020 m!689599))

(declare-fun m!689623 () Bool)

(assert (=> b!737020 m!689623))

(declare-fun m!689625 () Bool)

(assert (=> b!737018 m!689625))

(declare-fun m!689627 () Bool)

(assert (=> b!737018 m!689627))

(assert (=> b!737006 m!689599))

(assert (=> b!737006 m!689599))

(assert (=> b!737006 m!689621))

(assert (=> b!737006 m!689599))

(assert (=> b!737006 m!689619))

(declare-fun m!689629 () Bool)

(assert (=> b!737000 m!689629))

(declare-fun m!689631 () Bool)

(assert (=> b!737013 m!689631))

(assert (=> b!737017 m!689599))

(assert (=> b!737017 m!689599))

(declare-fun m!689633 () Bool)

(assert (=> b!737017 m!689633))

(declare-fun m!689635 () Bool)

(assert (=> b!737004 m!689635))

(declare-fun m!689637 () Bool)

(assert (=> b!737010 m!689637))

(assert (=> b!737015 m!689599))

(assert (=> b!737015 m!689599))

(declare-fun m!689639 () Bool)

(assert (=> b!737015 m!689639))

(declare-fun m!689641 () Bool)

(assert (=> b!737011 m!689641))

(check-sat (not b!737003) (not b!737000) (not b!737006) (not b!737020) (not b!737004) (not b!737014) (not b!737015) (not b!737001) (not b!737016) (not b!736998) (not b!737018) (not b!737013) (not b!737008) (not b!737010) (not b!737012) (not b!737005) (not b!737019) (not b!737017) (not b!737002) (not start!65280))
(check-sat)
