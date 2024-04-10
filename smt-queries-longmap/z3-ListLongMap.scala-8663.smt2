; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105342 () Bool)

(assert start!105342)

(declare-fun b_free!27015 () Bool)

(declare-fun b_next!27015 () Bool)

(assert (=> start!105342 (= b_free!27015 (not b_next!27015))))

(declare-fun tp!94556 () Bool)

(declare-fun b_and!44853 () Bool)

(assert (=> start!105342 (= tp!94556 b_and!44853)))

(declare-fun mapNonEmpty!49657 () Bool)

(declare-fun mapRes!49657 () Bool)

(declare-fun tp!94555 () Bool)

(declare-fun e!713305 () Bool)

(assert (=> mapNonEmpty!49657 (= mapRes!49657 (and tp!94555 e!713305))))

(declare-datatypes ((V!47921 0))(
  ( (V!47922 (val!16021 Int)) )
))
(declare-datatypes ((ValueCell!15195 0))(
  ( (ValueCellFull!15195 (v!18721 V!47921)) (EmptyCell!15195) )
))
(declare-fun mapValue!49657 () ValueCell!15195)

(declare-fun mapRest!49657 () (Array (_ BitVec 32) ValueCell!15195))

(declare-datatypes ((array!81484 0))(
  ( (array!81485 (arr!39302 (Array (_ BitVec 32) ValueCell!15195)) (size!39838 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81484)

(declare-fun mapKey!49657 () (_ BitVec 32))

(assert (=> mapNonEmpty!49657 (= (arr!39302 _values!914) (store mapRest!49657 mapKey!49657 mapValue!49657))))

(declare-fun b!1255141 () Bool)

(declare-fun res!836814 () Bool)

(declare-fun e!713306 () Bool)

(assert (=> b!1255141 (=> (not res!836814) (not e!713306))))

(declare-datatypes ((array!81486 0))(
  ( (array!81487 (arr!39303 (Array (_ BitVec 32) (_ BitVec 64))) (size!39839 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81486)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81486 (_ BitVec 32)) Bool)

(assert (=> b!1255141 (= res!836814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255142 () Bool)

(declare-fun e!713308 () Bool)

(declare-fun e!713307 () Bool)

(assert (=> b!1255142 (= e!713308 (and e!713307 mapRes!49657))))

(declare-fun condMapEmpty!49657 () Bool)

(declare-fun mapDefault!49657 () ValueCell!15195)

(assert (=> b!1255142 (= condMapEmpty!49657 (= (arr!39302 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15195)) mapDefault!49657)))))

(declare-fun b!1255144 () Bool)

(declare-fun tp_is_empty!31917 () Bool)

(assert (=> b!1255144 (= e!713307 tp_is_empty!31917)))

(declare-fun b!1255145 () Bool)

(declare-fun res!836815 () Bool)

(assert (=> b!1255145 (=> (not res!836815) (not e!713306))))

(declare-datatypes ((List!27912 0))(
  ( (Nil!27909) (Cons!27908 (h!29117 (_ BitVec 64)) (t!41397 List!27912)) )
))
(declare-fun arrayNoDuplicates!0 (array!81486 (_ BitVec 32) List!27912) Bool)

(assert (=> b!1255145 (= res!836815 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27909))))

(declare-fun b!1255146 () Bool)

(assert (=> b!1255146 (= e!713306 (not true))))

(declare-datatypes ((tuple2!20690 0))(
  ( (tuple2!20691 (_1!10356 (_ BitVec 64)) (_2!10356 V!47921)) )
))
(declare-datatypes ((List!27913 0))(
  ( (Nil!27910) (Cons!27909 (h!29118 tuple2!20690) (t!41398 List!27913)) )
))
(declare-datatypes ((ListLongMap!18563 0))(
  ( (ListLongMap!18564 (toList!9297 List!27913)) )
))
(declare-fun lt!567453 () ListLongMap!18563)

(declare-fun lt!567451 () ListLongMap!18563)

(assert (=> b!1255146 (= lt!567453 lt!567451)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47921)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47921)

(declare-fun minValueBefore!43 () V!47921)

(declare-datatypes ((Unit!41780 0))(
  ( (Unit!41781) )
))
(declare-fun lt!567452 () Unit!41780)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1046 (array!81486 array!81484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47921 V!47921 V!47921 V!47921 (_ BitVec 32) Int) Unit!41780)

(assert (=> b!1255146 (= lt!567452 (lemmaNoChangeToArrayThenSameMapNoExtras!1046 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5682 (array!81486 array!81484 (_ BitVec 32) (_ BitVec 32) V!47921 V!47921 (_ BitVec 32) Int) ListLongMap!18563)

(assert (=> b!1255146 (= lt!567451 (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255146 (= lt!567453 (getCurrentListMapNoExtraKeys!5682 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255143 () Bool)

(assert (=> b!1255143 (= e!713305 tp_is_empty!31917)))

(declare-fun res!836812 () Bool)

(assert (=> start!105342 (=> (not res!836812) (not e!713306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105342 (= res!836812 (validMask!0 mask!1466))))

(assert (=> start!105342 e!713306))

(assert (=> start!105342 true))

(assert (=> start!105342 tp!94556))

(assert (=> start!105342 tp_is_empty!31917))

(declare-fun array_inv!29953 (array!81486) Bool)

(assert (=> start!105342 (array_inv!29953 _keys!1118)))

(declare-fun array_inv!29954 (array!81484) Bool)

(assert (=> start!105342 (and (array_inv!29954 _values!914) e!713308)))

(declare-fun b!1255147 () Bool)

(declare-fun res!836813 () Bool)

(assert (=> b!1255147 (=> (not res!836813) (not e!713306))))

(assert (=> b!1255147 (= res!836813 (and (= (size!39838 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39839 _keys!1118) (size!39838 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49657 () Bool)

(assert (=> mapIsEmpty!49657 mapRes!49657))

(assert (= (and start!105342 res!836812) b!1255147))

(assert (= (and b!1255147 res!836813) b!1255141))

(assert (= (and b!1255141 res!836814) b!1255145))

(assert (= (and b!1255145 res!836815) b!1255146))

(assert (= (and b!1255142 condMapEmpty!49657) mapIsEmpty!49657))

(assert (= (and b!1255142 (not condMapEmpty!49657)) mapNonEmpty!49657))

(get-info :version)

(assert (= (and mapNonEmpty!49657 ((_ is ValueCellFull!15195) mapValue!49657)) b!1255143))

(assert (= (and b!1255142 ((_ is ValueCellFull!15195) mapDefault!49657)) b!1255144))

(assert (= start!105342 b!1255142))

(declare-fun m!1155923 () Bool)

(assert (=> b!1255146 m!1155923))

(declare-fun m!1155925 () Bool)

(assert (=> b!1255146 m!1155925))

(declare-fun m!1155927 () Bool)

(assert (=> b!1255146 m!1155927))

(declare-fun m!1155929 () Bool)

(assert (=> start!105342 m!1155929))

(declare-fun m!1155931 () Bool)

(assert (=> start!105342 m!1155931))

(declare-fun m!1155933 () Bool)

(assert (=> start!105342 m!1155933))

(declare-fun m!1155935 () Bool)

(assert (=> mapNonEmpty!49657 m!1155935))

(declare-fun m!1155937 () Bool)

(assert (=> b!1255141 m!1155937))

(declare-fun m!1155939 () Bool)

(assert (=> b!1255145 m!1155939))

(check-sat tp_is_empty!31917 (not start!105342) (not b!1255146) (not b_next!27015) (not mapNonEmpty!49657) (not b!1255141) b_and!44853 (not b!1255145))
(check-sat b_and!44853 (not b_next!27015))
