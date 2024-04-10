; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42008 () Bool)

(assert start!42008)

(declare-fun b_free!11581 () Bool)

(declare-fun b_next!11581 () Bool)

(assert (=> start!42008 (= b_free!11581 (not b_next!11581))))

(declare-fun tp!40758 () Bool)

(declare-fun b_and!19979 () Bool)

(assert (=> start!42008 (= tp!40758 b_and!19979)))

(declare-fun mapNonEmpty!21208 () Bool)

(declare-fun mapRes!21208 () Bool)

(declare-fun tp!40759 () Bool)

(declare-fun e!274595 () Bool)

(assert (=> mapNonEmpty!21208 (= mapRes!21208 (and tp!40759 e!274595))))

(declare-datatypes ((V!18451 0))(
  ( (V!18452 (val!6549 Int)) )
))
(declare-datatypes ((ValueCell!6161 0))(
  ( (ValueCellFull!6161 (v!8838 V!18451)) (EmptyCell!6161) )
))
(declare-datatypes ((array!29791 0))(
  ( (array!29792 (arr!14321 (Array (_ BitVec 32) ValueCell!6161)) (size!14673 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29791)

(declare-fun mapKey!21208 () (_ BitVec 32))

(declare-fun mapValue!21208 () ValueCell!6161)

(declare-fun mapRest!21208 () (Array (_ BitVec 32) ValueCell!6161))

(assert (=> mapNonEmpty!21208 (= (arr!14321 _values!833) (store mapRest!21208 mapKey!21208 mapValue!21208))))

(declare-fun b!469026 () Bool)

(declare-fun res!280303 () Bool)

(declare-fun e!274591 () Bool)

(assert (=> b!469026 (=> (not res!280303) (not e!274591))))

(declare-datatypes ((array!29793 0))(
  ( (array!29794 (arr!14322 (Array (_ BitVec 32) (_ BitVec 64))) (size!14674 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29793)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29793 (_ BitVec 32)) Bool)

(assert (=> b!469026 (= res!280303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469027 () Bool)

(declare-fun e!274594 () Bool)

(declare-fun tp_is_empty!13009 () Bool)

(assert (=> b!469027 (= e!274594 tp_is_empty!13009)))

(declare-fun b!469028 () Bool)

(assert (=> b!469028 (= e!274595 tp_is_empty!13009)))

(declare-fun mapIsEmpty!21208 () Bool)

(assert (=> mapIsEmpty!21208 mapRes!21208))

(declare-fun b!469029 () Bool)

(declare-fun e!274590 () Bool)

(assert (=> b!469029 (= e!274591 (not e!274590))))

(declare-fun res!280302 () Bool)

(assert (=> b!469029 (=> res!280302 e!274590)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469029 (= res!280302 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8614 0))(
  ( (tuple2!8615 (_1!4318 (_ BitVec 64)) (_2!4318 V!18451)) )
))
(declare-datatypes ((List!8697 0))(
  ( (Nil!8694) (Cons!8693 (h!9549 tuple2!8614) (t!14655 List!8697)) )
))
(declare-datatypes ((ListLongMap!7527 0))(
  ( (ListLongMap!7528 (toList!3779 List!8697)) )
))
(declare-fun lt!212354 () ListLongMap!7527)

(declare-fun lt!212356 () ListLongMap!7527)

(assert (=> b!469029 (= lt!212354 lt!212356)))

(declare-fun minValueBefore!38 () V!18451)

(declare-fun zeroValue!794 () V!18451)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13713 0))(
  ( (Unit!13714) )
))
(declare-fun lt!212358 () Unit!13713)

(declare-fun minValueAfter!38 () V!18451)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!128 (array!29793 array!29791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18451 V!18451 V!18451 V!18451 (_ BitVec 32) Int) Unit!13713)

(assert (=> b!469029 (= lt!212358 (lemmaNoChangeToArrayThenSameMapNoExtras!128 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1948 (array!29793 array!29791 (_ BitVec 32) (_ BitVec 32) V!18451 V!18451 (_ BitVec 32) Int) ListLongMap!7527)

(assert (=> b!469029 (= lt!212356 (getCurrentListMapNoExtraKeys!1948 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469029 (= lt!212354 (getCurrentListMapNoExtraKeys!1948 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469030 () Bool)

(assert (=> b!469030 (= e!274590 true)))

(declare-fun lt!212359 () tuple2!8614)

(declare-fun +!1689 (ListLongMap!7527 tuple2!8614) ListLongMap!7527)

(assert (=> b!469030 (= (+!1689 lt!212354 lt!212359) (+!1689 (+!1689 lt!212354 (tuple2!8615 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212359))))

(assert (=> b!469030 (= lt!212359 (tuple2!8615 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212355 () Unit!13713)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!102 (ListLongMap!7527 (_ BitVec 64) V!18451 V!18451) Unit!13713)

(assert (=> b!469030 (= lt!212355 (addSameAsAddTwiceSameKeyDiffValues!102 lt!212354 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212357 () ListLongMap!7527)

(declare-fun getCurrentListMap!2203 (array!29793 array!29791 (_ BitVec 32) (_ BitVec 32) V!18451 V!18451 (_ BitVec 32) Int) ListLongMap!7527)

(assert (=> b!469030 (= lt!212357 (getCurrentListMap!2203 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212353 () ListLongMap!7527)

(assert (=> b!469030 (= lt!212353 (getCurrentListMap!2203 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469031 () Bool)

(declare-fun e!274593 () Bool)

(assert (=> b!469031 (= e!274593 (and e!274594 mapRes!21208))))

(declare-fun condMapEmpty!21208 () Bool)

(declare-fun mapDefault!21208 () ValueCell!6161)

