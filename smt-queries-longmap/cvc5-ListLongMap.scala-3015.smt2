; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42424 () Bool)

(assert start!42424)

(declare-fun b_free!11899 () Bool)

(declare-fun b_next!11899 () Bool)

(assert (=> start!42424 (= b_free!11899 (not b_next!11899))))

(declare-fun tp!41730 () Bool)

(declare-fun b_and!20355 () Bool)

(assert (=> start!42424 (= tp!41730 b_and!20355)))

(declare-fun b!473360 () Bool)

(declare-fun e!277695 () Bool)

(declare-fun e!277693 () Bool)

(assert (=> b!473360 (= e!277695 (not e!277693))))

(declare-fun res!282750 () Bool)

(assert (=> b!473360 (=> res!282750 e!277693)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473360 (= res!282750 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18875 0))(
  ( (V!18876 (val!6708 Int)) )
))
(declare-datatypes ((tuple2!8838 0))(
  ( (tuple2!8839 (_1!4430 (_ BitVec 64)) (_2!4430 V!18875)) )
))
(declare-datatypes ((List!8920 0))(
  ( (Nil!8917) (Cons!8916 (h!9772 tuple2!8838) (t!14890 List!8920)) )
))
(declare-datatypes ((ListLongMap!7751 0))(
  ( (ListLongMap!7752 (toList!3891 List!8920)) )
))
(declare-fun lt!215068 () ListLongMap!7751)

(declare-fun lt!215063 () ListLongMap!7751)

(assert (=> b!473360 (= lt!215068 lt!215063)))

(declare-fun minValueBefore!38 () V!18875)

(declare-fun zeroValue!794 () V!18875)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13938 0))(
  ( (Unit!13939) )
))
(declare-fun lt!215061 () Unit!13938)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30411 0))(
  ( (array!30412 (arr!14625 (Array (_ BitVec 32) (_ BitVec 64))) (size!14977 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30411)

(declare-datatypes ((ValueCell!6320 0))(
  ( (ValueCellFull!6320 (v!8999 V!18875)) (EmptyCell!6320) )
))
(declare-datatypes ((array!30413 0))(
  ( (array!30414 (arr!14626 (Array (_ BitVec 32) ValueCell!6320)) (size!14978 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30413)

(declare-fun minValueAfter!38 () V!18875)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!231 (array!30411 array!30413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18875 V!18875 V!18875 V!18875 (_ BitVec 32) Int) Unit!13938)

(assert (=> b!473360 (= lt!215061 (lemmaNoChangeToArrayThenSameMapNoExtras!231 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2051 (array!30411 array!30413 (_ BitVec 32) (_ BitVec 32) V!18875 V!18875 (_ BitVec 32) Int) ListLongMap!7751)

(assert (=> b!473360 (= lt!215063 (getCurrentListMapNoExtraKeys!2051 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473360 (= lt!215068 (getCurrentListMapNoExtraKeys!2051 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473361 () Bool)

(declare-fun e!277697 () Bool)

(declare-fun tp_is_empty!13327 () Bool)

(assert (=> b!473361 (= e!277697 tp_is_empty!13327)))

(declare-fun b!473363 () Bool)

(declare-fun res!282748 () Bool)

(assert (=> b!473363 (=> (not res!282748) (not e!277695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30411 (_ BitVec 32)) Bool)

(assert (=> b!473363 (= res!282748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473364 () Bool)

(declare-fun res!282747 () Bool)

(assert (=> b!473364 (=> (not res!282747) (not e!277695))))

(declare-datatypes ((List!8921 0))(
  ( (Nil!8918) (Cons!8917 (h!9773 (_ BitVec 64)) (t!14891 List!8921)) )
))
(declare-fun arrayNoDuplicates!0 (array!30411 (_ BitVec 32) List!8921) Bool)

(assert (=> b!473364 (= res!282747 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8918))))

(declare-fun mapNonEmpty!21703 () Bool)

(declare-fun mapRes!21703 () Bool)

(declare-fun tp!41731 () Bool)

(declare-fun e!277694 () Bool)

(assert (=> mapNonEmpty!21703 (= mapRes!21703 (and tp!41731 e!277694))))

(declare-fun mapValue!21703 () ValueCell!6320)

(declare-fun mapRest!21703 () (Array (_ BitVec 32) ValueCell!6320))

(declare-fun mapKey!21703 () (_ BitVec 32))

(assert (=> mapNonEmpty!21703 (= (arr!14626 _values!833) (store mapRest!21703 mapKey!21703 mapValue!21703))))

(declare-fun b!473365 () Bool)

(declare-fun e!277692 () Bool)

(assert (=> b!473365 (= e!277692 (and e!277697 mapRes!21703))))

(declare-fun condMapEmpty!21703 () Bool)

(declare-fun mapDefault!21703 () ValueCell!6320)

