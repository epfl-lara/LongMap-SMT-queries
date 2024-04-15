; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41760 () Bool)

(assert start!41760)

(declare-fun b_free!11395 () Bool)

(declare-fun b_next!11395 () Bool)

(assert (=> start!41760 (= b_free!11395 (not b_next!11395))))

(declare-fun tp!40192 () Bool)

(declare-fun b_and!19737 () Bool)

(assert (=> start!41760 (= tp!40192 b_and!19737)))

(declare-fun b!466187 () Bool)

(declare-fun e!272568 () Bool)

(assert (=> b!466187 (= e!272568 true)))

(declare-datatypes ((V!18203 0))(
  ( (V!18204 (val!6456 Int)) )
))
(declare-fun zeroValue!794 () V!18203)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8510 0))(
  ( (tuple2!8511 (_1!4266 (_ BitVec 64)) (_2!4266 V!18203)) )
))
(declare-datatypes ((List!8593 0))(
  ( (Nil!8590) (Cons!8589 (h!9445 tuple2!8510) (t!14536 List!8593)) )
))
(declare-datatypes ((ListLongMap!7413 0))(
  ( (ListLongMap!7414 (toList!3722 List!8593)) )
))
(declare-fun lt!210569 () ListLongMap!7413)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29425 0))(
  ( (array!29426 (arr!14141 (Array (_ BitVec 32) (_ BitVec 64))) (size!14494 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29425)

(declare-datatypes ((ValueCell!6068 0))(
  ( (ValueCellFull!6068 (v!8738 V!18203)) (EmptyCell!6068) )
))
(declare-datatypes ((array!29427 0))(
  ( (array!29428 (arr!14142 (Array (_ BitVec 32) ValueCell!6068)) (size!14495 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29427)

(declare-fun minValueAfter!38 () V!18203)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2113 (array!29425 array!29427 (_ BitVec 32) (_ BitVec 32) V!18203 V!18203 (_ BitVec 32) Int) ListLongMap!7413)

(assert (=> b!466187 (= lt!210569 (getCurrentListMap!2113 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18203)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!210573 () ListLongMap!7413)

(declare-fun +!1694 (ListLongMap!7413 tuple2!8510) ListLongMap!7413)

(assert (=> b!466187 (= lt!210573 (+!1694 (getCurrentListMap!2113 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8511 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun res!278689 () Bool)

(declare-fun e!272566 () Bool)

(assert (=> start!41760 (=> (not res!278689) (not e!272566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41760 (= res!278689 (validMask!0 mask!1365))))

(assert (=> start!41760 e!272566))

(declare-fun tp_is_empty!12823 () Bool)

(assert (=> start!41760 tp_is_empty!12823))

(assert (=> start!41760 tp!40192))

(assert (=> start!41760 true))

(declare-fun array_inv!10294 (array!29425) Bool)

(assert (=> start!41760 (array_inv!10294 _keys!1025)))

(declare-fun e!272567 () Bool)

(declare-fun array_inv!10295 (array!29427) Bool)

(assert (=> start!41760 (and (array_inv!10295 _values!833) e!272567)))

(declare-fun mapIsEmpty!20920 () Bool)

(declare-fun mapRes!20920 () Bool)

(assert (=> mapIsEmpty!20920 mapRes!20920))

(declare-fun b!466188 () Bool)

(declare-fun e!272569 () Bool)

(assert (=> b!466188 (= e!272569 tp_is_empty!12823)))

(declare-fun b!466189 () Bool)

(assert (=> b!466189 (= e!272566 (not e!272568))))

(declare-fun res!278688 () Bool)

(assert (=> b!466189 (=> res!278688 e!272568)))

(assert (=> b!466189 (= res!278688 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210572 () ListLongMap!7413)

(declare-fun lt!210571 () ListLongMap!7413)

(assert (=> b!466189 (= lt!210572 lt!210571)))

(declare-datatypes ((Unit!13548 0))(
  ( (Unit!13549) )
))
(declare-fun lt!210570 () Unit!13548)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!64 (array!29425 array!29427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18203 V!18203 V!18203 V!18203 (_ BitVec 32) Int) Unit!13548)

(assert (=> b!466189 (= lt!210570 (lemmaNoChangeToArrayThenSameMapNoExtras!64 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1907 (array!29425 array!29427 (_ BitVec 32) (_ BitVec 32) V!18203 V!18203 (_ BitVec 32) Int) ListLongMap!7413)

(assert (=> b!466189 (= lt!210571 (getCurrentListMapNoExtraKeys!1907 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466189 (= lt!210572 (getCurrentListMapNoExtraKeys!1907 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466190 () Bool)

(declare-fun res!278690 () Bool)

(assert (=> b!466190 (=> (not res!278690) (not e!272566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29425 (_ BitVec 32)) Bool)

(assert (=> b!466190 (= res!278690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466191 () Bool)

(declare-fun res!278686 () Bool)

(assert (=> b!466191 (=> (not res!278686) (not e!272566))))

(declare-datatypes ((List!8594 0))(
  ( (Nil!8591) (Cons!8590 (h!9446 (_ BitVec 64)) (t!14537 List!8594)) )
))
(declare-fun arrayNoDuplicates!0 (array!29425 (_ BitVec 32) List!8594) Bool)

(assert (=> b!466191 (= res!278686 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8591))))

(declare-fun b!466192 () Bool)

(declare-fun e!272565 () Bool)

(assert (=> b!466192 (= e!272565 tp_is_empty!12823)))

(declare-fun b!466193 () Bool)

(declare-fun res!278687 () Bool)

(assert (=> b!466193 (=> (not res!278687) (not e!272566))))

(assert (=> b!466193 (= res!278687 (and (= (size!14495 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14494 _keys!1025) (size!14495 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20920 () Bool)

(declare-fun tp!40191 () Bool)

(assert (=> mapNonEmpty!20920 (= mapRes!20920 (and tp!40191 e!272569))))

(declare-fun mapValue!20920 () ValueCell!6068)

(declare-fun mapRest!20920 () (Array (_ BitVec 32) ValueCell!6068))

(declare-fun mapKey!20920 () (_ BitVec 32))

(assert (=> mapNonEmpty!20920 (= (arr!14142 _values!833) (store mapRest!20920 mapKey!20920 mapValue!20920))))

(declare-fun b!466194 () Bool)

(assert (=> b!466194 (= e!272567 (and e!272565 mapRes!20920))))

(declare-fun condMapEmpty!20920 () Bool)

(declare-fun mapDefault!20920 () ValueCell!6068)

(assert (=> b!466194 (= condMapEmpty!20920 (= (arr!14142 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6068)) mapDefault!20920)))))

(assert (= (and start!41760 res!278689) b!466193))

(assert (= (and b!466193 res!278687) b!466190))

(assert (= (and b!466190 res!278690) b!466191))

(assert (= (and b!466191 res!278686) b!466189))

(assert (= (and b!466189 (not res!278688)) b!466187))

(assert (= (and b!466194 condMapEmpty!20920) mapIsEmpty!20920))

(assert (= (and b!466194 (not condMapEmpty!20920)) mapNonEmpty!20920))

(get-info :version)

(assert (= (and mapNonEmpty!20920 ((_ is ValueCellFull!6068) mapValue!20920)) b!466188))

(assert (= (and b!466194 ((_ is ValueCellFull!6068) mapDefault!20920)) b!466192))

(assert (= start!41760 b!466194))

(declare-fun m!447941 () Bool)

(assert (=> b!466189 m!447941))

(declare-fun m!447943 () Bool)

(assert (=> b!466189 m!447943))

(declare-fun m!447945 () Bool)

(assert (=> b!466189 m!447945))

(declare-fun m!447947 () Bool)

(assert (=> b!466190 m!447947))

(declare-fun m!447949 () Bool)

(assert (=> mapNonEmpty!20920 m!447949))

(declare-fun m!447951 () Bool)

(assert (=> b!466191 m!447951))

(declare-fun m!447953 () Bool)

(assert (=> b!466187 m!447953))

(declare-fun m!447955 () Bool)

(assert (=> b!466187 m!447955))

(assert (=> b!466187 m!447955))

(declare-fun m!447957 () Bool)

(assert (=> b!466187 m!447957))

(declare-fun m!447959 () Bool)

(assert (=> start!41760 m!447959))

(declare-fun m!447961 () Bool)

(assert (=> start!41760 m!447961))

(declare-fun m!447963 () Bool)

(assert (=> start!41760 m!447963))

(check-sat (not b!466190) (not mapNonEmpty!20920) (not b!466187) (not b!466189) b_and!19737 (not start!41760) (not b!466191) tp_is_empty!12823 (not b_next!11395))
(check-sat b_and!19737 (not b_next!11395))
