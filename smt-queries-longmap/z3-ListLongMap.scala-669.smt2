; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16522 () Bool)

(assert start!16522)

(declare-fun b!164271 () Bool)

(declare-fun b_free!3823 () Bool)

(declare-fun b_next!3823 () Bool)

(assert (=> b!164271 (= b_free!3823 (not b_next!3823))))

(declare-fun tp!14070 () Bool)

(declare-fun b_and!10251 () Bool)

(assert (=> b!164271 (= tp!14070 b_and!10251)))

(declare-fun b!164263 () Bool)

(declare-fun e!107768 () Bool)

(assert (=> b!164263 (= e!107768 false)))

(declare-fun lt!82908 () Bool)

(declare-datatypes ((V!4481 0))(
  ( (V!4482 (val!1857 Int)) )
))
(declare-datatypes ((ValueCell!1469 0))(
  ( (ValueCellFull!1469 (v!3723 V!4481)) (EmptyCell!1469) )
))
(declare-datatypes ((array!6333 0))(
  ( (array!6334 (arr!3002 (Array (_ BitVec 32) (_ BitVec 64))) (size!3290 (_ BitVec 32))) )
))
(declare-datatypes ((array!6335 0))(
  ( (array!6336 (arr!3003 (Array (_ BitVec 32) ValueCell!1469)) (size!3291 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1846 0))(
  ( (LongMapFixedSize!1847 (defaultEntry!3365 Int) (mask!8052 (_ BitVec 32)) (extraKeys!3106 (_ BitVec 32)) (zeroValue!3208 V!4481) (minValue!3208 V!4481) (_size!972 (_ BitVec 32)) (_keys!5190 array!6333) (_values!3348 array!6335) (_vacant!972 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1846)

(declare-datatypes ((List!1992 0))(
  ( (Nil!1989) (Cons!1988 (h!2605 (_ BitVec 64)) (t!6786 List!1992)) )
))
(declare-fun arrayNoDuplicates!0 (array!6333 (_ BitVec 32) List!1992) Bool)

(assert (=> b!164263 (= lt!82908 (arrayNoDuplicates!0 (_keys!5190 thiss!1248) #b00000000000000000000000000000000 Nil!1989))))

(declare-fun b!164264 () Bool)

(declare-fun res!77737 () Bool)

(assert (=> b!164264 (=> (not res!77737) (not e!107768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6333 (_ BitVec 32)) Bool)

(assert (=> b!164264 (= res!77737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5190 thiss!1248) (mask!8052 thiss!1248)))))

(declare-fun b!164265 () Bool)

(declare-fun e!107771 () Bool)

(assert (=> b!164265 (= e!107771 e!107768)))

(declare-fun res!77735 () Bool)

(assert (=> b!164265 (=> (not res!77735) (not e!107768))))

(declare-datatypes ((SeekEntryResult!406 0))(
  ( (MissingZero!406 (index!3792 (_ BitVec 32))) (Found!406 (index!3793 (_ BitVec 32))) (Intermediate!406 (undefined!1218 Bool) (index!3794 (_ BitVec 32)) (x!18210 (_ BitVec 32))) (Undefined!406) (MissingVacant!406 (index!3795 (_ BitVec 32))) )
))
(declare-fun lt!82907 () SeekEntryResult!406)

(get-info :version)

(assert (=> b!164265 (= res!77735 (and (not ((_ is Undefined!406) lt!82907)) (not ((_ is MissingVacant!406) lt!82907)) (not ((_ is MissingZero!406) lt!82907)) ((_ is Found!406) lt!82907)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6333 (_ BitVec 32)) SeekEntryResult!406)

(assert (=> b!164265 (= lt!82907 (seekEntryOrOpen!0 key!828 (_keys!5190 thiss!1248) (mask!8052 thiss!1248)))))

(declare-fun res!77733 () Bool)

(assert (=> start!16522 (=> (not res!77733) (not e!107771))))

(declare-fun valid!842 (LongMapFixedSize!1846) Bool)

(assert (=> start!16522 (= res!77733 (valid!842 thiss!1248))))

(assert (=> start!16522 e!107771))

(declare-fun e!107770 () Bool)

(assert (=> start!16522 e!107770))

(assert (=> start!16522 true))

(declare-fun b!164266 () Bool)

(declare-fun e!107769 () Bool)

(declare-fun e!107772 () Bool)

(declare-fun mapRes!6156 () Bool)

(assert (=> b!164266 (= e!107769 (and e!107772 mapRes!6156))))

(declare-fun condMapEmpty!6156 () Bool)

(declare-fun mapDefault!6156 () ValueCell!1469)

(assert (=> b!164266 (= condMapEmpty!6156 (= (arr!3003 (_values!3348 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1469)) mapDefault!6156)))))

(declare-fun mapNonEmpty!6156 () Bool)

(declare-fun tp!14069 () Bool)

(declare-fun e!107773 () Bool)

(assert (=> mapNonEmpty!6156 (= mapRes!6156 (and tp!14069 e!107773))))

(declare-fun mapValue!6156 () ValueCell!1469)

(declare-fun mapRest!6156 () (Array (_ BitVec 32) ValueCell!1469))

(declare-fun mapKey!6156 () (_ BitVec 32))

(assert (=> mapNonEmpty!6156 (= (arr!3003 (_values!3348 thiss!1248)) (store mapRest!6156 mapKey!6156 mapValue!6156))))

(declare-fun b!164267 () Bool)

(declare-fun tp_is_empty!3625 () Bool)

(assert (=> b!164267 (= e!107773 tp_is_empty!3625)))

(declare-fun b!164268 () Bool)

(declare-fun res!77734 () Bool)

(assert (=> b!164268 (=> (not res!77734) (not e!107768))))

(assert (=> b!164268 (= res!77734 (and (= (size!3291 (_values!3348 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8052 thiss!1248))) (= (size!3290 (_keys!5190 thiss!1248)) (size!3291 (_values!3348 thiss!1248))) (bvsge (mask!8052 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3106 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3106 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164269 () Bool)

(declare-fun res!77739 () Bool)

(assert (=> b!164269 (=> (not res!77739) (not e!107768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164269 (= res!77739 (validMask!0 (mask!8052 thiss!1248)))))

(declare-fun b!164270 () Bool)

(declare-fun res!77738 () Bool)

(assert (=> b!164270 (=> (not res!77738) (not e!107771))))

(assert (=> b!164270 (= res!77738 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6156 () Bool)

(assert (=> mapIsEmpty!6156 mapRes!6156))

(declare-fun array_inv!1927 (array!6333) Bool)

(declare-fun array_inv!1928 (array!6335) Bool)

(assert (=> b!164271 (= e!107770 (and tp!14070 tp_is_empty!3625 (array_inv!1927 (_keys!5190 thiss!1248)) (array_inv!1928 (_values!3348 thiss!1248)) e!107769))))

(declare-fun b!164272 () Bool)

(assert (=> b!164272 (= e!107772 tp_is_empty!3625)))

(declare-fun b!164273 () Bool)

(declare-fun res!77736 () Bool)

(assert (=> b!164273 (=> (not res!77736) (not e!107768))))

(declare-datatypes ((tuple2!2972 0))(
  ( (tuple2!2973 (_1!1497 (_ BitVec 64)) (_2!1497 V!4481)) )
))
(declare-datatypes ((List!1993 0))(
  ( (Nil!1990) (Cons!1989 (h!2606 tuple2!2972) (t!6787 List!1993)) )
))
(declare-datatypes ((ListLongMap!1933 0))(
  ( (ListLongMap!1934 (toList!982 List!1993)) )
))
(declare-fun contains!1034 (ListLongMap!1933 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!644 (array!6333 array!6335 (_ BitVec 32) (_ BitVec 32) V!4481 V!4481 (_ BitVec 32) Int) ListLongMap!1933)

(assert (=> b!164273 (= res!77736 (contains!1034 (getCurrentListMap!644 (_keys!5190 thiss!1248) (_values!3348 thiss!1248) (mask!8052 thiss!1248) (extraKeys!3106 thiss!1248) (zeroValue!3208 thiss!1248) (minValue!3208 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3365 thiss!1248)) key!828))))

(assert (= (and start!16522 res!77733) b!164270))

(assert (= (and b!164270 res!77738) b!164265))

(assert (= (and b!164265 res!77735) b!164273))

(assert (= (and b!164273 res!77736) b!164269))

(assert (= (and b!164269 res!77739) b!164268))

(assert (= (and b!164268 res!77734) b!164264))

(assert (= (and b!164264 res!77737) b!164263))

(assert (= (and b!164266 condMapEmpty!6156) mapIsEmpty!6156))

(assert (= (and b!164266 (not condMapEmpty!6156)) mapNonEmpty!6156))

(assert (= (and mapNonEmpty!6156 ((_ is ValueCellFull!1469) mapValue!6156)) b!164267))

(assert (= (and b!164266 ((_ is ValueCellFull!1469) mapDefault!6156)) b!164272))

(assert (= b!164271 b!164266))

(assert (= start!16522 b!164271))

(declare-fun m!194693 () Bool)

(assert (=> b!164263 m!194693))

(declare-fun m!194695 () Bool)

(assert (=> b!164269 m!194695))

(declare-fun m!194697 () Bool)

(assert (=> b!164273 m!194697))

(assert (=> b!164273 m!194697))

(declare-fun m!194699 () Bool)

(assert (=> b!164273 m!194699))

(declare-fun m!194701 () Bool)

(assert (=> b!164265 m!194701))

(declare-fun m!194703 () Bool)

(assert (=> b!164271 m!194703))

(declare-fun m!194705 () Bool)

(assert (=> b!164271 m!194705))

(declare-fun m!194707 () Bool)

(assert (=> start!16522 m!194707))

(declare-fun m!194709 () Bool)

(assert (=> mapNonEmpty!6156 m!194709))

(declare-fun m!194711 () Bool)

(assert (=> b!164264 m!194711))

(check-sat b_and!10251 (not b!164271) tp_is_empty!3625 (not b!164263) (not b!164273) (not b!164269) (not mapNonEmpty!6156) (not b!164264) (not b!164265) (not start!16522) (not b_next!3823))
(check-sat b_and!10251 (not b_next!3823))
