; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41718 () Bool)

(assert start!41718)

(declare-fun b_free!11357 () Bool)

(declare-fun b_next!11357 () Bool)

(assert (=> start!41718 (= b_free!11357 (not b_next!11357))))

(declare-fun tp!40074 () Bool)

(declare-fun b_and!19713 () Bool)

(assert (=> start!41718 (= tp!40074 b_and!19713)))

(declare-fun mapNonEmpty!20860 () Bool)

(declare-fun mapRes!20860 () Bool)

(declare-fun tp!40075 () Bool)

(declare-fun e!272286 () Bool)

(assert (=> mapNonEmpty!20860 (= mapRes!20860 (and tp!40075 e!272286))))

(declare-datatypes ((V!18151 0))(
  ( (V!18152 (val!6437 Int)) )
))
(declare-datatypes ((ValueCell!6049 0))(
  ( (ValueCellFull!6049 (v!8724 V!18151)) (EmptyCell!6049) )
))
(declare-datatypes ((array!29351 0))(
  ( (array!29352 (arr!14105 (Array (_ BitVec 32) ValueCell!6049)) (size!14457 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29351)

(declare-fun mapValue!20860 () ValueCell!6049)

(declare-fun mapRest!20860 () (Array (_ BitVec 32) ValueCell!6049))

(declare-fun mapKey!20860 () (_ BitVec 32))

(assert (=> mapNonEmpty!20860 (= (arr!14105 _values!833) (store mapRest!20860 mapKey!20860 mapValue!20860))))

(declare-fun b!465818 () Bool)

(declare-fun tp_is_empty!12785 () Bool)

(assert (=> b!465818 (= e!272286 tp_is_empty!12785)))

(declare-fun b!465819 () Bool)

(declare-fun res!278448 () Bool)

(declare-fun e!272291 () Bool)

(assert (=> b!465819 (=> (not res!278448) (not e!272291))))

(declare-datatypes ((array!29353 0))(
  ( (array!29354 (arr!14106 (Array (_ BitVec 32) (_ BitVec 64))) (size!14458 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29353)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29353 (_ BitVec 32)) Bool)

(assert (=> b!465819 (= res!278448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465820 () Bool)

(declare-fun res!278452 () Bool)

(assert (=> b!465820 (=> (not res!278452) (not e!272291))))

(declare-datatypes ((List!8526 0))(
  ( (Nil!8523) (Cons!8522 (h!9378 (_ BitVec 64)) (t!14476 List!8526)) )
))
(declare-fun arrayNoDuplicates!0 (array!29353 (_ BitVec 32) List!8526) Bool)

(assert (=> b!465820 (= res!278452 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8523))))

(declare-fun b!465821 () Bool)

(declare-fun e!272289 () Bool)

(declare-fun e!272288 () Bool)

(assert (=> b!465821 (= e!272289 (and e!272288 mapRes!20860))))

(declare-fun condMapEmpty!20860 () Bool)

(declare-fun mapDefault!20860 () ValueCell!6049)

