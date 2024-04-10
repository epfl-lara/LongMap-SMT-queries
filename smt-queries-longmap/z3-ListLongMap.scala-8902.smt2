; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108064 () Bool)

(assert start!108064)

(declare-fun b_free!27777 () Bool)

(declare-fun b_next!27777 () Bool)

(assert (=> start!108064 (= b_free!27777 (not b_next!27777))))

(declare-fun tp!98285 () Bool)

(declare-fun b_and!45833 () Bool)

(assert (=> start!108064 (= tp!98285 b_and!45833)))

(declare-fun mapNonEmpty!51521 () Bool)

(declare-fun mapRes!51521 () Bool)

(declare-fun tp!98284 () Bool)

(declare-fun e!728733 () Bool)

(assert (=> mapNonEmpty!51521 (= mapRes!51521 (and tp!98284 e!728733))))

(declare-datatypes ((V!49539 0))(
  ( (V!49540 (val!16738 Int)) )
))
(declare-datatypes ((ValueCell!15765 0))(
  ( (ValueCellFull!15765 (v!19335 V!49539)) (EmptyCell!15765) )
))
(declare-fun mapValue!51521 () ValueCell!15765)

(declare-fun mapKey!51521 () (_ BitVec 32))

(declare-datatypes ((array!83750 0))(
  ( (array!83751 (arr!40386 (Array (_ BitVec 32) ValueCell!15765)) (size!40936 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83750)

(declare-fun mapRest!51521 () (Array (_ BitVec 32) ValueCell!15765))

(assert (=> mapNonEmpty!51521 (= (arr!40386 _values!1187) (store mapRest!51521 mapKey!51521 mapValue!51521))))

(declare-fun res!848163 () Bool)

(declare-fun e!728732 () Bool)

(assert (=> start!108064 (=> (not res!848163) (not e!728732))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108064 (= res!848163 (validMask!0 mask!1805))))

(assert (=> start!108064 e!728732))

(assert (=> start!108064 true))

(assert (=> start!108064 tp!98285))

(declare-fun tp_is_empty!33327 () Bool)

(assert (=> start!108064 tp_is_empty!33327))

(declare-fun e!728735 () Bool)

(declare-fun array_inv!30695 (array!83750) Bool)

(assert (=> start!108064 (and (array_inv!30695 _values!1187) e!728735)))

(declare-datatypes ((array!83752 0))(
  ( (array!83753 (arr!40387 (Array (_ BitVec 32) (_ BitVec 64))) (size!40937 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83752)

(declare-fun array_inv!30696 (array!83752) Bool)

(assert (=> start!108064 (array_inv!30696 _keys!1427)))

(declare-fun mapIsEmpty!51521 () Bool)

(assert (=> mapIsEmpty!51521 mapRes!51521))

(declare-fun b!1276229 () Bool)

(declare-fun e!728734 () Bool)

(assert (=> b!1276229 (= e!728734 tp_is_empty!33327)))

(declare-fun b!1276230 () Bool)

(assert (=> b!1276230 (= e!728735 (and e!728734 mapRes!51521))))

(declare-fun condMapEmpty!51521 () Bool)

(declare-fun mapDefault!51521 () ValueCell!15765)

(assert (=> b!1276230 (= condMapEmpty!51521 (= (arr!40386 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15765)) mapDefault!51521)))))

(declare-fun b!1276231 () Bool)

(declare-fun res!848166 () Bool)

(assert (=> b!1276231 (=> (not res!848166) (not e!728732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83752 (_ BitVec 32)) Bool)

(assert (=> b!1276231 (= res!848166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276232 () Bool)

(assert (=> b!1276232 (= e!728733 tp_is_empty!33327)))

(declare-fun b!1276233 () Bool)

(assert (=> b!1276233 (= e!728732 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49539)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun lt!575458 () Bool)

(declare-fun zeroValue!1129 () V!49539)

(declare-datatypes ((tuple2!21468 0))(
  ( (tuple2!21469 (_1!10745 (_ BitVec 64)) (_2!10745 V!49539)) )
))
(declare-datatypes ((List!28640 0))(
  ( (Nil!28637) (Cons!28636 (h!29845 tuple2!21468) (t!42176 List!28640)) )
))
(declare-datatypes ((ListLongMap!19125 0))(
  ( (ListLongMap!19126 (toList!9578 List!28640)) )
))
(declare-fun contains!7687 (ListLongMap!19125 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4662 (array!83752 array!83750 (_ BitVec 32) (_ BitVec 32) V!49539 V!49539 (_ BitVec 32) Int) ListLongMap!19125)

(assert (=> b!1276233 (= lt!575458 (contains!7687 (getCurrentListMap!4662 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276234 () Bool)

(declare-fun res!848165 () Bool)

(assert (=> b!1276234 (=> (not res!848165) (not e!728732))))

(declare-datatypes ((List!28641 0))(
  ( (Nil!28638) (Cons!28637 (h!29846 (_ BitVec 64)) (t!42177 List!28641)) )
))
(declare-fun arrayNoDuplicates!0 (array!83752 (_ BitVec 32) List!28641) Bool)

(assert (=> b!1276234 (= res!848165 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28638))))

(declare-fun b!1276235 () Bool)

(declare-fun res!848164 () Bool)

(assert (=> b!1276235 (=> (not res!848164) (not e!728732))))

(assert (=> b!1276235 (= res!848164 (and (= (size!40936 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40937 _keys!1427) (size!40936 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(assert (= (and start!108064 res!848163) b!1276235))

(assert (= (and b!1276235 res!848164) b!1276231))

(assert (= (and b!1276231 res!848166) b!1276234))

(assert (= (and b!1276234 res!848165) b!1276233))

(assert (= (and b!1276230 condMapEmpty!51521) mapIsEmpty!51521))

(assert (= (and b!1276230 (not condMapEmpty!51521)) mapNonEmpty!51521))

(get-info :version)

(assert (= (and mapNonEmpty!51521 ((_ is ValueCellFull!15765) mapValue!51521)) b!1276232))

(assert (= (and b!1276230 ((_ is ValueCellFull!15765) mapDefault!51521)) b!1276229))

(assert (= start!108064 b!1276230))

(declare-fun m!1172193 () Bool)

(assert (=> mapNonEmpty!51521 m!1172193))

(declare-fun m!1172195 () Bool)

(assert (=> b!1276233 m!1172195))

(assert (=> b!1276233 m!1172195))

(declare-fun m!1172197 () Bool)

(assert (=> b!1276233 m!1172197))

(declare-fun m!1172199 () Bool)

(assert (=> start!108064 m!1172199))

(declare-fun m!1172201 () Bool)

(assert (=> start!108064 m!1172201))

(declare-fun m!1172203 () Bool)

(assert (=> start!108064 m!1172203))

(declare-fun m!1172205 () Bool)

(assert (=> b!1276231 m!1172205))

(declare-fun m!1172207 () Bool)

(assert (=> b!1276234 m!1172207))

(check-sat (not b!1276233) (not b!1276231) b_and!45833 (not start!108064) (not b!1276234) tp_is_empty!33327 (not mapNonEmpty!51521) (not b_next!27777))
(check-sat b_and!45833 (not b_next!27777))
