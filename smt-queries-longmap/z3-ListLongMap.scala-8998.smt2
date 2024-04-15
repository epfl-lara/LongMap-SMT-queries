; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108748 () Bool)

(assert start!108748)

(declare-fun b_free!28261 () Bool)

(declare-fun b_next!28261 () Bool)

(assert (=> start!108748 (= b_free!28261 (not b_next!28261))))

(declare-fun tp!99900 () Bool)

(declare-fun b_and!46309 () Bool)

(assert (=> start!108748 (= tp!99900 b_and!46309)))

(declare-fun b!1284072 () Bool)

(declare-fun res!853049 () Bool)

(declare-fun e!733489 () Bool)

(assert (=> b!1284072 (=> (not res!853049) (not e!733489))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!84759 0))(
  ( (array!84760 (arr!40882 (Array (_ BitVec 32) (_ BitVec 64))) (size!41434 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84759)

(assert (=> b!1284072 (= res!853049 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41434 _keys!1741))))))

(declare-fun mapNonEmpty!52409 () Bool)

(declare-fun mapRes!52409 () Bool)

(declare-fun tp!99899 () Bool)

(declare-fun e!733487 () Bool)

(assert (=> mapNonEmpty!52409 (= mapRes!52409 (and tp!99899 e!733487))))

(declare-fun mapKey!52409 () (_ BitVec 32))

