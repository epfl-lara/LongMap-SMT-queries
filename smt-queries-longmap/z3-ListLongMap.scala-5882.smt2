; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75990 () Bool)

(assert start!75990)

(declare-fun b!892923 () Bool)

(declare-fun b_free!15793 () Bool)

(declare-fun b_next!15793 () Bool)

(assert (=> b!892923 (= b_free!15793 (not b_next!15793))))

(declare-fun tp!55348 () Bool)

(declare-fun b_and!26043 () Bool)

(assert (=> b!892923 (= tp!55348 b_and!26043)))

(declare-fun b!892918 () Bool)

(declare-fun e!498448 () Bool)

(declare-fun tp_is_empty!18121 () Bool)

(assert (=> b!892918 (= e!498448 tp_is_empty!18121)))

(declare-fun mapNonEmpty!28736 () Bool)

(declare-fun mapRes!28736 () Bool)

(declare-fun tp!55349 () Bool)

(declare-fun e!498447 () Bool)

(assert (=> mapNonEmpty!28736 (= mapRes!28736 (and tp!55349 e!498447))))

(declare-datatypes ((V!29127 0))(
  ( (V!29128 (val!9111 Int)) )
))
(declare-datatypes ((ValueCell!8579 0))(
  ( (ValueCellFull!8579 (v!11586 V!29127)) (EmptyCell!8579) )
))
(declare-fun mapRest!28736 () (Array (_ BitVec 32) ValueCell!8579))

