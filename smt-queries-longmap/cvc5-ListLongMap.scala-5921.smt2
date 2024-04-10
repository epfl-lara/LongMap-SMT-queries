; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76948 () Bool)

(assert start!76948)

(declare-fun b!899239 () Bool)

(declare-fun b_free!16027 () Bool)

(declare-fun b_next!16027 () Bool)

(assert (=> b!899239 (= b_free!16027 (not b_next!16027))))

(declare-fun tp!56157 () Bool)

(declare-fun b_and!26333 () Bool)

(assert (=> b!899239 (= tp!56157 b_and!26333)))

(declare-fun mapIsEmpty!29195 () Bool)

(declare-fun mapRes!29195 () Bool)

(assert (=> mapIsEmpty!29195 mapRes!29195))

(declare-fun b!899238 () Bool)

(declare-fun e!503123 () Bool)

(declare-fun tp_is_empty!18355 () Bool)

(assert (=> b!899238 (= e!503123 tp_is_empty!18355)))

(declare-fun e!503122 () Bool)

(declare-datatypes ((array!52752 0))(
  ( (array!52753 (arr!25351 (Array (_ BitVec 32) (_ BitVec 64))) (size!25808 (_ BitVec 32))) )
))
(declare-datatypes ((V!29439 0))(
  ( (V!29440 (val!9228 Int)) )
))
(declare-datatypes ((ValueCell!8696 0))(
  ( (ValueCellFull!8696 (v!11721 V!29439)) (EmptyCell!8696) )
))
(declare-datatypes ((array!52754 0))(
  ( (array!52755 (arr!25352 (Array (_ BitVec 32) ValueCell!8696)) (size!25809 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4408 0))(
  ( (LongMapFixedSize!4409 (defaultEntry!5426 Int) (mask!26178 (_ BitVec 32)) (extraKeys!5146 (_ BitVec 32)) (zeroValue!5250 V!29439) (minValue!5250 V!29439) (_size!2259 (_ BitVec 32)) (_keys!10213 array!52752) (_values!5437 array!52754) (_vacant!2259 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4408)

(declare-fun e!503125 () Bool)

(declare-fun array_inv!19894 (array!52752) Bool)

(declare-fun array_inv!19895 (array!52754) Bool)

(assert (=> b!899239 (= e!503125 (and tp!56157 tp_is_empty!18355 (array_inv!19894 (_keys!10213 thiss!1181)) (array_inv!19895 (_values!5437 thiss!1181)) e!503122))))

(declare-fun b!899240 () Bool)

(declare-fun e!503126 () Bool)

(declare-datatypes ((SeekEntryResult!8930 0))(
  ( (MissingZero!8930 (index!38091 (_ BitVec 32))) (Found!8930 (index!38092 (_ BitVec 32))) (Intermediate!8930 (undefined!9742 Bool) (index!38093 (_ BitVec 32)) (x!76629 (_ BitVec 32))) (Undefined!8930) (MissingVacant!8930 (index!38094 (_ BitVec 32))) )
))
(declare-fun lt!406094 () SeekEntryResult!8930)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!899240 (= e!503126 (inRange!0 (index!38092 lt!406094) (mask!26178 thiss!1181)))))

(declare-fun b!899241 () Bool)

(declare-fun e!503128 () Bool)

(assert (=> b!899241 (= e!503128 tp_is_empty!18355)))

(declare-fun res!607517 () Bool)

(declare-fun e!503124 () Bool)

(assert (=> start!76948 (=> (not res!607517) (not e!503124))))

(declare-fun valid!1694 (LongMapFixedSize!4408) Bool)

(assert (=> start!76948 (= res!607517 (valid!1694 thiss!1181))))

(assert (=> start!76948 e!503124))

(assert (=> start!76948 e!503125))

(assert (=> start!76948 true))

(declare-fun b!899242 () Bool)

(declare-fun e!503120 () Bool)

(declare-fun e!503121 () Bool)

(assert (=> b!899242 (= e!503120 e!503121)))

(declare-fun res!607519 () Bool)

(assert (=> b!899242 (=> res!607519 e!503121)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!899242 (= res!607519 (not (validMask!0 (mask!26178 thiss!1181))))))

(declare-datatypes ((tuple2!12042 0))(
  ( (tuple2!12043 (_1!6032 (_ BitVec 64)) (_2!6032 V!29439)) )
))
(declare-datatypes ((List!17846 0))(
  ( (Nil!17843) (Cons!17842 (h!18986 tuple2!12042) (t!25191 List!17846)) )
))
(declare-datatypes ((ListLongMap!10739 0))(
  ( (ListLongMap!10740 (toList!5385 List!17846)) )
))
(declare-fun contains!4418 (ListLongMap!10739 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2659 (array!52752 array!52754 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 32) Int) ListLongMap!10739)

(assert (=> b!899242 (contains!4418 (getCurrentListMap!2659 (_keys!10213 thiss!1181) (_values!5437 thiss!1181) (mask!26178 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)) (select (arr!25351 (_keys!10213 thiss!1181)) (index!38092 lt!406094)))))

(declare-datatypes ((Unit!30558 0))(
  ( (Unit!30559) )
))
(declare-fun lt!406095 () Unit!30558)

(declare-fun lemmaValidKeyInArrayIsInListMap!248 (array!52752 array!52754 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 32) Int) Unit!30558)

(assert (=> b!899242 (= lt!406095 (lemmaValidKeyInArrayIsInListMap!248 (_keys!10213 thiss!1181) (_values!5437 thiss!1181) (mask!26178 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) (index!38092 lt!406094) (defaultEntry!5426 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!899242 (arrayContainsKey!0 (_keys!10213 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406097 () Unit!30558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52752 (_ BitVec 64) (_ BitVec 32)) Unit!30558)

(assert (=> b!899242 (= lt!406097 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10213 thiss!1181) key!785 (index!38092 lt!406094)))))

(declare-fun b!899243 () Bool)

(declare-fun res!607516 () Bool)

(assert (=> b!899243 (=> (not res!607516) (not e!503124))))

(assert (=> b!899243 (= res!607516 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!29195 () Bool)

(declare-fun tp!56158 () Bool)

(assert (=> mapNonEmpty!29195 (= mapRes!29195 (and tp!56158 e!503128))))

(declare-fun mapRest!29195 () (Array (_ BitVec 32) ValueCell!8696))

(declare-fun mapValue!29195 () ValueCell!8696)

(declare-fun mapKey!29195 () (_ BitVec 32))

(assert (=> mapNonEmpty!29195 (= (arr!25352 (_values!5437 thiss!1181)) (store mapRest!29195 mapKey!29195 mapValue!29195))))

(declare-fun b!899244 () Bool)

(assert (=> b!899244 (= e!503122 (and e!503123 mapRes!29195))))

(declare-fun condMapEmpty!29195 () Bool)

(declare-fun mapDefault!29195 () ValueCell!8696)

