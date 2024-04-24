; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108340 () Bool)

(assert start!108340)

(declare-fun b_free!27829 () Bool)

(declare-fun b_next!27829 () Bool)

(assert (=> start!108340 (= b_free!27829 (not b_next!27829))))

(declare-fun tp!98440 () Bool)

(declare-fun b_and!45887 () Bool)

(assert (=> start!108340 (= tp!98440 b_and!45887)))

(declare-fun mapNonEmpty!51599 () Bool)

(declare-fun mapRes!51599 () Bool)

(declare-fun tp!98441 () Bool)

(declare-fun e!729969 () Bool)

(assert (=> mapNonEmpty!51599 (= mapRes!51599 (and tp!98441 e!729969))))

(declare-datatypes ((V!49609 0))(
  ( (V!49610 (val!16764 Int)) )
))
(declare-datatypes ((ValueCell!15791 0))(
  ( (ValueCellFull!15791 (v!19356 V!49609)) (EmptyCell!15791) )
))
(declare-fun mapRest!51599 () (Array (_ BitVec 32) ValueCell!15791))

(declare-fun mapValue!51599 () ValueCell!15791)

(declare-fun mapKey!51599 () (_ BitVec 32))

(declare-datatypes ((array!83881 0))(
  ( (array!83882 (arr!40447 (Array (_ BitVec 32) ValueCell!15791)) (size!40998 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83881)

(assert (=> mapNonEmpty!51599 (= (arr!40447 _values!1187) (store mapRest!51599 mapKey!51599 mapValue!51599))))

(declare-fun b!1278080 () Bool)

(declare-fun e!729973 () Bool)

(assert (=> b!1278080 (= e!729973 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun lt!576020 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49609)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49609)

(declare-datatypes ((array!83883 0))(
  ( (array!83884 (arr!40448 (Array (_ BitVec 32) (_ BitVec 64))) (size!40999 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83883)

(declare-datatypes ((tuple2!21520 0))(
  ( (tuple2!21521 (_1!10771 (_ BitVec 64)) (_2!10771 V!49609)) )
))
(declare-datatypes ((List!28710 0))(
  ( (Nil!28707) (Cons!28706 (h!29924 tuple2!21520) (t!42238 List!28710)) )
))
(declare-datatypes ((ListLongMap!19185 0))(
  ( (ListLongMap!19186 (toList!9608 List!28710)) )
))
(declare-fun contains!7732 (ListLongMap!19185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4677 (array!83883 array!83881 (_ BitVec 32) (_ BitVec 32) V!49609 V!49609 (_ BitVec 32) Int) ListLongMap!19185)

(assert (=> b!1278080 (= lt!576020 (contains!7732 (getCurrentListMap!4677 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1278081 () Bool)

(declare-fun res!848998 () Bool)

(assert (=> b!1278081 (=> (not res!848998) (not e!729973))))

(declare-datatypes ((List!28711 0))(
  ( (Nil!28708) (Cons!28707 (h!29925 (_ BitVec 64)) (t!42239 List!28711)) )
))
(declare-fun arrayNoDuplicates!0 (array!83883 (_ BitVec 32) List!28711) Bool)

(assert (=> b!1278081 (= res!848998 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28708))))

(declare-fun b!1278082 () Bool)

(declare-fun e!729972 () Bool)

(declare-fun tp_is_empty!33379 () Bool)

(assert (=> b!1278082 (= e!729972 tp_is_empty!33379)))

(declare-fun b!1278083 () Bool)

(assert (=> b!1278083 (= e!729969 tp_is_empty!33379)))

(declare-fun mapIsEmpty!51599 () Bool)

(assert (=> mapIsEmpty!51599 mapRes!51599))

(declare-fun b!1278084 () Bool)

(declare-fun e!729970 () Bool)

(assert (=> b!1278084 (= e!729970 (and e!729972 mapRes!51599))))

(declare-fun condMapEmpty!51599 () Bool)

(declare-fun mapDefault!51599 () ValueCell!15791)

(assert (=> b!1278084 (= condMapEmpty!51599 (= (arr!40447 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15791)) mapDefault!51599)))))

(declare-fun res!848996 () Bool)

(assert (=> start!108340 (=> (not res!848996) (not e!729973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108340 (= res!848996 (validMask!0 mask!1805))))

(assert (=> start!108340 e!729973))

(assert (=> start!108340 true))

(assert (=> start!108340 tp!98440))

(assert (=> start!108340 tp_is_empty!33379))

(declare-fun array_inv!30921 (array!83881) Bool)

(assert (=> start!108340 (and (array_inv!30921 _values!1187) e!729970)))

(declare-fun array_inv!30922 (array!83883) Bool)

(assert (=> start!108340 (array_inv!30922 _keys!1427)))

(declare-fun b!1278085 () Bool)

(declare-fun res!848995 () Bool)

(assert (=> b!1278085 (=> (not res!848995) (not e!729973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83883 (_ BitVec 32)) Bool)

(assert (=> b!1278085 (= res!848995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1278086 () Bool)

(declare-fun res!848997 () Bool)

(assert (=> b!1278086 (=> (not res!848997) (not e!729973))))

(assert (=> b!1278086 (= res!848997 (and (= (size!40998 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40999 _keys!1427) (size!40998 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(assert (= (and start!108340 res!848996) b!1278086))

(assert (= (and b!1278086 res!848997) b!1278085))

(assert (= (and b!1278085 res!848995) b!1278081))

(assert (= (and b!1278081 res!848998) b!1278080))

(assert (= (and b!1278084 condMapEmpty!51599) mapIsEmpty!51599))

(assert (= (and b!1278084 (not condMapEmpty!51599)) mapNonEmpty!51599))

(get-info :version)

(assert (= (and mapNonEmpty!51599 ((_ is ValueCellFull!15791) mapValue!51599)) b!1278083))

(assert (= (and b!1278084 ((_ is ValueCellFull!15791) mapDefault!51599)) b!1278082))

(assert (= start!108340 b!1278084))

(declare-fun m!1174221 () Bool)

(assert (=> b!1278085 m!1174221))

(declare-fun m!1174223 () Bool)

(assert (=> b!1278081 m!1174223))

(declare-fun m!1174225 () Bool)

(assert (=> b!1278080 m!1174225))

(assert (=> b!1278080 m!1174225))

(declare-fun m!1174227 () Bool)

(assert (=> b!1278080 m!1174227))

(declare-fun m!1174229 () Bool)

(assert (=> mapNonEmpty!51599 m!1174229))

(declare-fun m!1174231 () Bool)

(assert (=> start!108340 m!1174231))

(declare-fun m!1174233 () Bool)

(assert (=> start!108340 m!1174233))

(declare-fun m!1174235 () Bool)

(assert (=> start!108340 m!1174235))

(check-sat (not mapNonEmpty!51599) (not b_next!27829) (not b!1278080) (not b!1278081) (not start!108340) b_and!45887 (not b!1278085) tp_is_empty!33379)
(check-sat b_and!45887 (not b_next!27829))
