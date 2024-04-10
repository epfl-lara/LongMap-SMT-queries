; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113432 () Bool)

(assert start!113432)

(declare-fun b_free!31483 () Bool)

(declare-fun b_next!31483 () Bool)

(assert (=> start!113432 (= b_free!31483 (not b_next!31483))))

(declare-fun tp!110253 () Bool)

(declare-fun b_and!50771 () Bool)

(assert (=> start!113432 (= tp!110253 b_and!50771)))

(declare-fun b!1346544 () Bool)

(declare-fun e!766184 () Bool)

(declare-fun tp_is_empty!37483 () Bool)

(assert (=> b!1346544 (= e!766184 tp_is_empty!37483)))

(declare-fun b!1346545 () Bool)

(declare-fun res!893493 () Bool)

(declare-fun e!766182 () Bool)

(assert (=> b!1346545 (=> (not res!893493) (not e!766182))))

(declare-datatypes ((array!91798 0))(
  ( (array!91799 (arr!44355 (Array (_ BitVec 32) (_ BitVec 64))) (size!44905 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91798)

(declare-datatypes ((List!31409 0))(
  ( (Nil!31406) (Cons!31405 (h!32614 (_ BitVec 64)) (t!45999 List!31409)) )
))
(declare-fun arrayNoDuplicates!0 (array!91798 (_ BitVec 32) List!31409) Bool)

(assert (=> b!1346545 (= res!893493 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31406))))

(declare-fun mapNonEmpty!57931 () Bool)

(declare-fun mapRes!57931 () Bool)

(declare-fun tp!110254 () Bool)

(declare-fun e!766180 () Bool)

(assert (=> mapNonEmpty!57931 (= mapRes!57931 (and tp!110254 e!766180))))

(declare-fun mapKey!57931 () (_ BitVec 32))

(declare-datatypes ((V!55081 0))(
  ( (V!55082 (val!18816 Int)) )
))
(declare-datatypes ((ValueCell!17843 0))(
  ( (ValueCellFull!17843 (v!21464 V!55081)) (EmptyCell!17843) )
))
(declare-fun mapValue!57931 () ValueCell!17843)

(declare-datatypes ((array!91800 0))(
  ( (array!91801 (arr!44356 (Array (_ BitVec 32) ValueCell!17843)) (size!44906 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91800)

(declare-fun mapRest!57931 () (Array (_ BitVec 32) ValueCell!17843))

(assert (=> mapNonEmpty!57931 (= (arr!44356 _values!1303) (store mapRest!57931 mapKey!57931 mapValue!57931))))

(declare-fun b!1346546 () Bool)

(declare-fun res!893498 () Bool)

(assert (=> b!1346546 (=> (not res!893498) (not e!766182))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1346546 (= res!893498 (and (= (size!44906 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44905 _keys!1571) (size!44906 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346547 () Bool)

(assert (=> b!1346547 (= e!766180 tp_is_empty!37483)))

(declare-fun b!1346548 () Bool)

(declare-fun e!766181 () Bool)

(assert (=> b!1346548 (= e!766181 (and e!766184 mapRes!57931))))

(declare-fun condMapEmpty!57931 () Bool)

(declare-fun mapDefault!57931 () ValueCell!17843)

