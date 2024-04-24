; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105388 () Bool)

(assert start!105388)

(declare-fun b_free!26881 () Bool)

(declare-fun b_next!26881 () Bool)

(assert (=> start!105388 (= b_free!26881 (not b_next!26881))))

(declare-fun tp!94148 () Bool)

(declare-fun b_and!44697 () Bool)

(assert (=> start!105388 (= tp!94148 b_and!44697)))

(declare-fun b!1254495 () Bool)

(declare-fun e!712737 () Bool)

(declare-fun tp_is_empty!31783 () Bool)

(assert (=> b!1254495 (= e!712737 tp_is_empty!31783)))

(declare-fun b!1254496 () Bool)

(declare-fun res!836191 () Bool)

(declare-fun e!712735 () Bool)

(assert (=> b!1254496 (=> (not res!836191) (not e!712735))))

(declare-datatypes ((array!81269 0))(
  ( (array!81270 (arr!39192 (Array (_ BitVec 32) (_ BitVec 64))) (size!39729 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81269)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81269 (_ BitVec 32)) Bool)

(assert (=> b!1254496 (= res!836191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254497 () Bool)

(declare-fun e!712738 () Bool)

(assert (=> b!1254497 (= e!712738 true)))

(declare-fun lt!566228 () Bool)

(declare-datatypes ((V!47743 0))(
  ( (V!47744 (val!15954 Int)) )
))
(declare-datatypes ((tuple2!20604 0))(
  ( (tuple2!20605 (_1!10313 (_ BitVec 64)) (_2!10313 V!47743)) )
))
(declare-datatypes ((List!27842 0))(
  ( (Nil!27839) (Cons!27838 (h!29056 tuple2!20604) (t!41315 List!27842)) )
))
(declare-datatypes ((ListLongMap!18485 0))(
  ( (ListLongMap!18486 (toList!9258 List!27842)) )
))
(declare-fun lt!566227 () ListLongMap!18485)

(declare-fun contains!7547 (ListLongMap!18485 (_ BitVec 64)) Bool)

(assert (=> b!1254497 (= lt!566228 (contains!7547 lt!566227 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!712734 () Bool)

(assert (=> b!1254497 e!712734))

(declare-fun res!836190 () Bool)

(assert (=> b!1254497 (=> (not res!836190) (not e!712734))))

(declare-fun minValueBefore!43 () V!47743)

(declare-fun lt!566230 () ListLongMap!18485)

(declare-fun +!4198 (ListLongMap!18485 tuple2!20604) ListLongMap!18485)

(assert (=> b!1254497 (= res!836190 (= lt!566230 (+!4198 lt!566227 (tuple2!20605 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!566229 () ListLongMap!18485)

(declare-fun minValueAfter!43 () V!47743)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47743)

(declare-datatypes ((ValueCell!15128 0))(
  ( (ValueCellFull!15128 (v!18648 V!47743)) (EmptyCell!15128) )
))
(declare-datatypes ((array!81271 0))(
  ( (array!81272 (arr!39193 (Array (_ BitVec 32) ValueCell!15128)) (size!39730 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81271)

(declare-fun getCurrentListMap!4495 (array!81269 array!81271 (_ BitVec 32) (_ BitVec 32) V!47743 V!47743 (_ BitVec 32) Int) ListLongMap!18485)

(assert (=> b!1254497 (= lt!566229 (getCurrentListMap!4495 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254497 (= lt!566230 (getCurrentListMap!4495 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49450 () Bool)

(declare-fun mapRes!49450 () Bool)

(assert (=> mapIsEmpty!49450 mapRes!49450))

(declare-fun b!1254498 () Bool)

(assert (=> b!1254498 (= e!712735 (not e!712738))))

(declare-fun res!836189 () Bool)

(assert (=> b!1254498 (=> res!836189 e!712738)))

(assert (=> b!1254498 (= res!836189 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!566225 () ListLongMap!18485)

(assert (=> b!1254498 (= lt!566227 lt!566225)))

(declare-datatypes ((Unit!41653 0))(
  ( (Unit!41654) )
))
(declare-fun lt!566226 () Unit!41653)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!998 (array!81269 array!81271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47743 V!47743 V!47743 V!47743 (_ BitVec 32) Int) Unit!41653)

(assert (=> b!1254498 (= lt!566226 (lemmaNoChangeToArrayThenSameMapNoExtras!998 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5684 (array!81269 array!81271 (_ BitVec 32) (_ BitVec 32) V!47743 V!47743 (_ BitVec 32) Int) ListLongMap!18485)

(assert (=> b!1254498 (= lt!566225 (getCurrentListMapNoExtraKeys!5684 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254498 (= lt!566227 (getCurrentListMapNoExtraKeys!5684 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254499 () Bool)

(declare-fun res!836193 () Bool)

(assert (=> b!1254499 (=> (not res!836193) (not e!712735))))

(declare-datatypes ((List!27843 0))(
  ( (Nil!27840) (Cons!27839 (h!29057 (_ BitVec 64)) (t!41316 List!27843)) )
))
(declare-fun arrayNoDuplicates!0 (array!81269 (_ BitVec 32) List!27843) Bool)

(assert (=> b!1254499 (= res!836193 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27840))))

(declare-fun b!1254500 () Bool)

(declare-fun res!836192 () Bool)

(assert (=> b!1254500 (=> (not res!836192) (not e!712735))))

(assert (=> b!1254500 (= res!836192 (and (= (size!39730 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39729 _keys!1118) (size!39730 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49450 () Bool)

(declare-fun tp!94147 () Bool)

(assert (=> mapNonEmpty!49450 (= mapRes!49450 (and tp!94147 e!712737))))

(declare-fun mapRest!49450 () (Array (_ BitVec 32) ValueCell!15128))

(declare-fun mapKey!49450 () (_ BitVec 32))

(declare-fun mapValue!49450 () ValueCell!15128)

(assert (=> mapNonEmpty!49450 (= (arr!39193 _values!914) (store mapRest!49450 mapKey!49450 mapValue!49450))))

(declare-fun res!836188 () Bool)

(assert (=> start!105388 (=> (not res!836188) (not e!712735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105388 (= res!836188 (validMask!0 mask!1466))))

(assert (=> start!105388 e!712735))

(assert (=> start!105388 true))

(assert (=> start!105388 tp!94148))

(assert (=> start!105388 tp_is_empty!31783))

(declare-fun array_inv!29995 (array!81269) Bool)

(assert (=> start!105388 (array_inv!29995 _keys!1118)))

(declare-fun e!712736 () Bool)

(declare-fun array_inv!29996 (array!81271) Bool)

(assert (=> start!105388 (and (array_inv!29996 _values!914) e!712736)))

(declare-fun b!1254501 () Bool)

(declare-fun e!712732 () Bool)

(assert (=> b!1254501 (= e!712732 tp_is_empty!31783)))

(declare-fun b!1254502 () Bool)

(assert (=> b!1254502 (= e!712734 (= lt!566229 lt!566225))))

(declare-fun b!1254503 () Bool)

(assert (=> b!1254503 (= e!712736 (and e!712732 mapRes!49450))))

(declare-fun condMapEmpty!49450 () Bool)

(declare-fun mapDefault!49450 () ValueCell!15128)

(assert (=> b!1254503 (= condMapEmpty!49450 (= (arr!39193 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15128)) mapDefault!49450)))))

(assert (= (and start!105388 res!836188) b!1254500))

(assert (= (and b!1254500 res!836192) b!1254496))

(assert (= (and b!1254496 res!836191) b!1254499))

(assert (= (and b!1254499 res!836193) b!1254498))

(assert (= (and b!1254498 (not res!836189)) b!1254497))

(assert (= (and b!1254497 res!836190) b!1254502))

(assert (= (and b!1254503 condMapEmpty!49450) mapIsEmpty!49450))

(assert (= (and b!1254503 (not condMapEmpty!49450)) mapNonEmpty!49450))

(get-info :version)

(assert (= (and mapNonEmpty!49450 ((_ is ValueCellFull!15128) mapValue!49450)) b!1254495))

(assert (= (and b!1254503 ((_ is ValueCellFull!15128) mapDefault!49450)) b!1254501))

(assert (= start!105388 b!1254503))

(declare-fun m!1155289 () Bool)

(assert (=> start!105388 m!1155289))

(declare-fun m!1155291 () Bool)

(assert (=> start!105388 m!1155291))

(declare-fun m!1155293 () Bool)

(assert (=> start!105388 m!1155293))

(declare-fun m!1155295 () Bool)

(assert (=> b!1254496 m!1155295))

(declare-fun m!1155297 () Bool)

(assert (=> b!1254499 m!1155297))

(declare-fun m!1155299 () Bool)

(assert (=> b!1254498 m!1155299))

(declare-fun m!1155301 () Bool)

(assert (=> b!1254498 m!1155301))

(declare-fun m!1155303 () Bool)

(assert (=> b!1254498 m!1155303))

(declare-fun m!1155305 () Bool)

(assert (=> mapNonEmpty!49450 m!1155305))

(declare-fun m!1155307 () Bool)

(assert (=> b!1254497 m!1155307))

(declare-fun m!1155309 () Bool)

(assert (=> b!1254497 m!1155309))

(declare-fun m!1155311 () Bool)

(assert (=> b!1254497 m!1155311))

(declare-fun m!1155313 () Bool)

(assert (=> b!1254497 m!1155313))

(check-sat (not b!1254497) (not b!1254498) b_and!44697 (not b!1254496) (not mapNonEmpty!49450) (not start!105388) (not b!1254499) tp_is_empty!31783 (not b_next!26881))
(check-sat b_and!44697 (not b_next!26881))
