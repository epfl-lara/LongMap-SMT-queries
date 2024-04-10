; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91652 () Bool)

(assert start!91652)

(declare-fun b!1043364 () Bool)

(declare-fun b_free!21089 () Bool)

(declare-fun b_next!21089 () Bool)

(assert (=> b!1043364 (= b_free!21089 (not b_next!21089))))

(declare-fun tp!74505 () Bool)

(declare-fun b_and!33621 () Bool)

(assert (=> b!1043364 (= tp!74505 b_and!33621)))

(declare-fun b!1043363 () Bool)

(declare-fun res!695120 () Bool)

(declare-fun e!591135 () Bool)

(assert (=> b!1043363 (=> res!695120 e!591135)))

(declare-datatypes ((V!37951 0))(
  ( (V!37952 (val!12455 Int)) )
))
(declare-datatypes ((ValueCell!11701 0))(
  ( (ValueCellFull!11701 (v!15046 V!37951)) (EmptyCell!11701) )
))
(declare-datatypes ((array!65780 0))(
  ( (array!65781 (arr!31643 (Array (_ BitVec 32) (_ BitVec 64))) (size!32178 (_ BitVec 32))) )
))
(declare-datatypes ((array!65782 0))(
  ( (array!65783 (arr!31644 (Array (_ BitVec 32) ValueCell!11701)) (size!32179 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5996 0))(
  ( (LongMapFixedSize!5997 (defaultEntry!6380 Int) (mask!30467 (_ BitVec 32)) (extraKeys!6108 (_ BitVec 32)) (zeroValue!6214 V!37951) (minValue!6214 V!37951) (_size!3053 (_ BitVec 32)) (_keys!11638 array!65780) (_values!6403 array!65782) (_vacant!3053 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5996)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65780 (_ BitVec 32)) Bool)

(assert (=> b!1043363 (= res!695120 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11638 thiss!1427) (mask!30467 thiss!1427))))))

(declare-fun mapIsEmpty!38834 () Bool)

(declare-fun mapRes!38834 () Bool)

(assert (=> mapIsEmpty!38834 mapRes!38834))

(declare-fun tp_is_empty!24809 () Bool)

(declare-fun e!591137 () Bool)

(declare-fun e!591134 () Bool)

(declare-fun array_inv!24447 (array!65780) Bool)

(declare-fun array_inv!24448 (array!65782) Bool)

(assert (=> b!1043364 (= e!591134 (and tp!74505 tp_is_empty!24809 (array_inv!24447 (_keys!11638 thiss!1427)) (array_inv!24448 (_values!6403 thiss!1427)) e!591137))))

(declare-fun res!695119 () Bool)

(declare-fun e!591138 () Bool)

(assert (=> start!91652 (=> (not res!695119) (not e!591138))))

(declare-fun valid!2251 (LongMapFixedSize!5996) Bool)

(assert (=> start!91652 (= res!695119 (valid!2251 thiss!1427))))

(assert (=> start!91652 e!591138))

(assert (=> start!91652 e!591134))

(assert (=> start!91652 true))

(declare-fun b!1043365 () Bool)

(declare-fun e!591136 () Bool)

(assert (=> b!1043365 (= e!591136 tp_is_empty!24809)))

(declare-fun b!1043366 () Bool)

(declare-fun res!695121 () Bool)

(assert (=> b!1043366 (=> (not res!695121) (not e!591138))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1043366 (= res!695121 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043367 () Bool)

(declare-fun e!591141 () Bool)

(assert (=> b!1043367 (= e!591138 e!591141)))

(declare-fun res!695124 () Bool)

(assert (=> b!1043367 (=> (not res!695124) (not e!591141))))

(declare-datatypes ((SeekEntryResult!9828 0))(
  ( (MissingZero!9828 (index!41683 (_ BitVec 32))) (Found!9828 (index!41684 (_ BitVec 32))) (Intermediate!9828 (undefined!10640 Bool) (index!41685 (_ BitVec 32)) (x!93144 (_ BitVec 32))) (Undefined!9828) (MissingVacant!9828 (index!41686 (_ BitVec 32))) )
))
(declare-fun lt!459886 () SeekEntryResult!9828)

(assert (=> b!1043367 (= res!695124 (is-Found!9828 lt!459886))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65780 (_ BitVec 32)) SeekEntryResult!9828)

(assert (=> b!1043367 (= lt!459886 (seekEntry!0 key!909 (_keys!11638 thiss!1427) (mask!30467 thiss!1427)))))

(declare-fun mapNonEmpty!38834 () Bool)

(declare-fun tp!74504 () Bool)

(declare-fun e!591139 () Bool)

(assert (=> mapNonEmpty!38834 (= mapRes!38834 (and tp!74504 e!591139))))

(declare-fun mapKey!38834 () (_ BitVec 32))

(declare-fun mapRest!38834 () (Array (_ BitVec 32) ValueCell!11701))

(declare-fun mapValue!38834 () ValueCell!11701)

(assert (=> mapNonEmpty!38834 (= (arr!31644 (_values!6403 thiss!1427)) (store mapRest!38834 mapKey!38834 mapValue!38834))))

(declare-fun b!1043368 () Bool)

(assert (=> b!1043368 (= e!591139 tp_is_empty!24809)))

(declare-fun b!1043369 () Bool)

(assert (=> b!1043369 (= e!591137 (and e!591136 mapRes!38834))))

(declare-fun condMapEmpty!38834 () Bool)

(declare-fun mapDefault!38834 () ValueCell!11701)

