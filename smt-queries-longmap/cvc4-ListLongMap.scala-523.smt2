; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13132 () Bool)

(assert start!13132)

(declare-fun b!115177 () Bool)

(declare-fun b_free!2673 () Bool)

(declare-fun b_next!2673 () Bool)

(assert (=> b!115177 (= b_free!2673 (not b_next!2673))))

(declare-fun tp!10383 () Bool)

(declare-fun b_and!7143 () Bool)

(assert (=> b!115177 (= tp!10383 b_and!7143)))

(declare-fun b!115183 () Bool)

(declare-fun b_free!2675 () Bool)

(declare-fun b_next!2675 () Bool)

(assert (=> b!115183 (= b_free!2675 (not b_next!2675))))

(declare-fun tp!10382 () Bool)

(declare-fun b_and!7145 () Bool)

(assert (=> b!115183 (= tp!10382 b_and!7145)))

(declare-datatypes ((V!3317 0))(
  ( (V!3318 (val!1421 Int)) )
))
(declare-datatypes ((array!4509 0))(
  ( (array!4510 (arr!2137 (Array (_ BitVec 32) (_ BitVec 64))) (size!2397 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1033 0))(
  ( (ValueCellFull!1033 (v!3011 V!3317)) (EmptyCell!1033) )
))
(declare-datatypes ((array!4511 0))(
  ( (array!4512 (arr!2138 (Array (_ BitVec 32) ValueCell!1033)) (size!2398 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!974 0))(
  ( (LongMapFixedSize!975 (defaultEntry!2696 Int) (mask!6898 (_ BitVec 32)) (extraKeys!2485 (_ BitVec 32)) (zeroValue!2563 V!3317) (minValue!2563 V!3317) (_size!536 (_ BitVec 32)) (_keys!4418 array!4509) (_values!2679 array!4511) (_vacant!536 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!774 0))(
  ( (Cell!775 (v!3012 LongMapFixedSize!974)) )
))
(declare-datatypes ((LongMap!774 0))(
  ( (LongMap!775 (underlying!398 Cell!774)) )
))
(declare-fun thiss!992 () LongMap!774)

(declare-fun tp_is_empty!2753 () Bool)

(declare-fun e!75051 () Bool)

(declare-fun e!75046 () Bool)

(declare-fun array_inv!1343 (array!4509) Bool)

(declare-fun array_inv!1344 (array!4511) Bool)

(assert (=> b!115177 (= e!75051 (and tp!10383 tp_is_empty!2753 (array_inv!1343 (_keys!4418 (v!3012 (underlying!398 thiss!992)))) (array_inv!1344 (_values!2679 (v!3012 (underlying!398 thiss!992)))) e!75046))))

(declare-fun b!115178 () Bool)

(declare-fun e!75050 () Bool)

(assert (=> b!115178 (= e!75050 tp_is_empty!2753)))

(declare-fun b!115179 () Bool)

(declare-fun e!75054 () Bool)

(assert (=> b!115179 (= e!75054 tp_is_empty!2753)))

(declare-fun b!115180 () Bool)

(declare-fun e!75049 () Bool)

(declare-fun e!75045 () Bool)

(assert (=> b!115180 (= e!75049 e!75045)))

(declare-fun b!115181 () Bool)

(declare-fun res!56570 () Bool)

(declare-fun e!75047 () Bool)

(assert (=> b!115181 (=> (not res!56570) (not e!75047))))

(declare-fun newMap!16 () LongMapFixedSize!974)

(declare-fun valid!461 (LongMapFixedSize!974) Bool)

(assert (=> b!115181 (= res!56570 (valid!461 newMap!16))))

(declare-fun b!115182 () Bool)

(declare-fun e!75053 () Bool)

(assert (=> b!115182 (= e!75053 tp_is_empty!2753)))

(declare-fun e!75042 () Bool)

(declare-fun e!75044 () Bool)

(assert (=> b!115183 (= e!75044 (and tp!10382 tp_is_empty!2753 (array_inv!1343 (_keys!4418 newMap!16)) (array_inv!1344 (_values!2679 newMap!16)) e!75042))))

(declare-fun b!115184 () Bool)

(declare-fun e!75043 () Bool)

(assert (=> b!115184 (= e!75043 tp_is_empty!2753)))

(declare-fun mapNonEmpty!4191 () Bool)

(declare-fun mapRes!4192 () Bool)

(declare-fun tp!10381 () Bool)

(assert (=> mapNonEmpty!4191 (= mapRes!4192 (and tp!10381 e!75043))))

(declare-fun mapValue!4192 () ValueCell!1033)

(declare-fun mapRest!4191 () (Array (_ BitVec 32) ValueCell!1033))

(declare-fun mapKey!4191 () (_ BitVec 32))

(assert (=> mapNonEmpty!4191 (= (arr!2138 (_values!2679 newMap!16)) (store mapRest!4191 mapKey!4191 mapValue!4192))))

(declare-fun b!115185 () Bool)

(assert (=> b!115185 (= e!75047 false)))

(declare-datatypes ((tuple2!2508 0))(
  ( (tuple2!2509 (_1!1265 (_ BitVec 64)) (_2!1265 V!3317)) )
))
(declare-datatypes ((List!1666 0))(
  ( (Nil!1663) (Cons!1662 (h!2262 tuple2!2508) (t!5920 List!1666)) )
))
(declare-datatypes ((ListLongMap!1631 0))(
  ( (ListLongMap!1632 (toList!831 List!1666)) )
))
(declare-fun lt!59976 () ListLongMap!1631)

(declare-fun map!1333 (LongMapFixedSize!974) ListLongMap!1631)

(assert (=> b!115185 (= lt!59976 (map!1333 newMap!16))))

(declare-fun lt!59975 () ListLongMap!1631)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!512 (array!4509 array!4511 (_ BitVec 32) (_ BitVec 32) V!3317 V!3317 (_ BitVec 32) Int) ListLongMap!1631)

(assert (=> b!115185 (= lt!59975 (getCurrentListMap!512 (_keys!4418 (v!3012 (underlying!398 thiss!992))) (_values!2679 (v!3012 (underlying!398 thiss!992))) (mask!6898 (v!3012 (underlying!398 thiss!992))) (extraKeys!2485 (v!3012 (underlying!398 thiss!992))) (zeroValue!2563 (v!3012 (underlying!398 thiss!992))) (minValue!2563 (v!3012 (underlying!398 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2696 (v!3012 (underlying!398 thiss!992)))))))

(declare-fun b!115186 () Bool)

(declare-fun res!56569 () Bool)

(assert (=> b!115186 (=> (not res!56569) (not e!75047))))

(assert (=> b!115186 (= res!56569 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2397 (_keys!4418 (v!3012 (underlying!398 thiss!992)))))))))

(declare-fun b!115187 () Bool)

(declare-fun res!56572 () Bool)

(assert (=> b!115187 (=> (not res!56572) (not e!75047))))

(assert (=> b!115187 (= res!56572 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6898 newMap!16)) (_size!536 (v!3012 (underlying!398 thiss!992)))))))

(declare-fun mapIsEmpty!4191 () Bool)

(assert (=> mapIsEmpty!4191 mapRes!4192))

(declare-fun b!115188 () Bool)

(declare-fun mapRes!4191 () Bool)

(assert (=> b!115188 (= e!75046 (and e!75053 mapRes!4191))))

(declare-fun condMapEmpty!4191 () Bool)

(declare-fun mapDefault!4191 () ValueCell!1033)

