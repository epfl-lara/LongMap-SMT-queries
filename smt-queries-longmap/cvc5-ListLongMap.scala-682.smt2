; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16596 () Bool)

(assert start!16596)

(declare-fun b!165506 () Bool)

(declare-fun b_free!3901 () Bool)

(declare-fun b_next!3901 () Bool)

(assert (=> b!165506 (= b_free!3901 (not b_next!3901))))

(declare-fun tp!14303 () Bool)

(declare-fun b_and!10315 () Bool)

(assert (=> b!165506 (= tp!14303 b_and!10315)))

(declare-fun b!165503 () Bool)

(declare-fun res!78537 () Bool)

(declare-fun e!108564 () Bool)

(assert (=> b!165503 (=> (not res!78537) (not e!108564))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165503 (= res!78537 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165504 () Bool)

(declare-fun res!78535 () Bool)

(declare-fun e!108566 () Bool)

(assert (=> b!165504 (=> (not res!78535) (not e!108566))))

(declare-datatypes ((V!4585 0))(
  ( (V!4586 (val!1896 Int)) )
))
(declare-datatypes ((ValueCell!1508 0))(
  ( (ValueCellFull!1508 (v!3761 V!4585)) (EmptyCell!1508) )
))
(declare-datatypes ((array!6503 0))(
  ( (array!6504 (arr!3087 (Array (_ BitVec 32) (_ BitVec 64))) (size!3375 (_ BitVec 32))) )
))
(declare-datatypes ((array!6505 0))(
  ( (array!6506 (arr!3088 (Array (_ BitVec 32) ValueCell!1508)) (size!3376 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1924 0))(
  ( (LongMapFixedSize!1925 (defaultEntry!3404 Int) (mask!8117 (_ BitVec 32)) (extraKeys!3145 (_ BitVec 32)) (zeroValue!3247 V!4585) (minValue!3247 V!4585) (_size!1011 (_ BitVec 32)) (_keys!5229 array!6503) (_values!3387 array!6505) (_vacant!1011 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1924)

(declare-datatypes ((tuple2!3072 0))(
  ( (tuple2!3073 (_1!1547 (_ BitVec 64)) (_2!1547 V!4585)) )
))
(declare-datatypes ((List!2056 0))(
  ( (Nil!2053) (Cons!2052 (h!2669 tuple2!3072) (t!6858 List!2056)) )
))
(declare-datatypes ((ListLongMap!2027 0))(
  ( (ListLongMap!2028 (toList!1029 List!2056)) )
))
(declare-fun contains!1071 (ListLongMap!2027 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!687 (array!6503 array!6505 (_ BitVec 32) (_ BitVec 32) V!4585 V!4585 (_ BitVec 32) Int) ListLongMap!2027)

(assert (=> b!165504 (= res!78535 (not (contains!1071 (getCurrentListMap!687 (_keys!5229 thiss!1248) (_values!3387 thiss!1248) (mask!8117 thiss!1248) (extraKeys!3145 thiss!1248) (zeroValue!3247 thiss!1248) (minValue!3247 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3404 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!6273 () Bool)

(declare-fun mapRes!6273 () Bool)

(declare-fun tp!14304 () Bool)

(declare-fun e!108567 () Bool)

(assert (=> mapNonEmpty!6273 (= mapRes!6273 (and tp!14304 e!108567))))

(declare-fun mapRest!6273 () (Array (_ BitVec 32) ValueCell!1508))

(declare-fun mapKey!6273 () (_ BitVec 32))

(declare-fun mapValue!6273 () ValueCell!1508)

(assert (=> mapNonEmpty!6273 (= (arr!3088 (_values!3387 thiss!1248)) (store mapRest!6273 mapKey!6273 mapValue!6273))))

(declare-fun b!165505 () Bool)

(declare-fun res!78532 () Bool)

(assert (=> b!165505 (=> (not res!78532) (not e!108566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6503 (_ BitVec 32)) Bool)

(assert (=> b!165505 (= res!78532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5229 thiss!1248) (mask!8117 thiss!1248)))))

(declare-fun e!108565 () Bool)

(declare-fun e!108569 () Bool)

(declare-fun tp_is_empty!3703 () Bool)

(declare-fun array_inv!1983 (array!6503) Bool)

(declare-fun array_inv!1984 (array!6505) Bool)

(assert (=> b!165506 (= e!108569 (and tp!14303 tp_is_empty!3703 (array_inv!1983 (_keys!5229 thiss!1248)) (array_inv!1984 (_values!3387 thiss!1248)) e!108565))))

(declare-fun b!165507 () Bool)

(assert (=> b!165507 (= e!108567 tp_is_empty!3703)))

(declare-fun mapIsEmpty!6273 () Bool)

(assert (=> mapIsEmpty!6273 mapRes!6273))

(declare-fun b!165508 () Bool)

(declare-fun res!78531 () Bool)

(assert (=> b!165508 (=> (not res!78531) (not e!108566))))

(assert (=> b!165508 (= res!78531 (and (= (size!3376 (_values!3387 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8117 thiss!1248))) (= (size!3375 (_keys!5229 thiss!1248)) (size!3376 (_values!3387 thiss!1248))) (bvsge (mask!8117 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3145 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3145 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165510 () Bool)

(assert (=> b!165510 (= e!108566 false)))

(declare-fun lt!83082 () Bool)

(declare-datatypes ((List!2057 0))(
  ( (Nil!2054) (Cons!2053 (h!2670 (_ BitVec 64)) (t!6859 List!2057)) )
))
(declare-fun arrayNoDuplicates!0 (array!6503 (_ BitVec 32) List!2057) Bool)

(assert (=> b!165510 (= lt!83082 (arrayNoDuplicates!0 (_keys!5229 thiss!1248) #b00000000000000000000000000000000 Nil!2054))))

(declare-fun b!165511 () Bool)

(declare-fun res!78533 () Bool)

(assert (=> b!165511 (=> (not res!78533) (not e!108566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165511 (= res!78533 (validMask!0 (mask!8117 thiss!1248)))))

(declare-fun b!165512 () Bool)

(assert (=> b!165512 (= e!108564 e!108566)))

(declare-fun res!78534 () Bool)

(assert (=> b!165512 (=> (not res!78534) (not e!108566))))

(declare-datatypes ((SeekEntryResult!437 0))(
  ( (MissingZero!437 (index!3916 (_ BitVec 32))) (Found!437 (index!3917 (_ BitVec 32))) (Intermediate!437 (undefined!1249 Bool) (index!3918 (_ BitVec 32)) (x!18345 (_ BitVec 32))) (Undefined!437) (MissingVacant!437 (index!3919 (_ BitVec 32))) )
))
(declare-fun lt!83083 () SeekEntryResult!437)

(assert (=> b!165512 (= res!78534 (and (not (is-Undefined!437 lt!83083)) (not (is-MissingVacant!437 lt!83083)) (not (is-MissingZero!437 lt!83083)) (is-Found!437 lt!83083)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6503 (_ BitVec 32)) SeekEntryResult!437)

(assert (=> b!165512 (= lt!83083 (seekEntryOrOpen!0 key!828 (_keys!5229 thiss!1248) (mask!8117 thiss!1248)))))

(declare-fun b!165513 () Bool)

(declare-fun e!108563 () Bool)

(assert (=> b!165513 (= e!108563 tp_is_empty!3703)))

(declare-fun res!78536 () Bool)

(assert (=> start!16596 (=> (not res!78536) (not e!108564))))

(declare-fun valid!851 (LongMapFixedSize!1924) Bool)

(assert (=> start!16596 (= res!78536 (valid!851 thiss!1248))))

(assert (=> start!16596 e!108564))

(assert (=> start!16596 e!108569))

(assert (=> start!16596 true))

(declare-fun b!165509 () Bool)

(assert (=> b!165509 (= e!108565 (and e!108563 mapRes!6273))))

(declare-fun condMapEmpty!6273 () Bool)

(declare-fun mapDefault!6273 () ValueCell!1508)

