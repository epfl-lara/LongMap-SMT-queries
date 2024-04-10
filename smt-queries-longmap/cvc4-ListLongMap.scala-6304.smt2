; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80700 () Bool)

(assert start!80700)

(declare-fun b!946635 () Bool)

(declare-fun b_free!18149 () Bool)

(declare-fun b_next!18149 () Bool)

(assert (=> b!946635 (= b_free!18149 (not b_next!18149))))

(declare-fun tp!62992 () Bool)

(declare-fun b_and!29571 () Bool)

(assert (=> b!946635 (= tp!62992 b_and!29571)))

(declare-fun b!946630 () Bool)

(declare-fun e!532679 () Bool)

(declare-fun tp_is_empty!20657 () Bool)

(assert (=> b!946630 (= e!532679 tp_is_empty!20657)))

(declare-fun b!946632 () Bool)

(declare-fun e!532682 () Bool)

(declare-datatypes ((V!32507 0))(
  ( (V!32508 (val!10379 Int)) )
))
(declare-datatypes ((ValueCell!9847 0))(
  ( (ValueCellFull!9847 (v!12913 V!32507)) (EmptyCell!9847) )
))
(declare-datatypes ((array!57302 0))(
  ( (array!57303 (arr!27566 (Array (_ BitVec 32) ValueCell!9847)) (size!28037 (_ BitVec 32))) )
))
(declare-datatypes ((array!57304 0))(
  ( (array!57305 (arr!27567 (Array (_ BitVec 32) (_ BitVec 64))) (size!28038 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4844 0))(
  ( (LongMapFixedSize!4845 (defaultEntry!5719 Int) (mask!27428 (_ BitVec 32)) (extraKeys!5451 (_ BitVec 32)) (zeroValue!5555 V!32507) (minValue!5555 V!32507) (_size!2477 (_ BitVec 32)) (_keys!10616 array!57304) (_values!5742 array!57302) (_vacant!2477 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4844)

(assert (=> b!946632 (= e!532682 (or (not (= (size!28037 (_values!5742 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27428 thiss!1141)))) (not (= (size!28038 (_keys!10616 thiss!1141)) (size!28037 (_values!5742 thiss!1141)))) (bvslt (mask!27428 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5451 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!32846 () Bool)

(declare-fun mapRes!32846 () Bool)

(declare-fun tp!62991 () Bool)

(assert (=> mapNonEmpty!32846 (= mapRes!32846 (and tp!62991 e!532679))))

(declare-fun mapRest!32846 () (Array (_ BitVec 32) ValueCell!9847))

(declare-fun mapKey!32846 () (_ BitVec 32))

(declare-fun mapValue!32846 () ValueCell!9847)

(assert (=> mapNonEmpty!32846 (= (arr!27566 (_values!5742 thiss!1141)) (store mapRest!32846 mapKey!32846 mapValue!32846))))

(declare-fun mapIsEmpty!32846 () Bool)

(assert (=> mapIsEmpty!32846 mapRes!32846))

(declare-fun b!946633 () Bool)

(declare-fun e!532681 () Bool)

(assert (=> b!946633 (= e!532681 tp_is_empty!20657)))

(declare-fun b!946634 () Bool)

(declare-fun e!532684 () Bool)

(assert (=> b!946634 (= e!532684 (and e!532681 mapRes!32846))))

(declare-fun condMapEmpty!32846 () Bool)

(declare-fun mapDefault!32846 () ValueCell!9847)

