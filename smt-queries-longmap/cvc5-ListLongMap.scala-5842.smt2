; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75438 () Bool)

(assert start!75438)

(declare-fun b!888035 () Bool)

(declare-fun b_free!15553 () Bool)

(declare-fun b_next!15553 () Bool)

(assert (=> b!888035 (= b_free!15553 (not b_next!15553))))

(declare-fun tp!54606 () Bool)

(declare-fun b_and!25789 () Bool)

(assert (=> b!888035 (= tp!54606 b_and!25789)))

(declare-fun b!888032 () Bool)

(declare-fun res!602248 () Bool)

(declare-fun e!494744 () Bool)

(assert (=> b!888032 (=> (not res!602248) (not e!494744))))

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((array!51730 0))(
  ( (array!51731 (arr!24877 (Array (_ BitVec 32) (_ BitVec 64))) (size!25317 (_ BitVec 32))) )
))
(declare-datatypes ((V!28807 0))(
  ( (V!28808 (val!8991 Int)) )
))
(declare-datatypes ((ValueCell!8459 0))(
  ( (ValueCellFull!8459 (v!11463 V!28807)) (EmptyCell!8459) )
))
(declare-datatypes ((array!51732 0))(
  ( (array!51733 (arr!24878 (Array (_ BitVec 32) ValueCell!8459)) (size!25318 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3934 0))(
  ( (LongMapFixedSize!3935 (defaultEntry!5158 Int) (mask!25570 (_ BitVec 32)) (extraKeys!4852 (_ BitVec 32)) (zeroValue!4956 V!28807) (minValue!4956 V!28807) (_size!2022 (_ BitVec 32)) (_keys!9835 array!51730) (_values!5143 array!51732) (_vacant!2022 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3934)

(assert (=> b!888032 (= res!602248 (and (= key!785 (bvneg key!785)) (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!888033 () Bool)

(declare-fun e!494745 () Bool)

(declare-fun tp_is_empty!17881 () Bool)

(assert (=> b!888033 (= e!494745 tp_is_empty!17881)))

(declare-fun res!602249 () Bool)

(assert (=> start!75438 (=> (not res!602249) (not e!494744))))

(declare-fun valid!1534 (LongMapFixedSize!3934) Bool)

(assert (=> start!75438 (= res!602249 (valid!1534 thiss!1181))))

(assert (=> start!75438 e!494744))

(declare-fun e!494747 () Bool)

(assert (=> start!75438 e!494747))

(assert (=> start!75438 true))

(declare-fun mapNonEmpty!28354 () Bool)

(declare-fun mapRes!28354 () Bool)

(declare-fun tp!54605 () Bool)

(declare-fun e!494746 () Bool)

(assert (=> mapNonEmpty!28354 (= mapRes!28354 (and tp!54605 e!494746))))

(declare-fun mapValue!28354 () ValueCell!8459)

(declare-fun mapRest!28354 () (Array (_ BitVec 32) ValueCell!8459))

(declare-fun mapKey!28354 () (_ BitVec 32))

(assert (=> mapNonEmpty!28354 (= (arr!24878 (_values!5143 thiss!1181)) (store mapRest!28354 mapKey!28354 mapValue!28354))))

(declare-fun b!888034 () Bool)

(declare-fun e!494742 () Bool)

(assert (=> b!888034 (= e!494742 (and e!494745 mapRes!28354))))

(declare-fun condMapEmpty!28354 () Bool)

(declare-fun mapDefault!28354 () ValueCell!8459)

