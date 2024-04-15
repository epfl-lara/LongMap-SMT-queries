; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116582 () Bool)

(assert start!116582)

(declare-fun b!1374690 () Bool)

(declare-fun res!917861 () Bool)

(declare-fun e!778776 () Bool)

(assert (=> b!1374690 (=> (not res!917861) (not e!778776))))

(declare-datatypes ((array!93226 0))(
  ( (array!93227 (arr!45018 (Array (_ BitVec 32) (_ BitVec 64))) (size!45570 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93226)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374690 (= res!917861 (validKeyInArray!0 (select (arr!45018 a!4142) i!1457)))))

(declare-fun b!1374691 () Bool)

(declare-fun res!917864 () Bool)

(assert (=> b!1374691 (=> (not res!917864) (not e!778776))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374691 (= res!917864 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374693 () Bool)

(assert (=> b!1374693 (= e!778776 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93226 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374693 (= (arrayCountValidKeys!0 (array!93227 (store (arr!45018 a!4142) i!1457 k!2959) (size!45570 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45316 0))(
  ( (Unit!45317) )
))
(declare-fun lt!603698 () Unit!45316)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93226 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45316)

(assert (=> b!1374693 (= lt!603698 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374692 () Bool)

(declare-fun res!917862 () Bool)

(assert (=> b!1374692 (=> (not res!917862) (not e!778776))))

(assert (=> b!1374692 (= res!917862 (bvslt (size!45570 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!917863 () Bool)

(assert (=> start!116582 (=> (not res!917863) (not e!778776))))

(assert (=> start!116582 (= res!917863 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45570 a!4142))))))

(assert (=> start!116582 e!778776))

(assert (=> start!116582 true))

(declare-fun array_inv!34251 (array!93226) Bool)

(assert (=> start!116582 (array_inv!34251 a!4142)))

(assert (= (and start!116582 res!917863) b!1374690))

(assert (= (and b!1374690 res!917861) b!1374691))

(assert (= (and b!1374691 res!917864) b!1374692))

(assert (= (and b!1374692 res!917862) b!1374693))

(declare-fun m!1257785 () Bool)

(assert (=> b!1374690 m!1257785))

(assert (=> b!1374690 m!1257785))

(declare-fun m!1257787 () Bool)

(assert (=> b!1374690 m!1257787))

(declare-fun m!1257789 () Bool)

(assert (=> b!1374691 m!1257789))

(declare-fun m!1257791 () Bool)

(assert (=> b!1374693 m!1257791))

(declare-fun m!1257793 () Bool)

(assert (=> b!1374693 m!1257793))

(declare-fun m!1257795 () Bool)

(assert (=> b!1374693 m!1257795))

(declare-fun m!1257797 () Bool)

(assert (=> b!1374693 m!1257797))

(declare-fun m!1257799 () Bool)

(assert (=> start!116582 m!1257799))

(push 1)

(assert (not b!1374691))

(assert (not b!1374690))

(assert (not b!1374693))

(assert (not start!116582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

