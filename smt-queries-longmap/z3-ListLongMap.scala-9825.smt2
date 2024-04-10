; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116620 () Bool)

(assert start!116620)

(declare-fun b!1374935 () Bool)

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93305 0))(
  ( (array!93306 (arr!45057 (Array (_ BitVec 32) (_ BitVec 64))) (size!45607 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93305)

(declare-fun e!778900 () Bool)

(declare-fun lt!603933 () array!93305)

(declare-fun arrayCountValidKeys!0 (array!93305 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374935 (= e!778900 (= (arrayCountValidKeys!0 lt!603933 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457))))))

(declare-fun res!918066 () Bool)

(declare-fun e!778901 () Bool)

(assert (=> start!116620 (=> (not res!918066) (not e!778901))))

(assert (=> start!116620 (= res!918066 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45607 a!4142))))))

(assert (=> start!116620 e!778901))

(assert (=> start!116620 true))

(declare-fun array_inv!34085 (array!93305) Bool)

(assert (=> start!116620 (array_inv!34085 a!4142)))

(declare-fun b!1374936 () Bool)

(assert (=> b!1374936 (= e!778901 (not e!778900))))

(declare-fun res!918064 () Bool)

(assert (=> b!1374936 (=> res!918064 e!778900)))

(assert (=> b!1374936 (= res!918064 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374936 (= (arrayCountValidKeys!0 lt!603933 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k0!2959 () (_ BitVec 64))

(assert (=> b!1374936 (= lt!603933 (array!93306 (store (arr!45057 a!4142) i!1457 k0!2959) (size!45607 a!4142)))))

(declare-datatypes ((Unit!45503 0))(
  ( (Unit!45504) )
))
(declare-fun lt!603932 () Unit!45503)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45503)

(assert (=> b!1374936 (= lt!603932 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374937 () Bool)

(declare-fun res!918067 () Bool)

(assert (=> b!1374937 (=> (not res!918067) (not e!778901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374937 (= res!918067 (validKeyInArray!0 (select (arr!45057 a!4142) i!1457)))))

(declare-fun b!1374938 () Bool)

(declare-fun res!918063 () Bool)

(assert (=> b!1374938 (=> (not res!918063) (not e!778901))))

(assert (=> b!1374938 (= res!918063 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1374939 () Bool)

(declare-fun res!918065 () Bool)

(assert (=> b!1374939 (=> (not res!918065) (not e!778901))))

(assert (=> b!1374939 (= res!918065 (bvslt (size!45607 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116620 res!918066) b!1374937))

(assert (= (and b!1374937 res!918067) b!1374938))

(assert (= (and b!1374938 res!918063) b!1374939))

(assert (= (and b!1374939 res!918065) b!1374936))

(assert (= (and b!1374936 (not res!918064)) b!1374935))

(declare-fun m!1258539 () Bool)

(assert (=> b!1374938 m!1258539))

(declare-fun m!1258541 () Bool)

(assert (=> b!1374935 m!1258541))

(declare-fun m!1258543 () Bool)

(assert (=> b!1374935 m!1258543))

(declare-fun m!1258545 () Bool)

(assert (=> start!116620 m!1258545))

(declare-fun m!1258547 () Bool)

(assert (=> b!1374936 m!1258547))

(declare-fun m!1258549 () Bool)

(assert (=> b!1374936 m!1258549))

(declare-fun m!1258551 () Bool)

(assert (=> b!1374936 m!1258551))

(declare-fun m!1258553 () Bool)

(assert (=> b!1374936 m!1258553))

(declare-fun m!1258555 () Bool)

(assert (=> b!1374937 m!1258555))

(assert (=> b!1374937 m!1258555))

(declare-fun m!1258557 () Bool)

(assert (=> b!1374937 m!1258557))

(check-sat (not b!1374938) (not b!1374935) (not b!1374936) (not b!1374937) (not start!116620))
(check-sat)
(get-model)

(declare-fun d!148189 () Bool)

(assert (=> d!148189 (= (validKeyInArray!0 (select (arr!45057 a!4142) i!1457)) (and (not (= (select (arr!45057 a!4142) i!1457) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45057 a!4142) i!1457) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374937 d!148189))

(declare-fun d!148191 () Bool)

(assert (=> d!148191 (= (validKeyInArray!0 k0!2959) (and (not (= k0!2959 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2959 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374938 d!148191))

(declare-fun b!1374963 () Bool)

(declare-fun e!778915 () (_ BitVec 32))

(declare-fun e!778916 () (_ BitVec 32))

(assert (=> b!1374963 (= e!778915 e!778916)))

(declare-fun c!127880 () Bool)

(assert (=> b!1374963 (= c!127880 (validKeyInArray!0 (select (arr!45057 lt!603933) #b00000000000000000000000000000000)))))

(declare-fun b!1374964 () Bool)

(assert (=> b!1374964 (= e!778915 #b00000000000000000000000000000000)))

(declare-fun b!1374965 () Bool)

(declare-fun call!65659 () (_ BitVec 32))

(assert (=> b!1374965 (= e!778916 call!65659)))

(declare-fun b!1374966 () Bool)

(assert (=> b!1374966 (= e!778916 (bvadd #b00000000000000000000000000000001 call!65659))))

(declare-fun bm!65656 () Bool)

(assert (=> bm!65656 (= call!65659 (arrayCountValidKeys!0 lt!603933 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun d!148193 () Bool)

(declare-fun lt!603942 () (_ BitVec 32))

(assert (=> d!148193 (and (bvsge lt!603942 #b00000000000000000000000000000000) (bvsle lt!603942 (bvsub (size!45607 lt!603933) #b00000000000000000000000000000000)))))

(assert (=> d!148193 (= lt!603942 e!778915)))

(declare-fun c!127881 () Bool)

(assert (=> d!148193 (= c!127881 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148193 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45607 lt!603933)))))

(assert (=> d!148193 (= (arrayCountValidKeys!0 lt!603933 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603942)))

(assert (= (and d!148193 c!127881) b!1374964))

(assert (= (and d!148193 (not c!127881)) b!1374963))

(assert (= (and b!1374963 c!127880) b!1374966))

(assert (= (and b!1374963 (not c!127880)) b!1374965))

(assert (= (or b!1374966 b!1374965) bm!65656))

(declare-fun m!1258579 () Bool)

(assert (=> b!1374963 m!1258579))

(assert (=> b!1374963 m!1258579))

(declare-fun m!1258581 () Bool)

(assert (=> b!1374963 m!1258581))

(declare-fun m!1258583 () Bool)

(assert (=> bm!65656 m!1258583))

(assert (=> b!1374936 d!148193))

(declare-fun b!1374967 () Bool)

(declare-fun e!778917 () (_ BitVec 32))

(declare-fun e!778918 () (_ BitVec 32))

(assert (=> b!1374967 (= e!778917 e!778918)))

(declare-fun c!127882 () Bool)

(assert (=> b!1374967 (= c!127882 (validKeyInArray!0 (select (arr!45057 a!4142) #b00000000000000000000000000000000)))))

(declare-fun b!1374968 () Bool)

(assert (=> b!1374968 (= e!778917 #b00000000000000000000000000000000)))

(declare-fun b!1374969 () Bool)

(declare-fun call!65660 () (_ BitVec 32))

(assert (=> b!1374969 (= e!778918 call!65660)))

(declare-fun b!1374970 () Bool)

(assert (=> b!1374970 (= e!778918 (bvadd #b00000000000000000000000000000001 call!65660))))

(declare-fun bm!65657 () Bool)

(assert (=> bm!65657 (= call!65660 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun d!148195 () Bool)

(declare-fun lt!603943 () (_ BitVec 32))

(assert (=> d!148195 (and (bvsge lt!603943 #b00000000000000000000000000000000) (bvsle lt!603943 (bvsub (size!45607 a!4142) #b00000000000000000000000000000000)))))

(assert (=> d!148195 (= lt!603943 e!778917)))

(declare-fun c!127883 () Bool)

(assert (=> d!148195 (= c!127883 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148195 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45607 a!4142)))))

(assert (=> d!148195 (= (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603943)))

(assert (= (and d!148195 c!127883) b!1374968))

(assert (= (and d!148195 (not c!127883)) b!1374967))

(assert (= (and b!1374967 c!127882) b!1374970))

(assert (= (and b!1374967 (not c!127882)) b!1374969))

(assert (= (or b!1374970 b!1374969) bm!65657))

(declare-fun m!1258585 () Bool)

(assert (=> b!1374967 m!1258585))

(assert (=> b!1374967 m!1258585))

(declare-fun m!1258587 () Bool)

(assert (=> b!1374967 m!1258587))

(declare-fun m!1258589 () Bool)

(assert (=> bm!65657 m!1258589))

(assert (=> b!1374936 d!148195))

(declare-fun d!148197 () Bool)

(declare-fun e!778921 () Bool)

(assert (=> d!148197 e!778921))

(declare-fun res!918085 () Bool)

(assert (=> d!148197 (=> (not res!918085) (not e!778921))))

(assert (=> d!148197 (= res!918085 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45607 a!4142))))))

(declare-fun lt!603946 () Unit!45503)

(declare-fun choose!4 (array!93305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45503)

(assert (=> d!148197 (= lt!603946 (choose!4 a!4142 i!1457 k0!2959 i!1457))))

(assert (=> d!148197 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45607 a!4142)))))

(assert (=> d!148197 (= (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457) lt!603946)))

(declare-fun b!1374973 () Bool)

(assert (=> b!1374973 (= e!778921 (= (arrayCountValidKeys!0 (array!93306 (store (arr!45057 a!4142) i!1457 k0!2959) (size!45607 a!4142)) #b00000000000000000000000000000000 (bvadd i!1457 #b00000000000000000000000000000001)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd i!1457 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(assert (= (and d!148197 res!918085) b!1374973))

(declare-fun m!1258591 () Bool)

(assert (=> d!148197 m!1258591))

(assert (=> b!1374973 m!1258551))

(declare-fun m!1258593 () Bool)

(assert (=> b!1374973 m!1258593))

(declare-fun m!1258595 () Bool)

(assert (=> b!1374973 m!1258595))

(assert (=> b!1374936 d!148197))

(declare-fun d!148205 () Bool)

(assert (=> d!148205 (= (array_inv!34085 a!4142) (bvsge (size!45607 a!4142) #b00000000000000000000000000000000))))

(assert (=> start!116620 d!148205))

(declare-fun b!1374982 () Bool)

(declare-fun e!778926 () (_ BitVec 32))

(declare-fun e!778927 () (_ BitVec 32))

(assert (=> b!1374982 (= e!778926 e!778927)))

(declare-fun c!127888 () Bool)

(assert (=> b!1374982 (= c!127888 (validKeyInArray!0 (select (arr!45057 lt!603933) (bvadd #b00000000000000000000000000000001 i!1457))))))

(declare-fun b!1374983 () Bool)

(assert (=> b!1374983 (= e!778926 #b00000000000000000000000000000000)))

(declare-fun b!1374984 () Bool)

(declare-fun call!65661 () (_ BitVec 32))

(assert (=> b!1374984 (= e!778927 call!65661)))

(declare-fun b!1374985 () Bool)

(assert (=> b!1374985 (= e!778927 (bvadd #b00000000000000000000000000000001 call!65661))))

(declare-fun bm!65658 () Bool)

(assert (=> bm!65658 (= call!65661 (arrayCountValidKeys!0 lt!603933 (bvadd #b00000000000000000000000000000001 i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun d!148207 () Bool)

(declare-fun lt!603949 () (_ BitVec 32))

(assert (=> d!148207 (and (bvsge lt!603949 #b00000000000000000000000000000000) (bvsle lt!603949 (bvsub (size!45607 lt!603933) (bvadd #b00000000000000000000000000000001 i!1457))))))

(assert (=> d!148207 (= lt!603949 e!778926)))

(declare-fun c!127889 () Bool)

(assert (=> d!148207 (= c!127889 (bvsge (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148207 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45607 lt!603933)))))

(assert (=> d!148207 (= (arrayCountValidKeys!0 lt!603933 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) lt!603949)))

(assert (= (and d!148207 c!127889) b!1374983))

(assert (= (and d!148207 (not c!127889)) b!1374982))

(assert (= (and b!1374982 c!127888) b!1374985))

(assert (= (and b!1374982 (not c!127888)) b!1374984))

(assert (= (or b!1374985 b!1374984) bm!65658))

(declare-fun m!1258597 () Bool)

(assert (=> b!1374982 m!1258597))

(assert (=> b!1374982 m!1258597))

(declare-fun m!1258599 () Bool)

(assert (=> b!1374982 m!1258599))

(declare-fun m!1258601 () Bool)

(assert (=> bm!65658 m!1258601))

(assert (=> b!1374935 d!148207))

(declare-fun b!1374986 () Bool)

(declare-fun e!778928 () (_ BitVec 32))

(declare-fun e!778929 () (_ BitVec 32))

(assert (=> b!1374986 (= e!778928 e!778929)))

(declare-fun c!127890 () Bool)

(assert (=> b!1374986 (= c!127890 (validKeyInArray!0 (select (arr!45057 a!4142) (bvadd #b00000000000000000000000000000001 i!1457))))))

(declare-fun b!1374987 () Bool)

(assert (=> b!1374987 (= e!778928 #b00000000000000000000000000000000)))

(declare-fun b!1374988 () Bool)

(declare-fun call!65664 () (_ BitVec 32))

(assert (=> b!1374988 (= e!778929 call!65664)))

(declare-fun b!1374989 () Bool)

(assert (=> b!1374989 (= e!778929 (bvadd #b00000000000000000000000000000001 call!65664))))

(declare-fun bm!65661 () Bool)

(assert (=> bm!65661 (= call!65664 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun d!148209 () Bool)

(declare-fun lt!603950 () (_ BitVec 32))

(assert (=> d!148209 (and (bvsge lt!603950 #b00000000000000000000000000000000) (bvsle lt!603950 (bvsub (size!45607 a!4142) (bvadd #b00000000000000000000000000000001 i!1457))))))

(assert (=> d!148209 (= lt!603950 e!778928)))

(declare-fun c!127891 () Bool)

(assert (=> d!148209 (= c!127891 (bvsge (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148209 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45607 a!4142)))))

(assert (=> d!148209 (= (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) lt!603950)))

(assert (= (and d!148209 c!127891) b!1374987))

(assert (= (and d!148209 (not c!127891)) b!1374986))

(assert (= (and b!1374986 c!127890) b!1374989))

(assert (= (and b!1374986 (not c!127890)) b!1374988))

(assert (= (or b!1374989 b!1374988) bm!65661))

(declare-fun m!1258603 () Bool)

(assert (=> b!1374986 m!1258603))

(assert (=> b!1374986 m!1258603))

(declare-fun m!1258605 () Bool)

(assert (=> b!1374986 m!1258605))

(declare-fun m!1258607 () Bool)

(assert (=> bm!65661 m!1258607))

(assert (=> b!1374935 d!148209))

(check-sat (not bm!65658) (not d!148197) (not bm!65657) (not b!1374982) (not b!1374963) (not b!1374967) (not bm!65661) (not bm!65656) (not b!1374973) (not b!1374986))
(check-sat)
