; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116790 () Bool)

(assert start!116790)

(declare-fun b!1376372 () Bool)

(declare-fun res!919258 () Bool)

(declare-fun e!779703 () Bool)

(assert (=> b!1376372 (=> (not res!919258) (not e!779703))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376372 (= res!919258 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376373 () Bool)

(declare-fun res!919255 () Bool)

(assert (=> b!1376373 (=> (not res!919255) (not e!779703))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93459 0))(
  ( (array!93460 (arr!45133 (Array (_ BitVec 32) (_ BitVec 64))) (size!45683 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93459)

(assert (=> b!1376373 (= res!919255 (and (bvslt (size!45683 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45683 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376374 () Bool)

(assert (=> b!1376374 (= e!779703 false)))

(declare-fun lt!605284 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93459 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376374 (= lt!605284 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605283 () (_ BitVec 32))

(assert (=> b!1376374 (= lt!605283 (arrayCountValidKeys!0 (array!93460 (store (arr!45133 a!4032) i!1445 k!2947) (size!45683 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376371 () Bool)

(declare-fun res!919256 () Bool)

(assert (=> b!1376371 (=> (not res!919256) (not e!779703))))

(assert (=> b!1376371 (= res!919256 (validKeyInArray!0 (select (arr!45133 a!4032) i!1445)))))

(declare-fun res!919257 () Bool)

(assert (=> start!116790 (=> (not res!919257) (not e!779703))))

(assert (=> start!116790 (= res!919257 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45683 a!4032))))))

(assert (=> start!116790 e!779703))

(assert (=> start!116790 true))

(declare-fun array_inv!34161 (array!93459) Bool)

(assert (=> start!116790 (array_inv!34161 a!4032)))

(assert (= (and start!116790 res!919257) b!1376371))

(assert (= (and b!1376371 res!919256) b!1376372))

(assert (= (and b!1376372 res!919258) b!1376373))

(assert (= (and b!1376373 res!919255) b!1376374))

(declare-fun m!1260437 () Bool)

(assert (=> b!1376372 m!1260437))

(declare-fun m!1260439 () Bool)

(assert (=> b!1376374 m!1260439))

(declare-fun m!1260441 () Bool)

(assert (=> b!1376374 m!1260441))

(declare-fun m!1260443 () Bool)

(assert (=> b!1376374 m!1260443))

(declare-fun m!1260445 () Bool)

(assert (=> b!1376371 m!1260445))

(assert (=> b!1376371 m!1260445))

(declare-fun m!1260447 () Bool)

(assert (=> b!1376371 m!1260447))

(declare-fun m!1260449 () Bool)

(assert (=> start!116790 m!1260449))

(push 1)

(assert (not b!1376372))

(assert (not b!1376374))

(assert (not start!116790))

(assert (not b!1376371))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

