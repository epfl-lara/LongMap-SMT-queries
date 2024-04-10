; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18276 () Bool)

(assert start!18276)

(declare-fun b!181622 () Bool)

(declare-fun b_free!4487 () Bool)

(declare-fun b_next!4487 () Bool)

(assert (=> b!181622 (= b_free!4487 (not b_next!4487))))

(declare-fun tp!16211 () Bool)

(declare-fun b_and!11037 () Bool)

(assert (=> b!181622 (= tp!16211 b_and!11037)))

(declare-fun e!119628 () Bool)

(declare-fun e!119629 () Bool)

(declare-fun tp_is_empty!4259 () Bool)

(declare-datatypes ((V!5325 0))(
  ( (V!5326 (val!2174 Int)) )
))
(declare-datatypes ((ValueCell!1786 0))(
  ( (ValueCellFull!1786 (v!4071 V!5325)) (EmptyCell!1786) )
))
(declare-datatypes ((array!7699 0))(
  ( (array!7700 (arr!3643 (Array (_ BitVec 32) (_ BitVec 64))) (size!3953 (_ BitVec 32))) )
))
(declare-datatypes ((array!7701 0))(
  ( (array!7702 (arr!3644 (Array (_ BitVec 32) ValueCell!1786)) (size!3954 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2480 0))(
  ( (LongMapFixedSize!2481 (defaultEntry!3722 Int) (mask!8747 (_ BitVec 32)) (extraKeys!3459 (_ BitVec 32)) (zeroValue!3563 V!5325) (minValue!3563 V!5325) (_size!1289 (_ BitVec 32)) (_keys!5625 array!7699) (_values!3705 array!7701) (_vacant!1289 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2480)

(declare-fun array_inv!2347 (array!7699) Bool)

(declare-fun array_inv!2348 (array!7701) Bool)

(assert (=> b!181622 (= e!119629 (and tp!16211 tp_is_empty!4259 (array_inv!2347 (_keys!5625 thiss!1248)) (array_inv!2348 (_values!3705 thiss!1248)) e!119628))))

(declare-fun mapIsEmpty!7302 () Bool)

(declare-fun mapRes!7302 () Bool)

(assert (=> mapIsEmpty!7302 mapRes!7302))

(declare-fun b!181623 () Bool)

(declare-fun res!85988 () Bool)

(declare-fun e!119626 () Bool)

(assert (=> b!181623 (=> (not res!85988) (not e!119626))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3392 0))(
  ( (tuple2!3393 (_1!1707 (_ BitVec 64)) (_2!1707 V!5325)) )
))
(declare-datatypes ((List!2311 0))(
  ( (Nil!2308) (Cons!2307 (h!2934 tuple2!3392) (t!7167 List!2311)) )
))
(declare-datatypes ((ListLongMap!2309 0))(
  ( (ListLongMap!2310 (toList!1170 List!2311)) )
))
(declare-fun contains!1250 (ListLongMap!2309 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!818 (array!7699 array!7701 (_ BitVec 32) (_ BitVec 32) V!5325 V!5325 (_ BitVec 32) Int) ListLongMap!2309)

(assert (=> b!181623 (= res!85988 (contains!1250 (getCurrentListMap!818 (_keys!5625 thiss!1248) (_values!3705 thiss!1248) (mask!8747 thiss!1248) (extraKeys!3459 thiss!1248) (zeroValue!3563 thiss!1248) (minValue!3563 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3722 thiss!1248)) key!828))))

(declare-fun res!85985 () Bool)

(declare-fun e!119632 () Bool)

(assert (=> start!18276 (=> (not res!85985) (not e!119632))))

(declare-fun valid!1028 (LongMapFixedSize!2480) Bool)

(assert (=> start!18276 (= res!85985 (valid!1028 thiss!1248))))

(assert (=> start!18276 e!119632))

(assert (=> start!18276 e!119629))

(assert (=> start!18276 true))

(declare-fun b!181624 () Bool)

(declare-fun e!119630 () Bool)

(assert (=> b!181624 (= e!119630 tp_is_empty!4259)))

(declare-fun b!181625 () Bool)

(declare-fun res!85986 () Bool)

(assert (=> b!181625 (=> (not res!85986) (not e!119626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181625 (= res!85986 (validMask!0 (mask!8747 thiss!1248)))))

(declare-fun b!181626 () Bool)

(declare-fun e!119627 () Bool)

(assert (=> b!181626 (= e!119627 tp_is_empty!4259)))

(declare-fun b!181627 () Bool)

(assert (=> b!181627 (= e!119628 (and e!119630 mapRes!7302))))

(declare-fun condMapEmpty!7302 () Bool)

(declare-fun mapDefault!7302 () ValueCell!1786)

