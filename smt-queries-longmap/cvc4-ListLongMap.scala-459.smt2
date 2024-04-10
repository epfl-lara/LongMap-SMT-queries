; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8370 () Bool)

(assert start!8370)

(declare-fun b!56234 () Bool)

(declare-fun b_free!1905 () Bool)

(declare-fun b_next!1905 () Bool)

(assert (=> b!56234 (= b_free!1905 (not b_next!1905))))

(declare-fun tp!7817 () Bool)

(declare-fun b_and!3351 () Bool)

(assert (=> b!56234 (= tp!7817 b_and!3351)))

(declare-fun b!56216 () Bool)

(declare-fun b_free!1907 () Bool)

(declare-fun b_next!1907 () Bool)

(assert (=> b!56216 (= b_free!1907 (not b_next!1907))))

(declare-fun tp!7816 () Bool)

(declare-fun b_and!3353 () Bool)

(assert (=> b!56216 (= tp!7816 b_and!3353)))

(declare-fun b!56215 () Bool)

(declare-fun res!31623 () Bool)

(declare-fun e!36999 () Bool)

(assert (=> b!56215 (=> (not res!31623) (not e!36999))))

(declare-datatypes ((V!2805 0))(
  ( (V!2806 (val!1229 Int)) )
))
(declare-datatypes ((array!3661 0))(
  ( (array!3662 (arr!1753 (Array (_ BitVec 32) (_ BitVec 64))) (size!1982 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!841 0))(
  ( (ValueCellFull!841 (v!2344 V!2805)) (EmptyCell!841) )
))
(declare-datatypes ((array!3663 0))(
  ( (array!3664 (arr!1754 (Array (_ BitVec 32) ValueCell!841)) (size!1983 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!590 0))(
  ( (LongMapFixedSize!591 (defaultEntry!2009 Int) (mask!5874 (_ BitVec 32)) (extraKeys!1900 (_ BitVec 32)) (zeroValue!1927 V!2805) (minValue!1927 V!2805) (_size!344 (_ BitVec 32)) (_keys!3629 array!3661) (_values!1992 array!3663) (_vacant!344 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!590)

(declare-fun valid!239 (LongMapFixedSize!590) Bool)

(assert (=> b!56215 (= res!31623 (valid!239 newMap!16))))

(declare-fun e!37002 () Bool)

(declare-fun e!36995 () Bool)

(declare-fun tp_is_empty!2369 () Bool)

(declare-fun array_inv!1085 (array!3661) Bool)

(declare-fun array_inv!1086 (array!3663) Bool)

(assert (=> b!56216 (= e!37002 (and tp!7816 tp_is_empty!2369 (array_inv!1085 (_keys!3629 newMap!16)) (array_inv!1086 (_values!1992 newMap!16)) e!36995))))

(declare-fun b!56217 () Bool)

(declare-fun e!37007 () Bool)

(assert (=> b!56217 (= e!37007 tp_is_empty!2369)))

(declare-fun b!56218 () Bool)

(declare-fun e!36993 () Bool)

(assert (=> b!56218 (= e!36993 true)))

(declare-datatypes ((List!1411 0))(
  ( (Nil!1408) (Cons!1407 (h!1987 (_ BitVec 64)) (t!4685 List!1411)) )
))
(declare-fun lt!22193 () List!1411)

(declare-datatypes ((Cell!406 0))(
  ( (Cell!407 (v!2345 LongMapFixedSize!590)) )
))
(declare-datatypes ((LongMap!406 0))(
  ( (LongMap!407 (underlying!214 Cell!406)) )
))
(declare-fun thiss!992 () LongMap!406)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!22194 () Bool)

(declare-fun contains!669 (List!1411 (_ BitVec 64)) Bool)

(assert (=> b!56218 (= lt!22194 (contains!669 lt!22193 (select (arr!1753 (_keys!3629 (v!2345 (underlying!214 thiss!992)))) from!355)))))

(declare-fun b!56219 () Bool)

(declare-fun res!31626 () Bool)

(assert (=> b!56219 (=> res!31626 e!36993)))

(assert (=> b!56219 (= res!31626 (contains!669 lt!22193 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!31619 () Bool)

(assert (=> start!8370 (=> (not res!31619) (not e!36999))))

(declare-fun valid!240 (LongMap!406) Bool)

(assert (=> start!8370 (= res!31619 (valid!240 thiss!992))))

(assert (=> start!8370 e!36999))

(declare-fun e!37001 () Bool)

(assert (=> start!8370 e!37001))

(assert (=> start!8370 true))

(assert (=> start!8370 e!37002))

(declare-fun mapNonEmpty!2777 () Bool)

(declare-fun mapRes!2778 () Bool)

(declare-fun tp!7818 () Bool)

(declare-fun e!37006 () Bool)

(assert (=> mapNonEmpty!2777 (= mapRes!2778 (and tp!7818 e!37006))))

(declare-fun mapRest!2777 () (Array (_ BitVec 32) ValueCell!841))

(declare-fun mapKey!2777 () (_ BitVec 32))

(declare-fun mapValue!2777 () ValueCell!841)

(assert (=> mapNonEmpty!2777 (= (arr!1754 (_values!1992 (v!2345 (underlying!214 thiss!992)))) (store mapRest!2777 mapKey!2777 mapValue!2777))))

(declare-fun b!56220 () Bool)

(assert (=> b!56220 (= e!37006 tp_is_empty!2369)))

(declare-fun b!56221 () Bool)

(declare-fun res!31625 () Bool)

(assert (=> b!56221 (=> (not res!31625) (not e!36999))))

(assert (=> b!56221 (= res!31625 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5874 newMap!16)) (_size!344 (v!2345 (underlying!214 thiss!992)))))))

(declare-fun b!56222 () Bool)

(declare-fun res!31622 () Bool)

(assert (=> b!56222 (=> res!31622 e!36993)))

(declare-fun noDuplicate!48 (List!1411) Bool)

(assert (=> b!56222 (= res!31622 (not (noDuplicate!48 lt!22193)))))

(declare-fun b!56223 () Bool)

(declare-fun e!36992 () Bool)

(assert (=> b!56223 (= e!36999 e!36992)))

(declare-fun res!31620 () Bool)

(assert (=> b!56223 (=> (not res!31620) (not e!36992))))

(declare-datatypes ((tuple2!1992 0))(
  ( (tuple2!1993 (_1!1007 (_ BitVec 64)) (_2!1007 V!2805)) )
))
(declare-datatypes ((List!1412 0))(
  ( (Nil!1409) (Cons!1408 (h!1988 tuple2!1992) (t!4686 List!1412)) )
))
(declare-datatypes ((ListLongMap!1345 0))(
  ( (ListLongMap!1346 (toList!688 List!1412)) )
))
(declare-fun lt!22189 () ListLongMap!1345)

(declare-fun lt!22192 () ListLongMap!1345)

(assert (=> b!56223 (= res!31620 (and (= lt!22192 lt!22189) (not (= (select (arr!1753 (_keys!3629 (v!2345 (underlying!214 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1753 (_keys!3629 (v!2345 (underlying!214 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1087 (LongMapFixedSize!590) ListLongMap!1345)

(assert (=> b!56223 (= lt!22189 (map!1087 newMap!16))))

(declare-fun getCurrentListMap!394 (array!3661 array!3663 (_ BitVec 32) (_ BitVec 32) V!2805 V!2805 (_ BitVec 32) Int) ListLongMap!1345)

(assert (=> b!56223 (= lt!22192 (getCurrentListMap!394 (_keys!3629 (v!2345 (underlying!214 thiss!992))) (_values!1992 (v!2345 (underlying!214 thiss!992))) (mask!5874 (v!2345 (underlying!214 thiss!992))) (extraKeys!1900 (v!2345 (underlying!214 thiss!992))) (zeroValue!1927 (v!2345 (underlying!214 thiss!992))) (minValue!1927 (v!2345 (underlying!214 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2009 (v!2345 (underlying!214 thiss!992)))))))

(declare-fun b!56224 () Bool)

(declare-fun e!37005 () Bool)

(declare-fun e!36998 () Bool)

(assert (=> b!56224 (= e!37005 e!36998)))

(declare-fun b!56225 () Bool)

(declare-fun res!31618 () Bool)

(assert (=> b!56225 (=> res!31618 e!36993)))

(assert (=> b!56225 (= res!31618 (contains!669 lt!22193 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56226 () Bool)

(declare-fun e!36997 () Bool)

(declare-fun e!37004 () Bool)

(assert (=> b!56226 (= e!36997 (and e!37004 mapRes!2778))))

(declare-fun condMapEmpty!2778 () Bool)

(declare-fun mapDefault!2778 () ValueCell!841)

