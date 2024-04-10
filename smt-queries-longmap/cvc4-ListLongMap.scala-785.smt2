; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18674 () Bool)

(assert start!18674)

(declare-fun b!184713 () Bool)

(declare-fun b_free!4553 () Bool)

(declare-fun b_next!4553 () Bool)

(assert (=> b!184713 (= b_free!4553 (not b_next!4553))))

(declare-fun tp!16445 () Bool)

(declare-fun b_and!11143 () Bool)

(assert (=> b!184713 (= tp!16445 b_and!11143)))

(declare-fun b!184712 () Bool)

(declare-fun res!87386 () Bool)

(declare-fun e!121584 () Bool)

(assert (=> b!184712 (=> (not res!87386) (not e!121584))))

(declare-datatypes ((V!5413 0))(
  ( (V!5414 (val!2207 Int)) )
))
(declare-datatypes ((ValueCell!1819 0))(
  ( (ValueCellFull!1819 (v!4114 V!5413)) (EmptyCell!1819) )
))
(declare-datatypes ((array!7851 0))(
  ( (array!7852 (arr!3709 (Array (_ BitVec 32) (_ BitVec 64))) (size!4024 (_ BitVec 32))) )
))
(declare-datatypes ((array!7853 0))(
  ( (array!7854 (arr!3710 (Array (_ BitVec 32) ValueCell!1819)) (size!4025 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2546 0))(
  ( (LongMapFixedSize!2547 (defaultEntry!3770 Int) (mask!8860 (_ BitVec 32)) (extraKeys!3507 (_ BitVec 32)) (zeroValue!3611 V!5413) (minValue!3611 V!5413) (_size!1322 (_ BitVec 32)) (_keys!5701 array!7851) (_values!3753 array!7853) (_vacant!1322 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2546)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3436 0))(
  ( (tuple2!3437 (_1!1729 (_ BitVec 64)) (_2!1729 V!5413)) )
))
(declare-datatypes ((List!2349 0))(
  ( (Nil!2346) (Cons!2345 (h!2977 tuple2!3436) (t!7225 List!2349)) )
))
(declare-datatypes ((ListLongMap!2353 0))(
  ( (ListLongMap!2354 (toList!1192 List!2349)) )
))
(declare-fun contains!1284 (ListLongMap!2353 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!840 (array!7851 array!7853 (_ BitVec 32) (_ BitVec 32) V!5413 V!5413 (_ BitVec 32) Int) ListLongMap!2353)

(assert (=> b!184712 (= res!87386 (not (contains!1284 (getCurrentListMap!840 (_keys!5701 thiss!1248) (_values!3753 thiss!1248) (mask!8860 thiss!1248) (extraKeys!3507 thiss!1248) (zeroValue!3611 thiss!1248) (minValue!3611 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3770 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!7436 () Bool)

(declare-fun mapRes!7436 () Bool)

(assert (=> mapIsEmpty!7436 mapRes!7436))

(declare-fun mapNonEmpty!7436 () Bool)

(declare-fun tp!16444 () Bool)

(declare-fun e!121580 () Bool)

(assert (=> mapNonEmpty!7436 (= mapRes!7436 (and tp!16444 e!121580))))

(declare-fun mapRest!7436 () (Array (_ BitVec 32) ValueCell!1819))

(declare-fun mapValue!7436 () ValueCell!1819)

(declare-fun mapKey!7436 () (_ BitVec 32))

(assert (=> mapNonEmpty!7436 (= (arr!3710 (_values!3753 thiss!1248)) (store mapRest!7436 mapKey!7436 mapValue!7436))))

(declare-fun e!121585 () Bool)

(declare-fun e!121583 () Bool)

(declare-fun tp_is_empty!4325 () Bool)

(declare-fun array_inv!2399 (array!7851) Bool)

(declare-fun array_inv!2400 (array!7853) Bool)

(assert (=> b!184713 (= e!121585 (and tp!16445 tp_is_empty!4325 (array_inv!2399 (_keys!5701 thiss!1248)) (array_inv!2400 (_values!3753 thiss!1248)) e!121583))))

(declare-fun res!87387 () Bool)

(declare-fun e!121581 () Bool)

(assert (=> start!18674 (=> (not res!87387) (not e!121581))))

(declare-fun valid!1051 (LongMapFixedSize!2546) Bool)

(assert (=> start!18674 (= res!87387 (valid!1051 thiss!1248))))

(assert (=> start!18674 e!121581))

(assert (=> start!18674 e!121585))

(assert (=> start!18674 true))

(declare-fun b!184714 () Bool)

(declare-fun e!121582 () Bool)

(assert (=> b!184714 (= e!121583 (and e!121582 mapRes!7436))))

(declare-fun condMapEmpty!7436 () Bool)

(declare-fun mapDefault!7436 () ValueCell!1819)

