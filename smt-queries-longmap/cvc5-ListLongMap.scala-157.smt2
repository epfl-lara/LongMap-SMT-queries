; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3012 () Bool)

(assert start!3012)

(declare-fun b!17718 () Bool)

(declare-fun b_free!619 () Bool)

(declare-fun b_next!619 () Bool)

(assert (=> b!17718 (= b_free!619 (not b_next!619))))

(declare-fun tp!3047 () Bool)

(declare-fun b_and!1267 () Bool)

(assert (=> b!17718 (= tp!3047 b_and!1267)))

(declare-fun e!11205 () Bool)

(declare-fun tp_is_empty!883 () Bool)

(declare-datatypes ((V!1003 0))(
  ( (V!1004 (val!468 Int)) )
))
(declare-datatypes ((ValueCell!242 0))(
  ( (ValueCellFull!242 (v!1440 V!1003)) (EmptyCell!242) )
))
(declare-datatypes ((array!971 0))(
  ( (array!972 (arr!467 (Array (_ BitVec 32) ValueCell!242)) (size!557 (_ BitVec 32))) )
))
(declare-datatypes ((array!973 0))(
  ( (array!974 (arr!468 (Array (_ BitVec 32) (_ BitVec 64))) (size!558 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!70 0))(
  ( (LongMapFixedSize!71 (defaultEntry!1646 Int) (mask!4569 (_ BitVec 32)) (extraKeys!1559 (_ BitVec 32)) (zeroValue!1582 V!1003) (minValue!1582 V!1003) (_size!67 (_ BitVec 32)) (_keys!3071 array!973) (_values!1643 array!971) (_vacant!67 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!70 0))(
  ( (Cell!71 (v!1441 LongMapFixedSize!70)) )
))
(declare-datatypes ((LongMap!70 0))(
  ( (LongMap!71 (underlying!46 Cell!70)) )
))
(declare-fun thiss!848 () LongMap!70)

(declare-fun e!11200 () Bool)

(declare-fun array_inv!323 (array!973) Bool)

(declare-fun array_inv!324 (array!971) Bool)

(assert (=> b!17718 (= e!11205 (and tp!3047 tp_is_empty!883 (array_inv!323 (_keys!3071 (v!1441 (underlying!46 thiss!848)))) (array_inv!324 (_values!1643 (v!1441 (underlying!46 thiss!848)))) e!11200))))

(declare-fun b!17719 () Bool)

(declare-fun e!11206 () Bool)

(assert (=> b!17719 (= e!11206 false)))

(declare-fun lt!4599 () Bool)

(declare-datatypes ((tuple2!762 0))(
  ( (tuple2!763 (_1!382 Bool) (_2!382 LongMap!70)) )
))
(declare-fun lt!4600 () tuple2!762)

(declare-fun valid!35 (LongMap!70) Bool)

(assert (=> b!17719 (= lt!4599 (valid!35 (_2!382 lt!4600)))))

(declare-fun b!17720 () Bool)

(declare-fun e!11198 () Bool)

(declare-fun e!11204 () Bool)

(assert (=> b!17720 (= e!11198 e!11204)))

(declare-fun b!17721 () Bool)

(declare-fun e!11203 () tuple2!762)

(declare-fun repack!12 (LongMap!70) tuple2!762)

(assert (=> b!17721 (= e!11203 (repack!12 thiss!848))))

(declare-fun b!17722 () Bool)

(declare-fun e!11199 () Bool)

(assert (=> b!17722 (= e!11199 tp_is_empty!883)))

(declare-fun b!17724 () Bool)

(declare-fun e!11197 () Bool)

(assert (=> b!17724 (= e!11197 tp_is_empty!883)))

(declare-fun b!17725 () Bool)

(assert (=> b!17725 (= e!11204 e!11205)))

(declare-fun b!17726 () Bool)

(declare-fun mapRes!759 () Bool)

(assert (=> b!17726 (= e!11200 (and e!11199 mapRes!759))))

(declare-fun condMapEmpty!759 () Bool)

(declare-fun mapDefault!759 () ValueCell!242)

