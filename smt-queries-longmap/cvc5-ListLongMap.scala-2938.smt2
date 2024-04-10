; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41834 () Bool)

(assert start!41834)

(declare-fun b_free!11437 () Bool)

(declare-fun b_next!11437 () Bool)

(assert (=> start!41834 (= b_free!11437 (not b_next!11437))))

(declare-fun tp!40320 () Bool)

(declare-fun b_and!19817 () Bool)

(assert (=> start!41834 (= tp!40320 b_and!19817)))

(declare-fun res!279201 () Bool)

(declare-fun e!273218 () Bool)

(assert (=> start!41834 (=> (not res!279201) (not e!273218))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41834 (= res!279201 (validMask!0 mask!1365))))

(assert (=> start!41834 e!273218))

(declare-fun tp_is_empty!12865 () Bool)

(assert (=> start!41834 tp_is_empty!12865))

(assert (=> start!41834 tp!40320))

(assert (=> start!41834 true))

(declare-datatypes ((array!29511 0))(
  ( (array!29512 (arr!14183 (Array (_ BitVec 32) (_ BitVec 64))) (size!14535 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29511)

(declare-fun array_inv!10238 (array!29511) Bool)

(assert (=> start!41834 (array_inv!10238 _keys!1025)))

(declare-datatypes ((V!18259 0))(
  ( (V!18260 (val!6477 Int)) )
))
(declare-datatypes ((ValueCell!6089 0))(
  ( (ValueCellFull!6089 (v!8766 V!18259)) (EmptyCell!6089) )
))
(declare-datatypes ((array!29513 0))(
  ( (array!29514 (arr!14184 (Array (_ BitVec 32) ValueCell!6089)) (size!14536 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29513)

(declare-fun e!273216 () Bool)

(declare-fun array_inv!10239 (array!29513) Bool)

(assert (=> start!41834 (and (array_inv!10239 _values!833) e!273216)))

(declare-fun b!467135 () Bool)

(declare-fun e!273215 () Bool)

(assert (=> b!467135 (= e!273215 tp_is_empty!12865)))

(declare-fun b!467136 () Bool)

(declare-fun res!279202 () Bool)

(assert (=> b!467136 (=> (not res!279202) (not e!273218))))

(declare-datatypes ((List!8586 0))(
  ( (Nil!8583) (Cons!8582 (h!9438 (_ BitVec 64)) (t!14540 List!8586)) )
))
(declare-fun arrayNoDuplicates!0 (array!29511 (_ BitVec 32) List!8586) Bool)

(assert (=> b!467136 (= res!279202 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8583))))

(declare-fun b!467137 () Bool)

(declare-fun e!273217 () Bool)

(assert (=> b!467137 (= e!273217 tp_is_empty!12865)))

(declare-fun mapNonEmpty!20986 () Bool)

(declare-fun mapRes!20986 () Bool)

(declare-fun tp!40321 () Bool)

(assert (=> mapNonEmpty!20986 (= mapRes!20986 (and tp!40321 e!273215))))

(declare-fun mapKey!20986 () (_ BitVec 32))

(declare-fun mapRest!20986 () (Array (_ BitVec 32) ValueCell!6089))

(declare-fun mapValue!20986 () ValueCell!6089)

(assert (=> mapNonEmpty!20986 (= (arr!14184 _values!833) (store mapRest!20986 mapKey!20986 mapValue!20986))))

(declare-fun mapIsEmpty!20986 () Bool)

(assert (=> mapIsEmpty!20986 mapRes!20986))

(declare-fun b!467138 () Bool)

(assert (=> b!467138 (= e!273218 (not true))))

(declare-datatypes ((tuple2!8498 0))(
  ( (tuple2!8499 (_1!4260 (_ BitVec 64)) (_2!4260 V!18259)) )
))
(declare-datatypes ((List!8587 0))(
  ( (Nil!8584) (Cons!8583 (h!9439 tuple2!8498) (t!14541 List!8587)) )
))
(declare-datatypes ((ListLongMap!7411 0))(
  ( (ListLongMap!7412 (toList!3721 List!8587)) )
))
(declare-fun lt!211220 () ListLongMap!7411)

(declare-fun lt!211218 () ListLongMap!7411)

(assert (=> b!467138 (= lt!211220 lt!211218)))

(declare-fun minValueBefore!38 () V!18259)

(declare-fun zeroValue!794 () V!18259)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18259)

(declare-datatypes ((Unit!13602 0))(
  ( (Unit!13603) )
))
(declare-fun lt!211219 () Unit!13602)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!75 (array!29511 array!29513 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18259 V!18259 V!18259 V!18259 (_ BitVec 32) Int) Unit!13602)

(assert (=> b!467138 (= lt!211219 (lemmaNoChangeToArrayThenSameMapNoExtras!75 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1895 (array!29511 array!29513 (_ BitVec 32) (_ BitVec 32) V!18259 V!18259 (_ BitVec 32) Int) ListLongMap!7411)

(assert (=> b!467138 (= lt!211218 (getCurrentListMapNoExtraKeys!1895 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467138 (= lt!211220 (getCurrentListMapNoExtraKeys!1895 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467139 () Bool)

(declare-fun res!279204 () Bool)

(assert (=> b!467139 (=> (not res!279204) (not e!273218))))

(assert (=> b!467139 (= res!279204 (and (= (size!14536 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14535 _keys!1025) (size!14536 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467140 () Bool)

(declare-fun res!279203 () Bool)

(assert (=> b!467140 (=> (not res!279203) (not e!273218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29511 (_ BitVec 32)) Bool)

(assert (=> b!467140 (= res!279203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467141 () Bool)

(assert (=> b!467141 (= e!273216 (and e!273217 mapRes!20986))))

(declare-fun condMapEmpty!20986 () Bool)

(declare-fun mapDefault!20986 () ValueCell!6089)

