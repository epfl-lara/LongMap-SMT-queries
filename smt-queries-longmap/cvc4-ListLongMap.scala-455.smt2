; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8346 () Bool)

(assert start!8346)

(declare-fun b!55446 () Bool)

(declare-fun b_free!1857 () Bool)

(declare-fun b_next!1857 () Bool)

(assert (=> b!55446 (= b_free!1857 (not b_next!1857))))

(declare-fun tp!7674 () Bool)

(declare-fun b_and!3255 () Bool)

(assert (=> b!55446 (= tp!7674 b_and!3255)))

(declare-fun b!55444 () Bool)

(declare-fun b_free!1859 () Bool)

(declare-fun b_next!1859 () Bool)

(assert (=> b!55444 (= b_free!1859 (not b_next!1859))))

(declare-fun tp!7671 () Bool)

(declare-fun b_and!3257 () Bool)

(assert (=> b!55444 (= tp!7671 b_and!3257)))

(declare-fun b!55435 () Bool)

(declare-fun res!31230 () Bool)

(declare-fun e!36427 () Bool)

(assert (=> b!55435 (=> res!31230 e!36427)))

(declare-datatypes ((List!1395 0))(
  ( (Nil!1392) (Cons!1391 (h!1971 (_ BitVec 64)) (t!4621 List!1395)) )
))
(declare-fun lt!21938 () List!1395)

