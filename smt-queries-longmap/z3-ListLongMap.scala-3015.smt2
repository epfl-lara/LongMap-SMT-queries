; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42410 () Bool)

(assert start!42410)

(declare-fun b_free!11899 () Bool)

(declare-fun b_next!11899 () Bool)

(assert (=> start!42410 (= b_free!11899 (not b_next!11899))))

(declare-fun tp!41731 () Bool)

(declare-fun b_and!20365 () Bool)

(assert (=> start!42410 (= tp!41731 b_and!20365)))

(declare-fun b!473299 () Bool)

(declare-fun e!277654 () Bool)

(declare-fun e!277657 () Bool)

(assert (=> b!473299 (= e!277654 (not e!277657))))

(declare-fun res!282741 () Bool)

(assert (=> b!473299 (=> res!282741 e!277657)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473299 (= res!282741 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18875 0))(
  ( (V!18876 (val!6708 Int)) )
))
(declare-datatypes ((tuple2!8764 0))(
  ( (tuple2!8765 (_1!4393 (_ BitVec 64)) (_2!4393 V!18875)) )
))
(declare-datatypes ((List!8827 0))(
  ( (Nil!8824) (Cons!8823 (h!9679 tuple2!8764) (t!14789 List!8827)) )
))
(declare-datatypes ((ListLongMap!7679 0))(
  ( (ListLongMap!7680 (toList!3855 List!8827)) )
))
(declare-fun lt!215078 () ListLongMap!7679)

(declare-fun lt!215077 () ListLongMap!7679)

(assert (=> b!473299 (= lt!215078 lt!215077)))

(declare-datatypes ((Unit!13914 0))(
  ( (Unit!13915) )
))
(declare-fun lt!215080 () Unit!13914)

(declare-fun minValueBefore!38 () V!18875)

