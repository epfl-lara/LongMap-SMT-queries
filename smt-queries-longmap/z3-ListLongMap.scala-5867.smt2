; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75900 () Bool)

(assert start!75900)

(declare-fun b!891372 () Bool)

(declare-fun b_free!15703 () Bool)

(declare-fun b_next!15703 () Bool)

(assert (=> b!891372 (= b_free!15703 (not b_next!15703))))

(declare-fun tp!55079 () Bool)

(declare-fun b_and!25953 () Bool)

(assert (=> b!891372 (= tp!55079 b_and!25953)))

(declare-fun b!891368 () Bool)

(declare-fun e!497234 () Bool)

(declare-fun tp_is_empty!18031 () Bool)

(assert (=> b!891368 (= e!497234 tp_is_empty!18031)))

(declare-fun b!891369 () Bool)

(declare-fun e!497233 () Bool)

(assert (=> b!891369 (= e!497233 tp_is_empty!18031)))

(declare-fun b!891370 () Bool)

(declare-fun e!497236 () Bool)

(declare-datatypes ((SeekEntryResult!8758 0))(
  ( (MissingZero!8758 (index!37403 (_ BitVec 32))) (Found!8758 (index!37404 (_ BitVec 32))) (Intermediate!8758 (undefined!9570 Bool) (index!37405 (_ BitVec 32)) (x!75620 (_ BitVec 32))) (Undefined!8758) (MissingVacant!8758 (index!37406 (_ BitVec 32))) )
))
(declare-fun lt!402669 () SeekEntryResult!8758)

(declare-datatypes ((array!52081 0))(
  ( (array!52082 (arr!25042 (Array (_ BitVec 32) (_ BitVec 64))) (size!25487 (_ BitVec 32))) )
))
(declare-datatypes ((V!29007 0))(
  ( (V!29008 (val!9066 Int)) )
))
(declare-datatypes ((ValueCell!8534 0))(
  ( (ValueCellFull!8534 (v!11541 V!29007)) (EmptyCell!8534) )
))
(declare-datatypes ((array!52083 0))(
  ( (array!52084 (arr!25043 (Array (_ BitVec 32) ValueCell!8534)) (size!25488 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4084 0))(
  ( (LongMapFixedSize!4085 (defaultEntry!5239 Int) (mask!25757 (_ BitVec 32)) (extraKeys!4933 (_ BitVec 32)) (zeroValue!5037 V!29007) (minValue!5037 V!29007) (_size!2097 (_ BitVec 32)) (_keys!9950 array!52081) (_values!5224 array!52083) (_vacant!2097 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4084)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891370 (= e!497236 (inRange!0 (index!37404 lt!402669) (mask!25757 thiss!1181)))))

(declare-fun b!891371 () Bool)

(declare-fun e!497237 () Bool)

(declare-fun mapRes!28601 () Bool)

(assert (=> b!891371 (= e!497237 (and e!497233 mapRes!28601))))

(declare-fun condMapEmpty!28601 () Bool)

(declare-fun mapDefault!28601 () ValueCell!8534)

(assert (=> b!891371 (= condMapEmpty!28601 (= (arr!25043 (_values!5224 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8534)) mapDefault!28601)))))

(declare-fun res!603687 () Bool)

(declare-fun e!497230 () Bool)

(assert (=> start!75900 (=> (not res!603687) (not e!497230))))

(declare-fun valid!1597 (LongMapFixedSize!4084) Bool)

(assert (=> start!75900 (= res!603687 (valid!1597 thiss!1181))))

(assert (=> start!75900 e!497230))

(declare-fun e!497235 () Bool)

(assert (=> start!75900 e!497235))

(assert (=> start!75900 true))

(declare-fun array_inv!19734 (array!52081) Bool)

(declare-fun array_inv!19735 (array!52083) Bool)

(assert (=> b!891372 (= e!497235 (and tp!55079 tp_is_empty!18031 (array_inv!19734 (_keys!9950 thiss!1181)) (array_inv!19735 (_values!5224 thiss!1181)) e!497237))))

(declare-fun b!891373 () Bool)

(declare-fun res!603682 () Bool)

(declare-fun e!497238 () Bool)

(assert (=> b!891373 (=> res!603682 e!497238)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52081 (_ BitVec 32)) Bool)

(assert (=> b!891373 (= res!603682 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9950 thiss!1181) (mask!25757 thiss!1181))))))

(declare-fun b!891374 () Bool)

(declare-fun e!497231 () Bool)

(assert (=> b!891374 (= e!497230 (not e!497231))))

(declare-fun res!603685 () Bool)

(assert (=> b!891374 (=> res!603685 e!497231)))

(get-info :version)

(assert (=> b!891374 (= res!603685 (not ((_ is Found!8758) lt!402669)))))

(assert (=> b!891374 e!497236))

(declare-fun res!603688 () Bool)

(assert (=> b!891374 (=> res!603688 e!497236)))

(assert (=> b!891374 (= res!603688 (not ((_ is Found!8758) lt!402669)))))

(declare-datatypes ((Unit!30288 0))(
  ( (Unit!30289) )
))
(declare-fun lt!402670 () Unit!30288)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!16 (array!52081 array!52083 (_ BitVec 32) (_ BitVec 32) V!29007 V!29007 (_ BitVec 64)) Unit!30288)

