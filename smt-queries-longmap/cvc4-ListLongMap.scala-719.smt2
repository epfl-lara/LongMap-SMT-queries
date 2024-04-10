; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16822 () Bool)

(assert start!16822)

(declare-fun b!169619 () Bool)

(declare-fun b_free!4155 () Bool)

(declare-fun b_next!4155 () Bool)

(assert (=> b!169619 (= b_free!4155 (not b_next!4155))))

(declare-fun tp!15071 () Bool)

(declare-fun b_and!10569 () Bool)

(assert (=> b!169619 (= tp!15071 b_and!10569)))

(declare-fun b!169627 () Bool)

(declare-fun b_free!4157 () Bool)

(declare-fun b_next!4157 () Bool)

(assert (=> b!169627 (= b_free!4157 (not b_next!4157))))

(declare-fun tp!15072 () Bool)

(declare-fun b_and!10571 () Bool)

(assert (=> b!169627 (= tp!15072 b_and!10571)))

(declare-fun tp_is_empty!3929 () Bool)

(declare-fun e!111856 () Bool)

(declare-fun e!111859 () Bool)

(declare-datatypes ((V!4885 0))(
  ( (V!4886 (val!2009 Int)) )
))
(declare-datatypes ((ValueCell!1621 0))(
  ( (ValueCellFull!1621 (v!3874 V!4885)) (EmptyCell!1621) )
))
(declare-datatypes ((array!6955 0))(
  ( (array!6956 (arr!3313 (Array (_ BitVec 32) (_ BitVec 64))) (size!3601 (_ BitVec 32))) )
))
(declare-datatypes ((array!6957 0))(
  ( (array!6958 (arr!3314 (Array (_ BitVec 32) ValueCell!1621)) (size!3602 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2150 0))(
  ( (LongMapFixedSize!2151 (defaultEntry!3517 Int) (mask!8304 (_ BitVec 32)) (extraKeys!3258 (_ BitVec 32)) (zeroValue!3360 V!4885) (minValue!3360 V!4885) (_size!1124 (_ BitVec 32)) (_keys!5342 array!6955) (_values!3500 array!6957) (_vacant!1124 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3230 0))(
  ( (tuple2!3231 (_1!1626 Bool) (_2!1626 LongMapFixedSize!2150)) )
))
(declare-fun err!95 () tuple2!3230)

(declare-fun array_inv!2125 (array!6955) Bool)

(declare-fun array_inv!2126 (array!6957) Bool)

(assert (=> b!169619 (= e!111856 (and tp!15071 tp_is_empty!3929 (array_inv!2125 (_keys!5342 (_2!1626 err!95))) (array_inv!2126 (_values!3500 (_2!1626 err!95))) e!111859))))

(declare-fun b!169620 () Bool)

(declare-fun e!111860 () Bool)

(assert (=> b!169620 (= e!111860 tp_is_empty!3929)))

(declare-fun mapNonEmpty!6656 () Bool)

(declare-fun mapRes!6657 () Bool)

(declare-fun tp!15070 () Bool)

(declare-fun e!111858 () Bool)

(assert (=> mapNonEmpty!6656 (= mapRes!6657 (and tp!15070 e!111858))))

(declare-fun mapKey!6657 () (_ BitVec 32))

(declare-fun mapValue!6656 () ValueCell!1621)

(declare-fun mapRest!6656 () (Array (_ BitVec 32) ValueCell!1621))

(assert (=> mapNonEmpty!6656 (= (arr!3314 (_values!3500 (_2!1626 err!95))) (store mapRest!6656 mapKey!6657 mapValue!6656))))

(declare-fun b!169621 () Bool)

(declare-fun e!111852 () Bool)

(assert (=> b!169621 (= e!111852 false)))

(declare-fun lt!84949 () Bool)

(declare-fun valid!925 (LongMapFixedSize!2150) Bool)

(assert (=> b!169621 (= lt!84949 (valid!925 (_2!1626 err!95)))))

(assert (=> b!169621 true))

(assert (=> b!169621 e!111856))

(declare-fun b!169622 () Bool)

(declare-fun res!80649 () Bool)

(declare-fun e!111850 () Bool)

(assert (=> b!169622 (=> (not res!80649) (not e!111850))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169622 (= res!80649 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6657 () Bool)

(declare-fun mapRes!6656 () Bool)

(declare-fun tp!15069 () Bool)

(declare-fun e!111849 () Bool)

(assert (=> mapNonEmpty!6657 (= mapRes!6656 (and tp!15069 e!111849))))

(declare-fun mapValue!6657 () ValueCell!1621)

(declare-fun mapRest!6657 () (Array (_ BitVec 32) ValueCell!1621))

(declare-fun mapKey!6656 () (_ BitVec 32))

(declare-fun thiss!1248 () LongMapFixedSize!2150)

(assert (=> mapNonEmpty!6657 (= (arr!3314 (_values!3500 thiss!1248)) (store mapRest!6657 mapKey!6656 mapValue!6657))))

(declare-fun b!169624 () Bool)

(declare-fun e!111851 () Bool)

(declare-fun e!111853 () Bool)

(assert (=> b!169624 (= e!111851 (and e!111853 mapRes!6656))))

(declare-fun condMapEmpty!6657 () Bool)

(declare-fun mapDefault!6656 () ValueCell!1621)

