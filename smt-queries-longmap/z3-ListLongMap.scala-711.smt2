; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16772 () Bool)

(assert start!16772)

(declare-fun b!168784 () Bool)

(declare-fun b_free!4077 () Bool)

(declare-fun b_next!4077 () Bool)

(assert (=> b!168784 (= b_free!4077 (not b_next!4077))))

(declare-fun tp!14831 () Bool)

(declare-fun b_and!10491 () Bool)

(assert (=> b!168784 (= tp!14831 b_and!10491)))

(declare-fun b!168776 () Bool)

(declare-fun e!111020 () Bool)

(assert (=> b!168776 (= e!111020 true)))

(declare-fun lt!84491 () Bool)

(declare-datatypes ((V!4819 0))(
  ( (V!4820 (val!1984 Int)) )
))
(declare-datatypes ((ValueCell!1596 0))(
  ( (ValueCellFull!1596 (v!3849 V!4819)) (EmptyCell!1596) )
))
(declare-datatypes ((array!6855 0))(
  ( (array!6856 (arr!3263 (Array (_ BitVec 32) (_ BitVec 64))) (size!3551 (_ BitVec 32))) )
))
(declare-datatypes ((array!6857 0))(
  ( (array!6858 (arr!3264 (Array (_ BitVec 32) ValueCell!1596)) (size!3552 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2100 0))(
  ( (LongMapFixedSize!2101 (defaultEntry!3492 Int) (mask!8263 (_ BitVec 32)) (extraKeys!3233 (_ BitVec 32)) (zeroValue!3335 V!4819) (minValue!3335 V!4819) (_size!1099 (_ BitVec 32)) (_keys!5317 array!6855) (_values!3475 array!6857) (_vacant!1099 (_ BitVec 32))) )
))
(declare-fun lt!84496 () LongMapFixedSize!2100)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3180 0))(
  ( (tuple2!3181 (_1!1601 (_ BitVec 64)) (_2!1601 V!4819)) )
))
(declare-datatypes ((List!2171 0))(
  ( (Nil!2168) (Cons!2167 (h!2784 tuple2!3180) (t!6973 List!2171)) )
))
(declare-datatypes ((ListLongMap!2135 0))(
  ( (ListLongMap!2136 (toList!1083 List!2171)) )
))
(declare-fun contains!1125 (ListLongMap!2135 (_ BitVec 64)) Bool)

(declare-fun map!1801 (LongMapFixedSize!2100) ListLongMap!2135)

(assert (=> b!168776 (= lt!84491 (contains!1125 (map!1801 lt!84496) key!828))))

(declare-fun b!168777 () Bool)

(declare-fun e!111019 () Bool)

(assert (=> b!168777 (= e!111019 (not e!111020))))

(declare-fun res!80346 () Bool)

(assert (=> b!168777 (=> res!80346 e!111020)))

(declare-fun valid!909 (LongMapFixedSize!2100) Bool)

(assert (=> b!168777 (= res!80346 (not (valid!909 lt!84496)))))

(declare-fun lt!84492 () ListLongMap!2135)

(declare-fun thiss!1248 () LongMapFixedSize!2100)

(declare-datatypes ((SeekEntryResult!509 0))(
  ( (MissingZero!509 (index!4204 (_ BitVec 32))) (Found!509 (index!4205 (_ BitVec 32))) (Intermediate!509 (undefined!1321 Bool) (index!4206 (_ BitVec 32)) (x!18649 (_ BitVec 32))) (Undefined!509) (MissingVacant!509 (index!4207 (_ BitVec 32))) )
))
(declare-fun lt!84493 () SeekEntryResult!509)

(assert (=> b!168777 (contains!1125 lt!84492 (select (arr!3263 (_keys!5317 thiss!1248)) (index!4205 lt!84493)))))

(declare-fun lt!84497 () array!6857)

(declare-datatypes ((Unit!5207 0))(
  ( (Unit!5208) )
))
(declare-fun lt!84494 () Unit!5207)

