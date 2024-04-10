; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108748 () Bool)

(assert start!108748)

(declare-fun b_free!28261 () Bool)

(declare-fun b_next!28261 () Bool)

(assert (=> start!108748 (= b_free!28261 (not b_next!28261))))

(declare-fun tp!99899 () Bool)

(declare-fun b_and!46327 () Bool)

(assert (=> start!108748 (= tp!99899 b_and!46327)))

(declare-fun b!1284136 () Bool)

(declare-fun res!853072 () Bool)

(declare-fun e!733519 () Bool)

(assert (=> b!1284136 (=> (not res!853072) (not e!733519))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284136 (= res!853072 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1284137 () Bool)

(declare-fun res!853076 () Bool)

(assert (=> b!1284137 (=> (not res!853076) (not e!733519))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84860 0))(
  ( (array!84861 (arr!40932 (Array (_ BitVec 32) (_ BitVec 64))) (size!41482 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84860)

(assert (=> b!1284137 (= res!853076 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41482 _keys!1741))))))

(declare-fun b!1284138 () Bool)

(declare-fun res!853074 () Bool)

(assert (=> b!1284138 (=> (not res!853074) (not e!733519))))

(declare-datatypes ((V!50305 0))(
  ( (V!50306 (val!17025 Int)) )
))
(declare-fun minValue!1387 () V!50305)

(declare-fun zeroValue!1387 () V!50305)

(declare-datatypes ((ValueCell!16052 0))(
  ( (ValueCellFull!16052 (v!19627 V!50305)) (EmptyCell!16052) )
))
(declare-datatypes ((array!84862 0))(
  ( (array!84863 (arr!40933 (Array (_ BitVec 32) ValueCell!16052)) (size!41483 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84862)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21808 0))(
  ( (tuple2!21809 (_1!10915 (_ BitVec 64)) (_2!10915 V!50305)) )
))
(declare-datatypes ((List!29002 0))(
  ( (Nil!28999) (Cons!28998 (h!30207 tuple2!21808) (t!42546 List!29002)) )
))
(declare-datatypes ((ListLongMap!19465 0))(
  ( (ListLongMap!19466 (toList!9748 List!29002)) )
))
(declare-fun contains!7865 (ListLongMap!19465 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4827 (array!84860 array!84862 (_ BitVec 32) (_ BitVec 32) V!50305 V!50305 (_ BitVec 32) Int) ListLongMap!19465)

(assert (=> b!1284138 (= res!853074 (contains!7865 (getCurrentListMap!4827 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1284139 () Bool)

(declare-fun res!853071 () Bool)

(assert (=> b!1284139 (=> (not res!853071) (not e!733519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284139 (= res!853071 (validKeyInArray!0 (select (arr!40932 _keys!1741) from!2144)))))

(declare-fun mapNonEmpty!52409 () Bool)

(declare-fun mapRes!52409 () Bool)

(declare-fun tp!99898 () Bool)

(declare-fun e!733518 () Bool)

(assert (=> mapNonEmpty!52409 (= mapRes!52409 (and tp!99898 e!733518))))

(declare-fun mapValue!52409 () ValueCell!16052)

(declare-fun mapRest!52409 () (Array (_ BitVec 32) ValueCell!16052))

(declare-fun mapKey!52409 () (_ BitVec 32))

(assert (=> mapNonEmpty!52409 (= (arr!40933 _values!1445) (store mapRest!52409 mapKey!52409 mapValue!52409))))

(declare-fun b!1284140 () Bool)

(assert (=> b!1284140 (= e!733519 (not true))))

(declare-fun lt!576771 () ListLongMap!19465)

(assert (=> b!1284140 (contains!7865 lt!576771 k!1205)))

(declare-datatypes ((Unit!42503 0))(
  ( (Unit!42504) )
))
(declare-fun lt!576772 () Unit!42503)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!22 ((_ BitVec 64) (_ BitVec 64) V!50305 ListLongMap!19465) Unit!42503)

(assert (=> b!1284140 (= lt!576772 (lemmaInListMapAfterAddingDiffThenInBefore!22 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576771))))

(declare-fun +!4298 (ListLongMap!19465 tuple2!21808) ListLongMap!19465)

(declare-fun getCurrentListMapNoExtraKeys!5928 (array!84860 array!84862 (_ BitVec 32) (_ BitVec 32) V!50305 V!50305 (_ BitVec 32) Int) ListLongMap!19465)

(assert (=> b!1284140 (= lt!576771 (+!4298 (getCurrentListMapNoExtraKeys!5928 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1284141 () Bool)

(declare-fun e!733520 () Bool)

(declare-fun tp_is_empty!33901 () Bool)

(assert (=> b!1284141 (= e!733520 tp_is_empty!33901)))

(declare-fun b!1284142 () Bool)

(declare-fun res!853075 () Bool)

(assert (=> b!1284142 (=> (not res!853075) (not e!733519))))

(assert (=> b!1284142 (= res!853075 (and (= (size!41483 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41482 _keys!1741) (size!41483 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284143 () Bool)

(declare-fun res!853070 () Bool)

(assert (=> b!1284143 (=> (not res!853070) (not e!733519))))

(assert (=> b!1284143 (= res!853070 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41482 _keys!1741))))))

(declare-fun b!1284144 () Bool)

(declare-fun e!733516 () Bool)

(assert (=> b!1284144 (= e!733516 (and e!733520 mapRes!52409))))

(declare-fun condMapEmpty!52409 () Bool)

(declare-fun mapDefault!52409 () ValueCell!16052)

