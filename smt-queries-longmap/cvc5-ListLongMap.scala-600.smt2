; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15742 () Bool)

(assert start!15742)

(declare-fun b!157100 () Bool)

(declare-fun b_free!3409 () Bool)

(declare-fun b_next!3409 () Bool)

(assert (=> b!157100 (= b_free!3409 (not b_next!3409))))

(declare-fun tp!12751 () Bool)

(declare-fun b_and!9823 () Bool)

(assert (=> b!157100 (= tp!12751 b_and!9823)))

(declare-fun b!157097 () Bool)

(declare-fun e!102775 () Bool)

(declare-fun tp_is_empty!3211 () Bool)

(assert (=> b!157097 (= e!102775 tp_is_empty!3211)))

(declare-fun mapIsEmpty!5459 () Bool)

(declare-fun mapRes!5459 () Bool)

(assert (=> mapIsEmpty!5459 mapRes!5459))

(declare-fun mapNonEmpty!5459 () Bool)

(declare-fun tp!12752 () Bool)

(declare-fun e!102774 () Bool)

(assert (=> mapNonEmpty!5459 (= mapRes!5459 (and tp!12752 e!102774))))

(declare-datatypes ((V!3929 0))(
  ( (V!3930 (val!1650 Int)) )
))
(declare-datatypes ((ValueCell!1262 0))(
  ( (ValueCellFull!1262 (v!3515 V!3929)) (EmptyCell!1262) )
))
(declare-fun mapRest!5459 () (Array (_ BitVec 32) ValueCell!1262))

(declare-fun mapKey!5459 () (_ BitVec 32))

(declare-fun mapValue!5459 () ValueCell!1262)

(declare-datatypes ((array!5475 0))(
  ( (array!5476 (arr!2595 (Array (_ BitVec 32) (_ BitVec 64))) (size!2873 (_ BitVec 32))) )
))
(declare-datatypes ((array!5477 0))(
  ( (array!5478 (arr!2596 (Array (_ BitVec 32) ValueCell!1262)) (size!2874 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1432 0))(
  ( (LongMapFixedSize!1433 (defaultEntry!3158 Int) (mask!7627 (_ BitVec 32)) (extraKeys!2899 (_ BitVec 32)) (zeroValue!3001 V!3929) (minValue!3001 V!3929) (_size!765 (_ BitVec 32)) (_keys!4933 array!5475) (_values!3141 array!5477) (_vacant!765 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1432)

(assert (=> mapNonEmpty!5459 (= (arr!2596 (_values!3141 thiss!1248)) (store mapRest!5459 mapKey!5459 mapValue!5459))))

(declare-fun b!157098 () Bool)

(declare-fun e!102778 () Bool)

(declare-fun e!102779 () Bool)

(assert (=> b!157098 (= e!102778 (not e!102779))))

(declare-fun res!74269 () Bool)

(assert (=> b!157098 (=> res!74269 e!102779)))

(declare-fun lt!81643 () LongMapFixedSize!1432)

(declare-fun valid!682 (LongMapFixedSize!1432) Bool)

(assert (=> b!157098 (= res!74269 (not (valid!682 lt!81643)))))

(declare-fun v!309 () V!3929)

(assert (=> b!157098 (= lt!81643 (LongMapFixedSize!1433 (defaultEntry!3158 thiss!1248) (mask!7627 thiss!1248) (bvor (extraKeys!2899 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3001 thiss!1248) v!309 (_size!765 thiss!1248) (_keys!4933 thiss!1248) (_values!3141 thiss!1248) (_vacant!765 thiss!1248)))))

(declare-datatypes ((tuple2!2860 0))(
  ( (tuple2!2861 (_1!1441 (_ BitVec 64)) (_2!1441 V!3929)) )
))
(declare-datatypes ((List!1872 0))(
  ( (Nil!1869) (Cons!1868 (h!2477 tuple2!2860) (t!6674 List!1872)) )
))
(declare-datatypes ((ListLongMap!1847 0))(
  ( (ListLongMap!1848 (toList!939 List!1872)) )
))
(declare-fun +!207 (ListLongMap!1847 tuple2!2860) ListLongMap!1847)

(declare-fun getCurrentListMap!603 (array!5475 array!5477 (_ BitVec 32) (_ BitVec 32) V!3929 V!3929 (_ BitVec 32) Int) ListLongMap!1847)

(assert (=> b!157098 (= (+!207 (getCurrentListMap!603 (_keys!4933 thiss!1248) (_values!3141 thiss!1248) (mask!7627 thiss!1248) (extraKeys!2899 thiss!1248) (zeroValue!3001 thiss!1248) (minValue!3001 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3158 thiss!1248)) (tuple2!2861 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!603 (_keys!4933 thiss!1248) (_values!3141 thiss!1248) (mask!7627 thiss!1248) (bvor (extraKeys!2899 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3001 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3158 thiss!1248)))))

(declare-datatypes ((Unit!4958 0))(
  ( (Unit!4959) )
))
(declare-fun lt!81642 () Unit!4958)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!75 (array!5475 array!5477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3929 V!3929 V!3929 Int) Unit!4958)

(assert (=> b!157098 (= lt!81642 (lemmaChangeLongMinValueKeyThenAddPairToListMap!75 (_keys!4933 thiss!1248) (_values!3141 thiss!1248) (mask!7627 thiss!1248) (extraKeys!2899 thiss!1248) (bvor (extraKeys!2899 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3001 thiss!1248) (minValue!3001 thiss!1248) v!309 (defaultEntry!3158 thiss!1248)))))

(declare-fun b!157099 () Bool)

(declare-fun res!74267 () Bool)

(assert (=> b!157099 (=> (not res!74267) (not e!102778))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157099 (= res!74267 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!102780 () Bool)

(declare-fun e!102777 () Bool)

(declare-fun array_inv!1643 (array!5475) Bool)

(declare-fun array_inv!1644 (array!5477) Bool)

(assert (=> b!157100 (= e!102780 (and tp!12751 tp_is_empty!3211 (array_inv!1643 (_keys!4933 thiss!1248)) (array_inv!1644 (_values!3141 thiss!1248)) e!102777))))

(declare-fun res!74268 () Bool)

(assert (=> start!15742 (=> (not res!74268) (not e!102778))))

(assert (=> start!15742 (= res!74268 (valid!682 thiss!1248))))

(assert (=> start!15742 e!102778))

(assert (=> start!15742 e!102780))

(assert (=> start!15742 true))

(assert (=> start!15742 tp_is_empty!3211))

(declare-fun b!157101 () Bool)

(assert (=> b!157101 (= e!102774 tp_is_empty!3211)))

(declare-fun b!157102 () Bool)

(assert (=> b!157102 (= e!102777 (and e!102775 mapRes!5459))))

(declare-fun condMapEmpty!5459 () Bool)

(declare-fun mapDefault!5459 () ValueCell!1262)

