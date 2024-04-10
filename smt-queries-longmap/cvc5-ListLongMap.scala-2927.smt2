; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41732 () Bool)

(assert start!41732)

(declare-fun b_free!11371 () Bool)

(declare-fun b_next!11371 () Bool)

(assert (=> start!41732 (= b_free!11371 (not b_next!11371))))

(declare-fun tp!40116 () Bool)

(declare-fun b_and!19727 () Bool)

(assert (=> start!41732 (= tp!40116 b_and!19727)))

(declare-fun b!465988 () Bool)

(declare-fun e!272413 () Bool)

(declare-fun tp_is_empty!12799 () Bool)

(assert (=> b!465988 (= e!272413 tp_is_empty!12799)))

(declare-fun b!465989 () Bool)

(declare-fun res!278557 () Bool)

(declare-fun e!272415 () Bool)

(assert (=> b!465989 (=> (not res!278557) (not e!272415))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29379 0))(
  ( (array!29380 (arr!14119 (Array (_ BitVec 32) (_ BitVec 64))) (size!14471 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29379)

(declare-datatypes ((V!18171 0))(
  ( (V!18172 (val!6444 Int)) )
))
(declare-datatypes ((ValueCell!6056 0))(
  ( (ValueCellFull!6056 (v!8731 V!18171)) (EmptyCell!6056) )
))
(declare-datatypes ((array!29381 0))(
  ( (array!29382 (arr!14120 (Array (_ BitVec 32) ValueCell!6056)) (size!14472 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29381)

(assert (=> b!465989 (= res!278557 (and (= (size!14472 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14471 _keys!1025) (size!14472 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20881 () Bool)

(declare-fun mapRes!20881 () Bool)

(declare-fun tp!40117 () Bool)

(declare-fun e!272412 () Bool)

(assert (=> mapNonEmpty!20881 (= mapRes!20881 (and tp!40117 e!272412))))

(declare-fun mapValue!20881 () ValueCell!6056)

(declare-fun mapKey!20881 () (_ BitVec 32))

(declare-fun mapRest!20881 () (Array (_ BitVec 32) ValueCell!6056))

(assert (=> mapNonEmpty!20881 (= (arr!14120 _values!833) (store mapRest!20881 mapKey!20881 mapValue!20881))))

(declare-fun b!465990 () Bool)

(declare-fun e!272414 () Bool)

(assert (=> b!465990 (= e!272414 (bvsle #b00000000000000000000000000000000 (size!14471 _keys!1025)))))

(declare-fun b!465991 () Bool)

(assert (=> b!465991 (= e!272415 (not e!272414))))

(declare-fun res!278558 () Bool)

(assert (=> b!465991 (=> res!278558 e!272414)))

(assert (=> b!465991 (= res!278558 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8444 0))(
  ( (tuple2!8445 (_1!4233 (_ BitVec 64)) (_2!4233 V!18171)) )
))
(declare-datatypes ((List!8537 0))(
  ( (Nil!8534) (Cons!8533 (h!9389 tuple2!8444) (t!14487 List!8537)) )
))
(declare-datatypes ((ListLongMap!7357 0))(
  ( (ListLongMap!7358 (toList!3694 List!8537)) )
))
(declare-fun lt!210499 () ListLongMap!7357)

(declare-fun lt!210497 () ListLongMap!7357)

(assert (=> b!465991 (= lt!210499 lt!210497)))

(declare-fun minValueBefore!38 () V!18171)

(declare-fun zeroValue!794 () V!18171)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13554 0))(
  ( (Unit!13555) )
))
(declare-fun lt!210498 () Unit!13554)

(declare-fun minValueAfter!38 () V!18171)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!53 (array!29379 array!29381 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18171 V!18171 V!18171 V!18171 (_ BitVec 32) Int) Unit!13554)

(assert (=> b!465991 (= lt!210498 (lemmaNoChangeToArrayThenSameMapNoExtras!53 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1873 (array!29379 array!29381 (_ BitVec 32) (_ BitVec 32) V!18171 V!18171 (_ BitVec 32) Int) ListLongMap!7357)

(assert (=> b!465991 (= lt!210497 (getCurrentListMapNoExtraKeys!1873 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465991 (= lt!210499 (getCurrentListMapNoExtraKeys!1873 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465992 () Bool)

(declare-fun res!278560 () Bool)

(assert (=> b!465992 (=> (not res!278560) (not e!272415))))

(declare-datatypes ((List!8538 0))(
  ( (Nil!8535) (Cons!8534 (h!9390 (_ BitVec 64)) (t!14488 List!8538)) )
))
(declare-fun arrayNoDuplicates!0 (array!29379 (_ BitVec 32) List!8538) Bool)

(assert (=> b!465992 (= res!278560 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8535))))

(declare-fun b!465994 () Bool)

(declare-fun res!278556 () Bool)

(assert (=> b!465994 (=> (not res!278556) (not e!272415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29379 (_ BitVec 32)) Bool)

(assert (=> b!465994 (= res!278556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465995 () Bool)

(declare-fun e!272416 () Bool)

(assert (=> b!465995 (= e!272416 (and e!272413 mapRes!20881))))

(declare-fun condMapEmpty!20881 () Bool)

(declare-fun mapDefault!20881 () ValueCell!6056)

