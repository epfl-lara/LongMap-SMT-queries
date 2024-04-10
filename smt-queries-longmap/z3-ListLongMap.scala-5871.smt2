; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75758 () Bool)

(assert start!75758)

(declare-fun b!890899 () Bool)

(declare-fun b_free!15729 () Bool)

(declare-fun b_next!15729 () Bool)

(assert (=> b!890899 (= b_free!15729 (not b_next!15729))))

(declare-fun tp!55156 () Bool)

(declare-fun b_and!25969 () Bool)

(assert (=> b!890899 (= tp!55156 b_and!25969)))

(declare-fun b!890894 () Bool)

(declare-fun res!603616 () Bool)

(declare-fun e!497004 () Bool)

(assert (=> b!890894 (=> (not res!603616) (not e!497004))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890894 (= res!603616 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890895 () Bool)

(declare-fun res!603615 () Bool)

(declare-fun e!496999 () Bool)

(assert (=> b!890895 (=> res!603615 e!496999)))

(declare-datatypes ((array!52094 0))(
  ( (array!52095 (arr!25053 (Array (_ BitVec 32) (_ BitVec 64))) (size!25497 (_ BitVec 32))) )
))
(declare-datatypes ((V!29041 0))(
  ( (V!29042 (val!9079 Int)) )
))
(declare-datatypes ((ValueCell!8547 0))(
  ( (ValueCellFull!8547 (v!11557 V!29041)) (EmptyCell!8547) )
))
(declare-datatypes ((array!52096 0))(
  ( (array!52097 (arr!25054 (Array (_ BitVec 32) ValueCell!8547)) (size!25498 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4110 0))(
  ( (LongMapFixedSize!4111 (defaultEntry!5252 Int) (mask!25735 (_ BitVec 32)) (extraKeys!4946 (_ BitVec 32)) (zeroValue!5050 V!29041) (minValue!5050 V!29041) (_size!2110 (_ BitVec 32)) (_keys!9935 array!52094) (_values!5237 array!52096) (_vacant!2110 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4110)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52094 (_ BitVec 32)) Bool)

(assert (=> b!890895 (= res!603615 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9935 thiss!1181) (mask!25735 thiss!1181))))))

(declare-fun b!890896 () Bool)

(declare-fun res!603617 () Bool)

(assert (=> b!890896 (=> res!603617 e!496999)))

(assert (=> b!890896 (= res!603617 (or (not (= (size!25498 (_values!5237 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25735 thiss!1181)))) (not (= (size!25497 (_keys!9935 thiss!1181)) (size!25498 (_values!5237 thiss!1181)))) (bvslt (mask!25735 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4946 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4946 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890897 () Bool)

(declare-fun e!497000 () Bool)

(declare-fun tp_is_empty!18057 () Bool)

(assert (=> b!890897 (= e!497000 tp_is_empty!18057)))

(declare-fun b!890898 () Bool)

(declare-fun e!497003 () Bool)

(assert (=> b!890898 (= e!497003 tp_is_empty!18057)))

(declare-fun e!497007 () Bool)

(declare-fun e!497006 () Bool)

(declare-fun array_inv!19692 (array!52094) Bool)

(declare-fun array_inv!19693 (array!52096) Bool)

(assert (=> b!890899 (= e!497006 (and tp!55156 tp_is_empty!18057 (array_inv!19692 (_keys!9935 thiss!1181)) (array_inv!19693 (_values!5237 thiss!1181)) e!497007))))

(declare-fun b!890900 () Bool)

(declare-fun e!497002 () Bool)

(declare-datatypes ((SeekEntryResult!8811 0))(
  ( (MissingZero!8811 (index!37615 (_ BitVec 32))) (Found!8811 (index!37616 (_ BitVec 32))) (Intermediate!8811 (undefined!9623 Bool) (index!37617 (_ BitVec 32)) (x!75691 (_ BitVec 32))) (Undefined!8811) (MissingVacant!8811 (index!37618 (_ BitVec 32))) )
))
(declare-fun lt!402464 () SeekEntryResult!8811)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890900 (= e!497002 (inRange!0 (index!37616 lt!402464) (mask!25735 thiss!1181)))))

(declare-fun b!890901 () Bool)

(assert (=> b!890901 (= e!496999 true)))

(declare-fun lt!402466 () Bool)

(declare-datatypes ((List!17729 0))(
  ( (Nil!17726) (Cons!17725 (h!18856 (_ BitVec 64)) (t!25028 List!17729)) )
))
(declare-fun arrayNoDuplicates!0 (array!52094 (_ BitVec 32) List!17729) Bool)

(assert (=> b!890901 (= lt!402466 (arrayNoDuplicates!0 (_keys!9935 thiss!1181) #b00000000000000000000000000000000 Nil!17726))))

(declare-fun mapIsEmpty!28640 () Bool)

(declare-fun mapRes!28640 () Bool)

(assert (=> mapIsEmpty!28640 mapRes!28640))

(declare-fun b!890902 () Bool)

(declare-fun e!497005 () Bool)

(assert (=> b!890902 (= e!497004 (not e!497005))))

(declare-fun res!603612 () Bool)

(assert (=> b!890902 (=> res!603612 e!497005)))

(get-info :version)

(assert (=> b!890902 (= res!603612 (not ((_ is Found!8811) lt!402464)))))

(assert (=> b!890902 e!497002))

(declare-fun res!603614 () Bool)

(assert (=> b!890902 (=> res!603614 e!497002)))

(assert (=> b!890902 (= res!603614 (not ((_ is Found!8811) lt!402464)))))

(declare-datatypes ((Unit!30320 0))(
  ( (Unit!30321) )
))
(declare-fun lt!402463 () Unit!30320)

(declare-fun lemmaSeekEntryGivesInRangeIndex!19 (array!52094 array!52096 (_ BitVec 32) (_ BitVec 32) V!29041 V!29041 (_ BitVec 64)) Unit!30320)

(assert (=> b!890902 (= lt!402463 (lemmaSeekEntryGivesInRangeIndex!19 (_keys!9935 thiss!1181) (_values!5237 thiss!1181) (mask!25735 thiss!1181) (extraKeys!4946 thiss!1181) (zeroValue!5050 thiss!1181) (minValue!5050 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52094 (_ BitVec 32)) SeekEntryResult!8811)

(assert (=> b!890902 (= lt!402464 (seekEntry!0 key!785 (_keys!9935 thiss!1181) (mask!25735 thiss!1181)))))

(declare-fun res!603613 () Bool)

(assert (=> start!75758 (=> (not res!603613) (not e!497004))))

(declare-fun valid!1595 (LongMapFixedSize!4110) Bool)

(assert (=> start!75758 (= res!603613 (valid!1595 thiss!1181))))

(assert (=> start!75758 e!497004))

(assert (=> start!75758 e!497006))

(assert (=> start!75758 true))

(declare-fun mapNonEmpty!28640 () Bool)

(declare-fun tp!55155 () Bool)

(assert (=> mapNonEmpty!28640 (= mapRes!28640 (and tp!55155 e!497000))))

(declare-fun mapRest!28640 () (Array (_ BitVec 32) ValueCell!8547))

(declare-fun mapValue!28640 () ValueCell!8547)

(declare-fun mapKey!28640 () (_ BitVec 32))

(assert (=> mapNonEmpty!28640 (= (arr!25054 (_values!5237 thiss!1181)) (store mapRest!28640 mapKey!28640 mapValue!28640))))

(declare-fun b!890903 () Bool)

(assert (=> b!890903 (= e!497005 e!496999)))

(declare-fun res!603611 () Bool)

(assert (=> b!890903 (=> res!603611 e!496999)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890903 (= res!603611 (not (validMask!0 (mask!25735 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890903 (arrayContainsKey!0 (_keys!9935 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402465 () Unit!30320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52094 (_ BitVec 64) (_ BitVec 32)) Unit!30320)

(assert (=> b!890903 (= lt!402465 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9935 thiss!1181) key!785 (index!37616 lt!402464)))))

(declare-fun b!890904 () Bool)

(assert (=> b!890904 (= e!497007 (and e!497003 mapRes!28640))))

(declare-fun condMapEmpty!28640 () Bool)

(declare-fun mapDefault!28640 () ValueCell!8547)

(assert (=> b!890904 (= condMapEmpty!28640 (= (arr!25054 (_values!5237 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8547)) mapDefault!28640)))))

(assert (= (and start!75758 res!603613) b!890894))

(assert (= (and b!890894 res!603616) b!890902))

(assert (= (and b!890902 (not res!603614)) b!890900))

(assert (= (and b!890902 (not res!603612)) b!890903))

(assert (= (and b!890903 (not res!603611)) b!890896))

(assert (= (and b!890896 (not res!603617)) b!890895))

(assert (= (and b!890895 (not res!603615)) b!890901))

(assert (= (and b!890904 condMapEmpty!28640) mapIsEmpty!28640))

(assert (= (and b!890904 (not condMapEmpty!28640)) mapNonEmpty!28640))

(assert (= (and mapNonEmpty!28640 ((_ is ValueCellFull!8547) mapValue!28640)) b!890897))

(assert (= (and b!890904 ((_ is ValueCellFull!8547) mapDefault!28640)) b!890898))

(assert (= b!890899 b!890904))

(assert (= start!75758 b!890899))

(declare-fun m!829317 () Bool)

(assert (=> b!890895 m!829317))

(declare-fun m!829319 () Bool)

(assert (=> b!890902 m!829319))

(declare-fun m!829321 () Bool)

(assert (=> b!890902 m!829321))

(declare-fun m!829323 () Bool)

(assert (=> b!890900 m!829323))

(declare-fun m!829325 () Bool)

(assert (=> start!75758 m!829325))

(declare-fun m!829327 () Bool)

(assert (=> b!890903 m!829327))

(declare-fun m!829329 () Bool)

(assert (=> b!890903 m!829329))

(declare-fun m!829331 () Bool)

(assert (=> b!890903 m!829331))

(declare-fun m!829333 () Bool)

(assert (=> b!890899 m!829333))

(declare-fun m!829335 () Bool)

(assert (=> b!890899 m!829335))

(declare-fun m!829337 () Bool)

(assert (=> b!890901 m!829337))

(declare-fun m!829339 () Bool)

(assert (=> mapNonEmpty!28640 m!829339))

(check-sat (not b!890901) tp_is_empty!18057 b_and!25969 (not b!890902) (not start!75758) (not b!890895) (not b!890900) (not b!890903) (not mapNonEmpty!28640) (not b_next!15729) (not b!890899))
(check-sat b_and!25969 (not b_next!15729))
