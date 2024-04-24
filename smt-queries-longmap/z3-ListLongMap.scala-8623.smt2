; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105250 () Bool)

(assert start!105250)

(declare-fun b_free!26773 () Bool)

(declare-fun b_next!26773 () Bool)

(assert (=> start!105250 (= b_free!26773 (not b_next!26773))))

(declare-fun tp!93817 () Bool)

(declare-fun b_and!44571 () Bool)

(assert (=> start!105250 (= tp!93817 b_and!44571)))

(declare-fun b!1253043 () Bool)

(declare-fun e!711688 () Bool)

(declare-fun tp_is_empty!31675 () Bool)

(assert (=> b!1253043 (= e!711688 tp_is_empty!31675)))

(declare-fun b!1253045 () Bool)

(declare-fun e!711689 () Bool)

(assert (=> b!1253045 (= e!711689 (not true))))

(declare-datatypes ((V!47599 0))(
  ( (V!47600 (val!15900 Int)) )
))
(declare-datatypes ((tuple2!20530 0))(
  ( (tuple2!20531 (_1!10276 (_ BitVec 64)) (_2!10276 V!47599)) )
))
(declare-datatypes ((List!27774 0))(
  ( (Nil!27771) (Cons!27770 (h!28988 tuple2!20530) (t!41243 List!27774)) )
))
(declare-datatypes ((ListLongMap!18411 0))(
  ( (ListLongMap!18412 (toList!9221 List!27774)) )
))
(declare-fun lt!565506 () ListLongMap!18411)

(declare-fun lt!565508 () ListLongMap!18411)

(assert (=> b!1253045 (= lt!565506 lt!565508)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47599)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47599)

