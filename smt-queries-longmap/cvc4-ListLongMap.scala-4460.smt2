; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62058 () Bool)

(assert start!62058)

(declare-fun b!695109 () Bool)

(declare-fun e!395312 () Bool)

(declare-fun e!395314 () Bool)

(assert (=> b!695109 (= e!395312 e!395314)))

(declare-fun res!459120 () Bool)

(assert (=> b!695109 (=> (not res!459120) (not e!395314))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39899 0))(
  ( (array!39900 (arr!19112 (Array (_ BitVec 32) (_ BitVec 64))) (size!19497 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39899)

(assert (=> b!695109 (= res!459120 (not (= (select (arr!19112 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!24566 0))(
  ( (Unit!24567) )
))
(declare-fun lt!317005 () Unit!24566)

(declare-fun e!395307 () Unit!24566)

(assert (=> b!695109 (= lt!317005 e!395307)))

(declare-fun c!78371 () Bool)

(assert (=> b!695109 (= c!78371 (= (select (arr!19112 a!3626) from!3004) k!2843))))

(declare-fun res!459104 () Bool)

(assert (=> start!62058 (=> (not res!459104) (not e!395312))))

(assert (=> start!62058 (= res!459104 (and (bvslt (size!19497 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19497 a!3626))))))

(assert (=> start!62058 e!395312))

(assert (=> start!62058 true))

(declare-fun array_inv!14908 (array!39899) Bool)

(assert (=> start!62058 (array_inv!14908 a!3626)))

(declare-fun b!695110 () Bool)

(declare-fun res!459125 () Bool)

(assert (=> b!695110 (=> (not res!459125) (not e!395312))))

(declare-datatypes ((List!13153 0))(
  ( (Nil!13150) (Cons!13149 (h!14194 (_ BitVec 64)) (t!19432 List!13153)) )
))
(declare-fun acc!681 () List!13153)

(declare-fun contains!3730 (List!13153 (_ BitVec 64)) Bool)

(assert (=> b!695110 (= res!459125 (not (contains!3730 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695111 () Bool)

(declare-fun res!459119 () Bool)

(declare-fun e!395308 () Bool)

(assert (=> b!695111 (=> (not res!459119) (not e!395308))))

(declare-fun lt!317007 () List!13153)

(assert (=> b!695111 (= res!459119 (not (contains!3730 lt!317007 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695112 () Bool)

(declare-fun res!459115 () Bool)

(assert (=> b!695112 (=> (not res!459115) (not e!395312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!695112 (= res!459115 (validKeyInArray!0 (select (arr!19112 a!3626) from!3004)))))

(declare-fun b!695113 () Bool)

(declare-fun res!459124 () Bool)

(assert (=> b!695113 (=> (not res!459124) (not e!395312))))

(declare-fun noDuplicate!977 (List!13153) Bool)

(assert (=> b!695113 (= res!459124 (noDuplicate!977 acc!681))))

(declare-fun b!695114 () Bool)

(declare-fun res!459103 () Bool)

(assert (=> b!695114 (=> (not res!459103) (not e!395308))))

(assert (=> b!695114 (= res!459103 (not (contains!3730 lt!317007 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695115 () Bool)

(declare-fun e!395310 () Bool)

(assert (=> b!695115 (= e!395310 (not (contains!3730 lt!317007 k!2843)))))

(declare-fun b!695116 () Bool)

(declare-fun res!459121 () Bool)

(assert (=> b!695116 (=> (not res!459121) (not e!395312))))

(declare-fun arrayNoDuplicates!0 (array!39899 (_ BitVec 32) List!13153) Bool)

(assert (=> b!695116 (= res!459121 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695117 () Bool)

(declare-fun res!459112 () Bool)

(assert (=> b!695117 (=> (not res!459112) (not e!395312))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695117 (= res!459112 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19497 a!3626))))))

(declare-fun b!695118 () Bool)

(declare-fun res!459118 () Bool)

(assert (=> b!695118 (=> (not res!459118) (not e!395308))))

(assert (=> b!695118 (= res!459118 (noDuplicate!977 lt!317007))))

(declare-fun b!695119 () Bool)

(declare-fun res!459114 () Bool)

(assert (=> b!695119 (=> (not res!459114) (not e!395308))))

(assert (=> b!695119 (= res!459114 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!317007))))

(declare-fun b!695120 () Bool)

(declare-fun res!459110 () Bool)

(assert (=> b!695120 (=> (not res!459110) (not e!395312))))

(assert (=> b!695120 (= res!459110 (not (contains!3730 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695121 () Bool)

(declare-fun e!395316 () Bool)

(assert (=> b!695121 (= e!395316 (not (contains!3730 acc!681 k!2843)))))

(declare-fun b!695122 () Bool)

(declare-fun Unit!24568 () Unit!24566)

(assert (=> b!695122 (= e!395307 Unit!24568)))

(declare-fun b!695123 () Bool)

(declare-fun res!459123 () Bool)

(assert (=> b!695123 (=> (not res!459123) (not e!395312))))

(declare-fun e!395313 () Bool)

(assert (=> b!695123 (= res!459123 e!395313)))

(declare-fun res!459107 () Bool)

(assert (=> b!695123 (=> res!459107 e!395313)))

(declare-fun e!395315 () Bool)

(assert (=> b!695123 (= res!459107 e!395315)))

(declare-fun res!459116 () Bool)

(assert (=> b!695123 (=> (not res!459116) (not e!395315))))

(assert (=> b!695123 (= res!459116 (bvsgt from!3004 i!1382))))

(declare-fun b!695124 () Bool)

(declare-fun e!395306 () Bool)

(assert (=> b!695124 (= e!395306 e!395310)))

(declare-fun res!459105 () Bool)

(assert (=> b!695124 (=> (not res!459105) (not e!395310))))

(assert (=> b!695124 (= res!459105 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!695125 () Bool)

(declare-fun lt!317004 () array!39899)

(assert (=> b!695125 (= e!395308 (not (arrayNoDuplicates!0 lt!317004 from!3004 acc!681)))))

(assert (=> b!695125 (arrayNoDuplicates!0 lt!317004 (bvadd #b00000000000000000000000000000001 from!3004) lt!317007)))

(assert (=> b!695125 (= lt!317004 (array!39900 (store (arr!19112 a!3626) i!1382 k!2843) (size!19497 a!3626)))))

(declare-fun lt!317008 () Unit!24566)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39899 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13153) Unit!24566)

(assert (=> b!695125 (= lt!317008 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!317007))))

(declare-fun b!695126 () Bool)

(declare-fun res!459122 () Bool)

(assert (=> b!695126 (=> (not res!459122) (not e!395312))))

(declare-fun arrayContainsKey!0 (array!39899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!695126 (= res!459122 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!695127 () Bool)

(declare-fun res!459106 () Bool)

(assert (=> b!695127 (=> (not res!459106) (not e!395308))))

(assert (=> b!695127 (= res!459106 e!395306)))

(declare-fun res!459113 () Bool)

(assert (=> b!695127 (=> res!459113 e!395306)))

(declare-fun e!395311 () Bool)

(assert (=> b!695127 (= res!459113 e!395311)))

(declare-fun res!459111 () Bool)

(assert (=> b!695127 (=> (not res!459111) (not e!395311))))

(assert (=> b!695127 (= res!459111 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!695128 () Bool)

(declare-fun res!459109 () Bool)

(assert (=> b!695128 (=> (not res!459109) (not e!395312))))

(assert (=> b!695128 (= res!459109 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19497 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!695129 () Bool)

(declare-fun Unit!24569 () Unit!24566)

(assert (=> b!695129 (= e!395307 Unit!24569)))

(assert (=> b!695129 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!317006 () Unit!24566)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39899 (_ BitVec 64) (_ BitVec 32)) Unit!24566)

(assert (=> b!695129 (= lt!317006 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!695129 false))

(declare-fun b!695130 () Bool)

(declare-fun res!459117 () Bool)

(assert (=> b!695130 (=> (not res!459117) (not e!395312))))

(assert (=> b!695130 (= res!459117 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13150))))

(declare-fun b!695131 () Bool)

(assert (=> b!695131 (= e!395313 e!395316)))

(declare-fun res!459108 () Bool)

(assert (=> b!695131 (=> (not res!459108) (not e!395316))))

(assert (=> b!695131 (= res!459108 (bvsle from!3004 i!1382))))

(declare-fun b!695132 () Bool)

(assert (=> b!695132 (= e!395311 (contains!3730 lt!317007 k!2843))))

(declare-fun b!695133 () Bool)

(assert (=> b!695133 (= e!395315 (contains!3730 acc!681 k!2843))))

(declare-fun b!695134 () Bool)

(assert (=> b!695134 (= e!395314 e!395308)))

(declare-fun res!459102 () Bool)

(assert (=> b!695134 (=> (not res!459102) (not e!395308))))

(assert (=> b!695134 (= res!459102 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!442 (List!13153 (_ BitVec 64)) List!13153)

(assert (=> b!695134 (= lt!317007 ($colon$colon!442 acc!681 (select (arr!19112 a!3626) from!3004)))))

(declare-fun b!695135 () Bool)

(declare-fun res!459101 () Bool)

(assert (=> b!695135 (=> (not res!459101) (not e!395312))))

(assert (=> b!695135 (= res!459101 (validKeyInArray!0 k!2843))))

(assert (= (and start!62058 res!459104) b!695113))

(assert (= (and b!695113 res!459124) b!695120))

(assert (= (and b!695120 res!459110) b!695110))

(assert (= (and b!695110 res!459125) b!695123))

(assert (= (and b!695123 res!459116) b!695133))

(assert (= (and b!695123 (not res!459107)) b!695131))

(assert (= (and b!695131 res!459108) b!695121))

(assert (= (and b!695123 res!459123) b!695130))

(assert (= (and b!695130 res!459117) b!695116))

(assert (= (and b!695116 res!459121) b!695117))

(assert (= (and b!695117 res!459112) b!695135))

(assert (= (and b!695135 res!459101) b!695126))

(assert (= (and b!695126 res!459122) b!695128))

(assert (= (and b!695128 res!459109) b!695112))

(assert (= (and b!695112 res!459115) b!695109))

(assert (= (and b!695109 c!78371) b!695129))

(assert (= (and b!695109 (not c!78371)) b!695122))

(assert (= (and b!695109 res!459120) b!695134))

(assert (= (and b!695134 res!459102) b!695118))

(assert (= (and b!695118 res!459118) b!695111))

(assert (= (and b!695111 res!459119) b!695114))

(assert (= (and b!695114 res!459103) b!695127))

(assert (= (and b!695127 res!459111) b!695132))

(assert (= (and b!695127 (not res!459113)) b!695124))

(assert (= (and b!695124 res!459105) b!695115))

(assert (= (and b!695127 res!459106) b!695119))

(assert (= (and b!695119 res!459114) b!695125))

(declare-fun m!656617 () Bool)

(assert (=> b!695110 m!656617))

(declare-fun m!656619 () Bool)

(assert (=> b!695113 m!656619))

(declare-fun m!656621 () Bool)

(assert (=> b!695130 m!656621))

(declare-fun m!656623 () Bool)

(assert (=> b!695120 m!656623))

(declare-fun m!656625 () Bool)

(assert (=> b!695135 m!656625))

(declare-fun m!656627 () Bool)

(assert (=> b!695115 m!656627))

(declare-fun m!656629 () Bool)

(assert (=> b!695125 m!656629))

(declare-fun m!656631 () Bool)

(assert (=> b!695125 m!656631))

(declare-fun m!656633 () Bool)

(assert (=> b!695125 m!656633))

(declare-fun m!656635 () Bool)

(assert (=> b!695125 m!656635))

(declare-fun m!656637 () Bool)

(assert (=> b!695129 m!656637))

(declare-fun m!656639 () Bool)

(assert (=> b!695129 m!656639))

(declare-fun m!656641 () Bool)

(assert (=> b!695112 m!656641))

(assert (=> b!695112 m!656641))

(declare-fun m!656643 () Bool)

(assert (=> b!695112 m!656643))

(declare-fun m!656645 () Bool)

(assert (=> b!695121 m!656645))

(assert (=> b!695109 m!656641))

(declare-fun m!656647 () Bool)

(assert (=> b!695116 m!656647))

(declare-fun m!656649 () Bool)

(assert (=> b!695119 m!656649))

(declare-fun m!656651 () Bool)

(assert (=> b!695111 m!656651))

(declare-fun m!656653 () Bool)

(assert (=> b!695114 m!656653))

(assert (=> b!695134 m!656641))

(assert (=> b!695134 m!656641))

(declare-fun m!656655 () Bool)

(assert (=> b!695134 m!656655))

(assert (=> b!695132 m!656627))

(declare-fun m!656657 () Bool)

(assert (=> start!62058 m!656657))

(declare-fun m!656659 () Bool)

(assert (=> b!695126 m!656659))

(declare-fun m!656661 () Bool)

(assert (=> b!695118 m!656661))

(assert (=> b!695133 m!656645))

(push 1)

(assert (not b!695121))

(assert (not b!695135))

(assert (not b!695130))

(assert (not b!695111))

(assert (not start!62058))

(assert (not b!695113))

(assert (not b!695114))

(assert (not b!695116))

(assert (not b!695112))

(assert (not b!695134))

(assert (not b!695120))

(assert (not b!695132))

(assert (not b!695115))

(assert (not b!695118))

(assert (not b!695119))

(assert (not b!695110))

(assert (not b!695129))

(assert (not b!695125))

(assert (not b!695126))

(assert (not b!695133))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95961 () Bool)

(declare-fun lt!317020 () Bool)

(declare-fun content!322 (List!13153) (Set (_ BitVec 64)))

(assert (=> d!95961 (= lt!317020 (member k!2843 (content!322 lt!317007)))))

(declare-fun e!395379 () Bool)

(assert (=> d!95961 (= lt!317020 e!395379)))

(declare-fun res!459181 () Bool)

(assert (=> d!95961 (=> (not res!459181) (not e!395379))))

(assert (=> d!95961 (= res!459181 (is-Cons!13149 lt!317007))))

(assert (=> d!95961 (= (contains!3730 lt!317007 k!2843) lt!317020)))

(declare-fun b!695204 () Bool)

(declare-fun e!395378 () Bool)

(assert (=> b!695204 (= e!395379 e!395378)))

(declare-fun res!459180 () Bool)

(assert (=> b!695204 (=> res!459180 e!395378)))

(assert (=> b!695204 (= res!459180 (= (h!14194 lt!317007) k!2843))))

(declare-fun b!695205 () Bool)

(assert (=> b!695205 (= e!395378 (contains!3730 (t!19432 lt!317007) k!2843))))

(assert (= (and d!95961 res!459181) b!695204))

(assert (= (and b!695204 (not res!459180)) b!695205))

(declare-fun m!656725 () Bool)

(assert (=> d!95961 m!656725))

(declare-fun m!656727 () Bool)

(assert (=> d!95961 m!656727))

(declare-fun m!656729 () Bool)

(assert (=> b!695205 m!656729))

(assert (=> b!695115 d!95961))

(declare-fun d!95969 () Bool)

(declare-fun res!459190 () Bool)

(declare-fun e!395388 () Bool)

(assert (=> d!95969 (=> res!459190 e!395388)))

(assert (=> d!95969 (= res!459190 (= (select (arr!19112 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!95969 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!395388)))

(declare-fun b!695214 () Bool)

(declare-fun e!395389 () Bool)

(assert (=> b!695214 (= e!395388 e!395389)))

(declare-fun res!459191 () Bool)

(assert (=> b!695214 (=> (not res!459191) (not e!395389))))

(assert (=> b!695214 (= res!459191 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19497 a!3626)))))

(declare-fun b!695215 () Bool)

(assert (=> b!695215 (= e!395389 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95969 (not res!459190)) b!695214))

(assert (= (and b!695214 res!459191) b!695215))

(declare-fun m!656745 () Bool)

(assert (=> d!95969 m!656745))

(declare-fun m!656747 () Bool)

(assert (=> b!695215 m!656747))

(assert (=> b!695126 d!95969))

(declare-fun d!95977 () Bool)

(declare-fun res!459207 () Bool)

(declare-fun e!395409 () Bool)

(assert (=> d!95977 (=> res!459207 e!395409)))

(assert (=> d!95977 (= res!459207 (bvsge from!3004 (size!19497 lt!317004)))))

(assert (=> d!95977 (= (arrayNoDuplicates!0 lt!317004 from!3004 acc!681) e!395409)))

(declare-fun b!695238 () Bool)

(declare-fun e!395410 () Bool)

(assert (=> b!695238 (= e!395409 e!395410)))

(declare-fun res!459206 () Bool)

(assert (=> b!695238 (=> (not res!459206) (not e!395410))))

(declare-fun e!395408 () Bool)

(assert (=> b!695238 (= res!459206 (not e!395408))))

(declare-fun res!459208 () Bool)

(assert (=> b!695238 (=> (not res!459208) (not e!395408))))

(assert (=> b!695238 (= res!459208 (validKeyInArray!0 (select (arr!19112 lt!317004) from!3004)))))

(declare-fun b!695239 () Bool)

(declare-fun e!395411 () Bool)

(assert (=> b!695239 (= e!395410 e!395411)))

(declare-fun c!78383 () Bool)

(assert (=> b!695239 (= c!78383 (validKeyInArray!0 (select (arr!19112 lt!317004) from!3004)))))

(declare-fun b!695240 () Bool)

(declare-fun call!34289 () Bool)

(assert (=> b!695240 (= e!395411 call!34289)))

(declare-fun b!695241 () Bool)

(assert (=> b!695241 (= e!395411 call!34289)))

(declare-fun b!695242 () Bool)

(assert (=> b!695242 (= e!395408 (contains!3730 acc!681 (select (arr!19112 lt!317004) from!3004)))))

(declare-fun bm!34286 () Bool)

(assert (=> bm!34286 (= call!34289 (arrayNoDuplicates!0 lt!317004 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78383 (Cons!13149 (select (arr!19112 lt!317004) from!3004) acc!681) acc!681)))))

(assert (= (and d!95977 (not res!459207)) b!695238))

(assert (= (and b!695238 res!459208) b!695242))

(assert (= (and b!695238 res!459206) b!695239))

(assert (= (and b!695239 c!78383) b!695241))

(assert (= (and b!695239 (not c!78383)) b!695240))

(assert (= (or b!695241 b!695240) bm!34286))

(declare-fun m!656755 () Bool)

(assert (=> b!695238 m!656755))

(assert (=> b!695238 m!656755))

(declare-fun m!656757 () Bool)

(assert (=> b!695238 m!656757))

(assert (=> b!695239 m!656755))

(assert (=> b!695239 m!656755))

(assert (=> b!695239 m!656757))

(assert (=> b!695242 m!656755))

(assert (=> b!695242 m!656755))

(declare-fun m!656759 () Bool)

(assert (=> b!695242 m!656759))

(assert (=> bm!34286 m!656755))

(declare-fun m!656761 () Bool)

(assert (=> bm!34286 m!656761))

(assert (=> b!695125 d!95977))

(declare-fun d!95983 () Bool)

(declare-fun res!459210 () Bool)

(declare-fun e!395413 () Bool)

(assert (=> d!95983 (=> res!459210 e!395413)))

(assert (=> d!95983 (= res!459210 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19497 lt!317004)))))

(assert (=> d!95983 (= (arrayNoDuplicates!0 lt!317004 (bvadd #b00000000000000000000000000000001 from!3004) lt!317007) e!395413)))

(declare-fun b!695243 () Bool)

(declare-fun e!395414 () Bool)

(assert (=> b!695243 (= e!395413 e!395414)))

(declare-fun res!459209 () Bool)

(assert (=> b!695243 (=> (not res!459209) (not e!395414))))

(declare-fun e!395412 () Bool)

(assert (=> b!695243 (= res!459209 (not e!395412))))

(declare-fun res!459211 () Bool)

(assert (=> b!695243 (=> (not res!459211) (not e!395412))))

(assert (=> b!695243 (= res!459211 (validKeyInArray!0 (select (arr!19112 lt!317004) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!695244 () Bool)

(declare-fun e!395415 () Bool)

(assert (=> b!695244 (= e!395414 e!395415)))

(declare-fun c!78384 () Bool)

(assert (=> b!695244 (= c!78384 (validKeyInArray!0 (select (arr!19112 lt!317004) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!695245 () Bool)

(declare-fun call!34290 () Bool)

(assert (=> b!695245 (= e!395415 call!34290)))

(declare-fun b!695246 () Bool)

(assert (=> b!695246 (= e!395415 call!34290)))

(declare-fun b!695247 () Bool)

(assert (=> b!695247 (= e!395412 (contains!3730 lt!317007 (select (arr!19112 lt!317004) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34287 () Bool)

(assert (=> bm!34287 (= call!34290 (arrayNoDuplicates!0 lt!317004 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78384 (Cons!13149 (select (arr!19112 lt!317004) (bvadd #b00000000000000000000000000000001 from!3004)) lt!317007) lt!317007)))))

(assert (= (and d!95983 (not res!459210)) b!695243))

(assert (= (and b!695243 res!459211) b!695247))

(assert (= (and b!695243 res!459209) b!695244))

(assert (= (and b!695244 c!78384) b!695246))

(assert (= (and b!695244 (not c!78384)) b!695245))

(assert (= (or b!695246 b!695245) bm!34287))

(declare-fun m!656763 () Bool)

(assert (=> b!695243 m!656763))

(assert (=> b!695243 m!656763))

(declare-fun m!656765 () Bool)

(assert (=> b!695243 m!656765))

(assert (=> b!695244 m!656763))

(assert (=> b!695244 m!656763))

(assert (=> b!695244 m!656765))

(assert (=> b!695247 m!656763))

(assert (=> b!695247 m!656763))

(declare-fun m!656767 () Bool)

(assert (=> b!695247 m!656767))

(assert (=> bm!34287 m!656763))

(declare-fun m!656769 () Bool)

(assert (=> bm!34287 m!656769))

(assert (=> b!695125 d!95983))

(declare-fun d!95985 () Bool)

(declare-fun e!395426 () Bool)

(assert (=> d!95985 e!395426))

(declare-fun res!459220 () Bool)

(assert (=> d!95985 (=> (not res!459220) (not e!395426))))

(assert (=> d!95985 (= res!459220 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19497 a!3626))))))

(declare-fun lt!317028 () Unit!24566)

(declare-fun choose!41 (array!39899 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13153) Unit!24566)

(assert (=> d!95985 (= lt!317028 (choose!41 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!317007))))

(assert (=> d!95985 (bvslt (size!19497 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95985 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!317007) lt!317028)))

(declare-fun b!695260 () Bool)

(assert (=> b!695260 (= e!395426 (arrayNoDuplicates!0 (array!39900 (store (arr!19112 a!3626) i!1382 k!2843) (size!19497 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!317007))))

(assert (= (and d!95985 res!459220) b!695260))

(declare-fun m!656787 () Bool)

(assert (=> d!95985 m!656787))

(assert (=> b!695260 m!656633))

(declare-fun m!656789 () Bool)

(assert (=> b!695260 m!656789))

(assert (=> b!695125 d!95985))

(declare-fun d!95991 () Bool)

(assert (=> d!95991 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!695135 d!95991))

(declare-fun d!95993 () Bool)

(declare-fun lt!317031 () Bool)

(assert (=> d!95993 (= lt!317031 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!322 lt!317007)))))

(declare-fun e!395430 () Bool)

(assert (=> d!95993 (= lt!317031 e!395430)))

(declare-fun res!459224 () Bool)

(assert (=> d!95993 (=> (not res!459224) (not e!395430))))

(assert (=> d!95993 (= res!459224 (is-Cons!13149 lt!317007))))

(assert (=> d!95993 (= (contains!3730 lt!317007 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317031)))

(declare-fun b!695263 () Bool)

(declare-fun e!395429 () Bool)

(assert (=> b!695263 (= e!395430 e!395429)))

(declare-fun res!459223 () Bool)

(assert (=> b!695263 (=> res!459223 e!395429)))

(assert (=> b!695263 (= res!459223 (= (h!14194 lt!317007) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!695264 () Bool)

(assert (=> b!695264 (= e!395429 (contains!3730 (t!19432 lt!317007) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95993 res!459224) b!695263))

(assert (= (and b!695263 (not res!459223)) b!695264))

(assert (=> d!95993 m!656725))

(declare-fun m!656791 () Bool)

(assert (=> d!95993 m!656791))

(declare-fun m!656793 () Bool)

(assert (=> b!695264 m!656793))

(assert (=> b!695114 d!95993))

(declare-fun d!95995 () Bool)

(declare-fun res!459234 () Bool)

(declare-fun e!395440 () Bool)

(assert (=> d!95995 (=> res!459234 e!395440)))

(assert (=> d!95995 (= res!459234 (is-Nil!13150 acc!681))))

(assert (=> d!95995 (= (noDuplicate!977 acc!681) e!395440)))

(declare-fun b!695274 () Bool)

(declare-fun e!395441 () Bool)

(assert (=> b!695274 (= e!395440 e!395441)))

(declare-fun res!459235 () Bool)

(assert (=> b!695274 (=> (not res!459235) (not e!395441))))

(assert (=> b!695274 (= res!459235 (not (contains!3730 (t!19432 acc!681) (h!14194 acc!681))))))

(declare-fun b!695275 () Bool)

(assert (=> b!695275 (= e!395441 (noDuplicate!977 (t!19432 acc!681)))))

(assert (= (and d!95995 (not res!459234)) b!695274))

(assert (= (and b!695274 res!459235) b!695275))

(declare-fun m!656799 () Bool)

(assert (=> b!695274 m!656799))

(declare-fun m!656801 () Bool)

(assert (=> b!695275 m!656801))

(assert (=> b!695113 d!95995))

(declare-fun d!95999 () Bool)

(declare-fun res!459238 () Bool)

(declare-fun e!395444 () Bool)

(assert (=> d!95999 (=> res!459238 e!395444)))

(assert (=> d!95999 (= res!459238 (is-Nil!13150 lt!317007))))

(assert (=> d!95999 (= (noDuplicate!977 lt!317007) e!395444)))

(declare-fun b!695278 () Bool)

(declare-fun e!395445 () Bool)

(assert (=> b!695278 (= e!395444 e!395445)))

(declare-fun res!459239 () Bool)

(assert (=> b!695278 (=> (not res!459239) (not e!395445))))

(assert (=> b!695278 (= res!459239 (not (contains!3730 (t!19432 lt!317007) (h!14194 lt!317007))))))

(declare-fun b!695279 () Bool)

(assert (=> b!695279 (= e!395445 (noDuplicate!977 (t!19432 lt!317007)))))

(assert (= (and d!95999 (not res!459238)) b!695278))

(assert (= (and b!695278 res!459239) b!695279))

(declare-fun m!656807 () Bool)

(assert (=> b!695278 m!656807))

(declare-fun m!656809 () Bool)

(assert (=> b!695279 m!656809))

(assert (=> b!695118 d!95999))

(declare-fun d!96003 () Bool)

(declare-fun res!459241 () Bool)

(declare-fun e!395447 () Bool)

(assert (=> d!96003 (=> res!459241 e!395447)))

(assert (=> d!96003 (= res!459241 (bvsge from!3004 (size!19497 a!3626)))))

(assert (=> d!96003 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!395447)))

(declare-fun b!695280 () Bool)

(declare-fun e!395448 () Bool)

(assert (=> b!695280 (= e!395447 e!395448)))

(declare-fun res!459240 () Bool)

(assert (=> b!695280 (=> (not res!459240) (not e!395448))))

(declare-fun e!395446 () Bool)

(assert (=> b!695280 (= res!459240 (not e!395446))))

(declare-fun res!459242 () Bool)

(assert (=> b!695280 (=> (not res!459242) (not e!395446))))

(assert (=> b!695280 (= res!459242 (validKeyInArray!0 (select (arr!19112 a!3626) from!3004)))))

(declare-fun b!695281 () Bool)

(declare-fun e!395449 () Bool)

(assert (=> b!695281 (= e!395448 e!395449)))

(declare-fun c!78387 () Bool)

(assert (=> b!695281 (= c!78387 (validKeyInArray!0 (select (arr!19112 a!3626) from!3004)))))

(declare-fun b!695282 () Bool)

(declare-fun call!34293 () Bool)

(assert (=> b!695282 (= e!395449 call!34293)))

(declare-fun b!695283 () Bool)

(assert (=> b!695283 (= e!395449 call!34293)))

(declare-fun b!695284 () Bool)

(assert (=> b!695284 (= e!395446 (contains!3730 acc!681 (select (arr!19112 a!3626) from!3004)))))

(declare-fun bm!34290 () Bool)

(assert (=> bm!34290 (= call!34293 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78387 (Cons!13149 (select (arr!19112 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!96003 (not res!459241)) b!695280))

(assert (= (and b!695280 res!459242) b!695284))

(assert (= (and b!695280 res!459240) b!695281))

(assert (= (and b!695281 c!78387) b!695283))

(assert (= (and b!695281 (not c!78387)) b!695282))

(assert (= (or b!695283 b!695282) bm!34290))

(assert (=> b!695280 m!656641))

(assert (=> b!695280 m!656641))

(assert (=> b!695280 m!656643))

(assert (=> b!695281 m!656641))

(assert (=> b!695281 m!656641))

(assert (=> b!695281 m!656643))

(assert (=> b!695284 m!656641))

(assert (=> b!695284 m!656641))

(declare-fun m!656811 () Bool)

(assert (=> b!695284 m!656811))

(assert (=> bm!34290 m!656641))

(declare-fun m!656813 () Bool)

(assert (=> bm!34290 m!656813))

(assert (=> b!695116 d!96003))

(declare-fun d!96007 () Bool)

(declare-fun lt!317033 () Bool)

(assert (=> d!96007 (= lt!317033 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!322 acc!681)))))

(declare-fun e!395451 () Bool)

(assert (=> d!96007 (= lt!317033 e!395451)))

(declare-fun res!459244 () Bool)

(assert (=> d!96007 (=> (not res!459244) (not e!395451))))

(assert (=> d!96007 (= res!459244 (is-Cons!13149 acc!681))))

(assert (=> d!96007 (= (contains!3730 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317033)))

(declare-fun b!695285 () Bool)

(declare-fun e!395450 () Bool)

(assert (=> b!695285 (= e!395451 e!395450)))

(declare-fun res!459243 () Bool)

(assert (=> b!695285 (=> res!459243 e!395450)))

(assert (=> b!695285 (= res!459243 (= (h!14194 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!695286 () Bool)

(assert (=> b!695286 (= e!395450 (contains!3730 (t!19432 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96007 res!459244) b!695285))

(assert (= (and b!695285 (not res!459243)) b!695286))

(declare-fun m!656815 () Bool)

(assert (=> d!96007 m!656815))

(declare-fun m!656817 () Bool)

(assert (=> d!96007 m!656817))

(declare-fun m!656819 () Bool)

(assert (=> b!695286 m!656819))

(assert (=> b!695110 d!96007))

(declare-fun d!96009 () Bool)

(declare-fun lt!317034 () Bool)

(assert (=> d!96009 (= lt!317034 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!322 acc!681)))))

(declare-fun e!395453 () Bool)

(assert (=> d!96009 (= lt!317034 e!395453)))

(declare-fun res!459246 () Bool)

(assert (=> d!96009 (=> (not res!459246) (not e!395453))))

(assert (=> d!96009 (= res!459246 (is-Cons!13149 acc!681))))

(assert (=> d!96009 (= (contains!3730 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317034)))

(declare-fun b!695287 () Bool)

(declare-fun e!395452 () Bool)

(assert (=> b!695287 (= e!395453 e!395452)))

(declare-fun res!459245 () Bool)

(assert (=> b!695287 (=> res!459245 e!395452)))

(assert (=> b!695287 (= res!459245 (= (h!14194 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!695288 () Bool)

(assert (=> b!695288 (= e!395452 (contains!3730 (t!19432 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96009 res!459246) b!695287))

(assert (= (and b!695287 (not res!459245)) b!695288))

(assert (=> d!96009 m!656815))

(declare-fun m!656821 () Bool)

(assert (=> d!96009 m!656821))

(declare-fun m!656823 () Bool)

(assert (=> b!695288 m!656823))

(assert (=> b!695120 d!96009))

(declare-fun d!96011 () Bool)

(assert (=> d!96011 (= (array_inv!14908 a!3626) (bvsge (size!19497 a!3626) #b00000000000000000000000000000000))))

