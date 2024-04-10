; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15644 () Bool)

(assert start!15644)

(declare-fun b!155879 () Bool)

(declare-fun b_free!3311 () Bool)

(declare-fun b_next!3311 () Bool)

(assert (=> b!155879 (= b_free!3311 (not b_next!3311))))

(declare-fun tp!12457 () Bool)

(declare-fun b_and!9725 () Bool)

(assert (=> b!155879 (= tp!12457 b_and!9725)))

(declare-fun e!101881 () Bool)

(declare-fun e!101880 () Bool)

(declare-datatypes ((V!3797 0))(
  ( (V!3798 (val!1601 Int)) )
))
(declare-datatypes ((ValueCell!1213 0))(
  ( (ValueCellFull!1213 (v!3466 V!3797)) (EmptyCell!1213) )
))
(declare-datatypes ((array!5279 0))(
  ( (array!5280 (arr!2497 (Array (_ BitVec 32) (_ BitVec 64))) (size!2775 (_ BitVec 32))) )
))
(declare-datatypes ((array!5281 0))(
  ( (array!5282 (arr!2498 (Array (_ BitVec 32) ValueCell!1213)) (size!2776 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1334 0))(
  ( (LongMapFixedSize!1335 (defaultEntry!3109 Int) (mask!7544 (_ BitVec 32)) (extraKeys!2850 (_ BitVec 32)) (zeroValue!2952 V!3797) (minValue!2952 V!3797) (_size!716 (_ BitVec 32)) (_keys!4884 array!5279) (_values!3092 array!5281) (_vacant!716 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1334)

(declare-fun tp_is_empty!3113 () Bool)

(declare-fun array_inv!1577 (array!5279) Bool)

(declare-fun array_inv!1578 (array!5281) Bool)

(assert (=> b!155879 (= e!101880 (and tp!12457 tp_is_empty!3113 (array_inv!1577 (_keys!4884 thiss!1248)) (array_inv!1578 (_values!3092 thiss!1248)) e!101881))))

(declare-fun b!155880 () Bool)

(declare-fun e!101884 () Bool)

(assert (=> b!155880 (= e!101884 tp_is_empty!3113)))

(declare-fun mapNonEmpty!5312 () Bool)

(declare-fun mapRes!5312 () Bool)

(declare-fun tp!12458 () Bool)

(declare-fun e!101882 () Bool)

(assert (=> mapNonEmpty!5312 (= mapRes!5312 (and tp!12458 e!101882))))

(declare-fun mapKey!5312 () (_ BitVec 32))

(declare-fun mapValue!5312 () ValueCell!1213)

(declare-fun mapRest!5312 () (Array (_ BitVec 32) ValueCell!1213))

(assert (=> mapNonEmpty!5312 (= (arr!2498 (_values!3092 thiss!1248)) (store mapRest!5312 mapKey!5312 mapValue!5312))))

(declare-fun b!155882 () Bool)

(declare-fun e!101883 () Bool)

(assert (=> b!155882 (= e!101883 true)))

(declare-fun lt!81444 () Bool)

(declare-fun lt!81445 () LongMapFixedSize!1334)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2838 0))(
  ( (tuple2!2839 (_1!1430 (_ BitVec 64)) (_2!1430 V!3797)) )
))
(declare-datatypes ((List!1837 0))(
  ( (Nil!1834) (Cons!1833 (h!2442 tuple2!2838) (t!6639 List!1837)) )
))
(declare-datatypes ((ListLongMap!1825 0))(
  ( (ListLongMap!1826 (toList!928 List!1837)) )
))
(declare-fun contains!972 (ListLongMap!1825 (_ BitVec 64)) Bool)

(declare-fun map!1533 (LongMapFixedSize!1334) ListLongMap!1825)

(assert (=> b!155882 (= lt!81444 (contains!972 (map!1533 lt!81445) key!828))))

(declare-fun mapIsEmpty!5312 () Bool)

(assert (=> mapIsEmpty!5312 mapRes!5312))

(declare-fun b!155883 () Bool)

(assert (=> b!155883 (= e!101882 tp_is_empty!3113)))

(declare-fun b!155884 () Bool)

(declare-fun e!101886 () Bool)

(assert (=> b!155884 (= e!101886 (not e!101883))))

(declare-fun res!73638 () Bool)

(assert (=> b!155884 (=> res!73638 e!101883)))

(declare-fun valid!650 (LongMapFixedSize!1334) Bool)

(assert (=> b!155884 (= res!73638 (not (valid!650 lt!81445)))))

(declare-fun v!309 () V!3797)

(assert (=> b!155884 (= lt!81445 (LongMapFixedSize!1335 (defaultEntry!3109 thiss!1248) (mask!7544 thiss!1248) (bvor (extraKeys!2850 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2952 thiss!1248) (_size!716 thiss!1248) (_keys!4884 thiss!1248) (_values!3092 thiss!1248) (_vacant!716 thiss!1248)))))

(declare-fun +!196 (ListLongMap!1825 tuple2!2838) ListLongMap!1825)

(declare-fun getCurrentListMap!592 (array!5279 array!5281 (_ BitVec 32) (_ BitVec 32) V!3797 V!3797 (_ BitVec 32) Int) ListLongMap!1825)

(assert (=> b!155884 (= (+!196 (getCurrentListMap!592 (_keys!4884 thiss!1248) (_values!3092 thiss!1248) (mask!7544 thiss!1248) (extraKeys!2850 thiss!1248) (zeroValue!2952 thiss!1248) (minValue!2952 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3109 thiss!1248)) (tuple2!2839 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!592 (_keys!4884 thiss!1248) (_values!3092 thiss!1248) (mask!7544 thiss!1248) (bvor (extraKeys!2850 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2952 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3109 thiss!1248)))))

(declare-datatypes ((Unit!4936 0))(
  ( (Unit!4937) )
))
(declare-fun lt!81443 () Unit!4936)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!75 (array!5279 array!5281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3797 V!3797 V!3797 Int) Unit!4936)

(assert (=> b!155884 (= lt!81443 (lemmaChangeZeroKeyThenAddPairToListMap!75 (_keys!4884 thiss!1248) (_values!3092 thiss!1248) (mask!7544 thiss!1248) (extraKeys!2850 thiss!1248) (bvor (extraKeys!2850 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2952 thiss!1248) v!309 (minValue!2952 thiss!1248) (defaultEntry!3109 thiss!1248)))))

(declare-fun b!155885 () Bool)

(declare-fun res!73639 () Bool)

(assert (=> b!155885 (=> (not res!73639) (not e!101886))))

(assert (=> b!155885 (= res!73639 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155881 () Bool)

(assert (=> b!155881 (= e!101881 (and e!101884 mapRes!5312))))

(declare-fun condMapEmpty!5312 () Bool)

(declare-fun mapDefault!5312 () ValueCell!1213)

