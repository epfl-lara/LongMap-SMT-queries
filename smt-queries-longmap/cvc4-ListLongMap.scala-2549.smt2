; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39116 () Bool)

(assert start!39116)

(declare-fun b_free!9383 () Bool)

(declare-fun b_next!9383 () Bool)

(assert (=> start!39116 (= b_free!9383 (not b_next!9383))))

(declare-fun tp!33677 () Bool)

(declare-fun b_and!16769 () Bool)

(assert (=> start!39116 (= tp!33677 b_and!16769)))

(declare-fun b!411222 () Bool)

(declare-fun e!246323 () Bool)

(declare-fun tp_is_empty!10535 () Bool)

(assert (=> b!411222 (= e!246323 tp_is_empty!10535)))

(declare-fun b!411223 () Bool)

(declare-fun e!246324 () Bool)

(assert (=> b!411223 (= e!246324 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15151 0))(
  ( (V!15152 (val!5312 Int)) )
))
(declare-datatypes ((tuple2!6890 0))(
  ( (tuple2!6891 (_1!3456 (_ BitVec 64)) (_2!3456 V!15151)) )
))
(declare-datatypes ((List!6915 0))(
  ( (Nil!6912) (Cons!6911 (h!7767 tuple2!6890) (t!12089 List!6915)) )
))
(declare-datatypes ((ListLongMap!5803 0))(
  ( (ListLongMap!5804 (toList!2917 List!6915)) )
))
(declare-fun lt!189237 () ListLongMap!5803)

(declare-fun minValue!515 () V!15151)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4924 0))(
  ( (ValueCellFull!4924 (v!7559 V!15151)) (EmptyCell!4924) )
))
(declare-datatypes ((array!24931 0))(
  ( (array!24932 (arr!11915 (Array (_ BitVec 32) ValueCell!4924)) (size!12267 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24931)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15151)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((array!24933 0))(
  ( (array!24934 (arr!11916 (Array (_ BitVec 32) (_ BitVec 64))) (size!12268 (_ BitVec 32))) )
))
(declare-fun lt!189238 () array!24933)

(declare-fun zeroValue!515 () V!15151)

(declare-fun getCurrentListMapNoExtraKeys!1125 (array!24933 array!24931 (_ BitVec 32) (_ BitVec 32) V!15151 V!15151 (_ BitVec 32) Int) ListLongMap!5803)

(assert (=> b!411223 (= lt!189237 (getCurrentListMapNoExtraKeys!1125 lt!189238 (array!24932 (store (arr!11915 _values!549) i!563 (ValueCellFull!4924 v!412)) (size!12267 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189239 () ListLongMap!5803)

(declare-fun _keys!709 () array!24933)

(assert (=> b!411223 (= lt!189239 (getCurrentListMapNoExtraKeys!1125 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411224 () Bool)

(declare-fun res!238516 () Bool)

(declare-fun e!246322 () Bool)

(assert (=> b!411224 (=> (not res!238516) (not e!246322))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411224 (= res!238516 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!411225 () Bool)

(declare-fun e!246321 () Bool)

(declare-fun e!246320 () Bool)

(declare-fun mapRes!17424 () Bool)

(assert (=> b!411225 (= e!246321 (and e!246320 mapRes!17424))))

(declare-fun condMapEmpty!17424 () Bool)

(declare-fun mapDefault!17424 () ValueCell!4924)

