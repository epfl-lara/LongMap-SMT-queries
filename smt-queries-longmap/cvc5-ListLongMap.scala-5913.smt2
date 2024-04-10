; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76620 () Bool)

(assert start!76620)

(declare-fun b!897328 () Bool)

(declare-fun b_free!15979 () Bool)

(declare-fun b_next!15979 () Bool)

(assert (=> b!897328 (= b_free!15979 (not b_next!15979))))

(declare-fun tp!55987 () Bool)

(declare-fun b_and!26271 () Bool)

(assert (=> b!897328 (= tp!55987 b_and!26271)))

(declare-fun mapNonEmpty!29096 () Bool)

(declare-fun mapRes!29096 () Bool)

(declare-fun tp!55986 () Bool)

(declare-fun e!501751 () Bool)

(assert (=> mapNonEmpty!29096 (= mapRes!29096 (and tp!55986 e!501751))))

(declare-datatypes ((V!29375 0))(
  ( (V!29376 (val!9204 Int)) )
))
(declare-datatypes ((ValueCell!8672 0))(
  ( (ValueCellFull!8672 (v!11694 V!29375)) (EmptyCell!8672) )
))
(declare-fun mapValue!29096 () ValueCell!8672)

(declare-datatypes ((array!52640 0))(
  ( (array!52641 (arr!25303 (Array (_ BitVec 32) (_ BitVec 64))) (size!25757 (_ BitVec 32))) )
))
(declare-datatypes ((array!52642 0))(
  ( (array!52643 (arr!25304 (Array (_ BitVec 32) ValueCell!8672)) (size!25758 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4360 0))(
  ( (LongMapFixedSize!4361 (defaultEntry!5392 Int) (mask!26077 (_ BitVec 32)) (extraKeys!5101 (_ BitVec 32)) (zeroValue!5205 V!29375) (minValue!5205 V!29375) (_size!2235 (_ BitVec 32)) (_keys!10147 array!52640) (_values!5392 array!52642) (_vacant!2235 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4360)

(declare-fun mapKey!29096 () (_ BitVec 32))

(declare-fun mapRest!29096 () (Array (_ BitVec 32) ValueCell!8672))

(assert (=> mapNonEmpty!29096 (= (arr!25304 (_values!5392 thiss!1181)) (store mapRest!29096 mapKey!29096 mapValue!29096))))

(declare-fun e!501752 () Bool)

(declare-fun e!501753 () Bool)

(declare-fun tp_is_empty!18307 () Bool)

(declare-fun array_inv!19858 (array!52640) Bool)

(declare-fun array_inv!19859 (array!52642) Bool)

(assert (=> b!897328 (= e!501753 (and tp!55987 tp_is_empty!18307 (array_inv!19858 (_keys!10147 thiss!1181)) (array_inv!19859 (_values!5392 thiss!1181)) e!501752))))

(declare-fun b!897329 () Bool)

(declare-fun res!606567 () Bool)

(declare-fun e!501749 () Bool)

(assert (=> b!897329 (=> (not res!606567) (not e!501749))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!897329 (= res!606567 (not (= key!785 (bvneg key!785))))))

(declare-fun b!897330 () Bool)

(declare-fun e!501754 () Bool)

(assert (=> b!897330 (= e!501749 (not e!501754))))

(declare-fun res!606566 () Bool)

(assert (=> b!897330 (=> res!606566 e!501754)))

(declare-datatypes ((SeekEntryResult!8907 0))(
  ( (MissingZero!8907 (index!37999 (_ BitVec 32))) (Found!8907 (index!38000 (_ BitVec 32))) (Intermediate!8907 (undefined!9719 Bool) (index!38001 (_ BitVec 32)) (x!76447 (_ BitVec 32))) (Undefined!8907) (MissingVacant!8907 (index!38002 (_ BitVec 32))) )
))
(declare-fun lt!405145 () SeekEntryResult!8907)

(assert (=> b!897330 (= res!606566 (not (is-Found!8907 lt!405145)))))

(declare-fun e!501748 () Bool)

(assert (=> b!897330 e!501748))

(declare-fun res!606564 () Bool)

(assert (=> b!897330 (=> res!606564 e!501748)))

(assert (=> b!897330 (= res!606564 (not (is-Found!8907 lt!405145)))))

(declare-datatypes ((Unit!30504 0))(
  ( (Unit!30505) )
))
(declare-fun lt!405144 () Unit!30504)

(declare-fun lemmaSeekEntryGivesInRangeIndex!78 (array!52640 array!52642 (_ BitVec 32) (_ BitVec 32) V!29375 V!29375 (_ BitVec 64)) Unit!30504)

(assert (=> b!897330 (= lt!405144 (lemmaSeekEntryGivesInRangeIndex!78 (_keys!10147 thiss!1181) (_values!5392 thiss!1181) (mask!26077 thiss!1181) (extraKeys!5101 thiss!1181) (zeroValue!5205 thiss!1181) (minValue!5205 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52640 (_ BitVec 32)) SeekEntryResult!8907)

(assert (=> b!897330 (= lt!405145 (seekEntry!0 key!785 (_keys!10147 thiss!1181) (mask!26077 thiss!1181)))))

(declare-fun b!897331 () Bool)

(assert (=> b!897331 (= e!501751 tp_is_empty!18307)))

(declare-fun b!897332 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897332 (= e!501748 (inRange!0 (index!38000 lt!405145) (mask!26077 thiss!1181)))))

(declare-fun res!606565 () Bool)

(assert (=> start!76620 (=> (not res!606565) (not e!501749))))

(declare-fun valid!1679 (LongMapFixedSize!4360) Bool)

(assert (=> start!76620 (= res!606565 (valid!1679 thiss!1181))))

(assert (=> start!76620 e!501749))

(assert (=> start!76620 e!501753))

(assert (=> start!76620 true))

(declare-fun b!897333 () Bool)

(declare-fun e!501750 () Bool)

(assert (=> b!897333 (= e!501752 (and e!501750 mapRes!29096))))

(declare-fun condMapEmpty!29096 () Bool)

(declare-fun mapDefault!29096 () ValueCell!8672)

