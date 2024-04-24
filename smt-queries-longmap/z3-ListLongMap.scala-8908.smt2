; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108322 () Bool)

(assert start!108322)

(declare-fun b_free!27811 () Bool)

(declare-fun b_next!27811 () Bool)

(assert (=> start!108322 (= b_free!27811 (not b_next!27811))))

(declare-fun tp!98387 () Bool)

(declare-fun b_and!45869 () Bool)

(assert (=> start!108322 (= tp!98387 b_and!45869)))

(declare-fun b!1277891 () Bool)

(declare-fun res!848887 () Bool)

(declare-fun e!729836 () Bool)

(assert (=> b!1277891 (=> (not res!848887) (not e!729836))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83845 0))(
  ( (array!83846 (arr!40429 (Array (_ BitVec 32) (_ BitVec 64))) (size!40980 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83845)

(declare-datatypes ((V!49585 0))(
  ( (V!49586 (val!16755 Int)) )
))
(declare-datatypes ((ValueCell!15782 0))(
  ( (ValueCellFull!15782 (v!19347 V!49585)) (EmptyCell!15782) )
))
(declare-datatypes ((array!83847 0))(
  ( (array!83848 (arr!40430 (Array (_ BitVec 32) ValueCell!15782)) (size!40981 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83847)

(assert (=> b!1277891 (= res!848887 (and (= (size!40981 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40980 _keys!1427) (size!40981 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277892 () Bool)

(declare-fun res!848890 () Bool)

(assert (=> b!1277892 (=> (not res!848890) (not e!729836))))

(declare-datatypes ((List!28694 0))(
  ( (Nil!28691) (Cons!28690 (h!29908 (_ BitVec 64)) (t!42222 List!28694)) )
))
(declare-fun arrayNoDuplicates!0 (array!83845 (_ BitVec 32) List!28694) Bool)

(assert (=> b!1277892 (= res!848890 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28691))))

(declare-fun b!1277893 () Bool)

(declare-fun e!729838 () Bool)

(declare-fun tp_is_empty!33361 () Bool)

(assert (=> b!1277893 (= e!729838 tp_is_empty!33361)))

(declare-fun mapIsEmpty!51572 () Bool)

(declare-fun mapRes!51572 () Bool)

(assert (=> mapIsEmpty!51572 mapRes!51572))

(declare-fun b!1277894 () Bool)

(declare-fun res!848889 () Bool)

(assert (=> b!1277894 (=> (not res!848889) (not e!729836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83845 (_ BitVec 32)) Bool)

(assert (=> b!1277894 (= res!848889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277895 () Bool)

(assert (=> b!1277895 (= e!729836 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun lt!575993 () Bool)

(declare-fun minValue!1129 () V!49585)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49585)

(declare-datatypes ((tuple2!21502 0))(
  ( (tuple2!21503 (_1!10762 (_ BitVec 64)) (_2!10762 V!49585)) )
))
(declare-datatypes ((List!28695 0))(
  ( (Nil!28692) (Cons!28691 (h!29909 tuple2!21502) (t!42223 List!28695)) )
))
(declare-datatypes ((ListLongMap!19167 0))(
  ( (ListLongMap!19168 (toList!9599 List!28695)) )
))
(declare-fun contains!7723 (ListLongMap!19167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4668 (array!83845 array!83847 (_ BitVec 32) (_ BitVec 32) V!49585 V!49585 (_ BitVec 32) Int) ListLongMap!19167)

(assert (=> b!1277895 (= lt!575993 (contains!7723 (getCurrentListMap!4668 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277896 () Bool)

(declare-fun e!729837 () Bool)

(declare-fun e!729835 () Bool)

(assert (=> b!1277896 (= e!729837 (and e!729835 mapRes!51572))))

(declare-fun condMapEmpty!51572 () Bool)

(declare-fun mapDefault!51572 () ValueCell!15782)

(assert (=> b!1277896 (= condMapEmpty!51572 (= (arr!40430 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15782)) mapDefault!51572)))))

(declare-fun res!848888 () Bool)

(assert (=> start!108322 (=> (not res!848888) (not e!729836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108322 (= res!848888 (validMask!0 mask!1805))))

(assert (=> start!108322 e!729836))

(assert (=> start!108322 true))

(assert (=> start!108322 tp!98387))

(assert (=> start!108322 tp_is_empty!33361))

(declare-fun array_inv!30911 (array!83847) Bool)

(assert (=> start!108322 (and (array_inv!30911 _values!1187) e!729837)))

(declare-fun array_inv!30912 (array!83845) Bool)

(assert (=> start!108322 (array_inv!30912 _keys!1427)))

(declare-fun mapNonEmpty!51572 () Bool)

(declare-fun tp!98386 () Bool)

(assert (=> mapNonEmpty!51572 (= mapRes!51572 (and tp!98386 e!729838))))

(declare-fun mapRest!51572 () (Array (_ BitVec 32) ValueCell!15782))

(declare-fun mapKey!51572 () (_ BitVec 32))

(declare-fun mapValue!51572 () ValueCell!15782)

(assert (=> mapNonEmpty!51572 (= (arr!40430 _values!1187) (store mapRest!51572 mapKey!51572 mapValue!51572))))

(declare-fun b!1277897 () Bool)

(assert (=> b!1277897 (= e!729835 tp_is_empty!33361)))

(assert (= (and start!108322 res!848888) b!1277891))

(assert (= (and b!1277891 res!848887) b!1277894))

(assert (= (and b!1277894 res!848889) b!1277892))

(assert (= (and b!1277892 res!848890) b!1277895))

(assert (= (and b!1277896 condMapEmpty!51572) mapIsEmpty!51572))

(assert (= (and b!1277896 (not condMapEmpty!51572)) mapNonEmpty!51572))

(get-info :version)

(assert (= (and mapNonEmpty!51572 ((_ is ValueCellFull!15782) mapValue!51572)) b!1277893))

(assert (= (and b!1277896 ((_ is ValueCellFull!15782) mapDefault!51572)) b!1277897))

(assert (= start!108322 b!1277896))

(declare-fun m!1174077 () Bool)

(assert (=> b!1277894 m!1174077))

(declare-fun m!1174079 () Bool)

(assert (=> start!108322 m!1174079))

(declare-fun m!1174081 () Bool)

(assert (=> start!108322 m!1174081))

(declare-fun m!1174083 () Bool)

(assert (=> start!108322 m!1174083))

(declare-fun m!1174085 () Bool)

(assert (=> b!1277892 m!1174085))

(declare-fun m!1174087 () Bool)

(assert (=> b!1277895 m!1174087))

(assert (=> b!1277895 m!1174087))

(declare-fun m!1174089 () Bool)

(assert (=> b!1277895 m!1174089))

(declare-fun m!1174091 () Bool)

(assert (=> mapNonEmpty!51572 m!1174091))

(check-sat (not b!1277892) (not start!108322) b_and!45869 tp_is_empty!33361 (not b!1277894) (not b_next!27811) (not b!1277895) (not mapNonEmpty!51572))
(check-sat b_and!45869 (not b_next!27811))
