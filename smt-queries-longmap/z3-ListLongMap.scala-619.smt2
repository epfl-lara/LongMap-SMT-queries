; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16066 () Bool)

(assert start!16066)

(declare-fun b!159290 () Bool)

(declare-fun b_free!3523 () Bool)

(declare-fun b_next!3523 () Bool)

(assert (=> b!159290 (= b_free!3523 (not b_next!3523))))

(declare-fun tp!13138 () Bool)

(declare-fun b_and!9911 () Bool)

(assert (=> b!159290 (= tp!13138 b_and!9911)))

(declare-fun b!159282 () Bool)

(declare-fun e!104255 () Bool)

(assert (=> b!159282 (= e!104255 false)))

(declare-fun lt!81816 () Bool)

(declare-datatypes ((V!4081 0))(
  ( (V!4082 (val!1707 Int)) )
))
(declare-datatypes ((ValueCell!1319 0))(
  ( (ValueCellFull!1319 (v!3566 V!4081)) (EmptyCell!1319) )
))
(declare-datatypes ((array!5709 0))(
  ( (array!5710 (arr!2698 (Array (_ BitVec 32) (_ BitVec 64))) (size!2983 (_ BitVec 32))) )
))
(declare-datatypes ((array!5711 0))(
  ( (array!5712 (arr!2699 (Array (_ BitVec 32) ValueCell!1319)) (size!2984 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1546 0))(
  ( (LongMapFixedSize!1547 (defaultEntry!3215 Int) (mask!7764 (_ BitVec 32)) (extraKeys!2956 (_ BitVec 32)) (zeroValue!3058 V!4081) (minValue!3058 V!4081) (_size!822 (_ BitVec 32)) (_keys!5015 array!5709) (_values!3198 array!5711) (_vacant!822 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1546)

(declare-datatypes ((List!1903 0))(
  ( (Nil!1900) (Cons!1899 (h!2512 (_ BitVec 64)) (t!6696 List!1903)) )
))
(declare-fun arrayNoDuplicates!0 (array!5709 (_ BitVec 32) List!1903) Bool)

(assert (=> b!159282 (= lt!81816 (arrayNoDuplicates!0 (_keys!5015 thiss!1248) #b00000000000000000000000000000000 Nil!1900))))

(declare-fun b!159283 () Bool)

(declare-fun res!75228 () Bool)

(assert (=> b!159283 (=> (not res!75228) (not e!104255))))

(assert (=> b!159283 (= res!75228 (and (= (size!2984 (_values!3198 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7764 thiss!1248))) (= (size!2983 (_keys!5015 thiss!1248)) (size!2984 (_values!3198 thiss!1248))) (bvsge (mask!7764 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2956 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2956 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159284 () Bool)

(declare-fun e!104254 () Bool)

(declare-fun tp_is_empty!3325 () Bool)

(assert (=> b!159284 (= e!104254 tp_is_empty!3325)))

(declare-fun b!159285 () Bool)

(declare-fun e!104252 () Bool)

(assert (=> b!159285 (= e!104252 tp_is_empty!3325)))

(declare-fun b!159286 () Bool)

(declare-fun res!75233 () Bool)

(assert (=> b!159286 (=> (not res!75233) (not e!104255))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2852 0))(
  ( (tuple2!2853 (_1!1437 (_ BitVec 64)) (_2!1437 V!4081)) )
))
(declare-datatypes ((List!1904 0))(
  ( (Nil!1901) (Cons!1900 (h!2513 tuple2!2852) (t!6697 List!1904)) )
))
(declare-datatypes ((ListLongMap!1839 0))(
  ( (ListLongMap!1840 (toList!935 List!1904)) )
))
(declare-fun contains!974 (ListLongMap!1839 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!585 (array!5709 array!5711 (_ BitVec 32) (_ BitVec 32) V!4081 V!4081 (_ BitVec 32) Int) ListLongMap!1839)

(assert (=> b!159286 (= res!75233 (contains!974 (getCurrentListMap!585 (_keys!5015 thiss!1248) (_values!3198 thiss!1248) (mask!7764 thiss!1248) (extraKeys!2956 thiss!1248) (zeroValue!3058 thiss!1248) (minValue!3058 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3215 thiss!1248)) key!828))))

(declare-fun b!159287 () Bool)

(declare-fun res!75229 () Bool)

(assert (=> b!159287 (=> (not res!75229) (not e!104255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159287 (= res!75229 (validMask!0 (mask!7764 thiss!1248)))))

(declare-fun b!159288 () Bool)

(declare-fun res!75231 () Bool)

(assert (=> b!159288 (=> (not res!75231) (not e!104255))))

(assert (=> b!159288 (= res!75231 (not (= key!828 (bvneg key!828))))))

(declare-fun res!75234 () Bool)

(assert (=> start!16066 (=> (not res!75234) (not e!104255))))

(declare-fun valid!727 (LongMapFixedSize!1546) Bool)

(assert (=> start!16066 (= res!75234 (valid!727 thiss!1248))))

(assert (=> start!16066 e!104255))

(declare-fun e!104253 () Bool)

(assert (=> start!16066 e!104253))

(assert (=> start!16066 true))

(declare-fun mapIsEmpty!5675 () Bool)

(declare-fun mapRes!5675 () Bool)

(assert (=> mapIsEmpty!5675 mapRes!5675))

(declare-fun b!159289 () Bool)

(declare-fun e!104256 () Bool)

(assert (=> b!159289 (= e!104256 (and e!104252 mapRes!5675))))

(declare-fun condMapEmpty!5675 () Bool)

(declare-fun mapDefault!5675 () ValueCell!1319)

(assert (=> b!159289 (= condMapEmpty!5675 (= (arr!2699 (_values!3198 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1319)) mapDefault!5675)))))

(declare-fun array_inv!1731 (array!5709) Bool)

(declare-fun array_inv!1732 (array!5711) Bool)

(assert (=> b!159290 (= e!104253 (and tp!13138 tp_is_empty!3325 (array_inv!1731 (_keys!5015 thiss!1248)) (array_inv!1732 (_values!3198 thiss!1248)) e!104256))))

(declare-fun b!159291 () Bool)

(declare-fun res!75232 () Bool)

(assert (=> b!159291 (=> (not res!75232) (not e!104255))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!317 0))(
  ( (MissingZero!317 (index!3436 (_ BitVec 32))) (Found!317 (index!3437 (_ BitVec 32))) (Intermediate!317 (undefined!1129 Bool) (index!3438 (_ BitVec 32)) (x!17612 (_ BitVec 32))) (Undefined!317) (MissingVacant!317 (index!3439 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5709 (_ BitVec 32)) SeekEntryResult!317)

(assert (=> b!159291 (= res!75232 ((_ is Undefined!317) (seekEntryOrOpen!0 key!828 (_keys!5015 thiss!1248) (mask!7764 thiss!1248))))))

(declare-fun b!159292 () Bool)

(declare-fun res!75230 () Bool)

(assert (=> b!159292 (=> (not res!75230) (not e!104255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5709 (_ BitVec 32)) Bool)

(assert (=> b!159292 (= res!75230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5015 thiss!1248) (mask!7764 thiss!1248)))))

(declare-fun mapNonEmpty!5675 () Bool)

(declare-fun tp!13139 () Bool)

(assert (=> mapNonEmpty!5675 (= mapRes!5675 (and tp!13139 e!104254))))

(declare-fun mapRest!5675 () (Array (_ BitVec 32) ValueCell!1319))

(declare-fun mapValue!5675 () ValueCell!1319)

(declare-fun mapKey!5675 () (_ BitVec 32))

(assert (=> mapNonEmpty!5675 (= (arr!2699 (_values!3198 thiss!1248)) (store mapRest!5675 mapKey!5675 mapValue!5675))))

(assert (= (and start!16066 res!75234) b!159288))

(assert (= (and b!159288 res!75231) b!159291))

(assert (= (and b!159291 res!75232) b!159286))

(assert (= (and b!159286 res!75233) b!159287))

(assert (= (and b!159287 res!75229) b!159283))

(assert (= (and b!159283 res!75228) b!159292))

(assert (= (and b!159292 res!75230) b!159282))

(assert (= (and b!159289 condMapEmpty!5675) mapIsEmpty!5675))

(assert (= (and b!159289 (not condMapEmpty!5675)) mapNonEmpty!5675))

(assert (= (and mapNonEmpty!5675 ((_ is ValueCellFull!1319) mapValue!5675)) b!159284))

(assert (= (and b!159289 ((_ is ValueCellFull!1319) mapDefault!5675)) b!159285))

(assert (= b!159290 b!159289))

(assert (= start!16066 b!159290))

(declare-fun m!191077 () Bool)

(assert (=> b!159287 m!191077))

(declare-fun m!191079 () Bool)

(assert (=> b!159292 m!191079))

(declare-fun m!191081 () Bool)

(assert (=> b!159282 m!191081))

(declare-fun m!191083 () Bool)

(assert (=> b!159291 m!191083))

(declare-fun m!191085 () Bool)

(assert (=> mapNonEmpty!5675 m!191085))

(declare-fun m!191087 () Bool)

(assert (=> start!16066 m!191087))

(declare-fun m!191089 () Bool)

(assert (=> b!159286 m!191089))

(assert (=> b!159286 m!191089))

(declare-fun m!191091 () Bool)

(assert (=> b!159286 m!191091))

(declare-fun m!191093 () Bool)

(assert (=> b!159290 m!191093))

(declare-fun m!191095 () Bool)

(assert (=> b!159290 m!191095))

(check-sat (not b!159291) b_and!9911 (not b!159282) (not b!159290) (not mapNonEmpty!5675) (not b_next!3523) tp_is_empty!3325 (not b!159287) (not b!159292) (not b!159286) (not start!16066))
(check-sat b_and!9911 (not b_next!3523))
