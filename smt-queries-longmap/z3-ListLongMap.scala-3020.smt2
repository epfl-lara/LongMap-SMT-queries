; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42460 () Bool)

(assert start!42460)

(declare-fun b_free!11929 () Bool)

(declare-fun b_next!11929 () Bool)

(assert (=> start!42460 (= b_free!11929 (not b_next!11929))))

(declare-fun tp!41824 () Bool)

(declare-fun b_and!20407 () Bool)

(assert (=> start!42460 (= tp!41824 b_and!20407)))

(declare-fun b!473840 () Bool)

(declare-fun res!283045 () Bool)

(declare-fun e!278041 () Bool)

(assert (=> b!473840 (=> (not res!283045) (not e!278041))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30448 0))(
  ( (array!30449 (arr!14642 (Array (_ BitVec 32) (_ BitVec 64))) (size!14994 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30448)

(declare-datatypes ((V!18915 0))(
  ( (V!18916 (val!6723 Int)) )
))
(declare-datatypes ((ValueCell!6335 0))(
  ( (ValueCellFull!6335 (v!9016 V!18915)) (EmptyCell!6335) )
))
(declare-datatypes ((array!30450 0))(
  ( (array!30451 (arr!14643 (Array (_ BitVec 32) ValueCell!6335)) (size!14995 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30450)

(assert (=> b!473840 (= res!283045 (and (= (size!14995 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14994 _keys!1025) (size!14995 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21751 () Bool)

(declare-fun mapRes!21751 () Bool)

(assert (=> mapIsEmpty!21751 mapRes!21751))

(declare-fun b!473841 () Bool)

(declare-fun e!278037 () Bool)

(declare-fun tp_is_empty!13357 () Bool)

(assert (=> b!473841 (= e!278037 tp_is_empty!13357)))

(declare-fun b!473842 () Bool)

(declare-fun e!278040 () Bool)

(declare-fun e!278038 () Bool)

(assert (=> b!473842 (= e!278040 (and e!278038 mapRes!21751))))

(declare-fun condMapEmpty!21751 () Bool)

(declare-fun mapDefault!21751 () ValueCell!6335)

(assert (=> b!473842 (= condMapEmpty!21751 (= (arr!14643 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6335)) mapDefault!21751)))))

(declare-fun b!473843 () Bool)

(declare-fun e!278039 () Bool)

(assert (=> b!473843 (= e!278041 (not e!278039))))

(declare-fun res!283044 () Bool)

(assert (=> b!473843 (=> res!283044 e!278039)))

(assert (=> b!473843 (= res!283044 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8790 0))(
  ( (tuple2!8791 (_1!4406 (_ BitVec 64)) (_2!4406 V!18915)) )
))
(declare-datatypes ((List!8851 0))(
  ( (Nil!8848) (Cons!8847 (h!9703 tuple2!8790) (t!14815 List!8851)) )
))
(declare-datatypes ((ListLongMap!7705 0))(
  ( (ListLongMap!7706 (toList!3868 List!8851)) )
))
(declare-fun lt!215594 () ListLongMap!7705)

(declare-fun lt!215591 () ListLongMap!7705)

(assert (=> b!473843 (= lt!215594 lt!215591)))

(declare-fun minValueBefore!38 () V!18915)

(declare-fun zeroValue!794 () V!18915)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13942 0))(
  ( (Unit!13943) )
))
(declare-fun lt!215589 () Unit!13942)

(declare-fun minValueAfter!38 () V!18915)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!237 (array!30448 array!30450 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18915 V!18915 V!18915 V!18915 (_ BitVec 32) Int) Unit!13942)

(assert (=> b!473843 (= lt!215589 (lemmaNoChangeToArrayThenSameMapNoExtras!237 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2077 (array!30448 array!30450 (_ BitVec 32) (_ BitVec 32) V!18915 V!18915 (_ BitVec 32) Int) ListLongMap!7705)

(assert (=> b!473843 (= lt!215591 (getCurrentListMapNoExtraKeys!2077 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473843 (= lt!215594 (getCurrentListMapNoExtraKeys!2077 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473844 () Bool)

(declare-fun res!283046 () Bool)

(assert (=> b!473844 (=> (not res!283046) (not e!278041))))

(declare-datatypes ((List!8852 0))(
  ( (Nil!8849) (Cons!8848 (h!9704 (_ BitVec 64)) (t!14816 List!8852)) )
))
(declare-fun arrayNoDuplicates!0 (array!30448 (_ BitVec 32) List!8852) Bool)

(assert (=> b!473844 (= res!283046 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8849))))

(declare-fun b!473845 () Bool)

(assert (=> b!473845 (= e!278038 tp_is_empty!13357)))

(declare-fun b!473846 () Bool)

(declare-fun res!283048 () Bool)

(assert (=> b!473846 (=> (not res!283048) (not e!278041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30448 (_ BitVec 32)) Bool)

(assert (=> b!473846 (= res!283048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!283047 () Bool)

(assert (=> start!42460 (=> (not res!283047) (not e!278041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42460 (= res!283047 (validMask!0 mask!1365))))

(assert (=> start!42460 e!278041))

(assert (=> start!42460 tp_is_empty!13357))

(assert (=> start!42460 tp!41824))

(assert (=> start!42460 true))

(declare-fun array_inv!10648 (array!30448) Bool)

(assert (=> start!42460 (array_inv!10648 _keys!1025)))

(declare-fun array_inv!10649 (array!30450) Bool)

(assert (=> start!42460 (and (array_inv!10649 _values!833) e!278040)))

(declare-fun mapNonEmpty!21751 () Bool)

(declare-fun tp!41823 () Bool)

(assert (=> mapNonEmpty!21751 (= mapRes!21751 (and tp!41823 e!278037))))

(declare-fun mapRest!21751 () (Array (_ BitVec 32) ValueCell!6335))

(declare-fun mapKey!21751 () (_ BitVec 32))

(declare-fun mapValue!21751 () ValueCell!6335)

(assert (=> mapNonEmpty!21751 (= (arr!14643 _values!833) (store mapRest!21751 mapKey!21751 mapValue!21751))))

(declare-fun b!473847 () Bool)

(assert (=> b!473847 (= e!278039 true)))

(declare-fun lt!215595 () ListLongMap!7705)

(declare-fun lt!215593 () tuple2!8790)

(declare-fun +!1750 (ListLongMap!7705 tuple2!8790) ListLongMap!7705)

(assert (=> b!473847 (= (+!1750 lt!215595 lt!215593) (+!1750 (+!1750 lt!215595 (tuple2!8791 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215593))))

(assert (=> b!473847 (= lt!215593 (tuple2!8791 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215590 () Unit!13942)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!152 (ListLongMap!7705 (_ BitVec 64) V!18915 V!18915) Unit!13942)

(assert (=> b!473847 (= lt!215590 (addSameAsAddTwiceSameKeyDiffValues!152 lt!215595 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473847 (= lt!215595 (+!1750 lt!215594 (tuple2!8791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215592 () ListLongMap!7705)

(declare-fun getCurrentListMap!2230 (array!30448 array!30450 (_ BitVec 32) (_ BitVec 32) V!18915 V!18915 (_ BitVec 32) Int) ListLongMap!7705)

(assert (=> b!473847 (= lt!215592 (getCurrentListMap!2230 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215588 () ListLongMap!7705)

(assert (=> b!473847 (= lt!215588 (getCurrentListMap!2230 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42460 res!283047) b!473840))

(assert (= (and b!473840 res!283045) b!473846))

(assert (= (and b!473846 res!283048) b!473844))

(assert (= (and b!473844 res!283046) b!473843))

(assert (= (and b!473843 (not res!283044)) b!473847))

(assert (= (and b!473842 condMapEmpty!21751) mapIsEmpty!21751))

(assert (= (and b!473842 (not condMapEmpty!21751)) mapNonEmpty!21751))

(get-info :version)

(assert (= (and mapNonEmpty!21751 ((_ is ValueCellFull!6335) mapValue!21751)) b!473841))

(assert (= (and b!473842 ((_ is ValueCellFull!6335) mapDefault!21751)) b!473845))

(assert (= start!42460 b!473842))

(declare-fun m!456259 () Bool)

(assert (=> b!473843 m!456259))

(declare-fun m!456261 () Bool)

(assert (=> b!473843 m!456261))

(declare-fun m!456263 () Bool)

(assert (=> b!473843 m!456263))

(declare-fun m!456265 () Bool)

(assert (=> b!473847 m!456265))

(declare-fun m!456267 () Bool)

(assert (=> b!473847 m!456267))

(assert (=> b!473847 m!456265))

(declare-fun m!456269 () Bool)

(assert (=> b!473847 m!456269))

(declare-fun m!456271 () Bool)

(assert (=> b!473847 m!456271))

(declare-fun m!456273 () Bool)

(assert (=> b!473847 m!456273))

(declare-fun m!456275 () Bool)

(assert (=> b!473847 m!456275))

(declare-fun m!456277 () Bool)

(assert (=> b!473847 m!456277))

(declare-fun m!456279 () Bool)

(assert (=> start!42460 m!456279))

(declare-fun m!456281 () Bool)

(assert (=> start!42460 m!456281))

(declare-fun m!456283 () Bool)

(assert (=> start!42460 m!456283))

(declare-fun m!456285 () Bool)

(assert (=> b!473846 m!456285))

(declare-fun m!456287 () Bool)

(assert (=> mapNonEmpty!21751 m!456287))

(declare-fun m!456289 () Bool)

(assert (=> b!473844 m!456289))

(check-sat (not b_next!11929) (not b!473847) (not start!42460) (not b!473846) tp_is_empty!13357 (not b!473843) b_and!20407 (not b!473844) (not mapNonEmpty!21751))
(check-sat b_and!20407 (not b_next!11929))
