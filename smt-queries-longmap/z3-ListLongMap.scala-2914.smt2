; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41626 () Bool)

(assert start!41626)

(declare-fun b_free!11293 () Bool)

(declare-fun b_next!11293 () Bool)

(assert (=> start!41626 (= b_free!11293 (not b_next!11293))))

(declare-fun tp!39880 () Bool)

(declare-fun b_and!19615 () Bool)

(assert (=> start!41626 (= tp!39880 b_and!19615)))

(declare-fun b!464737 () Bool)

(declare-fun e!271527 () Bool)

(declare-fun tp_is_empty!12721 () Bool)

(assert (=> b!464737 (= e!271527 tp_is_empty!12721)))

(declare-fun b!464738 () Bool)

(declare-fun res!277854 () Bool)

(declare-fun e!271528 () Bool)

(assert (=> b!464738 (=> (not res!277854) (not e!271528))))

(declare-datatypes ((array!29225 0))(
  ( (array!29226 (arr!14043 (Array (_ BitVec 32) (_ BitVec 64))) (size!14396 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29225)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29225 (_ BitVec 32)) Bool)

(assert (=> b!464738 (= res!277854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277853 () Bool)

(assert (=> start!41626 (=> (not res!277853) (not e!271528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41626 (= res!277853 (validMask!0 mask!1365))))

(assert (=> start!41626 e!271528))

(assert (=> start!41626 tp_is_empty!12721))

(assert (=> start!41626 tp!39880))

(assert (=> start!41626 true))

(declare-fun array_inv!10224 (array!29225) Bool)

(assert (=> start!41626 (array_inv!10224 _keys!1025)))

(declare-datatypes ((V!18067 0))(
  ( (V!18068 (val!6405 Int)) )
))
(declare-datatypes ((ValueCell!6017 0))(
  ( (ValueCellFull!6017 (v!8686 V!18067)) (EmptyCell!6017) )
))
(declare-datatypes ((array!29227 0))(
  ( (array!29228 (arr!14044 (Array (_ BitVec 32) ValueCell!6017)) (size!14397 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29227)

(declare-fun e!271525 () Bool)

(declare-fun array_inv!10225 (array!29227) Bool)

(assert (=> start!41626 (and (array_inv!10225 _values!833) e!271525)))

(declare-fun mapIsEmpty!20761 () Bool)

(declare-fun mapRes!20761 () Bool)

(assert (=> mapIsEmpty!20761 mapRes!20761))

(declare-fun mapNonEmpty!20761 () Bool)

(declare-fun tp!39879 () Bool)

(assert (=> mapNonEmpty!20761 (= mapRes!20761 (and tp!39879 e!271527))))

(declare-fun mapRest!20761 () (Array (_ BitVec 32) ValueCell!6017))

(declare-fun mapValue!20761 () ValueCell!6017)

(declare-fun mapKey!20761 () (_ BitVec 32))

(assert (=> mapNonEmpty!20761 (= (arr!14044 _values!833) (store mapRest!20761 mapKey!20761 mapValue!20761))))

(declare-fun b!464739 () Bool)

(assert (=> b!464739 (= e!271528 (not true))))

(declare-datatypes ((tuple2!8428 0))(
  ( (tuple2!8429 (_1!4225 (_ BitVec 64)) (_2!4225 V!18067)) )
))
(declare-datatypes ((List!8516 0))(
  ( (Nil!8513) (Cons!8512 (h!9368 tuple2!8428) (t!14455 List!8516)) )
))
(declare-datatypes ((ListLongMap!7331 0))(
  ( (ListLongMap!7332 (toList!3681 List!8516)) )
))
(declare-fun lt!209728 () ListLongMap!7331)

(declare-fun lt!209729 () ListLongMap!7331)

(assert (=> b!464739 (= lt!209728 lt!209729)))

(declare-fun minValueBefore!38 () V!18067)

(declare-fun zeroValue!794 () V!18067)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13478 0))(
  ( (Unit!13479) )
))
(declare-fun lt!209730 () Unit!13478)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18067)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!30 (array!29225 array!29227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18067 V!18067 V!18067 V!18067 (_ BitVec 32) Int) Unit!13478)

(assert (=> b!464739 (= lt!209730 (lemmaNoChangeToArrayThenSameMapNoExtras!30 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1873 (array!29225 array!29227 (_ BitVec 32) (_ BitVec 32) V!18067 V!18067 (_ BitVec 32) Int) ListLongMap!7331)

(assert (=> b!464739 (= lt!209729 (getCurrentListMapNoExtraKeys!1873 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464739 (= lt!209728 (getCurrentListMapNoExtraKeys!1873 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464740 () Bool)

(declare-fun e!271526 () Bool)

(assert (=> b!464740 (= e!271526 tp_is_empty!12721)))

(declare-fun b!464741 () Bool)

(assert (=> b!464741 (= e!271525 (and e!271526 mapRes!20761))))

(declare-fun condMapEmpty!20761 () Bool)

(declare-fun mapDefault!20761 () ValueCell!6017)

(assert (=> b!464741 (= condMapEmpty!20761 (= (arr!14044 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6017)) mapDefault!20761)))))

(declare-fun b!464742 () Bool)

(declare-fun res!277851 () Bool)

(assert (=> b!464742 (=> (not res!277851) (not e!271528))))

(declare-datatypes ((List!8517 0))(
  ( (Nil!8514) (Cons!8513 (h!9369 (_ BitVec 64)) (t!14456 List!8517)) )
))
(declare-fun arrayNoDuplicates!0 (array!29225 (_ BitVec 32) List!8517) Bool)

(assert (=> b!464742 (= res!277851 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8514))))

(declare-fun b!464743 () Bool)

(declare-fun res!277852 () Bool)

(assert (=> b!464743 (=> (not res!277852) (not e!271528))))

(assert (=> b!464743 (= res!277852 (and (= (size!14397 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14396 _keys!1025) (size!14397 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41626 res!277853) b!464743))

(assert (= (and b!464743 res!277852) b!464738))

(assert (= (and b!464738 res!277854) b!464742))

(assert (= (and b!464742 res!277851) b!464739))

(assert (= (and b!464741 condMapEmpty!20761) mapIsEmpty!20761))

(assert (= (and b!464741 (not condMapEmpty!20761)) mapNonEmpty!20761))

(get-info :version)

(assert (= (and mapNonEmpty!20761 ((_ is ValueCellFull!6017) mapValue!20761)) b!464737))

(assert (= (and b!464741 ((_ is ValueCellFull!6017) mapDefault!20761)) b!464740))

(assert (= start!41626 b!464741))

(declare-fun m!446571 () Bool)

(assert (=> start!41626 m!446571))

(declare-fun m!446573 () Bool)

(assert (=> start!41626 m!446573))

(declare-fun m!446575 () Bool)

(assert (=> start!41626 m!446575))

(declare-fun m!446577 () Bool)

(assert (=> b!464739 m!446577))

(declare-fun m!446579 () Bool)

(assert (=> b!464739 m!446579))

(declare-fun m!446581 () Bool)

(assert (=> b!464739 m!446581))

(declare-fun m!446583 () Bool)

(assert (=> mapNonEmpty!20761 m!446583))

(declare-fun m!446585 () Bool)

(assert (=> b!464738 m!446585))

(declare-fun m!446587 () Bool)

(assert (=> b!464742 m!446587))

(check-sat (not mapNonEmpty!20761) (not b_next!11293) tp_is_empty!12721 b_and!19615 (not b!464742) (not b!464738) (not start!41626) (not b!464739))
(check-sat b_and!19615 (not b_next!11293))
