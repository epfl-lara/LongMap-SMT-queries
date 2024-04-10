; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16520 () Bool)

(assert start!16520)

(declare-fun b!164252 () Bool)

(declare-fun b_free!3825 () Bool)

(declare-fun b_next!3825 () Bool)

(assert (=> b!164252 (= b_free!3825 (not b_next!3825))))

(declare-fun tp!14075 () Bool)

(declare-fun b_and!10239 () Bool)

(assert (=> b!164252 (= tp!14075 b_and!10239)))

(declare-fun b!164249 () Bool)

(declare-fun e!107770 () Bool)

(declare-fun e!107765 () Bool)

(declare-fun mapRes!6159 () Bool)

(assert (=> b!164249 (= e!107770 (and e!107765 mapRes!6159))))

(declare-fun condMapEmpty!6159 () Bool)

(declare-datatypes ((V!4483 0))(
  ( (V!4484 (val!1858 Int)) )
))
(declare-datatypes ((ValueCell!1470 0))(
  ( (ValueCellFull!1470 (v!3723 V!4483)) (EmptyCell!1470) )
))
(declare-datatypes ((array!6351 0))(
  ( (array!6352 (arr!3011 (Array (_ BitVec 32) (_ BitVec 64))) (size!3299 (_ BitVec 32))) )
))
(declare-datatypes ((array!6353 0))(
  ( (array!6354 (arr!3012 (Array (_ BitVec 32) ValueCell!1470)) (size!3300 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1848 0))(
  ( (LongMapFixedSize!1849 (defaultEntry!3366 Int) (mask!8053 (_ BitVec 32)) (extraKeys!3107 (_ BitVec 32)) (zeroValue!3209 V!4483) (minValue!3209 V!4483) (_size!973 (_ BitVec 32)) (_keys!5191 array!6351) (_values!3349 array!6353) (_vacant!973 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1848)

(declare-fun mapDefault!6159 () ValueCell!1470)

(assert (=> b!164249 (= condMapEmpty!6159 (= (arr!3012 (_values!3349 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1470)) mapDefault!6159)))))

(declare-fun b!164250 () Bool)

(declare-fun e!107768 () Bool)

(declare-fun e!107766 () Bool)

(assert (=> b!164250 (= e!107768 e!107766)))

(declare-fun res!77733 () Bool)

(assert (=> b!164250 (=> (not res!77733) (not e!107766))))

(declare-datatypes ((SeekEntryResult!411 0))(
  ( (MissingZero!411 (index!3812 (_ BitVec 32))) (Found!411 (index!3813 (_ BitVec 32))) (Intermediate!411 (undefined!1223 Bool) (index!3814 (_ BitVec 32)) (x!18215 (_ BitVec 32))) (Undefined!411) (MissingVacant!411 (index!3815 (_ BitVec 32))) )
))
(declare-fun lt!82855 () SeekEntryResult!411)

(get-info :version)

(assert (=> b!164250 (= res!77733 (and (not ((_ is Undefined!411) lt!82855)) (not ((_ is MissingVacant!411) lt!82855)) (not ((_ is MissingZero!411) lt!82855)) ((_ is Found!411) lt!82855)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6351 (_ BitVec 32)) SeekEntryResult!411)

(assert (=> b!164250 (= lt!82855 (seekEntryOrOpen!0 key!828 (_keys!5191 thiss!1248) (mask!8053 thiss!1248)))))

(declare-fun b!164251 () Bool)

(declare-fun res!77737 () Bool)

(assert (=> b!164251 (=> (not res!77737) (not e!107766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6351 (_ BitVec 32)) Bool)

(assert (=> b!164251 (= res!77737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5191 thiss!1248) (mask!8053 thiss!1248)))))

(declare-fun e!107771 () Bool)

(declare-fun tp_is_empty!3627 () Bool)

(declare-fun array_inv!1927 (array!6351) Bool)

(declare-fun array_inv!1928 (array!6353) Bool)

(assert (=> b!164252 (= e!107771 (and tp!14075 tp_is_empty!3627 (array_inv!1927 (_keys!5191 thiss!1248)) (array_inv!1928 (_values!3349 thiss!1248)) e!107770))))

(declare-fun b!164253 () Bool)

(declare-fun res!77739 () Bool)

(assert (=> b!164253 (=> (not res!77739) (not e!107766))))

(assert (=> b!164253 (= res!77739 (and (= (size!3300 (_values!3349 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8053 thiss!1248))) (= (size!3299 (_keys!5191 thiss!1248)) (size!3300 (_values!3349 thiss!1248))) (bvsge (mask!8053 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3107 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3107 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164254 () Bool)

(assert (=> b!164254 (= e!107765 tp_is_empty!3627)))

(declare-fun b!164255 () Bool)

(declare-fun res!77735 () Bool)

(assert (=> b!164255 (=> (not res!77735) (not e!107766))))

(declare-datatypes ((tuple2!3016 0))(
  ( (tuple2!3017 (_1!1519 (_ BitVec 64)) (_2!1519 V!4483)) )
))
(declare-datatypes ((List!1998 0))(
  ( (Nil!1995) (Cons!1994 (h!2611 tuple2!3016) (t!6800 List!1998)) )
))
(declare-datatypes ((ListLongMap!1971 0))(
  ( (ListLongMap!1972 (toList!1001 List!1998)) )
))
(declare-fun contains!1043 (ListLongMap!1971 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!659 (array!6351 array!6353 (_ BitVec 32) (_ BitVec 32) V!4483 V!4483 (_ BitVec 32) Int) ListLongMap!1971)

(assert (=> b!164255 (= res!77735 (contains!1043 (getCurrentListMap!659 (_keys!5191 thiss!1248) (_values!3349 thiss!1248) (mask!8053 thiss!1248) (extraKeys!3107 thiss!1248) (zeroValue!3209 thiss!1248) (minValue!3209 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3366 thiss!1248)) key!828))))

(declare-fun res!77734 () Bool)

(assert (=> start!16520 (=> (not res!77734) (not e!107768))))

(declare-fun valid!823 (LongMapFixedSize!1848) Bool)

(assert (=> start!16520 (= res!77734 (valid!823 thiss!1248))))

(assert (=> start!16520 e!107768))

(assert (=> start!16520 e!107771))

(assert (=> start!16520 true))

(declare-fun b!164256 () Bool)

(declare-fun e!107769 () Bool)

(assert (=> b!164256 (= e!107769 tp_is_empty!3627)))

(declare-fun mapNonEmpty!6159 () Bool)

(declare-fun tp!14076 () Bool)

(assert (=> mapNonEmpty!6159 (= mapRes!6159 (and tp!14076 e!107769))))

(declare-fun mapValue!6159 () ValueCell!1470)

(declare-fun mapKey!6159 () (_ BitVec 32))

(declare-fun mapRest!6159 () (Array (_ BitVec 32) ValueCell!1470))

(assert (=> mapNonEmpty!6159 (= (arr!3012 (_values!3349 thiss!1248)) (store mapRest!6159 mapKey!6159 mapValue!6159))))

(declare-fun mapIsEmpty!6159 () Bool)

(assert (=> mapIsEmpty!6159 mapRes!6159))

(declare-fun b!164257 () Bool)

(declare-fun res!77736 () Bool)

(assert (=> b!164257 (=> (not res!77736) (not e!107768))))

(assert (=> b!164257 (= res!77736 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164258 () Bool)

(assert (=> b!164258 (= e!107766 false)))

(declare-fun lt!82854 () Bool)

(declare-datatypes ((List!1999 0))(
  ( (Nil!1996) (Cons!1995 (h!2612 (_ BitVec 64)) (t!6801 List!1999)) )
))
(declare-fun arrayNoDuplicates!0 (array!6351 (_ BitVec 32) List!1999) Bool)

(assert (=> b!164258 (= lt!82854 (arrayNoDuplicates!0 (_keys!5191 thiss!1248) #b00000000000000000000000000000000 Nil!1996))))

(declare-fun b!164259 () Bool)

(declare-fun res!77738 () Bool)

(assert (=> b!164259 (=> (not res!77738) (not e!107766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164259 (= res!77738 (validMask!0 (mask!8053 thiss!1248)))))

(assert (= (and start!16520 res!77734) b!164257))

(assert (= (and b!164257 res!77736) b!164250))

(assert (= (and b!164250 res!77733) b!164255))

(assert (= (and b!164255 res!77735) b!164259))

(assert (= (and b!164259 res!77738) b!164253))

(assert (= (and b!164253 res!77739) b!164251))

(assert (= (and b!164251 res!77737) b!164258))

(assert (= (and b!164249 condMapEmpty!6159) mapIsEmpty!6159))

(assert (= (and b!164249 (not condMapEmpty!6159)) mapNonEmpty!6159))

(assert (= (and mapNonEmpty!6159 ((_ is ValueCellFull!1470) mapValue!6159)) b!164256))

(assert (= (and b!164249 ((_ is ValueCellFull!1470) mapDefault!6159)) b!164254))

(assert (= b!164252 b!164249))

(assert (= start!16520 b!164252))

(declare-fun m!194531 () Bool)

(assert (=> b!164252 m!194531))

(declare-fun m!194533 () Bool)

(assert (=> b!164252 m!194533))

(declare-fun m!194535 () Bool)

(assert (=> b!164250 m!194535))

(declare-fun m!194537 () Bool)

(assert (=> b!164251 m!194537))

(declare-fun m!194539 () Bool)

(assert (=> mapNonEmpty!6159 m!194539))

(declare-fun m!194541 () Bool)

(assert (=> start!16520 m!194541))

(declare-fun m!194543 () Bool)

(assert (=> b!164255 m!194543))

(assert (=> b!164255 m!194543))

(declare-fun m!194545 () Bool)

(assert (=> b!164255 m!194545))

(declare-fun m!194547 () Bool)

(assert (=> b!164258 m!194547))

(declare-fun m!194549 () Bool)

(assert (=> b!164259 m!194549))

(check-sat (not start!16520) (not b!164251) (not b!164252) (not b_next!3825) (not mapNonEmpty!6159) (not b!164250) (not b!164255) b_and!10239 (not b!164258) (not b!164259) tp_is_empty!3627)
(check-sat b_and!10239 (not b_next!3825))
