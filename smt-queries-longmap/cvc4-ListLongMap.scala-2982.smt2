; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42186 () Bool)

(assert start!42186)

(declare-fun b_free!11705 () Bool)

(declare-fun b_next!11705 () Bool)

(assert (=> start!42186 (= b_free!11705 (not b_next!11705))))

(declare-fun tp!41140 () Bool)

(declare-fun b_and!20135 () Bool)

(assert (=> start!42186 (= tp!41140 b_and!20135)))

(declare-fun res!281327 () Bool)

(declare-fun e!275896 () Bool)

(assert (=> start!42186 (=> (not res!281327) (not e!275896))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42186 (= res!281327 (validMask!0 mask!1365))))

(assert (=> start!42186 e!275896))

(declare-fun tp_is_empty!13133 () Bool)

(assert (=> start!42186 tp_is_empty!13133))

(assert (=> start!42186 tp!41140))

(assert (=> start!42186 true))

(declare-datatypes ((array!30035 0))(
  ( (array!30036 (arr!14440 (Array (_ BitVec 32) (_ BitVec 64))) (size!14792 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30035)

(declare-fun array_inv!10416 (array!30035) Bool)

(assert (=> start!42186 (array_inv!10416 _keys!1025)))

(declare-datatypes ((V!18615 0))(
  ( (V!18616 (val!6611 Int)) )
))
(declare-datatypes ((ValueCell!6223 0))(
  ( (ValueCellFull!6223 (v!8902 V!18615)) (EmptyCell!6223) )
))
(declare-datatypes ((array!30037 0))(
  ( (array!30038 (arr!14441 (Array (_ BitVec 32) ValueCell!6223)) (size!14793 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30037)

(declare-fun e!275898 () Bool)

(declare-fun array_inv!10417 (array!30037) Bool)

(assert (=> start!42186 (and (array_inv!10417 _values!833) e!275898)))

(declare-fun mapIsEmpty!21403 () Bool)

(declare-fun mapRes!21403 () Bool)

(assert (=> mapIsEmpty!21403 mapRes!21403))

(declare-fun b!470868 () Bool)

(declare-fun res!281328 () Bool)

(assert (=> b!470868 (=> (not res!281328) (not e!275896))))

(declare-datatypes ((List!8786 0))(
  ( (Nil!8783) (Cons!8782 (h!9638 (_ BitVec 64)) (t!14750 List!8786)) )
))
(declare-fun arrayNoDuplicates!0 (array!30035 (_ BitVec 32) List!8786) Bool)

(assert (=> b!470868 (= res!281328 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8783))))

(declare-fun b!470869 () Bool)

(declare-fun res!281329 () Bool)

(assert (=> b!470869 (=> (not res!281329) (not e!275896))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470869 (= res!281329 (and (= (size!14793 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14792 _keys!1025) (size!14793 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470870 () Bool)

(assert (=> b!470870 (= e!275896 (not true))))

(declare-datatypes ((tuple2!8706 0))(
  ( (tuple2!8707 (_1!4364 (_ BitVec 64)) (_2!4364 V!18615)) )
))
(declare-datatypes ((List!8787 0))(
  ( (Nil!8784) (Cons!8783 (h!9639 tuple2!8706) (t!14751 List!8787)) )
))
(declare-datatypes ((ListLongMap!7619 0))(
  ( (ListLongMap!7620 (toList!3825 List!8787)) )
))
(declare-fun lt!213641 () ListLongMap!7619)

(declare-fun lt!213642 () ListLongMap!7619)

(assert (=> b!470870 (= lt!213641 lt!213642)))

(declare-fun minValueBefore!38 () V!18615)

(declare-fun zeroValue!794 () V!18615)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13809 0))(
  ( (Unit!13810) )
))
(declare-fun lt!213643 () Unit!13809)

(declare-fun minValueAfter!38 () V!18615)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!168 (array!30035 array!30037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18615 V!18615 V!18615 V!18615 (_ BitVec 32) Int) Unit!13809)

(assert (=> b!470870 (= lt!213643 (lemmaNoChangeToArrayThenSameMapNoExtras!168 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1988 (array!30035 array!30037 (_ BitVec 32) (_ BitVec 32) V!18615 V!18615 (_ BitVec 32) Int) ListLongMap!7619)

(assert (=> b!470870 (= lt!213642 (getCurrentListMapNoExtraKeys!1988 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470870 (= lt!213641 (getCurrentListMapNoExtraKeys!1988 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470871 () Bool)

(declare-fun e!275897 () Bool)

(assert (=> b!470871 (= e!275897 tp_is_empty!13133)))

(declare-fun b!470872 () Bool)

(declare-fun res!281326 () Bool)

(assert (=> b!470872 (=> (not res!281326) (not e!275896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30035 (_ BitVec 32)) Bool)

(assert (=> b!470872 (= res!281326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21403 () Bool)

(declare-fun tp!41139 () Bool)

(declare-fun e!275900 () Bool)

(assert (=> mapNonEmpty!21403 (= mapRes!21403 (and tp!41139 e!275900))))

(declare-fun mapKey!21403 () (_ BitVec 32))

(declare-fun mapValue!21403 () ValueCell!6223)

(declare-fun mapRest!21403 () (Array (_ BitVec 32) ValueCell!6223))

(assert (=> mapNonEmpty!21403 (= (arr!14441 _values!833) (store mapRest!21403 mapKey!21403 mapValue!21403))))

(declare-fun b!470873 () Bool)

(assert (=> b!470873 (= e!275898 (and e!275897 mapRes!21403))))

(declare-fun condMapEmpty!21403 () Bool)

(declare-fun mapDefault!21403 () ValueCell!6223)

