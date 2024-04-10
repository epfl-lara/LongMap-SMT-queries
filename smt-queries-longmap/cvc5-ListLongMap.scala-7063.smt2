; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89432 () Bool)

(assert start!89432)

(declare-fun b!1025493 () Bool)

(declare-fun b_free!20431 () Bool)

(declare-fun b_next!20431 () Bool)

(assert (=> b!1025493 (= b_free!20431 (not b_next!20431))))

(declare-fun tp!72339 () Bool)

(declare-fun b_and!32677 () Bool)

(assert (=> b!1025493 (= tp!72339 b_and!32677)))

(declare-fun b!1025485 () Bool)

(declare-fun res!686564 () Bool)

(declare-fun e!578223 () Bool)

(assert (=> b!1025485 (=> res!686564 e!578223)))

(declare-datatypes ((V!37075 0))(
  ( (V!37076 (val!12126 Int)) )
))
(declare-datatypes ((ValueCell!11372 0))(
  ( (ValueCellFull!11372 (v!14695 V!37075)) (EmptyCell!11372) )
))
(declare-datatypes ((array!64352 0))(
  ( (array!64353 (arr!30985 (Array (_ BitVec 32) (_ BitVec 64))) (size!31498 (_ BitVec 32))) )
))
(declare-datatypes ((array!64354 0))(
  ( (array!64355 (arr!30986 (Array (_ BitVec 32) ValueCell!11372)) (size!31499 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5338 0))(
  ( (LongMapFixedSize!5339 (defaultEntry!6021 Int) (mask!29693 (_ BitVec 32)) (extraKeys!5753 (_ BitVec 32)) (zeroValue!5857 V!37075) (minValue!5857 V!37075) (_size!2724 (_ BitVec 32)) (_keys!11168 array!64352) (_values!6044 array!64354) (_vacant!2724 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5338)

(declare-datatypes ((SeekEntryResult!9620 0))(
  ( (MissingZero!9620 (index!40851 (_ BitVec 32))) (Found!9620 (index!40852 (_ BitVec 32))) (Intermediate!9620 (undefined!10432 Bool) (index!40853 (_ BitVec 32)) (x!91194 (_ BitVec 32))) (Undefined!9620) (MissingVacant!9620 (index!40854 (_ BitVec 32))) )
))
(declare-fun lt!450960 () SeekEntryResult!9620)

(assert (=> b!1025485 (= res!686564 (or (not (= (size!31498 (_keys!11168 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29693 thiss!1427)))) (bvslt (index!40852 lt!450960) #b00000000000000000000000000000000) (bvsge (index!40852 lt!450960) (size!31498 (_keys!11168 thiss!1427)))))))

(declare-fun b!1025486 () Bool)

(assert (=> b!1025486 (= e!578223 true)))

(declare-fun lt!450962 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64352 (_ BitVec 32)) Bool)

(assert (=> b!1025486 (= lt!450962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11168 thiss!1427) (mask!29693 thiss!1427)))))

(declare-fun b!1025488 () Bool)

(declare-fun e!578227 () Bool)

(declare-fun e!578229 () Bool)

(declare-fun mapRes!37655 () Bool)

(assert (=> b!1025488 (= e!578227 (and e!578229 mapRes!37655))))

(declare-fun condMapEmpty!37655 () Bool)

(declare-fun mapDefault!37655 () ValueCell!11372)

