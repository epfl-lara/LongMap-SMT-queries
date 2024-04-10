; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18196 () Bool)

(assert start!18196)

(declare-fun b!180994 () Bool)

(declare-fun b_free!4471 () Bool)

(declare-fun b_next!4471 () Bool)

(assert (=> b!180994 (= b_free!4471 (not b_next!4471))))

(declare-fun tp!16156 () Bool)

(declare-fun b_and!11013 () Bool)

(assert (=> b!180994 (= tp!16156 b_and!11013)))

(declare-fun mapNonEmpty!7271 () Bool)

(declare-fun mapRes!7271 () Bool)

(declare-fun tp!16157 () Bool)

(declare-fun e!119222 () Bool)

(assert (=> mapNonEmpty!7271 (= mapRes!7271 (and tp!16157 e!119222))))

(declare-datatypes ((V!5305 0))(
  ( (V!5306 (val!2166 Int)) )
))
(declare-datatypes ((ValueCell!1778 0))(
  ( (ValueCellFull!1778 (v!4061 V!5305)) (EmptyCell!1778) )
))
(declare-fun mapRest!7271 () (Array (_ BitVec 32) ValueCell!1778))

(declare-fun mapValue!7271 () ValueCell!1778)

(declare-datatypes ((array!7663 0))(
  ( (array!7664 (arr!3627 (Array (_ BitVec 32) (_ BitVec 64))) (size!3936 (_ BitVec 32))) )
))
(declare-datatypes ((array!7665 0))(
  ( (array!7666 (arr!3628 (Array (_ BitVec 32) ValueCell!1778)) (size!3937 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2464 0))(
  ( (LongMapFixedSize!2465 (defaultEntry!3711 Int) (mask!8724 (_ BitVec 32)) (extraKeys!3448 (_ BitVec 32)) (zeroValue!3552 V!5305) (minValue!3552 V!5305) (_size!1281 (_ BitVec 32)) (_keys!5609 array!7663) (_values!3694 array!7665) (_vacant!1281 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2464)

(declare-fun mapKey!7271 () (_ BitVec 32))

(assert (=> mapNonEmpty!7271 (= (arr!3628 (_values!3694 thiss!1248)) (store mapRest!7271 mapKey!7271 mapValue!7271))))

(declare-fun res!85705 () Bool)

(declare-fun e!119219 () Bool)

(assert (=> start!18196 (=> (not res!85705) (not e!119219))))

(declare-fun valid!1024 (LongMapFixedSize!2464) Bool)

(assert (=> start!18196 (= res!85705 (valid!1024 thiss!1248))))

(assert (=> start!18196 e!119219))

(declare-fun e!119218 () Bool)

(assert (=> start!18196 e!119218))

(assert (=> start!18196 true))

(declare-fun b!180992 () Bool)

(declare-fun res!85706 () Bool)

(declare-fun e!119221 () Bool)

(assert (=> b!180992 (=> (not res!85706) (not e!119221))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3378 0))(
  ( (tuple2!3379 (_1!1700 (_ BitVec 64)) (_2!1700 V!5305)) )
))
(declare-datatypes ((List!2302 0))(
  ( (Nil!2299) (Cons!2298 (h!2924 tuple2!3378) (t!7154 List!2302)) )
))
(declare-datatypes ((ListLongMap!2295 0))(
  ( (ListLongMap!2296 (toList!1163 List!2302)) )
))
(declare-fun contains!1241 (ListLongMap!2295 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!811 (array!7663 array!7665 (_ BitVec 32) (_ BitVec 32) V!5305 V!5305 (_ BitVec 32) Int) ListLongMap!2295)

(assert (=> b!180992 (= res!85706 (contains!1241 (getCurrentListMap!811 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)) key!828))))

(declare-fun b!180993 () Bool)

(assert (=> b!180993 (= e!119219 e!119221)))

(declare-fun res!85703 () Bool)

(assert (=> b!180993 (=> (not res!85703) (not e!119221))))

(declare-datatypes ((SeekEntryResult!597 0))(
  ( (MissingZero!597 (index!4558 (_ BitVec 32))) (Found!597 (index!4559 (_ BitVec 32))) (Intermediate!597 (undefined!1409 Bool) (index!4560 (_ BitVec 32)) (x!19775 (_ BitVec 32))) (Undefined!597) (MissingVacant!597 (index!4561 (_ BitVec 32))) )
))
(declare-fun lt!89476 () SeekEntryResult!597)

(assert (=> b!180993 (= res!85703 (and (not (is-Undefined!597 lt!89476)) (not (is-MissingVacant!597 lt!89476)) (not (is-MissingZero!597 lt!89476)) (is-Found!597 lt!89476)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7663 (_ BitVec 32)) SeekEntryResult!597)

(assert (=> b!180993 (= lt!89476 (seekEntryOrOpen!0 key!828 (_keys!5609 thiss!1248) (mask!8724 thiss!1248)))))

(declare-fun tp_is_empty!4243 () Bool)

(declare-fun e!119217 () Bool)

(declare-fun array_inv!2337 (array!7663) Bool)

(declare-fun array_inv!2338 (array!7665) Bool)

(assert (=> b!180994 (= e!119218 (and tp!16156 tp_is_empty!4243 (array_inv!2337 (_keys!5609 thiss!1248)) (array_inv!2338 (_values!3694 thiss!1248)) e!119217))))

(declare-fun b!180995 () Bool)

(assert (=> b!180995 (= e!119222 tp_is_empty!4243)))

(declare-fun b!180996 () Bool)

(declare-fun res!85704 () Bool)

(assert (=> b!180996 (=> (not res!85704) (not e!119219))))

(assert (=> b!180996 (= res!85704 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7271 () Bool)

(assert (=> mapIsEmpty!7271 mapRes!7271))

(declare-fun b!180997 () Bool)

(assert (=> b!180997 (= e!119221 (and (= (size!3937 (_values!3694 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8724 thiss!1248))) (not (= (size!3936 (_keys!5609 thiss!1248)) (size!3937 (_values!3694 thiss!1248))))))))

(declare-fun b!180998 () Bool)

(declare-fun res!85707 () Bool)

(assert (=> b!180998 (=> (not res!85707) (not e!119221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!180998 (= res!85707 (validMask!0 (mask!8724 thiss!1248)))))

(declare-fun b!180999 () Bool)

(declare-fun e!119216 () Bool)

(assert (=> b!180999 (= e!119216 tp_is_empty!4243)))

(declare-fun b!181000 () Bool)

(assert (=> b!181000 (= e!119217 (and e!119216 mapRes!7271))))

(declare-fun condMapEmpty!7271 () Bool)

(declare-fun mapDefault!7271 () ValueCell!1778)

