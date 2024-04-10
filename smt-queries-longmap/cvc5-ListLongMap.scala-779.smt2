; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18436 () Bool)

(assert start!18436)

(declare-fun b!182891 () Bool)

(declare-fun b_free!4513 () Bool)

(declare-fun b_next!4513 () Bool)

(assert (=> b!182891 (= b_free!4513 (not b_next!4513))))

(declare-fun tp!16304 () Bool)

(declare-fun b_and!11079 () Bool)

(assert (=> b!182891 (= tp!16304 b_and!11079)))

(declare-fun e!120413 () Bool)

(declare-fun tp_is_empty!4285 () Bool)

(declare-fun e!120415 () Bool)

(declare-datatypes ((V!5361 0))(
  ( (V!5362 (val!2187 Int)) )
))
(declare-datatypes ((ValueCell!1799 0))(
  ( (ValueCellFull!1799 (v!4088 V!5361)) (EmptyCell!1799) )
))
(declare-datatypes ((array!7759 0))(
  ( (array!7760 (arr!3669 (Array (_ BitVec 32) (_ BitVec 64))) (size!3981 (_ BitVec 32))) )
))
(declare-datatypes ((array!7761 0))(
  ( (array!7762 (arr!3670 (Array (_ BitVec 32) ValueCell!1799)) (size!3982 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2506 0))(
  ( (LongMapFixedSize!2507 (defaultEntry!3741 Int) (mask!8794 (_ BitVec 32)) (extraKeys!3478 (_ BitVec 32)) (zeroValue!3582 V!5361) (minValue!3582 V!5361) (_size!1302 (_ BitVec 32)) (_keys!5656 array!7759) (_values!3724 array!7761) (_vacant!1302 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2506)

(declare-fun array_inv!2371 (array!7759) Bool)

(declare-fun array_inv!2372 (array!7761) Bool)

(assert (=> b!182891 (= e!120413 (and tp!16304 tp_is_empty!4285 (array_inv!2371 (_keys!5656 thiss!1248)) (array_inv!2372 (_values!3724 thiss!1248)) e!120415))))

(declare-fun mapNonEmpty!7355 () Bool)

(declare-fun mapRes!7355 () Bool)

(declare-fun tp!16303 () Bool)

(declare-fun e!120419 () Bool)

(assert (=> mapNonEmpty!7355 (= mapRes!7355 (and tp!16303 e!120419))))

(declare-fun mapKey!7355 () (_ BitVec 32))

(declare-fun mapRest!7355 () (Array (_ BitVec 32) ValueCell!1799))

(declare-fun mapValue!7355 () ValueCell!1799)

(assert (=> mapNonEmpty!7355 (= (arr!3670 (_values!3724 thiss!1248)) (store mapRest!7355 mapKey!7355 mapValue!7355))))

(declare-fun b!182892 () Bool)

(declare-fun res!86580 () Bool)

(declare-fun e!120416 () Bool)

(assert (=> b!182892 (=> (not res!86580) (not e!120416))))

(declare-datatypes ((List!2328 0))(
  ( (Nil!2325) (Cons!2324 (h!2953 (_ BitVec 64)) (t!7192 List!2328)) )
))
(declare-fun arrayNoDuplicates!0 (array!7759 (_ BitVec 32) List!2328) Bool)

(assert (=> b!182892 (= res!86580 (arrayNoDuplicates!0 (_keys!5656 thiss!1248) #b00000000000000000000000000000000 Nil!2325))))

(declare-fun b!182893 () Bool)

(declare-fun res!86573 () Bool)

(assert (=> b!182893 (=> (not res!86573) (not e!120416))))

(assert (=> b!182893 (= res!86573 (and (= (size!3982 (_values!3724 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8794 thiss!1248))) (= (size!3981 (_keys!5656 thiss!1248)) (size!3982 (_values!3724 thiss!1248))) (bvsge (mask!8794 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3478 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3478 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!182894 () Bool)

(declare-fun e!120417 () Bool)

(assert (=> b!182894 (= e!120417 e!120416)))

(declare-fun res!86576 () Bool)

(assert (=> b!182894 (=> (not res!86576) (not e!120416))))

(declare-datatypes ((SeekEntryResult!613 0))(
  ( (MissingZero!613 (index!4622 (_ BitVec 32))) (Found!613 (index!4623 (_ BitVec 32))) (Intermediate!613 (undefined!1425 Bool) (index!4624 (_ BitVec 32)) (x!19931 (_ BitVec 32))) (Undefined!613) (MissingVacant!613 (index!4625 (_ BitVec 32))) )
))
(declare-fun lt!90418 () SeekEntryResult!613)

(assert (=> b!182894 (= res!86576 (and (not (is-Undefined!613 lt!90418)) (not (is-MissingVacant!613 lt!90418)) (not (is-MissingZero!613 lt!90418)) (is-Found!613 lt!90418)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7759 (_ BitVec 32)) SeekEntryResult!613)

(assert (=> b!182894 (= lt!90418 (seekEntryOrOpen!0 key!828 (_keys!5656 thiss!1248) (mask!8794 thiss!1248)))))

(declare-fun b!182895 () Bool)

(declare-fun res!86578 () Bool)

(assert (=> b!182895 (=> (not res!86578) (not e!120416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182895 (= res!86578 (validMask!0 (mask!8794 thiss!1248)))))

(declare-fun b!182896 () Bool)

(declare-fun e!120414 () Bool)

(assert (=> b!182896 (= e!120415 (and e!120414 mapRes!7355))))

(declare-fun condMapEmpty!7355 () Bool)

(declare-fun mapDefault!7355 () ValueCell!1799)

