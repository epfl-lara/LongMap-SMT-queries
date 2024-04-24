; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67990 () Bool)

(assert start!67990)

(declare-fun b!789617 () Bool)

(declare-fun e!438954 () Bool)

(declare-fun e!438952 () Bool)

(assert (=> b!789617 (= e!438954 e!438952)))

(declare-fun res!534611 () Bool)

(assert (=> b!789617 (=> (not res!534611) (not e!438952))))

(declare-datatypes ((SeekEntryResult!8062 0))(
  ( (MissingZero!8062 (index!34616 (_ BitVec 32))) (Found!8062 (index!34617 (_ BitVec 32))) (Intermediate!8062 (undefined!8874 Bool) (index!34618 (_ BitVec 32)) (x!65718 (_ BitVec 32))) (Undefined!8062) (MissingVacant!8062 (index!34619 (_ BitVec 32))) )
))
(declare-fun lt!352266 () SeekEntryResult!8062)

(declare-fun lt!352267 () SeekEntryResult!8062)

(assert (=> b!789617 (= res!534611 (= lt!352266 lt!352267))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!352268 () (_ BitVec 64))

(declare-datatypes ((array!42847 0))(
  ( (array!42848 (arr!20506 (Array (_ BitVec 32) (_ BitVec 64))) (size!20926 (_ BitVec 32))) )
))
(declare-fun lt!352270 () array!42847)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42847 (_ BitVec 32)) SeekEntryResult!8062)

(assert (=> b!789617 (= lt!352267 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352268 lt!352270 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789617 (= lt!352266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352268 mask!3328) lt!352268 lt!352270 mask!3328))))

(declare-fun a!3186 () array!42847)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!789617 (= lt!352268 (select (store (arr!20506 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!789617 (= lt!352270 (array!42848 (store (arr!20506 a!3186) i!1173 k0!2102) (size!20926 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!352275 () SeekEntryResult!8062)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!438947 () Bool)

(declare-fun b!789618 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42847 (_ BitVec 32)) SeekEntryResult!8062)

(assert (=> b!789618 (= e!438947 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20506 a!3186) j!159) a!3186 mask!3328) lt!352275))))

(declare-fun b!789619 () Bool)

(declare-fun res!534620 () Bool)

(declare-fun e!438951 () Bool)

(assert (=> b!789619 (=> (not res!534620) (not e!438951))))

(declare-datatypes ((List!14415 0))(
  ( (Nil!14412) (Cons!14411 (h!15543 (_ BitVec 64)) (t!20722 List!14415)) )
))
(declare-fun arrayNoDuplicates!0 (array!42847 (_ BitVec 32) List!14415) Bool)

(assert (=> b!789619 (= res!534620 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14412))))

(declare-fun b!789621 () Bool)

(declare-fun res!534603 () Bool)

(declare-fun e!438957 () Bool)

(assert (=> b!789621 (=> (not res!534603) (not e!438957))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42847 (_ BitVec 32)) SeekEntryResult!8062)

(assert (=> b!789621 (= res!534603 (= (seekEntryOrOpen!0 lt!352268 lt!352270 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352268 lt!352270 mask!3328)))))

(declare-fun b!789622 () Bool)

(declare-fun e!438953 () Bool)

(declare-fun e!438950 () Bool)

(assert (=> b!789622 (= e!438953 e!438950)))

(declare-fun res!534618 () Bool)

(assert (=> b!789622 (=> res!534618 e!438950)))

(declare-fun lt!352271 () SeekEntryResult!8062)

(assert (=> b!789622 (= res!534618 (not (= lt!352271 lt!352275)))))

(assert (=> b!789622 (= lt!352271 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20506 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789623 () Bool)

(declare-fun lt!352276 () SeekEntryResult!8062)

(assert (=> b!789623 (= e!438957 (= lt!352276 lt!352271))))

(declare-fun b!789624 () Bool)

(declare-fun e!438948 () Bool)

(assert (=> b!789624 (= e!438948 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20506 a!3186) j!159) a!3186 mask!3328) (Found!8062 j!159)))))

(declare-fun b!789625 () Bool)

(declare-fun lt!352265 () SeekEntryResult!8062)

(assert (=> b!789625 (= e!438948 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20506 a!3186) j!159) a!3186 mask!3328) lt!352265))))

(declare-fun b!789626 () Bool)

(declare-fun res!534604 () Bool)

(assert (=> b!789626 (=> (not res!534604) (not e!438951))))

(assert (=> b!789626 (= res!534604 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20926 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20926 a!3186))))))

(declare-fun res!534619 () Bool)

(declare-fun e!438949 () Bool)

