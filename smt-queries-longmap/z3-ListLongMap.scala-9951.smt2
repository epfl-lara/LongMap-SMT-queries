; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117566 () Bool)

(assert start!117566)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun e!782400 () Bool)

(declare-fun lt!608051 () Bool)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun b!1380652 () Bool)

(assert (=> b!1380652 (= e!782400 (not (or lt!608051 (bvsle from!3309 to!105))))))

(declare-fun e!782401 () Bool)

(assert (=> b!1380652 e!782401))

(declare-fun c!128460 () Bool)

(assert (=> b!1380652 (= c!128460 lt!608051)))

(declare-datatypes ((array!94084 0))(
  ( (array!94085 (arr!45435 (Array (_ BitVec 32) (_ BitVec 64))) (size!45985 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94084)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380652 (= lt!608051 (validKeyInArray!0 (select (arr!45435 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!46001 0))(
  ( (Unit!46002) )
))
(declare-fun lt!608052 () Unit!46001)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94084 (_ BitVec 32) (_ BitVec 32)) Unit!46001)

(assert (=> b!1380652 (= lt!608052 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun call!66349 () (_ BitVec 32))

(declare-fun bm!66345 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94084 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66345 (= call!66349 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun call!66348 () (_ BitVec 32))

(declare-fun bm!66346 () Bool)

(assert (=> bm!66346 (= call!66348 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380653 () Bool)

(assert (=> b!1380653 (= e!782401 (= call!66349 call!66348))))

(declare-fun b!1380654 () Bool)

(assert (=> b!1380654 (= e!782401 (= (bvadd #b00000000000000000000000000000001 call!66349) call!66348))))

(declare-fun res!922612 () Bool)

(assert (=> start!117566 (=> (not res!922612) (not e!782400))))

(assert (=> start!117566 (= res!922612 (and (bvslt (size!45985 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45985 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117566 e!782400))

(declare-fun array_inv!34463 (array!94084) Bool)

(assert (=> start!117566 (array_inv!34463 a!3931)))

(assert (=> start!117566 true))

(assert (= (and start!117566 res!922612) b!1380652))

(assert (= (and b!1380652 c!128460) b!1380654))

(assert (= (and b!1380652 (not c!128460)) b!1380653))

(assert (= (or b!1380654 b!1380653) bm!66346))

(assert (= (or b!1380654 b!1380653) bm!66345))

(declare-fun m!1265865 () Bool)

(assert (=> b!1380652 m!1265865))

(assert (=> b!1380652 m!1265865))

(declare-fun m!1265867 () Bool)

(assert (=> b!1380652 m!1265867))

(declare-fun m!1265869 () Bool)

(assert (=> b!1380652 m!1265869))

(declare-fun m!1265871 () Bool)

(assert (=> bm!66345 m!1265871))

(declare-fun m!1265873 () Bool)

(assert (=> bm!66346 m!1265873))

(declare-fun m!1265875 () Bool)

(assert (=> start!117566 m!1265875))

(check-sat (not bm!66346) (not bm!66345) (not b!1380652) (not start!117566))
(check-sat)
