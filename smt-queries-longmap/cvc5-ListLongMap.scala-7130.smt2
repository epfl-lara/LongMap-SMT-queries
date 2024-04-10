; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90494 () Bool)

(assert start!90494)

(declare-fun b!1035270 () Bool)

(declare-fun b_free!20833 () Bool)

(declare-fun b_next!20833 () Bool)

(assert (=> b!1035270 (= b_free!20833 (not b_next!20833))))

(declare-fun tp!73623 () Bool)

(declare-fun b_and!33333 () Bool)

(assert (=> b!1035270 (= tp!73623 b_and!33333)))

(declare-fun b!1035268 () Bool)

(declare-fun e!585348 () Bool)

(declare-fun tp_is_empty!24553 () Bool)

(assert (=> b!1035268 (= e!585348 tp_is_empty!24553)))

(declare-fun b!1035269 () Bool)

(declare-fun res!691279 () Bool)

(declare-fun e!585349 () Bool)

(assert (=> b!1035269 (=> (not res!691279) (not e!585349))))

(declare-datatypes ((V!37611 0))(
  ( (V!37612 (val!12327 Int)) )
))
(declare-datatypes ((ValueCell!11573 0))(
  ( (ValueCellFull!11573 (v!14907 V!37611)) (EmptyCell!11573) )
))
(declare-datatypes ((array!65198 0))(
  ( (array!65199 (arr!31387 (Array (_ BitVec 32) (_ BitVec 64))) (size!31914 (_ BitVec 32))) )
))
(declare-datatypes ((array!65200 0))(
  ( (array!65201 (arr!31388 (Array (_ BitVec 32) ValueCell!11573)) (size!31915 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5740 0))(
  ( (LongMapFixedSize!5741 (defaultEntry!6248 Int) (mask!30129 (_ BitVec 32)) (extraKeys!5978 (_ BitVec 32)) (zeroValue!6082 V!37611) (minValue!6084 V!37611) (_size!2925 (_ BitVec 32)) (_keys!11434 array!65198) (_values!6271 array!65200) (_vacant!2925 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5740)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035269 (= res!691279 (validMask!0 (mask!30129 thiss!1427)))))

(declare-fun e!585347 () Bool)

(declare-fun e!585345 () Bool)

(declare-fun array_inv!24279 (array!65198) Bool)

(declare-fun array_inv!24280 (array!65200) Bool)

(assert (=> b!1035270 (= e!585345 (and tp!73623 tp_is_empty!24553 (array_inv!24279 (_keys!11434 thiss!1427)) (array_inv!24280 (_values!6271 thiss!1427)) e!585347))))

(declare-fun mapNonEmpty!38336 () Bool)

(declare-fun mapRes!38336 () Bool)

(declare-fun tp!73622 () Bool)

(assert (=> mapNonEmpty!38336 (= mapRes!38336 (and tp!73622 e!585348))))

(declare-fun mapKey!38336 () (_ BitVec 32))

(declare-fun mapValue!38336 () ValueCell!11573)

(declare-fun mapRest!38336 () (Array (_ BitVec 32) ValueCell!11573))

(assert (=> mapNonEmpty!38336 (= (arr!31388 (_values!6271 thiss!1427)) (store mapRest!38336 mapKey!38336 mapValue!38336))))

(declare-fun b!1035271 () Bool)

(assert (=> b!1035271 (= e!585349 (and (= (size!31915 (_values!6271 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30129 thiss!1427))) (= (size!31914 (_keys!11434 thiss!1427)) (size!31915 (_values!6271 thiss!1427))) (bvsge (mask!30129 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5978 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5978 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!38336 () Bool)

(assert (=> mapIsEmpty!38336 mapRes!38336))

(declare-fun res!691278 () Bool)

(assert (=> start!90494 (=> (not res!691278) (not e!585349))))

(declare-fun valid!2168 (LongMapFixedSize!5740) Bool)

(assert (=> start!90494 (= res!691278 (valid!2168 thiss!1427))))

(assert (=> start!90494 e!585349))

(assert (=> start!90494 e!585345))

(assert (=> start!90494 true))

(declare-fun b!1035267 () Bool)

(declare-fun e!585346 () Bool)

(assert (=> b!1035267 (= e!585347 (and e!585346 mapRes!38336))))

(declare-fun condMapEmpty!38336 () Bool)

(declare-fun mapDefault!38336 () ValueCell!11573)

