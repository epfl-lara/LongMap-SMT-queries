; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90300 () Bool)

(assert start!90300)

(declare-fun b!1033574 () Bool)

(declare-fun b_free!20797 () Bool)

(declare-fun b_next!20797 () Bool)

(assert (=> b!1033574 (= b_free!20797 (not b_next!20797))))

(declare-fun tp!73491 () Bool)

(declare-fun b_and!33265 () Bool)

(assert (=> b!1033574 (= tp!73491 b_and!33265)))

(declare-fun res!690576 () Bool)

(declare-fun e!584220 () Bool)

(assert (=> start!90300 (=> (not res!690576) (not e!584220))))

(declare-datatypes ((V!37563 0))(
  ( (V!37564 (val!12309 Int)) )
))
(declare-datatypes ((ValueCell!11555 0))(
  ( (ValueCellFull!11555 (v!14886 V!37563)) (EmptyCell!11555) )
))
(declare-datatypes ((array!65114 0))(
  ( (array!65115 (arr!31351 (Array (_ BitVec 32) (_ BitVec 64))) (size!31873 (_ BitVec 32))) )
))
(declare-datatypes ((array!65116 0))(
  ( (array!65117 (arr!31352 (Array (_ BitVec 32) ValueCell!11555)) (size!31874 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5704 0))(
  ( (LongMapFixedSize!5705 (defaultEntry!6226 Int) (mask!30083 (_ BitVec 32)) (extraKeys!5958 (_ BitVec 32)) (zeroValue!6062 V!37563) (minValue!6062 V!37563) (_size!2907 (_ BitVec 32)) (_keys!11406 array!65114) (_values!6249 array!65116) (_vacant!2907 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5704)

(declare-fun valid!2155 (LongMapFixedSize!5704) Bool)

(assert (=> start!90300 (= res!690576 (valid!2155 thiss!1427))))

(assert (=> start!90300 e!584220))

(declare-fun e!584224 () Bool)

(assert (=> start!90300 e!584224))

(assert (=> start!90300 true))

(declare-fun mapNonEmpty!38258 () Bool)

(declare-fun mapRes!38258 () Bool)

(declare-fun tp!73490 () Bool)

(declare-fun e!584223 () Bool)

(assert (=> mapNonEmpty!38258 (= mapRes!38258 (and tp!73490 e!584223))))

(declare-fun mapKey!38258 () (_ BitVec 32))

(declare-fun mapValue!38258 () ValueCell!11555)

(declare-fun mapRest!38258 () (Array (_ BitVec 32) ValueCell!11555))

(assert (=> mapNonEmpty!38258 (= (arr!31352 (_values!6249 thiss!1427)) (store mapRest!38258 mapKey!38258 mapValue!38258))))

(declare-fun e!584219 () Bool)

(declare-fun b!1033570 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun lt!456114 () LongMapFixedSize!5704)

(declare-datatypes ((tuple2!15724 0))(
  ( (tuple2!15725 (_1!7873 (_ BitVec 64)) (_2!7873 V!37563)) )
))
(declare-datatypes ((List!21904 0))(
  ( (Nil!21901) (Cons!21900 (h!23102 tuple2!15724) (t!31100 List!21904)) )
))
(declare-datatypes ((ListLongMap!13753 0))(
  ( (ListLongMap!13754 (toList!6892 List!21904)) )
))
(declare-fun map!14700 (LongMapFixedSize!5704) ListLongMap!13753)

(declare-fun -!519 (ListLongMap!13753 (_ BitVec 64)) ListLongMap!13753)

(assert (=> b!1033570 (= e!584219 (= (map!14700 lt!456114) (-!519 (map!14700 thiss!1427) key!909)))))

(declare-fun mapIsEmpty!38258 () Bool)

(assert (=> mapIsEmpty!38258 mapRes!38258))

(declare-fun b!1033571 () Bool)

(assert (=> b!1033571 (= e!584220 (not e!584219))))

(declare-fun res!690577 () Bool)

(assert (=> b!1033571 (=> (not res!690577) (not e!584219))))

(assert (=> b!1033571 (= res!690577 (valid!2155 lt!456114))))

(declare-fun lt!456115 () V!37563)

(assert (=> b!1033571 (= lt!456114 (LongMapFixedSize!5705 (defaultEntry!6226 thiss!1427) (mask!30083 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456115 (minValue!6062 thiss!1427) (_size!2907 thiss!1427) (_keys!11406 thiss!1427) (_values!6249 thiss!1427) (_vacant!2907 thiss!1427)))))

(declare-fun getCurrentListMap!3940 (array!65114 array!65116 (_ BitVec 32) (_ BitVec 32) V!37563 V!37563 (_ BitVec 32) Int) ListLongMap!13753)

(assert (=> b!1033571 (= (-!519 (getCurrentListMap!3940 (_keys!11406 thiss!1427) (_values!6249 thiss!1427) (mask!30083 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3940 (_keys!11406 thiss!1427) (_values!6249 thiss!1427) (mask!30083 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456115 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-datatypes ((Unit!33829 0))(
  ( (Unit!33830) )
))
(declare-fun lt!456116 () Unit!33829)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!11 (array!65114 array!65116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37563 V!37563 V!37563 Int) Unit!33829)

(assert (=> b!1033571 (= lt!456116 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!11 (_keys!11406 thiss!1427) (_values!6249 thiss!1427) (mask!30083 thiss!1427) (extraKeys!5958 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6062 thiss!1427) lt!456115 (minValue!6062 thiss!1427) (defaultEntry!6226 thiss!1427)))))

(declare-fun dynLambda!1989 (Int (_ BitVec 64)) V!37563)

(assert (=> b!1033571 (= lt!456115 (dynLambda!1989 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033572 () Bool)

(declare-fun tp_is_empty!24517 () Bool)

(assert (=> b!1033572 (= e!584223 tp_is_empty!24517)))

(declare-fun b!1033573 () Bool)

(declare-fun e!584218 () Bool)

(declare-fun e!584222 () Bool)

(assert (=> b!1033573 (= e!584218 (and e!584222 mapRes!38258))))

(declare-fun condMapEmpty!38258 () Bool)

(declare-fun mapDefault!38258 () ValueCell!11555)

