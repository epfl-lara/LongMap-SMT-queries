; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117378 () Bool)

(assert start!117378)

(declare-fun res!922202 () Bool)

(declare-fun e!781767 () Bool)

(assert (=> start!117378 (=> (not res!922202) (not e!781767))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93892 0))(
  ( (array!93893 (arr!45342 (Array (_ BitVec 32) (_ BitVec 64))) (size!45894 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93892)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117378 (= res!922202 (and (bvslt (size!45894 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45894 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184)))))

(assert (=> start!117378 e!781767))

(declare-fun array_inv!34575 (array!93892) Bool)

(assert (=> start!117378 (array_inv!34575 a!4010)))

(assert (=> start!117378 true))

(declare-fun b!1379829 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93892 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379829 (= e!781767 (not (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184))))))

(assert (= (and start!117378 res!922202) b!1379829))

(declare-fun m!1264621 () Bool)

(assert (=> start!117378 m!1264621))

(declare-fun m!1264623 () Bool)

(assert (=> b!1379829 m!1264623))

(declare-fun m!1264625 () Bool)

(assert (=> b!1379829 m!1264625))

(declare-fun m!1264627 () Bool)

(assert (=> b!1379829 m!1264627))

(push 1)

(assert (not b!1379829))

(assert (not start!117378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1379866 () Bool)

(declare-fun e!781787 () (_ BitVec 32))

(declare-fun e!781788 () (_ BitVec 32))

(assert (=> b!1379866 (= e!781787 e!781788)))

(declare-fun c!128274 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379866 (= c!128274 (validKeyInArray!0 (select (arr!45342 a!4010) from!3388)))))

(declare-fun call!66103 () (_ BitVec 32))

(declare-fun bm!66100 () Bool)

(assert (=> bm!66100 (= call!66103 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) pivot!64))))

(declare-fun b!1379867 () Bool)

