; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90986 () Bool)

(assert start!90986)

(declare-fun b!1039342 () Bool)

(declare-fun b_free!20975 () Bool)

(declare-fun b_next!20975 () Bool)

(assert (=> b!1039342 (= b_free!20975 (not b_next!20975))))

(declare-fun tp!74101 () Bool)

(declare-fun b_and!33507 () Bool)

(assert (=> b!1039342 (= tp!74101 b_and!33507)))

(declare-fun e!588241 () Bool)

(declare-fun e!588239 () Bool)

(declare-fun tp_is_empty!24695 () Bool)

(declare-datatypes ((V!37799 0))(
  ( (V!37800 (val!12398 Int)) )
))
(declare-datatypes ((ValueCell!11644 0))(
  ( (ValueCellFull!11644 (v!14985 V!37799)) (EmptyCell!11644) )
))
(declare-datatypes ((array!65514 0))(
  ( (array!65515 (arr!31529 (Array (_ BitVec 32) (_ BitVec 64))) (size!32060 (_ BitVec 32))) )
))
(declare-datatypes ((array!65516 0))(
  ( (array!65517 (arr!31530 (Array (_ BitVec 32) ValueCell!11644)) (size!32061 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5882 0))(
  ( (LongMapFixedSize!5883 (defaultEntry!6323 Int) (mask!30285 (_ BitVec 32)) (extraKeys!6051 (_ BitVec 32)) (zeroValue!6157 V!37799) (minValue!6157 V!37799) (_size!2996 (_ BitVec 32)) (_keys!11532 array!65514) (_values!6346 array!65516) (_vacant!2996 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5882)

(declare-fun array_inv!24375 (array!65514) Bool)

(declare-fun array_inv!24376 (array!65516) Bool)

(assert (=> b!1039342 (= e!588239 (and tp!74101 tp_is_empty!24695 (array_inv!24375 (_keys!11532 thiss!1427)) (array_inv!24376 (_values!6346 thiss!1427)) e!588241))))

(declare-fun b!1039343 () Bool)

(declare-fun res!693150 () Bool)

(declare-fun e!588240 () Bool)

(assert (=> b!1039343 (=> (not res!693150) (not e!588240))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1039343 (= res!693150 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039344 () Bool)

(declare-fun e!588245 () Bool)

(assert (=> b!1039344 (= e!588245 tp_is_empty!24695)))

(declare-fun b!1039345 () Bool)

(declare-fun e!588242 () Bool)

(assert (=> b!1039345 (= e!588240 e!588242)))

(declare-fun res!693148 () Bool)

(assert (=> b!1039345 (=> (not res!693148) (not e!588242))))

(declare-datatypes ((SeekEntryResult!9782 0))(
  ( (MissingZero!9782 (index!41499 (_ BitVec 32))) (Found!9782 (index!41500 (_ BitVec 32))) (Intermediate!9782 (undefined!10594 Bool) (index!41501 (_ BitVec 32)) (x!92758 (_ BitVec 32))) (Undefined!9782) (MissingVacant!9782 (index!41502 (_ BitVec 32))) )
))
(declare-fun lt!458068 () SeekEntryResult!9782)

(assert (=> b!1039345 (= res!693148 (is-Found!9782 lt!458068))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65514 (_ BitVec 32)) SeekEntryResult!9782)

(assert (=> b!1039345 (= lt!458068 (seekEntry!0 key!909 (_keys!11532 thiss!1427) (mask!30285 thiss!1427)))))

(declare-fun mapIsEmpty!38602 () Bool)

(declare-fun mapRes!38602 () Bool)

(assert (=> mapIsEmpty!38602 mapRes!38602))

(declare-fun b!1039347 () Bool)

(declare-fun res!693151 () Bool)

(declare-fun e!588244 () Bool)

(assert (=> b!1039347 (=> res!693151 e!588244)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039347 (= res!693151 (not (validKeyInArray!0 (select (arr!31529 (_keys!11532 thiss!1427)) (index!41500 lt!458068)))))))

(declare-fun b!1039348 () Bool)

(declare-fun e!588243 () Bool)

(assert (=> b!1039348 (= e!588243 tp_is_empty!24695)))

(declare-fun b!1039349 () Bool)

(assert (=> b!1039349 (= e!588241 (and e!588243 mapRes!38602))))

(declare-fun condMapEmpty!38602 () Bool)

(declare-fun mapDefault!38602 () ValueCell!11644)

