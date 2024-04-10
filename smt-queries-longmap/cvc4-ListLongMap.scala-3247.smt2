; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45292 () Bool)

(assert start!45292)

(declare-fun b!497692 () Bool)

(declare-fun res!300055 () Bool)

(declare-fun e!291708 () Bool)

(assert (=> b!497692 (=> (not res!300055) (not e!291708))))

(declare-datatypes ((array!32180 0))(
  ( (array!32181 (arr!15473 (Array (_ BitVec 32) (_ BitVec 64))) (size!15837 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32180)

(declare-datatypes ((List!9631 0))(
  ( (Nil!9628) (Cons!9627 (h!10498 (_ BitVec 64)) (t!15859 List!9631)) )
))
(declare-fun arrayNoDuplicates!0 (array!32180 (_ BitVec 32) List!9631) Bool)

(assert (=> b!497692 (= res!300055 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9628))))

(declare-fun b!497693 () Bool)

(declare-fun e!291707 () Bool)

(assert (=> b!497693 (= e!291707 false)))

(declare-fun b!497694 () Bool)

(declare-datatypes ((Unit!14836 0))(
  ( (Unit!14837) )
))
(declare-fun e!291704 () Unit!14836)

(declare-fun Unit!14838 () Unit!14836)

(assert (=> b!497694 (= e!291704 Unit!14838)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3940 0))(
  ( (MissingZero!3940 (index!17939 (_ BitVec 32))) (Found!3940 (index!17940 (_ BitVec 32))) (Intermediate!3940 (undefined!4752 Bool) (index!17941 (_ BitVec 32)) (x!46984 (_ BitVec 32))) (Undefined!3940) (MissingVacant!3940 (index!17942 (_ BitVec 32))) )
))
(declare-fun lt!225361 () SeekEntryResult!3940)

(declare-fun lt!225358 () (_ BitVec 32))

(declare-fun lt!225362 () Unit!14836)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32180 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14836)

(assert (=> b!497694 (= lt!225362 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225358 #b00000000000000000000000000000000 (index!17941 lt!225361) (x!46984 lt!225361) mask!3524))))

(declare-fun lt!225360 () (_ BitVec 64))

(declare-fun lt!225363 () array!32180)

(declare-fun res!300046 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32180 (_ BitVec 32)) SeekEntryResult!3940)

(assert (=> b!497694 (= res!300046 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225358 lt!225360 lt!225363 mask!3524) (Intermediate!3940 false (index!17941 lt!225361) (x!46984 lt!225361))))))

(assert (=> b!497694 (=> (not res!300046) (not e!291707))))

(assert (=> b!497694 e!291707))

(declare-fun b!497695 () Bool)

(declare-fun e!291705 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32180 (_ BitVec 32)) SeekEntryResult!3940)

(assert (=> b!497695 (= e!291705 (= (seekEntryOrOpen!0 (select (arr!15473 a!3235) j!176) a!3235 mask!3524) (Found!3940 j!176)))))

(declare-fun b!497696 () Bool)

(declare-fun e!291702 () Bool)

(assert (=> b!497696 (= e!291702 e!291708)))

(declare-fun res!300049 () Bool)

(assert (=> b!497696 (=> (not res!300049) (not e!291708))))

(declare-fun lt!225357 () SeekEntryResult!3940)

(assert (=> b!497696 (= res!300049 (or (= lt!225357 (MissingZero!3940 i!1204)) (= lt!225357 (MissingVacant!3940 i!1204))))))

