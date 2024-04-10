; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11264 () Bool)

(assert start!11264)

(declare-fun b!92795 () Bool)

(declare-fun b_free!2353 () Bool)

(declare-fun b_next!2353 () Bool)

(assert (=> b!92795 (= b_free!2353 (not b_next!2353))))

(declare-fun tp!9320 () Bool)

(declare-fun b_and!5635 () Bool)

(assert (=> b!92795 (= tp!9320 b_and!5635)))

(declare-fun b!92793 () Bool)

(declare-fun b_free!2355 () Bool)

(declare-fun b_next!2355 () Bool)

(assert (=> b!92793 (= b_free!2355 (not b_next!2355))))

(declare-fun tp!9319 () Bool)

(declare-fun b_and!5637 () Bool)

(assert (=> b!92793 (= tp!9319 b_and!5637)))

(declare-fun b!92783 () Bool)

(declare-fun res!47162 () Bool)

(declare-fun e!60518 () Bool)

(assert (=> b!92783 (=> (not res!47162) (not e!60518))))

(declare-datatypes ((V!3105 0))(
  ( (V!3106 (val!1341 Int)) )
))
(declare-datatypes ((array!4157 0))(
  ( (array!4158 (arr!1977 (Array (_ BitVec 32) (_ BitVec 64))) (size!2225 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!953 0))(
  ( (ValueCellFull!953 (v!2737 V!3105)) (EmptyCell!953) )
))
(declare-datatypes ((array!4159 0))(
  ( (array!4160 (arr!1978 (Array (_ BitVec 32) ValueCell!953)) (size!2226 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!814 0))(
  ( (LongMapFixedSize!815 (defaultEntry!2421 Int) (mask!6489 (_ BitVec 32)) (extraKeys!2250 (_ BitVec 32)) (zeroValue!2308 V!3105) (minValue!2308 V!3105) (_size!456 (_ BitVec 32)) (_keys!4103 array!4157) (_values!2404 array!4159) (_vacant!456 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!814)

(declare-datatypes ((Cell!614 0))(
  ( (Cell!615 (v!2738 LongMapFixedSize!814)) )
))
(declare-datatypes ((LongMap!614 0))(
  ( (LongMap!615 (underlying!318 Cell!614)) )
))
(declare-fun thiss!992 () LongMap!614)

(assert (=> b!92783 (= res!47162 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6489 newMap!16)) (_size!456 (v!2738 (underlying!318 thiss!992)))))))

(declare-fun b!92784 () Bool)

(declare-fun e!60507 () Bool)

(declare-fun e!60516 () Bool)

(assert (=> b!92784 (= e!60507 (not e!60516))))

(declare-fun res!47157 () Bool)

(assert (=> b!92784 (=> res!47157 e!60516)))

(declare-datatypes ((tuple2!2282 0))(
  ( (tuple2!2283 (_1!1152 Bool) (_2!1152 LongMapFixedSize!814)) )
))
(declare-fun lt!45655 () tuple2!2282)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2284 0))(
  ( (tuple2!2285 (_1!1153 (_ BitVec 64)) (_2!1153 V!3105)) )
))
(declare-datatypes ((List!1558 0))(
  ( (Nil!1555) (Cons!1554 (h!2146 tuple2!2284) (t!5420 List!1558)) )
))
(declare-datatypes ((ListLongMap!1507 0))(
  ( (ListLongMap!1508 (toList!769 List!1558)) )
))
(declare-fun getCurrentListMap!461 (array!4157 array!4159 (_ BitVec 32) (_ BitVec 32) V!3105 V!3105 (_ BitVec 32) Int) ListLongMap!1507)

(declare-fun map!1230 (LongMapFixedSize!814) ListLongMap!1507)

(assert (=> b!92784 (= res!47157 (not (= (getCurrentListMap!461 (_keys!4103 (v!2738 (underlying!318 thiss!992))) (_values!2404 (v!2738 (underlying!318 thiss!992))) (mask!6489 (v!2738 (underlying!318 thiss!992))) (extraKeys!2250 (v!2738 (underlying!318 thiss!992))) (zeroValue!2308 (v!2738 (underlying!318 thiss!992))) (minValue!2308 (v!2738 (underlying!318 thiss!992))) from!355 (defaultEntry!2421 (v!2738 (underlying!318 thiss!992)))) (map!1230 (_2!1152 lt!45655)))))))

(declare-fun lt!45669 () tuple2!2284)

(declare-fun lt!45671 () ListLongMap!1507)

(declare-fun lt!45653 () tuple2!2284)

(declare-fun lt!45657 () ListLongMap!1507)

(declare-fun +!129 (ListLongMap!1507 tuple2!2284) ListLongMap!1507)

(assert (=> b!92784 (= (+!129 lt!45657 lt!45669) (+!129 (+!129 lt!45671 lt!45669) lt!45653))))

(assert (=> b!92784 (= lt!45669 (tuple2!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2308 (v!2738 (underlying!318 thiss!992)))))))

(declare-datatypes ((Unit!2767 0))(
  ( (Unit!2768) )
))
(declare-fun lt!45660 () Unit!2767)

(declare-fun lt!45670 () V!3105)

(declare-fun addCommutativeForDiffKeys!48 (ListLongMap!1507 (_ BitVec 64) V!3105 (_ BitVec 64) V!3105) Unit!2767)

(assert (=> b!92784 (= lt!45660 (addCommutativeForDiffKeys!48 lt!45671 (select (arr!1977 (_keys!4103 (v!2738 (underlying!318 thiss!992)))) from!355) lt!45670 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2308 (v!2738 (underlying!318 thiss!992)))))))

