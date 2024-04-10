; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76192 () Bool)

(assert start!76192)

(declare-fun b!894821 () Bool)

(declare-fun b_free!15887 () Bool)

(declare-fun b_next!15887 () Bool)

(assert (=> b!894821 (= b_free!15887 (not b_next!15887))))

(declare-fun tp!55655 () Bool)

(declare-fun b_and!26179 () Bool)

(assert (=> b!894821 (= tp!55655 b_and!26179)))

(declare-fun e!499876 () Bool)

(declare-fun tp_is_empty!18215 () Bool)

(declare-datatypes ((array!52424 0))(
  ( (array!52425 (arr!25211 (Array (_ BitVec 32) (_ BitVec 64))) (size!25658 (_ BitVec 32))) )
))
(declare-datatypes ((V!29251 0))(
  ( (V!29252 (val!9158 Int)) )
))
(declare-datatypes ((ValueCell!8626 0))(
  ( (ValueCellFull!8626 (v!11648 V!29251)) (EmptyCell!8626) )
))
(declare-datatypes ((array!52426 0))(
  ( (array!52427 (arr!25212 (Array (_ BitVec 32) ValueCell!8626)) (size!25659 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4268 0))(
  ( (LongMapFixedSize!4269 (defaultEntry!5346 Int) (mask!25917 (_ BitVec 32)) (extraKeys!5042 (_ BitVec 32)) (zeroValue!5146 V!29251) (minValue!5146 V!29251) (_size!2189 (_ BitVec 32)) (_keys!10048 array!52424) (_values!5333 array!52426) (_vacant!2189 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4268)

(declare-fun e!499875 () Bool)

(declare-fun array_inv!19794 (array!52424) Bool)

(declare-fun array_inv!19795 (array!52426) Bool)

(assert (=> b!894821 (= e!499876 (and tp!55655 tp_is_empty!18215 (array_inv!19794 (_keys!10048 thiss!1181)) (array_inv!19795 (_values!5333 thiss!1181)) e!499875))))

(declare-fun b!894822 () Bool)

(declare-fun e!499879 () Bool)

(assert (=> b!894822 (= e!499879 (and (= (size!25659 (_values!5333 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25917 thiss!1181))) (not (= (size!25658 (_keys!10048 thiss!1181)) (size!25659 (_values!5333 thiss!1181))))))))

(declare-fun b!894823 () Bool)

(declare-fun e!499874 () Bool)

(assert (=> b!894823 (= e!499874 tp_is_empty!18215)))

(declare-fun res!605482 () Bool)

(declare-fun e!499877 () Bool)

(assert (=> start!76192 (=> (not res!605482) (not e!499877))))

(declare-fun valid!1646 (LongMapFixedSize!4268) Bool)

(assert (=> start!76192 (= res!605482 (valid!1646 thiss!1181))))

(assert (=> start!76192 e!499877))

(assert (=> start!76192 e!499876))

(assert (=> start!76192 true))

(declare-fun mapIsEmpty!28903 () Bool)

(declare-fun mapRes!28903 () Bool)

(assert (=> mapIsEmpty!28903 mapRes!28903))

(declare-fun mapNonEmpty!28903 () Bool)

(declare-fun tp!55656 () Bool)

(declare-fun e!499880 () Bool)

(assert (=> mapNonEmpty!28903 (= mapRes!28903 (and tp!55656 e!499880))))

(declare-fun mapValue!28903 () ValueCell!8626)

(declare-fun mapKey!28903 () (_ BitVec 32))

(declare-fun mapRest!28903 () (Array (_ BitVec 32) ValueCell!8626))

(assert (=> mapNonEmpty!28903 (= (arr!25212 (_values!5333 thiss!1181)) (store mapRest!28903 mapKey!28903 mapValue!28903))))

(declare-fun b!894824 () Bool)

(declare-fun res!605481 () Bool)

(assert (=> b!894824 (=> (not res!605481) (not e!499877))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!894824 (= res!605481 (not (= key!785 (bvneg key!785))))))

(declare-fun b!894825 () Bool)

(assert (=> b!894825 (= e!499877 e!499879)))

(declare-fun res!605483 () Bool)

(assert (=> b!894825 (=> (not res!605483) (not e!499879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!894825 (= res!605483 (validMask!0 (mask!25917 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8872 0))(
  ( (MissingZero!8872 (index!37859 (_ BitVec 32))) (Found!8872 (index!37860 (_ BitVec 32))) (Intermediate!8872 (undefined!9684 Bool) (index!37861 (_ BitVec 32)) (x!76093 (_ BitVec 32))) (Undefined!8872) (MissingVacant!8872 (index!37862 (_ BitVec 32))) )
))
(declare-fun lt!404365 () SeekEntryResult!8872)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52424 (_ BitVec 32)) SeekEntryResult!8872)

(assert (=> b!894825 (= lt!404365 (seekEntry!0 key!785 (_keys!10048 thiss!1181) (mask!25917 thiss!1181)))))

(declare-fun b!894826 () Bool)

(assert (=> b!894826 (= e!499875 (and e!499874 mapRes!28903))))

(declare-fun condMapEmpty!28903 () Bool)

(declare-fun mapDefault!28903 () ValueCell!8626)

