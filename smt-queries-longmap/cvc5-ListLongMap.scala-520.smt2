; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13076 () Bool)

(assert start!13076)

(declare-fun b!114306 () Bool)

(declare-fun b_free!2629 () Bool)

(declare-fun b_next!2629 () Bool)

(assert (=> b!114306 (= b_free!2629 (not b_next!2629))))

(declare-fun tp!10247 () Bool)

(declare-fun b_and!7051 () Bool)

(assert (=> b!114306 (= tp!10247 b_and!7051)))

(declare-fun b!114304 () Bool)

(declare-fun b_free!2631 () Bool)

(declare-fun b_next!2631 () Bool)

(assert (=> b!114304 (= b_free!2631 (not b_next!2631))))

(declare-fun tp!10245 () Bool)

(declare-fun b_and!7053 () Bool)

(assert (=> b!114304 (= tp!10245 b_and!7053)))

(declare-fun b!114303 () Bool)

(declare-fun e!74377 () Bool)

(declare-fun e!74387 () Bool)

(assert (=> b!114303 (= e!74377 e!74387)))

(declare-fun res!56266 () Bool)

(assert (=> b!114303 (=> (not res!56266) (not e!74387))))

(declare-datatypes ((V!3289 0))(
  ( (V!3290 (val!1410 Int)) )
))
(declare-datatypes ((array!4463 0))(
  ( (array!4464 (arr!2115 (Array (_ BitVec 32) (_ BitVec 64))) (size!2375 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1022 0))(
  ( (ValueCellFull!1022 (v!2987 V!3289)) (EmptyCell!1022) )
))
(declare-datatypes ((array!4465 0))(
  ( (array!4466 (arr!2116 (Array (_ BitVec 32) ValueCell!1022)) (size!2376 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!952 0))(
  ( (LongMapFixedSize!953 (defaultEntry!2682 Int) (mask!6878 (_ BitVec 32)) (extraKeys!2471 (_ BitVec 32)) (zeroValue!2549 V!3289) (minValue!2549 V!3289) (_size!525 (_ BitVec 32)) (_keys!4404 array!4463) (_values!2665 array!4465) (_vacant!525 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!752 0))(
  ( (Cell!753 (v!2988 LongMapFixedSize!952)) )
))
(declare-datatypes ((LongMap!752 0))(
  ( (LongMap!753 (underlying!387 Cell!752)) )
))
(declare-fun thiss!992 () LongMap!752)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!114303 (= res!56266 (and (not (= (select (arr!2115 (_keys!4404 (v!2988 (underlying!387 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2115 (_keys!4404 (v!2988 (underlying!387 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!59486 () V!3289)

(declare-fun get!1376 (ValueCell!1022 V!3289) V!3289)

(declare-fun dynLambda!398 (Int (_ BitVec 64)) V!3289)

(assert (=> b!114303 (= lt!59486 (get!1376 (select (arr!2116 (_values!2665 (v!2988 (underlying!387 thiss!992)))) from!355) (dynLambda!398 (defaultEntry!2682 (v!2988 (underlying!387 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun tp_is_empty!2731 () Bool)

(declare-fun e!74381 () Bool)

(declare-fun e!74384 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!952)

(declare-fun array_inv!1331 (array!4463) Bool)

(declare-fun array_inv!1332 (array!4465) Bool)

(assert (=> b!114304 (= e!74384 (and tp!10245 tp_is_empty!2731 (array_inv!1331 (_keys!4404 newMap!16)) (array_inv!1332 (_values!2665 newMap!16)) e!74381))))

(declare-fun b!114305 () Bool)

(declare-fun e!74380 () Bool)

(assert (=> b!114305 (= e!74380 e!74377)))

(declare-fun res!56263 () Bool)

(assert (=> b!114305 (=> (not res!56263) (not e!74377))))

(declare-datatypes ((tuple2!2482 0))(
  ( (tuple2!2483 (_1!1252 (_ BitVec 64)) (_2!1252 V!3289)) )
))
(declare-datatypes ((List!1652 0))(
  ( (Nil!1649) (Cons!1648 (h!2248 tuple2!2482) (t!5874 List!1652)) )
))
(declare-datatypes ((ListLongMap!1615 0))(
  ( (ListLongMap!1616 (toList!823 List!1652)) )
))
(declare-fun lt!59490 () ListLongMap!1615)

(declare-fun lt!59482 () ListLongMap!1615)

(assert (=> b!114305 (= res!56263 (= lt!59490 lt!59482))))

(declare-fun map!1321 (LongMapFixedSize!952) ListLongMap!1615)

(assert (=> b!114305 (= lt!59482 (map!1321 newMap!16))))

(declare-fun getCurrentListMap!506 (array!4463 array!4465 (_ BitVec 32) (_ BitVec 32) V!3289 V!3289 (_ BitVec 32) Int) ListLongMap!1615)

(assert (=> b!114305 (= lt!59490 (getCurrentListMap!506 (_keys!4404 (v!2988 (underlying!387 thiss!992))) (_values!2665 (v!2988 (underlying!387 thiss!992))) (mask!6878 (v!2988 (underlying!387 thiss!992))) (extraKeys!2471 (v!2988 (underlying!387 thiss!992))) (zeroValue!2549 (v!2988 (underlying!387 thiss!992))) (minValue!2549 (v!2988 (underlying!387 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2682 (v!2988 (underlying!387 thiss!992)))))))

(declare-fun e!74372 () Bool)

(declare-fun e!74382 () Bool)

(assert (=> b!114306 (= e!74382 (and tp!10247 tp_is_empty!2731 (array_inv!1331 (_keys!4404 (v!2988 (underlying!387 thiss!992)))) (array_inv!1332 (_values!2665 (v!2988 (underlying!387 thiss!992)))) e!74372))))

(declare-fun b!114307 () Bool)

(declare-fun e!74376 () Bool)

(declare-fun mapRes!4122 () Bool)

(assert (=> b!114307 (= e!74372 (and e!74376 mapRes!4122))))

(declare-fun condMapEmpty!4121 () Bool)

(declare-fun mapDefault!4121 () ValueCell!1022)

