; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21606 () Bool)

(assert start!21606)

(declare-fun b!216479 () Bool)

(declare-fun b_free!5755 () Bool)

(declare-fun b_next!5755 () Bool)

(assert (=> b!216479 (= b_free!5755 (not b_next!5755))))

(declare-fun tp!20399 () Bool)

(declare-fun b_and!12645 () Bool)

(assert (=> b!216479 (= tp!20399 b_and!12645)))

(declare-fun res!105856 () Bool)

(declare-fun e!140836 () Bool)

(assert (=> start!21606 (=> (not res!105856) (not e!140836))))

(declare-datatypes ((V!7137 0))(
  ( (V!7138 (val!2853 Int)) )
))
(declare-datatypes ((ValueCell!2465 0))(
  ( (ValueCellFull!2465 (v!4871 V!7137)) (EmptyCell!2465) )
))
(declare-datatypes ((array!10473 0))(
  ( (array!10474 (arr!4958 (Array (_ BitVec 32) ValueCell!2465)) (size!5290 (_ BitVec 32))) )
))
(declare-datatypes ((array!10475 0))(
  ( (array!10476 (arr!4959 (Array (_ BitVec 32) (_ BitVec 64))) (size!5291 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2830 0))(
  ( (LongMapFixedSize!2831 (defaultEntry!4065 Int) (mask!9802 (_ BitVec 32)) (extraKeys!3802 (_ BitVec 32)) (zeroValue!3906 V!7137) (minValue!3906 V!7137) (_size!1464 (_ BitVec 32)) (_keys!6114 array!10475) (_values!4048 array!10473) (_vacant!1464 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2830)

(declare-fun valid!1150 (LongMapFixedSize!2830) Bool)

(assert (=> start!21606 (= res!105856 (valid!1150 thiss!1504))))

(assert (=> start!21606 e!140836))

(declare-fun e!140840 () Bool)

(assert (=> start!21606 e!140840))

(assert (=> start!21606 true))

(declare-fun b!216469 () Bool)

(declare-fun res!105854 () Bool)

(declare-fun e!140841 () Bool)

(assert (=> b!216469 (=> (not res!105854) (not e!140841))))

(assert (=> b!216469 (= res!105854 (and (= (size!5290 (_values!4048 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9802 thiss!1504))) (= (size!5291 (_keys!6114 thiss!1504)) (size!5290 (_values!4048 thiss!1504))) (bvsge (mask!9802 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3802 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3802 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216470 () Bool)

(declare-fun e!140838 () Bool)

(declare-fun tp_is_empty!5617 () Bool)

(assert (=> b!216470 (= e!140838 tp_is_empty!5617)))

(declare-fun b!216471 () Bool)

(declare-fun res!105857 () Bool)

(assert (=> b!216471 (=> (not res!105857) (not e!140836))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216471 (= res!105857 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216472 () Bool)

(assert (=> b!216472 (= e!140836 e!140841)))

(declare-fun res!105853 () Bool)

(assert (=> b!216472 (=> (not res!105853) (not e!140841))))

(declare-datatypes ((SeekEntryResult!745 0))(
  ( (MissingZero!745 (index!5150 (_ BitVec 32))) (Found!745 (index!5151 (_ BitVec 32))) (Intermediate!745 (undefined!1557 Bool) (index!5152 (_ BitVec 32)) (x!22641 (_ BitVec 32))) (Undefined!745) (MissingVacant!745 (index!5153 (_ BitVec 32))) )
))
(declare-fun lt!111170 () SeekEntryResult!745)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216472 (= res!105853 (or (= lt!111170 (MissingZero!745 index!297)) (= lt!111170 (MissingVacant!745 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10475 (_ BitVec 32)) SeekEntryResult!745)

(assert (=> b!216472 (= lt!111170 (seekEntryOrOpen!0 key!932 (_keys!6114 thiss!1504) (mask!9802 thiss!1504)))))

(declare-fun b!216473 () Bool)

(assert (=> b!216473 (= e!140841 false)))

(declare-fun lt!111171 () Bool)

(declare-datatypes ((List!3147 0))(
  ( (Nil!3144) (Cons!3143 (h!3790 (_ BitVec 64)) (t!8102 List!3147)) )
))
(declare-fun arrayNoDuplicates!0 (array!10475 (_ BitVec 32) List!3147) Bool)

(assert (=> b!216473 (= lt!111171 (arrayNoDuplicates!0 (_keys!6114 thiss!1504) #b00000000000000000000000000000000 Nil!3144))))

(declare-fun b!216474 () Bool)

(declare-fun res!105858 () Bool)

(assert (=> b!216474 (=> (not res!105858) (not e!140841))))

(declare-datatypes ((tuple2!4242 0))(
  ( (tuple2!4243 (_1!2132 (_ BitVec 64)) (_2!2132 V!7137)) )
))
(declare-datatypes ((List!3148 0))(
  ( (Nil!3145) (Cons!3144 (h!3791 tuple2!4242) (t!8103 List!3148)) )
))
(declare-datatypes ((ListLongMap!3155 0))(
  ( (ListLongMap!3156 (toList!1593 List!3148)) )
))
(declare-fun contains!1434 (ListLongMap!3155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1121 (array!10475 array!10473 (_ BitVec 32) (_ BitVec 32) V!7137 V!7137 (_ BitVec 32) Int) ListLongMap!3155)

(assert (=> b!216474 (= res!105858 (contains!1434 (getCurrentListMap!1121 (_keys!6114 thiss!1504) (_values!4048 thiss!1504) (mask!9802 thiss!1504) (extraKeys!3802 thiss!1504) (zeroValue!3906 thiss!1504) (minValue!3906 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4065 thiss!1504)) key!932))))

(declare-fun b!216475 () Bool)

(declare-fun res!105855 () Bool)

(assert (=> b!216475 (=> (not res!105855) (not e!140841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10475 (_ BitVec 32)) Bool)

(assert (=> b!216475 (= res!105855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6114 thiss!1504) (mask!9802 thiss!1504)))))

(declare-fun b!216476 () Bool)

(declare-fun e!140839 () Bool)

(declare-fun mapRes!9588 () Bool)

(assert (=> b!216476 (= e!140839 (and e!140838 mapRes!9588))))

(declare-fun condMapEmpty!9588 () Bool)

(declare-fun mapDefault!9588 () ValueCell!2465)

