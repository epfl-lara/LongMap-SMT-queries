; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105286 () Bool)

(assert start!105286)

(declare-fun b_free!26809 () Bool)

(declare-fun b_next!26809 () Bool)

(assert (=> start!105286 (= b_free!26809 (not b_next!26809))))

(declare-fun tp!93925 () Bool)

(declare-fun b_and!44607 () Bool)

(assert (=> start!105286 (= tp!93925 b_and!44607)))

(declare-fun mapNonEmpty!49336 () Bool)

(declare-fun mapRes!49336 () Bool)

(declare-fun tp!93926 () Bool)

(declare-fun e!711960 () Bool)

(assert (=> mapNonEmpty!49336 (= mapRes!49336 (and tp!93926 e!711960))))

(declare-datatypes ((V!47647 0))(
  ( (V!47648 (val!15918 Int)) )
))
(declare-datatypes ((ValueCell!15092 0))(
  ( (ValueCellFull!15092 (v!18612 V!47647)) (EmptyCell!15092) )
))
(declare-fun mapRest!49336 () (Array (_ BitVec 32) ValueCell!15092))

(declare-fun mapKey!49336 () (_ BitVec 32))

(declare-datatypes ((array!81131 0))(
  ( (array!81132 (arr!39125 (Array (_ BitVec 32) ValueCell!15092)) (size!39662 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81131)

(declare-fun mapValue!49336 () ValueCell!15092)

(assert (=> mapNonEmpty!49336 (= (arr!39125 _values!914) (store mapRest!49336 mapKey!49336 mapValue!49336))))

(declare-fun mapIsEmpty!49336 () Bool)

(assert (=> mapIsEmpty!49336 mapRes!49336))

(declare-fun b!1253421 () Bool)

(declare-fun tp_is_empty!31711 () Bool)

(assert (=> b!1253421 (= e!711960 tp_is_empty!31711)))

(declare-fun b!1253422 () Bool)

(declare-fun e!711961 () Bool)

(assert (=> b!1253422 (= e!711961 (not true))))

(declare-datatypes ((tuple2!20554 0))(
  ( (tuple2!20555 (_1!10288 (_ BitVec 64)) (_2!10288 V!47647)) )
))
(declare-datatypes ((List!27798 0))(
  ( (Nil!27795) (Cons!27794 (h!29012 tuple2!20554) (t!41267 List!27798)) )
))
(declare-datatypes ((ListLongMap!18435 0))(
  ( (ListLongMap!18436 (toList!9233 List!27798)) )
))
(declare-fun lt!565669 () ListLongMap!18435)

(declare-fun lt!565670 () ListLongMap!18435)

(assert (=> b!1253422 (= lt!565669 lt!565670)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((Unit!41604 0))(
  ( (Unit!41605) )
))
(declare-fun lt!565668 () Unit!41604)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47647)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47647)

(declare-datatypes ((array!81133 0))(
  ( (array!81134 (arr!39126 (Array (_ BitVec 32) (_ BitVec 64))) (size!39663 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81133)

(declare-fun minValueBefore!43 () V!47647)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!974 (array!81133 array!81131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47647 V!47647 V!47647 V!47647 (_ BitVec 32) Int) Unit!41604)

(assert (=> b!1253422 (= lt!565668 (lemmaNoChangeToArrayThenSameMapNoExtras!974 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5660 (array!81133 array!81131 (_ BitVec 32) (_ BitVec 32) V!47647 V!47647 (_ BitVec 32) Int) ListLongMap!18435)

(assert (=> b!1253422 (= lt!565670 (getCurrentListMapNoExtraKeys!5660 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253422 (= lt!565669 (getCurrentListMapNoExtraKeys!5660 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253423 () Bool)

(declare-fun res!835583 () Bool)

(assert (=> b!1253423 (=> (not res!835583) (not e!711961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81133 (_ BitVec 32)) Bool)

(assert (=> b!1253423 (= res!835583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253424 () Bool)

(declare-fun e!711958 () Bool)

(declare-fun e!711959 () Bool)

(assert (=> b!1253424 (= e!711958 (and e!711959 mapRes!49336))))

(declare-fun condMapEmpty!49336 () Bool)

(declare-fun mapDefault!49336 () ValueCell!15092)

(assert (=> b!1253424 (= condMapEmpty!49336 (= (arr!39125 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15092)) mapDefault!49336)))))

(declare-fun b!1253425 () Bool)

(declare-fun res!835585 () Bool)

(assert (=> b!1253425 (=> (not res!835585) (not e!711961))))

(assert (=> b!1253425 (= res!835585 (and (= (size!39662 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39663 _keys!1118) (size!39662 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!835584 () Bool)

(assert (=> start!105286 (=> (not res!835584) (not e!711961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105286 (= res!835584 (validMask!0 mask!1466))))

(assert (=> start!105286 e!711961))

(assert (=> start!105286 true))

(assert (=> start!105286 tp!93925))

(assert (=> start!105286 tp_is_empty!31711))

(declare-fun array_inv!29953 (array!81133) Bool)

(assert (=> start!105286 (array_inv!29953 _keys!1118)))

(declare-fun array_inv!29954 (array!81131) Bool)

(assert (=> start!105286 (and (array_inv!29954 _values!914) e!711958)))

(declare-fun b!1253426 () Bool)

(declare-fun res!835582 () Bool)

(assert (=> b!1253426 (=> (not res!835582) (not e!711961))))

(declare-datatypes ((List!27799 0))(
  ( (Nil!27796) (Cons!27795 (h!29013 (_ BitVec 64)) (t!41268 List!27799)) )
))
(declare-fun arrayNoDuplicates!0 (array!81133 (_ BitVec 32) List!27799) Bool)

(assert (=> b!1253426 (= res!835582 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27796))))

(declare-fun b!1253427 () Bool)

(assert (=> b!1253427 (= e!711959 tp_is_empty!31711)))

(assert (= (and start!105286 res!835584) b!1253425))

(assert (= (and b!1253425 res!835585) b!1253423))

(assert (= (and b!1253423 res!835583) b!1253426))

(assert (= (and b!1253426 res!835582) b!1253422))

(assert (= (and b!1253424 condMapEmpty!49336) mapIsEmpty!49336))

(assert (= (and b!1253424 (not condMapEmpty!49336)) mapNonEmpty!49336))

(get-info :version)

(assert (= (and mapNonEmpty!49336 ((_ is ValueCellFull!15092) mapValue!49336)) b!1253421))

(assert (= (and b!1253424 ((_ is ValueCellFull!15092) mapDefault!49336)) b!1253427))

(assert (= start!105286 b!1253424))

(declare-fun m!1154409 () Bool)

(assert (=> start!105286 m!1154409))

(declare-fun m!1154411 () Bool)

(assert (=> start!105286 m!1154411))

(declare-fun m!1154413 () Bool)

(assert (=> start!105286 m!1154413))

(declare-fun m!1154415 () Bool)

(assert (=> mapNonEmpty!49336 m!1154415))

(declare-fun m!1154417 () Bool)

(assert (=> b!1253426 m!1154417))

(declare-fun m!1154419 () Bool)

(assert (=> b!1253422 m!1154419))

(declare-fun m!1154421 () Bool)

(assert (=> b!1253422 m!1154421))

(declare-fun m!1154423 () Bool)

(assert (=> b!1253422 m!1154423))

(declare-fun m!1154425 () Bool)

(assert (=> b!1253423 m!1154425))

(check-sat (not b!1253426) (not b!1253422) (not mapNonEmpty!49336) (not b!1253423) (not start!105286) tp_is_empty!31711 b_and!44607 (not b_next!26809))
(check-sat b_and!44607 (not b_next!26809))
