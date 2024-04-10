; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112336 () Bool)

(assert start!112336)

(declare-fun b_free!30731 () Bool)

(declare-fun b_next!30731 () Bool)

(assert (=> start!112336 (= b_free!30731 (not b_next!30731))))

(declare-fun tp!107829 () Bool)

(declare-fun b_and!49517 () Bool)

(assert (=> start!112336 (= tp!107829 b_and!49517)))

(declare-fun b!1331451 () Bool)

(declare-fun e!758682 () Bool)

(declare-fun tp_is_empty!36641 () Bool)

(assert (=> b!1331451 (= e!758682 tp_is_empty!36641)))

(declare-fun mapIsEmpty!56635 () Bool)

(declare-fun mapRes!56635 () Bool)

(assert (=> mapIsEmpty!56635 mapRes!56635))

(declare-fun b!1331452 () Bool)

(declare-fun e!758683 () Bool)

(assert (=> b!1331452 (= e!758683 (not true))))

(declare-datatypes ((V!53957 0))(
  ( (V!53958 (val!18395 Int)) )
))
(declare-datatypes ((tuple2!23694 0))(
  ( (tuple2!23695 (_1!11858 (_ BitVec 64)) (_2!11858 V!53957)) )
))
(declare-datatypes ((List!30843 0))(
  ( (Nil!30840) (Cons!30839 (h!32048 tuple2!23694) (t!44987 List!30843)) )
))
(declare-datatypes ((ListLongMap!21351 0))(
  ( (ListLongMap!21352 (toList!10691 List!30843)) )
))
(declare-fun lt!591542 () ListLongMap!21351)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8855 (ListLongMap!21351 (_ BitVec 64)) Bool)

(assert (=> b!1331452 (contains!8855 lt!591542 k!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591543 () V!53957)

(declare-datatypes ((array!90162 0))(
  ( (array!90163 (arr!43547 (Array (_ BitVec 32) (_ BitVec 64))) (size!44097 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90162)

(declare-datatypes ((Unit!43819 0))(
  ( (Unit!43820) )
))
(declare-fun lt!591541 () Unit!43819)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!272 ((_ BitVec 64) (_ BitVec 64) V!53957 ListLongMap!21351) Unit!43819)

(assert (=> b!1331452 (= lt!591541 (lemmaInListMapAfterAddingDiffThenInBefore!272 k!1153 (select (arr!43547 _keys!1590) from!1980) lt!591543 lt!591542))))

(declare-fun lt!591544 () ListLongMap!21351)

(assert (=> b!1331452 (contains!8855 lt!591544 k!1153)))

(declare-fun lt!591540 () Unit!43819)

(declare-fun minValue!1262 () V!53957)

(assert (=> b!1331452 (= lt!591540 (lemmaInListMapAfterAddingDiffThenInBefore!272 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591544))))

(declare-fun +!4685 (ListLongMap!21351 tuple2!23694) ListLongMap!21351)

(assert (=> b!1331452 (= lt!591544 (+!4685 lt!591542 (tuple2!23695 (select (arr!43547 _keys!1590) from!1980) lt!591543)))))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((ValueCell!17422 0))(
  ( (ValueCellFull!17422 (v!21032 V!53957)) (EmptyCell!17422) )
))
(declare-datatypes ((array!90164 0))(
  ( (array!90165 (arr!43548 (Array (_ BitVec 32) ValueCell!17422)) (size!44098 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90164)

(declare-fun get!21957 (ValueCell!17422 V!53957) V!53957)

(declare-fun dynLambda!3624 (Int (_ BitVec 64)) V!53957)

(assert (=> b!1331452 (= lt!591543 (get!21957 (select (arr!43548 _values!1320) from!1980) (dynLambda!3624 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53957)

(declare-fun getCurrentListMapNoExtraKeys!6323 (array!90162 array!90164 (_ BitVec 32) (_ BitVec 32) V!53957 V!53957 (_ BitVec 32) Int) ListLongMap!21351)

(assert (=> b!1331452 (= lt!591542 (getCurrentListMapNoExtraKeys!6323 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331453 () Bool)

(declare-fun res!883530 () Bool)

(assert (=> b!1331453 (=> (not res!883530) (not e!758683))))

(declare-datatypes ((List!30844 0))(
  ( (Nil!30841) (Cons!30840 (h!32049 (_ BitVec 64)) (t!44988 List!30844)) )
))
(declare-fun arrayNoDuplicates!0 (array!90162 (_ BitVec 32) List!30844) Bool)

(assert (=> b!1331453 (= res!883530 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30841))))

(declare-fun res!883526 () Bool)

(assert (=> start!112336 (=> (not res!883526) (not e!758683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112336 (= res!883526 (validMask!0 mask!1998))))

(assert (=> start!112336 e!758683))

(declare-fun e!758685 () Bool)

(declare-fun array_inv!32847 (array!90164) Bool)

(assert (=> start!112336 (and (array_inv!32847 _values!1320) e!758685)))

(assert (=> start!112336 true))

(declare-fun array_inv!32848 (array!90162) Bool)

(assert (=> start!112336 (array_inv!32848 _keys!1590)))

(assert (=> start!112336 tp!107829))

(assert (=> start!112336 tp_is_empty!36641))

(declare-fun b!1331454 () Bool)

(declare-fun res!883532 () Bool)

(assert (=> b!1331454 (=> (not res!883532) (not e!758683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331454 (= res!883532 (validKeyInArray!0 (select (arr!43547 _keys!1590) from!1980)))))

(declare-fun b!1331455 () Bool)

(declare-fun res!883528 () Bool)

(assert (=> b!1331455 (=> (not res!883528) (not e!758683))))

(declare-fun getCurrentListMap!5676 (array!90162 array!90164 (_ BitVec 32) (_ BitVec 32) V!53957 V!53957 (_ BitVec 32) Int) ListLongMap!21351)

(assert (=> b!1331455 (= res!883528 (contains!8855 (getCurrentListMap!5676 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1331456 () Bool)

(assert (=> b!1331456 (= e!758685 (and e!758682 mapRes!56635))))

(declare-fun condMapEmpty!56635 () Bool)

(declare-fun mapDefault!56635 () ValueCell!17422)

