; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45078 () Bool)

(assert start!45078)

(declare-fun b!494736 () Bool)

(declare-fun e!290245 () Bool)

(declare-fun e!290244 () Bool)

(assert (=> b!494736 (= e!290245 (not e!290244))))

(declare-fun res!297449 () Bool)

(assert (=> b!494736 (=> res!297449 e!290244)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32033 0))(
  ( (array!32034 (arr!15401 (Array (_ BitVec 32) (_ BitVec 64))) (size!15766 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32033)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223860 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3865 0))(
  ( (MissingZero!3865 (index!17639 (_ BitVec 32))) (Found!3865 (index!17640 (_ BitVec 32))) (Intermediate!3865 (undefined!4677 Bool) (index!17641 (_ BitVec 32)) (x!46714 (_ BitVec 32))) (Undefined!3865) (MissingVacant!3865 (index!17642 (_ BitVec 32))) )
))
(declare-fun lt!223864 () SeekEntryResult!3865)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32033 (_ BitVec 32)) SeekEntryResult!3865)

(assert (=> b!494736 (= res!297449 (= lt!223864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223860 (select (store (arr!15401 a!3235) i!1204 k0!2280) j!176) (array!32034 (store (arr!15401 a!3235) i!1204 k0!2280) (size!15766 a!3235)) mask!3524)))))

(declare-fun lt!223863 () (_ BitVec 32))

