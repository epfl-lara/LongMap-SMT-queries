; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113438 () Bool)

(assert start!113438)

(declare-fun b_free!31489 () Bool)

(declare-fun b_next!31489 () Bool)

(assert (=> start!113438 (= b_free!31489 (not b_next!31489))))

(declare-fun tp!110272 () Bool)

(declare-fun b_and!50759 () Bool)

(assert (=> start!113438 (= tp!110272 b_and!50759)))

(declare-fun b!1346568 () Bool)

(declare-fun e!766195 () Bool)

(assert (=> b!1346568 (= e!766195 false)))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91757 0))(
  ( (array!91758 (arr!44335 (Array (_ BitVec 32) (_ BitVec 64))) (size!44887 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91757)

(declare-datatypes ((V!55089 0))(
  ( (V!55090 (val!18819 Int)) )
))
(declare-fun zeroValue!1245 () V!55089)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17846 0))(
  ( (ValueCellFull!17846 (v!21466 V!55089)) (EmptyCell!17846) )
))
(declare-datatypes ((array!91759 0))(
  ( (array!91760 (arr!44336 (Array (_ BitVec 32) ValueCell!17846)) (size!44888 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91759)

(declare-fun minValue!1245 () V!55089)

(declare-fun lt!595341 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24326 0))(
  ( (tuple2!24327 (_1!12174 (_ BitVec 64)) (_2!12174 V!55089)) )
))
(declare-datatypes ((List!31462 0))(
  ( (Nil!31459) (Cons!31458 (h!32667 tuple2!24326) (t!46044 List!31462)) )
))
(declare-datatypes ((ListLongMap!21983 0))(
  ( (ListLongMap!21984 (toList!11007 List!31462)) )
))
(declare-fun contains!9112 (ListLongMap!21983 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5846 (array!91757 array!91759 (_ BitVec 32) (_ BitVec 32) V!55089 V!55089 (_ BitVec 32) Int) ListLongMap!21983)

(assert (=> b!1346568 (= lt!595341 (contains!9112 (getCurrentListMap!5846 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346569 () Bool)

(declare-fun e!766194 () Bool)

(declare-fun e!766193 () Bool)

(declare-fun mapRes!57940 () Bool)

(assert (=> b!1346569 (= e!766194 (and e!766193 mapRes!57940))))

(declare-fun condMapEmpty!57940 () Bool)

(declare-fun mapDefault!57940 () ValueCell!17846)

(assert (=> b!1346569 (= condMapEmpty!57940 (= (arr!44336 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17846)) mapDefault!57940)))))

(declare-fun b!1346570 () Bool)

(declare-fun res!893530 () Bool)

(assert (=> b!1346570 (=> (not res!893530) (not e!766195))))

(declare-datatypes ((List!31463 0))(
  ( (Nil!31460) (Cons!31459 (h!32668 (_ BitVec 64)) (t!46045 List!31463)) )
))
(declare-fun arrayNoDuplicates!0 (array!91757 (_ BitVec 32) List!31463) Bool)

(assert (=> b!1346570 (= res!893530 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31460))))

(declare-fun b!1346571 () Bool)

(declare-fun tp_is_empty!37489 () Bool)

(assert (=> b!1346571 (= e!766193 tp_is_empty!37489)))

(declare-fun mapIsEmpty!57940 () Bool)

(assert (=> mapIsEmpty!57940 mapRes!57940))

(declare-fun res!893529 () Bool)

(assert (=> start!113438 (=> (not res!893529) (not e!766195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113438 (= res!893529 (validMask!0 mask!1977))))

(assert (=> start!113438 e!766195))

(assert (=> start!113438 tp_is_empty!37489))

(assert (=> start!113438 true))

(declare-fun array_inv!33599 (array!91757) Bool)

(assert (=> start!113438 (array_inv!33599 _keys!1571)))

(declare-fun array_inv!33600 (array!91759) Bool)

(assert (=> start!113438 (and (array_inv!33600 _values!1303) e!766194)))

(assert (=> start!113438 tp!110272))

(declare-fun b!1346567 () Bool)

(declare-fun res!893531 () Bool)

(assert (=> b!1346567 (=> (not res!893531) (not e!766195))))

(assert (=> b!1346567 (= res!893531 (and (= (size!44888 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44887 _keys!1571) (size!44888 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346572 () Bool)

(declare-fun res!893533 () Bool)

(assert (=> b!1346572 (=> (not res!893533) (not e!766195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91757 (_ BitVec 32)) Bool)

(assert (=> b!1346572 (= res!893533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57940 () Bool)

(declare-fun tp!110273 () Bool)

(declare-fun e!766192 () Bool)

(assert (=> mapNonEmpty!57940 (= mapRes!57940 (and tp!110273 e!766192))))

(declare-fun mapRest!57940 () (Array (_ BitVec 32) ValueCell!17846))

(declare-fun mapValue!57940 () ValueCell!17846)

(declare-fun mapKey!57940 () (_ BitVec 32))

(assert (=> mapNonEmpty!57940 (= (arr!44336 _values!1303) (store mapRest!57940 mapKey!57940 mapValue!57940))))

(declare-fun b!1346573 () Bool)

(assert (=> b!1346573 (= e!766192 tp_is_empty!37489)))

(declare-fun b!1346574 () Bool)

(declare-fun res!893532 () Bool)

(assert (=> b!1346574 (=> (not res!893532) (not e!766195))))

(assert (=> b!1346574 (= res!893532 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44887 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113438 res!893529) b!1346567))

(assert (= (and b!1346567 res!893531) b!1346572))

(assert (= (and b!1346572 res!893533) b!1346570))

(assert (= (and b!1346570 res!893530) b!1346574))

(assert (= (and b!1346574 res!893532) b!1346568))

(assert (= (and b!1346569 condMapEmpty!57940) mapIsEmpty!57940))

(assert (= (and b!1346569 (not condMapEmpty!57940)) mapNonEmpty!57940))

(get-info :version)

(assert (= (and mapNonEmpty!57940 ((_ is ValueCellFull!17846) mapValue!57940)) b!1346573))

(assert (= (and b!1346569 ((_ is ValueCellFull!17846) mapDefault!57940)) b!1346571))

(assert (= start!113438 b!1346569))

(declare-fun m!1233199 () Bool)

(assert (=> b!1346572 m!1233199))

(declare-fun m!1233201 () Bool)

(assert (=> start!113438 m!1233201))

(declare-fun m!1233203 () Bool)

(assert (=> start!113438 m!1233203))

(declare-fun m!1233205 () Bool)

(assert (=> start!113438 m!1233205))

(declare-fun m!1233207 () Bool)

(assert (=> b!1346568 m!1233207))

(assert (=> b!1346568 m!1233207))

(declare-fun m!1233209 () Bool)

(assert (=> b!1346568 m!1233209))

(declare-fun m!1233211 () Bool)

(assert (=> b!1346570 m!1233211))

(declare-fun m!1233213 () Bool)

(assert (=> mapNonEmpty!57940 m!1233213))

(check-sat b_and!50759 (not b!1346572) (not mapNonEmpty!57940) (not b!1346570) (not b!1346568) (not b_next!31489) tp_is_empty!37489 (not start!113438))
(check-sat b_and!50759 (not b_next!31489))