(assert (=> b!497696 (= lt!225357 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!497697 () Bool)

(declare-fun e!291703 () Bool)

(assert (=> b!497697 (= e!291703 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> b!497697 (and (or (= (select (arr!15473 a!3235) (index!17941 lt!225361)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15473 a!3235) (index!17941 lt!225361)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15473 a!3235) (index!17941 lt!225361)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15473 a!3235) (index!17941 lt!225361)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225359 () Unit!14836)

(assert (=> b!497697 (= lt!225359 e!291704)))

(declare-fun c!59099 () Bool)

(assert (=> b!497697 (= c!59099 (= (select (arr!15473 a!3235) (index!17941 lt!225361)) (select (arr!15473 a!3235) j!176)))))

(assert (=> b!497697 (and (bvslt (x!46984 lt!225361) #b01111111111111111111111111111110) (or (= (select (arr!15473 a!3235) (index!17941 lt!225361)) (select (arr!15473 a!3235) j!176)) (= (select (arr!15473 a!3235) (index!17941 lt!225361)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15473 a!3235) (index!17941 lt!225361)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497698 () Bool)

(declare-fun res!300053 () Bool)

(assert (=> b!497698 (=> (not res!300053) (not e!291702))))

(assert (=> b!497698 (= res!300053 (and (= (size!15837 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15837 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15837 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497699 () Bool)

(declare-fun res!300051 () Bool)

(assert (=> b!497699 (=> (not res!300051) (not e!291702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497699 (= res!300051 (validKeyInArray!0 (select (arr!15473 a!3235) j!176)))))

(declare-fun b!497700 () Bool)

(assert (=> b!497700 (= e!291708 (not e!291703))))

(declare-fun res!300052 () Bool)

(assert (=> b!497700 (=> res!300052 e!291703)))

(declare-fun lt!225364 () (_ BitVec 32))

(assert (=> b!497700 (= res!300052 (= lt!225361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225364 lt!225360 lt!225363 mask!3524)))))

(assert (=> b!497700 (= lt!225361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225358 (select (arr!15473 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497700 (= lt!225364 (toIndex!0 lt!225360 mask!3524))))

(assert (=> b!497700 (= lt!225360 (select (store (arr!15473 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!497700 (= lt!225358 (toIndex!0 (select (arr!15473 a!3235) j!176) mask!3524))))

(assert (=> b!497700 (= lt!225363 (array!32181 (store (arr!15473 a!3235) i!1204 k!2280) (size!15837 a!3235)))))

(assert (=> b!497700 e!291705))

(declare-fun res!300056 () Bool)

(assert (=> b!497700 (=> (not res!300056) (not e!291705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32180 (_ BitVec 32)) Bool)

(assert (=> b!497700 (= res!300056 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225356 () Unit!14836)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14836)

(assert (=> b!497700 (= lt!225356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497702 () Bool)

(declare-fun res!300048 () Bool)

(assert (=> b!497702 (=> res!300048 e!291703)))

(assert (=> b!497702 (= res!300048 (or (undefined!4752 lt!225361) (not (is-Intermediate!3940 lt!225361))))))

(declare-fun b!497703 () Bool)

(declare-fun res!300047 () Bool)

(assert (=> b!497703 (=> (not res!300047) (not e!291702))))

(assert (=> b!497703 (= res!300047 (validKeyInArray!0 k!2280))))

(declare-fun b!497704 () Bool)

(declare-fun Unit!14839 () Unit!14836)

(assert (=> b!497704 (= e!291704 Unit!14839)))

(declare-fun b!497705 () Bool)

(declare-fun res!300050 () Bool)

(assert (=> b!497705 (=> (not res!300050) (not e!291708))))

(assert (=> b!497705 (= res!300050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497701 () Bool)

(declare-fun res!300045 () Bool)

(assert (=> b!497701 (=> (not res!300045) (not e!291702))))

(declare-fun arrayContainsKey!0 (array!32180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497701 (= res!300045 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!300054 () Bool)

(assert (=> start!45292 (=> (not res!300054) (not e!291702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45292 (= res!300054 (validMask!0 mask!3524))))

(assert (=> start!45292 e!291702))

(assert (=> start!45292 true))

(declare-fun array_inv!11269 (array!32180) Bool)

(assert (=> start!45292 (array_inv!11269 a!3235)))

(assert (= (and start!45292 res!300054) b!497698))

(assert (= (and b!497698 res!300053) b!497699))

(assert (= (and b!497699 res!300051) b!497703))

(assert (= (and b!497703 res!300047) b!497701))

(assert (= (and b!497701 res!300045) b!497696))

(assert (= (and b!497696 res!300049) b!497705))

(assert (= (and b!497705 res!300050) b!497692))

(assert (= (and b!497692 res!300055) b!497700))

(assert (= (and b!497700 res!300056) b!497695))

(assert (= (and b!497700 (not res!300052)) b!497702))

(assert (= (and b!497702 (not res!300048)) b!497697))

(assert (= (and b!497697 c!59099) b!497694))

(assert (= (and b!497697 (not c!59099)) b!497704))

(assert (= (and b!497694 res!300046) b!497693))

(declare-fun m!479079 () Bool)

(assert (=> start!45292 m!479079))

(declare-fun m!479081 () Bool)

(assert (=> start!45292 m!479081))

(declare-fun m!479083 () Bool)

(assert (=> b!497696 m!479083))

(declare-fun m!479085 () Bool)

(assert (=> b!497697 m!479085))

(declare-fun m!479087 () Bool)

(assert (=> b!497697 m!479087))

(declare-fun m!479089 () Bool)

(assert (=> b!497694 m!479089))

(declare-fun m!479091 () Bool)

(assert (=> b!497694 m!479091))

(declare-fun m!479093 () Bool)

(assert (=> b!497692 m!479093))

(assert (=> b!497695 m!479087))

(assert (=> b!497695 m!479087))

(declare-fun m!479095 () Bool)

(assert (=> b!497695 m!479095))

(assert (=> b!497699 m!479087))

(assert (=> b!497699 m!479087))

(declare-fun m!479097 () Bool)

(assert (=> b!497699 m!479097))

(declare-fun m!479099 () Bool)

(assert (=> b!497703 m!479099))

(declare-fun m!479101 () Bool)

(assert (=> b!497701 m!479101))

(declare-fun m!479103 () Bool)

(assert (=> b!497705 m!479103))

(declare-fun m!479105 () Bool)

(assert (=> b!497700 m!479105))

(declare-fun m!479107 () Bool)

(assert (=> b!497700 m!479107))

(declare-fun m!479109 () Bool)

(assert (=> b!497700 m!479109))

(declare-fun m!479111 () Bool)

(assert (=> b!497700 m!479111))

(declare-fun m!479113 () Bool)

(assert (=> b!497700 m!479113))

(assert (=> b!497700 m!479087))

(declare-fun m!479115 () Bool)

(assert (=> b!497700 m!479115))

(assert (=> b!497700 m!479087))

(declare-fun m!479117 () Bool)

(assert (=> b!497700 m!479117))

(assert (=> b!497700 m!479087))

(declare-fun m!479119 () Bool)

(assert (=> b!497700 m!479119))

(push 1)

(assert (not b!497703))

(assert (not b!497694))

(assert (not start!45292))

(assert (not b!497700))

(assert (not b!497692))

(assert (not b!497705))

(assert (not b!497695))

(assert (not b!497701))

(assert (not b!497699))

(assert (not b!497696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78383 () Bool)

(declare-fun res!300070 () Bool)

(declare-fun e!291731 () Bool)

(assert (=> d!78383 (=> res!300070 e!291731)))

(assert (=> d!78383 (= res!300070 (= (select (arr!15473 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!78383 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!291731)))

(declare-fun b!497737 () Bool)

(declare-fun e!291732 () Bool)

(assert (=> b!497737 (= e!291731 e!291732)))

(declare-fun res!300071 () Bool)

(assert (=> b!497737 (=> (not res!300071) (not e!291732))))

(assert (=> b!497737 (= res!300071 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15837 a!3235)))))

(declare-fun b!497738 () Bool)

(assert (=> b!497738 (= e!291732 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78383 (not res!300070)) b!497737))

(assert (= (and b!497737 res!300071) b!497738))

(declare-fun m!479143 () Bool)

(assert (=> d!78383 m!479143))

(declare-fun m!479145 () Bool)

(assert (=> b!497738 m!479145))

(assert (=> b!497701 d!78383))

(declare-fun b!497788 () Bool)

(declare-fun e!291761 () SeekEntryResult!3940)

(assert (=> b!497788 (= e!291761 Undefined!3940)))

(declare-fun b!497789 () Bool)

(declare-fun e!291760 () SeekEntryResult!3940)

(declare-fun lt!225397 () SeekEntryResult!3940)

(assert (=> b!497789 (= e!291760 (Found!3940 (index!17941 lt!225397)))))

(declare-fun b!497790 () Bool)

(declare-fun c!59128 () Bool)

(declare-fun lt!225399 () (_ BitVec 64))

(assert (=> b!497790 (= c!59128 (= lt!225399 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291759 () SeekEntryResult!3940)

(assert (=> b!497790 (= e!291760 e!291759)))

(declare-fun d!78385 () Bool)

(declare-fun lt!225398 () SeekEntryResult!3940)

(assert (=> d!78385 (and (or (is-Undefined!3940 lt!225398) (not (is-Found!3940 lt!225398)) (and (bvsge (index!17940 lt!225398) #b00000000000000000000000000000000) (bvslt (index!17940 lt!225398) (size!15837 a!3235)))) (or (is-Undefined!3940 lt!225398) (is-Found!3940 lt!225398) (not (is-MissingZero!3940 lt!225398)) (and (bvsge (index!17939 lt!225398) #b00000000000000000000000000000000) (bvslt (index!17939 lt!225398) (size!15837 a!3235)))) (or (is-Undefined!3940 lt!225398) (is-Found!3940 lt!225398) (is-MissingZero!3940 lt!225398) (not (is-MissingVacant!3940 lt!225398)) (and (bvsge (index!17942 lt!225398) #b00000000000000000000000000000000) (bvslt (index!17942 lt!225398) (size!15837 a!3235)))) (or (is-Undefined!3940 lt!225398) (ite (is-Found!3940 lt!225398) (= (select (arr!15473 a!3235) (index!17940 lt!225398)) k!2280) (ite (is-MissingZero!3940 lt!225398) (= (select (arr!15473 a!3235) (index!17939 lt!225398)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3940 lt!225398) (= (select (arr!15473 a!3235) (index!17942 lt!225398)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78385 (= lt!225398 e!291761)))

(declare-fun c!59127 () Bool)

(assert (=> d!78385 (= c!59127 (and (is-Intermediate!3940 lt!225397) (undefined!4752 lt!225397)))))

(assert (=> d!78385 (= lt!225397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!78385 (validMask!0 mask!3524)))

(assert (=> d!78385 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!225398)))

(declare-fun b!497787 () Bool)

(assert (=> b!497787 (= e!291761 e!291760)))

(assert (=> b!497787 (= lt!225399 (select (arr!15473 a!3235) (index!17941 lt!225397)))))

(declare-fun c!59129 () Bool)

(assert (=> b!497787 (= c!59129 (= lt!225399 k!2280))))

(declare-fun b!497791 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32180 (_ BitVec 32)) SeekEntryResult!3940)

(assert (=> b!497791 (= e!291759 (seekKeyOrZeroReturnVacant!0 (x!46984 lt!225397) (index!17941 lt!225397) (index!17941 lt!225397) k!2280 a!3235 mask!3524))))

(declare-fun b!497792 () Bool)

(assert (=> b!497792 (= e!291759 (MissingZero!3940 (index!17941 lt!225397)))))

(assert (= (and d!78385 c!59127) b!497788))

(assert (= (and d!78385 (not c!59127)) b!497787))

(assert (= (and b!497787 c!59129) b!497789))

(assert (= (and b!497787 (not c!59129)) b!497790))

(assert (= (and b!497790 c!59128) b!497792))

(assert (= (and b!497790 (not c!59128)) b!497791))

(declare-fun m!479159 () Bool)

(assert (=> d!78385 m!479159))

(declare-fun m!479163 () Bool)

(assert (=> d!78385 m!479163))

(declare-fun m!479165 () Bool)

(assert (=> d!78385 m!479165))

(declare-fun m!479167 () Bool)

(assert (=> d!78385 m!479167))

(assert (=> d!78385 m!479163))

(assert (=> d!78385 m!479079))

(declare-fun m!479169 () Bool)

(assert (=> d!78385 m!479169))

(declare-fun m!479171 () Bool)

(assert (=> b!497787 m!479171))

(declare-fun m!479173 () Bool)

(assert (=> b!497791 m!479173))

(assert (=> b!497696 d!78385))

(declare-fun b!497827 () Bool)

(declare-fun e!291784 () Bool)

(declare-fun e!291785 () Bool)

(assert (=> b!497827 (= e!291784 e!291785)))

(declare-fun lt!225420 () (_ BitVec 64))

(assert (=> b!497827 (= lt!225420 (select (arr!15473 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!225418 () Unit!14836)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32180 (_ BitVec 64) (_ BitVec 32)) Unit!14836)

(assert (=> b!497827 (= lt!225418 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!225420 #b00000000000000000000000000000000))))

(assert (=> b!497827 (arrayContainsKey!0 a!3235 lt!225420 #b00000000000000000000000000000000)))

(declare-fun lt!225419 () Unit!14836)

(assert (=> b!497827 (= lt!225419 lt!225418)))

(declare-fun res!300099 () Bool)

(assert (=> b!497827 (= res!300099 (= (seekEntryOrOpen!0 (select (arr!15473 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3940 #b00000000000000000000000000000000)))))

(assert (=> b!497827 (=> (not res!300099) (not e!291785))))

(declare-fun bm!31432 () Bool)

(declare-fun call!31435 () Bool)

(assert (=> bm!31432 (= call!31435 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!78395 () Bool)

(declare-fun res!300100 () Bool)

(declare-fun e!291786 () Bool)

(assert (=> d!78395 (=> res!300100 e!291786)))

(assert (=> d!78395 (= res!300100 (bvsge #b00000000000000000000000000000000 (size!15837 a!3235)))))

(assert (=> d!78395 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!291786)))

(declare-fun b!497828 () Bool)

(assert (=> b!497828 (= e!291786 e!291784)))

(declare-fun c!59140 () Bool)

(assert (=> b!497828 (= c!59140 (validKeyInArray!0 (select (arr!15473 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!497829 () Bool)

(assert (=> b!497829 (= e!291784 call!31435)))

(declare-fun b!497830 () Bool)

(assert (=> b!497830 (= e!291785 call!31435)))

(assert (= (and d!78395 (not res!300100)) b!497828))

(assert (= (and b!497828 c!59140) b!497827))

(assert (= (and b!497828 (not c!59140)) b!497829))

(assert (= (and b!497827 res!300099) b!497830))

(assert (= (or b!497830 b!497829) bm!31432))

(assert (=> b!497827 m!479143))

(declare-fun m!479175 () Bool)

(assert (=> b!497827 m!479175))

(declare-fun m!479177 () Bool)

(assert (=> b!497827 m!479177))

(assert (=> b!497827 m!479143))

(declare-fun m!479179 () Bool)

(assert (=> b!497827 m!479179))

(declare-fun m!479183 () Bool)

(assert (=> bm!31432 m!479183))

(assert (=> b!497828 m!479143))

(assert (=> b!497828 m!479143))

(declare-fun m!479187 () Bool)

(assert (=> b!497828 m!479187))

(assert (=> b!497705 d!78395))

(declare-fun d!78399 () Bool)

(declare-fun e!291805 () Bool)

(assert (=> d!78399 e!291805))

(declare-fun res!300114 () Bool)

(assert (=> d!78399 (=> (not res!300114) (not e!291805))))

(assert (=> d!78399 (= res!300114 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15837 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15837 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15837 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15837 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15837 a!3235))))))

(declare-fun lt!225442 () Unit!14836)

(declare-fun choose!47 (array!32180 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14836)

(assert (=> d!78399 (= lt!225442 (choose!47 a!3235 i!1204 k!2280 j!176 lt!225358 #b00000000000000000000000000000000 (index!17941 lt!225361) (x!46984 lt!225361) mask!3524))))

(assert (=> d!78399 (validMask!0 mask!3524)))

(assert (=> d!78399 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225358 #b00000000000000000000000000000000 (index!17941 lt!225361) (x!46984 lt!225361) mask!3524) lt!225442)))

(declare-fun b!497859 () Bool)

(assert (=> b!497859 (= e!291805 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225358 (select (store (arr!15473 a!3235) i!1204 k!2280) j!176) (array!32181 (store (arr!15473 a!3235) i!1204 k!2280) (size!15837 a!3235)) mask!3524) (Intermediate!3940 false (index!17941 lt!225361) (x!46984 lt!225361))))))

(assert (= (and d!78399 res!300114) b!497859))

(declare-fun m!479219 () Bool)

(assert (=> d!78399 m!479219))

(assert (=> d!78399 m!479079))

(assert (=> b!497859 m!479105))

(assert (=> b!497859 m!479109))

(assert (=> b!497859 m!479109))

(declare-fun m!479221 () Bool)

(assert (=> b!497859 m!479221))

(assert (=> b!497694 d!78399))

(declare-fun b!497920 () Bool)

(declare-fun lt!225466 () SeekEntryResult!3940)

(assert (=> b!497920 (and (bvsge (index!17941 lt!225466) #b00000000000000000000000000000000) (bvslt (index!17941 lt!225466) (size!15837 lt!225363)))))

(declare-fun res!300139 () Bool)

(assert (=> b!497920 (= res!300139 (= (select (arr!15473 lt!225363) (index!17941 lt!225466)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291846 () Bool)

(assert (=> b!497920 (=> res!300139 e!291846)))

(declare-fun b!497921 () Bool)

(declare-fun e!291845 () Bool)

(declare-fun e!291848 () Bool)

(assert (=> b!497921 (= e!291845 e!291848)))

(declare-fun res!300140 () Bool)

(assert (=> b!497921 (= res!300140 (and (is-Intermediate!3940 lt!225466) (not (undefined!4752 lt!225466)) (bvslt (x!46984 lt!225466) #b01111111111111111111111111111110) (bvsge (x!46984 lt!225466) #b00000000000000000000000000000000) (bvsge (x!46984 lt!225466) #b00000000000000000000000000000000)))))

(assert (=> b!497921 (=> (not res!300140) (not e!291848))))

(declare-fun b!497922 () Bool)

(declare-fun e!291849 () SeekEntryResult!3940)

(assert (=> b!497922 (= e!291849 (Intermediate!3940 true lt!225358 #b00000000000000000000000000000000))))

(declare-fun b!497923 () Bool)

(assert (=> b!497923 (= e!291845 (bvsge (x!46984 lt!225466) #b01111111111111111111111111111110))))

(declare-fun b!497925 () Bool)

(assert (=> b!497925 (and (bvsge (index!17941 lt!225466) #b00000000000000000000000000000000) (bvslt (index!17941 lt!225466) (size!15837 lt!225363)))))

(declare-fun res!300141 () Bool)

(assert (=> b!497925 (= res!300141 (= (select (arr!15473 lt!225363) (index!17941 lt!225466)) lt!225360))))

(assert (=> b!497925 (=> res!300141 e!291846)))

(assert (=> b!497925 (= e!291848 e!291846)))

(declare-fun b!497926 () Bool)

(assert (=> b!497926 (and (bvsge (index!17941 lt!225466) #b00000000000000000000000000000000) (bvslt (index!17941 lt!225466) (size!15837 lt!225363)))))

(assert (=> b!497926 (= e!291846 (= (select (arr!15473 lt!225363) (index!17941 lt!225466)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291847 () SeekEntryResult!3940)

(declare-fun b!497924 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497924 (= e!291847 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!225358 #b00000000000000000000000000000000 mask!3524) lt!225360 lt!225363 mask!3524))))

(declare-fun d!78413 () Bool)

(assert (=> d!78413 e!291845))

(declare-fun c!59168 () Bool)

(assert (=> d!78413 (= c!59168 (and (is-Intermediate!3940 lt!225466) (undefined!4752 lt!225466)))))

(assert (=> d!78413 (= lt!225466 e!291849)))

(declare-fun c!59169 () Bool)

(assert (=> d!78413 (= c!59169 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!225467 () (_ BitVec 64))

(assert (=> d!78413 (= lt!225467 (select (arr!15473 lt!225363) lt!225358))))

(assert (=> d!78413 (validMask!0 mask!3524)))

(assert (=> d!78413 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225358 lt!225360 lt!225363 mask!3524) lt!225466)))

(declare-fun b!497927 () Bool)

(assert (=> b!497927 (= e!291849 e!291847)))

(declare-fun c!59167 () Bool)

(assert (=> b!497927 (= c!59167 (or (= lt!225467 lt!225360) (= (bvadd lt!225467 lt!225467) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497928 () Bool)

(assert (=> b!497928 (= e!291847 (Intermediate!3940 false lt!225358 #b00000000000000000000000000000000))))

(assert (= (and d!78413 c!59169) b!497922))

(assert (= (and d!78413 (not c!59169)) b!497927))

(assert (= (and b!497927 c!59167) b!497928))

(assert (= (and b!497927 (not c!59167)) b!497924))

(assert (= (and d!78413 c!59168) b!497923))

(assert (= (and d!78413 (not c!59168)) b!497921))

(assert (= (and b!497921 res!300140) b!497925))

(assert (= (and b!497925 (not res!300141)) b!497920))

(assert (= (and b!497920 (not res!300139)) b!497926))

(declare-fun m!479255 () Bool)

(assert (=> b!497920 m!479255))

(declare-fun m!479257 () Bool)

(assert (=> b!497924 m!479257))

(assert (=> b!497924 m!479257))

(declare-fun m!479259 () Bool)

(assert (=> b!497924 m!479259))

(declare-fun m!479261 () Bool)

(assert (=> d!78413 m!479261))

(assert (=> d!78413 m!479079))

(assert (=> b!497926 m!479255))

(assert (=> b!497925 m!479255))

(assert (=> b!497694 d!78413))

(declare-fun b!497930 () Bool)

(declare-fun e!291852 () SeekEntryResult!3940)

(assert (=> b!497930 (= e!291852 Undefined!3940)))

(declare-fun b!497931 () Bool)

(declare-fun e!291851 () SeekEntryResult!3940)

(declare-fun lt!225468 () SeekEntryResult!3940)

(assert (=> b!497931 (= e!291851 (Found!3940 (index!17941 lt!225468)))))

(declare-fun b!497932 () Bool)

(declare-fun c!59171 () Bool)

(declare-fun lt!225470 () (_ BitVec 64))

(assert (=> b!497932 (= c!59171 (= lt!225470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291850 () SeekEntryResult!3940)

(assert (=> b!497932 (= e!291851 e!291850)))

(declare-fun d!78433 () Bool)

(declare-fun lt!225469 () SeekEntryResult!3940)

(assert (=> d!78433 (and (or (is-Undefined!3940 lt!225469) (not (is-Found!3940 lt!225469)) (and (bvsge (index!17940 lt!225469) #b00000000000000000000000000000000) (bvslt (index!17940 lt!225469) (size!15837 a!3235)))) (or (is-Undefined!3940 lt!225469) (is-Found!3940 lt!225469) (not (is-MissingZero!3940 lt!225469)) (and (bvsge (index!17939 lt!225469) #b00000000000000000000000000000000) (bvslt (index!17939 lt!225469) (size!15837 a!3235)))) (or (is-Undefined!3940 lt!225469) (is-Found!3940 lt!225469) (is-MissingZero!3940 lt!225469) (not (is-MissingVacant!3940 lt!225469)) (and (bvsge (index!17942 lt!225469) #b00000000000000000000000000000000) (bvslt (index!17942 lt!225469) (size!15837 a!3235)))) (or (is-Undefined!3940 lt!225469) (ite (is-Found!3940 lt!225469) (= (select (arr!15473 a!3235) (index!17940 lt!225469)) (select (arr!15473 a!3235) j!176)) (ite (is-MissingZero!3940 lt!225469) (= (select (arr!15473 a!3235) (index!17939 lt!225469)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3940 lt!225469) (= (select (arr!15473 a!3235) (index!17942 lt!225469)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78433 (= lt!225469 e!291852)))

(declare-fun c!59170 () Bool)

(assert (=> d!78433 (= c!59170 (and (is-Intermediate!3940 lt!225468) (undefined!4752 lt!225468)))))

(assert (=> d!78433 (= lt!225468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15473 a!3235) j!176) mask!3524) (select (arr!15473 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78433 (validMask!0 mask!3524)))

(assert (=> d!78433 (= (seekEntryOrOpen!0 (select (arr!15473 a!3235) j!176) a!3235 mask!3524) lt!225469)))

(declare-fun b!497929 () Bool)

(assert (=> b!497929 (= e!291852 e!291851)))

(assert (=> b!497929 (= lt!225470 (select (arr!15473 a!3235) (index!17941 lt!225468)))))

(declare-fun c!59172 () Bool)

(assert (=> b!497929 (= c!59172 (= lt!225470 (select (arr!15473 a!3235) j!176)))))

(declare-fun b!497933 () Bool)

(assert (=> b!497933 (= e!291850 (seekKeyOrZeroReturnVacant!0 (x!46984 lt!225468) (index!17941 lt!225468) (index!17941 lt!225468) (select (arr!15473 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!497934 () Bool)

(assert (=> b!497934 (= e!291850 (MissingZero!3940 (index!17941 lt!225468)))))

(assert (= (and d!78433 c!59170) b!497930))

(assert (= (and d!78433 (not c!59170)) b!497929))

(assert (= (and b!497929 c!59172) b!497931))

(assert (= (and b!497929 (not c!59172)) b!497932))

(assert (= (and b!497932 c!59171) b!497934))

(assert (= (and b!497932 (not c!59171)) b!497933))

(declare-fun m!479263 () Bool)

(assert (=> d!78433 m!479263))

(assert (=> d!78433 m!479115))

(assert (=> d!78433 m!479087))

(declare-fun m!479265 () Bool)

(assert (=> d!78433 m!479265))

(declare-fun m!479267 () Bool)

(assert (=> d!78433 m!479267))

(assert (=> d!78433 m!479087))

(assert (=> d!78433 m!479115))

(assert (=> d!78433 m!479079))

(declare-fun m!479269 () Bool)

(assert (=> d!78433 m!479269))

(declare-fun m!479271 () Bool)

(assert (=> b!497929 m!479271))

(assert (=> b!497933 m!479087))

(declare-fun m!479273 () Bool)

(assert (=> b!497933 m!479273))

(assert (=> b!497695 d!78433))

(declare-fun d!78435 () Bool)

(declare-fun lt!225476 () (_ BitVec 32))

(declare-fun lt!225475 () (_ BitVec 32))

(assert (=> d!78435 (= lt!225476 (bvmul (bvxor lt!225475 (bvlshr lt!225475 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78435 (= lt!225475 ((_ extract 31 0) (bvand (bvxor (select (arr!15473 a!3235) j!176) (bvlshr (select (arr!15473 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78435 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!300142 (let ((h!10501 ((_ extract 31 0) (bvand (bvxor (select (arr!15473 a!3235) j!176) (bvlshr (select (arr!15473 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46992 (bvmul (bvxor h!10501 (bvlshr h!10501 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46992 (bvlshr x!46992 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!300142 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!300142 #b00000000000000000000000000000000))))))

(assert (=> d!78435 (= (toIndex!0 (select (arr!15473 a!3235) j!176) mask!3524) (bvand (bvxor lt!225476 (bvlshr lt!225476 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!497700 d!78435))

(declare-fun b!497935 () Bool)

(declare-fun e!291853 () Bool)

(declare-fun e!291854 () Bool)

(assert (=> b!497935 (= e!291853 e!291854)))

(declare-fun lt!225479 () (_ BitVec 64))

(assert (=> b!497935 (= lt!225479 (select (arr!15473 a!3235) j!176))))

(declare-fun lt!225477 () Unit!14836)

(assert (=> b!497935 (= lt!225477 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!225479 j!176))))

(assert (=> b!497935 (arrayContainsKey!0 a!3235 lt!225479 #b00000000000000000000000000000000)))

(declare-fun lt!225478 () Unit!14836)

(assert (=> b!497935 (= lt!225478 lt!225477)))

(declare-fun res!300143 () Bool)

(assert (=> b!497935 (= res!300143 (= (seekEntryOrOpen!0 (select (arr!15473 a!3235) j!176) a!3235 mask!3524) (Found!3940 j!176)))))

(assert (=> b!497935 (=> (not res!300143) (not e!291854))))

(declare-fun call!31444 () Bool)

(declare-fun bm!31441 () Bool)

(assert (=> bm!31441 (= call!31444 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!78437 () Bool)

(declare-fun res!300144 () Bool)

(declare-fun e!291855 () Bool)

(assert (=> d!78437 (=> res!300144 e!291855)))

(assert (=> d!78437 (= res!300144 (bvsge j!176 (size!15837 a!3235)))))

(assert (=> d!78437 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!291855)))

(declare-fun b!497936 () Bool)

(assert (=> b!497936 (= e!291855 e!291853)))

(declare-fun c!59173 () Bool)

(assert (=> b!497936 (= c!59173 (validKeyInArray!0 (select (arr!15473 a!3235) j!176)))))

(declare-fun b!497937 () Bool)

(assert (=> b!497937 (= e!291853 call!31444)))

(declare-fun b!497938 () Bool)

(assert (=> b!497938 (= e!291854 call!31444)))

(assert (= (and d!78437 (not res!300144)) b!497936))

(assert (= (and b!497936 c!59173) b!497935))

(assert (= (and b!497936 (not c!59173)) b!497937))

(assert (= (and b!497935 res!300143) b!497938))

(assert (= (or b!497938 b!497937) bm!31441))

(assert (=> b!497935 m!479087))

(declare-fun m!479275 () Bool)

(assert (=> b!497935 m!479275))

(declare-fun m!479277 () Bool)

(assert (=> b!497935 m!479277))

(assert (=> b!497935 m!479087))

(assert (=> b!497935 m!479095))

(declare-fun m!479279 () Bool)

(assert (=> bm!31441 m!479279))

(assert (=> b!497936 m!479087))

(assert (=> b!497936 m!479087))

(assert (=> b!497936 m!479097))

(assert (=> b!497700 d!78437))

(declare-fun b!497939 () Bool)

(declare-fun lt!225480 () SeekEntryResult!3940)

(assert (=> b!497939 (and (bvsge (index!17941 lt!225480) #b00000000000000000000000000000000) (bvslt (index!17941 lt!225480) (size!15837 a!3235)))))

(declare-fun res!300145 () Bool)

(assert (=> b!497939 (= res!300145 (= (select (arr!15473 a!3235) (index!17941 lt!225480)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291857 () Bool)

(assert (=> b!497939 (=> res!300145 e!291857)))

(declare-fun b!497940 () Bool)

(declare-fun e!291856 () Bool)

(declare-fun e!291859 () Bool)

(assert (=> b!497940 (= e!291856 e!291859)))

