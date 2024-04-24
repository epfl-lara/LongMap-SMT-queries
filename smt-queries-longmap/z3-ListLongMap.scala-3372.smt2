; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46334 () Bool)

(assert start!46334)

(declare-fun b!512973 () Bool)

(declare-fun res!313513 () Bool)

(declare-fun e!299547 () Bool)

(assert (=> b!512973 (=> (not res!313513) (not e!299547))))

(declare-datatypes ((array!32932 0))(
  ( (array!32933 (arr!15841 (Array (_ BitVec 32) (_ BitVec 64))) (size!16205 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32932)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32932 (_ BitVec 32)) Bool)

(assert (=> b!512973 (= res!313513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512974 () Bool)

(declare-fun res!313512 () Bool)

(declare-fun e!299549 () Bool)

(assert (=> b!512974 (=> res!313512 e!299549)))

(declare-datatypes ((SeekEntryResult!4264 0))(
  ( (MissingZero!4264 (index!19244 (_ BitVec 32))) (Found!4264 (index!19245 (_ BitVec 32))) (Intermediate!4264 (undefined!5076 Bool) (index!19246 (_ BitVec 32)) (x!48338 (_ BitVec 32))) (Undefined!4264) (MissingVacant!4264 (index!19247 (_ BitVec 32))) )
))
(declare-fun lt!234901 () SeekEntryResult!4264)

(get-info :version)

(assert (=> b!512974 (= res!313512 (or (undefined!5076 lt!234901) (not ((_ is Intermediate!4264) lt!234901))))))

(declare-fun b!512975 () Bool)

(declare-fun res!313508 () Bool)

(assert (=> b!512975 (=> (not res!313508) (not e!299547))))

(declare-datatypes ((List!9906 0))(
  ( (Nil!9903) (Cons!9902 (h!10785 (_ BitVec 64)) (t!16126 List!9906)) )
))
(declare-fun arrayNoDuplicates!0 (array!32932 (_ BitVec 32) List!9906) Bool)

(assert (=> b!512975 (= res!313508 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9903))))

(declare-fun b!512977 () Bool)

(declare-fun e!299548 () Bool)

(assert (=> b!512977 (= e!299548 e!299547)))

(declare-fun res!313510 () Bool)

(assert (=> b!512977 (=> (not res!313510) (not e!299547))))

(declare-fun lt!234900 () SeekEntryResult!4264)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512977 (= res!313510 (or (= lt!234900 (MissingZero!4264 i!1204)) (= lt!234900 (MissingVacant!4264 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32932 (_ BitVec 32)) SeekEntryResult!4264)

(assert (=> b!512977 (= lt!234900 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512978 () Bool)

(declare-fun res!313509 () Bool)

(assert (=> b!512978 (=> (not res!313509) (not e!299548))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512978 (= res!313509 (validKeyInArray!0 (select (arr!15841 a!3235) j!176)))))

(declare-fun b!512979 () Bool)

(declare-fun res!313511 () Bool)

(assert (=> b!512979 (=> (not res!313511) (not e!299548))))

(assert (=> b!512979 (= res!313511 (validKeyInArray!0 k0!2280))))

(declare-fun e!299550 () Bool)

(declare-fun b!512980 () Bool)

(assert (=> b!512980 (= e!299550 (= (seekEntryOrOpen!0 (select (arr!15841 a!3235) j!176) a!3235 mask!3524) (Found!4264 j!176)))))

(declare-fun b!512981 () Bool)

(assert (=> b!512981 (= e!299549 (and (bvsge (index!19246 lt!234901) #b00000000000000000000000000000000) (bvslt (index!19246 lt!234901) (size!16205 a!3235))))))

(assert (=> b!512981 (bvslt (x!48338 lt!234901) #b01111111111111111111111111111110)))

(declare-fun b!512982 () Bool)

(declare-fun res!313514 () Bool)

(assert (=> b!512982 (=> (not res!313514) (not e!299548))))

(declare-fun arrayContainsKey!0 (array!32932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512982 (= res!313514 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512983 () Bool)

(declare-fun res!313516 () Bool)

(assert (=> b!512983 (=> (not res!313516) (not e!299548))))

(assert (=> b!512983 (= res!313516 (and (= (size!16205 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16205 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16205 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512976 () Bool)

(assert (=> b!512976 (= e!299547 (not e!299549))))

(declare-fun res!313506 () Bool)

(assert (=> b!512976 (=> res!313506 e!299549)))

(declare-fun lt!234899 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32932 (_ BitVec 32)) SeekEntryResult!4264)

(assert (=> b!512976 (= res!313506 (= lt!234901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234899 (select (store (arr!15841 a!3235) i!1204 k0!2280) j!176) (array!32933 (store (arr!15841 a!3235) i!1204 k0!2280) (size!16205 a!3235)) mask!3524)))))

(declare-fun lt!234898 () (_ BitVec 32))

(assert (=> b!512976 (= lt!234901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234898 (select (arr!15841 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512976 (= lt!234899 (toIndex!0 (select (store (arr!15841 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512976 (= lt!234898 (toIndex!0 (select (arr!15841 a!3235) j!176) mask!3524))))

(assert (=> b!512976 e!299550))

(declare-fun res!313515 () Bool)

(assert (=> b!512976 (=> (not res!313515) (not e!299550))))

(assert (=> b!512976 (= res!313515 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15847 0))(
  ( (Unit!15848) )
))
(declare-fun lt!234897 () Unit!15847)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15847)

(assert (=> b!512976 (= lt!234897 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!313507 () Bool)

(assert (=> start!46334 (=> (not res!313507) (not e!299548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46334 (= res!313507 (validMask!0 mask!3524))))

(assert (=> start!46334 e!299548))

(assert (=> start!46334 true))

(declare-fun array_inv!11700 (array!32932) Bool)

(assert (=> start!46334 (array_inv!11700 a!3235)))

(assert (= (and start!46334 res!313507) b!512983))

(assert (= (and b!512983 res!313516) b!512978))

(assert (= (and b!512978 res!313509) b!512979))

(assert (= (and b!512979 res!313511) b!512982))

(assert (= (and b!512982 res!313514) b!512977))

(assert (= (and b!512977 res!313510) b!512973))

(assert (= (and b!512973 res!313513) b!512975))

(assert (= (and b!512975 res!313508) b!512976))

(assert (= (and b!512976 res!313515) b!512980))

(assert (= (and b!512976 (not res!313506)) b!512974))

(assert (= (and b!512974 (not res!313512)) b!512981))

(declare-fun m!494857 () Bool)

(assert (=> start!46334 m!494857))

(declare-fun m!494859 () Bool)

(assert (=> start!46334 m!494859))

(declare-fun m!494861 () Bool)

(assert (=> b!512980 m!494861))

(assert (=> b!512980 m!494861))

(declare-fun m!494863 () Bool)

(assert (=> b!512980 m!494863))

(declare-fun m!494865 () Bool)

(assert (=> b!512977 m!494865))

(declare-fun m!494867 () Bool)

(assert (=> b!512982 m!494867))

(assert (=> b!512978 m!494861))

(assert (=> b!512978 m!494861))

(declare-fun m!494869 () Bool)

(assert (=> b!512978 m!494869))

(declare-fun m!494871 () Bool)

(assert (=> b!512976 m!494871))

(declare-fun m!494873 () Bool)

(assert (=> b!512976 m!494873))

(declare-fun m!494875 () Bool)

(assert (=> b!512976 m!494875))

(assert (=> b!512976 m!494861))

(declare-fun m!494877 () Bool)

(assert (=> b!512976 m!494877))

(assert (=> b!512976 m!494861))

(declare-fun m!494879 () Bool)

(assert (=> b!512976 m!494879))

(assert (=> b!512976 m!494861))

(declare-fun m!494881 () Bool)

(assert (=> b!512976 m!494881))

(assert (=> b!512976 m!494875))

(declare-fun m!494883 () Bool)

(assert (=> b!512976 m!494883))

(assert (=> b!512976 m!494875))

(declare-fun m!494885 () Bool)

(assert (=> b!512976 m!494885))

(declare-fun m!494887 () Bool)

(assert (=> b!512979 m!494887))

(declare-fun m!494889 () Bool)

(assert (=> b!512973 m!494889))

(declare-fun m!494891 () Bool)

(assert (=> b!512975 m!494891))

(check-sat (not b!512977) (not b!512980) (not b!512976) (not b!512973) (not b!512978) (not start!46334) (not b!512975) (not b!512982) (not b!512979))
(check-sat)
(get-model)

(declare-fun d!79115 () Bool)

(declare-fun res!313587 () Bool)

(declare-fun e!299585 () Bool)

(assert (=> d!79115 (=> res!313587 e!299585)))

(assert (=> d!79115 (= res!313587 (= (select (arr!15841 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79115 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!299585)))

(declare-fun b!513054 () Bool)

(declare-fun e!299586 () Bool)

(assert (=> b!513054 (= e!299585 e!299586)))

(declare-fun res!313588 () Bool)

(assert (=> b!513054 (=> (not res!313588) (not e!299586))))

(assert (=> b!513054 (= res!313588 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16205 a!3235)))))

(declare-fun b!513055 () Bool)

(assert (=> b!513055 (= e!299586 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79115 (not res!313587)) b!513054))

(assert (= (and b!513054 res!313588) b!513055))

(declare-fun m!494965 () Bool)

(assert (=> d!79115 m!494965))

(declare-fun m!494967 () Bool)

(assert (=> b!513055 m!494967))

(assert (=> b!512982 d!79115))

(declare-fun b!513068 () Bool)

(declare-fun e!299593 () SeekEntryResult!4264)

(declare-fun lt!234938 () SeekEntryResult!4264)

(assert (=> b!513068 (= e!299593 (Found!4264 (index!19246 lt!234938)))))

(declare-fun d!79117 () Bool)

(declare-fun lt!234940 () SeekEntryResult!4264)

(assert (=> d!79117 (and (or ((_ is Undefined!4264) lt!234940) (not ((_ is Found!4264) lt!234940)) (and (bvsge (index!19245 lt!234940) #b00000000000000000000000000000000) (bvslt (index!19245 lt!234940) (size!16205 a!3235)))) (or ((_ is Undefined!4264) lt!234940) ((_ is Found!4264) lt!234940) (not ((_ is MissingZero!4264) lt!234940)) (and (bvsge (index!19244 lt!234940) #b00000000000000000000000000000000) (bvslt (index!19244 lt!234940) (size!16205 a!3235)))) (or ((_ is Undefined!4264) lt!234940) ((_ is Found!4264) lt!234940) ((_ is MissingZero!4264) lt!234940) (not ((_ is MissingVacant!4264) lt!234940)) (and (bvsge (index!19247 lt!234940) #b00000000000000000000000000000000) (bvslt (index!19247 lt!234940) (size!16205 a!3235)))) (or ((_ is Undefined!4264) lt!234940) (ite ((_ is Found!4264) lt!234940) (= (select (arr!15841 a!3235) (index!19245 lt!234940)) k0!2280) (ite ((_ is MissingZero!4264) lt!234940) (= (select (arr!15841 a!3235) (index!19244 lt!234940)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4264) lt!234940) (= (select (arr!15841 a!3235) (index!19247 lt!234940)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!299594 () SeekEntryResult!4264)

(assert (=> d!79117 (= lt!234940 e!299594)))

(declare-fun c!60023 () Bool)

(assert (=> d!79117 (= c!60023 (and ((_ is Intermediate!4264) lt!234938) (undefined!5076 lt!234938)))))

(assert (=> d!79117 (= lt!234938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79117 (validMask!0 mask!3524)))

(assert (=> d!79117 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!234940)))

(declare-fun b!513069 () Bool)

(declare-fun c!60022 () Bool)

(declare-fun lt!234939 () (_ BitVec 64))

(assert (=> b!513069 (= c!60022 (= lt!234939 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299595 () SeekEntryResult!4264)

(assert (=> b!513069 (= e!299593 e!299595)))

(declare-fun b!513070 () Bool)

(assert (=> b!513070 (= e!299595 (MissingZero!4264 (index!19246 lt!234938)))))

(declare-fun b!513071 () Bool)

(assert (=> b!513071 (= e!299594 e!299593)))

(assert (=> b!513071 (= lt!234939 (select (arr!15841 a!3235) (index!19246 lt!234938)))))

(declare-fun c!60021 () Bool)

(assert (=> b!513071 (= c!60021 (= lt!234939 k0!2280))))

(declare-fun b!513072 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32932 (_ BitVec 32)) SeekEntryResult!4264)

(assert (=> b!513072 (= e!299595 (seekKeyOrZeroReturnVacant!0 (x!48338 lt!234938) (index!19246 lt!234938) (index!19246 lt!234938) k0!2280 a!3235 mask!3524))))

(declare-fun b!513073 () Bool)

(assert (=> b!513073 (= e!299594 Undefined!4264)))

(assert (= (and d!79117 c!60023) b!513073))

(assert (= (and d!79117 (not c!60023)) b!513071))

(assert (= (and b!513071 c!60021) b!513068))

(assert (= (and b!513071 (not c!60021)) b!513069))

(assert (= (and b!513069 c!60022) b!513070))

(assert (= (and b!513069 (not c!60022)) b!513072))

(declare-fun m!494969 () Bool)

(assert (=> d!79117 m!494969))

(declare-fun m!494971 () Bool)

(assert (=> d!79117 m!494971))

(declare-fun m!494973 () Bool)

(assert (=> d!79117 m!494973))

(declare-fun m!494975 () Bool)

(assert (=> d!79117 m!494975))

(assert (=> d!79117 m!494973))

(declare-fun m!494977 () Bool)

(assert (=> d!79117 m!494977))

(assert (=> d!79117 m!494857))

(declare-fun m!494979 () Bool)

(assert (=> b!513071 m!494979))

(declare-fun m!494981 () Bool)

(assert (=> b!513072 m!494981))

(assert (=> b!512977 d!79117))

(declare-fun d!79119 () Bool)

(assert (=> d!79119 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46334 d!79119))

(declare-fun d!79125 () Bool)

(assert (=> d!79125 (= (array_inv!11700 a!3235) (bvsge (size!16205 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46334 d!79125))

(declare-fun d!79127 () Bool)

(assert (=> d!79127 (= (validKeyInArray!0 (select (arr!15841 a!3235) j!176)) (and (not (= (select (arr!15841 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15841 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512978 d!79127))

(declare-fun b!513103 () Bool)

(declare-fun e!299621 () Bool)

(declare-fun e!299622 () Bool)

(assert (=> b!513103 (= e!299621 e!299622)))

(declare-fun c!60029 () Bool)

(assert (=> b!513103 (= c!60029 (validKeyInArray!0 (select (arr!15841 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79129 () Bool)

(declare-fun res!313609 () Bool)

(assert (=> d!79129 (=> res!313609 e!299621)))

(assert (=> d!79129 (= res!313609 (bvsge #b00000000000000000000000000000000 (size!16205 a!3235)))))

(assert (=> d!79129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299621)))

(declare-fun b!513104 () Bool)

(declare-fun call!31527 () Bool)

(assert (=> b!513104 (= e!299622 call!31527)))

(declare-fun b!513105 () Bool)

(declare-fun e!299620 () Bool)

(assert (=> b!513105 (= e!299620 call!31527)))

(declare-fun b!513106 () Bool)

(assert (=> b!513106 (= e!299622 e!299620)))

(declare-fun lt!234948 () (_ BitVec 64))

(assert (=> b!513106 (= lt!234948 (select (arr!15841 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!234947 () Unit!15847)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32932 (_ BitVec 64) (_ BitVec 32)) Unit!15847)

(assert (=> b!513106 (= lt!234947 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234948 #b00000000000000000000000000000000))))

(assert (=> b!513106 (arrayContainsKey!0 a!3235 lt!234948 #b00000000000000000000000000000000)))

(declare-fun lt!234949 () Unit!15847)

(assert (=> b!513106 (= lt!234949 lt!234947)))

(declare-fun res!313608 () Bool)

(assert (=> b!513106 (= res!313608 (= (seekEntryOrOpen!0 (select (arr!15841 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4264 #b00000000000000000000000000000000)))))

(assert (=> b!513106 (=> (not res!313608) (not e!299620))))

(declare-fun bm!31524 () Bool)

(assert (=> bm!31524 (= call!31527 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79129 (not res!313609)) b!513103))

(assert (= (and b!513103 c!60029) b!513106))

(assert (= (and b!513103 (not c!60029)) b!513104))

(assert (= (and b!513106 res!313608) b!513105))

(assert (= (or b!513105 b!513104) bm!31524))

(assert (=> b!513103 m!494965))

(assert (=> b!513103 m!494965))

(declare-fun m!494993 () Bool)

(assert (=> b!513103 m!494993))

(assert (=> b!513106 m!494965))

(declare-fun m!494995 () Bool)

(assert (=> b!513106 m!494995))

(declare-fun m!494997 () Bool)

(assert (=> b!513106 m!494997))

(assert (=> b!513106 m!494965))

(declare-fun m!494999 () Bool)

(assert (=> b!513106 m!494999))

(declare-fun m!495001 () Bool)

(assert (=> bm!31524 m!495001))

(assert (=> b!512973 d!79129))

(declare-fun d!79135 () Bool)

(assert (=> d!79135 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512979 d!79135))

(declare-fun b!513123 () Bool)

(declare-fun e!299631 () SeekEntryResult!4264)

(declare-fun lt!234956 () SeekEntryResult!4264)

(assert (=> b!513123 (= e!299631 (Found!4264 (index!19246 lt!234956)))))

(declare-fun d!79137 () Bool)

(declare-fun lt!234958 () SeekEntryResult!4264)

(assert (=> d!79137 (and (or ((_ is Undefined!4264) lt!234958) (not ((_ is Found!4264) lt!234958)) (and (bvsge (index!19245 lt!234958) #b00000000000000000000000000000000) (bvslt (index!19245 lt!234958) (size!16205 a!3235)))) (or ((_ is Undefined!4264) lt!234958) ((_ is Found!4264) lt!234958) (not ((_ is MissingZero!4264) lt!234958)) (and (bvsge (index!19244 lt!234958) #b00000000000000000000000000000000) (bvslt (index!19244 lt!234958) (size!16205 a!3235)))) (or ((_ is Undefined!4264) lt!234958) ((_ is Found!4264) lt!234958) ((_ is MissingZero!4264) lt!234958) (not ((_ is MissingVacant!4264) lt!234958)) (and (bvsge (index!19247 lt!234958) #b00000000000000000000000000000000) (bvslt (index!19247 lt!234958) (size!16205 a!3235)))) (or ((_ is Undefined!4264) lt!234958) (ite ((_ is Found!4264) lt!234958) (= (select (arr!15841 a!3235) (index!19245 lt!234958)) (select (arr!15841 a!3235) j!176)) (ite ((_ is MissingZero!4264) lt!234958) (= (select (arr!15841 a!3235) (index!19244 lt!234958)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4264) lt!234958) (= (select (arr!15841 a!3235) (index!19247 lt!234958)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!299632 () SeekEntryResult!4264)

(assert (=> d!79137 (= lt!234958 e!299632)))

(declare-fun c!60038 () Bool)

(assert (=> d!79137 (= c!60038 (and ((_ is Intermediate!4264) lt!234956) (undefined!5076 lt!234956)))))

(assert (=> d!79137 (= lt!234956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15841 a!3235) j!176) mask!3524) (select (arr!15841 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79137 (validMask!0 mask!3524)))

(assert (=> d!79137 (= (seekEntryOrOpen!0 (select (arr!15841 a!3235) j!176) a!3235 mask!3524) lt!234958)))

(declare-fun b!513124 () Bool)

(declare-fun c!60037 () Bool)

(declare-fun lt!234957 () (_ BitVec 64))

(assert (=> b!513124 (= c!60037 (= lt!234957 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299633 () SeekEntryResult!4264)

(assert (=> b!513124 (= e!299631 e!299633)))

(declare-fun b!513125 () Bool)

(assert (=> b!513125 (= e!299633 (MissingZero!4264 (index!19246 lt!234956)))))

(declare-fun b!513126 () Bool)

(assert (=> b!513126 (= e!299632 e!299631)))

(assert (=> b!513126 (= lt!234957 (select (arr!15841 a!3235) (index!19246 lt!234956)))))

(declare-fun c!60036 () Bool)

(assert (=> b!513126 (= c!60036 (= lt!234957 (select (arr!15841 a!3235) j!176)))))

(declare-fun b!513127 () Bool)

(assert (=> b!513127 (= e!299633 (seekKeyOrZeroReturnVacant!0 (x!48338 lt!234956) (index!19246 lt!234956) (index!19246 lt!234956) (select (arr!15841 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!513128 () Bool)

(assert (=> b!513128 (= e!299632 Undefined!4264)))

(assert (= (and d!79137 c!60038) b!513128))

(assert (= (and d!79137 (not c!60038)) b!513126))

(assert (= (and b!513126 c!60036) b!513123))

(assert (= (and b!513126 (not c!60036)) b!513124))

(assert (= (and b!513124 c!60037) b!513125))

(assert (= (and b!513124 (not c!60037)) b!513127))

(declare-fun m!495003 () Bool)

(assert (=> d!79137 m!495003))

(declare-fun m!495005 () Bool)

(assert (=> d!79137 m!495005))

(assert (=> d!79137 m!494879))

(assert (=> d!79137 m!494861))

(declare-fun m!495007 () Bool)

(assert (=> d!79137 m!495007))

(assert (=> d!79137 m!494861))

(assert (=> d!79137 m!494879))

(declare-fun m!495009 () Bool)

(assert (=> d!79137 m!495009))

(assert (=> d!79137 m!494857))

(declare-fun m!495011 () Bool)

(assert (=> b!513126 m!495011))

(assert (=> b!513127 m!494861))

(declare-fun m!495013 () Bool)

(assert (=> b!513127 m!495013))

(assert (=> b!512980 d!79137))

(declare-fun b!513153 () Bool)

(declare-fun e!299654 () Bool)

(declare-fun e!299652 () Bool)

(assert (=> b!513153 (= e!299654 e!299652)))

(declare-fun res!313624 () Bool)

(assert (=> b!513153 (=> (not res!313624) (not e!299652))))

(declare-fun e!299653 () Bool)

(assert (=> b!513153 (= res!313624 (not e!299653))))

(declare-fun res!313622 () Bool)

(assert (=> b!513153 (=> (not res!313622) (not e!299653))))

(assert (=> b!513153 (= res!313622 (validKeyInArray!0 (select (arr!15841 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513154 () Bool)

(declare-fun e!299655 () Bool)

(declare-fun call!31533 () Bool)

(assert (=> b!513154 (= e!299655 call!31533)))

(declare-fun b!513155 () Bool)

(assert (=> b!513155 (= e!299655 call!31533)))

(declare-fun d!79139 () Bool)

(declare-fun res!313623 () Bool)

(assert (=> d!79139 (=> res!313623 e!299654)))

(assert (=> d!79139 (= res!313623 (bvsge #b00000000000000000000000000000000 (size!16205 a!3235)))))

(assert (=> d!79139 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9903) e!299654)))

(declare-fun b!513156 () Bool)

(assert (=> b!513156 (= e!299652 e!299655)))

(declare-fun c!60047 () Bool)

(assert (=> b!513156 (= c!60047 (validKeyInArray!0 (select (arr!15841 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31530 () Bool)

(assert (=> bm!31530 (= call!31533 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60047 (Cons!9902 (select (arr!15841 a!3235) #b00000000000000000000000000000000) Nil!9903) Nil!9903)))))

(declare-fun b!513157 () Bool)

(declare-fun contains!2706 (List!9906 (_ BitVec 64)) Bool)

(assert (=> b!513157 (= e!299653 (contains!2706 Nil!9903 (select (arr!15841 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79139 (not res!313623)) b!513153))

(assert (= (and b!513153 res!313622) b!513157))

(assert (= (and b!513153 res!313624) b!513156))

(assert (= (and b!513156 c!60047) b!513155))

(assert (= (and b!513156 (not c!60047)) b!513154))

(assert (= (or b!513155 b!513154) bm!31530))

(assert (=> b!513153 m!494965))

(assert (=> b!513153 m!494965))

(assert (=> b!513153 m!494993))

(assert (=> b!513156 m!494965))

(assert (=> b!513156 m!494965))

(assert (=> b!513156 m!494993))

(assert (=> bm!31530 m!494965))

(declare-fun m!495035 () Bool)

(assert (=> bm!31530 m!495035))

(assert (=> b!513157 m!494965))

(assert (=> b!513157 m!494965))

(declare-fun m!495037 () Bool)

(assert (=> b!513157 m!495037))

(assert (=> b!512975 d!79139))

(declare-fun lt!234990 () SeekEntryResult!4264)

(declare-fun b!513227 () Bool)

(assert (=> b!513227 (and (bvsge (index!19246 lt!234990) #b00000000000000000000000000000000) (bvslt (index!19246 lt!234990) (size!16205 (array!32933 (store (arr!15841 a!3235) i!1204 k0!2280) (size!16205 a!3235)))))))

(declare-fun e!299700 () Bool)

(assert (=> b!513227 (= e!299700 (= (select (arr!15841 (array!32933 (store (arr!15841 a!3235) i!1204 k0!2280) (size!16205 a!3235))) (index!19246 lt!234990)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!79147 () Bool)

(declare-fun e!299702 () Bool)

(assert (=> d!79147 e!299702))

(declare-fun c!60074 () Bool)

(assert (=> d!79147 (= c!60074 (and ((_ is Intermediate!4264) lt!234990) (undefined!5076 lt!234990)))))

(declare-fun e!299699 () SeekEntryResult!4264)

(assert (=> d!79147 (= lt!234990 e!299699)))

(declare-fun c!60073 () Bool)

(assert (=> d!79147 (= c!60073 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!234991 () (_ BitVec 64))

(assert (=> d!79147 (= lt!234991 (select (arr!15841 (array!32933 (store (arr!15841 a!3235) i!1204 k0!2280) (size!16205 a!3235))) lt!234899))))

(assert (=> d!79147 (validMask!0 mask!3524)))

(assert (=> d!79147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234899 (select (store (arr!15841 a!3235) i!1204 k0!2280) j!176) (array!32933 (store (arr!15841 a!3235) i!1204 k0!2280) (size!16205 a!3235)) mask!3524) lt!234990)))

(declare-fun b!513228 () Bool)

(assert (=> b!513228 (= e!299702 (bvsge (x!48338 lt!234990) #b01111111111111111111111111111110))))

(declare-fun b!513229 () Bool)

(assert (=> b!513229 (= e!299699 (Intermediate!4264 true lt!234899 #b00000000000000000000000000000000))))

(declare-fun b!513230 () Bool)

(assert (=> b!513230 (and (bvsge (index!19246 lt!234990) #b00000000000000000000000000000000) (bvslt (index!19246 lt!234990) (size!16205 (array!32933 (store (arr!15841 a!3235) i!1204 k0!2280) (size!16205 a!3235)))))))

(declare-fun res!313649 () Bool)

(assert (=> b!513230 (= res!313649 (= (select (arr!15841 (array!32933 (store (arr!15841 a!3235) i!1204 k0!2280) (size!16205 a!3235))) (index!19246 lt!234990)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513230 (=> res!313649 e!299700)))

(declare-fun b!513231 () Bool)

(assert (=> b!513231 (and (bvsge (index!19246 lt!234990) #b00000000000000000000000000000000) (bvslt (index!19246 lt!234990) (size!16205 (array!32933 (store (arr!15841 a!3235) i!1204 k0!2280) (size!16205 a!3235)))))))

(declare-fun res!313648 () Bool)

(assert (=> b!513231 (= res!313648 (= (select (arr!15841 (array!32933 (store (arr!15841 a!3235) i!1204 k0!2280) (size!16205 a!3235))) (index!19246 lt!234990)) (select (store (arr!15841 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!513231 (=> res!313648 e!299700)))

(declare-fun e!299703 () Bool)

(assert (=> b!513231 (= e!299703 e!299700)))

(declare-fun b!513232 () Bool)

(declare-fun e!299701 () SeekEntryResult!4264)

(assert (=> b!513232 (= e!299701 (Intermediate!4264 false lt!234899 #b00000000000000000000000000000000))))

(declare-fun b!513233 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513233 (= e!299701 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234899 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!15841 a!3235) i!1204 k0!2280) j!176) (array!32933 (store (arr!15841 a!3235) i!1204 k0!2280) (size!16205 a!3235)) mask!3524))))

(declare-fun b!513234 () Bool)

(assert (=> b!513234 (= e!299699 e!299701)))

(declare-fun c!60072 () Bool)

(assert (=> b!513234 (= c!60072 (or (= lt!234991 (select (store (arr!15841 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!234991 lt!234991) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513235 () Bool)

(assert (=> b!513235 (= e!299702 e!299703)))

(declare-fun res!313647 () Bool)

(assert (=> b!513235 (= res!313647 (and ((_ is Intermediate!4264) lt!234990) (not (undefined!5076 lt!234990)) (bvslt (x!48338 lt!234990) #b01111111111111111111111111111110) (bvsge (x!48338 lt!234990) #b00000000000000000000000000000000) (bvsge (x!48338 lt!234990) #b00000000000000000000000000000000)))))

(assert (=> b!513235 (=> (not res!313647) (not e!299703))))

(assert (= (and d!79147 c!60073) b!513229))

(assert (= (and d!79147 (not c!60073)) b!513234))

(assert (= (and b!513234 c!60072) b!513232))

(assert (= (and b!513234 (not c!60072)) b!513233))

(assert (= (and d!79147 c!60074) b!513228))

(assert (= (and d!79147 (not c!60074)) b!513235))

(assert (= (and b!513235 res!313647) b!513231))

(assert (= (and b!513231 (not res!313648)) b!513230))

(assert (= (and b!513230 (not res!313649)) b!513227))

(declare-fun m!495089 () Bool)

(assert (=> d!79147 m!495089))

(assert (=> d!79147 m!494857))

(declare-fun m!495091 () Bool)

(assert (=> b!513227 m!495091))

(assert (=> b!513231 m!495091))

(assert (=> b!513230 m!495091))

(declare-fun m!495093 () Bool)

(assert (=> b!513233 m!495093))

(assert (=> b!513233 m!495093))

(assert (=> b!513233 m!494875))

(declare-fun m!495095 () Bool)

(assert (=> b!513233 m!495095))

(assert (=> b!512976 d!79147))

(declare-fun d!79167 () Bool)

(declare-fun lt!235009 () (_ BitVec 32))

(declare-fun lt!235008 () (_ BitVec 32))

(assert (=> d!79167 (= lt!235009 (bvmul (bvxor lt!235008 (bvlshr lt!235008 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79167 (= lt!235008 ((_ extract 31 0) (bvand (bvxor (select (arr!15841 a!3235) j!176) (bvlshr (select (arr!15841 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79167 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313650 (let ((h!10789 ((_ extract 31 0) (bvand (bvxor (select (arr!15841 a!3235) j!176) (bvlshr (select (arr!15841 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48343 (bvmul (bvxor h!10789 (bvlshr h!10789 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48343 (bvlshr x!48343 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313650 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313650 #b00000000000000000000000000000000))))))

(assert (=> d!79167 (= (toIndex!0 (select (arr!15841 a!3235) j!176) mask!3524) (bvand (bvxor lt!235009 (bvlshr lt!235009 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512976 d!79167))

(declare-fun b!513244 () Bool)

(declare-fun e!299711 () Bool)

(declare-fun e!299712 () Bool)

(assert (=> b!513244 (= e!299711 e!299712)))

(declare-fun c!60077 () Bool)

(assert (=> b!513244 (= c!60077 (validKeyInArray!0 (select (arr!15841 a!3235) j!176)))))

(declare-fun d!79171 () Bool)

(declare-fun res!313656 () Bool)

(assert (=> d!79171 (=> res!313656 e!299711)))

(assert (=> d!79171 (= res!313656 (bvsge j!176 (size!16205 a!3235)))))

(assert (=> d!79171 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299711)))

(declare-fun b!513245 () Bool)

(declare-fun call!31539 () Bool)

(assert (=> b!513245 (= e!299712 call!31539)))

(declare-fun b!513246 () Bool)

(declare-fun e!299710 () Bool)

(assert (=> b!513246 (= e!299710 call!31539)))

(declare-fun b!513247 () Bool)

(assert (=> b!513247 (= e!299712 e!299710)))

(declare-fun lt!235011 () (_ BitVec 64))

(assert (=> b!513247 (= lt!235011 (select (arr!15841 a!3235) j!176))))

(declare-fun lt!235010 () Unit!15847)

(assert (=> b!513247 (= lt!235010 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235011 j!176))))

(assert (=> b!513247 (arrayContainsKey!0 a!3235 lt!235011 #b00000000000000000000000000000000)))

(declare-fun lt!235012 () Unit!15847)

(assert (=> b!513247 (= lt!235012 lt!235010)))

(declare-fun res!313655 () Bool)

(assert (=> b!513247 (= res!313655 (= (seekEntryOrOpen!0 (select (arr!15841 a!3235) j!176) a!3235 mask!3524) (Found!4264 j!176)))))

(assert (=> b!513247 (=> (not res!313655) (not e!299710))))

(declare-fun bm!31536 () Bool)

(assert (=> bm!31536 (= call!31539 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79171 (not res!313656)) b!513244))

(assert (= (and b!513244 c!60077) b!513247))

(assert (= (and b!513244 (not c!60077)) b!513245))

(assert (= (and b!513247 res!313655) b!513246))

(assert (= (or b!513246 b!513245) bm!31536))

(assert (=> b!513244 m!494861))

(assert (=> b!513244 m!494861))

(assert (=> b!513244 m!494869))

(assert (=> b!513247 m!494861))

(declare-fun m!495097 () Bool)

(assert (=> b!513247 m!495097))

(declare-fun m!495099 () Bool)

(assert (=> b!513247 m!495099))

(assert (=> b!513247 m!494861))

(assert (=> b!513247 m!494863))

(declare-fun m!495101 () Bool)

(assert (=> bm!31536 m!495101))

(assert (=> b!512976 d!79171))

(declare-fun d!79173 () Bool)

(assert (=> d!79173 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235021 () Unit!15847)

(declare-fun choose!38 (array!32932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15847)

(assert (=> d!79173 (= lt!235021 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79173 (validMask!0 mask!3524)))

(assert (=> d!79173 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235021)))

(declare-fun bs!16262 () Bool)

(assert (= bs!16262 d!79173))

(assert (=> bs!16262 m!494881))

(declare-fun m!495117 () Bool)

(assert (=> bs!16262 m!495117))

(assert (=> bs!16262 m!494857))

(assert (=> b!512976 d!79173))

(declare-fun d!79179 () Bool)

(declare-fun lt!235023 () (_ BitVec 32))

(declare-fun lt!235022 () (_ BitVec 32))

(assert (=> d!79179 (= lt!235023 (bvmul (bvxor lt!235022 (bvlshr lt!235022 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79179 (= lt!235022 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15841 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15841 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79179 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313650 (let ((h!10789 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15841 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15841 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48343 (bvmul (bvxor h!10789 (bvlshr h!10789 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48343 (bvlshr x!48343 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313650 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313650 #b00000000000000000000000000000000))))))

(assert (=> d!79179 (= (toIndex!0 (select (store (arr!15841 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!235023 (bvlshr lt!235023 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512976 d!79179))

(declare-fun b!513256 () Bool)

(declare-fun lt!235024 () SeekEntryResult!4264)

(assert (=> b!513256 (and (bvsge (index!19246 lt!235024) #b00000000000000000000000000000000) (bvslt (index!19246 lt!235024) (size!16205 a!3235)))))

(declare-fun e!299720 () Bool)

(assert (=> b!513256 (= e!299720 (= (select (arr!15841 a!3235) (index!19246 lt!235024)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!79181 () Bool)

(declare-fun e!299722 () Bool)

(assert (=> d!79181 e!299722))

(declare-fun c!60082 () Bool)

(assert (=> d!79181 (= c!60082 (and ((_ is Intermediate!4264) lt!235024) (undefined!5076 lt!235024)))))

(declare-fun e!299719 () SeekEntryResult!4264)

(assert (=> d!79181 (= lt!235024 e!299719)))

(declare-fun c!60081 () Bool)

(assert (=> d!79181 (= c!60081 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235025 () (_ BitVec 64))

(assert (=> d!79181 (= lt!235025 (select (arr!15841 a!3235) lt!234898))))

(assert (=> d!79181 (validMask!0 mask!3524)))

(assert (=> d!79181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234898 (select (arr!15841 a!3235) j!176) a!3235 mask!3524) lt!235024)))

(declare-fun b!513257 () Bool)

(assert (=> b!513257 (= e!299722 (bvsge (x!48338 lt!235024) #b01111111111111111111111111111110))))

(declare-fun b!513258 () Bool)

(assert (=> b!513258 (= e!299719 (Intermediate!4264 true lt!234898 #b00000000000000000000000000000000))))

(declare-fun b!513259 () Bool)

(assert (=> b!513259 (and (bvsge (index!19246 lt!235024) #b00000000000000000000000000000000) (bvslt (index!19246 lt!235024) (size!16205 a!3235)))))

(declare-fun res!313663 () Bool)

(assert (=> b!513259 (= res!313663 (= (select (arr!15841 a!3235) (index!19246 lt!235024)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513259 (=> res!313663 e!299720)))

(declare-fun b!513260 () Bool)

(assert (=> b!513260 (and (bvsge (index!19246 lt!235024) #b00000000000000000000000000000000) (bvslt (index!19246 lt!235024) (size!16205 a!3235)))))

(declare-fun res!313662 () Bool)

(assert (=> b!513260 (= res!313662 (= (select (arr!15841 a!3235) (index!19246 lt!235024)) (select (arr!15841 a!3235) j!176)))))

(assert (=> b!513260 (=> res!313662 e!299720)))

(declare-fun e!299723 () Bool)

(assert (=> b!513260 (= e!299723 e!299720)))

(declare-fun b!513261 () Bool)

(declare-fun e!299721 () SeekEntryResult!4264)

(assert (=> b!513261 (= e!299721 (Intermediate!4264 false lt!234898 #b00000000000000000000000000000000))))

(declare-fun b!513262 () Bool)

(assert (=> b!513262 (= e!299721 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234898 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15841 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!513263 () Bool)

(assert (=> b!513263 (= e!299719 e!299721)))

(declare-fun c!60080 () Bool)

(assert (=> b!513263 (= c!60080 (or (= lt!235025 (select (arr!15841 a!3235) j!176)) (= (bvadd lt!235025 lt!235025) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513264 () Bool)

(assert (=> b!513264 (= e!299722 e!299723)))

(declare-fun res!313661 () Bool)

(assert (=> b!513264 (= res!313661 (and ((_ is Intermediate!4264) lt!235024) (not (undefined!5076 lt!235024)) (bvslt (x!48338 lt!235024) #b01111111111111111111111111111110) (bvsge (x!48338 lt!235024) #b00000000000000000000000000000000) (bvsge (x!48338 lt!235024) #b00000000000000000000000000000000)))))

(assert (=> b!513264 (=> (not res!313661) (not e!299723))))

(assert (= (and d!79181 c!60081) b!513258))

(assert (= (and d!79181 (not c!60081)) b!513263))

(assert (= (and b!513263 c!60080) b!513261))

(assert (= (and b!513263 (not c!60080)) b!513262))

(assert (= (and d!79181 c!60082) b!513257))

(assert (= (and d!79181 (not c!60082)) b!513264))

(assert (= (and b!513264 res!313661) b!513260))

(assert (= (and b!513260 (not res!313662)) b!513259))

(assert (= (and b!513259 (not res!313663)) b!513256))

(declare-fun m!495119 () Bool)

(assert (=> d!79181 m!495119))

(assert (=> d!79181 m!494857))

(declare-fun m!495121 () Bool)

(assert (=> b!513256 m!495121))

(assert (=> b!513260 m!495121))

(assert (=> b!513259 m!495121))

(declare-fun m!495123 () Bool)

(assert (=> b!513262 m!495123))

(assert (=> b!513262 m!495123))

(assert (=> b!513262 m!494861))

(declare-fun m!495125 () Bool)

(assert (=> b!513262 m!495125))

(assert (=> b!512976 d!79181))

(check-sat (not b!513055) (not d!79137) (not b!513262) (not b!513233) (not d!79147) (not bm!31530) (not d!79117) (not b!513247) (not b!513072) (not b!513156) (not b!513153) (not d!79173) (not b!513103) (not d!79181) (not bm!31524) (not b!513127) (not b!513106) (not bm!31536) (not b!513157) (not b!513244))
(check-sat)
