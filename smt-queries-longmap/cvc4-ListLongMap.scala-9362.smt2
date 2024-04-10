; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111612 () Bool)

(assert start!111612)

(declare-fun b_free!30269 () Bool)

(declare-fun b_next!30269 () Bool)

(assert (=> start!111612 (= b_free!30269 (not b_next!30269))))

(declare-fun tp!106283 () Bool)

(declare-fun b_and!48697 () Bool)

(assert (=> start!111612 (= tp!106283 b_and!48697)))

(declare-fun b!1321925 () Bool)

(declare-fun res!877409 () Bool)

(declare-fun e!753859 () Bool)

(assert (=> b!1321925 (=> (not res!877409) (not e!753859))))

(declare-datatypes ((array!89100 0))(
  ( (array!89101 (arr!43024 (Array (_ BitVec 32) (_ BitVec 64))) (size!43574 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89100)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321925 (= res!877409 (validKeyInArray!0 (select (arr!43024 _keys!1609) from!2000)))))

(declare-fun b!1321926 () Bool)

(declare-fun res!877408 () Bool)

(assert (=> b!1321926 (=> (not res!877408) (not e!753859))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53221 0))(
  ( (V!53222 (val!18119 Int)) )
))
(declare-datatypes ((ValueCell!17146 0))(
  ( (ValueCellFull!17146 (v!20749 V!53221)) (EmptyCell!17146) )
))
(declare-datatypes ((array!89102 0))(
  ( (array!89103 (arr!43025 (Array (_ BitVec 32) ValueCell!17146)) (size!43575 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89102)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1321926 (= res!877408 (and (= (size!43575 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43574 _keys!1609) (size!43575 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321927 () Bool)

(declare-fun e!753856 () Bool)

(declare-fun e!753857 () Bool)

(declare-fun mapRes!55781 () Bool)

(assert (=> b!1321927 (= e!753856 (and e!753857 mapRes!55781))))

(declare-fun condMapEmpty!55781 () Bool)

(declare-fun mapDefault!55781 () ValueCell!17146)

