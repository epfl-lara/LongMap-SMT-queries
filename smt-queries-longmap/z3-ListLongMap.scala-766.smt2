; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18066 () Bool)

(assert start!18066)

(declare-fun b!179879 () Bool)

(declare-fun b_free!4437 () Bool)

(declare-fun b_next!4437 () Bool)

(assert (=> b!179879 (= b_free!4437 (not b_next!4437))))

(declare-fun tp!16042 () Bool)

(declare-fun b_and!10971 () Bool)

(assert (=> b!179879 (= tp!16042 b_and!10971)))

(declare-fun mapIsEmpty!7207 () Bool)

(declare-fun mapRes!7207 () Bool)

(assert (=> mapIsEmpty!7207 mapRes!7207))

(declare-fun mapNonEmpty!7207 () Bool)

(declare-fun tp!16041 () Bool)

(declare-fun e!118466 () Bool)

(assert (=> mapNonEmpty!7207 (= mapRes!7207 (and tp!16041 e!118466))))

(declare-datatypes ((V!5259 0))(
  ( (V!5260 (val!2149 Int)) )
))
(declare-datatypes ((ValueCell!1761 0))(
  ( (ValueCellFull!1761 (v!4038 V!5259)) (EmptyCell!1761) )
))
(declare-fun mapValue!7207 () ValueCell!1761)

(declare-fun mapRest!7207 () (Array (_ BitVec 32) ValueCell!1761))

(declare-fun mapKey!7207 () (_ BitVec 32))

