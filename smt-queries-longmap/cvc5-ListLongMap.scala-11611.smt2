; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135472 () Bool)

(assert start!135472)

(declare-fun res!1075474 () Bool)

(declare-fun e!877888 () Bool)

(assert (=> start!135472 (=> (not res!1075474) (not e!877888))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135472 (= res!1075474 (validMask!0 mask!877))))

(assert (=> start!135472 e!877888))

(assert (=> start!135472 true))

(declare-datatypes ((array!105203 0))(
  ( (array!105204 (arr!50752 (Array (_ BitVec 32) (_ BitVec 64))) (size!51302 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105203)

(declare-fun array_inv!39479 (array!105203) Bool)

(assert (=> start!135472 (array_inv!39479 _keys!591)))

(declare-fun b!1574182 () Bool)

(declare-fun res!1075475 () Bool)

(assert (=> b!1574182 (=> (not res!1075475) (not e!877888))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574182 (= res!1075475 (and (= (size!51302 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51302 _keys!591)) (bvslt i!537 (size!51302 _keys!591))))))

(declare-fun b!1574183 () Bool)

(declare-fun res!1075476 () Bool)

(assert (=> b!1574183 (=> (not res!1075476) (not e!877888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574183 (= res!1075476 (validKeyInArray!0 (select (arr!50752 _keys!591) i!537)))))

(declare-fun b!1574184 () Bool)

(assert (=> b!1574184 (= e!877888 (bvsge (size!51302 _keys!591) #b01111111111111111111111111111111))))

(assert (= (and start!135472 res!1075474) b!1574182))

(assert (= (and b!1574182 res!1075475) b!1574183))

(assert (= (and b!1574183 res!1075476) b!1574184))

(declare-fun m!1447441 () Bool)

(assert (=> start!135472 m!1447441))

(declare-fun m!1447443 () Bool)

(assert (=> start!135472 m!1447443))

(declare-fun m!1447445 () Bool)

(assert (=> b!1574183 m!1447445))

(assert (=> b!1574183 m!1447445))

(declare-fun m!1447447 () Bool)

(assert (=> b!1574183 m!1447447))

(push 1)

(assert (not start!135472))

(assert (not b!1574183))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

