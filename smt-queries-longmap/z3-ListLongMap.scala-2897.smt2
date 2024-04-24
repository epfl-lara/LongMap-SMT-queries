; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41510 () Bool)

(assert start!41510)

(declare-fun b_free!11191 () Bool)

(declare-fun b_next!11191 () Bool)

(assert (=> start!41510 (= b_free!11191 (not b_next!11191))))

(declare-fun tp!39571 () Bool)

(declare-fun b_and!19541 () Bool)

(assert (=> start!41510 (= tp!39571 b_and!19541)))

(declare-fun b!463791 () Bool)

(declare-fun e!270842 () Bool)

(declare-fun e!270839 () Bool)

(declare-fun mapRes!20605 () Bool)

(assert (=> b!463791 (= e!270842 (and e!270839 mapRes!20605))))

(declare-fun condMapEmpty!20605 () Bool)

(declare-datatypes ((V!17931 0))(
  ( (V!17932 (val!6354 Int)) )
))
(declare-datatypes ((ValueCell!5966 0))(
  ( (ValueCellFull!5966 (v!8642 V!17931)) (EmptyCell!5966) )
))
(declare-datatypes ((array!29032 0))(
  ( (array!29033 (arr!13947 (Array (_ BitVec 32) ValueCell!5966)) (size!14299 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29032)

(declare-fun mapDefault!20605 () ValueCell!5966)

(assert (=> b!463791 (= condMapEmpty!20605 (= (arr!13947 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5966)) mapDefault!20605)))))

(declare-fun res!277330 () Bool)

(declare-fun e!270841 () Bool)

(assert (=> start!41510 (=> (not res!277330) (not e!270841))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41510 (= res!277330 (validMask!0 mask!1365))))

(assert (=> start!41510 e!270841))

(declare-fun tp_is_empty!12619 () Bool)

(assert (=> start!41510 tp_is_empty!12619))

(assert (=> start!41510 tp!39571))

(assert (=> start!41510 true))

(declare-datatypes ((array!29034 0))(
  ( (array!29035 (arr!13948 (Array (_ BitVec 32) (_ BitVec 64))) (size!14300 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29034)

(declare-fun array_inv!10160 (array!29034) Bool)

(assert (=> start!41510 (array_inv!10160 _keys!1025)))

(declare-fun array_inv!10161 (array!29032) Bool)

(assert (=> start!41510 (and (array_inv!10161 _values!833) e!270842)))

(declare-fun mapNonEmpty!20605 () Bool)

(declare-fun tp!39570 () Bool)

(declare-fun e!270843 () Bool)

(assert (=> mapNonEmpty!20605 (= mapRes!20605 (and tp!39570 e!270843))))

(declare-fun mapRest!20605 () (Array (_ BitVec 32) ValueCell!5966))

(declare-fun mapValue!20605 () ValueCell!5966)

(declare-fun mapKey!20605 () (_ BitVec 32))

(assert (=> mapNonEmpty!20605 (= (arr!13947 _values!833) (store mapRest!20605 mapKey!20605 mapValue!20605))))

(declare-fun b!463792 () Bool)

(assert (=> b!463792 (= e!270841 false)))

(declare-fun zeroValue!794 () V!17931)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17931)

(declare-datatypes ((tuple2!8268 0))(
  ( (tuple2!8269 (_1!4145 (_ BitVec 64)) (_2!4145 V!17931)) )
))
(declare-datatypes ((List!8348 0))(
  ( (Nil!8345) (Cons!8344 (h!9200 tuple2!8268) (t!14286 List!8348)) )
))
(declare-datatypes ((ListLongMap!7183 0))(
  ( (ListLongMap!7184 (toList!3607 List!8348)) )
))
(declare-fun lt!209510 () ListLongMap!7183)

(declare-fun getCurrentListMapNoExtraKeys!1834 (array!29034 array!29032 (_ BitVec 32) (_ BitVec 32) V!17931 V!17931 (_ BitVec 32) Int) ListLongMap!7183)

(assert (=> b!463792 (= lt!209510 (getCurrentListMapNoExtraKeys!1834 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17931)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!209509 () ListLongMap!7183)

(assert (=> b!463792 (= lt!209509 (getCurrentListMapNoExtraKeys!1834 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463793 () Bool)

(assert (=> b!463793 (= e!270839 tp_is_empty!12619)))

(declare-fun b!463794 () Bool)

(declare-fun res!277331 () Bool)

(assert (=> b!463794 (=> (not res!277331) (not e!270841))))

(declare-datatypes ((List!8349 0))(
  ( (Nil!8346) (Cons!8345 (h!9201 (_ BitVec 64)) (t!14287 List!8349)) )
))
(declare-fun arrayNoDuplicates!0 (array!29034 (_ BitVec 32) List!8349) Bool)

(assert (=> b!463794 (= res!277331 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8346))))

(declare-fun mapIsEmpty!20605 () Bool)

(assert (=> mapIsEmpty!20605 mapRes!20605))

(declare-fun b!463795 () Bool)

(assert (=> b!463795 (= e!270843 tp_is_empty!12619)))

(declare-fun b!463796 () Bool)

(declare-fun res!277333 () Bool)

(assert (=> b!463796 (=> (not res!277333) (not e!270841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29034 (_ BitVec 32)) Bool)

(assert (=> b!463796 (= res!277333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463797 () Bool)

(declare-fun res!277332 () Bool)

(assert (=> b!463797 (=> (not res!277332) (not e!270841))))

(assert (=> b!463797 (= res!277332 (and (= (size!14299 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14300 _keys!1025) (size!14299 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41510 res!277330) b!463797))

(assert (= (and b!463797 res!277332) b!463796))

(assert (= (and b!463796 res!277333) b!463794))

(assert (= (and b!463794 res!277331) b!463792))

(assert (= (and b!463791 condMapEmpty!20605) mapIsEmpty!20605))

(assert (= (and b!463791 (not condMapEmpty!20605)) mapNonEmpty!20605))

(get-info :version)

(assert (= (and mapNonEmpty!20605 ((_ is ValueCellFull!5966) mapValue!20605)) b!463795))

(assert (= (and b!463791 ((_ is ValueCellFull!5966) mapDefault!20605)) b!463793))

(assert (= start!41510 b!463791))

(declare-fun m!446527 () Bool)

(assert (=> b!463794 m!446527))

(declare-fun m!446529 () Bool)

(assert (=> start!41510 m!446529))

(declare-fun m!446531 () Bool)

(assert (=> start!41510 m!446531))

(declare-fun m!446533 () Bool)

(assert (=> start!41510 m!446533))

(declare-fun m!446535 () Bool)

(assert (=> b!463792 m!446535))

(declare-fun m!446537 () Bool)

(assert (=> b!463792 m!446537))

(declare-fun m!446539 () Bool)

(assert (=> mapNonEmpty!20605 m!446539))

(declare-fun m!446541 () Bool)

(assert (=> b!463796 m!446541))

(check-sat (not mapNonEmpty!20605) (not b!463796) tp_is_empty!12619 (not start!41510) (not b_next!11191) (not b!463794) (not b!463792) b_and!19541)
(check-sat b_and!19541 (not b_next!11191))
