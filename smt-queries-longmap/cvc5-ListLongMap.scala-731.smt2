; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16988 () Bool)

(assert start!16988)

(declare-fun b!170742 () Bool)

(declare-fun b_free!4225 () Bool)

(declare-fun b_next!4225 () Bool)

(assert (=> b!170742 (= b_free!4225 (not b_next!4225))))

(declare-fun tp!15302 () Bool)

(declare-fun b_and!10639 () Bool)

(assert (=> b!170742 (= tp!15302 b_and!10639)))

(declare-fun res!81162 () Bool)

(declare-fun e!112702 () Bool)

(assert (=> start!16988 (=> (not res!81162) (not e!112702))))

(declare-datatypes ((V!4977 0))(
  ( (V!4978 (val!2043 Int)) )
))
(declare-datatypes ((ValueCell!1655 0))(
  ( (ValueCellFull!1655 (v!3908 V!4977)) (EmptyCell!1655) )
))
(declare-datatypes ((array!7105 0))(
  ( (array!7106 (arr!3381 (Array (_ BitVec 32) (_ BitVec 64))) (size!3674 (_ BitVec 32))) )
))
(declare-datatypes ((array!7107 0))(
  ( (array!7108 (arr!3382 (Array (_ BitVec 32) ValueCell!1655)) (size!3675 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2218 0))(
  ( (LongMapFixedSize!2219 (defaultEntry!3551 Int) (mask!8375 (_ BitVec 32)) (extraKeys!3292 (_ BitVec 32)) (zeroValue!3394 V!4977) (minValue!3394 V!4977) (_size!1158 (_ BitVec 32)) (_keys!5382 array!7105) (_values!3534 array!7107) (_vacant!1158 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2218)

(declare-fun valid!944 (LongMapFixedSize!2218) Bool)

(assert (=> start!16988 (= res!81162 (valid!944 thiss!1248))))

(assert (=> start!16988 e!112702))

(declare-fun e!112701 () Bool)

(assert (=> start!16988 e!112701))

(assert (=> start!16988 true))

(declare-fun b!170737 () Bool)

(declare-fun res!81163 () Bool)

(assert (=> b!170737 (=> (not res!81163) (not e!112702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7105 (_ BitVec 32)) Bool)

(assert (=> b!170737 (= res!81163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5382 thiss!1248) (mask!8375 thiss!1248)))))

(declare-fun mapIsEmpty!6785 () Bool)

(declare-fun mapRes!6785 () Bool)

(assert (=> mapIsEmpty!6785 mapRes!6785))

(declare-fun b!170738 () Bool)

(declare-fun res!81165 () Bool)

(assert (=> b!170738 (=> (not res!81165) (not e!112702))))

(assert (=> b!170738 (= res!81165 (and (= (size!3675 (_values!3534 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8375 thiss!1248))) (= (size!3674 (_keys!5382 thiss!1248)) (size!3675 (_values!3534 thiss!1248))) (bvsge (mask!8375 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3292 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3292 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3292 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3292 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!3292 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3292 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!3292 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!170739 () Bool)

(declare-fun res!81161 () Bool)

(assert (=> b!170739 (=> (not res!81161) (not e!112702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170739 (= res!81161 (validMask!0 (mask!8375 thiss!1248)))))

(declare-fun mapNonEmpty!6785 () Bool)

(declare-fun tp!15301 () Bool)

(declare-fun e!112699 () Bool)

(assert (=> mapNonEmpty!6785 (= mapRes!6785 (and tp!15301 e!112699))))

(declare-fun mapRest!6785 () (Array (_ BitVec 32) ValueCell!1655))

(declare-fun mapKey!6785 () (_ BitVec 32))

(declare-fun mapValue!6785 () ValueCell!1655)

(assert (=> mapNonEmpty!6785 (= (arr!3382 (_values!3534 thiss!1248)) (store mapRest!6785 mapKey!6785 mapValue!6785))))

(declare-fun b!170740 () Bool)

(declare-fun e!112704 () Bool)

(declare-fun tp_is_empty!3997 () Bool)

(assert (=> b!170740 (= e!112704 tp_is_empty!3997)))

(declare-fun b!170741 () Bool)

(declare-fun res!81164 () Bool)

(assert (=> b!170741 (=> (not res!81164) (not e!112702))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170741 (= res!81164 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!112700 () Bool)

(declare-fun array_inv!2161 (array!7105) Bool)

(declare-fun array_inv!2162 (array!7107) Bool)

(assert (=> b!170742 (= e!112701 (and tp!15302 tp_is_empty!3997 (array_inv!2161 (_keys!5382 thiss!1248)) (array_inv!2162 (_values!3534 thiss!1248)) e!112700))))

(declare-fun b!170743 () Bool)

(assert (=> b!170743 (= e!112699 tp_is_empty!3997)))

(declare-fun b!170744 () Bool)

(assert (=> b!170744 (= e!112700 (and e!112704 mapRes!6785))))

(declare-fun condMapEmpty!6785 () Bool)

(declare-fun mapDefault!6785 () ValueCell!1655)