(declare-fun zeroValue!794 () V!18875)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30388 0))(
  ( (array!30389 (arr!14613 (Array (_ BitVec 32) (_ BitVec 64))) (size!14965 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30388)

(declare-datatypes ((ValueCell!6320 0))(
  ( (ValueCellFull!6320 (v!9000 V!18875)) (EmptyCell!6320) )
))
(declare-datatypes ((array!30390 0))(
  ( (array!30391 (arr!14614 (Array (_ BitVec 32) ValueCell!6320)) (size!14966 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30390)

(declare-fun minValueAfter!38 () V!18875)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!224 (array!30388 array!30390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18875 V!18875 V!18875 V!18875 (_ BitVec 32) Int) Unit!13914)

(assert (=> b!473299 (= lt!215080 (lemmaNoChangeToArrayThenSameMapNoExtras!224 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2064 (array!30388 array!30390 (_ BitVec 32) (_ BitVec 32) V!18875 V!18875 (_ BitVec 32) Int) ListLongMap!7679)

(assert (=> b!473299 (= lt!215077 (getCurrentListMapNoExtraKeys!2064 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473299 (= lt!215078 (getCurrentListMapNoExtraKeys!2064 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473300 () Bool)

(declare-fun e!277655 () Bool)

(declare-fun tp_is_empty!13327 () Bool)

(assert (=> b!473300 (= e!277655 tp_is_empty!13327)))

(declare-fun b!473301 () Bool)

(assert (=> b!473301 (= e!277657 true)))

(declare-fun lt!215076 () ListLongMap!7679)

(declare-fun lt!215073 () tuple2!8764)

(declare-fun +!1740 (ListLongMap!7679 tuple2!8764) ListLongMap!7679)

(assert (=> b!473301 (= (+!1740 lt!215076 lt!215073) (+!1740 (+!1740 lt!215076 (tuple2!8765 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215073))))

(assert (=> b!473301 (= lt!215073 (tuple2!8765 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215074 () Unit!13914)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!142 (ListLongMap!7679 (_ BitVec 64) V!18875 V!18875) Unit!13914)

(assert (=> b!473301 (= lt!215074 (addSameAsAddTwiceSameKeyDiffValues!142 lt!215076 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473301 (= lt!215076 (+!1740 lt!215078 (tuple2!8765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215079 () ListLongMap!7679)

(declare-fun getCurrentListMap!2220 (array!30388 array!30390 (_ BitVec 32) (_ BitVec 32) V!18875 V!18875 (_ BitVec 32) Int) ListLongMap!7679)

(assert (=> b!473301 (= lt!215079 (getCurrentListMap!2220 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215075 () ListLongMap!7679)

(assert (=> b!473301 (= lt!215075 (getCurrentListMap!2220 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473302 () Bool)

(declare-fun res!282742 () Bool)

(assert (=> b!473302 (=> (not res!282742) (not e!277654))))

(assert (=> b!473302 (= res!282742 (and (= (size!14966 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14965 _keys!1025) (size!14966 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473303 () Bool)

(declare-fun res!282744 () Bool)

(assert (=> b!473303 (=> (not res!282744) (not e!277654))))

(declare-datatypes ((List!8828 0))(
  ( (Nil!8825) (Cons!8824 (h!9680 (_ BitVec 64)) (t!14790 List!8828)) )
))
(declare-fun arrayNoDuplicates!0 (array!30388 (_ BitVec 32) List!8828) Bool)

(assert (=> b!473303 (= res!282744 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8825))))

(declare-fun res!282743 () Bool)

(assert (=> start!42410 (=> (not res!282743) (not e!277654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42410 (= res!282743 (validMask!0 mask!1365))))

(assert (=> start!42410 e!277654))

(assert (=> start!42410 tp_is_empty!13327))

(assert (=> start!42410 tp!41731))

(assert (=> start!42410 true))

(declare-fun array_inv!10624 (array!30388) Bool)

(assert (=> start!42410 (array_inv!10624 _keys!1025)))

(declare-fun e!277653 () Bool)

(declare-fun array_inv!10625 (array!30390) Bool)

(assert (=> start!42410 (and (array_inv!10625 _values!833) e!277653)))

(declare-fun mapIsEmpty!21703 () Bool)

(declare-fun mapRes!21703 () Bool)

(assert (=> mapIsEmpty!21703 mapRes!21703))

(declare-fun mapNonEmpty!21703 () Bool)

(declare-fun tp!41730 () Bool)

(assert (=> mapNonEmpty!21703 (= mapRes!21703 (and tp!41730 e!277655))))

(declare-fun mapRest!21703 () (Array (_ BitVec 32) ValueCell!6320))

(declare-fun mapKey!21703 () (_ BitVec 32))

(declare-fun mapValue!21703 () ValueCell!6320)

(assert (=> mapNonEmpty!21703 (= (arr!14614 _values!833) (store mapRest!21703 mapKey!21703 mapValue!21703))))

(declare-fun b!473304 () Bool)

(declare-fun e!277656 () Bool)

(assert (=> b!473304 (= e!277653 (and e!277656 mapRes!21703))))

(declare-fun condMapEmpty!21703 () Bool)

(declare-fun mapDefault!21703 () ValueCell!6320)

(assert (=> b!473304 (= condMapEmpty!21703 (= (arr!14614 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6320)) mapDefault!21703)))))

(declare-fun b!473305 () Bool)

(declare-fun res!282740 () Bool)

(assert (=> b!473305 (=> (not res!282740) (not e!277654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30388 (_ BitVec 32)) Bool)

(assert (=> b!473305 (= res!282740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473306 () Bool)

(assert (=> b!473306 (= e!277656 tp_is_empty!13327)))

(assert (= (and start!42410 res!282743) b!473302))

(assert (= (and b!473302 res!282742) b!473305))

(assert (= (and b!473305 res!282740) b!473303))

(assert (= (and b!473303 res!282744) b!473299))

(assert (= (and b!473299 (not res!282741)) b!473301))

(assert (= (and b!473304 condMapEmpty!21703) mapIsEmpty!21703))

(assert (= (and b!473304 (not condMapEmpty!21703)) mapNonEmpty!21703))

(get-info :version)

(assert (= (and mapNonEmpty!21703 ((_ is ValueCellFull!6320) mapValue!21703)) b!473300))

(assert (= (and b!473304 ((_ is ValueCellFull!6320) mapDefault!21703)) b!473306))

(assert (= start!42410 b!473304))

(declare-fun m!455567 () Bool)

(assert (=> b!473303 m!455567))

(declare-fun m!455569 () Bool)

(assert (=> b!473299 m!455569))

(declare-fun m!455571 () Bool)

(assert (=> b!473299 m!455571))

(declare-fun m!455573 () Bool)

(assert (=> b!473299 m!455573))

(declare-fun m!455575 () Bool)

(assert (=> start!42410 m!455575))

(declare-fun m!455577 () Bool)

(assert (=> start!42410 m!455577))

(declare-fun m!455579 () Bool)

(assert (=> start!42410 m!455579))

(declare-fun m!455581 () Bool)

(assert (=> mapNonEmpty!21703 m!455581))

(declare-fun m!455583 () Bool)

(assert (=> b!473301 m!455583))

(declare-fun m!455585 () Bool)

(assert (=> b!473301 m!455585))

(assert (=> b!473301 m!455585))

(declare-fun m!455587 () Bool)

(assert (=> b!473301 m!455587))

(declare-fun m!455589 () Bool)

(assert (=> b!473301 m!455589))

(declare-fun m!455591 () Bool)

(assert (=> b!473301 m!455591))

(declare-fun m!455593 () Bool)

(assert (=> b!473301 m!455593))

(declare-fun m!455595 () Bool)

(assert (=> b!473301 m!455595))

(declare-fun m!455597 () Bool)

(assert (=> b!473305 m!455597))

(check-sat b_and!20365 (not b_next!11899) (not start!42410) (not b!473301) (not b!473299) (not mapNonEmpty!21703) tp_is_empty!13327 (not b!473303) (not b!473305))
(check-sat b_and!20365 (not b_next!11899))
