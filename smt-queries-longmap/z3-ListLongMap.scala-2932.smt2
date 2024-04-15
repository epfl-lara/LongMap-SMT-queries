; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41766 () Bool)

(assert start!41766)

(declare-fun b_free!11401 () Bool)

(declare-fun b_next!11401 () Bool)

(assert (=> start!41766 (= b_free!11401 (not b_next!11401))))

(declare-fun tp!40210 () Bool)

(declare-fun b_and!19743 () Bool)

(assert (=> start!41766 (= tp!40210 b_and!19743)))

(declare-fun b!466259 () Bool)

(declare-fun res!278732 () Bool)

(declare-fun e!272620 () Bool)

(assert (=> b!466259 (=> (not res!278732) (not e!272620))))

(declare-datatypes ((array!29435 0))(
  ( (array!29436 (arr!14146 (Array (_ BitVec 32) (_ BitVec 64))) (size!14499 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29435)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29435 (_ BitVec 32)) Bool)

(assert (=> b!466259 (= res!278732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466260 () Bool)

(declare-fun e!272623 () Bool)

(declare-fun e!272618 () Bool)

(declare-fun mapRes!20929 () Bool)

(assert (=> b!466260 (= e!272623 (and e!272618 mapRes!20929))))

(declare-fun condMapEmpty!20929 () Bool)

(declare-datatypes ((V!18211 0))(
  ( (V!18212 (val!6459 Int)) )
))
(declare-datatypes ((ValueCell!6071 0))(
  ( (ValueCellFull!6071 (v!8741 V!18211)) (EmptyCell!6071) )
))
(declare-datatypes ((array!29437 0))(
  ( (array!29438 (arr!14147 (Array (_ BitVec 32) ValueCell!6071)) (size!14500 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29437)

(declare-fun mapDefault!20929 () ValueCell!6071)

(assert (=> b!466260 (= condMapEmpty!20929 (= (arr!14147 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6071)) mapDefault!20929)))))

(declare-fun b!466261 () Bool)

(declare-fun tp_is_empty!12829 () Bool)

(assert (=> b!466261 (= e!272618 tp_is_empty!12829)))

(declare-fun b!466262 () Bool)

(declare-fun e!272621 () Bool)

(assert (=> b!466262 (= e!272621 tp_is_empty!12829)))

(declare-fun b!466263 () Bool)

(declare-fun e!272622 () Bool)

(assert (=> b!466263 (= e!272622 true)))

(declare-datatypes ((tuple2!8514 0))(
  ( (tuple2!8515 (_1!4268 (_ BitVec 64)) (_2!4268 V!18211)) )
))
(declare-datatypes ((List!8597 0))(
  ( (Nil!8594) (Cons!8593 (h!9449 tuple2!8514) (t!14540 List!8597)) )
))
(declare-datatypes ((ListLongMap!7417 0))(
  ( (ListLongMap!7418 (toList!3724 List!8597)) )
))
(declare-fun lt!210618 () ListLongMap!7417)

(declare-fun zeroValue!794 () V!18211)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18211)

(declare-fun getCurrentListMap!2115 (array!29435 array!29437 (_ BitVec 32) (_ BitVec 32) V!18211 V!18211 (_ BitVec 32) Int) ListLongMap!7417)

(assert (=> b!466263 (= lt!210618 (getCurrentListMap!2115 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18211)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!210615 () ListLongMap!7417)

(declare-fun +!1696 (ListLongMap!7417 tuple2!8514) ListLongMap!7417)

(assert (=> b!466263 (= lt!210615 (+!1696 (getCurrentListMap!2115 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8515 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466264 () Bool)

(declare-fun res!278733 () Bool)

(assert (=> b!466264 (=> (not res!278733) (not e!272620))))

(declare-datatypes ((List!8598 0))(
  ( (Nil!8595) (Cons!8594 (h!9450 (_ BitVec 64)) (t!14541 List!8598)) )
))
(declare-fun arrayNoDuplicates!0 (array!29435 (_ BitVec 32) List!8598) Bool)

(assert (=> b!466264 (= res!278733 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8595))))

(declare-fun res!278735 () Bool)

(assert (=> start!41766 (=> (not res!278735) (not e!272620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41766 (= res!278735 (validMask!0 mask!1365))))

(assert (=> start!41766 e!272620))

(assert (=> start!41766 tp_is_empty!12829))

(assert (=> start!41766 tp!40210))

(assert (=> start!41766 true))

(declare-fun array_inv!10298 (array!29435) Bool)

(assert (=> start!41766 (array_inv!10298 _keys!1025)))

(declare-fun array_inv!10299 (array!29437) Bool)

(assert (=> start!41766 (and (array_inv!10299 _values!833) e!272623)))

(declare-fun b!466265 () Bool)

(assert (=> b!466265 (= e!272620 (not e!272622))))

(declare-fun res!278734 () Bool)

(assert (=> b!466265 (=> res!278734 e!272622)))

(assert (=> b!466265 (= res!278734 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210616 () ListLongMap!7417)

(declare-fun lt!210614 () ListLongMap!7417)

(assert (=> b!466265 (= lt!210616 lt!210614)))

(declare-datatypes ((Unit!13552 0))(
  ( (Unit!13553) )
))
(declare-fun lt!210617 () Unit!13552)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!66 (array!29435 array!29437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18211 V!18211 V!18211 V!18211 (_ BitVec 32) Int) Unit!13552)

(assert (=> b!466265 (= lt!210617 (lemmaNoChangeToArrayThenSameMapNoExtras!66 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1909 (array!29435 array!29437 (_ BitVec 32) (_ BitVec 32) V!18211 V!18211 (_ BitVec 32) Int) ListLongMap!7417)

(assert (=> b!466265 (= lt!210614 (getCurrentListMapNoExtraKeys!1909 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466265 (= lt!210616 (getCurrentListMapNoExtraKeys!1909 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466266 () Bool)

(declare-fun res!278731 () Bool)

(assert (=> b!466266 (=> (not res!278731) (not e!272620))))

(assert (=> b!466266 (= res!278731 (and (= (size!14500 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14499 _keys!1025) (size!14500 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20929 () Bool)

(declare-fun tp!40209 () Bool)

(assert (=> mapNonEmpty!20929 (= mapRes!20929 (and tp!40209 e!272621))))

(declare-fun mapRest!20929 () (Array (_ BitVec 32) ValueCell!6071))

(declare-fun mapValue!20929 () ValueCell!6071)

(declare-fun mapKey!20929 () (_ BitVec 32))

(assert (=> mapNonEmpty!20929 (= (arr!14147 _values!833) (store mapRest!20929 mapKey!20929 mapValue!20929))))

(declare-fun mapIsEmpty!20929 () Bool)

(assert (=> mapIsEmpty!20929 mapRes!20929))

(assert (= (and start!41766 res!278735) b!466266))

(assert (= (and b!466266 res!278731) b!466259))

(assert (= (and b!466259 res!278732) b!466264))

(assert (= (and b!466264 res!278733) b!466265))

(assert (= (and b!466265 (not res!278734)) b!466263))

(assert (= (and b!466260 condMapEmpty!20929) mapIsEmpty!20929))

(assert (= (and b!466260 (not condMapEmpty!20929)) mapNonEmpty!20929))

(get-info :version)

(assert (= (and mapNonEmpty!20929 ((_ is ValueCellFull!6071) mapValue!20929)) b!466262))

(assert (= (and b!466260 ((_ is ValueCellFull!6071) mapDefault!20929)) b!466261))

(assert (= start!41766 b!466260))

(declare-fun m!448013 () Bool)

(assert (=> b!466265 m!448013))

(declare-fun m!448015 () Bool)

(assert (=> b!466265 m!448015))

(declare-fun m!448017 () Bool)

(assert (=> b!466265 m!448017))

(declare-fun m!448019 () Bool)

(assert (=> start!41766 m!448019))

(declare-fun m!448021 () Bool)

(assert (=> start!41766 m!448021))

(declare-fun m!448023 () Bool)

(assert (=> start!41766 m!448023))

(declare-fun m!448025 () Bool)

(assert (=> mapNonEmpty!20929 m!448025))

(declare-fun m!448027 () Bool)

(assert (=> b!466263 m!448027))

(declare-fun m!448029 () Bool)

(assert (=> b!466263 m!448029))

(assert (=> b!466263 m!448029))

(declare-fun m!448031 () Bool)

(assert (=> b!466263 m!448031))

(declare-fun m!448033 () Bool)

(assert (=> b!466264 m!448033))

(declare-fun m!448035 () Bool)

(assert (=> b!466259 m!448035))

(check-sat b_and!19743 (not mapNonEmpty!20929) (not b!466264) (not b!466259) tp_is_empty!12829 (not b!466263) (not b_next!11401) (not start!41766) (not b!466265))
(check-sat b_and!19743 (not b_next!11401))
