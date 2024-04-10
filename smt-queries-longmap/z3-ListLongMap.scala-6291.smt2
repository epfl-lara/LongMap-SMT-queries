; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80426 () Bool)

(assert start!80426)

(declare-fun b!944786 () Bool)

(declare-fun b_free!18069 () Bool)

(declare-fun b_next!18069 () Bool)

(assert (=> b!944786 (= b_free!18069 (not b_next!18069))))

(declare-fun tp!62716 () Bool)

(declare-fun b_and!29487 () Bool)

(assert (=> b!944786 (= tp!62716 b_and!29487)))

(declare-fun b!944779 () Bool)

(declare-fun res!634683 () Bool)

(declare-fun e!531301 () Bool)

(assert (=> b!944779 (=> res!634683 e!531301)))

(declare-datatypes ((V!32401 0))(
  ( (V!32402 (val!10339 Int)) )
))
(declare-datatypes ((ValueCell!9807 0))(
  ( (ValueCellFull!9807 (v!12871 V!32401)) (EmptyCell!9807) )
))
(declare-datatypes ((array!57122 0))(
  ( (array!57123 (arr!27486 (Array (_ BitVec 32) ValueCell!9807)) (size!27952 (_ BitVec 32))) )
))
(declare-datatypes ((array!57124 0))(
  ( (array!57125 (arr!27487 (Array (_ BitVec 32) (_ BitVec 64))) (size!27953 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4764 0))(
  ( (LongMapFixedSize!4765 (defaultEntry!5677 Int) (mask!27333 (_ BitVec 32)) (extraKeys!5409 (_ BitVec 32)) (zeroValue!5513 V!32401) (minValue!5513 V!32401) (_size!2437 (_ BitVec 32)) (_keys!10555 array!57124) (_values!5700 array!57122) (_vacant!2437 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4764)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57124 (_ BitVec 32)) Bool)

(assert (=> b!944779 (= res!634683 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10555 thiss!1141) (mask!27333 thiss!1141))))))

(declare-fun b!944780 () Bool)

(declare-fun e!531306 () Bool)

(declare-fun tp_is_empty!20577 () Bool)

(assert (=> b!944780 (= e!531306 tp_is_empty!20577)))

(declare-fun b!944781 () Bool)

(declare-fun e!531302 () Bool)

(declare-fun mapRes!32691 () Bool)

(assert (=> b!944781 (= e!531302 (and e!531306 mapRes!32691))))

(declare-fun condMapEmpty!32691 () Bool)

(declare-fun mapDefault!32691 () ValueCell!9807)

(assert (=> b!944781 (= condMapEmpty!32691 (= (arr!27486 (_values!5700 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9807)) mapDefault!32691)))))

(declare-fun b!944782 () Bool)

(declare-fun res!634678 () Bool)

(assert (=> b!944782 (=> res!634678 e!531301)))

(assert (=> b!944782 (= res!634678 (not (= (size!27953 (_keys!10555 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27333 thiss!1141)))))))

(declare-fun b!944783 () Bool)

(declare-fun e!531304 () Bool)

(assert (=> b!944783 (= e!531304 (not e!531301))))

(declare-fun res!634680 () Bool)

(assert (=> b!944783 (=> res!634680 e!531301)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944783 (= res!634680 (not (validMask!0 (mask!27333 thiss!1141))))))

(declare-fun lt!425745 () (_ BitVec 32))

(assert (=> b!944783 (arrayForallSeekEntryOrOpenFound!0 lt!425745 (_keys!10555 thiss!1141) (mask!27333 thiss!1141))))

(declare-datatypes ((Unit!31866 0))(
  ( (Unit!31867) )
))
(declare-fun lt!425742 () Unit!31866)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31866)

