; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8238 () Bool)

(assert start!8238)

(declare-fun b!52122 () Bool)

(declare-fun b_free!1633 () Bool)

(declare-fun b_next!1633 () Bool)

(assert (=> b!52122 (= b_free!1633 (not b_next!1633))))

(declare-fun tp!6999 () Bool)

(declare-fun b_and!2845 () Bool)

(assert (=> b!52122 (= tp!6999 b_and!2845)))

(declare-fun b!52126 () Bool)

(declare-fun b_free!1635 () Bool)

(declare-fun b_next!1635 () Bool)

(assert (=> b!52126 (= b_free!1635 (not b_next!1635))))

(declare-fun tp!7002 () Bool)

(declare-fun b_and!2847 () Bool)

(assert (=> b!52126 (= tp!7002 b_and!2847)))

(declare-fun b!52117 () Bool)

(declare-fun res!29723 () Bool)

(declare-fun e!33857 () Bool)

(assert (=> b!52117 (=> (not res!29723) (not e!33857))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2625 0))(
  ( (V!2626 (val!1161 Int)) )
))
(declare-datatypes ((array!3369 0))(
  ( (array!3370 (arr!1606 (Array (_ BitVec 32) (_ BitVec 64))) (size!1836 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!773 0))(
  ( (ValueCellFull!773 (v!2209 V!2625)) (EmptyCell!773) )
))
(declare-datatypes ((array!3371 0))(
  ( (array!3372 (arr!1607 (Array (_ BitVec 32) ValueCell!773)) (size!1837 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!454 0))(
  ( (LongMapFixedSize!455 (defaultEntry!1941 Int) (mask!5761 (_ BitVec 32)) (extraKeys!1832 (_ BitVec 32)) (zeroValue!1859 V!2625) (minValue!1859 V!2625) (_size!276 (_ BitVec 32)) (_keys!3560 array!3369) (_values!1924 array!3371) (_vacant!276 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!276 0))(
  ( (Cell!277 (v!2210 LongMapFixedSize!454)) )
))
(declare-datatypes ((LongMap!276 0))(
  ( (LongMap!277 (underlying!149 Cell!276)) )
))
(declare-fun thiss!992 () LongMap!276)

(assert (=> b!52117 (= res!29723 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1836 (_keys!3560 (v!2210 (underlying!149 thiss!992)))))))))

(declare-fun b!52118 () Bool)

(declare-fun e!33856 () Bool)

(declare-fun e!33854 () Bool)

(assert (=> b!52118 (= e!33856 e!33854)))

(declare-fun b!52119 () Bool)

(declare-fun e!33859 () Bool)

(declare-fun tp_is_empty!2233 () Bool)

(assert (=> b!52119 (= e!33859 tp_is_empty!2233)))

(declare-fun mapIsEmpty!2369 () Bool)

(declare-fun mapRes!2370 () Bool)

(assert (=> mapIsEmpty!2369 mapRes!2370))

(declare-fun b!52120 () Bool)

(declare-fun e!33862 () Bool)

(assert (=> b!52120 (= e!33862 tp_is_empty!2233)))

(declare-fun b!52121 () Bool)

(declare-fun e!33852 () Bool)

(declare-fun e!33853 () Bool)

(assert (=> b!52121 (= e!33852 (and e!33853 mapRes!2370))))

(declare-fun condMapEmpty!2370 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!454)

(declare-fun mapDefault!2370 () ValueCell!773)

(assert (=> b!52121 (= condMapEmpty!2370 (= (arr!1607 (_values!1924 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!773)) mapDefault!2370)))))

(declare-fun mapIsEmpty!2370 () Bool)

(declare-fun mapRes!2369 () Bool)

(assert (=> mapIsEmpty!2370 mapRes!2369))

(declare-fun e!33861 () Bool)

(declare-fun e!33851 () Bool)

(declare-fun array_inv!983 (array!3369) Bool)

(declare-fun array_inv!984 (array!3371) Bool)

(assert (=> b!52122 (= e!33861 (and tp!6999 tp_is_empty!2233 (array_inv!983 (_keys!3560 (v!2210 (underlying!149 thiss!992)))) (array_inv!984 (_values!1924 (v!2210 (underlying!149 thiss!992)))) e!33851))))

(declare-fun b!52123 () Bool)

(assert (=> b!52123 (= e!33854 e!33861)))

(declare-fun b!52124 () Bool)

(declare-fun e!33860 () Bool)

(assert (=> b!52124 (= e!33860 tp_is_empty!2233)))

(declare-fun mapNonEmpty!2369 () Bool)

(declare-fun tp!7001 () Bool)

(assert (=> mapNonEmpty!2369 (= mapRes!2369 (and tp!7001 e!33862))))

(declare-fun mapValue!2369 () ValueCell!773)

(declare-fun mapRest!2370 () (Array (_ BitVec 32) ValueCell!773))

(declare-fun mapKey!2370 () (_ BitVec 32))

(assert (=> mapNonEmpty!2369 (= (arr!1607 (_values!1924 (v!2210 (underlying!149 thiss!992)))) (store mapRest!2370 mapKey!2370 mapValue!2369))))

(declare-fun res!29724 () Bool)

(assert (=> start!8238 (=> (not res!29724) (not e!33857))))

(declare-fun valid!170 (LongMap!276) Bool)

(assert (=> start!8238 (= res!29724 (valid!170 thiss!992))))

(assert (=> start!8238 e!33857))

(assert (=> start!8238 e!33856))

(assert (=> start!8238 true))

(declare-fun e!33850 () Bool)

(assert (=> start!8238 e!33850))

(declare-fun b!52116 () Bool)

(assert (=> b!52116 (= e!33851 (and e!33860 mapRes!2369))))

(declare-fun condMapEmpty!2369 () Bool)

(declare-fun mapDefault!2369 () ValueCell!773)

(assert (=> b!52116 (= condMapEmpty!2369 (= (arr!1607 (_values!1924 (v!2210 (underlying!149 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!773)) mapDefault!2369)))))

(declare-fun b!52125 () Bool)

(assert (=> b!52125 (= e!33853 tp_is_empty!2233)))

(assert (=> b!52126 (= e!33850 (and tp!7002 tp_is_empty!2233 (array_inv!983 (_keys!3560 newMap!16)) (array_inv!984 (_values!1924 newMap!16)) e!33852))))

(declare-fun b!52127 () Bool)

(assert (=> b!52127 (= e!33857 false)))

(declare-fun lt!21236 () Bool)

(declare-fun valid!171 (LongMapFixedSize!454) Bool)

(assert (=> b!52127 (= lt!21236 (valid!171 newMap!16))))

(declare-fun mapNonEmpty!2370 () Bool)

(declare-fun tp!7000 () Bool)

(assert (=> mapNonEmpty!2370 (= mapRes!2370 (and tp!7000 e!33859))))

(declare-fun mapRest!2369 () (Array (_ BitVec 32) ValueCell!773))

(declare-fun mapKey!2369 () (_ BitVec 32))

(declare-fun mapValue!2370 () ValueCell!773)

(assert (=> mapNonEmpty!2370 (= (arr!1607 (_values!1924 newMap!16)) (store mapRest!2369 mapKey!2369 mapValue!2370))))

(assert (= (and start!8238 res!29724) b!52117))

(assert (= (and b!52117 res!29723) b!52127))

(assert (= (and b!52116 condMapEmpty!2369) mapIsEmpty!2370))

(assert (= (and b!52116 (not condMapEmpty!2369)) mapNonEmpty!2369))

(get-info :version)

(assert (= (and mapNonEmpty!2369 ((_ is ValueCellFull!773) mapValue!2369)) b!52120))

(assert (= (and b!52116 ((_ is ValueCellFull!773) mapDefault!2369)) b!52124))

(assert (= b!52122 b!52116))

(assert (= b!52123 b!52122))

(assert (= b!52118 b!52123))

(assert (= start!8238 b!52118))

(assert (= (and b!52121 condMapEmpty!2370) mapIsEmpty!2369))

(assert (= (and b!52121 (not condMapEmpty!2370)) mapNonEmpty!2370))

(assert (= (and mapNonEmpty!2370 ((_ is ValueCellFull!773) mapValue!2370)) b!52119))

(assert (= (and b!52121 ((_ is ValueCellFull!773) mapDefault!2370)) b!52125))

(assert (= b!52126 b!52121))

(assert (= start!8238 b!52126))

(declare-fun m!44635 () Bool)

(assert (=> mapNonEmpty!2370 m!44635))

(declare-fun m!44637 () Bool)

(assert (=> b!52122 m!44637))

(declare-fun m!44639 () Bool)

(assert (=> b!52122 m!44639))

(declare-fun m!44641 () Bool)

(assert (=> mapNonEmpty!2369 m!44641))

(declare-fun m!44643 () Bool)

(assert (=> b!52127 m!44643))

(declare-fun m!44645 () Bool)

(assert (=> b!52126 m!44645))

(declare-fun m!44647 () Bool)

(assert (=> b!52126 m!44647))

(declare-fun m!44649 () Bool)

(assert (=> start!8238 m!44649))

(check-sat (not b!52126) (not mapNonEmpty!2369) (not b!52122) (not b_next!1633) (not mapNonEmpty!2370) b_and!2845 (not b_next!1635) b_and!2847 tp_is_empty!2233 (not start!8238) (not b!52127))
(check-sat b_and!2845 b_and!2847 (not b_next!1633) (not b_next!1635))
