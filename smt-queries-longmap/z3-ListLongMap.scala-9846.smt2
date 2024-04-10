; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116764 () Bool)

(assert start!116764)

(declare-fun b!1376177 () Bool)

(declare-fun e!779613 () Bool)

(declare-fun e!779617 () Bool)

(assert (=> b!1376177 (= e!779613 e!779617)))

(declare-fun res!919074 () Bool)

(assert (=> b!1376177 (=> (not res!919074) (not e!779617))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605220 () (_ BitVec 32))

(declare-datatypes ((array!93433 0))(
  ( (array!93434 (arr!45120 (Array (_ BitVec 32) (_ BitVec 64))) (size!45670 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93433)

(declare-fun lt!605219 () (_ BitVec 32))

(assert (=> b!1376177 (= res!919074 (and (= lt!605219 lt!605220) (not (= to!206 (size!45670 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93433 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376177 (= lt!605220 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605215 () array!93433)

(assert (=> b!1376177 (= lt!605219 (arrayCountValidKeys!0 lt!605215 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376177 (= lt!605215 (array!93434 (store (arr!45120 a!4032) i!1445 k0!2947) (size!45670 a!4032)))))

(declare-fun b!1376178 () Bool)

(declare-fun e!779614 () Bool)

(assert (=> b!1376178 (= e!779617 e!779614)))

(declare-fun res!919070 () Bool)

(assert (=> b!1376178 (=> (not res!919070) (not e!779614))))

(assert (=> b!1376178 (= res!919070 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45670 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45605 0))(
  ( (Unit!45606) )
))
(declare-fun lt!605218 () Unit!45605)

(declare-fun e!779615 () Unit!45605)

(assert (=> b!1376178 (= lt!605218 e!779615)))

(declare-fun c!127994 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376178 (= c!127994 (validKeyInArray!0 (select (arr!45120 a!4032) to!206)))))

(declare-fun b!1376179 () Bool)

(assert (=> b!1376179 (= e!779614 (not true))))

(assert (=> b!1376179 (= (arrayCountValidKeys!0 lt!605215 (bvadd #b00000000000000000000000000000001 i!1445) (size!45670 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45670 a!4032)))))

(declare-fun lt!605217 () Unit!45605)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45605)

(assert (=> b!1376179 (= lt!605217 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376180 () Bool)

(declare-fun lt!605216 () Unit!45605)

(assert (=> b!1376180 (= e!779615 lt!605216)))

(declare-fun lt!605221 () Unit!45605)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93433 (_ BitVec 32) (_ BitVec 32)) Unit!45605)

(assert (=> b!1376180 (= lt!605221 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65845 () (_ BitVec 32))

(assert (=> b!1376180 (= call!65845 (bvadd #b00000000000000000000000000000001 lt!605220))))

(assert (=> b!1376180 (= lt!605216 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605215 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65846 () (_ BitVec 32))

(assert (=> b!1376180 (= call!65846 (bvadd #b00000000000000000000000000000001 lt!605219))))

(declare-fun bm!65842 () Bool)

(assert (=> bm!65842 (= call!65845 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376181 () Bool)

(declare-fun res!919075 () Bool)

(assert (=> b!1376181 (=> (not res!919075) (not e!779613))))

(assert (=> b!1376181 (= res!919075 (and (bvslt (size!45670 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45670 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919073 () Bool)

(assert (=> start!116764 (=> (not res!919073) (not e!779613))))

(assert (=> start!116764 (= res!919073 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45670 a!4032))))))

(assert (=> start!116764 e!779613))

(assert (=> start!116764 true))

(declare-fun array_inv!34148 (array!93433) Bool)

(assert (=> start!116764 (array_inv!34148 a!4032)))

(declare-fun b!1376182 () Bool)

(declare-fun res!919071 () Bool)

(assert (=> b!1376182 (=> (not res!919071) (not e!779613))))

(assert (=> b!1376182 (= res!919071 (not (validKeyInArray!0 k0!2947)))))

(declare-fun bm!65843 () Bool)

(assert (=> bm!65843 (= call!65846 (arrayCountValidKeys!0 lt!605215 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376183 () Bool)

(declare-fun res!919069 () Bool)

(assert (=> b!1376183 (=> (not res!919069) (not e!779614))))

(assert (=> b!1376183 (= res!919069 (= (arrayCountValidKeys!0 lt!605215 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1376184 () Bool)

(declare-fun lt!605214 () Unit!45605)

(assert (=> b!1376184 (= e!779615 lt!605214)))

(declare-fun lt!605213 () Unit!45605)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93433 (_ BitVec 32) (_ BitVec 32)) Unit!45605)

(assert (=> b!1376184 (= lt!605213 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376184 (= call!65845 lt!605220)))

(assert (=> b!1376184 (= lt!605214 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605215 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376184 (= call!65846 lt!605219)))

(declare-fun b!1376185 () Bool)

(declare-fun res!919072 () Bool)

(assert (=> b!1376185 (=> (not res!919072) (not e!779613))))

(assert (=> b!1376185 (= res!919072 (validKeyInArray!0 (select (arr!45120 a!4032) i!1445)))))

(assert (= (and start!116764 res!919073) b!1376185))

(assert (= (and b!1376185 res!919072) b!1376182))

(assert (= (and b!1376182 res!919071) b!1376181))

(assert (= (and b!1376181 res!919075) b!1376177))

(assert (= (and b!1376177 res!919074) b!1376178))

(assert (= (and b!1376178 c!127994) b!1376180))

(assert (= (and b!1376178 (not c!127994)) b!1376184))

(assert (= (or b!1376180 b!1376184) bm!65843))

(assert (= (or b!1376180 b!1376184) bm!65842))

(assert (= (and b!1376178 res!919070) b!1376183))

(assert (= (and b!1376183 res!919069) b!1376179))

(declare-fun m!1260211 () Bool)

(assert (=> b!1376177 m!1260211))

(declare-fun m!1260213 () Bool)

(assert (=> b!1376177 m!1260213))

(declare-fun m!1260215 () Bool)

(assert (=> b!1376177 m!1260215))

(declare-fun m!1260217 () Bool)

(assert (=> b!1376182 m!1260217))

(declare-fun m!1260219 () Bool)

(assert (=> b!1376184 m!1260219))

(declare-fun m!1260221 () Bool)

(assert (=> b!1376184 m!1260221))

(declare-fun m!1260223 () Bool)

(assert (=> bm!65842 m!1260223))

(declare-fun m!1260225 () Bool)

(assert (=> bm!65843 m!1260225))

(declare-fun m!1260227 () Bool)

(assert (=> start!116764 m!1260227))

(declare-fun m!1260229 () Bool)

(assert (=> b!1376178 m!1260229))

(assert (=> b!1376178 m!1260229))

(declare-fun m!1260231 () Bool)

(assert (=> b!1376178 m!1260231))

(declare-fun m!1260233 () Bool)

(assert (=> b!1376179 m!1260233))

(declare-fun m!1260235 () Bool)

(assert (=> b!1376179 m!1260235))

(declare-fun m!1260237 () Bool)

(assert (=> b!1376179 m!1260237))

(assert (=> b!1376183 m!1260225))

(assert (=> b!1376183 m!1260223))

(declare-fun m!1260239 () Bool)

(assert (=> b!1376180 m!1260239))

(declare-fun m!1260241 () Bool)

(assert (=> b!1376180 m!1260241))

(declare-fun m!1260243 () Bool)

(assert (=> b!1376185 m!1260243))

(assert (=> b!1376185 m!1260243))

(declare-fun m!1260245 () Bool)

(assert (=> b!1376185 m!1260245))

(check-sat (not b!1376185) (not b!1376179) (not b!1376184) (not bm!65843) (not b!1376182) (not b!1376178) (not b!1376183) (not start!116764) (not b!1376180) (not bm!65842) (not b!1376177))
