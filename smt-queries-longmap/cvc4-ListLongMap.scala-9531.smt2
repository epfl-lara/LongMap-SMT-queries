; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113052 () Bool)

(assert start!113052)

(declare-fun b_free!31103 () Bool)

(declare-fun b_next!31103 () Bool)

(assert (=> start!113052 (= b_free!31103 (not b_next!31103))))

(declare-fun tp!109114 () Bool)

(declare-fun b_and!50133 () Bool)

(assert (=> start!113052 (= tp!109114 b_and!50133)))

(declare-fun mapIsEmpty!57361 () Bool)

(declare-fun mapRes!57361 () Bool)

(assert (=> mapIsEmpty!57361 mapRes!57361))

(declare-fun res!888872 () Bool)

(declare-fun e!763250 () Bool)

(assert (=> start!113052 (=> (not res!888872) (not e!763250))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113052 (= res!888872 (validMask!0 mask!1977))))

(assert (=> start!113052 e!763250))

(declare-fun tp_is_empty!37103 () Bool)

(assert (=> start!113052 tp_is_empty!37103))

(assert (=> start!113052 true))

(declare-datatypes ((array!91060 0))(
  ( (array!91061 (arr!43986 (Array (_ BitVec 32) (_ BitVec 64))) (size!44536 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91060)

(declare-fun array_inv!33167 (array!91060) Bool)

(assert (=> start!113052 (array_inv!33167 _keys!1571)))

(declare-datatypes ((V!54573 0))(
  ( (V!54574 (val!18626 Int)) )
))
(declare-datatypes ((ValueCell!17653 0))(
  ( (ValueCellFull!17653 (v!21274 V!54573)) (EmptyCell!17653) )
))
(declare-datatypes ((array!91062 0))(
  ( (array!91063 (arr!43987 (Array (_ BitVec 32) ValueCell!17653)) (size!44537 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91062)

(declare-fun e!763249 () Bool)

(declare-fun array_inv!33168 (array!91062) Bool)

(assert (=> start!113052 (and (array_inv!33168 _values!1303) e!763249)))

(assert (=> start!113052 tp!109114))

(declare-fun b!1339956 () Bool)

(declare-fun e!763253 () Bool)

(assert (=> b!1339956 (= e!763249 (and e!763253 mapRes!57361))))

(declare-fun condMapEmpty!57361 () Bool)

(declare-fun mapDefault!57361 () ValueCell!17653)

