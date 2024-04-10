; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14100 () Bool)

(assert start!14100)

(declare-fun b!130845 () Bool)

(declare-fun b_free!2901 () Bool)

(declare-fun b_next!2901 () Bool)

(assert (=> b!130845 (= b_free!2901 (not b_next!2901))))

(declare-fun tp!11136 () Bool)

(declare-fun b_and!8107 () Bool)

(assert (=> b!130845 (= tp!11136 b_and!8107)))

(declare-fun b!130833 () Bool)

(declare-fun b_free!2903 () Bool)

(declare-fun b_next!2903 () Bool)

(assert (=> b!130833 (= b_free!2903 (not b_next!2903))))

(declare-fun tp!11135 () Bool)

(declare-fun b_and!8109 () Bool)

(assert (=> b!130833 (= tp!11135 b_and!8109)))

(declare-fun mapNonEmpty!4601 () Bool)

(declare-fun mapRes!4602 () Bool)

(declare-fun tp!11134 () Bool)

(declare-fun e!85368 () Bool)

(assert (=> mapNonEmpty!4601 (= mapRes!4602 (and tp!11134 e!85368))))

(declare-fun mapKey!4602 () (_ BitVec 32))

(declare-datatypes ((V!3469 0))(
  ( (V!3470 (val!1478 Int)) )
))
(declare-datatypes ((array!4757 0))(
  ( (array!4758 (arr!2251 (Array (_ BitVec 32) (_ BitVec 64))) (size!2518 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1090 0))(
  ( (ValueCellFull!1090 (v!3178 V!3469)) (EmptyCell!1090) )
))
(declare-datatypes ((array!4759 0))(
  ( (array!4760 (arr!2252 (Array (_ BitVec 32) ValueCell!1090)) (size!2519 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1088 0))(
  ( (LongMapFixedSize!1089 (defaultEntry!2844 Int) (mask!7132 (_ BitVec 32)) (extraKeys!2613 (_ BitVec 32)) (zeroValue!2701 V!3469) (minValue!2701 V!3469) (_size!593 (_ BitVec 32)) (_keys!4589 array!4757) (_values!2827 array!4759) (_vacant!593 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1088)

(declare-fun mapRest!4601 () (Array (_ BitVec 32) ValueCell!1090))

(declare-fun mapValue!4601 () ValueCell!1090)

(assert (=> mapNonEmpty!4601 (= (arr!2252 (_values!2827 newMap!16)) (store mapRest!4601 mapKey!4602 mapValue!4601))))

(declare-fun b!130829 () Bool)

(declare-fun e!85366 () Bool)

(declare-fun tp_is_empty!2867 () Bool)

(assert (=> b!130829 (= e!85366 tp_is_empty!2867)))

(declare-fun b!130830 () Bool)

(declare-fun e!85365 () Bool)

(assert (=> b!130830 (= e!85365 tp_is_empty!2867)))

(declare-fun mapNonEmpty!4602 () Bool)

(declare-fun mapRes!4601 () Bool)

(declare-fun tp!11133 () Bool)

(assert (=> mapNonEmpty!4602 (= mapRes!4601 (and tp!11133 e!85366))))

(declare-datatypes ((Cell!880 0))(
  ( (Cell!881 (v!3179 LongMapFixedSize!1088)) )
))
(declare-datatypes ((LongMap!880 0))(
  ( (LongMap!881 (underlying!451 Cell!880)) )
))
(declare-fun thiss!992 () LongMap!880)

(declare-fun mapValue!4602 () ValueCell!1090)

(declare-fun mapRest!4602 () (Array (_ BitVec 32) ValueCell!1090))

(declare-fun mapKey!4601 () (_ BitVec 32))

(assert (=> mapNonEmpty!4602 (= (arr!2252 (_values!2827 (v!3179 (underlying!451 thiss!992)))) (store mapRest!4602 mapKey!4601 mapValue!4602))))

(declare-fun mapIsEmpty!4601 () Bool)

(assert (=> mapIsEmpty!4601 mapRes!4602))

(declare-fun b!130831 () Bool)

(declare-fun e!85356 () Bool)

(declare-fun e!85363 () Bool)

(assert (=> b!130831 (= e!85356 e!85363)))

(declare-fun b!130832 () Bool)

(assert (=> b!130832 (= e!85368 tp_is_empty!2867)))

(declare-fun mapIsEmpty!4602 () Bool)

(assert (=> mapIsEmpty!4602 mapRes!4601))

(declare-fun e!85367 () Bool)

(declare-fun e!85357 () Bool)

(declare-fun array_inv!1417 (array!4757) Bool)

(declare-fun array_inv!1418 (array!4759) Bool)

(assert (=> b!130833 (= e!85367 (and tp!11135 tp_is_empty!2867 (array_inv!1417 (_keys!4589 newMap!16)) (array_inv!1418 (_values!2827 newMap!16)) e!85357))))

(declare-fun b!130834 () Bool)

(declare-fun res!63074 () Bool)

(declare-fun e!85359 () Bool)

(assert (=> b!130834 (=> (not res!63074) (not e!85359))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!130834 (= res!63074 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2518 (_keys!4589 (v!3179 (underlying!451 thiss!992)))))))))

(declare-fun b!130835 () Bool)

(declare-fun res!63072 () Bool)

(assert (=> b!130835 (=> (not res!63072) (not e!85359))))

(assert (=> b!130835 (= res!63072 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7132 newMap!16)) (_size!593 (v!3179 (underlying!451 thiss!992)))))))

(declare-fun res!63075 () Bool)

(assert (=> start!14100 (=> (not res!63075) (not e!85359))))

(declare-fun valid!518 (LongMap!880) Bool)

(assert (=> start!14100 (= res!63075 (valid!518 thiss!992))))

(assert (=> start!14100 e!85359))

(assert (=> start!14100 e!85356))

(assert (=> start!14100 true))

(assert (=> start!14100 e!85367))

(declare-fun b!130836 () Bool)

(declare-fun e!85362 () Bool)

(assert (=> b!130836 (= e!85363 e!85362)))

(declare-fun b!130837 () Bool)

(declare-fun e!85361 () Bool)

(assert (=> b!130837 (= e!85359 e!85361)))

(declare-fun res!63076 () Bool)

(assert (=> b!130837 (=> (not res!63076) (not e!85361))))

(declare-datatypes ((tuple2!2616 0))(
  ( (tuple2!2617 (_1!1319 (_ BitVec 64)) (_2!1319 V!3469)) )
))
(declare-datatypes ((List!1711 0))(
  ( (Nil!1708) (Cons!1707 (h!2312 tuple2!2616) (t!6134 List!1711)) )
))
(declare-datatypes ((ListLongMap!1701 0))(
  ( (ListLongMap!1702 (toList!866 List!1711)) )
))
(declare-fun lt!68031 () ListLongMap!1701)

(declare-fun lt!68029 () ListLongMap!1701)

(assert (=> b!130837 (= res!63076 (and (= lt!68029 lt!68031) (not (= (select (arr!2251 (_keys!4589 (v!3179 (underlying!451 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2251 (_keys!4589 (v!3179 (underlying!451 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1402 (LongMapFixedSize!1088) ListLongMap!1701)

(assert (=> b!130837 (= lt!68031 (map!1402 newMap!16))))

(declare-fun getCurrentListMap!543 (array!4757 array!4759 (_ BitVec 32) (_ BitVec 32) V!3469 V!3469 (_ BitVec 32) Int) ListLongMap!1701)

(assert (=> b!130837 (= lt!68029 (getCurrentListMap!543 (_keys!4589 (v!3179 (underlying!451 thiss!992))) (_values!2827 (v!3179 (underlying!451 thiss!992))) (mask!7132 (v!3179 (underlying!451 thiss!992))) (extraKeys!2613 (v!3179 (underlying!451 thiss!992))) (zeroValue!2701 (v!3179 (underlying!451 thiss!992))) (minValue!2701 (v!3179 (underlying!451 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2844 (v!3179 (underlying!451 thiss!992)))))))

(declare-fun b!130838 () Bool)

(declare-fun res!63073 () Bool)

(declare-fun e!85358 () Bool)

(assert (=> b!130838 (=> (not res!63073) (not e!85358))))

(assert (=> b!130838 (= res!63073 (and (= (size!2519 (_values!2827 (v!3179 (underlying!451 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7132 (v!3179 (underlying!451 thiss!992))))) (= (size!2518 (_keys!4589 (v!3179 (underlying!451 thiss!992)))) (size!2519 (_values!2827 (v!3179 (underlying!451 thiss!992))))) (bvsge (mask!7132 (v!3179 (underlying!451 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2613 (v!3179 (underlying!451 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2613 (v!3179 (underlying!451 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!130839 () Bool)

(declare-fun e!85364 () Bool)

(assert (=> b!130839 (= e!85357 (and e!85364 mapRes!4602))))

(declare-fun condMapEmpty!4602 () Bool)

(declare-fun mapDefault!4602 () ValueCell!1090)

