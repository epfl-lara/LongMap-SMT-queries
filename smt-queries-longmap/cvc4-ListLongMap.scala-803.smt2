; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19292 () Bool)

(assert start!19292)

(declare-fun b!189852 () Bool)

(declare-fun b_free!4661 () Bool)

(declare-fun b_next!4661 () Bool)

(assert (=> b!189852 (= b_free!4661 (not b_next!4661))))

(declare-fun tp!16819 () Bool)

(declare-fun b_and!11303 () Bool)

(assert (=> b!189852 (= tp!16819 b_and!11303)))

(declare-fun tp_is_empty!4433 () Bool)

(declare-fun e!124956 () Bool)

(declare-datatypes ((V!5557 0))(
  ( (V!5558 (val!2261 Int)) )
))
(declare-datatypes ((ValueCell!1873 0))(
  ( (ValueCellFull!1873 (v!4185 V!5557)) (EmptyCell!1873) )
))
(declare-datatypes ((array!8097 0))(
  ( (array!8098 (arr!3817 (Array (_ BitVec 32) (_ BitVec 64))) (size!4137 (_ BitVec 32))) )
))
(declare-datatypes ((array!8099 0))(
  ( (array!8100 (arr!3818 (Array (_ BitVec 32) ValueCell!1873)) (size!4138 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2654 0))(
  ( (LongMapFixedSize!2655 (defaultEntry!3875 Int) (mask!9068 (_ BitVec 32)) (extraKeys!3612 (_ BitVec 32)) (zeroValue!3716 V!5557) (minValue!3716 V!5557) (_size!1376 (_ BitVec 32)) (_keys!5843 array!8097) (_values!3858 array!8099) (_vacant!1376 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2654)

(declare-fun e!124958 () Bool)

(declare-fun array_inv!2473 (array!8097) Bool)

(declare-fun array_inv!2474 (array!8099) Bool)

(assert (=> b!189852 (= e!124958 (and tp!16819 tp_is_empty!4433 (array_inv!2473 (_keys!5843 thiss!1248)) (array_inv!2474 (_values!3858 thiss!1248)) e!124956))))

(declare-fun mapNonEmpty!7648 () Bool)

(declare-fun mapRes!7648 () Bool)

(declare-fun tp!16818 () Bool)

(declare-fun e!124960 () Bool)

(assert (=> mapNonEmpty!7648 (= mapRes!7648 (and tp!16818 e!124960))))

(declare-fun mapValue!7648 () ValueCell!1873)

(declare-fun mapKey!7648 () (_ BitVec 32))

(declare-fun mapRest!7648 () (Array (_ BitVec 32) ValueCell!1873))

(assert (=> mapNonEmpty!7648 (= (arr!3818 (_values!3858 thiss!1248)) (store mapRest!7648 mapKey!7648 mapValue!7648))))

(declare-fun b!189853 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun e!124955 () Bool)

(declare-datatypes ((SeekEntryResult!670 0))(
  ( (MissingZero!670 (index!4850 (_ BitVec 32))) (Found!670 (index!4851 (_ BitVec 32))) (Intermediate!670 (undefined!1482 Bool) (index!4852 (_ BitVec 32)) (x!20454 (_ BitVec 32))) (Undefined!670) (MissingVacant!670 (index!4853 (_ BitVec 32))) )
))
(declare-fun lt!94012 () SeekEntryResult!670)

(assert (=> b!189853 (= e!124955 (= (select (arr!3817 (_keys!5843 thiss!1248)) (index!4851 lt!94012)) key!828))))

(declare-fun mapIsEmpty!7648 () Bool)

(assert (=> mapIsEmpty!7648 mapRes!7648))

(declare-fun b!189854 () Bool)

(assert (=> b!189854 (= e!124960 tp_is_empty!4433)))

(declare-fun res!89767 () Bool)

(declare-fun e!124952 () Bool)

(assert (=> start!19292 (=> (not res!89767) (not e!124952))))

(declare-fun valid!1090 (LongMapFixedSize!2654) Bool)

(assert (=> start!19292 (= res!89767 (valid!1090 thiss!1248))))

(assert (=> start!19292 e!124952))

(assert (=> start!19292 e!124958))

(assert (=> start!19292 true))

(assert (=> start!19292 tp_is_empty!4433))

(declare-fun b!189855 () Bool)

(declare-fun e!124959 () Bool)

(assert (=> b!189855 (= e!124956 (and e!124959 mapRes!7648))))

(declare-fun condMapEmpty!7648 () Bool)

(declare-fun mapDefault!7648 () ValueCell!1873)

