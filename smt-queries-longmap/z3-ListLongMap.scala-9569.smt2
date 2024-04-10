; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113278 () Bool)

(assert start!113278)

(declare-fun b_free!31329 () Bool)

(declare-fun b_next!31329 () Bool)

(assert (=> start!113278 (= b_free!31329 (not b_next!31329))))

(declare-fun tp!109792 () Bool)

(declare-fun b_and!50551 () Bool)

(assert (=> start!113278 (= tp!109792 b_and!50551)))

(declare-fun b!1344039 () Bool)

(declare-fun e!764946 () Bool)

(declare-fun e!764944 () Bool)

(declare-fun mapRes!57700 () Bool)

(assert (=> b!1344039 (= e!764946 (and e!764944 mapRes!57700))))

(declare-fun condMapEmpty!57700 () Bool)

(declare-datatypes ((V!54875 0))(
  ( (V!54876 (val!18739 Int)) )
))
(declare-datatypes ((ValueCell!17766 0))(
  ( (ValueCellFull!17766 (v!21387 V!54875)) (EmptyCell!17766) )
))
(declare-datatypes ((array!91502 0))(
  ( (array!91503 (arr!44207 (Array (_ BitVec 32) ValueCell!17766)) (size!44757 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91502)

(declare-fun mapDefault!57700 () ValueCell!17766)

(assert (=> b!1344039 (= condMapEmpty!57700 (= (arr!44207 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17766)) mapDefault!57700)))))

(declare-fun mapIsEmpty!57700 () Bool)

(assert (=> mapIsEmpty!57700 mapRes!57700))

(declare-fun res!891749 () Bool)

(declare-fun e!764945 () Bool)

(assert (=> start!113278 (=> (not res!891749) (not e!764945))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113278 (= res!891749 (validMask!0 mask!1977))))

(assert (=> start!113278 e!764945))

(declare-fun tp_is_empty!37329 () Bool)

(assert (=> start!113278 tp_is_empty!37329))

(assert (=> start!113278 true))

(declare-datatypes ((array!91504 0))(
  ( (array!91505 (arr!44208 (Array (_ BitVec 32) (_ BitVec 64))) (size!44758 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91504)

(declare-fun array_inv!33317 (array!91504) Bool)

(assert (=> start!113278 (array_inv!33317 _keys!1571)))

(declare-fun array_inv!33318 (array!91502) Bool)

(assert (=> start!113278 (and (array_inv!33318 _values!1303) e!764946)))

(assert (=> start!113278 tp!109792))

(declare-fun b!1344040 () Bool)

(declare-fun res!891747 () Bool)

(assert (=> b!1344040 (=> (not res!891747) (not e!764945))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344040 (= res!891747 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44758 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344041 () Bool)

(declare-fun res!891746 () Bool)

(assert (=> b!1344041 (=> (not res!891746) (not e!764945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91504 (_ BitVec 32)) Bool)

(assert (=> b!1344041 (= res!891746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344042 () Bool)

(declare-fun res!891750 () Bool)

(assert (=> b!1344042 (=> (not res!891750) (not e!764945))))

(assert (=> b!1344042 (= res!891750 (and (= (size!44757 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44758 _keys!1571) (size!44757 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344043 () Bool)

(assert (=> b!1344043 (= e!764944 tp_is_empty!37329)))

(declare-fun b!1344044 () Bool)

(declare-fun e!764947 () Bool)

(assert (=> b!1344044 (= e!764947 tp_is_empty!37329)))

(declare-fun b!1344045 () Bool)

(assert (=> b!1344045 (= e!764945 false)))

(declare-fun minValue!1245 () V!54875)

(declare-fun lt!595143 () Bool)

(declare-fun zeroValue!1245 () V!54875)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24144 0))(
  ( (tuple2!24145 (_1!12083 (_ BitVec 64)) (_2!12083 V!54875)) )
))
(declare-datatypes ((List!31300 0))(
  ( (Nil!31297) (Cons!31296 (h!32505 tuple2!24144) (t!45824 List!31300)) )
))
(declare-datatypes ((ListLongMap!21801 0))(
  ( (ListLongMap!21802 (toList!10916 List!31300)) )
))
(declare-fun contains!9092 (ListLongMap!21801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5872 (array!91504 array!91502 (_ BitVec 32) (_ BitVec 32) V!54875 V!54875 (_ BitVec 32) Int) ListLongMap!21801)

(assert (=> b!1344045 (= lt!595143 (contains!9092 (getCurrentListMap!5872 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344046 () Bool)

(declare-fun res!891748 () Bool)

(assert (=> b!1344046 (=> (not res!891748) (not e!764945))))

(declare-datatypes ((List!31301 0))(
  ( (Nil!31298) (Cons!31297 (h!32506 (_ BitVec 64)) (t!45825 List!31301)) )
))
(declare-fun arrayNoDuplicates!0 (array!91504 (_ BitVec 32) List!31301) Bool)

(assert (=> b!1344046 (= res!891748 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31298))))

(declare-fun mapNonEmpty!57700 () Bool)

(declare-fun tp!109791 () Bool)

(assert (=> mapNonEmpty!57700 (= mapRes!57700 (and tp!109791 e!764947))))

(declare-fun mapRest!57700 () (Array (_ BitVec 32) ValueCell!17766))

(declare-fun mapValue!57700 () ValueCell!17766)

(declare-fun mapKey!57700 () (_ BitVec 32))

(assert (=> mapNonEmpty!57700 (= (arr!44207 _values!1303) (store mapRest!57700 mapKey!57700 mapValue!57700))))

(assert (= (and start!113278 res!891749) b!1344042))

(assert (= (and b!1344042 res!891750) b!1344041))

(assert (= (and b!1344041 res!891746) b!1344046))

(assert (= (and b!1344046 res!891748) b!1344040))

(assert (= (and b!1344040 res!891747) b!1344045))

(assert (= (and b!1344039 condMapEmpty!57700) mapIsEmpty!57700))

(assert (= (and b!1344039 (not condMapEmpty!57700)) mapNonEmpty!57700))

(get-info :version)

(assert (= (and mapNonEmpty!57700 ((_ is ValueCellFull!17766) mapValue!57700)) b!1344044))

(assert (= (and b!1344039 ((_ is ValueCellFull!17766) mapDefault!57700)) b!1344043))

(assert (= start!113278 b!1344039))

(declare-fun m!1231775 () Bool)

(assert (=> start!113278 m!1231775))

(declare-fun m!1231777 () Bool)

(assert (=> start!113278 m!1231777))

(declare-fun m!1231779 () Bool)

(assert (=> start!113278 m!1231779))

(declare-fun m!1231781 () Bool)

(assert (=> mapNonEmpty!57700 m!1231781))

(declare-fun m!1231783 () Bool)

(assert (=> b!1344046 m!1231783))

(declare-fun m!1231785 () Bool)

(assert (=> b!1344045 m!1231785))

(assert (=> b!1344045 m!1231785))

(declare-fun m!1231787 () Bool)

(assert (=> b!1344045 m!1231787))

(declare-fun m!1231789 () Bool)

(assert (=> b!1344041 m!1231789))

(check-sat (not mapNonEmpty!57700) (not b_next!31329) (not b!1344041) (not b!1344045) b_and!50551 tp_is_empty!37329 (not start!113278) (not b!1344046))
(check-sat b_and!50551 (not b_next!31329))
