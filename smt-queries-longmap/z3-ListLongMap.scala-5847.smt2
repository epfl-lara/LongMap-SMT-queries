; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75558 () Bool)

(assert start!75558)

(declare-fun b!888777 () Bool)

(declare-fun b_free!15585 () Bool)

(declare-fun b_next!15585 () Bool)

(assert (=> b!888777 (= b_free!15585 (not b_next!15585))))

(declare-fun tp!54710 () Bool)

(declare-fun b_and!25825 () Bool)

(assert (=> b!888777 (= tp!54710 b_and!25825)))

(declare-fun b!888772 () Bool)

(declare-fun e!495292 () Bool)

(declare-fun tp_is_empty!17913 () Bool)

(assert (=> b!888772 (= e!495292 tp_is_empty!17913)))

(declare-fun b!888773 () Bool)

(declare-fun res!602479 () Bool)

(declare-fun e!495291 () Bool)

(assert (=> b!888773 (=> (not res!602479) (not e!495291))))

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((array!51798 0))(
  ( (array!51799 (arr!24909 (Array (_ BitVec 32) (_ BitVec 64))) (size!25351 (_ BitVec 32))) )
))
(declare-datatypes ((V!28849 0))(
  ( (V!28850 (val!9007 Int)) )
))
(declare-datatypes ((ValueCell!8475 0))(
  ( (ValueCellFull!8475 (v!11483 V!28849)) (EmptyCell!8475) )
))
(declare-datatypes ((array!51800 0))(
  ( (array!51801 (arr!24910 (Array (_ BitVec 32) ValueCell!8475)) (size!25352 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3966 0))(
  ( (LongMapFixedSize!3967 (defaultEntry!5180 Int) (mask!25610 (_ BitVec 32)) (extraKeys!4874 (_ BitVec 32)) (zeroValue!4978 V!28849) (minValue!4978 V!28849) (_size!2038 (_ BitVec 32)) (_keys!9861 array!51798) (_values!5165 array!51800) (_vacant!2038 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3966)

(assert (=> b!888773 (= res!602479 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4874 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (or (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4874 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888774 () Bool)

(assert (=> b!888774 (= e!495291 false)))

(declare-fun lt!401920 () Bool)

(declare-fun contains!4329 (LongMapFixedSize!3966 (_ BitVec 64)) Bool)

(assert (=> b!888774 (= lt!401920 (contains!4329 thiss!1181 key!785))))

(declare-fun mapIsEmpty!28410 () Bool)

(declare-fun mapRes!28410 () Bool)

(assert (=> mapIsEmpty!28410 mapRes!28410))

(declare-fun b!888775 () Bool)

(declare-fun e!495290 () Bool)

(assert (=> b!888775 (= e!495290 tp_is_empty!17913)))

(declare-fun res!602480 () Bool)

(assert (=> start!75558 (=> (not res!602480) (not e!495291))))

(declare-fun valid!1547 (LongMapFixedSize!3966) Bool)

(assert (=> start!75558 (= res!602480 (valid!1547 thiss!1181))))

(assert (=> start!75558 e!495291))

(declare-fun e!495288 () Bool)

(assert (=> start!75558 e!495288))

(assert (=> start!75558 true))

(declare-fun b!888776 () Bool)

(declare-fun e!495289 () Bool)

(assert (=> b!888776 (= e!495289 (and e!495292 mapRes!28410))))

(declare-fun condMapEmpty!28410 () Bool)

(declare-fun mapDefault!28410 () ValueCell!8475)

(assert (=> b!888776 (= condMapEmpty!28410 (= (arr!24910 (_values!5165 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8475)) mapDefault!28410)))))

(declare-fun array_inv!19600 (array!51798) Bool)

(declare-fun array_inv!19601 (array!51800) Bool)

(assert (=> b!888777 (= e!495288 (and tp!54710 tp_is_empty!17913 (array_inv!19600 (_keys!9861 thiss!1181)) (array_inv!19601 (_values!5165 thiss!1181)) e!495289))))

(declare-fun mapNonEmpty!28410 () Bool)

(declare-fun tp!54709 () Bool)

(assert (=> mapNonEmpty!28410 (= mapRes!28410 (and tp!54709 e!495290))))

(declare-fun mapValue!28410 () ValueCell!8475)

(declare-fun mapKey!28410 () (_ BitVec 32))

(declare-fun mapRest!28410 () (Array (_ BitVec 32) ValueCell!8475))

(assert (=> mapNonEmpty!28410 (= (arr!24910 (_values!5165 thiss!1181)) (store mapRest!28410 mapKey!28410 mapValue!28410))))

(assert (= (and start!75558 res!602480) b!888773))

(assert (= (and b!888773 res!602479) b!888774))

(assert (= (and b!888776 condMapEmpty!28410) mapIsEmpty!28410))

(assert (= (and b!888776 (not condMapEmpty!28410)) mapNonEmpty!28410))

(get-info :version)

(assert (= (and mapNonEmpty!28410 ((_ is ValueCellFull!8475) mapValue!28410)) b!888775))

(assert (= (and b!888776 ((_ is ValueCellFull!8475) mapDefault!28410)) b!888772))

(assert (= b!888777 b!888776))

(assert (= start!75558 b!888777))

(declare-fun m!827983 () Bool)

(assert (=> b!888774 m!827983))

(declare-fun m!827985 () Bool)

(assert (=> start!75558 m!827985))

(declare-fun m!827987 () Bool)

(assert (=> b!888777 m!827987))

(declare-fun m!827989 () Bool)

(assert (=> b!888777 m!827989))

(declare-fun m!827991 () Bool)

(assert (=> mapNonEmpty!28410 m!827991))

(check-sat (not mapNonEmpty!28410) (not b!888777) tp_is_empty!17913 (not b_next!15585) (not start!75558) b_and!25825 (not b!888774))
(check-sat b_and!25825 (not b_next!15585))
