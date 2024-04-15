; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41608 () Bool)

(assert start!41608)

(declare-fun b_free!11275 () Bool)

(declare-fun b_next!11275 () Bool)

(assert (=> start!41608 (= b_free!11275 (not b_next!11275))))

(declare-fun tp!39825 () Bool)

(declare-fun b_and!19597 () Bool)

(assert (=> start!41608 (= tp!39825 b_and!19597)))

(declare-fun b!464548 () Bool)

(declare-fun res!277743 () Bool)

(declare-fun e!271393 () Bool)

(assert (=> b!464548 (=> (not res!277743) (not e!271393))))

(declare-datatypes ((array!29191 0))(
  ( (array!29192 (arr!14026 (Array (_ BitVec 32) (_ BitVec 64))) (size!14379 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29191)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29191 (_ BitVec 32)) Bool)

(assert (=> b!464548 (= res!277743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464549 () Bool)

(declare-fun res!277746 () Bool)

(assert (=> b!464549 (=> (not res!277746) (not e!271393))))

(declare-datatypes ((List!8502 0))(
  ( (Nil!8499) (Cons!8498 (h!9354 (_ BitVec 64)) (t!14441 List!8502)) )
))
(declare-fun arrayNoDuplicates!0 (array!29191 (_ BitVec 32) List!8502) Bool)

(assert (=> b!464549 (= res!277746 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8499))))

(declare-fun b!464550 () Bool)

(declare-fun e!271392 () Bool)

(declare-fun tp_is_empty!12703 () Bool)

(assert (=> b!464550 (= e!271392 tp_is_empty!12703)))

(declare-fun res!277744 () Bool)

(assert (=> start!41608 (=> (not res!277744) (not e!271393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41608 (= res!277744 (validMask!0 mask!1365))))

(assert (=> start!41608 e!271393))

(assert (=> start!41608 tp_is_empty!12703))

(assert (=> start!41608 tp!39825))

(assert (=> start!41608 true))

(declare-fun array_inv!10210 (array!29191) Bool)

(assert (=> start!41608 (array_inv!10210 _keys!1025)))

(declare-datatypes ((V!18043 0))(
  ( (V!18044 (val!6396 Int)) )
))
(declare-datatypes ((ValueCell!6008 0))(
  ( (ValueCellFull!6008 (v!8677 V!18043)) (EmptyCell!6008) )
))
(declare-datatypes ((array!29193 0))(
  ( (array!29194 (arr!14027 (Array (_ BitVec 32) ValueCell!6008)) (size!14380 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29193)

(declare-fun e!271389 () Bool)

(declare-fun array_inv!10211 (array!29193) Bool)

(assert (=> start!41608 (and (array_inv!10211 _values!833) e!271389)))

(declare-fun mapIsEmpty!20734 () Bool)

(declare-fun mapRes!20734 () Bool)

(assert (=> mapIsEmpty!20734 mapRes!20734))

(declare-fun b!464551 () Bool)

(declare-fun e!271391 () Bool)

(assert (=> b!464551 (= e!271391 tp_is_empty!12703)))

(declare-fun b!464552 () Bool)

(assert (=> b!464552 (= e!271389 (and e!271391 mapRes!20734))))

(declare-fun condMapEmpty!20734 () Bool)

(declare-fun mapDefault!20734 () ValueCell!6008)

(assert (=> b!464552 (= condMapEmpty!20734 (= (arr!14027 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6008)) mapDefault!20734)))))

(declare-fun b!464553 () Bool)

(declare-fun res!277745 () Bool)

(assert (=> b!464553 (=> (not res!277745) (not e!271393))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464553 (= res!277745 (and (= (size!14380 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14379 _keys!1025) (size!14380 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464554 () Bool)

(assert (=> b!464554 (= e!271393 (not true))))

(declare-datatypes ((tuple2!8414 0))(
  ( (tuple2!8415 (_1!4218 (_ BitVec 64)) (_2!4218 V!18043)) )
))
(declare-datatypes ((List!8503 0))(
  ( (Nil!8500) (Cons!8499 (h!9355 tuple2!8414) (t!14442 List!8503)) )
))
(declare-datatypes ((ListLongMap!7317 0))(
  ( (ListLongMap!7318 (toList!3674 List!8503)) )
))
(declare-fun lt!209648 () ListLongMap!7317)

(declare-fun lt!209649 () ListLongMap!7317)

(assert (=> b!464554 (= lt!209648 lt!209649)))

(declare-fun minValueBefore!38 () V!18043)

(declare-fun zeroValue!794 () V!18043)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13464 0))(
  ( (Unit!13465) )
))
(declare-fun lt!209647 () Unit!13464)

(declare-fun minValueAfter!38 () V!18043)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!23 (array!29191 array!29193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18043 V!18043 V!18043 V!18043 (_ BitVec 32) Int) Unit!13464)

(assert (=> b!464554 (= lt!209647 (lemmaNoChangeToArrayThenSameMapNoExtras!23 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1866 (array!29191 array!29193 (_ BitVec 32) (_ BitVec 32) V!18043 V!18043 (_ BitVec 32) Int) ListLongMap!7317)

(assert (=> b!464554 (= lt!209649 (getCurrentListMapNoExtraKeys!1866 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464554 (= lt!209648 (getCurrentListMapNoExtraKeys!1866 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20734 () Bool)

(declare-fun tp!39826 () Bool)

(assert (=> mapNonEmpty!20734 (= mapRes!20734 (and tp!39826 e!271392))))

(declare-fun mapKey!20734 () (_ BitVec 32))

(declare-fun mapRest!20734 () (Array (_ BitVec 32) ValueCell!6008))

(declare-fun mapValue!20734 () ValueCell!6008)

(assert (=> mapNonEmpty!20734 (= (arr!14027 _values!833) (store mapRest!20734 mapKey!20734 mapValue!20734))))

(assert (= (and start!41608 res!277744) b!464553))

(assert (= (and b!464553 res!277745) b!464548))

(assert (= (and b!464548 res!277743) b!464549))

(assert (= (and b!464549 res!277746) b!464554))

(assert (= (and b!464552 condMapEmpty!20734) mapIsEmpty!20734))

(assert (= (and b!464552 (not condMapEmpty!20734)) mapNonEmpty!20734))

(get-info :version)

(assert (= (and mapNonEmpty!20734 ((_ is ValueCellFull!6008) mapValue!20734)) b!464550))

(assert (= (and b!464552 ((_ is ValueCellFull!6008) mapDefault!20734)) b!464551))

(assert (= start!41608 b!464552))

(declare-fun m!446409 () Bool)

(assert (=> b!464554 m!446409))

(declare-fun m!446411 () Bool)

(assert (=> b!464554 m!446411))

(declare-fun m!446413 () Bool)

(assert (=> b!464554 m!446413))

(declare-fun m!446415 () Bool)

(assert (=> b!464549 m!446415))

(declare-fun m!446417 () Bool)

(assert (=> start!41608 m!446417))

(declare-fun m!446419 () Bool)

(assert (=> start!41608 m!446419))

(declare-fun m!446421 () Bool)

(assert (=> start!41608 m!446421))

(declare-fun m!446423 () Bool)

(assert (=> b!464548 m!446423))

(declare-fun m!446425 () Bool)

(assert (=> mapNonEmpty!20734 m!446425))

(check-sat (not b!464549) tp_is_empty!12703 (not b_next!11275) (not mapNonEmpty!20734) (not b!464554) (not start!41608) (not b!464548) b_and!19597)
(check-sat b_and!19597 (not b_next!11275))
