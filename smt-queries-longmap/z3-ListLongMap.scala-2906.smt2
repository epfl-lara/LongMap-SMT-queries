; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41564 () Bool)

(assert start!41564)

(declare-fun b_free!11245 () Bool)

(declare-fun b_next!11245 () Bool)

(assert (=> start!41564 (= b_free!11245 (not b_next!11245))))

(declare-fun tp!39733 () Bool)

(declare-fun b_and!19559 () Bool)

(assert (=> start!41564 (= tp!39733 b_and!19559)))

(declare-fun b!464148 () Bool)

(declare-fun res!277535 () Bool)

(declare-fun e!271112 () Bool)

(assert (=> b!464148 (=> (not res!277535) (not e!271112))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29131 0))(
  ( (array!29132 (arr!13997 (Array (_ BitVec 32) (_ BitVec 64))) (size!14350 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29131)

(declare-datatypes ((V!18003 0))(
  ( (V!18004 (val!6381 Int)) )
))
(declare-datatypes ((ValueCell!5993 0))(
  ( (ValueCellFull!5993 (v!8662 V!18003)) (EmptyCell!5993) )
))
(declare-datatypes ((array!29133 0))(
  ( (array!29134 (arr!13998 (Array (_ BitVec 32) ValueCell!5993)) (size!14351 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29133)

(assert (=> b!464148 (= res!277535 (and (= (size!14351 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14350 _keys!1025) (size!14351 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464149 () Bool)

(declare-fun e!271110 () Bool)

(declare-fun e!271111 () Bool)

(declare-fun mapRes!20686 () Bool)

(assert (=> b!464149 (= e!271110 (and e!271111 mapRes!20686))))

(declare-fun condMapEmpty!20686 () Bool)

(declare-fun mapDefault!20686 () ValueCell!5993)

(assert (=> b!464149 (= condMapEmpty!20686 (= (arr!13998 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5993)) mapDefault!20686)))))

(declare-fun mapNonEmpty!20686 () Bool)

(declare-fun tp!39732 () Bool)

(declare-fun e!271109 () Bool)

(assert (=> mapNonEmpty!20686 (= mapRes!20686 (and tp!39732 e!271109))))

(declare-fun mapRest!20686 () (Array (_ BitVec 32) ValueCell!5993))

(declare-fun mapValue!20686 () ValueCell!5993)

(declare-fun mapKey!20686 () (_ BitVec 32))

(assert (=> mapNonEmpty!20686 (= (arr!13998 _values!833) (store mapRest!20686 mapKey!20686 mapValue!20686))))

(declare-fun b!464151 () Bool)

(declare-fun res!277534 () Bool)

(assert (=> b!464151 (=> (not res!277534) (not e!271112))))

(declare-datatypes ((List!8477 0))(
  ( (Nil!8474) (Cons!8473 (h!9329 (_ BitVec 64)) (t!14414 List!8477)) )
))
(declare-fun arrayNoDuplicates!0 (array!29131 (_ BitVec 32) List!8477) Bool)

(assert (=> b!464151 (= res!277534 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8474))))

(declare-fun b!464152 () Bool)

(declare-fun res!277533 () Bool)

(assert (=> b!464152 (=> (not res!277533) (not e!271112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29131 (_ BitVec 32)) Bool)

(assert (=> b!464152 (= res!277533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464153 () Bool)

(declare-fun tp_is_empty!12673 () Bool)

(assert (=> b!464153 (= e!271109 tp_is_empty!12673)))

(declare-fun b!464154 () Bool)

(assert (=> b!464154 (= e!271112 (not true))))

(declare-datatypes ((tuple2!8390 0))(
  ( (tuple2!8391 (_1!4206 (_ BitVec 64)) (_2!4206 V!18003)) )
))
(declare-datatypes ((List!8478 0))(
  ( (Nil!8475) (Cons!8474 (h!9330 tuple2!8390) (t!14415 List!8478)) )
))
(declare-datatypes ((ListLongMap!7293 0))(
  ( (ListLongMap!7294 (toList!3662 List!8478)) )
))
(declare-fun lt!209473 () ListLongMap!7293)

(declare-fun lt!209474 () ListLongMap!7293)

(assert (=> b!464154 (= lt!209473 lt!209474)))

(declare-fun minValueBefore!38 () V!18003)

(declare-fun zeroValue!794 () V!18003)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13440 0))(
  ( (Unit!13441) )
))
(declare-fun lt!209472 () Unit!13440)

(declare-fun minValueAfter!38 () V!18003)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!11 (array!29131 array!29133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18003 V!18003 V!18003 V!18003 (_ BitVec 32) Int) Unit!13440)

(assert (=> b!464154 (= lt!209472 (lemmaNoChangeToArrayThenSameMapNoExtras!11 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1854 (array!29131 array!29133 (_ BitVec 32) (_ BitVec 32) V!18003 V!18003 (_ BitVec 32) Int) ListLongMap!7293)

(assert (=> b!464154 (= lt!209474 (getCurrentListMapNoExtraKeys!1854 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464154 (= lt!209473 (getCurrentListMapNoExtraKeys!1854 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20686 () Bool)

(assert (=> mapIsEmpty!20686 mapRes!20686))

(declare-fun res!277532 () Bool)

(assert (=> start!41564 (=> (not res!277532) (not e!271112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41564 (= res!277532 (validMask!0 mask!1365))))

(assert (=> start!41564 e!271112))

(assert (=> start!41564 tp_is_empty!12673))

(assert (=> start!41564 tp!39733))

(assert (=> start!41564 true))

(declare-fun array_inv!10188 (array!29131) Bool)

(assert (=> start!41564 (array_inv!10188 _keys!1025)))

(declare-fun array_inv!10189 (array!29133) Bool)

(assert (=> start!41564 (and (array_inv!10189 _values!833) e!271110)))

(declare-fun b!464150 () Bool)

(assert (=> b!464150 (= e!271111 tp_is_empty!12673)))

(assert (= (and start!41564 res!277532) b!464148))

(assert (= (and b!464148 res!277535) b!464152))

(assert (= (and b!464152 res!277533) b!464151))

(assert (= (and b!464151 res!277534) b!464154))

(assert (= (and b!464149 condMapEmpty!20686) mapIsEmpty!20686))

(assert (= (and b!464149 (not condMapEmpty!20686)) mapNonEmpty!20686))

(get-info :version)

(assert (= (and mapNonEmpty!20686 ((_ is ValueCellFull!5993) mapValue!20686)) b!464153))

(assert (= (and b!464149 ((_ is ValueCellFull!5993) mapDefault!20686)) b!464150))

(assert (= start!41564 b!464149))

(declare-fun m!446073 () Bool)

(assert (=> b!464154 m!446073))

(declare-fun m!446075 () Bool)

(assert (=> b!464154 m!446075))

(declare-fun m!446077 () Bool)

(assert (=> b!464154 m!446077))

(declare-fun m!446079 () Bool)

(assert (=> mapNonEmpty!20686 m!446079))

(declare-fun m!446081 () Bool)

(assert (=> b!464152 m!446081))

(declare-fun m!446083 () Bool)

(assert (=> b!464151 m!446083))

(declare-fun m!446085 () Bool)

(assert (=> start!41564 m!446085))

(declare-fun m!446087 () Bool)

(assert (=> start!41564 m!446087))

(declare-fun m!446089 () Bool)

(assert (=> start!41564 m!446089))

(check-sat b_and!19559 (not mapNonEmpty!20686) tp_is_empty!12673 (not start!41564) (not b!464151) (not b!464154) (not b!464152) (not b_next!11245))
(check-sat b_and!19559 (not b_next!11245))
