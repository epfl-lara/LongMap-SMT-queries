; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108334 () Bool)

(assert start!108334)

(declare-fun b_free!27823 () Bool)

(declare-fun b_next!27823 () Bool)

(assert (=> start!108334 (= b_free!27823 (not b_next!27823))))

(declare-fun tp!98423 () Bool)

(declare-fun b_and!45881 () Bool)

(assert (=> start!108334 (= tp!98423 b_and!45881)))

(declare-fun b!1278017 () Bool)

(declare-fun e!729925 () Bool)

(declare-fun e!729924 () Bool)

(declare-fun mapRes!51590 () Bool)

(assert (=> b!1278017 (= e!729925 (and e!729924 mapRes!51590))))

(declare-fun condMapEmpty!51590 () Bool)

(declare-datatypes ((V!49601 0))(
  ( (V!49602 (val!16761 Int)) )
))
(declare-datatypes ((ValueCell!15788 0))(
  ( (ValueCellFull!15788 (v!19353 V!49601)) (EmptyCell!15788) )
))
(declare-datatypes ((array!83869 0))(
  ( (array!83870 (arr!40441 (Array (_ BitVec 32) ValueCell!15788)) (size!40992 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83869)

(declare-fun mapDefault!51590 () ValueCell!15788)

(assert (=> b!1278017 (= condMapEmpty!51590 (= (arr!40441 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15788)) mapDefault!51590)))))

(declare-fun mapNonEmpty!51590 () Bool)

(declare-fun tp!98422 () Bool)

(declare-fun e!729928 () Bool)

(assert (=> mapNonEmpty!51590 (= mapRes!51590 (and tp!98422 e!729928))))

(declare-fun mapRest!51590 () (Array (_ BitVec 32) ValueCell!15788))

(declare-fun mapKey!51590 () (_ BitVec 32))

(declare-fun mapValue!51590 () ValueCell!15788)

(assert (=> mapNonEmpty!51590 (= (arr!40441 _values!1187) (store mapRest!51590 mapKey!51590 mapValue!51590))))

(declare-fun b!1278018 () Bool)

(declare-fun res!848960 () Bool)

(declare-fun e!729926 () Bool)

(assert (=> b!1278018 (=> (not res!848960) (not e!729926))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-datatypes ((array!83871 0))(
  ( (array!83872 (arr!40442 (Array (_ BitVec 32) (_ BitVec 64))) (size!40993 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83871)

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1278018 (= res!848960 (and (= (size!40992 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40993 _keys!1427) (size!40992 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1278019 () Bool)

(declare-fun res!848959 () Bool)

(assert (=> b!1278019 (=> (not res!848959) (not e!729926))))

(declare-datatypes ((List!28705 0))(
  ( (Nil!28702) (Cons!28701 (h!29919 (_ BitVec 64)) (t!42233 List!28705)) )
))
(declare-fun arrayNoDuplicates!0 (array!83871 (_ BitVec 32) List!28705) Bool)

(assert (=> b!1278019 (= res!848959 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28702))))

(declare-fun b!1278020 () Bool)

(assert (=> b!1278020 (= e!729926 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49601)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49601)

(declare-fun lt!576011 () Bool)

(declare-datatypes ((tuple2!21514 0))(
  ( (tuple2!21515 (_1!10768 (_ BitVec 64)) (_2!10768 V!49601)) )
))
(declare-datatypes ((List!28706 0))(
  ( (Nil!28703) (Cons!28702 (h!29920 tuple2!21514) (t!42234 List!28706)) )
))
(declare-datatypes ((ListLongMap!19179 0))(
  ( (ListLongMap!19180 (toList!9605 List!28706)) )
))
(declare-fun contains!7729 (ListLongMap!19179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4674 (array!83871 array!83869 (_ BitVec 32) (_ BitVec 32) V!49601 V!49601 (_ BitVec 32) Int) ListLongMap!19179)

(assert (=> b!1278020 (= lt!576011 (contains!7729 (getCurrentListMap!4674 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1278021 () Bool)

(declare-fun res!848962 () Bool)

(assert (=> b!1278021 (=> (not res!848962) (not e!729926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83871 (_ BitVec 32)) Bool)

(assert (=> b!1278021 (= res!848962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1278022 () Bool)

(declare-fun tp_is_empty!33373 () Bool)

(assert (=> b!1278022 (= e!729928 tp_is_empty!33373)))

(declare-fun b!1278023 () Bool)

(assert (=> b!1278023 (= e!729924 tp_is_empty!33373)))

(declare-fun mapIsEmpty!51590 () Bool)

(assert (=> mapIsEmpty!51590 mapRes!51590))

(declare-fun res!848961 () Bool)

(assert (=> start!108334 (=> (not res!848961) (not e!729926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108334 (= res!848961 (validMask!0 mask!1805))))

(assert (=> start!108334 e!729926))

(assert (=> start!108334 true))

(assert (=> start!108334 tp!98423))

(assert (=> start!108334 tp_is_empty!33373))

(declare-fun array_inv!30917 (array!83869) Bool)

(assert (=> start!108334 (and (array_inv!30917 _values!1187) e!729925)))

(declare-fun array_inv!30918 (array!83871) Bool)

(assert (=> start!108334 (array_inv!30918 _keys!1427)))

(assert (= (and start!108334 res!848961) b!1278018))

(assert (= (and b!1278018 res!848960) b!1278021))

(assert (= (and b!1278021 res!848962) b!1278019))

(assert (= (and b!1278019 res!848959) b!1278020))

(assert (= (and b!1278017 condMapEmpty!51590) mapIsEmpty!51590))

(assert (= (and b!1278017 (not condMapEmpty!51590)) mapNonEmpty!51590))

(get-info :version)

(assert (= (and mapNonEmpty!51590 ((_ is ValueCellFull!15788) mapValue!51590)) b!1278022))

(assert (= (and b!1278017 ((_ is ValueCellFull!15788) mapDefault!51590)) b!1278023))

(assert (= start!108334 b!1278017))

(declare-fun m!1174173 () Bool)

(assert (=> start!108334 m!1174173))

(declare-fun m!1174175 () Bool)

(assert (=> start!108334 m!1174175))

(declare-fun m!1174177 () Bool)

(assert (=> start!108334 m!1174177))

(declare-fun m!1174179 () Bool)

(assert (=> mapNonEmpty!51590 m!1174179))

(declare-fun m!1174181 () Bool)

(assert (=> b!1278021 m!1174181))

(declare-fun m!1174183 () Bool)

(assert (=> b!1278019 m!1174183))

(declare-fun m!1174185 () Bool)

(assert (=> b!1278020 m!1174185))

(assert (=> b!1278020 m!1174185))

(declare-fun m!1174187 () Bool)

(assert (=> b!1278020 m!1174187))

(check-sat (not b!1278020) (not start!108334) tp_is_empty!33373 (not b!1278019) b_and!45881 (not mapNonEmpty!51590) (not b_next!27823) (not b!1278021))
(check-sat b_and!45881 (not b_next!27823))
