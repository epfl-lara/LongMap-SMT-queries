; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75792 () Bool)

(assert start!75792)

(declare-fun b!891480 () Bool)

(declare-fun b_free!15763 () Bool)

(declare-fun b_next!15763 () Bool)

(assert (=> b!891480 (= b_free!15763 (not b_next!15763))))

(declare-fun tp!55257 () Bool)

(declare-fun b_and!26003 () Bool)

(assert (=> b!891480 (= tp!55257 b_and!26003)))

(declare-fun res!603991 () Bool)

(declare-fun e!497465 () Bool)

(assert (=> start!75792 (=> (not res!603991) (not e!497465))))

(declare-datatypes ((array!52162 0))(
  ( (array!52163 (arr!25087 (Array (_ BitVec 32) (_ BitVec 64))) (size!25531 (_ BitVec 32))) )
))
(declare-datatypes ((V!29087 0))(
  ( (V!29088 (val!9096 Int)) )
))
(declare-datatypes ((ValueCell!8564 0))(
  ( (ValueCellFull!8564 (v!11574 V!29087)) (EmptyCell!8564) )
))
(declare-datatypes ((array!52164 0))(
  ( (array!52165 (arr!25088 (Array (_ BitVec 32) ValueCell!8564)) (size!25532 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4144 0))(
  ( (LongMapFixedSize!4145 (defaultEntry!5269 Int) (mask!25764 (_ BitVec 32)) (extraKeys!4963 (_ BitVec 32)) (zeroValue!5067 V!29087) (minValue!5067 V!29087) (_size!2127 (_ BitVec 32)) (_keys!9952 array!52162) (_values!5254 array!52164) (_vacant!2127 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4144)

(declare-fun valid!1605 (LongMapFixedSize!4144) Bool)

(assert (=> start!75792 (= res!603991 (valid!1605 thiss!1181))))

(assert (=> start!75792 e!497465))

(declare-fun e!497464 () Bool)

(assert (=> start!75792 e!497464))

(assert (=> start!75792 true))

(declare-fun b!891475 () Bool)

(declare-fun e!497466 () Bool)

(declare-fun e!497459 () Bool)

(assert (=> b!891475 (= e!497466 e!497459)))

(declare-fun res!603988 () Bool)

(assert (=> b!891475 (=> res!603988 e!497459)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891475 (= res!603988 (not (validMask!0 (mask!25764 thiss!1181))))))

(declare-datatypes ((tuple2!11950 0))(
  ( (tuple2!11951 (_1!5986 (_ BitVec 64)) (_2!5986 V!29087)) )
))
(declare-datatypes ((List!17744 0))(
  ( (Nil!17741) (Cons!17740 (h!18871 tuple2!11950) (t!25043 List!17744)) )
))
(declare-datatypes ((ListLongMap!10647 0))(
  ( (ListLongMap!10648 (toList!5339 List!17744)) )
))
(declare-fun lt!402711 () ListLongMap!10647)

(declare-datatypes ((SeekEntryResult!8824 0))(
  ( (MissingZero!8824 (index!37667 (_ BitVec 32))) (Found!8824 (index!37668 (_ BitVec 32))) (Intermediate!8824 (undefined!9636 Bool) (index!37669 (_ BitVec 32)) (x!75752 (_ BitVec 32))) (Undefined!8824) (MissingVacant!8824 (index!37670 (_ BitVec 32))) )
))
(declare-fun lt!402712 () SeekEntryResult!8824)

(declare-fun contains!4341 (ListLongMap!10647 (_ BitVec 64)) Bool)

(assert (=> b!891475 (contains!4341 lt!402711 (select (arr!25087 (_keys!9952 thiss!1181)) (index!37668 lt!402712)))))

(declare-fun getCurrentListMap!2622 (array!52162 array!52164 (_ BitVec 32) (_ BitVec 32) V!29087 V!29087 (_ BitVec 32) Int) ListLongMap!10647)

(assert (=> b!891475 (= lt!402711 (getCurrentListMap!2622 (_keys!9952 thiss!1181) (_values!5254 thiss!1181) (mask!25764 thiss!1181) (extraKeys!4963 thiss!1181) (zeroValue!5067 thiss!1181) (minValue!5067 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5269 thiss!1181)))))

(declare-datatypes ((Unit!30344 0))(
  ( (Unit!30345) )
))
(declare-fun lt!402710 () Unit!30344)

(declare-fun lemmaValidKeyInArrayIsInListMap!211 (array!52162 array!52164 (_ BitVec 32) (_ BitVec 32) V!29087 V!29087 (_ BitVec 32) Int) Unit!30344)

(assert (=> b!891475 (= lt!402710 (lemmaValidKeyInArrayIsInListMap!211 (_keys!9952 thiss!1181) (_values!5254 thiss!1181) (mask!25764 thiss!1181) (extraKeys!4963 thiss!1181) (zeroValue!5067 thiss!1181) (minValue!5067 thiss!1181) (index!37668 lt!402712) (defaultEntry!5269 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52162 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891475 (arrayContainsKey!0 (_keys!9952 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402708 () Unit!30344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52162 (_ BitVec 64) (_ BitVec 32)) Unit!30344)

(assert (=> b!891475 (= lt!402708 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9952 thiss!1181) key!785 (index!37668 lt!402712)))))

(declare-fun b!891476 () Bool)

(declare-fun e!497460 () Bool)

(declare-fun e!497461 () Bool)

(declare-fun mapRes!28691 () Bool)

(assert (=> b!891476 (= e!497460 (and e!497461 mapRes!28691))))

(declare-fun condMapEmpty!28691 () Bool)

(declare-fun mapDefault!28691 () ValueCell!8564)