(assert (=> b!891374 (= lt!402670 (lemmaSeekEntryGivesInRangeIndex!16 (_keys!9950 thiss!1181) (_values!5224 thiss!1181) (mask!25757 thiss!1181) (extraKeys!4933 thiss!1181) (zeroValue!5037 thiss!1181) (minValue!5037 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52081 (_ BitVec 32)) SeekEntryResult!8758)

(assert (=> b!891374 (= lt!402669 (seekEntry!0 key!785 (_keys!9950 thiss!1181) (mask!25757 thiss!1181)))))

(declare-fun b!891375 () Bool)

(declare-fun res!603686 () Bool)

(assert (=> b!891375 (=> res!603686 e!497238)))

(assert (=> b!891375 (= res!603686 (or (not (= (size!25488 (_values!5224 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25757 thiss!1181)))) (not (= (size!25487 (_keys!9950 thiss!1181)) (size!25488 (_values!5224 thiss!1181)))) (bvslt (mask!25757 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4933 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4933 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891376 () Bool)

(declare-fun res!603683 () Bool)

(assert (=> b!891376 (=> (not res!603683) (not e!497230))))

(assert (=> b!891376 (= res!603683 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891377 () Bool)

(assert (=> b!891377 (= e!497238 true)))

(declare-fun lt!402668 () Bool)

(declare-datatypes ((List!17676 0))(
  ( (Nil!17673) (Cons!17672 (h!18809 (_ BitVec 64)) (t!24967 List!17676)) )
))
(declare-fun arrayNoDuplicates!0 (array!52081 (_ BitVec 32) List!17676) Bool)

(assert (=> b!891377 (= lt!402668 (arrayNoDuplicates!0 (_keys!9950 thiss!1181) #b00000000000000000000000000000000 Nil!17673))))

(declare-fun mapNonEmpty!28601 () Bool)

(declare-fun tp!55078 () Bool)

(assert (=> mapNonEmpty!28601 (= mapRes!28601 (and tp!55078 e!497234))))

(declare-fun mapRest!28601 () (Array (_ BitVec 32) ValueCell!8534))

(declare-fun mapValue!28601 () ValueCell!8534)

(declare-fun mapKey!28601 () (_ BitVec 32))

(assert (=> mapNonEmpty!28601 (= (arr!25043 (_values!5224 thiss!1181)) (store mapRest!28601 mapKey!28601 mapValue!28601))))

(declare-fun b!891378 () Bool)

(assert (=> b!891378 (= e!497231 e!497238)))

(declare-fun res!603684 () Bool)

(assert (=> b!891378 (=> res!603684 e!497238)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891378 (= res!603684 (not (validMask!0 (mask!25757 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891378 (arrayContainsKey!0 (_keys!9950 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402671 () Unit!30288)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52081 (_ BitVec 64) (_ BitVec 32)) Unit!30288)

(assert (=> b!891378 (= lt!402671 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9950 thiss!1181) key!785 (index!37404 lt!402669)))))

(declare-fun mapIsEmpty!28601 () Bool)

(assert (=> mapIsEmpty!28601 mapRes!28601))

(assert (= (and start!75900 res!603687) b!891376))

(assert (= (and b!891376 res!603683) b!891374))

(assert (= (and b!891374 (not res!603688)) b!891370))

(assert (= (and b!891374 (not res!603685)) b!891378))

(assert (= (and b!891378 (not res!603684)) b!891375))

(assert (= (and b!891375 (not res!603686)) b!891373))

(assert (= (and b!891373 (not res!603682)) b!891377))

(assert (= (and b!891371 condMapEmpty!28601) mapIsEmpty!28601))

(assert (= (and b!891371 (not condMapEmpty!28601)) mapNonEmpty!28601))

(assert (= (and mapNonEmpty!28601 ((_ is ValueCellFull!8534) mapValue!28601)) b!891368))

(assert (= (and b!891371 ((_ is ValueCellFull!8534) mapDefault!28601)) b!891369))

(assert (= b!891372 b!891371))

(assert (= start!75900 b!891372))

(declare-fun m!830299 () Bool)

(assert (=> b!891378 m!830299))

(declare-fun m!830301 () Bool)

(assert (=> b!891378 m!830301))

(declare-fun m!830303 () Bool)

(assert (=> b!891378 m!830303))

(declare-fun m!830305 () Bool)

(assert (=> b!891372 m!830305))

(declare-fun m!830307 () Bool)

(assert (=> b!891372 m!830307))

(declare-fun m!830309 () Bool)

(assert (=> b!891373 m!830309))

(declare-fun m!830311 () Bool)

(assert (=> start!75900 m!830311))

(declare-fun m!830313 () Bool)

(assert (=> mapNonEmpty!28601 m!830313))

(declare-fun m!830315 () Bool)

(assert (=> b!891370 m!830315))

(declare-fun m!830317 () Bool)

(assert (=> b!891377 m!830317))

(declare-fun m!830319 () Bool)

(assert (=> b!891374 m!830319))

(declare-fun m!830321 () Bool)

(assert (=> b!891374 m!830321))

(check-sat (not b_next!15703) (not b!891378) b_and!25953 (not mapNonEmpty!28601) (not start!75900) (not b!891377) (not b!891370) tp_is_empty!18031 (not b!891373) (not b!891372) (not b!891374))
(check-sat b_and!25953 (not b_next!15703))
