; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21610 () Bool)

(assert start!21610)

(declare-fun b!216541 () Bool)

(declare-fun b_free!5759 () Bool)

(declare-fun b_next!5759 () Bool)

(assert (=> b!216541 (= b_free!5759 (not b_next!5759))))

(declare-fun tp!20411 () Bool)

(declare-fun b_and!12649 () Bool)

(assert (=> b!216541 (= tp!20411 b_and!12649)))

(declare-fun b!216535 () Bool)

(declare-fun e!140883 () Bool)

(declare-fun tp_is_empty!5621 () Bool)

(assert (=> b!216535 (= e!140883 tp_is_empty!5621)))

(declare-fun mapIsEmpty!9594 () Bool)

(declare-fun mapRes!9594 () Bool)

(assert (=> mapIsEmpty!9594 mapRes!9594))

(declare-fun b!216536 () Bool)

(declare-fun res!105897 () Bool)

(declare-fun e!140882 () Bool)

(assert (=> b!216536 (=> (not res!105897) (not e!140882))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216536 (= res!105897 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216537 () Bool)

(declare-fun e!140878 () Bool)

(assert (=> b!216537 (= e!140878 false)))

(declare-fun lt!111183 () Bool)

(declare-datatypes ((V!7141 0))(
  ( (V!7142 (val!2855 Int)) )
))
(declare-datatypes ((ValueCell!2467 0))(
  ( (ValueCellFull!2467 (v!4873 V!7141)) (EmptyCell!2467) )
))
(declare-datatypes ((array!10481 0))(
  ( (array!10482 (arr!4962 (Array (_ BitVec 32) ValueCell!2467)) (size!5294 (_ BitVec 32))) )
))
(declare-datatypes ((array!10483 0))(
  ( (array!10484 (arr!4963 (Array (_ BitVec 32) (_ BitVec 64))) (size!5295 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2834 0))(
  ( (LongMapFixedSize!2835 (defaultEntry!4067 Int) (mask!9804 (_ BitVec 32)) (extraKeys!3804 (_ BitVec 32)) (zeroValue!3908 V!7141) (minValue!3908 V!7141) (_size!1466 (_ BitVec 32)) (_keys!6116 array!10483) (_values!4050 array!10481) (_vacant!1466 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2834)

(declare-datatypes ((List!3151 0))(
  ( (Nil!3148) (Cons!3147 (h!3794 (_ BitVec 64)) (t!8106 List!3151)) )
))
(declare-fun arrayNoDuplicates!0 (array!10483 (_ BitVec 32) List!3151) Bool)

(assert (=> b!216537 (= lt!111183 (arrayNoDuplicates!0 (_keys!6116 thiss!1504) #b00000000000000000000000000000000 Nil!3148))))

(declare-fun b!216538 () Bool)

(declare-fun res!105900 () Bool)

(assert (=> b!216538 (=> (not res!105900) (not e!140878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10483 (_ BitVec 32)) Bool)

(assert (=> b!216538 (= res!105900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6116 thiss!1504) (mask!9804 thiss!1504)))))

(declare-fun res!105896 () Bool)

(assert (=> start!21610 (=> (not res!105896) (not e!140882))))

(declare-fun valid!1152 (LongMapFixedSize!2834) Bool)

(assert (=> start!21610 (= res!105896 (valid!1152 thiss!1504))))

(assert (=> start!21610 e!140882))

(declare-fun e!140880 () Bool)

(assert (=> start!21610 e!140880))

(assert (=> start!21610 true))

(declare-fun b!216539 () Bool)

(declare-fun e!140884 () Bool)

(assert (=> b!216539 (= e!140884 tp_is_empty!5621)))

(declare-fun b!216540 () Bool)

(declare-fun res!105895 () Bool)

(assert (=> b!216540 (=> (not res!105895) (not e!140878))))

(assert (=> b!216540 (= res!105895 (and (= (size!5294 (_values!4050 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9804 thiss!1504))) (= (size!5295 (_keys!6116 thiss!1504)) (size!5294 (_values!4050 thiss!1504))) (bvsge (mask!9804 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3804 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3804 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun e!140879 () Bool)

(declare-fun array_inv!3283 (array!10483) Bool)

(declare-fun array_inv!3284 (array!10481) Bool)

(assert (=> b!216541 (= e!140880 (and tp!20411 tp_is_empty!5621 (array_inv!3283 (_keys!6116 thiss!1504)) (array_inv!3284 (_values!4050 thiss!1504)) e!140879))))

(declare-fun b!216542 () Bool)

(declare-fun res!105894 () Bool)

(assert (=> b!216542 (=> (not res!105894) (not e!140878))))

(declare-datatypes ((tuple2!4246 0))(
  ( (tuple2!4247 (_1!2134 (_ BitVec 64)) (_2!2134 V!7141)) )
))
(declare-datatypes ((List!3152 0))(
  ( (Nil!3149) (Cons!3148 (h!3795 tuple2!4246) (t!8107 List!3152)) )
))
(declare-datatypes ((ListLongMap!3159 0))(
  ( (ListLongMap!3160 (toList!1595 List!3152)) )
))
(declare-fun contains!1436 (ListLongMap!3159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1123 (array!10483 array!10481 (_ BitVec 32) (_ BitVec 32) V!7141 V!7141 (_ BitVec 32) Int) ListLongMap!3159)

(assert (=> b!216542 (= res!105894 (contains!1436 (getCurrentListMap!1123 (_keys!6116 thiss!1504) (_values!4050 thiss!1504) (mask!9804 thiss!1504) (extraKeys!3804 thiss!1504) (zeroValue!3908 thiss!1504) (minValue!3908 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4067 thiss!1504)) key!932))))

(declare-fun b!216543 () Bool)

(assert (=> b!216543 (= e!140879 (and e!140883 mapRes!9594))))

(declare-fun condMapEmpty!9594 () Bool)

(declare-fun mapDefault!9594 () ValueCell!2467)

