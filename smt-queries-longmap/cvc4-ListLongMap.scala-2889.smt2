; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41468 () Bool)

(assert start!41468)

(declare-fun b_free!11147 () Bool)

(declare-fun b_next!11147 () Bool)

(assert (=> start!41468 (= b_free!11147 (not b_next!11147))))

(declare-fun tp!39436 () Bool)

(declare-fun b_and!19483 () Bool)

(assert (=> start!41468 (= tp!39436 b_and!19483)))

(declare-fun b!463317 () Bool)

(declare-fun e!270503 () Bool)

(declare-datatypes ((array!28945 0))(
  ( (array!28946 (arr!13905 (Array (_ BitVec 32) (_ BitVec 64))) (size!14257 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28945)

(assert (=> b!463317 (= e!270503 (bvsgt #b00000000000000000000000000000000 (size!14257 _keys!1025)))))

(declare-datatypes ((V!17871 0))(
  ( (V!17872 (val!6332 Int)) )
))
(declare-fun minValueBefore!38 () V!17871)

(declare-fun zeroValue!794 () V!17871)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8294 0))(
  ( (tuple2!8295 (_1!4158 (_ BitVec 64)) (_2!4158 V!17871)) )
))
(declare-datatypes ((List!8387 0))(
  ( (Nil!8384) (Cons!8383 (h!9239 tuple2!8294) (t!14331 List!8387)) )
))
(declare-datatypes ((ListLongMap!7207 0))(
  ( (ListLongMap!7208 (toList!3619 List!8387)) )
))
(declare-fun lt!209336 () ListLongMap!7207)

(declare-datatypes ((ValueCell!5944 0))(
  ( (ValueCellFull!5944 (v!8619 V!17871)) (EmptyCell!5944) )
))
(declare-datatypes ((array!28947 0))(
  ( (array!28948 (arr!13906 (Array (_ BitVec 32) ValueCell!5944)) (size!14258 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28947)

(declare-fun getCurrentListMapNoExtraKeys!1799 (array!28945 array!28947 (_ BitVec 32) (_ BitVec 32) V!17871 V!17871 (_ BitVec 32) Int) ListLongMap!7207)

(assert (=> b!463317 (= lt!209336 (getCurrentListMapNoExtraKeys!1799 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463318 () Bool)

(declare-fun res!277049 () Bool)

(assert (=> b!463318 (=> (not res!277049) (not e!270503))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463318 (= res!277049 (and (= (size!14258 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14257 _keys!1025) (size!14258 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20536 () Bool)

(declare-fun mapRes!20536 () Bool)

(declare-fun tp!39435 () Bool)

(declare-fun e!270500 () Bool)

(assert (=> mapNonEmpty!20536 (= mapRes!20536 (and tp!39435 e!270500))))

(declare-fun mapKey!20536 () (_ BitVec 32))

(declare-fun mapRest!20536 () (Array (_ BitVec 32) ValueCell!5944))

(declare-fun mapValue!20536 () ValueCell!5944)

(assert (=> mapNonEmpty!20536 (= (arr!13906 _values!833) (store mapRest!20536 mapKey!20536 mapValue!20536))))

(declare-fun b!463319 () Bool)

(declare-fun res!277048 () Bool)

(assert (=> b!463319 (=> (not res!277048) (not e!270503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28945 (_ BitVec 32)) Bool)

(assert (=> b!463319 (= res!277048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463320 () Bool)

(declare-fun res!277046 () Bool)

(assert (=> b!463320 (=> (not res!277046) (not e!270503))))

(declare-datatypes ((List!8388 0))(
  ( (Nil!8385) (Cons!8384 (h!9240 (_ BitVec 64)) (t!14332 List!8388)) )
))
(declare-fun arrayNoDuplicates!0 (array!28945 (_ BitVec 32) List!8388) Bool)

(assert (=> b!463320 (= res!277046 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8385))))

(declare-fun b!463321 () Bool)

(declare-fun e!270504 () Bool)

(declare-fun tp_is_empty!12575 () Bool)

(assert (=> b!463321 (= e!270504 tp_is_empty!12575)))

(declare-fun mapIsEmpty!20536 () Bool)

(assert (=> mapIsEmpty!20536 mapRes!20536))

(declare-fun res!277047 () Bool)

(assert (=> start!41468 (=> (not res!277047) (not e!270503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41468 (= res!277047 (validMask!0 mask!1365))))

(assert (=> start!41468 e!270503))

(assert (=> start!41468 tp_is_empty!12575))

(assert (=> start!41468 tp!39436))

(assert (=> start!41468 true))

(declare-fun array_inv!10052 (array!28945) Bool)

(assert (=> start!41468 (array_inv!10052 _keys!1025)))

(declare-fun e!270502 () Bool)

(declare-fun array_inv!10053 (array!28947) Bool)

(assert (=> start!41468 (and (array_inv!10053 _values!833) e!270502)))

(declare-fun b!463322 () Bool)

(assert (=> b!463322 (= e!270500 tp_is_empty!12575)))

(declare-fun b!463323 () Bool)

(assert (=> b!463323 (= e!270502 (and e!270504 mapRes!20536))))

(declare-fun condMapEmpty!20536 () Bool)

(declare-fun mapDefault!20536 () ValueCell!5944)

