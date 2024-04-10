; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41570 () Bool)

(assert start!41570)

(declare-fun b_free!11237 () Bool)

(declare-fun b_next!11237 () Bool)

(assert (=> start!41570 (= b_free!11237 (not b_next!11237))))

(declare-fun tp!39709 () Bool)

(declare-fun b_and!19577 () Bool)

(assert (=> start!41570 (= tp!39709 b_and!19577)))

(declare-fun b!464335 () Bool)

(declare-fun res!277615 () Bool)

(declare-fun e!271226 () Bool)

(assert (=> b!464335 (=> (not res!277615) (not e!271226))))

(declare-datatypes ((array!29117 0))(
  ( (array!29118 (arr!13990 (Array (_ BitVec 32) (_ BitVec 64))) (size!14342 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29117)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29117 (_ BitVec 32)) Bool)

(assert (=> b!464335 (= res!277615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20674 () Bool)

(declare-fun mapRes!20674 () Bool)

(assert (=> mapIsEmpty!20674 mapRes!20674))

(declare-fun b!464336 () Bool)

(assert (=> b!464336 (= e!271226 (not true))))

(declare-datatypes ((V!17991 0))(
  ( (V!17992 (val!6377 Int)) )
))
(declare-datatypes ((tuple2!8354 0))(
  ( (tuple2!8355 (_1!4188 (_ BitVec 64)) (_2!4188 V!17991)) )
))
(declare-datatypes ((List!8448 0))(
  ( (Nil!8445) (Cons!8444 (h!9300 tuple2!8354) (t!14394 List!8448)) )
))
(declare-datatypes ((ListLongMap!7267 0))(
  ( (ListLongMap!7268 (toList!3649 List!8448)) )
))
(declare-fun lt!209670 () ListLongMap!7267)

(declare-fun lt!209671 () ListLongMap!7267)

(assert (=> b!464336 (= lt!209670 lt!209671)))

(declare-fun minValueBefore!38 () V!17991)

(declare-fun zeroValue!794 () V!17991)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13466 0))(
  ( (Unit!13467) )
))
(declare-fun lt!209672 () Unit!13466)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5989 0))(
  ( (ValueCellFull!5989 (v!8664 V!17991)) (EmptyCell!5989) )
))
(declare-datatypes ((array!29119 0))(
  ( (array!29120 (arr!13991 (Array (_ BitVec 32) ValueCell!5989)) (size!14343 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29119)

(declare-fun minValueAfter!38 () V!17991)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!9 (array!29117 array!29119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17991 V!17991 V!17991 V!17991 (_ BitVec 32) Int) Unit!13466)

(assert (=> b!464336 (= lt!209672 (lemmaNoChangeToArrayThenSameMapNoExtras!9 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1829 (array!29117 array!29119 (_ BitVec 32) (_ BitVec 32) V!17991 V!17991 (_ BitVec 32) Int) ListLongMap!7267)

(assert (=> b!464336 (= lt!209671 (getCurrentListMapNoExtraKeys!1829 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464336 (= lt!209670 (getCurrentListMapNoExtraKeys!1829 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!277613 () Bool)

(assert (=> start!41570 (=> (not res!277613) (not e!271226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41570 (= res!277613 (validMask!0 mask!1365))))

(assert (=> start!41570 e!271226))

(declare-fun tp_is_empty!12665 () Bool)

(assert (=> start!41570 tp_is_empty!12665))

(assert (=> start!41570 tp!39709))

(assert (=> start!41570 true))

(declare-fun array_inv!10106 (array!29117) Bool)

(assert (=> start!41570 (array_inv!10106 _keys!1025)))

(declare-fun e!271227 () Bool)

(declare-fun array_inv!10107 (array!29119) Bool)

(assert (=> start!41570 (and (array_inv!10107 _values!833) e!271227)))

(declare-fun mapNonEmpty!20674 () Bool)

(declare-fun tp!39708 () Bool)

(declare-fun e!271225 () Bool)

(assert (=> mapNonEmpty!20674 (= mapRes!20674 (and tp!39708 e!271225))))

(declare-fun mapRest!20674 () (Array (_ BitVec 32) ValueCell!5989))

(declare-fun mapKey!20674 () (_ BitVec 32))

(declare-fun mapValue!20674 () ValueCell!5989)

(assert (=> mapNonEmpty!20674 (= (arr!13991 _values!833) (store mapRest!20674 mapKey!20674 mapValue!20674))))

(declare-fun b!464337 () Bool)

(declare-fun e!271224 () Bool)

(assert (=> b!464337 (= e!271224 tp_is_empty!12665)))

(declare-fun b!464338 () Bool)

(declare-fun res!277614 () Bool)

(assert (=> b!464338 (=> (not res!277614) (not e!271226))))

(declare-datatypes ((List!8449 0))(
  ( (Nil!8446) (Cons!8445 (h!9301 (_ BitVec 64)) (t!14395 List!8449)) )
))
(declare-fun arrayNoDuplicates!0 (array!29117 (_ BitVec 32) List!8449) Bool)

(assert (=> b!464338 (= res!277614 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8446))))

(declare-fun b!464339 () Bool)

(declare-fun res!277616 () Bool)

(assert (=> b!464339 (=> (not res!277616) (not e!271226))))

(assert (=> b!464339 (= res!277616 (and (= (size!14343 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14342 _keys!1025) (size!14343 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464340 () Bool)

(assert (=> b!464340 (= e!271227 (and e!271224 mapRes!20674))))

(declare-fun condMapEmpty!20674 () Bool)

(declare-fun mapDefault!20674 () ValueCell!5989)

