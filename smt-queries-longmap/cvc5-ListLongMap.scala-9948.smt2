; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117546 () Bool)

(assert start!117546)

(declare-fun res!922582 () Bool)

(declare-fun e!782311 () Bool)

(assert (=> start!117546 (=> (not res!922582) (not e!782311))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94064 0))(
  ( (array!94065 (arr!45425 (Array (_ BitVec 32) (_ BitVec 64))) (size!45975 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94064)

(assert (=> start!117546 (= res!922582 (and (bvslt (size!45975 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45975 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117546 e!782311))

(declare-fun array_inv!34453 (array!94064) Bool)

(assert (=> start!117546 (array_inv!34453 a!3931)))

(assert (=> start!117546 true))

(declare-fun bm!66285 () Bool)

(declare-fun call!66288 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!94064 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66285 (= call!66288 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380562 () Bool)

(assert (=> b!1380562 (= e!782311 (not true))))

(declare-fun e!782312 () Bool)

(assert (=> b!1380562 e!782312))

(declare-fun c!128430 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380562 (= c!128430 (validKeyInArray!0 (select (arr!45425 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45981 0))(
  ( (Unit!45982) )
))
(declare-fun lt!608007 () Unit!45981)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94064 (_ BitVec 32) (_ BitVec 32)) Unit!45981)

(assert (=> b!1380562 (= lt!608007 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380563 () Bool)

(declare-fun call!66289 () (_ BitVec 32))

(assert (=> b!1380563 (= e!782312 (= (bvadd #b00000000000000000000000000000001 call!66288) call!66289))))

(declare-fun b!1380564 () Bool)

(assert (=> b!1380564 (= e!782312 (= call!66288 call!66289))))

(declare-fun bm!66286 () Bool)

(assert (=> bm!66286 (= call!66289 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (= (and start!117546 res!922582) b!1380562))

(assert (= (and b!1380562 c!128430) b!1380563))

(assert (= (and b!1380562 (not c!128430)) b!1380564))

(assert (= (or b!1380563 b!1380564) bm!66286))

(assert (= (or b!1380563 b!1380564) bm!66285))

(declare-fun m!1265745 () Bool)

(assert (=> start!117546 m!1265745))

(declare-fun m!1265747 () Bool)

(assert (=> bm!66285 m!1265747))

(declare-fun m!1265749 () Bool)

(assert (=> b!1380562 m!1265749))

(assert (=> b!1380562 m!1265749))

(declare-fun m!1265751 () Bool)

(assert (=> b!1380562 m!1265751))

(declare-fun m!1265753 () Bool)

(assert (=> b!1380562 m!1265753))

(declare-fun m!1265755 () Bool)

(assert (=> bm!66286 m!1265755))

(push 1)

(assert (not start!117546))

(assert (not b!1380562))

(assert (not bm!66285))

(assert (not bm!66286))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

