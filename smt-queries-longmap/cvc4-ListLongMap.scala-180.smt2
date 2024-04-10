; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3496 () Bool)

(assert start!3496)

(declare-fun b!23189 () Bool)

(declare-fun b_free!761 () Bool)

(declare-fun b_next!761 () Bool)

(assert (=> b!23189 (= b_free!761 (not b_next!761))))

(declare-fun tp!3529 () Bool)

(declare-fun b_and!1483 () Bool)

(assert (=> b!23189 (= tp!3529 b_and!1483)))

(declare-fun bm!1858 () Bool)

(declare-datatypes ((V!1191 0))(
  ( (V!1192 (val!539 Int)) )
))
(declare-datatypes ((ValueCell!313 0))(
  ( (ValueCellFull!313 (v!1605 V!1191)) (EmptyCell!313) )
))
(declare-datatypes ((array!1287 0))(
  ( (array!1288 (arr!609 (Array (_ BitVec 32) ValueCell!313)) (size!705 (_ BitVec 32))) )
))
(declare-datatypes ((array!1289 0))(
  ( (array!1290 (arr!610 (Array (_ BitVec 32) (_ BitVec 64))) (size!706 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!212 0))(
  ( (LongMapFixedSize!213 (defaultEntry!1744 Int) (mask!4731 (_ BitVec 32)) (extraKeys!1642 (_ BitVec 32)) (zeroValue!1667 V!1191) (minValue!1667 V!1191) (_size!151 (_ BitVec 32)) (_keys!3165 array!1289) (_values!1730 array!1287) (_vacant!151 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!958 0))(
  ( (tuple2!959 (_1!488 Bool) (_2!488 LongMapFixedSize!212)) )
))
(declare-fun call!1862 () tuple2!958)

(declare-fun call!1861 () tuple2!958)

(assert (=> bm!1858 (= call!1862 call!1861)))

(declare-fun res!14340 () Bool)

(declare-fun e!15091 () Bool)

(assert (=> start!3496 (=> (not res!14340) (not e!15091))))

(declare-datatypes ((Cell!212 0))(
  ( (Cell!213 (v!1606 LongMapFixedSize!212)) )
))
(declare-datatypes ((LongMap!212 0))(
  ( (LongMap!213 (underlying!117 Cell!212)) )
))
(declare-fun thiss!938 () LongMap!212)

(declare-fun valid!103 (LongMap!212) Bool)

(assert (=> start!3496 (= res!14340 (valid!103 thiss!938))))

(assert (=> start!3496 e!15091))

(declare-fun e!15082 () Bool)

(assert (=> start!3496 e!15082))

(declare-fun b!23181 () Bool)

(declare-fun e!15080 () Bool)

(assert (=> b!23181 (= e!15082 e!15080)))

(declare-fun b!23182 () Bool)

(declare-fun e!15085 () Bool)

(declare-fun tp_is_empty!1025 () Bool)

(assert (=> b!23182 (= e!15085 tp_is_empty!1025)))

(declare-fun b!23183 () Bool)

(declare-fun e!15090 () Bool)

(declare-fun mapRes!1028 () Bool)

(assert (=> b!23183 (= e!15090 (and e!15085 mapRes!1028))))

(declare-fun condMapEmpty!1028 () Bool)

(declare-fun mapDefault!1028 () ValueCell!313)

