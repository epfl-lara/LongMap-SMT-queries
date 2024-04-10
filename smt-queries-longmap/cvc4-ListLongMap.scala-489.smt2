; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10950 () Bool)

(assert start!10950)

(declare-fun b!88892 () Bool)

(declare-fun b_free!2265 () Bool)

(declare-fun b_next!2265 () Bool)

(assert (=> b!88892 (= b_free!2265 (not b_next!2265))))

(declare-fun tp!9033 () Bool)

(declare-fun b_and!5351 () Bool)

(assert (=> b!88892 (= tp!9033 b_and!5351)))

(declare-fun b!88906 () Bool)

(declare-fun b_free!2267 () Bool)

(declare-fun b_next!2267 () Bool)

(assert (=> b!88906 (= b_free!2267 (not b_next!2267))))

(declare-fun tp!9034 () Bool)

(declare-fun b_and!5353 () Bool)

(assert (=> b!88906 (= tp!9034 b_and!5353)))

(declare-fun mapNonEmpty!3455 () Bool)

(declare-fun mapRes!3455 () Bool)

(declare-fun tp!9036 () Bool)

(declare-fun e!57899 () Bool)

(assert (=> mapNonEmpty!3455 (= mapRes!3455 (and tp!9036 e!57899))))

(declare-datatypes ((V!3045 0))(
  ( (V!3046 (val!1319 Int)) )
))
(declare-datatypes ((array!4061 0))(
  ( (array!4062 (arr!1933 (Array (_ BitVec 32) (_ BitVec 64))) (size!2179 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!931 0))(
  ( (ValueCellFull!931 (v!2675 V!3045)) (EmptyCell!931) )
))
(declare-datatypes ((array!4063 0))(
  ( (array!4064 (arr!1934 (Array (_ BitVec 32) ValueCell!931)) (size!2180 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!770 0))(
  ( (LongMapFixedSize!771 (defaultEntry!2373 Int) (mask!6417 (_ BitVec 32)) (extraKeys!2206 (_ BitVec 32)) (zeroValue!2262 V!3045) (minValue!2262 V!3045) (_size!434 (_ BitVec 32)) (_keys!4051 array!4061) (_values!2356 array!4063) (_vacant!434 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!570 0))(
  ( (Cell!571 (v!2676 LongMapFixedSize!770)) )
))
(declare-datatypes ((LongMap!570 0))(
  ( (LongMap!571 (underlying!296 Cell!570)) )
))
(declare-fun thiss!992 () LongMap!570)

(declare-fun mapKey!3456 () (_ BitVec 32))

(declare-fun mapRest!3456 () (Array (_ BitVec 32) ValueCell!931))

(declare-fun mapValue!3455 () ValueCell!931)

(assert (=> mapNonEmpty!3455 (= (arr!1934 (_values!2356 (v!2676 (underlying!296 thiss!992)))) (store mapRest!3456 mapKey!3456 mapValue!3455))))

(declare-fun b!88886 () Bool)

(declare-fun res!45493 () Bool)

(declare-fun e!57903 () Bool)

(assert (=> b!88886 (=> (not res!45493) (not e!57903))))

(declare-fun newMap!16 () LongMapFixedSize!770)

(assert (=> b!88886 (= res!45493 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6417 newMap!16)) (_size!434 (v!2676 (underlying!296 thiss!992)))))))

(declare-fun b!88887 () Bool)

(declare-fun e!57907 () Bool)

(declare-fun e!57895 () Bool)

(assert (=> b!88887 (= e!57907 (not e!57895))))

(declare-fun res!45497 () Bool)

(assert (=> b!88887 (=> res!45497 e!57895)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!88887 (= res!45497 (not (validMask!0 (mask!6417 (v!2676 (underlying!296 thiss!992))))))))

(declare-datatypes ((tuple2!2214 0))(
  ( (tuple2!2215 (_1!1118 (_ BitVec 64)) (_2!1118 V!3045)) )
))
(declare-fun lt!42592 () tuple2!2214)

(declare-fun lt!42588 () tuple2!2214)

(declare-datatypes ((List!1528 0))(
  ( (Nil!1525) (Cons!1524 (h!2116 tuple2!2214) (t!5290 List!1528)) )
))
(declare-datatypes ((ListLongMap!1471 0))(
  ( (ListLongMap!1472 (toList!751 List!1528)) )
))
(declare-fun lt!42593 () ListLongMap!1471)

(declare-fun lt!42586 () ListLongMap!1471)

(declare-fun +!114 (ListLongMap!1471 tuple2!2214) ListLongMap!1471)

(assert (=> b!88887 (= (+!114 lt!42586 lt!42592) (+!114 (+!114 lt!42593 lt!42592) lt!42588))))

(assert (=> b!88887 (= lt!42592 (tuple2!2215 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2262 (v!2676 (underlying!296 thiss!992)))))))

(declare-fun lt!42583 () V!3045)

(declare-datatypes ((Unit!2640 0))(
  ( (Unit!2641) )
))
(declare-fun lt!42591 () Unit!2640)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!33 (ListLongMap!1471 (_ BitVec 64) V!3045 (_ BitVec 64) V!3045) Unit!2640)

(assert (=> b!88887 (= lt!42591 (addCommutativeForDiffKeys!33 lt!42593 (select (arr!1933 (_keys!4051 (v!2676 (underlying!296 thiss!992)))) from!355) lt!42583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2262 (v!2676 (underlying!296 thiss!992)))))))

