; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45288 () Bool)

(assert start!45288)

(declare-fun b!497608 () Bool)

(declare-fun e!291660 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!497608 (= e!291660 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(declare-datatypes ((array!32176 0))(
  ( (array!32177 (arr!15471 (Array (_ BitVec 32) (_ BitVec 64))) (size!15835 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32176)

(declare-datatypes ((SeekEntryResult!3938 0))(
  ( (MissingZero!3938 (index!17931 (_ BitVec 32))) (Found!3938 (index!17932 (_ BitVec 32))) (Intermediate!3938 (undefined!4750 Bool) (index!17933 (_ BitVec 32)) (x!46982 (_ BitVec 32))) (Undefined!3938) (MissingVacant!3938 (index!17934 (_ BitVec 32))) )
))
(declare-fun lt!225306 () SeekEntryResult!3938)

(assert (=> b!497608 (and (or (= (select (arr!15471 a!3235) (index!17933 lt!225306)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15471 a!3235) (index!17933 lt!225306)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15471 a!3235) (index!17933 lt!225306)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15471 a!3235) (index!17933 lt!225306)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!14828 0))(
  ( (Unit!14829) )
))
(declare-fun lt!225303 () Unit!14828)

(declare-fun e!291662 () Unit!14828)

(assert (=> b!497608 (= lt!225303 e!291662)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!59093 () Bool)

(assert (=> b!497608 (= c!59093 (= (select (arr!15471 a!3235) (index!17933 lt!225306)) (select (arr!15471 a!3235) j!176)))))

(assert (=> b!497608 (and (bvslt (x!46982 lt!225306) #b01111111111111111111111111111110) (or (= (select (arr!15471 a!3235) (index!17933 lt!225306)) (select (arr!15471 a!3235) j!176)) (= (select (arr!15471 a!3235) (index!17933 lt!225306)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15471 a!3235) (index!17933 lt!225306)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497609 () Bool)

(declare-fun res!299984 () Bool)

(declare-fun e!291664 () Bool)

(assert (=> b!497609 (=> (not res!299984) (not e!291664))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497609 (= res!299984 (validKeyInArray!0 k!2280))))

(declare-fun b!497610 () Bool)

(declare-fun res!299981 () Bool)

(declare-fun e!291663 () Bool)

(assert (=> b!497610 (=> (not res!299981) (not e!291663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32176 (_ BitVec 32)) Bool)

(assert (=> b!497610 (= res!299981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497611 () Bool)

(declare-fun Unit!14830 () Unit!14828)

(assert (=> b!497611 (= e!291662 Unit!14830)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!225308 () Unit!14828)

(declare-fun lt!225309 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32176 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14828)

(assert (=> b!497611 (= lt!225308 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225309 #b00000000000000000000000000000000 (index!17933 lt!225306) (x!46982 lt!225306) mask!3524))))

(declare-fun lt!225305 () array!32176)

(declare-fun lt!225307 () (_ BitVec 64))

(declare-fun res!299978 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32176 (_ BitVec 32)) SeekEntryResult!3938)

(assert (=> b!497611 (= res!299978 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225309 lt!225307 lt!225305 mask!3524) (Intermediate!3938 false (index!17933 lt!225306) (x!46982 lt!225306))))))

(declare-fun e!291661 () Bool)

(assert (=> b!497611 (=> (not res!299978) (not e!291661))))

(assert (=> b!497611 e!291661))

(declare-fun b!497612 () Bool)

(declare-fun Unit!14831 () Unit!14828)

(assert (=> b!497612 (= e!291662 Unit!14831)))

(declare-fun b!497613 () Bool)

(assert (=> b!497613 (= e!291661 false)))

(declare-fun b!497614 () Bool)

(declare-fun e!291666 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32176 (_ BitVec 32)) SeekEntryResult!3938)

(assert (=> b!497614 (= e!291666 (= (seekEntryOrOpen!0 (select (arr!15471 a!3235) j!176) a!3235 mask!3524) (Found!3938 j!176)))))

(declare-fun b!497615 () Bool)

(declare-fun res!299979 () Bool)

(assert (=> b!497615 (=> (not res!299979) (not e!291664))))

(assert (=> b!497615 (= res!299979 (validKeyInArray!0 (select (arr!15471 a!3235) j!176)))))

(declare-fun b!497616 () Bool)

(assert (=> b!497616 (= e!291664 e!291663)))

(declare-fun res!299975 () Bool)

(assert (=> b!497616 (=> (not res!299975) (not e!291663))))

(declare-fun lt!225302 () SeekEntryResult!3938)

(assert (=> b!497616 (= res!299975 (or (= lt!225302 (MissingZero!3938 i!1204)) (= lt!225302 (MissingVacant!3938 i!1204))))))

(assert (=> b!497616 (= lt!225302 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!497617 () Bool)

(assert (=> b!497617 (= e!291663 (not e!291660))))

(declare-fun res!299983 () Bool)

(assert (=> b!497617 (=> res!299983 e!291660)))

(declare-fun lt!225304 () (_ BitVec 32))

(assert (=> b!497617 (= res!299983 (= lt!225306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225304 lt!225307 lt!225305 mask!3524)))))

(assert (=> b!497617 (= lt!225306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225309 (select (arr!15471 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497617 (= lt!225304 (toIndex!0 lt!225307 mask!3524))))

(assert (=> b!497617 (= lt!225307 (select (store (arr!15471 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!497617 (= lt!225309 (toIndex!0 (select (arr!15471 a!3235) j!176) mask!3524))))

(assert (=> b!497617 (= lt!225305 (array!32177 (store (arr!15471 a!3235) i!1204 k!2280) (size!15835 a!3235)))))

(assert (=> b!497617 e!291666))

(declare-fun res!299976 () Bool)

(assert (=> b!497617 (=> (not res!299976) (not e!291666))))

(assert (=> b!497617 (= res!299976 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225310 () Unit!14828)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14828)

(assert (=> b!497617 (= lt!225310 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497618 () Bool)

(declare-fun res!299974 () Bool)

(assert (=> b!497618 (=> res!299974 e!291660)))

(assert (=> b!497618 (= res!299974 (or (undefined!4750 lt!225306) (not (is-Intermediate!3938 lt!225306))))))

(declare-fun b!497619 () Bool)

(declare-fun res!299982 () Bool)

(assert (=> b!497619 (=> (not res!299982) (not e!291664))))

(declare-fun arrayContainsKey!0 (array!32176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497619 (= res!299982 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!299977 () Bool)

(assert (=> start!45288 (=> (not res!299977) (not e!291664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45288 (= res!299977 (validMask!0 mask!3524))))

(assert (=> start!45288 e!291664))

(assert (=> start!45288 true))

(declare-fun array_inv!11267 (array!32176) Bool)

(assert (=> start!45288 (array_inv!11267 a!3235)))

(declare-fun b!497620 () Bool)

(declare-fun res!299980 () Bool)

(assert (=> b!497620 (=> (not res!299980) (not e!291663))))

(declare-datatypes ((List!9629 0))(
  ( (Nil!9626) (Cons!9625 (h!10496 (_ BitVec 64)) (t!15857 List!9629)) )
))
(declare-fun arrayNoDuplicates!0 (array!32176 (_ BitVec 32) List!9629) Bool)

(assert (=> b!497620 (= res!299980 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9626))))

(declare-fun b!497621 () Bool)

(declare-fun res!299973 () Bool)

(assert (=> b!497621 (=> (not res!299973) (not e!291664))))

(assert (=> b!497621 (= res!299973 (and (= (size!15835 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15835 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15835 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45288 res!299977) b!497621))

(assert (= (and b!497621 res!299973) b!497615))

(assert (= (and b!497615 res!299979) b!497609))

(assert (= (and b!497609 res!299984) b!497619))

(assert (= (and b!497619 res!299982) b!497616))

(assert (= (and b!497616 res!299975) b!497610))

(assert (= (and b!497610 res!299981) b!497620))

(assert (= (and b!497620 res!299980) b!497617))

(assert (= (and b!497617 res!299976) b!497614))

(assert (= (and b!497617 (not res!299983)) b!497618))

(assert (= (and b!497618 (not res!299974)) b!497608))

(assert (= (and b!497608 c!59093) b!497611))

(assert (= (and b!497608 (not c!59093)) b!497612))

(assert (= (and b!497611 res!299978) b!497613))

(declare-fun m!478995 () Bool)

(assert (=> b!497614 m!478995))

(assert (=> b!497614 m!478995))

(declare-fun m!478997 () Bool)

(assert (=> b!497614 m!478997))

(declare-fun m!478999 () Bool)

(assert (=> start!45288 m!478999))

(declare-fun m!479001 () Bool)

(assert (=> start!45288 m!479001))

(declare-fun m!479003 () Bool)

(assert (=> b!497608 m!479003))

(assert (=> b!497608 m!478995))

(declare-fun m!479005 () Bool)

(assert (=> b!497610 m!479005))

(declare-fun m!479007 () Bool)

(assert (=> b!497617 m!479007))

(declare-fun m!479009 () Bool)

(assert (=> b!497617 m!479009))

(assert (=> b!497617 m!478995))

(declare-fun m!479011 () Bool)

(assert (=> b!497617 m!479011))

(declare-fun m!479013 () Bool)

(assert (=> b!497617 m!479013))

(assert (=> b!497617 m!478995))

(declare-fun m!479015 () Bool)

(assert (=> b!497617 m!479015))

(assert (=> b!497617 m!478995))

(declare-fun m!479017 () Bool)

(assert (=> b!497617 m!479017))

(declare-fun m!479019 () Bool)

(assert (=> b!497617 m!479019))

(declare-fun m!479021 () Bool)

(assert (=> b!497617 m!479021))

(declare-fun m!479023 () Bool)

(assert (=> b!497619 m!479023))

(declare-fun m!479025 () Bool)

(assert (=> b!497611 m!479025))

(declare-fun m!479027 () Bool)

(assert (=> b!497611 m!479027))

(declare-fun m!479029 () Bool)

(assert (=> b!497620 m!479029))

(declare-fun m!479031 () Bool)

(assert (=> b!497609 m!479031))

(assert (=> b!497615 m!478995))

(assert (=> b!497615 m!478995))

(declare-fun m!479033 () Bool)

(assert (=> b!497615 m!479033))

(declare-fun m!479035 () Bool)

(assert (=> b!497616 m!479035))

(push 1)

(assert (not b!497614))

(assert (not b!497617))

(assert (not b!497611))

(assert (not b!497616))

(assert (not start!45288))

(assert (not b!497619))

(assert (not b!497615))

(assert (not b!497620))

(assert (not b!497609))

(assert (not b!497610))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!497835 () Bool)

(declare-fun e!291794 () SeekEntryResult!3938)

(assert (=> b!497835 (= e!291794 (Intermediate!3938 true lt!225309 #b00000000000000000000000000000000))))

(declare-fun b!497836 () Bool)

(declare-fun lt!225425 () SeekEntryResult!3938)

(assert (=> b!497836 (and (bvsge (index!17933 lt!225425) #b00000000000000000000000000000000) (bvslt (index!17933 lt!225425) (size!15835 a!3235)))))

(declare-fun e!291791 () Bool)

(assert (=> b!497836 (= e!291791 (= (select (arr!15471 a!3235) (index!17933 lt!225425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!78387 () Bool)

(declare-fun e!291792 () Bool)

(assert (=> d!78387 e!291792))

(declare-fun c!59142 () Bool)

(assert (=> d!78387 (= c!59142 (and (is-Intermediate!3938 lt!225425) (undefined!4750 lt!225425)))))

(assert (=> d!78387 (= lt!225425 e!291794)))

(declare-fun c!59144 () Bool)

(assert (=> d!78387 (= c!59144 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!225424 () (_ BitVec 64))

(assert (=> d!78387 (= lt!225424 (select (arr!15471 a!3235) lt!225309))))

(assert (=> d!78387 (validMask!0 mask!3524)))

(assert (=> d!78387 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225309 (select (arr!15471 a!3235) j!176) a!3235 mask!3524) lt!225425)))

(declare-fun e!291793 () SeekEntryResult!3938)

(declare-fun b!497837 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497837 (= e!291793 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!225309 #b00000000000000000000000000000000 mask!3524) (select (arr!15471 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!497838 () Bool)

(assert (=> b!497838 (= e!291792 (bvsge (x!46982 lt!225425) #b01111111111111111111111111111110))))

(declare-fun b!497839 () Bool)

(assert (=> b!497839 (and (bvsge (index!17933 lt!225425) #b00000000000000000000000000000000) (bvslt (index!17933 lt!225425) (size!15835 a!3235)))))

(declare-fun res!300103 () Bool)

(assert (=> b!497839 (= res!300103 (= (select (arr!15471 a!3235) (index!17933 lt!225425)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!497839 (=> res!300103 e!291791)))

(declare-fun b!497840 () Bool)

(assert (=> b!497840 (and (bvsge (index!17933 lt!225425) #b00000000000000000000000000000000) (bvslt (index!17933 lt!225425) (size!15835 a!3235)))))

(declare-fun res!300104 () Bool)

(assert (=> b!497840 (= res!300104 (= (select (arr!15471 a!3235) (index!17933 lt!225425)) (select (arr!15471 a!3235) j!176)))))

(assert (=> b!497840 (=> res!300104 e!291791)))

(declare-fun e!291790 () Bool)

(assert (=> b!497840 (= e!291790 e!291791)))

(declare-fun b!497841 () Bool)

(assert (=> b!497841 (= e!291794 e!291793)))

(declare-fun c!59143 () Bool)

(assert (=> b!497841 (= c!59143 (or (= lt!225424 (select (arr!15471 a!3235) j!176)) (= (bvadd lt!225424 lt!225424) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497842 () Bool)

(assert (=> b!497842 (= e!291792 e!291790)))

(declare-fun res!300105 () Bool)

(assert (=> b!497842 (= res!300105 (and (is-Intermediate!3938 lt!225425) (not (undefined!4750 lt!225425)) (bvslt (x!46982 lt!225425) #b01111111111111111111111111111110) (bvsge (x!46982 lt!225425) #b00000000000000000000000000000000) (bvsge (x!46982 lt!225425) #b00000000000000000000000000000000)))))

(assert (=> b!497842 (=> (not res!300105) (not e!291790))))

(declare-fun b!497843 () Bool)

(assert (=> b!497843 (= e!291793 (Intermediate!3938 false lt!225309 #b00000000000000000000000000000000))))

(assert (= (and d!78387 c!59144) b!497835))

(assert (= (and d!78387 (not c!59144)) b!497841))

(assert (= (and b!497841 c!59143) b!497843))

(assert (= (and b!497841 (not c!59143)) b!497837))

(assert (= (and d!78387 c!59142) b!497838))

(assert (= (and d!78387 (not c!59142)) b!497842))

(assert (= (and b!497842 res!300105) b!497840))

(assert (= (and b!497840 (not res!300104)) b!497839))

(assert (= (and b!497839 (not res!300103)) b!497836))

(declare-fun m!479191 () Bool)

(assert (=> d!78387 m!479191))

(assert (=> d!78387 m!478999))

(declare-fun m!479193 () Bool)

(assert (=> b!497840 m!479193))

(assert (=> b!497836 m!479193))

(assert (=> b!497839 m!479193))

(declare-fun m!479195 () Bool)

(assert (=> b!497837 m!479195))

(assert (=> b!497837 m!479195))

(assert (=> b!497837 m!478995))

(declare-fun m!479197 () Bool)

(assert (=> b!497837 m!479197))

(assert (=> b!497617 d!78387))

(declare-fun d!78403 () Bool)

(declare-fun lt!225441 () (_ BitVec 32))

(declare-fun lt!225440 () (_ BitVec 32))

(assert (=> d!78403 (= lt!225441 (bvmul (bvxor lt!225440 (bvlshr lt!225440 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78403 (= lt!225440 ((_ extract 31 0) (bvand (bvxor (select (arr!15471 a!3235) j!176) (bvlshr (select (arr!15471 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78403 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!300106 (let ((h!10500 ((_ extract 31 0) (bvand (bvxor (select (arr!15471 a!3235) j!176) (bvlshr (select (arr!15471 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46989 (bvmul (bvxor h!10500 (bvlshr h!10500 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46989 (bvlshr x!46989 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!300106 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!300106 #b00000000000000000000000000000000))))))

(assert (=> d!78403 (= (toIndex!0 (select (arr!15471 a!3235) j!176) mask!3524) (bvand (bvxor lt!225441 (bvlshr lt!225441 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!497617 d!78403))

(declare-fun b!497868 () Bool)

(declare-fun e!291813 () Bool)

(declare-fun call!31440 () Bool)

(assert (=> b!497868 (= e!291813 call!31440)))

(declare-fun b!497869 () Bool)

(declare-fun e!291814 () Bool)

(assert (=> b!497869 (= e!291814 e!291813)))

(declare-fun lt!225450 () (_ BitVec 64))

(assert (=> b!497869 (= lt!225450 (select (arr!15471 a!3235) j!176))))

(declare-fun lt!225449 () Unit!14828)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32176 (_ BitVec 64) (_ BitVec 32)) Unit!14828)

(assert (=> b!497869 (= lt!225449 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!225450 j!176))))

(assert (=> b!497869 (arrayContainsKey!0 a!3235 lt!225450 #b00000000000000000000000000000000)))

(declare-fun lt!225451 () Unit!14828)

(assert (=> b!497869 (= lt!225451 lt!225449)))

(declare-fun res!300120 () Bool)

(assert (=> b!497869 (= res!300120 (= (seekEntryOrOpen!0 (select (arr!15471 a!3235) j!176) a!3235 mask!3524) (Found!3938 j!176)))))

(assert (=> b!497869 (=> (not res!300120) (not e!291813))))

(declare-fun d!78411 () Bool)

(declare-fun res!300119 () Bool)

(declare-fun e!291812 () Bool)

(assert (=> d!78411 (=> res!300119 e!291812)))

(assert (=> d!78411 (= res!300119 (bvsge j!176 (size!15835 a!3235)))))

(assert (=> d!78411 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!291812)))

(declare-fun bm!31437 () Bool)

(assert (=> bm!31437 (= call!31440 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!497870 () Bool)

(assert (=> b!497870 (= e!291812 e!291814)))

(declare-fun c!59151 () Bool)

(assert (=> b!497870 (= c!59151 (validKeyInArray!0 (select (arr!15471 a!3235) j!176)))))

(declare-fun b!497871 () Bool)

(assert (=> b!497871 (= e!291814 call!31440)))

(assert (= (and d!78411 (not res!300119)) b!497870))

(assert (= (and b!497870 c!59151) b!497869))

(assert (= (and b!497870 (not c!59151)) b!497871))

(assert (= (and b!497869 res!300120) b!497868))

(assert (= (or b!497868 b!497871) bm!31437))

(assert (=> b!497869 m!478995))

(declare-fun m!479223 () Bool)

(assert (=> b!497869 m!479223))

(declare-fun m!479225 () Bool)

(assert (=> b!497869 m!479225))

(assert (=> b!497869 m!478995))

(assert (=> b!497869 m!478997))

(declare-fun m!479227 () Bool)

(assert (=> bm!31437 m!479227))

(assert (=> b!497870 m!478995))

(assert (=> b!497870 m!478995))

(assert (=> b!497870 m!479033))

(assert (=> b!497617 d!78411))

(declare-fun d!78421 () Bool)

(declare-fun lt!225453 () (_ BitVec 32))

(declare-fun lt!225452 () (_ BitVec 32))

(assert (=> d!78421 (= lt!225453 (bvmul (bvxor lt!225452 (bvlshr lt!225452 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78421 (= lt!225452 ((_ extract 31 0) (bvand (bvxor lt!225307 (bvlshr lt!225307 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78421 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!300106 (let ((h!10500 ((_ extract 31 0) (bvand (bvxor lt!225307 (bvlshr lt!225307 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46989 (bvmul (bvxor h!10500 (bvlshr h!10500 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46989 (bvlshr x!46989 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!300106 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!300106 #b00000000000000000000000000000000))))))

(assert (=> d!78421 (= (toIndex!0 lt!225307 mask!3524) (bvand (bvxor lt!225453 (bvlshr lt!225453 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!497617 d!78421))

(declare-fun b!497882 () Bool)

(declare-fun e!291827 () SeekEntryResult!3938)

(assert (=> b!497882 (= e!291827 (Intermediate!3938 true lt!225304 #b00000000000000000000000000000000))))

(declare-fun b!497883 () Bool)

(declare-fun lt!225455 () SeekEntryResult!3938)

(assert (=> b!497883 (and (bvsge (index!17933 lt!225455) #b00000000000000000000000000000000) (bvslt (index!17933 lt!225455) (size!15835 lt!225305)))))

(declare-fun e!291824 () Bool)

(assert (=> b!497883 (= e!291824 (= (select (arr!15471 lt!225305) (index!17933 lt!225455)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!78423 () Bool)

(declare-fun e!291825 () Bool)

(assert (=> d!78423 e!291825))

(declare-fun c!59154 () Bool)

(assert (=> d!78423 (= c!59154 (and (is-Intermediate!3938 lt!225455) (undefined!4750 lt!225455)))))

(assert (=> d!78423 (= lt!225455 e!291827)))

(declare-fun c!59156 () Bool)

(assert (=> d!78423 (= c!59156 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!225454 () (_ BitVec 64))

(assert (=> d!78423 (= lt!225454 (select (arr!15471 lt!225305) lt!225304))))

(assert (=> d!78423 (validMask!0 mask!3524)))

(assert (=> d!78423 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225304 lt!225307 lt!225305 mask!3524) lt!225455)))

(declare-fun e!291826 () SeekEntryResult!3938)

(declare-fun b!497884 () Bool)

(assert (=> b!497884 (= e!291826 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!225304 #b00000000000000000000000000000000 mask!3524) lt!225307 lt!225305 mask!3524))))

(declare-fun b!497885 () Bool)

(assert (=> b!497885 (= e!291825 (bvsge (x!46982 lt!225455) #b01111111111111111111111111111110))))

(declare-fun b!497886 () Bool)

(assert (=> b!497886 (and (bvsge (index!17933 lt!225455) #b00000000000000000000000000000000) (bvslt (index!17933 lt!225455) (size!15835 lt!225305)))))

(declare-fun res!300127 () Bool)

(assert (=> b!497886 (= res!300127 (= (select (arr!15471 lt!225305) (index!17933 lt!225455)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!497886 (=> res!300127 e!291824)))

(declare-fun b!497887 () Bool)

(assert (=> b!497887 (and (bvsge (index!17933 lt!225455) #b00000000000000000000000000000000) (bvslt (index!17933 lt!225455) (size!15835 lt!225305)))))

(declare-fun res!300128 () Bool)

(assert (=> b!497887 (= res!300128 (= (select (arr!15471 lt!225305) (index!17933 lt!225455)) lt!225307))))

(assert (=> b!497887 (=> res!300128 e!291824)))

(declare-fun e!291823 () Bool)

(assert (=> b!497887 (= e!291823 e!291824)))

(declare-fun b!497888 () Bool)

(assert (=> b!497888 (= e!291827 e!291826)))

(declare-fun c!59155 () Bool)

(assert (=> b!497888 (= c!59155 (or (= lt!225454 lt!225307) (= (bvadd lt!225454 lt!225454) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497889 () Bool)

(assert (=> b!497889 (= e!291825 e!291823)))

(declare-fun res!300129 () Bool)

(assert (=> b!497889 (= res!300129 (and (is-Intermediate!3938 lt!225455) (not (undefined!4750 lt!225455)) (bvslt (x!46982 lt!225455) #b01111111111111111111111111111110) (bvsge (x!46982 lt!225455) #b00000000000000000000000000000000) (bvsge (x!46982 lt!225455) #b00000000000000000000000000000000)))))

(assert (=> b!497889 (=> (not res!300129) (not e!291823))))

(declare-fun b!497890 () Bool)

(assert (=> b!497890 (= e!291826 (Intermediate!3938 false lt!225304 #b00000000000000000000000000000000))))

(assert (= (and d!78423 c!59156) b!497882))

(assert (= (and d!78423 (not c!59156)) b!497888))

(assert (= (and b!497888 c!59155) b!497890))

(assert (= (and b!497888 (not c!59155)) b!497884))

(assert (= (and d!78423 c!59154) b!497885))

(assert (= (and d!78423 (not c!59154)) b!497889))

(assert (= (and b!497889 res!300129) b!497887))

(assert (= (and b!497887 (not res!300128)) b!497886))

(assert (= (and b!497886 (not res!300127)) b!497883))

(declare-fun m!479229 () Bool)

(assert (=> d!78423 m!479229))

(assert (=> d!78423 m!478999))

(declare-fun m!479231 () Bool)

(assert (=> b!497887 m!479231))

(assert (=> b!497883 m!479231))

(assert (=> b!497886 m!479231))

(declare-fun m!479233 () Bool)

(assert (=> b!497884 m!479233))

(assert (=> b!497884 m!479233))

(declare-fun m!479235 () Bool)

(assert (=> b!497884 m!479235))

(assert (=> b!497617 d!78423))

(declare-fun d!78425 () Bool)

(assert (=> d!78425 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!225465 () Unit!14828)

(declare-fun choose!38 (array!32176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14828)

(assert (=> d!78425 (= lt!225465 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78425 (validMask!0 mask!3524)))

(assert (=> d!78425 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!225465)))

(declare-fun bs!15854 () Bool)

(assert (= bs!15854 d!78425))

(assert (=> bs!15854 m!479017))

(declare-fun m!479253 () Bool)

(assert (=> bs!15854 m!479253))

(assert (=> bs!15854 m!478999))

(assert (=> b!497617 d!78425))

(declare-fun b!497969 () Bool)

(declare-fun e!291874 () SeekEntryResult!3938)

(assert (=> b!497969 (= e!291874 Undefined!3938)))

(declare-fun lt!225495 () SeekEntryResult!3938)

(declare-fun e!291872 () SeekEntryResult!3938)

(declare-fun b!497970 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32176 (_ BitVec 32)) SeekEntryResult!3938)

(assert (=> b!497970 (= e!291872 (seekKeyOrZeroReturnVacant!0 (x!46982 lt!225495) (index!17933 lt!225495) (index!17933 lt!225495) k!2280 a!3235 mask!3524))))

(declare-fun b!497971 () Bool)

(declare-fun e!291873 () SeekEntryResult!3938)

(assert (=> b!497971 (= e!291873 (Found!3938 (index!17933 lt!225495)))))

(declare-fun d!78431 () Bool)

(declare-fun lt!225496 () SeekEntryResult!3938)

(assert (=> d!78431 (and (or (is-Undefined!3938 lt!225496) (not (is-Found!3938 lt!225496)) (and (bvsge (index!17932 lt!225496) #b00000000000000000000000000000000) (bvslt (index!17932 lt!225496) (size!15835 a!3235)))) (or (is-Undefined!3938 lt!225496) (is-Found!3938 lt!225496) (not (is-MissingZero!3938 lt!225496)) (and (bvsge (index!17931 lt!225496) #b00000000000000000000000000000000) (bvslt (index!17931 lt!225496) (size!15835 a!3235)))) (or (is-Undefined!3938 lt!225496) (is-Found!3938 lt!225496) (is-MissingZero!3938 lt!225496) (not (is-MissingVacant!3938 lt!225496)) (and (bvsge (index!17934 lt!225496) #b00000000000000000000000000000000) (bvslt (index!17934 lt!225496) (size!15835 a!3235)))) (or (is-Undefined!3938 lt!225496) (ite (is-Found!3938 lt!225496) (= (select (arr!15471 a!3235) (index!17932 lt!225496)) k!2280) (ite (is-MissingZero!3938 lt!225496) (= (select (arr!15471 a!3235) (index!17931 lt!225496)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3938 lt!225496) (= (select (arr!15471 a!3235) (index!17934 lt!225496)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78431 (= lt!225496 e!291874)))

(declare-fun c!59188 () Bool)

(assert (=> d!78431 (= c!59188 (and (is-Intermediate!3938 lt!225495) (undefined!4750 lt!225495)))))

(assert (=> d!78431 (= lt!225495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!78431 (validMask!0 mask!3524)))

(assert (=> d!78431 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!225496)))

(declare-fun b!497972 () Bool)

(assert (=> b!497972 (= e!291874 e!291873)))

(declare-fun lt!225497 () (_ BitVec 64))

(assert (=> b!497972 (= lt!225497 (select (arr!15471 a!3235) (index!17933 lt!225495)))))

(declare-fun c!59187 () Bool)

(assert (=> b!497972 (= c!59187 (= lt!225497 k!2280))))

(declare-fun b!497973 () Bool)

(declare-fun c!59186 () Bool)

(assert (=> b!497973 (= c!59186 (= lt!225497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!497973 (= e!291873 e!291872)))

(declare-fun b!497974 () Bool)

(assert (=> b!497974 (= e!291872 (MissingZero!3938 (index!17933 lt!225495)))))

(assert (= (and d!78431 c!59188) b!497969))

(assert (= (and d!78431 (not c!59188)) b!497972))

(assert (= (and b!497972 c!59187) b!497971))

(assert (= (and b!497972 (not c!59187)) b!497973))

(assert (= (and b!497973 c!59186) b!497974))

