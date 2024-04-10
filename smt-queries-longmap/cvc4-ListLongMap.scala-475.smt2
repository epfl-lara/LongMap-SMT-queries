; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9588 () Bool)

(assert start!9588)

(declare-fun b!70635 () Bool)

(declare-fun b_free!2097 () Bool)

(declare-fun b_next!2097 () Bool)

(assert (=> b!70635 (= b_free!2097 (not b_next!2097))))

(declare-fun tp!8459 () Bool)

(declare-fun b_and!4343 () Bool)

(assert (=> b!70635 (= tp!8459 b_and!4343)))

(declare-fun b!70646 () Bool)

(declare-fun b_free!2099 () Bool)

(declare-fun b_next!2099 () Bool)

(assert (=> b!70646 (= b_free!2099 (not b_next!2099))))

(declare-fun tp!8461 () Bool)

(declare-fun b_and!4345 () Bool)

(assert (=> b!70646 (= tp!8461 b_and!4345)))

(declare-fun b!70634 () Bool)

(declare-fun e!46254 () Bool)

(declare-fun tp_is_empty!2465 () Bool)

(assert (=> b!70634 (= e!46254 tp_is_empty!2465)))

(declare-fun mapIsEmpty!3133 () Bool)

(declare-fun mapRes!3133 () Bool)

(assert (=> mapIsEmpty!3133 mapRes!3133))

(declare-fun e!46255 () Bool)

(declare-datatypes ((V!2933 0))(
  ( (V!2934 (val!1277 Int)) )
))
(declare-datatypes ((array!3873 0))(
  ( (array!3874 (arr!1849 (Array (_ BitVec 32) (_ BitVec 64))) (size!2086 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!889 0))(
  ( (ValueCellFull!889 (v!2510 V!2933)) (EmptyCell!889) )
))
(declare-datatypes ((array!3875 0))(
  ( (array!3876 (arr!1850 (Array (_ BitVec 32) ValueCell!889)) (size!2087 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!686 0))(
  ( (LongMapFixedSize!687 (defaultEntry!2190 Int) (mask!6145 (_ BitVec 32)) (extraKeys!2053 (_ BitVec 32)) (zeroValue!2094 V!2933) (minValue!2094 V!2933) (_size!392 (_ BitVec 32)) (_keys!3838 array!3873) (_values!2173 array!3875) (_vacant!392 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!490 0))(
  ( (Cell!491 (v!2511 LongMapFixedSize!686)) )
))
(declare-datatypes ((LongMap!490 0))(
  ( (LongMap!491 (underlying!256 Cell!490)) )
))
(declare-fun thiss!992 () LongMap!490)

(declare-fun e!46246 () Bool)

(declare-fun array_inv!1139 (array!3873) Bool)

(declare-fun array_inv!1140 (array!3875) Bool)

(assert (=> b!70635 (= e!46246 (and tp!8459 tp_is_empty!2465 (array_inv!1139 (_keys!3838 (v!2511 (underlying!256 thiss!992)))) (array_inv!1140 (_values!2173 (v!2511 (underlying!256 thiss!992)))) e!46255))))

(declare-fun b!70636 () Bool)

(declare-fun e!46253 () Bool)

(declare-fun e!46249 () Bool)

(assert (=> b!70636 (= e!46253 e!46249)))

(declare-fun res!37763 () Bool)

(assert (=> b!70636 (=> (not res!37763) (not e!46249))))

(declare-datatypes ((tuple2!2110 0))(
  ( (tuple2!2111 (_1!1066 (_ BitVec 64)) (_2!1066 V!2933)) )
))
(declare-datatypes ((List!1474 0))(
  ( (Nil!1471) (Cons!1470 (h!2056 tuple2!2110) (t!5002 List!1474)) )
))
(declare-datatypes ((ListLongMap!1413 0))(
  ( (ListLongMap!1414 (toList!722 List!1474)) )
))
(declare-fun lt!31199 () ListLongMap!1413)

(declare-fun lt!31201 () ListLongMap!1413)

(assert (=> b!70636 (= res!37763 (= lt!31199 lt!31201))))

(declare-fun newMap!16 () LongMapFixedSize!686)

(declare-fun map!1145 (LongMapFixedSize!686) ListLongMap!1413)

(assert (=> b!70636 (= lt!31201 (map!1145 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!420 (array!3873 array!3875 (_ BitVec 32) (_ BitVec 32) V!2933 V!2933 (_ BitVec 32) Int) ListLongMap!1413)

(assert (=> b!70636 (= lt!31199 (getCurrentListMap!420 (_keys!3838 (v!2511 (underlying!256 thiss!992))) (_values!2173 (v!2511 (underlying!256 thiss!992))) (mask!6145 (v!2511 (underlying!256 thiss!992))) (extraKeys!2053 (v!2511 (underlying!256 thiss!992))) (zeroValue!2094 (v!2511 (underlying!256 thiss!992))) (minValue!2094 (v!2511 (underlying!256 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2190 (v!2511 (underlying!256 thiss!992)))))))

(declare-fun b!70637 () Bool)

(declare-fun res!37758 () Bool)

(assert (=> b!70637 (=> (not res!37758) (not e!46253))))

(assert (=> b!70637 (= res!37758 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6145 newMap!16)) (_size!392 (v!2511 (underlying!256 thiss!992)))))))

(declare-fun b!70639 () Bool)

(declare-fun e!46256 () Bool)

(declare-fun e!46248 () Bool)

(assert (=> b!70639 (= e!46256 e!46248)))

(declare-fun res!37759 () Bool)

(assert (=> b!70639 (=> (not res!37759) (not e!46248))))

(declare-datatypes ((tuple2!2112 0))(
  ( (tuple2!2113 (_1!1067 Bool) (_2!1067 LongMapFixedSize!686)) )
))
(declare-fun lt!31197 () tuple2!2112)

(assert (=> b!70639 (= res!37759 (and (_1!1067 lt!31197) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2000 0))(
  ( (Unit!2001) )
))
(declare-fun lt!31200 () Unit!2000)

(declare-fun e!46251 () Unit!2000)

(assert (=> b!70639 (= lt!31200 e!46251)))

(declare-fun c!10232 () Bool)

(declare-fun contains!718 (ListLongMap!1413 (_ BitVec 64)) Bool)

(assert (=> b!70639 (= c!10232 (contains!718 lt!31201 (select (arr!1849 (_keys!3838 (v!2511 (underlying!256 thiss!992)))) from!355)))))

(declare-fun lt!31191 () V!2933)

(declare-fun update!93 (LongMapFixedSize!686 (_ BitVec 64) V!2933) tuple2!2112)

(assert (=> b!70639 (= lt!31197 (update!93 newMap!16 (select (arr!1849 (_keys!3838 (v!2511 (underlying!256 thiss!992)))) from!355) lt!31191))))

(declare-fun b!70640 () Bool)

(declare-fun mapRes!3134 () Bool)

(assert (=> b!70640 (= e!46255 (and e!46254 mapRes!3134))))

(declare-fun condMapEmpty!3133 () Bool)

(declare-fun mapDefault!3134 () ValueCell!889)

