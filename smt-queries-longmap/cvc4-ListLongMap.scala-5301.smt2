; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71014 () Bool)

(assert start!71014)

(declare-fun b_free!13217 () Bool)

(declare-fun b_next!13217 () Bool)

(assert (=> start!71014 (= b_free!13217 (not b_next!13217))))

(declare-fun tp!46404 () Bool)

(declare-fun b_and!22121 () Bool)

(assert (=> start!71014 (= tp!46404 b_and!22121)))

(declare-fun b!824644 () Bool)

(declare-fun e!458839 () Bool)

(assert (=> b!824644 (= e!458839 true)))

(declare-datatypes ((array!46042 0))(
  ( (array!46043 (arr!22068 (Array (_ BitVec 32) (_ BitVec 64))) (size!22489 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46042)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24903 0))(
  ( (V!24904 (val!7511 Int)) )
))
(declare-fun minValue!754 () V!24903)

(declare-datatypes ((ValueCell!7048 0))(
  ( (ValueCellFull!7048 (v!9944 V!24903)) (EmptyCell!7048) )
))
(declare-datatypes ((array!46044 0))(
  ( (array!46045 (arr!22069 (Array (_ BitVec 32) ValueCell!7048)) (size!22490 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46044)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9942 0))(
  ( (tuple2!9943 (_1!4982 (_ BitVec 64)) (_2!4982 V!24903)) )
))
(declare-datatypes ((List!15752 0))(
  ( (Nil!15749) (Cons!15748 (h!16877 tuple2!9942) (t!22095 List!15752)) )
))
(declare-datatypes ((ListLongMap!8765 0))(
  ( (ListLongMap!8766 (toList!4398 List!15752)) )
))
(declare-fun lt!371930 () ListLongMap!8765)

(declare-fun zeroValueBefore!34 () V!24903)

(declare-fun getCurrentListMap!2537 (array!46042 array!46044 (_ BitVec 32) (_ BitVec 32) V!24903 V!24903 (_ BitVec 32) Int) ListLongMap!8765)

(assert (=> b!824644 (= lt!371930 (getCurrentListMap!2537 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!562209 () Bool)

(declare-fun e!458843 () Bool)

(assert (=> start!71014 (=> (not res!562209) (not e!458843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71014 (= res!562209 (validMask!0 mask!1312))))

(assert (=> start!71014 e!458843))

(declare-fun tp_is_empty!14927 () Bool)

(assert (=> start!71014 tp_is_empty!14927))

(declare-fun array_inv!17607 (array!46042) Bool)

(assert (=> start!71014 (array_inv!17607 _keys!976)))

(assert (=> start!71014 true))

(declare-fun e!458838 () Bool)

(declare-fun array_inv!17608 (array!46044) Bool)

(assert (=> start!71014 (and (array_inv!17608 _values!788) e!458838)))

(assert (=> start!71014 tp!46404))

(declare-fun b!824645 () Bool)

(declare-fun e!458842 () Bool)

(assert (=> b!824645 (= e!458842 tp_is_empty!14927)))

(declare-fun b!824646 () Bool)

(declare-fun mapRes!24010 () Bool)

(assert (=> b!824646 (= e!458838 (and e!458842 mapRes!24010))))

(declare-fun condMapEmpty!24010 () Bool)

(declare-fun mapDefault!24010 () ValueCell!7048)

