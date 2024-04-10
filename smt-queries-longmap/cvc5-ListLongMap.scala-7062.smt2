; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89426 () Bool)

(assert start!89426)

(declare-fun b!1025389 () Bool)

(declare-fun b_free!20425 () Bool)

(declare-fun b_next!20425 () Bool)

(assert (=> b!1025389 (= b_free!20425 (not b_next!20425))))

(declare-fun tp!72320 () Bool)

(declare-fun b_and!32671 () Bool)

(assert (=> b!1025389 (= tp!72320 b_and!32671)))

(declare-fun mapIsEmpty!37646 () Bool)

(declare-fun mapRes!37646 () Bool)

(assert (=> mapIsEmpty!37646 mapRes!37646))

(declare-fun b!1025386 () Bool)

(declare-fun res!686499 () Bool)

(declare-fun e!578151 () Bool)

(assert (=> b!1025386 (=> res!686499 e!578151)))

(declare-datatypes ((V!37067 0))(
  ( (V!37068 (val!12123 Int)) )
))
(declare-datatypes ((ValueCell!11369 0))(
  ( (ValueCellFull!11369 (v!14692 V!37067)) (EmptyCell!11369) )
))
(declare-datatypes ((array!64340 0))(
  ( (array!64341 (arr!30979 (Array (_ BitVec 32) (_ BitVec 64))) (size!31492 (_ BitVec 32))) )
))
(declare-datatypes ((array!64342 0))(
  ( (array!64343 (arr!30980 (Array (_ BitVec 32) ValueCell!11369)) (size!31493 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5332 0))(
  ( (LongMapFixedSize!5333 (defaultEntry!6018 Int) (mask!29688 (_ BitVec 32)) (extraKeys!5750 (_ BitVec 32)) (zeroValue!5854 V!37067) (minValue!5854 V!37067) (_size!2721 (_ BitVec 32)) (_keys!11165 array!64340) (_values!6041 array!64342) (_vacant!2721 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5332)

(declare-datatypes ((SeekEntryResult!9617 0))(
  ( (MissingZero!9617 (index!40839 (_ BitVec 32))) (Found!9617 (index!40840 (_ BitVec 32))) (Intermediate!9617 (undefined!10429 Bool) (index!40841 (_ BitVec 32)) (x!91183 (_ BitVec 32))) (Undefined!9617) (MissingVacant!9617 (index!40842 (_ BitVec 32))) )
))
(declare-fun lt!450916 () SeekEntryResult!9617)

(assert (=> b!1025386 (= res!686499 (or (not (= (size!31492 (_keys!11165 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29688 thiss!1427)))) (bvslt (index!40840 lt!450916) #b00000000000000000000000000000000) (bvsge (index!40840 lt!450916) (size!31492 (_keys!11165 thiss!1427)))))))

(declare-fun b!1025387 () Bool)

(declare-fun e!578155 () Bool)

(declare-fun tp_is_empty!24145 () Bool)

(assert (=> b!1025387 (= e!578155 tp_is_empty!24145)))

(declare-fun b!1025388 () Bool)

(declare-fun e!578158 () Bool)

(declare-fun e!578154 () Bool)

(assert (=> b!1025388 (= e!578158 e!578154)))

(declare-fun res!686498 () Bool)

(assert (=> b!1025388 (=> (not res!686498) (not e!578154))))

(assert (=> b!1025388 (= res!686498 (is-Found!9617 lt!450916))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64340 (_ BitVec 32)) SeekEntryResult!9617)

(assert (=> b!1025388 (= lt!450916 (seekEntry!0 key!909 (_keys!11165 thiss!1427) (mask!29688 thiss!1427)))))

(declare-fun e!578157 () Bool)

(declare-fun e!578153 () Bool)

(declare-fun array_inv!23993 (array!64340) Bool)

(declare-fun array_inv!23994 (array!64342) Bool)

(assert (=> b!1025389 (= e!578153 (and tp!72320 tp_is_empty!24145 (array_inv!23993 (_keys!11165 thiss!1427)) (array_inv!23994 (_values!6041 thiss!1427)) e!578157))))

(declare-fun b!1025390 () Bool)

(declare-fun res!686501 () Bool)

(assert (=> b!1025390 (=> res!686501 e!578151)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025390 (= res!686501 (not (validKeyInArray!0 (select (arr!30979 (_keys!11165 thiss!1427)) (index!40840 lt!450916)))))))

(declare-fun b!1025391 () Bool)

(declare-fun e!578152 () Bool)

(assert (=> b!1025391 (= e!578152 tp_is_empty!24145)))

(declare-fun b!1025392 () Bool)

(assert (=> b!1025392 (= e!578157 (and e!578155 mapRes!37646))))

(declare-fun condMapEmpty!37646 () Bool)

(declare-fun mapDefault!37646 () ValueCell!11369)

