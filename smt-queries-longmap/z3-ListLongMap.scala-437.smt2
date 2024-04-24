; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8238 () Bool)

(assert start!8238)

(declare-fun b!52132 () Bool)

(declare-fun b_free!1633 () Bool)

(declare-fun b_next!1633 () Bool)

(assert (=> b!52132 (= b_free!1633 (not b_next!1633))))

(declare-fun tp!7001 () Bool)

(declare-fun b_and!2841 () Bool)

(assert (=> b!52132 (= tp!7001 b_and!2841)))

(declare-fun b!52128 () Bool)

(declare-fun b_free!1635 () Bool)

(declare-fun b_next!1635 () Bool)

(assert (=> b!52128 (= b_free!1635 (not b_next!1635))))

(declare-fun tp!6999 () Bool)

(declare-fun b_and!2843 () Bool)

(assert (=> b!52128 (= tp!6999 b_and!2843)))

(declare-fun b!52125 () Bool)

(declare-fun e!33868 () Bool)

(declare-fun tp_is_empty!2233 () Bool)

(assert (=> b!52125 (= e!33868 tp_is_empty!2233)))

(declare-fun b!52126 () Bool)

(declare-fun e!33857 () Bool)

(assert (=> b!52126 (= e!33857 tp_is_empty!2233)))

(declare-fun b!52127 () Bool)

(declare-fun e!33866 () Bool)

(declare-fun e!33867 () Bool)

(assert (=> b!52127 (= e!33866 e!33867)))

(declare-fun e!33856 () Bool)

(declare-fun e!33864 () Bool)