(declare-datatypes ((V!50305 0))(
  ( (V!50306 (val!17025 Int)) )
))
(declare-datatypes ((ValueCell!16052 0))(
  ( (ValueCellFull!16052 (v!19626 V!50305)) (EmptyCell!16052) )
))
(declare-datatypes ((array!84761 0))(
  ( (array!84762 (arr!40883 (Array (_ BitVec 32) ValueCell!16052)) (size!41435 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84761)

(declare-fun mapValue!52409 () ValueCell!16052)

(declare-fun mapRest!52409 () (Array (_ BitVec 32) ValueCell!16052))

(assert (=> mapNonEmpty!52409 (= (arr!40883 _values!1445) (store mapRest!52409 mapKey!52409 mapValue!52409))))

(declare-fun b!1284073 () Bool)

(declare-fun res!853048 () Bool)

(assert (=> b!1284073 (=> (not res!853048) (not e!733489))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84759 (_ BitVec 32)) Bool)

(assert (=> b!1284073 (= res!853048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284074 () Bool)

(declare-fun tp_is_empty!33901 () Bool)

(assert (=> b!1284074 (= e!733487 tp_is_empty!33901)))

(declare-fun b!1284075 () Bool)

(declare-fun res!853045 () Bool)

(assert (=> b!1284075 (=> (not res!853045) (not e!733489))))

(declare-fun minValue!1387 () V!50305)

(declare-fun zeroValue!1387 () V!50305)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21882 0))(
  ( (tuple2!21883 (_1!10952 (_ BitVec 64)) (_2!10952 V!50305)) )
))
(declare-datatypes ((List!29064 0))(
  ( (Nil!29061) (Cons!29060 (h!30269 tuple2!21882) (t!42600 List!29064)) )
))
(declare-datatypes ((ListLongMap!19539 0))(
  ( (ListLongMap!19540 (toList!9785 List!29064)) )
))
(declare-fun contains!7832 (ListLongMap!19539 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4755 (array!84759 array!84761 (_ BitVec 32) (_ BitVec 32) V!50305 V!50305 (_ BitVec 32) Int) ListLongMap!19539)

(assert (=> b!1284075 (= res!853045 (contains!7832 (getCurrentListMap!4755 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284076 () Bool)

(declare-fun e!733490 () Bool)

(declare-fun e!733491 () Bool)

(assert (=> b!1284076 (= e!733490 (and e!733491 mapRes!52409))))

(declare-fun condMapEmpty!52409 () Bool)

(declare-fun mapDefault!52409 () ValueCell!16052)

(assert (=> b!1284076 (= condMapEmpty!52409 (= (arr!40883 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16052)) mapDefault!52409)))))

(declare-fun b!1284077 () Bool)

(declare-fun res!853047 () Bool)

(assert (=> b!1284077 (=> (not res!853047) (not e!733489))))

(assert (=> b!1284077 (= res!853047 (and (= (size!41435 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41434 _keys!1741) (size!41435 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284078 () Bool)

(declare-fun res!853050 () Bool)

(assert (=> b!1284078 (=> (not res!853050) (not e!733489))))

(declare-datatypes ((List!29065 0))(
  ( (Nil!29062) (Cons!29061 (h!30270 (_ BitVec 64)) (t!42601 List!29065)) )
))
(declare-fun arrayNoDuplicates!0 (array!84759 (_ BitVec 32) List!29065) Bool)

(assert (=> b!1284078 (= res!853050 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29062))))

(declare-fun res!853044 () Bool)

(assert (=> start!108748 (=> (not res!853044) (not e!733489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108748 (= res!853044 (validMask!0 mask!2175))))

(assert (=> start!108748 e!733489))

(assert (=> start!108748 tp_is_empty!33901))

(assert (=> start!108748 true))

(declare-fun array_inv!31169 (array!84761) Bool)

(assert (=> start!108748 (and (array_inv!31169 _values!1445) e!733490)))

(declare-fun array_inv!31170 (array!84759) Bool)

(assert (=> start!108748 (array_inv!31170 _keys!1741)))

(assert (=> start!108748 tp!99900))

(declare-fun b!1284079 () Bool)

(declare-fun res!853042 () Bool)

(assert (=> b!1284079 (=> (not res!853042) (not e!733489))))

(assert (=> b!1284079 (= res!853042 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41434 _keys!1741))))))

(declare-fun mapIsEmpty!52409 () Bool)

(assert (=> mapIsEmpty!52409 mapRes!52409))

(declare-fun b!1284080 () Bool)

(declare-fun res!853043 () Bool)

(assert (=> b!1284080 (=> (not res!853043) (not e!733489))))

(assert (=> b!1284080 (= res!853043 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1284081 () Bool)

(assert (=> b!1284081 (= e!733491 tp_is_empty!33901)))

(declare-fun b!1284082 () Bool)

(declare-fun res!853046 () Bool)

(assert (=> b!1284082 (=> (not res!853046) (not e!733489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284082 (= res!853046 (validKeyInArray!0 (select (arr!40882 _keys!1741) from!2144)))))

(declare-fun b!1284083 () Bool)

(assert (=> b!1284083 (= e!733489 (not true))))

(declare-fun lt!576593 () ListLongMap!19539)

(assert (=> b!1284083 (contains!7832 lt!576593 k0!1205)))

(declare-datatypes ((Unit!42351 0))(
  ( (Unit!42352) )
))
(declare-fun lt!576594 () Unit!42351)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!26 ((_ BitVec 64) (_ BitVec 64) V!50305 ListLongMap!19539) Unit!42351)

(assert (=> b!1284083 (= lt!576594 (lemmaInListMapAfterAddingDiffThenInBefore!26 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576593))))

(declare-fun +!4341 (ListLongMap!19539 tuple2!21882) ListLongMap!19539)

(declare-fun getCurrentListMapNoExtraKeys!5972 (array!84759 array!84761 (_ BitVec 32) (_ BitVec 32) V!50305 V!50305 (_ BitVec 32) Int) ListLongMap!19539)

(assert (=> b!1284083 (= lt!576593 (+!4341 (getCurrentListMapNoExtraKeys!5972 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and start!108748 res!853044) b!1284077))

(assert (= (and b!1284077 res!853047) b!1284073))

(assert (= (and b!1284073 res!853048) b!1284078))

(assert (= (and b!1284078 res!853050) b!1284079))

(assert (= (and b!1284079 res!853042) b!1284075))

(assert (= (and b!1284075 res!853045) b!1284072))

(assert (= (and b!1284072 res!853049) b!1284082))

(assert (= (and b!1284082 res!853046) b!1284080))

(assert (= (and b!1284080 res!853043) b!1284083))

(assert (= (and b!1284076 condMapEmpty!52409) mapIsEmpty!52409))

(assert (= (and b!1284076 (not condMapEmpty!52409)) mapNonEmpty!52409))

(get-info :version)

(assert (= (and mapNonEmpty!52409 ((_ is ValueCellFull!16052) mapValue!52409)) b!1284074))

(assert (= (and b!1284076 ((_ is ValueCellFull!16052) mapDefault!52409)) b!1284081))

(assert (= start!108748 b!1284076))

(declare-fun m!1177405 () Bool)

(assert (=> b!1284082 m!1177405))

(assert (=> b!1284082 m!1177405))

(declare-fun m!1177407 () Bool)

(assert (=> b!1284082 m!1177407))

(declare-fun m!1177409 () Bool)

(assert (=> b!1284078 m!1177409))

(declare-fun m!1177411 () Bool)

(assert (=> start!108748 m!1177411))

(declare-fun m!1177413 () Bool)

(assert (=> start!108748 m!1177413))

(declare-fun m!1177415 () Bool)

(assert (=> start!108748 m!1177415))

(declare-fun m!1177417 () Bool)

(assert (=> b!1284083 m!1177417))

(declare-fun m!1177419 () Bool)

(assert (=> b!1284083 m!1177419))

(declare-fun m!1177421 () Bool)

(assert (=> b!1284083 m!1177421))

(assert (=> b!1284083 m!1177421))

(declare-fun m!1177423 () Bool)

(assert (=> b!1284083 m!1177423))

(declare-fun m!1177425 () Bool)

(assert (=> b!1284073 m!1177425))

(declare-fun m!1177427 () Bool)

(assert (=> b!1284075 m!1177427))

(assert (=> b!1284075 m!1177427))

(declare-fun m!1177429 () Bool)

(assert (=> b!1284075 m!1177429))

(declare-fun m!1177431 () Bool)

(assert (=> mapNonEmpty!52409 m!1177431))

(check-sat (not b!1284075) (not b!1284073) (not b!1284082) (not mapNonEmpty!52409) (not start!108748) b_and!46309 (not b_next!28261) (not b!1284083) (not b!1284078) tp_is_empty!33901)
(check-sat b_and!46309 (not b_next!28261))
