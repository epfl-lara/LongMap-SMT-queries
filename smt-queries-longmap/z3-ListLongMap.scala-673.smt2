; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16546 () Bool)

(assert start!16546)

(declare-fun b!164664 () Bool)

(declare-fun b_free!3847 () Bool)

(declare-fun b_next!3847 () Bool)

(assert (=> b!164664 (= b_free!3847 (not b_next!3847))))

(declare-fun tp!14141 () Bool)

(declare-fun b_and!10275 () Bool)

(assert (=> b!164664 (= tp!14141 b_and!10275)))

(declare-fun mapIsEmpty!6192 () Bool)

(declare-fun mapRes!6192 () Bool)

(assert (=> mapIsEmpty!6192 mapRes!6192))

(declare-fun b!164659 () Bool)

(declare-fun res!77989 () Bool)

(declare-fun e!108026 () Bool)

(assert (=> b!164659 (=> (not res!77989) (not e!108026))))

(declare-datatypes ((V!4513 0))(
  ( (V!4514 (val!1869 Int)) )
))
(declare-datatypes ((ValueCell!1481 0))(
  ( (ValueCellFull!1481 (v!3735 V!4513)) (EmptyCell!1481) )
))
(declare-datatypes ((array!6381 0))(
  ( (array!6382 (arr!3026 (Array (_ BitVec 32) (_ BitVec 64))) (size!3314 (_ BitVec 32))) )
))
(declare-datatypes ((array!6383 0))(
  ( (array!6384 (arr!3027 (Array (_ BitVec 32) ValueCell!1481)) (size!3315 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1870 0))(
  ( (LongMapFixedSize!1871 (defaultEntry!3377 Int) (mask!8072 (_ BitVec 32)) (extraKeys!3118 (_ BitVec 32)) (zeroValue!3220 V!4513) (minValue!3220 V!4513) (_size!984 (_ BitVec 32)) (_keys!5202 array!6381) (_values!3360 array!6383) (_vacant!984 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1870)

(assert (=> b!164659 (= res!77989 (and (= (size!3315 (_values!3360 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8072 thiss!1248))) (= (size!3314 (_keys!5202 thiss!1248)) (size!3315 (_values!3360 thiss!1248))) (bvsge (mask!8072 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3118 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3118 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6192 () Bool)

(declare-fun tp!14142 () Bool)

(declare-fun e!108022 () Bool)

(assert (=> mapNonEmpty!6192 (= mapRes!6192 (and tp!14142 e!108022))))

(declare-fun mapValue!6192 () ValueCell!1481)

(declare-fun mapKey!6192 () (_ BitVec 32))

(declare-fun mapRest!6192 () (Array (_ BitVec 32) ValueCell!1481))

(assert (=> mapNonEmpty!6192 (= (arr!3027 (_values!3360 thiss!1248)) (store mapRest!6192 mapKey!6192 mapValue!6192))))

(declare-fun b!164661 () Bool)

(declare-fun e!108024 () Bool)

(assert (=> b!164661 (= e!108024 e!108026)))

(declare-fun res!77990 () Bool)

(assert (=> b!164661 (=> (not res!77990) (not e!108026))))

(declare-datatypes ((SeekEntryResult!414 0))(
  ( (MissingZero!414 (index!3824 (_ BitVec 32))) (Found!414 (index!3825 (_ BitVec 32))) (Intermediate!414 (undefined!1226 Bool) (index!3826 (_ BitVec 32)) (x!18250 (_ BitVec 32))) (Undefined!414) (MissingVacant!414 (index!3827 (_ BitVec 32))) )
))
(declare-fun lt!82980 () SeekEntryResult!414)

(get-info :version)

(assert (=> b!164661 (= res!77990 (and (not ((_ is Undefined!414) lt!82980)) (not ((_ is MissingVacant!414) lt!82980)) (not ((_ is MissingZero!414) lt!82980)) ((_ is Found!414) lt!82980)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6381 (_ BitVec 32)) SeekEntryResult!414)

(assert (=> b!164661 (= lt!82980 (seekEntryOrOpen!0 key!828 (_keys!5202 thiss!1248) (mask!8072 thiss!1248)))))

(declare-fun b!164662 () Bool)

(declare-fun res!77985 () Bool)

(assert (=> b!164662 (=> (not res!77985) (not e!108026))))

(declare-datatypes ((tuple2!2988 0))(
  ( (tuple2!2989 (_1!1505 (_ BitVec 64)) (_2!1505 V!4513)) )
))
(declare-datatypes ((List!2009 0))(
  ( (Nil!2006) (Cons!2005 (h!2622 tuple2!2988) (t!6803 List!2009)) )
))
(declare-datatypes ((ListLongMap!1949 0))(
  ( (ListLongMap!1950 (toList!990 List!2009)) )
))
(declare-fun contains!1042 (ListLongMap!1949 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!652 (array!6381 array!6383 (_ BitVec 32) (_ BitVec 32) V!4513 V!4513 (_ BitVec 32) Int) ListLongMap!1949)

(assert (=> b!164662 (= res!77985 (contains!1042 (getCurrentListMap!652 (_keys!5202 thiss!1248) (_values!3360 thiss!1248) (mask!8072 thiss!1248) (extraKeys!3118 thiss!1248) (zeroValue!3220 thiss!1248) (minValue!3220 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3377 thiss!1248)) key!828))))

(declare-fun b!164663 () Bool)

(declare-fun res!77986 () Bool)

(assert (=> b!164663 (=> (not res!77986) (not e!108026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164663 (= res!77986 (validMask!0 (mask!8072 thiss!1248)))))

(declare-fun e!108020 () Bool)

(declare-fun e!108021 () Bool)

(declare-fun tp_is_empty!3649 () Bool)

(declare-fun array_inv!1941 (array!6381) Bool)

(declare-fun array_inv!1942 (array!6383) Bool)

(assert (=> b!164664 (= e!108020 (and tp!14141 tp_is_empty!3649 (array_inv!1941 (_keys!5202 thiss!1248)) (array_inv!1942 (_values!3360 thiss!1248)) e!108021))))

(declare-fun b!164665 () Bool)

(assert (=> b!164665 (= e!108022 tp_is_empty!3649)))

(declare-fun b!164666 () Bool)

(declare-fun e!108025 () Bool)

(assert (=> b!164666 (= e!108025 tp_is_empty!3649)))

(declare-fun b!164667 () Bool)

(declare-fun res!77987 () Bool)

(assert (=> b!164667 (=> (not res!77987) (not e!108026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6381 (_ BitVec 32)) Bool)

(assert (=> b!164667 (= res!77987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5202 thiss!1248) (mask!8072 thiss!1248)))))

(declare-fun res!77991 () Bool)

(assert (=> start!16546 (=> (not res!77991) (not e!108024))))

(declare-fun valid!850 (LongMapFixedSize!1870) Bool)

(assert (=> start!16546 (= res!77991 (valid!850 thiss!1248))))

(assert (=> start!16546 e!108024))

(assert (=> start!16546 e!108020))

(assert (=> start!16546 true))

(declare-fun b!164660 () Bool)

(assert (=> b!164660 (= e!108021 (and e!108025 mapRes!6192))))

(declare-fun condMapEmpty!6192 () Bool)

(declare-fun mapDefault!6192 () ValueCell!1481)

(assert (=> b!164660 (= condMapEmpty!6192 (= (arr!3027 (_values!3360 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1481)) mapDefault!6192)))))

(declare-fun b!164668 () Bool)

(declare-fun res!77988 () Bool)

(assert (=> b!164668 (=> (not res!77988) (not e!108024))))

(assert (=> b!164668 (= res!77988 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164669 () Bool)

(assert (=> b!164669 (= e!108026 false)))

(declare-fun lt!82979 () Bool)

(declare-datatypes ((List!2010 0))(
  ( (Nil!2007) (Cons!2006 (h!2623 (_ BitVec 64)) (t!6804 List!2010)) )
))
(declare-fun arrayNoDuplicates!0 (array!6381 (_ BitVec 32) List!2010) Bool)

(assert (=> b!164669 (= lt!82979 (arrayNoDuplicates!0 (_keys!5202 thiss!1248) #b00000000000000000000000000000000 Nil!2007))))

(assert (= (and start!16546 res!77991) b!164668))

(assert (= (and b!164668 res!77988) b!164661))

(assert (= (and b!164661 res!77990) b!164662))

(assert (= (and b!164662 res!77985) b!164663))

(assert (= (and b!164663 res!77986) b!164659))

(assert (= (and b!164659 res!77989) b!164667))

(assert (= (and b!164667 res!77987) b!164669))

(assert (= (and b!164660 condMapEmpty!6192) mapIsEmpty!6192))

(assert (= (and b!164660 (not condMapEmpty!6192)) mapNonEmpty!6192))

(assert (= (and mapNonEmpty!6192 ((_ is ValueCellFull!1481) mapValue!6192)) b!164665))

(assert (= (and b!164660 ((_ is ValueCellFull!1481) mapDefault!6192)) b!164666))

(assert (= b!164664 b!164660))

(assert (= start!16546 b!164664))

(declare-fun m!194933 () Bool)

(assert (=> b!164663 m!194933))

(declare-fun m!194935 () Bool)

(assert (=> start!16546 m!194935))

(declare-fun m!194937 () Bool)

(assert (=> b!164664 m!194937))

(declare-fun m!194939 () Bool)

(assert (=> b!164664 m!194939))

(declare-fun m!194941 () Bool)

(assert (=> mapNonEmpty!6192 m!194941))

(declare-fun m!194943 () Bool)

(assert (=> b!164667 m!194943))

(declare-fun m!194945 () Bool)

(assert (=> b!164669 m!194945))

(declare-fun m!194947 () Bool)

(assert (=> b!164662 m!194947))

(assert (=> b!164662 m!194947))

(declare-fun m!194949 () Bool)

(assert (=> b!164662 m!194949))

(declare-fun m!194951 () Bool)

(assert (=> b!164661 m!194951))

(check-sat b_and!10275 (not start!16546) (not b!164667) (not b_next!3847) (not b!164664) (not b!164663) (not mapNonEmpty!6192) (not b!164661) tp_is_empty!3649 (not b!164669) (not b!164662))
(check-sat b_and!10275 (not b_next!3847))
