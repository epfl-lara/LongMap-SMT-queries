; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13062 () Bool)

(assert start!13062)

(declare-fun b!113888 () Bool)

(declare-fun b_free!2601 () Bool)

(declare-fun b_next!2601 () Bool)

(assert (=> b!113888 (= b_free!2601 (not b_next!2601))))

(declare-fun tp!10163 () Bool)

(declare-fun b_and!6995 () Bool)

(assert (=> b!113888 (= tp!10163 b_and!6995)))

(declare-fun b!113903 () Bool)

(declare-fun b_free!2603 () Bool)

(declare-fun b_next!2603 () Bool)

(assert (=> b!113903 (= b_free!2603 (not b_next!2603))))

(declare-fun tp!10161 () Bool)

(declare-fun b_and!6997 () Bool)

(assert (=> b!113903 (= tp!10161 b_and!6997)))

(declare-fun b!113884 () Bool)

(declare-fun e!74022 () Bool)

(declare-fun e!74025 () Bool)

(assert (=> b!113884 (= e!74022 (not e!74025))))

(declare-fun res!56116 () Bool)

(assert (=> b!113884 (=> res!56116 e!74025)))

(declare-datatypes ((V!3269 0))(
  ( (V!3270 (val!1403 Int)) )
))
(declare-datatypes ((array!4435 0))(
  ( (array!4436 (arr!2101 (Array (_ BitVec 32) (_ BitVec 64))) (size!2361 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1015 0))(
  ( (ValueCellFull!1015 (v!2973 V!3269)) (EmptyCell!1015) )
))
(declare-datatypes ((array!4437 0))(
  ( (array!4438 (arr!2102 (Array (_ BitVec 32) ValueCell!1015)) (size!2362 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!938 0))(
  ( (LongMapFixedSize!939 (defaultEntry!2675 Int) (mask!6865 (_ BitVec 32)) (extraKeys!2464 (_ BitVec 32)) (zeroValue!2542 V!3269) (minValue!2542 V!3269) (_size!518 (_ BitVec 32)) (_keys!4397 array!4435) (_values!2658 array!4437) (_vacant!518 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!738 0))(
  ( (Cell!739 (v!2974 LongMapFixedSize!938)) )
))
(declare-datatypes ((LongMap!738 0))(
  ( (LongMap!739 (underlying!380 Cell!738)) )
))
(declare-fun thiss!992 () LongMap!738)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!113884 (= res!56116 (not (validMask!0 (mask!6865 (v!2974 (underlying!380 thiss!992))))))))

(declare-datatypes ((tuple2!2464 0))(
  ( (tuple2!2465 (_1!1243 (_ BitVec 64)) (_2!1243 V!3269)) )
))
(declare-datatypes ((List!1645 0))(
  ( (Nil!1642) (Cons!1641 (h!2241 tuple2!2464) (t!5839 List!1645)) )
))
(declare-datatypes ((ListLongMap!1605 0))(
  ( (ListLongMap!1606 (toList!818 List!1645)) )
))
(declare-fun lt!59153 () ListLongMap!1605)

(declare-fun lt!59154 () tuple2!2464)

(declare-fun lt!59156 () tuple2!2464)

(declare-fun +!156 (ListLongMap!1605 tuple2!2464) ListLongMap!1605)

(assert (=> b!113884 (= (+!156 (+!156 lt!59153 lt!59154) lt!59156) (+!156 (+!156 lt!59153 lt!59156) lt!59154))))

(assert (=> b!113884 (= lt!59156 (tuple2!2465 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2542 (v!2974 (underlying!380 thiss!992)))))))

(declare-fun lt!59159 () V!3269)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!113884 (= lt!59154 (tuple2!2465 (select (arr!2101 (_keys!4397 (v!2974 (underlying!380 thiss!992)))) from!355) lt!59159))))

(declare-datatypes ((Unit!3557 0))(
  ( (Unit!3558) )
))
(declare-fun lt!59158 () Unit!3557)

(declare-fun addCommutativeForDiffKeys!68 (ListLongMap!1605 (_ BitVec 64) V!3269 (_ BitVec 64) V!3269) Unit!3557)

(assert (=> b!113884 (= lt!59158 (addCommutativeForDiffKeys!68 lt!59153 (select (arr!2101 (_keys!4397 (v!2974 (underlying!380 thiss!992)))) from!355) lt!59159 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2542 (v!2974 (underlying!380 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!122 (array!4435 array!4437 (_ BitVec 32) (_ BitVec 32) V!3269 V!3269 (_ BitVec 32) Int) ListLongMap!1605)

(assert (=> b!113884 (= lt!59153 (getCurrentListMapNoExtraKeys!122 (_keys!4397 (v!2974 (underlying!380 thiss!992))) (_values!2658 (v!2974 (underlying!380 thiss!992))) (mask!6865 (v!2974 (underlying!380 thiss!992))) (extraKeys!2464 (v!2974 (underlying!380 thiss!992))) (zeroValue!2542 (v!2974 (underlying!380 thiss!992))) (minValue!2542 (v!2974 (underlying!380 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2675 (v!2974 (underlying!380 thiss!992)))))))

(declare-fun b!113885 () Bool)

(declare-fun res!56115 () Bool)

(assert (=> b!113885 (=> res!56115 e!74025)))

(assert (=> b!113885 (= res!56115 (or (not (= (size!2362 (_values!2658 (v!2974 (underlying!380 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6865 (v!2974 (underlying!380 thiss!992)))))) (not (= (size!2361 (_keys!4397 (v!2974 (underlying!380 thiss!992)))) (size!2362 (_values!2658 (v!2974 (underlying!380 thiss!992)))))) (bvslt (mask!6865 (v!2974 (underlying!380 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2464 (v!2974 (underlying!380 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2464 (v!2974 (underlying!380 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!113886 () Bool)

(declare-fun res!56109 () Bool)

(assert (=> b!113886 (=> res!56109 e!74025)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4435 (_ BitVec 32)) Bool)

(assert (=> b!113886 (= res!56109 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4397 (v!2974 (underlying!380 thiss!992))) (mask!6865 (v!2974 (underlying!380 thiss!992))))))))

(declare-fun mapNonEmpty!4079 () Bool)

(declare-fun mapRes!4080 () Bool)

(declare-fun tp!10164 () Bool)

(declare-fun e!74019 () Bool)

(assert (=> mapNonEmpty!4079 (= mapRes!4080 (and tp!10164 e!74019))))

(declare-fun mapValue!4080 () ValueCell!1015)

(declare-fun mapRest!4080 () (Array (_ BitVec 32) ValueCell!1015))

(declare-fun newMap!16 () LongMapFixedSize!938)

(declare-fun mapKey!4079 () (_ BitVec 32))

(assert (=> mapNonEmpty!4079 (= (arr!2102 (_values!2658 newMap!16)) (store mapRest!4080 mapKey!4079 mapValue!4080))))

(declare-fun b!113887 () Bool)

(declare-fun e!74021 () Bool)

(declare-fun e!74015 () Bool)

(declare-fun mapRes!4079 () Bool)

(assert (=> b!113887 (= e!74021 (and e!74015 mapRes!4079))))

(declare-fun condMapEmpty!4079 () Bool)

(declare-fun mapDefault!4079 () ValueCell!1015)

