; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22904 () Bool)

(assert start!22904)

(declare-fun b!238608 () Bool)

(declare-fun b_free!6407 () Bool)

(declare-fun b_next!6407 () Bool)

(assert (=> b!238608 (= b_free!6407 (not b_next!6407))))

(declare-fun tp!22424 () Bool)

(declare-fun b_and!13373 () Bool)

(assert (=> b!238608 (= tp!22424 b_and!13373)))

(declare-fun b!238598 () Bool)

(declare-fun res!116936 () Bool)

(declare-fun e!154908 () Bool)

(assert (=> b!238598 (=> (not res!116936) (not e!154908))))

(declare-datatypes ((V!8005 0))(
  ( (V!8006 (val!3179 Int)) )
))
(declare-datatypes ((ValueCell!2791 0))(
  ( (ValueCellFull!2791 (v!5217 V!8005)) (EmptyCell!2791) )
))
(declare-datatypes ((array!11817 0))(
  ( (array!11818 (arr!5610 (Array (_ BitVec 32) ValueCell!2791)) (size!5951 (_ BitVec 32))) )
))
(declare-datatypes ((array!11819 0))(
  ( (array!11820 (arr!5611 (Array (_ BitVec 32) (_ BitVec 64))) (size!5952 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3482 0))(
  ( (LongMapFixedSize!3483 (defaultEntry!4426 Int) (mask!10462 (_ BitVec 32)) (extraKeys!4163 (_ BitVec 32)) (zeroValue!4267 V!8005) (minValue!4267 V!8005) (_size!1790 (_ BitVec 32)) (_keys!6528 array!11819) (_values!4409 array!11817) (_vacant!1790 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3482)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11819 (_ BitVec 32)) Bool)

(assert (=> b!238598 (= res!116936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6528 thiss!1504) (mask!10462 thiss!1504)))))

(declare-fun mapIsEmpty!10635 () Bool)

(declare-fun mapRes!10635 () Bool)

(assert (=> mapIsEmpty!10635 mapRes!10635))

(declare-fun b!238599 () Bool)

(declare-fun e!154911 () Bool)

(declare-fun tp_is_empty!6269 () Bool)

(assert (=> b!238599 (= e!154911 tp_is_empty!6269)))

(declare-fun b!238600 () Bool)

(assert (=> b!238600 (= e!154908 false)))

(declare-fun lt!120620 () Bool)

(declare-datatypes ((List!3585 0))(
  ( (Nil!3582) (Cons!3581 (h!4237 (_ BitVec 64)) (t!8580 List!3585)) )
))
(declare-fun arrayNoDuplicates!0 (array!11819 (_ BitVec 32) List!3585) Bool)

(assert (=> b!238600 (= lt!120620 (arrayNoDuplicates!0 (_keys!6528 thiss!1504) #b00000000000000000000000000000000 Nil!3582))))

(declare-fun b!238601 () Bool)

(declare-fun res!116934 () Bool)

(assert (=> b!238601 (=> (not res!116934) (not e!154908))))

(assert (=> b!238601 (= res!116934 (and (= (size!5951 (_values!4409 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10462 thiss!1504))) (= (size!5952 (_keys!6528 thiss!1504)) (size!5951 (_values!4409 thiss!1504))) (bvsge (mask!10462 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4163 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4163 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!238602 () Bool)

(declare-fun e!154910 () Bool)

(declare-fun e!154913 () Bool)

(assert (=> b!238602 (= e!154910 (and e!154913 mapRes!10635))))

(declare-fun condMapEmpty!10635 () Bool)

(declare-fun mapDefault!10635 () ValueCell!2791)

