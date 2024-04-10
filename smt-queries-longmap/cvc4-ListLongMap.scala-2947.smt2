; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41906 () Bool)

(assert start!41906)

(declare-fun b_free!11495 () Bool)

(declare-fun b_next!11495 () Bool)

(assert (=> start!41906 (= b_free!11495 (not b_next!11495))))

(declare-fun tp!40498 () Bool)

(declare-fun b_and!19883 () Bool)

(assert (=> start!41906 (= tp!40498 b_and!19883)))

(declare-fun b!467847 () Bool)

(declare-fun e!273726 () Bool)

(declare-fun tp_is_empty!12923 () Bool)

(assert (=> b!467847 (= e!273726 tp_is_empty!12923)))

(declare-fun b!467848 () Bool)

(declare-fun e!273722 () Bool)

(assert (=> b!467848 (= e!273722 true)))

(declare-datatypes ((V!18335 0))(
  ( (V!18336 (val!6506 Int)) )
))
(declare-fun minValueBefore!38 () V!18335)

(declare-fun zeroValue!794 () V!18335)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8542 0))(
  ( (tuple2!8543 (_1!4282 (_ BitVec 64)) (_2!4282 V!18335)) )
))
(declare-datatypes ((List!8629 0))(
  ( (Nil!8626) (Cons!8625 (h!9481 tuple2!8542) (t!14585 List!8629)) )
))
(declare-datatypes ((ListLongMap!7455 0))(
  ( (ListLongMap!7456 (toList!3743 List!8629)) )
))
(declare-fun lt!211538 () ListLongMap!7455)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29623 0))(
  ( (array!29624 (arr!14238 (Array (_ BitVec 32) (_ BitVec 64))) (size!14590 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29623)

(declare-datatypes ((ValueCell!6118 0))(
  ( (ValueCellFull!6118 (v!8795 V!18335)) (EmptyCell!6118) )
))
(declare-datatypes ((array!29625 0))(
  ( (array!29626 (arr!14239 (Array (_ BitVec 32) ValueCell!6118)) (size!14591 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29625)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2172 (array!29623 array!29625 (_ BitVec 32) (_ BitVec 32) V!18335 V!18335 (_ BitVec 32) Int) ListLongMap!7455)

(assert (=> b!467848 (= lt!211538 (getCurrentListMap!2172 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467849 () Bool)

(declare-fun res!279598 () Bool)

(declare-fun e!273723 () Bool)

(assert (=> b!467849 (=> (not res!279598) (not e!273723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29623 (_ BitVec 32)) Bool)

(assert (=> b!467849 (= res!279598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467850 () Bool)

(declare-fun res!279600 () Bool)

(assert (=> b!467850 (=> (not res!279600) (not e!273723))))

(declare-datatypes ((List!8630 0))(
  ( (Nil!8627) (Cons!8626 (h!9482 (_ BitVec 64)) (t!14586 List!8630)) )
))
(declare-fun arrayNoDuplicates!0 (array!29623 (_ BitVec 32) List!8630) Bool)

(assert (=> b!467850 (= res!279600 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8627))))

(declare-fun mapIsEmpty!21076 () Bool)

(declare-fun mapRes!21076 () Bool)

(assert (=> mapIsEmpty!21076 mapRes!21076))

(declare-fun b!467851 () Bool)

(assert (=> b!467851 (= e!273723 (not e!273722))))

(declare-fun res!279597 () Bool)

(assert (=> b!467851 (=> res!279597 e!273722)))

(assert (=> b!467851 (= res!279597 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211537 () ListLongMap!7455)

(declare-fun lt!211536 () ListLongMap!7455)

(assert (=> b!467851 (= lt!211537 lt!211536)))

(declare-datatypes ((Unit!13646 0))(
  ( (Unit!13647) )
))
(declare-fun lt!211539 () Unit!13646)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18335)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!97 (array!29623 array!29625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18335 V!18335 V!18335 V!18335 (_ BitVec 32) Int) Unit!13646)

(assert (=> b!467851 (= lt!211539 (lemmaNoChangeToArrayThenSameMapNoExtras!97 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1917 (array!29623 array!29625 (_ BitVec 32) (_ BitVec 32) V!18335 V!18335 (_ BitVec 32) Int) ListLongMap!7455)

(assert (=> b!467851 (= lt!211536 (getCurrentListMapNoExtraKeys!1917 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467851 (= lt!211537 (getCurrentListMapNoExtraKeys!1917 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467852 () Bool)

(declare-fun e!273725 () Bool)

(assert (=> b!467852 (= e!273725 tp_is_empty!12923)))

(declare-fun res!279601 () Bool)

(assert (=> start!41906 (=> (not res!279601) (not e!273723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41906 (= res!279601 (validMask!0 mask!1365))))

(assert (=> start!41906 e!273723))

(assert (=> start!41906 tp_is_empty!12923))

(assert (=> start!41906 tp!40498))

(assert (=> start!41906 true))

(declare-fun array_inv!10278 (array!29623) Bool)

(assert (=> start!41906 (array_inv!10278 _keys!1025)))

(declare-fun e!273727 () Bool)

(declare-fun array_inv!10279 (array!29625) Bool)

(assert (=> start!41906 (and (array_inv!10279 _values!833) e!273727)))

(declare-fun b!467846 () Bool)

(assert (=> b!467846 (= e!273727 (and e!273726 mapRes!21076))))

(declare-fun condMapEmpty!21076 () Bool)

(declare-fun mapDefault!21076 () ValueCell!6118)

