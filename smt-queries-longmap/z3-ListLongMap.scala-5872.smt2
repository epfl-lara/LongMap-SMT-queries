; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75764 () Bool)

(assert start!75764)

(declare-fun b!890995 () Bool)

(declare-fun b_free!15735 () Bool)

(declare-fun b_next!15735 () Bool)

(assert (=> b!890995 (= b_free!15735 (not b_next!15735))))

(declare-fun tp!55174 () Bool)

(declare-fun b_and!25975 () Bool)

(assert (=> b!890995 (= tp!55174 b_and!25975)))

(declare-fun b!890993 () Bool)

(declare-fun e!497081 () Bool)

(declare-datatypes ((SeekEntryResult!8813 0))(
  ( (MissingZero!8813 (index!37623 (_ BitVec 32))) (Found!8813 (index!37624 (_ BitVec 32))) (Intermediate!8813 (undefined!9625 Bool) (index!37625 (_ BitVec 32)) (x!75701 (_ BitVec 32))) (Undefined!8813) (MissingVacant!8813 (index!37626 (_ BitVec 32))) )
))
(declare-fun lt!402501 () SeekEntryResult!8813)

(declare-datatypes ((array!52106 0))(
  ( (array!52107 (arr!25059 (Array (_ BitVec 32) (_ BitVec 64))) (size!25503 (_ BitVec 32))) )
))
(declare-datatypes ((V!29049 0))(
  ( (V!29050 (val!9082 Int)) )
))
(declare-datatypes ((ValueCell!8550 0))(
  ( (ValueCellFull!8550 (v!11560 V!29049)) (EmptyCell!8550) )
))
(declare-datatypes ((array!52108 0))(
  ( (array!52109 (arr!25060 (Array (_ BitVec 32) ValueCell!8550)) (size!25504 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4116 0))(
  ( (LongMapFixedSize!4117 (defaultEntry!5255 Int) (mask!25740 (_ BitVec 32)) (extraKeys!4949 (_ BitVec 32)) (zeroValue!5053 V!29049) (minValue!5053 V!29049) (_size!2113 (_ BitVec 32)) (_keys!9938 array!52106) (_values!5240 array!52108) (_vacant!2113 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4116)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890993 (= e!497081 (inRange!0 (index!37624 lt!402501) (mask!25740 thiss!1181)))))

(declare-fun res!603679 () Bool)

(declare-fun e!497082 () Bool)

(assert (=> start!75764 (=> (not res!603679) (not e!497082))))

(declare-fun valid!1598 (LongMapFixedSize!4116) Bool)

(assert (=> start!75764 (= res!603679 (valid!1598 thiss!1181))))

(assert (=> start!75764 e!497082))

(declare-fun e!497080 () Bool)

(assert (=> start!75764 e!497080))

(assert (=> start!75764 true))

(declare-fun b!890994 () Bool)

(declare-fun e!497086 () Bool)

(declare-fun tp_is_empty!18063 () Bool)

(assert (=> b!890994 (= e!497086 tp_is_empty!18063)))

(declare-fun e!497085 () Bool)

(declare-fun array_inv!19696 (array!52106) Bool)

(declare-fun array_inv!19697 (array!52108) Bool)

(assert (=> b!890995 (= e!497080 (and tp!55174 tp_is_empty!18063 (array_inv!19696 (_keys!9938 thiss!1181)) (array_inv!19697 (_values!5240 thiss!1181)) e!497085))))

(declare-fun b!890996 () Bool)

(declare-fun e!497083 () Bool)

(assert (=> b!890996 (= e!497083 true)))

(declare-fun lt!402499 () Bool)

(declare-datatypes ((List!17731 0))(
  ( (Nil!17728) (Cons!17727 (h!18858 (_ BitVec 64)) (t!25030 List!17731)) )
))
(declare-fun arrayNoDuplicates!0 (array!52106 (_ BitVec 32) List!17731) Bool)

(assert (=> b!890996 (= lt!402499 (arrayNoDuplicates!0 (_keys!9938 thiss!1181) #b00000000000000000000000000000000 Nil!17728))))

(declare-fun mapIsEmpty!28649 () Bool)

(declare-fun mapRes!28649 () Bool)

(assert (=> mapIsEmpty!28649 mapRes!28649))

(declare-fun mapNonEmpty!28649 () Bool)

(declare-fun tp!55173 () Bool)

(assert (=> mapNonEmpty!28649 (= mapRes!28649 (and tp!55173 e!497086))))

(declare-fun mapRest!28649 () (Array (_ BitVec 32) ValueCell!8550))

(declare-fun mapKey!28649 () (_ BitVec 32))

(declare-fun mapValue!28649 () ValueCell!8550)

(assert (=> mapNonEmpty!28649 (= (arr!25060 (_values!5240 thiss!1181)) (store mapRest!28649 mapKey!28649 mapValue!28649))))

(declare-fun b!890997 () Bool)

(declare-fun e!497088 () Bool)

(assert (=> b!890997 (= e!497085 (and e!497088 mapRes!28649))))

(declare-fun condMapEmpty!28649 () Bool)

(declare-fun mapDefault!28649 () ValueCell!8550)

(assert (=> b!890997 (= condMapEmpty!28649 (= (arr!25060 (_values!5240 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8550)) mapDefault!28649)))))

(declare-fun b!890998 () Bool)

(assert (=> b!890998 (= e!497088 tp_is_empty!18063)))

(declare-fun b!890999 () Bool)

(declare-fun e!497087 () Bool)

(assert (=> b!890999 (= e!497082 (not e!497087))))

(declare-fun res!603674 () Bool)

(assert (=> b!890999 (=> res!603674 e!497087)))

(get-info :version)

(assert (=> b!890999 (= res!603674 (not ((_ is Found!8813) lt!402501)))))

(assert (=> b!890999 e!497081))

(declare-fun res!603675 () Bool)

(assert (=> b!890999 (=> res!603675 e!497081)))

(assert (=> b!890999 (= res!603675 (not ((_ is Found!8813) lt!402501)))))

(declare-datatypes ((Unit!30324 0))(
  ( (Unit!30325) )
))
(declare-fun lt!402502 () Unit!30324)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!20 (array!52106 array!52108 (_ BitVec 32) (_ BitVec 32) V!29049 V!29049 (_ BitVec 64)) Unit!30324)

(assert (=> b!890999 (= lt!402502 (lemmaSeekEntryGivesInRangeIndex!20 (_keys!9938 thiss!1181) (_values!5240 thiss!1181) (mask!25740 thiss!1181) (extraKeys!4949 thiss!1181) (zeroValue!5053 thiss!1181) (minValue!5053 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52106 (_ BitVec 32)) SeekEntryResult!8813)

(assert (=> b!890999 (= lt!402501 (seekEntry!0 key!785 (_keys!9938 thiss!1181) (mask!25740 thiss!1181)))))

(declare-fun b!891000 () Bool)

(declare-fun res!603676 () Bool)

(assert (=> b!891000 (=> res!603676 e!497083)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52106 (_ BitVec 32)) Bool)

(assert (=> b!891000 (= res!603676 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9938 thiss!1181) (mask!25740 thiss!1181))))))

(declare-fun b!891001 () Bool)

(assert (=> b!891001 (= e!497087 e!497083)))

(declare-fun res!603677 () Bool)

(assert (=> b!891001 (=> res!603677 e!497083)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891001 (= res!603677 (not (validMask!0 (mask!25740 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891001 (arrayContainsKey!0 (_keys!9938 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402500 () Unit!30324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52106 (_ BitVec 64) (_ BitVec 32)) Unit!30324)

(assert (=> b!891001 (= lt!402500 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9938 thiss!1181) key!785 (index!37624 lt!402501)))))

(declare-fun b!891002 () Bool)

(declare-fun res!603680 () Bool)

(assert (=> b!891002 (=> res!603680 e!497083)))

(assert (=> b!891002 (= res!603680 (or (not (= (size!25504 (_values!5240 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25740 thiss!1181)))) (not (= (size!25503 (_keys!9938 thiss!1181)) (size!25504 (_values!5240 thiss!1181)))) (bvslt (mask!25740 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4949 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4949 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891003 () Bool)

(declare-fun res!603678 () Bool)

(assert (=> b!891003 (=> (not res!603678) (not e!497082))))

(assert (=> b!891003 (= res!603678 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!75764 res!603679) b!891003))

(assert (= (and b!891003 res!603678) b!890999))

(assert (= (and b!890999 (not res!603675)) b!890993))

(assert (= (and b!890999 (not res!603674)) b!891001))

(assert (= (and b!891001 (not res!603677)) b!891002))

(assert (= (and b!891002 (not res!603680)) b!891000))

(assert (= (and b!891000 (not res!603676)) b!890996))

(assert (= (and b!890997 condMapEmpty!28649) mapIsEmpty!28649))

(assert (= (and b!890997 (not condMapEmpty!28649)) mapNonEmpty!28649))

(assert (= (and mapNonEmpty!28649 ((_ is ValueCellFull!8550) mapValue!28649)) b!890994))

(assert (= (and b!890997 ((_ is ValueCellFull!8550) mapDefault!28649)) b!890998))

(assert (= b!890995 b!890997))

(assert (= start!75764 b!890995))

(declare-fun m!829389 () Bool)

(assert (=> b!891000 m!829389))

(declare-fun m!829391 () Bool)

(assert (=> b!891001 m!829391))

(declare-fun m!829393 () Bool)

(assert (=> b!891001 m!829393))

(declare-fun m!829395 () Bool)

(assert (=> b!891001 m!829395))

(declare-fun m!829397 () Bool)

(assert (=> start!75764 m!829397))

(declare-fun m!829399 () Bool)

(assert (=> mapNonEmpty!28649 m!829399))

(declare-fun m!829401 () Bool)

(assert (=> b!890999 m!829401))

(declare-fun m!829403 () Bool)

(assert (=> b!890999 m!829403))

(declare-fun m!829405 () Bool)

(assert (=> b!890996 m!829405))

(declare-fun m!829407 () Bool)

(assert (=> b!890993 m!829407))

(declare-fun m!829409 () Bool)

(assert (=> b!890995 m!829409))

(declare-fun m!829411 () Bool)

(assert (=> b!890995 m!829411))

(check-sat (not b_next!15735) (not b!890995) b_and!25975 (not b!890993) (not b!890999) tp_is_empty!18063 (not b!891000) (not start!75764) (not b!890996) (not b!891001) (not mapNonEmpty!28649))
(check-sat b_and!25975 (not b_next!15735))
