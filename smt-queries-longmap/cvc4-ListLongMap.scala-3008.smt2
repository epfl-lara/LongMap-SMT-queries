; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42370 () Bool)

(assert start!42370)

(declare-fun b_free!11861 () Bool)

(declare-fun b_next!11861 () Bool)

(assert (=> start!42370 (= b_free!11861 (not b_next!11861))))

(declare-fun tp!41613 () Bool)

(declare-fun b_and!20307 () Bool)

(assert (=> start!42370 (= tp!41613 b_and!20307)))

(declare-fun b!472756 () Bool)

(declare-fun e!277259 () Bool)

(declare-fun tp_is_empty!13289 () Bool)

(assert (=> b!472756 (= e!277259 tp_is_empty!13289)))

(declare-fun b!472757 () Bool)

(declare-fun e!277256 () Bool)

(declare-datatypes ((array!30335 0))(
  ( (array!30336 (arr!14588 (Array (_ BitVec 32) (_ BitVec 64))) (size!14940 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30335)

(assert (=> b!472757 (= e!277256 (bvsle #b00000000000000000000000000000000 (size!14940 _keys!1025)))))

(declare-datatypes ((V!18823 0))(
  ( (V!18824 (val!6689 Int)) )
))
(declare-fun minValueBefore!38 () V!18823)

(declare-fun zeroValue!794 () V!18823)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8810 0))(
  ( (tuple2!8811 (_1!4416 (_ BitVec 64)) (_2!4416 V!18823)) )
))
(declare-datatypes ((List!8893 0))(
  ( (Nil!8890) (Cons!8889 (h!9745 tuple2!8810) (t!14861 List!8893)) )
))
(declare-datatypes ((ListLongMap!7723 0))(
  ( (ListLongMap!7724 (toList!3877 List!8893)) )
))
(declare-fun lt!214506 () ListLongMap!7723)

(declare-datatypes ((ValueCell!6301 0))(
  ( (ValueCellFull!6301 (v!8980 V!18823)) (EmptyCell!6301) )
))
(declare-datatypes ((array!30337 0))(
  ( (array!30338 (arr!14589 (Array (_ BitVec 32) ValueCell!6301)) (size!14941 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30337)

(declare-fun getCurrentListMap!2246 (array!30335 array!30337 (_ BitVec 32) (_ BitVec 32) V!18823 V!18823 (_ BitVec 32) Int) ListLongMap!7723)

(assert (=> b!472757 (= lt!214506 (getCurrentListMap!2246 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472758 () Bool)

(declare-fun res!282404 () Bool)

(declare-fun e!277261 () Bool)

(assert (=> b!472758 (=> (not res!282404) (not e!277261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30335 (_ BitVec 32)) Bool)

(assert (=> b!472758 (= res!282404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472759 () Bool)

(declare-fun res!282405 () Bool)

(assert (=> b!472759 (=> (not res!282405) (not e!277261))))

(declare-datatypes ((List!8894 0))(
  ( (Nil!8891) (Cons!8890 (h!9746 (_ BitVec 64)) (t!14862 List!8894)) )
))
(declare-fun arrayNoDuplicates!0 (array!30335 (_ BitVec 32) List!8894) Bool)

(assert (=> b!472759 (= res!282405 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8891))))

(declare-fun b!472760 () Bool)

(declare-fun res!282407 () Bool)

(assert (=> b!472760 (=> (not res!282407) (not e!277261))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!472760 (= res!282407 (and (= (size!14941 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14940 _keys!1025) (size!14941 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472761 () Bool)

(declare-fun e!277258 () Bool)

(assert (=> b!472761 (= e!277258 tp_is_empty!13289)))

(declare-fun b!472762 () Bool)

(assert (=> b!472762 (= e!277261 (not e!277256))))

(declare-fun res!282408 () Bool)

(assert (=> b!472762 (=> res!282408 e!277256)))

(assert (=> b!472762 (= res!282408 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214504 () ListLongMap!7723)

(declare-fun lt!214503 () ListLongMap!7723)

(assert (=> b!472762 (= lt!214504 lt!214503)))

(declare-datatypes ((Unit!13909 0))(
  ( (Unit!13910) )
))
(declare-fun lt!214505 () Unit!13909)

(declare-fun minValueAfter!38 () V!18823)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!218 (array!30335 array!30337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18823 V!18823 V!18823 V!18823 (_ BitVec 32) Int) Unit!13909)

(assert (=> b!472762 (= lt!214505 (lemmaNoChangeToArrayThenSameMapNoExtras!218 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2038 (array!30335 array!30337 (_ BitVec 32) (_ BitVec 32) V!18823 V!18823 (_ BitVec 32) Int) ListLongMap!7723)

(assert (=> b!472762 (= lt!214503 (getCurrentListMapNoExtraKeys!2038 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472762 (= lt!214504 (getCurrentListMapNoExtraKeys!2038 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472763 () Bool)

(declare-fun e!277260 () Bool)

(declare-fun mapRes!21643 () Bool)

(assert (=> b!472763 (= e!277260 (and e!277259 mapRes!21643))))

(declare-fun condMapEmpty!21643 () Bool)

(declare-fun mapDefault!21643 () ValueCell!6301)

