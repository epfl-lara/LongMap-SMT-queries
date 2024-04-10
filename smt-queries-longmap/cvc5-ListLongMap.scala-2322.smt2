; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37394 () Bool)

(assert start!37394)

(declare-fun b_free!8521 () Bool)

(declare-fun b_next!8521 () Bool)

(assert (=> start!37394 (= b_free!8521 (not b_next!8521))))

(declare-fun tp!30278 () Bool)

(declare-fun b_and!15763 () Bool)

(assert (=> start!37394 (= tp!30278 b_and!15763)))

(declare-fun b!380175 () Bool)

(declare-fun e!231247 () Bool)

(declare-fun e!231249 () Bool)

(assert (=> b!380175 (= e!231247 e!231249)))

(declare-fun res!215744 () Bool)

(assert (=> b!380175 (=> (not res!215744) (not e!231249))))

(declare-datatypes ((array!22257 0))(
  ( (array!22258 (arr!10597 (Array (_ BitVec 32) (_ BitVec 64))) (size!10949 (_ BitVec 32))) )
))
(declare-fun lt!177833 () array!22257)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22257 (_ BitVec 32)) Bool)

(assert (=> b!380175 (= res!215744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177833 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22257)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380175 (= lt!177833 (array!22258 (store (arr!10597 _keys!658) i!548 k!778) (size!10949 _keys!658)))))

(declare-fun b!380176 () Bool)

(declare-fun res!215737 () Bool)

(assert (=> b!380176 (=> (not res!215737) (not e!231249))))

(declare-datatypes ((List!6037 0))(
  ( (Nil!6034) (Cons!6033 (h!6889 (_ BitVec 64)) (t!11187 List!6037)) )
))
(declare-fun arrayNoDuplicates!0 (array!22257 (_ BitVec 32) List!6037) Bool)

(assert (=> b!380176 (= res!215737 (arrayNoDuplicates!0 lt!177833 #b00000000000000000000000000000000 Nil!6034))))

(declare-fun b!380177 () Bool)

(declare-fun e!231252 () Bool)

(assert (=> b!380177 (= e!231252 true)))

(declare-datatypes ((V!13331 0))(
  ( (V!13332 (val!4629 Int)) )
))
(declare-datatypes ((tuple2!6202 0))(
  ( (tuple2!6203 (_1!3112 (_ BitVec 64)) (_2!3112 V!13331)) )
))
(declare-datatypes ((List!6038 0))(
  ( (Nil!6035) (Cons!6034 (h!6890 tuple2!6202) (t!11188 List!6038)) )
))
(declare-datatypes ((ListLongMap!5115 0))(
  ( (ListLongMap!5116 (toList!2573 List!6038)) )
))
(declare-fun lt!177828 () ListLongMap!5115)

(declare-fun lt!177826 () ListLongMap!5115)

(declare-fun lt!177827 () tuple2!6202)

(declare-fun +!919 (ListLongMap!5115 tuple2!6202) ListLongMap!5115)

(assert (=> b!380177 (= lt!177828 (+!919 lt!177826 lt!177827))))

(declare-datatypes ((Unit!11732 0))(
  ( (Unit!11733) )
))
(declare-fun lt!177831 () Unit!11732)

(declare-fun v!373 () V!13331)

(declare-fun lt!177834 () ListLongMap!5115)

(declare-fun minValue!472 () V!13331)

(declare-fun addCommutativeForDiffKeys!316 (ListLongMap!5115 (_ BitVec 64) V!13331 (_ BitVec 64) V!13331) Unit!11732)

(assert (=> b!380177 (= lt!177831 (addCommutativeForDiffKeys!316 lt!177834 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380178 () Bool)

(declare-fun res!215741 () Bool)

(assert (=> b!380178 (=> (not res!215741) (not e!231247))))

(declare-fun arrayContainsKey!0 (array!22257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380178 (= res!215741 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!380179 () Bool)

(declare-fun e!231250 () Bool)

(declare-fun tp_is_empty!9169 () Bool)

(assert (=> b!380179 (= e!231250 tp_is_empty!9169)))

(declare-fun b!380180 () Bool)

(declare-fun e!231254 () Bool)

(assert (=> b!380180 (= e!231254 e!231252)))

(declare-fun res!215740 () Bool)

(assert (=> b!380180 (=> res!215740 e!231252)))

(assert (=> b!380180 (= res!215740 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177823 () ListLongMap!5115)

(assert (=> b!380180 (= lt!177823 lt!177826)))

(declare-fun lt!177825 () tuple2!6202)

(assert (=> b!380180 (= lt!177826 (+!919 lt!177834 lt!177825))))

(declare-fun lt!177829 () ListLongMap!5115)

(assert (=> b!380180 (= lt!177829 lt!177828)))

(declare-fun lt!177832 () ListLongMap!5115)

(assert (=> b!380180 (= lt!177828 (+!919 lt!177832 lt!177825))))

(declare-fun lt!177822 () ListLongMap!5115)

(assert (=> b!380180 (= lt!177829 (+!919 lt!177822 lt!177825))))

(assert (=> b!380180 (= lt!177825 (tuple2!6203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380181 () Bool)

(declare-fun e!231253 () Bool)

(assert (=> b!380181 (= e!231253 tp_is_empty!9169)))

(declare-fun b!380182 () Bool)

(declare-fun e!231251 () Bool)

(declare-fun mapRes!15318 () Bool)

(assert (=> b!380182 (= e!231251 (and e!231253 mapRes!15318))))

(declare-fun condMapEmpty!15318 () Bool)

(declare-datatypes ((ValueCell!4241 0))(
  ( (ValueCellFull!4241 (v!6826 V!13331)) (EmptyCell!4241) )
))
(declare-datatypes ((array!22259 0))(
  ( (array!22260 (arr!10598 (Array (_ BitVec 32) ValueCell!4241)) (size!10950 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22259)

(declare-fun mapDefault!15318 () ValueCell!4241)

