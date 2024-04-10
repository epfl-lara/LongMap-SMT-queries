; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16170 () Bool)

(assert start!16170)

(declare-fun b!161214 () Bool)

(declare-fun b_free!3631 () Bool)

(declare-fun b_next!3631 () Bool)

(assert (=> b!161214 (= b_free!3631 (not b_next!3631))))

(declare-fun tp!13463 () Bool)

(declare-fun b_and!10045 () Bool)

(assert (=> b!161214 (= tp!13463 b_and!10045)))

(declare-fun b!161207 () Bool)

(declare-datatypes ((Unit!4996 0))(
  ( (Unit!4997) )
))
(declare-fun e!105331 () Unit!4996)

(declare-datatypes ((V!4225 0))(
  ( (V!4226 (val!1761 Int)) )
))
(declare-datatypes ((ValueCell!1373 0))(
  ( (ValueCellFull!1373 (v!3626 V!4225)) (EmptyCell!1373) )
))
(declare-datatypes ((array!5945 0))(
  ( (array!5946 (arr!2817 (Array (_ BitVec 32) (_ BitVec 64))) (size!3101 (_ BitVec 32))) )
))
(declare-datatypes ((array!5947 0))(
  ( (array!5948 (arr!2818 (Array (_ BitVec 32) ValueCell!1373)) (size!3102 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1654 0))(
  ( (LongMapFixedSize!1655 (defaultEntry!3269 Int) (mask!7855 (_ BitVec 32)) (extraKeys!3010 (_ BitVec 32)) (zeroValue!3112 V!4225) (minValue!3112 V!4225) (_size!876 (_ BitVec 32)) (_keys!5070 array!5945) (_values!3252 array!5947) (_vacant!876 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1654)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!72 (array!5945 array!5947 (_ BitVec 32) (_ BitVec 32) V!4225 V!4225 (_ BitVec 64) Int) Unit!4996)

(assert (=> b!161207 (= e!105331 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!72 (_keys!5070 thiss!1248) (_values!3252 thiss!1248) (mask!7855 thiss!1248) (extraKeys!3010 thiss!1248) (zeroValue!3112 thiss!1248) (minValue!3112 thiss!1248) key!828 (defaultEntry!3269 thiss!1248)))))

(declare-fun b!161208 () Bool)

(declare-fun res!76451 () Bool)

(declare-fun e!105330 () Bool)

(assert (=> b!161208 (=> (not res!76451) (not e!105330))))

(assert (=> b!161208 (= res!76451 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161209 () Bool)

(declare-fun e!105327 () Bool)

(declare-fun e!105328 () Bool)

(declare-fun mapRes!5837 () Bool)

(assert (=> b!161209 (= e!105327 (and e!105328 mapRes!5837))))

(declare-fun condMapEmpty!5837 () Bool)

(declare-fun mapDefault!5837 () ValueCell!1373)

