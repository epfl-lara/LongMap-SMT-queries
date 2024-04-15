; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75714 () Bool)

(assert start!75714)

(declare-fun b!890231 () Bool)

(declare-fun b_free!15703 () Bool)

(declare-fun b_next!15703 () Bool)

(assert (=> b!890231 (= b_free!15703 (not b_next!15703))))

(declare-fun tp!55078 () Bool)

(declare-fun b_and!25917 () Bool)

(assert (=> b!890231 (= tp!55078 b_and!25917)))

(declare-fun b!890226 () Bool)

(declare-fun res!603228 () Bool)

(declare-fun e!496500 () Bool)

(assert (=> b!890226 (=> res!603228 e!496500)))

(declare-datatypes ((array!52025 0))(
  ( (array!52026 (arr!25019 (Array (_ BitVec 32) (_ BitVec 64))) (size!25465 (_ BitVec 32))) )
))
(declare-datatypes ((V!29007 0))(
  ( (V!29008 (val!9066 Int)) )
))
(declare-datatypes ((ValueCell!8534 0))(
  ( (ValueCellFull!8534 (v!11538 V!29007)) (EmptyCell!8534) )
))
(declare-datatypes ((array!52027 0))(
  ( (array!52028 (arr!25020 (Array (_ BitVec 32) ValueCell!8534)) (size!25466 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4084 0))(
  ( (LongMapFixedSize!4085 (defaultEntry!5239 Int) (mask!25707 (_ BitVec 32)) (extraKeys!4933 (_ BitVec 32)) (zeroValue!5037 V!29007) (minValue!5037 V!29007) (_size!2097 (_ BitVec 32)) (_keys!9917 array!52025) (_values!5224 array!52027) (_vacant!2097 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4084)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52025 (_ BitVec 32)) Bool)

(assert (=> b!890226 (= res!603228 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9917 thiss!1181) (mask!25707 thiss!1181))))))

(declare-fun b!890227 () Bool)

(assert (=> b!890227 (= e!496500 true)))

(declare-fun lt!402073 () Bool)

(declare-datatypes ((List!17729 0))(
  ( (Nil!17726) (Cons!17725 (h!18856 (_ BitVec 64)) (t!25019 List!17729)) )
))
(declare-fun arrayNoDuplicates!0 (array!52025 (_ BitVec 32) List!17729) Bool)

(assert (=> b!890227 (= lt!402073 (arrayNoDuplicates!0 (_keys!9917 thiss!1181) #b00000000000000000000000000000000 Nil!17726))))

(declare-fun b!890228 () Bool)

(declare-fun e!496505 () Bool)

(declare-fun e!496502 () Bool)

(assert (=> b!890228 (= e!496505 (not e!496502))))

(declare-fun res!603229 () Bool)

(assert (=> b!890228 (=> res!603229 e!496502)))

(declare-datatypes ((SeekEntryResult!8802 0))(
  ( (MissingZero!8802 (index!37579 (_ BitVec 32))) (Found!8802 (index!37580 (_ BitVec 32))) (Intermediate!8802 (undefined!9614 Bool) (index!37581 (_ BitVec 32)) (x!75645 (_ BitVec 32))) (Undefined!8802) (MissingVacant!8802 (index!37582 (_ BitVec 32))) )
))
(declare-fun lt!402074 () SeekEntryResult!8802)

(get-info :version)

(assert (=> b!890228 (= res!603229 (not ((_ is Found!8802) lt!402074)))))

(declare-fun e!496507 () Bool)

(assert (=> b!890228 e!496507))

(declare-fun res!603232 () Bool)

(assert (=> b!890228 (=> res!603232 e!496507)))

(assert (=> b!890228 (= res!603232 (not ((_ is Found!8802) lt!402074)))))

(declare-datatypes ((Unit!30246 0))(
  ( (Unit!30247) )
))
(declare-fun lt!402072 () Unit!30246)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!13 (array!52025 array!52027 (_ BitVec 32) (_ BitVec 32) V!29007 V!29007 (_ BitVec 64)) Unit!30246)

(assert (=> b!890228 (= lt!402072 (lemmaSeekEntryGivesInRangeIndex!13 (_keys!9917 thiss!1181) (_values!5224 thiss!1181) (mask!25707 thiss!1181) (extraKeys!4933 thiss!1181) (zeroValue!5037 thiss!1181) (minValue!5037 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52025 (_ BitVec 32)) SeekEntryResult!8802)

(assert (=> b!890228 (= lt!402074 (seekEntry!0 key!785 (_keys!9917 thiss!1181) (mask!25707 thiss!1181)))))

(declare-fun b!890229 () Bool)

(declare-fun e!496508 () Bool)

(declare-fun e!496504 () Bool)

(declare-fun mapRes!28601 () Bool)

(assert (=> b!890229 (= e!496508 (and e!496504 mapRes!28601))))

(declare-fun condMapEmpty!28601 () Bool)

(declare-fun mapDefault!28601 () ValueCell!8534)

(assert (=> b!890229 (= condMapEmpty!28601 (= (arr!25020 (_values!5224 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8534)) mapDefault!28601)))))

(declare-fun b!890230 () Bool)

(assert (=> b!890230 (= e!496502 e!496500)))

(declare-fun res!603230 () Bool)

(assert (=> b!890230 (=> res!603230 e!496500)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890230 (= res!603230 (not (validMask!0 (mask!25707 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890230 (arrayContainsKey!0 (_keys!9917 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402071 () Unit!30246)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52025 (_ BitVec 64) (_ BitVec 32)) Unit!30246)

(assert (=> b!890230 (= lt!402071 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9917 thiss!1181) key!785 (index!37580 lt!402074)))))

(declare-fun mapIsEmpty!28601 () Bool)

(assert (=> mapIsEmpty!28601 mapRes!28601))

(declare-fun e!496501 () Bool)

(declare-fun tp_is_empty!18031 () Bool)

(declare-fun array_inv!19716 (array!52025) Bool)

(declare-fun array_inv!19717 (array!52027) Bool)

(assert (=> b!890231 (= e!496501 (and tp!55078 tp_is_empty!18031 (array_inv!19716 (_keys!9917 thiss!1181)) (array_inv!19717 (_values!5224 thiss!1181)) e!496508))))

(declare-fun res!603233 () Bool)

(assert (=> start!75714 (=> (not res!603233) (not e!496505))))

(declare-fun valid!1594 (LongMapFixedSize!4084) Bool)

(assert (=> start!75714 (= res!603233 (valid!1594 thiss!1181))))

(assert (=> start!75714 e!496505))

(assert (=> start!75714 e!496501))

(assert (=> start!75714 true))

(declare-fun b!890232 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890232 (= e!496507 (inRange!0 (index!37580 lt!402074) (mask!25707 thiss!1181)))))

(declare-fun b!890233 () Bool)

(assert (=> b!890233 (= e!496504 tp_is_empty!18031)))

(declare-fun b!890234 () Bool)

(declare-fun res!603231 () Bool)

(assert (=> b!890234 (=> res!603231 e!496500)))

(assert (=> b!890234 (= res!603231 (or (not (= (size!25466 (_values!5224 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25707 thiss!1181)))) (not (= (size!25465 (_keys!9917 thiss!1181)) (size!25466 (_values!5224 thiss!1181)))) (bvslt (mask!25707 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4933 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4933 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890235 () Bool)

(declare-fun res!603234 () Bool)

(assert (=> b!890235 (=> (not res!603234) (not e!496505))))

(assert (=> b!890235 (= res!603234 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28601 () Bool)

(declare-fun tp!55079 () Bool)

(declare-fun e!496503 () Bool)

(assert (=> mapNonEmpty!28601 (= mapRes!28601 (and tp!55079 e!496503))))

(declare-fun mapRest!28601 () (Array (_ BitVec 32) ValueCell!8534))

(declare-fun mapKey!28601 () (_ BitVec 32))

(declare-fun mapValue!28601 () ValueCell!8534)

(assert (=> mapNonEmpty!28601 (= (arr!25020 (_values!5224 thiss!1181)) (store mapRest!28601 mapKey!28601 mapValue!28601))))

(declare-fun b!890236 () Bool)

(assert (=> b!890236 (= e!496503 tp_is_empty!18031)))

(assert (= (and start!75714 res!603233) b!890235))

(assert (= (and b!890235 res!603234) b!890228))

(assert (= (and b!890228 (not res!603232)) b!890232))

(assert (= (and b!890228 (not res!603229)) b!890230))

(assert (= (and b!890230 (not res!603230)) b!890234))

(assert (= (and b!890234 (not res!603231)) b!890226))

(assert (= (and b!890226 (not res!603228)) b!890227))

(assert (= (and b!890229 condMapEmpty!28601) mapIsEmpty!28601))

(assert (= (and b!890229 (not condMapEmpty!28601)) mapNonEmpty!28601))

(assert (= (and mapNonEmpty!28601 ((_ is ValueCellFull!8534) mapValue!28601)) b!890236))

(assert (= (and b!890229 ((_ is ValueCellFull!8534) mapDefault!28601)) b!890233))

(assert (= b!890231 b!890229))

(assert (= start!75714 b!890231))

(declare-fun m!828247 () Bool)

(assert (=> b!890230 m!828247))

(declare-fun m!828249 () Bool)

(assert (=> b!890230 m!828249))

(declare-fun m!828251 () Bool)

(assert (=> b!890230 m!828251))

(declare-fun m!828253 () Bool)

(assert (=> mapNonEmpty!28601 m!828253))

(declare-fun m!828255 () Bool)

(assert (=> b!890226 m!828255))

(declare-fun m!828257 () Bool)

(assert (=> b!890232 m!828257))

(declare-fun m!828259 () Bool)

(assert (=> b!890227 m!828259))

(declare-fun m!828261 () Bool)

(assert (=> b!890228 m!828261))

(declare-fun m!828263 () Bool)

(assert (=> b!890228 m!828263))

(declare-fun m!828265 () Bool)

(assert (=> b!890231 m!828265))

(declare-fun m!828267 () Bool)

(assert (=> b!890231 m!828267))

(declare-fun m!828269 () Bool)

(assert (=> start!75714 m!828269))

(check-sat (not start!75714) tp_is_empty!18031 b_and!25917 (not b!890227) (not b!890232) (not b!890231) (not b!890226) (not b_next!15703) (not mapNonEmpty!28601) (not b!890228) (not b!890230))
(check-sat b_and!25917 (not b_next!15703))
