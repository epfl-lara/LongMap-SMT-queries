; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91936 () Bool)

(assert start!91936)

(declare-fun b!1045605 () Bool)

(declare-fun b_free!21143 () Bool)

(declare-fun b_next!21143 () Bool)

(assert (=> b!1045605 (= b_free!21143 (not b_next!21143))))

(declare-fun tp!74688 () Bool)

(declare-fun b_and!33773 () Bool)

(assert (=> b!1045605 (= tp!74688 b_and!33773)))

(declare-fun b!1045597 () Bool)

(declare-fun res!696180 () Bool)

(declare-fun e!592723 () Bool)

(assert (=> b!1045597 (=> (not res!696180) (not e!592723))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1045597 (= res!696180 (not (= key!909 (bvneg key!909))))))

(declare-fun res!696182 () Bool)

(assert (=> start!91936 (=> (not res!696182) (not e!592723))))

(declare-datatypes ((V!38023 0))(
  ( (V!38024 (val!12482 Int)) )
))
(declare-datatypes ((ValueCell!11728 0))(
  ( (ValueCellFull!11728 (v!15078 V!38023)) (EmptyCell!11728) )
))
(declare-datatypes ((array!65902 0))(
  ( (array!65903 (arr!31697 (Array (_ BitVec 32) (_ BitVec 64))) (size!32232 (_ BitVec 32))) )
))
(declare-datatypes ((array!65904 0))(
  ( (array!65905 (arr!31698 (Array (_ BitVec 32) ValueCell!11728)) (size!32233 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6050 0))(
  ( (LongMapFixedSize!6051 (defaultEntry!6421 Int) (mask!30552 (_ BitVec 32)) (extraKeys!6149 (_ BitVec 32)) (zeroValue!6255 V!38023) (minValue!6255 V!38023) (_size!3080 (_ BitVec 32)) (_keys!11693 array!65902) (_values!6444 array!65904) (_vacant!3080 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6050)

(declare-fun valid!2270 (LongMapFixedSize!6050) Bool)

(assert (=> start!91936 (= res!696182 (valid!2270 thiss!1427))))

(assert (=> start!91936 e!592723))

(declare-fun e!592724 () Bool)

(assert (=> start!91936 e!592724))

(assert (=> start!91936 true))

(declare-fun b!1045598 () Bool)

(declare-fun e!592726 () Bool)

(declare-datatypes ((Unit!34157 0))(
  ( (Unit!34158) )
))
(declare-datatypes ((tuple2!15798 0))(
  ( (tuple2!15799 (_1!7910 Unit!34157) (_2!7910 LongMapFixedSize!6050)) )
))
(declare-fun lt!461649 () tuple2!15798)

(assert (=> b!1045598 (= e!592726 (or (not (= (size!32233 (_values!6444 (_2!7910 lt!461649))) (bvadd #b00000000000000000000000000000001 (mask!30552 (_2!7910 lt!461649))))) (not (= (size!32232 (_keys!11693 (_2!7910 lt!461649))) (size!32233 (_values!6444 (_2!7910 lt!461649))))) (bvslt (mask!30552 (_2!7910 lt!461649)) #b00000000000000000000000000000000) (bvslt (extraKeys!6149 (_2!7910 lt!461649)) #b00000000000000000000000000000000) (bvsle (extraKeys!6149 (_2!7910 lt!461649)) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!38936 () Bool)

(declare-fun mapRes!38936 () Bool)

(assert (=> mapIsEmpty!38936 mapRes!38936))

(declare-fun mapNonEmpty!38936 () Bool)

(declare-fun tp!74687 () Bool)

(declare-fun e!592720 () Bool)

(assert (=> mapNonEmpty!38936 (= mapRes!38936 (and tp!74687 e!592720))))

(declare-fun mapRest!38936 () (Array (_ BitVec 32) ValueCell!11728))

(declare-fun mapKey!38936 () (_ BitVec 32))

(declare-fun mapValue!38936 () ValueCell!11728)

(assert (=> mapNonEmpty!38936 (= (arr!31698 (_values!6444 thiss!1427)) (store mapRest!38936 mapKey!38936 mapValue!38936))))

(declare-fun b!1045599 () Bool)

(declare-fun res!696183 () Bool)

(assert (=> b!1045599 (=> res!696183 e!592726)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045599 (= res!696183 (not (validMask!0 (mask!30552 (_2!7910 lt!461649)))))))

(declare-fun b!1045600 () Bool)

(declare-fun e!592727 () Bool)

(declare-fun e!592721 () Bool)

(assert (=> b!1045600 (= e!592727 (and e!592721 mapRes!38936))))

(declare-fun condMapEmpty!38936 () Bool)

(declare-fun mapDefault!38936 () ValueCell!11728)

