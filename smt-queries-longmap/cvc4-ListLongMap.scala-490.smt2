; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11058 () Bool)

(assert start!11058)

(declare-fun b!89994 () Bool)

(declare-fun b_free!2277 () Bool)

(declare-fun b_next!2277 () Bool)

(assert (=> b!89994 (= b_free!2277 (not b_next!2277))))

(declare-fun tp!9077 () Bool)

(declare-fun b_and!5407 () Bool)

(assert (=> b!89994 (= tp!9077 b_and!5407)))

(declare-fun b!89992 () Bool)

(declare-fun b_free!2279 () Bool)

(declare-fun b_next!2279 () Bool)

(assert (=> b!89992 (= b_free!2279 (not b_next!2279))))

(declare-fun tp!9078 () Bool)

(declare-fun b_and!5409 () Bool)

(assert (=> b!89992 (= tp!9078 b_and!5409)))

(declare-fun b!89987 () Bool)

(declare-fun res!45979 () Bool)

(declare-fun e!58577 () Bool)

(assert (=> b!89987 (=> (not res!45979) (not e!58577))))

(declare-datatypes ((V!3053 0))(
  ( (V!3054 (val!1322 Int)) )
))
(declare-datatypes ((array!4075 0))(
  ( (array!4076 (arr!1939 (Array (_ BitVec 32) (_ BitVec 64))) (size!2186 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!934 0))(
  ( (ValueCellFull!934 (v!2688 V!3053)) (EmptyCell!934) )
))
(declare-datatypes ((array!4077 0))(
  ( (array!4078 (arr!1940 (Array (_ BitVec 32) ValueCell!934)) (size!2187 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!776 0))(
  ( (LongMapFixedSize!777 (defaultEntry!2386 Int) (mask!6436 (_ BitVec 32)) (extraKeys!2217 (_ BitVec 32)) (zeroValue!2274 V!3053) (minValue!2274 V!3053) (_size!437 (_ BitVec 32)) (_keys!4066 array!4075) (_values!2369 array!4077) (_vacant!437 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!776)

(declare-fun valid!335 (LongMapFixedSize!776) Bool)

(assert (=> b!89987 (= res!45979 (valid!335 newMap!16))))

(declare-fun b!89988 () Bool)

(declare-fun res!45978 () Bool)

(assert (=> b!89988 (=> (not res!45978) (not e!58577))))

(declare-datatypes ((Cell!576 0))(
  ( (Cell!577 (v!2689 LongMapFixedSize!776)) )
))
(declare-datatypes ((LongMap!576 0))(
  ( (LongMap!577 (underlying!299 Cell!576)) )
))
(declare-fun thiss!992 () LongMap!576)

(assert (=> b!89988 (= res!45978 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6436 newMap!16)) (_size!437 (v!2689 (underlying!299 thiss!992)))))))

(declare-fun b!89989 () Bool)

(declare-fun e!58585 () Bool)

(declare-fun tp_is_empty!2555 () Bool)

(assert (=> b!89989 (= e!58585 tp_is_empty!2555)))

(declare-fun b!89991 () Bool)

(declare-fun e!58583 () Bool)

(declare-fun e!58586 () Bool)

(assert (=> b!89991 (= e!58583 (not e!58586))))

(declare-fun res!45984 () Bool)

(assert (=> b!89991 (=> res!45984 e!58586)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!89991 (= res!45984 (not (validMask!0 (mask!6436 (v!2689 (underlying!299 thiss!992))))))))

(declare-datatypes ((tuple2!2220 0))(
  ( (tuple2!2221 (_1!1121 (_ BitVec 64)) (_2!1121 V!3053)) )
))
(declare-datatypes ((List!1532 0))(
  ( (Nil!1529) (Cons!1528 (h!2120 tuple2!2220) (t!5310 List!1532)) )
))
(declare-datatypes ((ListLongMap!1475 0))(
  ( (ListLongMap!1476 (toList!753 List!1532)) )
))
(declare-fun lt!43391 () ListLongMap!1475)

(declare-fun lt!43396 () tuple2!2220)

(declare-fun lt!43400 () ListLongMap!1475)

(declare-fun lt!43393 () tuple2!2220)

(declare-fun +!116 (ListLongMap!1475 tuple2!2220) ListLongMap!1475)

(assert (=> b!89991 (= (+!116 lt!43400 lt!43396) (+!116 (+!116 lt!43391 lt!43396) lt!43393))))

(assert (=> b!89991 (= lt!43396 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2274 (v!2689 (underlying!299 thiss!992)))))))

(declare-datatypes ((Unit!2674 0))(
  ( (Unit!2675) )
))
(declare-fun lt!43386 () Unit!2674)

(declare-fun lt!43390 () V!3053)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!35 (ListLongMap!1475 (_ BitVec 64) V!3053 (_ BitVec 64) V!3053) Unit!2674)

(assert (=> b!89991 (= lt!43386 (addCommutativeForDiffKeys!35 lt!43391 (select (arr!1939 (_keys!4066 (v!2689 (underlying!299 thiss!992)))) from!355) lt!43390 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2274 (v!2689 (underlying!299 thiss!992)))))))

(declare-fun lt!43383 () ListLongMap!1475)

(assert (=> b!89991 (= lt!43383 lt!43400)))

(assert (=> b!89991 (= lt!43400 (+!116 lt!43391 lt!43393))))

(declare-fun lt!43388 () ListLongMap!1475)

(declare-fun lt!43399 () tuple2!2220)

(assert (=> b!89991 (= lt!43383 (+!116 lt!43388 lt!43399))))

(declare-fun lt!43398 () ListLongMap!1475)

(assert (=> b!89991 (= lt!43391 (+!116 lt!43398 lt!43399))))

(assert (=> b!89991 (= lt!43399 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2274 (v!2689 (underlying!299 thiss!992)))))))

