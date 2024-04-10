; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9264 () Bool)

(assert start!9264)

(declare-fun b!66416 () Bool)

(declare-fun b_free!2073 () Bool)

(declare-fun b_next!2073 () Bool)

(assert (=> b!66416 (= b_free!2073 (not b_next!2073))))

(declare-fun tp!8373 () Bool)

(declare-fun b_and!4111 () Bool)

(assert (=> b!66416 (= tp!8373 b_and!4111)))

(declare-fun b!66423 () Bool)

(declare-fun b_free!2075 () Bool)

(declare-fun b_next!2075 () Bool)

(assert (=> b!66423 (= b_free!2075 (not b_next!2075))))

(declare-fun tp!8371 () Bool)

(declare-fun b_and!4113 () Bool)

(assert (=> b!66423 (= tp!8371 b_and!4113)))

(declare-fun b!66411 () Bool)

(declare-fun e!43603 () Bool)

(declare-fun tp_is_empty!2453 () Bool)

(assert (=> b!66411 (= e!43603 tp_is_empty!2453)))

(declare-fun b!66412 () Bool)

(declare-fun e!43601 () Bool)

(declare-fun e!43600 () Bool)

(assert (=> b!66412 (= e!43601 e!43600)))

(declare-fun res!35971 () Bool)

(declare-fun e!43604 () Bool)

(assert (=> start!9264 (=> (not res!35971) (not e!43604))))

