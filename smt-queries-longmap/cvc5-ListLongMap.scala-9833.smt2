; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116918 () Bool)

(assert start!116918)

(declare-fun res!918897 () Bool)

(declare-fun e!779962 () Bool)

(assert (=> start!116918 (=> (not res!918897) (not e!779962))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93473 0))(
  ( (array!93474 (arr!45135 (Array (_ BitVec 32) (_ BitVec 64))) (size!45686 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93473)

(assert (=> start!116918 (= res!918897 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45686 a!4032))))))

(assert (=> start!116918 e!779962))

(assert (=> start!116918 true))

(declare-fun array_inv!34416 (array!93473) Bool)

(assert (=> start!116918 (array_inv!34416 a!4032)))

(declare-fun b!1376626 () Bool)

(assert (=> b!1376626 (= e!779962 false)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!604794 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93473 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376626 (= lt!604794 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lt!604793 () (_ BitVec 32))

(assert (=> b!1376626 (= lt!604793 (arrayCountValidKeys!0 (array!93474 (store (arr!45135 a!4032) i!1445 k!2947) (size!45686 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376624 () Bool)

(declare-fun res!918896 () Bool)

(assert (=> b!1376624 (=> (not res!918896) (not e!779962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376624 (= res!918896 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376623 () Bool)

(declare-fun res!918895 () Bool)

(assert (=> b!1376623 (=> (not res!918895) (not e!779962))))

(assert (=> b!1376623 (= res!918895 (validKeyInArray!0 (select (arr!45135 a!4032) i!1445)))))

(declare-fun b!1376625 () Bool)

(declare-fun res!918894 () Bool)

(assert (=> b!1376625 (=> (not res!918894) (not e!779962))))

(assert (=> b!1376625 (= res!918894 (and (bvslt (size!45686 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45686 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116918 res!918897) b!1376623))

(assert (= (and b!1376623 res!918895) b!1376624))

(assert (= (and b!1376624 res!918896) b!1376625))

(assert (= (and b!1376625 res!918894) b!1376626))

(declare-fun m!1260747 () Bool)

(assert (=> start!116918 m!1260747))

(declare-fun m!1260749 () Bool)

(assert (=> b!1376626 m!1260749))

(declare-fun m!1260751 () Bool)

(assert (=> b!1376626 m!1260751))

(declare-fun m!1260753 () Bool)

(assert (=> b!1376626 m!1260753))

(declare-fun m!1260755 () Bool)

(assert (=> b!1376624 m!1260755))

(declare-fun m!1260757 () Bool)

(assert (=> b!1376623 m!1260757))

(assert (=> b!1376623 m!1260757))

(declare-fun m!1260759 () Bool)

(assert (=> b!1376623 m!1260759))

(push 1)

(assert (not b!1376623))

(assert (not b!1376624))

(assert (not b!1376626))

(assert (not start!116918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

