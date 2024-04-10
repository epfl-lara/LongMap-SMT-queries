; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41862 () Bool)

(assert start!41862)

(declare-fun b_free!11465 () Bool)

(declare-fun b_next!11465 () Bool)

(assert (=> start!41862 (= b_free!11465 (not b_next!11465))))

(declare-fun tp!40405 () Bool)

(declare-fun b_and!19845 () Bool)

(assert (=> start!41862 (= tp!40405 b_and!19845)))

(declare-fun b!467429 () Bool)

(declare-fun e!273425 () Bool)

(assert (=> b!467429 (= e!273425 (not true))))

(declare-datatypes ((V!18295 0))(
  ( (V!18296 (val!6491 Int)) )
))
(declare-datatypes ((tuple2!8518 0))(
  ( (tuple2!8519 (_1!4270 (_ BitVec 64)) (_2!4270 V!18295)) )
))
(declare-datatypes ((List!8605 0))(
  ( (Nil!8602) (Cons!8601 (h!9457 tuple2!8518) (t!14559 List!8605)) )
))
(declare-datatypes ((ListLongMap!7431 0))(
  ( (ListLongMap!7432 (toList!3731 List!8605)) )
))
(declare-fun lt!211344 () ListLongMap!7431)

(declare-fun lt!211345 () ListLongMap!7431)

(assert (=> b!467429 (= lt!211344 lt!211345)))

(declare-fun minValueBefore!38 () V!18295)

(declare-fun zeroValue!794 () V!18295)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29563 0))(
  ( (array!29564 (arr!14209 (Array (_ BitVec 32) (_ BitVec 64))) (size!14561 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29563)

(declare-datatypes ((ValueCell!6103 0))(
  ( (ValueCellFull!6103 (v!8780 V!18295)) (EmptyCell!6103) )
))
(declare-datatypes ((array!29565 0))(
  ( (array!29566 (arr!14210 (Array (_ BitVec 32) ValueCell!6103)) (size!14562 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29565)

(declare-fun minValueAfter!38 () V!18295)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13622 0))(
  ( (Unit!13623) )
))
(declare-fun lt!211346 () Unit!13622)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!85 (array!29563 array!29565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18295 V!18295 V!18295 V!18295 (_ BitVec 32) Int) Unit!13622)

(assert (=> b!467429 (= lt!211346 (lemmaNoChangeToArrayThenSameMapNoExtras!85 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1905 (array!29563 array!29565 (_ BitVec 32) (_ BitVec 32) V!18295 V!18295 (_ BitVec 32) Int) ListLongMap!7431)

(assert (=> b!467429 (= lt!211345 (getCurrentListMapNoExtraKeys!1905 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467429 (= lt!211344 (getCurrentListMapNoExtraKeys!1905 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21028 () Bool)

(declare-fun mapRes!21028 () Bool)

(assert (=> mapIsEmpty!21028 mapRes!21028))

(declare-fun b!467430 () Bool)

(declare-fun res!279372 () Bool)

(assert (=> b!467430 (=> (not res!279372) (not e!273425))))

(declare-datatypes ((List!8606 0))(
  ( (Nil!8603) (Cons!8602 (h!9458 (_ BitVec 64)) (t!14560 List!8606)) )
))
(declare-fun arrayNoDuplicates!0 (array!29563 (_ BitVec 32) List!8606) Bool)

(assert (=> b!467430 (= res!279372 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8603))))

(declare-fun b!467431 () Bool)

(declare-fun e!273428 () Bool)

(declare-fun tp_is_empty!12893 () Bool)

(assert (=> b!467431 (= e!273428 tp_is_empty!12893)))

(declare-fun b!467432 () Bool)

(declare-fun e!273426 () Bool)

(assert (=> b!467432 (= e!273426 tp_is_empty!12893)))

(declare-fun b!467433 () Bool)

(declare-fun res!279371 () Bool)

(assert (=> b!467433 (=> (not res!279371) (not e!273425))))

(assert (=> b!467433 (= res!279371 (and (= (size!14562 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14561 _keys!1025) (size!14562 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467434 () Bool)

(declare-fun res!279370 () Bool)

(assert (=> b!467434 (=> (not res!279370) (not e!273425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29563 (_ BitVec 32)) Bool)

(assert (=> b!467434 (= res!279370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467435 () Bool)

(declare-fun e!273429 () Bool)

(assert (=> b!467435 (= e!273429 (and e!273426 mapRes!21028))))

(declare-fun condMapEmpty!21028 () Bool)

(declare-fun mapDefault!21028 () ValueCell!6103)

