; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16212 () Bool)

(assert start!16212)

(declare-fun b!161715 () Bool)

(declare-fun b_free!3673 () Bool)

(declare-fun b_next!3673 () Bool)

(assert (=> b!161715 (= b_free!3673 (not b_next!3673))))

(declare-fun tp!13589 () Bool)

(declare-fun b_and!10087 () Bool)

(assert (=> b!161715 (= tp!13589 b_and!10087)))

(declare-fun b!161714 () Bool)

(declare-fun e!105753 () Bool)

(declare-fun tp_is_empty!3475 () Bool)

(assert (=> b!161714 (= e!105753 tp_is_empty!3475)))

(declare-fun e!105752 () Bool)

(declare-fun e!105749 () Bool)

(declare-datatypes ((V!4281 0))(
  ( (V!4282 (val!1782 Int)) )
))
(declare-datatypes ((ValueCell!1394 0))(
  ( (ValueCellFull!1394 (v!3647 V!4281)) (EmptyCell!1394) )
))
(declare-datatypes ((array!6029 0))(
  ( (array!6030 (arr!2859 (Array (_ BitVec 32) (_ BitVec 64))) (size!3143 (_ BitVec 32))) )
))
(declare-datatypes ((array!6031 0))(
  ( (array!6032 (arr!2860 (Array (_ BitVec 32) ValueCell!1394)) (size!3144 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1696 0))(
  ( (LongMapFixedSize!1697 (defaultEntry!3290 Int) (mask!7890 (_ BitVec 32)) (extraKeys!3031 (_ BitVec 32)) (zeroValue!3133 V!4281) (minValue!3133 V!4281) (_size!897 (_ BitVec 32)) (_keys!5091 array!6029) (_values!3273 array!6031) (_vacant!897 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1696)

(declare-fun array_inv!1827 (array!6029) Bool)

(declare-fun array_inv!1828 (array!6031) Bool)

(assert (=> b!161715 (= e!105749 (and tp!13589 tp_is_empty!3475 (array_inv!1827 (_keys!5091 thiss!1248)) (array_inv!1828 (_values!3273 thiss!1248)) e!105752))))

(declare-fun mapNonEmpty!5900 () Bool)

(declare-fun mapRes!5900 () Bool)

(declare-fun tp!13588 () Bool)

(declare-fun e!105748 () Bool)

(assert (=> mapNonEmpty!5900 (= mapRes!5900 (and tp!13588 e!105748))))

(declare-fun mapRest!5900 () (Array (_ BitVec 32) ValueCell!1394))

(declare-fun mapKey!5900 () (_ BitVec 32))

(declare-fun mapValue!5900 () ValueCell!1394)

(assert (=> mapNonEmpty!5900 (= (arr!2860 (_values!3273 thiss!1248)) (store mapRest!5900 mapKey!5900 mapValue!5900))))

(declare-fun b!161716 () Bool)

(declare-fun res!76618 () Bool)

(declare-fun e!105751 () Bool)

(assert (=> b!161716 (=> (not res!76618) (not e!105751))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161716 (= res!76618 (not (= key!828 (bvneg key!828))))))

(declare-fun res!76619 () Bool)

(assert (=> start!16212 (=> (not res!76619) (not e!105751))))

(declare-fun valid!775 (LongMapFixedSize!1696) Bool)

(assert (=> start!16212 (= res!76619 (valid!775 thiss!1248))))

(assert (=> start!16212 e!105751))

(assert (=> start!16212 e!105749))

(assert (=> start!16212 true))

(declare-fun b!161717 () Bool)

(assert (=> b!161717 (= e!105752 (and e!105753 mapRes!5900))))

(declare-fun condMapEmpty!5900 () Bool)

(declare-fun mapDefault!5900 () ValueCell!1394)

