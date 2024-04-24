; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105940 () Bool)

(assert start!105940)

(declare-fun b_free!27301 () Bool)

(declare-fun b_next!27301 () Bool)

(assert (=> start!105940 (= b_free!27301 (not b_next!27301))))

(declare-fun tp!95428 () Bool)

(declare-fun b_and!45187 () Bool)

(assert (=> start!105940 (= tp!95428 b_and!45187)))

(declare-datatypes ((V!48303 0))(
  ( (V!48304 (val!16164 Int)) )
))
(declare-datatypes ((tuple2!20916 0))(
  ( (tuple2!20917 (_1!10469 (_ BitVec 64)) (_2!10469 V!48303)) )
))
(declare-fun lt!570389 () tuple2!20916)

(declare-fun e!717209 () Bool)

(declare-datatypes ((List!28142 0))(
  ( (Nil!28139) (Cons!28138 (h!29356 tuple2!20916) (t!41629 List!28142)) )
))
(declare-datatypes ((ListLongMap!18797 0))(
  ( (ListLongMap!18798 (toList!9414 List!28142)) )
))
(declare-fun lt!570385 () ListLongMap!18797)

(declare-fun b!1260589 () Bool)

(declare-fun lt!570386 () ListLongMap!18797)

(declare-fun +!4254 (ListLongMap!18797 tuple2!20916) ListLongMap!18797)

(assert (=> b!1260589 (= e!717209 (= lt!570386 (+!4254 lt!570385 lt!570389)))))

(declare-fun mapNonEmpty!50101 () Bool)

(declare-fun mapRes!50101 () Bool)

(declare-fun tp!95429 () Bool)

(declare-fun e!717208 () Bool)

(assert (=> mapNonEmpty!50101 (= mapRes!50101 (and tp!95429 e!717208))))

(declare-datatypes ((ValueCell!15338 0))(
  ( (ValueCellFull!15338 (v!18862 V!48303)) (EmptyCell!15338) )
))
(declare-fun mapRest!50101 () (Array (_ BitVec 32) ValueCell!15338))

(declare-fun mapKey!50101 () (_ BitVec 32))

(declare-fun mapValue!50101 () ValueCell!15338)

