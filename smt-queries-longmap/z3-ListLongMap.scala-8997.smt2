; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108744 () Bool)

(assert start!108744)

(declare-fun b_free!28257 () Bool)

(declare-fun b_next!28257 () Bool)

(assert (=> start!108744 (= b_free!28257 (not b_next!28257))))

(declare-fun tp!99887 () Bool)

(declare-fun b_and!46323 () Bool)

(assert (=> start!108744 (= tp!99887 b_and!46323)))

(declare-fun b!1284064 () Bool)

(declare-fun res!853020 () Bool)

(declare-fun e!733489 () Bool)

(assert (=> b!1284064 (=> (not res!853020) (not e!733489))))

(declare-datatypes ((array!84852 0))(
  ( (array!84853 (arr!40928 (Array (_ BitVec 32) (_ BitVec 64))) (size!41478 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84852)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84852 (_ BitVec 32)) Bool)

(assert (=> b!1284064 (= res!853020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284065 () Bool)

(declare-fun res!853021 () Bool)

(assert (=> b!1284065 (=> (not res!853021) (not e!733489))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1284065 (= res!853021 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41478 _keys!1741))))))

(declare-fun mapNonEmpty!52403 () Bool)

(declare-fun mapRes!52403 () Bool)

(declare-fun tp!99886 () Bool)

(declare-fun e!733486 () Bool)

(assert (=> mapNonEmpty!52403 (= mapRes!52403 (and tp!99886 e!733486))))

(declare-datatypes ((V!50299 0))(
  ( (V!50300 (val!17023 Int)) )
))
(declare-datatypes ((ValueCell!16050 0))(
  ( (ValueCellFull!16050 (v!19625 V!50299)) (EmptyCell!16050) )
))
(declare-fun mapRest!52403 () (Array (_ BitVec 32) ValueCell!16050))

(declare-fun mapValue!52403 () ValueCell!16050)

(declare-datatypes ((array!84854 0))(
  ( (array!84855 (arr!40929 (Array (_ BitVec 32) ValueCell!16050)) (size!41479 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84854)

(declare-fun mapKey!52403 () (_ BitVec 32))

(assert (=> mapNonEmpty!52403 (= (arr!40929 _values!1445) (store mapRest!52403 mapKey!52403 mapValue!52403))))

(declare-fun res!853022 () Bool)

(assert (=> start!108744 (=> (not res!853022) (not e!733489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108744 (= res!853022 (validMask!0 mask!2175))))

(assert (=> start!108744 e!733489))

(declare-fun tp_is_empty!33897 () Bool)

(assert (=> start!108744 tp_is_empty!33897))

(assert (=> start!108744 true))

(declare-fun e!733490 () Bool)

(declare-fun array_inv!31041 (array!84854) Bool)

(assert (=> start!108744 (and (array_inv!31041 _values!1445) e!733490)))

(declare-fun array_inv!31042 (array!84852) Bool)

(assert (=> start!108744 (array_inv!31042 _keys!1741)))

(assert (=> start!108744 tp!99887))

(declare-fun b!1284066 () Bool)

(declare-fun res!853018 () Bool)

(assert (=> b!1284066 (=> (not res!853018) (not e!733489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284066 (= res!853018 (validKeyInArray!0 (select (arr!40928 _keys!1741) from!2144)))))

(declare-fun mapIsEmpty!52403 () Bool)

(assert (=> mapIsEmpty!52403 mapRes!52403))

(declare-fun b!1284067 () Bool)

(assert (=> b!1284067 (= e!733486 tp_is_empty!33897)))

(declare-fun b!1284068 () Bool)

(declare-fun res!853017 () Bool)

(assert (=> b!1284068 (=> (not res!853017) (not e!733489))))

(declare-datatypes ((List!28998 0))(
  ( (Nil!28995) (Cons!28994 (h!30203 (_ BitVec 64)) (t!42542 List!28998)) )
))
(declare-fun arrayNoDuplicates!0 (array!84852 (_ BitVec 32) List!28998) Bool)

(assert (=> b!1284068 (= res!853017 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28995))))

(declare-fun b!1284069 () Bool)

(assert (=> b!1284069 (= e!733489 (not true))))

(declare-datatypes ((tuple2!21804 0))(
  ( (tuple2!21805 (_1!10913 (_ BitVec 64)) (_2!10913 V!50299)) )
))
(declare-datatypes ((List!28999 0))(
  ( (Nil!28996) (Cons!28995 (h!30204 tuple2!21804) (t!42543 List!28999)) )
))
(declare-datatypes ((ListLongMap!19461 0))(
  ( (ListLongMap!19462 (toList!9746 List!28999)) )
))
(declare-fun lt!576760 () ListLongMap!19461)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7863 (ListLongMap!19461 (_ BitVec 64)) Bool)

(assert (=> b!1284069 (contains!7863 lt!576760 k0!1205)))

(declare-fun minValue!1387 () V!50299)

(declare-datatypes ((Unit!42499 0))(
  ( (Unit!42500) )
))
(declare-fun lt!576759 () Unit!42499)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!20 ((_ BitVec 64) (_ BitVec 64) V!50299 ListLongMap!19461) Unit!42499)

(assert (=> b!1284069 (= lt!576759 (lemmaInListMapAfterAddingDiffThenInBefore!20 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576760))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!50299)

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4296 (ListLongMap!19461 tuple2!21804) ListLongMap!19461)

(declare-fun getCurrentListMapNoExtraKeys!5926 (array!84852 array!84854 (_ BitVec 32) (_ BitVec 32) V!50299 V!50299 (_ BitVec 32) Int) ListLongMap!19461)

(assert (=> b!1284069 (= lt!576760 (+!4296 (getCurrentListMapNoExtraKeys!5926 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1284070 () Bool)

(declare-fun res!853016 () Bool)

(assert (=> b!1284070 (=> (not res!853016) (not e!733489))))

(assert (=> b!1284070 (= res!853016 (and (= (size!41479 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41478 _keys!1741) (size!41479 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284071 () Bool)

(declare-fun e!733487 () Bool)

(assert (=> b!1284071 (= e!733490 (and e!733487 mapRes!52403))))

(declare-fun condMapEmpty!52403 () Bool)

(declare-fun mapDefault!52403 () ValueCell!16050)

(assert (=> b!1284071 (= condMapEmpty!52403 (= (arr!40929 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16050)) mapDefault!52403)))))

(declare-fun b!1284072 () Bool)

(declare-fun res!853015 () Bool)

(assert (=> b!1284072 (=> (not res!853015) (not e!733489))))

(assert (=> b!1284072 (= res!853015 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41478 _keys!1741))))))

(declare-fun b!1284073 () Bool)

(assert (=> b!1284073 (= e!733487 tp_is_empty!33897)))

(declare-fun b!1284074 () Bool)

(declare-fun res!853023 () Bool)

(assert (=> b!1284074 (=> (not res!853023) (not e!733489))))

(assert (=> b!1284074 (= res!853023 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1284075 () Bool)

(declare-fun res!853019 () Bool)

(assert (=> b!1284075 (=> (not res!853019) (not e!733489))))

(declare-fun getCurrentListMap!4825 (array!84852 array!84854 (_ BitVec 32) (_ BitVec 32) V!50299 V!50299 (_ BitVec 32) Int) ListLongMap!19461)

(assert (=> b!1284075 (= res!853019 (contains!7863 (getCurrentListMap!4825 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108744 res!853022) b!1284070))

(assert (= (and b!1284070 res!853016) b!1284064))

(assert (= (and b!1284064 res!853020) b!1284068))

(assert (= (and b!1284068 res!853017) b!1284065))

(assert (= (and b!1284065 res!853021) b!1284075))

(assert (= (and b!1284075 res!853019) b!1284072))

(assert (= (and b!1284072 res!853015) b!1284066))

(assert (= (and b!1284066 res!853018) b!1284074))

(assert (= (and b!1284074 res!853023) b!1284069))

(assert (= (and b!1284071 condMapEmpty!52403) mapIsEmpty!52403))

(assert (= (and b!1284071 (not condMapEmpty!52403)) mapNonEmpty!52403))

(get-info :version)

(assert (= (and mapNonEmpty!52403 ((_ is ValueCellFull!16050) mapValue!52403)) b!1284067))

(assert (= (and b!1284071 ((_ is ValueCellFull!16050) mapDefault!52403)) b!1284073))

(assert (= start!108744 b!1284071))

(declare-fun m!1177849 () Bool)

(assert (=> mapNonEmpty!52403 m!1177849))

(declare-fun m!1177851 () Bool)

(assert (=> b!1284068 m!1177851))

(declare-fun m!1177853 () Bool)

(assert (=> b!1284066 m!1177853))

(assert (=> b!1284066 m!1177853))

(declare-fun m!1177855 () Bool)

(assert (=> b!1284066 m!1177855))

(declare-fun m!1177857 () Bool)

(assert (=> start!108744 m!1177857))

(declare-fun m!1177859 () Bool)

(assert (=> start!108744 m!1177859))

(declare-fun m!1177861 () Bool)

(assert (=> start!108744 m!1177861))

(declare-fun m!1177863 () Bool)

(assert (=> b!1284069 m!1177863))

(declare-fun m!1177865 () Bool)

(assert (=> b!1284069 m!1177865))

(declare-fun m!1177867 () Bool)

(assert (=> b!1284069 m!1177867))

(assert (=> b!1284069 m!1177867))

(declare-fun m!1177869 () Bool)

(assert (=> b!1284069 m!1177869))

(declare-fun m!1177871 () Bool)

(assert (=> b!1284075 m!1177871))

(assert (=> b!1284075 m!1177871))

(declare-fun m!1177873 () Bool)

(assert (=> b!1284075 m!1177873))

(declare-fun m!1177875 () Bool)

(assert (=> b!1284064 m!1177875))

(check-sat b_and!46323 (not b!1284068) (not mapNonEmpty!52403) (not start!108744) (not b_next!28257) (not b!1284075) (not b!1284064) (not b!1284069) (not b!1284066) tp_is_empty!33897)
(check-sat b_and!46323 (not b_next!28257))
