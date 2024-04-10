; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3870 () Bool)

(assert start!3870)

(declare-fun b_free!793 () Bool)

(declare-fun b_next!793 () Bool)

(assert (=> start!3870 (= b_free!793 (not b_next!793))))

(declare-fun tp!3795 () Bool)

(declare-fun b_and!1601 () Bool)

(assert (=> start!3870 (= tp!3795 b_and!1601)))

(declare-fun b!27179 () Bool)

(declare-fun res!16096 () Bool)

(declare-fun e!17719 () Bool)

(assert (=> b!27179 (=> (not res!16096) (not e!17719))))

(declare-datatypes ((array!1535 0))(
  ( (array!1536 (arr!722 (Array (_ BitVec 32) (_ BitVec 64))) (size!823 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1535)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1535 (_ BitVec 32)) Bool)

(assert (=> b!27179 (= res!16096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!16098 () Bool)

(assert (=> start!3870 (=> (not res!16098) (not e!17719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3870 (= res!16098 (validMask!0 mask!2294))))

(assert (=> start!3870 e!17719))

(assert (=> start!3870 true))

(assert (=> start!3870 tp!3795))

(declare-datatypes ((V!1355 0))(
  ( (V!1356 (val!600 Int)) )
))
(declare-datatypes ((ValueCell!374 0))(
  ( (ValueCellFull!374 (v!1688 V!1355)) (EmptyCell!374) )
))
(declare-datatypes ((array!1537 0))(
  ( (array!1538 (arr!723 (Array (_ BitVec 32) ValueCell!374)) (size!824 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1537)

(declare-fun e!17716 () Bool)

(declare-fun array_inv!495 (array!1537) Bool)

(assert (=> start!3870 (and (array_inv!495 _values!1501) e!17716)))

(declare-fun array_inv!496 (array!1535) Bool)

(assert (=> start!3870 (array_inv!496 _keys!1833)))

(declare-fun tp_is_empty!1147 () Bool)

(assert (=> start!3870 tp_is_empty!1147))

(declare-fun mapIsEmpty!1246 () Bool)

(declare-fun mapRes!1246 () Bool)

(assert (=> mapIsEmpty!1246 mapRes!1246))

(declare-fun b!27180 () Bool)

(declare-fun res!16093 () Bool)

(assert (=> b!27180 (=> (not res!16093) (not e!17719))))

(declare-datatypes ((List!610 0))(
  ( (Nil!607) (Cons!606 (h!1173 (_ BitVec 64)) (t!3301 List!610)) )
))
(declare-fun arrayNoDuplicates!0 (array!1535 (_ BitVec 32) List!610) Bool)

(assert (=> b!27180 (= res!16093 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!607))))

(declare-fun b!27181 () Bool)

(assert (=> b!27181 (= e!17719 (or (bvsge #b00000000000000000000000000000000 (size!823 _keys!1833)) (bvsge (size!823 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun b!27182 () Bool)

(declare-fun res!16094 () Bool)

(assert (=> b!27182 (=> (not res!16094) (not e!17719))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27182 (= res!16094 (validKeyInArray!0 k!1304))))

(declare-fun mapNonEmpty!1246 () Bool)

(declare-fun tp!3796 () Bool)

(declare-fun e!17717 () Bool)

(assert (=> mapNonEmpty!1246 (= mapRes!1246 (and tp!3796 e!17717))))

(declare-fun mapKey!1246 () (_ BitVec 32))

(declare-fun mapValue!1246 () ValueCell!374)

(declare-fun mapRest!1246 () (Array (_ BitVec 32) ValueCell!374))

(assert (=> mapNonEmpty!1246 (= (arr!723 _values!1501) (store mapRest!1246 mapKey!1246 mapValue!1246))))

(declare-fun b!27183 () Bool)

(declare-fun res!16092 () Bool)

(assert (=> b!27183 (=> (not res!16092) (not e!17719))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1355)

(declare-fun minValue!1443 () V!1355)

(declare-datatypes ((tuple2!1010 0))(
  ( (tuple2!1011 (_1!516 (_ BitVec 64)) (_2!516 V!1355)) )
))
(declare-datatypes ((List!611 0))(
  ( (Nil!608) (Cons!607 (h!1174 tuple2!1010) (t!3302 List!611)) )
))
(declare-datatypes ((ListLongMap!587 0))(
  ( (ListLongMap!588 (toList!309 List!611)) )
))
(declare-fun contains!248 (ListLongMap!587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!139 (array!1535 array!1537 (_ BitVec 32) (_ BitVec 32) V!1355 V!1355 (_ BitVec 32) Int) ListLongMap!587)

(assert (=> b!27183 (= res!16092 (not (contains!248 (getCurrentListMap!139 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!27184 () Bool)

(declare-fun e!17718 () Bool)

(assert (=> b!27184 (= e!17718 tp_is_empty!1147)))

(declare-fun b!27185 () Bool)

(assert (=> b!27185 (= e!17717 tp_is_empty!1147)))

(declare-fun b!27186 () Bool)

(declare-fun res!16097 () Bool)

(assert (=> b!27186 (=> (not res!16097) (not e!17719))))

(declare-fun arrayContainsKey!0 (array!1535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27186 (= res!16097 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!27187 () Bool)

(assert (=> b!27187 (= e!17716 (and e!17718 mapRes!1246))))

(declare-fun condMapEmpty!1246 () Bool)

(declare-fun mapDefault!1246 () ValueCell!374)

