; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37202 () Bool)

(assert start!37202)

(declare-fun b_free!8329 () Bool)

(declare-fun b_next!8329 () Bool)

(assert (=> start!37202 (= b_free!8329 (not b_next!8329))))

(declare-fun tp!29703 () Bool)

(declare-fun b_and!15571 () Bool)

(assert (=> start!37202 (= tp!29703 b_and!15571)))

(declare-fun b!375846 () Bool)

(declare-fun e!228948 () Bool)

(assert (=> b!375846 (= e!228948 true)))

(declare-datatypes ((V!13075 0))(
  ( (V!13076 (val!4533 Int)) )
))
(declare-datatypes ((tuple2!6034 0))(
  ( (tuple2!6035 (_1!3028 (_ BitVec 64)) (_2!3028 V!13075)) )
))
(declare-datatypes ((List!5876 0))(
  ( (Nil!5873) (Cons!5872 (h!6728 tuple2!6034) (t!11026 List!5876)) )
))
(declare-datatypes ((ListLongMap!4947 0))(
  ( (ListLongMap!4948 (toList!2489 List!5876)) )
))
(declare-fun lt!174116 () ListLongMap!4947)

(declare-fun lt!174121 () ListLongMap!4947)

(declare-fun lt!174125 () tuple2!6034)

(declare-fun +!835 (ListLongMap!4947 tuple2!6034) ListLongMap!4947)

(assert (=> b!375846 (= lt!174116 (+!835 lt!174121 lt!174125))))

(declare-fun v!373 () V!13075)

(declare-datatypes ((Unit!11576 0))(
  ( (Unit!11577) )
))
(declare-fun lt!174117 () Unit!11576)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13075)

(declare-fun lt!174118 () ListLongMap!4947)

(declare-fun addCommutativeForDiffKeys!251 (ListLongMap!4947 (_ BitVec 64) V!13075 (_ BitVec 64) V!13075) Unit!11576)

(assert (=> b!375846 (= lt!174117 (addCommutativeForDiffKeys!251 lt!174118 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375847 () Bool)

(declare-fun e!228950 () Bool)

(declare-fun e!228944 () Bool)

(declare-fun mapRes!15030 () Bool)

(assert (=> b!375847 (= e!228950 (and e!228944 mapRes!15030))))

(declare-fun condMapEmpty!15030 () Bool)

(declare-datatypes ((ValueCell!4145 0))(
  ( (ValueCellFull!4145 (v!6730 V!13075)) (EmptyCell!4145) )
))
(declare-datatypes ((array!21889 0))(
  ( (array!21890 (arr!10413 (Array (_ BitVec 32) ValueCell!4145)) (size!10765 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21889)

(declare-fun mapDefault!15030 () ValueCell!4145)

