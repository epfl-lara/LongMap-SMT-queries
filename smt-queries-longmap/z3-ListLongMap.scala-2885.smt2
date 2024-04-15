; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41426 () Bool)

(assert start!41426)

(declare-fun b_free!11119 () Bool)

(declare-fun b_next!11119 () Bool)

(assert (=> start!41426 (= b_free!11119 (not b_next!11119))))

(declare-fun tp!39352 () Bool)

(declare-fun b_and!19429 () Bool)

(assert (=> start!41426 (= tp!39352 b_and!19429)))

(declare-fun b!462752 () Bool)

(declare-fun res!276749 () Bool)

(declare-fun e!270116 () Bool)

(assert (=> b!462752 (=> (not res!276749) (not e!270116))))

(declare-datatypes ((array!28889 0))(
  ( (array!28890 (arr!13877 (Array (_ BitVec 32) (_ BitVec 64))) (size!14230 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28889)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28889 (_ BitVec 32)) Bool)

(assert (=> b!462752 (= res!276749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20494 () Bool)

(declare-fun mapRes!20494 () Bool)

(assert (=> mapIsEmpty!20494 mapRes!20494))

(declare-fun b!462753 () Bool)

(declare-fun e!270117 () Bool)

(declare-fun e!270118 () Bool)

(assert (=> b!462753 (= e!270117 (and e!270118 mapRes!20494))))

(declare-fun condMapEmpty!20494 () Bool)

(declare-datatypes ((V!17835 0))(
  ( (V!17836 (val!6318 Int)) )
))
(declare-datatypes ((ValueCell!5930 0))(
  ( (ValueCellFull!5930 (v!8599 V!17835)) (EmptyCell!5930) )
))
(declare-datatypes ((array!28891 0))(
  ( (array!28892 (arr!13878 (Array (_ BitVec 32) ValueCell!5930)) (size!14231 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28891)

(declare-fun mapDefault!20494 () ValueCell!5930)

(assert (=> b!462753 (= condMapEmpty!20494 (= (arr!13878 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5930)) mapDefault!20494)))))

(declare-fun b!462754 () Bool)

(declare-fun tp_is_empty!12547 () Bool)

(assert (=> b!462754 (= e!270118 tp_is_empty!12547)))

(declare-fun res!276750 () Bool)

(assert (=> start!41426 (=> (not res!276750) (not e!270116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41426 (= res!276750 (validMask!0 mask!1365))))

(assert (=> start!41426 e!270116))

(assert (=> start!41426 tp_is_empty!12547))

(assert (=> start!41426 tp!39352))

(assert (=> start!41426 true))

(declare-fun array_inv!10102 (array!28889) Bool)

(assert (=> start!41426 (array_inv!10102 _keys!1025)))

(declare-fun array_inv!10103 (array!28891) Bool)

(assert (=> start!41426 (and (array_inv!10103 _values!833) e!270117)))

(declare-fun b!462755 () Bool)

(assert (=> b!462755 (= e!270116 false)))

(declare-fun minValueBefore!38 () V!17835)

(declare-fun zeroValue!794 () V!17835)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8308 0))(
  ( (tuple2!8309 (_1!4165 (_ BitVec 64)) (_2!4165 V!17835)) )
))
(declare-datatypes ((List!8394 0))(
  ( (Nil!8391) (Cons!8390 (h!9246 tuple2!8308) (t!14329 List!8394)) )
))
(declare-datatypes ((ListLongMap!7211 0))(
  ( (ListLongMap!7212 (toList!3621 List!8394)) )
))
(declare-fun lt!209060 () ListLongMap!7211)

(declare-fun getCurrentListMapNoExtraKeys!1813 (array!28889 array!28891 (_ BitVec 32) (_ BitVec 32) V!17835 V!17835 (_ BitVec 32) Int) ListLongMap!7211)

(assert (=> b!462755 (= lt!209060 (getCurrentListMapNoExtraKeys!1813 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462756 () Bool)

(declare-fun res!276752 () Bool)

(assert (=> b!462756 (=> (not res!276752) (not e!270116))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462756 (= res!276752 (and (= (size!14231 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14230 _keys!1025) (size!14231 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462757 () Bool)

(declare-fun res!276751 () Bool)

(assert (=> b!462757 (=> (not res!276751) (not e!270116))))

(declare-datatypes ((List!8395 0))(
  ( (Nil!8392) (Cons!8391 (h!9247 (_ BitVec 64)) (t!14330 List!8395)) )
))
(declare-fun arrayNoDuplicates!0 (array!28889 (_ BitVec 32) List!8395) Bool)

(assert (=> b!462757 (= res!276751 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8392))))

(declare-fun mapNonEmpty!20494 () Bool)

(declare-fun tp!39351 () Bool)

(declare-fun e!270120 () Bool)

(assert (=> mapNonEmpty!20494 (= mapRes!20494 (and tp!39351 e!270120))))

(declare-fun mapValue!20494 () ValueCell!5930)

(declare-fun mapKey!20494 () (_ BitVec 32))

(declare-fun mapRest!20494 () (Array (_ BitVec 32) ValueCell!5930))

(assert (=> mapNonEmpty!20494 (= (arr!13878 _values!833) (store mapRest!20494 mapKey!20494 mapValue!20494))))

(declare-fun b!462758 () Bool)

(assert (=> b!462758 (= e!270120 tp_is_empty!12547)))

(assert (= (and start!41426 res!276750) b!462756))

(assert (= (and b!462756 res!276752) b!462752))

(assert (= (and b!462752 res!276749) b!462757))

(assert (= (and b!462757 res!276751) b!462755))

(assert (= (and b!462753 condMapEmpty!20494) mapIsEmpty!20494))

(assert (= (and b!462753 (not condMapEmpty!20494)) mapNonEmpty!20494))

(get-info :version)

(assert (= (and mapNonEmpty!20494 ((_ is ValueCellFull!5930) mapValue!20494)) b!462758))

(assert (= (and b!462753 ((_ is ValueCellFull!5930) mapDefault!20494)) b!462754))

(assert (= start!41426 b!462753))

(declare-fun m!445021 () Bool)

(assert (=> b!462752 m!445021))

(declare-fun m!445023 () Bool)

(assert (=> b!462757 m!445023))

(declare-fun m!445025 () Bool)

(assert (=> start!41426 m!445025))

(declare-fun m!445027 () Bool)

(assert (=> start!41426 m!445027))

(declare-fun m!445029 () Bool)

(assert (=> start!41426 m!445029))

(declare-fun m!445031 () Bool)

(assert (=> b!462755 m!445031))

(declare-fun m!445033 () Bool)

(assert (=> mapNonEmpty!20494 m!445033))

(check-sat (not start!41426) (not b!462757) (not b!462752) (not b!462755) (not mapNonEmpty!20494) tp_is_empty!12547 b_and!19429 (not b_next!11119))
(check-sat b_and!19429 (not b_next!11119))
