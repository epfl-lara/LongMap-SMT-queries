; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90522 () Bool)

(assert start!90522)

(declare-fun b!1035469 () Bool)

(declare-fun b_free!20845 () Bool)

(declare-fun b_next!20845 () Bool)

(assert (=> b!1035469 (= b_free!20845 (not b_next!20845))))

(declare-fun tp!73662 () Bool)

(declare-fun b_and!33345 () Bool)

(assert (=> b!1035469 (= tp!73662 b_and!33345)))

(declare-fun b!1035463 () Bool)

(declare-fun res!691368 () Bool)

(declare-fun e!585497 () Bool)

(assert (=> b!1035463 (=> (not res!691368) (not e!585497))))

(declare-datatypes ((V!37627 0))(
  ( (V!37628 (val!12333 Int)) )
))
(declare-datatypes ((ValueCell!11579 0))(
  ( (ValueCellFull!11579 (v!14913 V!37627)) (EmptyCell!11579) )
))
(declare-datatypes ((array!65224 0))(
  ( (array!65225 (arr!31399 (Array (_ BitVec 32) (_ BitVec 64))) (size!31927 (_ BitVec 32))) )
))
(declare-datatypes ((array!65226 0))(
  ( (array!65227 (arr!31400 (Array (_ BitVec 32) ValueCell!11579)) (size!31928 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5752 0))(
  ( (LongMapFixedSize!5753 (defaultEntry!6254 Int) (mask!30141 (_ BitVec 32)) (extraKeys!5984 (_ BitVec 32)) (zeroValue!6088 V!37627) (minValue!6090 V!37627) (_size!2931 (_ BitVec 32)) (_keys!11441 array!65224) (_values!6277 array!65226) (_vacant!2931 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5752)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035463 (= res!691368 (validMask!0 (mask!30141 thiss!1427)))))

(declare-fun b!1035464 () Bool)

(declare-fun e!585499 () Bool)

(declare-fun tp_is_empty!24565 () Bool)

(assert (=> b!1035464 (= e!585499 tp_is_empty!24565)))

(declare-fun b!1035465 () Bool)

(declare-fun e!585495 () Bool)

(assert (=> b!1035465 (= e!585495 tp_is_empty!24565)))

(declare-fun mapIsEmpty!38358 () Bool)

(declare-fun mapRes!38358 () Bool)

(assert (=> mapIsEmpty!38358 mapRes!38358))

(declare-fun b!1035466 () Bool)

(assert (=> b!1035466 (= e!585497 (and (= (size!31928 (_values!6277 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30141 thiss!1427))) (= (size!31927 (_keys!11441 thiss!1427)) (size!31928 (_values!6277 thiss!1427))) (bvsge (mask!30141 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5984 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5984 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5984 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsgt (bvand (extraKeys!5984 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011)))))

(declare-fun b!1035467 () Bool)

(declare-fun res!691370 () Bool)

(assert (=> b!1035467 (=> (not res!691370) (not e!585497))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035467 (= res!691370 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035468 () Bool)

(declare-fun e!585498 () Bool)

(assert (=> b!1035468 (= e!585498 (and e!585499 mapRes!38358))))

(declare-fun condMapEmpty!38358 () Bool)

(declare-fun mapDefault!38358 () ValueCell!11579)

