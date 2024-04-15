; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75804 () Bool)

(assert start!75804)

(declare-fun b!891785 () Bool)

(declare-fun b_free!15793 () Bool)

(declare-fun b_next!15793 () Bool)

(assert (=> b!891785 (= b_free!15793 (not b_next!15793))))

(declare-fun tp!55349 () Bool)

(declare-fun b_and!26007 () Bool)

(assert (=> b!891785 (= tp!55349 b_and!26007)))

(declare-fun b!891776 () Bool)

(declare-fun res!604241 () Bool)

(declare-fun e!497722 () Bool)

(assert (=> b!891776 (=> res!604241 e!497722)))

(declare-datatypes ((array!52205 0))(
  ( (array!52206 (arr!25109 (Array (_ BitVec 32) (_ BitVec 64))) (size!25555 (_ BitVec 32))) )
))
(declare-datatypes ((V!29127 0))(
  ( (V!29128 (val!9111 Int)) )
))
(declare-datatypes ((ValueCell!8579 0))(
  ( (ValueCellFull!8579 (v!11583 V!29127)) (EmptyCell!8579) )
))
(declare-datatypes ((array!52207 0))(
  ( (array!52208 (arr!25110 (Array (_ BitVec 32) ValueCell!8579)) (size!25556 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4174 0))(
  ( (LongMapFixedSize!4175 (defaultEntry!5284 Int) (mask!25782 (_ BitVec 32)) (extraKeys!4978 (_ BitVec 32)) (zeroValue!5082 V!29127) (minValue!5082 V!29127) (_size!2142 (_ BitVec 32)) (_keys!9962 array!52205) (_values!5269 array!52207) (_vacant!2142 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4174)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52205 (_ BitVec 32)) Bool)

(assert (=> b!891776 (= res!604241 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9962 thiss!1181) (mask!25782 thiss!1181))))))

(declare-fun b!891777 () Bool)

(declare-fun e!497715 () Bool)

(declare-fun e!497716 () Bool)

(assert (=> b!891777 (= e!497715 (not e!497716))))

(declare-fun res!604238 () Bool)

(assert (=> b!891777 (=> res!604238 e!497716)))

(declare-datatypes ((SeekEntryResult!8842 0))(
  ( (MissingZero!8842 (index!37739 (_ BitVec 32))) (Found!8842 (index!37740 (_ BitVec 32))) (Intermediate!8842 (undefined!9654 Bool) (index!37741 (_ BitVec 32)) (x!75805 (_ BitVec 32))) (Undefined!8842) (MissingVacant!8842 (index!37742 (_ BitVec 32))) )
))
(declare-fun lt!402745 () SeekEntryResult!8842)

(get-info :version)

(assert (=> b!891777 (= res!604238 (not ((_ is Found!8842) lt!402745)))))

(declare-fun e!497721 () Bool)

(assert (=> b!891777 e!497721))

(declare-fun res!604240 () Bool)

(assert (=> b!891777 (=> res!604240 e!497721)))

(assert (=> b!891777 (= res!604240 (not ((_ is Found!8842) lt!402745)))))

(declare-datatypes ((Unit!30316 0))(
  ( (Unit!30317) )
))
(declare-fun lt!402746 () Unit!30316)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!45 (array!52205 array!52207 (_ BitVec 32) (_ BitVec 32) V!29127 V!29127 (_ BitVec 64)) Unit!30316)

