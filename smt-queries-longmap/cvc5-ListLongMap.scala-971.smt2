; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21044 () Bool)

(assert start!21044)

(declare-fun b_free!5575 () Bool)

(declare-fun b_next!5575 () Bool)

(assert (=> start!21044 (= b_free!5575 (not b_next!5575))))

(declare-fun tp!19784 () Bool)

(declare-fun b_and!12393 () Bool)

(assert (=> start!21044 (= tp!19784 b_and!12393)))

(declare-fun e!137710 () Bool)

(declare-fun b!211568 () Bool)

(declare-datatypes ((V!6897 0))(
  ( (V!6898 (val!2763 Int)) )
))
(declare-datatypes ((tuple2!4178 0))(
  ( (tuple2!4179 (_1!2100 (_ BitVec 64)) (_2!2100 V!6897)) )
))
(declare-datatypes ((List!3069 0))(
  ( (Nil!3066) (Cons!3065 (h!3707 tuple2!4178) (t!8012 List!3069)) )
))
(declare-datatypes ((ListLongMap!3091 0))(
  ( (ListLongMap!3092 (toList!1561 List!3069)) )
))
(declare-fun lt!108821 () ListLongMap!3091)

(declare-fun lt!108819 () tuple2!4178)

(declare-fun lt!108824 () ListLongMap!3091)

(declare-fun +!564 (ListLongMap!3091 tuple2!4178) ListLongMap!3091)

(assert (=> b!211568 (= e!137710 (= lt!108821 (+!564 lt!108824 lt!108819)))))

(declare-fun e!137713 () Bool)

(assert (=> b!211568 e!137713))

(declare-fun res!103328 () Bool)

(assert (=> b!211568 (=> (not res!103328) (not e!137713))))

(declare-fun lt!108820 () ListLongMap!3091)

(assert (=> b!211568 (= res!103328 (= lt!108821 (+!564 lt!108820 lt!108819)))))

(declare-fun zeroValue!615 () V!6897)

(assert (=> b!211568 (= lt!108819 (tuple2!4179 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!9242 () Bool)

(declare-fun mapRes!9242 () Bool)

(assert (=> mapIsEmpty!9242 mapRes!9242))

(declare-fun b!211570 () Bool)

(declare-fun e!137714 () Bool)

(declare-fun e!137711 () Bool)

(assert (=> b!211570 (= e!137714 (and e!137711 mapRes!9242))))

(declare-fun condMapEmpty!9242 () Bool)

(declare-datatypes ((ValueCell!2375 0))(
  ( (ValueCellFull!2375 (v!4757 V!6897)) (EmptyCell!2375) )
))
(declare-datatypes ((array!10077 0))(
  ( (array!10078 (arr!4783 (Array (_ BitVec 32) ValueCell!2375)) (size!5108 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10077)

(declare-fun mapDefault!9242 () ValueCell!2375)

