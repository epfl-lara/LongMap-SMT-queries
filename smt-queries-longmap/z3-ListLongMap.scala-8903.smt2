; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108070 () Bool)

(assert start!108070)

(declare-fun b_free!27783 () Bool)

(declare-fun b_next!27783 () Bool)

(assert (=> start!108070 (= b_free!27783 (not b_next!27783))))

(declare-fun tp!98303 () Bool)

(declare-fun b_and!45839 () Bool)

(assert (=> start!108070 (= tp!98303 b_and!45839)))

(declare-fun mapIsEmpty!51530 () Bool)

(declare-fun mapRes!51530 () Bool)

(assert (=> mapIsEmpty!51530 mapRes!51530))

(declare-fun b!1276292 () Bool)

(declare-fun e!728781 () Bool)

(declare-fun tp_is_empty!33333 () Bool)

(assert (=> b!1276292 (= e!728781 tp_is_empty!33333)))

(declare-fun b!1276293 () Bool)

(declare-fun e!728779 () Bool)

(assert (=> b!1276293 (= e!728779 tp_is_empty!33333)))

(declare-fun b!1276294 () Bool)

(declare-fun res!848202 () Bool)

(declare-fun e!728778 () Bool)

(assert (=> b!1276294 (=> (not res!848202) (not e!728778))))

(declare-datatypes ((array!83762 0))(
  ( (array!83763 (arr!40392 (Array (_ BitVec 32) (_ BitVec 64))) (size!40942 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83762)

(declare-datatypes ((List!28645 0))(
  ( (Nil!28642) (Cons!28641 (h!29850 (_ BitVec 64)) (t!42181 List!28645)) )
))
(declare-fun arrayNoDuplicates!0 (array!83762 (_ BitVec 32) List!28645) Bool)

(assert (=> b!1276294 (= res!848202 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28642))))

(declare-fun b!1276295 () Bool)

(declare-fun res!848200 () Bool)

(assert (=> b!1276295 (=> (not res!848200) (not e!728778))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((V!49547 0))(
  ( (V!49548 (val!16741 Int)) )
))
(declare-datatypes ((ValueCell!15768 0))(
  ( (ValueCellFull!15768 (v!19338 V!49547)) (EmptyCell!15768) )
))
(declare-datatypes ((array!83764 0))(
  ( (array!83765 (arr!40393 (Array (_ BitVec 32) ValueCell!15768)) (size!40943 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83764)

(assert (=> b!1276295 (= res!848200 (and (= (size!40943 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40942 _keys!1427) (size!40943 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!848199 () Bool)

(assert (=> start!108070 (=> (not res!848199) (not e!728778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108070 (= res!848199 (validMask!0 mask!1805))))

(assert (=> start!108070 e!728778))

(assert (=> start!108070 true))

(assert (=> start!108070 tp!98303))

(assert (=> start!108070 tp_is_empty!33333))

(declare-fun e!728777 () Bool)

(declare-fun array_inv!30697 (array!83764) Bool)

(assert (=> start!108070 (and (array_inv!30697 _values!1187) e!728777)))

(declare-fun array_inv!30698 (array!83762) Bool)

(assert (=> start!108070 (array_inv!30698 _keys!1427)))

(declare-fun b!1276296 () Bool)

(assert (=> b!1276296 (= e!728778 false)))

(declare-fun lt!575467 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49547)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49547)

(declare-datatypes ((tuple2!21474 0))(
  ( (tuple2!21475 (_1!10748 (_ BitVec 64)) (_2!10748 V!49547)) )
))
(declare-datatypes ((List!28646 0))(
  ( (Nil!28643) (Cons!28642 (h!29851 tuple2!21474) (t!42182 List!28646)) )
))
(declare-datatypes ((ListLongMap!19131 0))(
  ( (ListLongMap!19132 (toList!9581 List!28646)) )
))
(declare-fun contains!7690 (ListLongMap!19131 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4665 (array!83762 array!83764 (_ BitVec 32) (_ BitVec 32) V!49547 V!49547 (_ BitVec 32) Int) ListLongMap!19131)

(assert (=> b!1276296 (= lt!575467 (contains!7690 (getCurrentListMap!4665 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276297 () Bool)

(assert (=> b!1276297 (= e!728777 (and e!728779 mapRes!51530))))

(declare-fun condMapEmpty!51530 () Bool)

(declare-fun mapDefault!51530 () ValueCell!15768)

(assert (=> b!1276297 (= condMapEmpty!51530 (= (arr!40393 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15768)) mapDefault!51530)))))

(declare-fun mapNonEmpty!51530 () Bool)

(declare-fun tp!98302 () Bool)

(assert (=> mapNonEmpty!51530 (= mapRes!51530 (and tp!98302 e!728781))))

(declare-fun mapKey!51530 () (_ BitVec 32))

(declare-fun mapValue!51530 () ValueCell!15768)

(declare-fun mapRest!51530 () (Array (_ BitVec 32) ValueCell!15768))

(assert (=> mapNonEmpty!51530 (= (arr!40393 _values!1187) (store mapRest!51530 mapKey!51530 mapValue!51530))))

(declare-fun b!1276298 () Bool)

(declare-fun res!848201 () Bool)

(assert (=> b!1276298 (=> (not res!848201) (not e!728778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83762 (_ BitVec 32)) Bool)

(assert (=> b!1276298 (= res!848201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(assert (= (and start!108070 res!848199) b!1276295))

(assert (= (and b!1276295 res!848200) b!1276298))

(assert (= (and b!1276298 res!848201) b!1276294))

(assert (= (and b!1276294 res!848202) b!1276296))

(assert (= (and b!1276297 condMapEmpty!51530) mapIsEmpty!51530))

(assert (= (and b!1276297 (not condMapEmpty!51530)) mapNonEmpty!51530))

(get-info :version)

(assert (= (and mapNonEmpty!51530 ((_ is ValueCellFull!15768) mapValue!51530)) b!1276292))

(assert (= (and b!1276297 ((_ is ValueCellFull!15768) mapDefault!51530)) b!1276293))

(assert (= start!108070 b!1276297))

(declare-fun m!1172241 () Bool)

(assert (=> mapNonEmpty!51530 m!1172241))

(declare-fun m!1172243 () Bool)

(assert (=> b!1276296 m!1172243))

(assert (=> b!1276296 m!1172243))

(declare-fun m!1172245 () Bool)

(assert (=> b!1276296 m!1172245))

(declare-fun m!1172247 () Bool)

(assert (=> b!1276294 m!1172247))

(declare-fun m!1172249 () Bool)

(assert (=> b!1276298 m!1172249))

(declare-fun m!1172251 () Bool)

(assert (=> start!108070 m!1172251))

(declare-fun m!1172253 () Bool)

(assert (=> start!108070 m!1172253))

(declare-fun m!1172255 () Bool)

(assert (=> start!108070 m!1172255))

(check-sat (not b!1276296) (not b!1276294) (not start!108070) tp_is_empty!33333 (not b!1276298) b_and!45839 (not mapNonEmpty!51530) (not b_next!27783))
(check-sat b_and!45839 (not b_next!27783))
