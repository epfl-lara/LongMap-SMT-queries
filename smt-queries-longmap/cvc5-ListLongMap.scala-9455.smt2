; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112338 () Bool)

(assert start!112338)

(declare-fun b_free!30733 () Bool)

(declare-fun b_next!30733 () Bool)

(assert (=> start!112338 (= b_free!30733 (not b_next!30733))))

(declare-fun tp!107835 () Bool)

(declare-fun b_and!49521 () Bool)

(assert (=> start!112338 (= tp!107835 b_and!49521)))

(declare-fun mapNonEmpty!56638 () Bool)

(declare-fun mapRes!56638 () Bool)

(declare-fun tp!107836 () Bool)

(declare-fun e!758699 () Bool)

(assert (=> mapNonEmpty!56638 (= mapRes!56638 (and tp!107836 e!758699))))

(declare-datatypes ((V!53961 0))(
  ( (V!53962 (val!18396 Int)) )
))
(declare-datatypes ((ValueCell!17423 0))(
  ( (ValueCellFull!17423 (v!21033 V!53961)) (EmptyCell!17423) )
))
(declare-datatypes ((array!90166 0))(
  ( (array!90167 (arr!43549 (Array (_ BitVec 32) ValueCell!17423)) (size!44099 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90166)

(declare-fun mapKey!56638 () (_ BitVec 32))

(declare-fun mapValue!56638 () ValueCell!17423)

(declare-fun mapRest!56638 () (Array (_ BitVec 32) ValueCell!17423))

(assert (=> mapNonEmpty!56638 (= (arr!43549 _values!1320) (store mapRest!56638 mapKey!56638 mapValue!56638))))

(declare-fun b!1331489 () Bool)

(declare-fun res!883559 () Bool)

(declare-fun e!758698 () Bool)

(assert (=> b!1331489 (=> (not res!883559) (not e!758698))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90168 0))(
  ( (array!90169 (arr!43550 (Array (_ BitVec 32) (_ BitVec 64))) (size!44100 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90168)

(assert (=> b!1331489 (= res!883559 (and (= (size!44099 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44100 _keys!1590) (size!44099 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331490 () Bool)

(declare-fun res!883552 () Bool)

(assert (=> b!1331490 (=> (not res!883552) (not e!758698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90168 (_ BitVec 32)) Bool)

(assert (=> b!1331490 (= res!883552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331491 () Bool)

(assert (=> b!1331491 (= e!758698 (not true))))

(declare-datatypes ((tuple2!23696 0))(
  ( (tuple2!23697 (_1!11859 (_ BitVec 64)) (_2!11859 V!53961)) )
))
(declare-datatypes ((List!30845 0))(
  ( (Nil!30842) (Cons!30841 (h!32050 tuple2!23696) (t!44991 List!30845)) )
))
(declare-datatypes ((ListLongMap!21353 0))(
  ( (ListLongMap!21354 (toList!10692 List!30845)) )
))
(declare-fun lt!591561 () ListLongMap!21353)

(declare-fun minValue!1262 () V!53961)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8856 (ListLongMap!21353 (_ BitVec 64)) Bool)

(declare-fun +!4686 (ListLongMap!21353 tuple2!23696) ListLongMap!21353)

(assert (=> b!1331491 (contains!8856 (+!4686 lt!591561 (tuple2!23697 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43821 0))(
  ( (Unit!43822) )
))
(declare-fun lt!591557 () Unit!43821)

(declare-fun addStillContains!1165 (ListLongMap!21353 (_ BitVec 64) V!53961 (_ BitVec 64)) Unit!43821)

(assert (=> b!1331491 (= lt!591557 (addStillContains!1165 lt!591561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1331491 (contains!8856 lt!591561 k!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591558 () V!53961)

(declare-fun lt!591559 () Unit!43821)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!273 ((_ BitVec 64) (_ BitVec 64) V!53961 ListLongMap!21353) Unit!43821)

(assert (=> b!1331491 (= lt!591559 (lemmaInListMapAfterAddingDiffThenInBefore!273 k!1153 (select (arr!43550 _keys!1590) from!1980) lt!591558 lt!591561))))

(declare-fun lt!591560 () ListLongMap!21353)

(assert (=> b!1331491 (contains!8856 lt!591560 k!1153)))

(declare-fun lt!591562 () Unit!43821)

(assert (=> b!1331491 (= lt!591562 (lemmaInListMapAfterAddingDiffThenInBefore!273 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591560))))

(assert (=> b!1331491 (= lt!591560 (+!4686 lt!591561 (tuple2!23697 (select (arr!43550 _keys!1590) from!1980) lt!591558)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21960 (ValueCell!17423 V!53961) V!53961)

(declare-fun dynLambda!3625 (Int (_ BitVec 64)) V!53961)

(assert (=> b!1331491 (= lt!591558 (get!21960 (select (arr!43549 _values!1320) from!1980) (dynLambda!3625 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53961)

(declare-fun getCurrentListMapNoExtraKeys!6324 (array!90168 array!90166 (_ BitVec 32) (_ BitVec 32) V!53961 V!53961 (_ BitVec 32) Int) ListLongMap!21353)

(assert (=> b!1331491 (= lt!591561 (getCurrentListMapNoExtraKeys!6324 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331492 () Bool)

(declare-fun res!883554 () Bool)

(assert (=> b!1331492 (=> (not res!883554) (not e!758698))))

(assert (=> b!1331492 (= res!883554 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44100 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331493 () Bool)

(declare-fun res!883553 () Bool)

(assert (=> b!1331493 (=> (not res!883553) (not e!758698))))

(declare-datatypes ((List!30846 0))(
  ( (Nil!30843) (Cons!30842 (h!32051 (_ BitVec 64)) (t!44992 List!30846)) )
))
(declare-fun arrayNoDuplicates!0 (array!90168 (_ BitVec 32) List!30846) Bool)

(assert (=> b!1331493 (= res!883553 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30843))))

(declare-fun b!1331494 () Bool)

(declare-fun res!883557 () Bool)

(assert (=> b!1331494 (=> (not res!883557) (not e!758698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331494 (= res!883557 (validKeyInArray!0 (select (arr!43550 _keys!1590) from!1980)))))

(declare-fun b!1331495 () Bool)

(declare-fun e!758701 () Bool)

(declare-fun e!758700 () Bool)

(assert (=> b!1331495 (= e!758701 (and e!758700 mapRes!56638))))

(declare-fun condMapEmpty!56638 () Bool)

(declare-fun mapDefault!56638 () ValueCell!17423)

