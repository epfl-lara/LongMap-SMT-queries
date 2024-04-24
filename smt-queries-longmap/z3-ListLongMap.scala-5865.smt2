; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75888 () Bool)

(assert start!75888)

(declare-fun b!891171 () Bool)

(declare-fun b_free!15691 () Bool)

(declare-fun b_next!15691 () Bool)

(assert (=> b!891171 (= b_free!15691 (not b_next!15691))))

(declare-fun tp!55043 () Bool)

(declare-fun b_and!25941 () Bool)

(assert (=> b!891171 (= tp!55043 b_and!25941)))

(declare-fun b!891170 () Bool)

(declare-fun e!497068 () Bool)

(declare-fun tp_is_empty!18019 () Bool)

(assert (=> b!891170 (= e!497068 tp_is_empty!18019)))

(declare-datatypes ((array!52057 0))(
  ( (array!52058 (arr!25030 (Array (_ BitVec 32) (_ BitVec 64))) (size!25475 (_ BitVec 32))) )
))
(declare-datatypes ((V!28991 0))(
  ( (V!28992 (val!9060 Int)) )
))
(declare-datatypes ((ValueCell!8528 0))(
  ( (ValueCellFull!8528 (v!11535 V!28991)) (EmptyCell!8528) )
))
(declare-datatypes ((array!52059 0))(
  ( (array!52060 (arr!25031 (Array (_ BitVec 32) ValueCell!8528)) (size!25476 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4072 0))(
  ( (LongMapFixedSize!4073 (defaultEntry!5233 Int) (mask!25747 (_ BitVec 32)) (extraKeys!4927 (_ BitVec 32)) (zeroValue!5031 V!28991) (minValue!5031 V!28991) (_size!2091 (_ BitVec 32)) (_keys!9944 array!52057) (_values!5218 array!52059) (_vacant!2091 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4072)

(declare-fun e!497070 () Bool)

(declare-fun e!497069 () Bool)

(declare-fun array_inv!19726 (array!52057) Bool)

(declare-fun array_inv!19727 (array!52059) Bool)

(assert (=> b!891171 (= e!497070 (and tp!55043 tp_is_empty!18019 (array_inv!19726 (_keys!9944 thiss!1181)) (array_inv!19727 (_values!5218 thiss!1181)) e!497069))))

(declare-fun mapNonEmpty!28583 () Bool)

(declare-fun mapRes!28583 () Bool)

(declare-fun tp!55042 () Bool)

(assert (=> mapNonEmpty!28583 (= mapRes!28583 (and tp!55042 e!497068))))

(declare-fun mapValue!28583 () ValueCell!8528)

(declare-fun mapRest!28583 () (Array (_ BitVec 32) ValueCell!8528))

(declare-fun mapKey!28583 () (_ BitVec 32))

(assert (=> mapNonEmpty!28583 (= (arr!25031 (_values!5218 thiss!1181)) (store mapRest!28583 mapKey!28583 mapValue!28583))))

(declare-fun b!891172 () Bool)

(declare-fun e!497073 () Bool)

(assert (=> b!891172 (= e!497073 tp_is_empty!18019)))

(declare-fun b!891173 () Bool)

(assert (=> b!891173 (= e!497069 (and e!497073 mapRes!28583))))

(declare-fun condMapEmpty!28583 () Bool)

(declare-fun mapDefault!28583 () ValueCell!8528)

(assert (=> b!891173 (= condMapEmpty!28583 (= (arr!25031 (_values!5218 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8528)) mapDefault!28583)))))

(declare-fun b!891174 () Bool)

(declare-fun e!497074 () Bool)

(declare-datatypes ((SeekEntryResult!8752 0))(
  ( (MissingZero!8752 (index!37379 (_ BitVec 32))) (Found!8752 (index!37380 (_ BitVec 32))) (Intermediate!8752 (undefined!9564 Bool) (index!37381 (_ BitVec 32)) (x!75598 (_ BitVec 32))) (Undefined!8752) (MissingVacant!8752 (index!37382 (_ BitVec 32))) )
))
(declare-fun lt!402597 () SeekEntryResult!8752)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891174 (= e!497074 (inRange!0 (index!37380 lt!402597) (mask!25747 thiss!1181)))))

(declare-fun b!891175 () Bool)

(declare-fun res!603557 () Bool)

(declare-fun e!497075 () Bool)

(assert (=> b!891175 (=> (not res!603557) (not e!497075))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!891175 (= res!603557 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891176 () Bool)

(declare-fun res!603562 () Bool)

(declare-fun e!497076 () Bool)

(assert (=> b!891176 (=> res!603562 e!497076)))

(assert (=> b!891176 (= res!603562 (or (not (= (size!25476 (_values!5218 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25747 thiss!1181)))) (not (= (size!25475 (_keys!9944 thiss!1181)) (size!25476 (_values!5218 thiss!1181)))) (bvslt (mask!25747 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4927 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4927 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891177 () Bool)

(declare-fun res!603558 () Bool)

(assert (=> b!891177 (=> res!603558 e!497076)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52057 (_ BitVec 32)) Bool)

(assert (=> b!891177 (= res!603558 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9944 thiss!1181) (mask!25747 thiss!1181))))))

(declare-fun mapIsEmpty!28583 () Bool)

(assert (=> mapIsEmpty!28583 mapRes!28583))

(declare-fun b!891178 () Bool)

(declare-fun e!497072 () Bool)

(assert (=> b!891178 (= e!497072 e!497076)))

(declare-fun res!603556 () Bool)

(assert (=> b!891178 (=> res!603556 e!497076)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891178 (= res!603556 (not (validMask!0 (mask!25747 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891178 (arrayContainsKey!0 (_keys!9944 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30276 0))(
  ( (Unit!30277) )
))
(declare-fun lt!402598 () Unit!30276)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52057 (_ BitVec 64) (_ BitVec 32)) Unit!30276)

(assert (=> b!891178 (= lt!402598 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9944 thiss!1181) key!785 (index!37380 lt!402597)))))

(declare-fun b!891179 () Bool)

(assert (=> b!891179 (= e!497075 (not e!497072))))

(declare-fun res!603559 () Bool)

(assert (=> b!891179 (=> res!603559 e!497072)))

(get-info :version)

(assert (=> b!891179 (= res!603559 (not ((_ is Found!8752) lt!402597)))))

(assert (=> b!891179 e!497074))

(declare-fun res!603560 () Bool)

(assert (=> b!891179 (=> res!603560 e!497074)))

(assert (=> b!891179 (= res!603560 (not ((_ is Found!8752) lt!402597)))))

(declare-fun lt!402599 () Unit!30276)

(declare-fun lemmaSeekEntryGivesInRangeIndex!10 (array!52057 array!52059 (_ BitVec 32) (_ BitVec 32) V!28991 V!28991 (_ BitVec 64)) Unit!30276)

(assert (=> b!891179 (= lt!402599 (lemmaSeekEntryGivesInRangeIndex!10 (_keys!9944 thiss!1181) (_values!5218 thiss!1181) (mask!25747 thiss!1181) (extraKeys!4927 thiss!1181) (zeroValue!5031 thiss!1181) (minValue!5031 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52057 (_ BitVec 32)) SeekEntryResult!8752)

(assert (=> b!891179 (= lt!402597 (seekEntry!0 key!785 (_keys!9944 thiss!1181) (mask!25747 thiss!1181)))))

(declare-fun b!891180 () Bool)

(assert (=> b!891180 (= e!497076 true)))

(declare-fun lt!402596 () Bool)

(declare-datatypes ((List!17671 0))(
  ( (Nil!17668) (Cons!17667 (h!18804 (_ BitVec 64)) (t!24962 List!17671)) )
))
(declare-fun arrayNoDuplicates!0 (array!52057 (_ BitVec 32) List!17671) Bool)

(assert (=> b!891180 (= lt!402596 (arrayNoDuplicates!0 (_keys!9944 thiss!1181) #b00000000000000000000000000000000 Nil!17668))))

(declare-fun res!603561 () Bool)

(assert (=> start!75888 (=> (not res!603561) (not e!497075))))

(declare-fun valid!1593 (LongMapFixedSize!4072) Bool)

(assert (=> start!75888 (= res!603561 (valid!1593 thiss!1181))))

(assert (=> start!75888 e!497075))

(assert (=> start!75888 e!497070))

(assert (=> start!75888 true))

(assert (= (and start!75888 res!603561) b!891175))

(assert (= (and b!891175 res!603557) b!891179))

(assert (= (and b!891179 (not res!603560)) b!891174))

(assert (= (and b!891179 (not res!603559)) b!891178))

(assert (= (and b!891178 (not res!603556)) b!891176))

(assert (= (and b!891176 (not res!603562)) b!891177))

(assert (= (and b!891177 (not res!603558)) b!891180))

(assert (= (and b!891173 condMapEmpty!28583) mapIsEmpty!28583))

(assert (= (and b!891173 (not condMapEmpty!28583)) mapNonEmpty!28583))

(assert (= (and mapNonEmpty!28583 ((_ is ValueCellFull!8528) mapValue!28583)) b!891170))

(assert (= (and b!891173 ((_ is ValueCellFull!8528) mapDefault!28583)) b!891172))

(assert (= b!891171 b!891173))

(assert (= start!75888 b!891171))

(declare-fun m!830155 () Bool)

(assert (=> b!891177 m!830155))

(declare-fun m!830157 () Bool)

(assert (=> b!891174 m!830157))

(declare-fun m!830159 () Bool)

(assert (=> start!75888 m!830159))

(declare-fun m!830161 () Bool)

(assert (=> b!891180 m!830161))

(declare-fun m!830163 () Bool)

(assert (=> mapNonEmpty!28583 m!830163))

(declare-fun m!830165 () Bool)

(assert (=> b!891171 m!830165))

(declare-fun m!830167 () Bool)

(assert (=> b!891171 m!830167))

(declare-fun m!830169 () Bool)

(assert (=> b!891179 m!830169))

(declare-fun m!830171 () Bool)

(assert (=> b!891179 m!830171))

(declare-fun m!830173 () Bool)

(assert (=> b!891178 m!830173))

(declare-fun m!830175 () Bool)

(assert (=> b!891178 m!830175))

(declare-fun m!830177 () Bool)

(assert (=> b!891178 m!830177))

(check-sat (not b!891171) (not b!891177) (not b!891174) (not start!75888) tp_is_empty!18019 (not b!891178) (not b!891179) (not b!891180) (not b_next!15691) (not mapNonEmpty!28583) b_and!25941)
(check-sat b_and!25941 (not b_next!15691))
