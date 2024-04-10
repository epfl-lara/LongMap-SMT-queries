; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14428 () Bool)

(assert start!14428)

(declare-fun b!135957 () Bool)

(declare-fun b_free!2941 () Bool)

(declare-fun b_next!2941 () Bool)

(assert (=> b!135957 (= b_free!2941 (not b_next!2941))))

(declare-fun tp!11278 () Bool)

(declare-fun b_and!8411 () Bool)

(assert (=> b!135957 (= tp!11278 b_and!8411)))

(declare-fun b!135945 () Bool)

(declare-fun b_free!2943 () Bool)

(declare-fun b_next!2943 () Bool)

(assert (=> b!135945 (= b_free!2943 (not b_next!2943))))

(declare-fun tp!11277 () Bool)

(declare-fun b_and!8413 () Bool)

(assert (=> b!135945 (= tp!11277 b_and!8413)))

(declare-fun res!65259 () Bool)

(declare-fun e!88550 () Bool)

(assert (=> start!14428 (=> (not res!65259) (not e!88550))))

(declare-datatypes ((V!3497 0))(
  ( (V!3498 (val!1488 Int)) )
))
(declare-datatypes ((array!4803 0))(
  ( (array!4804 (arr!2271 (Array (_ BitVec 32) (_ BitVec 64))) (size!2541 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1100 0))(
  ( (ValueCellFull!1100 (v!3218 V!3497)) (EmptyCell!1100) )
))
(declare-datatypes ((array!4805 0))(
  ( (array!4806 (arr!2272 (Array (_ BitVec 32) ValueCell!1100)) (size!2542 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1108 0))(
  ( (LongMapFixedSize!1109 (defaultEntry!2888 Int) (mask!7202 (_ BitVec 32)) (extraKeys!2649 (_ BitVec 32)) (zeroValue!2741 V!3497) (minValue!2741 V!3497) (_size!603 (_ BitVec 32)) (_keys!4641 array!4803) (_values!2871 array!4805) (_vacant!603 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!896 0))(
  ( (Cell!897 (v!3219 LongMapFixedSize!1108)) )
))
(declare-datatypes ((LongMap!896 0))(
  ( (LongMap!897 (underlying!459 Cell!896)) )
))
(declare-fun thiss!992 () LongMap!896)

(declare-fun valid!530 (LongMap!896) Bool)

(assert (=> start!14428 (= res!65259 (valid!530 thiss!992))))

(assert (=> start!14428 e!88550))

(declare-fun e!88548 () Bool)

(assert (=> start!14428 e!88548))

(assert (=> start!14428 true))

(declare-fun e!88555 () Bool)

(assert (=> start!14428 e!88555))

(declare-fun b!135944 () Bool)

(declare-fun e!88556 () Bool)

(declare-fun e!88549 () Bool)

(assert (=> b!135944 (= e!88556 e!88549)))

(declare-fun tp_is_empty!2887 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1108)

(declare-fun e!88558 () Bool)

(declare-fun array_inv!1427 (array!4803) Bool)

(declare-fun array_inv!1428 (array!4805) Bool)

(assert (=> b!135945 (= e!88555 (and tp!11277 tp_is_empty!2887 (array_inv!1427 (_keys!4641 newMap!16)) (array_inv!1428 (_values!2871 newMap!16)) e!88558))))

(declare-fun b!135946 () Bool)

(declare-fun e!88546 () Bool)

(assert (=> b!135946 (= e!88546 tp_is_empty!2887)))

(declare-fun b!135947 () Bool)

(declare-fun res!65257 () Bool)

(assert (=> b!135947 (=> (not res!65257) (not e!88550))))

(assert (=> b!135947 (= res!65257 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7202 newMap!16)) (_size!603 (v!3219 (underlying!459 thiss!992)))))))

(declare-fun mapIsEmpty!4683 () Bool)

(declare-fun mapRes!4683 () Bool)

(assert (=> mapIsEmpty!4683 mapRes!4683))

(declare-fun mapIsEmpty!4684 () Bool)

(declare-fun mapRes!4684 () Bool)

(assert (=> mapIsEmpty!4684 mapRes!4684))

(declare-fun b!135948 () Bool)

(declare-fun e!88551 () Bool)

(declare-fun e!88544 () Bool)

(assert (=> b!135948 (= e!88551 e!88544)))

(declare-fun res!65260 () Bool)

(assert (=> b!135948 (=> (not res!65260) (not e!88544))))

(declare-datatypes ((tuple2!2638 0))(
  ( (tuple2!2639 (_1!1330 (_ BitVec 64)) (_2!1330 V!3497)) )
))
(declare-datatypes ((List!1722 0))(
  ( (Nil!1719) (Cons!1718 (h!2324 tuple2!2638) (t!6206 List!1722)) )
))
(declare-datatypes ((ListLongMap!1713 0))(
  ( (ListLongMap!1714 (toList!872 List!1722)) )
))
(declare-fun lt!70938 () ListLongMap!1713)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!904 (ListLongMap!1713 (_ BitVec 64)) Bool)

(assert (=> b!135948 (= res!65260 (contains!904 lt!70938 (select (arr!2271 (_keys!4641 (v!3219 (underlying!459 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2640 0))(
  ( (tuple2!2641 (_1!1331 Bool) (_2!1331 LongMapFixedSize!1108)) )
))
(declare-fun lt!70939 () tuple2!2640)

(declare-fun update!197 (LongMapFixedSize!1108 (_ BitVec 64) V!3497) tuple2!2640)

(declare-fun get!1492 (ValueCell!1100 V!3497) V!3497)

(declare-fun dynLambda!428 (Int (_ BitVec 64)) V!3497)

(assert (=> b!135948 (= lt!70939 (update!197 newMap!16 (select (arr!2271 (_keys!4641 (v!3219 (underlying!459 thiss!992)))) from!355) (get!1492 (select (arr!2272 (_values!2871 (v!3219 (underlying!459 thiss!992)))) from!355) (dynLambda!428 (defaultEntry!2888 (v!3219 (underlying!459 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!135949 () Bool)

(declare-fun res!65258 () Bool)

(assert (=> b!135949 (=> (not res!65258) (not e!88550))))

(declare-fun valid!531 (LongMapFixedSize!1108) Bool)

(assert (=> b!135949 (= res!65258 (valid!531 newMap!16))))

(declare-fun b!135950 () Bool)

(declare-fun e!88552 () Bool)

(assert (=> b!135950 (= e!88552 (and e!88546 mapRes!4684))))

(declare-fun condMapEmpty!4684 () Bool)

(declare-fun mapDefault!4684 () ValueCell!1100)

