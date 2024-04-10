; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75710 () Bool)

(assert start!75710)

(declare-fun b!890154 () Bool)

(declare-fun b_free!15681 () Bool)

(declare-fun b_next!15681 () Bool)

(assert (=> b!890154 (= b_free!15681 (not b_next!15681))))

(declare-fun tp!55011 () Bool)

(declare-fun b_and!25921 () Bool)

(assert (=> b!890154 (= tp!55011 b_and!25921)))

(declare-fun mapNonEmpty!28568 () Bool)

(declare-fun mapRes!28568 () Bool)

(declare-fun tp!55012 () Bool)

(declare-fun e!496382 () Bool)

(assert (=> mapNonEmpty!28568 (= mapRes!28568 (and tp!55012 e!496382))))

(declare-datatypes ((V!28977 0))(
  ( (V!28978 (val!9055 Int)) )
))
(declare-datatypes ((ValueCell!8523 0))(
  ( (ValueCellFull!8523 (v!11533 V!28977)) (EmptyCell!8523) )
))
(declare-fun mapValue!28568 () ValueCell!8523)

(declare-fun mapRest!28568 () (Array (_ BitVec 32) ValueCell!8523))

(declare-fun mapKey!28568 () (_ BitVec 32))

(declare-datatypes ((array!51998 0))(
  ( (array!51999 (arr!25005 (Array (_ BitVec 32) (_ BitVec 64))) (size!25449 (_ BitVec 32))) )
))
(declare-datatypes ((array!52000 0))(
  ( (array!52001 (arr!25006 (Array (_ BitVec 32) ValueCell!8523)) (size!25450 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4062 0))(
  ( (LongMapFixedSize!4063 (defaultEntry!5228 Int) (mask!25695 (_ BitVec 32)) (extraKeys!4922 (_ BitVec 32)) (zeroValue!5026 V!28977) (minValue!5026 V!28977) (_size!2086 (_ BitVec 32)) (_keys!9911 array!51998) (_values!5213 array!52000) (_vacant!2086 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4062)

(assert (=> mapNonEmpty!28568 (= (arr!25006 (_values!5213 thiss!1181)) (store mapRest!28568 mapKey!28568 mapValue!28568))))

(declare-fun e!496377 () Bool)

(declare-fun tp_is_empty!18009 () Bool)

(declare-fun e!496383 () Bool)

(declare-fun array_inv!19662 (array!51998) Bool)

(declare-fun array_inv!19663 (array!52000) Bool)

(assert (=> b!890154 (= e!496377 (and tp!55011 tp_is_empty!18009 (array_inv!19662 (_keys!9911 thiss!1181)) (array_inv!19663 (_values!5213 thiss!1181)) e!496383))))

(declare-fun b!890155 () Bool)

(declare-fun e!496378 () Bool)

(assert (=> b!890155 (= e!496378 (not true))))

(declare-fun e!496379 () Bool)

(assert (=> b!890155 e!496379))

(declare-fun res!603160 () Bool)

(assert (=> b!890155 (=> res!603160 e!496379)))

(declare-datatypes ((SeekEntryResult!8792 0))(
  ( (MissingZero!8792 (index!37539 (_ BitVec 32))) (Found!8792 (index!37540 (_ BitVec 32))) (Intermediate!8792 (undefined!9604 Bool) (index!37541 (_ BitVec 32)) (x!75608 (_ BitVec 32))) (Undefined!8792) (MissingVacant!8792 (index!37542 (_ BitVec 32))) )
))
(declare-fun lt!402201 () SeekEntryResult!8792)

(get-info :version)

(assert (=> b!890155 (= res!603160 (not ((_ is Found!8792) lt!402201)))))

(declare-datatypes ((Unit!30288 0))(
  ( (Unit!30289) )
))
(declare-fun lt!402202 () Unit!30288)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!6 (array!51998 array!52000 (_ BitVec 32) (_ BitVec 32) V!28977 V!28977 (_ BitVec 64)) Unit!30288)

(assert (=> b!890155 (= lt!402202 (lemmaSeekEntryGivesInRangeIndex!6 (_keys!9911 thiss!1181) (_values!5213 thiss!1181) (mask!25695 thiss!1181) (extraKeys!4922 thiss!1181) (zeroValue!5026 thiss!1181) (minValue!5026 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51998 (_ BitVec 32)) SeekEntryResult!8792)

(assert (=> b!890155 (= lt!402201 (seekEntry!0 key!785 (_keys!9911 thiss!1181) (mask!25695 thiss!1181)))))

(declare-fun b!890156 () Bool)

(assert (=> b!890156 (= e!496382 tp_is_empty!18009)))

(declare-fun res!603161 () Bool)

(assert (=> start!75710 (=> (not res!603161) (not e!496378))))

(declare-fun valid!1576 (LongMapFixedSize!4062) Bool)

(assert (=> start!75710 (= res!603161 (valid!1576 thiss!1181))))

(assert (=> start!75710 e!496378))

(assert (=> start!75710 e!496377))

(assert (=> start!75710 true))

(declare-fun b!890157 () Bool)

(declare-fun e!496381 () Bool)

(assert (=> b!890157 (= e!496381 tp_is_empty!18009)))

(declare-fun mapIsEmpty!28568 () Bool)

(assert (=> mapIsEmpty!28568 mapRes!28568))

(declare-fun b!890158 () Bool)

(declare-fun res!603159 () Bool)

(assert (=> b!890158 (=> (not res!603159) (not e!496378))))

(assert (=> b!890158 (= res!603159 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890159 () Bool)

(assert (=> b!890159 (= e!496383 (and e!496381 mapRes!28568))))

(declare-fun condMapEmpty!28568 () Bool)

(declare-fun mapDefault!28568 () ValueCell!8523)

(assert (=> b!890159 (= condMapEmpty!28568 (= (arr!25006 (_values!5213 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8523)) mapDefault!28568)))))

(declare-fun b!890160 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890160 (= e!496379 (inRange!0 (index!37540 lt!402201) (mask!25695 thiss!1181)))))

(assert (= (and start!75710 res!603161) b!890158))

(assert (= (and b!890158 res!603159) b!890155))

(assert (= (and b!890155 (not res!603160)) b!890160))

(assert (= (and b!890159 condMapEmpty!28568) mapIsEmpty!28568))

(assert (= (and b!890159 (not condMapEmpty!28568)) mapNonEmpty!28568))

(assert (= (and mapNonEmpty!28568 ((_ is ValueCellFull!8523) mapValue!28568)) b!890156))

(assert (= (and b!890159 ((_ is ValueCellFull!8523) mapDefault!28568)) b!890157))

(assert (= b!890154 b!890159))

(assert (= start!75710 b!890154))

(declare-fun m!828791 () Bool)

(assert (=> b!890160 m!828791))

(declare-fun m!828793 () Bool)

(assert (=> b!890155 m!828793))

(declare-fun m!828795 () Bool)

(assert (=> b!890155 m!828795))

(declare-fun m!828797 () Bool)

(assert (=> b!890154 m!828797))

(declare-fun m!828799 () Bool)

(assert (=> b!890154 m!828799))

(declare-fun m!828801 () Bool)

(assert (=> mapNonEmpty!28568 m!828801))

(declare-fun m!828803 () Bool)

(assert (=> start!75710 m!828803))

(check-sat (not b!890160) (not start!75710) (not mapNonEmpty!28568) (not b!890155) tp_is_empty!18009 b_and!25921 (not b_next!15681) (not b!890154))
(check-sat b_and!25921 (not b_next!15681))