(declare-datatypes ((array!81065 0))(
  ( (array!81066 (arr!39092 (Array (_ BitVec 32) (_ BitVec 64))) (size!39629 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81065)

(declare-datatypes ((ValueCell!15074 0))(
  ( (ValueCellFull!15074 (v!18594 V!47599)) (EmptyCell!15074) )
))
(declare-datatypes ((array!81067 0))(
  ( (array!81068 (arr!39093 (Array (_ BitVec 32) ValueCell!15074)) (size!39630 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81067)

(declare-fun minValueBefore!43 () V!47599)

(declare-datatypes ((Unit!41580 0))(
  ( (Unit!41581) )
))
(declare-fun lt!565507 () Unit!41580)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!962 (array!81065 array!81067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47599 V!47599 V!47599 V!47599 (_ BitVec 32) Int) Unit!41580)

(assert (=> b!1253045 (= lt!565507 (lemmaNoChangeToArrayThenSameMapNoExtras!962 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5648 (array!81065 array!81067 (_ BitVec 32) (_ BitVec 32) V!47599 V!47599 (_ BitVec 32) Int) ListLongMap!18411)

(assert (=> b!1253045 (= lt!565508 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253045 (= lt!565506 (getCurrentListMapNoExtraKeys!5648 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253046 () Bool)

(declare-fun res!835367 () Bool)

(assert (=> b!1253046 (=> (not res!835367) (not e!711689))))

(declare-datatypes ((List!27775 0))(
  ( (Nil!27772) (Cons!27771 (h!28989 (_ BitVec 64)) (t!41244 List!27775)) )
))
(declare-fun arrayNoDuplicates!0 (array!81065 (_ BitVec 32) List!27775) Bool)

(assert (=> b!1253046 (= res!835367 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27772))))

(declare-fun b!1253047 () Bool)

(declare-fun e!711692 () Bool)

(declare-fun e!711691 () Bool)

(declare-fun mapRes!49282 () Bool)

(assert (=> b!1253047 (= e!711692 (and e!711691 mapRes!49282))))

(declare-fun condMapEmpty!49282 () Bool)

(declare-fun mapDefault!49282 () ValueCell!15074)

(assert (=> b!1253047 (= condMapEmpty!49282 (= (arr!39093 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15074)) mapDefault!49282)))))

(declare-fun b!1253048 () Bool)

(declare-fun res!835369 () Bool)

(assert (=> b!1253048 (=> (not res!835369) (not e!711689))))

(assert (=> b!1253048 (= res!835369 (and (= (size!39630 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39629 _keys!1118) (size!39630 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49282 () Bool)

(assert (=> mapIsEmpty!49282 mapRes!49282))

(declare-fun b!1253049 () Bool)

(declare-fun res!835368 () Bool)

(assert (=> b!1253049 (=> (not res!835368) (not e!711689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81065 (_ BitVec 32)) Bool)

(assert (=> b!1253049 (= res!835368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49282 () Bool)

(declare-fun tp!93818 () Bool)

(assert (=> mapNonEmpty!49282 (= mapRes!49282 (and tp!93818 e!711688))))

(declare-fun mapKey!49282 () (_ BitVec 32))

(declare-fun mapRest!49282 () (Array (_ BitVec 32) ValueCell!15074))

(declare-fun mapValue!49282 () ValueCell!15074)

(assert (=> mapNonEmpty!49282 (= (arr!39093 _values!914) (store mapRest!49282 mapKey!49282 mapValue!49282))))

(declare-fun b!1253044 () Bool)

(assert (=> b!1253044 (= e!711691 tp_is_empty!31675)))

(declare-fun res!835366 () Bool)

(assert (=> start!105250 (=> (not res!835366) (not e!711689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105250 (= res!835366 (validMask!0 mask!1466))))

(assert (=> start!105250 e!711689))

(assert (=> start!105250 true))

(assert (=> start!105250 tp!93817))

(assert (=> start!105250 tp_is_empty!31675))

(declare-fun array_inv!29929 (array!81065) Bool)

(assert (=> start!105250 (array_inv!29929 _keys!1118)))

(declare-fun array_inv!29930 (array!81067) Bool)

(assert (=> start!105250 (and (array_inv!29930 _values!914) e!711692)))

(assert (= (and start!105250 res!835366) b!1253048))

(assert (= (and b!1253048 res!835369) b!1253049))

(assert (= (and b!1253049 res!835368) b!1253046))

(assert (= (and b!1253046 res!835367) b!1253045))

(assert (= (and b!1253047 condMapEmpty!49282) mapIsEmpty!49282))

(assert (= (and b!1253047 (not condMapEmpty!49282)) mapNonEmpty!49282))

(get-info :version)

(assert (= (and mapNonEmpty!49282 ((_ is ValueCellFull!15074) mapValue!49282)) b!1253043))

(assert (= (and b!1253047 ((_ is ValueCellFull!15074) mapDefault!49282)) b!1253044))

(assert (= start!105250 b!1253047))

(declare-fun m!1154085 () Bool)

(assert (=> b!1253045 m!1154085))

(declare-fun m!1154087 () Bool)

(assert (=> b!1253045 m!1154087))

(declare-fun m!1154089 () Bool)

(assert (=> b!1253045 m!1154089))

(declare-fun m!1154091 () Bool)

(assert (=> mapNonEmpty!49282 m!1154091))

(declare-fun m!1154093 () Bool)

(assert (=> b!1253046 m!1154093))

(declare-fun m!1154095 () Bool)

(assert (=> start!105250 m!1154095))

(declare-fun m!1154097 () Bool)

(assert (=> start!105250 m!1154097))

(declare-fun m!1154099 () Bool)

(assert (=> start!105250 m!1154099))

(declare-fun m!1154101 () Bool)

(assert (=> b!1253049 m!1154101))

(check-sat (not start!105250) b_and!44571 (not b!1253046) (not mapNonEmpty!49282) (not b!1253049) tp_is_empty!31675 (not b!1253045) (not b_next!26773))
(check-sat b_and!44571 (not b_next!26773))
