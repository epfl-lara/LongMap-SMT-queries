; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117794 () Bool)

(assert start!117794)

(declare-fun res!923127 () Bool)

(declare-fun e!783233 () Bool)

(assert (=> start!117794 (=> (not res!923127) (not e!783233))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94196 0))(
  ( (array!94197 (arr!45486 (Array (_ BitVec 32) (_ BitVec 64))) (size!46037 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94196)

(assert (=> start!117794 (= res!923127 (and (bvslt (size!46037 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46037 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117794 e!783233))

(declare-fun array_inv!34767 (array!94196) Bool)

(assert (=> start!117794 (array_inv!34767 a!3931)))

(assert (=> start!117794 true))

(declare-fun bm!66400 () Bool)

(declare-fun call!66403 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!94196 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66400 (= call!66403 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1381944 () Bool)

(declare-fun e!783232 () Bool)

(declare-fun call!66404 () (_ BitVec 32))

(assert (=> b!1381944 (= e!783232 (= (bvadd #b00000000000000000000000000000001 call!66403) call!66404))))

(declare-fun bm!66401 () Bool)

(assert (=> bm!66401 (= call!66404 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1381945 () Bool)

(assert (=> b!1381945 (= e!783233 (not true))))

(assert (=> b!1381945 e!783232))

(declare-fun c!128856 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381945 (= c!128856 (validKeyInArray!0 (select (arr!45486 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45936 0))(
  ( (Unit!45937) )
))
(declare-fun lt!608521 () Unit!45936)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94196 (_ BitVec 32) (_ BitVec 32)) Unit!45936)

(assert (=> b!1381945 (= lt!608521 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1381946 () Bool)

(assert (=> b!1381946 (= e!783232 (= call!66403 call!66404))))

(assert (= (and start!117794 res!923127) b!1381945))

(assert (= (and b!1381945 c!128856) b!1381944))

(assert (= (and b!1381945 (not c!128856)) b!1381946))

(assert (= (or b!1381944 b!1381946) bm!66401))

(assert (= (or b!1381944 b!1381946) bm!66400))

(declare-fun m!1267477 () Bool)

(assert (=> start!117794 m!1267477))

(declare-fun m!1267479 () Bool)

(assert (=> bm!66400 m!1267479))

(declare-fun m!1267481 () Bool)

(assert (=> bm!66401 m!1267481))

(declare-fun m!1267483 () Bool)

(assert (=> b!1381945 m!1267483))

(assert (=> b!1381945 m!1267483))

(declare-fun m!1267485 () Bool)

(assert (=> b!1381945 m!1267485))

(declare-fun m!1267487 () Bool)

(assert (=> b!1381945 m!1267487))

(push 1)

(assert (not bm!66401))

(assert (not start!117794))

(assert (not b!1381945))

(assert (not bm!66400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

