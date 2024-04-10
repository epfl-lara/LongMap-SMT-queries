; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75786 () Bool)

(assert start!75786)

(declare-fun b!891375 () Bool)

(declare-fun b_free!15757 () Bool)

(declare-fun b_next!15757 () Bool)

(assert (=> b!891375 (= b_free!15757 (not b_next!15757))))

(declare-fun tp!55240 () Bool)

(declare-fun b_and!25997 () Bool)

(assert (=> b!891375 (= tp!55240 b_and!25997)))

(declare-fun b!891368 () Bool)

(declare-fun e!497384 () Bool)

(declare-fun tp_is_empty!18085 () Bool)

(assert (=> b!891368 (= e!497384 tp_is_empty!18085)))

(declare-fun b!891369 () Bool)

(declare-fun res!603919 () Bool)

(declare-fun e!497382 () Bool)

(assert (=> b!891369 (=> res!603919 e!497382)))

(declare-datatypes ((array!52150 0))(
  ( (array!52151 (arr!25081 (Array (_ BitVec 32) (_ BitVec 64))) (size!25525 (_ BitVec 32))) )
))
(declare-datatypes ((V!29079 0))(
  ( (V!29080 (val!9093 Int)) )
))
(declare-datatypes ((ValueCell!8561 0))(
  ( (ValueCellFull!8561 (v!11571 V!29079)) (EmptyCell!8561) )
))
(declare-datatypes ((array!52152 0))(
  ( (array!52153 (arr!25082 (Array (_ BitVec 32) ValueCell!8561)) (size!25526 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4138 0))(
  ( (LongMapFixedSize!4139 (defaultEntry!5266 Int) (mask!25759 (_ BitVec 32)) (extraKeys!4960 (_ BitVec 32)) (zeroValue!5064 V!29079) (minValue!5064 V!29079) (_size!2124 (_ BitVec 32)) (_keys!9949 array!52150) (_values!5251 array!52152) (_vacant!2124 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4138)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52150 (_ BitVec 32)) Bool)

(assert (=> b!891369 (= res!603919 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9949 thiss!1181) (mask!25759 thiss!1181))))))

(declare-fun b!891370 () Bool)

(declare-fun res!603916 () Bool)

(assert (=> b!891370 (=> res!603916 e!497382)))

(declare-datatypes ((List!17740 0))(
  ( (Nil!17737) (Cons!17736 (h!18867 (_ BitVec 64)) (t!25039 List!17740)) )
))
(declare-fun arrayNoDuplicates!0 (array!52150 (_ BitVec 32) List!17740) Bool)

(assert (=> b!891370 (= res!603916 (not (arrayNoDuplicates!0 (_keys!9949 thiss!1181) #b00000000000000000000000000000000 Nil!17737)))))

(declare-fun b!891371 () Bool)

(declare-fun e!497377 () Bool)

(declare-datatypes ((SeekEntryResult!8822 0))(
  ( (MissingZero!8822 (index!37659 (_ BitVec 32))) (Found!8822 (index!37660 (_ BitVec 32))) (Intermediate!8822 (undefined!9634 Bool) (index!37661 (_ BitVec 32)) (x!75742 (_ BitVec 32))) (Undefined!8822) (MissingVacant!8822 (index!37662 (_ BitVec 32))) )
))
(declare-fun lt!402657 () SeekEntryResult!8822)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891371 (= e!497377 (inRange!0 (index!37660 lt!402657) (mask!25759 thiss!1181)))))

(declare-fun b!891372 () Bool)

(declare-fun e!497380 () Bool)

(assert (=> b!891372 (= e!497380 tp_is_empty!18085)))

(declare-fun b!891373 () Bool)

(assert (=> b!891373 (= e!497382 true)))

(declare-fun lt!402654 () Bool)

(declare-datatypes ((tuple2!11946 0))(
  ( (tuple2!11947 (_1!5984 (_ BitVec 64)) (_2!5984 V!29079)) )
))
(declare-datatypes ((List!17741 0))(
  ( (Nil!17738) (Cons!17737 (h!18868 tuple2!11946) (t!25040 List!17741)) )
))
(declare-datatypes ((ListLongMap!10643 0))(
  ( (ListLongMap!10644 (toList!5337 List!17741)) )
))
(declare-fun lt!402658 () ListLongMap!10643)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4339 (ListLongMap!10643 (_ BitVec 64)) Bool)

(assert (=> b!891373 (= lt!402654 (contains!4339 lt!402658 key!785))))

(declare-fun b!891374 () Bool)

(declare-fun e!497385 () Bool)

(assert (=> b!891374 (= e!497385 e!497382)))

(declare-fun res!603922 () Bool)

(assert (=> b!891374 (=> res!603922 e!497382)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891374 (= res!603922 (not (validMask!0 (mask!25759 thiss!1181))))))

(assert (=> b!891374 (contains!4339 lt!402658 (select (arr!25081 (_keys!9949 thiss!1181)) (index!37660 lt!402657)))))

(declare-fun getCurrentListMap!2620 (array!52150 array!52152 (_ BitVec 32) (_ BitVec 32) V!29079 V!29079 (_ BitVec 32) Int) ListLongMap!10643)

(assert (=> b!891374 (= lt!402658 (getCurrentListMap!2620 (_keys!9949 thiss!1181) (_values!5251 thiss!1181) (mask!25759 thiss!1181) (extraKeys!4960 thiss!1181) (zeroValue!5064 thiss!1181) (minValue!5064 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5266 thiss!1181)))))

(declare-datatypes ((Unit!30340 0))(
  ( (Unit!30341) )
))
(declare-fun lt!402656 () Unit!30340)

(declare-fun lemmaValidKeyInArrayIsInListMap!209 (array!52150 array!52152 (_ BitVec 32) (_ BitVec 32) V!29079 V!29079 (_ BitVec 32) Int) Unit!30340)

(assert (=> b!891374 (= lt!402656 (lemmaValidKeyInArrayIsInListMap!209 (_keys!9949 thiss!1181) (_values!5251 thiss!1181) (mask!25759 thiss!1181) (extraKeys!4960 thiss!1181) (zeroValue!5064 thiss!1181) (minValue!5064 thiss!1181) (index!37660 lt!402657) (defaultEntry!5266 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891374 (arrayContainsKey!0 (_keys!9949 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402653 () Unit!30340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52150 (_ BitVec 64) (_ BitVec 32)) Unit!30340)

(assert (=> b!891374 (= lt!402653 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9949 thiss!1181) key!785 (index!37660 lt!402657)))))

(declare-fun e!497378 () Bool)

(declare-fun e!497381 () Bool)

(declare-fun array_inv!19708 (array!52150) Bool)

(declare-fun array_inv!19709 (array!52152) Bool)

(assert (=> b!891375 (= e!497381 (and tp!55240 tp_is_empty!18085 (array_inv!19708 (_keys!9949 thiss!1181)) (array_inv!19709 (_values!5251 thiss!1181)) e!497378))))

(declare-fun b!891376 () Bool)

(declare-fun mapRes!28682 () Bool)

(assert (=> b!891376 (= e!497378 (and e!497380 mapRes!28682))))

(declare-fun condMapEmpty!28682 () Bool)

(declare-fun mapDefault!28682 () ValueCell!8561)

