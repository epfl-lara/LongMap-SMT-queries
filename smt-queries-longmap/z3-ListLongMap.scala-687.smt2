; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16630 () Bool)

(assert start!16630)

(declare-fun b!165860 () Bool)

(declare-fun b_free!3931 () Bool)

(declare-fun b_next!3931 () Bool)

(assert (=> b!165860 (= b_free!3931 (not b_next!3931))))

(declare-fun tp!14393 () Bool)

(declare-fun b_and!10319 () Bool)

(assert (=> b!165860 (= tp!14393 b_and!10319)))

(declare-fun res!78757 () Bool)

(declare-fun e!108778 () Bool)

(assert (=> start!16630 (=> (not res!78757) (not e!108778))))

(declare-datatypes ((V!4625 0))(
  ( (V!4626 (val!1911 Int)) )
))
(declare-datatypes ((ValueCell!1523 0))(
  ( (ValueCellFull!1523 (v!3770 V!4625)) (EmptyCell!1523) )
))
(declare-datatypes ((array!6543 0))(
  ( (array!6544 (arr!3106 (Array (_ BitVec 32) (_ BitVec 64))) (size!3395 (_ BitVec 32))) )
))
(declare-datatypes ((array!6545 0))(
  ( (array!6546 (arr!3107 (Array (_ BitVec 32) ValueCell!1523)) (size!3396 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1954 0))(
  ( (LongMapFixedSize!1955 (defaultEntry!3419 Int) (mask!8141 (_ BitVec 32)) (extraKeys!3160 (_ BitVec 32)) (zeroValue!3262 V!4625) (minValue!3262 V!4625) (_size!1026 (_ BitVec 32)) (_keys!5243 array!6543) (_values!3402 array!6545) (_vacant!1026 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1954)

(declare-fun valid!866 (LongMapFixedSize!1954) Bool)

(assert (=> start!16630 (= res!78757 (valid!866 thiss!1248))))

(assert (=> start!16630 e!108778))

(declare-fun e!108779 () Bool)

(assert (=> start!16630 e!108779))

(assert (=> start!16630 true))

(declare-fun b!165851 () Bool)

(declare-fun res!78756 () Bool)

(declare-fun e!108781 () Bool)

(assert (=> b!165851 (=> (not res!78756) (not e!108781))))

(assert (=> b!165851 (= res!78756 (and (= (size!3396 (_values!3402 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8141 thiss!1248))) (= (size!3395 (_keys!5243 thiss!1248)) (size!3396 (_values!3402 thiss!1248))) (bvsge (mask!8141 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3160 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3160 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165852 () Bool)

(assert (=> b!165852 (= e!108781 false)))

(declare-fun lt!82992 () Bool)

(declare-datatypes ((List!2077 0))(
  ( (Nil!2074) (Cons!2073 (h!2690 (_ BitVec 64)) (t!6870 List!2077)) )
))
(declare-fun arrayNoDuplicates!0 (array!6543 (_ BitVec 32) List!2077) Bool)

(assert (=> b!165852 (= lt!82992 (arrayNoDuplicates!0 (_keys!5243 thiss!1248) #b00000000000000000000000000000000 Nil!2074))))

(declare-fun b!165853 () Bool)

(declare-fun e!108783 () Bool)

(declare-fun e!108782 () Bool)

(declare-fun mapRes!6318 () Bool)

(assert (=> b!165853 (= e!108783 (and e!108782 mapRes!6318))))

(declare-fun condMapEmpty!6318 () Bool)

(declare-fun mapDefault!6318 () ValueCell!1523)

(assert (=> b!165853 (= condMapEmpty!6318 (= (arr!3107 (_values!3402 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1523)) mapDefault!6318)))))

(declare-fun b!165854 () Bool)

(declare-fun res!78751 () Bool)

(assert (=> b!165854 (=> (not res!78751) (not e!108781))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3074 0))(
  ( (tuple2!3075 (_1!1548 (_ BitVec 64)) (_2!1548 V!4625)) )
))
(declare-datatypes ((List!2078 0))(
  ( (Nil!2075) (Cons!2074 (h!2691 tuple2!3074) (t!6871 List!2078)) )
))
(declare-datatypes ((ListLongMap!2017 0))(
  ( (ListLongMap!2018 (toList!1024 List!2078)) )
))
(declare-fun contains!1069 (ListLongMap!2017 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!666 (array!6543 array!6545 (_ BitVec 32) (_ BitVec 32) V!4625 V!4625 (_ BitVec 32) Int) ListLongMap!2017)

(assert (=> b!165854 (= res!78751 (not (contains!1069 (getCurrentListMap!666 (_keys!5243 thiss!1248) (_values!3402 thiss!1248) (mask!8141 thiss!1248) (extraKeys!3160 thiss!1248) (zeroValue!3262 thiss!1248) (minValue!3262 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3419 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!6318 () Bool)

(declare-fun tp!14394 () Bool)

(declare-fun e!108780 () Bool)

(assert (=> mapNonEmpty!6318 (= mapRes!6318 (and tp!14394 e!108780))))

(declare-fun mapValue!6318 () ValueCell!1523)

(declare-fun mapKey!6318 () (_ BitVec 32))

(declare-fun mapRest!6318 () (Array (_ BitVec 32) ValueCell!1523))

(assert (=> mapNonEmpty!6318 (= (arr!3107 (_values!3402 thiss!1248)) (store mapRest!6318 mapKey!6318 mapValue!6318))))

(declare-fun b!165855 () Bool)

(declare-fun res!78753 () Bool)

(assert (=> b!165855 (=> (not res!78753) (not e!108781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6543 (_ BitVec 32)) Bool)

(assert (=> b!165855 (= res!78753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5243 thiss!1248) (mask!8141 thiss!1248)))))

(declare-fun b!165856 () Bool)

(assert (=> b!165856 (= e!108778 e!108781)))

(declare-fun res!78752 () Bool)

(assert (=> b!165856 (=> (not res!78752) (not e!108781))))

(declare-datatypes ((SeekEntryResult!458 0))(
  ( (MissingZero!458 (index!4000 (_ BitVec 32))) (Found!458 (index!4001 (_ BitVec 32))) (Intermediate!458 (undefined!1270 Bool) (index!4002 (_ BitVec 32)) (x!18405 (_ BitVec 32))) (Undefined!458) (MissingVacant!458 (index!4003 (_ BitVec 32))) )
))
(declare-fun lt!82991 () SeekEntryResult!458)

(get-info :version)

(assert (=> b!165856 (= res!78752 (and (not ((_ is Undefined!458) lt!82991)) (not ((_ is MissingVacant!458) lt!82991)) (not ((_ is MissingZero!458) lt!82991)) ((_ is Found!458) lt!82991)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6543 (_ BitVec 32)) SeekEntryResult!458)

(assert (=> b!165856 (= lt!82991 (seekEntryOrOpen!0 key!828 (_keys!5243 thiss!1248) (mask!8141 thiss!1248)))))

(declare-fun b!165857 () Bool)

(declare-fun res!78754 () Bool)

(assert (=> b!165857 (=> (not res!78754) (not e!108781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165857 (= res!78754 (validMask!0 (mask!8141 thiss!1248)))))

(declare-fun b!165858 () Bool)

(declare-fun tp_is_empty!3733 () Bool)

(assert (=> b!165858 (= e!108780 tp_is_empty!3733)))

(declare-fun mapIsEmpty!6318 () Bool)

(assert (=> mapIsEmpty!6318 mapRes!6318))

(declare-fun b!165859 () Bool)

(declare-fun res!78755 () Bool)

(assert (=> b!165859 (=> (not res!78755) (not e!108778))))

(assert (=> b!165859 (= res!78755 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!1999 (array!6543) Bool)

(declare-fun array_inv!2000 (array!6545) Bool)

(assert (=> b!165860 (= e!108779 (and tp!14393 tp_is_empty!3733 (array_inv!1999 (_keys!5243 thiss!1248)) (array_inv!2000 (_values!3402 thiss!1248)) e!108783))))

(declare-fun b!165861 () Bool)

(assert (=> b!165861 (= e!108782 tp_is_empty!3733)))

(assert (= (and start!16630 res!78757) b!165859))

(assert (= (and b!165859 res!78755) b!165856))

(assert (= (and b!165856 res!78752) b!165854))

(assert (= (and b!165854 res!78751) b!165857))

(assert (= (and b!165857 res!78754) b!165851))

(assert (= (and b!165851 res!78756) b!165855))

(assert (= (and b!165855 res!78753) b!165852))

(assert (= (and b!165853 condMapEmpty!6318) mapIsEmpty!6318))

(assert (= (and b!165853 (not condMapEmpty!6318)) mapNonEmpty!6318))

(assert (= (and mapNonEmpty!6318 ((_ is ValueCellFull!1523) mapValue!6318)) b!165858))

(assert (= (and b!165853 ((_ is ValueCellFull!1523) mapDefault!6318)) b!165861))

(assert (= b!165860 b!165853))

(assert (= start!16630 b!165860))

(declare-fun m!194971 () Bool)

(assert (=> b!165856 m!194971))

(declare-fun m!194973 () Bool)

(assert (=> b!165852 m!194973))

(declare-fun m!194975 () Bool)

(assert (=> mapNonEmpty!6318 m!194975))

(declare-fun m!194977 () Bool)

(assert (=> b!165857 m!194977))

(declare-fun m!194979 () Bool)

(assert (=> b!165860 m!194979))

(declare-fun m!194981 () Bool)

(assert (=> b!165860 m!194981))

(declare-fun m!194983 () Bool)

(assert (=> start!16630 m!194983))

(declare-fun m!194985 () Bool)

(assert (=> b!165854 m!194985))

(assert (=> b!165854 m!194985))

(declare-fun m!194987 () Bool)

(assert (=> b!165854 m!194987))

(declare-fun m!194989 () Bool)

(assert (=> b!165855 m!194989))

(check-sat (not b!165852) (not b!165855) (not b!165854) (not b_next!3931) b_and!10319 tp_is_empty!3733 (not mapNonEmpty!6318) (not b!165860) (not start!16630) (not b!165856) (not b!165857))
(check-sat b_and!10319 (not b_next!3931))
