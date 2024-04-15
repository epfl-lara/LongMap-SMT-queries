; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108194 () Bool)

(assert start!108194)

(declare-fun b_free!27889 () Bool)

(declare-fun b_next!27889 () Bool)

(assert (=> start!108194 (= b_free!27889 (not b_next!27889))))

(declare-fun tp!98624 () Bool)

(declare-fun b_and!45929 () Bool)

(assert (=> start!108194 (= tp!98624 b_and!45929)))

(declare-fun mapIsEmpty!51692 () Bool)

(declare-fun mapRes!51692 () Bool)

(assert (=> mapIsEmpty!51692 mapRes!51692))

(declare-fun b!1277570 () Bool)

(declare-fun res!848915 () Bool)

(declare-fun e!729655 () Bool)

(assert (=> b!1277570 (=> (not res!848915) (not e!729655))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83867 0))(
  ( (array!83868 (arr!40444 (Array (_ BitVec 32) (_ BitVec 64))) (size!40996 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83867)

(declare-datatypes ((V!49689 0))(
  ( (V!49690 (val!16794 Int)) )
))
(declare-datatypes ((ValueCell!15821 0))(
  ( (ValueCellFull!15821 (v!19391 V!49689)) (EmptyCell!15821) )
))
(declare-datatypes ((array!83869 0))(
  ( (array!83870 (arr!40445 (Array (_ BitVec 32) ValueCell!15821)) (size!40997 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83869)

(assert (=> b!1277570 (= res!848915 (and (= (size!40997 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40996 _keys!1427) (size!40997 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277571 () Bool)

(declare-fun e!729651 () Bool)

(declare-fun e!729652 () Bool)

(assert (=> b!1277571 (= e!729651 (and e!729652 mapRes!51692))))

(declare-fun condMapEmpty!51692 () Bool)

(declare-fun mapDefault!51692 () ValueCell!15821)

(assert (=> b!1277571 (= condMapEmpty!51692 (= (arr!40445 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15821)) mapDefault!51692)))))

(declare-fun res!848916 () Bool)

(assert (=> start!108194 (=> (not res!848916) (not e!729655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108194 (= res!848916 (validMask!0 mask!1805))))

(assert (=> start!108194 e!729655))

(assert (=> start!108194 true))

(assert (=> start!108194 tp!98624))

(declare-fun tp_is_empty!33439 () Bool)

(assert (=> start!108194 tp_is_empty!33439))

(declare-fun array_inv!30887 (array!83869) Bool)

(assert (=> start!108194 (and (array_inv!30887 _values!1187) e!729651)))

(declare-fun array_inv!30888 (array!83867) Bool)

(assert (=> start!108194 (array_inv!30888 _keys!1427)))

(declare-fun b!1277572 () Bool)

(declare-fun e!729653 () Bool)

(assert (=> b!1277572 (= e!729653 tp_is_empty!33439)))

(declare-fun b!1277573 () Bool)

(declare-fun res!848913 () Bool)

(assert (=> b!1277573 (=> (not res!848913) (not e!729655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83867 (_ BitVec 32)) Bool)

(assert (=> b!1277573 (= res!848913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277574 () Bool)

(declare-fun res!848914 () Bool)

(assert (=> b!1277574 (=> (not res!848914) (not e!729655))))

(declare-datatypes ((List!28793 0))(
  ( (Nil!28790) (Cons!28789 (h!29998 (_ BitVec 64)) (t!42323 List!28793)) )
))
(declare-fun arrayNoDuplicates!0 (array!83867 (_ BitVec 32) List!28793) Bool)

(assert (=> b!1277574 (= res!848914 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28790))))

(declare-fun mapNonEmpty!51692 () Bool)

(declare-fun tp!98625 () Bool)

(assert (=> mapNonEmpty!51692 (= mapRes!51692 (and tp!98625 e!729653))))

(declare-fun mapKey!51692 () (_ BitVec 32))

(declare-fun mapRest!51692 () (Array (_ BitVec 32) ValueCell!15821))

(declare-fun mapValue!51692 () ValueCell!15821)

(assert (=> mapNonEmpty!51692 (= (arr!40445 _values!1187) (store mapRest!51692 mapKey!51692 mapValue!51692))))

(declare-fun b!1277575 () Bool)

(assert (=> b!1277575 (= e!729655 false)))

(declare-fun lt!575547 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49689)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49689)

(declare-datatypes ((tuple2!21622 0))(
  ( (tuple2!21623 (_1!10822 (_ BitVec 64)) (_2!10822 V!49689)) )
))
(declare-datatypes ((List!28794 0))(
  ( (Nil!28791) (Cons!28790 (h!29999 tuple2!21622) (t!42324 List!28794)) )
))
(declare-datatypes ((ListLongMap!19279 0))(
  ( (ListLongMap!19280 (toList!9655 List!28794)) )
))
(declare-fun contains!7696 (ListLongMap!19279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4629 (array!83867 array!83869 (_ BitVec 32) (_ BitVec 32) V!49689 V!49689 (_ BitVec 32) Int) ListLongMap!19279)

(assert (=> b!1277575 (= lt!575547 (contains!7696 (getCurrentListMap!4629 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277576 () Bool)

(assert (=> b!1277576 (= e!729652 tp_is_empty!33439)))

(assert (= (and start!108194 res!848916) b!1277570))

(assert (= (and b!1277570 res!848915) b!1277573))

(assert (= (and b!1277573 res!848913) b!1277574))

(assert (= (and b!1277574 res!848914) b!1277575))

(assert (= (and b!1277571 condMapEmpty!51692) mapIsEmpty!51692))

(assert (= (and b!1277571 (not condMapEmpty!51692)) mapNonEmpty!51692))

(get-info :version)

(assert (= (and mapNonEmpty!51692 ((_ is ValueCellFull!15821) mapValue!51692)) b!1277572))

(assert (= (and b!1277571 ((_ is ValueCellFull!15821) mapDefault!51692)) b!1277576))

(assert (= start!108194 b!1277571))

(declare-fun m!1172709 () Bool)

(assert (=> mapNonEmpty!51692 m!1172709))

(declare-fun m!1172711 () Bool)

(assert (=> b!1277575 m!1172711))

(assert (=> b!1277575 m!1172711))

(declare-fun m!1172713 () Bool)

(assert (=> b!1277575 m!1172713))

(declare-fun m!1172715 () Bool)

(assert (=> start!108194 m!1172715))

(declare-fun m!1172717 () Bool)

(assert (=> start!108194 m!1172717))

(declare-fun m!1172719 () Bool)

(assert (=> start!108194 m!1172719))

(declare-fun m!1172721 () Bool)

(assert (=> b!1277573 m!1172721))

(declare-fun m!1172723 () Bool)

(assert (=> b!1277574 m!1172723))

(check-sat tp_is_empty!33439 b_and!45929 (not mapNonEmpty!51692) (not b_next!27889) (not start!108194) (not b!1277573) (not b!1277574) (not b!1277575))
(check-sat b_and!45929 (not b_next!27889))
