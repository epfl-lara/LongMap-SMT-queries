; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105126 () Bool)

(assert start!105126)

(declare-fun b_free!26859 () Bool)

(declare-fun b_next!26859 () Bool)

(assert (=> start!105126 (= b_free!26859 (not b_next!26859))))

(declare-fun tp!94078 () Bool)

(declare-fun b_and!44663 () Bool)

(assert (=> start!105126 (= tp!94078 b_and!44663)))

(declare-fun mapNonEmpty!49414 () Bool)

(declare-fun mapRes!49414 () Bool)

(declare-fun tp!94079 () Bool)

(declare-fun e!711592 () Bool)

(assert (=> mapNonEmpty!49414 (= mapRes!49414 (and tp!94079 e!711592))))

(declare-datatypes ((V!47713 0))(
  ( (V!47714 (val!15943 Int)) )
))
(declare-datatypes ((ValueCell!15117 0))(
  ( (ValueCellFull!15117 (v!18641 V!47713)) (EmptyCell!15117) )
))
(declare-fun mapRest!49414 () (Array (_ BitVec 32) ValueCell!15117))

(declare-fun mapValue!49414 () ValueCell!15117)

(declare-fun mapKey!49414 () (_ BitVec 32))

(declare-datatypes ((array!81184 0))(
  ( (array!81185 (arr!39155 (Array (_ BitVec 32) ValueCell!15117)) (size!39691 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81184)

(assert (=> mapNonEmpty!49414 (= (arr!39155 _values!914) (store mapRest!49414 mapKey!49414 mapValue!49414))))

(declare-fun res!835444 () Bool)

(declare-fun e!711591 () Bool)

(assert (=> start!105126 (=> (not res!835444) (not e!711591))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105126 (= res!835444 (validMask!0 mask!1466))))

(assert (=> start!105126 e!711591))

(assert (=> start!105126 true))

(assert (=> start!105126 tp!94078))

(declare-fun tp_is_empty!31761 () Bool)

(assert (=> start!105126 tp_is_empty!31761))

(declare-datatypes ((array!81186 0))(
  ( (array!81187 (arr!39156 (Array (_ BitVec 32) (_ BitVec 64))) (size!39692 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81186)

(declare-fun array_inv!29861 (array!81186) Bool)

(assert (=> start!105126 (array_inv!29861 _keys!1118)))

(declare-fun e!711596 () Bool)

(declare-fun array_inv!29862 (array!81184) Bool)

(assert (=> start!105126 (and (array_inv!29862 _values!914) e!711596)))

(declare-fun mapIsEmpty!49414 () Bool)

(assert (=> mapIsEmpty!49414 mapRes!49414))

(declare-fun b!1252776 () Bool)

(declare-fun e!711595 () Bool)

(assert (=> b!1252776 (= e!711595 tp_is_empty!31761)))

(declare-fun b!1252777 () Bool)

(assert (=> b!1252777 (= e!711592 tp_is_empty!31761)))

(declare-fun b!1252778 () Bool)

(declare-fun res!835446 () Bool)

(assert (=> b!1252778 (=> (not res!835446) (not e!711591))))

(declare-datatypes ((List!27800 0))(
  ( (Nil!27797) (Cons!27796 (h!29005 (_ BitVec 64)) (t!41279 List!27800)) )
))
(declare-fun arrayNoDuplicates!0 (array!81186 (_ BitVec 32) List!27800) Bool)

(assert (=> b!1252778 (= res!835446 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27797))))

(declare-fun b!1252779 () Bool)

(declare-fun e!711594 () Bool)

(assert (=> b!1252779 (= e!711591 (not e!711594))))

(declare-fun res!835447 () Bool)

(assert (=> b!1252779 (=> res!835447 e!711594)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252779 (= res!835447 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20568 0))(
  ( (tuple2!20569 (_1!10295 (_ BitVec 64)) (_2!10295 V!47713)) )
))
(declare-datatypes ((List!27801 0))(
  ( (Nil!27798) (Cons!27797 (h!29006 tuple2!20568) (t!41280 List!27801)) )
))
(declare-datatypes ((ListLongMap!18441 0))(
  ( (ListLongMap!18442 (toList!9236 List!27801)) )
))
(declare-fun lt!565500 () ListLongMap!18441)

(declare-fun lt!565499 () ListLongMap!18441)

(assert (=> b!1252779 (= lt!565500 lt!565499)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47713)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47713)

(declare-datatypes ((Unit!41659 0))(
  ( (Unit!41660) )
))
(declare-fun lt!565501 () Unit!41659)

(declare-fun minValueBefore!43 () V!47713)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!995 (array!81186 array!81184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47713 V!47713 V!47713 V!47713 (_ BitVec 32) Int) Unit!41659)

(assert (=> b!1252779 (= lt!565501 (lemmaNoChangeToArrayThenSameMapNoExtras!995 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5631 (array!81186 array!81184 (_ BitVec 32) (_ BitVec 32) V!47713 V!47713 (_ BitVec 32) Int) ListLongMap!18441)

(assert (=> b!1252779 (= lt!565499 (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252779 (= lt!565500 (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252780 () Bool)

(declare-fun res!835445 () Bool)

(assert (=> b!1252780 (=> (not res!835445) (not e!711591))))

(assert (=> b!1252780 (= res!835445 (and (= (size!39691 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39692 _keys!1118) (size!39691 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252781 () Bool)

(assert (=> b!1252781 (= e!711596 (and e!711595 mapRes!49414))))

(declare-fun condMapEmpty!49414 () Bool)

(declare-fun mapDefault!49414 () ValueCell!15117)

(assert (=> b!1252781 (= condMapEmpty!49414 (= (arr!39155 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15117)) mapDefault!49414)))))

(declare-fun b!1252782 () Bool)

(declare-fun res!835443 () Bool)

(assert (=> b!1252782 (=> (not res!835443) (not e!711591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81186 (_ BitVec 32)) Bool)

(assert (=> b!1252782 (= res!835443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252783 () Bool)

(assert (=> b!1252783 (= e!711594 true)))

(declare-fun lt!565502 () ListLongMap!18441)

(declare-fun getCurrentListMap!4484 (array!81186 array!81184 (_ BitVec 32) (_ BitVec 32) V!47713 V!47713 (_ BitVec 32) Int) ListLongMap!18441)

(assert (=> b!1252783 (= lt!565502 (getCurrentListMap!4484 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105126 res!835444) b!1252780))

(assert (= (and b!1252780 res!835445) b!1252782))

(assert (= (and b!1252782 res!835443) b!1252778))

(assert (= (and b!1252778 res!835446) b!1252779))

(assert (= (and b!1252779 (not res!835447)) b!1252783))

(assert (= (and b!1252781 condMapEmpty!49414) mapIsEmpty!49414))

(assert (= (and b!1252781 (not condMapEmpty!49414)) mapNonEmpty!49414))

(get-info :version)

(assert (= (and mapNonEmpty!49414 ((_ is ValueCellFull!15117) mapValue!49414)) b!1252777))

(assert (= (and b!1252781 ((_ is ValueCellFull!15117) mapDefault!49414)) b!1252776))

(assert (= start!105126 b!1252781))

(declare-fun m!1153345 () Bool)

(assert (=> start!105126 m!1153345))

(declare-fun m!1153347 () Bool)

(assert (=> start!105126 m!1153347))

(declare-fun m!1153349 () Bool)

(assert (=> start!105126 m!1153349))

(declare-fun m!1153351 () Bool)

(assert (=> b!1252778 m!1153351))

(declare-fun m!1153353 () Bool)

(assert (=> b!1252783 m!1153353))

(declare-fun m!1153355 () Bool)

(assert (=> mapNonEmpty!49414 m!1153355))

(declare-fun m!1153357 () Bool)

(assert (=> b!1252782 m!1153357))

(declare-fun m!1153359 () Bool)

(assert (=> b!1252779 m!1153359))

(declare-fun m!1153361 () Bool)

(assert (=> b!1252779 m!1153361))

(declare-fun m!1153363 () Bool)

(assert (=> b!1252779 m!1153363))

(check-sat (not b!1252783) tp_is_empty!31761 (not b!1252778) (not b!1252779) (not b!1252782) (not start!105126) (not mapNonEmpty!49414) (not b_next!26859) b_and!44663)
(check-sat b_and!44663 (not b_next!26859))