(declare-fun lemmaValidKeyInArrayIsInListMap!136 (array!6855 array!6857 (_ BitVec 32) (_ BitVec 32) V!4819 V!4819 (_ BitVec 32) Int) Unit!5207)

(assert (=> b!168777 (= lt!84494 (lemmaValidKeyInArrayIsInListMap!136 (_keys!5317 thiss!1248) lt!84497 (mask!8263 thiss!1248) (extraKeys!3233 thiss!1248) (zeroValue!3335 thiss!1248) (minValue!3335 thiss!1248) (index!4205 lt!84493) (defaultEntry!3492 thiss!1248)))))

(assert (=> b!168777 (= lt!84496 (LongMapFixedSize!2101 (defaultEntry!3492 thiss!1248) (mask!8263 thiss!1248) (extraKeys!3233 thiss!1248) (zeroValue!3335 thiss!1248) (minValue!3335 thiss!1248) (_size!1099 thiss!1248) (_keys!5317 thiss!1248) lt!84497 (_vacant!1099 thiss!1248)))))

(declare-fun lt!84488 () ListLongMap!2135)

(assert (=> b!168777 (= lt!84488 lt!84492)))

(declare-fun getCurrentListMap!741 (array!6855 array!6857 (_ BitVec 32) (_ BitVec 32) V!4819 V!4819 (_ BitVec 32) Int) ListLongMap!2135)

(assert (=> b!168777 (= lt!84492 (getCurrentListMap!741 (_keys!5317 thiss!1248) lt!84497 (mask!8263 thiss!1248) (extraKeys!3233 thiss!1248) (zeroValue!3335 thiss!1248) (minValue!3335 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3492 thiss!1248)))))

(declare-fun lt!84495 () ListLongMap!2135)

(declare-fun v!309 () V!4819)

(declare-fun +!235 (ListLongMap!2135 tuple2!3180) ListLongMap!2135)

(assert (=> b!168777 (= lt!84488 (+!235 lt!84495 (tuple2!3181 key!828 v!309)))))

(assert (=> b!168777 (= lt!84497 (array!6858 (store (arr!3264 (_values!3475 thiss!1248)) (index!4205 lt!84493) (ValueCellFull!1596 v!309)) (size!3552 (_values!3475 thiss!1248))))))

(declare-fun lt!84499 () Unit!5207)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!90 (array!6855 array!6857 (_ BitVec 32) (_ BitVec 32) V!4819 V!4819 (_ BitVec 32) (_ BitVec 64) V!4819 Int) Unit!5207)

(assert (=> b!168777 (= lt!84499 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!90 (_keys!5317 thiss!1248) (_values!3475 thiss!1248) (mask!8263 thiss!1248) (extraKeys!3233 thiss!1248) (zeroValue!3335 thiss!1248) (minValue!3335 thiss!1248) (index!4205 lt!84493) key!828 v!309 (defaultEntry!3492 thiss!1248)))))

(declare-fun lt!84490 () Unit!5207)

(declare-fun e!111012 () Unit!5207)

(assert (=> b!168777 (= lt!84490 e!111012)))

(declare-fun c!30397 () Bool)

(assert (=> b!168777 (= c!30397 (contains!1125 lt!84495 key!828))))

(assert (=> b!168777 (= lt!84495 (getCurrentListMap!741 (_keys!5317 thiss!1248) (_values!3475 thiss!1248) (mask!8263 thiss!1248) (extraKeys!3233 thiss!1248) (zeroValue!3335 thiss!1248) (minValue!3335 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3492 thiss!1248)))))

(declare-fun b!168778 () Bool)

(declare-fun Unit!5209 () Unit!5207)

(assert (=> b!168778 (= e!111012 Unit!5209)))

(declare-fun lt!84489 () Unit!5207)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!130 (array!6855 array!6857 (_ BitVec 32) (_ BitVec 32) V!4819 V!4819 (_ BitVec 64) Int) Unit!5207)

