; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3014 () Bool)

(assert start!3014)

(declare-fun b!17774 () Bool)

(declare-fun b_free!625 () Bool)

(declare-fun b_next!625 () Bool)

(assert (=> b!17774 (= b_free!625 (not b_next!625))))

(declare-fun tp!3066 () Bool)

(declare-fun b_and!1267 () Bool)

(assert (=> b!17774 (= tp!3066 b_and!1267)))

(declare-fun b!17766 () Bool)

(declare-datatypes ((V!1011 0))(
  ( (V!1012 (val!471 Int)) )
))
(declare-datatypes ((ValueCell!245 0))(
  ( (ValueCellFull!245 (v!1446 V!1011)) (EmptyCell!245) )
))
(declare-datatypes ((array!965 0))(
  ( (array!966 (arr!464 (Array (_ BitVec 32) ValueCell!245)) (size!554 (_ BitVec 32))) )
))
(declare-datatypes ((array!967 0))(
  ( (array!968 (arr!465 (Array (_ BitVec 32) (_ BitVec 64))) (size!555 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!76 0))(
  ( (LongMapFixedSize!77 (defaultEntry!1649 Int) (mask!4574 (_ BitVec 32)) (extraKeys!1562 (_ BitVec 32)) (zeroValue!1585 V!1011) (minValue!1585 V!1011) (_size!70 (_ BitVec 32)) (_keys!3074 array!967) (_values!1646 array!965) (_vacant!70 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!76 0))(
  ( (Cell!77 (v!1447 LongMapFixedSize!76)) )
))
(declare-datatypes ((LongMap!76 0))(
  ( (LongMap!77 (underlying!49 Cell!76)) )
))
(declare-datatypes ((tuple2!768 0))(
  ( (tuple2!769 (_1!385 Bool) (_2!385 LongMap!76)) )
))
(declare-fun e!11259 () tuple2!768)

(declare-fun thiss!848 () LongMap!76)

(declare-fun repack!14 (LongMap!76) tuple2!768)

(assert (=> b!17766 (= e!11259 (repack!14 thiss!848))))

(declare-fun b!17767 () Bool)

(declare-fun e!11264 () Bool)

(assert (=> b!17767 (= e!11264 false)))

(declare-fun lt!4617 () Bool)

(declare-fun lt!4618 () tuple2!768)

(declare-fun valid!44 (LongMap!76) Bool)

(assert (=> b!17767 (= lt!4617 (valid!44 (_2!385 lt!4618)))))

(declare-fun b!17768 () Bool)

(declare-fun e!11258 () Bool)

(declare-fun tp_is_empty!889 () Bool)

(assert (=> b!17768 (= e!11258 tp_is_empty!889)))

(declare-fun b!17769 () Bool)

(assert (=> b!17769 (= e!11259 (tuple2!769 true thiss!848))))

(declare-fun b!17770 () Bool)

(declare-fun e!11256 () Bool)

(assert (=> b!17770 (= e!11256 tp_is_empty!889)))

(declare-fun b!17771 () Bool)

(declare-fun e!11263 () Bool)

(declare-fun e!11255 () Bool)

(assert (=> b!17771 (= e!11263 e!11255)))

(declare-fun mapNonEmpty!768 () Bool)

(declare-fun mapRes!768 () Bool)

(declare-fun tp!3065 () Bool)

(assert (=> mapNonEmpty!768 (= mapRes!768 (and tp!3065 e!11256))))

(declare-fun mapRest!768 () (Array (_ BitVec 32) ValueCell!245))

(declare-fun mapKey!768 () (_ BitVec 32))

(declare-fun mapValue!768 () ValueCell!245)

(assert (=> mapNonEmpty!768 (= (arr!464 (_values!1646 (v!1447 (underlying!49 thiss!848)))) (store mapRest!768 mapKey!768 mapValue!768))))

(declare-fun res!12648 () Bool)

(declare-fun e!11261 () Bool)

(assert (=> start!3014 (=> (not res!12648) (not e!11261))))

(assert (=> start!3014 (= res!12648 (valid!44 thiss!848))))

(assert (=> start!3014 e!11261))

(declare-fun e!11262 () Bool)

(assert (=> start!3014 e!11262))

(declare-fun b!17772 () Bool)

(assert (=> b!17772 (= e!11262 e!11263)))

(declare-fun mapIsEmpty!768 () Bool)

(assert (=> mapIsEmpty!768 mapRes!768))

(declare-fun b!17773 () Bool)

(declare-fun e!11260 () Bool)

(assert (=> b!17773 (= e!11260 (and e!11258 mapRes!768))))

(declare-fun condMapEmpty!768 () Bool)

(declare-fun mapDefault!768 () ValueCell!245)

(assert (=> b!17773 (= condMapEmpty!768 (= (arr!464 (_values!1646 (v!1447 (underlying!49 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!245)) mapDefault!768)))))

(declare-fun array_inv!335 (array!967) Bool)

(declare-fun array_inv!336 (array!965) Bool)

(assert (=> b!17774 (= e!11255 (and tp!3066 tp_is_empty!889 (array_inv!335 (_keys!3074 (v!1447 (underlying!49 thiss!848)))) (array_inv!336 (_values!1646 (v!1447 (underlying!49 thiss!848)))) e!11260))))

(declare-fun b!17775 () Bool)

(assert (=> b!17775 (= e!11261 e!11264)))

(declare-fun res!12647 () Bool)

(assert (=> b!17775 (=> (not res!12647) (not e!11264))))

(assert (=> b!17775 (= res!12647 (not (_1!385 lt!4618)))))

(assert (=> b!17775 (= lt!4618 e!11259)))

(declare-fun c!1776 () Bool)

(declare-fun imbalanced!18 (LongMap!76) Bool)

(assert (=> b!17775 (= c!1776 (imbalanced!18 thiss!848))))

(assert (= (and start!3014 res!12648) b!17775))

(assert (= (and b!17775 c!1776) b!17766))

(assert (= (and b!17775 (not c!1776)) b!17769))

(assert (= (and b!17775 res!12647) b!17767))

(assert (= (and b!17773 condMapEmpty!768) mapIsEmpty!768))

(assert (= (and b!17773 (not condMapEmpty!768)) mapNonEmpty!768))

(get-info :version)

(assert (= (and mapNonEmpty!768 ((_ is ValueCellFull!245) mapValue!768)) b!17770))

(assert (= (and b!17773 ((_ is ValueCellFull!245) mapDefault!768)) b!17768))

(assert (= b!17774 b!17773))

(assert (= b!17771 b!17774))

(assert (= b!17772 b!17771))

(assert (= start!3014 b!17772))

(declare-fun m!12423 () Bool)

(assert (=> b!17774 m!12423))

(declare-fun m!12425 () Bool)

(assert (=> b!17774 m!12425))

(declare-fun m!12427 () Bool)

(assert (=> b!17767 m!12427))

(declare-fun m!12429 () Bool)

(assert (=> mapNonEmpty!768 m!12429))

(declare-fun m!12431 () Bool)

(assert (=> b!17775 m!12431))

(declare-fun m!12433 () Bool)

(assert (=> b!17766 m!12433))

(declare-fun m!12435 () Bool)

(assert (=> start!3014 m!12435))

(check-sat (not b!17767) b_and!1267 (not b!17774) (not b!17766) (not b_next!625) tp_is_empty!889 (not start!3014) (not b!17775) (not mapNonEmpty!768))
(check-sat b_and!1267 (not b_next!625))
