; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19932 () Bool)

(assert start!19932)

(declare-fun b!195642 () Bool)

(declare-fun b_free!4737 () Bool)

(declare-fun b_next!4737 () Bool)

(assert (=> b!195642 (= b_free!4737 (not b_next!4737))))

(declare-fun tp!17094 () Bool)

(declare-fun b_and!11483 () Bool)

(assert (=> b!195642 (= tp!17094 b_and!11483)))

(declare-fun b!195636 () Bool)

(declare-fun b_free!4739 () Bool)

(declare-fun b_next!4739 () Bool)

(assert (=> b!195636 (= b_free!4739 (not b_next!4739))))

(declare-fun tp!17092 () Bool)

(declare-fun b_and!11485 () Bool)

(assert (=> b!195636 (= tp!17092 b_and!11485)))

(declare-fun b!195629 () Bool)

(declare-fun e!128715 () Bool)

(declare-fun e!128712 () Bool)

(assert (=> b!195629 (= e!128715 e!128712)))

(declare-fun c!35411 () Bool)

(declare-datatypes ((V!5653 0))(
  ( (V!5654 (val!2297 Int)) )
))
(declare-datatypes ((ValueCell!1909 0))(
  ( (ValueCellFull!1909 (v!4265 V!5653)) (EmptyCell!1909) )
))
(declare-datatypes ((array!8265 0))(
  ( (array!8266 (arr!3889 (Array (_ BitVec 32) (_ BitVec 64))) (size!4214 (_ BitVec 32))) )
))
(declare-datatypes ((array!8267 0))(
  ( (array!8268 (arr!3890 (Array (_ BitVec 32) ValueCell!1909)) (size!4215 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2726 0))(
  ( (LongMapFixedSize!2727 (defaultEntry!3977 Int) (mask!9253 (_ BitVec 32)) (extraKeys!3714 (_ BitVec 32)) (zeroValue!3818 V!5653) (minValue!3818 V!5653) (_size!1412 (_ BitVec 32)) (_keys!5976 array!8265) (_values!3960 array!8267) (_vacant!1412 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3568 0))(
  ( (tuple2!3569 (_1!1795 Bool) (_2!1795 LongMapFixedSize!2726)) )
))
(declare-fun lt!97491 () tuple2!3568)

(assert (=> b!195629 (= c!35411 (_1!1795 lt!97491))))

(declare-fun b!195630 () Bool)

(declare-fun e!128716 () Bool)

(assert (=> b!195630 (= e!128716 e!128715)))

(declare-fun res!92331 () Bool)

(assert (=> b!195630 (=> res!92331 e!128715)))

(declare-fun valid!1117 (LongMapFixedSize!2726) Bool)

(assert (=> b!195630 (= res!92331 (not (valid!1117 (_2!1795 lt!97491))))))

(declare-fun err!107 () tuple2!3568)

(assert (=> b!195630 (= lt!97491 err!107)))

(assert (=> b!195630 true))

(declare-fun e!128717 () Bool)

(assert (=> b!195630 e!128717))

(declare-fun mapNonEmpty!7806 () Bool)

(declare-fun mapRes!7807 () Bool)

(declare-fun tp!17093 () Bool)

(declare-fun e!128718 () Bool)

(assert (=> mapNonEmpty!7806 (= mapRes!7807 (and tp!17093 e!128718))))

(declare-fun mapValue!7806 () ValueCell!1909)

(declare-fun mapRest!7806 () (Array (_ BitVec 32) ValueCell!1909))

(declare-fun thiss!1248 () LongMapFixedSize!2726)

(declare-fun mapKey!7806 () (_ BitVec 32))

(assert (=> mapNonEmpty!7806 (= (arr!3890 (_values!3960 thiss!1248)) (store mapRest!7806 mapKey!7806 mapValue!7806))))

(declare-fun b!195631 () Bool)

(declare-fun e!128724 () Bool)

(declare-fun e!128711 () Bool)

(assert (=> b!195631 (= e!128724 (and e!128711 mapRes!7807))))

(declare-fun condMapEmpty!7806 () Bool)

(declare-fun mapDefault!7807 () ValueCell!1909)

