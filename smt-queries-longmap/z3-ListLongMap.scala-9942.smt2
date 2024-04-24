; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117706 () Bool)

(assert start!117706)

(declare-fun b!1381522 () Bool)

(declare-fun e!782921 () Bool)

(declare-fun pivot!34 () (_ BitVec 32))

(declare-fun from!3339 () (_ BitVec 32))

(assert (=> b!1381522 (= e!782921 (not (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) from!3339)))))

(declare-fun e!782922 () Bool)

(assert (=> b!1381522 e!782922))

(declare-fun c!128709 () Bool)

(declare-datatypes ((array!94141 0))(
  ( (array!94142 (arr!45460 (Array (_ BitVec 32) (_ BitVec 64))) (size!46011 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94141)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381522 (= c!128709 (validKeyInArray!0 (select (arr!45460 a!3961) pivot!34)))))

(declare-datatypes ((Unit!45890 0))(
  ( (Unit!45891) )
))
(declare-fun lt!608377 () Unit!45890)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94141 (_ BitVec 32) (_ BitVec 32)) Unit!45890)

(assert (=> b!1381522 (= lt!608377 (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1381523 () Bool)

(declare-fun res!923001 () Bool)

(assert (=> b!1381523 (=> (not res!923001) (not e!782921))))

(declare-fun to!135 () (_ BitVec 32))

(declare-fun isPivot!0 (array!94141 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381523 (= res!923001 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(declare-fun call!66200 () (_ BitVec 32))

(declare-fun bm!66196 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94141 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66196 (= call!66200 (arrayCountValidKeys!0 a!3961 from!3339 pivot!34))))

(declare-fun b!1381524 () Bool)

(declare-fun call!66199 () (_ BitVec 32))

(assert (=> b!1381524 (= e!782922 (= call!66200 call!66199))))

(declare-fun b!1381525 () Bool)

(assert (=> b!1381525 (= e!782922 (= (bvadd #b00000000000000000000000000000001 call!66200) call!66199))))

(declare-fun res!922999 () Bool)

(assert (=> start!117706 (=> (not res!922999) (not e!782921))))

(assert (=> start!117706 (= res!922999 (and (bvslt (size!46011 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!46011 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117706 e!782921))

(declare-fun array_inv!34741 (array!94141) Bool)

(assert (=> start!117706 (array_inv!34741 a!3961)))

(assert (=> start!117706 true))

(declare-fun bm!66197 () Bool)

(assert (=> bm!66197 (= call!66199 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1381526 () Bool)

(declare-fun res!923000 () Bool)

(assert (=> b!1381526 (=> (not res!923000) (not e!782921))))

(assert (=> b!1381526 (= res!923000 (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!46011 a!3961)))))

(assert (= (and start!117706 res!922999) b!1381523))

(assert (= (and b!1381523 res!923001) b!1381526))

(assert (= (and b!1381526 res!923000) b!1381522))

(assert (= (and b!1381522 c!128709) b!1381525))

(assert (= (and b!1381522 (not c!128709)) b!1381524))

(assert (= (or b!1381525 b!1381524) bm!66196))

(assert (= (or b!1381525 b!1381524) bm!66197))

(declare-fun m!1267045 () Bool)

(assert (=> bm!66196 m!1267045))

(declare-fun m!1267047 () Bool)

(assert (=> b!1381523 m!1267047))

(declare-fun m!1267049 () Bool)

(assert (=> start!117706 m!1267049))

(declare-fun m!1267051 () Bool)

(assert (=> bm!66197 m!1267051))

(declare-fun m!1267053 () Bool)

(assert (=> b!1381522 m!1267053))

(assert (=> b!1381522 m!1267053))

(declare-fun m!1267055 () Bool)

(assert (=> b!1381522 m!1267055))

(declare-fun m!1267057 () Bool)

(assert (=> b!1381522 m!1267057))

(check-sat (not b!1381523) (not bm!66196) (not bm!66197) (not b!1381522) (not start!117706))
(check-sat)
