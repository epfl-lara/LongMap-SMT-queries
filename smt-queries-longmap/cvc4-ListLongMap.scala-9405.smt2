; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111928 () Bool)

(assert start!111928)

(declare-fun b_free!30527 () Bool)

(declare-fun b_next!30527 () Bool)

(assert (=> start!111928 (= b_free!30527 (not b_next!30527))))

(declare-fun tp!107061 () Bool)

(declare-fun b_and!49149 () Bool)

(assert (=> start!111928 (= tp!107061 b_and!49149)))

(declare-fun b!1326503 () Bool)

(declare-fun res!880405 () Bool)

(declare-fun e!756050 () Bool)

(assert (=> b!1326503 (=> (not res!880405) (not e!756050))))

(declare-datatypes ((array!89600 0))(
  ( (array!89601 (arr!43273 (Array (_ BitVec 32) (_ BitVec 64))) (size!43823 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89600)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((V!53565 0))(
  ( (V!53566 (val!18248 Int)) )
))
(declare-datatypes ((ValueCell!17275 0))(
  ( (ValueCellFull!17275 (v!20881 V!53565)) (EmptyCell!17275) )
))
(declare-datatypes ((array!89602 0))(
  ( (array!89603 (arr!43274 (Array (_ BitVec 32) ValueCell!17275)) (size!43824 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89602)

(assert (=> b!1326503 (= res!880405 (and (= (size!43824 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43823 _keys!1609) (size!43824 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326504 () Bool)

(declare-fun e!756048 () Bool)

(declare-fun e!756051 () Bool)

(declare-fun mapRes!56172 () Bool)

(assert (=> b!1326504 (= e!756048 (and e!756051 mapRes!56172))))

(declare-fun condMapEmpty!56172 () Bool)

(declare-fun mapDefault!56172 () ValueCell!17275)

