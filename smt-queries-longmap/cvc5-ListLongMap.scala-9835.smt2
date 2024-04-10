; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116696 () Bool)

(assert start!116696)

(declare-fun res!918440 () Bool)

(declare-fun e!779142 () Bool)

(assert (=> start!116696 (=> (not res!918440) (not e!779142))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93365 0))(
  ( (array!93366 (arr!45086 (Array (_ BitVec 32) (_ BitVec 64))) (size!45636 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93365)

(assert (=> start!116696 (= res!918440 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45636 a!4032))))))

(assert (=> start!116696 e!779142))

(assert (=> start!116696 true))

(declare-fun array_inv!34114 (array!93365) Bool)

(assert (=> start!116696 (array_inv!34114 a!4032)))

(declare-fun b!1375375 () Bool)

(declare-fun res!918439 () Bool)

(assert (=> b!1375375 (=> (not res!918439) (not e!779142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375375 (= res!918439 (validKeyInArray!0 (select (arr!45086 a!4032) i!1445)))))

(declare-fun b!1375377 () Bool)

(declare-fun res!918441 () Bool)

(assert (=> b!1375377 (=> (not res!918441) (not e!779142))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1375377 (= res!918441 (and (bvslt (size!45636 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45636 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375378 () Bool)

(assert (=> b!1375378 (= e!779142 false)))

(declare-fun lt!604344 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93365 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375378 (= lt!604344 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lt!604345 () (_ BitVec 32))

(assert (=> b!1375378 (= lt!604345 (arrayCountValidKeys!0 (array!93366 (store (arr!45086 a!4032) i!1445 k!2947) (size!45636 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375376 () Bool)

(declare-fun res!918442 () Bool)

(assert (=> b!1375376 (=> (not res!918442) (not e!779142))))

(assert (=> b!1375376 (= res!918442 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116696 res!918440) b!1375375))

(assert (= (and b!1375375 res!918439) b!1375376))

(assert (= (and b!1375376 res!918442) b!1375377))

(assert (= (and b!1375377 res!918441) b!1375378))

(declare-fun m!1259203 () Bool)

(assert (=> start!116696 m!1259203))

(declare-fun m!1259205 () Bool)

(assert (=> b!1375375 m!1259205))

(assert (=> b!1375375 m!1259205))

(declare-fun m!1259207 () Bool)

(assert (=> b!1375375 m!1259207))

(declare-fun m!1259209 () Bool)

(assert (=> b!1375378 m!1259209))

(declare-fun m!1259211 () Bool)

(assert (=> b!1375378 m!1259211))

(declare-fun m!1259213 () Bool)

(assert (=> b!1375378 m!1259213))

(declare-fun m!1259215 () Bool)

(assert (=> b!1375376 m!1259215))

(push 1)

(assert (not start!116696))

(assert (not b!1375375))

(assert (not b!1375376))

(assert (not b!1375378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

