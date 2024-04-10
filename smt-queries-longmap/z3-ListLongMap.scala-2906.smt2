; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41580 () Bool)

(assert start!41580)

(declare-fun b_free!11247 () Bool)

(declare-fun b_next!11247 () Bool)

(assert (=> start!41580 (= b_free!11247 (not b_next!11247))))

(declare-fun tp!39738 () Bool)

(declare-fun b_and!19587 () Bool)

(assert (=> start!41580 (= tp!39738 b_and!19587)))

(declare-fun res!277673 () Bool)

(declare-fun e!271301 () Bool)

(assert (=> start!41580 (=> (not res!277673) (not e!271301))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41580 (= res!277673 (validMask!0 mask!1365))))

(assert (=> start!41580 e!271301))

(declare-fun tp_is_empty!12675 () Bool)

(assert (=> start!41580 tp_is_empty!12675))

(assert (=> start!41580 tp!39738))

(assert (=> start!41580 true))

(declare-datatypes ((array!29137 0))(
  ( (array!29138 (arr!14000 (Array (_ BitVec 32) (_ BitVec 64))) (size!14352 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29137)

(declare-fun array_inv!10114 (array!29137) Bool)

(assert (=> start!41580 (array_inv!10114 _keys!1025)))

(declare-datatypes ((V!18005 0))(
  ( (V!18006 (val!6382 Int)) )
))
(declare-datatypes ((ValueCell!5994 0))(
  ( (ValueCellFull!5994 (v!8669 V!18005)) (EmptyCell!5994) )
))
(declare-datatypes ((array!29139 0))(
  ( (array!29140 (arr!14001 (Array (_ BitVec 32) ValueCell!5994)) (size!14353 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29139)

(declare-fun e!271300 () Bool)

(declare-fun array_inv!10115 (array!29139) Bool)

(assert (=> start!41580 (and (array_inv!10115 _values!833) e!271300)))

(declare-fun mapNonEmpty!20689 () Bool)

(declare-fun mapRes!20689 () Bool)

(declare-fun tp!39739 () Bool)

(declare-fun e!271298 () Bool)

(assert (=> mapNonEmpty!20689 (= mapRes!20689 (and tp!39739 e!271298))))

(declare-fun mapValue!20689 () ValueCell!5994)

(declare-fun mapRest!20689 () (Array (_ BitVec 32) ValueCell!5994))

(declare-fun mapKey!20689 () (_ BitVec 32))

(assert (=> mapNonEmpty!20689 (= (arr!14001 _values!833) (store mapRest!20689 mapKey!20689 mapValue!20689))))

(declare-fun b!464440 () Bool)

(declare-fun res!277676 () Bool)

(assert (=> b!464440 (=> (not res!277676) (not e!271301))))

(declare-datatypes ((List!8454 0))(
  ( (Nil!8451) (Cons!8450 (h!9306 (_ BitVec 64)) (t!14400 List!8454)) )
))
(declare-fun arrayNoDuplicates!0 (array!29137 (_ BitVec 32) List!8454) Bool)

(assert (=> b!464440 (= res!277676 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8451))))

(declare-fun b!464441 () Bool)

(declare-fun res!277675 () Bool)

(assert (=> b!464441 (=> (not res!277675) (not e!271301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29137 (_ BitVec 32)) Bool)

(assert (=> b!464441 (= res!277675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464442 () Bool)

(assert (=> b!464442 (= e!271298 tp_is_empty!12675)))

(declare-fun b!464443 () Bool)

(assert (=> b!464443 (= e!271301 (not true))))

(declare-datatypes ((tuple2!8360 0))(
  ( (tuple2!8361 (_1!4191 (_ BitVec 64)) (_2!4191 V!18005)) )
))
(declare-datatypes ((List!8455 0))(
  ( (Nil!8452) (Cons!8451 (h!9307 tuple2!8360) (t!14401 List!8455)) )
))
(declare-datatypes ((ListLongMap!7273 0))(
  ( (ListLongMap!7274 (toList!3652 List!8455)) )
))
(declare-fun lt!209715 () ListLongMap!7273)

(declare-fun lt!209717 () ListLongMap!7273)

(assert (=> b!464443 (= lt!209715 lt!209717)))

(declare-fun minValueBefore!38 () V!18005)

(declare-datatypes ((Unit!13472 0))(
  ( (Unit!13473) )
))
(declare-fun lt!209716 () Unit!13472)

(declare-fun zeroValue!794 () V!18005)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18005)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!12 (array!29137 array!29139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18005 V!18005 V!18005 V!18005 (_ BitVec 32) Int) Unit!13472)

(assert (=> b!464443 (= lt!209716 (lemmaNoChangeToArrayThenSameMapNoExtras!12 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1832 (array!29137 array!29139 (_ BitVec 32) (_ BitVec 32) V!18005 V!18005 (_ BitVec 32) Int) ListLongMap!7273)

(assert (=> b!464443 (= lt!209717 (getCurrentListMapNoExtraKeys!1832 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464443 (= lt!209715 (getCurrentListMapNoExtraKeys!1832 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20689 () Bool)

(assert (=> mapIsEmpty!20689 mapRes!20689))

(declare-fun b!464444 () Bool)

(declare-fun e!271302 () Bool)

(assert (=> b!464444 (= e!271302 tp_is_empty!12675)))

(declare-fun b!464445 () Bool)

(assert (=> b!464445 (= e!271300 (and e!271302 mapRes!20689))))

(declare-fun condMapEmpty!20689 () Bool)

(declare-fun mapDefault!20689 () ValueCell!5994)

(assert (=> b!464445 (= condMapEmpty!20689 (= (arr!14001 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5994)) mapDefault!20689)))))

(declare-fun b!464446 () Bool)

(declare-fun res!277674 () Bool)

(assert (=> b!464446 (=> (not res!277674) (not e!271301))))

(assert (=> b!464446 (= res!277674 (and (= (size!14353 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14352 _keys!1025) (size!14353 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41580 res!277673) b!464446))

(assert (= (and b!464446 res!277674) b!464441))

(assert (= (and b!464441 res!277675) b!464440))

(assert (= (and b!464440 res!277676) b!464443))

(assert (= (and b!464445 condMapEmpty!20689) mapIsEmpty!20689))

(assert (= (and b!464445 (not condMapEmpty!20689)) mapNonEmpty!20689))

(get-info :version)

(assert (= (and mapNonEmpty!20689 ((_ is ValueCellFull!5994) mapValue!20689)) b!464442))

(assert (= (and b!464445 ((_ is ValueCellFull!5994) mapDefault!20689)) b!464444))

(assert (= start!41580 b!464445))

(declare-fun m!446825 () Bool)

(assert (=> start!41580 m!446825))

(declare-fun m!446827 () Bool)

(assert (=> start!41580 m!446827))

(declare-fun m!446829 () Bool)

(assert (=> start!41580 m!446829))

(declare-fun m!446831 () Bool)

(assert (=> mapNonEmpty!20689 m!446831))

(declare-fun m!446833 () Bool)

(assert (=> b!464440 m!446833))

(declare-fun m!446835 () Bool)

(assert (=> b!464443 m!446835))

(declare-fun m!446837 () Bool)

(assert (=> b!464443 m!446837))

(declare-fun m!446839 () Bool)

(assert (=> b!464443 m!446839))

(declare-fun m!446841 () Bool)

(assert (=> b!464441 m!446841))

(check-sat b_and!19587 (not b_next!11247) (not b!464440) (not b!464441) tp_is_empty!12675 (not b!464443) (not mapNonEmpty!20689) (not start!41580))
(check-sat b_and!19587 (not b_next!11247))
