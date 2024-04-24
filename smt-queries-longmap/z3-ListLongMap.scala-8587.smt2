; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104976 () Bool)

(assert start!104976)

(declare-fun b_free!26557 () Bool)

(declare-fun b_next!26557 () Bool)

(assert (=> start!104976 (= b_free!26557 (not b_next!26557))))

(declare-fun tp!93160 () Bool)

(declare-fun b_and!44327 () Bool)

(assert (=> start!104976 (= tp!93160 b_and!44327)))

(declare-fun b!1250043 () Bool)

(declare-fun res!833587 () Bool)

(declare-fun e!709484 () Bool)

(assert (=> b!1250043 (=> (not res!833587) (not e!709484))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((array!80641 0))(
  ( (array!80642 (arr!38883 (Array (_ BitVec 32) (_ BitVec 64))) (size!39420 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80641)

(declare-datatypes ((V!47311 0))(
  ( (V!47312 (val!15792 Int)) )
))
(declare-datatypes ((ValueCell!14966 0))(
  ( (ValueCellFull!14966 (v!18484 V!47311)) (EmptyCell!14966) )
))
(declare-datatypes ((array!80643 0))(
  ( (array!80644 (arr!38884 (Array (_ BitVec 32) ValueCell!14966)) (size!39421 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80643)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250043 (= res!833587 (and (= (size!39421 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39420 _keys!1118) (size!39421 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48949 () Bool)

(declare-fun mapRes!48949 () Bool)

(assert (=> mapIsEmpty!48949 mapRes!48949))

(declare-fun b!1250044 () Bool)

(declare-fun res!833585 () Bool)

(assert (=> b!1250044 (=> (not res!833585) (not e!709484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80641 (_ BitVec 32)) Bool)

(assert (=> b!1250044 (= res!833585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833584 () Bool)

(assert (=> start!104976 (=> (not res!833584) (not e!709484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104976 (= res!833584 (validMask!0 mask!1466))))

(assert (=> start!104976 e!709484))

(assert (=> start!104976 true))

(assert (=> start!104976 tp!93160))

(declare-fun tp_is_empty!31459 () Bool)

(assert (=> start!104976 tp_is_empty!31459))

(declare-fun array_inv!29783 (array!80641) Bool)

(assert (=> start!104976 (array_inv!29783 _keys!1118)))

(declare-fun e!709483 () Bool)

(declare-fun array_inv!29784 (array!80643) Bool)

(assert (=> start!104976 (and (array_inv!29784 _values!914) e!709483)))

(declare-fun b!1250045 () Bool)

(declare-fun e!709480 () Bool)

(assert (=> b!1250045 (= e!709483 (and e!709480 mapRes!48949))))

(declare-fun condMapEmpty!48949 () Bool)

(declare-fun mapDefault!48949 () ValueCell!14966)

(assert (=> b!1250045 (= condMapEmpty!48949 (= (arr!38884 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14966)) mapDefault!48949)))))

(declare-fun b!1250046 () Bool)

(assert (=> b!1250046 (= e!709480 tp_is_empty!31459)))

(declare-fun b!1250047 () Bool)

(declare-fun res!833586 () Bool)

(assert (=> b!1250047 (=> (not res!833586) (not e!709484))))

(declare-datatypes ((List!27619 0))(
  ( (Nil!27616) (Cons!27615 (h!28833 (_ BitVec 64)) (t!41082 List!27619)) )
))
(declare-fun arrayNoDuplicates!0 (array!80641 (_ BitVec 32) List!27619) Bool)

(assert (=> b!1250047 (= res!833586 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27616))))

(declare-fun mapNonEmpty!48949 () Bool)

(declare-fun tp!93161 () Bool)

(declare-fun e!709481 () Bool)

(assert (=> mapNonEmpty!48949 (= mapRes!48949 (and tp!93161 e!709481))))

(declare-fun mapKey!48949 () (_ BitVec 32))

(declare-fun mapValue!48949 () ValueCell!14966)

(declare-fun mapRest!48949 () (Array (_ BitVec 32) ValueCell!14966))

(assert (=> mapNonEmpty!48949 (= (arr!38884 _values!914) (store mapRest!48949 mapKey!48949 mapValue!48949))))

(declare-fun b!1250048 () Bool)

(assert (=> b!1250048 (= e!709481 tp_is_empty!31459)))

(declare-fun b!1250049 () Bool)

(assert (=> b!1250049 (= e!709484 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47311)

(declare-fun zeroValue!871 () V!47311)

(declare-datatypes ((tuple2!20364 0))(
  ( (tuple2!20365 (_1!10193 (_ BitVec 64)) (_2!10193 V!47311)) )
))
(declare-datatypes ((List!27620 0))(
  ( (Nil!27617) (Cons!27616 (h!28834 tuple2!20364) (t!41083 List!27620)) )
))
(declare-datatypes ((ListLongMap!18245 0))(
  ( (ListLongMap!18246 (toList!9138 List!27620)) )
))
(declare-fun lt!563983 () ListLongMap!18245)

(declare-fun getCurrentListMapNoExtraKeys!5573 (array!80641 array!80643 (_ BitVec 32) (_ BitVec 32) V!47311 V!47311 (_ BitVec 32) Int) ListLongMap!18245)

(assert (=> b!1250049 (= lt!563983 (getCurrentListMapNoExtraKeys!5573 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563984 () ListLongMap!18245)

(declare-fun minValueBefore!43 () V!47311)

(assert (=> b!1250049 (= lt!563984 (getCurrentListMapNoExtraKeys!5573 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104976 res!833584) b!1250043))

(assert (= (and b!1250043 res!833587) b!1250044))

(assert (= (and b!1250044 res!833585) b!1250047))

(assert (= (and b!1250047 res!833586) b!1250049))

(assert (= (and b!1250045 condMapEmpty!48949) mapIsEmpty!48949))

(assert (= (and b!1250045 (not condMapEmpty!48949)) mapNonEmpty!48949))

(get-info :version)

(assert (= (and mapNonEmpty!48949 ((_ is ValueCellFull!14966) mapValue!48949)) b!1250048))

(assert (= (and b!1250045 ((_ is ValueCellFull!14966) mapDefault!48949)) b!1250046))

(assert (= start!104976 b!1250045))

(declare-fun m!1151427 () Bool)

(assert (=> b!1250044 m!1151427))

(declare-fun m!1151429 () Bool)

(assert (=> mapNonEmpty!48949 m!1151429))

(declare-fun m!1151431 () Bool)

(assert (=> b!1250047 m!1151431))

(declare-fun m!1151433 () Bool)

(assert (=> b!1250049 m!1151433))

(declare-fun m!1151435 () Bool)

(assert (=> b!1250049 m!1151435))

(declare-fun m!1151437 () Bool)

(assert (=> start!104976 m!1151437))

(declare-fun m!1151439 () Bool)

(assert (=> start!104976 m!1151439))

(declare-fun m!1151441 () Bool)

(assert (=> start!104976 m!1151441))

(check-sat (not b!1250047) tp_is_empty!31459 (not b_next!26557) b_and!44327 (not start!104976) (not mapNonEmpty!48949) (not b!1250049) (not b!1250044))
(check-sat b_and!44327 (not b_next!26557))
