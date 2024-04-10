; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6196 () Bool)

(assert start!6196)

(declare-fun res!25173 () Bool)

(declare-fun e!26764 () Bool)

(assert (=> start!6196 (=> (not res!25173) (not e!26764))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6196 (= res!25173 (validMask!0 mask!853))))

(assert (=> start!6196 e!26764))

(assert (=> start!6196 true))

(declare-fun b!42283 () Bool)

(assert (=> b!42283 (= e!26764 (not (bvslt (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111)))))

(declare-datatypes ((array!2801 0))(
  ( (array!2802 (arr!1344 (Array (_ BitVec 32) (_ BitVec 64))) (size!1511 (_ BitVec 32))) )
))
(declare-fun lt!17475 () array!2801)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2801 (_ BitVec 32)) Bool)

(assert (=> b!42283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17475 mask!853)))

(declare-datatypes ((Unit!1119 0))(
  ( (Unit!1120) )
))
(declare-fun lt!17476 () Unit!1119)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2801 (_ BitVec 32) (_ BitVec 32)) Unit!1119)

(assert (=> b!42283 (= lt!17476 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17475 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2801 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42283 (= (arrayCountValidKeys!0 lt!17475 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17477 () Unit!1119)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2801 (_ BitVec 32) (_ BitVec 32)) Unit!1119)

(assert (=> b!42283 (= lt!17477 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17475 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42283 (= lt!17475 (array!2802 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6196 res!25173) b!42283))

(declare-fun m!35903 () Bool)

(assert (=> start!6196 m!35903))

(declare-fun m!35905 () Bool)

(assert (=> b!42283 m!35905))

(declare-fun m!35907 () Bool)

(assert (=> b!42283 m!35907))

(declare-fun m!35909 () Bool)

(assert (=> b!42283 m!35909))

(declare-fun m!35911 () Bool)

(assert (=> b!42283 m!35911))

(push 1)

(assert (not start!6196))

(assert (not b!42283))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7645 () Bool)

(assert (=> d!7645 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6196 d!7645))

(declare-fun b!42306 () Bool)

(declare-fun e!26785 () Bool)

(declare-fun e!26784 () Bool)

(assert (=> b!42306 (= e!26785 e!26784)))

(declare-fun c!5308 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42306 (= c!5308 (validKeyInArray!0 (select (arr!1344 lt!17475) #b00000000000000000000000000000000)))))

(declare-fun b!42307 () Bool)

(declare-fun call!3301 () Bool)

(assert (=> b!42307 (= e!26784 call!3301)))

(declare-fun b!42308 () Bool)

(declare-fun e!26783 () Bool)

(assert (=> b!42308 (= e!26784 e!26783)))

(declare-fun lt!17510 () (_ BitVec 64))

(assert (=> b!42308 (= lt!17510 (select (arr!1344 lt!17475) #b00000000000000000000000000000000))))

(declare-fun lt!17509 () Unit!1119)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2801 (_ BitVec 64) (_ BitVec 32)) Unit!1119)

(assert (=> b!42308 (= lt!17509 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17475 lt!17510 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42308 (arrayContainsKey!0 lt!17475 lt!17510 #b00000000000000000000000000000000)))

(declare-fun lt!17508 () Unit!1119)

(assert (=> b!42308 (= lt!17508 lt!17509)))

(declare-fun res!25188 () Bool)

(declare-datatypes ((SeekEntryResult!181 0))(
  ( (MissingZero!181 (index!2846 (_ BitVec 32))) (Found!181 (index!2847 (_ BitVec 32))) (Intermediate!181 (undefined!993 Bool) (index!2848 (_ BitVec 32)) (x!8090 (_ BitVec 32))) (Undefined!181) (MissingVacant!181 (index!2849 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2801 (_ BitVec 32)) SeekEntryResult!181)

(assert (=> b!42308 (= res!25188 (= (seekEntryOrOpen!0 (select (arr!1344 lt!17475) #b00000000000000000000000000000000) lt!17475 mask!853) (Found!181 #b00000000000000000000000000000000)))))

(assert (=> b!42308 (=> (not res!25188) (not e!26783))))

(declare-fun d!7651 () Bool)

(declare-fun res!25189 () Bool)

(assert (=> d!7651 (=> res!25189 e!26785)))

(assert (=> d!7651 (= res!25189 (bvsge #b00000000000000000000000000000000 (size!1511 lt!17475)))))

(assert (=> d!7651 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17475 mask!853) e!26785)))

(declare-fun b!42309 () Bool)

(assert (=> b!42309 (= e!26783 call!3301)))

(declare-fun bm!3298 () Bool)

(assert (=> bm!3298 (= call!3301 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17475 mask!853))))

(assert (= (and d!7651 (not res!25189)) b!42306))

(assert (= (and b!42306 c!5308) b!42308))

(assert (= (and b!42306 (not c!5308)) b!42307))

(assert (= (and b!42308 res!25188) b!42309))

(assert (= (or b!42309 b!42307) bm!3298))

(declare-fun m!35933 () Bool)

(assert (=> b!42306 m!35933))

(assert (=> b!42306 m!35933))

(declare-fun m!35935 () Bool)

(assert (=> b!42306 m!35935))

(assert (=> b!42308 m!35933))

(declare-fun m!35937 () Bool)

(assert (=> b!42308 m!35937))

(declare-fun m!35939 () Bool)

(assert (=> b!42308 m!35939))

(assert (=> b!42308 m!35933))

(declare-fun m!35941 () Bool)

(assert (=> b!42308 m!35941))

(declare-fun m!35943 () Bool)

(assert (=> bm!3298 m!35943))

(assert (=> b!42283 d!7651))

(declare-fun d!7657 () Bool)

(assert (=> d!7657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17475 mask!853)))

(declare-fun lt!17516 () Unit!1119)

(declare-fun choose!34 (array!2801 (_ BitVec 32) (_ BitVec 32)) Unit!1119)

(assert (=> d!7657 (= lt!17516 (choose!34 lt!17475 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7657 (validMask!0 mask!853)))

(assert (=> d!7657 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17475 mask!853 #b00000000000000000000000000000000) lt!17516)))

(declare-fun bs!1854 () Bool)

(assert (= bs!1854 d!7657))

(assert (=> bs!1854 m!35905))

(declare-fun m!35957 () Bool)

(assert (=> bs!1854 m!35957))

(assert (=> bs!1854 m!35903))

(assert (=> b!42283 d!7657))

(declare-fun bm!3307 () Bool)

(declare-fun call!3310 () (_ BitVec 32))

(assert (=> bm!3307 (= call!3310 (arrayCountValidKeys!0 lt!17475 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42342 () Bool)

(declare-fun e!26806 () (_ BitVec 32))

(assert (=> b!42342 (= e!26806 call!3310)))

(declare-fun d!7661 () Bool)

(declare-fun lt!17533 () (_ BitVec 32))

(assert (=> d!7661 (and (bvsge lt!17533 #b00000000000000000000000000000000) (bvsle lt!17533 (bvsub (size!1511 lt!17475) #b00000000000000000000000000000000)))))

(declare-fun e!26807 () (_ BitVec 32))

(assert (=> d!7661 (= lt!17533 e!26807)))

(declare-fun c!5321 () Bool)

(assert (=> d!7661 (= c!5321 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7661 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1511 lt!17475)))))

(assert (=> d!7661 (= (arrayCountValidKeys!0 lt!17475 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17533)))

(declare-fun b!42343 () Bool)

(assert (=> b!42343 (= e!26806 (bvadd #b00000000000000000000000000000001 call!3310))))

(declare-fun b!42344 () Bool)

(assert (=> b!42344 (= e!26807 e!26806)))

(declare-fun c!5322 () Bool)

(assert (=> b!42344 (= c!5322 (validKeyInArray!0 (select (arr!1344 lt!17475) #b00000000000000000000000000000000)))))

(declare-fun b!42345 () Bool)

(assert (=> b!42345 (= e!26807 #b00000000000000000000000000000000)))

(assert (= (and d!7661 c!5321) b!42345))

(assert (= (and d!7661 (not c!5321)) b!42344))

(assert (= (and b!42344 c!5322) b!42343))

(assert (= (and b!42344 (not c!5322)) b!42342))

(assert (= (or b!42343 b!42342) bm!3307))

(declare-fun m!35973 () Bool)

(assert (=> bm!3307 m!35973))

(assert (=> b!42344 m!35933))

(assert (=> b!42344 m!35933))

(assert (=> b!42344 m!35935))

(assert (=> b!42283 d!7661))

(declare-fun d!7667 () Bool)

(assert (=> d!7667 (= (arrayCountValidKeys!0 lt!17475 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17539 () Unit!1119)

(declare-fun choose!59 (array!2801 (_ BitVec 32) (_ BitVec 32)) Unit!1119)

(assert (=> d!7667 (= lt!17539 (choose!59 lt!17475 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7667 (bvslt (size!1511 lt!17475) #b01111111111111111111111111111111)))

(assert (=> d!7667 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17475 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17539)))

(declare-fun bs!1856 () Bool)

(assert (= bs!1856 d!7667))

(assert (=> bs!1856 m!35909))

(declare-fun m!35977 () Bool)

(assert (=> bs!1856 m!35977))

(assert (=> b!42283 d!7667))

(push 1)

(assert (not b!42306))

(assert (not b!42344))

(assert (not b!42308))

(assert (not bm!3307))

(assert (not d!7667))

(assert (not bm!3298))

(assert (not d!7657))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

