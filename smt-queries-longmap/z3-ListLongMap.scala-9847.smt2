; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116764 () Bool)

(assert start!116764)

(declare-fun b!1376162 () Bool)

(declare-fun res!919081 () Bool)

(declare-fun e!779610 () Bool)

(assert (=> b!1376162 (=> (not res!919081) (not e!779610))))

(declare-datatypes ((array!93387 0))(
  ( (array!93388 (arr!45097 (Array (_ BitVec 32) (_ BitVec 64))) (size!45649 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93387)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376162 (= res!919081 (validKeyInArray!0 (select (arr!45097 a!4032) i!1445)))))

(declare-fun b!1376163 () Bool)

(declare-fun res!919084 () Bool)

(assert (=> b!1376163 (=> (not res!919084) (not e!779610))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376163 (= res!919084 (and (bvslt (size!45649 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45649 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919083 () Bool)

(assert (=> start!116764 (=> (not res!919083) (not e!779610))))

(assert (=> start!116764 (= res!919083 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45649 a!4032))))))

(assert (=> start!116764 e!779610))

(assert (=> start!116764 true))

(declare-fun array_inv!34330 (array!93387) Bool)

(assert (=> start!116764 (array_inv!34330 a!4032)))

(declare-fun b!1376164 () Bool)

(declare-fun res!919082 () Bool)

(assert (=> b!1376164 (=> (not res!919082) (not e!779610))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376164 (= res!919082 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376165 () Bool)

(assert (=> b!1376165 (= e!779610 (and (= to!206 (size!45649 a!4032)) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(declare-fun b!1376166 () Bool)

(declare-fun res!919085 () Bool)

(assert (=> b!1376166 (=> (not res!919085) (not e!779610))))

(declare-fun arrayCountValidKeys!0 (array!93387 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376166 (= res!919085 (= (arrayCountValidKeys!0 (array!93388 (store (arr!45097 a!4032) i!1445 k0!2947) (size!45649 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(assert (= (and start!116764 res!919083) b!1376162))

(assert (= (and b!1376162 res!919081) b!1376164))

(assert (= (and b!1376164 res!919082) b!1376163))

(assert (= (and b!1376163 res!919084) b!1376166))

(assert (= (and b!1376166 res!919085) b!1376165))

(declare-fun m!1259789 () Bool)

(assert (=> b!1376162 m!1259789))

(assert (=> b!1376162 m!1259789))

(declare-fun m!1259791 () Bool)

(assert (=> b!1376162 m!1259791))

(declare-fun m!1259793 () Bool)

(assert (=> start!116764 m!1259793))

(declare-fun m!1259795 () Bool)

(assert (=> b!1376164 m!1259795))

(declare-fun m!1259797 () Bool)

(assert (=> b!1376166 m!1259797))

(declare-fun m!1259799 () Bool)

(assert (=> b!1376166 m!1259799))

(declare-fun m!1259801 () Bool)

(assert (=> b!1376166 m!1259801))

(check-sat (not start!116764) (not b!1376162) (not b!1376164) (not b!1376166))
(check-sat)
