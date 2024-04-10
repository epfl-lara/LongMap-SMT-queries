; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112170 () Bool)

(assert start!112170)

(declare-fun b_free!30565 () Bool)

(declare-fun b_next!30565 () Bool)

(assert (=> start!112170 (= b_free!30565 (not b_next!30565))))

(declare-fun tp!107332 () Bool)

(declare-fun b_and!49215 () Bool)

(assert (=> start!112170 (= tp!107332 b_and!49215)))

(declare-fun b!1328472 () Bool)

(declare-fun res!881431 () Bool)

(declare-fun e!757440 () Bool)

(assert (=> b!1328472 (=> (not res!881431) (not e!757440))))

(declare-datatypes ((array!89844 0))(
  ( (array!89845 (arr!43388 (Array (_ BitVec 32) (_ BitVec 64))) (size!43938 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89844)

(declare-datatypes ((List!30727 0))(
  ( (Nil!30724) (Cons!30723 (h!31932 (_ BitVec 64)) (t!44733 List!30727)) )
))
(declare-fun arrayNoDuplicates!0 (array!89844 (_ BitVec 32) List!30727) Bool)

(assert (=> b!1328472 (= res!881431 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30724))))

(declare-fun b!1328473 () Bool)

(declare-fun e!757441 () Bool)

(declare-fun e!757438 () Bool)

(declare-fun mapRes!56386 () Bool)

(assert (=> b!1328473 (= e!757441 (and e!757438 mapRes!56386))))

(declare-fun condMapEmpty!56386 () Bool)

(declare-datatypes ((V!53737 0))(
  ( (V!53738 (val!18312 Int)) )
))
(declare-datatypes ((ValueCell!17339 0))(
  ( (ValueCellFull!17339 (v!20949 V!53737)) (EmptyCell!17339) )
))
(declare-datatypes ((array!89846 0))(
  ( (array!89847 (arr!43389 (Array (_ BitVec 32) ValueCell!17339)) (size!43939 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89846)

(declare-fun mapDefault!56386 () ValueCell!17339)