(declare-datatypes ((array!7587 0))(
  ( (array!7588 (arr!3593 (Array (_ BitVec 32) (_ BitVec 64))) (size!3901 (_ BitVec 32))) )
))
(declare-datatypes ((array!7589 0))(
  ( (array!7590 (arr!3594 (Array (_ BitVec 32) ValueCell!1761)) (size!3902 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2430 0))(
  ( (LongMapFixedSize!2431 (defaultEntry!3691 Int) (mask!8682 (_ BitVec 32)) (extraKeys!3428 (_ BitVec 32)) (zeroValue!3532 V!5259) (minValue!3532 V!5259) (_size!1264 (_ BitVec 32)) (_keys!5582 array!7587) (_values!3674 array!7589) (_vacant!1264 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2430)

(assert (=> mapNonEmpty!7207 (= (arr!3594 (_values!3674 thiss!1248)) (store mapRest!7207 mapKey!7207 mapValue!7207))))

(declare-fun b!179876 () Bool)

(declare-fun e!118463 () Bool)

(assert (=> b!179876 (= e!118463 false)))

(declare-fun lt!88841 () Bool)

(declare-datatypes ((List!2282 0))(
  ( (Nil!2279) (Cons!2278 (h!2903 (_ BitVec 64)) (t!7130 List!2282)) )
))
(declare-fun arrayNoDuplicates!0 (array!7587 (_ BitVec 32) List!2282) Bool)

(assert (=> b!179876 (= lt!88841 (arrayNoDuplicates!0 (_keys!5582 thiss!1248) #b00000000000000000000000000000000 Nil!2279))))

(declare-fun b!179877 () Bool)

(declare-fun res!85214 () Bool)

(assert (=> b!179877 (=> (not res!85214) (not e!118463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7587 (_ BitVec 32)) Bool)

(assert (=> b!179877 (= res!85214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5582 thiss!1248) (mask!8682 thiss!1248)))))

(declare-fun b!179878 () Bool)

(declare-fun res!85210 () Bool)

(assert (=> b!179878 (=> (not res!85210) (not e!118463))))

(assert (=> b!179878 (= res!85210 (and (= (size!3902 (_values!3674 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8682 thiss!1248))) (= (size!3901 (_keys!5582 thiss!1248)) (size!3902 (_values!3674 thiss!1248))) (bvsge (mask!8682 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3428 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3428 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!4209 () Bool)

(declare-fun e!118467 () Bool)

(declare-fun e!118468 () Bool)

(declare-fun array_inv!2313 (array!7587) Bool)

(declare-fun array_inv!2314 (array!7589) Bool)

(assert (=> b!179879 (= e!118467 (and tp!16042 tp_is_empty!4209 (array_inv!2313 (_keys!5582 thiss!1248)) (array_inv!2314 (_values!3674 thiss!1248)) e!118468))))

(declare-fun b!179880 () Bool)

(declare-fun res!85216 () Bool)

(assert (=> b!179880 (=> (not res!85216) (not e!118463))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3338 0))(
  ( (tuple2!3339 (_1!1680 (_ BitVec 64)) (_2!1680 V!5259)) )
))
(declare-datatypes ((List!2283 0))(
  ( (Nil!2280) (Cons!2279 (h!2904 tuple2!3338) (t!7131 List!2283)) )
))
(declare-datatypes ((ListLongMap!2265 0))(
  ( (ListLongMap!2266 (toList!1148 List!2283)) )
))
(declare-fun contains!1224 (ListLongMap!2265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!800 (array!7587 array!7589 (_ BitVec 32) (_ BitVec 32) V!5259 V!5259 (_ BitVec 32) Int) ListLongMap!2265)

(assert (=> b!179880 (= res!85216 (not (contains!1224 (getCurrentListMap!800 (_keys!5582 thiss!1248) (_values!3674 thiss!1248) (mask!8682 thiss!1248) (extraKeys!3428 thiss!1248) (zeroValue!3532 thiss!1248) (minValue!3532 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3691 thiss!1248)) key!828)))))

(declare-fun b!179881 () Bool)

(assert (=> b!179881 (= e!118466 tp_is_empty!4209)))

(declare-fun b!179882 () Bool)

(declare-fun res!85215 () Bool)

(assert (=> b!179882 (=> (not res!85215) (not e!118463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179882 (= res!85215 (validMask!0 (mask!8682 thiss!1248)))))

(declare-fun res!85213 () Bool)

(assert (=> start!18066 (=> (not res!85213) (not e!118463))))

(declare-fun valid!1013 (LongMapFixedSize!2430) Bool)

(assert (=> start!18066 (= res!85213 (valid!1013 thiss!1248))))

(assert (=> start!18066 e!118463))

(assert (=> start!18066 e!118467))

(assert (=> start!18066 true))

(declare-fun b!179883 () Bool)

(declare-fun e!118464 () Bool)

(assert (=> b!179883 (= e!118464 tp_is_empty!4209)))

(declare-fun b!179884 () Bool)

(declare-fun res!85211 () Bool)

(assert (=> b!179884 (=> (not res!85211) (not e!118463))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!585 0))(
  ( (MissingZero!585 (index!4508 (_ BitVec 32))) (Found!585 (index!4509 (_ BitVec 32))) (Intermediate!585 (undefined!1397 Bool) (index!4510 (_ BitVec 32)) (x!19659 (_ BitVec 32))) (Undefined!585) (MissingVacant!585 (index!4511 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7587 (_ BitVec 32)) SeekEntryResult!585)

(assert (=> b!179884 (= res!85211 ((_ is Undefined!585) (seekEntryOrOpen!0 key!828 (_keys!5582 thiss!1248) (mask!8682 thiss!1248))))))

(declare-fun b!179885 () Bool)

(assert (=> b!179885 (= e!118468 (and e!118464 mapRes!7207))))

(declare-fun condMapEmpty!7207 () Bool)

(declare-fun mapDefault!7207 () ValueCell!1761)

(assert (=> b!179885 (= condMapEmpty!7207 (= (arr!3594 (_values!3674 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1761)) mapDefault!7207)))))

(declare-fun b!179886 () Bool)

(declare-fun res!85212 () Bool)

(assert (=> b!179886 (=> (not res!85212) (not e!118463))))

(assert (=> b!179886 (= res!85212 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!18066 res!85213) b!179886))

(assert (= (and b!179886 res!85212) b!179884))

(assert (= (and b!179884 res!85211) b!179880))

(assert (= (and b!179880 res!85216) b!179882))

(assert (= (and b!179882 res!85215) b!179878))

(assert (= (and b!179878 res!85210) b!179877))

(assert (= (and b!179877 res!85214) b!179876))

(assert (= (and b!179885 condMapEmpty!7207) mapIsEmpty!7207))

(assert (= (and b!179885 (not condMapEmpty!7207)) mapNonEmpty!7207))

(assert (= (and mapNonEmpty!7207 ((_ is ValueCellFull!1761) mapValue!7207)) b!179881))

(assert (= (and b!179885 ((_ is ValueCellFull!1761) mapDefault!7207)) b!179883))

(assert (= b!179879 b!179885))

(assert (= start!18066 b!179879))

(declare-fun m!207985 () Bool)

(assert (=> mapNonEmpty!7207 m!207985))

(declare-fun m!207987 () Bool)

(assert (=> start!18066 m!207987))

(declare-fun m!207989 () Bool)

(assert (=> b!179876 m!207989))

(declare-fun m!207991 () Bool)

(assert (=> b!179882 m!207991))

(declare-fun m!207993 () Bool)

(assert (=> b!179877 m!207993))

(declare-fun m!207995 () Bool)

(assert (=> b!179880 m!207995))

(assert (=> b!179880 m!207995))

(declare-fun m!207997 () Bool)

(assert (=> b!179880 m!207997))

(declare-fun m!207999 () Bool)

(assert (=> b!179884 m!207999))

(declare-fun m!208001 () Bool)

(assert (=> b!179879 m!208001))

(declare-fun m!208003 () Bool)

(assert (=> b!179879 m!208003))

(check-sat (not start!18066) (not b!179880) tp_is_empty!4209 (not b!179879) (not b!179876) (not b_next!4437) (not mapNonEmpty!7207) (not b!179882) b_and!10971 (not b!179884) (not b!179877))
(check-sat b_and!10971 (not b_next!4437))
