; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14884 () Bool)

(assert start!14884)

(declare-fun b!143103 () Bool)

(declare-fun b_free!3045 () Bool)

(declare-fun b_next!3045 () Bool)

(assert (=> b!143103 (= b_free!3045 (not b_next!3045))))

(declare-fun tp!11617 () Bool)

(declare-fun b_and!8923 () Bool)

(assert (=> b!143103 (= tp!11617 b_and!8923)))

(declare-fun b!143095 () Bool)

(declare-fun b_free!3047 () Bool)

(declare-fun b_next!3047 () Bool)

(assert (=> b!143095 (= b_free!3047 (not b_next!3047))))

(declare-fun tp!11616 () Bool)

(declare-fun b_and!8925 () Bool)

(assert (=> b!143095 (= tp!11616 b_and!8925)))

(declare-fun b!143090 () Bool)

(declare-fun e!93269 () Bool)

(declare-fun tp_is_empty!2939 () Bool)

(assert (=> b!143090 (= e!93269 tp_is_empty!2939)))

(declare-fun b!143091 () Bool)

(declare-fun e!93275 () Bool)

(declare-fun e!93281 () Bool)

(assert (=> b!143091 (= e!93275 e!93281)))

(declare-fun res!68185 () Bool)

(declare-fun e!93277 () Bool)

(assert (=> start!14884 (=> (not res!68185) (not e!93277))))

(declare-datatypes ((V!3565 0))(
  ( (V!3566 (val!1514 Int)) )
))
(declare-datatypes ((array!4915 0))(
  ( (array!4916 (arr!2323 (Array (_ BitVec 32) (_ BitVec 64))) (size!2596 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1126 0))(
  ( (ValueCellFull!1126 (v!3298 V!3565)) (EmptyCell!1126) )
))
(declare-datatypes ((array!4917 0))(
  ( (array!4918 (arr!2324 (Array (_ BitVec 32) ValueCell!1126)) (size!2597 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1160 0))(
  ( (LongMapFixedSize!1161 (defaultEntry!2964 Int) (mask!7316 (_ BitVec 32)) (extraKeys!2715 (_ BitVec 32)) (zeroValue!2812 V!3565) (minValue!2812 V!3565) (_size!629 (_ BitVec 32)) (_keys!4727 array!4915) (_values!2947 array!4917) (_vacant!629 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!946 0))(
  ( (Cell!947 (v!3299 LongMapFixedSize!1160)) )
))
(declare-datatypes ((LongMap!946 0))(
  ( (LongMap!947 (underlying!484 Cell!946)) )
))
(declare-fun thiss!992 () LongMap!946)

(declare-fun valid!561 (LongMap!946) Bool)

(assert (=> start!14884 (= res!68185 (valid!561 thiss!992))))

(assert (=> start!14884 e!93277))

(assert (=> start!14884 e!93275))

(assert (=> start!14884 true))

(declare-fun e!93267 () Bool)

(assert (=> start!14884 e!93267))

(declare-fun b!143092 () Bool)

(declare-fun e!93276 () Bool)

(declare-fun e!93270 () Bool)

(assert (=> b!143092 (= e!93276 (not e!93270))))

(declare-fun res!68180 () Bool)

(assert (=> b!143092 (=> res!68180 e!93270)))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!143092 (= res!68180 (or (bvsge (size!2596 (_keys!4727 (v!3299 (underlying!484 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4727 (v!3299 (underlying!484 thiss!992)))))))))

(declare-datatypes ((List!1751 0))(
  ( (Nil!1748) (Cons!1747 (h!2355 (_ BitVec 64)) (t!6368 List!1751)) )
))
(declare-fun arrayNoDuplicates!0 (array!4915 (_ BitVec 32) List!1751) Bool)

(assert (=> b!143092 (arrayNoDuplicates!0 (_keys!4727 (v!3299 (underlying!484 thiss!992))) from!355 Nil!1748)))

(declare-datatypes ((Unit!4537 0))(
  ( (Unit!4538) )
))
(declare-fun lt!74901 () Unit!4537)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4915 (_ BitVec 32) (_ BitVec 32)) Unit!4537)

(assert (=> b!143092 (= lt!74901 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4727 (v!3299 (underlying!484 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143092 (arrayContainsKey!0 (_keys!4727 (v!3299 (underlying!484 thiss!992))) (select (arr!2323 (_keys!4727 (v!3299 (underlying!484 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!74898 () Unit!4537)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!142 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3565 V!3565 (_ BitVec 64) (_ BitVec 32) Int) Unit!4537)

(assert (=> b!143092 (= lt!74898 (lemmaListMapContainsThenArrayContainsFrom!142 (_keys!4727 (v!3299 (underlying!484 thiss!992))) (_values!2947 (v!3299 (underlying!484 thiss!992))) (mask!7316 (v!3299 (underlying!484 thiss!992))) (extraKeys!2715 (v!3299 (underlying!484 thiss!992))) (zeroValue!2812 (v!3299 (underlying!484 thiss!992))) (minValue!2812 (v!3299 (underlying!484 thiss!992))) (select (arr!2323 (_keys!4727 (v!3299 (underlying!484 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2964 (v!3299 (underlying!484 thiss!992)))))))

(declare-fun b!143093 () Bool)

(declare-fun e!93274 () Bool)

(assert (=> b!143093 (= e!93274 tp_is_empty!2939)))

(declare-fun b!143094 () Bool)

(declare-fun e!93280 () Bool)

(assert (=> b!143094 (= e!93281 e!93280)))

(declare-fun e!93271 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1160)

(declare-fun array_inv!1459 (array!4915) Bool)

(declare-fun array_inv!1460 (array!4917) Bool)

(assert (=> b!143095 (= e!93267 (and tp!11616 tp_is_empty!2939 (array_inv!1459 (_keys!4727 newMap!16)) (array_inv!1460 (_values!2947 newMap!16)) e!93271))))

(declare-fun mapNonEmpty!4867 () Bool)

(declare-fun mapRes!4868 () Bool)

(declare-fun tp!11618 () Bool)

(assert (=> mapNonEmpty!4867 (= mapRes!4868 (and tp!11618 e!93269))))

(declare-fun mapKey!4868 () (_ BitVec 32))

(declare-fun mapValue!4868 () ValueCell!1126)

(declare-fun mapRest!4867 () (Array (_ BitVec 32) ValueCell!1126))

(assert (=> mapNonEmpty!4867 (= (arr!2324 (_values!2947 (v!3299 (underlying!484 thiss!992)))) (store mapRest!4867 mapKey!4868 mapValue!4868))))

(declare-fun b!143096 () Bool)

(declare-fun res!68186 () Bool)

(assert (=> b!143096 (=> (not res!68186) (not e!93277))))

(assert (=> b!143096 (= res!68186 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2596 (_keys!4727 (v!3299 (underlying!484 thiss!992)))))))))

(declare-fun b!143097 () Bool)

(declare-fun e!93279 () Bool)

(declare-fun mapRes!4867 () Bool)

(assert (=> b!143097 (= e!93271 (and e!93279 mapRes!4867))))

(declare-fun condMapEmpty!4868 () Bool)

(declare-fun mapDefault!4867 () ValueCell!1126)

