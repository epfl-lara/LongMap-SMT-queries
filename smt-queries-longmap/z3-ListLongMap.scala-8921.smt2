; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108418 () Bool)

(assert start!108418)

(declare-fun b_free!27889 () Bool)

(declare-fun b_next!27889 () Bool)

(assert (=> start!108418 (= b_free!27889 (not b_next!27889))))

(declare-fun tp!98623 () Bool)

(declare-fun b_and!45949 () Bool)

(assert (=> start!108418 (= tp!98623 b_and!45949)))

(declare-fun b!1278939 () Bool)

(declare-fun res!849460 () Bool)

(declare-fun e!730527 () Bool)

(assert (=> b!1278939 (=> (not res!849460) (not e!730527))))

(declare-datatypes ((array!83999 0))(
  ( (array!84000 (arr!40505 (Array (_ BitVec 32) (_ BitVec 64))) (size!41056 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83999)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83999 (_ BitVec 32)) Bool)

(assert (=> b!1278939 (= res!849460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1278940 () Bool)

(declare-fun e!730529 () Bool)

(declare-fun tp_is_empty!33439 () Bool)

(assert (=> b!1278940 (= e!730529 tp_is_empty!33439)))

(declare-fun b!1278941 () Bool)

(declare-fun res!849463 () Bool)

(assert (=> b!1278941 (=> (not res!849463) (not e!730527))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((V!49689 0))(
  ( (V!49690 (val!16794 Int)) )
))
(declare-datatypes ((ValueCell!15821 0))(
  ( (ValueCellFull!15821 (v!19387 V!49689)) (EmptyCell!15821) )
))
(declare-datatypes ((array!84001 0))(
  ( (array!84002 (arr!40506 (Array (_ BitVec 32) ValueCell!15821)) (size!41057 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!84001)

(assert (=> b!1278941 (= res!849463 (and (= (size!41057 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41056 _keys!1427) (size!41057 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51692 () Bool)

(declare-fun mapRes!51692 () Bool)

(declare-fun tp!98624 () Bool)

(assert (=> mapNonEmpty!51692 (= mapRes!51692 (and tp!98624 e!730529))))

(declare-fun mapRest!51692 () (Array (_ BitVec 32) ValueCell!15821))

(declare-fun mapKey!51692 () (_ BitVec 32))

(declare-fun mapValue!51692 () ValueCell!15821)

(assert (=> mapNonEmpty!51692 (= (arr!40506 _values!1187) (store mapRest!51692 mapKey!51692 mapValue!51692))))

(declare-fun b!1278942 () Bool)

(declare-fun e!730530 () Bool)

(declare-fun e!730531 () Bool)

(assert (=> b!1278942 (= e!730530 (and e!730531 mapRes!51692))))

(declare-fun condMapEmpty!51692 () Bool)

(declare-fun mapDefault!51692 () ValueCell!15821)

(assert (=> b!1278942 (= condMapEmpty!51692 (= (arr!40506 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15821)) mapDefault!51692)))))

(declare-fun res!849461 () Bool)

(assert (=> start!108418 (=> (not res!849461) (not e!730527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108418 (= res!849461 (validMask!0 mask!1805))))

(assert (=> start!108418 e!730527))

(assert (=> start!108418 true))

(assert (=> start!108418 tp!98623))

(assert (=> start!108418 tp_is_empty!33439))

(declare-fun array_inv!30959 (array!84001) Bool)

(assert (=> start!108418 (and (array_inv!30959 _values!1187) e!730530)))

(declare-fun array_inv!30960 (array!83999) Bool)

(assert (=> start!108418 (array_inv!30960 _keys!1427)))

(declare-fun b!1278943 () Bool)

(assert (=> b!1278943 (= e!730527 false)))

(declare-fun lt!576209 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49689)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49689)

(declare-datatypes ((tuple2!21560 0))(
  ( (tuple2!21561 (_1!10791 (_ BitVec 64)) (_2!10791 V!49689)) )
))
(declare-datatypes ((List!28749 0))(
  ( (Nil!28746) (Cons!28745 (h!29963 tuple2!21560) (t!42279 List!28749)) )
))
(declare-datatypes ((ListLongMap!19225 0))(
  ( (ListLongMap!19226 (toList!9628 List!28749)) )
))
(declare-fun contains!7753 (ListLongMap!19225 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4697 (array!83999 array!84001 (_ BitVec 32) (_ BitVec 32) V!49689 V!49689 (_ BitVec 32) Int) ListLongMap!19225)

(assert (=> b!1278943 (= lt!576209 (contains!7753 (getCurrentListMap!4697 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapIsEmpty!51692 () Bool)

(assert (=> mapIsEmpty!51692 mapRes!51692))

(declare-fun b!1278944 () Bool)

(declare-fun res!849462 () Bool)

(assert (=> b!1278944 (=> (not res!849462) (not e!730527))))

(declare-datatypes ((List!28750 0))(
  ( (Nil!28747) (Cons!28746 (h!29964 (_ BitVec 64)) (t!42280 List!28750)) )
))
(declare-fun arrayNoDuplicates!0 (array!83999 (_ BitVec 32) List!28750) Bool)

(assert (=> b!1278944 (= res!849462 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28747))))

(declare-fun b!1278945 () Bool)

(assert (=> b!1278945 (= e!730531 tp_is_empty!33439)))

(assert (= (and start!108418 res!849461) b!1278941))

(assert (= (and b!1278941 res!849463) b!1278939))

(assert (= (and b!1278939 res!849460) b!1278944))

(assert (= (and b!1278944 res!849462) b!1278943))

(assert (= (and b!1278942 condMapEmpty!51692) mapIsEmpty!51692))

(assert (= (and b!1278942 (not condMapEmpty!51692)) mapNonEmpty!51692))

(get-info :version)

(assert (= (and mapNonEmpty!51692 ((_ is ValueCellFull!15821) mapValue!51692)) b!1278940))

(assert (= (and b!1278942 ((_ is ValueCellFull!15821) mapDefault!51692)) b!1278945))

(assert (= start!108418 b!1278942))

(declare-fun m!1174821 () Bool)

(assert (=> b!1278943 m!1174821))

(assert (=> b!1278943 m!1174821))

(declare-fun m!1174823 () Bool)

(assert (=> b!1278943 m!1174823))

(declare-fun m!1174825 () Bool)

(assert (=> b!1278944 m!1174825))

(declare-fun m!1174827 () Bool)

(assert (=> mapNonEmpty!51692 m!1174827))

(declare-fun m!1174829 () Bool)

(assert (=> start!108418 m!1174829))

(declare-fun m!1174831 () Bool)

(assert (=> start!108418 m!1174831))

(declare-fun m!1174833 () Bool)

(assert (=> start!108418 m!1174833))

(declare-fun m!1174835 () Bool)

(assert (=> b!1278939 m!1174835))

(check-sat (not b!1278939) (not start!108418) tp_is_empty!33439 (not b!1278944) (not b_next!27889) (not mapNonEmpty!51692) b_and!45949 (not b!1278943))
(check-sat b_and!45949 (not b_next!27889))
