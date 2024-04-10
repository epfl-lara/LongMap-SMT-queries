; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46416 () Bool)

(assert start!46416)

(declare-fun b!513523 () Bool)

(declare-fun res!313820 () Bool)

(declare-fun e!299861 () Bool)

(assert (=> b!513523 (=> (not res!313820) (not e!299861))))

(declare-datatypes ((array!32956 0))(
  ( (array!32957 (arr!15852 (Array (_ BitVec 32) (_ BitVec 64))) (size!16216 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32956)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32956 (_ BitVec 32)) Bool)

(assert (=> b!513523 (= res!313820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513524 () Bool)

(declare-fun e!299862 () Bool)

(assert (=> b!513524 (= e!299861 (not e!299862))))

(declare-fun res!313822 () Bool)

(assert (=> b!513524 (=> res!313822 e!299862)))

(declare-fun lt!235108 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4319 0))(
  ( (MissingZero!4319 (index!19464 (_ BitVec 32))) (Found!4319 (index!19465 (_ BitVec 32))) (Intermediate!4319 (undefined!5131 Bool) (index!19466 (_ BitVec 32)) (x!48418 (_ BitVec 32))) (Undefined!4319) (MissingVacant!4319 (index!19467 (_ BitVec 32))) )
))
(declare-fun lt!235106 () SeekEntryResult!4319)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32956 (_ BitVec 32)) SeekEntryResult!4319)

(assert (=> b!513524 (= res!313822 (= lt!235106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235108 (select (store (arr!15852 a!3235) i!1204 k!2280) j!176) (array!32957 (store (arr!15852 a!3235) i!1204 k!2280) (size!16216 a!3235)) mask!3524)))))

(declare-fun lt!235105 () (_ BitVec 32))

