; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76578 () Bool)

(assert start!76578)

(declare-fun b!897105 () Bool)

(declare-fun b_free!15973 () Bool)

(declare-fun b_next!15973 () Bool)

(assert (=> b!897105 (= b_free!15973 (not b_next!15973))))

(declare-fun tp!55964 () Bool)

(declare-fun b_and!26265 () Bool)

(assert (=> b!897105 (= tp!55964 b_and!26265)))

(declare-fun b!897100 () Bool)

(declare-fun e!501582 () Bool)

(declare-fun tp_is_empty!18301 () Bool)

(assert (=> b!897100 (= e!501582 tp_is_empty!18301)))

(declare-fun b!897101 () Bool)

(declare-fun e!501580 () Bool)

(declare-datatypes ((SeekEntryResult!8905 0))(
  ( (MissingZero!8905 (index!37991 (_ BitVec 32))) (Found!8905 (index!37992 (_ BitVec 32))) (Intermediate!8905 (undefined!9717 Bool) (index!37993 (_ BitVec 32)) (x!76420 (_ BitVec 32))) (Undefined!8905) (MissingVacant!8905 (index!37994 (_ BitVec 32))) )
))
(declare-fun lt!405064 () SeekEntryResult!8905)

(declare-datatypes ((array!52626 0))(
  ( (array!52627 (arr!25297 (Array (_ BitVec 32) (_ BitVec 64))) (size!25750 (_ BitVec 32))) )
))
(declare-datatypes ((V!29367 0))(
  ( (V!29368 (val!9201 Int)) )
))
(declare-datatypes ((ValueCell!8669 0))(
  ( (ValueCellFull!8669 (v!11691 V!29367)) (EmptyCell!8669) )
))
(declare-datatypes ((array!52628 0))(
  ( (array!52629 (arr!25298 (Array (_ BitVec 32) ValueCell!8669)) (size!25751 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4354 0))(
  ( (LongMapFixedSize!4355 (defaultEntry!5389 Int) (mask!26063 (_ BitVec 32)) (extraKeys!5096 (_ BitVec 32)) (zeroValue!5200 V!29367) (minValue!5200 V!29367) (_size!2232 (_ BitVec 32)) (_keys!10138 array!52626) (_values!5387 array!52628) (_vacant!2232 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4354)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897101 (= e!501580 (inRange!0 (index!37992 lt!405064) (mask!26063 thiss!1181)))))

(declare-fun b!897102 () Bool)

(declare-fun e!501584 () Bool)

(declare-fun e!501579 () Bool)

(assert (=> b!897102 (= e!501584 e!501579)))

(declare-fun res!606459 () Bool)

(assert (=> b!897102 (=> res!606459 e!501579)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897102 (= res!606459 (not (validMask!0 (mask!26063 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897102 (arrayContainsKey!0 (_keys!10138 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30500 0))(
  ( (Unit!30501) )
))
(declare-fun lt!405063 () Unit!30500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52626 (_ BitVec 64) (_ BitVec 32)) Unit!30500)

(assert (=> b!897102 (= lt!405063 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10138 thiss!1181) key!785 (index!37992 lt!405064)))))

(declare-fun mapNonEmpty!29083 () Bool)

(declare-fun mapRes!29083 () Bool)

(declare-fun tp!55965 () Bool)

(assert (=> mapNonEmpty!29083 (= mapRes!29083 (and tp!55965 e!501582))))

(declare-fun mapRest!29083 () (Array (_ BitVec 32) ValueCell!8669))

(declare-fun mapKey!29083 () (_ BitVec 32))

(declare-fun mapValue!29083 () ValueCell!8669)

(assert (=> mapNonEmpty!29083 (= (arr!25298 (_values!5387 thiss!1181)) (store mapRest!29083 mapKey!29083 mapValue!29083))))

(declare-fun b!897103 () Bool)

(declare-fun e!501583 () Bool)

(assert (=> b!897103 (= e!501583 (not e!501584))))

(declare-fun res!606461 () Bool)

(assert (=> b!897103 (=> res!606461 e!501584)))

(assert (=> b!897103 (= res!606461 (not (is-Found!8905 lt!405064)))))

(assert (=> b!897103 e!501580))

(declare-fun res!606462 () Bool)

(assert (=> b!897103 (=> res!606462 e!501580)))

(assert (=> b!897103 (= res!606462 (not (is-Found!8905 lt!405064)))))

(declare-fun lt!405062 () Unit!30500)

(declare-fun lemmaSeekEntryGivesInRangeIndex!76 (array!52626 array!52628 (_ BitVec 32) (_ BitVec 32) V!29367 V!29367 (_ BitVec 64)) Unit!30500)

(assert (=> b!897103 (= lt!405062 (lemmaSeekEntryGivesInRangeIndex!76 (_keys!10138 thiss!1181) (_values!5387 thiss!1181) (mask!26063 thiss!1181) (extraKeys!5096 thiss!1181) (zeroValue!5200 thiss!1181) (minValue!5200 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52626 (_ BitVec 32)) SeekEntryResult!8905)

(assert (=> b!897103 (= lt!405064 (seekEntry!0 key!785 (_keys!10138 thiss!1181) (mask!26063 thiss!1181)))))

(declare-fun e!501585 () Bool)

(declare-fun e!501581 () Bool)

(declare-fun array_inv!19854 (array!52626) Bool)

(declare-fun array_inv!19855 (array!52628) Bool)

(assert (=> b!897105 (= e!501581 (and tp!55964 tp_is_empty!18301 (array_inv!19854 (_keys!10138 thiss!1181)) (array_inv!19855 (_values!5387 thiss!1181)) e!501585))))

(declare-fun b!897106 () Bool)

(declare-fun e!501578 () Bool)

(assert (=> b!897106 (= e!501585 (and e!501578 mapRes!29083))))

(declare-fun condMapEmpty!29083 () Bool)

(declare-fun mapDefault!29083 () ValueCell!8669)

