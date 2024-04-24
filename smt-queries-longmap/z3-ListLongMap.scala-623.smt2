; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16090 () Bool)

(assert start!16090)

(declare-fun b!159882 () Bool)

(declare-fun b_free!3547 () Bool)

(declare-fun b_next!3547 () Bool)

(assert (=> b!159882 (= b_free!3547 (not b_next!3547))))

(declare-fun tp!13210 () Bool)

(declare-fun b_and!9975 () Bool)

(assert (=> b!159882 (= tp!13210 b_and!9975)))

(declare-fun b!159872 () Bool)

(declare-fun e!104595 () Bool)

(declare-fun tp_is_empty!3349 () Bool)

(assert (=> b!159872 (= e!104595 tp_is_empty!3349)))

(declare-fun mapNonEmpty!5711 () Bool)

(declare-fun mapRes!5711 () Bool)

(declare-fun tp!13211 () Bool)

(declare-fun e!104594 () Bool)

(assert (=> mapNonEmpty!5711 (= mapRes!5711 (and tp!13211 e!104594))))

(declare-datatypes ((V!4113 0))(
  ( (V!4114 (val!1719 Int)) )
))
(declare-datatypes ((ValueCell!1331 0))(
  ( (ValueCellFull!1331 (v!3585 V!4113)) (EmptyCell!1331) )
))
(declare-fun mapRest!5711 () (Array (_ BitVec 32) ValueCell!1331))