(assert (=> b!168778 (= lt!84489 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!130 (_keys!5317 thiss!1248) (_values!3475 thiss!1248) (mask!8263 thiss!1248) (extraKeys!3233 thiss!1248) (zeroValue!3335 thiss!1248) (minValue!3335 thiss!1248) key!828 (defaultEntry!3492 thiss!1248)))))

(assert (=> b!168778 false))

(declare-fun mapIsEmpty!6537 () Bool)

(declare-fun mapRes!6537 () Bool)

(assert (=> mapIsEmpty!6537 mapRes!6537))

(declare-fun b!168779 () Bool)

(declare-fun lt!84498 () Unit!5207)

(assert (=> b!168779 (= e!111012 lt!84498)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!129 (array!6855 array!6857 (_ BitVec 32) (_ BitVec 32) V!4819 V!4819 (_ BitVec 64) Int) Unit!5207)

(assert (=> b!168779 (= lt!84498 (lemmaInListMapThenSeekEntryOrOpenFindsIt!129 (_keys!5317 thiss!1248) (_values!3475 thiss!1248) (mask!8263 thiss!1248) (extraKeys!3233 thiss!1248) (zeroValue!3335 thiss!1248) (minValue!3335 thiss!1248) key!828 (defaultEntry!3492 thiss!1248)))))

(declare-fun res!80345 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168779 (= res!80345 (inRange!0 (index!4205 lt!84493) (mask!8263 thiss!1248)))))

(declare-fun e!111013 () Bool)

(assert (=> b!168779 (=> (not res!80345) (not e!111013))))

(assert (=> b!168779 e!111013))

(declare-fun b!168780 () Bool)

(declare-fun e!111016 () Bool)

(declare-fun tp_is_empty!3879 () Bool)

(assert (=> b!168780 (= e!111016 tp_is_empty!3879)))

(declare-fun b!168781 () Bool)

(assert (=> b!168781 (= e!111013 (= (select (arr!3263 (_keys!5317 thiss!1248)) (index!4205 lt!84493)) key!828))))

(declare-fun res!80344 () Bool)

(declare-fun e!111018 () Bool)

(assert (=> start!16772 (=> (not res!80344) (not e!111018))))

(assert (=> start!16772 (= res!80344 (valid!909 thiss!1248))))

(assert (=> start!16772 e!111018))

(declare-fun e!111015 () Bool)

(assert (=> start!16772 e!111015))

(assert (=> start!16772 true))

(assert (=> start!16772 tp_is_empty!3879))

(declare-fun b!168782 () Bool)

(declare-fun res!80342 () Bool)

(assert (=> b!168782 (=> (not res!80342) (not e!111018))))

