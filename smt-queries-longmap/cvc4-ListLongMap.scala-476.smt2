; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9594 () Bool)

(assert start!9594)

(declare-fun b!70837 () Bool)

(declare-fun b_free!2109 () Bool)

(declare-fun b_next!2109 () Bool)

(assert (=> b!70837 (= b_free!2109 (not b_next!2109))))

(declare-fun tp!8498 () Bool)

(declare-fun b_and!4367 () Bool)

(assert (=> b!70837 (= tp!8498 b_and!4367)))

(declare-fun b!70820 () Bool)

(declare-fun b_free!2111 () Bool)

(declare-fun b_next!2111 () Bool)

(assert (=> b!70820 (= b_free!2111 (not b_next!2111))))

(declare-fun tp!8496 () Bool)

(declare-fun b_and!4369 () Bool)

(assert (=> b!70820 (= tp!8496 b_and!4369)))

(declare-fun e!46407 () Bool)

(declare-fun tp_is_empty!2471 () Bool)

(declare-datatypes ((V!2941 0))(
  ( (V!2942 (val!1280 Int)) )
))
(declare-datatypes ((array!3885 0))(
  ( (array!3886 (arr!1855 (Array (_ BitVec 32) (_ BitVec 64))) (size!2092 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!892 0))(
  ( (ValueCellFull!892 (v!2515 V!2941)) (EmptyCell!892) )
))
(declare-datatypes ((array!3887 0))(
  ( (array!3888 (arr!1856 (Array (_ BitVec 32) ValueCell!892)) (size!2093 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!692 0))(
  ( (LongMapFixedSize!693 (defaultEntry!2193 Int) (mask!6150 (_ BitVec 32)) (extraKeys!2056 (_ BitVec 32)) (zeroValue!2097 V!2941) (minValue!2097 V!2941) (_size!395 (_ BitVec 32)) (_keys!3841 array!3885) (_values!2176 array!3887) (_vacant!395 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!692)

(declare-fun e!46406 () Bool)

(declare-fun array_inv!1143 (array!3885) Bool)

(declare-fun array_inv!1144 (array!3887) Bool)

(assert (=> b!70820 (= e!46406 (and tp!8496 tp_is_empty!2471 (array_inv!1143 (_keys!3841 newMap!16)) (array_inv!1144 (_values!2176 newMap!16)) e!46407))))

(declare-fun b!70821 () Bool)

(declare-fun e!46417 () Bool)

(assert (=> b!70821 (= e!46417 tp_is_empty!2471)))

(declare-fun b!70822 () Bool)

(declare-fun res!37835 () Bool)

(declare-fun e!46410 () Bool)

(assert (=> b!70822 (=> (not res!37835) (not e!46410))))

(declare-datatypes ((Cell!494 0))(
  ( (Cell!495 (v!2516 LongMapFixedSize!692)) )
))
(declare-datatypes ((LongMap!494 0))(
  ( (LongMap!495 (underlying!258 Cell!494)) )
))
(declare-fun thiss!992 () LongMap!494)

(assert (=> b!70822 (= res!37835 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6150 newMap!16)) (_size!395 (v!2516 (underlying!258 thiss!992)))))))

(declare-fun b!70823 () Bool)

(declare-fun res!37836 () Bool)

(assert (=> b!70823 (=> (not res!37836) (not e!46410))))

(declare-fun valid!288 (LongMapFixedSize!692) Bool)

(assert (=> b!70823 (= res!37836 (valid!288 newMap!16))))

(declare-fun b!70824 () Bool)

(declare-fun res!37830 () Bool)

(assert (=> b!70824 (=> (not res!37830) (not e!46410))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!70824 (= res!37830 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2092 (_keys!3841 (v!2516 (underlying!258 thiss!992)))))))))

(declare-fun mapNonEmpty!3151 () Bool)

(declare-fun mapRes!3151 () Bool)

(declare-fun tp!8497 () Bool)

(declare-fun e!46411 () Bool)

(assert (=> mapNonEmpty!3151 (= mapRes!3151 (and tp!8497 e!46411))))

(declare-fun mapRest!3152 () (Array (_ BitVec 32) ValueCell!892))

(declare-fun mapValue!3152 () ValueCell!892)

(declare-fun mapKey!3152 () (_ BitVec 32))

(assert (=> mapNonEmpty!3151 (= (arr!1856 (_values!2176 (v!2516 (underlying!258 thiss!992)))) (store mapRest!3152 mapKey!3152 mapValue!3152))))

(declare-fun mapIsEmpty!3151 () Bool)

(declare-fun mapRes!3152 () Bool)

(assert (=> mapIsEmpty!3151 mapRes!3152))

(declare-fun b!70825 () Bool)

(declare-fun e!46419 () Bool)

(declare-fun e!46422 () Bool)

(assert (=> b!70825 (= e!46419 e!46422)))

(declare-fun res!37834 () Bool)

(assert (=> b!70825 (=> (not res!37834) (not e!46422))))

(declare-datatypes ((tuple2!2118 0))(
  ( (tuple2!2119 (_1!1070 Bool) (_2!1070 LongMapFixedSize!692)) )
))
(declare-fun lt!31309 () tuple2!2118)

(assert (=> b!70825 (= res!37834 (and (_1!1070 lt!31309) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2006 0))(
  ( (Unit!2007) )
))
(declare-fun lt!31306 () Unit!2006)

(declare-fun e!46409 () Unit!2006)

(assert (=> b!70825 (= lt!31306 e!46409)))

(declare-fun c!10241 () Bool)

(declare-datatypes ((tuple2!2120 0))(
  ( (tuple2!2121 (_1!1071 (_ BitVec 64)) (_2!1071 V!2941)) )
))
(declare-datatypes ((List!1477 0))(
  ( (Nil!1474) (Cons!1473 (h!2059 tuple2!2120) (t!5017 List!1477)) )
))
(declare-datatypes ((ListLongMap!1417 0))(
  ( (ListLongMap!1418 (toList!724 List!1477)) )
))
(declare-fun lt!31310 () ListLongMap!1417)

(declare-fun contains!720 (ListLongMap!1417 (_ BitVec 64)) Bool)

(assert (=> b!70825 (= c!10241 (contains!720 lt!31310 (select (arr!1855 (_keys!3841 (v!2516 (underlying!258 thiss!992)))) from!355)))))

(declare-fun lt!31299 () V!2941)

(declare-fun update!95 (LongMapFixedSize!692 (_ BitVec 64) V!2941) tuple2!2118)

(assert (=> b!70825 (= lt!31309 (update!95 newMap!16 (select (arr!1855 (_keys!3841 (v!2516 (underlying!258 thiss!992)))) from!355) lt!31299))))

(declare-fun mapNonEmpty!3152 () Bool)

(declare-fun tp!8495 () Bool)

(declare-fun e!46416 () Bool)

(assert (=> mapNonEmpty!3152 (= mapRes!3152 (and tp!8495 e!46416))))

(declare-fun mapRest!3151 () (Array (_ BitVec 32) ValueCell!892))

(declare-fun mapKey!3151 () (_ BitVec 32))

(declare-fun mapValue!3151 () ValueCell!892)

(assert (=> mapNonEmpty!3152 (= (arr!1856 (_values!2176 newMap!16)) (store mapRest!3151 mapKey!3151 mapValue!3151))))

(declare-fun b!70827 () Bool)

(declare-fun e!46420 () Bool)

(assert (=> b!70827 (= e!46420 (and e!46417 mapRes!3151))))

(declare-fun condMapEmpty!3152 () Bool)

(declare-fun mapDefault!3151 () ValueCell!892)

