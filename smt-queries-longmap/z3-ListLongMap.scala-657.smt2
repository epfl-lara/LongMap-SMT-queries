; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16294 () Bool)

(assert start!16294)

(declare-fun b!162592 () Bool)

(declare-fun b_free!3751 () Bool)

(declare-fun b_next!3751 () Bool)

(assert (=> b!162592 (= b_free!3751 (not b_next!3751))))

(declare-fun tp!13822 () Bool)

(declare-fun b_and!10179 () Bool)

(assert (=> b!162592 (= tp!13822 b_and!10179)))

(declare-fun mapIsEmpty!6017 () Bool)

(declare-fun mapRes!6017 () Bool)

(assert (=> mapIsEmpty!6017 mapRes!6017))

(declare-fun b!162586 () Bool)

(declare-fun res!76996 () Bool)

(declare-fun e!106569 () Bool)

(assert (=> b!162586 (=> (not res!76996) (not e!106569))))

(declare-datatypes ((V!4385 0))(
  ( (V!4386 (val!1821 Int)) )
))
(declare-datatypes ((ValueCell!1433 0))(
  ( (ValueCellFull!1433 (v!3687 V!4385)) (EmptyCell!1433) )
))
(declare-datatypes ((array!6171 0))(
  ( (array!6172 (arr!2930 (Array (_ BitVec 32) (_ BitVec 64))) (size!3214 (_ BitVec 32))) )
))
(declare-datatypes ((array!6173 0))(
  ( (array!6174 (arr!2931 (Array (_ BitVec 32) ValueCell!1433)) (size!3215 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1774 0))(
  ( (LongMapFixedSize!1775 (defaultEntry!3329 Int) (mask!7955 (_ BitVec 32)) (extraKeys!3070 (_ BitVec 32)) (zeroValue!3172 V!4385) (minValue!3172 V!4385) (_size!936 (_ BitVec 32)) (_keys!5130 array!6171) (_values!3312 array!6173) (_vacant!936 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2960 0))(
  ( (tuple2!2961 (_1!1491 Bool) (_2!1491 LongMapFixedSize!1774)) )
))
(declare-fun lt!82538 () tuple2!2960)

(assert (=> b!162586 (= res!76996 (_1!1491 lt!82538))))

(declare-fun b!162587 () Bool)

(declare-fun e!106571 () Bool)

(declare-fun e!106570 () Bool)

(assert (=> b!162587 (= e!106571 e!106570)))

(declare-fun res!76998 () Bool)

(assert (=> b!162587 (=> (not res!76998) (not e!106570))))

(declare-datatypes ((SeekEntryResult!385 0))(
  ( (MissingZero!385 (index!3708 (_ BitVec 32))) (Found!385 (index!3709 (_ BitVec 32))) (Intermediate!385 (undefined!1197 Bool) (index!3710 (_ BitVec 32)) (x!17985 (_ BitVec 32))) (Undefined!385) (MissingVacant!385 (index!3711 (_ BitVec 32))) )
))
(declare-fun lt!82539 () SeekEntryResult!385)

(get-info :version)

(assert (=> b!162587 (= res!76998 (and (not ((_ is Undefined!385) lt!82539)) (not ((_ is MissingVacant!385) lt!82539)) ((_ is MissingZero!385) lt!82539)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun thiss!1248 () LongMapFixedSize!1774)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6171 (_ BitVec 32)) SeekEntryResult!385)

(assert (=> b!162587 (= lt!82539 (seekEntryOrOpen!0 key!828 (_keys!5130 thiss!1248) (mask!7955 thiss!1248)))))

(declare-fun b!162588 () Bool)

(declare-fun e!106573 () Bool)

(declare-fun tp_is_empty!3553 () Bool)

(assert (=> b!162588 (= e!106573 tp_is_empty!3553)))

(declare-fun b!162589 () Bool)

(declare-fun e!106574 () Bool)

(assert (=> b!162589 (= e!106574 tp_is_empty!3553)))

(declare-fun b!162590 () Bool)

(declare-fun e!106572 () Bool)

(assert (=> b!162590 (= e!106572 (and e!106573 mapRes!6017))))

(declare-fun condMapEmpty!6017 () Bool)

(declare-fun mapDefault!6017 () ValueCell!1433)

(assert (=> b!162590 (= condMapEmpty!6017 (= (arr!2931 (_values!3312 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1433)) mapDefault!6017)))))

(declare-fun b!162591 () Bool)

(assert (=> b!162591 (= e!106569 false)))

(declare-fun lt!82537 () Bool)

(declare-datatypes ((tuple2!2962 0))(
  ( (tuple2!2963 (_1!1492 (_ BitVec 64)) (_2!1492 V!4385)) )
))
(declare-datatypes ((List!1982 0))(
  ( (Nil!1979) (Cons!1978 (h!2591 tuple2!2962) (t!6776 List!1982)) )
))
(declare-datatypes ((ListLongMap!1931 0))(
  ( (ListLongMap!1932 (toList!981 List!1982)) )
))
(declare-fun contains!1027 (ListLongMap!1931 (_ BitVec 64)) Bool)

(declare-fun map!1687 (LongMapFixedSize!1774) ListLongMap!1931)

(assert (=> b!162591 (= lt!82537 (contains!1027 (map!1687 (_2!1491 lt!82538)) key!828))))

(declare-fun mapNonEmpty!6017 () Bool)

(declare-fun tp!13823 () Bool)

(assert (=> mapNonEmpty!6017 (= mapRes!6017 (and tp!13823 e!106574))))

(declare-fun mapValue!6017 () ValueCell!1433)

(declare-fun mapKey!6017 () (_ BitVec 32))

(declare-fun mapRest!6017 () (Array (_ BitVec 32) ValueCell!1433))

(assert (=> mapNonEmpty!6017 (= (arr!2931 (_values!3312 thiss!1248)) (store mapRest!6017 mapKey!6017 mapValue!6017))))

(declare-fun b!162593 () Bool)

(declare-fun res!77000 () Bool)

(assert (=> b!162593 (=> (not res!77000) (not e!106571))))

(assert (=> b!162593 (= res!77000 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162594 () Bool)

(assert (=> b!162594 (= e!106570 e!106569)))

(declare-fun res!76999 () Bool)

(assert (=> b!162594 (=> (not res!76999) (not e!106569))))

(declare-fun valid!822 (LongMapFixedSize!1774) Bool)

(assert (=> b!162594 (= res!76999 (valid!822 (_2!1491 lt!82538)))))

(declare-fun v!309 () V!4385)

(declare-fun updateHelperNewKey!85 (LongMapFixedSize!1774 (_ BitVec 64) V!4385 (_ BitVec 32)) tuple2!2960)

(assert (=> b!162594 (= lt!82538 (updateHelperNewKey!85 thiss!1248 key!828 v!309 (index!3708 lt!82539)))))

(declare-fun e!106575 () Bool)

(declare-fun array_inv!1879 (array!6171) Bool)

(declare-fun array_inv!1880 (array!6173) Bool)

(assert (=> b!162592 (= e!106575 (and tp!13822 tp_is_empty!3553 (array_inv!1879 (_keys!5130 thiss!1248)) (array_inv!1880 (_values!3312 thiss!1248)) e!106572))))

(declare-fun res!76997 () Bool)

(assert (=> start!16294 (=> (not res!76997) (not e!106571))))

(assert (=> start!16294 (= res!76997 (valid!822 thiss!1248))))

(assert (=> start!16294 e!106571))

(assert (=> start!16294 e!106575))

(assert (=> start!16294 true))

(assert (=> start!16294 tp_is_empty!3553))

(assert (= (and start!16294 res!76997) b!162593))

(assert (= (and b!162593 res!77000) b!162587))

(assert (= (and b!162587 res!76998) b!162594))

(assert (= (and b!162594 res!76999) b!162586))

(assert (= (and b!162586 res!76996) b!162591))

(assert (= (and b!162590 condMapEmpty!6017) mapIsEmpty!6017))

(assert (= (and b!162590 (not condMapEmpty!6017)) mapNonEmpty!6017))

(assert (= (and mapNonEmpty!6017 ((_ is ValueCellFull!1433) mapValue!6017)) b!162589))

(assert (= (and b!162590 ((_ is ValueCellFull!1433) mapDefault!6017)) b!162588))

(assert (= b!162592 b!162590))

(assert (= start!16294 b!162592))

(declare-fun m!193799 () Bool)

(assert (=> b!162587 m!193799))

(declare-fun m!193801 () Bool)

(assert (=> mapNonEmpty!6017 m!193801))

(declare-fun m!193803 () Bool)

(assert (=> b!162594 m!193803))

(declare-fun m!193805 () Bool)

(assert (=> b!162594 m!193805))

(declare-fun m!193807 () Bool)

(assert (=> b!162591 m!193807))

(assert (=> b!162591 m!193807))

(declare-fun m!193809 () Bool)

(assert (=> b!162591 m!193809))

(declare-fun m!193811 () Bool)

(assert (=> b!162592 m!193811))

(declare-fun m!193813 () Bool)

(assert (=> b!162592 m!193813))

(declare-fun m!193815 () Bool)

(assert (=> start!16294 m!193815))

(check-sat (not b_next!3751) (not start!16294) tp_is_empty!3553 (not b!162587) b_and!10179 (not b!162591) (not b!162592) (not b!162594) (not mapNonEmpty!6017))
(check-sat b_and!10179 (not b_next!3751))