(assert (=> b!1379867 (= e!781787 #b00000000000000000000000000000000)))

(declare-fun b!1379868 () Bool)

(assert (=> b!1379868 (= e!781788 call!66103)))

(declare-fun d!148571 () Bool)

(declare-fun lt!607614 () (_ BitVec 32))

(assert (=> d!148571 (and (bvsge lt!607614 #b00000000000000000000000000000000) (bvsle lt!607614 (bvsub (size!45894 a!4010) from!3388)))))

(assert (=> d!148571 (= lt!607614 e!781787)))

(declare-fun c!128275 () Bool)

(assert (=> d!148571 (= c!128275 (bvsge from!3388 pivot!64))))

(assert (=> d!148571 (and (bvsle from!3388 pivot!64) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle pivot!64 (size!45894 a!4010)))))

(assert (=> d!148571 (= (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) lt!607614)))

(declare-fun b!1379869 () Bool)

(assert (=> b!1379869 (= e!781788 (bvadd #b00000000000000000000000000000001 call!66103))))

(assert (= (and d!148571 c!128275) b!1379867))

(assert (= (and d!148571 (not c!128275)) b!1379866))

(assert (= (and b!1379866 c!128274) b!1379869))

(assert (= (and b!1379866 (not c!128274)) b!1379868))

(assert (= (or b!1379869 b!1379868) bm!66100))

(declare-fun m!1264643 () Bool)

(assert (=> b!1379866 m!1264643))

(assert (=> b!1379866 m!1264643))

(declare-fun m!1264645 () Bool)

(assert (=> b!1379866 m!1264645))

(declare-fun m!1264647 () Bool)

(assert (=> bm!66100 m!1264647))

(assert (=> b!1379829 d!148571))

(declare-fun b!1379870 () Bool)

(declare-fun e!781789 () (_ BitVec 32))

(declare-fun e!781790 () (_ BitVec 32))

(assert (=> b!1379870 (= e!781789 e!781790)))

(declare-fun c!128276 () Bool)

(assert (=> b!1379870 (= c!128276 (validKeyInArray!0 (select (arr!45342 a!4010) pivot!64)))))

(declare-fun call!66104 () (_ BitVec 32))

(declare-fun bm!66101 () Bool)

(assert (=> bm!66101 (= call!66104 (arrayCountValidKeys!0 a!4010 (bvadd pivot!64 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1379871 () Bool)

(assert (=> b!1379871 (= e!781789 #b00000000000000000000000000000000)))

(declare-fun b!1379872 () Bool)

(assert (=> b!1379872 (= e!781790 call!66104)))

(declare-fun d!148581 () Bool)

(declare-fun lt!607615 () (_ BitVec 32))

(assert (=> d!148581 (and (bvsge lt!607615 #b00000000000000000000000000000000) (bvsle lt!607615 (bvsub (size!45894 a!4010) pivot!64)))))

(assert (=> d!148581 (= lt!607615 e!781789)))

(declare-fun c!128277 () Bool)

(assert (=> d!148581 (= c!128277 (bvsge pivot!64 to!184))))

(assert (=> d!148581 (and (bvsle pivot!64 to!184) (bvsge pivot!64 #b00000000000000000000000000000000) (bvsle to!184 (size!45894 a!4010)))))

(assert (=> d!148581 (= (arrayCountValidKeys!0 a!4010 pivot!64 to!184) lt!607615)))

(declare-fun b!1379873 () Bool)

(assert (=> b!1379873 (= e!781790 (bvadd #b00000000000000000000000000000001 call!66104))))

(assert (= (and d!148581 c!128277) b!1379871))

(assert (= (and d!148581 (not c!128277)) b!1379870))

(assert (= (and b!1379870 c!128276) b!1379873))

(assert (= (and b!1379870 (not c!128276)) b!1379872))

(assert (= (or b!1379873 b!1379872) bm!66101))

(declare-fun m!1264649 () Bool)

(assert (=> b!1379870 m!1264649))

(assert (=> b!1379870 m!1264649))

(declare-fun m!1264651 () Bool)

(assert (=> b!1379870 m!1264651))

(declare-fun m!1264653 () Bool)

(assert (=> bm!66101 m!1264653))

(assert (=> b!1379829 d!148581))

(declare-fun b!1379874 () Bool)

(declare-fun e!781791 () (_ BitVec 32))

(declare-fun e!781792 () (_ BitVec 32))

(assert (=> b!1379874 (= e!781791 e!781792)))

(declare-fun c!128278 () Bool)

(assert (=> b!1379874 (= c!128278 (validKeyInArray!0 (select (arr!45342 a!4010) from!3388)))))

(declare-fun call!66105 () (_ BitVec 32))

(declare-fun bm!66102 () Bool)

(assert (=> bm!66102 (= call!66105 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1379875 () Bool)

(assert (=> b!1379875 (= e!781791 #b00000000000000000000000000000000)))

(declare-fun b!1379876 () Bool)

(assert (=> b!1379876 (= e!781792 call!66105)))

(declare-fun d!148583 () Bool)

(declare-fun lt!607616 () (_ BitVec 32))

(assert (=> d!148583 (and (bvsge lt!607616 #b00000000000000000000000000000000) (bvsle lt!607616 (bvsub (size!45894 a!4010) from!3388)))))

(assert (=> d!148583 (= lt!607616 e!781791)))

(declare-fun c!128279 () Bool)

(assert (=> d!148583 (= c!128279 (bvsge from!3388 to!184))))

(assert (=> d!148583 (and (bvsle from!3388 to!184) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle to!184 (size!45894 a!4010)))))

(assert (=> d!148583 (= (arrayCountValidKeys!0 a!4010 from!3388 to!184) lt!607616)))

(declare-fun b!1379877 () Bool)

(assert (=> b!1379877 (= e!781792 (bvadd #b00000000000000000000000000000001 call!66105))))

(assert (= (and d!148583 c!128279) b!1379875))

(assert (= (and d!148583 (not c!128279)) b!1379874))

(assert (= (and b!1379874 c!128278) b!1379877))

(assert (= (and b!1379874 (not c!128278)) b!1379876))

(assert (= (or b!1379877 b!1379876) bm!66102))

(assert (=> b!1379874 m!1264643))

(assert (=> b!1379874 m!1264643))

(assert (=> b!1379874 m!1264645))

(declare-fun m!1264655 () Bool)

(assert (=> bm!66102 m!1264655))

(assert (=> b!1379829 d!148583))

(declare-fun d!148585 () Bool)

(assert (=> d!148585 (= (array_inv!34575 a!4010) (bvsge (size!45894 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117378 d!148585))

(push 1)

(assert (not bm!66101))

(assert (not b!1379870))

(assert (not b!1379866))

(assert (not b!1379874))

(assert (not bm!66100))

(assert (not bm!66102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

