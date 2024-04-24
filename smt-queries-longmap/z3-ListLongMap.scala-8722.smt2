; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106028 () Bool)

(assert start!106028)

(declare-fun b_free!27367 () Bool)

(declare-fun b_next!27367 () Bool)

(assert (=> start!106028 (= b_free!27367 (not b_next!27367))))

(declare-fun tp!95630 () Bool)

(declare-fun b_and!45265 () Bool)

(assert (=> start!106028 (= tp!95630 b_and!45265)))

(declare-fun mapNonEmpty!50203 () Bool)

(declare-fun mapRes!50203 () Bool)

(declare-fun tp!95629 () Bool)

(declare-fun e!718022 () Bool)

(assert (=> mapNonEmpty!50203 (= mapRes!50203 (and tp!95629 e!718022))))

(declare-datatypes ((V!48391 0))(
  ( (V!48392 (val!16197 Int)) )
))
(declare-datatypes ((ValueCell!15371 0))(
  ( (ValueCellFull!15371 (v!18896 V!48391)) (EmptyCell!15371) )
))
(declare-fun mapValue!50203 () ValueCell!15371)

(declare-fun mapRest!50203 () (Array (_ BitVec 32) ValueCell!15371))

(declare-datatypes ((array!82207 0))(
  ( (array!82208 (arr!39653 (Array (_ BitVec 32) ValueCell!15371)) (size!40190 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82207)

(declare-fun mapKey!50203 () (_ BitVec 32))

(assert (=> mapNonEmpty!50203 (= (arr!39653 _values!914) (store mapRest!50203 mapKey!50203 mapValue!50203))))

(declare-fun b!1261668 () Bool)

(declare-fun e!718027 () Bool)

(declare-fun e!718023 () Bool)

(assert (=> b!1261668 (= e!718027 (not e!718023))))

(declare-fun res!840480 () Bool)

(assert (=> b!1261668 (=> res!840480 e!718023)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261668 (= res!840480 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20970 0))(
  ( (tuple2!20971 (_1!10496 (_ BitVec 64)) (_2!10496 V!48391)) )
))
(declare-datatypes ((List!28191 0))(
  ( (Nil!28188) (Cons!28187 (h!29405 tuple2!20970) (t!41680 List!28191)) )
))
(declare-datatypes ((ListLongMap!18851 0))(
  ( (ListLongMap!18852 (toList!9441 List!28191)) )
))
(declare-fun lt!571519 () ListLongMap!18851)

(declare-fun lt!571522 () ListLongMap!18851)

(assert (=> b!1261668 (= lt!571519 lt!571522)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!42018 0))(
  ( (Unit!42019) )
))
(declare-fun lt!571517 () Unit!42018)

(declare-fun minValueAfter!43 () V!48391)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48391)

(declare-datatypes ((array!82209 0))(
  ( (array!82210 (arr!39654 (Array (_ BitVec 32) (_ BitVec 64))) (size!40191 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82209)

(declare-fun minValueBefore!43 () V!48391)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1162 (array!82209 array!82207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48391 V!48391 V!48391 V!48391 (_ BitVec 32) Int) Unit!42018)

(assert (=> b!1261668 (= lt!571517 (lemmaNoChangeToArrayThenSameMapNoExtras!1162 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5848 (array!82209 array!82207 (_ BitVec 32) (_ BitVec 32) V!48391 V!48391 (_ BitVec 32) Int) ListLongMap!18851)

(assert (=> b!1261668 (= lt!571522 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261668 (= lt!571519 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261669 () Bool)

(declare-fun e!718025 () Bool)

(declare-fun tp_is_empty!32269 () Bool)

(assert (=> b!1261669 (= e!718025 tp_is_empty!32269)))

(declare-fun b!1261670 () Bool)

(declare-fun res!840478 () Bool)

(assert (=> b!1261670 (=> (not res!840478) (not e!718027))))

(declare-datatypes ((List!28192 0))(
  ( (Nil!28189) (Cons!28188 (h!29406 (_ BitVec 64)) (t!41681 List!28192)) )
))
(declare-fun arrayNoDuplicates!0 (array!82209 (_ BitVec 32) List!28192) Bool)

(assert (=> b!1261670 (= res!840478 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28189))))

(declare-fun res!840481 () Bool)

(assert (=> start!106028 (=> (not res!840481) (not e!718027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106028 (= res!840481 (validMask!0 mask!1466))))

(assert (=> start!106028 e!718027))

(assert (=> start!106028 true))

(assert (=> start!106028 tp!95630))

(assert (=> start!106028 tp_is_empty!32269))

(declare-fun array_inv!30333 (array!82209) Bool)

(assert (=> start!106028 (array_inv!30333 _keys!1118)))

(declare-fun e!718026 () Bool)

(declare-fun array_inv!30334 (array!82207) Bool)

(assert (=> start!106028 (and (array_inv!30334 _values!914) e!718026)))

(declare-fun b!1261671 () Bool)

(assert (=> b!1261671 (= e!718026 (and e!718025 mapRes!50203))))

(declare-fun condMapEmpty!50203 () Bool)

(declare-fun mapDefault!50203 () ValueCell!15371)

(assert (=> b!1261671 (= condMapEmpty!50203 (= (arr!39653 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15371)) mapDefault!50203)))))

(declare-fun mapIsEmpty!50203 () Bool)

(assert (=> mapIsEmpty!50203 mapRes!50203))

(declare-fun b!1261672 () Bool)

(declare-fun res!840483 () Bool)

(assert (=> b!1261672 (=> (not res!840483) (not e!718027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82209 (_ BitVec 32)) Bool)

(assert (=> b!1261672 (= res!840483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261673 () Bool)

(assert (=> b!1261673 (= e!718023 true)))

(declare-fun lt!571524 () ListLongMap!18851)

(declare-fun lt!571525 () ListLongMap!18851)

(declare-fun -!2107 (ListLongMap!18851 (_ BitVec 64)) ListLongMap!18851)

(assert (=> b!1261673 (= lt!571524 (-!2107 lt!571525 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!571526 () ListLongMap!18851)

(declare-fun lt!571523 () ListLongMap!18851)

(assert (=> b!1261673 (= (-!2107 lt!571526 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571523)))

(declare-fun lt!571521 () Unit!42018)

(declare-fun addThenRemoveForNewKeyIsSame!361 (ListLongMap!18851 (_ BitVec 64) V!48391) Unit!42018)

(assert (=> b!1261673 (= lt!571521 (addThenRemoveForNewKeyIsSame!361 lt!571523 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!718024 () Bool)

(assert (=> b!1261673 e!718024))

(declare-fun res!840482 () Bool)

(assert (=> b!1261673 (=> (not res!840482) (not e!718024))))

(assert (=> b!1261673 (= res!840482 (= lt!571525 lt!571526))))

(declare-fun +!4279 (ListLongMap!18851 tuple2!20970) ListLongMap!18851)

(assert (=> b!1261673 (= lt!571526 (+!4279 lt!571523 (tuple2!20971 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571518 () tuple2!20970)

(assert (=> b!1261673 (= lt!571523 (+!4279 lt!571519 lt!571518))))

(assert (=> b!1261673 (= lt!571518 (tuple2!20971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!571520 () ListLongMap!18851)

(declare-fun getCurrentListMap!4619 (array!82209 array!82207 (_ BitVec 32) (_ BitVec 32) V!48391 V!48391 (_ BitVec 32) Int) ListLongMap!18851)

(assert (=> b!1261673 (= lt!571520 (getCurrentListMap!4619 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261673 (= lt!571525 (getCurrentListMap!4619 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261674 () Bool)

(assert (=> b!1261674 (= e!718024 (= lt!571520 (+!4279 lt!571522 lt!571518)))))

(declare-fun b!1261675 () Bool)

(declare-fun res!840479 () Bool)

(assert (=> b!1261675 (=> (not res!840479) (not e!718027))))

(assert (=> b!1261675 (= res!840479 (and (= (size!40190 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40191 _keys!1118) (size!40190 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261676 () Bool)

(assert (=> b!1261676 (= e!718022 tp_is_empty!32269)))

(assert (= (and start!106028 res!840481) b!1261675))

(assert (= (and b!1261675 res!840479) b!1261672))

(assert (= (and b!1261672 res!840483) b!1261670))

(assert (= (and b!1261670 res!840478) b!1261668))

(assert (= (and b!1261668 (not res!840480)) b!1261673))

(assert (= (and b!1261673 res!840482) b!1261674))

(assert (= (and b!1261671 condMapEmpty!50203) mapIsEmpty!50203))

(assert (= (and b!1261671 (not condMapEmpty!50203)) mapNonEmpty!50203))

(get-info :version)

(assert (= (and mapNonEmpty!50203 ((_ is ValueCellFull!15371) mapValue!50203)) b!1261676))

(assert (= (and b!1261671 ((_ is ValueCellFull!15371) mapDefault!50203)) b!1261669))

(assert (= start!106028 b!1261671))

(declare-fun m!1162661 () Bool)

(assert (=> b!1261668 m!1162661))

(declare-fun m!1162663 () Bool)

(assert (=> b!1261668 m!1162663))

(declare-fun m!1162665 () Bool)

(assert (=> b!1261668 m!1162665))

(declare-fun m!1162667 () Bool)

(assert (=> b!1261672 m!1162667))

(declare-fun m!1162669 () Bool)

(assert (=> start!106028 m!1162669))

(declare-fun m!1162671 () Bool)

(assert (=> start!106028 m!1162671))

(declare-fun m!1162673 () Bool)

(assert (=> start!106028 m!1162673))

(declare-fun m!1162675 () Bool)

(assert (=> b!1261674 m!1162675))

(declare-fun m!1162677 () Bool)

(assert (=> mapNonEmpty!50203 m!1162677))

(declare-fun m!1162679 () Bool)

(assert (=> b!1261670 m!1162679))

(declare-fun m!1162681 () Bool)

(assert (=> b!1261673 m!1162681))

(declare-fun m!1162683 () Bool)

(assert (=> b!1261673 m!1162683))

(declare-fun m!1162685 () Bool)

(assert (=> b!1261673 m!1162685))

(declare-fun m!1162687 () Bool)

(assert (=> b!1261673 m!1162687))

(declare-fun m!1162689 () Bool)

(assert (=> b!1261673 m!1162689))

(declare-fun m!1162691 () Bool)

(assert (=> b!1261673 m!1162691))

(declare-fun m!1162693 () Bool)

(assert (=> b!1261673 m!1162693))

(check-sat (not b!1261668) (not b!1261672) (not b!1261673) (not start!106028) (not b!1261670) b_and!45265 (not b!1261674) (not mapNonEmpty!50203) tp_is_empty!32269 (not b_next!27367))
(check-sat b_and!45265 (not b_next!27367))
