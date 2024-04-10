; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46346 () Bool)

(assert start!46346)

(declare-fun b!513067 () Bool)

(declare-fun res!313553 () Bool)

(declare-fun e!299603 () Bool)

(assert (=> b!513067 (=> (not res!313553) (not e!299603))))

(declare-datatypes ((array!32943 0))(
  ( (array!32944 (arr!15847 (Array (_ BitVec 32) (_ BitVec 64))) (size!16211 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32943)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513067 (= res!313553 (validKeyInArray!0 (select (arr!15847 a!3235) j!176)))))

(declare-fun b!513068 () Bool)

(declare-fun e!299601 () Bool)

(declare-datatypes ((SeekEntryResult!4314 0))(
  ( (MissingZero!4314 (index!19444 (_ BitVec 32))) (Found!4314 (index!19445 (_ BitVec 32))) (Intermediate!4314 (undefined!5126 Bool) (index!19446 (_ BitVec 32)) (x!48391 (_ BitVec 32))) (Undefined!4314) (MissingVacant!4314 (index!19447 (_ BitVec 32))) )
))
(declare-fun lt!234900 () SeekEntryResult!4314)

(assert (=> b!513068 (= e!299601 (and (bvsge (index!19446 lt!234900) #b00000000000000000000000000000000) (bvslt (index!19446 lt!234900) (size!16211 a!3235))))))

(assert (=> b!513068 (bvslt (x!48391 lt!234900) #b01111111111111111111111111111110)))

(declare-fun b!513069 () Bool)

(declare-fun res!313546 () Bool)

(assert (=> b!513069 (=> (not res!313546) (not e!299603))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!513069 (= res!313546 (and (= (size!16211 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16211 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16211 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!513070 () Bool)

(declare-fun res!313555 () Bool)

(assert (=> b!513070 (=> (not res!313555) (not e!299603))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!513070 (= res!313555 (validKeyInArray!0 k0!2280))))

(declare-fun b!513071 () Bool)

(declare-fun e!299602 () Bool)

(assert (=> b!513071 (= e!299602 (not e!299601))))

(declare-fun res!313548 () Bool)

(assert (=> b!513071 (=> res!313548 e!299601)))

(declare-fun lt!234903 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32943 (_ BitVec 32)) SeekEntryResult!4314)

(assert (=> b!513071 (= res!313548 (= lt!234900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234903 (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) (array!32944 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235)) mask!3524)))))

(declare-fun lt!234902 () (_ BitVec 32))

(assert (=> b!513071 (= lt!234900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234902 (select (arr!15847 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513071 (= lt!234903 (toIndex!0 (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!513071 (= lt!234902 (toIndex!0 (select (arr!15847 a!3235) j!176) mask!3524))))

(declare-fun e!299600 () Bool)

(assert (=> b!513071 e!299600))

(declare-fun res!313547 () Bool)

(assert (=> b!513071 (=> (not res!313547) (not e!299600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32943 (_ BitVec 32)) Bool)

(assert (=> b!513071 (= res!313547 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15886 0))(
  ( (Unit!15887) )
))
(declare-fun lt!234901 () Unit!15886)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15886)

(assert (=> b!513071 (= lt!234901 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513072 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32943 (_ BitVec 32)) SeekEntryResult!4314)

(assert (=> b!513072 (= e!299600 (= (seekEntryOrOpen!0 (select (arr!15847 a!3235) j!176) a!3235 mask!3524) (Found!4314 j!176)))))

(declare-fun b!513073 () Bool)

(declare-fun res!313549 () Bool)

(assert (=> b!513073 (=> (not res!313549) (not e!299602))))

(assert (=> b!513073 (= res!313549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513074 () Bool)

(assert (=> b!513074 (= e!299603 e!299602)))

(declare-fun res!313552 () Bool)

(assert (=> b!513074 (=> (not res!313552) (not e!299602))))

(declare-fun lt!234904 () SeekEntryResult!4314)

(assert (=> b!513074 (= res!313552 (or (= lt!234904 (MissingZero!4314 i!1204)) (= lt!234904 (MissingVacant!4314 i!1204))))))

(assert (=> b!513074 (= lt!234904 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!513076 () Bool)

(declare-fun res!313556 () Bool)

(assert (=> b!513076 (=> res!313556 e!299601)))

(get-info :version)

(assert (=> b!513076 (= res!313556 (or (undefined!5126 lt!234900) (not ((_ is Intermediate!4314) lt!234900))))))

(declare-fun b!513077 () Bool)

(declare-fun res!313554 () Bool)

(assert (=> b!513077 (=> (not res!313554) (not e!299602))))

(declare-datatypes ((List!10005 0))(
  ( (Nil!10002) (Cons!10001 (h!10884 (_ BitVec 64)) (t!16233 List!10005)) )
))
(declare-fun arrayNoDuplicates!0 (array!32943 (_ BitVec 32) List!10005) Bool)

(assert (=> b!513077 (= res!313554 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10002))))

(declare-fun b!513075 () Bool)

(declare-fun res!313550 () Bool)

(assert (=> b!513075 (=> (not res!313550) (not e!299603))))

(declare-fun arrayContainsKey!0 (array!32943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513075 (= res!313550 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!313551 () Bool)

(assert (=> start!46346 (=> (not res!313551) (not e!299603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46346 (= res!313551 (validMask!0 mask!3524))))

(assert (=> start!46346 e!299603))

(assert (=> start!46346 true))

(declare-fun array_inv!11643 (array!32943) Bool)

(assert (=> start!46346 (array_inv!11643 a!3235)))

(assert (= (and start!46346 res!313551) b!513069))

(assert (= (and b!513069 res!313546) b!513067))

(assert (= (and b!513067 res!313553) b!513070))

(assert (= (and b!513070 res!313555) b!513075))

(assert (= (and b!513075 res!313550) b!513074))

(assert (= (and b!513074 res!313552) b!513073))

(assert (= (and b!513073 res!313549) b!513077))

(assert (= (and b!513077 res!313554) b!513071))

(assert (= (and b!513071 res!313547) b!513072))

(assert (= (and b!513071 (not res!313548)) b!513076))

(assert (= (and b!513076 (not res!313556)) b!513068))

(declare-fun m!494709 () Bool)

(assert (=> b!513077 m!494709))

(declare-fun m!494711 () Bool)

(assert (=> b!513073 m!494711))

(declare-fun m!494713 () Bool)

(assert (=> b!513072 m!494713))

(assert (=> b!513072 m!494713))

(declare-fun m!494715 () Bool)

(assert (=> b!513072 m!494715))

(declare-fun m!494717 () Bool)

(assert (=> b!513075 m!494717))

(declare-fun m!494719 () Bool)

(assert (=> b!513074 m!494719))

(assert (=> b!513067 m!494713))

(assert (=> b!513067 m!494713))

(declare-fun m!494721 () Bool)

(assert (=> b!513067 m!494721))

(assert (=> b!513071 m!494713))

(declare-fun m!494723 () Bool)

(assert (=> b!513071 m!494723))

(declare-fun m!494725 () Bool)

(assert (=> b!513071 m!494725))

(declare-fun m!494727 () Bool)

(assert (=> b!513071 m!494727))

(declare-fun m!494729 () Bool)

(assert (=> b!513071 m!494729))

(assert (=> b!513071 m!494729))

(declare-fun m!494731 () Bool)

(assert (=> b!513071 m!494731))

(assert (=> b!513071 m!494713))

(declare-fun m!494733 () Bool)

(assert (=> b!513071 m!494733))

(assert (=> b!513071 m!494713))

(declare-fun m!494735 () Bool)

(assert (=> b!513071 m!494735))

(assert (=> b!513071 m!494729))

(declare-fun m!494737 () Bool)

(assert (=> b!513071 m!494737))

(declare-fun m!494739 () Bool)

(assert (=> start!46346 m!494739))

(declare-fun m!494741 () Bool)

(assert (=> start!46346 m!494741))

(declare-fun m!494743 () Bool)

(assert (=> b!513070 m!494743))

(check-sat (not b!513075) (not b!513073) (not b!513071) (not start!46346) (not b!513067) (not b!513074) (not b!513077) (not b!513070) (not b!513072))
(check-sat)
(get-model)

(declare-fun d!79081 () Bool)

(assert (=> d!79081 (= (validKeyInArray!0 (select (arr!15847 a!3235) j!176)) (and (not (= (select (arr!15847 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15847 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513067 d!79081))

(declare-fun b!513123 () Bool)

(declare-fun e!299627 () SeekEntryResult!4314)

(assert (=> b!513123 (= e!299627 Undefined!4314)))

(declare-fun b!513124 () Bool)

(declare-fun e!299626 () SeekEntryResult!4314)

(declare-fun lt!234927 () SeekEntryResult!4314)

(assert (=> b!513124 (= e!299626 (MissingZero!4314 (index!19446 lt!234927)))))

(declare-fun b!513125 () Bool)

(declare-fun e!299628 () SeekEntryResult!4314)

(assert (=> b!513125 (= e!299627 e!299628)))

(declare-fun lt!234926 () (_ BitVec 64))

(assert (=> b!513125 (= lt!234926 (select (arr!15847 a!3235) (index!19446 lt!234927)))))

(declare-fun c!60048 () Bool)

(assert (=> b!513125 (= c!60048 (= lt!234926 (select (arr!15847 a!3235) j!176)))))

(declare-fun b!513126 () Bool)

(declare-fun c!60050 () Bool)

(assert (=> b!513126 (= c!60050 (= lt!234926 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513126 (= e!299628 e!299626)))

(declare-fun b!513128 () Bool)

(assert (=> b!513128 (= e!299628 (Found!4314 (index!19446 lt!234927)))))

(declare-fun b!513127 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32943 (_ BitVec 32)) SeekEntryResult!4314)

(assert (=> b!513127 (= e!299626 (seekKeyOrZeroReturnVacant!0 (x!48391 lt!234927) (index!19446 lt!234927) (index!19446 lt!234927) (select (arr!15847 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!79083 () Bool)

(declare-fun lt!234928 () SeekEntryResult!4314)

(assert (=> d!79083 (and (or ((_ is Undefined!4314) lt!234928) (not ((_ is Found!4314) lt!234928)) (and (bvsge (index!19445 lt!234928) #b00000000000000000000000000000000) (bvslt (index!19445 lt!234928) (size!16211 a!3235)))) (or ((_ is Undefined!4314) lt!234928) ((_ is Found!4314) lt!234928) (not ((_ is MissingZero!4314) lt!234928)) (and (bvsge (index!19444 lt!234928) #b00000000000000000000000000000000) (bvslt (index!19444 lt!234928) (size!16211 a!3235)))) (or ((_ is Undefined!4314) lt!234928) ((_ is Found!4314) lt!234928) ((_ is MissingZero!4314) lt!234928) (not ((_ is MissingVacant!4314) lt!234928)) (and (bvsge (index!19447 lt!234928) #b00000000000000000000000000000000) (bvslt (index!19447 lt!234928) (size!16211 a!3235)))) (or ((_ is Undefined!4314) lt!234928) (ite ((_ is Found!4314) lt!234928) (= (select (arr!15847 a!3235) (index!19445 lt!234928)) (select (arr!15847 a!3235) j!176)) (ite ((_ is MissingZero!4314) lt!234928) (= (select (arr!15847 a!3235) (index!19444 lt!234928)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4314) lt!234928) (= (select (arr!15847 a!3235) (index!19447 lt!234928)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79083 (= lt!234928 e!299627)))

(declare-fun c!60049 () Bool)

(assert (=> d!79083 (= c!60049 (and ((_ is Intermediate!4314) lt!234927) (undefined!5126 lt!234927)))))

(assert (=> d!79083 (= lt!234927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15847 a!3235) j!176) mask!3524) (select (arr!15847 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79083 (validMask!0 mask!3524)))

(assert (=> d!79083 (= (seekEntryOrOpen!0 (select (arr!15847 a!3235) j!176) a!3235 mask!3524) lt!234928)))

(assert (= (and d!79083 c!60049) b!513123))

(assert (= (and d!79083 (not c!60049)) b!513125))

(assert (= (and b!513125 c!60048) b!513128))

(assert (= (and b!513125 (not c!60048)) b!513126))

(assert (= (and b!513126 c!60050) b!513124))

(assert (= (and b!513126 (not c!60050)) b!513127))

(declare-fun m!494781 () Bool)

(assert (=> b!513125 m!494781))

(assert (=> b!513127 m!494713))

(declare-fun m!494783 () Bool)

(assert (=> b!513127 m!494783))

(declare-fun m!494785 () Bool)

(assert (=> d!79083 m!494785))

(assert (=> d!79083 m!494739))

(declare-fun m!494787 () Bool)

(assert (=> d!79083 m!494787))

(assert (=> d!79083 m!494713))

(assert (=> d!79083 m!494733))

(assert (=> d!79083 m!494733))

(assert (=> d!79083 m!494713))

(declare-fun m!494789 () Bool)

(assert (=> d!79083 m!494789))

(declare-fun m!494791 () Bool)

(assert (=> d!79083 m!494791))

(assert (=> b!513072 d!79083))

(declare-fun b!513139 () Bool)

(declare-fun e!299638 () Bool)

(declare-fun e!299640 () Bool)

(assert (=> b!513139 (= e!299638 e!299640)))

(declare-fun c!60053 () Bool)

(assert (=> b!513139 (= c!60053 (validKeyInArray!0 (select (arr!15847 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513140 () Bool)

(declare-fun call!31538 () Bool)

(assert (=> b!513140 (= e!299640 call!31538)))

(declare-fun d!79085 () Bool)

(declare-fun res!313596 () Bool)

(declare-fun e!299639 () Bool)

(assert (=> d!79085 (=> res!313596 e!299639)))

(assert (=> d!79085 (= res!313596 (bvsge #b00000000000000000000000000000000 (size!16211 a!3235)))))

(assert (=> d!79085 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10002) e!299639)))

(declare-fun b!513141 () Bool)

(assert (=> b!513141 (= e!299639 e!299638)))

(declare-fun res!313598 () Bool)

(assert (=> b!513141 (=> (not res!313598) (not e!299638))))

(declare-fun e!299637 () Bool)

(assert (=> b!513141 (= res!313598 (not e!299637))))

(declare-fun res!313597 () Bool)

(assert (=> b!513141 (=> (not res!313597) (not e!299637))))

(assert (=> b!513141 (= res!313597 (validKeyInArray!0 (select (arr!15847 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513142 () Bool)

(declare-fun contains!2728 (List!10005 (_ BitVec 64)) Bool)

(assert (=> b!513142 (= e!299637 (contains!2728 Nil!10002 (select (arr!15847 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513143 () Bool)

(assert (=> b!513143 (= e!299640 call!31538)))

(declare-fun bm!31535 () Bool)

(assert (=> bm!31535 (= call!31538 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60053 (Cons!10001 (select (arr!15847 a!3235) #b00000000000000000000000000000000) Nil!10002) Nil!10002)))))

(assert (= (and d!79085 (not res!313596)) b!513141))

(assert (= (and b!513141 res!313597) b!513142))

(assert (= (and b!513141 res!313598) b!513139))

(assert (= (and b!513139 c!60053) b!513140))

(assert (= (and b!513139 (not c!60053)) b!513143))

(assert (= (or b!513140 b!513143) bm!31535))

(declare-fun m!494793 () Bool)

(assert (=> b!513139 m!494793))

(assert (=> b!513139 m!494793))

(declare-fun m!494795 () Bool)

(assert (=> b!513139 m!494795))

(assert (=> b!513141 m!494793))

(assert (=> b!513141 m!494793))

(assert (=> b!513141 m!494795))

(assert (=> b!513142 m!494793))

(assert (=> b!513142 m!494793))

(declare-fun m!494797 () Bool)

(assert (=> b!513142 m!494797))

(assert (=> bm!31535 m!494793))

(declare-fun m!494799 () Bool)

(assert (=> bm!31535 m!494799))

(assert (=> b!513077 d!79085))

(declare-fun d!79087 () Bool)

(assert (=> d!79087 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46346 d!79087))

(declare-fun d!79093 () Bool)

(assert (=> d!79093 (= (array_inv!11643 a!3235) (bvsge (size!16211 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46346 d!79093))

(declare-fun d!79095 () Bool)

(declare-fun lt!234934 () (_ BitVec 32))

(declare-fun lt!234933 () (_ BitVec 32))

(assert (=> d!79095 (= lt!234934 (bvmul (bvxor lt!234933 (bvlshr lt!234933 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79095 (= lt!234933 ((_ extract 31 0) (bvand (bvxor (select (arr!15847 a!3235) j!176) (bvlshr (select (arr!15847 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79095 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313599 (let ((h!10886 ((_ extract 31 0) (bvand (bvxor (select (arr!15847 a!3235) j!176) (bvlshr (select (arr!15847 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48393 (bvmul (bvxor h!10886 (bvlshr h!10886 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48393 (bvlshr x!48393 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313599 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313599 #b00000000000000000000000000000000))))))

(assert (=> d!79095 (= (toIndex!0 (select (arr!15847 a!3235) j!176) mask!3524) (bvand (bvxor lt!234934 (bvlshr lt!234934 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513071 d!79095))

(declare-fun d!79097 () Bool)

(declare-fun res!313606 () Bool)

(declare-fun e!299665 () Bool)

(assert (=> d!79097 (=> res!313606 e!299665)))

(assert (=> d!79097 (= res!313606 (bvsge j!176 (size!16211 a!3235)))))

(assert (=> d!79097 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299665)))

(declare-fun b!513188 () Bool)

(declare-fun e!299666 () Bool)

(declare-fun e!299667 () Bool)

(assert (=> b!513188 (= e!299666 e!299667)))

(declare-fun lt!234959 () (_ BitVec 64))

(assert (=> b!513188 (= lt!234959 (select (arr!15847 a!3235) j!176))))

(declare-fun lt!234961 () Unit!15886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32943 (_ BitVec 64) (_ BitVec 32)) Unit!15886)

(assert (=> b!513188 (= lt!234961 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234959 j!176))))

(assert (=> b!513188 (arrayContainsKey!0 a!3235 lt!234959 #b00000000000000000000000000000000)))

(declare-fun lt!234960 () Unit!15886)

(assert (=> b!513188 (= lt!234960 lt!234961)))

(declare-fun res!313605 () Bool)

(assert (=> b!513188 (= res!313605 (= (seekEntryOrOpen!0 (select (arr!15847 a!3235) j!176) a!3235 mask!3524) (Found!4314 j!176)))))

(assert (=> b!513188 (=> (not res!313605) (not e!299667))))

(declare-fun bm!31538 () Bool)

(declare-fun call!31541 () Bool)

(assert (=> bm!31538 (= call!31541 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!513189 () Bool)

(assert (=> b!513189 (= e!299665 e!299666)))

(declare-fun c!60074 () Bool)

(assert (=> b!513189 (= c!60074 (validKeyInArray!0 (select (arr!15847 a!3235) j!176)))))

(declare-fun b!513190 () Bool)

(assert (=> b!513190 (= e!299667 call!31541)))

(declare-fun b!513191 () Bool)

(assert (=> b!513191 (= e!299666 call!31541)))

(assert (= (and d!79097 (not res!313606)) b!513189))

(assert (= (and b!513189 c!60074) b!513188))

(assert (= (and b!513189 (not c!60074)) b!513191))

(assert (= (and b!513188 res!313605) b!513190))

(assert (= (or b!513190 b!513191) bm!31538))

(assert (=> b!513188 m!494713))

(declare-fun m!494825 () Bool)

(assert (=> b!513188 m!494825))

(declare-fun m!494827 () Bool)

(assert (=> b!513188 m!494827))

(assert (=> b!513188 m!494713))

(assert (=> b!513188 m!494715))

(declare-fun m!494829 () Bool)

(assert (=> bm!31538 m!494829))

(assert (=> b!513189 m!494713))

(assert (=> b!513189 m!494713))

(assert (=> b!513189 m!494721))

(assert (=> b!513071 d!79097))

(declare-fun b!513246 () Bool)

(declare-fun lt!234985 () SeekEntryResult!4314)

(assert (=> b!513246 (and (bvsge (index!19446 lt!234985) #b00000000000000000000000000000000) (bvslt (index!19446 lt!234985) (size!16211 (array!32944 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235)))))))

(declare-fun res!313631 () Bool)

(assert (=> b!513246 (= res!313631 (= (select (arr!15847 (array!32944 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235))) (index!19446 lt!234985)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299704 () Bool)

(assert (=> b!513246 (=> res!313631 e!299704)))

(declare-fun e!299703 () SeekEntryResult!4314)

(declare-fun b!513247 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513247 (= e!299703 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234903 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) (array!32944 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235)) mask!3524))))

(declare-fun b!513248 () Bool)

(declare-fun e!299707 () SeekEntryResult!4314)

(assert (=> b!513248 (= e!299707 e!299703)))

(declare-fun c!60090 () Bool)

(declare-fun lt!234986 () (_ BitVec 64))

(assert (=> b!513248 (= c!60090 (or (= lt!234986 (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!234986 lt!234986) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513249 () Bool)

(assert (=> b!513249 (and (bvsge (index!19446 lt!234985) #b00000000000000000000000000000000) (bvslt (index!19446 lt!234985) (size!16211 (array!32944 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235)))))))

(declare-fun res!313633 () Bool)

(assert (=> b!513249 (= res!313633 (= (select (arr!15847 (array!32944 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235))) (index!19446 lt!234985)) (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!513249 (=> res!313633 e!299704)))

(declare-fun e!299706 () Bool)

(assert (=> b!513249 (= e!299706 e!299704)))

(declare-fun b!513250 () Bool)

(declare-fun e!299705 () Bool)

(assert (=> b!513250 (= e!299705 e!299706)))

(declare-fun res!313632 () Bool)

(assert (=> b!513250 (= res!313632 (and ((_ is Intermediate!4314) lt!234985) (not (undefined!5126 lt!234985)) (bvslt (x!48391 lt!234985) #b01111111111111111111111111111110) (bvsge (x!48391 lt!234985) #b00000000000000000000000000000000) (bvsge (x!48391 lt!234985) #b00000000000000000000000000000000)))))

(assert (=> b!513250 (=> (not res!313632) (not e!299706))))

(declare-fun b!513251 () Bool)

(assert (=> b!513251 (and (bvsge (index!19446 lt!234985) #b00000000000000000000000000000000) (bvslt (index!19446 lt!234985) (size!16211 (array!32944 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235)))))))

(assert (=> b!513251 (= e!299704 (= (select (arr!15847 (array!32944 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235))) (index!19446 lt!234985)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513252 () Bool)

(assert (=> b!513252 (= e!299707 (Intermediate!4314 true lt!234903 #b00000000000000000000000000000000))))

(declare-fun b!513253 () Bool)

(assert (=> b!513253 (= e!299705 (bvsge (x!48391 lt!234985) #b01111111111111111111111111111110))))

(declare-fun b!513254 () Bool)

(assert (=> b!513254 (= e!299703 (Intermediate!4314 false lt!234903 #b00000000000000000000000000000000))))

(declare-fun d!79103 () Bool)

(assert (=> d!79103 e!299705))

(declare-fun c!60092 () Bool)

(assert (=> d!79103 (= c!60092 (and ((_ is Intermediate!4314) lt!234985) (undefined!5126 lt!234985)))))

(assert (=> d!79103 (= lt!234985 e!299707)))

(declare-fun c!60091 () Bool)

(assert (=> d!79103 (= c!60091 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79103 (= lt!234986 (select (arr!15847 (array!32944 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235))) lt!234903))))

(assert (=> d!79103 (validMask!0 mask!3524)))

(assert (=> d!79103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234903 (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) (array!32944 (store (arr!15847 a!3235) i!1204 k0!2280) (size!16211 a!3235)) mask!3524) lt!234985)))

(assert (= (and d!79103 c!60091) b!513252))

(assert (= (and d!79103 (not c!60091)) b!513248))

(assert (= (and b!513248 c!60090) b!513254))

(assert (= (and b!513248 (not c!60090)) b!513247))

(assert (= (and d!79103 c!60092) b!513253))

(assert (= (and d!79103 (not c!60092)) b!513250))

(assert (= (and b!513250 res!313632) b!513249))

(assert (= (and b!513249 (not res!313633)) b!513246))

(assert (= (and b!513246 (not res!313631)) b!513251))

(declare-fun m!494845 () Bool)

(assert (=> b!513246 m!494845))

(assert (=> b!513249 m!494845))

(assert (=> b!513251 m!494845))

(declare-fun m!494847 () Bool)

(assert (=> b!513247 m!494847))

(assert (=> b!513247 m!494847))

(assert (=> b!513247 m!494729))

(declare-fun m!494849 () Bool)

(assert (=> b!513247 m!494849))

(declare-fun m!494851 () Bool)

(assert (=> d!79103 m!494851))

(assert (=> d!79103 m!494739))

(assert (=> b!513071 d!79103))

(declare-fun b!513255 () Bool)

(declare-fun lt!234987 () SeekEntryResult!4314)

(assert (=> b!513255 (and (bvsge (index!19446 lt!234987) #b00000000000000000000000000000000) (bvslt (index!19446 lt!234987) (size!16211 a!3235)))))

(declare-fun res!313634 () Bool)

(assert (=> b!513255 (= res!313634 (= (select (arr!15847 a!3235) (index!19446 lt!234987)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299709 () Bool)

(assert (=> b!513255 (=> res!313634 e!299709)))

(declare-fun b!513256 () Bool)

(declare-fun e!299708 () SeekEntryResult!4314)

(assert (=> b!513256 (= e!299708 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234902 #b00000000000000000000000000000000 mask!3524) (select (arr!15847 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!513257 () Bool)

(declare-fun e!299712 () SeekEntryResult!4314)

(assert (=> b!513257 (= e!299712 e!299708)))

(declare-fun c!60093 () Bool)

(declare-fun lt!234988 () (_ BitVec 64))

(assert (=> b!513257 (= c!60093 (or (= lt!234988 (select (arr!15847 a!3235) j!176)) (= (bvadd lt!234988 lt!234988) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513258 () Bool)

(assert (=> b!513258 (and (bvsge (index!19446 lt!234987) #b00000000000000000000000000000000) (bvslt (index!19446 lt!234987) (size!16211 a!3235)))))

(declare-fun res!313636 () Bool)

(assert (=> b!513258 (= res!313636 (= (select (arr!15847 a!3235) (index!19446 lt!234987)) (select (arr!15847 a!3235) j!176)))))

(assert (=> b!513258 (=> res!313636 e!299709)))

(declare-fun e!299711 () Bool)

(assert (=> b!513258 (= e!299711 e!299709)))

(declare-fun b!513259 () Bool)

(declare-fun e!299710 () Bool)

(assert (=> b!513259 (= e!299710 e!299711)))

(declare-fun res!313635 () Bool)

(assert (=> b!513259 (= res!313635 (and ((_ is Intermediate!4314) lt!234987) (not (undefined!5126 lt!234987)) (bvslt (x!48391 lt!234987) #b01111111111111111111111111111110) (bvsge (x!48391 lt!234987) #b00000000000000000000000000000000) (bvsge (x!48391 lt!234987) #b00000000000000000000000000000000)))))

(assert (=> b!513259 (=> (not res!313635) (not e!299711))))

(declare-fun b!513260 () Bool)

(assert (=> b!513260 (and (bvsge (index!19446 lt!234987) #b00000000000000000000000000000000) (bvslt (index!19446 lt!234987) (size!16211 a!3235)))))

(assert (=> b!513260 (= e!299709 (= (select (arr!15847 a!3235) (index!19446 lt!234987)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513261 () Bool)

(assert (=> b!513261 (= e!299712 (Intermediate!4314 true lt!234902 #b00000000000000000000000000000000))))

(declare-fun b!513262 () Bool)

(assert (=> b!513262 (= e!299710 (bvsge (x!48391 lt!234987) #b01111111111111111111111111111110))))

(declare-fun b!513263 () Bool)

(assert (=> b!513263 (= e!299708 (Intermediate!4314 false lt!234902 #b00000000000000000000000000000000))))

(declare-fun d!79115 () Bool)

(assert (=> d!79115 e!299710))

(declare-fun c!60095 () Bool)

(assert (=> d!79115 (= c!60095 (and ((_ is Intermediate!4314) lt!234987) (undefined!5126 lt!234987)))))

(assert (=> d!79115 (= lt!234987 e!299712)))

(declare-fun c!60094 () Bool)

(assert (=> d!79115 (= c!60094 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79115 (= lt!234988 (select (arr!15847 a!3235) lt!234902))))

(assert (=> d!79115 (validMask!0 mask!3524)))

(assert (=> d!79115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234902 (select (arr!15847 a!3235) j!176) a!3235 mask!3524) lt!234987)))

(assert (= (and d!79115 c!60094) b!513261))

(assert (= (and d!79115 (not c!60094)) b!513257))

(assert (= (and b!513257 c!60093) b!513263))

(assert (= (and b!513257 (not c!60093)) b!513256))

(assert (= (and d!79115 c!60095) b!513262))

(assert (= (and d!79115 (not c!60095)) b!513259))

(assert (= (and b!513259 res!313635) b!513258))

(assert (= (and b!513258 (not res!313636)) b!513255))

(assert (= (and b!513255 (not res!313634)) b!513260))

(declare-fun m!494853 () Bool)

(assert (=> b!513255 m!494853))

(assert (=> b!513258 m!494853))

(assert (=> b!513260 m!494853))

(declare-fun m!494855 () Bool)

(assert (=> b!513256 m!494855))

(assert (=> b!513256 m!494855))

(assert (=> b!513256 m!494713))

(declare-fun m!494857 () Bool)

(assert (=> b!513256 m!494857))

(declare-fun m!494859 () Bool)

(assert (=> d!79115 m!494859))

(assert (=> d!79115 m!494739))

(assert (=> b!513071 d!79115))

(declare-fun d!79121 () Bool)

(assert (=> d!79121 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!234997 () Unit!15886)

(declare-fun choose!38 (array!32943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15886)

(assert (=> d!79121 (= lt!234997 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79121 (validMask!0 mask!3524)))

(assert (=> d!79121 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!234997)))

(declare-fun bs!16246 () Bool)

(assert (= bs!16246 d!79121))

(assert (=> bs!16246 m!494735))

(declare-fun m!494869 () Bool)

(assert (=> bs!16246 m!494869))

(assert (=> bs!16246 m!494739))

(assert (=> b!513071 d!79121))

(declare-fun d!79125 () Bool)

(declare-fun lt!234999 () (_ BitVec 32))

(declare-fun lt!234998 () (_ BitVec 32))

(assert (=> d!79125 (= lt!234999 (bvmul (bvxor lt!234998 (bvlshr lt!234998 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79125 (= lt!234998 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79125 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313599 (let ((h!10886 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48393 (bvmul (bvxor h!10886 (bvlshr h!10886 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48393 (bvlshr x!48393 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313599 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313599 #b00000000000000000000000000000000))))))

(assert (=> d!79125 (= (toIndex!0 (select (store (arr!15847 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!234999 (bvlshr lt!234999 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513071 d!79125))

(declare-fun d!79127 () Bool)

(assert (=> d!79127 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513070 d!79127))

(declare-fun d!79129 () Bool)

(declare-fun res!313647 () Bool)

(declare-fun e!299725 () Bool)

(assert (=> d!79129 (=> res!313647 e!299725)))

(assert (=> d!79129 (= res!313647 (= (select (arr!15847 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79129 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!299725)))

(declare-fun b!513281 () Bool)

(declare-fun e!299726 () Bool)

(assert (=> b!513281 (= e!299725 e!299726)))

(declare-fun res!313648 () Bool)

(assert (=> b!513281 (=> (not res!313648) (not e!299726))))

(assert (=> b!513281 (= res!313648 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16211 a!3235)))))

(declare-fun b!513282 () Bool)

(assert (=> b!513282 (= e!299726 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79129 (not res!313647)) b!513281))

(assert (= (and b!513281 res!313648) b!513282))

(assert (=> d!79129 m!494793))

(declare-fun m!494877 () Bool)

(assert (=> b!513282 m!494877))

(assert (=> b!513075 d!79129))

(declare-fun b!513289 () Bool)

(declare-fun e!299732 () SeekEntryResult!4314)

(assert (=> b!513289 (= e!299732 Undefined!4314)))

(declare-fun b!513290 () Bool)

(declare-fun e!299731 () SeekEntryResult!4314)

(declare-fun lt!235010 () SeekEntryResult!4314)

(assert (=> b!513290 (= e!299731 (MissingZero!4314 (index!19446 lt!235010)))))

(declare-fun b!513291 () Bool)

(declare-fun e!299733 () SeekEntryResult!4314)

(assert (=> b!513291 (= e!299732 e!299733)))

(declare-fun lt!235009 () (_ BitVec 64))

(assert (=> b!513291 (= lt!235009 (select (arr!15847 a!3235) (index!19446 lt!235010)))))

(declare-fun c!60102 () Bool)

(assert (=> b!513291 (= c!60102 (= lt!235009 k0!2280))))

(declare-fun b!513292 () Bool)

(declare-fun c!60104 () Bool)

(assert (=> b!513292 (= c!60104 (= lt!235009 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513292 (= e!299733 e!299731)))

(declare-fun b!513294 () Bool)

(assert (=> b!513294 (= e!299733 (Found!4314 (index!19446 lt!235010)))))

(declare-fun b!513293 () Bool)

(assert (=> b!513293 (= e!299731 (seekKeyOrZeroReturnVacant!0 (x!48391 lt!235010) (index!19446 lt!235010) (index!19446 lt!235010) k0!2280 a!3235 mask!3524))))

(declare-fun d!79135 () Bool)

(declare-fun lt!235011 () SeekEntryResult!4314)

(assert (=> d!79135 (and (or ((_ is Undefined!4314) lt!235011) (not ((_ is Found!4314) lt!235011)) (and (bvsge (index!19445 lt!235011) #b00000000000000000000000000000000) (bvslt (index!19445 lt!235011) (size!16211 a!3235)))) (or ((_ is Undefined!4314) lt!235011) ((_ is Found!4314) lt!235011) (not ((_ is MissingZero!4314) lt!235011)) (and (bvsge (index!19444 lt!235011) #b00000000000000000000000000000000) (bvslt (index!19444 lt!235011) (size!16211 a!3235)))) (or ((_ is Undefined!4314) lt!235011) ((_ is Found!4314) lt!235011) ((_ is MissingZero!4314) lt!235011) (not ((_ is MissingVacant!4314) lt!235011)) (and (bvsge (index!19447 lt!235011) #b00000000000000000000000000000000) (bvslt (index!19447 lt!235011) (size!16211 a!3235)))) (or ((_ is Undefined!4314) lt!235011) (ite ((_ is Found!4314) lt!235011) (= (select (arr!15847 a!3235) (index!19445 lt!235011)) k0!2280) (ite ((_ is MissingZero!4314) lt!235011) (= (select (arr!15847 a!3235) (index!19444 lt!235011)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4314) lt!235011) (= (select (arr!15847 a!3235) (index!19447 lt!235011)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79135 (= lt!235011 e!299732)))

(declare-fun c!60103 () Bool)

(assert (=> d!79135 (= c!60103 (and ((_ is Intermediate!4314) lt!235010) (undefined!5126 lt!235010)))))

(assert (=> d!79135 (= lt!235010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79135 (validMask!0 mask!3524)))

(assert (=> d!79135 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!235011)))

(assert (= (and d!79135 c!60103) b!513289))

(assert (= (and d!79135 (not c!60103)) b!513291))

(assert (= (and b!513291 c!60102) b!513294))

(assert (= (and b!513291 (not c!60102)) b!513292))

(assert (= (and b!513292 c!60104) b!513290))

(assert (= (and b!513292 (not c!60104)) b!513293))

(declare-fun m!494879 () Bool)

(assert (=> b!513291 m!494879))

(declare-fun m!494881 () Bool)

(assert (=> b!513293 m!494881))

(declare-fun m!494883 () Bool)

(assert (=> d!79135 m!494883))

(assert (=> d!79135 m!494739))

(declare-fun m!494885 () Bool)

(assert (=> d!79135 m!494885))

(declare-fun m!494887 () Bool)

(assert (=> d!79135 m!494887))

(assert (=> d!79135 m!494887))

(declare-fun m!494889 () Bool)

(assert (=> d!79135 m!494889))

(declare-fun m!494891 () Bool)

(assert (=> d!79135 m!494891))

(assert (=> b!513074 d!79135))

(declare-fun d!79137 () Bool)

(declare-fun res!313654 () Bool)

(declare-fun e!299736 () Bool)

(assert (=> d!79137 (=> res!313654 e!299736)))

(assert (=> d!79137 (= res!313654 (bvsge #b00000000000000000000000000000000 (size!16211 a!3235)))))

(assert (=> d!79137 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299736)))

(declare-fun b!513297 () Bool)

(declare-fun e!299737 () Bool)

(declare-fun e!299738 () Bool)

(assert (=> b!513297 (= e!299737 e!299738)))

(declare-fun lt!235014 () (_ BitVec 64))

(assert (=> b!513297 (= lt!235014 (select (arr!15847 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235016 () Unit!15886)

(assert (=> b!513297 (= lt!235016 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235014 #b00000000000000000000000000000000))))

(assert (=> b!513297 (arrayContainsKey!0 a!3235 lt!235014 #b00000000000000000000000000000000)))

(declare-fun lt!235015 () Unit!15886)

(assert (=> b!513297 (= lt!235015 lt!235016)))

(declare-fun res!313653 () Bool)

(assert (=> b!513297 (= res!313653 (= (seekEntryOrOpen!0 (select (arr!15847 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4314 #b00000000000000000000000000000000)))))

(assert (=> b!513297 (=> (not res!313653) (not e!299738))))

(declare-fun bm!31545 () Bool)

(declare-fun call!31548 () Bool)

(assert (=> bm!31545 (= call!31548 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!513298 () Bool)

(assert (=> b!513298 (= e!299736 e!299737)))

(declare-fun c!60105 () Bool)

(assert (=> b!513298 (= c!60105 (validKeyInArray!0 (select (arr!15847 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513299 () Bool)

(assert (=> b!513299 (= e!299738 call!31548)))

(declare-fun b!513300 () Bool)

(assert (=> b!513300 (= e!299737 call!31548)))

(assert (= (and d!79137 (not res!313654)) b!513298))

(assert (= (and b!513298 c!60105) b!513297))

(assert (= (and b!513298 (not c!60105)) b!513300))

(assert (= (and b!513297 res!313653) b!513299))

(assert (= (or b!513299 b!513300) bm!31545))

(assert (=> b!513297 m!494793))

(declare-fun m!494893 () Bool)

(assert (=> b!513297 m!494893))

(declare-fun m!494895 () Bool)

(assert (=> b!513297 m!494895))

(assert (=> b!513297 m!494793))

(declare-fun m!494897 () Bool)

(assert (=> b!513297 m!494897))

(declare-fun m!494899 () Bool)

(assert (=> bm!31545 m!494899))

(assert (=> b!513298 m!494793))

(assert (=> b!513298 m!494793))

(assert (=> b!513298 m!494795))

(assert (=> b!513073 d!79137))

(check-sat (not d!79135) (not b!513139) (not b!513282) (not b!513298) (not d!79121) (not b!513142) (not b!513256) (not b!513247) (not d!79103) (not bm!31545) (not d!79083) (not bm!31538) (not b!513189) (not b!513188) (not b!513297) (not b!513141) (not b!513293) (not d!79115) (not b!513127) (not bm!31535))
(check-sat)
