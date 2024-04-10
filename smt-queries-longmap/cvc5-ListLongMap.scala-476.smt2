; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9590 () Bool)

(assert start!9590)

(declare-fun b!70698 () Bool)

(declare-fun b_free!2101 () Bool)

(declare-fun b_next!2101 () Bool)

(assert (=> b!70698 (= b_free!2101 (not b_next!2101))))

(declare-fun tp!8472 () Bool)

(declare-fun b_and!4351 () Bool)

(assert (=> b!70698 (= tp!8472 b_and!4351)))

(declare-fun b!70705 () Bool)

(declare-fun b_free!2103 () Bool)

(declare-fun b_next!2103 () Bool)

(assert (=> b!70705 (= b_free!2103 (not b_next!2103))))

(declare-fun tp!8474 () Bool)

(declare-fun b_and!4353 () Bool)

(assert (=> b!70705 (= tp!8474 b_and!4353)))

(declare-fun b!70696 () Bool)

(declare-fun e!46311 () Bool)

(declare-fun e!46306 () Bool)

(declare-fun mapRes!3139 () Bool)

(assert (=> b!70696 (= e!46311 (and e!46306 mapRes!3139))))

(declare-fun condMapEmpty!3139 () Bool)

(declare-datatypes ((V!2937 0))(
  ( (V!2938 (val!1278 Int)) )
))
(declare-datatypes ((array!3877 0))(
  ( (array!3878 (arr!1851 (Array (_ BitVec 32) (_ BitVec 64))) (size!2088 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!890 0))(
  ( (ValueCellFull!890 (v!2512 V!2937)) (EmptyCell!890) )
))
(declare-datatypes ((array!3879 0))(
  ( (array!3880 (arr!1852 (Array (_ BitVec 32) ValueCell!890)) (size!2089 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!688 0))(
  ( (LongMapFixedSize!689 (defaultEntry!2191 Int) (mask!6148 (_ BitVec 32)) (extraKeys!2054 (_ BitVec 32)) (zeroValue!2095 V!2937) (minValue!2095 V!2937) (_size!393 (_ BitVec 32)) (_keys!3839 array!3877) (_values!2174 array!3879) (_vacant!393 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!688)

(declare-fun mapDefault!3139 () ValueCell!890)

