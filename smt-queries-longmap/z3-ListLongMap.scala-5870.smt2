; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75752 () Bool)

(assert start!75752)

(declare-fun b!890804 () Bool)

(declare-fun b_free!15723 () Bool)

(declare-fun b_next!15723 () Bool)

(assert (=> b!890804 (= b_free!15723 (not b_next!15723))))

(declare-fun tp!55138 () Bool)

(declare-fun b_and!25963 () Bool)

(assert (=> b!890804 (= tp!55138 b_and!25963)))

(declare-fun mapIsEmpty!28631 () Bool)

(declare-fun mapRes!28631 () Bool)

(assert (=> mapIsEmpty!28631 mapRes!28631))

(declare-fun b!890795 () Bool)

(declare-fun e!496920 () Bool)

(declare-fun tp_is_empty!18051 () Bool)

(assert (=> b!890795 (= e!496920 tp_is_empty!18051)))

(declare-fun b!890796 () Bool)

(declare-fun e!496923 () Bool)

(declare-datatypes ((SeekEntryResult!8809 0))(
  ( (MissingZero!8809 (index!37607 (_ BitVec 32))) (Found!8809 (index!37608 (_ BitVec 32))) (Intermediate!8809 (undefined!9621 Bool) (index!37609 (_ BitVec 32)) (x!75681 (_ BitVec 32))) (Undefined!8809) (MissingVacant!8809 (index!37610 (_ BitVec 32))) )
))
(declare-fun lt!402428 () SeekEntryResult!8809)

