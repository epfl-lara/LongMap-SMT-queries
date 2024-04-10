; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113408 () Bool)

(assert start!113408)

(declare-fun b_free!31459 () Bool)

(declare-fun b_next!31459 () Bool)

(assert (=> start!113408 (= b_free!31459 (not b_next!31459))))

(declare-fun tp!110182 () Bool)

(declare-fun b_and!50747 () Bool)

(assert (=> start!113408 (= tp!110182 b_and!50747)))

(declare-fun mapNonEmpty!57895 () Bool)

(declare-fun mapRes!57895 () Bool)

(declare-fun tp!110181 () Bool)

(declare-fun e!766001 () Bool)

(assert (=> mapNonEmpty!57895 (= mapRes!57895 (and tp!110181 e!766001))))

(declare-fun mapKey!57895 () (_ BitVec 32))

(declare-datatypes ((V!55049 0))(
  ( (V!55050 (val!18804 Int)) )
))
(declare-datatypes ((ValueCell!17831 0))(
  ( (ValueCellFull!17831 (v!21452 V!55049)) (EmptyCell!17831) )
))
(declare-fun mapRest!57895 () (Array (_ BitVec 32) ValueCell!17831))

(declare-fun mapValue!57895 () ValueCell!17831)

(declare-datatypes ((array!91754 0))(
  ( (array!91755 (arr!44333 (Array (_ BitVec 32) ValueCell!17831)) (size!44883 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91754)

(assert (=> mapNonEmpty!57895 (= (arr!44333 _values!1303) (store mapRest!57895 mapKey!57895 mapValue!57895))))

(declare-fun b!1346250 () Bool)

(declare-fun res!893306 () Bool)

(declare-fun e!766004 () Bool)

(assert (=> b!1346250 (=> (not res!893306) (not e!766004))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91756 0))(
  ( (array!91757 (arr!44334 (Array (_ BitVec 32) (_ BitVec 64))) (size!44884 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91756)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1346250 (= res!893306 (and (= (size!44883 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44884 _keys!1571) (size!44883 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346251 () Bool)

(declare-fun e!766002 () Bool)

(declare-fun tp_is_empty!37459 () Bool)

(assert (=> b!1346251 (= e!766002 tp_is_empty!37459)))

(declare-fun mapIsEmpty!57895 () Bool)

(assert (=> mapIsEmpty!57895 mapRes!57895))

(declare-fun b!1346252 () Bool)

(assert (=> b!1346252 (= e!766001 tp_is_empty!37459)))

(declare-fun b!1346253 () Bool)

(declare-fun res!893310 () Bool)

(assert (=> b!1346253 (=> (not res!893310) (not e!766004))))

(declare-datatypes ((List!31396 0))(
  ( (Nil!31393) (Cons!31392 (h!32601 (_ BitVec 64)) (t!45986 List!31396)) )
))
(declare-fun arrayNoDuplicates!0 (array!91756 (_ BitVec 32) List!31396) Bool)

(assert (=> b!1346253 (= res!893310 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31393))))

(declare-fun b!1346254 () Bool)

(declare-fun e!766000 () Bool)

(assert (=> b!1346254 (= e!766000 (and e!766002 mapRes!57895))))

(declare-fun condMapEmpty!57895 () Bool)

(declare-fun mapDefault!57895 () ValueCell!17831)

