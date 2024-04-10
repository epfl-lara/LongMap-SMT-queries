; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25018 () Bool)

(assert start!25018)

(declare-fun b!260819 () Bool)

(declare-fun b_free!6763 () Bool)

(declare-fun b_next!6763 () Bool)

(assert (=> b!260819 (= b_free!6763 (not b_next!6763))))

(declare-fun tp!23616 () Bool)

(declare-fun b_and!13883 () Bool)

(assert (=> b!260819 (= tp!23616 b_and!13883)))

(declare-fun b!260801 () Bool)

(declare-fun res!127458 () Bool)

(declare-fun e!169009 () Bool)

(assert (=> b!260801 (=> (not res!127458) (not e!169009))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!260801 (= res!127458 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260802 () Bool)

(declare-fun e!169015 () Bool)

(declare-fun e!169008 () Bool)

(assert (=> b!260802 (= e!169015 e!169008)))

(declare-fun res!127456 () Bool)

(declare-fun call!24880 () Bool)

(assert (=> b!260802 (= res!127456 call!24880)))

(assert (=> b!260802 (=> (not res!127456) (not e!169008))))

(declare-fun b!260803 () Bool)

(declare-fun e!169013 () Bool)

(declare-fun e!169018 () Bool)

(declare-fun mapRes!11292 () Bool)

(assert (=> b!260803 (= e!169013 (and e!169018 mapRes!11292))))

(declare-fun condMapEmpty!11292 () Bool)

(declare-datatypes ((V!8481 0))(
  ( (V!8482 (val!3357 Int)) )
))
(declare-datatypes ((ValueCell!2969 0))(
  ( (ValueCellFull!2969 (v!5476 V!8481)) (EmptyCell!2969) )
))
(declare-datatypes ((array!12605 0))(
  ( (array!12606 (arr!5966 (Array (_ BitVec 32) ValueCell!2969)) (size!6316 (_ BitVec 32))) )
))
(declare-datatypes ((array!12607 0))(
  ( (array!12608 (arr!5967 (Array (_ BitVec 32) (_ BitVec 64))) (size!6317 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3838 0))(
  ( (LongMapFixedSize!3839 (defaultEntry!4807 Int) (mask!11144 (_ BitVec 32)) (extraKeys!4544 (_ BitVec 32)) (zeroValue!4648 V!8481) (minValue!4648 V!8481) (_size!1968 (_ BitVec 32)) (_keys!6991 array!12607) (_values!4790 array!12605) (_vacant!1968 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3838)

(declare-fun mapDefault!11292 () ValueCell!2969)

