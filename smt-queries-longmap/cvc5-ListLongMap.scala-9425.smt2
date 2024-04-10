; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112158 () Bool)

(assert start!112158)

(declare-fun b_free!30553 () Bool)

(declare-fun b_next!30553 () Bool)

(assert (=> start!112158 (= b_free!30553 (not b_next!30553))))

(declare-fun tp!107296 () Bool)

(declare-fun b_and!49203 () Bool)

(assert (=> start!112158 (= tp!107296 b_and!49203)))

(declare-fun b!1328328 () Bool)

(declare-fun e!757349 () Bool)

(declare-fun tp_is_empty!36463 () Bool)

(assert (=> b!1328328 (= e!757349 tp_is_empty!36463)))

(declare-fun mapIsEmpty!56368 () Bool)

(declare-fun mapRes!56368 () Bool)

(assert (=> mapIsEmpty!56368 mapRes!56368))

(declare-fun b!1328329 () Bool)

(declare-fun res!881343 () Bool)

(declare-fun e!757351 () Bool)

(assert (=> b!1328329 (=> (not res!881343) (not e!757351))))

(declare-datatypes ((array!89820 0))(
  ( (array!89821 (arr!43376 (Array (_ BitVec 32) (_ BitVec 64))) (size!43926 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89820)

(declare-datatypes ((List!30718 0))(
  ( (Nil!30715) (Cons!30714 (h!31923 (_ BitVec 64)) (t!44724 List!30718)) )
))
(declare-fun arrayNoDuplicates!0 (array!89820 (_ BitVec 32) List!30718) Bool)

(assert (=> b!1328329 (= res!881343 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30715))))

(declare-fun b!1328330 () Bool)

(assert (=> b!1328330 (= e!757351 false)))

(declare-datatypes ((V!53721 0))(
  ( (V!53722 (val!18306 Int)) )
))
(declare-datatypes ((ValueCell!17333 0))(
  ( (ValueCellFull!17333 (v!20943 V!53721)) (EmptyCell!17333) )
))
(declare-datatypes ((array!89822 0))(
  ( (array!89823 (arr!43377 (Array (_ BitVec 32) ValueCell!17333)) (size!43927 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89822)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53721)

(declare-fun zeroValue!1262 () V!53721)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!590827 () Bool)

(declare-fun k!1153 () (_ BitVec 64))

(declare-datatypes ((tuple2!23562 0))(
  ( (tuple2!23563 (_1!11792 (_ BitVec 64)) (_2!11792 V!53721)) )
))
(declare-datatypes ((List!30719 0))(
  ( (Nil!30716) (Cons!30715 (h!31924 tuple2!23562) (t!44725 List!30719)) )
))
(declare-datatypes ((ListLongMap!21219 0))(
  ( (ListLongMap!21220 (toList!10625 List!30719)) )
))
(declare-fun contains!8789 (ListLongMap!21219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5616 (array!89820 array!89822 (_ BitVec 32) (_ BitVec 32) V!53721 V!53721 (_ BitVec 32) Int) ListLongMap!21219)

(assert (=> b!1328330 (= lt!590827 (contains!8789 (getCurrentListMap!5616 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1328331 () Bool)

(declare-fun res!881339 () Bool)

(assert (=> b!1328331 (=> (not res!881339) (not e!757351))))

(assert (=> b!1328331 (= res!881339 (and (= (size!43927 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43926 _keys!1590) (size!43927 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56368 () Bool)

(declare-fun tp!107295 () Bool)

(assert (=> mapNonEmpty!56368 (= mapRes!56368 (and tp!107295 e!757349))))

(declare-fun mapKey!56368 () (_ BitVec 32))

(declare-fun mapRest!56368 () (Array (_ BitVec 32) ValueCell!17333))

(declare-fun mapValue!56368 () ValueCell!17333)

(assert (=> mapNonEmpty!56368 (= (arr!43377 _values!1320) (store mapRest!56368 mapKey!56368 mapValue!56368))))

(declare-fun b!1328332 () Bool)

(declare-fun e!757348 () Bool)

(declare-fun e!757347 () Bool)

(assert (=> b!1328332 (= e!757348 (and e!757347 mapRes!56368))))

(declare-fun condMapEmpty!56368 () Bool)

(declare-fun mapDefault!56368 () ValueCell!17333)

