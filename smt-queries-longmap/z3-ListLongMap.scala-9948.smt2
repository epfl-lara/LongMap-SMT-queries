; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117548 () Bool)

(assert start!117548)

(declare-fun res!922585 () Bool)

(declare-fun e!782321 () Bool)

(assert (=> start!117548 (=> (not res!922585) (not e!782321))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94066 0))(
  ( (array!94067 (arr!45426 (Array (_ BitVec 32) (_ BitVec 64))) (size!45976 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94066)

(assert (=> start!117548 (= res!922585 (and (bvslt (size!45976 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45976 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117548 e!782321))

(declare-fun array_inv!34454 (array!94066) Bool)

(assert (=> start!117548 (array_inv!34454 a!3931)))

(assert (=> start!117548 true))

(declare-fun call!66294 () (_ BitVec 32))

(declare-fun bm!66291 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94066 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66291 (= call!66294 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380571 () Bool)

(assert (=> b!1380571 (= e!782321 (not true))))

(declare-fun e!782319 () Bool)

(assert (=> b!1380571 e!782319))

(declare-fun c!128433 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380571 (= c!128433 (validKeyInArray!0 (select (arr!45426 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45983 0))(
  ( (Unit!45984) )
))
(declare-fun lt!608010 () Unit!45983)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94066 (_ BitVec 32) (_ BitVec 32)) Unit!45983)

(assert (=> b!1380571 (= lt!608010 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66292 () Bool)

(declare-fun call!66295 () (_ BitVec 32))

(assert (=> bm!66292 (= call!66295 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380572 () Bool)

(assert (=> b!1380572 (= e!782319 (= call!66294 call!66295))))

(declare-fun b!1380573 () Bool)

(assert (=> b!1380573 (= e!782319 (= (bvadd #b00000000000000000000000000000001 call!66294) call!66295))))

(assert (= (and start!117548 res!922585) b!1380571))

(assert (= (and b!1380571 c!128433) b!1380573))

(assert (= (and b!1380571 (not c!128433)) b!1380572))

(assert (= (or b!1380573 b!1380572) bm!66292))

(assert (= (or b!1380573 b!1380572) bm!66291))

(declare-fun m!1265757 () Bool)

(assert (=> start!117548 m!1265757))

(declare-fun m!1265759 () Bool)

(assert (=> bm!66291 m!1265759))

(declare-fun m!1265761 () Bool)

(assert (=> b!1380571 m!1265761))

(assert (=> b!1380571 m!1265761))

(declare-fun m!1265763 () Bool)

(assert (=> b!1380571 m!1265763))

(declare-fun m!1265765 () Bool)

(assert (=> b!1380571 m!1265765))

(declare-fun m!1265767 () Bool)

(assert (=> bm!66292 m!1265767))

(check-sat (not bm!66292) (not b!1380571) (not bm!66291) (not start!117548))
