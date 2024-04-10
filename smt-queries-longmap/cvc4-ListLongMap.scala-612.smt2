; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15936 () Bool)

(assert start!15936)

(declare-fun b!158428 () Bool)

(declare-fun b_free!3485 () Bool)

(declare-fun b_next!3485 () Bool)

(assert (=> b!158428 (= b_free!3485 (not b_next!3485))))

(declare-fun tp!13007 () Bool)

(declare-fun b_and!9899 () Bool)

(assert (=> b!158428 (= tp!13007 b_and!9899)))

(declare-fun b!158422 () Bool)

(declare-fun e!103759 () Bool)

(declare-fun tp_is_empty!3287 () Bool)

(assert (=> b!158422 (= e!103759 tp_is_empty!3287)))

(declare-fun mapNonEmpty!5601 () Bool)

(declare-fun mapRes!5601 () Bool)

(declare-fun tp!13008 () Bool)

(declare-fun e!103758 () Bool)

(assert (=> mapNonEmpty!5601 (= mapRes!5601 (and tp!13008 e!103758))))

(declare-datatypes ((V!4029 0))(
  ( (V!4030 (val!1688 Int)) )
))
(declare-datatypes ((ValueCell!1300 0))(
  ( (ValueCellFull!1300 (v!3553 V!4029)) (EmptyCell!1300) )
))
(declare-fun mapRest!5601 () (Array (_ BitVec 32) ValueCell!1300))

(declare-fun mapKey!5601 () (_ BitVec 32))

(declare-datatypes ((array!5643 0))(
  ( (array!5644 (arr!2671 (Array (_ BitVec 32) (_ BitVec 64))) (size!2953 (_ BitVec 32))) )
))
(declare-datatypes ((array!5645 0))(
  ( (array!5646 (arr!2672 (Array (_ BitVec 32) ValueCell!1300)) (size!2954 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1508 0))(
  ( (LongMapFixedSize!1509 (defaultEntry!3196 Int) (mask!7711 (_ BitVec 32)) (extraKeys!2937 (_ BitVec 32)) (zeroValue!3039 V!4029) (minValue!3039 V!4029) (_size!803 (_ BitVec 32)) (_keys!4983 array!5643) (_values!3179 array!5645) (_vacant!803 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1508)

(declare-fun mapValue!5601 () ValueCell!1300)

(assert (=> mapNonEmpty!5601 (= (arr!2672 (_values!3179 thiss!1248)) (store mapRest!5601 mapKey!5601 mapValue!5601))))

(declare-fun res!74829 () Bool)

(declare-fun e!103763 () Bool)

(assert (=> start!15936 (=> (not res!74829) (not e!103763))))

(declare-fun valid!710 (LongMapFixedSize!1508) Bool)

(assert (=> start!15936 (= res!74829 (valid!710 thiss!1248))))

(assert (=> start!15936 e!103763))

(declare-fun e!103762 () Bool)

(assert (=> start!15936 e!103762))

(assert (=> start!15936 true))

(declare-fun b!158423 () Bool)

(declare-fun res!74827 () Bool)

(assert (=> b!158423 (=> (not res!74827) (not e!103763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158423 (= res!74827 (validMask!0 (mask!7711 thiss!1248)))))

(declare-fun b!158424 () Bool)

(assert (=> b!158424 (= e!103758 tp_is_empty!3287)))

(declare-fun b!158425 () Bool)

(declare-fun e!103760 () Bool)

(assert (=> b!158425 (= e!103760 (and e!103759 mapRes!5601))))

(declare-fun condMapEmpty!5601 () Bool)

(declare-fun mapDefault!5601 () ValueCell!1300)

