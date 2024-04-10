; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117476 () Bool)

(assert start!117476)

(declare-fun bm!66135 () Bool)

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-fun call!66139 () (_ BitVec 32))

(declare-datatypes ((array!94027 0))(
  ( (array!94028 (arr!45408 (Array (_ BitVec 32) (_ BitVec 64))) (size!45958 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94027)

(declare-fun arrayCountValidKeys!0 (array!94027 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66135 (= call!66139 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun res!922489 () Bool)

(declare-fun e!782079 () Bool)

(assert (=> start!117476 (=> (not res!922489) (not e!782079))))

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117476 (= res!922489 (and (bvslt (size!45958 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45958 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117476 e!782079))

(declare-fun array_inv!34436 (array!94027) Bool)

(assert (=> start!117476 (array_inv!34436 a!3961)))

(assert (=> start!117476 true))

(declare-fun call!66138 () (_ BitVec 32))

(declare-fun bm!66136 () Bool)

(assert (=> bm!66136 (= call!66138 (arrayCountValidKeys!0 a!3961 from!3339 pivot!34))))

(declare-fun b!1380227 () Bool)

(assert (=> b!1380227 (= e!782079 (not (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) from!3339)))))

(declare-fun e!782081 () Bool)

(assert (=> b!1380227 e!782081))

(declare-fun c!128310 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380227 (= c!128310 (validKeyInArray!0 (select (arr!45408 a!3961) pivot!34)))))

(declare-datatypes ((Unit!45953 0))(
  ( (Unit!45954) )
))
(declare-fun lt!607899 () Unit!45953)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94027 (_ BitVec 32) (_ BitVec 32)) Unit!45953)

(assert (=> b!1380227 (= lt!607899 (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380228 () Bool)

(assert (=> b!1380228 (= e!782081 (= call!66138 call!66139))))

(declare-fun b!1380229 () Bool)

(declare-fun res!922487 () Bool)

(assert (=> b!1380229 (=> (not res!922487) (not e!782079))))

(assert (=> b!1380229 (= res!922487 (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45958 a!3961)))))

(declare-fun b!1380230 () Bool)

(assert (=> b!1380230 (= e!782081 (= (bvadd #b00000000000000000000000000000001 call!66138) call!66139))))

(declare-fun b!1380231 () Bool)

(declare-fun res!922488 () Bool)

(assert (=> b!1380231 (=> (not res!922488) (not e!782079))))

(declare-fun isPivot!0 (array!94027 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380231 (= res!922488 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(assert (= (and start!117476 res!922489) b!1380231))

(assert (= (and b!1380231 res!922488) b!1380229))

(assert (= (and b!1380229 res!922487) b!1380227))

(assert (= (and b!1380227 c!128310) b!1380230))

(assert (= (and b!1380227 (not c!128310)) b!1380228))

(assert (= (or b!1380230 b!1380228) bm!66136))

(assert (= (or b!1380230 b!1380228) bm!66135))

(declare-fun m!1265423 () Bool)

(assert (=> b!1380231 m!1265423))

(declare-fun m!1265425 () Bool)

(assert (=> start!117476 m!1265425))

(declare-fun m!1265427 () Bool)

(assert (=> bm!66136 m!1265427))

(declare-fun m!1265429 () Bool)

(assert (=> bm!66135 m!1265429))

(declare-fun m!1265431 () Bool)

(assert (=> b!1380227 m!1265431))

(assert (=> b!1380227 m!1265431))

(declare-fun m!1265433 () Bool)

(assert (=> b!1380227 m!1265433))

(declare-fun m!1265435 () Bool)

(assert (=> b!1380227 m!1265435))

(check-sat (not b!1380231) (not b!1380227) (not bm!66135) (not start!117476) (not bm!66136))
(check-sat)
