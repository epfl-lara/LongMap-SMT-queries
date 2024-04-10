; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108228 () Bool)

(assert start!108228)

(declare-fun b_free!27909 () Bool)

(declare-fun b_next!27909 () Bool)

(assert (=> start!108228 (= b_free!27909 (not b_next!27909))))

(declare-fun tp!98686 () Bool)

(declare-fun b_and!45969 () Bool)

(assert (=> start!108228 (= tp!98686 b_and!45969)))

(declare-fun mapNonEmpty!51725 () Bool)

(declare-fun mapRes!51725 () Bool)

(declare-fun tp!98687 () Bool)

(declare-fun e!729906 () Bool)

(assert (=> mapNonEmpty!51725 (= mapRes!51725 (and tp!98687 e!729906))))

(declare-datatypes ((V!49715 0))(
  ( (V!49716 (val!16804 Int)) )
))
(declare-datatypes ((ValueCell!15831 0))(
  ( (ValueCellFull!15831 (v!19403 V!49715)) (EmptyCell!15831) )
))
(declare-fun mapValue!51725 () ValueCell!15831)

(declare-fun mapRest!51725 () (Array (_ BitVec 32) ValueCell!15831))

(declare-fun mapKey!51725 () (_ BitVec 32))

(declare-datatypes ((array!84008 0))(
  ( (array!84009 (arr!40513 (Array (_ BitVec 32) ValueCell!15831)) (size!41063 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!84008)

(assert (=> mapNonEmpty!51725 (= (arr!40513 _values!1187) (store mapRest!51725 mapKey!51725 mapValue!51725))))

(declare-fun b!1277962 () Bool)

(declare-fun res!849115 () Bool)

(declare-fun e!729903 () Bool)

(assert (=> b!1277962 (=> (not res!849115) (not e!729903))))

(declare-datatypes ((array!84010 0))(
  ( (array!84011 (arr!40514 (Array (_ BitVec 32) (_ BitVec 64))) (size!41064 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!84010)

(declare-datatypes ((List!28730 0))(
  ( (Nil!28727) (Cons!28726 (h!29935 (_ BitVec 64)) (t!42270 List!28730)) )
))
(declare-fun arrayNoDuplicates!0 (array!84010 (_ BitVec 32) List!28730) Bool)

(assert (=> b!1277962 (= res!849115 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28727))))

(declare-fun b!1277963 () Bool)

(declare-fun res!849114 () Bool)

(assert (=> b!1277963 (=> (not res!849114) (not e!729903))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277963 (= res!849114 (and (= (size!41063 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41064 _keys!1427) (size!41063 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277964 () Bool)

(declare-fun res!849117 () Bool)

(assert (=> b!1277964 (=> (not res!849117) (not e!729903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84010 (_ BitVec 32)) Bool)

(assert (=> b!1277964 (= res!849117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51725 () Bool)

(assert (=> mapIsEmpty!51725 mapRes!51725))

(declare-fun b!1277966 () Bool)

(declare-fun e!729905 () Bool)

(declare-fun tp_is_empty!33459 () Bool)

(assert (=> b!1277966 (= e!729905 tp_is_empty!33459)))

(declare-fun b!1277967 () Bool)

(assert (=> b!1277967 (= e!729906 tp_is_empty!33459)))

(declare-fun b!1277968 () Bool)

(assert (=> b!1277968 (= e!729903 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49715)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49715)

(declare-fun lt!575833 () Bool)

(declare-datatypes ((tuple2!21554 0))(
  ( (tuple2!21555 (_1!10788 (_ BitVec 64)) (_2!10788 V!49715)) )
))
(declare-datatypes ((List!28731 0))(
  ( (Nil!28728) (Cons!28727 (h!29936 tuple2!21554) (t!42271 List!28731)) )
))
(declare-datatypes ((ListLongMap!19211 0))(
  ( (ListLongMap!19212 (toList!9621 List!28731)) )
))
(declare-fun contains!7732 (ListLongMap!19211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4705 (array!84010 array!84008 (_ BitVec 32) (_ BitVec 32) V!49715 V!49715 (_ BitVec 32) Int) ListLongMap!19211)

(assert (=> b!1277968 (= lt!575833 (contains!7732 (getCurrentListMap!4705 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun res!849116 () Bool)

(assert (=> start!108228 (=> (not res!849116) (not e!729903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108228 (= res!849116 (validMask!0 mask!1805))))

(assert (=> start!108228 e!729903))

(assert (=> start!108228 true))

(assert (=> start!108228 tp!98686))

(assert (=> start!108228 tp_is_empty!33459))

(declare-fun e!729902 () Bool)

(declare-fun array_inv!30775 (array!84008) Bool)

(assert (=> start!108228 (and (array_inv!30775 _values!1187) e!729902)))

(declare-fun array_inv!30776 (array!84010) Bool)

(assert (=> start!108228 (array_inv!30776 _keys!1427)))

(declare-fun b!1277965 () Bool)

(assert (=> b!1277965 (= e!729902 (and e!729905 mapRes!51725))))

(declare-fun condMapEmpty!51725 () Bool)

(declare-fun mapDefault!51725 () ValueCell!15831)

(assert (=> b!1277965 (= condMapEmpty!51725 (= (arr!40513 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15831)) mapDefault!51725)))))

(assert (= (and start!108228 res!849116) b!1277963))

(assert (= (and b!1277963 res!849114) b!1277964))

(assert (= (and b!1277964 res!849117) b!1277962))

(assert (= (and b!1277962 res!849115) b!1277968))

(assert (= (and b!1277965 condMapEmpty!51725) mapIsEmpty!51725))

(assert (= (and b!1277965 (not condMapEmpty!51725)) mapNonEmpty!51725))

(get-info :version)

(assert (= (and mapNonEmpty!51725 ((_ is ValueCellFull!15831) mapValue!51725)) b!1277967))

(assert (= (and b!1277965 ((_ is ValueCellFull!15831) mapDefault!51725)) b!1277966))

(assert (= start!108228 b!1277965))

(declare-fun m!1173449 () Bool)

(assert (=> b!1277964 m!1173449))

(declare-fun m!1173451 () Bool)

(assert (=> start!108228 m!1173451))

(declare-fun m!1173453 () Bool)

(assert (=> start!108228 m!1173453))

(declare-fun m!1173455 () Bool)

(assert (=> start!108228 m!1173455))

(declare-fun m!1173457 () Bool)

(assert (=> mapNonEmpty!51725 m!1173457))

(declare-fun m!1173459 () Bool)

(assert (=> b!1277968 m!1173459))

(assert (=> b!1277968 m!1173459))

(declare-fun m!1173461 () Bool)

(assert (=> b!1277968 m!1173461))

(declare-fun m!1173463 () Bool)

(assert (=> b!1277962 m!1173463))

(check-sat (not mapNonEmpty!51725) (not b!1277964) (not b_next!27909) (not b!1277968) tp_is_empty!33459 (not b!1277962) (not start!108228) b_and!45969)
(check-sat b_and!45969 (not b_next!27909))
