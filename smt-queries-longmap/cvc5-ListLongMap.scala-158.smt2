; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3018 () Bool)

(assert start!3018)

(declare-fun b!17815 () Bool)

(declare-fun b_free!625 () Bool)

(declare-fun b_next!625 () Bool)

(assert (=> b!17815 (= b_free!625 (not b_next!625))))

(declare-fun tp!3065 () Bool)

(declare-fun b_and!1273 () Bool)

(assert (=> b!17815 (= tp!3065 b_and!1273)))

(declare-fun b!17808 () Bool)

(declare-fun e!11291 () Bool)

(declare-fun tp_is_empty!889 () Bool)

(assert (=> b!17808 (= e!11291 tp_is_empty!889)))

(declare-fun res!12670 () Bool)

(declare-fun e!11293 () Bool)

(assert (=> start!3018 (=> (not res!12670) (not e!11293))))

(declare-datatypes ((V!1011 0))(
  ( (V!1012 (val!471 Int)) )
))
(declare-datatypes ((ValueCell!245 0))(
  ( (ValueCellFull!245 (v!1446 V!1011)) (EmptyCell!245) )
))
(declare-datatypes ((array!983 0))(
  ( (array!984 (arr!473 (Array (_ BitVec 32) ValueCell!245)) (size!563 (_ BitVec 32))) )
))
(declare-datatypes ((array!985 0))(
  ( (array!986 (arr!474 (Array (_ BitVec 32) (_ BitVec 64))) (size!564 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!76 0))(
  ( (LongMapFixedSize!77 (defaultEntry!1649 Int) (mask!4574 (_ BitVec 32)) (extraKeys!1562 (_ BitVec 32)) (zeroValue!1585 V!1011) (minValue!1585 V!1011) (_size!70 (_ BitVec 32)) (_keys!3074 array!985) (_values!1646 array!983) (_vacant!70 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!76 0))(
  ( (Cell!77 (v!1447 LongMapFixedSize!76)) )
))
(declare-datatypes ((LongMap!76 0))(
  ( (LongMap!77 (underlying!49 Cell!76)) )
))
(declare-fun thiss!848 () LongMap!76)

(declare-fun valid!38 (LongMap!76) Bool)

(assert (=> start!3018 (= res!12670 (valid!38 thiss!848))))

(assert (=> start!3018 e!11293))

(declare-fun e!11296 () Bool)

(assert (=> start!3018 e!11296))

(declare-fun mapIsEmpty!768 () Bool)

(declare-fun mapRes!768 () Bool)

(assert (=> mapIsEmpty!768 mapRes!768))

(declare-fun b!17809 () Bool)

(declare-fun e!11290 () Bool)

(assert (=> b!17809 (= e!11290 tp_is_empty!889)))

(declare-fun b!17810 () Bool)

(declare-fun e!11292 () Bool)

(assert (=> b!17810 (= e!11293 e!11292)))

(declare-fun res!12669 () Bool)

(assert (=> b!17810 (=> (not res!12669) (not e!11292))))

(declare-datatypes ((tuple2!768 0))(
  ( (tuple2!769 (_1!385 Bool) (_2!385 LongMap!76)) )
))
(declare-fun lt!4617 () tuple2!768)

(assert (=> b!17810 (= res!12669 (not (_1!385 lt!4617)))))

(declare-fun e!11288 () tuple2!768)

(assert (=> b!17810 (= lt!4617 e!11288)))

(declare-fun c!1786 () Bool)

(declare-fun imbalanced!20 (LongMap!76) Bool)

(assert (=> b!17810 (= c!1786 (imbalanced!20 thiss!848))))

(declare-fun b!17811 () Bool)

(assert (=> b!17811 (= e!11288 (tuple2!769 true thiss!848))))

(declare-fun mapNonEmpty!768 () Bool)

(declare-fun tp!3066 () Bool)

(assert (=> mapNonEmpty!768 (= mapRes!768 (and tp!3066 e!11291))))

(declare-fun mapRest!768 () (Array (_ BitVec 32) ValueCell!245))

(declare-fun mapValue!768 () ValueCell!245)

(declare-fun mapKey!768 () (_ BitVec 32))

(assert (=> mapNonEmpty!768 (= (arr!473 (_values!1646 (v!1447 (underlying!49 thiss!848)))) (store mapRest!768 mapKey!768 mapValue!768))))

(declare-fun b!17812 () Bool)

(declare-fun e!11294 () Bool)

(assert (=> b!17812 (= e!11294 (and e!11290 mapRes!768))))

(declare-fun condMapEmpty!768 () Bool)

(declare-fun mapDefault!768 () ValueCell!245)

