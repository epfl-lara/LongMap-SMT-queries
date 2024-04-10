; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12138 () Bool)

(assert start!12138)

(declare-fun b!102410 () Bool)

(declare-fun b_free!2481 () Bool)

(declare-fun b_next!2481 () Bool)

(assert (=> b!102410 (= b_free!2481 (not b_next!2481))))

(declare-fun tp!9754 () Bool)

(declare-fun b_and!6311 () Bool)

(assert (=> b!102410 (= tp!9754 b_and!6311)))

(declare-fun b!102412 () Bool)

(declare-fun b_free!2483 () Bool)

(declare-fun b_next!2483 () Bool)

(assert (=> b!102412 (= b_free!2483 (not b_next!2483))))

(declare-fun tp!9753 () Bool)

(declare-fun b_and!6313 () Bool)

(assert (=> b!102412 (= tp!9753 b_and!6313)))

(declare-fun b!102405 () Bool)

(declare-fun e!66659 () Bool)

(declare-fun tp_is_empty!2657 () Bool)

(assert (=> b!102405 (= e!66659 tp_is_empty!2657)))

(declare-fun res!51255 () Bool)

(declare-fun e!66652 () Bool)

(assert (=> start!12138 (=> (not res!51255) (not e!66652))))

(declare-datatypes ((V!3189 0))(
  ( (V!3190 (val!1373 Int)) )
))
(declare-datatypes ((array!4301 0))(
  ( (array!4302 (arr!2041 (Array (_ BitVec 32) (_ BitVec 64))) (size!2295 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!985 0))(
  ( (ValueCellFull!985 (v!2857 V!3189)) (EmptyCell!985) )
))
(declare-datatypes ((array!4303 0))(
  ( (array!4304 (arr!2042 (Array (_ BitVec 32) ValueCell!985)) (size!2296 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!878 0))(
  ( (LongMapFixedSize!879 (defaultEntry!2550 Int) (mask!6679 (_ BitVec 32)) (extraKeys!2359 (_ BitVec 32)) (zeroValue!2427 V!3189) (minValue!2427 V!3189) (_size!488 (_ BitVec 32)) (_keys!4252 array!4301) (_values!2533 array!4303) (_vacant!488 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!678 0))(
  ( (Cell!679 (v!2858 LongMapFixedSize!878)) )
))
(declare-datatypes ((LongMap!678 0))(
  ( (LongMap!679 (underlying!350 Cell!678)) )
))
(declare-fun thiss!992 () LongMap!678)

(declare-fun valid!404 (LongMap!678) Bool)

(assert (=> start!12138 (= res!51255 (valid!404 thiss!992))))

(assert (=> start!12138 e!66652))

(declare-fun e!66661 () Bool)

(assert (=> start!12138 e!66661))

(assert (=> start!12138 true))

(declare-fun e!66657 () Bool)

(assert (=> start!12138 e!66657))

(declare-fun b!102406 () Bool)

(declare-fun e!66651 () Bool)

(declare-fun e!66658 () Bool)

(assert (=> b!102406 (= e!66651 e!66658)))

(declare-fun mapNonEmpty!3851 () Bool)

(declare-fun mapRes!3852 () Bool)

(declare-fun tp!9755 () Bool)

(assert (=> mapNonEmpty!3851 (= mapRes!3852 (and tp!9755 e!66659))))

(declare-fun mapValue!3851 () ValueCell!985)

(declare-fun mapKey!3852 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!878)

(declare-fun mapRest!3851 () (Array (_ BitVec 32) ValueCell!985))

(assert (=> mapNonEmpty!3851 (= (arr!2042 (_values!2533 newMap!16)) (store mapRest!3851 mapKey!3852 mapValue!3851))))

(declare-fun b!102407 () Bool)

(declare-fun e!66653 () Bool)

(declare-fun e!66663 () Bool)

(assert (=> b!102407 (= e!66653 e!66663)))

(declare-fun res!51258 () Bool)

(assert (=> b!102407 (=> (not res!51258) (not e!66663))))

(declare-datatypes ((tuple2!2376 0))(
  ( (tuple2!2377 (_1!1199 Bool) (_2!1199 LongMapFixedSize!878)) )
))
(declare-fun lt!52073 () tuple2!2376)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!102407 (= res!51258 (and (_1!1199 lt!52073) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3122 0))(
  ( (Unit!3123) )
))
(declare-fun lt!52074 () Unit!3122)

(declare-fun e!66650 () Unit!3122)

(assert (=> b!102407 (= lt!52074 e!66650)))

(declare-datatypes ((tuple2!2378 0))(
  ( (tuple2!2379 (_1!1200 (_ BitVec 64)) (_2!1200 V!3189)) )
))
(declare-datatypes ((List!1599 0))(
  ( (Nil!1596) (Cons!1595 (h!2191 tuple2!2378) (t!5629 List!1599)) )
))
(declare-datatypes ((ListLongMap!1555 0))(
  ( (ListLongMap!1556 (toList!793 List!1599)) )
))
(declare-fun lt!52070 () ListLongMap!1555)

(declare-fun c!17637 () Bool)

(declare-fun contains!817 (ListLongMap!1555 (_ BitVec 64)) Bool)

(assert (=> b!102407 (= c!17637 (contains!817 lt!52070 (select (arr!2041 (_keys!4252 (v!2858 (underlying!350 thiss!992)))) from!355)))))

(declare-fun update!149 (LongMapFixedSize!878 (_ BitVec 64) V!3189) tuple2!2376)

(declare-fun get!1309 (ValueCell!985 V!3189) V!3189)

(declare-fun dynLambda!377 (Int (_ BitVec 64)) V!3189)

(assert (=> b!102407 (= lt!52073 (update!149 newMap!16 (select (arr!2041 (_keys!4252 (v!2858 (underlying!350 thiss!992)))) from!355) (get!1309 (select (arr!2042 (_values!2533 (v!2858 (underlying!350 thiss!992)))) from!355) (dynLambda!377 (defaultEntry!2550 (v!2858 (underlying!350 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!102408 () Bool)

(declare-fun res!51260 () Bool)

(assert (=> b!102408 (=> (not res!51260) (not e!66652))))

(assert (=> b!102408 (= res!51260 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2295 (_keys!4252 (v!2858 (underlying!350 thiss!992)))))))))

(declare-fun mapIsEmpty!3851 () Bool)

(assert (=> mapIsEmpty!3851 mapRes!3852))

(declare-fun b!102409 () Bool)

(declare-fun Unit!3124 () Unit!3122)

(assert (=> b!102409 (= e!66650 Unit!3124)))

(declare-fun lt!52075 () Unit!3122)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!98 (array!4301 array!4303 (_ BitVec 32) (_ BitVec 32) V!3189 V!3189 (_ BitVec 64) (_ BitVec 32) Int) Unit!3122)

(assert (=> b!102409 (= lt!52075 (lemmaListMapContainsThenArrayContainsFrom!98 (_keys!4252 (v!2858 (underlying!350 thiss!992))) (_values!2533 (v!2858 (underlying!350 thiss!992))) (mask!6679 (v!2858 (underlying!350 thiss!992))) (extraKeys!2359 (v!2858 (underlying!350 thiss!992))) (zeroValue!2427 (v!2858 (underlying!350 thiss!992))) (minValue!2427 (v!2858 (underlying!350 thiss!992))) (select (arr!2041 (_keys!4252 (v!2858 (underlying!350 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2550 (v!2858 (underlying!350 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!102409 (arrayContainsKey!0 (_keys!4252 (v!2858 (underlying!350 thiss!992))) (select (arr!2041 (_keys!4252 (v!2858 (underlying!350 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!52072 () Unit!3122)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4301 (_ BitVec 32) (_ BitVec 32)) Unit!3122)

(assert (=> b!102409 (= lt!52072 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4252 (v!2858 (underlying!350 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1600 0))(
  ( (Nil!1597) (Cons!1596 (h!2192 (_ BitVec 64)) (t!5630 List!1600)) )
))
(declare-fun arrayNoDuplicates!0 (array!4301 (_ BitVec 32) List!1600) Bool)

(assert (=> b!102409 (arrayNoDuplicates!0 (_keys!4252 (v!2858 (underlying!350 thiss!992))) from!355 Nil!1597)))

(declare-fun lt!52069 () Unit!3122)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4301 (_ BitVec 32) (_ BitVec 64) List!1600) Unit!3122)

(assert (=> b!102409 (= lt!52069 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4252 (v!2858 (underlying!350 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2041 (_keys!4252 (v!2858 (underlying!350 thiss!992)))) from!355) (Cons!1596 (select (arr!2041 (_keys!4252 (v!2858 (underlying!350 thiss!992)))) from!355) Nil!1597)))))

(assert (=> b!102409 false))

(declare-fun e!66654 () Bool)

(declare-fun array_inv!1279 (array!4301) Bool)

(declare-fun array_inv!1280 (array!4303) Bool)

(assert (=> b!102410 (= e!66658 (and tp!9754 tp_is_empty!2657 (array_inv!1279 (_keys!4252 (v!2858 (underlying!350 thiss!992)))) (array_inv!1280 (_values!2533 (v!2858 (underlying!350 thiss!992)))) e!66654))))

(declare-fun b!102411 () Bool)

(assert (=> b!102411 (= e!66661 e!66651)))

(declare-fun e!66662 () Bool)

(assert (=> b!102412 (= e!66657 (and tp!9753 tp_is_empty!2657 (array_inv!1279 (_keys!4252 newMap!16)) (array_inv!1280 (_values!2533 newMap!16)) e!66662))))

(declare-fun b!102413 () Bool)

(assert (=> b!102413 (= e!66663 (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun b!102414 () Bool)

(declare-fun e!66656 () Bool)

(assert (=> b!102414 (= e!66656 tp_is_empty!2657)))

(declare-fun b!102415 () Bool)

(declare-fun res!51261 () Bool)

(assert (=> b!102415 (=> (not res!51261) (not e!66652))))

(assert (=> b!102415 (= res!51261 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6679 newMap!16)) (_size!488 (v!2858 (underlying!350 thiss!992)))))))

(declare-fun mapNonEmpty!3852 () Bool)

(declare-fun mapRes!3851 () Bool)

(declare-fun tp!9756 () Bool)

(declare-fun e!66664 () Bool)

(assert (=> mapNonEmpty!3852 (= mapRes!3851 (and tp!9756 e!66664))))

(declare-fun mapKey!3851 () (_ BitVec 32))

(declare-fun mapRest!3852 () (Array (_ BitVec 32) ValueCell!985))

(declare-fun mapValue!3852 () ValueCell!985)

(assert (=> mapNonEmpty!3852 (= (arr!2042 (_values!2533 (v!2858 (underlying!350 thiss!992)))) (store mapRest!3852 mapKey!3851 mapValue!3852))))

(declare-fun b!102416 () Bool)

(declare-fun res!51262 () Bool)

(assert (=> b!102416 (=> (not res!51262) (not e!66663))))

(assert (=> b!102416 (= res!51262 (and (= (size!2296 (_values!2533 (v!2858 (underlying!350 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6679 (v!2858 (underlying!350 thiss!992))))) (= (size!2295 (_keys!4252 (v!2858 (underlying!350 thiss!992)))) (size!2296 (_values!2533 (v!2858 (underlying!350 thiss!992))))) (bvsge (mask!6679 (v!2858 (underlying!350 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2359 (v!2858 (underlying!350 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2359 (v!2858 (underlying!350 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!102417 () Bool)

(declare-fun res!51254 () Bool)

(assert (=> b!102417 (=> (not res!51254) (not e!66663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4301 (_ BitVec 32)) Bool)

(assert (=> b!102417 (= res!51254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4252 (v!2858 (underlying!350 thiss!992))) (mask!6679 (v!2858 (underlying!350 thiss!992)))))))

(declare-fun b!102418 () Bool)

(declare-fun e!66660 () Bool)

(assert (=> b!102418 (= e!66654 (and e!66660 mapRes!3851))))

(declare-fun condMapEmpty!3851 () Bool)

(declare-fun mapDefault!3852 () ValueCell!985)

