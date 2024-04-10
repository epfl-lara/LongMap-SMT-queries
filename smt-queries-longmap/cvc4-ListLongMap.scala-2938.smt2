; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41838 () Bool)

(assert start!41838)

(declare-fun b_free!11441 () Bool)

(declare-fun b_next!11441 () Bool)

(assert (=> start!41838 (= b_free!11441 (not b_next!11441))))

(declare-fun tp!40333 () Bool)

(declare-fun b_and!19821 () Bool)

(assert (=> start!41838 (= tp!40333 b_and!19821)))

(declare-fun res!279225 () Bool)

(declare-fun e!273248 () Bool)

(assert (=> start!41838 (=> (not res!279225) (not e!273248))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41838 (= res!279225 (validMask!0 mask!1365))))

(assert (=> start!41838 e!273248))

(declare-fun tp_is_empty!12869 () Bool)

(assert (=> start!41838 tp_is_empty!12869))

(assert (=> start!41838 tp!40333))

(assert (=> start!41838 true))

(declare-datatypes ((array!29519 0))(
  ( (array!29520 (arr!14187 (Array (_ BitVec 32) (_ BitVec 64))) (size!14539 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29519)

(declare-fun array_inv!10242 (array!29519) Bool)

(assert (=> start!41838 (array_inv!10242 _keys!1025)))

(declare-datatypes ((V!18263 0))(
  ( (V!18264 (val!6479 Int)) )
))
(declare-datatypes ((ValueCell!6091 0))(
  ( (ValueCellFull!6091 (v!8768 V!18263)) (EmptyCell!6091) )
))
(declare-datatypes ((array!29521 0))(
  ( (array!29522 (arr!14188 (Array (_ BitVec 32) ValueCell!6091)) (size!14540 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29521)

(declare-fun e!273247 () Bool)

(declare-fun array_inv!10243 (array!29521) Bool)

(assert (=> start!41838 (and (array_inv!10243 _values!833) e!273247)))

(declare-fun b!467177 () Bool)

(assert (=> b!467177 (= e!273248 (not true))))

(declare-datatypes ((tuple2!8502 0))(
  ( (tuple2!8503 (_1!4262 (_ BitVec 64)) (_2!4262 V!18263)) )
))
(declare-datatypes ((List!8590 0))(
  ( (Nil!8587) (Cons!8586 (h!9442 tuple2!8502) (t!14544 List!8590)) )
))
(declare-datatypes ((ListLongMap!7415 0))(
  ( (ListLongMap!7416 (toList!3723 List!8590)) )
))
(declare-fun lt!211238 () ListLongMap!7415)

(declare-fun lt!211236 () ListLongMap!7415)

(assert (=> b!467177 (= lt!211238 lt!211236)))

(declare-fun minValueBefore!38 () V!18263)

(declare-fun zeroValue!794 () V!18263)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13606 0))(
  ( (Unit!13607) )
))
(declare-fun lt!211237 () Unit!13606)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18263)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!77 (array!29519 array!29521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18263 V!18263 V!18263 V!18263 (_ BitVec 32) Int) Unit!13606)

(assert (=> b!467177 (= lt!211237 (lemmaNoChangeToArrayThenSameMapNoExtras!77 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1897 (array!29519 array!29521 (_ BitVec 32) (_ BitVec 32) V!18263 V!18263 (_ BitVec 32) Int) ListLongMap!7415)

(assert (=> b!467177 (= lt!211236 (getCurrentListMapNoExtraKeys!1897 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467177 (= lt!211238 (getCurrentListMapNoExtraKeys!1897 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467178 () Bool)

(declare-fun res!279228 () Bool)

(assert (=> b!467178 (=> (not res!279228) (not e!273248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29519 (_ BitVec 32)) Bool)

(assert (=> b!467178 (= res!279228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467179 () Bool)

(declare-fun e!273249 () Bool)

(assert (=> b!467179 (= e!273249 tp_is_empty!12869)))

(declare-fun b!467180 () Bool)

(declare-fun res!279227 () Bool)

(assert (=> b!467180 (=> (not res!279227) (not e!273248))))

(assert (=> b!467180 (= res!279227 (and (= (size!14540 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14539 _keys!1025) (size!14540 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467181 () Bool)

(declare-fun res!279226 () Bool)

(assert (=> b!467181 (=> (not res!279226) (not e!273248))))

(declare-datatypes ((List!8591 0))(
  ( (Nil!8588) (Cons!8587 (h!9443 (_ BitVec 64)) (t!14545 List!8591)) )
))
(declare-fun arrayNoDuplicates!0 (array!29519 (_ BitVec 32) List!8591) Bool)

(assert (=> b!467181 (= res!279226 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8588))))

(declare-fun mapNonEmpty!20992 () Bool)

(declare-fun mapRes!20992 () Bool)

(declare-fun tp!40332 () Bool)

(declare-fun e!273245 () Bool)

(assert (=> mapNonEmpty!20992 (= mapRes!20992 (and tp!40332 e!273245))))

(declare-fun mapValue!20992 () ValueCell!6091)

(declare-fun mapRest!20992 () (Array (_ BitVec 32) ValueCell!6091))

(declare-fun mapKey!20992 () (_ BitVec 32))

(assert (=> mapNonEmpty!20992 (= (arr!14188 _values!833) (store mapRest!20992 mapKey!20992 mapValue!20992))))

(declare-fun b!467182 () Bool)

(assert (=> b!467182 (= e!273245 tp_is_empty!12869)))

(declare-fun b!467183 () Bool)

(assert (=> b!467183 (= e!273247 (and e!273249 mapRes!20992))))

(declare-fun condMapEmpty!20992 () Bool)

(declare-fun mapDefault!20992 () ValueCell!6091)

