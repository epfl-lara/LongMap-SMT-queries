; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41534 () Bool)

(assert start!41534)

(declare-fun b_free!11215 () Bool)

(declare-fun b_next!11215 () Bool)

(assert (=> start!41534 (= b_free!11215 (not b_next!11215))))

(declare-fun tp!39642 () Bool)

(declare-fun b_and!19529 () Bool)

(assert (=> start!41534 (= tp!39642 b_and!19529)))

(declare-fun b!463833 () Bool)

(declare-fun e!270885 () Bool)

(declare-fun tp_is_empty!12643 () Bool)

(assert (=> b!463833 (= e!270885 tp_is_empty!12643)))

(declare-fun b!463834 () Bool)

(declare-fun res!277354 () Bool)

(declare-fun e!270884 () Bool)

(assert (=> b!463834 (=> (not res!277354) (not e!270884))))

(declare-datatypes ((array!29075 0))(
  ( (array!29076 (arr!13969 (Array (_ BitVec 32) (_ BitVec 64))) (size!14322 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29075)

(declare-datatypes ((List!8457 0))(
  ( (Nil!8454) (Cons!8453 (h!9309 (_ BitVec 64)) (t!14394 List!8457)) )
))
(declare-fun arrayNoDuplicates!0 (array!29075 (_ BitVec 32) List!8457) Bool)

(assert (=> b!463834 (= res!277354 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8454))))

(declare-fun b!463835 () Bool)

(declare-fun e!270888 () Bool)

(declare-fun mapRes!20641 () Bool)

(assert (=> b!463835 (= e!270888 (and e!270885 mapRes!20641))))

(declare-fun condMapEmpty!20641 () Bool)

(declare-datatypes ((V!17963 0))(
  ( (V!17964 (val!6366 Int)) )
))
(declare-datatypes ((ValueCell!5978 0))(
  ( (ValueCellFull!5978 (v!8647 V!17963)) (EmptyCell!5978) )
))
(declare-datatypes ((array!29077 0))(
  ( (array!29078 (arr!13970 (Array (_ BitVec 32) ValueCell!5978)) (size!14323 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29077)

(declare-fun mapDefault!20641 () ValueCell!5978)

(assert (=> b!463835 (= condMapEmpty!20641 (= (arr!13970 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5978)) mapDefault!20641)))))

(declare-fun res!277355 () Bool)

(assert (=> start!41534 (=> (not res!277355) (not e!270884))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41534 (= res!277355 (validMask!0 mask!1365))))

(assert (=> start!41534 e!270884))

(assert (=> start!41534 tp_is_empty!12643))

(assert (=> start!41534 tp!39642))

(assert (=> start!41534 true))

(declare-fun array_inv!10166 (array!29075) Bool)

(assert (=> start!41534 (array_inv!10166 _keys!1025)))

(declare-fun array_inv!10167 (array!29077) Bool)

(assert (=> start!41534 (and (array_inv!10167 _values!833) e!270888)))

(declare-fun b!463836 () Bool)

(declare-fun e!270886 () Bool)

(assert (=> b!463836 (= e!270886 tp_is_empty!12643)))

(declare-fun b!463837 () Bool)

(assert (=> b!463837 (= e!270884 (not true))))

(declare-datatypes ((tuple2!8370 0))(
  ( (tuple2!8371 (_1!4196 (_ BitVec 64)) (_2!4196 V!17963)) )
))
(declare-datatypes ((List!8458 0))(
  ( (Nil!8455) (Cons!8454 (h!9310 tuple2!8370) (t!14395 List!8458)) )
))
(declare-datatypes ((ListLongMap!7273 0))(
  ( (ListLongMap!7274 (toList!3652 List!8458)) )
))
(declare-fun lt!209339 () ListLongMap!7273)

(declare-fun lt!209338 () ListLongMap!7273)

(assert (=> b!463837 (= lt!209339 lt!209338)))

(declare-fun minValueBefore!38 () V!17963)

(declare-fun zeroValue!794 () V!17963)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13420 0))(
  ( (Unit!13421) )
))
(declare-fun lt!209337 () Unit!13420)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17963)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1 (array!29075 array!29077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17963 V!17963 V!17963 V!17963 (_ BitVec 32) Int) Unit!13420)

(assert (=> b!463837 (= lt!209337 (lemmaNoChangeToArrayThenSameMapNoExtras!1 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1844 (array!29075 array!29077 (_ BitVec 32) (_ BitVec 32) V!17963 V!17963 (_ BitVec 32) Int) ListLongMap!7273)

(assert (=> b!463837 (= lt!209338 (getCurrentListMapNoExtraKeys!1844 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!463837 (= lt!209339 (getCurrentListMapNoExtraKeys!1844 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20641 () Bool)

(assert (=> mapIsEmpty!20641 mapRes!20641))

(declare-fun b!463838 () Bool)

(declare-fun res!277352 () Bool)

(assert (=> b!463838 (=> (not res!277352) (not e!270884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29075 (_ BitVec 32)) Bool)

(assert (=> b!463838 (= res!277352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20641 () Bool)

(declare-fun tp!39643 () Bool)

(assert (=> mapNonEmpty!20641 (= mapRes!20641 (and tp!39643 e!270886))))

(declare-fun mapKey!20641 () (_ BitVec 32))

(declare-fun mapRest!20641 () (Array (_ BitVec 32) ValueCell!5978))

(declare-fun mapValue!20641 () ValueCell!5978)

(assert (=> mapNonEmpty!20641 (= (arr!13970 _values!833) (store mapRest!20641 mapKey!20641 mapValue!20641))))

(declare-fun b!463839 () Bool)

(declare-fun res!277353 () Bool)

(assert (=> b!463839 (=> (not res!277353) (not e!270884))))

(assert (=> b!463839 (= res!277353 (and (= (size!14323 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14322 _keys!1025) (size!14323 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41534 res!277355) b!463839))

(assert (= (and b!463839 res!277353) b!463838))

(assert (= (and b!463838 res!277352) b!463834))

(assert (= (and b!463834 res!277354) b!463837))

(assert (= (and b!463835 condMapEmpty!20641) mapIsEmpty!20641))

(assert (= (and b!463835 (not condMapEmpty!20641)) mapNonEmpty!20641))

(get-info :version)

(assert (= (and mapNonEmpty!20641 ((_ is ValueCellFull!5978) mapValue!20641)) b!463836))

(assert (= (and b!463835 ((_ is ValueCellFull!5978) mapDefault!20641)) b!463833))

(assert (= start!41534 b!463835))

(declare-fun m!445803 () Bool)

(assert (=> start!41534 m!445803))

(declare-fun m!445805 () Bool)

(assert (=> start!41534 m!445805))

(declare-fun m!445807 () Bool)

(assert (=> start!41534 m!445807))

(declare-fun m!445809 () Bool)

(assert (=> b!463838 m!445809))

(declare-fun m!445811 () Bool)

(assert (=> b!463834 m!445811))

(declare-fun m!445813 () Bool)

(assert (=> b!463837 m!445813))

(declare-fun m!445815 () Bool)

(assert (=> b!463837 m!445815))

(declare-fun m!445817 () Bool)

(assert (=> b!463837 m!445817))

(declare-fun m!445819 () Bool)

(assert (=> mapNonEmpty!20641 m!445819))

(check-sat (not b!463834) (not b_next!11215) (not mapNonEmpty!20641) b_and!19529 (not b!463838) tp_is_empty!12643 (not start!41534) (not b!463837))
(check-sat b_and!19529 (not b_next!11215))