(declare-datatypes ((V!2773 0))(
  ( (V!2774 (val!1217 Int)) )
))
(declare-datatypes ((array!3613 0))(
  ( (array!3614 (arr!1729 (Array (_ BitVec 32) (_ BitVec 64))) (size!1958 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!829 0))(
  ( (ValueCellFull!829 (v!2320 V!2773)) (EmptyCell!829) )
))
(declare-datatypes ((array!3615 0))(
  ( (array!3616 (arr!1730 (Array (_ BitVec 32) ValueCell!829)) (size!1959 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!566 0))(
  ( (LongMapFixedSize!567 (defaultEntry!1997 Int) (mask!5854 (_ BitVec 32)) (extraKeys!1888 (_ BitVec 32)) (zeroValue!1915 V!2773) (minValue!1915 V!2773) (_size!332 (_ BitVec 32)) (_keys!3617 array!3613) (_values!1980 array!3615) (_vacant!332 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!382 0))(
  ( (Cell!383 (v!2321 LongMapFixedSize!566)) )
))
(declare-datatypes ((LongMap!382 0))(
  ( (LongMap!383 (underlying!202 Cell!382)) )
))
(declare-fun thiss!992 () LongMap!382)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!3613 (_ BitVec 32) List!1395) Bool)

(assert (=> b!55435 (= res!31230 (not (arrayNoDuplicates!0 (_keys!3617 (v!2321 (underlying!202 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!21938)))))

(declare-fun b!55436 () Bool)

(declare-fun res!31226 () Bool)

(assert (=> b!55436 (=> res!31226 e!36427)))

(declare-fun noDuplicate!42 (List!1395) Bool)

(assert (=> b!55436 (= res!31226 (not (noDuplicate!42 lt!21938)))))

(declare-fun mapIsEmpty!2705 () Bool)

(declare-fun mapRes!2706 () Bool)

(assert (=> mapIsEmpty!2705 mapRes!2706))

(declare-fun b!55437 () Bool)

(declare-fun e!36431 () Bool)

(declare-fun tp_is_empty!2345 () Bool)

(assert (=> b!55437 (= e!36431 tp_is_empty!2345)))

(declare-fun mapNonEmpty!2705 () Bool)

(declare-fun tp!7672 () Bool)

(declare-fun e!36425 () Bool)

(assert (=> mapNonEmpty!2705 (= mapRes!2706 (and tp!7672 e!36425))))

(declare-fun mapKey!2706 () (_ BitVec 32))

(declare-fun mapRest!2706 () (Array (_ BitVec 32) ValueCell!829))

(declare-fun mapValue!2706 () ValueCell!829)

(assert (=> mapNonEmpty!2705 (= (arr!1730 (_values!1980 (v!2321 (underlying!202 thiss!992)))) (store mapRest!2706 mapKey!2706 mapValue!2706))))

(declare-fun b!55438 () Bool)

(declare-fun res!31224 () Bool)

(declare-fun e!36424 () Bool)

(assert (=> b!55438 (=> (not res!31224) (not e!36424))))

(declare-fun newMap!16 () LongMapFixedSize!566)

(assert (=> b!55438 (= res!31224 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5854 newMap!16)) (_size!332 (v!2321 (underlying!202 thiss!992)))))))

(declare-fun mapNonEmpty!2706 () Bool)

(declare-fun mapRes!2705 () Bool)

(declare-fun tp!7673 () Bool)

(declare-fun e!36419 () Bool)

(assert (=> mapNonEmpty!2706 (= mapRes!2705 (and tp!7673 e!36419))))

(declare-fun mapValue!2705 () ValueCell!829)

(declare-fun mapKey!2705 () (_ BitVec 32))

(declare-fun mapRest!2705 () (Array (_ BitVec 32) ValueCell!829))

(assert (=> mapNonEmpty!2706 (= (arr!1730 (_values!1980 newMap!16)) (store mapRest!2705 mapKey!2705 mapValue!2705))))

(declare-fun b!55439 () Bool)

(declare-fun e!36430 () Bool)

(assert (=> b!55439 (= e!36424 e!36430)))

(declare-fun res!31222 () Bool)

(assert (=> b!55439 (=> (not res!31222) (not e!36430))))

(declare-datatypes ((tuple2!1966 0))(
  ( (tuple2!1967 (_1!994 (_ BitVec 64)) (_2!994 V!2773)) )
))
(declare-datatypes ((List!1396 0))(
  ( (Nil!1393) (Cons!1392 (h!1972 tuple2!1966) (t!4622 List!1396)) )
))
(declare-datatypes ((ListLongMap!1331 0))(
  ( (ListLongMap!1332 (toList!681 List!1396)) )
))
(declare-fun lt!21940 () ListLongMap!1331)

(declare-fun lt!21937 () ListLongMap!1331)

(assert (=> b!55439 (= res!31222 (and (= lt!21940 lt!21937) (not (= (select (arr!1729 (_keys!3617 (v!2321 (underlying!202 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1729 (_keys!3617 (v!2321 (underlying!202 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1073 (LongMapFixedSize!566) ListLongMap!1331)

(assert (=> b!55439 (= lt!21937 (map!1073 newMap!16))))

(declare-fun getCurrentListMap!388 (array!3613 array!3615 (_ BitVec 32) (_ BitVec 32) V!2773 V!2773 (_ BitVec 32) Int) ListLongMap!1331)

(assert (=> b!55439 (= lt!21940 (getCurrentListMap!388 (_keys!3617 (v!2321 (underlying!202 thiss!992))) (_values!1980 (v!2321 (underlying!202 thiss!992))) (mask!5854 (v!2321 (underlying!202 thiss!992))) (extraKeys!1888 (v!2321 (underlying!202 thiss!992))) (zeroValue!1915 (v!2321 (underlying!202 thiss!992))) (minValue!1915 (v!2321 (underlying!202 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1997 (v!2321 (underlying!202 thiss!992)))))))

(declare-fun b!55441 () Bool)

(declare-fun e!36418 () Bool)

(assert (=> b!55441 (= e!36418 (not e!36427))))

(declare-fun res!31228 () Bool)

(assert (=> b!55441 (=> res!31228 e!36427)))

(assert (=> b!55441 (= res!31228 (or (bvsge (size!1958 (_keys!3617 (v!2321 (underlying!202 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1958 (_keys!3617 (v!2321 (underlying!202 thiss!992)))))))))

(assert (=> b!55441 (= lt!21938 (Cons!1391 (select (arr!1729 (_keys!3617 (v!2321 (underlying!202 thiss!992)))) from!355) Nil!1392))))

(assert (=> b!55441 (arrayNoDuplicates!0 (_keys!3617 (v!2321 (underlying!202 thiss!992))) from!355 Nil!1392)))

(declare-datatypes ((Unit!1455 0))(
  ( (Unit!1456) )
))
(declare-fun lt!21942 () Unit!1455)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3613 (_ BitVec 32) (_ BitVec 32)) Unit!1455)

(assert (=> b!55441 (= lt!21942 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3617 (v!2321 (underlying!202 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55441 (arrayContainsKey!0 (_keys!3617 (v!2321 (underlying!202 thiss!992))) (select (arr!1729 (_keys!3617 (v!2321 (underlying!202 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!21939 () Unit!1455)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!17 (array!3613 array!3615 (_ BitVec 32) (_ BitVec 32) V!2773 V!2773 (_ BitVec 64) (_ BitVec 32) Int) Unit!1455)

(assert (=> b!55441 (= lt!21939 (lemmaListMapContainsThenArrayContainsFrom!17 (_keys!3617 (v!2321 (underlying!202 thiss!992))) (_values!1980 (v!2321 (underlying!202 thiss!992))) (mask!5854 (v!2321 (underlying!202 thiss!992))) (extraKeys!1888 (v!2321 (underlying!202 thiss!992))) (zeroValue!1915 (v!2321 (underlying!202 thiss!992))) (minValue!1915 (v!2321 (underlying!202 thiss!992))) (select (arr!1729 (_keys!3617 (v!2321 (underlying!202 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1997 (v!2321 (underlying!202 thiss!992)))))))

(declare-fun b!55442 () Bool)

(assert (=> b!55442 (= e!36430 e!36418)))

(declare-fun res!31229 () Bool)

(assert (=> b!55442 (=> (not res!31229) (not e!36418))))

(declare-fun contains!656 (ListLongMap!1331 (_ BitVec 64)) Bool)

(assert (=> b!55442 (= res!31229 (contains!656 lt!21937 (select (arr!1729 (_keys!3617 (v!2321 (underlying!202 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1968 0))(
  ( (tuple2!1969 (_1!995 Bool) (_2!995 LongMapFixedSize!566)) )
))
(declare-fun lt!21936 () tuple2!1968)

(declare-fun update!62 (LongMapFixedSize!566 (_ BitVec 64) V!2773) tuple2!1968)

(declare-fun get!1032 (ValueCell!829 V!2773) V!2773)

(declare-fun dynLambda!293 (Int (_ BitVec 64)) V!2773)

(assert (=> b!55442 (= lt!21936 (update!62 newMap!16 (select (arr!1729 (_keys!3617 (v!2321 (underlying!202 thiss!992)))) from!355) (get!1032 (select (arr!1730 (_values!1980 (v!2321 (underlying!202 thiss!992)))) from!355) (dynLambda!293 (defaultEntry!1997 (v!2321 (underlying!202 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55443 () Bool)

(declare-fun res!31223 () Bool)

(assert (=> b!55443 (=> (not res!31223) (not e!36424))))

(declare-fun valid!226 (LongMapFixedSize!566) Bool)

(assert (=> b!55443 (= res!31223 (valid!226 newMap!16))))

(declare-fun e!36416 () Bool)

(declare-fun e!36428 () Bool)

(declare-fun array_inv!1071 (array!3613) Bool)

(declare-fun array_inv!1072 (array!3615) Bool)

(assert (=> b!55444 (= e!36416 (and tp!7671 tp_is_empty!2345 (array_inv!1071 (_keys!3617 newMap!16)) (array_inv!1072 (_values!1980 newMap!16)) e!36428))))

(declare-fun b!55445 () Bool)

(declare-fun res!31231 () Bool)

(assert (=> b!55445 (=> res!31231 e!36427)))

(declare-fun contains!657 (List!1395 (_ BitVec 64)) Bool)

(assert (=> b!55445 (= res!31231 (contains!657 lt!21938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!36420 () Bool)

(declare-fun e!36417 () Bool)

(assert (=> b!55446 (= e!36420 (and tp!7674 tp_is_empty!2345 (array_inv!1071 (_keys!3617 (v!2321 (underlying!202 thiss!992)))) (array_inv!1072 (_values!1980 (v!2321 (underlying!202 thiss!992)))) e!36417))))

(declare-fun b!55447 () Bool)

(assert (=> b!55447 (= e!36419 tp_is_empty!2345)))

(declare-fun b!55448 () Bool)

(declare-fun e!36426 () Bool)

(assert (=> b!55448 (= e!36426 e!36420)))

(declare-fun b!55440 () Bool)

(assert (=> b!55440 (= e!36427 true)))

(declare-fun lt!21941 () Bool)

(assert (=> b!55440 (= lt!21941 (contains!657 lt!21938 (select (arr!1729 (_keys!3617 (v!2321 (underlying!202 thiss!992)))) from!355)))))

(declare-fun res!31227 () Bool)

(assert (=> start!8346 (=> (not res!31227) (not e!36424))))

(declare-fun valid!227 (LongMap!382) Bool)

(assert (=> start!8346 (= res!31227 (valid!227 thiss!992))))

(assert (=> start!8346 e!36424))

(declare-fun e!36421 () Bool)

(assert (=> start!8346 e!36421))

(assert (=> start!8346 true))

(assert (=> start!8346 e!36416))

(declare-fun b!55449 () Bool)

(assert (=> b!55449 (= e!36425 tp_is_empty!2345)))

(declare-fun b!55450 () Bool)

(declare-fun e!36429 () Bool)

(assert (=> b!55450 (= e!36417 (and e!36429 mapRes!2706))))

(declare-fun condMapEmpty!2705 () Bool)

(declare-fun mapDefault!2705 () ValueCell!829)