(assert (=> b!944783 (= lt!425742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10555 thiss!1141) (mask!27333 thiss!1141) #b00000000000000000000000000000000 lt!425745))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57124 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944783 (= lt!425745 (arrayScanForKey!0 (_keys!10555 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944783 (arrayContainsKey!0 (_keys!10555 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425743 () Unit!31866)

(declare-fun lemmaKeyInListMapIsInArray!313 (array!57124 array!57122 (_ BitVec 32) (_ BitVec 32) V!32401 V!32401 (_ BitVec 64) Int) Unit!31866)

(assert (=> b!944783 (= lt!425743 (lemmaKeyInListMapIsInArray!313 (_keys!10555 thiss!1141) (_values!5700 thiss!1141) (mask!27333 thiss!1141) (extraKeys!5409 thiss!1141) (zeroValue!5513 thiss!1141) (minValue!5513 thiss!1141) key!756 (defaultEntry!5677 thiss!1141)))))

(declare-fun b!944784 () Bool)

(declare-fun res!634679 () Bool)

(assert (=> b!944784 (=> res!634679 e!531301)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944784 (= res!634679 (not (validKeyInArray!0 key!756)))))

(declare-fun e!531303 () Bool)

(declare-fun array_inv!21356 (array!57124) Bool)

(declare-fun array_inv!21357 (array!57122) Bool)

(assert (=> b!944786 (= e!531303 (and tp!62716 tp_is_empty!20577 (array_inv!21356 (_keys!10555 thiss!1141)) (array_inv!21357 (_values!5700 thiss!1141)) e!531302))))

(declare-fun mapIsEmpty!32691 () Bool)

(assert (=> mapIsEmpty!32691 mapRes!32691))

(declare-fun b!944787 () Bool)

(declare-fun res!634682 () Bool)

(assert (=> b!944787 (=> (not res!634682) (not e!531304))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9076 0))(
  ( (MissingZero!9076 (index!38675 (_ BitVec 32))) (Found!9076 (index!38676 (_ BitVec 32))) (Intermediate!9076 (undefined!9888 Bool) (index!38677 (_ BitVec 32)) (x!81151 (_ BitVec 32))) (Undefined!9076) (MissingVacant!9076 (index!38678 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57124 (_ BitVec 32)) SeekEntryResult!9076)

(assert (=> b!944787 (= res!634682 (not ((_ is Found!9076) (seekEntry!0 key!756 (_keys!10555 thiss!1141) (mask!27333 thiss!1141)))))))

(declare-fun b!944788 () Bool)

(declare-fun res!634681 () Bool)

(assert (=> b!944788 (=> (not res!634681) (not e!531304))))

(declare-datatypes ((tuple2!13496 0))(
  ( (tuple2!13497 (_1!6759 (_ BitVec 64)) (_2!6759 V!32401)) )
))
(declare-datatypes ((List!19282 0))(
  ( (Nil!19279) (Cons!19278 (h!20429 tuple2!13496) (t!27599 List!19282)) )
))
(declare-datatypes ((ListLongMap!12193 0))(
  ( (ListLongMap!12194 (toList!6112 List!19282)) )
))
(declare-fun contains!5184 (ListLongMap!12193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3346 (array!57124 array!57122 (_ BitVec 32) (_ BitVec 32) V!32401 V!32401 (_ BitVec 32) Int) ListLongMap!12193)

(assert (=> b!944788 (= res!634681 (contains!5184 (getCurrentListMap!3346 (_keys!10555 thiss!1141) (_values!5700 thiss!1141) (mask!27333 thiss!1141) (extraKeys!5409 thiss!1141) (zeroValue!5513 thiss!1141) (minValue!5513 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5677 thiss!1141)) key!756))))

(declare-fun b!944789 () Bool)

(declare-fun res!634677 () Bool)

(assert (=> b!944789 (=> (not res!634677) (not e!531304))))

(assert (=> b!944789 (= res!634677 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32691 () Bool)

(declare-fun tp!62717 () Bool)

(declare-fun e!531307 () Bool)

(assert (=> mapNonEmpty!32691 (= mapRes!32691 (and tp!62717 e!531307))))

(declare-fun mapValue!32691 () ValueCell!9807)

(declare-fun mapKey!32691 () (_ BitVec 32))

(declare-fun mapRest!32691 () (Array (_ BitVec 32) ValueCell!9807))

(assert (=> mapNonEmpty!32691 (= (arr!27486 (_values!5700 thiss!1141)) (store mapRest!32691 mapKey!32691 mapValue!32691))))

(declare-fun b!944790 () Bool)

(assert (=> b!944790 (= e!531301 true)))

(declare-fun lt!425744 () SeekEntryResult!9076)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57124 (_ BitVec 32)) SeekEntryResult!9076)

(assert (=> b!944790 (= lt!425744 (seekEntryOrOpen!0 key!756 (_keys!10555 thiss!1141) (mask!27333 thiss!1141)))))

(declare-fun b!944785 () Bool)

(assert (=> b!944785 (= e!531307 tp_is_empty!20577)))

(declare-fun res!634676 () Bool)

(assert (=> start!80426 (=> (not res!634676) (not e!531304))))

(declare-fun valid!1822 (LongMapFixedSize!4764) Bool)

(assert (=> start!80426 (= res!634676 (valid!1822 thiss!1141))))

(assert (=> start!80426 e!531304))

(assert (=> start!80426 e!531303))

(assert (=> start!80426 true))

(assert (= (and start!80426 res!634676) b!944789))

(assert (= (and b!944789 res!634677) b!944787))

(assert (= (and b!944787 res!634682) b!944788))

(assert (= (and b!944788 res!634681) b!944783))

(assert (= (and b!944783 (not res!634680)) b!944782))

(assert (= (and b!944782 (not res!634678)) b!944779))

(assert (= (and b!944779 (not res!634683)) b!944784))

(assert (= (and b!944784 (not res!634679)) b!944790))

(assert (= (and b!944781 condMapEmpty!32691) mapIsEmpty!32691))

(assert (= (and b!944781 (not condMapEmpty!32691)) mapNonEmpty!32691))

(assert (= (and mapNonEmpty!32691 ((_ is ValueCellFull!9807) mapValue!32691)) b!944785))

(assert (= (and b!944781 ((_ is ValueCellFull!9807) mapDefault!32691)) b!944780))

(assert (= b!944786 b!944781))

(assert (= start!80426 b!944786))

(declare-fun m!878741 () Bool)

(assert (=> b!944787 m!878741))

(declare-fun m!878743 () Bool)

(assert (=> b!944783 m!878743))

(declare-fun m!878745 () Bool)

(assert (=> b!944783 m!878745))

(declare-fun m!878747 () Bool)

(assert (=> b!944783 m!878747))

(declare-fun m!878749 () Bool)

(assert (=> b!944783 m!878749))

(declare-fun m!878751 () Bool)

(assert (=> b!944783 m!878751))

(declare-fun m!878753 () Bool)

(assert (=> b!944783 m!878753))

(declare-fun m!878755 () Bool)

(assert (=> b!944788 m!878755))

(assert (=> b!944788 m!878755))

(declare-fun m!878757 () Bool)

(assert (=> b!944788 m!878757))

(declare-fun m!878759 () Bool)

(assert (=> b!944790 m!878759))

(declare-fun m!878761 () Bool)

(assert (=> b!944786 m!878761))

(declare-fun m!878763 () Bool)

(assert (=> b!944786 m!878763))

(declare-fun m!878765 () Bool)

(assert (=> mapNonEmpty!32691 m!878765))

(declare-fun m!878767 () Bool)

(assert (=> b!944784 m!878767))

(declare-fun m!878769 () Bool)

(assert (=> start!80426 m!878769))

(declare-fun m!878771 () Bool)

(assert (=> b!944779 m!878771))

(check-sat (not b!944784) (not b!944790) b_and!29487 (not b!944779) tp_is_empty!20577 (not b!944787) (not b_next!18069) (not b!944786) (not mapNonEmpty!32691) (not start!80426) (not b!944788) (not b!944783))
(check-sat b_and!29487 (not b_next!18069))
