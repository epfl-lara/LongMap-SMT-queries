; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8388 () Bool)

(assert start!8388)

(declare-fun b!56793 () Bool)

(declare-fun b_free!1941 () Bool)

(declare-fun b_next!1941 () Bool)

(assert (=> b!56793 (= b_free!1941 (not b_next!1941))))

(declare-fun tp!7925 () Bool)

(declare-fun b_and!3423 () Bool)

(assert (=> b!56793 (= tp!7925 b_and!3423)))

(declare-fun b!56792 () Bool)

(declare-fun b_free!1943 () Bool)

(declare-fun b_next!1943 () Bool)

(assert (=> b!56792 (= b_free!1943 (not b_next!1943))))

(declare-fun tp!7924 () Bool)

(declare-fun b_and!3425 () Bool)

(assert (=> b!56792 (= tp!7924 b_and!3425)))

(declare-fun b!56776 () Bool)

(declare-fun e!37425 () Bool)

(declare-datatypes ((V!2829 0))(
  ( (V!2830 (val!1238 Int)) )
))
(declare-datatypes ((array!3697 0))(
  ( (array!3698 (arr!1771 (Array (_ BitVec 32) (_ BitVec 64))) (size!2000 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!850 0))(
  ( (ValueCellFull!850 (v!2361 V!2829)) (EmptyCell!850) )
))
(declare-datatypes ((array!3699 0))(
  ( (array!3700 (arr!1772 (Array (_ BitVec 32) ValueCell!850)) (size!2001 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!608 0))(
  ( (LongMapFixedSize!609 (defaultEntry!2018 Int) (mask!5889 (_ BitVec 32)) (extraKeys!1909 (_ BitVec 32)) (zeroValue!1936 V!2829) (minValue!1936 V!2829) (_size!353 (_ BitVec 32)) (_keys!3638 array!3697) (_values!2001 array!3699) (_vacant!353 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!422 0))(
  ( (Cell!423 (v!2362 LongMapFixedSize!608)) )
))
(declare-datatypes ((LongMap!422 0))(
  ( (LongMap!423 (underlying!222 Cell!422)) )
))
(declare-fun thiss!992 () LongMap!422)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!56776 (= e!37425 (not (validMask!0 (mask!5889 (v!2362 (underlying!222 thiss!992))))))))

(declare-fun mapNonEmpty!2831 () Bool)

(declare-fun mapRes!2832 () Bool)

(declare-fun tp!7926 () Bool)

(declare-fun e!37429 () Bool)

(assert (=> mapNonEmpty!2831 (= mapRes!2832 (and tp!7926 e!37429))))

(declare-fun mapRest!2832 () (Array (_ BitVec 32) ValueCell!850))

(declare-fun mapValue!2832 () ValueCell!850)

(declare-fun newMap!16 () LongMapFixedSize!608)

(declare-fun mapKey!2831 () (_ BitVec 32))

(assert (=> mapNonEmpty!2831 (= (arr!1772 (_values!2001 newMap!16)) (store mapRest!2832 mapKey!2831 mapValue!2832))))

(declare-fun res!31877 () Bool)

(declare-fun e!37426 () Bool)

(assert (=> start!8388 (=> (not res!31877) (not e!37426))))

(declare-fun valid!249 (LongMap!422) Bool)

(assert (=> start!8388 (= res!31877 (valid!249 thiss!992))))

(assert (=> start!8388 e!37426))

(declare-fun e!37435 () Bool)

(assert (=> start!8388 e!37435))

(assert (=> start!8388 true))

(declare-fun e!37438 () Bool)

(assert (=> start!8388 e!37438))

(declare-fun b!56777 () Bool)

(declare-fun res!31879 () Bool)

(assert (=> b!56777 (=> (not res!31879) (not e!37426))))

(assert (=> b!56777 (= res!31879 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5889 newMap!16)) (_size!353 (v!2362 (underlying!222 thiss!992)))))))

(declare-fun b!56778 () Bool)

(declare-fun e!37436 () Bool)

(declare-fun tp_is_empty!2387 () Bool)

(assert (=> b!56778 (= e!37436 tp_is_empty!2387)))

(declare-fun b!56779 () Bool)

(declare-fun e!37437 () Bool)

(assert (=> b!56779 (= e!37426 e!37437)))

(declare-fun res!31875 () Bool)

(assert (=> b!56779 (=> (not res!31875) (not e!37437))))

(declare-datatypes ((tuple2!2010 0))(
  ( (tuple2!2011 (_1!1016 (_ BitVec 64)) (_2!1016 V!2829)) )
))
(declare-datatypes ((List!1424 0))(
  ( (Nil!1421) (Cons!1420 (h!2000 tuple2!2010) (t!4734 List!1424)) )
))
(declare-datatypes ((ListLongMap!1357 0))(
  ( (ListLongMap!1358 (toList!694 List!1424)) )
))
(declare-fun lt!22383 () ListLongMap!1357)

(declare-fun lt!22381 () ListLongMap!1357)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!56779 (= res!31875 (and (= lt!22381 lt!22383) (not (= (select (arr!1771 (_keys!3638 (v!2362 (underlying!222 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1771 (_keys!3638 (v!2362 (underlying!222 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1099 (LongMapFixedSize!608) ListLongMap!1357)

(assert (=> b!56779 (= lt!22383 (map!1099 newMap!16))))

(declare-fun getCurrentListMap!400 (array!3697 array!3699 (_ BitVec 32) (_ BitVec 32) V!2829 V!2829 (_ BitVec 32) Int) ListLongMap!1357)

(assert (=> b!56779 (= lt!22381 (getCurrentListMap!400 (_keys!3638 (v!2362 (underlying!222 thiss!992))) (_values!2001 (v!2362 (underlying!222 thiss!992))) (mask!5889 (v!2362 (underlying!222 thiss!992))) (extraKeys!1909 (v!2362 (underlying!222 thiss!992))) (zeroValue!1936 (v!2362 (underlying!222 thiss!992))) (minValue!1936 (v!2362 (underlying!222 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2018 (v!2362 (underlying!222 thiss!992)))))))

(declare-fun mapIsEmpty!2831 () Bool)

(declare-fun mapRes!2831 () Bool)

(assert (=> mapIsEmpty!2831 mapRes!2831))

(declare-fun b!56780 () Bool)

(declare-datatypes ((Unit!1479 0))(
  ( (Unit!1480) )
))
(declare-fun e!37432 () Unit!1479)

(declare-fun Unit!1481 () Unit!1479)

(assert (=> b!56780 (= e!37432 Unit!1481)))

(declare-fun b!56781 () Bool)

(declare-fun res!31878 () Bool)

(assert (=> b!56781 (=> (not res!31878) (not e!37426))))

(declare-fun valid!250 (LongMapFixedSize!608) Bool)

(assert (=> b!56781 (= res!31878 (valid!250 newMap!16))))

(declare-fun b!56782 () Bool)

(declare-fun Unit!1482 () Unit!1479)

(assert (=> b!56782 (= e!37432 Unit!1482)))

(declare-fun lt!22379 () Unit!1479)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!27 (array!3697 array!3699 (_ BitVec 32) (_ BitVec 32) V!2829 V!2829 (_ BitVec 64) (_ BitVec 32) Int) Unit!1479)

(assert (=> b!56782 (= lt!22379 (lemmaListMapContainsThenArrayContainsFrom!27 (_keys!3638 (v!2362 (underlying!222 thiss!992))) (_values!2001 (v!2362 (underlying!222 thiss!992))) (mask!5889 (v!2362 (underlying!222 thiss!992))) (extraKeys!1909 (v!2362 (underlying!222 thiss!992))) (zeroValue!1936 (v!2362 (underlying!222 thiss!992))) (minValue!1936 (v!2362 (underlying!222 thiss!992))) (select (arr!1771 (_keys!3638 (v!2362 (underlying!222 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2018 (v!2362 (underlying!222 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56782 (arrayContainsKey!0 (_keys!3638 (v!2362 (underlying!222 thiss!992))) (select (arr!1771 (_keys!3638 (v!2362 (underlying!222 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22380 () Unit!1479)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3697 (_ BitVec 32) (_ BitVec 32)) Unit!1479)

(assert (=> b!56782 (= lt!22380 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3638 (v!2362 (underlying!222 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1425 0))(
  ( (Nil!1422) (Cons!1421 (h!2001 (_ BitVec 64)) (t!4735 List!1425)) )
))
(declare-fun arrayNoDuplicates!0 (array!3697 (_ BitVec 32) List!1425) Bool)

(assert (=> b!56782 (arrayNoDuplicates!0 (_keys!3638 (v!2362 (underlying!222 thiss!992))) from!355 Nil!1422)))

(declare-fun lt!22382 () Unit!1479)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3697 (_ BitVec 32) (_ BitVec 64) List!1425) Unit!1479)

(assert (=> b!56782 (= lt!22382 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3638 (v!2362 (underlying!222 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1771 (_keys!3638 (v!2362 (underlying!222 thiss!992)))) from!355) (Cons!1421 (select (arr!1771 (_keys!3638 (v!2362 (underlying!222 thiss!992)))) from!355) Nil!1422)))))

(assert (=> b!56782 false))

(declare-fun b!56783 () Bool)

(assert (=> b!56783 (= e!37429 tp_is_empty!2387)))

(declare-fun b!56784 () Bool)

(declare-fun e!37434 () Bool)

(assert (=> b!56784 (= e!37434 (and e!37436 mapRes!2831))))

(declare-fun condMapEmpty!2831 () Bool)

(declare-fun mapDefault!2831 () ValueCell!850)

