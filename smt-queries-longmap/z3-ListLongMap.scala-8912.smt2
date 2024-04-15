; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108122 () Bool)

(assert start!108122)

(declare-fun b_free!27835 () Bool)

(declare-fun b_next!27835 () Bool)

(assert (=> start!108122 (= b_free!27835 (not b_next!27835))))

(declare-fun tp!98460 () Bool)

(declare-fun b_and!45873 () Bool)

(assert (=> start!108122 (= tp!98460 b_and!45873)))

(declare-fun b!1276782 () Bool)

(declare-fun e!729142 () Bool)

(declare-fun tp_is_empty!33385 () Bool)

(assert (=> b!1276782 (= e!729142 tp_is_empty!33385)))

(declare-fun b!1276783 () Bool)

(declare-fun e!729143 () Bool)

(assert (=> b!1276783 (= e!729143 tp_is_empty!33385)))

(declare-fun b!1276784 () Bool)

(declare-fun res!848492 () Bool)

(declare-fun e!729145 () Bool)

(assert (=> b!1276784 (=> (not res!848492) (not e!729145))))

(declare-datatypes ((array!83761 0))(
  ( (array!83762 (arr!40392 (Array (_ BitVec 32) (_ BitVec 64))) (size!40944 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83761)

(assert (=> b!1276784 (= res!848492 (bvslt #b00000000000000000000000000000000 (size!40944 _keys!1427)))))

(declare-fun b!1276785 () Bool)

(declare-fun e!729140 () Bool)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!83761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1276785 (= e!729140 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(declare-fun res!848488 () Bool)

(assert (=> start!108122 (=> (not res!848488) (not e!729145))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108122 (= res!848488 (validMask!0 mask!1805))))

(assert (=> start!108122 e!729145))

(assert (=> start!108122 true))

(assert (=> start!108122 tp!98460))

(assert (=> start!108122 tp_is_empty!33385))

(declare-datatypes ((V!49617 0))(
  ( (V!49618 (val!16767 Int)) )
))
(declare-datatypes ((ValueCell!15794 0))(
  ( (ValueCellFull!15794 (v!19363 V!49617)) (EmptyCell!15794) )
))
(declare-datatypes ((array!83763 0))(
  ( (array!83764 (arr!40393 (Array (_ BitVec 32) ValueCell!15794)) (size!40945 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83763)

(declare-fun e!729144 () Bool)

(declare-fun array_inv!30851 (array!83763) Bool)

(assert (=> start!108122 (and (array_inv!30851 _values!1187) e!729144)))

(declare-fun array_inv!30852 (array!83761) Bool)

(assert (=> start!108122 (array_inv!30852 _keys!1427)))

(declare-fun mapNonEmpty!51608 () Bool)

(declare-fun mapRes!51608 () Bool)

(declare-fun tp!98459 () Bool)

(assert (=> mapNonEmpty!51608 (= mapRes!51608 (and tp!98459 e!729143))))

(declare-fun mapRest!51608 () (Array (_ BitVec 32) ValueCell!15794))

(declare-fun mapKey!51608 () (_ BitVec 32))

(declare-fun mapValue!51608 () ValueCell!15794)

(assert (=> mapNonEmpty!51608 (= (arr!40393 _values!1187) (store mapRest!51608 mapKey!51608 mapValue!51608))))

(declare-fun b!1276786 () Bool)

(declare-fun res!848489 () Bool)

(assert (=> b!1276786 (=> (not res!848489) (not e!729145))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276786 (= res!848489 (and (= (size!40945 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40944 _keys!1427) (size!40945 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276787 () Bool)

(assert (=> b!1276787 (= e!729140 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1276788 () Bool)

(declare-fun res!848490 () Bool)

(assert (=> b!1276788 (=> (not res!848490) (not e!729145))))

(declare-fun defaultEntry!1195 () Int)

(declare-fun zeroValue!1129 () V!49617)

(declare-fun minValue!1129 () V!49617)

(declare-datatypes ((tuple2!21586 0))(
  ( (tuple2!21587 (_1!10804 (_ BitVec 64)) (_2!10804 V!49617)) )
))
(declare-datatypes ((List!28755 0))(
  ( (Nil!28752) (Cons!28751 (h!29960 tuple2!21586) (t!42283 List!28755)) )
))
(declare-datatypes ((ListLongMap!19243 0))(
  ( (ListLongMap!19244 (toList!9637 List!28755)) )
))
(declare-fun contains!7677 (ListLongMap!19243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4611 (array!83761 array!83763 (_ BitVec 32) (_ BitVec 32) V!49617 V!49617 (_ BitVec 32) Int) ListLongMap!19243)

(assert (=> b!1276788 (= res!848490 (contains!7677 (getCurrentListMap!4611 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276789 () Bool)

(assert (=> b!1276789 (= e!729144 (and e!729142 mapRes!51608))))

(declare-fun condMapEmpty!51608 () Bool)

(declare-fun mapDefault!51608 () ValueCell!15794)

(assert (=> b!1276789 (= condMapEmpty!51608 (= (arr!40393 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15794)) mapDefault!51608)))))

(declare-fun mapIsEmpty!51608 () Bool)

(assert (=> mapIsEmpty!51608 mapRes!51608))

(declare-fun b!1276790 () Bool)

(assert (=> b!1276790 (= e!729145 (not true))))

(assert (=> b!1276790 e!729140))

(declare-fun c!123920 () Bool)

(assert (=> b!1276790 (= c!123920 (and (not (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!42207 0))(
  ( (Unit!42208) )
))
(declare-fun lt!575367 () Unit!42207)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!613 (array!83761 array!83763 (_ BitVec 32) (_ BitVec 32) V!49617 V!49617 (_ BitVec 64) (_ BitVec 32) Int) Unit!42207)

(assert (=> b!1276790 (= lt!575367 (lemmaListMapContainsThenArrayContainsFrom!613 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1276791 () Bool)

(declare-fun res!848493 () Bool)

(assert (=> b!1276791 (=> (not res!848493) (not e!729145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83761 (_ BitVec 32)) Bool)

(assert (=> b!1276791 (= res!848493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276792 () Bool)

(declare-fun res!848491 () Bool)

(assert (=> b!1276792 (=> (not res!848491) (not e!729145))))

(declare-datatypes ((List!28756 0))(
  ( (Nil!28753) (Cons!28752 (h!29961 (_ BitVec 64)) (t!42284 List!28756)) )
))
(declare-fun arrayNoDuplicates!0 (array!83761 (_ BitVec 32) List!28756) Bool)

(assert (=> b!1276792 (= res!848491 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28753))))

(assert (= (and start!108122 res!848488) b!1276786))

(assert (= (and b!1276786 res!848489) b!1276791))

(assert (= (and b!1276791 res!848493) b!1276792))

(assert (= (and b!1276792 res!848491) b!1276788))

(assert (= (and b!1276788 res!848490) b!1276784))

(assert (= (and b!1276784 res!848492) b!1276790))

(assert (= (and b!1276790 c!123920) b!1276785))

(assert (= (and b!1276790 (not c!123920)) b!1276787))

(assert (= (and b!1276789 condMapEmpty!51608) mapIsEmpty!51608))

(assert (= (and b!1276789 (not condMapEmpty!51608)) mapNonEmpty!51608))

(get-info :version)

(assert (= (and mapNonEmpty!51608 ((_ is ValueCellFull!15794) mapValue!51608)) b!1276783))

(assert (= (and b!1276789 ((_ is ValueCellFull!15794) mapDefault!51608)) b!1276782))

(assert (= start!108122 b!1276789))

(declare-fun m!1172157 () Bool)

(assert (=> b!1276791 m!1172157))

(declare-fun m!1172159 () Bool)

(assert (=> b!1276792 m!1172159))

(declare-fun m!1172161 () Bool)

(assert (=> start!108122 m!1172161))

(declare-fun m!1172163 () Bool)

(assert (=> start!108122 m!1172163))

(declare-fun m!1172165 () Bool)

(assert (=> start!108122 m!1172165))

(declare-fun m!1172167 () Bool)

(assert (=> b!1276785 m!1172167))

(declare-fun m!1172169 () Bool)

(assert (=> b!1276788 m!1172169))

(assert (=> b!1276788 m!1172169))

(declare-fun m!1172171 () Bool)

(assert (=> b!1276788 m!1172171))

(declare-fun m!1172173 () Bool)

(assert (=> mapNonEmpty!51608 m!1172173))

(declare-fun m!1172175 () Bool)

(assert (=> b!1276790 m!1172175))

(check-sat (not start!108122) (not b!1276791) (not b_next!27835) (not mapNonEmpty!51608) tp_is_empty!33385 (not b!1276785) (not b!1276788) (not b!1276792) b_and!45873 (not b!1276790))
(check-sat b_and!45873 (not b_next!27835))