(declare-datatypes ((V!2625 0))(
  ( (V!2626 (val!1161 Int)) )
))
(declare-datatypes ((array!3375 0))(
  ( (array!3376 (arr!1610 (Array (_ BitVec 32) (_ BitVec 64))) (size!1839 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!773 0))(
  ( (ValueCellFull!773 (v!2211 V!2625)) (EmptyCell!773) )
))
(declare-datatypes ((array!3377 0))(
  ( (array!3378 (arr!1611 (Array (_ BitVec 32) ValueCell!773)) (size!1840 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!454 0))(
  ( (LongMapFixedSize!455 (defaultEntry!1941 Int) (mask!5762 (_ BitVec 32)) (extraKeys!1832 (_ BitVec 32)) (zeroValue!1859 V!2625) (minValue!1859 V!2625) (_size!276 (_ BitVec 32)) (_keys!3561 array!3375) (_values!1924 array!3377) (_vacant!276 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!454)

(declare-fun array_inv!971 (array!3375) Bool)

(declare-fun array_inv!972 (array!3377) Bool)

(assert (=> b!52128 (= e!33856 (and tp!6999 tp_is_empty!2233 (array_inv!971 (_keys!3561 newMap!16)) (array_inv!972 (_values!1924 newMap!16)) e!33864))))

(declare-fun b!52129 () Bool)

(declare-fun e!33861 () Bool)

(declare-fun mapRes!2370 () Bool)

(assert (=> b!52129 (= e!33861 (and e!33857 mapRes!2370))))

(declare-fun condMapEmpty!2370 () Bool)

(declare-datatypes ((Cell!274 0))(
  ( (Cell!275 (v!2212 LongMapFixedSize!454)) )
))
(declare-datatypes ((LongMap!274 0))(
  ( (LongMap!275 (underlying!148 Cell!274)) )
))
(declare-fun thiss!992 () LongMap!274)

(declare-fun mapDefault!2369 () ValueCell!773)

(assert (=> b!52129 (= condMapEmpty!2370 (= (arr!1611 (_values!1924 (v!2212 (underlying!148 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!773)) mapDefault!2369)))))

(declare-fun b!52130 () Bool)

(declare-fun e!33863 () Bool)

(assert (=> b!52130 (= e!33863 false)))

(declare-fun lt!21209 () Bool)

(declare-fun valid!171 (LongMapFixedSize!454) Bool)

(assert (=> b!52130 (= lt!21209 (valid!171 newMap!16))))

(declare-fun b!52131 () Bool)

(declare-fun e!33865 () Bool)

(declare-fun mapRes!2369 () Bool)

(assert (=> b!52131 (= e!33864 (and e!33865 mapRes!2369))))

(declare-fun condMapEmpty!2369 () Bool)

(declare-fun mapDefault!2370 () ValueCell!773)

(assert (=> b!52131 (= condMapEmpty!2369 (= (arr!1611 (_values!1924 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!773)) mapDefault!2370)))))

(declare-fun mapNonEmpty!2369 () Bool)

(declare-fun tp!7000 () Bool)

(declare-fun e!33858 () Bool)

(assert (=> mapNonEmpty!2369 (= mapRes!2370 (and tp!7000 e!33858))))

(declare-fun mapRest!2369 () (Array (_ BitVec 32) ValueCell!773))

(declare-fun mapValue!2369 () ValueCell!773)

(declare-fun mapKey!2369 () (_ BitVec 32))

(assert (=> mapNonEmpty!2369 (= (arr!1611 (_values!1924 (v!2212 (underlying!148 thiss!992)))) (store mapRest!2369 mapKey!2369 mapValue!2369))))

(declare-fun e!33860 () Bool)

(assert (=> b!52132 (= e!33860 (and tp!7001 tp_is_empty!2233 (array_inv!971 (_keys!3561 (v!2212 (underlying!148 thiss!992)))) (array_inv!972 (_values!1924 (v!2212 (underlying!148 thiss!992)))) e!33861))))

(declare-fun b!52133 () Bool)

(assert (=> b!52133 (= e!33867 e!33860)))

(declare-fun mapIsEmpty!2369 () Bool)

(assert (=> mapIsEmpty!2369 mapRes!2370))

(declare-fun b!52135 () Bool)

(assert (=> b!52135 (= e!33865 tp_is_empty!2233)))

(declare-fun mapIsEmpty!2370 () Bool)

(assert (=> mapIsEmpty!2370 mapRes!2369))

(declare-fun b!52136 () Bool)

(assert (=> b!52136 (= e!33858 tp_is_empty!2233)))

(declare-fun mapNonEmpty!2370 () Bool)

(declare-fun tp!7002 () Bool)

(assert (=> mapNonEmpty!2370 (= mapRes!2369 (and tp!7002 e!33868))))

(declare-fun mapRest!2370 () (Array (_ BitVec 32) ValueCell!773))

(declare-fun mapKey!2370 () (_ BitVec 32))

(declare-fun mapValue!2370 () ValueCell!773)

(assert (=> mapNonEmpty!2370 (= (arr!1611 (_values!1924 newMap!16)) (store mapRest!2370 mapKey!2370 mapValue!2370))))

(declare-fun b!52134 () Bool)

(declare-fun res!29718 () Bool)

(assert (=> b!52134 (=> (not res!29718) (not e!33863))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!52134 (= res!29718 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1839 (_keys!3561 (v!2212 (underlying!148 thiss!992)))))))))

(declare-fun res!29719 () Bool)

(assert (=> start!8238 (=> (not res!29719) (not e!33863))))

(declare-fun valid!172 (LongMap!274) Bool)

(assert (=> start!8238 (= res!29719 (valid!172 thiss!992))))

(assert (=> start!8238 e!33863))

(assert (=> start!8238 e!33866))

(assert (=> start!8238 true))

(assert (=> start!8238 e!33856))

(assert (= (and start!8238 res!29719) b!52134))

(assert (= (and b!52134 res!29718) b!52130))

(assert (= (and b!52129 condMapEmpty!2370) mapIsEmpty!2369))

(assert (= (and b!52129 (not condMapEmpty!2370)) mapNonEmpty!2369))

(get-info :version)

(assert (= (and mapNonEmpty!2369 ((_ is ValueCellFull!773) mapValue!2369)) b!52136))

(assert (= (and b!52129 ((_ is ValueCellFull!773) mapDefault!2369)) b!52126))

(assert (= b!52132 b!52129))

(assert (= b!52133 b!52132))

(assert (= b!52127 b!52133))

(assert (= start!8238 b!52127))

(assert (= (and b!52131 condMapEmpty!2369) mapIsEmpty!2370))

(assert (= (and b!52131 (not condMapEmpty!2369)) mapNonEmpty!2370))

(assert (= (and mapNonEmpty!2370 ((_ is ValueCellFull!773) mapValue!2370)) b!52125))

(assert (= (and b!52131 ((_ is ValueCellFull!773) mapDefault!2370)) b!52135))

(assert (= b!52128 b!52131))

(assert (= start!8238 b!52128))

(declare-fun m!44593 () Bool)

(assert (=> mapNonEmpty!2370 m!44593))

(declare-fun m!44595 () Bool)

(assert (=> mapNonEmpty!2369 m!44595))

(declare-fun m!44597 () Bool)

(assert (=> b!52132 m!44597))

(declare-fun m!44599 () Bool)

(assert (=> b!52132 m!44599))

(declare-fun m!44601 () Bool)

(assert (=> b!52128 m!44601))

(declare-fun m!44603 () Bool)

(assert (=> b!52128 m!44603))

(declare-fun m!44605 () Bool)

(assert (=> b!52130 m!44605))

(declare-fun m!44607 () Bool)

(assert (=> start!8238 m!44607))

(check-sat tp_is_empty!2233 b_and!2843 (not b!52130) b_and!2841 (not b!52132) (not b_next!1635) (not start!8238) (not mapNonEmpty!2370) (not b_next!1633) (not b!52128) (not mapNonEmpty!2369))
(check-sat b_and!2841 b_and!2843 (not b_next!1633) (not b_next!1635))
