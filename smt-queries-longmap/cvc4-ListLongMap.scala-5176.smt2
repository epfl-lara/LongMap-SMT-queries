; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70046 () Bool)

(assert start!70046)

(declare-fun b_free!12467 () Bool)

(declare-fun b_next!12467 () Bool)

(assert (=> start!70046 (= b_free!12467 (not b_next!12467))))

(declare-fun tp!44115 () Bool)

(declare-fun b_and!21239 () Bool)

(assert (=> start!70046 (= tp!44115 b_and!21239)))

(declare-fun b!814058 () Bool)

(declare-fun e!451186 () Bool)

(declare-fun tp_is_empty!14177 () Bool)

(assert (=> b!814058 (= e!451186 tp_is_empty!14177)))

(declare-fun b!814059 () Bool)

(declare-fun e!451187 () Bool)

(assert (=> b!814059 (= e!451187 false)))

(declare-datatypes ((array!44560 0))(
  ( (array!44561 (arr!21340 (Array (_ BitVec 32) (_ BitVec 64))) (size!21761 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44560)

(declare-datatypes ((V!23903 0))(
  ( (V!23904 (val!7136 Int)) )
))
(declare-fun zeroValueAfter!34 () V!23903)

(declare-fun minValue!754 () V!23903)

(declare-datatypes ((ValueCell!6673 0))(
  ( (ValueCellFull!6673 (v!9563 V!23903)) (EmptyCell!6673) )
))
(declare-datatypes ((array!44562 0))(
  ( (array!44563 (arr!21341 (Array (_ BitVec 32) ValueCell!6673)) (size!21762 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44562)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-datatypes ((tuple2!9352 0))(
  ( (tuple2!9353 (_1!4687 (_ BitVec 64)) (_2!4687 V!23903)) )
))
(declare-datatypes ((List!15184 0))(
  ( (Nil!15181) (Cons!15180 (h!16309 tuple2!9352) (t!21501 List!15184)) )
))
(declare-datatypes ((ListLongMap!8175 0))(
  ( (ListLongMap!8176 (toList!4103 List!15184)) )
))
(declare-fun lt!364472 () ListLongMap!8175)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2153 (array!44560 array!44562 (_ BitVec 32) (_ BitVec 32) V!23903 V!23903 (_ BitVec 32) Int) ListLongMap!8175)

(assert (=> b!814059 (= lt!364472 (getCurrentListMapNoExtraKeys!2153 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!364473 () ListLongMap!8175)

(declare-fun zeroValueBefore!34 () V!23903)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!814059 (= lt!364473 (getCurrentListMapNoExtraKeys!2153 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814060 () Bool)

(declare-fun e!451188 () Bool)

(declare-fun e!451185 () Bool)

(declare-fun mapRes!22846 () Bool)

(assert (=> b!814060 (= e!451188 (and e!451185 mapRes!22846))))

(declare-fun condMapEmpty!22846 () Bool)

(declare-fun mapDefault!22846 () ValueCell!6673)