(declare-datatypes ((V!2917 0))(
  ( (V!2918 (val!1271 Int)) )
))
(declare-datatypes ((array!3845 0))(
  ( (array!3846 (arr!1837 (Array (_ BitVec 32) (_ BitVec 64))) (size!2072 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!883 0))(
  ( (ValueCellFull!883 (v!2479 V!2917)) (EmptyCell!883) )
))
(declare-datatypes ((array!3847 0))(
  ( (array!3848 (arr!1838 (Array (_ BitVec 32) ValueCell!883)) (size!2073 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!674 0))(
  ( (LongMapFixedSize!675 (defaultEntry!2148 Int) (mask!6083 (_ BitVec 32)) (extraKeys!2019 (_ BitVec 32)) (zeroValue!2056 V!2917) (minValue!2056 V!2917) (_size!386 (_ BitVec 32)) (_keys!3788 array!3845) (_values!2131 array!3847) (_vacant!386 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!480 0))(
  ( (Cell!481 (v!2480 LongMapFixedSize!674)) )
))
(declare-datatypes ((LongMap!480 0))(
  ( (LongMap!481 (underlying!251 Cell!480)) )
))
(declare-fun thiss!992 () LongMap!480)

(declare-fun valid!280 (LongMap!480) Bool)

(assert (=> start!9264 (= res!35971 (valid!280 thiss!992))))

(assert (=> start!9264 e!43604))

(declare-fun e!43602 () Bool)

(assert (=> start!9264 e!43602))

(assert (=> start!9264 true))

(declare-fun e!43593 () Bool)

(assert (=> start!9264 e!43593))

(declare-fun b!66413 () Bool)

(declare-fun e!43592 () Bool)

(declare-fun e!43597 () Bool)

(assert (=> b!66413 (= e!43592 e!43597)))

(declare-fun res!35969 () Bool)

(assert (=> b!66413 (=> (not res!35969) (not e!43597))))

(declare-datatypes ((tuple2!2096 0))(
  ( (tuple2!2097 (_1!1059 Bool) (_2!1059 LongMapFixedSize!674)) )
))
(declare-fun lt!28658 () tuple2!2096)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!66413 (= res!35969 (and (_1!1059 lt!28658) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!1842 0))(
  ( (Unit!1843) )
))
(declare-fun lt!28652 () Unit!1842)

(declare-fun e!43595 () Unit!1842)

(assert (=> b!66413 (= lt!28652 e!43595)))

(declare-fun c!9134 () Bool)

(declare-datatypes ((tuple2!2098 0))(
  ( (tuple2!2099 (_1!1060 (_ BitVec 64)) (_2!1060 V!2917)) )
))
(declare-datatypes ((List!1467 0))(
  ( (Nil!1464) (Cons!1463 (h!2047 tuple2!2098) (t!4953 List!1467)) )
))
(declare-datatypes ((ListLongMap!1405 0))(
  ( (ListLongMap!1406 (toList!718 List!1467)) )
))
(declare-fun lt!28655 () ListLongMap!1405)

(declare-fun contains!711 (ListLongMap!1405 (_ BitVec 64)) Bool)

(assert (=> b!66413 (= c!9134 (contains!711 lt!28655 (select (arr!1837 (_keys!3788 (v!2480 (underlying!251 thiss!992)))) from!355)))))

(declare-fun lt!28651 () V!2917)

(declare-fun newMap!16 () LongMapFixedSize!674)

(declare-fun update!90 (LongMapFixedSize!674 (_ BitVec 64) V!2917) tuple2!2096)

(assert (=> b!66413 (= lt!28658 (update!90 newMap!16 (select (arr!1837 (_keys!3788 (v!2480 (underlying!251 thiss!992)))) from!355) lt!28651))))

(declare-fun mapNonEmpty!3081 () Bool)

(declare-fun mapRes!3082 () Bool)

(declare-fun tp!8374 () Bool)

(assert (=> mapNonEmpty!3081 (= mapRes!3082 (and tp!8374 e!43603))))

(declare-fun mapRest!3081 () (Array (_ BitVec 32) ValueCell!883))

(declare-fun mapValue!3082 () ValueCell!883)

(declare-fun mapKey!3082 () (_ BitVec 32))

(assert (=> mapNonEmpty!3081 (= (arr!1838 (_values!2131 newMap!16)) (store mapRest!3081 mapKey!3082 mapValue!3082))))

(declare-fun b!66414 () Bool)

(declare-fun res!35970 () Bool)

(assert (=> b!66414 (=> (not res!35970) (not e!43604))))

(declare-fun valid!281 (LongMapFixedSize!674) Bool)

(assert (=> b!66414 (= res!35970 (valid!281 newMap!16))))

(declare-fun b!66415 () Bool)

(declare-fun e!43591 () Bool)

(assert (=> b!66415 (= e!43591 e!43592)))

(declare-fun res!35968 () Bool)

(assert (=> b!66415 (=> (not res!35968) (not e!43592))))

(assert (=> b!66415 (= res!35968 (and (not (= (select (arr!1837 (_keys!3788 (v!2480 (underlying!251 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1837 (_keys!3788 (v!2480 (underlying!251 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1117 (ValueCell!883 V!2917) V!2917)

(declare-fun dynLambda!320 (Int (_ BitVec 64)) V!2917)

(assert (=> b!66415 (= lt!28651 (get!1117 (select (arr!1838 (_values!2131 (v!2480 (underlying!251 thiss!992)))) from!355) (dynLambda!320 (defaultEntry!2148 (v!2480 (underlying!251 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!43594 () Bool)

(declare-fun array_inv!1131 (array!3845) Bool)

(declare-fun array_inv!1132 (array!3847) Bool)

(assert (=> b!66416 (= e!43600 (and tp!8373 tp_is_empty!2453 (array_inv!1131 (_keys!3788 (v!2480 (underlying!251 thiss!992)))) (array_inv!1132 (_values!2131 (v!2480 (underlying!251 thiss!992)))) e!43594))))

(declare-fun b!66417 () Bool)

(declare-fun e!43599 () Bool)

(assert (=> b!66417 (= e!43599 tp_is_empty!2453)))

(declare-fun b!66418 () Bool)

(declare-fun res!35975 () Bool)

(assert (=> b!66418 (=> (not res!35975) (not e!43604))))

(assert (=> b!66418 (= res!35975 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2072 (_keys!3788 (v!2480 (underlying!251 thiss!992)))))))))

(declare-fun b!66419 () Bool)

(assert (=> b!66419 (= e!43604 e!43591)))

(declare-fun res!35973 () Bool)

(assert (=> b!66419 (=> (not res!35973) (not e!43591))))

(declare-fun lt!28662 () ListLongMap!1405)

(assert (=> b!66419 (= res!35973 (= lt!28662 lt!28655))))

(declare-fun map!1137 (LongMapFixedSize!674) ListLongMap!1405)

(assert (=> b!66419 (= lt!28655 (map!1137 newMap!16))))

(declare-fun getCurrentListMap!416 (array!3845 array!3847 (_ BitVec 32) (_ BitVec 32) V!2917 V!2917 (_ BitVec 32) Int) ListLongMap!1405)

(assert (=> b!66419 (= lt!28662 (getCurrentListMap!416 (_keys!3788 (v!2480 (underlying!251 thiss!992))) (_values!2131 (v!2480 (underlying!251 thiss!992))) (mask!6083 (v!2480 (underlying!251 thiss!992))) (extraKeys!2019 (v!2480 (underlying!251 thiss!992))) (zeroValue!2056 (v!2480 (underlying!251 thiss!992))) (minValue!2056 (v!2480 (underlying!251 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2148 (v!2480 (underlying!251 thiss!992)))))))

(declare-fun mapIsEmpty!3081 () Bool)

(declare-fun mapRes!3081 () Bool)

(assert (=> mapIsEmpty!3081 mapRes!3081))

(declare-fun b!66420 () Bool)

(declare-fun e!43588 () Bool)

(declare-fun e!43589 () Bool)

(assert (=> b!66420 (= e!43588 (and e!43589 mapRes!3082))))

(declare-fun condMapEmpty!3082 () Bool)

(declare-fun mapDefault!3082 () ValueCell!883)

