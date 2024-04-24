; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3890 () Bool)

(assert start!3890)

(declare-fun b_free!799 () Bool)

(declare-fun b_next!799 () Bool)

(assert (=> start!3890 (= b_free!799 (not b_next!799))))

(declare-fun tp!3817 () Bool)

(declare-fun b_and!1599 () Bool)

(assert (=> start!3890 (= tp!3817 b_and!1599)))

(declare-fun b!27308 () Bool)

(declare-fun e!17787 () Bool)

(assert (=> b!27308 (= e!17787 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1363 0))(
  ( (V!1364 (val!603 Int)) )
))
(declare-datatypes ((ValueCell!377 0))(
  ( (ValueCellFull!377 (v!1692 V!1363)) (EmptyCell!377) )
))
(declare-datatypes ((array!1531 0))(
  ( (array!1532 (arr!719 (Array (_ BitVec 32) ValueCell!377)) (size!820 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1531)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1533 0))(
  ( (array!1534 (arr!720 (Array (_ BitVec 32) (_ BitVec 64))) (size!821 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1533)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1363)

(declare-fun minValue!1443 () V!1363)

(declare-fun lt!10629 () Bool)

(declare-datatypes ((tuple2!1014 0))(
  ( (tuple2!1015 (_1!518 (_ BitVec 64)) (_2!518 V!1363)) )
))
(declare-datatypes ((List!607 0))(
  ( (Nil!604) (Cons!603 (h!1170 tuple2!1014) (t!3294 List!607)) )
))
(declare-datatypes ((ListLongMap!585 0))(
  ( (ListLongMap!586 (toList!308 List!607)) )
))
(declare-fun contains!250 (ListLongMap!585 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!138 (array!1533 array!1531 (_ BitVec 32) (_ BitVec 32) V!1363 V!1363 (_ BitVec 32) Int) ListLongMap!585)

(assert (=> b!27308 (= lt!10629 (contains!250 (getCurrentListMap!138 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!27309 () Bool)

(declare-fun res!16163 () Bool)

(assert (=> b!27309 (=> (not res!16163) (not e!17787))))

(assert (=> b!27309 (= res!16163 (and (= (size!820 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!821 _keys!1833) (size!820 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27310 () Bool)

(declare-fun e!17790 () Bool)

(declare-fun tp_is_empty!1153 () Bool)

(assert (=> b!27310 (= e!17790 tp_is_empty!1153)))

(declare-fun mapIsEmpty!1258 () Bool)

(declare-fun mapRes!1258 () Bool)

(assert (=> mapIsEmpty!1258 mapRes!1258))

(declare-fun b!27311 () Bool)

(declare-fun e!17789 () Bool)

(assert (=> b!27311 (= e!17789 tp_is_empty!1153)))

(declare-fun res!16165 () Bool)

(assert (=> start!3890 (=> (not res!16165) (not e!17787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3890 (= res!16165 (validMask!0 mask!2294))))

(assert (=> start!3890 e!17787))

(assert (=> start!3890 true))

(assert (=> start!3890 tp!3817))

(declare-fun e!17788 () Bool)

(declare-fun array_inv!503 (array!1531) Bool)

(assert (=> start!3890 (and (array_inv!503 _values!1501) e!17788)))

(declare-fun array_inv!504 (array!1533) Bool)

(assert (=> start!3890 (array_inv!504 _keys!1833)))

(assert (=> start!3890 tp_is_empty!1153))

(declare-fun b!27312 () Bool)

(declare-fun res!16166 () Bool)

(assert (=> b!27312 (=> (not res!16166) (not e!17787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1533 (_ BitVec 32)) Bool)

(assert (=> b!27312 (= res!16166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27313 () Bool)

(declare-fun res!16162 () Bool)

(assert (=> b!27313 (=> (not res!16162) (not e!17787))))

(declare-datatypes ((List!608 0))(
  ( (Nil!605) (Cons!604 (h!1171 (_ BitVec 64)) (t!3295 List!608)) )
))
(declare-fun arrayNoDuplicates!0 (array!1533 (_ BitVec 32) List!608) Bool)

(assert (=> b!27313 (= res!16162 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!605))))

(declare-fun mapNonEmpty!1258 () Bool)

(declare-fun tp!3816 () Bool)

(assert (=> mapNonEmpty!1258 (= mapRes!1258 (and tp!3816 e!17789))))

(declare-fun mapRest!1258 () (Array (_ BitVec 32) ValueCell!377))

(declare-fun mapKey!1258 () (_ BitVec 32))

(declare-fun mapValue!1258 () ValueCell!377)

(assert (=> mapNonEmpty!1258 (= (arr!719 _values!1501) (store mapRest!1258 mapKey!1258 mapValue!1258))))

(declare-fun b!27314 () Bool)

(declare-fun res!16164 () Bool)

(assert (=> b!27314 (=> (not res!16164) (not e!17787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27314 (= res!16164 (validKeyInArray!0 k0!1304))))

(declare-fun b!27315 () Bool)

(assert (=> b!27315 (= e!17788 (and e!17790 mapRes!1258))))

(declare-fun condMapEmpty!1258 () Bool)

(declare-fun mapDefault!1258 () ValueCell!377)

(assert (=> b!27315 (= condMapEmpty!1258 (= (arr!719 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!377)) mapDefault!1258)))))

(assert (= (and start!3890 res!16165) b!27309))

(assert (= (and b!27309 res!16163) b!27312))

(assert (= (and b!27312 res!16166) b!27313))

(assert (= (and b!27313 res!16162) b!27314))

(assert (= (and b!27314 res!16164) b!27308))

(assert (= (and b!27315 condMapEmpty!1258) mapIsEmpty!1258))

(assert (= (and b!27315 (not condMapEmpty!1258)) mapNonEmpty!1258))

(get-info :version)

(assert (= (and mapNonEmpty!1258 ((_ is ValueCellFull!377) mapValue!1258)) b!27311))

(assert (= (and b!27315 ((_ is ValueCellFull!377) mapDefault!1258)) b!27310))

(assert (= start!3890 b!27315))

(declare-fun m!21701 () Bool)

(assert (=> mapNonEmpty!1258 m!21701))

(declare-fun m!21703 () Bool)

(assert (=> b!27313 m!21703))

(declare-fun m!21705 () Bool)

(assert (=> b!27314 m!21705))

(declare-fun m!21707 () Bool)

(assert (=> b!27312 m!21707))

(declare-fun m!21709 () Bool)

(assert (=> b!27308 m!21709))

(assert (=> b!27308 m!21709))

(declare-fun m!21711 () Bool)

(assert (=> b!27308 m!21711))

(declare-fun m!21713 () Bool)

(assert (=> start!3890 m!21713))

(declare-fun m!21715 () Bool)

(assert (=> start!3890 m!21715))

(declare-fun m!21717 () Bool)

(assert (=> start!3890 m!21717))

(check-sat (not b!27308) (not mapNonEmpty!1258) (not b!27312) (not b_next!799) (not start!3890) (not b!27314) b_and!1599 (not b!27313) tp_is_empty!1153)
(check-sat b_and!1599 (not b_next!799))
