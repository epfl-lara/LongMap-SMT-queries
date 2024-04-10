; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41708 () Bool)

(assert start!41708)

(declare-fun b_free!11347 () Bool)

(declare-fun b_next!11347 () Bool)

(assert (=> start!41708 (= b_free!11347 (not b_next!11347))))

(declare-fun tp!40044 () Bool)

(declare-fun b_and!19703 () Bool)

(assert (=> start!41708 (= tp!40044 b_and!19703)))

(declare-fun res!278377 () Bool)

(declare-fun e!272197 () Bool)

(assert (=> start!41708 (=> (not res!278377) (not e!272197))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41708 (= res!278377 (validMask!0 mask!1365))))

(assert (=> start!41708 e!272197))

(declare-fun tp_is_empty!12775 () Bool)

(assert (=> start!41708 tp_is_empty!12775))

(assert (=> start!41708 tp!40044))

(assert (=> start!41708 true))

(declare-datatypes ((array!29331 0))(
  ( (array!29332 (arr!14095 (Array (_ BitVec 32) (_ BitVec 64))) (size!14447 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29331)

(declare-fun array_inv!10182 (array!29331) Bool)

(assert (=> start!41708 (array_inv!10182 _keys!1025)))

(declare-datatypes ((V!18139 0))(
  ( (V!18140 (val!6432 Int)) )
))
(declare-datatypes ((ValueCell!6044 0))(
  ( (ValueCellFull!6044 (v!8719 V!18139)) (EmptyCell!6044) )
))
(declare-datatypes ((array!29333 0))(
  ( (array!29334 (arr!14096 (Array (_ BitVec 32) ValueCell!6044)) (size!14448 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29333)

(declare-fun e!272200 () Bool)

(declare-fun array_inv!10183 (array!29333) Bool)

(assert (=> start!41708 (and (array_inv!10183 _values!833) e!272200)))

(declare-fun b!465698 () Bool)

(declare-fun res!278375 () Bool)

(assert (=> b!465698 (=> (not res!278375) (not e!272197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29331 (_ BitVec 32)) Bool)

(assert (=> b!465698 (= res!278375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465699 () Bool)

(declare-fun e!272199 () Bool)

(assert (=> b!465699 (= e!272197 (not e!272199))))

(declare-fun res!278376 () Bool)

(assert (=> b!465699 (=> res!278376 e!272199)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465699 (= res!278376 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8428 0))(
  ( (tuple2!8429 (_1!4225 (_ BitVec 64)) (_2!4225 V!18139)) )
))
(declare-datatypes ((List!8520 0))(
  ( (Nil!8517) (Cons!8516 (h!9372 tuple2!8428) (t!14470 List!8520)) )
))
(declare-datatypes ((ListLongMap!7341 0))(
  ( (ListLongMap!7342 (toList!3686 List!8520)) )
))
(declare-fun lt!210323 () ListLongMap!7341)

(declare-fun lt!210321 () ListLongMap!7341)

(assert (=> b!465699 (= lt!210323 lt!210321)))

(declare-fun minValueBefore!38 () V!18139)

(declare-fun zeroValue!794 () V!18139)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13540 0))(
  ( (Unit!13541) )
))
(declare-fun lt!210322 () Unit!13540)

(declare-fun minValueAfter!38 () V!18139)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!46 (array!29331 array!29333 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18139 V!18139 V!18139 V!18139 (_ BitVec 32) Int) Unit!13540)

(assert (=> b!465699 (= lt!210322 (lemmaNoChangeToArrayThenSameMapNoExtras!46 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1866 (array!29331 array!29333 (_ BitVec 32) (_ BitVec 32) V!18139 V!18139 (_ BitVec 32) Int) ListLongMap!7341)

(assert (=> b!465699 (= lt!210321 (getCurrentListMapNoExtraKeys!1866 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465699 (= lt!210323 (getCurrentListMapNoExtraKeys!1866 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465700 () Bool)

(declare-fun e!272201 () Bool)

(declare-fun mapRes!20845 () Bool)

(assert (=> b!465700 (= e!272200 (and e!272201 mapRes!20845))))

(declare-fun condMapEmpty!20845 () Bool)

(declare-fun mapDefault!20845 () ValueCell!6044)

