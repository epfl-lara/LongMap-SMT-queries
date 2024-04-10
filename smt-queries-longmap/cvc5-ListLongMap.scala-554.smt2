; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14880 () Bool)

(assert start!14880)

(declare-fun b!142984 () Bool)

(declare-fun b_free!3037 () Bool)

(declare-fun b_next!3037 () Bool)

(assert (=> b!142984 (= b_free!3037 (not b_next!3037))))

(declare-fun tp!11594 () Bool)

(declare-fun b_and!8907 () Bool)

(assert (=> b!142984 (= tp!11594 b_and!8907)))

(declare-fun b!142990 () Bool)

(declare-fun b_free!3039 () Bool)

(declare-fun b_next!3039 () Bool)

(assert (=> b!142990 (= b_free!3039 (not b_next!3039))))

(declare-fun tp!11593 () Bool)

(declare-fun b_and!8909 () Bool)

(assert (=> b!142990 (= tp!11593 b_and!8909)))

(declare-datatypes ((V!3561 0))(
  ( (V!3562 (val!1512 Int)) )
))
(declare-datatypes ((array!4907 0))(
  ( (array!4908 (arr!2319 (Array (_ BitVec 32) (_ BitVec 64))) (size!2592 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1124 0))(
  ( (ValueCellFull!1124 (v!3294 V!3561)) (EmptyCell!1124) )
))
(declare-datatypes ((array!4909 0))(
  ( (array!4910 (arr!2320 (Array (_ BitVec 32) ValueCell!1124)) (size!2593 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1156 0))(
  ( (LongMapFixedSize!1157 (defaultEntry!2962 Int) (mask!7314 (_ BitVec 32)) (extraKeys!2713 (_ BitVec 32)) (zeroValue!2810 V!3561) (minValue!2810 V!3561) (_size!627 (_ BitVec 32)) (_keys!4725 array!4907) (_values!2945 array!4909) (_vacant!627 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!942 0))(
  ( (Cell!943 (v!3295 LongMapFixedSize!1156)) )
))
(declare-datatypes ((LongMap!942 0))(
  ( (LongMap!943 (underlying!482 Cell!942)) )
))
(declare-fun thiss!992 () LongMap!942)

(declare-fun tp_is_empty!2935 () Bool)

(declare-fun e!93178 () Bool)

(declare-fun e!93172 () Bool)

(declare-fun array_inv!1455 (array!4907) Bool)

(declare-fun array_inv!1456 (array!4909) Bool)

(assert (=> b!142984 (= e!93172 (and tp!11594 tp_is_empty!2935 (array_inv!1455 (_keys!4725 (v!3295 (underlying!482 thiss!992)))) (array_inv!1456 (_values!2945 (v!3295 (underlying!482 thiss!992)))) e!93178))))

(declare-fun b!142985 () Bool)

(declare-fun res!68143 () Bool)

(declare-fun e!93181 () Bool)

(assert (=> b!142985 (=> (not res!68143) (not e!93181))))

(declare-fun newMap!16 () LongMapFixedSize!1156)

(declare-fun valid!558 (LongMapFixedSize!1156) Bool)

(assert (=> b!142985 (= res!68143 (valid!558 newMap!16))))

(declare-fun b!142986 () Bool)

(declare-fun e!93180 () Bool)

(assert (=> b!142986 (= e!93180 tp_is_empty!2935)))

(declare-fun b!142987 () Bool)

(declare-fun res!68141 () Bool)

(assert (=> b!142987 (=> (not res!68141) (not e!93181))))

(assert (=> b!142987 (= res!68141 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7314 newMap!16)) (_size!627 (v!3295 (underlying!482 thiss!992)))))))

(declare-fun b!142988 () Bool)

(declare-fun e!93171 () Bool)

(declare-fun e!93185 () Bool)

(assert (=> b!142988 (= e!93171 e!93185)))

(declare-fun res!68144 () Bool)

(assert (=> b!142988 (=> (not res!68144) (not e!93185))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2702 0))(
  ( (tuple2!2703 (_1!1362 (_ BitVec 64)) (_2!1362 V!3561)) )
))
(declare-datatypes ((List!1748 0))(
  ( (Nil!1745) (Cons!1744 (h!2352 tuple2!2702) (t!6357 List!1748)) )
))
(declare-datatypes ((ListLongMap!1747 0))(
  ( (ListLongMap!1748 (toList!889 List!1748)) )
))
(declare-fun lt!74868 () ListLongMap!1747)

(declare-fun contains!926 (ListLongMap!1747 (_ BitVec 64)) Bool)

(assert (=> b!142988 (= res!68144 (contains!926 lt!74868 (select (arr!2319 (_keys!4725 (v!3295 (underlying!482 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2704 0))(
  ( (tuple2!2705 (_1!1363 Bool) (_2!1363 LongMapFixedSize!1156)) )
))
(declare-fun lt!74872 () tuple2!2704)

(declare-fun update!212 (LongMapFixedSize!1156 (_ BitVec 64) V!3561) tuple2!2704)

(declare-fun get!1534 (ValueCell!1124 V!3561) V!3561)

(declare-fun dynLambda!443 (Int (_ BitVec 64)) V!3561)

(assert (=> b!142988 (= lt!74872 (update!212 newMap!16 (select (arr!2319 (_keys!4725 (v!3295 (underlying!482 thiss!992)))) from!355) (get!1534 (select (arr!2320 (_values!2945 (v!3295 (underlying!482 thiss!992)))) from!355) (dynLambda!443 (defaultEntry!2962 (v!3295 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!4855 () Bool)

(declare-fun mapRes!4855 () Bool)

(assert (=> mapIsEmpty!4855 mapRes!4855))

(declare-fun e!93174 () Bool)

(declare-fun e!93182 () Bool)

(assert (=> b!142990 (= e!93182 (and tp!11593 tp_is_empty!2935 (array_inv!1455 (_keys!4725 newMap!16)) (array_inv!1456 (_values!2945 newMap!16)) e!93174))))

(declare-fun b!142991 () Bool)

(declare-fun e!93175 () Bool)

(assert (=> b!142991 (= e!93175 tp_is_empty!2935)))

(declare-fun b!142992 () Bool)

(declare-fun e!93179 () Bool)

(assert (=> b!142992 (= e!93179 tp_is_empty!2935)))

(declare-fun b!142993 () Bool)

(assert (=> b!142993 (= e!93178 (and e!93179 mapRes!4855))))

(declare-fun condMapEmpty!4856 () Bool)

(declare-fun mapDefault!4855 () ValueCell!1124)