(assert (=> b!513524 (= lt!235106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235105 (select (arr!15852 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513524 (= lt!235108 (toIndex!0 (select (store (arr!15852 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!513524 (= lt!235105 (toIndex!0 (select (arr!15852 a!3235) j!176) mask!3524))))

(declare-fun e!299863 () Bool)

(assert (=> b!513524 e!299863))

(declare-fun res!313824 () Bool)

(assert (=> b!513524 (=> (not res!313824) (not e!299863))))

(assert (=> b!513524 (= res!313824 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15896 0))(
  ( (Unit!15897) )
))
(declare-fun lt!235107 () Unit!15896)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15896)

(assert (=> b!513524 (= lt!235107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513525 () Bool)

(declare-fun res!313821 () Bool)

(declare-fun e!299864 () Bool)

(assert (=> b!513525 (=> (not res!313821) (not e!299864))))

(assert (=> b!513525 (= res!313821 (and (= (size!16216 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16216 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16216 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!313825 () Bool)

(assert (=> start!46416 (=> (not res!313825) (not e!299864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46416 (= res!313825 (validMask!0 mask!3524))))

(assert (=> start!46416 e!299864))

(assert (=> start!46416 true))

(declare-fun array_inv!11648 (array!32956) Bool)

(assert (=> start!46416 (array_inv!11648 a!3235)))

(declare-fun b!513526 () Bool)

(declare-fun res!313827 () Bool)

(assert (=> b!513526 (=> res!313827 e!299862)))

(assert (=> b!513526 (= res!313827 (or (undefined!5131 lt!235106) (not (is-Intermediate!4319 lt!235106))))))

(declare-fun b!513527 () Bool)

(declare-fun res!313826 () Bool)

(assert (=> b!513527 (=> (not res!313826) (not e!299861))))

(declare-datatypes ((List!10010 0))(
  ( (Nil!10007) (Cons!10006 (h!10892 (_ BitVec 64)) (t!16238 List!10010)) )
))
(declare-fun arrayNoDuplicates!0 (array!32956 (_ BitVec 32) List!10010) Bool)

(assert (=> b!513527 (= res!313826 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10007))))

(declare-fun b!513528 () Bool)

(declare-fun res!313828 () Bool)

(assert (=> b!513528 (=> (not res!313828) (not e!299864))))

(declare-fun arrayContainsKey!0 (array!32956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513528 (= res!313828 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!513529 () Bool)

(declare-fun res!313823 () Bool)

(assert (=> b!513529 (=> (not res!313823) (not e!299864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513529 (= res!313823 (validKeyInArray!0 (select (arr!15852 a!3235) j!176)))))

(declare-fun b!513530 () Bool)

(assert (=> b!513530 (= e!299864 e!299861)))

(declare-fun res!313829 () Bool)

(assert (=> b!513530 (=> (not res!313829) (not e!299861))))

(declare-fun lt!235104 () SeekEntryResult!4319)

(assert (=> b!513530 (= res!313829 (or (= lt!235104 (MissingZero!4319 i!1204)) (= lt!235104 (MissingVacant!4319 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32956 (_ BitVec 32)) SeekEntryResult!4319)

(assert (=> b!513530 (= lt!235104 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!513531 () Bool)

(assert (=> b!513531 (= e!299862 (or (= (select (arr!15852 a!3235) (index!19466 lt!235106)) (select (arr!15852 a!3235) j!176)) (and (bvsge (index!19466 lt!235106) #b00000000000000000000000000000000) (bvslt (index!19466 lt!235106) (size!16216 a!3235)))))))

(assert (=> b!513531 (bvslt (x!48418 lt!235106) #b01111111111111111111111111111110)))

(declare-fun b!513532 () Bool)

(declare-fun res!313819 () Bool)

(assert (=> b!513532 (=> (not res!313819) (not e!299864))))

(assert (=> b!513532 (= res!313819 (validKeyInArray!0 k!2280))))

(declare-fun b!513533 () Bool)

(assert (=> b!513533 (= e!299863 (= (seekEntryOrOpen!0 (select (arr!15852 a!3235) j!176) a!3235 mask!3524) (Found!4319 j!176)))))

(assert (= (and start!46416 res!313825) b!513525))

(assert (= (and b!513525 res!313821) b!513529))

(assert (= (and b!513529 res!313823) b!513532))

(assert (= (and b!513532 res!313819) b!513528))

(assert (= (and b!513528 res!313828) b!513530))

(assert (= (and b!513530 res!313829) b!513523))

(assert (= (and b!513523 res!313820) b!513527))

(assert (= (and b!513527 res!313826) b!513524))

(assert (= (and b!513524 res!313824) b!513533))

(assert (= (and b!513524 (not res!313822)) b!513526))

(assert (= (and b!513526 (not res!313827)) b!513531))

(declare-fun m!495093 () Bool)

(assert (=> b!513523 m!495093))

(declare-fun m!495095 () Bool)

(assert (=> b!513530 m!495095))

(declare-fun m!495097 () Bool)

(assert (=> b!513533 m!495097))

(assert (=> b!513533 m!495097))

(declare-fun m!495099 () Bool)

(assert (=> b!513533 m!495099))

(declare-fun m!495101 () Bool)

(assert (=> b!513532 m!495101))

(assert (=> b!513529 m!495097))

(assert (=> b!513529 m!495097))

(declare-fun m!495103 () Bool)

(assert (=> b!513529 m!495103))

(declare-fun m!495105 () Bool)

(assert (=> b!513527 m!495105))

(declare-fun m!495107 () Bool)

(assert (=> b!513524 m!495107))

(declare-fun m!495109 () Bool)

(assert (=> b!513524 m!495109))

(declare-fun m!495111 () Bool)

(assert (=> b!513524 m!495111))

(assert (=> b!513524 m!495097))

(declare-fun m!495113 () Bool)

(assert (=> b!513524 m!495113))

(assert (=> b!513524 m!495097))

(declare-fun m!495115 () Bool)

(assert (=> b!513524 m!495115))

(assert (=> b!513524 m!495111))

(declare-fun m!495117 () Bool)

(assert (=> b!513524 m!495117))

(assert (=> b!513524 m!495111))

(declare-fun m!495119 () Bool)

(assert (=> b!513524 m!495119))

(assert (=> b!513524 m!495097))

(declare-fun m!495121 () Bool)

(assert (=> b!513524 m!495121))

(declare-fun m!495123 () Bool)

(assert (=> b!513531 m!495123))

(assert (=> b!513531 m!495097))

(declare-fun m!495125 () Bool)

(assert (=> start!46416 m!495125))

(declare-fun m!495127 () Bool)

(assert (=> start!46416 m!495127))

(declare-fun m!495129 () Bool)

(assert (=> b!513528 m!495129))

(push 1)

(assert (not b!513532))

(assert (not b!513533))

(assert (not b!513528))

(assert (not b!513529))

(assert (not start!46416))

(assert (not b!513530))

(assert (not b!513523))

(assert (not b!513524))

(assert (not b!513527))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79185 () Bool)

(assert (=> d!79185 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513532 d!79185))

(declare-fun b!513657 () Bool)

(declare-fun e!299936 () Bool)

(declare-fun e!299934 () Bool)

(assert (=> b!513657 (= e!299936 e!299934)))

(declare-fun c!60154 () Bool)

(assert (=> b!513657 (= c!60154 (validKeyInArray!0 (select (arr!15852 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79187 () Bool)

(declare-fun res!313917 () Bool)

(declare-fun e!299935 () Bool)

(assert (=> d!79187 (=> res!313917 e!299935)))

(assert (=> d!79187 (= res!313917 (bvsge #b00000000000000000000000000000000 (size!16216 a!3235)))))

(assert (=> d!79187 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10007) e!299935)))

(declare-fun b!513658 () Bool)

(declare-fun call!31564 () Bool)

(assert (=> b!513658 (= e!299934 call!31564)))

(declare-fun b!513659 () Bool)

(declare-fun e!299937 () Bool)

(declare-fun contains!2732 (List!10010 (_ BitVec 64)) Bool)

(assert (=> b!513659 (= e!299937 (contains!2732 Nil!10007 (select (arr!15852 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31561 () Bool)

(assert (=> bm!31561 (= call!31564 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60154 (Cons!10006 (select (arr!15852 a!3235) #b00000000000000000000000000000000) Nil!10007) Nil!10007)))))

(declare-fun b!513660 () Bool)

(assert (=> b!513660 (= e!299935 e!299936)))

(declare-fun res!313916 () Bool)

(assert (=> b!513660 (=> (not res!313916) (not e!299936))))

(assert (=> b!513660 (= res!313916 (not e!299937))))

(declare-fun res!313915 () Bool)

(assert (=> b!513660 (=> (not res!313915) (not e!299937))))

(assert (=> b!513660 (= res!313915 (validKeyInArray!0 (select (arr!15852 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513661 () Bool)

(assert (=> b!513661 (= e!299934 call!31564)))

(assert (= (and d!79187 (not res!313917)) b!513660))

(assert (= (and b!513660 res!313915) b!513659))

(assert (= (and b!513660 res!313916) b!513657))

(assert (= (and b!513657 c!60154) b!513658))

(assert (= (and b!513657 (not c!60154)) b!513661))

(assert (= (or b!513658 b!513661) bm!31561))

(declare-fun m!495241 () Bool)

(assert (=> b!513657 m!495241))

(assert (=> b!513657 m!495241))

(declare-fun m!495243 () Bool)

(assert (=> b!513657 m!495243))

(assert (=> b!513659 m!495241))

(assert (=> b!513659 m!495241))

(declare-fun m!495247 () Bool)

(assert (=> b!513659 m!495247))

(assert (=> bm!31561 m!495241))

(declare-fun m!495253 () Bool)

(assert (=> bm!31561 m!495253))

(assert (=> b!513660 m!495241))

(assert (=> b!513660 m!495241))

(assert (=> b!513660 m!495243))

(assert (=> b!513527 d!79187))

(declare-fun d!79193 () Bool)

(declare-fun res!313925 () Bool)

(declare-fun e!299949 () Bool)

(assert (=> d!79193 (=> res!313925 e!299949)))

(assert (=> d!79193 (= res!313925 (bvsge j!176 (size!16216 a!3235)))))

(assert (=> d!79193 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299949)))

(declare-fun b!513674 () Bool)

(declare-fun e!299948 () Bool)

(declare-fun call!31568 () Bool)

(assert (=> b!513674 (= e!299948 call!31568)))

(declare-fun b!513675 () Bool)

(declare-fun e!299947 () Bool)

(assert (=> b!513675 (= e!299948 e!299947)))

(declare-fun lt!235167 () (_ BitVec 64))

(assert (=> b!513675 (= lt!235167 (select (arr!15852 a!3235) j!176))))

(declare-fun lt!235166 () Unit!15896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32956 (_ BitVec 64) (_ BitVec 32)) Unit!15896)

(assert (=> b!513675 (= lt!235166 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235167 j!176))))

(assert (=> b!513675 (arrayContainsKey!0 a!3235 lt!235167 #b00000000000000000000000000000000)))

(declare-fun lt!235168 () Unit!15896)

(assert (=> b!513675 (= lt!235168 lt!235166)))

(declare-fun res!313924 () Bool)

(assert (=> b!513675 (= res!313924 (= (seekEntryOrOpen!0 (select (arr!15852 a!3235) j!176) a!3235 mask!3524) (Found!4319 j!176)))))

(assert (=> b!513675 (=> (not res!313924) (not e!299947))))

(declare-fun bm!31565 () Bool)

(assert (=> bm!31565 (= call!31568 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!513676 () Bool)

(assert (=> b!513676 (= e!299949 e!299948)))

(declare-fun c!60158 () Bool)

(assert (=> b!513676 (= c!60158 (validKeyInArray!0 (select (arr!15852 a!3235) j!176)))))

(declare-fun b!513677 () Bool)

(assert (=> b!513677 (= e!299947 call!31568)))

(assert (= (and d!79193 (not res!313925)) b!513676))

(assert (= (and b!513676 c!60158) b!513675))

(assert (= (and b!513676 (not c!60158)) b!513674))

(assert (= (and b!513675 res!313924) b!513677))

(assert (= (or b!513677 b!513674) bm!31565))

(assert (=> b!513675 m!495097))

(declare-fun m!495257 () Bool)

(assert (=> b!513675 m!495257))

(declare-fun m!495259 () Bool)

(assert (=> b!513675 m!495259))

(assert (=> b!513675 m!495097))

(assert (=> b!513675 m!495099))

(declare-fun m!495261 () Bool)

(assert (=> bm!31565 m!495261))

(assert (=> b!513676 m!495097))

(assert (=> b!513676 m!495097))

(assert (=> b!513676 m!495103))

(assert (=> b!513524 d!79193))

(declare-fun b!513729 () Bool)

(declare-fun lt!235198 () SeekEntryResult!4319)

(assert (=> b!513729 (and (bvsge (index!19466 lt!235198) #b00000000000000000000000000000000) (bvslt (index!19466 lt!235198) (size!16216 a!3235)))))

(declare-fun res!313947 () Bool)

(assert (=> b!513729 (= res!313947 (= (select (arr!15852 a!3235) (index!19466 lt!235198)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299982 () Bool)

(assert (=> b!513729 (=> res!313947 e!299982)))

(declare-fun b!513731 () Bool)

(declare-fun e!299983 () SeekEntryResult!4319)

(assert (=> b!513731 (= e!299983 (Intermediate!4319 true lt!235105 #b00000000000000000000000000000000))))

(declare-fun b!513732 () Bool)

(declare-fun e!299981 () Bool)

(assert (=> b!513732 (= e!299981 (bvsge (x!48418 lt!235198) #b01111111111111111111111111111110))))

(declare-fun e!299980 () SeekEntryResult!4319)

(declare-fun b!513733 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513733 (= e!299980 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235105 #b00000000000000000000000000000000 mask!3524) (select (arr!15852 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!79197 () Bool)

(assert (=> d!79197 e!299981))

(declare-fun c!60178 () Bool)

(assert (=> d!79197 (= c!60178 (and (is-Intermediate!4319 lt!235198) (undefined!5131 lt!235198)))))

(assert (=> d!79197 (= lt!235198 e!299983)))

(declare-fun c!60176 () Bool)

(assert (=> d!79197 (= c!60176 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235197 () (_ BitVec 64))

(assert (=> d!79197 (= lt!235197 (select (arr!15852 a!3235) lt!235105))))

(assert (=> d!79197 (validMask!0 mask!3524)))

(assert (=> d!79197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235105 (select (arr!15852 a!3235) j!176) a!3235 mask!3524) lt!235198)))

(declare-fun b!513730 () Bool)

(assert (=> b!513730 (= e!299983 e!299980)))

(declare-fun c!60177 () Bool)

(assert (=> b!513730 (= c!60177 (or (= lt!235197 (select (arr!15852 a!3235) j!176)) (= (bvadd lt!235197 lt!235197) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513734 () Bool)

(assert (=> b!513734 (and (bvsge (index!19466 lt!235198) #b00000000000000000000000000000000) (bvslt (index!19466 lt!235198) (size!16216 a!3235)))))

(assert (=> b!513734 (= e!299982 (= (select (arr!15852 a!3235) (index!19466 lt!235198)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513735 () Bool)

(assert (=> b!513735 (and (bvsge (index!19466 lt!235198) #b00000000000000000000000000000000) (bvslt (index!19466 lt!235198) (size!16216 a!3235)))))

(declare-fun res!313946 () Bool)

(assert (=> b!513735 (= res!313946 (= (select (arr!15852 a!3235) (index!19466 lt!235198)) (select (arr!15852 a!3235) j!176)))))

(assert (=> b!513735 (=> res!313946 e!299982)))

(declare-fun e!299979 () Bool)

(assert (=> b!513735 (= e!299979 e!299982)))

(declare-fun b!513736 () Bool)

(assert (=> b!513736 (= e!299980 (Intermediate!4319 false lt!235105 #b00000000000000000000000000000000))))

(declare-fun b!513737 () Bool)

(assert (=> b!513737 (= e!299981 e!299979)))

(declare-fun res!313945 () Bool)

(assert (=> b!513737 (= res!313945 (and (is-Intermediate!4319 lt!235198) (not (undefined!5131 lt!235198)) (bvslt (x!48418 lt!235198) #b01111111111111111111111111111110) (bvsge (x!48418 lt!235198) #b00000000000000000000000000000000) (bvsge (x!48418 lt!235198) #b00000000000000000000000000000000)))))

(assert (=> b!513737 (=> (not res!313945) (not e!299979))))

(assert (= (and d!79197 c!60176) b!513731))

(assert (= (and d!79197 (not c!60176)) b!513730))

(assert (= (and b!513730 c!60177) b!513736))

(assert (= (and b!513730 (not c!60177)) b!513733))

(assert (= (and d!79197 c!60178) b!513732))

(assert (= (and d!79197 (not c!60178)) b!513737))

(assert (= (and b!513737 res!313945) b!513735))

(assert (= (and b!513735 (not res!313946)) b!513729))

(assert (= (and b!513729 (not res!313947)) b!513734))

(declare-fun m!495271 () Bool)

(assert (=> b!513735 m!495271))

(declare-fun m!495273 () Bool)

(assert (=> d!79197 m!495273))

(assert (=> d!79197 m!495125))

(assert (=> b!513729 m!495271))

(assert (=> b!513734 m!495271))

(declare-fun m!495275 () Bool)

(assert (=> b!513733 m!495275))

(assert (=> b!513733 m!495275))

(assert (=> b!513733 m!495097))

(declare-fun m!495277 () Bool)

(assert (=> b!513733 m!495277))

(assert (=> b!513524 d!79197))

(declare-fun d!79209 () Bool)

(assert (=> d!79209 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235208 () Unit!15896)

(declare-fun choose!38 (array!32956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15896)

(assert (=> d!79209 (= lt!235208 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79209 (validMask!0 mask!3524)))

(assert (=> d!79209 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235208)))

(declare-fun bs!16255 () Bool)

(assert (= bs!16255 d!79209))

(assert (=> bs!16255 m!495115))

(declare-fun m!495285 () Bool)

(assert (=> bs!16255 m!495285))

(assert (=> bs!16255 m!495125))

(assert (=> b!513524 d!79209))

(declare-fun d!79213 () Bool)

(declare-fun lt!235231 () (_ BitVec 32))

(declare-fun lt!235230 () (_ BitVec 32))

(assert (=> d!79213 (= lt!235231 (bvmul (bvxor lt!235230 (bvlshr lt!235230 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79213 (= lt!235230 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15852 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15852 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79213 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313958 (let ((h!10897 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15852 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15852 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48426 (bvmul (bvxor h!10897 (bvlshr h!10897 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48426 (bvlshr x!48426 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313958 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313958 #b00000000000000000000000000000000))))))

(assert (=> d!79213 (= (toIndex!0 (select (store (arr!15852 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!235231 (bvlshr lt!235231 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513524 d!79213))

(declare-fun d!79227 () Bool)

(declare-fun lt!235233 () (_ BitVec 32))

(declare-fun lt!235232 () (_ BitVec 32))

(assert (=> d!79227 (= lt!235233 (bvmul (bvxor lt!235232 (bvlshr lt!235232 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79227 (= lt!235232 ((_ extract 31 0) (bvand (bvxor (select (arr!15852 a!3235) j!176) (bvlshr (select (arr!15852 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79227 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313958 (let ((h!10897 ((_ extract 31 0) (bvand (bvxor (select (arr!15852 a!3235) j!176) (bvlshr (select (arr!15852 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48426 (bvmul (bvxor h!10897 (bvlshr h!10897 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48426 (bvlshr x!48426 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313958 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313958 #b00000000000000000000000000000000))))))

(assert (=> d!79227 (= (toIndex!0 (select (arr!15852 a!3235) j!176) mask!3524) (bvand (bvxor lt!235233 (bvlshr lt!235233 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513524 d!79227))

(declare-fun b!513797 () Bool)

(declare-fun lt!235235 () SeekEntryResult!4319)

(assert (=> b!513797 (and (bvsge (index!19466 lt!235235) #b00000000000000000000000000000000) (bvslt (index!19466 lt!235235) (size!16216 (array!32957 (store (arr!15852 a!3235) i!1204 k!2280) (size!16216 a!3235)))))))

(declare-fun res!313974 () Bool)

(assert (=> b!513797 (= res!313974 (= (select (arr!15852 (array!32957 (store (arr!15852 a!3235) i!1204 k!2280) (size!16216 a!3235))) (index!19466 lt!235235)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300023 () Bool)

(assert (=> b!513797 (=> res!313974 e!300023)))

(declare-fun b!513799 () Bool)

(declare-fun e!300024 () SeekEntryResult!4319)

(assert (=> b!513799 (= e!300024 (Intermediate!4319 true lt!235108 #b00000000000000000000000000000000))))

(declare-fun b!513800 () Bool)

(declare-fun e!300022 () Bool)

(assert (=> b!513800 (= e!300022 (bvsge (x!48418 lt!235235) #b01111111111111111111111111111110))))

(declare-fun e!300021 () SeekEntryResult!4319)

(declare-fun b!513801 () Bool)

(assert (=> b!513801 (= e!300021 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235108 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15852 a!3235) i!1204 k!2280) j!176) (array!32957 (store (arr!15852 a!3235) i!1204 k!2280) (size!16216 a!3235)) mask!3524))))

(declare-fun d!79231 () Bool)

(assert (=> d!79231 e!300022))

(declare-fun c!60199 () Bool)

(assert (=> d!79231 (= c!60199 (and (is-Intermediate!4319 lt!235235) (undefined!5131 lt!235235)))))

(assert (=> d!79231 (= lt!235235 e!300024)))

(declare-fun c!60197 () Bool)

(assert (=> d!79231 (= c!60197 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235234 () (_ BitVec 64))

(assert (=> d!79231 (= lt!235234 (select (arr!15852 (array!32957 (store (arr!15852 a!3235) i!1204 k!2280) (size!16216 a!3235))) lt!235108))))

(assert (=> d!79231 (validMask!0 mask!3524)))

(assert (=> d!79231 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235108 (select (store (arr!15852 a!3235) i!1204 k!2280) j!176) (array!32957 (store (arr!15852 a!3235) i!1204 k!2280) (size!16216 a!3235)) mask!3524) lt!235235)))

(declare-fun b!513798 () Bool)

(assert (=> b!513798 (= e!300024 e!300021)))

(declare-fun c!60198 () Bool)

(assert (=> b!513798 (= c!60198 (or (= lt!235234 (select (store (arr!15852 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!235234 lt!235234) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513802 () Bool)

(assert (=> b!513802 (and (bvsge (index!19466 lt!235235) #b00000000000000000000000000000000) (bvslt (index!19466 lt!235235) (size!16216 (array!32957 (store (arr!15852 a!3235) i!1204 k!2280) (size!16216 a!3235)))))))

(assert (=> b!513802 (= e!300023 (= (select (arr!15852 (array!32957 (store (arr!15852 a!3235) i!1204 k!2280) (size!16216 a!3235))) (index!19466 lt!235235)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513803 () Bool)

(assert (=> b!513803 (and (bvsge (index!19466 lt!235235) #b00000000000000000000000000000000) (bvslt (index!19466 lt!235235) (size!16216 (array!32957 (store (arr!15852 a!3235) i!1204 k!2280) (size!16216 a!3235)))))))

(declare-fun res!313973 () Bool)

(assert (=> b!513803 (= res!313973 (= (select (arr!15852 (array!32957 (store (arr!15852 a!3235) i!1204 k!2280) (size!16216 a!3235))) (index!19466 lt!235235)) (select (store (arr!15852 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!513803 (=> res!313973 e!300023)))

(declare-fun e!300020 () Bool)

(assert (=> b!513803 (= e!300020 e!300023)))

(declare-fun b!513804 () Bool)

(assert (=> b!513804 (= e!300021 (Intermediate!4319 false lt!235108 #b00000000000000000000000000000000))))

(declare-fun b!513805 () Bool)

(assert (=> b!513805 (= e!300022 e!300020)))

(declare-fun res!313972 () Bool)

(assert (=> b!513805 (= res!313972 (and (is-Intermediate!4319 lt!235235) (not (undefined!5131 lt!235235)) (bvslt (x!48418 lt!235235) #b01111111111111111111111111111110) (bvsge (x!48418 lt!235235) #b00000000000000000000000000000000) (bvsge (x!48418 lt!235235) #b00000000000000000000000000000000)))))

(assert (=> b!513805 (=> (not res!313972) (not e!300020))))

(assert (= (and d!79231 c!60197) b!513799))

(assert (= (and d!79231 (not c!60197)) b!513798))

(assert (= (and b!513798 c!60198) b!513804))

(assert (= (and b!513798 (not c!60198)) b!513801))

(assert (= (and d!79231 c!60199) b!513800))

(assert (= (and d!79231 (not c!60199)) b!513805))

(assert (= (and b!513805 res!313972) b!513803))

(assert (= (and b!513803 (not res!313973)) b!513797))

(assert (= (and b!513797 (not res!313974)) b!513802))

(declare-fun m!495331 () Bool)

(assert (=> b!513803 m!495331))

(declare-fun m!495333 () Bool)

(assert (=> d!79231 m!495333))

(assert (=> d!79231 m!495125))

(assert (=> b!513797 m!495331))

(assert (=> b!513802 m!495331))

(declare-fun m!495335 () Bool)

(assert (=> b!513801 m!495335))

(assert (=> b!513801 m!495335))

(assert (=> b!513801 m!495111))

(declare-fun m!495337 () Bool)

(assert (=> b!513801 m!495337))

(assert (=> b!513524 d!79231))

(declare-fun d!79233 () Bool)

(assert (=> d!79233 (= (validKeyInArray!0 (select (arr!15852 a!3235) j!176)) (and (not (= (select (arr!15852 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15852 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513529 d!79233))

(declare-fun b!513848 () Bool)

(declare-fun e!300051 () SeekEntryResult!4319)

(declare-fun lt!235260 () SeekEntryResult!4319)

(assert (=> b!513848 (= e!300051 (MissingZero!4319 (index!19466 lt!235260)))))

(declare-fun b!513849 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32956 (_ BitVec 32)) SeekEntryResult!4319)

(assert (=> b!513849 (= e!300051 (seekKeyOrZeroReturnVacant!0 (x!48418 lt!235260) (index!19466 lt!235260) (index!19466 lt!235260) k!2280 a!3235 mask!3524))))

(declare-fun d!79235 () Bool)

(declare-fun lt!235261 () SeekEntryResult!4319)

(assert (=> d!79235 (and (or (is-Undefined!4319 lt!235261) (not (is-Found!4319 lt!235261)) (and (bvsge (index!19465 lt!235261) #b00000000000000000000000000000000) (bvslt (index!19465 lt!235261) (size!16216 a!3235)))) (or (is-Undefined!4319 lt!235261) (is-Found!4319 lt!235261) (not (is-MissingZero!4319 lt!235261)) (and (bvsge (index!19464 lt!235261) #b00000000000000000000000000000000) (bvslt (index!19464 lt!235261) (size!16216 a!3235)))) (or (is-Undefined!4319 lt!235261) (is-Found!4319 lt!235261) (is-MissingZero!4319 lt!235261) (not (is-MissingVacant!4319 lt!235261)) (and (bvsge (index!19467 lt!235261) #b00000000000000000000000000000000) (bvslt (index!19467 lt!235261) (size!16216 a!3235)))) (or (is-Undefined!4319 lt!235261) (ite (is-Found!4319 lt!235261) (= (select (arr!15852 a!3235) (index!19465 lt!235261)) k!2280) (ite (is-MissingZero!4319 lt!235261) (= (select (arr!15852 a!3235) (index!19464 lt!235261)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4319 lt!235261) (= (select (arr!15852 a!3235) (index!19467 lt!235261)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300049 () SeekEntryResult!4319)

(assert (=> d!79235 (= lt!235261 e!300049)))

(declare-fun c!60220 () Bool)

(assert (=> d!79235 (= c!60220 (and (is-Intermediate!4319 lt!235260) (undefined!5131 lt!235260)))))

(assert (=> d!79235 (= lt!235260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79235 (validMask!0 mask!3524)))

(assert (=> d!79235 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!235261)))

(declare-fun b!513850 () Bool)

(declare-fun c!60219 () Bool)

(declare-fun lt!235259 () (_ BitVec 64))

(assert (=> b!513850 (= c!60219 (= lt!235259 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300050 () SeekEntryResult!4319)

(assert (=> b!513850 (= e!300050 e!300051)))

(declare-fun b!513851 () Bool)

(assert (=> b!513851 (= e!300049 e!300050)))

(assert (=> b!513851 (= lt!235259 (select (arr!15852 a!3235) (index!19466 lt!235260)))))

(declare-fun c!60218 () Bool)

(assert (=> b!513851 (= c!60218 (= lt!235259 k!2280))))

(declare-fun b!513852 () Bool)

(assert (=> b!513852 (= e!300049 Undefined!4319)))

(declare-fun b!513853 () Bool)

(assert (=> b!513853 (= e!300050 (Found!4319 (index!19466 lt!235260)))))

(assert (= (and d!79235 c!60220) b!513852))

(assert (= (and d!79235 (not c!60220)) b!513851))

(assert (= (and b!513851 c!60218) b!513853))

(assert (= (and b!513851 (not c!60218)) b!513850))

(assert (= (and b!513850 c!60219) b!513848))

(assert (= (and b!513850 (not c!60219)) b!513849))

(declare-fun m!495369 () Bool)

(assert (=> b!513849 m!495369))

(declare-fun m!495371 () Bool)

(assert (=> d!79235 m!495371))

(declare-fun m!495373 () Bool)

(assert (=> d!79235 m!495373))

(declare-fun m!495375 () Bool)

(assert (=> d!79235 m!495375))

(assert (=> d!79235 m!495371))

(declare-fun m!495377 () Bool)

(assert (=> d!79235 m!495377))

(assert (=> d!79235 m!495125))

(declare-fun m!495379 () Bool)

(assert (=> d!79235 m!495379))

(declare-fun m!495381 () Bool)

(assert (=> b!513851 m!495381))

(assert (=> b!513530 d!79235))

(declare-fun d!79245 () Bool)

(declare-fun res!313991 () Bool)

(declare-fun e!300062 () Bool)

(assert (=> d!79245 (=> res!313991 e!300062)))

(assert (=> d!79245 (= res!313991 (= (select (arr!15852 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79245 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!300062)))

(declare-fun b!513864 () Bool)

(declare-fun e!300063 () Bool)

(assert (=> b!513864 (= e!300062 e!300063)))

(declare-fun res!313992 () Bool)

(assert (=> b!513864 (=> (not res!313992) (not e!300063))))

(assert (=> b!513864 (= res!313992 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16216 a!3235)))))

(declare-fun b!513865 () Bool)

(assert (=> b!513865 (= e!300063 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79245 (not res!313991)) b!513864))

(assert (= (and b!513864 res!313992) b!513865))

(assert (=> d!79245 m!495241))

(declare-fun m!495385 () Bool)

(assert (=> b!513865 m!495385))

(assert (=> b!513528 d!79245))

(declare-fun b!513866 () Bool)

(declare-fun e!300066 () SeekEntryResult!4319)

(declare-fun lt!235263 () SeekEntryResult!4319)

(assert (=> b!513866 (= e!300066 (MissingZero!4319 (index!19466 lt!235263)))))

(declare-fun b!513867 () Bool)

(assert (=> b!513867 (= e!300066 (seekKeyOrZeroReturnVacant!0 (x!48418 lt!235263) (index!19466 lt!235263) (index!19466 lt!235263) (select (arr!15852 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!79249 () Bool)

(declare-fun lt!235264 () SeekEntryResult!4319)

(assert (=> d!79249 (and (or (is-Undefined!4319 lt!235264) (not (is-Found!4319 lt!235264)) (and (bvsge (index!19465 lt!235264) #b00000000000000000000000000000000) (bvslt (index!19465 lt!235264) (size!16216 a!3235)))) (or (is-Undefined!4319 lt!235264) (is-Found!4319 lt!235264) (not (is-MissingZero!4319 lt!235264)) (and (bvsge (index!19464 lt!235264) #b00000000000000000000000000000000) (bvslt (index!19464 lt!235264) (size!16216 a!3235)))) (or (is-Undefined!4319 lt!235264) (is-Found!4319 lt!235264) (is-MissingZero!4319 lt!235264) (not (is-MissingVacant!4319 lt!235264)) (and (bvsge (index!19467 lt!235264) #b00000000000000000000000000000000) (bvslt (index!19467 lt!235264) (size!16216 a!3235)))) (or (is-Undefined!4319 lt!235264) (ite (is-Found!4319 lt!235264) (= (select (arr!15852 a!3235) (index!19465 lt!235264)) (select (arr!15852 a!3235) j!176)) (ite (is-MissingZero!4319 lt!235264) (= (select (arr!15852 a!3235) (index!19464 lt!235264)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4319 lt!235264) (= (select (arr!15852 a!3235) (index!19467 lt!235264)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300064 () SeekEntryResult!4319)

(assert (=> d!79249 (= lt!235264 e!300064)))

(declare-fun c!60223 () Bool)

(assert (=> d!79249 (= c!60223 (and (is-Intermediate!4319 lt!235263) (undefined!5131 lt!235263)))))

(assert (=> d!79249 (= lt!235263 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15852 a!3235) j!176) mask!3524) (select (arr!15852 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79249 (validMask!0 mask!3524)))

(assert (=> d!79249 (= (seekEntryOrOpen!0 (select (arr!15852 a!3235) j!176) a!3235 mask!3524) lt!235264)))

(declare-fun b!513868 () Bool)

(declare-fun c!60222 () Bool)

(declare-fun lt!235262 () (_ BitVec 64))

(assert (=> b!513868 (= c!60222 (= lt!235262 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300065 () SeekEntryResult!4319)

(assert (=> b!513868 (= e!300065 e!300066)))

(declare-fun b!513869 () Bool)

(assert (=> b!513869 (= e!300064 e!300065)))

(assert (=> b!513869 (= lt!235262 (select (arr!15852 a!3235) (index!19466 lt!235263)))))

(declare-fun c!60221 () Bool)

(assert (=> b!513869 (= c!60221 (= lt!235262 (select (arr!15852 a!3235) j!176)))))

(declare-fun b!513870 () Bool)

(assert (=> b!513870 (= e!300064 Undefined!4319)))

(declare-fun b!513871 () Bool)

(assert (=> b!513871 (= e!300065 (Found!4319 (index!19466 lt!235263)))))

(assert (= (and d!79249 c!60223) b!513870))

(assert (= (and d!79249 (not c!60223)) b!513869))

(assert (= (and b!513869 c!60221) b!513871))

(assert (= (and b!513869 (not c!60221)) b!513868))

(assert (= (and b!513868 c!60222) b!513866))

(assert (= (and b!513868 (not c!60222)) b!513867))

(assert (=> b!513867 m!495097))

(declare-fun m!495387 () Bool)

(assert (=> b!513867 m!495387))

(assert (=> d!79249 m!495113))

(assert (=> d!79249 m!495097))

(declare-fun m!495389 () Bool)

(assert (=> d!79249 m!495389))

(declare-fun m!495391 () Bool)

(assert (=> d!79249 m!495391))

(assert (=> d!79249 m!495097))

(assert (=> d!79249 m!495113))

(declare-fun m!495393 () Bool)

(assert (=> d!79249 m!495393))

(assert (=> d!79249 m!495125))

(declare-fun m!495395 () Bool)

(assert (=> d!79249 m!495395))

(declare-fun m!495397 () Bool)

(assert (=> b!513869 m!495397))

(assert (=> b!513533 d!79249))

(declare-fun d!79251 () Bool)

(assert (=> d!79251 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46416 d!79251))

(declare-fun d!79259 () Bool)

(assert (=> d!79259 (= (array_inv!11648 a!3235) (bvsge (size!16216 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46416 d!79259))

(declare-fun d!79261 () Bool)

(declare-fun res!314003 () Bool)

(declare-fun e!300081 () Bool)

(assert (=> d!79261 (=> res!314003 e!300081)))

(assert (=> d!79261 (= res!314003 (bvsge #b00000000000000000000000000000000 (size!16216 a!3235)))))

(assert (=> d!79261 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300081)))

(declare-fun b!513887 () Bool)

(declare-fun e!300080 () Bool)

(declare-fun call!31577 () Bool)

(assert (=> b!513887 (= e!300080 call!31577)))

(declare-fun b!513888 () Bool)

(declare-fun e!300079 () Bool)

(assert (=> b!513888 (= e!300080 e!300079)))

(declare-fun lt!235266 () (_ BitVec 64))

(assert (=> b!513888 (= lt!235266 (select (arr!15852 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235265 () Unit!15896)

(assert (=> b!513888 (= lt!235265 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235266 #b00000000000000000000000000000000))))

(assert (=> b!513888 (arrayContainsKey!0 a!3235 lt!235266 #b00000000000000000000000000000000)))

(declare-fun lt!235267 () Unit!15896)

(assert (=> b!513888 (= lt!235267 lt!235265)))

(declare-fun res!314002 () Bool)

(assert (=> b!513888 (= res!314002 (= (seekEntryOrOpen!0 (select (arr!15852 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4319 #b00000000000000000000000000000000)))))

(assert (=> b!513888 (=> (not res!314002) (not e!300079))))

(declare-fun bm!31574 () Bool)

(assert (=> bm!31574 (= call!31577 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!513889 () Bool)

(assert (=> b!513889 (= e!300081 e!300080)))

(declare-fun c!60227 () Bool)

(assert (=> b!513889 (= c!60227 (validKeyInArray!0 (select (arr!15852 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513890 () Bool)

(assert (=> b!513890 (= e!300079 call!31577)))

(assert (= (and d!79261 (not res!314003)) b!513889))

(assert (= (and b!513889 c!60227) b!513888))

(assert (= (and b!513889 (not c!60227)) b!513887))

(assert (= (and b!513888 res!314002) b!513890))

(assert (= (or b!513890 b!513887) bm!31574))

(assert (=> b!513888 m!495241))

(declare-fun m!495403 () Bool)

(assert (=> b!513888 m!495403))

(declare-fun m!495405 () Bool)

(assert (=> b!513888 m!495405))

(assert (=> b!513888 m!495241))

(declare-fun m!495407 () Bool)

(assert (=> b!513888 m!495407))

(declare-fun m!495409 () Bool)

(assert (=> bm!31574 m!495409))

(assert (=> b!513889 m!495241))

(assert (=> b!513889 m!495241))

(assert (=> b!513889 m!495243))

(assert (=> b!513523 d!79261))

(push 1)

(assert (not b!513733))

(assert (not bm!31561))

(assert (not bm!31574))

(assert (not d!79209))

(assert (not b!513889))

(assert (not d!79197))

(assert (not d!79235))

(assert (not b!513676))

(assert (not b!513657))

(assert (not b!513801))

(assert (not b!513675))

(assert (not bm!31565))

(assert (not b!513660))

(assert (not b!513659))

(assert (not b!513888))

(assert (not b!513865))

(assert (not d!79249))

(assert (not d!79231))

(assert (not b!513867))

(assert (not b!513849))

(check-sat)

(pop 1)

(push 1)

(check-sat)

