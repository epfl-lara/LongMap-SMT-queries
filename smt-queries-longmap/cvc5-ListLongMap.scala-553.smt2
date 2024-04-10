; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14708 () Bool)

(assert start!14708)

(declare-fun b!139242 () Bool)

(declare-fun b_free!3025 () Bool)

(declare-fun b_next!3025 () Bool)

(assert (=> b!139242 (= b_free!3025 (not b_next!3025))))

(declare-fun tp!11548 () Bool)

(declare-fun b_and!8687 () Bool)

(assert (=> b!139242 (= tp!11548 b_and!8687)))

(declare-fun b!139241 () Bool)

(declare-fun b_free!3027 () Bool)

(declare-fun b_next!3027 () Bool)

(assert (=> b!139241 (= b_free!3027 (not b_next!3027))))

(declare-fun tp!11547 () Bool)

(declare-fun b_and!8689 () Bool)

(assert (=> b!139241 (= tp!11547 b_and!8689)))

(declare-fun b!139235 () Bool)

(declare-fun e!90828 () Bool)

(declare-fun e!90824 () Bool)

(assert (=> b!139235 (= e!90828 e!90824)))

(declare-fun b!139236 () Bool)

(declare-fun e!90829 () Bool)

(declare-datatypes ((V!3553 0))(
  ( (V!3554 (val!1509 Int)) )
))
(declare-datatypes ((array!4893 0))(
  ( (array!4894 (arr!2313 (Array (_ BitVec 32) (_ BitVec 64))) (size!2585 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1121 0))(
  ( (ValueCellFull!1121 (v!3277 V!3553)) (EmptyCell!1121) )
))
(declare-datatypes ((array!4895 0))(
  ( (array!4896 (arr!2314 (Array (_ BitVec 32) ValueCell!1121)) (size!2586 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1150 0))(
  ( (LongMapFixedSize!1151 (defaultEntry!2939 Int) (mask!7279 (_ BitVec 32)) (extraKeys!2694 (_ BitVec 32)) (zeroValue!2789 V!3553) (minValue!2789 V!3553) (_size!624 (_ BitVec 32)) (_keys!4698 array!4893) (_values!2922 array!4895) (_vacant!624 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!936 0))(
  ( (Cell!937 (v!3278 LongMapFixedSize!1150)) )
))
(declare-datatypes ((LongMap!936 0))(
  ( (LongMap!937 (underlying!479 Cell!936)) )
))
(declare-fun thiss!992 () LongMap!936)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!139236 (= e!90829 (not (or (bvsge (size!2585 (_keys!4698 (v!3278 (underlying!479 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2585 (_keys!4698 (v!3278 (underlying!479 thiss!992))))))))))

(declare-datatypes ((List!1744 0))(
  ( (Nil!1741) (Cons!1740 (h!2347 (_ BitVec 64)) (t!6324 List!1744)) )
))
(declare-fun arrayNoDuplicates!0 (array!4893 (_ BitVec 32) List!1744) Bool)

(assert (=> b!139236 (arrayNoDuplicates!0 (_keys!4698 (v!3278 (underlying!479 thiss!992))) from!355 Nil!1741)))

(declare-datatypes ((Unit!4371 0))(
  ( (Unit!4372) )
))
(declare-fun lt!72812 () Unit!4371)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4893 (_ BitVec 32) (_ BitVec 32)) Unit!4371)

(assert (=> b!139236 (= lt!72812 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4698 (v!3278 (underlying!479 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139236 (arrayContainsKey!0 (_keys!4698 (v!3278 (underlying!479 thiss!992))) (select (arr!2313 (_keys!4698 (v!3278 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!72810 () Unit!4371)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!138 (array!4893 array!4895 (_ BitVec 32) (_ BitVec 32) V!3553 V!3553 (_ BitVec 64) (_ BitVec 32) Int) Unit!4371)

(assert (=> b!139236 (= lt!72810 (lemmaListMapContainsThenArrayContainsFrom!138 (_keys!4698 (v!3278 (underlying!479 thiss!992))) (_values!2922 (v!3278 (underlying!479 thiss!992))) (mask!7279 (v!3278 (underlying!479 thiss!992))) (extraKeys!2694 (v!3278 (underlying!479 thiss!992))) (zeroValue!2789 (v!3278 (underlying!479 thiss!992))) (minValue!2789 (v!3278 (underlying!479 thiss!992))) (select (arr!2313 (_keys!4698 (v!3278 (underlying!479 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2939 (v!3278 (underlying!479 thiss!992)))))))

(declare-fun b!139237 () Bool)

(declare-fun e!90819 () Bool)

(declare-fun e!90820 () Bool)

(declare-fun mapRes!4828 () Bool)

(assert (=> b!139237 (= e!90819 (and e!90820 mapRes!4828))))

(declare-fun condMapEmpty!4828 () Bool)

(declare-fun mapDefault!4828 () ValueCell!1121)