(declare-fun lt!42595 () ListLongMap!1471)

(assert (=> b!88887 (= lt!42595 lt!42586)))

(assert (=> b!88887 (= lt!42586 (+!114 lt!42593 lt!42588))))

(declare-fun lt!42584 () ListLongMap!1471)

(declare-fun lt!42585 () tuple2!2214)

(assert (=> b!88887 (= lt!42595 (+!114 lt!42584 lt!42585))))

(declare-fun lt!42597 () ListLongMap!1471)

(assert (=> b!88887 (= lt!42593 (+!114 lt!42597 lt!42585))))

(assert (=> b!88887 (= lt!42585 (tuple2!2215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2262 (v!2676 (underlying!296 thiss!992)))))))

(assert (=> b!88887 (= lt!42584 (+!114 lt!42597 lt!42588))))

(assert (=> b!88887 (= lt!42588 (tuple2!2215 (select (arr!1933 (_keys!4051 (v!2676 (underlying!296 thiss!992)))) from!355) lt!42583))))

(declare-fun lt!42598 () Unit!2640)

(assert (=> b!88887 (= lt!42598 (addCommutativeForDiffKeys!33 lt!42597 (select (arr!1933 (_keys!4051 (v!2676 (underlying!296 thiss!992)))) from!355) lt!42583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2262 (v!2676 (underlying!296 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!79 (array!4061 array!4063 (_ BitVec 32) (_ BitVec 32) V!3045 V!3045 (_ BitVec 32) Int) ListLongMap!1471)

(assert (=> b!88887 (= lt!42597 (getCurrentListMapNoExtraKeys!79 (_keys!4051 (v!2676 (underlying!296 thiss!992))) (_values!2356 (v!2676 (underlying!296 thiss!992))) (mask!6417 (v!2676 (underlying!296 thiss!992))) (extraKeys!2206 (v!2676 (underlying!296 thiss!992))) (zeroValue!2262 (v!2676 (underlying!296 thiss!992))) (minValue!2262 (v!2676 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2373 (v!2676 (underlying!296 thiss!992)))))))

(declare-fun b!88888 () Bool)

(declare-fun res!45491 () Bool)

(assert (=> b!88888 (=> (not res!45491) (not e!57903))))

(declare-fun valid!331 (LongMapFixedSize!770) Bool)

(assert (=> b!88888 (= res!45491 (valid!331 newMap!16))))

(declare-fun b!88889 () Bool)

(declare-fun e!57906 () Bool)

(assert (=> b!88889 (= e!57903 e!57906)))

(declare-fun res!45494 () Bool)

(assert (=> b!88889 (=> (not res!45494) (not e!57906))))

(declare-fun lt!42600 () ListLongMap!1471)

(declare-fun lt!42589 () ListLongMap!1471)

(assert (=> b!88889 (= res!45494 (= lt!42600 lt!42589))))

(declare-fun map!1197 (LongMapFixedSize!770) ListLongMap!1471)

(assert (=> b!88889 (= lt!42589 (map!1197 newMap!16))))

(declare-fun getCurrentListMap!444 (array!4061 array!4063 (_ BitVec 32) (_ BitVec 32) V!3045 V!3045 (_ BitVec 32) Int) ListLongMap!1471)

(assert (=> b!88889 (= lt!42600 (getCurrentListMap!444 (_keys!4051 (v!2676 (underlying!296 thiss!992))) (_values!2356 (v!2676 (underlying!296 thiss!992))) (mask!6417 (v!2676 (underlying!296 thiss!992))) (extraKeys!2206 (v!2676 (underlying!296 thiss!992))) (zeroValue!2262 (v!2676 (underlying!296 thiss!992))) (minValue!2262 (v!2676 (underlying!296 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2373 (v!2676 (underlying!296 thiss!992)))))))

(declare-fun b!88890 () Bool)

(declare-fun e!57909 () Bool)

(declare-fun e!57910 () Bool)

(assert (=> b!88890 (= e!57909 e!57910)))

(declare-fun b!88891 () Bool)

(declare-fun e!57905 () Bool)

(declare-fun tp_is_empty!2549 () Bool)

(assert (=> b!88891 (= e!57905 tp_is_empty!2549)))

(declare-fun mapIsEmpty!3455 () Bool)

(declare-fun mapRes!3456 () Bool)

(assert (=> mapIsEmpty!3455 mapRes!3456))

(declare-fun e!57896 () Bool)

(declare-fun e!57894 () Bool)

(declare-fun array_inv!1197 (array!4061) Bool)

(declare-fun array_inv!1198 (array!4063) Bool)

(assert (=> b!88892 (= e!57894 (and tp!9033 tp_is_empty!2549 (array_inv!1197 (_keys!4051 (v!2676 (underlying!296 thiss!992)))) (array_inv!1198 (_values!2356 (v!2676 (underlying!296 thiss!992)))) e!57896))))

(declare-fun b!88893 () Bool)

(declare-fun res!45492 () Bool)

(assert (=> b!88893 (=> res!45492 e!57895)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4061 (_ BitVec 32)) Bool)

(assert (=> b!88893 (= res!45492 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4051 (v!2676 (underlying!296 thiss!992))) (mask!6417 (v!2676 (underlying!296 thiss!992))))))))

(declare-fun b!88894 () Bool)

(declare-fun e!57901 () Bool)

(assert (=> b!88894 (= e!57901 tp_is_empty!2549)))

(declare-fun b!88895 () Bool)

(declare-datatypes ((List!1529 0))(
  ( (Nil!1526) (Cons!1525 (h!2117 (_ BitVec 64)) (t!5291 List!1529)) )
))
(declare-fun arrayNoDuplicates!0 (array!4061 (_ BitVec 32) List!1529) Bool)

(assert (=> b!88895 (= e!57895 (arrayNoDuplicates!0 (_keys!4051 (v!2676 (underlying!296 thiss!992))) #b00000000000000000000000000000000 Nil!1526))))

(declare-fun b!88896 () Bool)

(declare-fun res!45489 () Bool)

(assert (=> b!88896 (=> (not res!45489) (not e!57903))))

(assert (=> b!88896 (= res!45489 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2179 (_keys!4051 (v!2676 (underlying!296 thiss!992)))))))))

(declare-fun b!88897 () Bool)

(assert (=> b!88897 (= e!57896 (and e!57905 mapRes!3455))))

(declare-fun condMapEmpty!3455 () Bool)

(declare-fun mapDefault!3455 () ValueCell!931)

