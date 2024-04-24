; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89298 () Bool)

(assert start!89298)

(declare-fun b!1022493 () Bool)

(declare-fun b_free!20125 () Bool)

(declare-fun b_next!20125 () Bool)

(assert (=> b!1022493 (= b_free!20125 (not b_next!20125))))

(declare-fun tp!71404 () Bool)

(declare-fun b_and!32323 () Bool)

(assert (=> b!1022493 (= tp!71404 b_and!32323)))

(declare-fun b!1022492 () Bool)

(declare-fun e!575895 () Bool)

(declare-fun e!575899 () Bool)

(declare-fun mapRes!37179 () Bool)

(assert (=> b!1022492 (= e!575895 (and e!575899 mapRes!37179))))

(declare-fun condMapEmpty!37179 () Bool)

(declare-datatypes ((V!36667 0))(
  ( (V!36668 (val!11973 Int)) )
))
(declare-datatypes ((array!63779 0))(
  ( (array!63780 (arr!30697 (Array (_ BitVec 32) (_ BitVec 64))) (size!31209 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11219 0))(
  ( (ValueCellFull!11219 (v!14529 V!36667)) (EmptyCell!11219) )
))
(declare-datatypes ((array!63781 0))(
  ( (array!63782 (arr!30698 (Array (_ BitVec 32) ValueCell!11219)) (size!31210 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5032 0))(
  ( (LongMapFixedSize!5033 (defaultEntry!5868 Int) (mask!29493 (_ BitVec 32)) (extraKeys!5600 (_ BitVec 32)) (zeroValue!5704 V!36667) (minValue!5704 V!36667) (_size!2571 (_ BitVec 32)) (_keys!11051 array!63779) (_values!5891 array!63781) (_vacant!2571 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1106 0))(
  ( (Cell!1107 (v!14530 LongMapFixedSize!5032)) )
))
(declare-datatypes ((LongMap!1106 0))(
  ( (LongMap!1107 (underlying!564 Cell!1106)) )
))
(declare-fun thiss!908 () LongMap!1106)

(declare-fun mapDefault!37179 () ValueCell!11219)

(assert (=> b!1022492 (= condMapEmpty!37179 (= (arr!30698 (_values!5891 (v!14530 (underlying!564 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11219)) mapDefault!37179)))))

(declare-fun tp_is_empty!23845 () Bool)

(declare-fun e!575897 () Bool)

(declare-fun array_inv!23825 (array!63779) Bool)

(declare-fun array_inv!23826 (array!63781) Bool)

(assert (=> b!1022493 (= e!575897 (and tp!71404 tp_is_empty!23845 (array_inv!23825 (_keys!11051 (v!14530 (underlying!564 thiss!908)))) (array_inv!23826 (_values!5891 (v!14530 (underlying!564 thiss!908)))) e!575895))))

(declare-fun b!1022494 () Bool)

(declare-fun e!575900 () Bool)

(assert (=> b!1022494 (= e!575900 e!575897)))

(declare-fun b!1022495 () Bool)

(assert (=> b!1022495 (= e!575899 tp_is_empty!23845)))

(declare-fun res!684851 () Bool)

(declare-fun e!575898 () Bool)

(assert (=> start!89298 (=> (not res!684851) (not e!575898))))

(declare-fun valid!1923 (LongMap!1106) Bool)

(assert (=> start!89298 (= res!684851 (valid!1923 thiss!908))))

(assert (=> start!89298 e!575898))

(declare-fun e!575894 () Bool)

(assert (=> start!89298 e!575894))

(assert (=> start!89298 true))

(declare-fun mapIsEmpty!37179 () Bool)

(assert (=> mapIsEmpty!37179 mapRes!37179))

(declare-fun b!1022496 () Bool)

(assert (=> b!1022496 (= e!575894 e!575900)))

(declare-fun mapNonEmpty!37179 () Bool)

(declare-fun tp!71403 () Bool)

(declare-fun e!575896 () Bool)

(assert (=> mapNonEmpty!37179 (= mapRes!37179 (and tp!71403 e!575896))))

(declare-fun mapRest!37179 () (Array (_ BitVec 32) ValueCell!11219))

(declare-fun mapKey!37179 () (_ BitVec 32))

(declare-fun mapValue!37179 () ValueCell!11219)

(assert (=> mapNonEmpty!37179 (= (arr!30698 (_values!5891 (v!14530 (underlying!564 thiss!908)))) (store mapRest!37179 mapKey!37179 mapValue!37179))))

(declare-fun b!1022497 () Bool)

(assert (=> b!1022497 (= e!575898 false)))

(declare-fun lt!450506 () Bool)

(declare-fun key!697 () (_ BitVec 64))

(declare-datatypes ((tuple2!15484 0))(
  ( (tuple2!15485 (_1!7753 Bool) (_2!7753 LongMapFixedSize!5032)) )
))
(declare-fun remove!8 (LongMapFixedSize!5032 (_ BitVec 64)) tuple2!15484)

(assert (=> b!1022497 (= lt!450506 (valid!1923 (LongMap!1107 (Cell!1107 (_2!7753 (remove!8 (v!14530 (underlying!564 thiss!908)) key!697))))))))

(declare-fun b!1022498 () Bool)

(assert (=> b!1022498 (= e!575896 tp_is_empty!23845)))

(assert (= (and start!89298 res!684851) b!1022497))

(assert (= (and b!1022492 condMapEmpty!37179) mapIsEmpty!37179))

(assert (= (and b!1022492 (not condMapEmpty!37179)) mapNonEmpty!37179))

(get-info :version)

(assert (= (and mapNonEmpty!37179 ((_ is ValueCellFull!11219) mapValue!37179)) b!1022498))

(assert (= (and b!1022492 ((_ is ValueCellFull!11219) mapDefault!37179)) b!1022495))

(assert (= b!1022493 b!1022492))

(assert (= b!1022494 b!1022493))

(assert (= b!1022496 b!1022494))

(assert (= start!89298 b!1022496))

(declare-fun m!942445 () Bool)

(assert (=> b!1022493 m!942445))

(declare-fun m!942447 () Bool)

(assert (=> b!1022493 m!942447))

(declare-fun m!942449 () Bool)

(assert (=> start!89298 m!942449))

(declare-fun m!942451 () Bool)

(assert (=> mapNonEmpty!37179 m!942451))

(declare-fun m!942453 () Bool)

(assert (=> b!1022497 m!942453))

(declare-fun m!942455 () Bool)

(assert (=> b!1022497 m!942455))

(check-sat (not b_next!20125) (not b!1022497) tp_is_empty!23845 b_and!32323 (not start!89298) (not b!1022493) (not mapNonEmpty!37179))
(check-sat b_and!32323 (not b_next!20125))
