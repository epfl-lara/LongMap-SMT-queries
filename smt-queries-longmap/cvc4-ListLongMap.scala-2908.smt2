; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41594 () Bool)

(assert start!41594)

(declare-fun b_free!11261 () Bool)

(declare-fun b_next!11261 () Bool)

(assert (=> start!41594 (= b_free!11261 (not b_next!11261))))

(declare-fun tp!39781 () Bool)

(declare-fun b_and!19601 () Bool)

(assert (=> start!41594 (= tp!39781 b_and!19601)))

(declare-fun res!277759 () Bool)

(declare-fun e!271404 () Bool)

(assert (=> start!41594 (=> (not res!277759) (not e!271404))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41594 (= res!277759 (validMask!0 mask!1365))))

(assert (=> start!41594 e!271404))

(declare-fun tp_is_empty!12689 () Bool)

(assert (=> start!41594 tp_is_empty!12689))

(assert (=> start!41594 tp!39781))

(assert (=> start!41594 true))

(declare-datatypes ((array!29163 0))(
  ( (array!29164 (arr!14013 (Array (_ BitVec 32) (_ BitVec 64))) (size!14365 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29163)

(declare-fun array_inv!10120 (array!29163) Bool)

(assert (=> start!41594 (array_inv!10120 _keys!1025)))

(declare-datatypes ((V!18023 0))(
  ( (V!18024 (val!6389 Int)) )
))
(declare-datatypes ((ValueCell!6001 0))(
  ( (ValueCellFull!6001 (v!8676 V!18023)) (EmptyCell!6001) )
))
(declare-datatypes ((array!29165 0))(
  ( (array!29166 (arr!14014 (Array (_ BitVec 32) ValueCell!6001)) (size!14366 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29165)

(declare-fun e!271406 () Bool)

(declare-fun array_inv!10121 (array!29165) Bool)

(assert (=> start!41594 (and (array_inv!10121 _values!833) e!271406)))

(declare-fun mapNonEmpty!20710 () Bool)

(declare-fun mapRes!20710 () Bool)

(declare-fun tp!39780 () Bool)

(declare-fun e!271405 () Bool)

(assert (=> mapNonEmpty!20710 (= mapRes!20710 (and tp!39780 e!271405))))

(declare-fun mapKey!20710 () (_ BitVec 32))

(declare-fun mapValue!20710 () ValueCell!6001)

(declare-fun mapRest!20710 () (Array (_ BitVec 32) ValueCell!6001))

(assert (=> mapNonEmpty!20710 (= (arr!14014 _values!833) (store mapRest!20710 mapKey!20710 mapValue!20710))))

(declare-fun b!464587 () Bool)

(assert (=> b!464587 (= e!271404 (not true))))

(declare-datatypes ((tuple2!8368 0))(
  ( (tuple2!8369 (_1!4195 (_ BitVec 64)) (_2!4195 V!18023)) )
))
(declare-datatypes ((List!8463 0))(
  ( (Nil!8460) (Cons!8459 (h!9315 tuple2!8368) (t!14409 List!8463)) )
))
(declare-datatypes ((ListLongMap!7281 0))(
  ( (ListLongMap!7282 (toList!3656 List!8463)) )
))
(declare-fun lt!209780 () ListLongMap!7281)

(declare-fun lt!209779 () ListLongMap!7281)

(assert (=> b!464587 (= lt!209780 lt!209779)))

(declare-fun minValueBefore!38 () V!18023)

(declare-fun zeroValue!794 () V!18023)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13480 0))(
  ( (Unit!13481) )
))
(declare-fun lt!209778 () Unit!13480)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18023)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!16 (array!29163 array!29165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18023 V!18023 V!18023 V!18023 (_ BitVec 32) Int) Unit!13480)

(assert (=> b!464587 (= lt!209778 (lemmaNoChangeToArrayThenSameMapNoExtras!16 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1836 (array!29163 array!29165 (_ BitVec 32) (_ BitVec 32) V!18023 V!18023 (_ BitVec 32) Int) ListLongMap!7281)

(assert (=> b!464587 (= lt!209779 (getCurrentListMapNoExtraKeys!1836 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464587 (= lt!209780 (getCurrentListMapNoExtraKeys!1836 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20710 () Bool)

(assert (=> mapIsEmpty!20710 mapRes!20710))

(declare-fun b!464588 () Bool)

(declare-fun e!271407 () Bool)

(assert (=> b!464588 (= e!271406 (and e!271407 mapRes!20710))))

(declare-fun condMapEmpty!20710 () Bool)

(declare-fun mapDefault!20710 () ValueCell!6001)

