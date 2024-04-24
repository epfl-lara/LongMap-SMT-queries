; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108328 () Bool)

(assert start!108328)

(declare-fun b_free!27817 () Bool)

(declare-fun b_next!27817 () Bool)

(assert (=> start!108328 (= b_free!27817 (not b_next!27817))))

(declare-fun tp!98405 () Bool)

(declare-fun b_and!45875 () Bool)

(assert (=> start!108328 (= tp!98405 b_and!45875)))

(declare-fun mapIsEmpty!51581 () Bool)

(declare-fun mapRes!51581 () Bool)

(assert (=> mapIsEmpty!51581 mapRes!51581))

(declare-fun res!848923 () Bool)

(declare-fun e!729883 () Bool)

(assert (=> start!108328 (=> (not res!848923) (not e!729883))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108328 (= res!848923 (validMask!0 mask!1805))))

(assert (=> start!108328 e!729883))

(assert (=> start!108328 true))

(assert (=> start!108328 tp!98405))

(declare-fun tp_is_empty!33367 () Bool)

(assert (=> start!108328 tp_is_empty!33367))

(declare-datatypes ((V!49593 0))(
  ( (V!49594 (val!16758 Int)) )
))
(declare-datatypes ((ValueCell!15785 0))(
  ( (ValueCellFull!15785 (v!19350 V!49593)) (EmptyCell!15785) )
))
(declare-datatypes ((array!83857 0))(
  ( (array!83858 (arr!40435 (Array (_ BitVec 32) ValueCell!15785)) (size!40986 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83857)

(declare-fun e!729882 () Bool)

(declare-fun array_inv!30915 (array!83857) Bool)

(assert (=> start!108328 (and (array_inv!30915 _values!1187) e!729882)))

(declare-datatypes ((array!83859 0))(
  ( (array!83860 (arr!40436 (Array (_ BitVec 32) (_ BitVec 64))) (size!40987 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83859)

(declare-fun array_inv!30916 (array!83859) Bool)

(assert (=> start!108328 (array_inv!30916 _keys!1427)))

(declare-fun b!1277954 () Bool)

(declare-fun res!848925 () Bool)

(assert (=> b!1277954 (=> (not res!848925) (not e!729883))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277954 (= res!848925 (and (= (size!40986 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40987 _keys!1427) (size!40986 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51581 () Bool)

(declare-fun tp!98404 () Bool)

(declare-fun e!729881 () Bool)

(assert (=> mapNonEmpty!51581 (= mapRes!51581 (and tp!98404 e!729881))))

(declare-fun mapRest!51581 () (Array (_ BitVec 32) ValueCell!15785))

(declare-fun mapValue!51581 () ValueCell!15785)

(declare-fun mapKey!51581 () (_ BitVec 32))

(assert (=> mapNonEmpty!51581 (= (arr!40435 _values!1187) (store mapRest!51581 mapKey!51581 mapValue!51581))))

(declare-fun b!1277955 () Bool)

(declare-fun e!729879 () Bool)

(assert (=> b!1277955 (= e!729879 tp_is_empty!33367)))

(declare-fun b!1277956 () Bool)

(declare-fun res!848926 () Bool)

(assert (=> b!1277956 (=> (not res!848926) (not e!729883))))

(declare-datatypes ((List!28700 0))(
  ( (Nil!28697) (Cons!28696 (h!29914 (_ BitVec 64)) (t!42228 List!28700)) )
))
(declare-fun arrayNoDuplicates!0 (array!83859 (_ BitVec 32) List!28700) Bool)

(assert (=> b!1277956 (= res!848926 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28697))))

(declare-fun b!1277957 () Bool)

(assert (=> b!1277957 (= e!729882 (and e!729879 mapRes!51581))))

(declare-fun condMapEmpty!51581 () Bool)

(declare-fun mapDefault!51581 () ValueCell!15785)

(assert (=> b!1277957 (= condMapEmpty!51581 (= (arr!40435 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15785)) mapDefault!51581)))))

(declare-fun b!1277958 () Bool)

(declare-fun res!848924 () Bool)

(assert (=> b!1277958 (=> (not res!848924) (not e!729883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83859 (_ BitVec 32)) Bool)

(assert (=> b!1277958 (= res!848924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277959 () Bool)

(assert (=> b!1277959 (= e!729881 tp_is_empty!33367)))

(declare-fun b!1277960 () Bool)

(assert (=> b!1277960 (= e!729883 false)))

(declare-fun minValue!1129 () V!49593)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49593)

(declare-fun defaultEntry!1195 () Int)

(declare-fun lt!576002 () Bool)

(declare-datatypes ((tuple2!21508 0))(
  ( (tuple2!21509 (_1!10765 (_ BitVec 64)) (_2!10765 V!49593)) )
))
(declare-datatypes ((List!28701 0))(
  ( (Nil!28698) (Cons!28697 (h!29915 tuple2!21508) (t!42229 List!28701)) )
))
(declare-datatypes ((ListLongMap!19173 0))(
  ( (ListLongMap!19174 (toList!9602 List!28701)) )
))
(declare-fun contains!7726 (ListLongMap!19173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4671 (array!83859 array!83857 (_ BitVec 32) (_ BitVec 32) V!49593 V!49593 (_ BitVec 32) Int) ListLongMap!19173)

(assert (=> b!1277960 (= lt!576002 (contains!7726 (getCurrentListMap!4671 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(assert (= (and start!108328 res!848923) b!1277954))

(assert (= (and b!1277954 res!848925) b!1277958))

(assert (= (and b!1277958 res!848924) b!1277956))

(assert (= (and b!1277956 res!848926) b!1277960))

(assert (= (and b!1277957 condMapEmpty!51581) mapIsEmpty!51581))

(assert (= (and b!1277957 (not condMapEmpty!51581)) mapNonEmpty!51581))

(get-info :version)

(assert (= (and mapNonEmpty!51581 ((_ is ValueCellFull!15785) mapValue!51581)) b!1277959))

(assert (= (and b!1277957 ((_ is ValueCellFull!15785) mapDefault!51581)) b!1277955))

(assert (= start!108328 b!1277957))

(declare-fun m!1174125 () Bool)

(assert (=> start!108328 m!1174125))

(declare-fun m!1174127 () Bool)

(assert (=> start!108328 m!1174127))

(declare-fun m!1174129 () Bool)

(assert (=> start!108328 m!1174129))

(declare-fun m!1174131 () Bool)

(assert (=> b!1277958 m!1174131))

(declare-fun m!1174133 () Bool)

(assert (=> b!1277960 m!1174133))

(assert (=> b!1277960 m!1174133))

(declare-fun m!1174135 () Bool)

(assert (=> b!1277960 m!1174135))

(declare-fun m!1174137 () Bool)

(assert (=> mapNonEmpty!51581 m!1174137))

(declare-fun m!1174139 () Bool)

(assert (=> b!1277956 m!1174139))

(check-sat (not start!108328) (not b_next!27817) (not b!1277956) b_and!45875 tp_is_empty!33367 (not mapNonEmpty!51581) (not b!1277958) (not b!1277960))
(check-sat b_and!45875 (not b_next!27817))
