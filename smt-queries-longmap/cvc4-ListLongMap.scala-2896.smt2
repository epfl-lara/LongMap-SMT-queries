; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41522 () Bool)

(assert start!41522)

(declare-fun b_free!11189 () Bool)

(declare-fun b_next!11189 () Bool)

(assert (=> start!41522 (= b_free!11189 (not b_next!11189))))

(declare-fun tp!39565 () Bool)

(declare-fun b_and!19529 () Bool)

(assert (=> start!41522 (= tp!39565 b_and!19529)))

(declare-fun b!463832 () Bool)

(declare-fun e!270867 () Bool)

(declare-fun tp_is_empty!12617 () Bool)

(assert (=> b!463832 (= e!270867 tp_is_empty!12617)))

(declare-fun b!463833 () Bool)

(declare-fun e!270866 () Bool)

(assert (=> b!463833 (= e!270866 false)))

(declare-datatypes ((V!17927 0))(
  ( (V!17928 (val!6353 Int)) )
))
(declare-fun zeroValue!794 () V!17927)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8322 0))(
  ( (tuple2!8323 (_1!4172 (_ BitVec 64)) (_2!4172 V!17927)) )
))
(declare-datatypes ((List!8416 0))(
  ( (Nil!8413) (Cons!8412 (h!9268 tuple2!8322) (t!14362 List!8416)) )
))
(declare-datatypes ((ListLongMap!7235 0))(
  ( (ListLongMap!7236 (toList!3633 List!8416)) )
))
(declare-fun lt!209491 () ListLongMap!7235)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29023 0))(
  ( (array!29024 (arr!13943 (Array (_ BitVec 32) (_ BitVec 64))) (size!14295 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29023)

(declare-datatypes ((ValueCell!5965 0))(
  ( (ValueCellFull!5965 (v!8640 V!17927)) (EmptyCell!5965) )
))
(declare-datatypes ((array!29025 0))(
  ( (array!29026 (arr!13944 (Array (_ BitVec 32) ValueCell!5965)) (size!14296 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29025)

(declare-fun minValueAfter!38 () V!17927)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1813 (array!29023 array!29025 (_ BitVec 32) (_ BitVec 32) V!17927 V!17927 (_ BitVec 32) Int) ListLongMap!7235)

(assert (=> b!463833 (= lt!209491 (getCurrentListMapNoExtraKeys!1813 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17927)

(declare-fun lt!209492 () ListLongMap!7235)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!463833 (= lt!209492 (getCurrentListMapNoExtraKeys!1813 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463834 () Bool)

(declare-fun res!277326 () Bool)

(assert (=> b!463834 (=> (not res!277326) (not e!270866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29023 (_ BitVec 32)) Bool)

(assert (=> b!463834 (= res!277326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20602 () Bool)

(declare-fun mapRes!20602 () Bool)

(assert (=> mapIsEmpty!20602 mapRes!20602))

(declare-fun b!463835 () Bool)

(declare-fun res!277325 () Bool)

(assert (=> b!463835 (=> (not res!277325) (not e!270866))))

(declare-datatypes ((List!8417 0))(
  ( (Nil!8414) (Cons!8413 (h!9269 (_ BitVec 64)) (t!14363 List!8417)) )
))
(declare-fun arrayNoDuplicates!0 (array!29023 (_ BitVec 32) List!8417) Bool)

(assert (=> b!463835 (= res!277325 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8414))))

(declare-fun mapNonEmpty!20602 () Bool)

(declare-fun tp!39564 () Bool)

(assert (=> mapNonEmpty!20602 (= mapRes!20602 (and tp!39564 e!270867))))

(declare-fun mapKey!20602 () (_ BitVec 32))

(declare-fun mapRest!20602 () (Array (_ BitVec 32) ValueCell!5965))

(declare-fun mapValue!20602 () ValueCell!5965)

(assert (=> mapNonEmpty!20602 (= (arr!13944 _values!833) (store mapRest!20602 mapKey!20602 mapValue!20602))))

(declare-fun b!463836 () Bool)

(declare-fun e!270864 () Bool)

(declare-fun e!270865 () Bool)

(assert (=> b!463836 (= e!270864 (and e!270865 mapRes!20602))))

(declare-fun condMapEmpty!20602 () Bool)

(declare-fun mapDefault!20602 () ValueCell!5965)

