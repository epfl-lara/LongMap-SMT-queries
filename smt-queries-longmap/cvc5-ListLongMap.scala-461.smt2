; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8378 () Bool)

(assert start!8378)

(declare-fun b!56494 () Bool)

(declare-fun b_free!1921 () Bool)

(declare-fun b_next!1921 () Bool)

(assert (=> b!56494 (= b_free!1921 (not b_next!1921))))

(declare-fun tp!7864 () Bool)

(declare-fun b_and!3383 () Bool)

(assert (=> b!56494 (= tp!7864 b_and!3383)))

(declare-fun b!56491 () Bool)

(declare-fun b_free!1923 () Bool)

(declare-fun b_next!1923 () Bool)

(assert (=> b!56491 (= b_free!1923 (not b_next!1923))))

(declare-fun tp!7866 () Bool)

(declare-fun b_and!3385 () Bool)

(assert (=> b!56491 (= tp!7866 b_and!3385)))

(declare-fun b!56475 () Bool)

(declare-fun res!31757 () Bool)

(declare-fun e!37189 () Bool)

(assert (=> b!56475 (=> res!31757 e!37189)))

(declare-datatypes ((List!1416 0))(
  ( (Nil!1413) (Cons!1412 (h!1992 (_ BitVec 64)) (t!4706 List!1416)) )
))
(declare-fun lt!22273 () List!1416)

(declare-fun contains!673 (List!1416 (_ BitVec 64)) Bool)