(assert (=> b!89991 (= lt!43388 (+!116 lt!43398 lt!43393))))

(assert (=> b!89991 (= lt!43393 (tuple2!2221 (select (arr!1939 (_keys!4066 (v!2689 (underlying!299 thiss!992)))) from!355) lt!43390))))

(declare-fun lt!43395 () Unit!2674)

(assert (=> b!89991 (= lt!43395 (addCommutativeForDiffKeys!35 lt!43398 (select (arr!1939 (_keys!4066 (v!2689 (underlying!299 thiss!992)))) from!355) lt!43390 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2274 (v!2689 (underlying!299 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!81 (array!4075 array!4077 (_ BitVec 32) (_ BitVec 32) V!3053 V!3053 (_ BitVec 32) Int) ListLongMap!1475)

(assert (=> b!89991 (= lt!43398 (getCurrentListMapNoExtraKeys!81 (_keys!4066 (v!2689 (underlying!299 thiss!992))) (_values!2369 (v!2689 (underlying!299 thiss!992))) (mask!6436 (v!2689 (underlying!299 thiss!992))) (extraKeys!2217 (v!2689 (underlying!299 thiss!992))) (zeroValue!2274 (v!2689 (underlying!299 thiss!992))) (minValue!2274 (v!2689 (underlying!299 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2386 (v!2689 (underlying!299 thiss!992)))))))

(declare-fun e!58587 () Bool)

(declare-fun e!58578 () Bool)

(declare-fun array_inv!1201 (array!4075) Bool)

(declare-fun array_inv!1202 (array!4077) Bool)

(assert (=> b!89992 (= e!58587 (and tp!9078 tp_is_empty!2555 (array_inv!1201 (_keys!4066 newMap!16)) (array_inv!1202 (_values!2369 newMap!16)) e!58578))))

(declare-fun b!89993 () Bool)

(assert (=> b!89993 (= e!58586 (bvsle from!355 (size!2186 (_keys!4066 (v!2689 (underlying!299 thiss!992))))))))

(declare-fun mapNonEmpty!3479 () Bool)

(declare-fun mapRes!3479 () Bool)

(declare-fun tp!9076 () Bool)

(assert (=> mapNonEmpty!3479 (= mapRes!3479 (and tp!9076 e!58585))))

(declare-fun mapValue!3479 () ValueCell!934)

(declare-fun mapRest!3480 () (Array (_ BitVec 32) ValueCell!934))

(declare-fun mapKey!3480 () (_ BitVec 32))

(assert (=> mapNonEmpty!3479 (= (arr!1940 (_values!2369 newMap!16)) (store mapRest!3480 mapKey!3480 mapValue!3479))))

(declare-fun e!58580 () Bool)

(declare-fun e!58588 () Bool)

(assert (=> b!89994 (= e!58588 (and tp!9077 tp_is_empty!2555 (array_inv!1201 (_keys!4066 (v!2689 (underlying!299 thiss!992)))) (array_inv!1202 (_values!2369 (v!2689 (underlying!299 thiss!992)))) e!58580))))

(declare-fun b!89995 () Bool)

(declare-fun e!58592 () Bool)

(assert (=> b!89995 (= e!58577 e!58592)))

(declare-fun res!45975 () Bool)

(assert (=> b!89995 (=> (not res!45975) (not e!58592))))

(declare-fun lt!43387 () ListLongMap!1475)

(declare-fun lt!43384 () ListLongMap!1475)

(assert (=> b!89995 (= res!45975 (= lt!43387 lt!43384))))

(declare-fun map!1201 (LongMapFixedSize!776) ListLongMap!1475)

(assert (=> b!89995 (= lt!43384 (map!1201 newMap!16))))

(declare-fun getCurrentListMap!446 (array!4075 array!4077 (_ BitVec 32) (_ BitVec 32) V!3053 V!3053 (_ BitVec 32) Int) ListLongMap!1475)

(assert (=> b!89995 (= lt!43387 (getCurrentListMap!446 (_keys!4066 (v!2689 (underlying!299 thiss!992))) (_values!2369 (v!2689 (underlying!299 thiss!992))) (mask!6436 (v!2689 (underlying!299 thiss!992))) (extraKeys!2217 (v!2689 (underlying!299 thiss!992))) (zeroValue!2274 (v!2689 (underlying!299 thiss!992))) (minValue!2274 (v!2689 (underlying!299 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2386 (v!2689 (underlying!299 thiss!992)))))))

(declare-fun b!89996 () Bool)

(declare-fun res!45976 () Bool)

(assert (=> b!89996 (=> res!45976 e!58586)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4075 (_ BitVec 32)) Bool)

(assert (=> b!89996 (= res!45976 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4066 (v!2689 (underlying!299 thiss!992))) (mask!6436 (v!2689 (underlying!299 thiss!992))))))))

(declare-fun b!89997 () Bool)

(declare-fun e!58579 () Bool)

(assert (=> b!89997 (= e!58592 e!58579)))

(declare-fun res!45981 () Bool)

(assert (=> b!89997 (=> (not res!45981) (not e!58579))))

(assert (=> b!89997 (= res!45981 (and (not (= (select (arr!1939 (_keys!4066 (v!2689 (underlying!299 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1939 (_keys!4066 (v!2689 (underlying!299 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1215 (ValueCell!934 V!3053) V!3053)

(declare-fun dynLambda!346 (Int (_ BitVec 64)) V!3053)

(assert (=> b!89997 (= lt!43390 (get!1215 (select (arr!1940 (_values!2369 (v!2689 (underlying!299 thiss!992)))) from!355) (dynLambda!346 (defaultEntry!2386 (v!2689 (underlying!299 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!3479 () Bool)

(assert (=> mapIsEmpty!3479 mapRes!3479))

(declare-fun b!89998 () Bool)

(declare-fun e!58582 () Bool)

(assert (=> b!89998 (= e!58582 tp_is_empty!2555)))

(declare-fun b!89999 () Bool)

(declare-fun res!45982 () Bool)

(assert (=> b!89999 (=> (not res!45982) (not e!58577))))

(assert (=> b!89999 (= res!45982 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2186 (_keys!4066 (v!2689 (underlying!299 thiss!992)))))))))

(declare-fun mapIsEmpty!3480 () Bool)

(declare-fun mapRes!3480 () Bool)

(assert (=> mapIsEmpty!3480 mapRes!3480))

(declare-fun res!45980 () Bool)

(assert (=> start!11058 (=> (not res!45980) (not e!58577))))

(declare-fun valid!336 (LongMap!576) Bool)

(assert (=> start!11058 (= res!45980 (valid!336 thiss!992))))

(assert (=> start!11058 e!58577))

(declare-fun e!58584 () Bool)

(assert (=> start!11058 e!58584))

(assert (=> start!11058 true))

(assert (=> start!11058 e!58587))

(declare-fun b!89990 () Bool)

(declare-fun res!45977 () Bool)

(assert (=> b!89990 (=> res!45977 e!58586)))

(declare-datatypes ((List!1533 0))(
  ( (Nil!1530) (Cons!1529 (h!2121 (_ BitVec 64)) (t!5311 List!1533)) )
))
(declare-fun arrayNoDuplicates!0 (array!4075 (_ BitVec 32) List!1533) Bool)

(assert (=> b!89990 (= res!45977 (not (arrayNoDuplicates!0 (_keys!4066 (v!2689 (underlying!299 thiss!992))) #b00000000000000000000000000000000 Nil!1530)))))

(declare-fun b!90000 () Bool)

(declare-fun res!45974 () Bool)

(assert (=> b!90000 (=> res!45974 e!58586)))

(assert (=> b!90000 (= res!45974 (or (not (= (size!2187 (_values!2369 (v!2689 (underlying!299 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6436 (v!2689 (underlying!299 thiss!992)))))) (not (= (size!2186 (_keys!4066 (v!2689 (underlying!299 thiss!992)))) (size!2187 (_values!2369 (v!2689 (underlying!299 thiss!992)))))) (bvslt (mask!6436 (v!2689 (underlying!299 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2217 (v!2689 (underlying!299 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2217 (v!2689 (underlying!299 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!90001 () Bool)

(assert (=> b!90001 (= e!58578 (and e!58582 mapRes!3479))))

(declare-fun condMapEmpty!3480 () Bool)

(declare-fun mapDefault!3480 () ValueCell!934)

