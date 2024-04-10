; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89070 () Bool)

(assert start!89070)

(declare-fun b!1021247 () Bool)

(declare-fun b_free!20131 () Bool)

(declare-fun b_next!20131 () Bool)

(assert (=> b!1021247 (= b_free!20131 (not b_next!20131))))

(declare-fun tp!71422 () Bool)

(declare-fun b_and!32319 () Bool)

(assert (=> b!1021247 (= tp!71422 b_and!32319)))

(declare-fun b!1021240 () Bool)

(declare-fun e!575125 () Bool)

(declare-fun e!575133 () Bool)

(assert (=> b!1021240 (= e!575125 e!575133)))

(declare-fun c!103516 () Bool)

(declare-datatypes ((V!36675 0))(
  ( (V!36676 (val!11976 Int)) )
))
(declare-datatypes ((array!63742 0))(
  ( (array!63743 (arr!30685 (Array (_ BitVec 32) (_ BitVec 64))) (size!31196 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11222 0))(
  ( (ValueCellFull!11222 (v!14539 V!36675)) (EmptyCell!11222) )
))
(declare-datatypes ((array!63744 0))(
  ( (array!63745 (arr!30686 (Array (_ BitVec 32) ValueCell!11222)) (size!31197 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5038 0))(
  ( (LongMapFixedSize!5039 (defaultEntry!5871 Int) (mask!29438 (_ BitVec 32)) (extraKeys!5603 (_ BitVec 32)) (zeroValue!5707 V!36675) (minValue!5707 V!36675) (_size!2574 (_ BitVec 32)) (_keys!11016 array!63742) (_values!5894 array!63744) (_vacant!2574 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15482 0))(
  ( (tuple2!15483 (_1!7752 Bool) (_2!7752 LongMapFixedSize!5038)) )
))
(declare-fun lt!450002 () tuple2!15482)

(assert (=> b!1021240 (= c!103516 (_1!7752 lt!450002))))

(declare-fun mapIsEmpty!37188 () Bool)

(declare-fun mapRes!37188 () Bool)

(assert (=> mapIsEmpty!37188 mapRes!37188))

(declare-fun res!684352 () Bool)

(declare-fun e!575129 () Bool)

(assert (=> start!89070 (=> (not res!684352) (not e!575129))))

(declare-datatypes ((Cell!1112 0))(
  ( (Cell!1113 (v!14540 LongMapFixedSize!5038)) )
))
(declare-datatypes ((LongMap!1112 0))(
  ( (LongMap!1113 (underlying!567 Cell!1112)) )
))
(declare-fun thiss!908 () LongMap!1112)

(declare-fun valid!1918 (LongMap!1112) Bool)

(assert (=> start!89070 (= res!684352 (valid!1918 thiss!908))))

(assert (=> start!89070 e!575129))

(declare-fun e!575131 () Bool)

(assert (=> start!89070 e!575131))

(assert (=> start!89070 true))

(declare-fun b!1021241 () Bool)

(declare-datatypes ((tuple2!15484 0))(
  ( (tuple2!15485 (_1!7753 (_ BitVec 64)) (_2!7753 V!36675)) )
))
(declare-datatypes ((List!21650 0))(
  ( (Nil!21647) (Cons!21646 (h!22844 tuple2!15484) (t!30660 List!21650)) )
))
(declare-datatypes ((ListLongMap!13631 0))(
  ( (ListLongMap!13632 (toList!6831 List!21650)) )
))
(declare-fun call!43188 () ListLongMap!13631)

(declare-fun call!43187 () ListLongMap!13631)

(assert (=> b!1021241 (= e!575133 (not (= call!43188 call!43187)))))

(declare-fun b!1021242 () Bool)

(declare-fun e!575128 () Bool)

(assert (=> b!1021242 (= e!575131 e!575128)))

(declare-fun b!1021243 () Bool)

(assert (=> b!1021243 (= e!575129 e!575125)))

(declare-fun res!684353 () Bool)

(assert (=> b!1021243 (=> res!684353 e!575125)))

(declare-fun lt!450003 () LongMap!1112)

(assert (=> b!1021243 (= res!684353 (not (valid!1918 lt!450003)))))

(assert (=> b!1021243 (= lt!450003 (LongMap!1113 (Cell!1113 (_2!7752 lt!450002))))))

(declare-fun key!697 () (_ BitVec 64))

(declare-fun remove!9 (LongMapFixedSize!5038 (_ BitVec 64)) tuple2!15482)

(assert (=> b!1021243 (= lt!450002 (remove!9 (v!14540 (underlying!567 thiss!908)) key!697))))

(declare-fun b!1021244 () Bool)

(declare-fun e!575132 () Bool)

(declare-fun tp_is_empty!23851 () Bool)

(assert (=> b!1021244 (= e!575132 tp_is_empty!23851)))

(declare-fun b!1021245 () Bool)

(declare-fun e!575126 () Bool)

(assert (=> b!1021245 (= e!575126 (and e!575132 mapRes!37188))))

(declare-fun condMapEmpty!37188 () Bool)

(declare-fun mapDefault!37188 () ValueCell!11222)

