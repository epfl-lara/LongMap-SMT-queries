; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16276 () Bool)

(assert start!16276)

(declare-fun b!162385 () Bool)

(declare-fun b_free!3733 () Bool)

(declare-fun b_next!3733 () Bool)

(assert (=> b!162385 (= b_free!3733 (not b_next!3733))))

(declare-fun tp!13769 () Bool)

(declare-fun b_and!10161 () Bool)

(assert (=> b!162385 (= tp!13769 b_and!10161)))

(declare-fun mapNonEmpty!5990 () Bool)

(declare-fun mapRes!5990 () Bool)

(declare-fun tp!13768 () Bool)

(declare-fun e!106376 () Bool)

(assert (=> mapNonEmpty!5990 (= mapRes!5990 (and tp!13768 e!106376))))

(declare-datatypes ((V!4361 0))(
  ( (V!4362 (val!1812 Int)) )
))
(declare-datatypes ((ValueCell!1424 0))(
  ( (ValueCellFull!1424 (v!3678 V!4361)) (EmptyCell!1424) )
))
(declare-fun mapRest!5990 () (Array (_ BitVec 32) ValueCell!1424))

(declare-datatypes ((array!6135 0))(
  ( (array!6136 (arr!2912 (Array (_ BitVec 32) (_ BitVec 64))) (size!3196 (_ BitVec 32))) )
))
(declare-datatypes ((array!6137 0))(
  ( (array!6138 (arr!2913 (Array (_ BitVec 32) ValueCell!1424)) (size!3197 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1756 0))(
  ( (LongMapFixedSize!1757 (defaultEntry!3320 Int) (mask!7940 (_ BitVec 32)) (extraKeys!3061 (_ BitVec 32)) (zeroValue!3163 V!4361) (minValue!3163 V!4361) (_size!927 (_ BitVec 32)) (_keys!5121 array!6135) (_values!3303 array!6137) (_vacant!927 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1756)

(declare-fun mapValue!5990 () ValueCell!1424)

(declare-fun mapKey!5990 () (_ BitVec 32))

(assert (=> mapNonEmpty!5990 (= (arr!2913 (_values!3303 thiss!1248)) (store mapRest!5990 mapKey!5990 mapValue!5990))))

(declare-fun b!162382 () Bool)

(declare-fun e!106379 () Bool)

(declare-fun tp_is_empty!3535 () Bool)

(assert (=> b!162382 (= e!106379 tp_is_empty!3535)))

(declare-fun b!162383 () Bool)

(declare-fun e!106378 () Bool)

(declare-datatypes ((SeekEntryResult!377 0))(
  ( (MissingZero!377 (index!3676 (_ BitVec 32))) (Found!377 (index!3677 (_ BitVec 32))) (Intermediate!377 (undefined!1189 Bool) (index!3678 (_ BitVec 32)) (x!17953 (_ BitVec 32))) (Undefined!377) (MissingVacant!377 (index!3679 (_ BitVec 32))) )
))
(declare-fun lt!82479 () SeekEntryResult!377)

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(assert (=> b!162383 (= e!106378 (and (not ((_ is Undefined!377) lt!82479)) (not ((_ is MissingVacant!377) lt!82479)) ((_ is MissingZero!377) lt!82479) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!82479 (MissingZero!377 (index!3676 lt!82479)))) (not (= lt!82479 (MissingVacant!377 (index!3676 lt!82479))))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6135 (_ BitVec 32)) SeekEntryResult!377)

(assert (=> b!162383 (= lt!82479 (seekEntryOrOpen!0 key!828 (_keys!5121 thiss!1248) (mask!7940 thiss!1248)))))

(declare-fun mapIsEmpty!5990 () Bool)

(assert (=> mapIsEmpty!5990 mapRes!5990))

(declare-fun res!76901 () Bool)

(assert (=> start!16276 (=> (not res!76901) (not e!106378))))

(declare-fun valid!816 (LongMapFixedSize!1756) Bool)

(assert (=> start!16276 (= res!76901 (valid!816 thiss!1248))))

(assert (=> start!16276 e!106378))

(declare-fun e!106377 () Bool)

(assert (=> start!16276 e!106377))

(assert (=> start!16276 true))

(declare-fun b!162384 () Bool)

(assert (=> b!162384 (= e!106376 tp_is_empty!3535)))

(declare-fun e!106380 () Bool)

(declare-fun array_inv!1867 (array!6135) Bool)

(declare-fun array_inv!1868 (array!6137) Bool)

(assert (=> b!162385 (= e!106377 (and tp!13769 tp_is_empty!3535 (array_inv!1867 (_keys!5121 thiss!1248)) (array_inv!1868 (_values!3303 thiss!1248)) e!106380))))

(declare-fun b!162386 () Bool)

(assert (=> b!162386 (= e!106380 (and e!106379 mapRes!5990))))

(declare-fun condMapEmpty!5990 () Bool)

(declare-fun mapDefault!5990 () ValueCell!1424)

(assert (=> b!162386 (= condMapEmpty!5990 (= (arr!2913 (_values!3303 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1424)) mapDefault!5990)))))

(declare-fun b!162387 () Bool)

(declare-fun res!76900 () Bool)

(assert (=> b!162387 (=> (not res!76900) (not e!106378))))

(assert (=> b!162387 (= res!76900 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16276 res!76901) b!162387))

(assert (= (and b!162387 res!76900) b!162383))

(assert (= (and b!162386 condMapEmpty!5990) mapIsEmpty!5990))

(assert (= (and b!162386 (not condMapEmpty!5990)) mapNonEmpty!5990))

(assert (= (and mapNonEmpty!5990 ((_ is ValueCellFull!1424) mapValue!5990)) b!162384))

(assert (= (and b!162386 ((_ is ValueCellFull!1424) mapDefault!5990)) b!162382))

(assert (= b!162385 b!162386))

(assert (= start!16276 b!162385))

(declare-fun m!193673 () Bool)

(assert (=> mapNonEmpty!5990 m!193673))

(declare-fun m!193675 () Bool)

(assert (=> b!162383 m!193675))

(declare-fun m!193677 () Bool)

(assert (=> start!16276 m!193677))

(declare-fun m!193679 () Bool)

(assert (=> b!162385 m!193679))

(declare-fun m!193681 () Bool)

(assert (=> b!162385 m!193681))

(check-sat (not b!162385) (not b_next!3733) (not start!16276) b_and!10161 (not mapNonEmpty!5990) tp_is_empty!3535 (not b!162383))
(check-sat b_and!10161 (not b_next!3733))
