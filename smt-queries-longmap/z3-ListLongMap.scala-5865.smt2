; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75702 () Bool)

(assert start!75702)

(declare-fun b!890032 () Bool)

(declare-fun b_free!15691 () Bool)

(declare-fun b_next!15691 () Bool)

(assert (=> b!890032 (= b_free!15691 (not b_next!15691))))

(declare-fun tp!55042 () Bool)

(declare-fun b_and!25905 () Bool)

(assert (=> b!890032 (= tp!55042 b_and!25905)))

(declare-fun b!890028 () Bool)

(declare-fun e!496340 () Bool)

(declare-fun e!496341 () Bool)

(declare-fun mapRes!28583 () Bool)

(assert (=> b!890028 (= e!496340 (and e!496341 mapRes!28583))))

(declare-fun condMapEmpty!28583 () Bool)

(declare-datatypes ((array!52001 0))(
  ( (array!52002 (arr!25007 (Array (_ BitVec 32) (_ BitVec 64))) (size!25453 (_ BitVec 32))) )
))
(declare-datatypes ((V!28991 0))(
  ( (V!28992 (val!9060 Int)) )
))
(declare-datatypes ((ValueCell!8528 0))(
  ( (ValueCellFull!8528 (v!11532 V!28991)) (EmptyCell!8528) )
))
(declare-datatypes ((array!52003 0))(
  ( (array!52004 (arr!25008 (Array (_ BitVec 32) ValueCell!8528)) (size!25454 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4072 0))(
  ( (LongMapFixedSize!4073 (defaultEntry!5233 Int) (mask!25697 (_ BitVec 32)) (extraKeys!4927 (_ BitVec 32)) (zeroValue!5031 V!28991) (minValue!5031 V!28991) (_size!2091 (_ BitVec 32)) (_keys!9911 array!52001) (_values!5218 array!52003) (_vacant!2091 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4072)

(declare-fun mapDefault!28583 () ValueCell!8528)

(assert (=> b!890028 (= condMapEmpty!28583 (= (arr!25008 (_values!5218 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8528)) mapDefault!28583)))))

(declare-fun b!890029 () Bool)

(declare-fun e!496342 () Bool)

(assert (=> b!890029 (= e!496342 true)))

(declare-fun lt!402002 () Bool)

(declare-datatypes ((List!17726 0))(
  ( (Nil!17723) (Cons!17722 (h!18853 (_ BitVec 64)) (t!25016 List!17726)) )
))
(declare-fun arrayNoDuplicates!0 (array!52001 (_ BitVec 32) List!17726) Bool)

(assert (=> b!890029 (= lt!402002 (arrayNoDuplicates!0 (_keys!9911 thiss!1181) #b00000000000000000000000000000000 Nil!17723))))

(declare-fun b!890030 () Bool)

(declare-fun e!496339 () Bool)

(assert (=> b!890030 (= e!496339 e!496342)))

(declare-fun res!603103 () Bool)

(assert (=> b!890030 (=> res!603103 e!496342)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890030 (= res!603103 (not (validMask!0 (mask!25697 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890030 (arrayContainsKey!0 (_keys!9911 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30236 0))(
  ( (Unit!30237) )
))
(declare-fun lt!402000 () Unit!30236)

(declare-datatypes ((SeekEntryResult!8796 0))(
  ( (MissingZero!8796 (index!37555 (_ BitVec 32))) (Found!8796 (index!37556 (_ BitVec 32))) (Intermediate!8796 (undefined!9608 Bool) (index!37557 (_ BitVec 32)) (x!75623 (_ BitVec 32))) (Undefined!8796) (MissingVacant!8796 (index!37558 (_ BitVec 32))) )
))
(declare-fun lt!402001 () SeekEntryResult!8796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52001 (_ BitVec 64) (_ BitVec 32)) Unit!30236)

(assert (=> b!890030 (= lt!402000 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9911 thiss!1181) key!785 (index!37556 lt!402001)))))

(declare-fun b!890031 () Bool)

(declare-fun e!496343 () Bool)

(declare-fun tp_is_empty!18019 () Bool)

(assert (=> b!890031 (= e!496343 tp_is_empty!18019)))

(declare-fun e!496338 () Bool)

(declare-fun array_inv!19710 (array!52001) Bool)

(declare-fun array_inv!19711 (array!52003) Bool)

(assert (=> b!890032 (= e!496338 (and tp!55042 tp_is_empty!18019 (array_inv!19710 (_keys!9911 thiss!1181)) (array_inv!19711 (_values!5218 thiss!1181)) e!496340))))

(declare-fun b!890033 () Bool)

(assert (=> b!890033 (= e!496341 tp_is_empty!18019)))

(declare-fun mapIsEmpty!28583 () Bool)

(assert (=> mapIsEmpty!28583 mapRes!28583))

(declare-fun b!890034 () Bool)

(declare-fun e!496345 () Bool)

(assert (=> b!890034 (= e!496345 (not e!496339))))

(declare-fun res!603107 () Bool)

(assert (=> b!890034 (=> res!603107 e!496339)))

(get-info :version)

(assert (=> b!890034 (= res!603107 (not ((_ is Found!8796) lt!402001)))))

(declare-fun e!496344 () Bool)

(assert (=> b!890034 e!496344))

(declare-fun res!603106 () Bool)

(assert (=> b!890034 (=> res!603106 e!496344)))

(assert (=> b!890034 (= res!603106 (not ((_ is Found!8796) lt!402001)))))

(declare-fun lt!401999 () Unit!30236)

(declare-fun lemmaSeekEntryGivesInRangeIndex!9 (array!52001 array!52003 (_ BitVec 32) (_ BitVec 32) V!28991 V!28991 (_ BitVec 64)) Unit!30236)

(assert (=> b!890034 (= lt!401999 (lemmaSeekEntryGivesInRangeIndex!9 (_keys!9911 thiss!1181) (_values!5218 thiss!1181) (mask!25697 thiss!1181) (extraKeys!4927 thiss!1181) (zeroValue!5031 thiss!1181) (minValue!5031 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52001 (_ BitVec 32)) SeekEntryResult!8796)

(assert (=> b!890034 (= lt!402001 (seekEntry!0 key!785 (_keys!9911 thiss!1181) (mask!25697 thiss!1181)))))

(declare-fun b!890035 () Bool)

(declare-fun res!603104 () Bool)

(assert (=> b!890035 (=> res!603104 e!496342)))

(assert (=> b!890035 (= res!603104 (or (not (= (size!25454 (_values!5218 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25697 thiss!1181)))) (not (= (size!25453 (_keys!9911 thiss!1181)) (size!25454 (_values!5218 thiss!1181)))) (bvslt (mask!25697 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4927 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4927 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890036 () Bool)

(declare-fun res!603102 () Bool)

(assert (=> b!890036 (=> (not res!603102) (not e!496345))))

(assert (=> b!890036 (= res!603102 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890037 () Bool)

(declare-fun res!603105 () Bool)

(assert (=> b!890037 (=> res!603105 e!496342)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52001 (_ BitVec 32)) Bool)

(assert (=> b!890037 (= res!603105 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9911 thiss!1181) (mask!25697 thiss!1181))))))

(declare-fun res!603108 () Bool)

(assert (=> start!75702 (=> (not res!603108) (not e!496345))))

(declare-fun valid!1591 (LongMapFixedSize!4072) Bool)

(assert (=> start!75702 (= res!603108 (valid!1591 thiss!1181))))

(assert (=> start!75702 e!496345))

(assert (=> start!75702 e!496338))

(assert (=> start!75702 true))

(declare-fun mapNonEmpty!28583 () Bool)

(declare-fun tp!55043 () Bool)

(assert (=> mapNonEmpty!28583 (= mapRes!28583 (and tp!55043 e!496343))))

(declare-fun mapRest!28583 () (Array (_ BitVec 32) ValueCell!8528))

(declare-fun mapValue!28583 () ValueCell!8528)

(declare-fun mapKey!28583 () (_ BitVec 32))

(assert (=> mapNonEmpty!28583 (= (arr!25008 (_values!5218 thiss!1181)) (store mapRest!28583 mapKey!28583 mapValue!28583))))

(declare-fun b!890038 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890038 (= e!496344 (inRange!0 (index!37556 lt!402001) (mask!25697 thiss!1181)))))

(assert (= (and start!75702 res!603108) b!890036))

(assert (= (and b!890036 res!603102) b!890034))

(assert (= (and b!890034 (not res!603106)) b!890038))

(assert (= (and b!890034 (not res!603107)) b!890030))

(assert (= (and b!890030 (not res!603103)) b!890035))

(assert (= (and b!890035 (not res!603104)) b!890037))

(assert (= (and b!890037 (not res!603105)) b!890029))

(assert (= (and b!890028 condMapEmpty!28583) mapIsEmpty!28583))

(assert (= (and b!890028 (not condMapEmpty!28583)) mapNonEmpty!28583))

(assert (= (and mapNonEmpty!28583 ((_ is ValueCellFull!8528) mapValue!28583)) b!890031))

(assert (= (and b!890028 ((_ is ValueCellFull!8528) mapDefault!28583)) b!890033))

(assert (= b!890032 b!890028))

(assert (= start!75702 b!890032))

(declare-fun m!828103 () Bool)

(assert (=> mapNonEmpty!28583 m!828103))

(declare-fun m!828105 () Bool)

(assert (=> start!75702 m!828105))

(declare-fun m!828107 () Bool)

(assert (=> b!890032 m!828107))

(declare-fun m!828109 () Bool)

(assert (=> b!890032 m!828109))

(declare-fun m!828111 () Bool)

(assert (=> b!890038 m!828111))

(declare-fun m!828113 () Bool)

(assert (=> b!890034 m!828113))

(declare-fun m!828115 () Bool)

(assert (=> b!890034 m!828115))

(declare-fun m!828117 () Bool)

(assert (=> b!890029 m!828117))

(declare-fun m!828119 () Bool)

(assert (=> b!890030 m!828119))

(declare-fun m!828121 () Bool)

(assert (=> b!890030 m!828121))

(declare-fun m!828123 () Bool)

(assert (=> b!890030 m!828123))

(declare-fun m!828125 () Bool)

(assert (=> b!890037 m!828125))

(check-sat (not b!890029) (not b!890038) (not b!890037) tp_is_empty!18019 (not b_next!15691) (not start!75702) (not b!890030) b_and!25905 (not b!890032) (not mapNonEmpty!28583) (not b!890034))
(check-sat b_and!25905 (not b_next!15691))