(declare-datatypes ((array!52261 0))(
  ( (array!52262 (arr!25132 (Array (_ BitVec 32) (_ BitVec 64))) (size!25577 (_ BitVec 32))) )
))
(declare-datatypes ((array!52263 0))(
  ( (array!52264 (arr!25133 (Array (_ BitVec 32) ValueCell!8579)) (size!25578 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4174 0))(
  ( (LongMapFixedSize!4175 (defaultEntry!5284 Int) (mask!25832 (_ BitVec 32)) (extraKeys!4978 (_ BitVec 32)) (zeroValue!5082 V!29127) (minValue!5082 V!29127) (_size!2142 (_ BitVec 32)) (_keys!9995 array!52261) (_values!5269 array!52263) (_vacant!2142 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4174)

(declare-fun mapKey!28736 () (_ BitVec 32))

(declare-fun mapValue!28736 () ValueCell!8579)

(assert (=> mapNonEmpty!28736 (= (arr!25133 (_values!5269 thiss!1181)) (store mapRest!28736 mapKey!28736 mapValue!28736))))

(declare-fun b!892920 () Bool)

(declare-fun e!498451 () Bool)

(declare-fun e!498453 () Bool)

(assert (=> b!892920 (= e!498451 e!498453)))

(declare-fun res!604698 () Bool)

(assert (=> b!892920 (=> res!604698 e!498453)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892920 (= res!604698 (not (validMask!0 (mask!25832 thiss!1181))))))

(declare-datatypes ((tuple2!11898 0))(
  ( (tuple2!11899 (_1!5960 (_ BitVec 64)) (_2!5960 V!29127)) )
))
(declare-datatypes ((List!17723 0))(
  ( (Nil!17720) (Cons!17719 (h!18856 tuple2!11898) (t!25014 List!17723)) )
))
(declare-datatypes ((ListLongMap!10597 0))(
  ( (ListLongMap!10598 (toList!5314 List!17723)) )
))
(declare-fun lt!403343 () ListLongMap!10597)

(declare-datatypes ((SeekEntryResult!8796 0))(
  ( (MissingZero!8796 (index!37555 (_ BitVec 32))) (Found!8796 (index!37556 (_ BitVec 32))) (Intermediate!8796 (undefined!9608 Bool) (index!37557 (_ BitVec 32)) (x!75778 (_ BitVec 32))) (Undefined!8796) (MissingVacant!8796 (index!37558 (_ BitVec 32))) )
))
(declare-fun lt!403342 () SeekEntryResult!8796)

(declare-fun contains!4327 (ListLongMap!10597 (_ BitVec 64)) Bool)

(assert (=> b!892920 (contains!4327 lt!403343 (select (arr!25132 (_keys!9995 thiss!1181)) (index!37556 lt!403342)))))

(declare-fun getCurrentListMap!2591 (array!52261 array!52263 (_ BitVec 32) (_ BitVec 32) V!29127 V!29127 (_ BitVec 32) Int) ListLongMap!10597)

(assert (=> b!892920 (= lt!403343 (getCurrentListMap!2591 (_keys!9995 thiss!1181) (_values!5269 thiss!1181) (mask!25832 thiss!1181) (extraKeys!4978 thiss!1181) (zeroValue!5082 thiss!1181) (minValue!5082 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5284 thiss!1181)))))

(declare-datatypes ((Unit!30360 0))(
  ( (Unit!30361) )
))
(declare-fun lt!403339 () Unit!30360)

(declare-fun lemmaValidKeyInArrayIsInListMap!221 (array!52261 array!52263 (_ BitVec 32) (_ BitVec 32) V!29127 V!29127 (_ BitVec 32) Int) Unit!30360)

(assert (=> b!892920 (= lt!403339 (lemmaValidKeyInArrayIsInListMap!221 (_keys!9995 thiss!1181) (_values!5269 thiss!1181) (mask!25832 thiss!1181) (extraKeys!4978 thiss!1181) (zeroValue!5082 thiss!1181) (minValue!5082 thiss!1181) (index!37556 lt!403342) (defaultEntry!5284 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892920 (arrayContainsKey!0 (_keys!9995 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403340 () Unit!30360)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52261 (_ BitVec 64) (_ BitVec 32)) Unit!30360)

(assert (=> b!892920 (= lt!403340 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9995 thiss!1181) key!785 (index!37556 lt!403342)))))

(declare-fun b!892921 () Bool)

(declare-fun e!498445 () Bool)

(assert (=> b!892921 (= e!498445 (and e!498448 mapRes!28736))))

(declare-fun condMapEmpty!28736 () Bool)

(declare-fun mapDefault!28736 () ValueCell!8579)

(assert (=> b!892921 (= condMapEmpty!28736 (= (arr!25133 (_values!5269 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8579)) mapDefault!28736)))))

(declare-fun b!892922 () Bool)

(declare-fun res!604697 () Bool)

(assert (=> b!892922 (=> res!604697 e!498453)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52261 (_ BitVec 32)) Bool)

(assert (=> b!892922 (= res!604697 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9995 thiss!1181) (mask!25832 thiss!1181))))))

(declare-fun e!498446 () Bool)

(declare-fun array_inv!19794 (array!52261) Bool)

(declare-fun array_inv!19795 (array!52263) Bool)

(assert (=> b!892923 (= e!498446 (and tp!55348 tp_is_empty!18121 (array_inv!19794 (_keys!9995 thiss!1181)) (array_inv!19795 (_values!5269 thiss!1181)) e!498445))))

(declare-fun b!892924 () Bool)

(assert (=> b!892924 (= e!498447 tp_is_empty!18121)))

(declare-fun res!604694 () Bool)

(declare-fun e!498452 () Bool)

(assert (=> start!75990 (=> (not res!604694) (not e!498452))))

(declare-fun valid!1627 (LongMapFixedSize!4174) Bool)

(assert (=> start!75990 (= res!604694 (valid!1627 thiss!1181))))

(assert (=> start!75990 e!498452))

(assert (=> start!75990 e!498446))

(assert (=> start!75990 true))

(declare-fun b!892919 () Bool)

(assert (=> b!892919 (= e!498453 true)))

(declare-fun lt!403338 () Bool)

(assert (=> b!892919 (= lt!403338 (contains!4327 lt!403343 key!785))))

(declare-fun b!892925 () Bool)

(declare-fun res!604695 () Bool)

(assert (=> b!892925 (=> res!604695 e!498453)))

(declare-datatypes ((List!17724 0))(
  ( (Nil!17721) (Cons!17720 (h!18857 (_ BitVec 64)) (t!25015 List!17724)) )
))
(declare-fun arrayNoDuplicates!0 (array!52261 (_ BitVec 32) List!17724) Bool)

(assert (=> b!892925 (= res!604695 (not (arrayNoDuplicates!0 (_keys!9995 thiss!1181) #b00000000000000000000000000000000 Nil!17721)))))

(declare-fun b!892926 () Bool)

(declare-fun res!604696 () Bool)

(assert (=> b!892926 (=> (not res!604696) (not e!498452))))

(assert (=> b!892926 (= res!604696 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28736 () Bool)

(assert (=> mapIsEmpty!28736 mapRes!28736))

(declare-fun b!892927 () Bool)

(declare-fun e!498450 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892927 (= e!498450 (inRange!0 (index!37556 lt!403342) (mask!25832 thiss!1181)))))

(declare-fun b!892928 () Bool)

(declare-fun res!604693 () Bool)

(assert (=> b!892928 (=> res!604693 e!498453)))

(assert (=> b!892928 (= res!604693 (or (not (= (size!25578 (_values!5269 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25832 thiss!1181)))) (not (= (size!25577 (_keys!9995 thiss!1181)) (size!25578 (_values!5269 thiss!1181)))) (bvslt (mask!25832 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4978 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4978 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!892929 () Bool)

(assert (=> b!892929 (= e!498452 (not e!498451))))

(declare-fun res!604699 () Bool)

(assert (=> b!892929 (=> res!604699 e!498451)))

(get-info :version)

(assert (=> b!892929 (= res!604699 (not ((_ is Found!8796) lt!403342)))))

(assert (=> b!892929 e!498450))

(declare-fun res!604692 () Bool)

(assert (=> b!892929 (=> res!604692 e!498450)))

(assert (=> b!892929 (= res!604692 (not ((_ is Found!8796) lt!403342)))))

(declare-fun lt!403341 () Unit!30360)

(declare-fun lemmaSeekEntryGivesInRangeIndex!46 (array!52261 array!52263 (_ BitVec 32) (_ BitVec 32) V!29127 V!29127 (_ BitVec 64)) Unit!30360)

(assert (=> b!892929 (= lt!403341 (lemmaSeekEntryGivesInRangeIndex!46 (_keys!9995 thiss!1181) (_values!5269 thiss!1181) (mask!25832 thiss!1181) (extraKeys!4978 thiss!1181) (zeroValue!5082 thiss!1181) (minValue!5082 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52261 (_ BitVec 32)) SeekEntryResult!8796)

(assert (=> b!892929 (= lt!403342 (seekEntry!0 key!785 (_keys!9995 thiss!1181) (mask!25832 thiss!1181)))))

(assert (= (and start!75990 res!604694) b!892926))

(assert (= (and b!892926 res!604696) b!892929))

(assert (= (and b!892929 (not res!604692)) b!892927))

(assert (= (and b!892929 (not res!604699)) b!892920))

(assert (= (and b!892920 (not res!604698)) b!892928))

(assert (= (and b!892928 (not res!604693)) b!892922))

(assert (= (and b!892922 (not res!604697)) b!892925))

(assert (= (and b!892925 (not res!604695)) b!892919))

(assert (= (and b!892921 condMapEmpty!28736) mapIsEmpty!28736))

(assert (= (and b!892921 (not condMapEmpty!28736)) mapNonEmpty!28736))

(assert (= (and mapNonEmpty!28736 ((_ is ValueCellFull!8579) mapValue!28736)) b!892924))

(assert (= (and b!892921 ((_ is ValueCellFull!8579) mapDefault!28736)) b!892918))

(assert (= b!892923 b!892921))

(assert (= start!75990 b!892923))

(declare-fun m!831589 () Bool)

(assert (=> mapNonEmpty!28736 m!831589))

(declare-fun m!831591 () Bool)

(assert (=> start!75990 m!831591))

(declare-fun m!831593 () Bool)

(assert (=> b!892919 m!831593))

(declare-fun m!831595 () Bool)

(assert (=> b!892923 m!831595))

(declare-fun m!831597 () Bool)

(assert (=> b!892923 m!831597))

(declare-fun m!831599 () Bool)

(assert (=> b!892929 m!831599))

(declare-fun m!831601 () Bool)

(assert (=> b!892929 m!831601))

(declare-fun m!831603 () Bool)

(assert (=> b!892927 m!831603))

(declare-fun m!831605 () Bool)

(assert (=> b!892925 m!831605))

(declare-fun m!831607 () Bool)

(assert (=> b!892922 m!831607))

(declare-fun m!831609 () Bool)

(assert (=> b!892920 m!831609))

(declare-fun m!831611 () Bool)

(assert (=> b!892920 m!831611))

(declare-fun m!831613 () Bool)

(assert (=> b!892920 m!831613))

(assert (=> b!892920 m!831611))

(declare-fun m!831615 () Bool)

(assert (=> b!892920 m!831615))

(declare-fun m!831617 () Bool)

(assert (=> b!892920 m!831617))

(declare-fun m!831619 () Bool)

(assert (=> b!892920 m!831619))

(declare-fun m!831621 () Bool)

(assert (=> b!892920 m!831621))

(check-sat (not b!892922) (not b!892919) (not b_next!15793) (not start!75990) (not b!892925) tp_is_empty!18121 (not b!892923) (not b!892929) (not mapNonEmpty!28736) (not b!892920) (not b!892927) b_and!26043)
(check-sat b_and!26043 (not b_next!15793))
