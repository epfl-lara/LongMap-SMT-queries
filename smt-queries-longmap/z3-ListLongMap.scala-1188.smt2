; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25508 () Bool)

(assert start!25508)

(declare-fun b!265043 () Bool)

(declare-fun res!129537 () Bool)

(declare-fun e!171638 () Bool)

(assert (=> b!265043 (=> (not res!129537) (not e!171638))))

(declare-datatypes ((array!12759 0))(
  ( (array!12760 (arr!6036 (Array (_ BitVec 32) (_ BitVec 64))) (size!6389 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12759)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265043 (= res!129537 (and (= (size!6389 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6389 a!3436))))))

(declare-fun res!129540 () Bool)

(assert (=> start!25508 (=> (not res!129540) (not e!171638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25508 (= res!129540 (validMask!0 mask!4002))))

(assert (=> start!25508 e!171638))

(assert (=> start!25508 true))

(declare-fun array_inv!4008 (array!12759) Bool)

(assert (=> start!25508 (array_inv!4008 a!3436)))

(declare-fun b!265044 () Bool)

(declare-fun res!129535 () Bool)

(declare-fun e!171637 () Bool)

(assert (=> b!265044 (=> (not res!129535) (not e!171637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12759 (_ BitVec 32)) Bool)

(assert (=> b!265044 (= res!129535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265045 () Bool)

(declare-datatypes ((List!3823 0))(
  ( (Nil!3820) (Cons!3819 (h!4486 (_ BitVec 64)) (t!8896 List!3823)) )
))
(declare-fun noDuplicate!106 (List!3823) Bool)

(assert (=> b!265045 (= e!171637 (not (noDuplicate!106 Nil!3820)))))

(declare-fun b!265046 () Bool)

(assert (=> b!265046 (= e!171638 e!171637)))

(declare-fun res!129539 () Bool)

(assert (=> b!265046 (=> (not res!129539) (not e!171637))))

(declare-datatypes ((SeekEntryResult!1226 0))(
  ( (MissingZero!1226 (index!7074 (_ BitVec 32))) (Found!1226 (index!7075 (_ BitVec 32))) (Intermediate!1226 (undefined!2038 Bool) (index!7076 (_ BitVec 32)) (x!25414 (_ BitVec 32))) (Undefined!1226) (MissingVacant!1226 (index!7077 (_ BitVec 32))) )
))
(declare-fun lt!133842 () SeekEntryResult!1226)

(assert (=> b!265046 (= res!129539 (or (= lt!133842 (MissingZero!1226 i!1355)) (= lt!133842 (MissingVacant!1226 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12759 (_ BitVec 32)) SeekEntryResult!1226)

(assert (=> b!265046 (= lt!133842 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265047 () Bool)

(declare-fun res!129541 () Bool)

(assert (=> b!265047 (=> (not res!129541) (not e!171638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265047 (= res!129541 (validKeyInArray!0 k0!2698))))

(declare-fun b!265048 () Bool)

(declare-fun res!129538 () Bool)

(assert (=> b!265048 (=> (not res!129538) (not e!171638))))

(declare-fun arrayContainsKey!0 (array!12759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265048 (= res!129538 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265049 () Bool)

(declare-fun res!129536 () Bool)

(assert (=> b!265049 (=> (not res!129536) (not e!171637))))

(assert (=> b!265049 (= res!129536 (and (bvsle #b00000000000000000000000000000000 (size!6389 a!3436)) (bvslt (size!6389 a!3436) #b01111111111111111111111111111111)))))

(assert (= (and start!25508 res!129540) b!265043))

(assert (= (and b!265043 res!129537) b!265047))

(assert (= (and b!265047 res!129541) b!265048))

(assert (= (and b!265048 res!129538) b!265046))

(assert (= (and b!265046 res!129539) b!265044))

(assert (= (and b!265044 res!129535) b!265049))

(assert (= (and b!265049 res!129536) b!265045))

(declare-fun m!281465 () Bool)

(assert (=> b!265044 m!281465))

(declare-fun m!281467 () Bool)

(assert (=> start!25508 m!281467))

(declare-fun m!281469 () Bool)

(assert (=> start!25508 m!281469))

(declare-fun m!281471 () Bool)

(assert (=> b!265046 m!281471))

(declare-fun m!281473 () Bool)

(assert (=> b!265048 m!281473))

(declare-fun m!281475 () Bool)

(assert (=> b!265045 m!281475))

(declare-fun m!281477 () Bool)

(assert (=> b!265047 m!281477))

(check-sat (not start!25508) (not b!265044) (not b!265045) (not b!265047) (not b!265048) (not b!265046))
(check-sat)
(get-model)

(declare-fun d!63995 () Bool)

(assert (=> d!63995 (= (validKeyInArray!0 k0!2698) (and (not (= k0!2698 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2698 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!265047 d!63995))

(declare-fun lt!133866 () SeekEntryResult!1226)

(declare-fun e!171675 () SeekEntryResult!1226)

(declare-fun b!265117 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12759 (_ BitVec 32)) SeekEntryResult!1226)

(assert (=> b!265117 (= e!171675 (seekKeyOrZeroReturnVacant!0 (x!25414 lt!133866) (index!7076 lt!133866) (index!7076 lt!133866) k0!2698 a!3436 mask!4002))))

(declare-fun b!265118 () Bool)

(declare-fun e!171673 () SeekEntryResult!1226)

(declare-fun e!171674 () SeekEntryResult!1226)

(assert (=> b!265118 (= e!171673 e!171674)))

(declare-fun lt!133864 () (_ BitVec 64))

(assert (=> b!265118 (= lt!133864 (select (arr!6036 a!3436) (index!7076 lt!133866)))))

(declare-fun c!45315 () Bool)

(assert (=> b!265118 (= c!45315 (= lt!133864 k0!2698))))

(declare-fun b!265119 () Bool)

(assert (=> b!265119 (= e!171674 (Found!1226 (index!7076 lt!133866)))))

(declare-fun b!265116 () Bool)

(assert (=> b!265116 (= e!171675 (MissingZero!1226 (index!7076 lt!133866)))))

(declare-fun d!63997 () Bool)

(declare-fun lt!133865 () SeekEntryResult!1226)

(get-info :version)

(assert (=> d!63997 (and (or ((_ is Undefined!1226) lt!133865) (not ((_ is Found!1226) lt!133865)) (and (bvsge (index!7075 lt!133865) #b00000000000000000000000000000000) (bvslt (index!7075 lt!133865) (size!6389 a!3436)))) (or ((_ is Undefined!1226) lt!133865) ((_ is Found!1226) lt!133865) (not ((_ is MissingZero!1226) lt!133865)) (and (bvsge (index!7074 lt!133865) #b00000000000000000000000000000000) (bvslt (index!7074 lt!133865) (size!6389 a!3436)))) (or ((_ is Undefined!1226) lt!133865) ((_ is Found!1226) lt!133865) ((_ is MissingZero!1226) lt!133865) (not ((_ is MissingVacant!1226) lt!133865)) (and (bvsge (index!7077 lt!133865) #b00000000000000000000000000000000) (bvslt (index!7077 lt!133865) (size!6389 a!3436)))) (or ((_ is Undefined!1226) lt!133865) (ite ((_ is Found!1226) lt!133865) (= (select (arr!6036 a!3436) (index!7075 lt!133865)) k0!2698) (ite ((_ is MissingZero!1226) lt!133865) (= (select (arr!6036 a!3436) (index!7074 lt!133865)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1226) lt!133865) (= (select (arr!6036 a!3436) (index!7077 lt!133865)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63997 (= lt!133865 e!171673)))

(declare-fun c!45314 () Bool)

(assert (=> d!63997 (= c!45314 (and ((_ is Intermediate!1226) lt!133866) (undefined!2038 lt!133866)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12759 (_ BitVec 32)) SeekEntryResult!1226)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!63997 (= lt!133866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2698 mask!4002) k0!2698 a!3436 mask!4002))))

(assert (=> d!63997 (validMask!0 mask!4002)))

(assert (=> d!63997 (= (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002) lt!133865)))

(declare-fun b!265120 () Bool)

(declare-fun c!45316 () Bool)

(assert (=> b!265120 (= c!45316 (= lt!133864 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!265120 (= e!171674 e!171675)))

(declare-fun b!265121 () Bool)

(assert (=> b!265121 (= e!171673 Undefined!1226)))

(assert (= (and d!63997 c!45314) b!265121))

(assert (= (and d!63997 (not c!45314)) b!265118))

(assert (= (and b!265118 c!45315) b!265119))

(assert (= (and b!265118 (not c!45315)) b!265120))

(assert (= (and b!265120 c!45316) b!265116))

(assert (= (and b!265120 (not c!45316)) b!265117))

(declare-fun m!281519 () Bool)

(assert (=> b!265117 m!281519))

(declare-fun m!281521 () Bool)

(assert (=> b!265118 m!281521))

(declare-fun m!281523 () Bool)

(assert (=> d!63997 m!281523))

(declare-fun m!281525 () Bool)

(assert (=> d!63997 m!281525))

(declare-fun m!281527 () Bool)

(assert (=> d!63997 m!281527))

(assert (=> d!63997 m!281467))

(assert (=> d!63997 m!281525))

(declare-fun m!281529 () Bool)

(assert (=> d!63997 m!281529))

(declare-fun m!281531 () Bool)

(assert (=> d!63997 m!281531))

(assert (=> b!265046 d!63997))

(declare-fun d!64007 () Bool)

(declare-fun res!129594 () Bool)

(declare-fun e!171686 () Bool)

(assert (=> d!64007 (=> res!129594 e!171686)))

(assert (=> d!64007 (= res!129594 ((_ is Nil!3820) Nil!3820))))

(assert (=> d!64007 (= (noDuplicate!106 Nil!3820) e!171686)))

(declare-fun b!265138 () Bool)

(declare-fun e!171687 () Bool)

(assert (=> b!265138 (= e!171686 e!171687)))

(declare-fun res!129595 () Bool)

(assert (=> b!265138 (=> (not res!129595) (not e!171687))))

(declare-fun contains!1894 (List!3823 (_ BitVec 64)) Bool)

(assert (=> b!265138 (= res!129595 (not (contains!1894 (t!8896 Nil!3820) (h!4486 Nil!3820))))))

(declare-fun b!265139 () Bool)

(assert (=> b!265139 (= e!171687 (noDuplicate!106 (t!8896 Nil!3820)))))

(assert (= (and d!64007 (not res!129594)) b!265138))

(assert (= (and b!265138 res!129595) b!265139))

(declare-fun m!281533 () Bool)

(assert (=> b!265138 m!281533))

(declare-fun m!281535 () Bool)

(assert (=> b!265139 m!281535))

(assert (=> b!265045 d!64007))

(declare-fun b!265172 () Bool)

(declare-fun e!171711 () Bool)

(declare-fun call!25303 () Bool)

(assert (=> b!265172 (= e!171711 call!25303)))

(declare-fun b!265173 () Bool)

(declare-fun e!171710 () Bool)

(assert (=> b!265173 (= e!171710 call!25303)))

(declare-fun bm!25300 () Bool)

(assert (=> bm!25300 (= call!25303 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3436 mask!4002))))

(declare-fun b!265175 () Bool)

(declare-fun e!171709 () Bool)

(assert (=> b!265175 (= e!171709 e!171711)))

(declare-fun c!45334 () Bool)

(assert (=> b!265175 (= c!45334 (validKeyInArray!0 (select (arr!6036 a!3436) #b00000000000000000000000000000000)))))

(declare-fun b!265174 () Bool)

(assert (=> b!265174 (= e!171711 e!171710)))

(declare-fun lt!133889 () (_ BitVec 64))

(assert (=> b!265174 (= lt!133889 (select (arr!6036 a!3436) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8215 0))(
  ( (Unit!8216) )
))
(declare-fun lt!133890 () Unit!8215)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12759 (_ BitVec 64) (_ BitVec 32)) Unit!8215)

(assert (=> b!265174 (= lt!133890 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3436 lt!133889 #b00000000000000000000000000000000))))

(assert (=> b!265174 (arrayContainsKey!0 a!3436 lt!133889 #b00000000000000000000000000000000)))

(declare-fun lt!133888 () Unit!8215)

(assert (=> b!265174 (= lt!133888 lt!133890)))

(declare-fun res!129606 () Bool)

(assert (=> b!265174 (= res!129606 (= (seekEntryOrOpen!0 (select (arr!6036 a!3436) #b00000000000000000000000000000000) a!3436 mask!4002) (Found!1226 #b00000000000000000000000000000000)))))

(assert (=> b!265174 (=> (not res!129606) (not e!171710))))

(declare-fun d!64009 () Bool)

(declare-fun res!129607 () Bool)

(assert (=> d!64009 (=> res!129607 e!171709)))

(assert (=> d!64009 (= res!129607 (bvsge #b00000000000000000000000000000000 (size!6389 a!3436)))))

(assert (=> d!64009 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002) e!171709)))

(assert (= (and d!64009 (not res!129607)) b!265175))

(assert (= (and b!265175 c!45334) b!265174))

(assert (= (and b!265175 (not c!45334)) b!265172))

(assert (= (and b!265174 res!129606) b!265173))

(assert (= (or b!265173 b!265172) bm!25300))

(declare-fun m!281555 () Bool)

(assert (=> bm!25300 m!281555))

(declare-fun m!281557 () Bool)

(assert (=> b!265175 m!281557))

(assert (=> b!265175 m!281557))

(declare-fun m!281559 () Bool)

(assert (=> b!265175 m!281559))

(assert (=> b!265174 m!281557))

(declare-fun m!281561 () Bool)

(assert (=> b!265174 m!281561))

(declare-fun m!281563 () Bool)

(assert (=> b!265174 m!281563))

(assert (=> b!265174 m!281557))

(declare-fun m!281565 () Bool)

(assert (=> b!265174 m!281565))

(assert (=> b!265044 d!64009))

(declare-fun d!64015 () Bool)

(assert (=> d!64015 (= (validMask!0 mask!4002) (and (or (= mask!4002 #b00000000000000000000000000000111) (= mask!4002 #b00000000000000000000000000001111) (= mask!4002 #b00000000000000000000000000011111) (= mask!4002 #b00000000000000000000000000111111) (= mask!4002 #b00000000000000000000000001111111) (= mask!4002 #b00000000000000000000000011111111) (= mask!4002 #b00000000000000000000000111111111) (= mask!4002 #b00000000000000000000001111111111) (= mask!4002 #b00000000000000000000011111111111) (= mask!4002 #b00000000000000000000111111111111) (= mask!4002 #b00000000000000000001111111111111) (= mask!4002 #b00000000000000000011111111111111) (= mask!4002 #b00000000000000000111111111111111) (= mask!4002 #b00000000000000001111111111111111) (= mask!4002 #b00000000000000011111111111111111) (= mask!4002 #b00000000000000111111111111111111) (= mask!4002 #b00000000000001111111111111111111) (= mask!4002 #b00000000000011111111111111111111) (= mask!4002 #b00000000000111111111111111111111) (= mask!4002 #b00000000001111111111111111111111) (= mask!4002 #b00000000011111111111111111111111) (= mask!4002 #b00000000111111111111111111111111) (= mask!4002 #b00000001111111111111111111111111) (= mask!4002 #b00000011111111111111111111111111) (= mask!4002 #b00000111111111111111111111111111) (= mask!4002 #b00001111111111111111111111111111) (= mask!4002 #b00011111111111111111111111111111) (= mask!4002 #b00111111111111111111111111111111)) (bvsle mask!4002 #b00111111111111111111111111111111)))))

(assert (=> start!25508 d!64015))

(declare-fun d!64023 () Bool)

(assert (=> d!64023 (= (array_inv!4008 a!3436) (bvsge (size!6389 a!3436) #b00000000000000000000000000000000))))

(assert (=> start!25508 d!64023))

(declare-fun d!64025 () Bool)

(declare-fun res!129624 () Bool)

(declare-fun e!171734 () Bool)

(assert (=> d!64025 (=> res!129624 e!171734)))

(assert (=> d!64025 (= res!129624 (= (select (arr!6036 a!3436) #b00000000000000000000000000000000) k0!2698))))

(assert (=> d!64025 (= (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000) e!171734)))

(declare-fun b!265204 () Bool)

(declare-fun e!171735 () Bool)

(assert (=> b!265204 (= e!171734 e!171735)))

(declare-fun res!129625 () Bool)

(assert (=> b!265204 (=> (not res!129625) (not e!171735))))

(assert (=> b!265204 (= res!129625 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6389 a!3436)))))

(declare-fun b!265205 () Bool)

(assert (=> b!265205 (= e!171735 (arrayContainsKey!0 a!3436 k0!2698 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64025 (not res!129624)) b!265204))

(assert (= (and b!265204 res!129625) b!265205))

(assert (=> d!64025 m!281557))

(declare-fun m!281595 () Bool)

(assert (=> b!265205 m!281595))

(assert (=> b!265048 d!64025))

(check-sat (not b!265174) (not b!265117) (not b!265139) (not d!63997) (not b!265175) (not b!265205) (not bm!25300) (not b!265138))
(check-sat)
