; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15464 () Bool)

(assert start!15464)

(declare-fun b!153823 () Bool)

(declare-fun b_free!3213 () Bool)

(declare-fun b_next!3213 () Bool)

(assert (=> b!153823 (= b_free!3213 (not b_next!3213))))

(declare-fun tp!12155 () Bool)

(declare-fun b_and!9575 () Bool)

(assert (=> b!153823 (= tp!12155 b_and!9575)))

(declare-fun b!153826 () Bool)

(declare-fun b_free!3215 () Bool)

(declare-fun b_next!3215 () Bool)

(assert (=> b!153826 (= b_free!3215 (not b_next!3215))))

(declare-fun tp!12156 () Bool)

(declare-fun b_and!9577 () Bool)

(assert (=> b!153826 (= tp!12156 b_and!9577)))

(declare-fun b!153812 () Bool)

(declare-fun e!100496 () Bool)

(declare-fun e!100489 () Bool)

(assert (=> b!153812 (= e!100496 e!100489)))

(declare-fun b!153813 () Bool)

(declare-fun e!100491 () Bool)

(declare-fun tp_is_empty!3023 () Bool)

(assert (=> b!153813 (= e!100491 tp_is_empty!3023)))

(declare-fun mapIsEmpty!5155 () Bool)

(declare-fun mapRes!5155 () Bool)

(assert (=> mapIsEmpty!5155 mapRes!5155))

(declare-fun b!153814 () Bool)

(declare-fun res!72673 () Bool)

(declare-fun e!100482 () Bool)

(assert (=> b!153814 (=> (not res!72673) (not e!100482))))

(declare-datatypes ((V!3677 0))(
  ( (V!3678 (val!1556 Int)) )
))
(declare-datatypes ((array!5095 0))(
  ( (array!5096 (arr!2407 (Array (_ BitVec 32) (_ BitVec 64))) (size!2684 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1168 0))(
  ( (ValueCellFull!1168 (v!3414 V!3677)) (EmptyCell!1168) )
))
(declare-datatypes ((array!5097 0))(
  ( (array!5098 (arr!2408 (Array (_ BitVec 32) ValueCell!1168)) (size!2685 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1244 0))(
  ( (LongMapFixedSize!1245 (defaultEntry!3061 Int) (mask!7463 (_ BitVec 32)) (extraKeys!2802 (_ BitVec 32)) (zeroValue!2904 V!3677) (minValue!2904 V!3677) (_size!671 (_ BitVec 32)) (_keys!4834 array!5095) (_values!3044 array!5097) (_vacant!671 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1244)

(declare-datatypes ((Cell!1026 0))(
  ( (Cell!1027 (v!3415 LongMapFixedSize!1244)) )
))
(declare-datatypes ((LongMap!1026 0))(
  ( (LongMap!1027 (underlying!524 Cell!1026)) )
))
(declare-fun thiss!992 () LongMap!1026)

(assert (=> b!153814 (= res!72673 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7463 newMap!16)) (_size!671 (v!3415 (underlying!524 thiss!992)))))))

(declare-fun mapNonEmpty!5155 () Bool)

(declare-fun mapRes!5156 () Bool)

(declare-fun tp!12158 () Bool)

(assert (=> mapNonEmpty!5155 (= mapRes!5156 (and tp!12158 e!100491))))

(declare-fun mapValue!5156 () ValueCell!1168)

(declare-fun mapKey!5156 () (_ BitVec 32))

(declare-fun mapRest!5155 () (Array (_ BitVec 32) ValueCell!1168))

(assert (=> mapNonEmpty!5155 (= (arr!2408 (_values!3044 (v!3415 (underlying!524 thiss!992)))) (store mapRest!5155 mapKey!5156 mapValue!5156))))

(declare-fun res!72672 () Bool)

(assert (=> start!15464 (=> (not res!72672) (not e!100482))))

(declare-fun valid!614 (LongMap!1026) Bool)

(assert (=> start!15464 (= res!72672 (valid!614 thiss!992))))

(assert (=> start!15464 e!100482))

(assert (=> start!15464 e!100496))

(assert (=> start!15464 true))

(declare-fun e!100485 () Bool)

(assert (=> start!15464 e!100485))

(declare-fun b!153815 () Bool)

(declare-fun e!100483 () Bool)

(declare-fun e!100493 () Bool)

(assert (=> b!153815 (= e!100483 e!100493)))

(declare-fun res!72671 () Bool)

(assert (=> b!153815 (=> res!72671 e!100493)))

(declare-datatypes ((tuple2!2826 0))(
  ( (tuple2!2827 (_1!1424 Bool) (_2!1424 LongMapFixedSize!1244)) )
))
(declare-fun lt!80676 () tuple2!2826)

(declare-fun valid!615 (LongMapFixedSize!1244) Bool)

(assert (=> b!153815 (= res!72671 (not (valid!615 (_2!1424 lt!80676))))))

(declare-fun b!153816 () Bool)

(assert (=> b!153816 (= e!100482 e!100483)))

(declare-fun res!72676 () Bool)

(assert (=> b!153816 (=> (not res!72676) (not e!100483))))

(assert (=> b!153816 (= res!72676 (_1!1424 lt!80676))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun repackFrom!20 (LongMap!1026 LongMapFixedSize!1244 (_ BitVec 32)) tuple2!2826)

(assert (=> b!153816 (= lt!80676 (repackFrom!20 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!153817 () Bool)

(declare-fun e!100488 () Bool)

(assert (=> b!153817 (= e!100488 tp_is_empty!3023)))

(declare-fun mapNonEmpty!5156 () Bool)

(declare-fun tp!12157 () Bool)

(assert (=> mapNonEmpty!5156 (= mapRes!5155 (and tp!12157 e!100488))))

(declare-fun mapValue!5155 () ValueCell!1168)

(declare-fun mapKey!5155 () (_ BitVec 32))

(declare-fun mapRest!5156 () (Array (_ BitVec 32) ValueCell!1168))

(assert (=> mapNonEmpty!5156 (= (arr!2408 (_values!3044 newMap!16)) (store mapRest!5156 mapKey!5155 mapValue!5155))))

(declare-fun b!153818 () Bool)

(declare-datatypes ((tuple2!2828 0))(
  ( (tuple2!2829 (_1!1425 (_ BitVec 64)) (_2!1425 V!3677)) )
))
(declare-datatypes ((List!1805 0))(
  ( (Nil!1802) (Cons!1801 (h!2410 tuple2!2828) (t!6595 List!1805)) )
))
(declare-datatypes ((ListLongMap!1815 0))(
  ( (ListLongMap!1816 (toList!923 List!1805)) )
))
(declare-fun map!1500 (LongMapFixedSize!1244) ListLongMap!1815)

(assert (=> b!153818 (= e!100493 (not (= (map!1500 (_2!1424 lt!80676)) (map!1500 (v!3415 (underlying!524 thiss!992))))))))

(declare-fun b!153819 () Bool)

(declare-fun e!100495 () Bool)

(declare-fun e!100494 () Bool)

(assert (=> b!153819 (= e!100495 (and e!100494 mapRes!5156))))

(declare-fun condMapEmpty!5155 () Bool)

(declare-fun mapDefault!5156 () ValueCell!1168)

