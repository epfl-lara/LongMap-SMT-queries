; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11348 () Bool)

(assert start!11348)

(declare-fun b!93959 () Bool)

(declare-fun b_free!2389 () Bool)

(declare-fun b_next!2389 () Bool)

(assert (=> b!93959 (= b_free!2389 (not b_next!2389))))

(declare-fun tp!9434 () Bool)

(declare-fun b_and!5731 () Bool)

(assert (=> b!93959 (= tp!9434 b_and!5731)))

(declare-fun b!93971 () Bool)

(declare-fun b_free!2391 () Bool)

(declare-fun b_next!2391 () Bool)

(assert (=> b!93971 (= b_free!2391 (not b_next!2391))))

(declare-fun tp!9433 () Bool)

(declare-fun b_and!5733 () Bool)

(assert (=> b!93971 (= tp!9433 b_and!5733)))

(declare-fun b!93957 () Bool)

(declare-fun e!61341 () Bool)

(declare-fun tp_is_empty!2611 () Bool)

(assert (=> b!93957 (= e!61341 tp_is_empty!2611)))

(declare-fun b!93958 () Bool)

(declare-fun res!47619 () Bool)

(declare-fun e!61353 () Bool)

(assert (=> b!93958 (=> (not res!47619) (not e!61353))))

(declare-datatypes ((V!3129 0))(
  ( (V!3130 (val!1350 Int)) )
))
(declare-datatypes ((array!4197 0))(
  ( (array!4198 (arr!1995 (Array (_ BitVec 32) (_ BitVec 64))) (size!2243 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!962 0))(
  ( (ValueCellFull!962 (v!2759 V!3129)) (EmptyCell!962) )
))
(declare-datatypes ((array!4199 0))(
  ( (array!4200 (arr!1996 (Array (_ BitVec 32) ValueCell!962)) (size!2244 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!832 0))(
  ( (LongMapFixedSize!833 (defaultEntry!2435 Int) (mask!6510 (_ BitVec 32)) (extraKeys!2264 (_ BitVec 32)) (zeroValue!2322 V!3129) (minValue!2322 V!3129) (_size!465 (_ BitVec 32)) (_keys!4117 array!4197) (_values!2418 array!4199) (_vacant!465 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!632 0))(
  ( (Cell!633 (v!2760 LongMapFixedSize!832)) )
))
(declare-datatypes ((LongMap!632 0))(
  ( (LongMap!633 (underlying!327 Cell!632)) )
))
(declare-fun thiss!992 () LongMap!632)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!93958 (= res!47619 (validMask!0 (mask!6510 (v!2760 (underlying!327 thiss!992)))))))

(declare-fun e!61350 () Bool)

(declare-fun e!61343 () Bool)

(declare-fun array_inv!1241 (array!4197) Bool)

(declare-fun array_inv!1242 (array!4199) Bool)

(assert (=> b!93959 (= e!61343 (and tp!9434 tp_is_empty!2611 (array_inv!1241 (_keys!4117 (v!2760 (underlying!327 thiss!992)))) (array_inv!1242 (_values!2418 (v!2760 (underlying!327 thiss!992)))) e!61350))))

(declare-fun b!93960 () Bool)

(declare-datatypes ((Unit!2795 0))(
  ( (Unit!2796) )
))
(declare-fun e!61354 () Unit!2795)

(declare-fun Unit!2797 () Unit!2795)

(assert (=> b!93960 (= e!61354 Unit!2797)))

(declare-fun b!93961 () Bool)

(declare-fun e!61348 () Bool)

(declare-fun e!61356 () Bool)

(assert (=> b!93961 (= e!61348 e!61356)))

(declare-fun res!47624 () Bool)

(assert (=> b!93961 (=> (not res!47624) (not e!61356))))

(declare-datatypes ((tuple2!2308 0))(
  ( (tuple2!2309 (_1!1165 (_ BitVec 64)) (_2!1165 V!3129)) )
))
(declare-datatypes ((List!1567 0))(
  ( (Nil!1564) (Cons!1563 (h!2155 tuple2!2308) (t!5465 List!1567)) )
))
(declare-datatypes ((ListLongMap!1519 0))(
  ( (ListLongMap!1520 (toList!775 List!1567)) )
))
(declare-fun lt!46560 () ListLongMap!1519)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!46558 () ListLongMap!1519)

(assert (=> b!93961 (= res!47624 (and (= lt!46560 lt!46558) (not (= (select (arr!1995 (_keys!4117 (v!2760 (underlying!327 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1995 (_keys!4117 (v!2760 (underlying!327 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!832)

(declare-fun map!1242 (LongMapFixedSize!832) ListLongMap!1519)

(assert (=> b!93961 (= lt!46558 (map!1242 newMap!16))))

(declare-fun getCurrentListMap!467 (array!4197 array!4199 (_ BitVec 32) (_ BitVec 32) V!3129 V!3129 (_ BitVec 32) Int) ListLongMap!1519)

(assert (=> b!93961 (= lt!46560 (getCurrentListMap!467 (_keys!4117 (v!2760 (underlying!327 thiss!992))) (_values!2418 (v!2760 (underlying!327 thiss!992))) (mask!6510 (v!2760 (underlying!327 thiss!992))) (extraKeys!2264 (v!2760 (underlying!327 thiss!992))) (zeroValue!2322 (v!2760 (underlying!327 thiss!992))) (minValue!2322 (v!2760 (underlying!327 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2435 (v!2760 (underlying!327 thiss!992)))))))

(declare-fun b!93962 () Bool)

(declare-fun e!61355 () Bool)

(declare-fun mapRes!3670 () Bool)

(assert (=> b!93962 (= e!61350 (and e!61355 mapRes!3670))))

(declare-fun condMapEmpty!3669 () Bool)

(declare-fun mapDefault!3670 () ValueCell!962)