(declare-datatypes ((array!52082 0))(
  ( (array!52083 (arr!25047 (Array (_ BitVec 32) (_ BitVec 64))) (size!25491 (_ BitVec 32))) )
))
(declare-datatypes ((V!29033 0))(
  ( (V!29034 (val!9076 Int)) )
))
(declare-datatypes ((ValueCell!8544 0))(
  ( (ValueCellFull!8544 (v!11554 V!29033)) (EmptyCell!8544) )
))
(declare-datatypes ((array!52084 0))(
  ( (array!52085 (arr!25048 (Array (_ BitVec 32) ValueCell!8544)) (size!25492 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4104 0))(
  ( (LongMapFixedSize!4105 (defaultEntry!5249 Int) (mask!25730 (_ BitVec 32)) (extraKeys!4943 (_ BitVec 32)) (zeroValue!5047 V!29033) (minValue!5047 V!29033) (_size!2107 (_ BitVec 32)) (_keys!9932 array!52082) (_values!5234 array!52084) (_vacant!2107 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4104)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890796 (= e!496923 (inRange!0 (index!37608 lt!402428) (mask!25730 thiss!1181)))))

(declare-fun mapNonEmpty!28631 () Bool)

(declare-fun tp!55137 () Bool)

(declare-fun e!496921 () Bool)

(assert (=> mapNonEmpty!28631 (= mapRes!28631 (and tp!55137 e!496921))))

(declare-fun mapRest!28631 () (Array (_ BitVec 32) ValueCell!8544))

(declare-fun mapValue!28631 () ValueCell!8544)

(declare-fun mapKey!28631 () (_ BitVec 32))

(assert (=> mapNonEmpty!28631 (= (arr!25048 (_values!5234 thiss!1181)) (store mapRest!28631 mapKey!28631 mapValue!28631))))

(declare-fun b!890797 () Bool)

(declare-fun e!496919 () Bool)

(declare-fun e!496925 () Bool)

(assert (=> b!890797 (= e!496919 (not e!496925))))

(declare-fun res!603549 () Bool)

(assert (=> b!890797 (=> res!603549 e!496925)))

(get-info :version)

(assert (=> b!890797 (= res!603549 (not ((_ is Found!8809) lt!402428)))))

(assert (=> b!890797 e!496923))

(declare-fun res!603553 () Bool)

(assert (=> b!890797 (=> res!603553 e!496923)))

(assert (=> b!890797 (= res!603553 (not ((_ is Found!8809) lt!402428)))))

(declare-datatypes ((Unit!30316 0))(
  ( (Unit!30317) )
))
(declare-fun lt!402429 () Unit!30316)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!18 (array!52082 array!52084 (_ BitVec 32) (_ BitVec 32) V!29033 V!29033 (_ BitVec 64)) Unit!30316)

(assert (=> b!890797 (= lt!402429 (lemmaSeekEntryGivesInRangeIndex!18 (_keys!9932 thiss!1181) (_values!5234 thiss!1181) (mask!25730 thiss!1181) (extraKeys!4943 thiss!1181) (zeroValue!5047 thiss!1181) (minValue!5047 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52082 (_ BitVec 32)) SeekEntryResult!8809)

(assert (=> b!890797 (= lt!402428 (seekEntry!0 key!785 (_keys!9932 thiss!1181) (mask!25730 thiss!1181)))))

(declare-fun b!890798 () Bool)

(declare-fun e!496924 () Bool)

(assert (=> b!890798 (= e!496924 true)))

(declare-fun lt!402430 () Bool)

(declare-datatypes ((List!17727 0))(
  ( (Nil!17724) (Cons!17723 (h!18854 (_ BitVec 64)) (t!25026 List!17727)) )
))
(declare-fun arrayNoDuplicates!0 (array!52082 (_ BitVec 32) List!17727) Bool)

(assert (=> b!890798 (= lt!402430 (arrayNoDuplicates!0 (_keys!9932 thiss!1181) #b00000000000000000000000000000000 Nil!17724))))

(declare-fun b!890799 () Bool)

(declare-fun e!496926 () Bool)

(assert (=> b!890799 (= e!496926 (and e!496920 mapRes!28631))))

(declare-fun condMapEmpty!28631 () Bool)

(declare-fun mapDefault!28631 () ValueCell!8544)

(assert (=> b!890799 (= condMapEmpty!28631 (= (arr!25048 (_values!5234 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8544)) mapDefault!28631)))))

(declare-fun b!890800 () Bool)

(assert (=> b!890800 (= e!496925 e!496924)))

(declare-fun res!603554 () Bool)

(assert (=> b!890800 (=> res!603554 e!496924)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890800 (= res!603554 (not (validMask!0 (mask!25730 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890800 (arrayContainsKey!0 (_keys!9932 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402427 () Unit!30316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52082 (_ BitVec 64) (_ BitVec 32)) Unit!30316)

(assert (=> b!890800 (= lt!402427 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9932 thiss!1181) key!785 (index!37608 lt!402428)))))

(declare-fun b!890802 () Bool)

(declare-fun res!603548 () Bool)

(assert (=> b!890802 (=> res!603548 e!496924)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52082 (_ BitVec 32)) Bool)

(assert (=> b!890802 (= res!603548 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9932 thiss!1181) (mask!25730 thiss!1181))))))

(declare-fun b!890803 () Bool)

(declare-fun res!603552 () Bool)

(assert (=> b!890803 (=> res!603552 e!496924)))

(assert (=> b!890803 (= res!603552 (or (not (= (size!25492 (_values!5234 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25730 thiss!1181)))) (not (= (size!25491 (_keys!9932 thiss!1181)) (size!25492 (_values!5234 thiss!1181)))) (bvslt (mask!25730 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4943 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4943 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890801 () Bool)

(declare-fun res!603551 () Bool)

(assert (=> b!890801 (=> (not res!603551) (not e!496919))))

(assert (=> b!890801 (= res!603551 (not (= key!785 (bvneg key!785))))))

(declare-fun res!603550 () Bool)

(assert (=> start!75752 (=> (not res!603550) (not e!496919))))

(declare-fun valid!1593 (LongMapFixedSize!4104) Bool)

(assert (=> start!75752 (= res!603550 (valid!1593 thiss!1181))))

(assert (=> start!75752 e!496919))

(declare-fun e!496922 () Bool)

(assert (=> start!75752 e!496922))

(assert (=> start!75752 true))

(declare-fun array_inv!19688 (array!52082) Bool)

(declare-fun array_inv!19689 (array!52084) Bool)

(assert (=> b!890804 (= e!496922 (and tp!55138 tp_is_empty!18051 (array_inv!19688 (_keys!9932 thiss!1181)) (array_inv!19689 (_values!5234 thiss!1181)) e!496926))))

(declare-fun b!890805 () Bool)

(assert (=> b!890805 (= e!496921 tp_is_empty!18051)))

(assert (= (and start!75752 res!603550) b!890801))

(assert (= (and b!890801 res!603551) b!890797))

(assert (= (and b!890797 (not res!603553)) b!890796))

(assert (= (and b!890797 (not res!603549)) b!890800))

(assert (= (and b!890800 (not res!603554)) b!890803))

(assert (= (and b!890803 (not res!603552)) b!890802))

(assert (= (and b!890802 (not res!603548)) b!890798))

(assert (= (and b!890799 condMapEmpty!28631) mapIsEmpty!28631))

(assert (= (and b!890799 (not condMapEmpty!28631)) mapNonEmpty!28631))

(assert (= (and mapNonEmpty!28631 ((_ is ValueCellFull!8544) mapValue!28631)) b!890805))

(assert (= (and b!890799 ((_ is ValueCellFull!8544) mapDefault!28631)) b!890795))

(assert (= b!890804 b!890799))

(assert (= start!75752 b!890804))

(declare-fun m!829245 () Bool)

(assert (=> b!890800 m!829245))

(declare-fun m!829247 () Bool)

(assert (=> b!890800 m!829247))

(declare-fun m!829249 () Bool)

(assert (=> b!890800 m!829249))

(declare-fun m!829251 () Bool)

(assert (=> b!890796 m!829251))

(declare-fun m!829253 () Bool)

(assert (=> b!890802 m!829253))

(declare-fun m!829255 () Bool)

(assert (=> b!890804 m!829255))

(declare-fun m!829257 () Bool)

(assert (=> b!890804 m!829257))

(declare-fun m!829259 () Bool)

(assert (=> mapNonEmpty!28631 m!829259))

(declare-fun m!829261 () Bool)

(assert (=> b!890797 m!829261))

(declare-fun m!829263 () Bool)

(assert (=> b!890797 m!829263))

(declare-fun m!829265 () Bool)

(assert (=> start!75752 m!829265))

(declare-fun m!829267 () Bool)

(assert (=> b!890798 m!829267))

(check-sat (not mapNonEmpty!28631) (not b!890800) (not b!890797) (not start!75752) tp_is_empty!18051 (not b!890796) (not b_next!15723) (not b!890804) b_and!25963 (not b!890798) (not b!890802))
(check-sat b_and!25963 (not b_next!15723))
