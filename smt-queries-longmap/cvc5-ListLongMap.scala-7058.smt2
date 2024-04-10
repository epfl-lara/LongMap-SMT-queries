; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89402 () Bool)

(assert start!89402)

(declare-fun b!1025000 () Bool)

(declare-fun b_free!20401 () Bool)

(declare-fun b_next!20401 () Bool)

(assert (=> b!1025000 (= b_free!20401 (not b_next!20401))))

(declare-fun tp!72249 () Bool)

(declare-fun b_and!32647 () Bool)

(assert (=> b!1025000 (= tp!72249 b_and!32647)))

(declare-fun b!1024990 () Bool)

(declare-fun res!686251 () Bool)

(declare-fun e!577865 () Bool)

(assert (=> b!1024990 (=> res!686251 e!577865)))

(declare-datatypes ((List!21740 0))(
  ( (Nil!21737) (Cons!21736 (h!22934 (_ BitVec 64)) (t!30802 List!21740)) )
))
(declare-fun contains!5956 (List!21740 (_ BitVec 64)) Bool)

(assert (=> b!1024990 (= res!686251 (contains!5956 Nil!21737 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024992 () Bool)

(declare-fun e!577868 () Bool)

(assert (=> b!1024992 (= e!577868 (not e!577865))))

(declare-fun res!686248 () Bool)

(assert (=> b!1024992 (=> res!686248 e!577865)))

(declare-datatypes ((V!37035 0))(
  ( (V!37036 (val!12111 Int)) )
))
(declare-datatypes ((ValueCell!11357 0))(
  ( (ValueCellFull!11357 (v!14680 V!37035)) (EmptyCell!11357) )
))
(declare-datatypes ((array!64292 0))(
  ( (array!64293 (arr!30955 (Array (_ BitVec 32) (_ BitVec 64))) (size!31468 (_ BitVec 32))) )
))
(declare-datatypes ((array!64294 0))(
  ( (array!64295 (arr!30956 (Array (_ BitVec 32) ValueCell!11357)) (size!31469 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5308 0))(
  ( (LongMapFixedSize!5309 (defaultEntry!6006 Int) (mask!29668 (_ BitVec 32)) (extraKeys!5738 (_ BitVec 32)) (zeroValue!5842 V!37035) (minValue!5842 V!37035) (_size!2709 (_ BitVec 32)) (_keys!11153 array!64292) (_values!6029 array!64294) (_vacant!2709 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5308)

(assert (=> b!1024992 (= res!686248 (or (bvsge (size!31468 (_keys!11153 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31468 (_keys!11153 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9605 0))(
  ( (MissingZero!9605 (index!40791 (_ BitVec 32))) (Found!9605 (index!40792 (_ BitVec 32))) (Intermediate!9605 (undefined!10417 Bool) (index!40793 (_ BitVec 32)) (x!91139 (_ BitVec 32))) (Undefined!9605) (MissingVacant!9605 (index!40794 (_ BitVec 32))) )
))
(declare-fun lt!450767 () SeekEntryResult!9605)

(declare-fun arrayCountValidKeys!0 (array!64292 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024992 (= (arrayCountValidKeys!0 (array!64293 (store (arr!30955 (_keys!11153 thiss!1427)) (index!40792 lt!450767) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31468 (_keys!11153 thiss!1427))) #b00000000000000000000000000000000 (size!31468 (_keys!11153 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11153 thiss!1427) #b00000000000000000000000000000000 (size!31468 (_keys!11153 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33367 0))(
  ( (Unit!33368) )
))
(declare-fun lt!450768 () Unit!33367)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64292 (_ BitVec 32) (_ BitVec 64)) Unit!33367)

(assert (=> b!1024992 (= lt!450768 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11153 thiss!1427) (index!40792 lt!450767) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024993 () Bool)

(declare-fun e!577866 () Bool)

(declare-fun e!577863 () Bool)

(declare-fun mapRes!37610 () Bool)

(assert (=> b!1024993 (= e!577866 (and e!577863 mapRes!37610))))

(declare-fun condMapEmpty!37610 () Bool)

(declare-fun mapDefault!37610 () ValueCell!11357)

