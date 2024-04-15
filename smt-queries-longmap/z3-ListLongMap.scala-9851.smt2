; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116788 () Bool)

(assert start!116788)

(declare-fun b!1376324 () Bool)

(declare-fun e!779683 () Bool)

(declare-datatypes ((array!93411 0))(
  ( (array!93412 (arr!45109 (Array (_ BitVec 32) (_ BitVec 64))) (size!45661 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93411)

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376324 (= e!779683 (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!45661 a!4032)) to!206) #b00000000000000000000000000000000))))

(declare-fun res!919245 () Bool)

(assert (=> start!116788 (=> (not res!919245) (not e!779683))))

(declare-fun i!1445 () (_ BitVec 32))

(assert (=> start!116788 (= res!919245 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45661 a!4032))))))

(assert (=> start!116788 e!779683))

(assert (=> start!116788 true))

(declare-fun array_inv!34342 (array!93411) Bool)

(assert (=> start!116788 (array_inv!34342 a!4032)))

(declare-fun b!1376325 () Bool)

(declare-fun res!919243 () Bool)

(assert (=> b!1376325 (=> (not res!919243) (not e!779683))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376325 (= res!919243 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376326 () Bool)

(declare-fun res!919246 () Bool)

(assert (=> b!1376326 (=> (not res!919246) (not e!779683))))

(declare-fun arrayCountValidKeys!0 (array!93411 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376326 (= res!919246 (= (arrayCountValidKeys!0 (array!93412 (store (arr!45109 a!4032) i!1445 k0!2947) (size!45661 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376327 () Bool)

(declare-fun res!919247 () Bool)

(assert (=> b!1376327 (=> (not res!919247) (not e!779683))))

(assert (=> b!1376327 (= res!919247 (validKeyInArray!0 (select (arr!45109 a!4032) i!1445)))))

(declare-fun b!1376328 () Bool)

(declare-fun res!919244 () Bool)

(assert (=> b!1376328 (=> (not res!919244) (not e!779683))))

(assert (=> b!1376328 (= res!919244 (and (bvslt (size!45661 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45661 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116788 res!919245) b!1376327))

(assert (= (and b!1376327 res!919247) b!1376325))

(assert (= (and b!1376325 res!919243) b!1376328))

(assert (= (and b!1376328 res!919244) b!1376326))

(assert (= (and b!1376326 res!919246) b!1376324))

(declare-fun m!1259957 () Bool)

(assert (=> start!116788 m!1259957))

(declare-fun m!1259959 () Bool)

(assert (=> b!1376325 m!1259959))

(declare-fun m!1259961 () Bool)

(assert (=> b!1376326 m!1259961))

(declare-fun m!1259963 () Bool)

(assert (=> b!1376326 m!1259963))

(declare-fun m!1259965 () Bool)

(assert (=> b!1376326 m!1259965))

(declare-fun m!1259967 () Bool)

(assert (=> b!1376327 m!1259967))

(assert (=> b!1376327 m!1259967))

(declare-fun m!1259969 () Bool)

(assert (=> b!1376327 m!1259969))

(check-sat (not b!1376327) (not b!1376325) (not start!116788) (not b!1376326))
(check-sat)
