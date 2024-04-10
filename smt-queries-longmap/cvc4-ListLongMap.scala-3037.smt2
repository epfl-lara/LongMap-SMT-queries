; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42600 () Bool)

(assert start!42600)

(declare-fun b_free!12035 () Bool)

(declare-fun b_next!12035 () Bool)

(assert (=> start!42600 (= b_free!12035 (not b_next!12035))))

(declare-fun tp!42144 () Bool)

(declare-fun b_and!20515 () Bool)

(assert (=> start!42600 (= tp!42144 b_and!20515)))

(declare-fun b!475256 () Bool)

(declare-fun res!283829 () Bool)

(declare-fun e!279044 () Bool)

(assert (=> b!475256 (=> (not res!283829) (not e!279044))))

(declare-datatypes ((array!30663 0))(
  ( (array!30664 (arr!14749 (Array (_ BitVec 32) (_ BitVec 64))) (size!15101 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30663)

(declare-datatypes ((List!9013 0))(
  ( (Nil!9010) (Cons!9009 (h!9865 (_ BitVec 64)) (t!14987 List!9013)) )
))
(declare-fun arrayNoDuplicates!0 (array!30663 (_ BitVec 32) List!9013) Bool)

(assert (=> b!475256 (= res!283829 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9010))))

(declare-fun res!283830 () Bool)

(assert (=> start!42600 (=> (not res!283830) (not e!279044))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42600 (= res!283830 (validMask!0 mask!1365))))

(assert (=> start!42600 e!279044))

(declare-fun tp_is_empty!13463 () Bool)

(assert (=> start!42600 tp_is_empty!13463))

(assert (=> start!42600 tp!42144))

(assert (=> start!42600 true))

(declare-fun array_inv!10644 (array!30663) Bool)

(assert (=> start!42600 (array_inv!10644 _keys!1025)))

(declare-datatypes ((V!19055 0))(
  ( (V!19056 (val!6776 Int)) )
))
(declare-datatypes ((ValueCell!6388 0))(
  ( (ValueCellFull!6388 (v!9069 V!19055)) (EmptyCell!6388) )
))
(declare-datatypes ((array!30665 0))(
  ( (array!30666 (arr!14750 (Array (_ BitVec 32) ValueCell!6388)) (size!15102 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30665)

(declare-fun e!279048 () Bool)

(declare-fun array_inv!10645 (array!30665) Bool)

(assert (=> start!42600 (and (array_inv!10645 _values!833) e!279048)))

(declare-fun mapNonEmpty!21913 () Bool)

(declare-fun mapRes!21913 () Bool)

(declare-fun tp!42145 () Bool)

(declare-fun e!279046 () Bool)

(assert (=> mapNonEmpty!21913 (= mapRes!21913 (and tp!42145 e!279046))))

(declare-fun mapRest!21913 () (Array (_ BitVec 32) ValueCell!6388))

(declare-fun mapKey!21913 () (_ BitVec 32))

(declare-fun mapValue!21913 () ValueCell!6388)

(assert (=> mapNonEmpty!21913 (= (arr!14750 _values!833) (store mapRest!21913 mapKey!21913 mapValue!21913))))

(declare-fun b!475257 () Bool)

(assert (=> b!475257 (= e!279044 false)))

(declare-datatypes ((tuple2!8934 0))(
  ( (tuple2!8935 (_1!4478 (_ BitVec 64)) (_2!4478 V!19055)) )
))
(declare-datatypes ((List!9014 0))(
  ( (Nil!9011) (Cons!9010 (h!9866 tuple2!8934) (t!14988 List!9014)) )
))
(declare-datatypes ((ListLongMap!7847 0))(
  ( (ListLongMap!7848 (toList!3939 List!9014)) )
))
(declare-fun lt!216424 () ListLongMap!7847)

(declare-fun zeroValue!794 () V!19055)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!19055)

(declare-fun getCurrentListMapNoExtraKeys!2096 (array!30663 array!30665 (_ BitVec 32) (_ BitVec 32) V!19055 V!19055 (_ BitVec 32) Int) ListLongMap!7847)

(assert (=> b!475257 (= lt!216424 (getCurrentListMapNoExtraKeys!2096 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19055)

(declare-fun lt!216425 () ListLongMap!7847)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!475257 (= lt!216425 (getCurrentListMapNoExtraKeys!2096 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475258 () Bool)

(declare-fun res!283828 () Bool)

(assert (=> b!475258 (=> (not res!283828) (not e!279044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30663 (_ BitVec 32)) Bool)

(assert (=> b!475258 (= res!283828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21913 () Bool)

(assert (=> mapIsEmpty!21913 mapRes!21913))

(declare-fun b!475259 () Bool)

(declare-fun e!279047 () Bool)

(assert (=> b!475259 (= e!279048 (and e!279047 mapRes!21913))))

(declare-fun condMapEmpty!21913 () Bool)

(declare-fun mapDefault!21913 () ValueCell!6388)

