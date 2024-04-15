; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6268 () Bool)

(assert start!6268)

(declare-fun res!25215 () Bool)

(declare-fun e!26832 () Bool)

(assert (=> start!6268 (=> (not res!25215) (not e!26832))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6268 (= res!25215 (validMask!0 mask!853))))

(assert (=> start!6268 e!26832))

(assert (=> start!6268 true))

(declare-fun b!42378 () Bool)

(declare-fun e!26833 () Bool)

(assert (=> b!42378 (= e!26832 (not e!26833))))

(declare-fun res!25216 () Bool)

(assert (=> b!42378 (=> res!25216 e!26833)))

(assert (=> b!42378 (= res!25216 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2793 0))(
  ( (array!2794 (arr!1340 (Array (_ BitVec 32) (_ BitVec 64))) (size!1513 (_ BitVec 32))) )
))
(declare-fun lt!17647 () array!2793)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2793 (_ BitVec 32)) Bool)

(assert (=> b!42378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17647 mask!853)))

(declare-datatypes ((Unit!1144 0))(
  ( (Unit!1145) )
))
(declare-fun lt!17646 () Unit!1144)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2793 (_ BitVec 32) (_ BitVec 32)) Unit!1144)

(assert (=> b!42378 (= lt!17646 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17647 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2793 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42378 (= (arrayCountValidKeys!0 lt!17647 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17648 () Unit!1144)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2793 (_ BitVec 32) (_ BitVec 32)) Unit!1144)

(assert (=> b!42378 (= lt!17648 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17647 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42378 (= lt!17647 (array!2794 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42379 () Bool)

(declare-fun e!26834 () Bool)

(assert (=> b!42379 (= e!26833 e!26834)))

(declare-fun res!25214 () Bool)

(assert (=> b!42379 (=> (not res!25214) (not e!26834))))

(declare-datatypes ((List!1135 0))(
  ( (Nil!1132) (Cons!1131 (h!1708 (_ BitVec 64)) (t!4081 List!1135)) )
))
(declare-fun contains!551 (List!1135 (_ BitVec 64)) Bool)

(assert (=> b!42379 (= res!25214 (not (contains!551 Nil!1132 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!42380 () Bool)

(assert (=> b!42380 (= e!26834 (not (contains!551 Nil!1132 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!6268 res!25215) b!42378))

(assert (= (and b!42378 (not res!25216)) b!42379))

(assert (= (and b!42379 res!25214) b!42380))

(declare-fun m!36005 () Bool)

(assert (=> start!6268 m!36005))

(declare-fun m!36007 () Bool)

(assert (=> b!42378 m!36007))

(declare-fun m!36009 () Bool)

(assert (=> b!42378 m!36009))

(declare-fun m!36011 () Bool)

(assert (=> b!42378 m!36011))

(declare-fun m!36013 () Bool)

(assert (=> b!42378 m!36013))

(declare-fun m!36015 () Bool)

(assert (=> b!42379 m!36015))

(declare-fun m!36017 () Bool)

(assert (=> b!42380 m!36017))

(check-sat (not b!42380) (not b!42379) (not b!42378) (not start!6268))
(check-sat)
(get-model)

(declare-fun d!7671 () Bool)

(declare-fun lt!17671 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!34 (List!1135) (InoxSet (_ BitVec 64)))

(assert (=> d!7671 (= lt!17671 (select (content!34 Nil!1132) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26862 () Bool)

(assert (=> d!7671 (= lt!17671 e!26862)))

(declare-fun res!25243 () Bool)

(assert (=> d!7671 (=> (not res!25243) (not e!26862))))

(get-info :version)

(assert (=> d!7671 (= res!25243 ((_ is Cons!1131) Nil!1132))))

(assert (=> d!7671 (= (contains!551 Nil!1132 #b1000000000000000000000000000000000000000000000000000000000000000) lt!17671)))

(declare-fun b!42407 () Bool)

(declare-fun e!26861 () Bool)

(assert (=> b!42407 (= e!26862 e!26861)))

(declare-fun res!25244 () Bool)

(assert (=> b!42407 (=> res!25244 e!26861)))

(assert (=> b!42407 (= res!25244 (= (h!1708 Nil!1132) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42408 () Bool)

(assert (=> b!42408 (= e!26861 (contains!551 (t!4081 Nil!1132) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7671 res!25243) b!42407))

(assert (= (and b!42407 (not res!25244)) b!42408))

(declare-fun m!36047 () Bool)

(assert (=> d!7671 m!36047))

(declare-fun m!36049 () Bool)

(assert (=> d!7671 m!36049))

(declare-fun m!36051 () Bool)

(assert (=> b!42408 m!36051))

(assert (=> b!42380 d!7671))

(declare-fun d!7677 () Bool)

(declare-fun lt!17672 () Bool)

(assert (=> d!7677 (= lt!17672 (select (content!34 Nil!1132) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26864 () Bool)

(assert (=> d!7677 (= lt!17672 e!26864)))

(declare-fun res!25245 () Bool)

(assert (=> d!7677 (=> (not res!25245) (not e!26864))))

(assert (=> d!7677 (= res!25245 ((_ is Cons!1131) Nil!1132))))

(assert (=> d!7677 (= (contains!551 Nil!1132 #b0000000000000000000000000000000000000000000000000000000000000000) lt!17672)))

(declare-fun b!42409 () Bool)

(declare-fun e!26863 () Bool)

(assert (=> b!42409 (= e!26864 e!26863)))

(declare-fun res!25246 () Bool)

(assert (=> b!42409 (=> res!25246 e!26863)))

(assert (=> b!42409 (= res!25246 (= (h!1708 Nil!1132) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42410 () Bool)

(assert (=> b!42410 (= e!26863 (contains!551 (t!4081 Nil!1132) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7677 res!25245) b!42409))

(assert (= (and b!42409 (not res!25246)) b!42410))

(assert (=> d!7677 m!36047))

(declare-fun m!36053 () Bool)

(assert (=> d!7677 m!36053))

(declare-fun m!36055 () Bool)

(assert (=> b!42410 m!36055))

(assert (=> b!42379 d!7677))

(declare-fun b!42447 () Bool)

(declare-fun e!26895 () Bool)

(declare-fun e!26896 () Bool)

(assert (=> b!42447 (= e!26895 e!26896)))

(declare-fun c!5337 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42447 (= c!5337 (validKeyInArray!0 (select (arr!1340 lt!17647) #b00000000000000000000000000000000)))))

(declare-fun d!7679 () Bool)

(declare-fun res!25271 () Bool)

(assert (=> d!7679 (=> res!25271 e!26895)))

(assert (=> d!7679 (= res!25271 (bvsge #b00000000000000000000000000000000 (size!1513 lt!17647)))))

(assert (=> d!7679 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17647 mask!853) e!26895)))

(declare-fun b!42448 () Bool)

(declare-fun e!26897 () Bool)

(declare-fun call!3334 () Bool)

(assert (=> b!42448 (= e!26897 call!3334)))

(declare-fun b!42449 () Bool)

(assert (=> b!42449 (= e!26896 e!26897)))

(declare-fun lt!17699 () (_ BitVec 64))

(assert (=> b!42449 (= lt!17699 (select (arr!1340 lt!17647) #b00000000000000000000000000000000))))

(declare-fun lt!17698 () Unit!1144)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2793 (_ BitVec 64) (_ BitVec 32)) Unit!1144)

(assert (=> b!42449 (= lt!17698 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17647 lt!17699 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42449 (arrayContainsKey!0 lt!17647 lt!17699 #b00000000000000000000000000000000)))

(declare-fun lt!17697 () Unit!1144)

(assert (=> b!42449 (= lt!17697 lt!17698)))

(declare-fun res!25272 () Bool)

(declare-datatypes ((SeekEntryResult!191 0))(
  ( (MissingZero!191 (index!2886 (_ BitVec 32))) (Found!191 (index!2887 (_ BitVec 32))) (Intermediate!191 (undefined!1003 Bool) (index!2888 (_ BitVec 32)) (x!8123 (_ BitVec 32))) (Undefined!191) (MissingVacant!191 (index!2889 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2793 (_ BitVec 32)) SeekEntryResult!191)

(assert (=> b!42449 (= res!25272 (= (seekEntryOrOpen!0 (select (arr!1340 lt!17647) #b00000000000000000000000000000000) lt!17647 mask!853) (Found!191 #b00000000000000000000000000000000)))))

(assert (=> b!42449 (=> (not res!25272) (not e!26897))))

(declare-fun b!42450 () Bool)

(assert (=> b!42450 (= e!26896 call!3334)))

(declare-fun bm!3331 () Bool)

(assert (=> bm!3331 (= call!3334 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17647 mask!853))))

(assert (= (and d!7679 (not res!25271)) b!42447))

(assert (= (and b!42447 c!5337) b!42449))

(assert (= (and b!42447 (not c!5337)) b!42450))

(assert (= (and b!42449 res!25272) b!42448))

(assert (= (or b!42448 b!42450) bm!3331))

(declare-fun m!36077 () Bool)

(assert (=> b!42447 m!36077))

(assert (=> b!42447 m!36077))

(declare-fun m!36079 () Bool)

(assert (=> b!42447 m!36079))

(assert (=> b!42449 m!36077))

(declare-fun m!36081 () Bool)

(assert (=> b!42449 m!36081))

(declare-fun m!36083 () Bool)

(assert (=> b!42449 m!36083))

(assert (=> b!42449 m!36077))

(declare-fun m!36085 () Bool)

(assert (=> b!42449 m!36085))

(declare-fun m!36087 () Bool)

(assert (=> bm!3331 m!36087))

(assert (=> b!42378 d!7679))

(declare-fun d!7689 () Bool)

(assert (=> d!7689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17647 mask!853)))

(declare-fun lt!17708 () Unit!1144)

(declare-fun choose!34 (array!2793 (_ BitVec 32) (_ BitVec 32)) Unit!1144)

(assert (=> d!7689 (= lt!17708 (choose!34 lt!17647 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7689 (validMask!0 mask!853)))

(assert (=> d!7689 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17647 mask!853 #b00000000000000000000000000000000) lt!17708)))

(declare-fun bs!1873 () Bool)

(assert (= bs!1873 d!7689))

(assert (=> bs!1873 m!36007))

(declare-fun m!36113 () Bool)

(assert (=> bs!1873 m!36113))

(assert (=> bs!1873 m!36005))

(assert (=> b!42378 d!7689))

(declare-fun bm!3340 () Bool)

(declare-fun call!3343 () (_ BitVec 32))

(assert (=> bm!3340 (= call!3343 (arrayCountValidKeys!0 lt!17647 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42483 () Bool)

(declare-fun e!26916 () (_ BitVec 32))

(assert (=> b!42483 (= e!26916 call!3343)))

(declare-fun b!42484 () Bool)

(assert (=> b!42484 (= e!26916 (bvadd #b00000000000000000000000000000001 call!3343))))

(declare-fun d!7695 () Bool)

(declare-fun lt!17721 () (_ BitVec 32))

(assert (=> d!7695 (and (bvsge lt!17721 #b00000000000000000000000000000000) (bvsle lt!17721 (bvsub (size!1513 lt!17647) #b00000000000000000000000000000000)))))

(declare-fun e!26917 () (_ BitVec 32))

(assert (=> d!7695 (= lt!17721 e!26917)))

(declare-fun c!5352 () Bool)

(assert (=> d!7695 (= c!5352 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7695 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1513 lt!17647)))))

(assert (=> d!7695 (= (arrayCountValidKeys!0 lt!17647 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17721)))

(declare-fun b!42485 () Bool)

(assert (=> b!42485 (= e!26917 #b00000000000000000000000000000000)))

(declare-fun b!42486 () Bool)

(assert (=> b!42486 (= e!26917 e!26916)))

(declare-fun c!5353 () Bool)

(assert (=> b!42486 (= c!5353 (validKeyInArray!0 (select (arr!1340 lt!17647) #b00000000000000000000000000000000)))))

(assert (= (and d!7695 c!5352) b!42485))

(assert (= (and d!7695 (not c!5352)) b!42486))

(assert (= (and b!42486 c!5353) b!42484))

(assert (= (and b!42486 (not c!5353)) b!42483))

(assert (= (or b!42484 b!42483) bm!3340))

(declare-fun m!36119 () Bool)

(assert (=> bm!3340 m!36119))

(assert (=> b!42486 m!36077))

(assert (=> b!42486 m!36077))

(assert (=> b!42486 m!36079))

(assert (=> b!42378 d!7695))

(declare-fun d!7701 () Bool)

(assert (=> d!7701 (= (arrayCountValidKeys!0 lt!17647 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17728 () Unit!1144)

(declare-fun choose!59 (array!2793 (_ BitVec 32) (_ BitVec 32)) Unit!1144)

(assert (=> d!7701 (= lt!17728 (choose!59 lt!17647 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7701 (bvslt (size!1513 lt!17647) #b01111111111111111111111111111111)))

(assert (=> d!7701 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17647 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17728)))

(declare-fun bs!1876 () Bool)

(assert (= bs!1876 d!7701))

(assert (=> bs!1876 m!36011))

(declare-fun m!36125 () Bool)

(assert (=> bs!1876 m!36125))

(assert (=> b!42378 d!7701))

(declare-fun d!7707 () Bool)

(assert (=> d!7707 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6268 d!7707))

(check-sat (not d!7671) (not bm!3331) (not b!42449) (not d!7689) (not b!42410) (not b!42447) (not b!42486) (not b!42408) (not d!7701) (not d!7677) (not bm!3340))
(check-sat)