(assert (=> b!168782 (= res!80342 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168783 () Bool)

(declare-fun e!111014 () Bool)

(assert (=> b!168783 (= e!111014 tp_is_empty!3879)))

(declare-fun e!111011 () Bool)

(declare-fun array_inv!2101 (array!6855) Bool)

(declare-fun array_inv!2102 (array!6857) Bool)

(assert (=> b!168784 (= e!111015 (and tp!14831 tp_is_empty!3879 (array_inv!2101 (_keys!5317 thiss!1248)) (array_inv!2102 (_values!3475 thiss!1248)) e!111011))))

(declare-fun b!168785 () Bool)

(assert (=> b!168785 (= e!111018 e!111019)))

(declare-fun res!80343 () Bool)

(assert (=> b!168785 (=> (not res!80343) (not e!111019))))

(get-info :version)

(assert (=> b!168785 (= res!80343 (and (not ((_ is Undefined!509) lt!84493)) (not ((_ is MissingVacant!509) lt!84493)) (not ((_ is MissingZero!509) lt!84493)) ((_ is Found!509) lt!84493)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6855 (_ BitVec 32)) SeekEntryResult!509)

(assert (=> b!168785 (= lt!84493 (seekEntryOrOpen!0 key!828 (_keys!5317 thiss!1248) (mask!8263 thiss!1248)))))

(declare-fun mapNonEmpty!6537 () Bool)

(declare-fun tp!14832 () Bool)

(assert (=> mapNonEmpty!6537 (= mapRes!6537 (and tp!14832 e!111014))))

(declare-fun mapKey!6537 () (_ BitVec 32))

(declare-fun mapValue!6537 () ValueCell!1596)

(declare-fun mapRest!6537 () (Array (_ BitVec 32) ValueCell!1596))

(assert (=> mapNonEmpty!6537 (= (arr!3264 (_values!3475 thiss!1248)) (store mapRest!6537 mapKey!6537 mapValue!6537))))

(declare-fun b!168786 () Bool)

(assert (=> b!168786 (= e!111011 (and e!111016 mapRes!6537))))

(declare-fun condMapEmpty!6537 () Bool)

(declare-fun mapDefault!6537 () ValueCell!1596)

(assert (=> b!168786 (= condMapEmpty!6537 (= (arr!3264 (_values!3475 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1596)) mapDefault!6537)))))

(assert (= (and start!16772 res!80344) b!168782))

(assert (= (and b!168782 res!80342) b!168785))

(assert (= (and b!168785 res!80343) b!168777))

(assert (= (and b!168777 c!30397) b!168779))

(assert (= (and b!168777 (not c!30397)) b!168778))

(assert (= (and b!168779 res!80345) b!168781))

(assert (= (and b!168777 (not res!80346)) b!168776))

(assert (= (and b!168786 condMapEmpty!6537) mapIsEmpty!6537))

(assert (= (and b!168786 (not condMapEmpty!6537)) mapNonEmpty!6537))

(assert (= (and mapNonEmpty!6537 ((_ is ValueCellFull!1596) mapValue!6537)) b!168783))

(assert (= (and b!168786 ((_ is ValueCellFull!1596) mapDefault!6537)) b!168780))

(assert (= b!168784 b!168786))

(assert (= start!16772 b!168784))

(declare-fun m!197863 () Bool)

(assert (=> start!16772 m!197863))

(declare-fun m!197865 () Bool)

(assert (=> b!168785 m!197865))

(declare-fun m!197867 () Bool)

(assert (=> b!168777 m!197867))

(declare-fun m!197869 () Bool)

(assert (=> b!168777 m!197869))

(declare-fun m!197871 () Bool)

(assert (=> b!168777 m!197871))

(declare-fun m!197873 () Bool)

(assert (=> b!168777 m!197873))

(declare-fun m!197875 () Bool)

(assert (=> b!168777 m!197875))

(declare-fun m!197877 () Bool)

(assert (=> b!168777 m!197877))

(declare-fun m!197879 () Bool)

(assert (=> b!168777 m!197879))

(assert (=> b!168777 m!197867))

(declare-fun m!197881 () Bool)

(assert (=> b!168777 m!197881))

(declare-fun m!197883 () Bool)

(assert (=> b!168777 m!197883))

(declare-fun m!197885 () Bool)

(assert (=> b!168777 m!197885))

(declare-fun m!197887 () Bool)

(assert (=> b!168778 m!197887))

(declare-fun m!197889 () Bool)

(assert (=> b!168779 m!197889))

(declare-fun m!197891 () Bool)

(assert (=> b!168779 m!197891))

(declare-fun m!197893 () Bool)

(assert (=> mapNonEmpty!6537 m!197893))

(declare-fun m!197895 () Bool)

(assert (=> b!168776 m!197895))

(assert (=> b!168776 m!197895))

(declare-fun m!197897 () Bool)

(assert (=> b!168776 m!197897))

(assert (=> b!168781 m!197867))

(declare-fun m!197899 () Bool)

(assert (=> b!168784 m!197899))

(declare-fun m!197901 () Bool)

(assert (=> b!168784 m!197901))

(check-sat (not b!168776) (not b!168779) tp_is_empty!3879 (not mapNonEmpty!6537) (not b!168785) (not b!168784) (not b!168777) (not start!16772) (not b_next!4077) b_and!10491 (not b!168778))
(check-sat b_and!10491 (not b_next!4077))
