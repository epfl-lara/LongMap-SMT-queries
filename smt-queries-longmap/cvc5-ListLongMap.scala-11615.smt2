; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135528 () Bool)

(assert start!135528)

(declare-fun res!1075618 () Bool)

(declare-fun e!877988 () Bool)

(assert (=> start!135528 (=> (not res!1075618) (not e!877988))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135528 (= res!1075618 (validMask!0 mask!877))))

(assert (=> start!135528 e!877988))

(assert (=> start!135528 true))

(declare-datatypes ((array!105231 0))(
  ( (array!105232 (arr!50764 (Array (_ BitVec 32) (_ BitVec 64))) (size!51314 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105231)

(declare-fun array_inv!39491 (array!105231) Bool)

(assert (=> start!135528 (array_inv!39491 _keys!591)))

(declare-fun b!1574326 () Bool)

(declare-fun res!1075619 () Bool)

(assert (=> b!1574326 (=> (not res!1075619) (not e!877988))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574326 (= res!1075619 (and (= (size!51314 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51314 _keys!591)) (bvslt i!537 (size!51314 _keys!591))))))

(declare-fun b!1574327 () Bool)

(declare-fun res!1075620 () Bool)

(assert (=> b!1574327 (=> (not res!1075620) (not e!877988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574327 (= res!1075620 (not (validKeyInArray!0 (select (arr!50764 _keys!591) i!537))))))

(declare-fun b!1574328 () Bool)

(assert (=> b!1574328 (= e!877988 (bvsge (bvsub (size!51314 _keys!591) (bvadd #b00000000000000000000000000000001 i!537)) (bvsub (size!51314 _keys!591) i!537)))))

(assert (= (and start!135528 res!1075618) b!1574326))

(assert (= (and b!1574326 res!1075619) b!1574327))

(assert (= (and b!1574327 res!1075620) b!1574328))

(declare-fun m!1447579 () Bool)

(assert (=> start!135528 m!1447579))

(declare-fun m!1447581 () Bool)

(assert (=> start!135528 m!1447581))

(declare-fun m!1447583 () Bool)

(assert (=> b!1574327 m!1447583))

(assert (=> b!1574327 m!1447583))

(declare-fun m!1447585 () Bool)

(assert (=> b!1574327 m!1447585))

(push 1)

(assert (not start!135528))

(assert (not b!1574327))

(check-sat)

(pop 1)

(push 1)

(check-sat)

