; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8322 () Bool)

(assert start!8322)

(declare-fun b!54772 () Bool)

(declare-fun b_free!1809 () Bool)

(declare-fun b_next!1809 () Bool)

(assert (=> b!54772 (= b_free!1809 (not b_next!1809))))

(declare-fun tp!7529 () Bool)

(declare-fun b_and!3159 () Bool)

(assert (=> b!54772 (= tp!7529 b_and!3159)))

(declare-fun b!54769 () Bool)

(declare-fun b_free!1811 () Bool)

(declare-fun b_next!1811 () Bool)

(assert (=> b!54769 (= b_free!1811 (not b_next!1811))))

(declare-fun tp!7527 () Bool)

(declare-fun b_and!3161 () Bool)

(assert (=> b!54769 (= tp!7527 b_and!3161)))

(declare-fun b!54767 () Bool)

(declare-fun e!35851 () Bool)

(declare-fun tp_is_empty!2321 () Bool)

(assert (=> b!54767 (= e!35851 tp_is_empty!2321)))

(declare-fun b!54768 () Bool)

(declare-fun e!35840 () Bool)

(declare-fun e!35850 () Bool)

(assert (=> b!54768 (= e!35840 e!35850)))

(declare-fun res!30944 () Bool)

(assert (=> b!54768 (=> (not res!30944) (not e!35850))))

(declare-datatypes ((V!2741 0))(
  ( (V!2742 (val!1205 Int)) )
))
(declare-datatypes ((array!3565 0))(
  ( (array!3566 (arr!1705 (Array (_ BitVec 32) (_ BitVec 64))) (size!1934 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!817 0))(
  ( (ValueCellFull!817 (v!2296 V!2741)) (EmptyCell!817) )
))
(declare-datatypes ((array!3567 0))(
  ( (array!3568 (arr!1706 (Array (_ BitVec 32) ValueCell!817)) (size!1935 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!542 0))(
  ( (LongMapFixedSize!543 (defaultEntry!1985 Int) (mask!5834 (_ BitVec 32)) (extraKeys!1876 (_ BitVec 32)) (zeroValue!1903 V!2741) (minValue!1903 V!2741) (_size!320 (_ BitVec 32)) (_keys!3605 array!3565) (_values!1968 array!3567) (_vacant!320 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!358 0))(
  ( (Cell!359 (v!2297 LongMapFixedSize!542)) )
))
(declare-datatypes ((LongMap!358 0))(
  ( (LongMap!359 (underlying!190 Cell!358)) )
))
(declare-fun thiss!992 () LongMap!358)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!1938 0))(
  ( (tuple2!1939 (_1!980 (_ BitVec 64)) (_2!980 V!2741)) )
))
(declare-datatypes ((List!1382 0))(
  ( (Nil!1379) (Cons!1378 (h!1958 tuple2!1938) (t!4560 List!1382)) )
))
(declare-datatypes ((ListLongMap!1317 0))(
  ( (ListLongMap!1318 (toList!674 List!1382)) )
))
(declare-fun lt!21743 () ListLongMap!1317)

(declare-fun contains!647 (ListLongMap!1317 (_ BitVec 64)) Bool)

(assert (=> b!54768 (= res!30944 (contains!647 lt!21743 (select (arr!1705 (_keys!3605 (v!2297 (underlying!190 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1940 0))(
  ( (tuple2!1941 (_1!981 Bool) (_2!981 LongMapFixedSize!542)) )
))
(declare-fun lt!21741 () tuple2!1940)

(declare-fun newMap!16 () LongMapFixedSize!542)

(declare-fun update!55 (LongMapFixedSize!542 (_ BitVec 64) V!2741) tuple2!1940)

(declare-fun get!1017 (ValueCell!817 V!2741) V!2741)

(declare-fun dynLambda!286 (Int (_ BitVec 64)) V!2741)

(assert (=> b!54768 (= lt!21741 (update!55 newMap!16 (select (arr!1705 (_keys!3605 (v!2297 (underlying!190 thiss!992)))) from!355) (get!1017 (select (arr!1706 (_values!1968 (v!2297 (underlying!190 thiss!992)))) from!355) (dynLambda!286 (defaultEntry!1985 (v!2297 (underlying!190 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!35842 () Bool)

(declare-fun e!35845 () Bool)

(declare-fun array_inv!1055 (array!3565) Bool)

(declare-fun array_inv!1056 (array!3567) Bool)

(assert (=> b!54769 (= e!35842 (and tp!7527 tp_is_empty!2321 (array_inv!1055 (_keys!3605 newMap!16)) (array_inv!1056 (_values!1968 newMap!16)) e!35845))))

(declare-fun b!54770 () Bool)

(declare-fun e!35848 () Bool)

(declare-fun e!35841 () Bool)

(assert (=> b!54770 (= e!35848 e!35841)))

(declare-fun b!54771 () Bool)

(declare-fun e!35844 () Bool)

(assert (=> b!54771 (= e!35850 (not e!35844))))

(declare-fun res!30941 () Bool)

(assert (=> b!54771 (=> res!30941 e!35844)))

(assert (=> b!54771 (= res!30941 (or (bvsge (size!1934 (_keys!3605 (v!2297 (underlying!190 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1934 (_keys!3605 (v!2297 (underlying!190 thiss!992))))) (bvsgt from!355 (size!1934 (_keys!3605 (v!2297 (underlying!190 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54771 (arrayContainsKey!0 (_keys!3605 (v!2297 (underlying!190 thiss!992))) (select (arr!1705 (_keys!3605 (v!2297 (underlying!190 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1439 0))(
  ( (Unit!1440) )
))
(declare-fun lt!21742 () Unit!1439)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!9 (array!3565 array!3567 (_ BitVec 32) (_ BitVec 32) V!2741 V!2741 (_ BitVec 64) (_ BitVec 32) Int) Unit!1439)

(assert (=> b!54771 (= lt!21742 (lemmaListMapContainsThenArrayContainsFrom!9 (_keys!3605 (v!2297 (underlying!190 thiss!992))) (_values!1968 (v!2297 (underlying!190 thiss!992))) (mask!5834 (v!2297 (underlying!190 thiss!992))) (extraKeys!1876 (v!2297 (underlying!190 thiss!992))) (zeroValue!1903 (v!2297 (underlying!190 thiss!992))) (minValue!1903 (v!2297 (underlying!190 thiss!992))) (select (arr!1705 (_keys!3605 (v!2297 (underlying!190 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1985 (v!2297 (underlying!190 thiss!992)))))))

(declare-fun e!35854 () Bool)

(declare-fun e!35849 () Bool)

(assert (=> b!54772 (= e!35854 (and tp!7529 tp_is_empty!2321 (array_inv!1055 (_keys!3605 (v!2297 (underlying!190 thiss!992)))) (array_inv!1056 (_values!1968 (v!2297 (underlying!190 thiss!992)))) e!35849))))

(declare-fun b!54773 () Bool)

(declare-fun mapRes!2633 () Bool)

(assert (=> b!54773 (= e!35849 (and e!35851 mapRes!2633))))

(declare-fun condMapEmpty!2633 () Bool)

(declare-fun mapDefault!2633 () ValueCell!817)

