; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117764 () Bool)

(assert start!117764)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun b!1381809 () Bool)

(declare-fun e!783098 () Bool)

(declare-datatypes ((array!94166 0))(
  ( (array!94167 (arr!45471 (Array (_ BitVec 32) (_ BitVec 64))) (size!46022 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94166)

(declare-fun lt!608457 () Bool)

(assert (=> b!1381809 (= e!783098 (not (or (not lt!608457) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46022 a!3931)))))))

(declare-fun e!783097 () Bool)

(assert (=> b!1381809 e!783097))

(declare-fun c!128811 () Bool)

(assert (=> b!1381809 (= c!128811 lt!608457)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381809 (= lt!608457 (validKeyInArray!0 (select (arr!45471 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((Unit!45906 0))(
  ( (Unit!45907) )
))
(declare-fun lt!608458 () Unit!45906)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94166 (_ BitVec 32) (_ BitVec 32)) Unit!45906)

(assert (=> b!1381809 (= lt!608458 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1381810 () Bool)

(declare-fun call!66314 () (_ BitVec 32))

(declare-fun call!66313 () (_ BitVec 32))

(assert (=> b!1381810 (= e!783097 (= call!66314 call!66313))))

(declare-fun bm!66310 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94166 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66310 (= call!66314 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1381811 () Bool)

(assert (=> b!1381811 (= e!783097 (= (bvadd #b00000000000000000000000000000001 call!66314) call!66313))))

(declare-fun res!923082 () Bool)

(assert (=> start!117764 (=> (not res!923082) (not e!783098))))

(assert (=> start!117764 (= res!923082 (and (bvslt (size!46022 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46022 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117764 e!783098))

(declare-fun array_inv!34752 (array!94166) Bool)

(assert (=> start!117764 (array_inv!34752 a!3931)))

(assert (=> start!117764 true))

(declare-fun bm!66311 () Bool)

(assert (=> bm!66311 (= call!66313 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (= (and start!117764 res!923082) b!1381809))

(assert (= (and b!1381809 c!128811) b!1381811))

(assert (= (and b!1381809 (not c!128811)) b!1381810))

(assert (= (or b!1381811 b!1381810) bm!66311))

(assert (= (or b!1381811 b!1381810) bm!66310))

(declare-fun m!1267297 () Bool)

(assert (=> b!1381809 m!1267297))

(assert (=> b!1381809 m!1267297))

(declare-fun m!1267299 () Bool)

(assert (=> b!1381809 m!1267299))

(declare-fun m!1267301 () Bool)

(assert (=> b!1381809 m!1267301))

(declare-fun m!1267303 () Bool)

(assert (=> bm!66310 m!1267303))

(declare-fun m!1267305 () Bool)

(assert (=> start!117764 m!1267305))

(declare-fun m!1267307 () Bool)

(assert (=> bm!66311 m!1267307))

(push 1)

(assert (not b!1381809))

(assert (not bm!66310))

(assert (not start!117764))

(assert (not bm!66311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

