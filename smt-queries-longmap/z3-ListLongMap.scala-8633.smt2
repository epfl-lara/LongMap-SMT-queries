; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105324 () Bool)

(assert start!105324)

(declare-fun b_free!26833 () Bool)

(declare-fun b_next!26833 () Bool)

(assert (=> start!105324 (= b_free!26833 (not b_next!26833))))

(declare-fun tp!94001 () Bool)

(declare-fun b_and!44639 () Bool)

(assert (=> start!105324 (= tp!94001 b_and!44639)))

(declare-fun b!1253769 () Bool)

(declare-fun res!835769 () Bool)

(declare-fun e!712209 () Bool)

(assert (=> b!1253769 (=> (not res!835769) (not e!712209))))

(declare-datatypes ((array!81179 0))(
  ( (array!81180 (arr!39148 (Array (_ BitVec 32) (_ BitVec 64))) (size!39685 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81179)

(declare-datatypes ((List!27813 0))(
  ( (Nil!27810) (Cons!27809 (h!29027 (_ BitVec 64)) (t!41284 List!27813)) )
))
(declare-fun arrayNoDuplicates!0 (array!81179 (_ BitVec 32) List!27813) Bool)

(assert (=> b!1253769 (= res!835769 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27810))))

(declare-fun mapNonEmpty!49375 () Bool)

(declare-fun mapRes!49375 () Bool)

(declare-fun tp!94000 () Bool)

(declare-fun e!712207 () Bool)

(assert (=> mapNonEmpty!49375 (= mapRes!49375 (and tp!94000 e!712207))))

(declare-datatypes ((V!47679 0))(
  ( (V!47680 (val!15930 Int)) )
))
(declare-datatypes ((ValueCell!15104 0))(
  ( (ValueCellFull!15104 (v!18624 V!47679)) (EmptyCell!15104) )
))
(declare-fun mapValue!49375 () ValueCell!15104)

(declare-datatypes ((array!81181 0))(
  ( (array!81182 (arr!39149 (Array (_ BitVec 32) ValueCell!15104)) (size!39686 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81181)

(declare-fun mapKey!49375 () (_ BitVec 32))

(declare-fun mapRest!49375 () (Array (_ BitVec 32) ValueCell!15104))

(assert (=> mapNonEmpty!49375 (= (arr!39149 _values!914) (store mapRest!49375 mapKey!49375 mapValue!49375))))

(declare-fun res!835770 () Bool)

(assert (=> start!105324 (=> (not res!835770) (not e!712209))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105324 (= res!835770 (validMask!0 mask!1466))))

(assert (=> start!105324 e!712209))

(assert (=> start!105324 true))

(assert (=> start!105324 tp!94001))

(declare-fun tp_is_empty!31735 () Bool)

(assert (=> start!105324 tp_is_empty!31735))

(declare-fun array_inv!29967 (array!81179) Bool)

(assert (=> start!105324 (array_inv!29967 _keys!1118)))

(declare-fun e!712205 () Bool)

(declare-fun array_inv!29968 (array!81181) Bool)

(assert (=> start!105324 (and (array_inv!29968 _values!914) e!712205)))

(declare-fun b!1253770 () Bool)

(declare-fun e!712206 () Bool)

(assert (=> b!1253770 (= e!712206 tp_is_empty!31735)))

(declare-fun mapIsEmpty!49375 () Bool)

(assert (=> mapIsEmpty!49375 mapRes!49375))

(declare-fun b!1253771 () Bool)

(declare-fun res!835772 () Bool)

(assert (=> b!1253771 (=> (not res!835772) (not e!712209))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1253771 (= res!835772 (and (= (size!39686 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39685 _keys!1118) (size!39686 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253772 () Bool)

(declare-fun e!712204 () Bool)

(assert (=> b!1253772 (= e!712204 true)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20568 0))(
  ( (tuple2!20569 (_1!10295 (_ BitVec 64)) (_2!10295 V!47679)) )
))
(declare-datatypes ((List!27814 0))(
  ( (Nil!27811) (Cons!27810 (h!29028 tuple2!20568) (t!41285 List!27814)) )
))
(declare-datatypes ((ListLongMap!18449 0))(
  ( (ListLongMap!18450 (toList!9240 List!27814)) )
))
(declare-fun lt!565830 () ListLongMap!18449)

(declare-fun zeroValue!871 () V!47679)

(declare-fun minValueBefore!43 () V!47679)

(declare-fun getCurrentListMap!4479 (array!81179 array!81181 (_ BitVec 32) (_ BitVec 32) V!47679 V!47679 (_ BitVec 32) Int) ListLongMap!18449)

(assert (=> b!1253772 (= lt!565830 (getCurrentListMap!4479 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253773 () Bool)

(assert (=> b!1253773 (= e!712207 tp_is_empty!31735)))

(declare-fun b!1253774 () Bool)

(assert (=> b!1253774 (= e!712209 (not e!712204))))

(declare-fun res!835768 () Bool)

(assert (=> b!1253774 (=> res!835768 e!712204)))

(assert (=> b!1253774 (= res!835768 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565829 () ListLongMap!18449)

(declare-fun lt!565827 () ListLongMap!18449)

(assert (=> b!1253774 (= lt!565829 lt!565827)))

(declare-fun minValueAfter!43 () V!47679)

(declare-datatypes ((Unit!41618 0))(
  ( (Unit!41619) )
))
(declare-fun lt!565828 () Unit!41618)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!981 (array!81179 array!81181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47679 V!47679 V!47679 V!47679 (_ BitVec 32) Int) Unit!41618)

(assert (=> b!1253774 (= lt!565828 (lemmaNoChangeToArrayThenSameMapNoExtras!981 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5667 (array!81179 array!81181 (_ BitVec 32) (_ BitVec 32) V!47679 V!47679 (_ BitVec 32) Int) ListLongMap!18449)

(assert (=> b!1253774 (= lt!565827 (getCurrentListMapNoExtraKeys!5667 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253774 (= lt!565829 (getCurrentListMapNoExtraKeys!5667 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253775 () Bool)

(declare-fun res!835771 () Bool)

(assert (=> b!1253775 (=> (not res!835771) (not e!712209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81179 (_ BitVec 32)) Bool)

(assert (=> b!1253775 (= res!835771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253776 () Bool)

(assert (=> b!1253776 (= e!712205 (and e!712206 mapRes!49375))))

(declare-fun condMapEmpty!49375 () Bool)

(declare-fun mapDefault!49375 () ValueCell!15104)

(assert (=> b!1253776 (= condMapEmpty!49375 (= (arr!39149 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15104)) mapDefault!49375)))))

(assert (= (and start!105324 res!835770) b!1253771))

(assert (= (and b!1253771 res!835772) b!1253775))

(assert (= (and b!1253775 res!835771) b!1253769))

(assert (= (and b!1253769 res!835769) b!1253774))

(assert (= (and b!1253774 (not res!835768)) b!1253772))

(assert (= (and b!1253776 condMapEmpty!49375) mapIsEmpty!49375))

(assert (= (and b!1253776 (not condMapEmpty!49375)) mapNonEmpty!49375))

(get-info :version)

(assert (= (and mapNonEmpty!49375 ((_ is ValueCellFull!15104) mapValue!49375)) b!1253773))

(assert (= (and b!1253776 ((_ is ValueCellFull!15104) mapDefault!49375)) b!1253770))

(assert (= start!105324 b!1253776))

(declare-fun m!1154697 () Bool)

(assert (=> b!1253769 m!1154697))

(declare-fun m!1154699 () Bool)

(assert (=> b!1253772 m!1154699))

(declare-fun m!1154701 () Bool)

(assert (=> b!1253774 m!1154701))

(declare-fun m!1154703 () Bool)

(assert (=> b!1253774 m!1154703))

(declare-fun m!1154705 () Bool)

(assert (=> b!1253774 m!1154705))

(declare-fun m!1154707 () Bool)

(assert (=> b!1253775 m!1154707))

(declare-fun m!1154709 () Bool)

(assert (=> start!105324 m!1154709))

(declare-fun m!1154711 () Bool)

(assert (=> start!105324 m!1154711))

(declare-fun m!1154713 () Bool)

(assert (=> start!105324 m!1154713))

(declare-fun m!1154715 () Bool)

(assert (=> mapNonEmpty!49375 m!1154715))

(check-sat (not b!1253772) b_and!44639 (not b!1253774) (not b_next!26833) tp_is_empty!31735 (not b!1253769) (not mapNonEmpty!49375) (not b!1253775) (not start!105324))
(check-sat b_and!44639 (not b_next!26833))
