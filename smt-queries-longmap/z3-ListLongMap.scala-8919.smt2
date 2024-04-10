; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108184 () Bool)

(assert start!108184)

(declare-fun b_free!27879 () Bool)

(declare-fun b_next!27879 () Bool)

(assert (=> start!108184 (= b_free!27879 (not b_next!27879))))

(declare-fun tp!98593 () Bool)

(declare-fun b_and!45937 () Bool)

(assert (=> start!108184 (= tp!98593 b_and!45937)))

(declare-fun b!1277529 () Bool)

(declare-fun e!729609 () Bool)

(declare-fun tp_is_empty!33429 () Bool)

(assert (=> b!1277529 (= e!729609 tp_is_empty!33429)))

(declare-fun res!848881 () Bool)

(declare-fun e!729605 () Bool)

(assert (=> start!108184 (=> (not res!848881) (not e!729605))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108184 (= res!848881 (validMask!0 mask!1805))))

(assert (=> start!108184 e!729605))

(assert (=> start!108184 true))

(assert (=> start!108184 tp!98593))

(assert (=> start!108184 tp_is_empty!33429))

(declare-datatypes ((V!49675 0))(
  ( (V!49676 (val!16789 Int)) )
))
(declare-datatypes ((ValueCell!15816 0))(
  ( (ValueCellFull!15816 (v!19387 V!49675)) (EmptyCell!15816) )
))
(declare-datatypes ((array!83952 0))(
  ( (array!83953 (arr!40486 (Array (_ BitVec 32) ValueCell!15816)) (size!41036 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83952)

(declare-fun e!729608 () Bool)

(declare-fun array_inv!30761 (array!83952) Bool)

(assert (=> start!108184 (and (array_inv!30761 _values!1187) e!729608)))

(declare-datatypes ((array!83954 0))(
  ( (array!83955 (arr!40487 (Array (_ BitVec 32) (_ BitVec 64))) (size!41037 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83954)

(declare-fun array_inv!30762 (array!83954) Bool)

(assert (=> start!108184 (array_inv!30762 _keys!1427)))

(declare-fun b!1277530 () Bool)

(declare-fun res!848882 () Bool)

(assert (=> b!1277530 (=> (not res!848882) (not e!729605))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277530 (= res!848882 (and (= (size!41036 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41037 _keys!1427) (size!41036 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277531 () Bool)

(declare-fun e!729606 () Bool)

(declare-fun mapRes!51677 () Bool)

(assert (=> b!1277531 (= e!729608 (and e!729606 mapRes!51677))))

(declare-fun condMapEmpty!51677 () Bool)

(declare-fun mapDefault!51677 () ValueCell!15816)

(assert (=> b!1277531 (= condMapEmpty!51677 (= (arr!40486 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15816)) mapDefault!51677)))))

(declare-fun b!1277532 () Bool)

(assert (=> b!1277532 (= e!729606 tp_is_empty!33429)))

(declare-fun mapNonEmpty!51677 () Bool)

(declare-fun tp!98594 () Bool)

(assert (=> mapNonEmpty!51677 (= mapRes!51677 (and tp!98594 e!729609))))

(declare-fun mapValue!51677 () ValueCell!15816)

(declare-fun mapKey!51677 () (_ BitVec 32))

(declare-fun mapRest!51677 () (Array (_ BitVec 32) ValueCell!15816))

(assert (=> mapNonEmpty!51677 (= (arr!40486 _values!1187) (store mapRest!51677 mapKey!51677 mapValue!51677))))

(declare-fun b!1277533 () Bool)

(declare-fun res!848880 () Bool)

(assert (=> b!1277533 (=> (not res!848880) (not e!729605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83954 (_ BitVec 32)) Bool)

(assert (=> b!1277533 (= res!848880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277534 () Bool)

(declare-fun res!848883 () Bool)

(assert (=> b!1277534 (=> (not res!848883) (not e!729605))))

(declare-datatypes ((List!28713 0))(
  ( (Nil!28710) (Cons!28709 (h!29918 (_ BitVec 64)) (t!42251 List!28713)) )
))
(declare-fun arrayNoDuplicates!0 (array!83954 (_ BitVec 32) List!28713) Bool)

(assert (=> b!1277534 (= res!848883 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28710))))

(declare-fun mapIsEmpty!51677 () Bool)

(assert (=> mapIsEmpty!51677 mapRes!51677))

(declare-fun b!1277535 () Bool)

(assert (=> b!1277535 (= e!729605 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49675)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun lt!575710 () Bool)

(declare-fun zeroValue!1129 () V!49675)

(declare-datatypes ((tuple2!21536 0))(
  ( (tuple2!21537 (_1!10779 (_ BitVec 64)) (_2!10779 V!49675)) )
))
(declare-datatypes ((List!28714 0))(
  ( (Nil!28711) (Cons!28710 (h!29919 tuple2!21536) (t!42252 List!28714)) )
))
(declare-datatypes ((ListLongMap!19193 0))(
  ( (ListLongMap!19194 (toList!9612 List!28714)) )
))
(declare-fun contains!7722 (ListLongMap!19193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4696 (array!83954 array!83952 (_ BitVec 32) (_ BitVec 32) V!49675 V!49675 (_ BitVec 32) Int) ListLongMap!19193)

(assert (=> b!1277535 (= lt!575710 (contains!7722 (getCurrentListMap!4696 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(assert (= (and start!108184 res!848881) b!1277530))

(assert (= (and b!1277530 res!848882) b!1277533))

(assert (= (and b!1277533 res!848880) b!1277534))

(assert (= (and b!1277534 res!848883) b!1277535))

(assert (= (and b!1277531 condMapEmpty!51677) mapIsEmpty!51677))

(assert (= (and b!1277531 (not condMapEmpty!51677)) mapNonEmpty!51677))

(get-info :version)

(assert (= (and mapNonEmpty!51677 ((_ is ValueCellFull!15816) mapValue!51677)) b!1277529))

(assert (= (and b!1277531 ((_ is ValueCellFull!15816) mapDefault!51677)) b!1277532))

(assert (= start!108184 b!1277531))

(declare-fun m!1173129 () Bool)

(assert (=> mapNonEmpty!51677 m!1173129))

(declare-fun m!1173131 () Bool)

(assert (=> start!108184 m!1173131))

(declare-fun m!1173133 () Bool)

(assert (=> start!108184 m!1173133))

(declare-fun m!1173135 () Bool)

(assert (=> start!108184 m!1173135))

(declare-fun m!1173137 () Bool)

(assert (=> b!1277535 m!1173137))

(assert (=> b!1277535 m!1173137))

(declare-fun m!1173139 () Bool)

(assert (=> b!1277535 m!1173139))

(declare-fun m!1173141 () Bool)

(assert (=> b!1277533 m!1173141))

(declare-fun m!1173143 () Bool)

(assert (=> b!1277534 m!1173143))

(check-sat b_and!45937 tp_is_empty!33429 (not b_next!27879) (not b!1277535) (not mapNonEmpty!51677) (not start!108184) (not b!1277534) (not b!1277533))
(check-sat b_and!45937 (not b_next!27879))
