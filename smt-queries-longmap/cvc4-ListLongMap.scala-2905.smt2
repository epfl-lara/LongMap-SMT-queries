; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41576 () Bool)

(assert start!41576)

(declare-fun b_free!11243 () Bool)

(declare-fun b_next!11243 () Bool)

(assert (=> start!41576 (= b_free!11243 (not b_next!11243))))

(declare-fun tp!39726 () Bool)

(declare-fun b_and!19583 () Bool)

(assert (=> start!41576 (= tp!39726 b_and!19583)))

(declare-fun b!464398 () Bool)

(declare-fun e!271268 () Bool)

(declare-fun tp_is_empty!12671 () Bool)

(assert (=> b!464398 (= e!271268 tp_is_empty!12671)))

(declare-fun b!464399 () Bool)

(declare-fun res!277649 () Bool)

(declare-fun e!271271 () Bool)

(assert (=> b!464399 (=> (not res!277649) (not e!271271))))

(declare-datatypes ((array!29129 0))(
  ( (array!29130 (arr!13996 (Array (_ BitVec 32) (_ BitVec 64))) (size!14348 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29129)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29129 (_ BitVec 32)) Bool)

(assert (=> b!464399 (= res!277649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20683 () Bool)

(declare-fun mapRes!20683 () Bool)

(declare-fun tp!39727 () Bool)

(assert (=> mapNonEmpty!20683 (= mapRes!20683 (and tp!39727 e!271268))))

(declare-datatypes ((V!17999 0))(
  ( (V!18000 (val!6380 Int)) )
))
(declare-datatypes ((ValueCell!5992 0))(
  ( (ValueCellFull!5992 (v!8667 V!17999)) (EmptyCell!5992) )
))
(declare-datatypes ((array!29131 0))(
  ( (array!29132 (arr!13997 (Array (_ BitVec 32) ValueCell!5992)) (size!14349 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29131)

(declare-fun mapKey!20683 () (_ BitVec 32))

(declare-fun mapRest!20683 () (Array (_ BitVec 32) ValueCell!5992))

(declare-fun mapValue!20683 () ValueCell!5992)

(assert (=> mapNonEmpty!20683 (= (arr!13997 _values!833) (store mapRest!20683 mapKey!20683 mapValue!20683))))

(declare-fun b!464400 () Bool)

(assert (=> b!464400 (= e!271271 (not true))))

(declare-datatypes ((tuple2!8358 0))(
  ( (tuple2!8359 (_1!4190 (_ BitVec 64)) (_2!4190 V!17999)) )
))
(declare-datatypes ((List!8452 0))(
  ( (Nil!8449) (Cons!8448 (h!9304 tuple2!8358) (t!14398 List!8452)) )
))
(declare-datatypes ((ListLongMap!7271 0))(
  ( (ListLongMap!7272 (toList!3651 List!8452)) )
))
(declare-fun lt!209697 () ListLongMap!7271)

(declare-fun lt!209698 () ListLongMap!7271)

(assert (=> b!464400 (= lt!209697 lt!209698)))

(declare-fun minValueBefore!38 () V!17999)

(declare-fun zeroValue!794 () V!17999)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17999)

(declare-datatypes ((Unit!13470 0))(
  ( (Unit!13471) )
))
(declare-fun lt!209699 () Unit!13470)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!11 (array!29129 array!29131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17999 V!17999 V!17999 V!17999 (_ BitVec 32) Int) Unit!13470)

(assert (=> b!464400 (= lt!209699 (lemmaNoChangeToArrayThenSameMapNoExtras!11 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1831 (array!29129 array!29131 (_ BitVec 32) (_ BitVec 32) V!17999 V!17999 (_ BitVec 32) Int) ListLongMap!7271)

(assert (=> b!464400 (= lt!209698 (getCurrentListMapNoExtraKeys!1831 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464400 (= lt!209697 (getCurrentListMapNoExtraKeys!1831 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464401 () Bool)

(declare-fun res!277651 () Bool)

(assert (=> b!464401 (=> (not res!277651) (not e!271271))))

(declare-datatypes ((List!8453 0))(
  ( (Nil!8450) (Cons!8449 (h!9305 (_ BitVec 64)) (t!14399 List!8453)) )
))
(declare-fun arrayNoDuplicates!0 (array!29129 (_ BitVec 32) List!8453) Bool)

(assert (=> b!464401 (= res!277651 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8450))))

(declare-fun b!464402 () Bool)

(declare-fun e!271270 () Bool)

(assert (=> b!464402 (= e!271270 tp_is_empty!12671)))

(declare-fun b!464403 () Bool)

(declare-fun e!271269 () Bool)

(assert (=> b!464403 (= e!271269 (and e!271270 mapRes!20683))))

(declare-fun condMapEmpty!20683 () Bool)

(declare-fun mapDefault!20683 () ValueCell!5992)

