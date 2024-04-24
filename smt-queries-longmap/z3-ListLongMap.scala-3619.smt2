; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49868 () Bool)

(assert start!49868)

(declare-fun b!547422 () Bool)

(declare-fun e!316327 () Bool)

(declare-fun e!316329 () Bool)

(assert (=> b!547422 (= e!316327 e!316329)))

(declare-fun res!340961 () Bool)

(assert (=> b!547422 (=> (not res!340961) (not e!316329))))

(declare-datatypes ((SeekEntryResult!4987 0))(
  ( (MissingZero!4987 (index!22175 (_ BitVec 32))) (Found!4987 (index!22176 (_ BitVec 32))) (Intermediate!4987 (undefined!5799 Bool) (index!22177 (_ BitVec 32)) (x!51274 (_ BitVec 32))) (Undefined!4987) (MissingVacant!4987 (index!22178 (_ BitVec 32))) )
))
(declare-fun lt!249586 () SeekEntryResult!4987)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547422 (= res!340961 (or (= lt!249586 (MissingZero!4987 i!1132)) (= lt!249586 (MissingVacant!4987 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34519 0))(
  ( (array!34520 (arr!16582 (Array (_ BitVec 32) (_ BitVec 64))) (size!16946 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34519)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34519 (_ BitVec 32)) SeekEntryResult!4987)

(assert (=> b!547422 (= lt!249586 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547423 () Bool)

(declare-fun res!340966 () Bool)

(assert (=> b!547423 (=> (not res!340966) (not e!316327))))

(declare-fun arrayContainsKey!0 (array!34519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547423 (= res!340966 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547424 () Bool)

(declare-fun res!340965 () Bool)

(assert (=> b!547424 (=> (not res!340965) (not e!316329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34519 (_ BitVec 32)) Bool)

(assert (=> b!547424 (= res!340965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547425 () Bool)

(declare-fun res!340963 () Bool)

(assert (=> b!547425 (=> (not res!340963) (not e!316329))))

(assert (=> b!547425 (= res!340963 (and (bvsle #b00000000000000000000000000000000 (size!16946 a!3118)) (bvslt (size!16946 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!547426 () Bool)

(declare-fun res!340962 () Bool)

(assert (=> b!547426 (=> (not res!340962) (not e!316327))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!547426 (= res!340962 (and (= (size!16946 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16946 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16946 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547427 () Bool)

(declare-datatypes ((List!10569 0))(
  ( (Nil!10566) (Cons!10565 (h!11535 (_ BitVec 64)) (t!16789 List!10569)) )
))
(declare-fun noDuplicate!223 (List!10569) Bool)

(assert (=> b!547427 (= e!316329 (not (noDuplicate!223 Nil!10566)))))

(declare-fun b!547428 () Bool)

(declare-fun res!340964 () Bool)

(assert (=> b!547428 (=> (not res!340964) (not e!316327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547428 (= res!340964 (validKeyInArray!0 (select (arr!16582 a!3118) j!142)))))

(declare-fun res!340960 () Bool)

(assert (=> start!49868 (=> (not res!340960) (not e!316327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49868 (= res!340960 (validMask!0 mask!3119))))

(assert (=> start!49868 e!316327))

(assert (=> start!49868 true))

(declare-fun array_inv!12441 (array!34519) Bool)

(assert (=> start!49868 (array_inv!12441 a!3118)))

(declare-fun b!547429 () Bool)

(declare-fun res!340959 () Bool)

(assert (=> b!547429 (=> (not res!340959) (not e!316327))))

(assert (=> b!547429 (= res!340959 (validKeyInArray!0 k0!1914))))

(assert (= (and start!49868 res!340960) b!547426))

(assert (= (and b!547426 res!340962) b!547428))

(assert (= (and b!547428 res!340964) b!547429))

(assert (= (and b!547429 res!340959) b!547423))

(assert (= (and b!547423 res!340966) b!547422))

(assert (= (and b!547422 res!340961) b!547424))

(assert (= (and b!547424 res!340965) b!547425))

(assert (= (and b!547425 res!340963) b!547427))

(declare-fun m!524893 () Bool)

(assert (=> b!547429 m!524893))

(declare-fun m!524895 () Bool)

(assert (=> b!547428 m!524895))

(assert (=> b!547428 m!524895))

(declare-fun m!524897 () Bool)

(assert (=> b!547428 m!524897))

(declare-fun m!524899 () Bool)

(assert (=> b!547424 m!524899))

(declare-fun m!524901 () Bool)

(assert (=> b!547427 m!524901))

(declare-fun m!524903 () Bool)

(assert (=> b!547423 m!524903))

(declare-fun m!524905 () Bool)

(assert (=> start!49868 m!524905))

(declare-fun m!524907 () Bool)

(assert (=> start!49868 m!524907))

(declare-fun m!524909 () Bool)

(assert (=> b!547422 m!524909))

(check-sat (not b!547429) (not b!547428) (not b!547422) (not b!547427) (not b!547424) (not start!49868) (not b!547423))
(check-sat)
(get-model)

(declare-fun d!82553 () Bool)

(assert (=> d!82553 (= (validKeyInArray!0 (select (arr!16582 a!3118) j!142)) (and (not (= (select (arr!16582 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16582 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547428 d!82553))

(declare-fun d!82555 () Bool)

(assert (=> d!82555 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49868 d!82555))

(declare-fun d!82563 () Bool)

(assert (=> d!82563 (= (array_inv!12441 a!3118) (bvsge (size!16946 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49868 d!82563))

(declare-fun b!547514 () Bool)

(declare-fun e!316377 () SeekEntryResult!4987)

(declare-fun lt!249608 () SeekEntryResult!4987)

(assert (=> b!547514 (= e!316377 (MissingZero!4987 (index!22177 lt!249608)))))

(declare-fun b!547515 () Bool)

(declare-fun c!63572 () Bool)

(declare-fun lt!249610 () (_ BitVec 64))

(assert (=> b!547515 (= c!63572 (= lt!249610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316376 () SeekEntryResult!4987)

(assert (=> b!547515 (= e!316376 e!316377)))

(declare-fun b!547516 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34519 (_ BitVec 32)) SeekEntryResult!4987)

(assert (=> b!547516 (= e!316377 (seekKeyOrZeroReturnVacant!0 (x!51274 lt!249608) (index!22177 lt!249608) (index!22177 lt!249608) k0!1914 a!3118 mask!3119))))

(declare-fun d!82565 () Bool)

(declare-fun lt!249609 () SeekEntryResult!4987)

(get-info :version)

(assert (=> d!82565 (and (or ((_ is Undefined!4987) lt!249609) (not ((_ is Found!4987) lt!249609)) (and (bvsge (index!22176 lt!249609) #b00000000000000000000000000000000) (bvslt (index!22176 lt!249609) (size!16946 a!3118)))) (or ((_ is Undefined!4987) lt!249609) ((_ is Found!4987) lt!249609) (not ((_ is MissingZero!4987) lt!249609)) (and (bvsge (index!22175 lt!249609) #b00000000000000000000000000000000) (bvslt (index!22175 lt!249609) (size!16946 a!3118)))) (or ((_ is Undefined!4987) lt!249609) ((_ is Found!4987) lt!249609) ((_ is MissingZero!4987) lt!249609) (not ((_ is MissingVacant!4987) lt!249609)) (and (bvsge (index!22178 lt!249609) #b00000000000000000000000000000000) (bvslt (index!22178 lt!249609) (size!16946 a!3118)))) (or ((_ is Undefined!4987) lt!249609) (ite ((_ is Found!4987) lt!249609) (= (select (arr!16582 a!3118) (index!22176 lt!249609)) k0!1914) (ite ((_ is MissingZero!4987) lt!249609) (= (select (arr!16582 a!3118) (index!22175 lt!249609)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4987) lt!249609) (= (select (arr!16582 a!3118) (index!22178 lt!249609)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!316375 () SeekEntryResult!4987)

(assert (=> d!82565 (= lt!249609 e!316375)))

(declare-fun c!63570 () Bool)

(assert (=> d!82565 (= c!63570 (and ((_ is Intermediate!4987) lt!249608) (undefined!5799 lt!249608)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34519 (_ BitVec 32)) SeekEntryResult!4987)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82565 (= lt!249608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82565 (validMask!0 mask!3119)))

(assert (=> d!82565 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!249609)))

(declare-fun b!547517 () Bool)

(assert (=> b!547517 (= e!316376 (Found!4987 (index!22177 lt!249608)))))

(declare-fun b!547518 () Bool)

(assert (=> b!547518 (= e!316375 Undefined!4987)))

(declare-fun b!547519 () Bool)

(assert (=> b!547519 (= e!316375 e!316376)))

(assert (=> b!547519 (= lt!249610 (select (arr!16582 a!3118) (index!22177 lt!249608)))))

(declare-fun c!63571 () Bool)

(assert (=> b!547519 (= c!63571 (= lt!249610 k0!1914))))

(assert (= (and d!82565 c!63570) b!547518))

(assert (= (and d!82565 (not c!63570)) b!547519))

(assert (= (and b!547519 c!63571) b!547517))

(assert (= (and b!547519 (not c!63571)) b!547515))

(assert (= (and b!547515 c!63572) b!547514))

(assert (= (and b!547515 (not c!63572)) b!547516))

(declare-fun m!524967 () Bool)

(assert (=> b!547516 m!524967))

(declare-fun m!524969 () Bool)

(assert (=> d!82565 m!524969))

(declare-fun m!524971 () Bool)

(assert (=> d!82565 m!524971))

(assert (=> d!82565 m!524971))

(declare-fun m!524973 () Bool)

(assert (=> d!82565 m!524973))

(declare-fun m!524975 () Bool)

(assert (=> d!82565 m!524975))

(declare-fun m!524977 () Bool)

(assert (=> d!82565 m!524977))

(assert (=> d!82565 m!524905))

(declare-fun m!524979 () Bool)

(assert (=> b!547519 m!524979))

(assert (=> b!547422 d!82565))

(declare-fun d!82575 () Bool)

(declare-fun res!341037 () Bool)

(declare-fun e!316394 () Bool)

(assert (=> d!82575 (=> res!341037 e!316394)))

(assert (=> d!82575 (= res!341037 ((_ is Nil!10566) Nil!10566))))

(assert (=> d!82575 (= (noDuplicate!223 Nil!10566) e!316394)))

(declare-fun b!547548 () Bool)

(declare-fun e!316395 () Bool)

(assert (=> b!547548 (= e!316394 e!316395)))

(declare-fun res!341038 () Bool)

(assert (=> b!547548 (=> (not res!341038) (not e!316395))))

(declare-fun contains!2795 (List!10569 (_ BitVec 64)) Bool)

(assert (=> b!547548 (= res!341038 (not (contains!2795 (t!16789 Nil!10566) (h!11535 Nil!10566))))))

(declare-fun b!547549 () Bool)

(assert (=> b!547549 (= e!316395 (noDuplicate!223 (t!16789 Nil!10566)))))

(assert (= (and d!82575 (not res!341037)) b!547548))

(assert (= (and b!547548 res!341038) b!547549))

(declare-fun m!524981 () Bool)

(assert (=> b!547548 m!524981))

(declare-fun m!524983 () Bool)

(assert (=> b!547549 m!524983))

(assert (=> b!547427 d!82575))

(declare-fun bm!32165 () Bool)

(declare-fun call!32168 () Bool)

(assert (=> bm!32165 (= call!32168 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!547578 () Bool)

(declare-fun e!316416 () Bool)

(declare-fun e!316415 () Bool)

(assert (=> b!547578 (= e!316416 e!316415)))

(declare-fun lt!249641 () (_ BitVec 64))

(assert (=> b!547578 (= lt!249641 (select (arr!16582 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16931 0))(
  ( (Unit!16932) )
))
(declare-fun lt!249642 () Unit!16931)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34519 (_ BitVec 64) (_ BitVec 32)) Unit!16931)

(assert (=> b!547578 (= lt!249642 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249641 #b00000000000000000000000000000000))))

(assert (=> b!547578 (arrayContainsKey!0 a!3118 lt!249641 #b00000000000000000000000000000000)))

(declare-fun lt!249643 () Unit!16931)

(assert (=> b!547578 (= lt!249643 lt!249642)))

(declare-fun res!341048 () Bool)

(assert (=> b!547578 (= res!341048 (= (seekEntryOrOpen!0 (select (arr!16582 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!4987 #b00000000000000000000000000000000)))))

(assert (=> b!547578 (=> (not res!341048) (not e!316415))))

(declare-fun b!547579 () Bool)

(declare-fun e!316414 () Bool)

(assert (=> b!547579 (= e!316414 e!316416)))

(declare-fun c!63595 () Bool)

(assert (=> b!547579 (= c!63595 (validKeyInArray!0 (select (arr!16582 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!547580 () Bool)

(assert (=> b!547580 (= e!316415 call!32168)))

(declare-fun d!82577 () Bool)

(declare-fun res!341047 () Bool)

(assert (=> d!82577 (=> res!341047 e!316414)))

(assert (=> d!82577 (= res!341047 (bvsge #b00000000000000000000000000000000 (size!16946 a!3118)))))

(assert (=> d!82577 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316414)))

(declare-fun b!547581 () Bool)

(assert (=> b!547581 (= e!316416 call!32168)))

(assert (= (and d!82577 (not res!341047)) b!547579))

(assert (= (and b!547579 c!63595) b!547578))

(assert (= (and b!547579 (not c!63595)) b!547581))

(assert (= (and b!547578 res!341048) b!547580))

(assert (= (or b!547580 b!547581) bm!32165))

(declare-fun m!525013 () Bool)

(assert (=> bm!32165 m!525013))

(declare-fun m!525015 () Bool)

(assert (=> b!547578 m!525015))

(declare-fun m!525017 () Bool)

(assert (=> b!547578 m!525017))

(declare-fun m!525019 () Bool)

(assert (=> b!547578 m!525019))

(assert (=> b!547578 m!525015))

(declare-fun m!525021 () Bool)

(assert (=> b!547578 m!525021))

(assert (=> b!547579 m!525015))

(assert (=> b!547579 m!525015))

(declare-fun m!525023 () Bool)

(assert (=> b!547579 m!525023))

(assert (=> b!547424 d!82577))

(declare-fun d!82585 () Bool)

(assert (=> d!82585 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547429 d!82585))

(declare-fun d!82587 () Bool)

(declare-fun res!341055 () Bool)

(declare-fun e!316424 () Bool)

(assert (=> d!82587 (=> res!341055 e!316424)))

(assert (=> d!82587 (= res!341055 (= (select (arr!16582 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82587 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!316424)))

(declare-fun b!547590 () Bool)

(declare-fun e!316425 () Bool)

(assert (=> b!547590 (= e!316424 e!316425)))

(declare-fun res!341056 () Bool)

(assert (=> b!547590 (=> (not res!341056) (not e!316425))))

(assert (=> b!547590 (= res!341056 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16946 a!3118)))))

(declare-fun b!547591 () Bool)

(assert (=> b!547591 (= e!316425 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82587 (not res!341055)) b!547590))

(assert (= (and b!547590 res!341056) b!547591))

(assert (=> d!82587 m!525015))

(declare-fun m!525035 () Bool)

(assert (=> b!547591 m!525035))

(assert (=> b!547423 d!82587))

(check-sat (not b!547549) (not b!547591) (not b!547579) (not d!82565) (not b!547516) (not b!547548) (not bm!32165) (not b!547578))
(check-sat)