(declare-datatypes ((array!5763 0))(
  ( (array!5764 (arr!2726 (Array (_ BitVec 32) (_ BitVec 64))) (size!3010 (_ BitVec 32))) )
))
(declare-datatypes ((array!5765 0))(
  ( (array!5766 (arr!2727 (Array (_ BitVec 32) ValueCell!1331)) (size!3011 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1570 0))(
  ( (LongMapFixedSize!1571 (defaultEntry!3227 Int) (mask!7785 (_ BitVec 32)) (extraKeys!2968 (_ BitVec 32)) (zeroValue!3070 V!4113) (minValue!3070 V!4113) (_size!834 (_ BitVec 32)) (_keys!5028 array!5763) (_values!3210 array!5765) (_vacant!834 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1570)

(declare-fun mapKey!5711 () (_ BitVec 32))

(declare-fun mapValue!5711 () ValueCell!1331)

(assert (=> mapNonEmpty!5711 (= (arr!2727 (_values!3210 thiss!1248)) (store mapRest!5711 mapKey!5711 mapValue!5711))))

(declare-fun b!159873 () Bool)

(declare-fun res!75601 () Bool)

(declare-fun e!104598 () Bool)

(assert (=> b!159873 (=> (not res!75601) (not e!104598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159873 (= res!75601 (validMask!0 (mask!7785 thiss!1248)))))

(declare-fun b!159874 () Bool)

(assert (=> b!159874 (= e!104594 tp_is_empty!3349)))

(declare-fun b!159875 () Bool)

(assert (=> b!159875 (= e!104598 false)))

(declare-fun lt!82092 () Bool)

(declare-datatypes ((List!1905 0))(
  ( (Nil!1902) (Cons!1901 (h!2514 (_ BitVec 64)) (t!6699 List!1905)) )
))
(declare-fun arrayNoDuplicates!0 (array!5763 (_ BitVec 32) List!1905) Bool)

(assert (=> b!159875 (= lt!82092 (arrayNoDuplicates!0 (_keys!5028 thiss!1248) #b00000000000000000000000000000000 Nil!1902))))

(declare-fun b!159876 () Bool)

(declare-fun res!75596 () Bool)

(assert (=> b!159876 (=> (not res!75596) (not e!104598))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!159876 (= res!75596 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159877 () Bool)

(declare-fun e!104597 () Bool)

(assert (=> b!159877 (= e!104597 (and e!104595 mapRes!5711))))

(declare-fun condMapEmpty!5711 () Bool)

(declare-fun mapDefault!5711 () ValueCell!1331)

(assert (=> b!159877 (= condMapEmpty!5711 (= (arr!2727 (_values!3210 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1331)) mapDefault!5711)))))

(declare-fun b!159878 () Bool)

(declare-fun res!75597 () Bool)

(assert (=> b!159878 (=> (not res!75597) (not e!104598))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!313 0))(
  ( (MissingZero!313 (index!3420 (_ BitVec 32))) (Found!313 (index!3421 (_ BitVec 32))) (Intermediate!313 (undefined!1125 Bool) (index!3422 (_ BitVec 32)) (x!17641 (_ BitVec 32))) (Undefined!313) (MissingVacant!313 (index!3423 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5763 (_ BitVec 32)) SeekEntryResult!313)

(assert (=> b!159878 (= res!75597 ((_ is Undefined!313) (seekEntryOrOpen!0 key!828 (_keys!5028 thiss!1248) (mask!7785 thiss!1248))))))

(declare-fun b!159879 () Bool)

(declare-fun res!75599 () Bool)

(assert (=> b!159879 (=> (not res!75599) (not e!104598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5763 (_ BitVec 32)) Bool)

(assert (=> b!159879 (= res!75599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5028 thiss!1248) (mask!7785 thiss!1248)))))

(declare-fun b!159880 () Bool)

(declare-fun res!75602 () Bool)

(assert (=> b!159880 (=> (not res!75602) (not e!104598))))

(declare-datatypes ((tuple2!2838 0))(
  ( (tuple2!2839 (_1!1430 (_ BitVec 64)) (_2!1430 V!4113)) )
))
(declare-datatypes ((List!1906 0))(
  ( (Nil!1903) (Cons!1902 (h!2515 tuple2!2838) (t!6700 List!1906)) )
))
(declare-datatypes ((ListLongMap!1837 0))(
  ( (ListLongMap!1838 (toList!934 List!1906)) )
))
(declare-fun contains!980 (ListLongMap!1837 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!601 (array!5763 array!5765 (_ BitVec 32) (_ BitVec 32) V!4113 V!4113 (_ BitVec 32) Int) ListLongMap!1837)

(assert (=> b!159880 (= res!75602 (contains!980 (getCurrentListMap!601 (_keys!5028 thiss!1248) (_values!3210 thiss!1248) (mask!7785 thiss!1248) (extraKeys!2968 thiss!1248) (zeroValue!3070 thiss!1248) (minValue!3070 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3227 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!5711 () Bool)

(assert (=> mapIsEmpty!5711 mapRes!5711))

(declare-fun res!75600 () Bool)

(assert (=> start!16090 (=> (not res!75600) (not e!104598))))

(declare-fun valid!750 (LongMapFixedSize!1570) Bool)

(assert (=> start!16090 (= res!75600 (valid!750 thiss!1248))))

(assert (=> start!16090 e!104598))

(declare-fun e!104593 () Bool)

(assert (=> start!16090 e!104593))

(assert (=> start!16090 true))

(declare-fun b!159881 () Bool)

(declare-fun res!75598 () Bool)

(assert (=> b!159881 (=> (not res!75598) (not e!104598))))

(assert (=> b!159881 (= res!75598 (and (= (size!3011 (_values!3210 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7785 thiss!1248))) (= (size!3010 (_keys!5028 thiss!1248)) (size!3011 (_values!3210 thiss!1248))) (bvsge (mask!7785 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2968 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2968 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun array_inv!1741 (array!5763) Bool)

(declare-fun array_inv!1742 (array!5765) Bool)

(assert (=> b!159882 (= e!104593 (and tp!13210 tp_is_empty!3349 (array_inv!1741 (_keys!5028 thiss!1248)) (array_inv!1742 (_values!3210 thiss!1248)) e!104597))))

(assert (= (and start!16090 res!75600) b!159876))

(assert (= (and b!159876 res!75596) b!159878))

(assert (= (and b!159878 res!75597) b!159880))

(assert (= (and b!159880 res!75602) b!159873))

(assert (= (and b!159873 res!75601) b!159881))

(assert (= (and b!159881 res!75598) b!159879))

(assert (= (and b!159879 res!75599) b!159875))

(assert (= (and b!159877 condMapEmpty!5711) mapIsEmpty!5711))

(assert (= (and b!159877 (not condMapEmpty!5711)) mapNonEmpty!5711))

(assert (= (and mapNonEmpty!5711 ((_ is ValueCellFull!1331) mapValue!5711)) b!159874))

(assert (= (and b!159877 ((_ is ValueCellFull!1331) mapDefault!5711)) b!159872))

(assert (= b!159882 b!159877))

(assert (= start!16090 b!159882))

(declare-fun m!192119 () Bool)

(assert (=> b!159880 m!192119))

(assert (=> b!159880 m!192119))

(declare-fun m!192121 () Bool)

(assert (=> b!159880 m!192121))

(declare-fun m!192123 () Bool)

(assert (=> start!16090 m!192123))

(declare-fun m!192125 () Bool)

(assert (=> b!159878 m!192125))

(declare-fun m!192127 () Bool)

(assert (=> mapNonEmpty!5711 m!192127))

(declare-fun m!192129 () Bool)

(assert (=> b!159875 m!192129))

(declare-fun m!192131 () Bool)

(assert (=> b!159873 m!192131))

(declare-fun m!192133 () Bool)

(assert (=> b!159882 m!192133))

(declare-fun m!192135 () Bool)

(assert (=> b!159882 m!192135))

(declare-fun m!192137 () Bool)

(assert (=> b!159879 m!192137))

(check-sat (not b!159873) (not b!159879) b_and!9975 (not b!159878) (not mapNonEmpty!5711) (not b!159875) (not b_next!3547) (not start!16090) (not b!159882) (not b!159880) tp_is_empty!3349)
(check-sat b_and!9975 (not b_next!3547))
