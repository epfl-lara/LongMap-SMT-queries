; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90052 () Bool)

(assert start!90052)

(declare-fun b!1031386 () Bool)

(declare-fun b_free!20659 () Bool)

(declare-fun b_next!20659 () Bool)

(assert (=> b!1031386 (= b_free!20659 (not b_next!20659))))

(declare-fun tp!73047 () Bool)

(declare-fun b_and!33085 () Bool)

(assert (=> b!1031386 (= tp!73047 b_and!33085)))

(declare-fun b!1031377 () Bool)

(declare-fun res!689609 () Bool)

(declare-fun e!582522 () Bool)

(assert (=> b!1031377 (=> res!689609 e!582522)))

(declare-datatypes ((V!37379 0))(
  ( (V!37380 (val!12240 Int)) )
))
(declare-datatypes ((ValueCell!11486 0))(
  ( (ValueCellFull!11486 (v!14817 V!37379)) (EmptyCell!11486) )
))
(declare-datatypes ((Unit!33725 0))(
  ( (Unit!33726) )
))
(declare-datatypes ((array!64822 0))(
  ( (array!64823 (arr!31213 (Array (_ BitVec 32) (_ BitVec 64))) (size!31730 (_ BitVec 32))) )
))
(declare-datatypes ((array!64824 0))(
  ( (array!64825 (arr!31214 (Array (_ BitVec 32) ValueCell!11486)) (size!31731 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5566 0))(
  ( (LongMapFixedSize!5567 (defaultEntry!6157 Int) (mask!29953 (_ BitVec 32)) (extraKeys!5889 (_ BitVec 32)) (zeroValue!5993 V!37379) (minValue!5993 V!37379) (_size!2838 (_ BitVec 32)) (_keys!11330 array!64822) (_values!6180 array!64824) (_vacant!2838 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15652 0))(
  ( (tuple2!15653 (_1!7837 Unit!33725) (_2!7837 LongMapFixedSize!5566)) )
))
(declare-fun lt!455313 () tuple2!15652)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031377 (= res!689609 (not (validMask!0 (mask!29953 (_2!7837 lt!455313)))))))

(declare-fun b!1031378 () Bool)

(declare-fun e!582523 () Bool)

(declare-fun e!582524 () Bool)

(assert (=> b!1031378 (= e!582523 e!582524)))

(declare-fun res!689611 () Bool)

(assert (=> b!1031378 (=> (not res!689611) (not e!582524))))

(declare-datatypes ((SeekEntryResult!9706 0))(
  ( (MissingZero!9706 (index!41195 (_ BitVec 32))) (Found!9706 (index!41196 (_ BitVec 32))) (Intermediate!9706 (undefined!10518 Bool) (index!41197 (_ BitVec 32)) (x!91842 (_ BitVec 32))) (Undefined!9706) (MissingVacant!9706 (index!41198 (_ BitVec 32))) )
))
(declare-fun lt!455317 () SeekEntryResult!9706)

(assert (=> b!1031378 (= res!689611 (is-Found!9706 lt!455317))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun thiss!1427 () LongMapFixedSize!5566)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64822 (_ BitVec 32)) SeekEntryResult!9706)

(assert (=> b!1031378 (= lt!455317 (seekEntry!0 key!909 (_keys!11330 thiss!1427) (mask!29953 thiss!1427)))))

(declare-fun mapIsEmpty!38022 () Bool)

(declare-fun mapRes!38022 () Bool)

(assert (=> mapIsEmpty!38022 mapRes!38022))

(declare-fun res!689613 () Bool)

(assert (=> start!90052 (=> (not res!689613) (not e!582523))))

(declare-fun valid!2107 (LongMapFixedSize!5566) Bool)

(assert (=> start!90052 (= res!689613 (valid!2107 thiss!1427))))

(assert (=> start!90052 e!582523))

(declare-fun e!582519 () Bool)

(assert (=> start!90052 e!582519))

(assert (=> start!90052 true))

(declare-fun mapNonEmpty!38022 () Bool)

(declare-fun tp!73048 () Bool)

(declare-fun e!582518 () Bool)

(assert (=> mapNonEmpty!38022 (= mapRes!38022 (and tp!73048 e!582518))))

(declare-fun mapKey!38022 () (_ BitVec 32))

(declare-fun mapValue!38022 () ValueCell!11486)

(declare-fun mapRest!38022 () (Array (_ BitVec 32) ValueCell!11486))

(assert (=> mapNonEmpty!38022 (= (arr!31214 (_values!6180 thiss!1427)) (store mapRest!38022 mapKey!38022 mapValue!38022))))

(declare-fun b!1031379 () Bool)

(declare-fun e!582525 () Bool)

(declare-fun tp_is_empty!24379 () Bool)

(assert (=> b!1031379 (= e!582525 tp_is_empty!24379)))

(declare-fun b!1031380 () Bool)

(declare-fun res!689614 () Bool)

(assert (=> b!1031380 (=> res!689614 e!582522)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64822 (_ BitVec 32)) Bool)

(assert (=> b!1031380 (= res!689614 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11330 (_2!7837 lt!455313)) (mask!29953 (_2!7837 lt!455313)))))))

(declare-fun b!1031381 () Bool)

(declare-fun res!689615 () Bool)

(assert (=> b!1031381 (=> (not res!689615) (not e!582523))))

(assert (=> b!1031381 (= res!689615 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031382 () Bool)

(assert (=> b!1031382 (= e!582518 tp_is_empty!24379)))

(declare-fun b!1031383 () Bool)

(declare-fun e!582521 () Bool)

(assert (=> b!1031383 (= e!582521 (and e!582525 mapRes!38022))))

(declare-fun condMapEmpty!38022 () Bool)

(declare-fun mapDefault!38022 () ValueCell!11486)

