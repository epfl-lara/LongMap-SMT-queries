; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75796 () Bool)

(assert start!75796)

(declare-fun b!891552 () Bool)

(declare-fun b_free!15767 () Bool)

(declare-fun b_next!15767 () Bool)

(assert (=> b!891552 (= b_free!15767 (not b_next!15767))))

(declare-fun tp!55269 () Bool)

(declare-fun b_and!26007 () Bool)

(assert (=> b!891552 (= tp!55269 b_and!26007)))

(declare-fun b!891547 () Bool)

(declare-fun res!604043 () Bool)

(declare-fun e!497519 () Bool)

(assert (=> b!891547 (=> res!604043 e!497519)))

(declare-datatypes ((array!52170 0))(
  ( (array!52171 (arr!25091 (Array (_ BitVec 32) (_ BitVec 64))) (size!25535 (_ BitVec 32))) )
))
(declare-datatypes ((V!29091 0))(
  ( (V!29092 (val!9098 Int)) )
))
(declare-datatypes ((ValueCell!8566 0))(
  ( (ValueCellFull!8566 (v!11576 V!29091)) (EmptyCell!8566) )
))
(declare-datatypes ((array!52172 0))(
  ( (array!52173 (arr!25092 (Array (_ BitVec 32) ValueCell!8566)) (size!25536 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4148 0))(
  ( (LongMapFixedSize!4149 (defaultEntry!5271 Int) (mask!25766 (_ BitVec 32)) (extraKeys!4965 (_ BitVec 32)) (zeroValue!5069 V!29091) (minValue!5069 V!29091) (_size!2129 (_ BitVec 32)) (_keys!9954 array!52170) (_values!5256 array!52172) (_vacant!2129 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4148)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52170 (_ BitVec 32)) Bool)

(assert (=> b!891547 (= res!604043 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9954 thiss!1181) (mask!25766 thiss!1181))))))

(declare-fun b!891548 () Bool)

(declare-fun e!497518 () Bool)

(assert (=> b!891548 (= e!497518 e!497519)))

(declare-fun res!604036 () Bool)

(assert (=> b!891548 (=> res!604036 e!497519)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891548 (= res!604036 (not (validMask!0 (mask!25766 thiss!1181))))))

(declare-datatypes ((tuple2!11954 0))(
  ( (tuple2!11955 (_1!5988 (_ BitVec 64)) (_2!5988 V!29091)) )
))
(declare-datatypes ((List!17747 0))(
  ( (Nil!17744) (Cons!17743 (h!18874 tuple2!11954) (t!25046 List!17747)) )
))
(declare-datatypes ((ListLongMap!10651 0))(
  ( (ListLongMap!10652 (toList!5341 List!17747)) )
))
(declare-fun lt!402743 () ListLongMap!10651)

(declare-datatypes ((SeekEntryResult!8826 0))(
  ( (MissingZero!8826 (index!37675 (_ BitVec 32))) (Found!8826 (index!37676 (_ BitVec 32))) (Intermediate!8826 (undefined!9638 Bool) (index!37677 (_ BitVec 32)) (x!75754 (_ BitVec 32))) (Undefined!8826) (MissingVacant!8826 (index!37678 (_ BitVec 32))) )
))
(declare-fun lt!402748 () SeekEntryResult!8826)

(declare-fun contains!4343 (ListLongMap!10651 (_ BitVec 64)) Bool)

(assert (=> b!891548 (contains!4343 lt!402743 (select (arr!25091 (_keys!9954 thiss!1181)) (index!37676 lt!402748)))))

(declare-fun getCurrentListMap!2624 (array!52170 array!52172 (_ BitVec 32) (_ BitVec 32) V!29091 V!29091 (_ BitVec 32) Int) ListLongMap!10651)

(assert (=> b!891548 (= lt!402743 (getCurrentListMap!2624 (_keys!9954 thiss!1181) (_values!5256 thiss!1181) (mask!25766 thiss!1181) (extraKeys!4965 thiss!1181) (zeroValue!5069 thiss!1181) (minValue!5069 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5271 thiss!1181)))))

(declare-datatypes ((Unit!30348 0))(
  ( (Unit!30349) )
))
(declare-fun lt!402747 () Unit!30348)

(declare-fun lemmaValidKeyInArrayIsInListMap!213 (array!52170 array!52172 (_ BitVec 32) (_ BitVec 32) V!29091 V!29091 (_ BitVec 32) Int) Unit!30348)

(assert (=> b!891548 (= lt!402747 (lemmaValidKeyInArrayIsInListMap!213 (_keys!9954 thiss!1181) (_values!5256 thiss!1181) (mask!25766 thiss!1181) (extraKeys!4965 thiss!1181) (zeroValue!5069 thiss!1181) (minValue!5069 thiss!1181) (index!37676 lt!402748) (defaultEntry!5271 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891548 (arrayContainsKey!0 (_keys!9954 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402745 () Unit!30348)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52170 (_ BitVec 64) (_ BitVec 32)) Unit!30348)

(assert (=> b!891548 (= lt!402745 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9954 thiss!1181) key!785 (index!37676 lt!402748)))))

(declare-fun mapIsEmpty!28697 () Bool)

(declare-fun mapRes!28697 () Bool)

(assert (=> mapIsEmpty!28697 mapRes!28697))

(declare-fun b!891549 () Bool)

(declare-fun e!497514 () Bool)

(declare-fun tp_is_empty!18095 () Bool)

(assert (=> b!891549 (= e!497514 tp_is_empty!18095)))

(declare-fun b!891550 () Bool)

(declare-fun res!604039 () Bool)

(declare-fun e!497520 () Bool)

(assert (=> b!891550 (=> (not res!604039) (not e!497520))))

(assert (=> b!891550 (= res!604039 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891551 () Bool)

(assert (=> b!891551 (= e!497519 true)))

(declare-fun lt!402744 () Bool)

(assert (=> b!891551 (= lt!402744 (contains!4343 lt!402743 key!785))))

(declare-fun b!891553 () Bool)

(declare-fun res!604037 () Bool)

(assert (=> b!891553 (=> res!604037 e!497519)))

(assert (=> b!891553 (= res!604037 (or (not (= (size!25536 (_values!5256 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25766 thiss!1181)))) (not (= (size!25535 (_keys!9954 thiss!1181)) (size!25536 (_values!5256 thiss!1181)))) (bvslt (mask!25766 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4965 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4965 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891554 () Bool)

(declare-fun res!604040 () Bool)

(assert (=> b!891554 (=> res!604040 e!497519)))

(declare-datatypes ((List!17748 0))(
  ( (Nil!17745) (Cons!17744 (h!18875 (_ BitVec 64)) (t!25047 List!17748)) )
))
(declare-fun arrayNoDuplicates!0 (array!52170 (_ BitVec 32) List!17748) Bool)

(assert (=> b!891554 (= res!604040 (not (arrayNoDuplicates!0 (_keys!9954 thiss!1181) #b00000000000000000000000000000000 Nil!17745)))))

(declare-fun mapNonEmpty!28697 () Bool)

(declare-fun tp!55270 () Bool)

(assert (=> mapNonEmpty!28697 (= mapRes!28697 (and tp!55270 e!497514))))

(declare-fun mapRest!28697 () (Array (_ BitVec 32) ValueCell!8566))

(declare-fun mapValue!28697 () ValueCell!8566)

(declare-fun mapKey!28697 () (_ BitVec 32))

(assert (=> mapNonEmpty!28697 (= (arr!25092 (_values!5256 thiss!1181)) (store mapRest!28697 mapKey!28697 mapValue!28697))))

(declare-fun b!891555 () Bool)

(declare-fun e!497515 () Bool)

(assert (=> b!891555 (= e!497515 tp_is_empty!18095)))

(declare-fun b!891556 () Bool)

(declare-fun e!497513 () Bool)

(assert (=> b!891556 (= e!497513 (and e!497515 mapRes!28697))))

(declare-fun condMapEmpty!28697 () Bool)

(declare-fun mapDefault!28697 () ValueCell!8566)

