; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75628 () Bool)

(assert start!75628)

(declare-fun b!889216 () Bool)

(declare-fun b_free!15609 () Bool)

(declare-fun b_next!15609 () Bool)

(assert (=> b!889216 (= b_free!15609 (not b_next!15609))))

(declare-fun tp!54792 () Bool)

(declare-fun b_and!25849 () Bool)

(assert (=> b!889216 (= tp!54792 b_and!25849)))

(declare-fun b!889215 () Bool)

(declare-fun res!602663 () Bool)

(declare-fun e!495620 () Bool)

(assert (=> b!889215 (=> (not res!602663) (not e!495620))))

(declare-datatypes ((array!51852 0))(
  ( (array!51853 (arr!24933 (Array (_ BitVec 32) (_ BitVec 64))) (size!25377 (_ BitVec 32))) )
))
(declare-datatypes ((V!28881 0))(
  ( (V!28882 (val!9019 Int)) )
))
(declare-datatypes ((ValueCell!8487 0))(
  ( (ValueCellFull!8487 (v!11497 V!28881)) (EmptyCell!8487) )
))
(declare-datatypes ((array!51854 0))(
  ( (array!51855 (arr!24934 (Array (_ BitVec 32) ValueCell!8487)) (size!25378 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3990 0))(
  ( (LongMapFixedSize!3991 (defaultEntry!5192 Int) (mask!25634 (_ BitVec 32)) (extraKeys!4886 (_ BitVec 32)) (zeroValue!4990 V!28881) (minValue!4990 V!28881) (_size!2050 (_ BitVec 32)) (_keys!9875 array!51852) (_values!5177 array!51854) (_vacant!2050 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3990)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889215 (= res!602663 (validMask!0 (mask!25634 thiss!1181)))))

(declare-fun mapNonEmpty!28457 () Bool)

(declare-fun mapRes!28457 () Bool)

(declare-fun tp!54793 () Bool)

(declare-fun e!495621 () Bool)

(assert (=> mapNonEmpty!28457 (= mapRes!28457 (and tp!54793 e!495621))))

(declare-fun mapKey!28457 () (_ BitVec 32))

(declare-fun mapRest!28457 () (Array (_ BitVec 32) ValueCell!8487))

(declare-fun mapValue!28457 () ValueCell!8487)

(assert (=> mapNonEmpty!28457 (= (arr!24934 (_values!5177 thiss!1181)) (store mapRest!28457 mapKey!28457 mapValue!28457))))

(declare-fun e!495619 () Bool)

(declare-fun tp_is_empty!17937 () Bool)

(declare-fun e!495616 () Bool)

(declare-fun array_inv!19618 (array!51852) Bool)

(declare-fun array_inv!19619 (array!51854) Bool)

(assert (=> b!889216 (= e!495616 (and tp!54792 tp_is_empty!17937 (array_inv!19618 (_keys!9875 thiss!1181)) (array_inv!19619 (_values!5177 thiss!1181)) e!495619))))

(declare-fun b!889217 () Bool)

(declare-fun e!495618 () Bool)

(assert (=> b!889217 (= e!495619 (and e!495618 mapRes!28457))))

(declare-fun condMapEmpty!28457 () Bool)

(declare-fun mapDefault!28457 () ValueCell!8487)

(assert (=> b!889217 (= condMapEmpty!28457 (= (arr!24934 (_values!5177 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8487)) mapDefault!28457)))))

(declare-fun b!889218 () Bool)

(declare-fun res!602661 () Bool)

(assert (=> b!889218 (=> (not res!602661) (not e!495620))))

(assert (=> b!889218 (= res!602661 (= (size!25377 (_keys!9875 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25634 thiss!1181))))))

(declare-fun b!889220 () Bool)

(assert (=> b!889220 (= e!495618 tp_is_empty!17937)))

(declare-fun b!889221 () Bool)

(assert (=> b!889221 (= e!495621 tp_is_empty!17937)))

(declare-fun b!889222 () Bool)

(declare-fun res!602660 () Bool)

(assert (=> b!889222 (=> (not res!602660) (not e!495620))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889222 (= res!602660 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28457 () Bool)

(assert (=> mapIsEmpty!28457 mapRes!28457))

(declare-fun res!602662 () Bool)

(assert (=> start!75628 (=> (not res!602662) (not e!495620))))

(declare-fun valid!1555 (LongMapFixedSize!3990) Bool)

(assert (=> start!75628 (= res!602662 (valid!1555 thiss!1181))))

(assert (=> start!75628 e!495620))

(assert (=> start!75628 e!495616))

(assert (=> start!75628 true))

(declare-fun b!889219 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!889219 (= e!495620 (not (validKeyInArray!0 key!785)))))

(assert (= (and start!75628 res!602662) b!889222))

(assert (= (and b!889222 res!602660) b!889215))

(assert (= (and b!889215 res!602663) b!889218))

(assert (= (and b!889218 res!602661) b!889219))

(assert (= (and b!889217 condMapEmpty!28457) mapIsEmpty!28457))

(assert (= (and b!889217 (not condMapEmpty!28457)) mapNonEmpty!28457))

(get-info :version)

(assert (= (and mapNonEmpty!28457 ((_ is ValueCellFull!8487) mapValue!28457)) b!889221))

(assert (= (and b!889217 ((_ is ValueCellFull!8487) mapDefault!28457)) b!889220))

(assert (= b!889216 b!889217))

(assert (= start!75628 b!889216))

(declare-fun m!828227 () Bool)

(assert (=> b!889216 m!828227))

(declare-fun m!828229 () Bool)

(assert (=> b!889216 m!828229))

(declare-fun m!828231 () Bool)

(assert (=> start!75628 m!828231))

(declare-fun m!828233 () Bool)

(assert (=> mapNonEmpty!28457 m!828233))

(declare-fun m!828235 () Bool)

(assert (=> b!889215 m!828235))

(declare-fun m!828237 () Bool)

(assert (=> b!889219 m!828237))

(check-sat (not b_next!15609) (not start!75628) tp_is_empty!17937 (not mapNonEmpty!28457) (not b!889216) (not b!889215) b_and!25849 (not b!889219))
(check-sat b_and!25849 (not b_next!15609))
(get-model)

(declare-fun d!110155 () Bool)

(assert (=> d!110155 (= (validKeyInArray!0 key!785) (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!889219 d!110155))

(declare-fun d!110157 () Bool)

(assert (=> d!110157 (= (validMask!0 (mask!25634 thiss!1181)) (and (or (= (mask!25634 thiss!1181) #b00000000000000000000000000000111) (= (mask!25634 thiss!1181) #b00000000000000000000000000001111) (= (mask!25634 thiss!1181) #b00000000000000000000000000011111) (= (mask!25634 thiss!1181) #b00000000000000000000000000111111) (= (mask!25634 thiss!1181) #b00000000000000000000000001111111) (= (mask!25634 thiss!1181) #b00000000000000000000000011111111) (= (mask!25634 thiss!1181) #b00000000000000000000000111111111) (= (mask!25634 thiss!1181) #b00000000000000000000001111111111) (= (mask!25634 thiss!1181) #b00000000000000000000011111111111) (= (mask!25634 thiss!1181) #b00000000000000000000111111111111) (= (mask!25634 thiss!1181) #b00000000000000000001111111111111) (= (mask!25634 thiss!1181) #b00000000000000000011111111111111) (= (mask!25634 thiss!1181) #b00000000000000000111111111111111) (= (mask!25634 thiss!1181) #b00000000000000001111111111111111) (= (mask!25634 thiss!1181) #b00000000000000011111111111111111) (= (mask!25634 thiss!1181) #b00000000000000111111111111111111) (= (mask!25634 thiss!1181) #b00000000000001111111111111111111) (= (mask!25634 thiss!1181) #b00000000000011111111111111111111) (= (mask!25634 thiss!1181) #b00000000000111111111111111111111) (= (mask!25634 thiss!1181) #b00000000001111111111111111111111) (= (mask!25634 thiss!1181) #b00000000011111111111111111111111) (= (mask!25634 thiss!1181) #b00000000111111111111111111111111) (= (mask!25634 thiss!1181) #b00000001111111111111111111111111) (= (mask!25634 thiss!1181) #b00000011111111111111111111111111) (= (mask!25634 thiss!1181) #b00000111111111111111111111111111) (= (mask!25634 thiss!1181) #b00001111111111111111111111111111) (= (mask!25634 thiss!1181) #b00011111111111111111111111111111) (= (mask!25634 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25634 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!889215 d!110157))

(declare-fun d!110159 () Bool)

(declare-fun res!602682 () Bool)

(declare-fun e!495642 () Bool)

(assert (=> d!110159 (=> (not res!602682) (not e!495642))))

(declare-fun simpleValid!294 (LongMapFixedSize!3990) Bool)

(assert (=> d!110159 (= res!602682 (simpleValid!294 thiss!1181))))

(assert (=> d!110159 (= (valid!1555 thiss!1181) e!495642)))

(declare-fun b!889253 () Bool)

(declare-fun res!602683 () Bool)

(assert (=> b!889253 (=> (not res!602683) (not e!495642))))

(declare-fun arrayCountValidKeys!0 (array!51852 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!889253 (= res!602683 (= (arrayCountValidKeys!0 (_keys!9875 thiss!1181) #b00000000000000000000000000000000 (size!25377 (_keys!9875 thiss!1181))) (_size!2050 thiss!1181)))))

(declare-fun b!889254 () Bool)

(declare-fun res!602684 () Bool)

(assert (=> b!889254 (=> (not res!602684) (not e!495642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51852 (_ BitVec 32)) Bool)

(assert (=> b!889254 (= res!602684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9875 thiss!1181) (mask!25634 thiss!1181)))))

(declare-fun b!889255 () Bool)

(declare-datatypes ((List!17698 0))(
  ( (Nil!17695) (Cons!17694 (h!18825 (_ BitVec 64)) (t!24997 List!17698)) )
))
(declare-fun arrayNoDuplicates!0 (array!51852 (_ BitVec 32) List!17698) Bool)

(assert (=> b!889255 (= e!495642 (arrayNoDuplicates!0 (_keys!9875 thiss!1181) #b00000000000000000000000000000000 Nil!17695))))

(assert (= (and d!110159 res!602682) b!889253))

(assert (= (and b!889253 res!602683) b!889254))

(assert (= (and b!889254 res!602684) b!889255))

(declare-fun m!828251 () Bool)

(assert (=> d!110159 m!828251))

(declare-fun m!828253 () Bool)

(assert (=> b!889253 m!828253))

(declare-fun m!828255 () Bool)

(assert (=> b!889254 m!828255))

(declare-fun m!828257 () Bool)

(assert (=> b!889255 m!828257))

(assert (=> start!75628 d!110159))

(declare-fun d!110161 () Bool)

(assert (=> d!110161 (= (array_inv!19618 (_keys!9875 thiss!1181)) (bvsge (size!25377 (_keys!9875 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889216 d!110161))

(declare-fun d!110163 () Bool)

(assert (=> d!110163 (= (array_inv!19619 (_values!5177 thiss!1181)) (bvsge (size!25378 (_values!5177 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889216 d!110163))

(declare-fun b!889263 () Bool)

(declare-fun e!495648 () Bool)

(assert (=> b!889263 (= e!495648 tp_is_empty!17937)))

(declare-fun mapIsEmpty!28463 () Bool)

(declare-fun mapRes!28463 () Bool)

(assert (=> mapIsEmpty!28463 mapRes!28463))

(declare-fun mapNonEmpty!28463 () Bool)

(declare-fun tp!54802 () Bool)

(declare-fun e!495647 () Bool)

(assert (=> mapNonEmpty!28463 (= mapRes!28463 (and tp!54802 e!495647))))

(declare-fun mapValue!28463 () ValueCell!8487)

(declare-fun mapRest!28463 () (Array (_ BitVec 32) ValueCell!8487))

(declare-fun mapKey!28463 () (_ BitVec 32))

(assert (=> mapNonEmpty!28463 (= mapRest!28457 (store mapRest!28463 mapKey!28463 mapValue!28463))))

(declare-fun b!889262 () Bool)

(assert (=> b!889262 (= e!495647 tp_is_empty!17937)))

(declare-fun condMapEmpty!28463 () Bool)

(declare-fun mapDefault!28463 () ValueCell!8487)

(assert (=> mapNonEmpty!28457 (= condMapEmpty!28463 (= mapRest!28457 ((as const (Array (_ BitVec 32) ValueCell!8487)) mapDefault!28463)))))

(assert (=> mapNonEmpty!28457 (= tp!54793 (and e!495648 mapRes!28463))))

(assert (= (and mapNonEmpty!28457 condMapEmpty!28463) mapIsEmpty!28463))

(assert (= (and mapNonEmpty!28457 (not condMapEmpty!28463)) mapNonEmpty!28463))

(assert (= (and mapNonEmpty!28463 ((_ is ValueCellFull!8487) mapValue!28463)) b!889262))

(assert (= (and mapNonEmpty!28457 ((_ is ValueCellFull!8487) mapDefault!28463)) b!889263))

(declare-fun m!828259 () Bool)

(assert (=> mapNonEmpty!28463 m!828259))

(check-sat (not mapNonEmpty!28463) (not b_next!15609) tp_is_empty!17937 (not b!889255) (not b!889253) (not d!110159) b_and!25849 (not b!889254))
(check-sat b_and!25849 (not b_next!15609))
