; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90112 () Bool)

(assert start!90112)

(declare-fun b!1032303 () Bool)

(declare-fun b_free!20719 () Bool)

(declare-fun b_next!20719 () Bool)

(assert (=> b!1032303 (= b_free!20719 (not b_next!20719))))

(declare-fun tp!73227 () Bool)

(declare-fun b_and!33187 () Bool)

(assert (=> b!1032303 (= tp!73227 b_and!33187)))

(declare-fun mapNonEmpty!38112 () Bool)

(declare-fun mapRes!38112 () Bool)

(declare-fun tp!73228 () Bool)

(declare-fun e!583254 () Bool)

(assert (=> mapNonEmpty!38112 (= mapRes!38112 (and tp!73228 e!583254))))

(declare-fun mapKey!38112 () (_ BitVec 32))

(declare-datatypes ((V!37459 0))(
  ( (V!37460 (val!12270 Int)) )
))
(declare-datatypes ((ValueCell!11516 0))(
  ( (ValueCellFull!11516 (v!14847 V!37459)) (EmptyCell!11516) )
))
(declare-fun mapValue!38112 () ValueCell!11516)

(declare-fun mapRest!38112 () (Array (_ BitVec 32) ValueCell!11516))

(declare-datatypes ((array!64942 0))(
  ( (array!64943 (arr!31273 (Array (_ BitVec 32) (_ BitVec 64))) (size!31790 (_ BitVec 32))) )
))
(declare-datatypes ((array!64944 0))(
  ( (array!64945 (arr!31274 (Array (_ BitVec 32) ValueCell!11516)) (size!31791 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5626 0))(
  ( (LongMapFixedSize!5627 (defaultEntry!6187 Int) (mask!30003 (_ BitVec 32)) (extraKeys!5919 (_ BitVec 32)) (zeroValue!6023 V!37459) (minValue!6023 V!37459) (_size!2868 (_ BitVec 32)) (_keys!11360 array!64942) (_values!6210 array!64944) (_vacant!2868 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5626)

(assert (=> mapNonEmpty!38112 (= (arr!31274 (_values!6210 thiss!1427)) (store mapRest!38112 mapKey!38112 mapValue!38112))))

(declare-fun b!1032300 () Bool)

(declare-fun res!689987 () Bool)

(declare-fun e!583256 () Bool)

(assert (=> b!1032300 (=> (not res!689987) (not e!583256))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032300 (= res!689987 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1032301 () Bool)

(assert (=> b!1032301 (= e!583256 false)))

(declare-datatypes ((SeekEntryResult!9729 0))(
  ( (MissingZero!9729 (index!41287 (_ BitVec 32))) (Found!9729 (index!41288 (_ BitVec 32))) (Intermediate!9729 (undefined!10541 Bool) (index!41289 (_ BitVec 32)) (x!91985 (_ BitVec 32))) (Undefined!9729) (MissingVacant!9729 (index!41290 (_ BitVec 32))) )
))
(declare-fun lt!456023 () SeekEntryResult!9729)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64942 (_ BitVec 32)) SeekEntryResult!9729)

(assert (=> b!1032301 (= lt!456023 (seekEntry!0 key!909 (_keys!11360 thiss!1427) (mask!30003 thiss!1427)))))

(declare-fun mapIsEmpty!38112 () Bool)

(assert (=> mapIsEmpty!38112 mapRes!38112))

(declare-fun res!689986 () Bool)

(assert (=> start!90112 (=> (not res!689986) (not e!583256))))

(declare-fun valid!2129 (LongMapFixedSize!5626) Bool)

(assert (=> start!90112 (= res!689986 (valid!2129 thiss!1427))))

(assert (=> start!90112 e!583256))

(declare-fun e!583253 () Bool)

(assert (=> start!90112 e!583253))

(assert (=> start!90112 true))

(declare-fun b!1032302 () Bool)

(declare-fun e!583252 () Bool)

(declare-fun e!583257 () Bool)

(assert (=> b!1032302 (= e!583252 (and e!583257 mapRes!38112))))

(declare-fun condMapEmpty!38112 () Bool)

(declare-fun mapDefault!38112 () ValueCell!11516)

