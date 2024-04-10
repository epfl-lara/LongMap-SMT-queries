; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105052 () Bool)

(assert start!105052)

(declare-fun b_free!26799 () Bool)

(declare-fun b_next!26799 () Bool)

(assert (=> start!105052 (= b_free!26799 (not b_next!26799))))

(declare-fun tp!93896 () Bool)

(declare-fun b_and!44595 () Bool)

(assert (=> start!105052 (= tp!93896 b_and!44595)))

(declare-fun b!1252012 () Bool)

(declare-fun e!711040 () Bool)

(declare-fun tp_is_empty!31701 () Bool)

(assert (=> b!1252012 (= e!711040 tp_is_empty!31701)))

(declare-fun b!1252013 () Bool)

(declare-fun e!711037 () Bool)

(declare-fun mapRes!49321 () Bool)

(assert (=> b!1252013 (= e!711037 (and e!711040 mapRes!49321))))

(declare-fun condMapEmpty!49321 () Bool)

(declare-datatypes ((V!47633 0))(
  ( (V!47634 (val!15913 Int)) )
))
(declare-datatypes ((ValueCell!15087 0))(
  ( (ValueCellFull!15087 (v!18611 V!47633)) (EmptyCell!15087) )
))
(declare-datatypes ((array!81066 0))(
  ( (array!81067 (arr!39097 (Array (_ BitVec 32) ValueCell!15087)) (size!39633 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81066)

(declare-fun mapDefault!49321 () ValueCell!15087)

(assert (=> b!1252013 (= condMapEmpty!49321 (= (arr!39097 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15087)) mapDefault!49321)))))

(declare-fun mapNonEmpty!49321 () Bool)

(declare-fun tp!93895 () Bool)

(declare-fun e!711038 () Bool)

(assert (=> mapNonEmpty!49321 (= mapRes!49321 (and tp!93895 e!711038))))

(declare-fun mapRest!49321 () (Array (_ BitVec 32) ValueCell!15087))

(declare-fun mapKey!49321 () (_ BitVec 32))

(declare-fun mapValue!49321 () ValueCell!15087)

(assert (=> mapNonEmpty!49321 (= (arr!39097 _values!914) (store mapRest!49321 mapKey!49321 mapValue!49321))))

(declare-fun mapIsEmpty!49321 () Bool)

(assert (=> mapIsEmpty!49321 mapRes!49321))

(declare-fun b!1252014 () Bool)

(declare-fun e!711039 () Bool)

(assert (=> b!1252014 (= e!711039 (not true))))

(declare-datatypes ((tuple2!20524 0))(
  ( (tuple2!20525 (_1!10273 (_ BitVec 64)) (_2!10273 V!47633)) )
))
(declare-datatypes ((List!27756 0))(
  ( (Nil!27753) (Cons!27752 (h!28961 tuple2!20524) (t!41233 List!27756)) )
))
(declare-datatypes ((ListLongMap!18397 0))(
  ( (ListLongMap!18398 (toList!9214 List!27756)) )
))
(declare-fun lt!565141 () ListLongMap!18397)

(declare-fun lt!565139 () ListLongMap!18397)

(assert (=> b!1252014 (= lt!565141 lt!565139)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47633)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47633)

(declare-datatypes ((array!81068 0))(
  ( (array!81069 (arr!39098 (Array (_ BitVec 32) (_ BitVec 64))) (size!39634 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81068)

(declare-datatypes ((Unit!41617 0))(
  ( (Unit!41618) )
))
(declare-fun lt!565140 () Unit!41617)

(declare-fun minValueBefore!43 () V!47633)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!974 (array!81068 array!81066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47633 V!47633 V!47633 V!47633 (_ BitVec 32) Int) Unit!41617)

(assert (=> b!1252014 (= lt!565140 (lemmaNoChangeToArrayThenSameMapNoExtras!974 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5610 (array!81068 array!81066 (_ BitVec 32) (_ BitVec 32) V!47633 V!47633 (_ BitVec 32) Int) ListLongMap!18397)

(assert (=> b!1252014 (= lt!565139 (getCurrentListMapNoExtraKeys!5610 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252014 (= lt!565141 (getCurrentListMapNoExtraKeys!5610 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252015 () Bool)

(assert (=> b!1252015 (= e!711038 tp_is_empty!31701)))

(declare-fun b!1252016 () Bool)

(declare-fun res!835005 () Bool)

(assert (=> b!1252016 (=> (not res!835005) (not e!711039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81068 (_ BitVec 32)) Bool)

(assert (=> b!1252016 (= res!835005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252017 () Bool)

(declare-fun res!835002 () Bool)

(assert (=> b!1252017 (=> (not res!835002) (not e!711039))))

(assert (=> b!1252017 (= res!835002 (and (= (size!39633 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39634 _keys!1118) (size!39633 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!835003 () Bool)

(assert (=> start!105052 (=> (not res!835003) (not e!711039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105052 (= res!835003 (validMask!0 mask!1466))))

(assert (=> start!105052 e!711039))

(assert (=> start!105052 true))

(assert (=> start!105052 tp!93896))

(assert (=> start!105052 tp_is_empty!31701))

(declare-fun array_inv!29821 (array!81068) Bool)

(assert (=> start!105052 (array_inv!29821 _keys!1118)))

(declare-fun array_inv!29822 (array!81066) Bool)

(assert (=> start!105052 (and (array_inv!29822 _values!914) e!711037)))

(declare-fun b!1252011 () Bool)

(declare-fun res!835004 () Bool)

(assert (=> b!1252011 (=> (not res!835004) (not e!711039))))

(declare-datatypes ((List!27757 0))(
  ( (Nil!27754) (Cons!27753 (h!28962 (_ BitVec 64)) (t!41234 List!27757)) )
))
(declare-fun arrayNoDuplicates!0 (array!81068 (_ BitVec 32) List!27757) Bool)

(assert (=> b!1252011 (= res!835004 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27754))))

(assert (= (and start!105052 res!835003) b!1252017))

(assert (= (and b!1252017 res!835002) b!1252016))

(assert (= (and b!1252016 res!835005) b!1252011))

(assert (= (and b!1252011 res!835004) b!1252014))

(assert (= (and b!1252013 condMapEmpty!49321) mapIsEmpty!49321))

(assert (= (and b!1252013 (not condMapEmpty!49321)) mapNonEmpty!49321))

(get-info :version)

(assert (= (and mapNonEmpty!49321 ((_ is ValueCellFull!15087) mapValue!49321)) b!1252015))

(assert (= (and b!1252013 ((_ is ValueCellFull!15087) mapDefault!49321)) b!1252012))

(assert (= start!105052 b!1252013))

(declare-fun m!1152707 () Bool)

(assert (=> b!1252016 m!1152707))

(declare-fun m!1152709 () Bool)

(assert (=> b!1252011 m!1152709))

(declare-fun m!1152711 () Bool)

(assert (=> b!1252014 m!1152711))

(declare-fun m!1152713 () Bool)

(assert (=> b!1252014 m!1152713))

(declare-fun m!1152715 () Bool)

(assert (=> b!1252014 m!1152715))

(declare-fun m!1152717 () Bool)

(assert (=> mapNonEmpty!49321 m!1152717))

(declare-fun m!1152719 () Bool)

(assert (=> start!105052 m!1152719))

(declare-fun m!1152721 () Bool)

(assert (=> start!105052 m!1152721))

(declare-fun m!1152723 () Bool)

(assert (=> start!105052 m!1152723))

(check-sat b_and!44595 tp_is_empty!31701 (not b!1252016) (not b_next!26799) (not b!1252011) (not start!105052) (not b!1252014) (not mapNonEmpty!49321))
(check-sat b_and!44595 (not b_next!26799))
