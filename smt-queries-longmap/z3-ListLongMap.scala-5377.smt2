; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71862 () Bool)

(assert start!71862)

(declare-fun res!568006 () Bool)

(declare-fun e!465929 () Bool)

(assert (=> start!71862 (=> (not res!568006) (not e!465929))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46772 0))(
  ( (array!46773 (arr!22420 (Array (_ BitVec 32) (_ BitVec 64))) (size!22841 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46772)

(assert (=> start!71862 (= res!568006 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22841 a!4227))))))

(assert (=> start!71862 e!465929))

(assert (=> start!71862 true))

(declare-fun array_inv!17867 (array!46772) Bool)

(assert (=> start!71862 (array_inv!17867 a!4227)))

(declare-fun b!835132 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835132 (= e!465929 (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!22841 a!4227)) to!390) #b00000000000000000000000000000000))))

(declare-fun b!835133 () Bool)

(declare-fun res!568005 () Bool)

(assert (=> b!835133 (=> (not res!568005) (not e!465929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835133 (= res!568005 (not (validKeyInArray!0 (select (arr!22420 a!4227) i!1466))))))

(declare-fun b!835134 () Bool)

(declare-fun res!568007 () Bool)

(assert (=> b!835134 (=> (not res!568007) (not e!465929))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!46772 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835134 (= res!568007 (= (arrayCountValidKeys!0 (array!46773 (store (arr!22420 a!4227) i!1466 k0!2968) (size!22841 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!835135 () Bool)

(declare-fun res!568004 () Bool)

(assert (=> b!835135 (=> (not res!568004) (not e!465929))))

(assert (=> b!835135 (= res!568004 (validKeyInArray!0 k0!2968))))

(declare-fun b!835136 () Bool)

(declare-fun res!568003 () Bool)

(assert (=> b!835136 (=> (not res!568003) (not e!465929))))

(assert (=> b!835136 (= res!568003 (and (bvslt (size!22841 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22841 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71862 res!568006) b!835133))

(assert (= (and b!835133 res!568005) b!835135))

(assert (= (and b!835135 res!568004) b!835136))

(assert (= (and b!835136 res!568003) b!835134))

(assert (= (and b!835134 res!568007) b!835132))

(declare-fun m!780299 () Bool)

(assert (=> start!71862 m!780299))

(declare-fun m!780301 () Bool)

(assert (=> b!835133 m!780301))

(assert (=> b!835133 m!780301))

(declare-fun m!780303 () Bool)

(assert (=> b!835133 m!780303))

(declare-fun m!780305 () Bool)

(assert (=> b!835134 m!780305))

(declare-fun m!780307 () Bool)

(assert (=> b!835134 m!780307))

(declare-fun m!780309 () Bool)

(assert (=> b!835134 m!780309))

(declare-fun m!780311 () Bool)

(assert (=> b!835135 m!780311))

(check-sat (not b!835134) (not b!835133) (not start!71862) (not b!835135))
(check-sat)
