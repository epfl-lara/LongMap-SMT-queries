; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16972 () Bool)

(assert start!16972)

(declare-fun b!170638 () Bool)

(declare-fun b_free!4219 () Bool)

(declare-fun b_next!4219 () Bool)

(assert (=> b!170638 (= b_free!4219 (not b_next!4219))))

(declare-fun tp!15281 () Bool)

(declare-fun b_and!10633 () Bool)

(assert (=> b!170638 (= tp!15281 b_and!10633)))

(declare-fun b!170634 () Bool)

(declare-fun res!81110 () Bool)

(declare-fun e!112632 () Bool)

(assert (=> b!170634 (=> (not res!81110) (not e!112632))))

(declare-datatypes ((V!4969 0))(
  ( (V!4970 (val!2040 Int)) )
))
(declare-datatypes ((ValueCell!1652 0))(
  ( (ValueCellFull!1652 (v!3905 V!4969)) (EmptyCell!1652) )
))
(declare-datatypes ((array!7091 0))(
  ( (array!7092 (arr!3375 (Array (_ BitVec 32) (_ BitVec 64))) (size!3668 (_ BitVec 32))) )
))
(declare-datatypes ((array!7093 0))(
  ( (array!7094 (arr!3376 (Array (_ BitVec 32) ValueCell!1652)) (size!3669 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2212 0))(
  ( (LongMapFixedSize!2213 (defaultEntry!3548 Int) (mask!8368 (_ BitVec 32)) (extraKeys!3289 (_ BitVec 32)) (zeroValue!3391 V!4969) (minValue!3391 V!4969) (_size!1155 (_ BitVec 32)) (_keys!5378 array!7091) (_values!3531 array!7093) (_vacant!1155 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2212)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170634 (= res!81110 (validMask!0 (mask!8368 thiss!1248)))))

(declare-fun b!170635 () Bool)

(declare-fun e!112630 () Bool)

(declare-fun tp_is_empty!3991 () Bool)

(assert (=> b!170635 (= e!112630 tp_is_empty!3991)))

(declare-fun b!170636 () Bool)

(declare-fun e!112631 () Bool)

(assert (=> b!170636 (= e!112631 tp_is_empty!3991)))

(declare-fun b!170637 () Bool)

(declare-fun res!81108 () Bool)

(assert (=> b!170637 (=> (not res!81108) (not e!112632))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170637 (= res!81108 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!112629 () Bool)

(declare-fun e!112627 () Bool)

(declare-fun array_inv!2157 (array!7091) Bool)

(declare-fun array_inv!2158 (array!7093) Bool)

(assert (=> b!170638 (= e!112627 (and tp!15281 tp_is_empty!3991 (array_inv!2157 (_keys!5378 thiss!1248)) (array_inv!2158 (_values!3531 thiss!1248)) e!112629))))

(declare-fun b!170639 () Bool)

(declare-fun res!81111 () Bool)

(assert (=> b!170639 (=> (not res!81111) (not e!112632))))

(assert (=> b!170639 (= res!81111 (and (= (size!3669 (_values!3531 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8368 thiss!1248))) (= (size!3668 (_keys!5378 thiss!1248)) (size!3669 (_values!3531 thiss!1248))) (bvsge (mask!8368 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3289 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3289 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3289 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3289 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!3289 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3289 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!3289 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!170640 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7091 (_ BitVec 32)) Bool)

(assert (=> b!170640 (= e!112632 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5378 thiss!1248) (mask!8368 thiss!1248))))))

(declare-fun mapIsEmpty!6773 () Bool)

(declare-fun mapRes!6773 () Bool)

(assert (=> mapIsEmpty!6773 mapRes!6773))

(declare-fun b!170641 () Bool)

(assert (=> b!170641 (= e!112629 (and e!112631 mapRes!6773))))

(declare-fun condMapEmpty!6773 () Bool)

(declare-fun mapDefault!6773 () ValueCell!1652)