(declare-datatypes ((array!82077 0))(
  ( (array!82078 (arr!39589 (Array (_ BitVec 32) ValueCell!15338)) (size!40126 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82077)

(assert (=> mapNonEmpty!50101 (= (arr!39589 _values!914) (store mapRest!50101 mapKey!50101 mapValue!50101))))

(declare-fun b!1260591 () Bool)

(declare-fun e!717211 () Bool)

(declare-fun e!717212 () Bool)

(assert (=> b!1260591 (= e!717211 (and e!717212 mapRes!50101))))

(declare-fun condMapEmpty!50101 () Bool)

(declare-fun mapDefault!50101 () ValueCell!15338)

(assert (=> b!1260591 (= condMapEmpty!50101 (= (arr!39589 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15338)) mapDefault!50101)))))

(declare-fun mapIsEmpty!50101 () Bool)

(assert (=> mapIsEmpty!50101 mapRes!50101))

(declare-fun b!1260592 () Bool)

(declare-fun e!717210 () Bool)

(declare-fun e!717214 () Bool)

(assert (=> b!1260592 (= e!717210 (not e!717214))))

(declare-fun res!839803 () Bool)

(assert (=> b!1260592 (=> res!839803 e!717214)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260592 (= res!839803 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!570384 () ListLongMap!18797)

(assert (=> b!1260592 (= lt!570384 lt!570385)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48303)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48303)

(declare-datatypes ((array!82079 0))(
  ( (array!82080 (arr!39590 (Array (_ BitVec 32) (_ BitVec 64))) (size!40127 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82079)

(declare-datatypes ((Unit!41964 0))(
  ( (Unit!41965) )
))
(declare-fun lt!570387 () Unit!41964)

(declare-fun minValueBefore!43 () V!48303)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1139 (array!82079 array!82077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48303 V!48303 V!48303 V!48303 (_ BitVec 32) Int) Unit!41964)

(assert (=> b!1260592 (= lt!570387 (lemmaNoChangeToArrayThenSameMapNoExtras!1139 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5825 (array!82079 array!82077 (_ BitVec 32) (_ BitVec 32) V!48303 V!48303 (_ BitVec 32) Int) ListLongMap!18797)

(assert (=> b!1260592 (= lt!570385 (getCurrentListMapNoExtraKeys!5825 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260592 (= lt!570384 (getCurrentListMapNoExtraKeys!5825 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260593 () Bool)

(declare-fun tp_is_empty!32203 () Bool)

(assert (=> b!1260593 (= e!717212 tp_is_empty!32203)))

(declare-fun b!1260594 () Bool)

(declare-fun res!839799 () Bool)

(assert (=> b!1260594 (=> (not res!839799) (not e!717210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82079 (_ BitVec 32)) Bool)

(assert (=> b!1260594 (= res!839799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260595 () Bool)

(declare-fun res!839798 () Bool)

(assert (=> b!1260595 (=> (not res!839798) (not e!717210))))

(declare-datatypes ((List!28143 0))(
  ( (Nil!28140) (Cons!28139 (h!29357 (_ BitVec 64)) (t!41630 List!28143)) )
))
(declare-fun arrayNoDuplicates!0 (array!82079 (_ BitVec 32) List!28143) Bool)

(assert (=> b!1260595 (= res!839798 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28140))))

(declare-fun b!1260596 () Bool)

(assert (=> b!1260596 (= e!717214 true)))

(declare-fun lt!570390 () ListLongMap!18797)

(declare-fun lt!570381 () ListLongMap!18797)

(declare-fun -!2084 (ListLongMap!18797 (_ BitVec 64)) ListLongMap!18797)

(assert (=> b!1260596 (= lt!570390 (-!2084 lt!570381 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570383 () ListLongMap!18797)

(declare-fun lt!570388 () ListLongMap!18797)

(assert (=> b!1260596 (= (-!2084 lt!570383 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570388)))

(declare-fun lt!570382 () Unit!41964)

(declare-fun addThenRemoveForNewKeyIsSame!338 (ListLongMap!18797 (_ BitVec 64) V!48303) Unit!41964)

(assert (=> b!1260596 (= lt!570382 (addThenRemoveForNewKeyIsSame!338 lt!570388 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1260596 e!717209))

(declare-fun res!839800 () Bool)

(assert (=> b!1260596 (=> (not res!839800) (not e!717209))))

(assert (=> b!1260596 (= res!839800 (= lt!570381 lt!570383))))

(assert (=> b!1260596 (= lt!570383 (+!4254 lt!570388 (tuple2!20917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1260596 (= lt!570388 (+!4254 lt!570384 lt!570389))))

(assert (=> b!1260596 (= lt!570389 (tuple2!20917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4596 (array!82079 array!82077 (_ BitVec 32) (_ BitVec 32) V!48303 V!48303 (_ BitVec 32) Int) ListLongMap!18797)

(assert (=> b!1260596 (= lt!570386 (getCurrentListMap!4596 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260596 (= lt!570381 (getCurrentListMap!4596 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260597 () Bool)

(assert (=> b!1260597 (= e!717208 tp_is_empty!32203)))

(declare-fun res!839801 () Bool)

(assert (=> start!105940 (=> (not res!839801) (not e!717210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105940 (= res!839801 (validMask!0 mask!1466))))

(assert (=> start!105940 e!717210))

(assert (=> start!105940 true))

(assert (=> start!105940 tp!95428))

(assert (=> start!105940 tp_is_empty!32203))

(declare-fun array_inv!30289 (array!82079) Bool)

(assert (=> start!105940 (array_inv!30289 _keys!1118)))

(declare-fun array_inv!30290 (array!82077) Bool)

(assert (=> start!105940 (and (array_inv!30290 _values!914) e!717211)))

(declare-fun b!1260590 () Bool)

(declare-fun res!839802 () Bool)

(assert (=> b!1260590 (=> (not res!839802) (not e!717210))))

(assert (=> b!1260590 (= res!839802 (and (= (size!40126 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40127 _keys!1118) (size!40126 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105940 res!839801) b!1260590))

(assert (= (and b!1260590 res!839802) b!1260594))

(assert (= (and b!1260594 res!839799) b!1260595))

(assert (= (and b!1260595 res!839798) b!1260592))

(assert (= (and b!1260592 (not res!839803)) b!1260596))

(assert (= (and b!1260596 res!839800) b!1260589))

(assert (= (and b!1260591 condMapEmpty!50101) mapIsEmpty!50101))

(assert (= (and b!1260591 (not condMapEmpty!50101)) mapNonEmpty!50101))

(get-info :version)

(assert (= (and mapNonEmpty!50101 ((_ is ValueCellFull!15338) mapValue!50101)) b!1260597))

(assert (= (and b!1260591 ((_ is ValueCellFull!15338) mapDefault!50101)) b!1260593))

(assert (= start!105940 b!1260591))

(declare-fun m!1161331 () Bool)

(assert (=> mapNonEmpty!50101 m!1161331))

(declare-fun m!1161333 () Bool)

(assert (=> b!1260596 m!1161333))

(declare-fun m!1161335 () Bool)

(assert (=> b!1260596 m!1161335))

(declare-fun m!1161337 () Bool)

(assert (=> b!1260596 m!1161337))

(declare-fun m!1161339 () Bool)

(assert (=> b!1260596 m!1161339))

(declare-fun m!1161341 () Bool)

(assert (=> b!1260596 m!1161341))

(declare-fun m!1161343 () Bool)

(assert (=> b!1260596 m!1161343))

(declare-fun m!1161345 () Bool)

(assert (=> b!1260596 m!1161345))

(declare-fun m!1161347 () Bool)

(assert (=> b!1260594 m!1161347))

(declare-fun m!1161349 () Bool)

(assert (=> b!1260589 m!1161349))

(declare-fun m!1161351 () Bool)

(assert (=> start!105940 m!1161351))

(declare-fun m!1161353 () Bool)

(assert (=> start!105940 m!1161353))

(declare-fun m!1161355 () Bool)

(assert (=> start!105940 m!1161355))

(declare-fun m!1161357 () Bool)

(assert (=> b!1260595 m!1161357))

(declare-fun m!1161359 () Bool)

(assert (=> b!1260592 m!1161359))

(declare-fun m!1161361 () Bool)

(assert (=> b!1260592 m!1161361))

(declare-fun m!1161363 () Bool)

(assert (=> b!1260592 m!1161363))

(check-sat (not b!1260595) (not mapNonEmpty!50101) tp_is_empty!32203 (not b!1260592) (not start!105940) (not b!1260596) b_and!45187 (not b_next!27301) (not b!1260589) (not b!1260594))
(check-sat b_and!45187 (not b_next!27301))