(declare-fun lt!45661 () ListLongMap!1507)

(assert (=> b!92784 (= lt!45661 lt!45657)))

(assert (=> b!92784 (= lt!45657 (+!129 lt!45671 lt!45653))))

(declare-fun lt!45662 () ListLongMap!1507)

(declare-fun lt!45654 () tuple2!2284)

(assert (=> b!92784 (= lt!45661 (+!129 lt!45662 lt!45654))))

(declare-fun lt!45659 () ListLongMap!1507)

(assert (=> b!92784 (= lt!45671 (+!129 lt!45659 lt!45654))))

(assert (=> b!92784 (= lt!45654 (tuple2!2285 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2308 (v!2738 (underlying!318 thiss!992)))))))

(assert (=> b!92784 (= lt!45662 (+!129 lt!45659 lt!45653))))

(assert (=> b!92784 (= lt!45653 (tuple2!2285 (select (arr!1977 (_keys!4103 (v!2738 (underlying!318 thiss!992)))) from!355) lt!45670))))

(declare-fun lt!45658 () Unit!2767)

(assert (=> b!92784 (= lt!45658 (addCommutativeForDiffKeys!48 lt!45659 (select (arr!1977 (_keys!4103 (v!2738 (underlying!318 thiss!992)))) from!355) lt!45670 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2308 (v!2738 (underlying!318 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!94 (array!4157 array!4159 (_ BitVec 32) (_ BitVec 32) V!3105 V!3105 (_ BitVec 32) Int) ListLongMap!1507)

(assert (=> b!92784 (= lt!45659 (getCurrentListMapNoExtraKeys!94 (_keys!4103 (v!2738 (underlying!318 thiss!992))) (_values!2404 (v!2738 (underlying!318 thiss!992))) (mask!6489 (v!2738 (underlying!318 thiss!992))) (extraKeys!2250 (v!2738 (underlying!318 thiss!992))) (zeroValue!2308 (v!2738 (underlying!318 thiss!992))) (minValue!2308 (v!2738 (underlying!318 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2421 (v!2738 (underlying!318 thiss!992)))))))

(declare-fun b!92785 () Bool)

(declare-fun e!60517 () Bool)

(declare-fun e!60523 () Bool)

(assert (=> b!92785 (= e!60517 e!60523)))

(declare-fun b!92786 () Bool)

(declare-fun e!60522 () Bool)

(declare-fun e!60510 () Bool)

(declare-fun mapRes!3607 () Bool)

(assert (=> b!92786 (= e!60522 (and e!60510 mapRes!3607))))

(declare-fun condMapEmpty!3608 () Bool)

(declare-fun mapDefault!3607 () ValueCell!953)

