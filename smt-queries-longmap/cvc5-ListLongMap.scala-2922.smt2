; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41702 () Bool)

(assert start!41702)

(declare-fun b_free!11341 () Bool)

(declare-fun b_next!11341 () Bool)

(assert (=> start!41702 (= b_free!11341 (not b_next!11341))))

(declare-fun tp!40027 () Bool)

(declare-fun b_and!19697 () Bool)

(assert (=> start!41702 (= tp!40027 b_and!19697)))

(declare-fun b!465626 () Bool)

(declare-fun e!272147 () Bool)

(declare-fun e!272145 () Bool)

(assert (=> b!465626 (= e!272147 (not e!272145))))

(declare-fun res!278331 () Bool)

(assert (=> b!465626 (=> res!278331 e!272145)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465626 (= res!278331 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!18131 0))(
  ( (V!18132 (val!6429 Int)) )
))
(declare-datatypes ((tuple2!8422 0))(
  ( (tuple2!8423 (_1!4222 (_ BitVec 64)) (_2!4222 V!18131)) )
))
(declare-datatypes ((List!8515 0))(
  ( (Nil!8512) (Cons!8511 (h!9367 tuple2!8422) (t!14465 List!8515)) )
))
(declare-datatypes ((ListLongMap!7335 0))(
  ( (ListLongMap!7336 (toList!3683 List!8515)) )
))
(declare-fun lt!210278 () ListLongMap!7335)

(declare-fun lt!210276 () ListLongMap!7335)

(assert (=> b!465626 (= lt!210278 lt!210276)))

(declare-fun minValueBefore!38 () V!18131)

(declare-datatypes ((Unit!13534 0))(
  ( (Unit!13535) )
))
(declare-fun lt!210280 () Unit!13534)

(declare-fun zeroValue!794 () V!18131)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29319 0))(
  ( (array!29320 (arr!14089 (Array (_ BitVec 32) (_ BitVec 64))) (size!14441 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29319)

(declare-datatypes ((ValueCell!6041 0))(
  ( (ValueCellFull!6041 (v!8716 V!18131)) (EmptyCell!6041) )
))
(declare-datatypes ((array!29321 0))(
  ( (array!29322 (arr!14090 (Array (_ BitVec 32) ValueCell!6041)) (size!14442 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29321)

(declare-fun minValueAfter!38 () V!18131)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!43 (array!29319 array!29321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18131 V!18131 V!18131 V!18131 (_ BitVec 32) Int) Unit!13534)

(assert (=> b!465626 (= lt!210280 (lemmaNoChangeToArrayThenSameMapNoExtras!43 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1863 (array!29319 array!29321 (_ BitVec 32) (_ BitVec 32) V!18131 V!18131 (_ BitVec 32) Int) ListLongMap!7335)

(assert (=> b!465626 (= lt!210276 (getCurrentListMapNoExtraKeys!1863 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465626 (= lt!210278 (getCurrentListMapNoExtraKeys!1863 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465627 () Bool)

(declare-fun e!272146 () Bool)

(declare-fun e!272143 () Bool)

(declare-fun mapRes!20836 () Bool)

(assert (=> b!465627 (= e!272146 (and e!272143 mapRes!20836))))

(declare-fun condMapEmpty!20836 () Bool)

(declare-fun mapDefault!20836 () ValueCell!6041)

