; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16868 () Bool)

(assert start!16868)

(declare-fun b!169906 () Bool)

(declare-fun b_free!4171 () Bool)

(declare-fun b_next!4171 () Bool)

(assert (=> b!169906 (= b_free!4171 (not b_next!4171))))

(declare-fun tp!15122 () Bool)

(declare-fun b_and!10585 () Bool)

(assert (=> b!169906 (= tp!15122 b_and!10585)))

(declare-fun res!80774 () Bool)

(declare-fun e!112068 () Bool)

(assert (=> start!16868 (=> (not res!80774) (not e!112068))))

(declare-datatypes ((V!4905 0))(
  ( (V!4906 (val!2016 Int)) )
))
(declare-datatypes ((ValueCell!1628 0))(
  ( (ValueCellFull!1628 (v!3881 V!4905)) (EmptyCell!1628) )
))
(declare-datatypes ((array!6987 0))(
  ( (array!6988 (arr!3327 (Array (_ BitVec 32) (_ BitVec 64))) (size!3617 (_ BitVec 32))) )
))
(declare-datatypes ((array!6989 0))(
  ( (array!6990 (arr!3328 (Array (_ BitVec 32) ValueCell!1628)) (size!3618 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2164 0))(
  ( (LongMapFixedSize!2165 (defaultEntry!3524 Int) (mask!8321 (_ BitVec 32)) (extraKeys!3265 (_ BitVec 32)) (zeroValue!3367 V!4905) (minValue!3367 V!4905) (_size!1131 (_ BitVec 32)) (_keys!5351 array!6987) (_values!3507 array!6989) (_vacant!1131 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2164)

(declare-fun valid!930 (LongMapFixedSize!2164) Bool)

(assert (=> start!16868 (= res!80774 (valid!930 thiss!1248))))

(assert (=> start!16868 e!112068))

(declare-fun e!112067 () Bool)

(assert (=> start!16868 e!112067))

(assert (=> start!16868 true))

(declare-fun mapIsEmpty!6686 () Bool)

(declare-fun mapRes!6686 () Bool)

(assert (=> mapIsEmpty!6686 mapRes!6686))

(declare-fun b!169901 () Bool)

(declare-fun e!112064 () Bool)

(declare-fun tp_is_empty!3943 () Bool)

(assert (=> b!169901 (= e!112064 tp_is_empty!3943)))

(declare-fun b!169902 () Bool)

(declare-fun res!80775 () Bool)

(assert (=> b!169902 (=> (not res!80775) (not e!112068))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169902 (= res!80775 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6686 () Bool)

(declare-fun tp!15121 () Bool)

(declare-fun e!112066 () Bool)

(assert (=> mapNonEmpty!6686 (= mapRes!6686 (and tp!15121 e!112066))))

(declare-fun mapRest!6686 () (Array (_ BitVec 32) ValueCell!1628))

(declare-fun mapValue!6686 () ValueCell!1628)

(declare-fun mapKey!6686 () (_ BitVec 32))

(assert (=> mapNonEmpty!6686 (= (arr!3328 (_values!3507 thiss!1248)) (store mapRest!6686 mapKey!6686 mapValue!6686))))

(declare-fun b!169903 () Bool)

(assert (=> b!169903 (= e!112068 (and (= (size!3618 (_values!3507 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8321 thiss!1248))) (not (= (size!3617 (_keys!5351 thiss!1248)) (size!3618 (_values!3507 thiss!1248))))))))

(declare-fun b!169904 () Bool)

(declare-fun e!112063 () Bool)

(assert (=> b!169904 (= e!112063 (and e!112064 mapRes!6686))))

(declare-fun condMapEmpty!6686 () Bool)

(declare-fun mapDefault!6686 () ValueCell!1628)

