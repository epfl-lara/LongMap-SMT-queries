; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79864 () Bool)

(assert start!79864)

(declare-fun b!939291 () Bool)

(declare-fun b_free!17779 () Bool)

(declare-fun b_next!17779 () Bool)

(assert (=> b!939291 (= b_free!17779 (not b_next!17779))))

(declare-fun tp!61801 () Bool)

(declare-fun b_and!29165 () Bool)

(assert (=> b!939291 (= tp!61801 b_and!29165)))

(declare-fun lt!424313 () Bool)

(declare-datatypes ((V!32015 0))(
  ( (V!32016 (val!10194 Int)) )
))
(declare-datatypes ((ValueCell!9662 0))(
  ( (ValueCellFull!9662 (v!12724 V!32015)) (EmptyCell!9662) )
))
(declare-datatypes ((array!56481 0))(
  ( (array!56482 (arr!27179 (Array (_ BitVec 32) ValueCell!9662)) (size!27640 (_ BitVec 32))) )
))
(declare-datatypes ((array!56483 0))(
  ( (array!56484 (arr!27180 (Array (_ BitVec 32) (_ BitVec 64))) (size!27641 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4474 0))(
  ( (LongMapFixedSize!4475 (defaultEntry!5528 Int) (mask!27033 (_ BitVec 32)) (extraKeys!5260 (_ BitVec 32)) (zeroValue!5364 V!32015) (minValue!5364 V!32015) (_size!2292 (_ BitVec 32)) (_keys!10371 array!56483) (_values!5551 array!56481) (_vacant!2292 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4474)

(declare-fun valid!1725 (LongMapFixedSize!4474) Bool)

(assert (=> start!79864 (= lt!424313 (valid!1725 thiss!1141))))

(assert (=> start!79864 false))

(declare-fun e!527572 () Bool)

(assert (=> start!79864 e!527572))

(declare-fun mapIsEmpty!32210 () Bool)

(declare-fun mapRes!32210 () Bool)

(assert (=> mapIsEmpty!32210 mapRes!32210))

(declare-fun mapNonEmpty!32210 () Bool)

(declare-fun tp!61802 () Bool)

(declare-fun e!527575 () Bool)

(assert (=> mapNonEmpty!32210 (= mapRes!32210 (and tp!61802 e!527575))))

(declare-fun mapKey!32210 () (_ BitVec 32))

(declare-fun mapValue!32210 () ValueCell!9662)

(declare-fun mapRest!32210 () (Array (_ BitVec 32) ValueCell!9662))

(assert (=> mapNonEmpty!32210 (= (arr!27179 (_values!5551 thiss!1141)) (store mapRest!32210 mapKey!32210 mapValue!32210))))

(declare-fun e!527573 () Bool)

(declare-fun tp_is_empty!20287 () Bool)

(declare-fun array_inv!21204 (array!56483) Bool)

(declare-fun array_inv!21205 (array!56481) Bool)

(assert (=> b!939291 (= e!527572 (and tp!61801 tp_is_empty!20287 (array_inv!21204 (_keys!10371 thiss!1141)) (array_inv!21205 (_values!5551 thiss!1141)) e!527573))))

(declare-fun b!939292 () Bool)

(declare-fun e!527574 () Bool)

(assert (=> b!939292 (= e!527573 (and e!527574 mapRes!32210))))

(declare-fun condMapEmpty!32210 () Bool)

(declare-fun mapDefault!32210 () ValueCell!9662)

(assert (=> b!939292 (= condMapEmpty!32210 (= (arr!27179 (_values!5551 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9662)) mapDefault!32210)))))

(declare-fun b!939293 () Bool)

(assert (=> b!939293 (= e!527575 tp_is_empty!20287)))

(declare-fun b!939294 () Bool)

(assert (=> b!939294 (= e!527574 tp_is_empty!20287)))

(assert (= (and b!939292 condMapEmpty!32210) mapIsEmpty!32210))

(assert (= (and b!939292 (not condMapEmpty!32210)) mapNonEmpty!32210))

(get-info :version)

(assert (= (and mapNonEmpty!32210 ((_ is ValueCellFull!9662) mapValue!32210)) b!939293))

(assert (= (and b!939292 ((_ is ValueCellFull!9662) mapDefault!32210)) b!939294))

(assert (= b!939291 b!939292))

(assert (= start!79864 b!939291))

(declare-fun m!874617 () Bool)

(assert (=> start!79864 m!874617))

(declare-fun m!874619 () Bool)

(assert (=> mapNonEmpty!32210 m!874619))

(declare-fun m!874621 () Bool)

(assert (=> b!939291 m!874621))

(declare-fun m!874623 () Bool)

(assert (=> b!939291 m!874623))

(check-sat b_and!29165 (not b_next!17779) (not mapNonEmpty!32210) (not b!939291) (not start!79864) tp_is_empty!20287)
(check-sat b_and!29165 (not b_next!17779))