(assert (=> b!494736 (= lt!223864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223863 (select (arr!15401 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494736 (= lt!223860 (toIndex!0 (select (store (arr!15401 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494736 (= lt!223863 (toIndex!0 (select (arr!15401 a!3235) j!176) mask!3524))))

(declare-fun e!290246 () Bool)

(assert (=> b!494736 e!290246))

(declare-fun res!297457 () Bool)

(assert (=> b!494736 (=> (not res!297457) (not e!290246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32033 (_ BitVec 32)) Bool)

(assert (=> b!494736 (= res!297457 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14662 0))(
  ( (Unit!14663) )
))
(declare-fun lt!223861 () Unit!14662)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14662)

(assert (=> b!494736 (= lt!223861 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494737 () Bool)

(declare-fun res!297458 () Bool)

(declare-fun e!290243 () Bool)

(assert (=> b!494737 (=> (not res!297458) (not e!290243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494737 (= res!297458 (validKeyInArray!0 (select (arr!15401 a!3235) j!176)))))

(declare-fun b!494738 () Bool)

(assert (=> b!494738 (= e!290243 e!290245)))

(declare-fun res!297452 () Bool)

(assert (=> b!494738 (=> (not res!297452) (not e!290245))))

(declare-fun lt!223862 () SeekEntryResult!3865)

(assert (=> b!494738 (= res!297452 (or (= lt!223862 (MissingZero!3865 i!1204)) (= lt!223862 (MissingVacant!3865 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32033 (_ BitVec 32)) SeekEntryResult!3865)

(assert (=> b!494738 (= lt!223862 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494739 () Bool)

(declare-fun res!297454 () Bool)

(assert (=> b!494739 (=> (not res!297454) (not e!290243))))

(declare-fun arrayContainsKey!0 (array!32033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494739 (= res!297454 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!297451 () Bool)

(assert (=> start!45078 (=> (not res!297451) (not e!290243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45078 (= res!297451 (validMask!0 mask!3524))))

(assert (=> start!45078 e!290243))

(assert (=> start!45078 true))

(declare-fun array_inv!11284 (array!32033) Bool)

(assert (=> start!45078 (array_inv!11284 a!3235)))

(declare-fun b!494740 () Bool)

(declare-fun res!297453 () Bool)

(assert (=> b!494740 (=> (not res!297453) (not e!290245))))

(declare-datatypes ((List!9598 0))(
  ( (Nil!9595) (Cons!9594 (h!10462 (_ BitVec 64)) (t!15817 List!9598)) )
))
(declare-fun arrayNoDuplicates!0 (array!32033 (_ BitVec 32) List!9598) Bool)

(assert (=> b!494740 (= res!297453 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9595))))

(declare-fun b!494741 () Bool)

(assert (=> b!494741 (= e!290246 (= (seekEntryOrOpen!0 (select (arr!15401 a!3235) j!176) a!3235 mask!3524) (Found!3865 j!176)))))

(declare-fun b!494742 () Bool)

(declare-fun res!297455 () Bool)

(assert (=> b!494742 (=> res!297455 e!290244)))

(get-info :version)

(assert (=> b!494742 (= res!297455 (or (undefined!4677 lt!223864) (not ((_ is Intermediate!3865) lt!223864))))))

(declare-fun b!494743 () Bool)

(declare-fun res!297448 () Bool)

(assert (=> b!494743 (=> (not res!297448) (not e!290243))))

(assert (=> b!494743 (= res!297448 (and (= (size!15766 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15766 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15766 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494744 () Bool)

(declare-fun res!297450 () Bool)

(assert (=> b!494744 (=> (not res!297450) (not e!290243))))

(assert (=> b!494744 (= res!297450 (validKeyInArray!0 k0!2280))))

(declare-fun b!494745 () Bool)

(assert (=> b!494745 (= e!290244 (or (not (= (select (arr!15401 a!3235) (index!17641 lt!223864)) (select (arr!15401 a!3235) j!176))) (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> b!494745 (and (bvslt (x!46714 lt!223864) #b01111111111111111111111111111110) (or (= (select (arr!15401 a!3235) (index!17641 lt!223864)) (select (arr!15401 a!3235) j!176)) (= (select (arr!15401 a!3235) (index!17641 lt!223864)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15401 a!3235) (index!17641 lt!223864)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!494746 () Bool)

(declare-fun res!297456 () Bool)

(assert (=> b!494746 (=> (not res!297456) (not e!290245))))

(assert (=> b!494746 (= res!297456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45078 res!297451) b!494743))

(assert (= (and b!494743 res!297448) b!494737))

(assert (= (and b!494737 res!297458) b!494744))

(assert (= (and b!494744 res!297450) b!494739))

(assert (= (and b!494739 res!297454) b!494738))

(assert (= (and b!494738 res!297452) b!494746))

(assert (= (and b!494746 res!297456) b!494740))

(assert (= (and b!494740 res!297453) b!494736))

(assert (= (and b!494736 res!297457) b!494741))

(assert (= (and b!494736 (not res!297449)) b!494742))

(assert (= (and b!494742 (not res!297455)) b!494745))

(declare-fun m!475405 () Bool)

(assert (=> start!45078 m!475405))

(declare-fun m!475407 () Bool)

(assert (=> start!45078 m!475407))

(declare-fun m!475409 () Bool)

(assert (=> b!494738 m!475409))

(declare-fun m!475411 () Bool)

(assert (=> b!494739 m!475411))

(declare-fun m!475413 () Bool)

(assert (=> b!494746 m!475413))

(declare-fun m!475415 () Bool)

(assert (=> b!494745 m!475415))

(declare-fun m!475417 () Bool)

(assert (=> b!494745 m!475417))

(assert (=> b!494741 m!475417))

(assert (=> b!494741 m!475417))

(declare-fun m!475419 () Bool)

(assert (=> b!494741 m!475419))

(declare-fun m!475421 () Bool)

(assert (=> b!494744 m!475421))

(assert (=> b!494737 m!475417))

(assert (=> b!494737 m!475417))

(declare-fun m!475423 () Bool)

(assert (=> b!494737 m!475423))

(declare-fun m!475425 () Bool)

(assert (=> b!494736 m!475425))

(declare-fun m!475427 () Bool)

(assert (=> b!494736 m!475427))

(declare-fun m!475429 () Bool)

(assert (=> b!494736 m!475429))

(assert (=> b!494736 m!475417))

(declare-fun m!475431 () Bool)

(assert (=> b!494736 m!475431))

(assert (=> b!494736 m!475417))

(assert (=> b!494736 m!475417))

(declare-fun m!475433 () Bool)

(assert (=> b!494736 m!475433))

(assert (=> b!494736 m!475429))

(declare-fun m!475435 () Bool)

(assert (=> b!494736 m!475435))

(declare-fun m!475437 () Bool)

(assert (=> b!494736 m!475437))

(assert (=> b!494736 m!475429))

(declare-fun m!475439 () Bool)

(assert (=> b!494736 m!475439))

(declare-fun m!475441 () Bool)

(assert (=> b!494740 m!475441))

(check-sat (not b!494738) (not b!494746) (not b!494740) (not start!45078) (not b!494744) (not b!494741) (not b!494739) (not b!494737) (not b!494736))
(check-sat)
(get-model)

(declare-fun e!290285 () SeekEntryResult!3865)

(declare-fun b!494825 () Bool)

(declare-fun lt!223901 () SeekEntryResult!3865)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32033 (_ BitVec 32)) SeekEntryResult!3865)

(assert (=> b!494825 (= e!290285 (seekKeyOrZeroReturnVacant!0 (x!46714 lt!223901) (index!17641 lt!223901) (index!17641 lt!223901) k0!2280 a!3235 mask!3524))))

(declare-fun b!494826 () Bool)

(declare-fun e!290284 () SeekEntryResult!3865)

(assert (=> b!494826 (= e!290284 (Found!3865 (index!17641 lt!223901)))))

(declare-fun d!78035 () Bool)

(declare-fun lt!223903 () SeekEntryResult!3865)

(assert (=> d!78035 (and (or ((_ is Undefined!3865) lt!223903) (not ((_ is Found!3865) lt!223903)) (and (bvsge (index!17640 lt!223903) #b00000000000000000000000000000000) (bvslt (index!17640 lt!223903) (size!15766 a!3235)))) (or ((_ is Undefined!3865) lt!223903) ((_ is Found!3865) lt!223903) (not ((_ is MissingZero!3865) lt!223903)) (and (bvsge (index!17639 lt!223903) #b00000000000000000000000000000000) (bvslt (index!17639 lt!223903) (size!15766 a!3235)))) (or ((_ is Undefined!3865) lt!223903) ((_ is Found!3865) lt!223903) ((_ is MissingZero!3865) lt!223903) (not ((_ is MissingVacant!3865) lt!223903)) (and (bvsge (index!17642 lt!223903) #b00000000000000000000000000000000) (bvslt (index!17642 lt!223903) (size!15766 a!3235)))) (or ((_ is Undefined!3865) lt!223903) (ite ((_ is Found!3865) lt!223903) (= (select (arr!15401 a!3235) (index!17640 lt!223903)) k0!2280) (ite ((_ is MissingZero!3865) lt!223903) (= (select (arr!15401 a!3235) (index!17639 lt!223903)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3865) lt!223903) (= (select (arr!15401 a!3235) (index!17642 lt!223903)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!290286 () SeekEntryResult!3865)

(assert (=> d!78035 (= lt!223903 e!290286)))

(declare-fun c!58924 () Bool)

(assert (=> d!78035 (= c!58924 (and ((_ is Intermediate!3865) lt!223901) (undefined!4677 lt!223901)))))

(assert (=> d!78035 (= lt!223901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78035 (validMask!0 mask!3524)))

(assert (=> d!78035 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!223903)))

(declare-fun b!494827 () Bool)

(assert (=> b!494827 (= e!290286 e!290284)))

(declare-fun lt!223902 () (_ BitVec 64))

(assert (=> b!494827 (= lt!223902 (select (arr!15401 a!3235) (index!17641 lt!223901)))))

(declare-fun c!58925 () Bool)

(assert (=> b!494827 (= c!58925 (= lt!223902 k0!2280))))

(declare-fun b!494828 () Bool)

(assert (=> b!494828 (= e!290285 (MissingZero!3865 (index!17641 lt!223901)))))

(declare-fun b!494829 () Bool)

(declare-fun c!58926 () Bool)

(assert (=> b!494829 (= c!58926 (= lt!223902 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!494829 (= e!290284 e!290285)))

(declare-fun b!494830 () Bool)

(assert (=> b!494830 (= e!290286 Undefined!3865)))

(assert (= (and d!78035 c!58924) b!494830))

(assert (= (and d!78035 (not c!58924)) b!494827))

(assert (= (and b!494827 c!58925) b!494826))

(assert (= (and b!494827 (not c!58925)) b!494829))

(assert (= (and b!494829 c!58926) b!494828))

(assert (= (and b!494829 (not c!58926)) b!494825))

(declare-fun m!475519 () Bool)

(assert (=> b!494825 m!475519))

(declare-fun m!475521 () Bool)

(assert (=> d!78035 m!475521))

(declare-fun m!475523 () Bool)

(assert (=> d!78035 m!475523))

(declare-fun m!475525 () Bool)

(assert (=> d!78035 m!475525))

(assert (=> d!78035 m!475405))

(assert (=> d!78035 m!475521))

(declare-fun m!475527 () Bool)

(assert (=> d!78035 m!475527))

(declare-fun m!475529 () Bool)

(assert (=> d!78035 m!475529))

(declare-fun m!475531 () Bool)

(assert (=> b!494827 m!475531))

(assert (=> b!494738 d!78035))

(declare-fun d!78037 () Bool)

(assert (=> d!78037 (= (validKeyInArray!0 (select (arr!15401 a!3235) j!176)) (and (not (= (select (arr!15401 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15401 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!494737 d!78037))

(declare-fun d!78039 () Bool)

(declare-fun lt!223909 () (_ BitVec 32))

(declare-fun lt!223908 () (_ BitVec 32))

(assert (=> d!78039 (= lt!223909 (bvmul (bvxor lt!223908 (bvlshr lt!223908 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78039 (= lt!223908 ((_ extract 31 0) (bvand (bvxor (select (arr!15401 a!3235) j!176) (bvlshr (select (arr!15401 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78039 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!297525 (let ((h!10465 ((_ extract 31 0) (bvand (bvxor (select (arr!15401 a!3235) j!176) (bvlshr (select (arr!15401 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46717 (bvmul (bvxor h!10465 (bvlshr h!10465 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46717 (bvlshr x!46717 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!297525 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!297525 #b00000000000000000000000000000000))))))

(assert (=> d!78039 (= (toIndex!0 (select (arr!15401 a!3235) j!176) mask!3524) (bvand (bvxor lt!223909 (bvlshr lt!223909 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!494736 d!78039))

(declare-fun b!494839 () Bool)

(declare-fun e!290294 () Bool)

(declare-fun e!290293 () Bool)

(assert (=> b!494839 (= e!290294 e!290293)))

(declare-fun c!58929 () Bool)

(assert (=> b!494839 (= c!58929 (validKeyInArray!0 (select (arr!15401 a!3235) j!176)))))

(declare-fun bm!31384 () Bool)

(declare-fun call!31387 () Bool)

(assert (=> bm!31384 (= call!31387 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!494840 () Bool)

(assert (=> b!494840 (= e!290293 call!31387)))

(declare-fun b!494841 () Bool)

(declare-fun e!290295 () Bool)

(assert (=> b!494841 (= e!290293 e!290295)))

(declare-fun lt!223917 () (_ BitVec 64))

(assert (=> b!494841 (= lt!223917 (select (arr!15401 a!3235) j!176))))

(declare-fun lt!223918 () Unit!14662)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32033 (_ BitVec 64) (_ BitVec 32)) Unit!14662)

(assert (=> b!494841 (= lt!223918 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!223917 j!176))))

(assert (=> b!494841 (arrayContainsKey!0 a!3235 lt!223917 #b00000000000000000000000000000000)))

(declare-fun lt!223916 () Unit!14662)

(assert (=> b!494841 (= lt!223916 lt!223918)))

(declare-fun res!297531 () Bool)

(assert (=> b!494841 (= res!297531 (= (seekEntryOrOpen!0 (select (arr!15401 a!3235) j!176) a!3235 mask!3524) (Found!3865 j!176)))))

(assert (=> b!494841 (=> (not res!297531) (not e!290295))))

(declare-fun b!494842 () Bool)

(assert (=> b!494842 (= e!290295 call!31387)))

(declare-fun d!78041 () Bool)

(declare-fun res!297530 () Bool)

(assert (=> d!78041 (=> res!297530 e!290294)))

(assert (=> d!78041 (= res!297530 (bvsge j!176 (size!15766 a!3235)))))

(assert (=> d!78041 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!290294)))

(assert (= (and d!78041 (not res!297530)) b!494839))

(assert (= (and b!494839 c!58929) b!494841))

(assert (= (and b!494839 (not c!58929)) b!494840))

(assert (= (and b!494841 res!297531) b!494842))

(assert (= (or b!494842 b!494840) bm!31384))

(assert (=> b!494839 m!475417))

(assert (=> b!494839 m!475417))

(assert (=> b!494839 m!475423))

(declare-fun m!475533 () Bool)

(assert (=> bm!31384 m!475533))

(assert (=> b!494841 m!475417))

(declare-fun m!475535 () Bool)

(assert (=> b!494841 m!475535))

(declare-fun m!475537 () Bool)

(assert (=> b!494841 m!475537))

(assert (=> b!494841 m!475417))

(assert (=> b!494841 m!475419))

(assert (=> b!494736 d!78041))

(declare-fun b!494900 () Bool)

(declare-fun e!290331 () Bool)

(declare-fun e!290330 () Bool)

(assert (=> b!494900 (= e!290331 e!290330)))

(declare-fun res!297557 () Bool)

(declare-fun lt!223951 () SeekEntryResult!3865)

(assert (=> b!494900 (= res!297557 (and ((_ is Intermediate!3865) lt!223951) (not (undefined!4677 lt!223951)) (bvslt (x!46714 lt!223951) #b01111111111111111111111111111110) (bvsge (x!46714 lt!223951) #b00000000000000000000000000000000) (bvsge (x!46714 lt!223951) #b00000000000000000000000000000000)))))

(assert (=> b!494900 (=> (not res!297557) (not e!290330))))

(declare-fun b!494901 () Bool)

(assert (=> b!494901 (and (bvsge (index!17641 lt!223951) #b00000000000000000000000000000000) (bvslt (index!17641 lt!223951) (size!15766 a!3235)))))

(declare-fun res!297555 () Bool)

(assert (=> b!494901 (= res!297555 (= (select (arr!15401 a!3235) (index!17641 lt!223951)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!290333 () Bool)

(assert (=> b!494901 (=> res!297555 e!290333)))

(declare-fun b!494902 () Bool)

(declare-fun e!290334 () SeekEntryResult!3865)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494902 (= e!290334 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!223863 #b00000000000000000000000000000000 mask!3524) (select (arr!15401 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!494903 () Bool)

(assert (=> b!494903 (= e!290334 (Intermediate!3865 false lt!223863 #b00000000000000000000000000000000))))

(declare-fun d!78045 () Bool)

(assert (=> d!78045 e!290331))

(declare-fun c!58950 () Bool)

(assert (=> d!78045 (= c!58950 (and ((_ is Intermediate!3865) lt!223951) (undefined!4677 lt!223951)))))

(declare-fun e!290332 () SeekEntryResult!3865)

(assert (=> d!78045 (= lt!223951 e!290332)))

(declare-fun c!58948 () Bool)

(assert (=> d!78045 (= c!58948 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!223950 () (_ BitVec 64))

(assert (=> d!78045 (= lt!223950 (select (arr!15401 a!3235) lt!223863))))

(assert (=> d!78045 (validMask!0 mask!3524)))

(assert (=> d!78045 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223863 (select (arr!15401 a!3235) j!176) a!3235 mask!3524) lt!223951)))

(declare-fun b!494904 () Bool)

(assert (=> b!494904 (= e!290331 (bvsge (x!46714 lt!223951) #b01111111111111111111111111111110))))

(declare-fun b!494905 () Bool)

(assert (=> b!494905 (= e!290332 e!290334)))

(declare-fun c!58949 () Bool)

(assert (=> b!494905 (= c!58949 (or (= lt!223950 (select (arr!15401 a!3235) j!176)) (= (bvadd lt!223950 lt!223950) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!494906 () Bool)

(assert (=> b!494906 (and (bvsge (index!17641 lt!223951) #b00000000000000000000000000000000) (bvslt (index!17641 lt!223951) (size!15766 a!3235)))))

(assert (=> b!494906 (= e!290333 (= (select (arr!15401 a!3235) (index!17641 lt!223951)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!494907 () Bool)

(assert (=> b!494907 (= e!290332 (Intermediate!3865 true lt!223863 #b00000000000000000000000000000000))))

(declare-fun b!494908 () Bool)

(assert (=> b!494908 (and (bvsge (index!17641 lt!223951) #b00000000000000000000000000000000) (bvslt (index!17641 lt!223951) (size!15766 a!3235)))))

(declare-fun res!297556 () Bool)

(assert (=> b!494908 (= res!297556 (= (select (arr!15401 a!3235) (index!17641 lt!223951)) (select (arr!15401 a!3235) j!176)))))

(assert (=> b!494908 (=> res!297556 e!290333)))

(assert (=> b!494908 (= e!290330 e!290333)))

(assert (= (and d!78045 c!58948) b!494907))

(assert (= (and d!78045 (not c!58948)) b!494905))

(assert (= (and b!494905 c!58949) b!494903))

(assert (= (and b!494905 (not c!58949)) b!494902))

(assert (= (and d!78045 c!58950) b!494904))

(assert (= (and d!78045 (not c!58950)) b!494900))

(assert (= (and b!494900 res!297557) b!494908))

(assert (= (and b!494908 (not res!297556)) b!494901))

(assert (= (and b!494901 (not res!297555)) b!494906))

(declare-fun m!475553 () Bool)

(assert (=> b!494901 m!475553))

(assert (=> b!494908 m!475553))

(declare-fun m!475555 () Bool)

(assert (=> b!494902 m!475555))

(assert (=> b!494902 m!475555))

(assert (=> b!494902 m!475417))

(declare-fun m!475557 () Bool)

(assert (=> b!494902 m!475557))

(assert (=> b!494906 m!475553))

(declare-fun m!475559 () Bool)

(assert (=> d!78045 m!475559))

(assert (=> d!78045 m!475405))

(assert (=> b!494736 d!78045))

(declare-fun d!78057 () Bool)

(assert (=> d!78057 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!223960 () Unit!14662)

(declare-fun choose!38 (array!32033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14662)

(assert (=> d!78057 (= lt!223960 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78057 (validMask!0 mask!3524)))

(assert (=> d!78057 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!223960)))

(declare-fun bs!15751 () Bool)

(assert (= bs!15751 d!78057))

(assert (=> bs!15751 m!475437))

(declare-fun m!475561 () Bool)

(assert (=> bs!15751 m!475561))

(assert (=> bs!15751 m!475405))

(assert (=> b!494736 d!78057))

(declare-fun d!78059 () Bool)

(declare-fun lt!223962 () (_ BitVec 32))

(declare-fun lt!223961 () (_ BitVec 32))

(assert (=> d!78059 (= lt!223962 (bvmul (bvxor lt!223961 (bvlshr lt!223961 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78059 (= lt!223961 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15401 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15401 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78059 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!297525 (let ((h!10465 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15401 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15401 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46717 (bvmul (bvxor h!10465 (bvlshr h!10465 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46717 (bvlshr x!46717 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!297525 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!297525 #b00000000000000000000000000000000))))))

(assert (=> d!78059 (= (toIndex!0 (select (store (arr!15401 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!223962 (bvlshr lt!223962 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!494736 d!78059))

(declare-fun b!494917 () Bool)

(declare-fun e!290342 () Bool)

(declare-fun e!290341 () Bool)

(assert (=> b!494917 (= e!290342 e!290341)))

(declare-fun res!297564 () Bool)

(declare-fun lt!223964 () SeekEntryResult!3865)

(assert (=> b!494917 (= res!297564 (and ((_ is Intermediate!3865) lt!223964) (not (undefined!4677 lt!223964)) (bvslt (x!46714 lt!223964) #b01111111111111111111111111111110) (bvsge (x!46714 lt!223964) #b00000000000000000000000000000000) (bvsge (x!46714 lt!223964) #b00000000000000000000000000000000)))))

(assert (=> b!494917 (=> (not res!297564) (not e!290341))))

(declare-fun b!494918 () Bool)

(assert (=> b!494918 (and (bvsge (index!17641 lt!223964) #b00000000000000000000000000000000) (bvslt (index!17641 lt!223964) (size!15766 (array!32034 (store (arr!15401 a!3235) i!1204 k0!2280) (size!15766 a!3235)))))))

(declare-fun res!297562 () Bool)

(assert (=> b!494918 (= res!297562 (= (select (arr!15401 (array!32034 (store (arr!15401 a!3235) i!1204 k0!2280) (size!15766 a!3235))) (index!17641 lt!223964)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!290344 () Bool)

(assert (=> b!494918 (=> res!297562 e!290344)))

(declare-fun e!290345 () SeekEntryResult!3865)

(declare-fun b!494919 () Bool)

(assert (=> b!494919 (= e!290345 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!223860 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15401 a!3235) i!1204 k0!2280) j!176) (array!32034 (store (arr!15401 a!3235) i!1204 k0!2280) (size!15766 a!3235)) mask!3524))))

(declare-fun b!494920 () Bool)

(assert (=> b!494920 (= e!290345 (Intermediate!3865 false lt!223860 #b00000000000000000000000000000000))))

(declare-fun d!78061 () Bool)

(assert (=> d!78061 e!290342))

(declare-fun c!58955 () Bool)

(assert (=> d!78061 (= c!58955 (and ((_ is Intermediate!3865) lt!223964) (undefined!4677 lt!223964)))))

(declare-fun e!290343 () SeekEntryResult!3865)

(assert (=> d!78061 (= lt!223964 e!290343)))

(declare-fun c!58953 () Bool)

(assert (=> d!78061 (= c!58953 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!223963 () (_ BitVec 64))

(assert (=> d!78061 (= lt!223963 (select (arr!15401 (array!32034 (store (arr!15401 a!3235) i!1204 k0!2280) (size!15766 a!3235))) lt!223860))))

(assert (=> d!78061 (validMask!0 mask!3524)))

(assert (=> d!78061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223860 (select (store (arr!15401 a!3235) i!1204 k0!2280) j!176) (array!32034 (store (arr!15401 a!3235) i!1204 k0!2280) (size!15766 a!3235)) mask!3524) lt!223964)))

(declare-fun b!494921 () Bool)

(assert (=> b!494921 (= e!290342 (bvsge (x!46714 lt!223964) #b01111111111111111111111111111110))))

(declare-fun b!494922 () Bool)

(assert (=> b!494922 (= e!290343 e!290345)))

(declare-fun c!58954 () Bool)

(assert (=> b!494922 (= c!58954 (or (= lt!223963 (select (store (arr!15401 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!223963 lt!223963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!494923 () Bool)

(assert (=> b!494923 (and (bvsge (index!17641 lt!223964) #b00000000000000000000000000000000) (bvslt (index!17641 lt!223964) (size!15766 (array!32034 (store (arr!15401 a!3235) i!1204 k0!2280) (size!15766 a!3235)))))))

(assert (=> b!494923 (= e!290344 (= (select (arr!15401 (array!32034 (store (arr!15401 a!3235) i!1204 k0!2280) (size!15766 a!3235))) (index!17641 lt!223964)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!494924 () Bool)

(assert (=> b!494924 (= e!290343 (Intermediate!3865 true lt!223860 #b00000000000000000000000000000000))))

(declare-fun b!494925 () Bool)

(assert (=> b!494925 (and (bvsge (index!17641 lt!223964) #b00000000000000000000000000000000) (bvslt (index!17641 lt!223964) (size!15766 (array!32034 (store (arr!15401 a!3235) i!1204 k0!2280) (size!15766 a!3235)))))))

(declare-fun res!297563 () Bool)

(assert (=> b!494925 (= res!297563 (= (select (arr!15401 (array!32034 (store (arr!15401 a!3235) i!1204 k0!2280) (size!15766 a!3235))) (index!17641 lt!223964)) (select (store (arr!15401 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!494925 (=> res!297563 e!290344)))

(assert (=> b!494925 (= e!290341 e!290344)))

(assert (= (and d!78061 c!58953) b!494924))

(assert (= (and d!78061 (not c!58953)) b!494922))

(assert (= (and b!494922 c!58954) b!494920))

(assert (= (and b!494922 (not c!58954)) b!494919))

(assert (= (and d!78061 c!58955) b!494921))

(assert (= (and d!78061 (not c!58955)) b!494917))

(assert (= (and b!494917 res!297564) b!494925))

(assert (= (and b!494925 (not res!297563)) b!494918))

(assert (= (and b!494918 (not res!297562)) b!494923))

(declare-fun m!475563 () Bool)

(assert (=> b!494918 m!475563))

(assert (=> b!494925 m!475563))

(declare-fun m!475565 () Bool)

(assert (=> b!494919 m!475565))

(assert (=> b!494919 m!475565))

(assert (=> b!494919 m!475429))

(declare-fun m!475567 () Bool)

(assert (=> b!494919 m!475567))

(assert (=> b!494923 m!475563))

(declare-fun m!475569 () Bool)

(assert (=> d!78061 m!475569))

(assert (=> d!78061 m!475405))

(assert (=> b!494736 d!78061))

(declare-fun b!494926 () Bool)

(declare-fun e!290347 () Bool)

(declare-fun e!290346 () Bool)

(assert (=> b!494926 (= e!290347 e!290346)))

(declare-fun c!58956 () Bool)

(assert (=> b!494926 (= c!58956 (validKeyInArray!0 (select (arr!15401 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31390 () Bool)

(declare-fun call!31393 () Bool)

(assert (=> bm!31390 (= call!31393 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!494927 () Bool)

(assert (=> b!494927 (= e!290346 call!31393)))

(declare-fun b!494928 () Bool)

(declare-fun e!290348 () Bool)

(assert (=> b!494928 (= e!290346 e!290348)))

(declare-fun lt!223966 () (_ BitVec 64))

(assert (=> b!494928 (= lt!223966 (select (arr!15401 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!223967 () Unit!14662)

(assert (=> b!494928 (= lt!223967 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!223966 #b00000000000000000000000000000000))))

(assert (=> b!494928 (arrayContainsKey!0 a!3235 lt!223966 #b00000000000000000000000000000000)))

(declare-fun lt!223965 () Unit!14662)

(assert (=> b!494928 (= lt!223965 lt!223967)))

(declare-fun res!297566 () Bool)

(assert (=> b!494928 (= res!297566 (= (seekEntryOrOpen!0 (select (arr!15401 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3865 #b00000000000000000000000000000000)))))

(assert (=> b!494928 (=> (not res!297566) (not e!290348))))

(declare-fun b!494929 () Bool)

(assert (=> b!494929 (= e!290348 call!31393)))

(declare-fun d!78063 () Bool)

(declare-fun res!297565 () Bool)

(assert (=> d!78063 (=> res!297565 e!290347)))

(assert (=> d!78063 (= res!297565 (bvsge #b00000000000000000000000000000000 (size!15766 a!3235)))))

(assert (=> d!78063 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!290347)))

(assert (= (and d!78063 (not res!297565)) b!494926))

(assert (= (and b!494926 c!58956) b!494928))

(assert (= (and b!494926 (not c!58956)) b!494927))

(assert (= (and b!494928 res!297566) b!494929))

(assert (= (or b!494929 b!494927) bm!31390))

(declare-fun m!475571 () Bool)

(assert (=> b!494926 m!475571))

(assert (=> b!494926 m!475571))

(declare-fun m!475573 () Bool)

(assert (=> b!494926 m!475573))

(declare-fun m!475575 () Bool)

(assert (=> bm!31390 m!475575))

(assert (=> b!494928 m!475571))

(declare-fun m!475577 () Bool)

(assert (=> b!494928 m!475577))

(declare-fun m!475579 () Bool)

(assert (=> b!494928 m!475579))

(assert (=> b!494928 m!475571))

(declare-fun m!475581 () Bool)

(assert (=> b!494928 m!475581))

(assert (=> b!494746 d!78063))

(declare-fun d!78065 () Bool)

(assert (=> d!78065 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45078 d!78065))

(declare-fun d!78075 () Bool)

(assert (=> d!78075 (= (array_inv!11284 a!3235) (bvsge (size!15766 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45078 d!78075))

(declare-fun lt!223982 () SeekEntryResult!3865)

(declare-fun b!494961 () Bool)

(declare-fun e!290368 () SeekEntryResult!3865)

(assert (=> b!494961 (= e!290368 (seekKeyOrZeroReturnVacant!0 (x!46714 lt!223982) (index!17641 lt!223982) (index!17641 lt!223982) (select (arr!15401 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!494962 () Bool)

(declare-fun e!290367 () SeekEntryResult!3865)

(assert (=> b!494962 (= e!290367 (Found!3865 (index!17641 lt!223982)))))

(declare-fun d!78077 () Bool)

(declare-fun lt!223984 () SeekEntryResult!3865)

(assert (=> d!78077 (and (or ((_ is Undefined!3865) lt!223984) (not ((_ is Found!3865) lt!223984)) (and (bvsge (index!17640 lt!223984) #b00000000000000000000000000000000) (bvslt (index!17640 lt!223984) (size!15766 a!3235)))) (or ((_ is Undefined!3865) lt!223984) ((_ is Found!3865) lt!223984) (not ((_ is MissingZero!3865) lt!223984)) (and (bvsge (index!17639 lt!223984) #b00000000000000000000000000000000) (bvslt (index!17639 lt!223984) (size!15766 a!3235)))) (or ((_ is Undefined!3865) lt!223984) ((_ is Found!3865) lt!223984) ((_ is MissingZero!3865) lt!223984) (not ((_ is MissingVacant!3865) lt!223984)) (and (bvsge (index!17642 lt!223984) #b00000000000000000000000000000000) (bvslt (index!17642 lt!223984) (size!15766 a!3235)))) (or ((_ is Undefined!3865) lt!223984) (ite ((_ is Found!3865) lt!223984) (= (select (arr!15401 a!3235) (index!17640 lt!223984)) (select (arr!15401 a!3235) j!176)) (ite ((_ is MissingZero!3865) lt!223984) (= (select (arr!15401 a!3235) (index!17639 lt!223984)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3865) lt!223984) (= (select (arr!15401 a!3235) (index!17642 lt!223984)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!290369 () SeekEntryResult!3865)

(assert (=> d!78077 (= lt!223984 e!290369)))

(declare-fun c!58967 () Bool)

(assert (=> d!78077 (= c!58967 (and ((_ is Intermediate!3865) lt!223982) (undefined!4677 lt!223982)))))

(assert (=> d!78077 (= lt!223982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15401 a!3235) j!176) mask!3524) (select (arr!15401 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78077 (validMask!0 mask!3524)))

(assert (=> d!78077 (= (seekEntryOrOpen!0 (select (arr!15401 a!3235) j!176) a!3235 mask!3524) lt!223984)))

(declare-fun b!494963 () Bool)

(assert (=> b!494963 (= e!290369 e!290367)))

(declare-fun lt!223983 () (_ BitVec 64))

(assert (=> b!494963 (= lt!223983 (select (arr!15401 a!3235) (index!17641 lt!223982)))))

(declare-fun c!58968 () Bool)

(assert (=> b!494963 (= c!58968 (= lt!223983 (select (arr!15401 a!3235) j!176)))))

(declare-fun b!494964 () Bool)

(assert (=> b!494964 (= e!290368 (MissingZero!3865 (index!17641 lt!223982)))))

(declare-fun b!494965 () Bool)

(declare-fun c!58969 () Bool)

(assert (=> b!494965 (= c!58969 (= lt!223983 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!494965 (= e!290367 e!290368)))

(declare-fun b!494966 () Bool)

(assert (=> b!494966 (= e!290369 Undefined!3865)))

(assert (= (and d!78077 c!58967) b!494966))

(assert (= (and d!78077 (not c!58967)) b!494963))

(assert (= (and b!494963 c!58968) b!494962))

(assert (= (and b!494963 (not c!58968)) b!494965))

(assert (= (and b!494965 c!58969) b!494964))

(assert (= (and b!494965 (not c!58969)) b!494961))

(assert (=> b!494961 m!475417))

(declare-fun m!475599 () Bool)

(assert (=> b!494961 m!475599))

(assert (=> d!78077 m!475431))

(assert (=> d!78077 m!475417))

(declare-fun m!475601 () Bool)

(assert (=> d!78077 m!475601))

(declare-fun m!475603 () Bool)

(assert (=> d!78077 m!475603))

(assert (=> d!78077 m!475405))

(assert (=> d!78077 m!475417))

(assert (=> d!78077 m!475431))

(declare-fun m!475605 () Bool)

(assert (=> d!78077 m!475605))

(declare-fun m!475607 () Bool)

(assert (=> d!78077 m!475607))

(declare-fun m!475609 () Bool)

(assert (=> b!494963 m!475609))

(assert (=> b!494741 d!78077))

(declare-fun b!494995 () Bool)

(declare-fun e!290388 () Bool)

(declare-fun e!290389 () Bool)

(assert (=> b!494995 (= e!290388 e!290389)))

(declare-fun res!297590 () Bool)

(assert (=> b!494995 (=> (not res!297590) (not e!290389))))

(declare-fun e!290391 () Bool)

(assert (=> b!494995 (= res!297590 (not e!290391))))

(declare-fun res!297592 () Bool)

(assert (=> b!494995 (=> (not res!297592) (not e!290391))))

(assert (=> b!494995 (= res!297592 (validKeyInArray!0 (select (arr!15401 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!494996 () Bool)

(declare-fun e!290390 () Bool)

(declare-fun call!31397 () Bool)

(assert (=> b!494996 (= e!290390 call!31397)))

(declare-fun bm!31394 () Bool)

(declare-fun c!58978 () Bool)

(assert (=> bm!31394 (= call!31397 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58978 (Cons!9594 (select (arr!15401 a!3235) #b00000000000000000000000000000000) Nil!9595) Nil!9595)))))

(declare-fun b!494998 () Bool)

(assert (=> b!494998 (= e!290389 e!290390)))

(assert (=> b!494998 (= c!58978 (validKeyInArray!0 (select (arr!15401 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!494999 () Bool)

(declare-fun contains!2697 (List!9598 (_ BitVec 64)) Bool)

(assert (=> b!494999 (= e!290391 (contains!2697 Nil!9595 (select (arr!15401 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78079 () Bool)

(declare-fun res!297591 () Bool)

(assert (=> d!78079 (=> res!297591 e!290388)))

(assert (=> d!78079 (= res!297591 (bvsge #b00000000000000000000000000000000 (size!15766 a!3235)))))

(assert (=> d!78079 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9595) e!290388)))

(declare-fun b!494997 () Bool)

(assert (=> b!494997 (= e!290390 call!31397)))

(assert (= (and d!78079 (not res!297591)) b!494995))

(assert (= (and b!494995 res!297592) b!494999))

(assert (= (and b!494995 res!297590) b!494998))

(assert (= (and b!494998 c!58978) b!494997))

(assert (= (and b!494998 (not c!58978)) b!494996))

(assert (= (or b!494997 b!494996) bm!31394))

(assert (=> b!494995 m!475571))

(assert (=> b!494995 m!475571))

(assert (=> b!494995 m!475573))

(assert (=> bm!31394 m!475571))

(declare-fun m!475629 () Bool)

(assert (=> bm!31394 m!475629))

(assert (=> b!494998 m!475571))

(assert (=> b!494998 m!475571))

(assert (=> b!494998 m!475573))

(assert (=> b!494999 m!475571))

(assert (=> b!494999 m!475571))

(declare-fun m!475631 () Bool)

(assert (=> b!494999 m!475631))

(assert (=> b!494740 d!78079))

(declare-fun d!78087 () Bool)

(assert (=> d!78087 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!494744 d!78087))

(declare-fun d!78091 () Bool)

(declare-fun res!297601 () Bool)

(declare-fun e!290400 () Bool)

(assert (=> d!78091 (=> res!297601 e!290400)))

(assert (=> d!78091 (= res!297601 (= (select (arr!15401 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78091 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!290400)))

(declare-fun b!495008 () Bool)

(declare-fun e!290401 () Bool)

(assert (=> b!495008 (= e!290400 e!290401)))

(declare-fun res!297602 () Bool)

(assert (=> b!495008 (=> (not res!297602) (not e!290401))))

(assert (=> b!495008 (= res!297602 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15766 a!3235)))))

(declare-fun b!495009 () Bool)

(assert (=> b!495009 (= e!290401 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78091 (not res!297601)) b!495008))

(assert (= (and b!495008 res!297602) b!495009))

(assert (=> d!78091 m!475571))

(declare-fun m!475633 () Bool)

(assert (=> b!495009 m!475633))

(assert (=> b!494739 d!78091))

(check-sat (not d!78045) (not b!494841) (not b!494998) (not d!78061) (not b!494961) (not d!78035) (not b!494926) (not b!494919) (not b!494995) (not bm!31390) (not b!495009) (not bm!31384) (not b!494902) (not bm!31394) (not d!78057) (not b!494839) (not d!78077) (not b!494928) (not b!494999) (not b!494825))
(check-sat)