(assert (=> start!67990 (=> (not res!534619) (not e!438949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67990 (= res!534619 (validMask!0 mask!3328))))

(assert (=> start!67990 e!438949))

(assert (=> start!67990 true))

(declare-fun array_inv!16365 (array!42847) Bool)

(assert (=> start!67990 (array_inv!16365 a!3186)))

(declare-fun b!789620 () Bool)

(declare-fun e!438958 () Bool)

(assert (=> b!789620 (= e!438958 true)))

(assert (=> b!789620 e!438957))

(declare-fun res!534610 () Bool)

(assert (=> b!789620 (=> (not res!534610) (not e!438957))))

(declare-fun lt!352269 () (_ BitVec 64))

(assert (=> b!789620 (= res!534610 (= lt!352269 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27313 0))(
  ( (Unit!27314) )
))
(declare-fun lt!352273 () Unit!27313)

(declare-fun e!438956 () Unit!27313)

(assert (=> b!789620 (= lt!352273 e!438956)))

(declare-fun c!87920 () Bool)

(assert (=> b!789620 (= c!87920 (= lt!352269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789627 () Bool)

(declare-fun Unit!27315 () Unit!27313)

(assert (=> b!789627 (= e!438956 Unit!27315)))

(declare-fun b!789628 () Bool)

(assert (=> b!789628 (= e!438950 e!438958)))

(declare-fun res!534608 () Bool)

(assert (=> b!789628 (=> res!534608 e!438958)))

(assert (=> b!789628 (= res!534608 (= lt!352269 lt!352268))))

(assert (=> b!789628 (= lt!352269 (select (store (arr!20506 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!789629 () Bool)

(declare-fun res!534613 () Bool)

(assert (=> b!789629 (=> (not res!534613) (not e!438951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42847 (_ BitVec 32)) Bool)

(assert (=> b!789629 (= res!534613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789630 () Bool)

(declare-fun res!534617 () Bool)

(assert (=> b!789630 (=> (not res!534617) (not e!438949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789630 (= res!534617 (validKeyInArray!0 k0!2102))))

(declare-fun b!789631 () Bool)

(assert (=> b!789631 (= e!438951 e!438954)))

(declare-fun res!534615 () Bool)

(assert (=> b!789631 (=> (not res!534615) (not e!438954))))

(assert (=> b!789631 (= res!534615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20506 a!3186) j!159) mask!3328) (select (arr!20506 a!3186) j!159) a!3186 mask!3328) lt!352265))))

(assert (=> b!789631 (= lt!352265 (Intermediate!8062 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789632 () Bool)

(declare-fun res!534605 () Bool)

(assert (=> b!789632 (=> (not res!534605) (not e!438949))))

(assert (=> b!789632 (= res!534605 (and (= (size!20926 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20926 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20926 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789633 () Bool)

(declare-fun Unit!27316 () Unit!27313)

(assert (=> b!789633 (= e!438956 Unit!27316)))

(assert (=> b!789633 false))

(declare-fun b!789634 () Bool)

(declare-fun res!534607 () Bool)

(assert (=> b!789634 (=> (not res!534607) (not e!438954))))

(assert (=> b!789634 (= res!534607 e!438948)))

(declare-fun c!87919 () Bool)

(assert (=> b!789634 (= c!87919 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789635 () Bool)

(assert (=> b!789635 (= e!438949 e!438951)))

(declare-fun res!534621 () Bool)

(assert (=> b!789635 (=> (not res!534621) (not e!438951))))

(declare-fun lt!352274 () SeekEntryResult!8062)

(assert (=> b!789635 (= res!534621 (or (= lt!352274 (MissingZero!8062 i!1173)) (= lt!352274 (MissingVacant!8062 i!1173))))))

(assert (=> b!789635 (= lt!352274 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!789636 () Bool)

(declare-fun res!534614 () Bool)

(assert (=> b!789636 (=> (not res!534614) (not e!438949))))

(assert (=> b!789636 (= res!534614 (validKeyInArray!0 (select (arr!20506 a!3186) j!159)))))

(declare-fun b!789637 () Bool)

(assert (=> b!789637 (= e!438952 (not e!438953))))

(declare-fun res!534609 () Bool)

(assert (=> b!789637 (=> res!534609 e!438953)))

(get-info :version)

(assert (=> b!789637 (= res!534609 (or (not ((_ is Intermediate!8062) lt!352267)) (bvslt x!1131 (x!65718 lt!352267)) (not (= x!1131 (x!65718 lt!352267))) (not (= index!1321 (index!34618 lt!352267)))))))

(assert (=> b!789637 e!438947))

(declare-fun res!534612 () Bool)

(assert (=> b!789637 (=> (not res!534612) (not e!438947))))

(assert (=> b!789637 (= res!534612 (= lt!352276 lt!352275))))

(assert (=> b!789637 (= lt!352275 (Found!8062 j!159))))

(assert (=> b!789637 (= lt!352276 (seekEntryOrOpen!0 (select (arr!20506 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!789637 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352272 () Unit!27313)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27313)

(assert (=> b!789637 (= lt!352272 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789638 () Bool)

(declare-fun res!534616 () Bool)

(assert (=> b!789638 (=> (not res!534616) (not e!438949))))

(declare-fun arrayContainsKey!0 (array!42847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789638 (= res!534616 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789639 () Bool)

(declare-fun res!534606 () Bool)

(assert (=> b!789639 (=> (not res!534606) (not e!438954))))

(assert (=> b!789639 (= res!534606 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20506 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!67990 res!534619) b!789632))

(assert (= (and b!789632 res!534605) b!789636))

(assert (= (and b!789636 res!534614) b!789630))

(assert (= (and b!789630 res!534617) b!789638))

(assert (= (and b!789638 res!534616) b!789635))

(assert (= (and b!789635 res!534621) b!789629))

(assert (= (and b!789629 res!534613) b!789619))

(assert (= (and b!789619 res!534620) b!789626))

(assert (= (and b!789626 res!534604) b!789631))

(assert (= (and b!789631 res!534615) b!789639))

(assert (= (and b!789639 res!534606) b!789634))

(assert (= (and b!789634 c!87919) b!789625))

(assert (= (and b!789634 (not c!87919)) b!789624))

(assert (= (and b!789634 res!534607) b!789617))

(assert (= (and b!789617 res!534611) b!789637))

(assert (= (and b!789637 res!534612) b!789618))

(assert (= (and b!789637 (not res!534609)) b!789622))

(assert (= (and b!789622 (not res!534618)) b!789628))

(assert (= (and b!789628 (not res!534608)) b!789620))

(assert (= (and b!789620 c!87920) b!789633))

(assert (= (and b!789620 (not c!87920)) b!789627))

(assert (= (and b!789620 res!534610) b!789621))

(assert (= (and b!789621 res!534603) b!789623))

(declare-fun m!731231 () Bool)

(assert (=> start!67990 m!731231))

(declare-fun m!731233 () Bool)

(assert (=> start!67990 m!731233))

(declare-fun m!731235 () Bool)

(assert (=> b!789629 m!731235))

(declare-fun m!731237 () Bool)

(assert (=> b!789635 m!731237))

(declare-fun m!731239 () Bool)

(assert (=> b!789625 m!731239))

(assert (=> b!789625 m!731239))

(declare-fun m!731241 () Bool)

(assert (=> b!789625 m!731241))

(assert (=> b!789631 m!731239))

(assert (=> b!789631 m!731239))

(declare-fun m!731243 () Bool)

(assert (=> b!789631 m!731243))

(assert (=> b!789631 m!731243))

(assert (=> b!789631 m!731239))

(declare-fun m!731245 () Bool)

(assert (=> b!789631 m!731245))

(declare-fun m!731247 () Bool)

(assert (=> b!789638 m!731247))

(assert (=> b!789624 m!731239))

(assert (=> b!789624 m!731239))

(declare-fun m!731249 () Bool)

(assert (=> b!789624 m!731249))

(assert (=> b!789637 m!731239))

(assert (=> b!789637 m!731239))

(declare-fun m!731251 () Bool)

(assert (=> b!789637 m!731251))

(declare-fun m!731253 () Bool)

(assert (=> b!789637 m!731253))

(declare-fun m!731255 () Bool)

(assert (=> b!789637 m!731255))

(declare-fun m!731257 () Bool)

(assert (=> b!789639 m!731257))

(declare-fun m!731259 () Bool)

(assert (=> b!789617 m!731259))

(declare-fun m!731261 () Bool)

(assert (=> b!789617 m!731261))

(assert (=> b!789617 m!731259))

(declare-fun m!731263 () Bool)

(assert (=> b!789617 m!731263))

(declare-fun m!731265 () Bool)

(assert (=> b!789617 m!731265))

(declare-fun m!731267 () Bool)

(assert (=> b!789617 m!731267))

(declare-fun m!731269 () Bool)

(assert (=> b!789621 m!731269))

(declare-fun m!731271 () Bool)

(assert (=> b!789621 m!731271))

(declare-fun m!731273 () Bool)

(assert (=> b!789619 m!731273))

(assert (=> b!789636 m!731239))

(assert (=> b!789636 m!731239))

(declare-fun m!731275 () Bool)

(assert (=> b!789636 m!731275))

(assert (=> b!789628 m!731263))

(declare-fun m!731277 () Bool)

(assert (=> b!789628 m!731277))

(assert (=> b!789618 m!731239))

(assert (=> b!789618 m!731239))

(declare-fun m!731279 () Bool)

(assert (=> b!789618 m!731279))

(assert (=> b!789622 m!731239))

(assert (=> b!789622 m!731239))

(assert (=> b!789622 m!731249))

(declare-fun m!731281 () Bool)

(assert (=> b!789630 m!731281))

(check-sat (not b!789638) (not b!789630) (not b!789619) (not b!789617) (not b!789637) (not b!789629) (not b!789625) (not start!67990) (not b!789624) (not b!789631) (not b!789618) (not b!789635) (not b!789636) (not b!789621) (not b!789622))
(check-sat)
