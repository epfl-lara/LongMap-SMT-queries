; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21118 () Bool)

(assert start!21118)

(declare-fun b_free!5609 () Bool)

(declare-fun b_next!5609 () Bool)

(assert (=> start!21118 (= b_free!5609 (not b_next!5609))))

(declare-fun tp!19891 () Bool)

(declare-fun b_and!12451 () Bool)

(assert (=> start!21118 (= tp!19891 b_and!12451)))

(declare-fun mapIsEmpty!9299 () Bool)

(declare-fun mapRes!9299 () Bool)

(assert (=> mapIsEmpty!9299 mapRes!9299))

(declare-fun mapNonEmpty!9299 () Bool)

(declare-fun tp!19892 () Bool)

(declare-fun e!138290 () Bool)

(assert (=> mapNonEmpty!9299 (= mapRes!9299 (and tp!19892 e!138290))))

(declare-fun mapKey!9299 () (_ BitVec 32))

(declare-datatypes ((V!6941 0))(
  ( (V!6942 (val!2780 Int)) )
))
(declare-datatypes ((ValueCell!2392 0))(
  ( (ValueCellFull!2392 (v!4782 V!6941)) (EmptyCell!2392) )
))
(declare-datatypes ((array!10147 0))(
  ( (array!10148 (arr!4816 (Array (_ BitVec 32) ValueCell!2392)) (size!5141 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10147)

(declare-fun mapValue!9299 () ValueCell!2392)

(declare-fun mapRest!9299 () (Array (_ BitVec 32) ValueCell!2392))

(assert (=> mapNonEmpty!9299 (= (arr!4816 _values!649) (store mapRest!9299 mapKey!9299 mapValue!9299))))

(declare-fun b!212548 () Bool)

(declare-fun res!103939 () Bool)

(declare-fun e!138285 () Bool)

(assert (=> b!212548 (=> (not res!103939) (not e!138285))))

(declare-datatypes ((array!10149 0))(
  ( (array!10150 (arr!4817 (Array (_ BitVec 32) (_ BitVec 64))) (size!5142 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10149)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!212548 (= res!103939 (= (select (arr!4817 _keys!825) i!601) k!843))))

(declare-datatypes ((tuple2!4210 0))(
  ( (tuple2!4211 (_1!2116 (_ BitVec 64)) (_2!2116 V!6941)) )
))
(declare-fun lt!109586 () tuple2!4210)

(declare-fun e!138289 () Bool)

(declare-datatypes ((List!3099 0))(
  ( (Nil!3096) (Cons!3095 (h!3737 tuple2!4210) (t!8046 List!3099)) )
))
(declare-datatypes ((ListLongMap!3123 0))(
  ( (ListLongMap!3124 (toList!1577 List!3099)) )
))
(declare-fun lt!109588 () ListLongMap!3123)

(declare-fun lt!109587 () ListLongMap!3123)

(declare-fun b!212549 () Bool)

(declare-fun +!580 (ListLongMap!3123 tuple2!4210) ListLongMap!3123)

(assert (=> b!212549 (= e!138289 (= lt!109587 (+!580 lt!109588 lt!109586)))))

(declare-fun lt!109589 () ListLongMap!3123)

(assert (=> b!212549 (= lt!109587 (+!580 lt!109589 lt!109586))))

(declare-fun minValue!615 () V!6941)

(assert (=> b!212549 (= lt!109586 (tuple2!4211 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!212550 () Bool)

(declare-fun tp_is_empty!5471 () Bool)

(assert (=> b!212550 (= e!138290 tp_is_empty!5471)))

(declare-fun b!212551 () Bool)

(declare-fun res!103937 () Bool)

(assert (=> b!212551 (=> (not res!103937) (not e!138285))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!212551 (= res!103937 (and (= (size!5141 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5142 _keys!825) (size!5141 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!212552 () Bool)

(declare-fun e!138286 () Bool)

(declare-fun e!138288 () Bool)

(assert (=> b!212552 (= e!138286 (and e!138288 mapRes!9299))))

(declare-fun condMapEmpty!9299 () Bool)

(declare-fun mapDefault!9299 () ValueCell!2392)

