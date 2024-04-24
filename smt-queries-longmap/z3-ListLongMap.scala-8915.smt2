; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108382 () Bool)

(assert start!108382)

(declare-fun b_free!27853 () Bool)

(declare-fun b_next!27853 () Bool)

(assert (=> start!108382 (= b_free!27853 (not b_next!27853))))

(declare-fun tp!98515 () Bool)

(declare-fun b_and!45913 () Bool)

(assert (=> start!108382 (= tp!98515 b_and!45913)))

(declare-fun b!1278561 () Bool)

(declare-fun e!730260 () Bool)

(declare-fun tp_is_empty!33403 () Bool)

(assert (=> b!1278561 (= e!730260 tp_is_empty!33403)))

(declare-fun b!1278562 () Bool)

(declare-fun e!730259 () Bool)

(declare-fun e!730257 () Bool)

(declare-fun mapRes!51638 () Bool)

(assert (=> b!1278562 (= e!730259 (and e!730257 mapRes!51638))))

(declare-fun condMapEmpty!51638 () Bool)

(declare-datatypes ((V!49641 0))(
  ( (V!49642 (val!16776 Int)) )
))
(declare-datatypes ((ValueCell!15803 0))(
  ( (ValueCellFull!15803 (v!19369 V!49641)) (EmptyCell!15803) )
))
(declare-datatypes ((array!83929 0))(
  ( (array!83930 (arr!40470 (Array (_ BitVec 32) ValueCell!15803)) (size!41021 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83929)

(declare-fun mapDefault!51638 () ValueCell!15803)

(assert (=> b!1278562 (= condMapEmpty!51638 (= (arr!40470 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15803)) mapDefault!51638)))))

(declare-fun b!1278563 () Bool)

(declare-fun res!849245 () Bool)

(declare-fun e!730261 () Bool)

(assert (=> b!1278563 (=> (not res!849245) (not e!730261))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83931 0))(
  ( (array!83932 (arr!40471 (Array (_ BitVec 32) (_ BitVec 64))) (size!41022 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83931)

(declare-fun mask!1805 () (_ BitVec 32))

(assert (=> b!1278563 (= res!849245 (and (= (size!41021 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41022 _keys!1427) (size!41021 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1278565 () Bool)

(assert (=> b!1278565 (= e!730261 false)))

(declare-fun lt!576155 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49641)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49641)

(declare-datatypes ((tuple2!21536 0))(
  ( (tuple2!21537 (_1!10779 (_ BitVec 64)) (_2!10779 V!49641)) )
))
(declare-datatypes ((List!28726 0))(
  ( (Nil!28723) (Cons!28722 (h!29940 tuple2!21536) (t!42256 List!28726)) )
))
(declare-datatypes ((ListLongMap!19201 0))(
  ( (ListLongMap!19202 (toList!9616 List!28726)) )
))
(declare-fun contains!7741 (ListLongMap!19201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4685 (array!83931 array!83929 (_ BitVec 32) (_ BitVec 32) V!49641 V!49641 (_ BitVec 32) Int) ListLongMap!19201)

(assert (=> b!1278565 (= lt!576155 (contains!7741 (getCurrentListMap!4685 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1278566 () Bool)

(declare-fun res!849244 () Bool)

(assert (=> b!1278566 (=> (not res!849244) (not e!730261))))

(declare-datatypes ((List!28727 0))(
  ( (Nil!28724) (Cons!28723 (h!29941 (_ BitVec 64)) (t!42257 List!28727)) )
))
(declare-fun arrayNoDuplicates!0 (array!83931 (_ BitVec 32) List!28727) Bool)

(assert (=> b!1278566 (= res!849244 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28724))))

(declare-fun mapNonEmpty!51638 () Bool)

(declare-fun tp!98516 () Bool)

(assert (=> mapNonEmpty!51638 (= mapRes!51638 (and tp!98516 e!730260))))

(declare-fun mapValue!51638 () ValueCell!15803)

(declare-fun mapRest!51638 () (Array (_ BitVec 32) ValueCell!15803))

(declare-fun mapKey!51638 () (_ BitVec 32))

(assert (=> mapNonEmpty!51638 (= (arr!40470 _values!1187) (store mapRest!51638 mapKey!51638 mapValue!51638))))

(declare-fun mapIsEmpty!51638 () Bool)

(assert (=> mapIsEmpty!51638 mapRes!51638))

(declare-fun b!1278567 () Bool)

(assert (=> b!1278567 (= e!730257 tp_is_empty!33403)))

(declare-fun b!1278564 () Bool)

(declare-fun res!849246 () Bool)

(assert (=> b!1278564 (=> (not res!849246) (not e!730261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83931 (_ BitVec 32)) Bool)

(assert (=> b!1278564 (= res!849246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun res!849247 () Bool)

(assert (=> start!108382 (=> (not res!849247) (not e!730261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108382 (= res!849247 (validMask!0 mask!1805))))

(assert (=> start!108382 e!730261))

(assert (=> start!108382 true))

(assert (=> start!108382 tp!98515))

(assert (=> start!108382 tp_is_empty!33403))

(declare-fun array_inv!30937 (array!83929) Bool)

(assert (=> start!108382 (and (array_inv!30937 _values!1187) e!730259)))

(declare-fun array_inv!30938 (array!83931) Bool)

(assert (=> start!108382 (array_inv!30938 _keys!1427)))

(assert (= (and start!108382 res!849247) b!1278563))

(assert (= (and b!1278563 res!849245) b!1278564))

(assert (= (and b!1278564 res!849246) b!1278566))

(assert (= (and b!1278566 res!849244) b!1278565))

(assert (= (and b!1278562 condMapEmpty!51638) mapIsEmpty!51638))

(assert (= (and b!1278562 (not condMapEmpty!51638)) mapNonEmpty!51638))

(get-info :version)

(assert (= (and mapNonEmpty!51638 ((_ is ValueCellFull!15803) mapValue!51638)) b!1278561))

(assert (= (and b!1278562 ((_ is ValueCellFull!15803) mapDefault!51638)) b!1278567))

(assert (= start!108382 b!1278562))

(declare-fun m!1174533 () Bool)

(assert (=> b!1278565 m!1174533))

(assert (=> b!1278565 m!1174533))

(declare-fun m!1174535 () Bool)

(assert (=> b!1278565 m!1174535))

(declare-fun m!1174537 () Bool)

(assert (=> b!1278566 m!1174537))

(declare-fun m!1174539 () Bool)

(assert (=> mapNonEmpty!51638 m!1174539))

(declare-fun m!1174541 () Bool)

(assert (=> b!1278564 m!1174541))

(declare-fun m!1174543 () Bool)

(assert (=> start!108382 m!1174543))

(declare-fun m!1174545 () Bool)

(assert (=> start!108382 m!1174545))

(declare-fun m!1174547 () Bool)

(assert (=> start!108382 m!1174547))

(check-sat (not b_next!27853) tp_is_empty!33403 b_and!45913 (not b!1278566) (not mapNonEmpty!51638) (not b!1278564) (not start!108382) (not b!1278565))
(check-sat b_and!45913 (not b_next!27853))
