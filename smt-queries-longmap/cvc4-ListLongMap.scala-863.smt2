; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20278 () Bool)

(assert start!20278)

(declare-fun b_free!4937 () Bool)

(declare-fun b_next!4937 () Bool)

(assert (=> start!20278 (= b_free!4937 (not b_next!4937))))

(declare-fun tp!17843 () Bool)

(declare-fun b_and!11683 () Bool)

(assert (=> start!20278 (= tp!17843 b_and!11683)))

(declare-fun b!199604 () Bool)

(declare-fun e!131006 () Bool)

(assert (=> b!199604 (= e!131006 (not true))))

(declare-datatypes ((V!6037 0))(
  ( (V!6038 (val!2441 Int)) )
))
(declare-datatypes ((tuple2!3692 0))(
  ( (tuple2!3693 (_1!1857 (_ BitVec 64)) (_2!1857 V!6037)) )
))
(declare-datatypes ((List!2609 0))(
  ( (Nil!2606) (Cons!2605 (h!3247 tuple2!3692) (t!7540 List!2609)) )
))
(declare-datatypes ((ListLongMap!2605 0))(
  ( (ListLongMap!2606 (toList!1318 List!2609)) )
))
(declare-fun lt!98416 () ListLongMap!2605)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2053 0))(
  ( (ValueCellFull!2053 (v!4411 V!6037)) (EmptyCell!2053) )
))
(declare-datatypes ((array!8825 0))(
  ( (array!8826 (arr!4163 (Array (_ BitVec 32) ValueCell!2053)) (size!4488 (_ BitVec 32))) )
))
(declare-fun lt!98421 () array!8825)

(declare-fun zeroValue!615 () V!6037)

(declare-datatypes ((array!8827 0))(
  ( (array!8828 (arr!4164 (Array (_ BitVec 32) (_ BitVec 64))) (size!4489 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8827)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6037)

(declare-fun getCurrentListMap!909 (array!8827 array!8825 (_ BitVec 32) (_ BitVec 32) V!6037 V!6037 (_ BitVec 32) Int) ListLongMap!2605)

(assert (=> b!199604 (= lt!98416 (getCurrentListMap!909 _keys!825 lt!98421 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98418 () ListLongMap!2605)

(declare-fun lt!98419 () ListLongMap!2605)

(assert (=> b!199604 (and (= lt!98418 lt!98419) (= lt!98419 lt!98418))))

(declare-fun lt!98420 () ListLongMap!2605)

(declare-fun v!520 () V!6037)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!345 (ListLongMap!2605 tuple2!3692) ListLongMap!2605)

(assert (=> b!199604 (= lt!98419 (+!345 lt!98420 (tuple2!3693 k!843 v!520)))))

(declare-fun _values!649 () array!8825)

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!5992 0))(
  ( (Unit!5993) )
))
(declare-fun lt!98417 () Unit!5992)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!22 (array!8827 array!8825 (_ BitVec 32) (_ BitVec 32) V!6037 V!6037 (_ BitVec 32) (_ BitVec 64) V!6037 (_ BitVec 32) Int) Unit!5992)

(assert (=> b!199604 (= lt!98417 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!22 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!283 (array!8827 array!8825 (_ BitVec 32) (_ BitVec 32) V!6037 V!6037 (_ BitVec 32) Int) ListLongMap!2605)

(assert (=> b!199604 (= lt!98418 (getCurrentListMapNoExtraKeys!283 _keys!825 lt!98421 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199604 (= lt!98421 (array!8826 (store (arr!4163 _values!649) i!601 (ValueCellFull!2053 v!520)) (size!4488 _values!649)))))

(assert (=> b!199604 (= lt!98420 (getCurrentListMapNoExtraKeys!283 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199605 () Bool)

(declare-fun res!94903 () Bool)

(assert (=> b!199605 (=> (not res!94903) (not e!131006))))

(assert (=> b!199605 (= res!94903 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4489 _keys!825))))))

(declare-fun b!199606 () Bool)

(declare-fun e!131005 () Bool)

(declare-fun e!131008 () Bool)

(declare-fun mapRes!8258 () Bool)

(assert (=> b!199606 (= e!131005 (and e!131008 mapRes!8258))))

(declare-fun condMapEmpty!8258 () Bool)

(declare-fun mapDefault!8258 () ValueCell!2053)

