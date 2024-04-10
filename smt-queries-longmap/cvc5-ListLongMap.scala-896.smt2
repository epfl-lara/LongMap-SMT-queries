; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20472 () Bool)

(assert start!20472)

(declare-fun b_free!5131 () Bool)

(declare-fun b_next!5131 () Bool)

(assert (=> start!20472 (= b_free!5131 (not b_next!5131))))

(declare-fun tp!18425 () Bool)

(declare-fun b_and!11877 () Bool)

(assert (=> start!20472 (= tp!18425 b_and!11877)))

(declare-fun b!202995 () Bool)

(declare-fun e!132928 () Bool)

(declare-fun tp_is_empty!4987 () Bool)

(assert (=> b!202995 (= e!132928 tp_is_empty!4987)))

(declare-fun b!202996 () Bool)

(declare-fun e!132926 () Bool)

(assert (=> b!202996 (= e!132926 true)))

(declare-datatypes ((V!6297 0))(
  ( (V!6298 (val!2538 Int)) )
))
(declare-datatypes ((tuple2!3848 0))(
  ( (tuple2!3849 (_1!1935 (_ BitVec 64)) (_2!1935 V!6297)) )
))
(declare-datatypes ((List!2753 0))(
  ( (Nil!2750) (Cons!2749 (h!3391 tuple2!3848) (t!7684 List!2753)) )
))
(declare-datatypes ((ListLongMap!2761 0))(
  ( (ListLongMap!2762 (toList!1396 List!2753)) )
))
(declare-fun lt!102182 () ListLongMap!2761)

(declare-fun lt!102178 () ListLongMap!2761)

(declare-fun lt!102181 () tuple2!3848)

(declare-fun +!423 (ListLongMap!2761 tuple2!3848) ListLongMap!2761)

(assert (=> b!202996 (= lt!102182 (+!423 lt!102178 lt!102181))))

(declare-fun lt!102179 () ListLongMap!2761)

(declare-fun v!520 () V!6297)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun zeroValue!615 () V!6297)

(declare-datatypes ((Unit!6140 0))(
  ( (Unit!6141) )
))
(declare-fun lt!102183 () Unit!6140)

(declare-fun addCommutativeForDiffKeys!139 (ListLongMap!2761 (_ BitVec 64) V!6297 (_ BitVec 64) V!6297) Unit!6140)

(assert (=> b!202996 (= lt!102183 (addCommutativeForDiffKeys!139 lt!102179 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!97429 () Bool)

(declare-fun e!132929 () Bool)

(assert (=> start!20472 (=> (not res!97429) (not e!132929))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20472 (= res!97429 (validMask!0 mask!1149))))

(assert (=> start!20472 e!132929))

(declare-datatypes ((ValueCell!2150 0))(
  ( (ValueCellFull!2150 (v!4508 V!6297)) (EmptyCell!2150) )
))
(declare-datatypes ((array!9199 0))(
  ( (array!9200 (arr!4350 (Array (_ BitVec 32) ValueCell!2150)) (size!4675 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9199)

(declare-fun e!132924 () Bool)

(declare-fun array_inv!2873 (array!9199) Bool)

(assert (=> start!20472 (and (array_inv!2873 _values!649) e!132924)))

(assert (=> start!20472 true))

(assert (=> start!20472 tp_is_empty!4987))

(declare-datatypes ((array!9201 0))(
  ( (array!9202 (arr!4351 (Array (_ BitVec 32) (_ BitVec 64))) (size!4676 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9201)

(declare-fun array_inv!2874 (array!9201) Bool)

(assert (=> start!20472 (array_inv!2874 _keys!825)))

(assert (=> start!20472 tp!18425))

(declare-fun b!202997 () Bool)

(declare-fun e!132925 () Bool)

(assert (=> b!202997 (= e!132925 e!132926)))

(declare-fun res!97428 () Bool)

(assert (=> b!202997 (=> res!97428 e!132926)))

(assert (=> b!202997 (= res!97428 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102174 () ListLongMap!2761)

(assert (=> b!202997 (= lt!102174 lt!102182)))

(declare-fun lt!102177 () ListLongMap!2761)

(declare-fun lt!102172 () tuple2!3848)

(assert (=> b!202997 (= lt!102182 (+!423 lt!102177 lt!102172))))

(declare-fun lt!102176 () ListLongMap!2761)

(assert (=> b!202997 (= lt!102176 lt!102178)))

(assert (=> b!202997 (= lt!102178 (+!423 lt!102179 lt!102172))))

(declare-fun lt!102173 () ListLongMap!2761)

(assert (=> b!202997 (= lt!102174 (+!423 lt!102173 lt!102172))))

(assert (=> b!202997 (= lt!102172 (tuple2!3849 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202998 () Bool)

(declare-fun mapRes!8549 () Bool)

(assert (=> b!202998 (= e!132924 (and e!132928 mapRes!8549))))

(declare-fun condMapEmpty!8549 () Bool)

(declare-fun mapDefault!8549 () ValueCell!2150)

