; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16556 () Bool)

(assert start!16556)

(declare-fun b!164846 () Bool)

(declare-fun b_free!3861 () Bool)

(declare-fun b_next!3861 () Bool)

(assert (=> b!164846 (= b_free!3861 (not b_next!3861))))

(declare-fun tp!14184 () Bool)

(declare-fun b_and!10275 () Bool)

(assert (=> b!164846 (= tp!14184 b_and!10275)))

(declare-fun b!164843 () Bool)

(declare-fun res!78112 () Bool)

(declare-fun e!108143 () Bool)

(assert (=> b!164843 (=> (not res!78112) (not e!108143))))

(declare-datatypes ((V!4531 0))(
  ( (V!4532 (val!1876 Int)) )
))
(declare-datatypes ((ValueCell!1488 0))(
  ( (ValueCellFull!1488 (v!3741 V!4531)) (EmptyCell!1488) )
))
(declare-datatypes ((array!6423 0))(
  ( (array!6424 (arr!3047 (Array (_ BitVec 32) (_ BitVec 64))) (size!3335 (_ BitVec 32))) )
))
(declare-datatypes ((array!6425 0))(
  ( (array!6426 (arr!3048 (Array (_ BitVec 32) ValueCell!1488)) (size!3336 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1884 0))(
  ( (LongMapFixedSize!1885 (defaultEntry!3384 Int) (mask!8083 (_ BitVec 32)) (extraKeys!3125 (_ BitVec 32)) (zeroValue!3227 V!4531) (minValue!3227 V!4531) (_size!991 (_ BitVec 32)) (_keys!5209 array!6423) (_values!3367 array!6425) (_vacant!991 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1884)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3044 0))(
  ( (tuple2!3045 (_1!1533 (_ BitVec 64)) (_2!1533 V!4531)) )
))
(declare-datatypes ((List!2026 0))(
  ( (Nil!2023) (Cons!2022 (h!2639 tuple2!3044) (t!6828 List!2026)) )
))
(declare-datatypes ((ListLongMap!1999 0))(
  ( (ListLongMap!2000 (toList!1015 List!2026)) )
))
(declare-fun contains!1057 (ListLongMap!1999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!673 (array!6423 array!6425 (_ BitVec 32) (_ BitVec 32) V!4531 V!4531 (_ BitVec 32) Int) ListLongMap!1999)

(assert (=> b!164843 (= res!78112 (contains!1057 (getCurrentListMap!673 (_keys!5209 thiss!1248) (_values!3367 thiss!1248) (mask!8083 thiss!1248) (extraKeys!3125 thiss!1248) (zeroValue!3227 thiss!1248) (minValue!3227 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3384 thiss!1248)) key!828))))

(declare-fun b!164844 () Bool)

(declare-fun e!108149 () Bool)

(assert (=> b!164844 (= e!108149 e!108143)))

(declare-fun res!78116 () Bool)

(assert (=> b!164844 (=> (not res!78116) (not e!108143))))

(declare-datatypes ((SeekEntryResult!424 0))(
  ( (MissingZero!424 (index!3864 (_ BitVec 32))) (Found!424 (index!3865 (_ BitVec 32))) (Intermediate!424 (undefined!1236 Bool) (index!3866 (_ BitVec 32)) (x!18276 (_ BitVec 32))) (Undefined!424) (MissingVacant!424 (index!3867 (_ BitVec 32))) )
))
(declare-fun lt!82962 () SeekEntryResult!424)

(get-info :version)

(assert (=> b!164844 (= res!78116 (and (not ((_ is Undefined!424) lt!82962)) (not ((_ is MissingVacant!424) lt!82962)) (not ((_ is MissingZero!424) lt!82962)) ((_ is Found!424) lt!82962)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6423 (_ BitVec 32)) SeekEntryResult!424)

(assert (=> b!164844 (= lt!82962 (seekEntryOrOpen!0 key!828 (_keys!5209 thiss!1248) (mask!8083 thiss!1248)))))

(declare-fun res!78114 () Bool)

(assert (=> start!16556 (=> (not res!78114) (not e!108149))))

(declare-fun valid!837 (LongMapFixedSize!1884) Bool)

(assert (=> start!16556 (= res!78114 (valid!837 thiss!1248))))

(assert (=> start!16556 e!108149))

(declare-fun e!108144 () Bool)

(assert (=> start!16556 e!108144))

(assert (=> start!16556 true))

(declare-fun mapIsEmpty!6213 () Bool)

(declare-fun mapRes!6213 () Bool)

(assert (=> mapIsEmpty!6213 mapRes!6213))

(declare-fun b!164845 () Bool)

(declare-fun res!78117 () Bool)

(assert (=> b!164845 (=> (not res!78117) (not e!108143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6423 (_ BitVec 32)) Bool)

(assert (=> b!164845 (= res!78117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5209 thiss!1248) (mask!8083 thiss!1248)))))

(declare-fun tp_is_empty!3663 () Bool)

(declare-fun e!108148 () Bool)

(declare-fun array_inv!1955 (array!6423) Bool)

(declare-fun array_inv!1956 (array!6425) Bool)

(assert (=> b!164846 (= e!108144 (and tp!14184 tp_is_empty!3663 (array_inv!1955 (_keys!5209 thiss!1248)) (array_inv!1956 (_values!3367 thiss!1248)) e!108148))))

(declare-fun b!164847 () Bool)

(declare-fun res!78115 () Bool)

(assert (=> b!164847 (=> (not res!78115) (not e!108149))))

(assert (=> b!164847 (= res!78115 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164848 () Bool)

(declare-fun e!108147 () Bool)

(assert (=> b!164848 (= e!108147 tp_is_empty!3663)))

(declare-fun b!164849 () Bool)

(assert (=> b!164849 (= e!108143 false)))

(declare-fun lt!82963 () Bool)

(declare-datatypes ((List!2027 0))(
  ( (Nil!2024) (Cons!2023 (h!2640 (_ BitVec 64)) (t!6829 List!2027)) )
))
(declare-fun arrayNoDuplicates!0 (array!6423 (_ BitVec 32) List!2027) Bool)

(assert (=> b!164849 (= lt!82963 (arrayNoDuplicates!0 (_keys!5209 thiss!1248) #b00000000000000000000000000000000 Nil!2024))))

(declare-fun b!164850 () Bool)

(declare-fun e!108145 () Bool)

(assert (=> b!164850 (= e!108145 tp_is_empty!3663)))

(declare-fun b!164851 () Bool)

(assert (=> b!164851 (= e!108148 (and e!108147 mapRes!6213))))

(declare-fun condMapEmpty!6213 () Bool)

(declare-fun mapDefault!6213 () ValueCell!1488)

(assert (=> b!164851 (= condMapEmpty!6213 (= (arr!3048 (_values!3367 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1488)) mapDefault!6213)))))

(declare-fun b!164852 () Bool)

(declare-fun res!78113 () Bool)

(assert (=> b!164852 (=> (not res!78113) (not e!108143))))

(assert (=> b!164852 (= res!78113 (and (= (size!3336 (_values!3367 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8083 thiss!1248))) (= (size!3335 (_keys!5209 thiss!1248)) (size!3336 (_values!3367 thiss!1248))) (bvsge (mask!8083 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3125 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3125 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6213 () Bool)

(declare-fun tp!14183 () Bool)

(assert (=> mapNonEmpty!6213 (= mapRes!6213 (and tp!14183 e!108145))))

(declare-fun mapRest!6213 () (Array (_ BitVec 32) ValueCell!1488))

(declare-fun mapValue!6213 () ValueCell!1488)

(declare-fun mapKey!6213 () (_ BitVec 32))

(assert (=> mapNonEmpty!6213 (= (arr!3048 (_values!3367 thiss!1248)) (store mapRest!6213 mapKey!6213 mapValue!6213))))

(declare-fun b!164853 () Bool)

(declare-fun res!78111 () Bool)

(assert (=> b!164853 (=> (not res!78111) (not e!108143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164853 (= res!78111 (validMask!0 (mask!8083 thiss!1248)))))

(assert (= (and start!16556 res!78114) b!164847))

(assert (= (and b!164847 res!78115) b!164844))

(assert (= (and b!164844 res!78116) b!164843))

(assert (= (and b!164843 res!78112) b!164853))

(assert (= (and b!164853 res!78111) b!164852))

(assert (= (and b!164852 res!78113) b!164845))

(assert (= (and b!164845 res!78117) b!164849))

(assert (= (and b!164851 condMapEmpty!6213) mapIsEmpty!6213))

(assert (= (and b!164851 (not condMapEmpty!6213)) mapNonEmpty!6213))

(assert (= (and mapNonEmpty!6213 ((_ is ValueCellFull!1488) mapValue!6213)) b!164850))

(assert (= (and b!164851 ((_ is ValueCellFull!1488) mapDefault!6213)) b!164848))

(assert (= b!164846 b!164851))

(assert (= start!16556 b!164846))

(declare-fun m!194891 () Bool)

(assert (=> b!164853 m!194891))

(declare-fun m!194893 () Bool)

(assert (=> b!164844 m!194893))

(declare-fun m!194895 () Bool)

(assert (=> mapNonEmpty!6213 m!194895))

(declare-fun m!194897 () Bool)

(assert (=> b!164843 m!194897))

(assert (=> b!164843 m!194897))

(declare-fun m!194899 () Bool)

(assert (=> b!164843 m!194899))

(declare-fun m!194901 () Bool)

(assert (=> start!16556 m!194901))

(declare-fun m!194903 () Bool)

(assert (=> b!164845 m!194903))

(declare-fun m!194905 () Bool)

(assert (=> b!164846 m!194905))

(declare-fun m!194907 () Bool)

(assert (=> b!164846 m!194907))

(declare-fun m!194909 () Bool)

(assert (=> b!164849 m!194909))

(check-sat (not b!164844) (not start!16556) (not b!164846) tp_is_empty!3663 (not b!164845) (not b!164853) (not mapNonEmpty!6213) b_and!10275 (not b!164849) (not b_next!3861) (not b!164843))
(check-sat b_and!10275 (not b_next!3861))
