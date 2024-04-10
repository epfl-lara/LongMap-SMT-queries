; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10134 () Bool)

(assert start!10134)

(declare-fun b!77084 () Bool)

(declare-fun b_free!2157 () Bool)

(declare-fun b_next!2157 () Bool)

(assert (=> b!77084 (= b_free!2157 (not b_next!2157))))

(declare-fun tp!8667 () Bool)

(declare-fun b_and!4715 () Bool)

(assert (=> b!77084 (= tp!8667 b_and!4715)))

(declare-fun b!77093 () Bool)

(declare-fun b_free!2159 () Bool)

(declare-fun b_next!2159 () Bool)

(assert (=> b!77093 (= b_free!2159 (not b_next!2159))))

(declare-fun tp!8670 () Bool)

(declare-fun b_and!4717 () Bool)

(assert (=> b!77093 (= tp!8670 b_and!4717)))

(declare-fun res!40521 () Bool)

(declare-fun e!50340 () Bool)

(assert (=> start!10134 (=> (not res!40521) (not e!50340))))

(declare-datatypes ((V!2973 0))(
  ( (V!2974 (val!1292 Int)) )
))
(declare-datatypes ((array!3941 0))(
  ( (array!3942 (arr!1879 (Array (_ BitVec 32) (_ BitVec 64))) (size!2120 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!904 0))(
  ( (ValueCellFull!904 (v!2573 V!2973)) (EmptyCell!904) )
))
(declare-datatypes ((array!3943 0))(
  ( (array!3944 (arr!1880 (Array (_ BitVec 32) ValueCell!904)) (size!2121 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!716 0))(
  ( (LongMapFixedSize!717 (defaultEntry!2261 Int) (mask!6250 (_ BitVec 32)) (extraKeys!2112 (_ BitVec 32)) (zeroValue!2159 V!2973) (minValue!2159 V!2973) (_size!407 (_ BitVec 32)) (_keys!3921 array!3941) (_values!2244 array!3943) (_vacant!407 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!518 0))(
  ( (Cell!519 (v!2574 LongMapFixedSize!716)) )
))
(declare-datatypes ((LongMap!518 0))(
  ( (LongMap!519 (underlying!270 Cell!518)) )
))
(declare-fun thiss!992 () LongMap!518)

(declare-fun valid!304 (LongMap!518) Bool)

(assert (=> start!10134 (= res!40521 (valid!304 thiss!992))))

(assert (=> start!10134 e!50340))

(declare-fun e!50335 () Bool)

(assert (=> start!10134 e!50335))

(assert (=> start!10134 true))

(declare-fun e!50336 () Bool)

(assert (=> start!10134 e!50336))

(declare-fun mapNonEmpty!3251 () Bool)

(declare-fun mapRes!3252 () Bool)

(declare-fun tp!8669 () Bool)

(declare-fun e!50342 () Bool)

(assert (=> mapNonEmpty!3251 (= mapRes!3252 (and tp!8669 e!50342))))

(declare-fun mapRest!3251 () (Array (_ BitVec 32) ValueCell!904))

(declare-fun newMap!16 () LongMapFixedSize!716)

(declare-fun mapValue!3252 () ValueCell!904)

(declare-fun mapKey!3252 () (_ BitVec 32))

(assert (=> mapNonEmpty!3251 (= (arr!1880 (_values!2244 newMap!16)) (store mapRest!3251 mapKey!3252 mapValue!3252))))

(declare-fun b!77071 () Bool)

(declare-datatypes ((Unit!2230 0))(
  ( (Unit!2231) )
))
(declare-fun e!50327 () Unit!2230)

(declare-fun Unit!2232 () Unit!2230)

(assert (=> b!77071 (= e!50327 Unit!2232)))

(declare-fun lt!35260 () Unit!2230)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!56 (array!3941 array!3943 (_ BitVec 32) (_ BitVec 32) V!2973 V!2973 (_ BitVec 64) (_ BitVec 32) Int) Unit!2230)

(assert (=> b!77071 (= lt!35260 (lemmaListMapContainsThenArrayContainsFrom!56 (_keys!3921 (v!2574 (underlying!270 thiss!992))) (_values!2244 (v!2574 (underlying!270 thiss!992))) (mask!6250 (v!2574 (underlying!270 thiss!992))) (extraKeys!2112 (v!2574 (underlying!270 thiss!992))) (zeroValue!2159 (v!2574 (underlying!270 thiss!992))) (minValue!2159 (v!2574 (underlying!270 thiss!992))) (select (arr!1879 (_keys!3921 (v!2574 (underlying!270 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2261 (v!2574 (underlying!270 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!77071 (arrayContainsKey!0 (_keys!3921 (v!2574 (underlying!270 thiss!992))) (select (arr!1879 (_keys!3921 (v!2574 (underlying!270 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!35262 () Unit!2230)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3941 (_ BitVec 32) (_ BitVec 32)) Unit!2230)

(assert (=> b!77071 (= lt!35262 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3921 (v!2574 (underlying!270 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1495 0))(
  ( (Nil!1492) (Cons!1491 (h!2079 (_ BitVec 64)) (t!5109 List!1495)) )
))
(declare-fun arrayNoDuplicates!0 (array!3941 (_ BitVec 32) List!1495) Bool)

(assert (=> b!77071 (arrayNoDuplicates!0 (_keys!3921 (v!2574 (underlying!270 thiss!992))) from!355 Nil!1492)))

(declare-fun lt!35258 () Unit!2230)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3941 (_ BitVec 32) (_ BitVec 64) List!1495) Unit!2230)

(assert (=> b!77071 (= lt!35258 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3921 (v!2574 (underlying!270 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1879 (_keys!3921 (v!2574 (underlying!270 thiss!992)))) from!355) (Cons!1491 (select (arr!1879 (_keys!3921 (v!2574 (underlying!270 thiss!992)))) from!355) Nil!1492)))))

(assert (=> b!77071 false))

(declare-fun mapIsEmpty!3251 () Bool)

(declare-fun mapRes!3251 () Bool)

(assert (=> mapIsEmpty!3251 mapRes!3251))

(declare-fun b!77072 () Bool)

(declare-fun res!40522 () Bool)

(declare-fun e!50339 () Bool)

(assert (=> b!77072 (=> res!40522 e!50339)))

(assert (=> b!77072 (= res!40522 (or (not (= (size!2121 (_values!2244 (v!2574 (underlying!270 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6250 (v!2574 (underlying!270 thiss!992)))))) (not (= (size!2120 (_keys!3921 (v!2574 (underlying!270 thiss!992)))) (size!2121 (_values!2244 (v!2574 (underlying!270 thiss!992)))))) (bvslt (mask!6250 (v!2574 (underlying!270 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2112 (v!2574 (underlying!270 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2112 (v!2574 (underlying!270 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!77073 () Bool)

(declare-fun e!50338 () Bool)

(assert (=> b!77073 (= e!50340 e!50338)))

(declare-fun res!40526 () Bool)

(assert (=> b!77073 (=> (not res!40526) (not e!50338))))

(declare-datatypes ((tuple2!2152 0))(
  ( (tuple2!2153 (_1!1087 (_ BitVec 64)) (_2!1087 V!2973)) )
))
(declare-datatypes ((List!1496 0))(
  ( (Nil!1493) (Cons!1492 (h!2080 tuple2!2152) (t!5110 List!1496)) )
))
(declare-datatypes ((ListLongMap!1435 0))(
  ( (ListLongMap!1436 (toList!733 List!1496)) )
))
(declare-fun lt!35256 () ListLongMap!1435)

(declare-fun lt!35254 () ListLongMap!1435)

(assert (=> b!77073 (= res!40526 (= lt!35256 lt!35254))))

(declare-fun map!1163 (LongMapFixedSize!716) ListLongMap!1435)

(assert (=> b!77073 (= lt!35254 (map!1163 newMap!16))))

(declare-fun getCurrentListMap!428 (array!3941 array!3943 (_ BitVec 32) (_ BitVec 32) V!2973 V!2973 (_ BitVec 32) Int) ListLongMap!1435)

(assert (=> b!77073 (= lt!35256 (getCurrentListMap!428 (_keys!3921 (v!2574 (underlying!270 thiss!992))) (_values!2244 (v!2574 (underlying!270 thiss!992))) (mask!6250 (v!2574 (underlying!270 thiss!992))) (extraKeys!2112 (v!2574 (underlying!270 thiss!992))) (zeroValue!2159 (v!2574 (underlying!270 thiss!992))) (minValue!2159 (v!2574 (underlying!270 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2261 (v!2574 (underlying!270 thiss!992)))))))

(declare-fun b!77074 () Bool)

(declare-fun e!50326 () Bool)

(declare-fun tp_is_empty!2495 () Bool)

(assert (=> b!77074 (= e!50326 tp_is_empty!2495)))

(declare-fun b!77075 () Bool)

(declare-fun e!50334 () Bool)

(assert (=> b!77075 (= e!50335 e!50334)))

(declare-fun b!77076 () Bool)

(declare-fun e!50329 () Bool)

(assert (=> b!77076 (= e!50329 tp_is_empty!2495)))

(declare-fun b!77077 () Bool)

(declare-fun res!40519 () Bool)

(assert (=> b!77077 (=> (not res!40519) (not e!50340))))

(assert (=> b!77077 (= res!40519 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2120 (_keys!3921 (v!2574 (underlying!270 thiss!992)))))))))

(declare-fun b!77078 () Bool)

(declare-fun e!50341 () Bool)

(assert (=> b!77078 (= e!50334 e!50341)))

(declare-fun b!77079 () Bool)

(declare-fun e!50343 () Bool)

(assert (=> b!77079 (= e!50343 (and e!50329 mapRes!3252))))

(declare-fun condMapEmpty!3251 () Bool)

(declare-fun mapDefault!3251 () ValueCell!904)