(assert (=> b!56475 (= res!31757 (contains!673 lt!22273 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56476 () Bool)

(declare-fun e!37186 () Bool)

(assert (=> b!56476 (= e!37186 (not e!37189))))

(declare-fun res!31758 () Bool)

(assert (=> b!56476 (=> res!31758 e!37189)))

(declare-datatypes ((V!2817 0))(
  ( (V!2818 (val!1233 Int)) )
))
(declare-datatypes ((array!3677 0))(
  ( (array!3678 (arr!1761 (Array (_ BitVec 32) (_ BitVec 64))) (size!1990 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!845 0))(
  ( (ValueCellFull!845 (v!2351 V!2817)) (EmptyCell!845) )
))
(declare-datatypes ((array!3679 0))(
  ( (array!3680 (arr!1762 (Array (_ BitVec 32) ValueCell!845)) (size!1991 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!598 0))(
  ( (LongMapFixedSize!599 (defaultEntry!2013 Int) (mask!5882 (_ BitVec 32)) (extraKeys!1904 (_ BitVec 32)) (zeroValue!1931 V!2817) (minValue!1931 V!2817) (_size!348 (_ BitVec 32)) (_keys!3633 array!3677) (_values!1996 array!3679) (_vacant!348 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!412 0))(
  ( (Cell!413 (v!2352 LongMapFixedSize!598)) )
))
(declare-datatypes ((LongMap!412 0))(
  ( (LongMap!413 (underlying!217 Cell!412)) )
))
(declare-fun thiss!992 () LongMap!412)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!56476 (= res!31758 (or (bvsge (size!1990 (_keys!3633 (v!2352 (underlying!217 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1990 (_keys!3633 (v!2352 (underlying!217 thiss!992)))))))))

(assert (=> b!56476 (= lt!22273 (Cons!1412 (select (arr!1761 (_keys!3633 (v!2352 (underlying!217 thiss!992)))) from!355) Nil!1413))))

(declare-fun arrayNoDuplicates!0 (array!3677 (_ BitVec 32) List!1416) Bool)

(assert (=> b!56476 (arrayNoDuplicates!0 (_keys!3633 (v!2352 (underlying!217 thiss!992))) from!355 Nil!1413)))

(declare-datatypes ((Unit!1467 0))(
  ( (Unit!1468) )
))
(declare-fun lt!22276 () Unit!1467)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3677 (_ BitVec 32) (_ BitVec 32)) Unit!1467)

(assert (=> b!56476 (= lt!22276 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3633 (v!2352 (underlying!217 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56476 (arrayContainsKey!0 (_keys!3633 (v!2352 (underlying!217 thiss!992))) (select (arr!1761 (_keys!3633 (v!2352 (underlying!217 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22272 () Unit!1467)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!23 (array!3677 array!3679 (_ BitVec 32) (_ BitVec 32) V!2817 V!2817 (_ BitVec 64) (_ BitVec 32) Int) Unit!1467)

(assert (=> b!56476 (= lt!22272 (lemmaListMapContainsThenArrayContainsFrom!23 (_keys!3633 (v!2352 (underlying!217 thiss!992))) (_values!1996 (v!2352 (underlying!217 thiss!992))) (mask!5882 (v!2352 (underlying!217 thiss!992))) (extraKeys!1904 (v!2352 (underlying!217 thiss!992))) (zeroValue!1931 (v!2352 (underlying!217 thiss!992))) (minValue!1931 (v!2352 (underlying!217 thiss!992))) (select (arr!1761 (_keys!3633 (v!2352 (underlying!217 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2013 (v!2352 (underlying!217 thiss!992)))))))

(declare-fun b!56477 () Bool)

(declare-fun e!37190 () Bool)

(declare-fun tp_is_empty!2377 () Bool)

(assert (=> b!56477 (= e!37190 tp_is_empty!2377)))

(declare-fun b!56478 () Bool)

(declare-fun e!37197 () Bool)

(assert (=> b!56478 (= e!37197 tp_is_empty!2377)))

(declare-fun b!56479 () Bool)

(declare-fun res!31752 () Bool)

(assert (=> b!56479 (=> res!31752 e!37189)))

(assert (=> b!56479 (= res!31752 (not (arrayNoDuplicates!0 (_keys!3633 (v!2352 (underlying!217 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22273)))))

(declare-fun b!56480 () Bool)

(declare-fun e!37188 () Bool)

(declare-fun e!37192 () Bool)

(assert (=> b!56480 (= e!37188 e!37192)))

(declare-fun b!56481 () Bool)

(declare-fun res!31750 () Bool)

(declare-fun e!37191 () Bool)

(assert (=> b!56481 (=> (not res!31750) (not e!37191))))

(declare-fun newMap!16 () LongMapFixedSize!598)

(assert (=> b!56481 (= res!31750 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5882 newMap!16)) (_size!348 (v!2352 (underlying!217 thiss!992)))))))

(declare-fun res!31753 () Bool)

(assert (=> start!8378 (=> (not res!31753) (not e!37191))))

(declare-fun valid!243 (LongMap!412) Bool)

(assert (=> start!8378 (= res!31753 (valid!243 thiss!992))))

(assert (=> start!8378 e!37191))

(declare-fun e!37195 () Bool)

(assert (=> start!8378 e!37195))

(assert (=> start!8378 true))

(declare-fun e!37199 () Bool)

(assert (=> start!8378 e!37199))

(declare-fun b!56482 () Bool)

(declare-fun e!37187 () Bool)

(assert (=> b!56482 (= e!37191 e!37187)))

(declare-fun res!31759 () Bool)

(assert (=> b!56482 (=> (not res!31759) (not e!37187))))

(declare-datatypes ((tuple2!1998 0))(
  ( (tuple2!1999 (_1!1010 (_ BitVec 64)) (_2!1010 V!2817)) )
))
(declare-datatypes ((List!1417 0))(
  ( (Nil!1414) (Cons!1413 (h!1993 tuple2!1998) (t!4707 List!1417)) )
))
(declare-datatypes ((ListLongMap!1349 0))(
  ( (ListLongMap!1350 (toList!690 List!1417)) )
))
(declare-fun lt!22274 () ListLongMap!1349)

(declare-fun lt!22278 () ListLongMap!1349)

(assert (=> b!56482 (= res!31759 (and (= lt!22278 lt!22274) (not (= (select (arr!1761 (_keys!3633 (v!2352 (underlying!217 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1761 (_keys!3633 (v!2352 (underlying!217 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1093 (LongMapFixedSize!598) ListLongMap!1349)

(assert (=> b!56482 (= lt!22274 (map!1093 newMap!16))))

(declare-fun getCurrentListMap!396 (array!3677 array!3679 (_ BitVec 32) (_ BitVec 32) V!2817 V!2817 (_ BitVec 32) Int) ListLongMap!1349)

(assert (=> b!56482 (= lt!22278 (getCurrentListMap!396 (_keys!3633 (v!2352 (underlying!217 thiss!992))) (_values!1996 (v!2352 (underlying!217 thiss!992))) (mask!5882 (v!2352 (underlying!217 thiss!992))) (extraKeys!1904 (v!2352 (underlying!217 thiss!992))) (zeroValue!1931 (v!2352 (underlying!217 thiss!992))) (minValue!1931 (v!2352 (underlying!217 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2013 (v!2352 (underlying!217 thiss!992)))))))

(declare-fun mapNonEmpty!2801 () Bool)

(declare-fun mapRes!2801 () Bool)

(declare-fun tp!7863 () Bool)

(declare-fun e!37194 () Bool)

(assert (=> mapNonEmpty!2801 (= mapRes!2801 (and tp!7863 e!37194))))

(declare-fun mapValue!2801 () ValueCell!845)

(declare-fun mapRest!2802 () (Array (_ BitVec 32) ValueCell!845))

(declare-fun mapKey!2801 () (_ BitVec 32))

(assert (=> mapNonEmpty!2801 (= (arr!1762 (_values!1996 (v!2352 (underlying!217 thiss!992)))) (store mapRest!2802 mapKey!2801 mapValue!2801))))

(declare-fun b!56483 () Bool)

(declare-fun e!37185 () Bool)

(assert (=> b!56483 (= e!37185 (and e!37197 mapRes!2801))))

(declare-fun condMapEmpty!2802 () Bool)

(declare-fun mapDefault!2801 () ValueCell!845)

