; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89438 () Bool)

(assert start!89438)

(declare-fun b!1025591 () Bool)

(declare-fun b_free!20437 () Bool)

(declare-fun b_next!20437 () Bool)

(assert (=> b!1025591 (= b_free!20437 (not b_next!20437))))

(declare-fun tp!72356 () Bool)

(declare-fun b_and!32683 () Bool)

(assert (=> b!1025591 (= tp!72356 b_and!32683)))

(declare-fun b!1025584 () Bool)

(declare-fun res!686625 () Bool)

(declare-fun e!578299 () Bool)

(assert (=> b!1025584 (=> res!686625 e!578299)))

(declare-datatypes ((V!37083 0))(
  ( (V!37084 (val!12129 Int)) )
))
(declare-datatypes ((ValueCell!11375 0))(
  ( (ValueCellFull!11375 (v!14698 V!37083)) (EmptyCell!11375) )
))
(declare-datatypes ((array!64364 0))(
  ( (array!64365 (arr!30991 (Array (_ BitVec 32) (_ BitVec 64))) (size!31504 (_ BitVec 32))) )
))
(declare-datatypes ((array!64366 0))(
  ( (array!64367 (arr!30992 (Array (_ BitVec 32) ValueCell!11375)) (size!31505 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5344 0))(
  ( (LongMapFixedSize!5345 (defaultEntry!6024 Int) (mask!29698 (_ BitVec 32)) (extraKeys!5756 (_ BitVec 32)) (zeroValue!5860 V!37083) (minValue!5860 V!37083) (_size!2727 (_ BitVec 32)) (_keys!11171 array!64364) (_values!6047 array!64366) (_vacant!2727 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5344)

(declare-datatypes ((SeekEntryResult!9623 0))(
  ( (MissingZero!9623 (index!40863 (_ BitVec 32))) (Found!9623 (index!40864 (_ BitVec 32))) (Intermediate!9623 (undefined!10435 Bool) (index!40865 (_ BitVec 32)) (x!91205 (_ BitVec 32))) (Undefined!9623) (MissingVacant!9623 (index!40866 (_ BitVec 32))) )
))
(declare-fun lt!451004 () SeekEntryResult!9623)

(assert (=> b!1025584 (= res!686625 (or (not (= (size!31504 (_keys!11171 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29698 thiss!1427)))) (bvslt (index!40864 lt!451004) #b00000000000000000000000000000000) (bvsge (index!40864 lt!451004) (size!31504 (_keys!11171 thiss!1427)))))))

(declare-fun b!1025585 () Bool)

(declare-fun e!578298 () Bool)

(declare-fun e!578300 () Bool)

(declare-fun mapRes!37664 () Bool)

(assert (=> b!1025585 (= e!578298 (and e!578300 mapRes!37664))))

(declare-fun condMapEmpty!37664 () Bool)

(declare-fun mapDefault!37664 () ValueCell!11375)

