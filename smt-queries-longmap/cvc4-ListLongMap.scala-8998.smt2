; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108752 () Bool)

(assert start!108752)

(declare-fun b_free!28265 () Bool)

(declare-fun b_next!28265 () Bool)

(assert (=> start!108752 (= b_free!28265 (not b_next!28265))))

(declare-fun tp!99910 () Bool)

(declare-fun b_and!46331 () Bool)

(assert (=> start!108752 (= tp!99910 b_and!46331)))

(declare-fun mapNonEmpty!52415 () Bool)

(declare-fun mapRes!52415 () Bool)

(declare-fun tp!99911 () Bool)

(declare-fun e!733549 () Bool)

(assert (=> mapNonEmpty!52415 (= mapRes!52415 (and tp!99911 e!733549))))

(declare-datatypes ((V!50309 0))(
  ( (V!50310 (val!17027 Int)) )
))
(declare-datatypes ((ValueCell!16054 0))(
  ( (ValueCellFull!16054 (v!19629 V!50309)) (EmptyCell!16054) )
))
(declare-fun mapValue!52415 () ValueCell!16054)

(declare-fun mapRest!52415 () (Array (_ BitVec 32) ValueCell!16054))

(declare-datatypes ((array!84868 0))(
  ( (array!84869 (arr!40936 (Array (_ BitVec 32) ValueCell!16054)) (size!41486 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84868)

(declare-fun mapKey!52415 () (_ BitVec 32))

(assert (=> mapNonEmpty!52415 (= (arr!40936 _values!1445) (store mapRest!52415 mapKey!52415 mapValue!52415))))

(declare-fun b!1284208 () Bool)

(declare-fun res!853131 () Bool)

(declare-fun e!733550 () Bool)

(assert (=> b!1284208 (=> (not res!853131) (not e!733550))))

(declare-datatypes ((array!84870 0))(
  ( (array!84871 (arr!40937 (Array (_ BitVec 32) (_ BitVec 64))) (size!41487 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84870)

(declare-datatypes ((List!29005 0))(
  ( (Nil!29002) (Cons!29001 (h!30210 (_ BitVec 64)) (t!42549 List!29005)) )
))
(declare-fun arrayNoDuplicates!0 (array!84870 (_ BitVec 32) List!29005) Bool)

(assert (=> b!1284208 (= res!853131 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29002))))

(declare-fun b!1284209 () Bool)

(declare-fun res!853127 () Bool)

(assert (=> b!1284209 (=> (not res!853127) (not e!733550))))

(declare-fun minValue!1387 () V!50309)

(declare-fun zeroValue!1387 () V!50309)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21812 0))(
  ( (tuple2!21813 (_1!10917 (_ BitVec 64)) (_2!10917 V!50309)) )
))
(declare-datatypes ((List!29006 0))(
  ( (Nil!29003) (Cons!29002 (h!30211 tuple2!21812) (t!42550 List!29006)) )
))
(declare-datatypes ((ListLongMap!19469 0))(
  ( (ListLongMap!19470 (toList!9750 List!29006)) )
))
(declare-fun contains!7867 (ListLongMap!19469 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4829 (array!84870 array!84868 (_ BitVec 32) (_ BitVec 32) V!50309 V!50309 (_ BitVec 32) Int) ListLongMap!19469)

(assert (=> b!1284209 (= res!853127 (contains!7867 (getCurrentListMap!4829 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1284210 () Bool)

(declare-fun res!853123 () Bool)

(assert (=> b!1284210 (=> (not res!853123) (not e!733550))))

(assert (=> b!1284210 (= res!853123 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41487 _keys!1741))))))

(declare-fun b!1284211 () Bool)

(declare-fun res!853125 () Bool)

(assert (=> b!1284211 (=> (not res!853125) (not e!733550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284211 (= res!853125 (validKeyInArray!0 (select (arr!40937 _keys!1741) from!2144)))))

(declare-fun b!1284212 () Bool)

(assert (=> b!1284212 (= e!733550 (not true))))

(declare-fun lt!576784 () ListLongMap!19469)

(assert (=> b!1284212 (contains!7867 lt!576784 k!1205)))

(declare-datatypes ((Unit!42507 0))(
  ( (Unit!42508) )
))
(declare-fun lt!576783 () Unit!42507)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!24 ((_ BitVec 64) (_ BitVec 64) V!50309 ListLongMap!19469) Unit!42507)

(assert (=> b!1284212 (= lt!576783 (lemmaInListMapAfterAddingDiffThenInBefore!24 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576784))))

(declare-fun +!4300 (ListLongMap!19469 tuple2!21812) ListLongMap!19469)

(declare-fun getCurrentListMapNoExtraKeys!5930 (array!84870 array!84868 (_ BitVec 32) (_ BitVec 32) V!50309 V!50309 (_ BitVec 32) Int) ListLongMap!19469)

(assert (=> b!1284212 (= lt!576784 (+!4300 (getCurrentListMapNoExtraKeys!5930 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun mapIsEmpty!52415 () Bool)

(assert (=> mapIsEmpty!52415 mapRes!52415))

(declare-fun b!1284214 () Bool)

(declare-fun res!853129 () Bool)

(assert (=> b!1284214 (=> (not res!853129) (not e!733550))))

(assert (=> b!1284214 (= res!853129 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1284215 () Bool)

(declare-fun res!853128 () Bool)

(assert (=> b!1284215 (=> (not res!853128) (not e!733550))))

(assert (=> b!1284215 (= res!853128 (and (= (size!41486 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41487 _keys!1741) (size!41486 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284216 () Bool)

(declare-fun tp_is_empty!33905 () Bool)

(assert (=> b!1284216 (= e!733549 tp_is_empty!33905)))

(declare-fun b!1284217 () Bool)

(declare-fun res!853130 () Bool)

(assert (=> b!1284217 (=> (not res!853130) (not e!733550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84870 (_ BitVec 32)) Bool)

(assert (=> b!1284217 (= res!853130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284218 () Bool)

(declare-fun e!733546 () Bool)

(declare-fun e!733548 () Bool)

(assert (=> b!1284218 (= e!733546 (and e!733548 mapRes!52415))))

(declare-fun condMapEmpty!52415 () Bool)

(declare-fun mapDefault!52415 () ValueCell!16054)

