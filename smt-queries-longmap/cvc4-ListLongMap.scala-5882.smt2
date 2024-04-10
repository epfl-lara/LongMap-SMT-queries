; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75826 () Bool)

(assert start!75826)

(declare-fun b!892087 () Bool)

(declare-fun b_free!15797 () Bool)

(declare-fun b_next!15797 () Bool)

(assert (=> b!892087 (= b_free!15797 (not b_next!15797))))

(declare-fun tp!55360 () Bool)

(declare-fun b_and!26037 () Bool)

(assert (=> b!892087 (= tp!55360 b_and!26037)))

(declare-fun e!497919 () Bool)

(declare-fun tp_is_empty!18125 () Bool)

(declare-datatypes ((array!52230 0))(
  ( (array!52231 (arr!25121 (Array (_ BitVec 32) (_ BitVec 64))) (size!25565 (_ BitVec 32))) )
))
(declare-datatypes ((V!29131 0))(
  ( (V!29132 (val!9113 Int)) )
))
(declare-datatypes ((ValueCell!8581 0))(
  ( (ValueCellFull!8581 (v!11591 V!29131)) (EmptyCell!8581) )
))
(declare-datatypes ((array!52232 0))(
  ( (array!52233 (arr!25122 (Array (_ BitVec 32) ValueCell!8581)) (size!25566 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4178 0))(
  ( (LongMapFixedSize!4179 (defaultEntry!5286 Int) (mask!25791 (_ BitVec 32)) (extraKeys!4980 (_ BitVec 32)) (zeroValue!5084 V!29131) (minValue!5084 V!29131) (_size!2144 (_ BitVec 32)) (_keys!9969 array!52230) (_values!5271 array!52232) (_vacant!2144 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4178)

(declare-fun e!497920 () Bool)

(declare-fun array_inv!19736 (array!52230) Bool)

(declare-fun array_inv!19737 (array!52232) Bool)

(assert (=> b!892087 (= e!497920 (and tp!55360 tp_is_empty!18125 (array_inv!19736 (_keys!9969 thiss!1181)) (array_inv!19737 (_values!5271 thiss!1181)) e!497919))))

(declare-fun b!892088 () Bool)

(declare-fun res!604403 () Bool)

(declare-fun e!497922 () Bool)

(assert (=> b!892088 (=> (not res!604403) (not e!497922))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!892088 (= res!604403 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892089 () Bool)

(declare-fun res!604399 () Bool)

(declare-fun e!497923 () Bool)

(assert (=> b!892089 (=> res!604399 e!497923)))

(assert (=> b!892089 (= res!604399 (or (not (= (size!25566 (_values!5271 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25791 thiss!1181)))) (not (= (size!25565 (_keys!9969 thiss!1181)) (size!25566 (_values!5271 thiss!1181)))) (bvslt (mask!25791 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4980 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4980 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!892090 () Bool)

(declare-fun e!497925 () Bool)

(assert (=> b!892090 (= e!497925 e!497923)))

(declare-fun res!604401 () Bool)

(assert (=> b!892090 (=> res!604401 e!497923)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892090 (= res!604401 (not (validMask!0 (mask!25791 thiss!1181))))))

(declare-datatypes ((tuple2!11982 0))(
  ( (tuple2!11983 (_1!6002 (_ BitVec 64)) (_2!6002 V!29131)) )
))
(declare-datatypes ((List!17772 0))(
  ( (Nil!17769) (Cons!17768 (h!18899 tuple2!11982) (t!25071 List!17772)) )
))
(declare-datatypes ((ListLongMap!10679 0))(
  ( (ListLongMap!10680 (toList!5355 List!17772)) )
))
(declare-fun lt!403014 () ListLongMap!10679)

(declare-datatypes ((SeekEntryResult!8840 0))(
  ( (MissingZero!8840 (index!37731 (_ BitVec 32))) (Found!8840 (index!37732 (_ BitVec 32))) (Intermediate!8840 (undefined!9652 Bool) (index!37733 (_ BitVec 32)) (x!75808 (_ BitVec 32))) (Undefined!8840) (MissingVacant!8840 (index!37734 (_ BitVec 32))) )
))
(declare-fun lt!403017 () SeekEntryResult!8840)

(declare-fun contains!4357 (ListLongMap!10679 (_ BitVec 64)) Bool)

(assert (=> b!892090 (contains!4357 lt!403014 (select (arr!25121 (_keys!9969 thiss!1181)) (index!37732 lt!403017)))))

(declare-fun getCurrentListMap!2637 (array!52230 array!52232 (_ BitVec 32) (_ BitVec 32) V!29131 V!29131 (_ BitVec 32) Int) ListLongMap!10679)

(assert (=> b!892090 (= lt!403014 (getCurrentListMap!2637 (_keys!9969 thiss!1181) (_values!5271 thiss!1181) (mask!25791 thiss!1181) (extraKeys!4980 thiss!1181) (zeroValue!5084 thiss!1181) (minValue!5084 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5286 thiss!1181)))))

(declare-datatypes ((Unit!30376 0))(
  ( (Unit!30377) )
))
(declare-fun lt!403013 () Unit!30376)

(declare-fun lemmaValidKeyInArrayIsInListMap!226 (array!52230 array!52232 (_ BitVec 32) (_ BitVec 32) V!29131 V!29131 (_ BitVec 32) Int) Unit!30376)

(assert (=> b!892090 (= lt!403013 (lemmaValidKeyInArrayIsInListMap!226 (_keys!9969 thiss!1181) (_values!5271 thiss!1181) (mask!25791 thiss!1181) (extraKeys!4980 thiss!1181) (zeroValue!5084 thiss!1181) (minValue!5084 thiss!1181) (index!37732 lt!403017) (defaultEntry!5286 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892090 (arrayContainsKey!0 (_keys!9969 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403018 () Unit!30376)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52230 (_ BitVec 64) (_ BitVec 32)) Unit!30376)

(assert (=> b!892090 (= lt!403018 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9969 thiss!1181) key!785 (index!37732 lt!403017)))))

(declare-fun b!892091 () Bool)

(declare-fun res!604400 () Bool)

(assert (=> b!892091 (=> res!604400 e!497923)))

(declare-datatypes ((List!17773 0))(
  ( (Nil!17770) (Cons!17769 (h!18900 (_ BitVec 64)) (t!25072 List!17773)) )
))
(declare-fun arrayNoDuplicates!0 (array!52230 (_ BitVec 32) List!17773) Bool)

(assert (=> b!892091 (= res!604400 (not (arrayNoDuplicates!0 (_keys!9969 thiss!1181) #b00000000000000000000000000000000 Nil!17770)))))

(declare-fun b!892092 () Bool)

(declare-fun e!497924 () Bool)

(declare-fun mapRes!28742 () Bool)

(assert (=> b!892092 (= e!497919 (and e!497924 mapRes!28742))))

(declare-fun condMapEmpty!28742 () Bool)

(declare-fun mapDefault!28742 () ValueCell!8581)

