; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16894 () Bool)

(assert start!16894)

(declare-fun b!169892 () Bool)

(declare-fun b_free!4177 () Bool)

(declare-fun b_next!4177 () Bool)

(assert (=> b!169892 (= b_free!4177 (not b_next!4177))))

(declare-fun tp!15144 () Bool)

(declare-fun b_and!10565 () Bool)

(assert (=> b!169892 (= tp!15144 b_and!10565)))

(declare-fun b!169887 () Bool)

(declare-fun e!112062 () Bool)

(declare-fun tp_is_empty!3949 () Bool)

(assert (=> b!169887 (= e!112062 tp_is_empty!3949)))

(declare-fun mapIsEmpty!6699 () Bool)

(declare-fun mapRes!6699 () Bool)

(assert (=> mapIsEmpty!6699 mapRes!6699))

(declare-fun b!169888 () Bool)

(declare-fun res!80741 () Bool)

(declare-fun e!112058 () Bool)

(assert (=> b!169888 (=> (not res!80741) (not e!112058))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169888 (= res!80741 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169889 () Bool)

(declare-fun res!80743 () Bool)

(assert (=> b!169889 (=> (not res!80743) (not e!112058))))

(declare-datatypes ((V!4913 0))(
  ( (V!4914 (val!2019 Int)) )
))
(declare-datatypes ((ValueCell!1631 0))(
  ( (ValueCellFull!1631 (v!3878 V!4913)) (EmptyCell!1631) )
))
(declare-datatypes ((array!6981 0))(
  ( (array!6982 (arr!3322 (Array (_ BitVec 32) (_ BitVec 64))) (size!3614 (_ BitVec 32))) )
))
(declare-datatypes ((array!6983 0))(
  ( (array!6984 (arr!3323 (Array (_ BitVec 32) ValueCell!1631)) (size!3615 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2170 0))(
  ( (LongMapFixedSize!2171 (defaultEntry!3527 Int) (mask!8327 (_ BitVec 32)) (extraKeys!3268 (_ BitVec 32)) (zeroValue!3370 V!4913) (minValue!3370 V!4913) (_size!1134 (_ BitVec 32)) (_keys!5354 array!6981) (_values!3510 array!6983) (_vacant!1134 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2170)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!169889 (= res!80743 (validMask!0 (mask!8327 thiss!1248)))))

(declare-fun b!169890 () Bool)

(assert (=> b!169890 (= e!112058 (and (= (size!3615 (_values!3510 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8327 thiss!1248))) (= (size!3614 (_keys!5354 thiss!1248)) (size!3615 (_values!3510 thiss!1248))) (bvslt (mask!8327 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun res!80742 () Bool)

(assert (=> start!16894 (=> (not res!80742) (not e!112058))))

(declare-fun valid!948 (LongMapFixedSize!2170) Bool)

(assert (=> start!16894 (= res!80742 (valid!948 thiss!1248))))

(assert (=> start!16894 e!112058))

(declare-fun e!112057 () Bool)

(assert (=> start!16894 e!112057))

(assert (=> start!16894 true))

(declare-fun mapNonEmpty!6699 () Bool)

(declare-fun tp!15143 () Bool)

(assert (=> mapNonEmpty!6699 (= mapRes!6699 (and tp!15143 e!112062))))

(declare-fun mapValue!6699 () ValueCell!1631)

(declare-fun mapKey!6699 () (_ BitVec 32))

(declare-fun mapRest!6699 () (Array (_ BitVec 32) ValueCell!1631))

(assert (=> mapNonEmpty!6699 (= (arr!3323 (_values!3510 thiss!1248)) (store mapRest!6699 mapKey!6699 mapValue!6699))))

(declare-fun b!169891 () Bool)

(declare-fun e!112059 () Bool)

(assert (=> b!169891 (= e!112059 tp_is_empty!3949)))

(declare-fun e!112060 () Bool)

(declare-fun array_inv!2135 (array!6981) Bool)

(declare-fun array_inv!2136 (array!6983) Bool)

(assert (=> b!169892 (= e!112057 (and tp!15144 tp_is_empty!3949 (array_inv!2135 (_keys!5354 thiss!1248)) (array_inv!2136 (_values!3510 thiss!1248)) e!112060))))

(declare-fun b!169893 () Bool)

(assert (=> b!169893 (= e!112060 (and e!112059 mapRes!6699))))

(declare-fun condMapEmpty!6699 () Bool)

(declare-fun mapDefault!6699 () ValueCell!1631)

(assert (=> b!169893 (= condMapEmpty!6699 (= (arr!3323 (_values!3510 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1631)) mapDefault!6699)))))

(assert (= (and start!16894 res!80742) b!169888))

(assert (= (and b!169888 res!80741) b!169889))

(assert (= (and b!169889 res!80743) b!169890))

(assert (= (and b!169893 condMapEmpty!6699) mapIsEmpty!6699))

(assert (= (and b!169893 (not condMapEmpty!6699)) mapNonEmpty!6699))

(get-info :version)

(assert (= (and mapNonEmpty!6699 ((_ is ValueCellFull!1631) mapValue!6699)) b!169887))

(assert (= (and b!169893 ((_ is ValueCellFull!1631) mapDefault!6699)) b!169891))

(assert (= b!169892 b!169893))

(assert (= start!16894 b!169892))

(declare-fun m!198139 () Bool)

(assert (=> b!169889 m!198139))

(declare-fun m!198141 () Bool)

(assert (=> start!16894 m!198141))

(declare-fun m!198143 () Bool)

(assert (=> mapNonEmpty!6699 m!198143))

(declare-fun m!198145 () Bool)

(assert (=> b!169892 m!198145))

(declare-fun m!198147 () Bool)

(assert (=> b!169892 m!198147))

(check-sat b_and!10565 (not start!16894) (not mapNonEmpty!6699) (not b_next!4177) (not b!169889) tp_is_empty!3949 (not b!169892))
(check-sat b_and!10565 (not b_next!4177))
(get-model)

(declare-fun d!51539 () Bool)

(assert (=> d!51539 (= (array_inv!2135 (_keys!5354 thiss!1248)) (bvsge (size!3614 (_keys!5354 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169892 d!51539))

(declare-fun d!51541 () Bool)

(assert (=> d!51541 (= (array_inv!2136 (_values!3510 thiss!1248)) (bvsge (size!3615 (_values!3510 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169892 d!51541))

(declare-fun d!51543 () Bool)

(assert (=> d!51543 (= (validMask!0 (mask!8327 thiss!1248)) (and (or (= (mask!8327 thiss!1248) #b00000000000000000000000000000111) (= (mask!8327 thiss!1248) #b00000000000000000000000000001111) (= (mask!8327 thiss!1248) #b00000000000000000000000000011111) (= (mask!8327 thiss!1248) #b00000000000000000000000000111111) (= (mask!8327 thiss!1248) #b00000000000000000000000001111111) (= (mask!8327 thiss!1248) #b00000000000000000000000011111111) (= (mask!8327 thiss!1248) #b00000000000000000000000111111111) (= (mask!8327 thiss!1248) #b00000000000000000000001111111111) (= (mask!8327 thiss!1248) #b00000000000000000000011111111111) (= (mask!8327 thiss!1248) #b00000000000000000000111111111111) (= (mask!8327 thiss!1248) #b00000000000000000001111111111111) (= (mask!8327 thiss!1248) #b00000000000000000011111111111111) (= (mask!8327 thiss!1248) #b00000000000000000111111111111111) (= (mask!8327 thiss!1248) #b00000000000000001111111111111111) (= (mask!8327 thiss!1248) #b00000000000000011111111111111111) (= (mask!8327 thiss!1248) #b00000000000000111111111111111111) (= (mask!8327 thiss!1248) #b00000000000001111111111111111111) (= (mask!8327 thiss!1248) #b00000000000011111111111111111111) (= (mask!8327 thiss!1248) #b00000000000111111111111111111111) (= (mask!8327 thiss!1248) #b00000000001111111111111111111111) (= (mask!8327 thiss!1248) #b00000000011111111111111111111111) (= (mask!8327 thiss!1248) #b00000000111111111111111111111111) (= (mask!8327 thiss!1248) #b00000001111111111111111111111111) (= (mask!8327 thiss!1248) #b00000011111111111111111111111111) (= (mask!8327 thiss!1248) #b00000111111111111111111111111111) (= (mask!8327 thiss!1248) #b00001111111111111111111111111111) (= (mask!8327 thiss!1248) #b00011111111111111111111111111111) (= (mask!8327 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8327 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!169889 d!51543))

(declare-fun d!51545 () Bool)

(declare-fun res!80768 () Bool)

(declare-fun e!112101 () Bool)

(assert (=> d!51545 (=> (not res!80768) (not e!112101))))

(declare-fun simpleValid!130 (LongMapFixedSize!2170) Bool)

(assert (=> d!51545 (= res!80768 (simpleValid!130 thiss!1248))))

(assert (=> d!51545 (= (valid!948 thiss!1248) e!112101)))

(declare-fun b!169942 () Bool)

(declare-fun res!80769 () Bool)

(assert (=> b!169942 (=> (not res!80769) (not e!112101))))

(declare-fun arrayCountValidKeys!0 (array!6981 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!169942 (= res!80769 (= (arrayCountValidKeys!0 (_keys!5354 thiss!1248) #b00000000000000000000000000000000 (size!3614 (_keys!5354 thiss!1248))) (_size!1134 thiss!1248)))))

(declare-fun b!169943 () Bool)

(declare-fun res!80770 () Bool)

(assert (=> b!169943 (=> (not res!80770) (not e!112101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6981 (_ BitVec 32)) Bool)

(assert (=> b!169943 (= res!80770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5354 thiss!1248) (mask!8327 thiss!1248)))))

(declare-fun b!169944 () Bool)

(declare-datatypes ((List!2197 0))(
  ( (Nil!2194) (Cons!2193 (h!2810 (_ BitVec 64)) (t!6990 List!2197)) )
))
(declare-fun arrayNoDuplicates!0 (array!6981 (_ BitVec 32) List!2197) Bool)

(assert (=> b!169944 (= e!112101 (arrayNoDuplicates!0 (_keys!5354 thiss!1248) #b00000000000000000000000000000000 Nil!2194))))

(assert (= (and d!51545 res!80768) b!169942))

(assert (= (and b!169942 res!80769) b!169943))

(assert (= (and b!169943 res!80770) b!169944))

(declare-fun m!198169 () Bool)

(assert (=> d!51545 m!198169))

(declare-fun m!198171 () Bool)

(assert (=> b!169942 m!198171))

(declare-fun m!198173 () Bool)

(assert (=> b!169943 m!198173))

(declare-fun m!198175 () Bool)

(assert (=> b!169944 m!198175))

(assert (=> start!16894 d!51545))

(declare-fun condMapEmpty!6708 () Bool)

(declare-fun mapDefault!6708 () ValueCell!1631)

(assert (=> mapNonEmpty!6699 (= condMapEmpty!6708 (= mapRest!6699 ((as const (Array (_ BitVec 32) ValueCell!1631)) mapDefault!6708)))))

(declare-fun e!112107 () Bool)

(declare-fun mapRes!6708 () Bool)

(assert (=> mapNonEmpty!6699 (= tp!15143 (and e!112107 mapRes!6708))))

(declare-fun mapIsEmpty!6708 () Bool)

(assert (=> mapIsEmpty!6708 mapRes!6708))

(declare-fun b!169952 () Bool)

(assert (=> b!169952 (= e!112107 tp_is_empty!3949)))

(declare-fun mapNonEmpty!6708 () Bool)

(declare-fun tp!15159 () Bool)

(declare-fun e!112106 () Bool)

(assert (=> mapNonEmpty!6708 (= mapRes!6708 (and tp!15159 e!112106))))

(declare-fun mapValue!6708 () ValueCell!1631)

(declare-fun mapRest!6708 () (Array (_ BitVec 32) ValueCell!1631))

(declare-fun mapKey!6708 () (_ BitVec 32))

(assert (=> mapNonEmpty!6708 (= mapRest!6699 (store mapRest!6708 mapKey!6708 mapValue!6708))))

(declare-fun b!169951 () Bool)

(assert (=> b!169951 (= e!112106 tp_is_empty!3949)))

(assert (= (and mapNonEmpty!6699 condMapEmpty!6708) mapIsEmpty!6708))

(assert (= (and mapNonEmpty!6699 (not condMapEmpty!6708)) mapNonEmpty!6708))

(assert (= (and mapNonEmpty!6708 ((_ is ValueCellFull!1631) mapValue!6708)) b!169951))

(assert (= (and mapNonEmpty!6699 ((_ is ValueCellFull!1631) mapDefault!6708)) b!169952))

(declare-fun m!198177 () Bool)

(assert (=> mapNonEmpty!6708 m!198177))

(check-sat b_and!10565 (not mapNonEmpty!6708) (not d!51545) (not b!169942) (not b!169944) (not b_next!4177) tp_is_empty!3949 (not b!169943))
(check-sat b_and!10565 (not b_next!4177))