(assert (=> b!891777 (= lt!402746 (lemmaSeekEntryGivesInRangeIndex!45 (_keys!9962 thiss!1181) (_values!5269 thiss!1181) (mask!25782 thiss!1181) (extraKeys!4978 thiss!1181) (zeroValue!5082 thiss!1181) (minValue!5082 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52205 (_ BitVec 32)) SeekEntryResult!8842)

(assert (=> b!891777 (= lt!402745 (seekEntry!0 key!785 (_keys!9962 thiss!1181) (mask!25782 thiss!1181)))))

(declare-fun b!891778 () Bool)

(declare-fun res!604242 () Bool)

(assert (=> b!891778 (=> (not res!604242) (not e!497715))))

(assert (=> b!891778 (= res!604242 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891779 () Bool)

(declare-fun e!497717 () Bool)

(declare-fun e!497719 () Bool)

(declare-fun mapRes!28736 () Bool)

(assert (=> b!891779 (= e!497717 (and e!497719 mapRes!28736))))

(declare-fun condMapEmpty!28736 () Bool)

(declare-fun mapDefault!28736 () ValueCell!8579)

(assert (=> b!891779 (= condMapEmpty!28736 (= (arr!25110 (_values!5269 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8579)) mapDefault!28736)))))

(declare-fun b!891780 () Bool)

(declare-fun tp_is_empty!18121 () Bool)

(assert (=> b!891780 (= e!497719 tp_is_empty!18121)))

(declare-fun mapNonEmpty!28736 () Bool)

(declare-fun tp!55348 () Bool)

(declare-fun e!497720 () Bool)

(assert (=> mapNonEmpty!28736 (= mapRes!28736 (and tp!55348 e!497720))))

(declare-fun mapRest!28736 () (Array (_ BitVec 32) ValueCell!8579))

(declare-fun mapKey!28736 () (_ BitVec 32))

(declare-fun mapValue!28736 () ValueCell!8579)

(assert (=> mapNonEmpty!28736 (= (arr!25110 (_values!5269 thiss!1181)) (store mapRest!28736 mapKey!28736 mapValue!28736))))

(declare-fun b!891781 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891781 (= e!497721 (inRange!0 (index!37740 lt!402745) (mask!25782 thiss!1181)))))

(declare-fun b!891783 () Bool)

(assert (=> b!891783 (= e!497720 tp_is_empty!18121)))

(declare-fun b!891784 () Bool)

(declare-fun res!604239 () Bool)

(assert (=> b!891784 (=> res!604239 e!497722)))

(assert (=> b!891784 (= res!604239 (or (not (= (size!25556 (_values!5269 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25782 thiss!1181)))) (not (= (size!25555 (_keys!9962 thiss!1181)) (size!25556 (_values!5269 thiss!1181)))) (bvslt (mask!25782 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4978 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4978 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28736 () Bool)

(assert (=> mapIsEmpty!28736 mapRes!28736))

(declare-fun e!497718 () Bool)

(declare-fun array_inv!19784 (array!52205) Bool)

(declare-fun array_inv!19785 (array!52207) Bool)

(assert (=> b!891785 (= e!497718 (and tp!55349 tp_is_empty!18121 (array_inv!19784 (_keys!9962 thiss!1181)) (array_inv!19785 (_values!5269 thiss!1181)) e!497717))))

(declare-fun b!891786 () Bool)

(declare-fun res!604244 () Bool)

(assert (=> b!891786 (=> res!604244 e!497722)))

(declare-datatypes ((List!17771 0))(
  ( (Nil!17768) (Cons!17767 (h!18898 (_ BitVec 64)) (t!25061 List!17771)) )
))
(declare-fun arrayNoDuplicates!0 (array!52205 (_ BitVec 32) List!17771) Bool)

(assert (=> b!891786 (= res!604244 (not (arrayNoDuplicates!0 (_keys!9962 thiss!1181) #b00000000000000000000000000000000 Nil!17768)))))

(declare-fun b!891787 () Bool)

(assert (=> b!891787 (= e!497716 e!497722)))

(declare-fun res!604243 () Bool)

(assert (=> b!891787 (=> res!604243 e!497722)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891787 (= res!604243 (not (validMask!0 (mask!25782 thiss!1181))))))

(declare-datatypes ((tuple2!11990 0))(
  ( (tuple2!11991 (_1!6006 (_ BitVec 64)) (_2!6006 V!29127)) )
))
(declare-datatypes ((List!17772 0))(
  ( (Nil!17769) (Cons!17768 (h!18899 tuple2!11990) (t!25062 List!17772)) )
))
(declare-datatypes ((ListLongMap!10677 0))(
  ( (ListLongMap!10678 (toList!5354 List!17772)) )
))
(declare-fun lt!402744 () ListLongMap!10677)

(declare-fun contains!4324 (ListLongMap!10677 (_ BitVec 64)) Bool)

(assert (=> b!891787 (contains!4324 lt!402744 (select (arr!25109 (_keys!9962 thiss!1181)) (index!37740 lt!402745)))))

(declare-fun getCurrentListMap!2582 (array!52205 array!52207 (_ BitVec 32) (_ BitVec 32) V!29127 V!29127 (_ BitVec 32) Int) ListLongMap!10677)

(assert (=> b!891787 (= lt!402744 (getCurrentListMap!2582 (_keys!9962 thiss!1181) (_values!5269 thiss!1181) (mask!25782 thiss!1181) (extraKeys!4978 thiss!1181) (zeroValue!5082 thiss!1181) (minValue!5082 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5284 thiss!1181)))))

(declare-fun lt!402742 () Unit!30316)

(declare-fun lemmaValidKeyInArrayIsInListMap!218 (array!52205 array!52207 (_ BitVec 32) (_ BitVec 32) V!29127 V!29127 (_ BitVec 32) Int) Unit!30316)

(assert (=> b!891787 (= lt!402742 (lemmaValidKeyInArrayIsInListMap!218 (_keys!9962 thiss!1181) (_values!5269 thiss!1181) (mask!25782 thiss!1181) (extraKeys!4978 thiss!1181) (zeroValue!5082 thiss!1181) (minValue!5082 thiss!1181) (index!37740 lt!402745) (defaultEntry!5284 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891787 (arrayContainsKey!0 (_keys!9962 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402743 () Unit!30316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52205 (_ BitVec 64) (_ BitVec 32)) Unit!30316)

(assert (=> b!891787 (= lt!402743 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9962 thiss!1181) key!785 (index!37740 lt!402745)))))

(declare-fun b!891782 () Bool)

(assert (=> b!891782 (= e!497722 true)))

(declare-fun lt!402741 () Bool)

(assert (=> b!891782 (= lt!402741 (contains!4324 lt!402744 key!785))))

(declare-fun res!604245 () Bool)

(assert (=> start!75804 (=> (not res!604245) (not e!497715))))

(declare-fun valid!1621 (LongMapFixedSize!4174) Bool)

(assert (=> start!75804 (= res!604245 (valid!1621 thiss!1181))))

(assert (=> start!75804 e!497715))

(assert (=> start!75804 e!497718))

(assert (=> start!75804 true))

(assert (= (and start!75804 res!604245) b!891778))

(assert (= (and b!891778 res!604242) b!891777))

(assert (= (and b!891777 (not res!604240)) b!891781))

(assert (= (and b!891777 (not res!604238)) b!891787))

(assert (= (and b!891787 (not res!604243)) b!891784))

(assert (= (and b!891784 (not res!604239)) b!891776))

(assert (= (and b!891776 (not res!604241)) b!891786))

(assert (= (and b!891786 (not res!604244)) b!891782))

(assert (= (and b!891779 condMapEmpty!28736) mapIsEmpty!28736))

(assert (= (and b!891779 (not condMapEmpty!28736)) mapNonEmpty!28736))

(assert (= (and mapNonEmpty!28736 ((_ is ValueCellFull!8579) mapValue!28736)) b!891783))

(assert (= (and b!891779 ((_ is ValueCellFull!8579) mapDefault!28736)) b!891780))

(assert (= b!891785 b!891779))

(assert (= start!75804 b!891785))

(declare-fun m!829537 () Bool)

(assert (=> b!891787 m!829537))

(declare-fun m!829539 () Bool)

(assert (=> b!891787 m!829539))

(declare-fun m!829541 () Bool)

(assert (=> b!891787 m!829541))

(declare-fun m!829543 () Bool)

(assert (=> b!891787 m!829543))

(declare-fun m!829545 () Bool)

(assert (=> b!891787 m!829545))

(declare-fun m!829547 () Bool)

(assert (=> b!891787 m!829547))

(assert (=> b!891787 m!829539))

(declare-fun m!829549 () Bool)

(assert (=> b!891787 m!829549))

(declare-fun m!829551 () Bool)

(assert (=> b!891776 m!829551))

(declare-fun m!829553 () Bool)

(assert (=> b!891782 m!829553))

(declare-fun m!829555 () Bool)

(assert (=> b!891777 m!829555))

(declare-fun m!829557 () Bool)

(assert (=> b!891777 m!829557))

(declare-fun m!829559 () Bool)

(assert (=> b!891781 m!829559))

(declare-fun m!829561 () Bool)

(assert (=> b!891786 m!829561))

(declare-fun m!829563 () Bool)

(assert (=> start!75804 m!829563))

(declare-fun m!829565 () Bool)

(assert (=> b!891785 m!829565))

(declare-fun m!829567 () Bool)

(assert (=> b!891785 m!829567))

(declare-fun m!829569 () Bool)

(assert (=> mapNonEmpty!28736 m!829569))

(check-sat tp_is_empty!18121 (not b_next!15793) (not b!891786) (not start!75804) (not b!891776) (not b!891785) (not b!891781) b_and!26007 (not b!891782) (not b!891787) (not b!891777) (not mapNonEmpty!28736))
(check-sat b_and!26007 (not b_next!15793))
