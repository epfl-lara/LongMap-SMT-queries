; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112342 () Bool)

(assert start!112342)

(declare-fun b_free!30737 () Bool)

(declare-fun b_next!30737 () Bool)

(assert (=> start!112342 (= b_free!30737 (not b_next!30737))))

(declare-fun tp!107847 () Bool)

(declare-fun b_and!49529 () Bool)

(assert (=> start!112342 (= tp!107847 b_and!49529)))

(declare-fun mapIsEmpty!56644 () Bool)

(declare-fun mapRes!56644 () Bool)

(assert (=> mapIsEmpty!56644 mapRes!56644))

(declare-fun mapNonEmpty!56644 () Bool)

(declare-fun tp!107848 () Bool)

(declare-fun e!758729 () Bool)

(assert (=> mapNonEmpty!56644 (= mapRes!56644 (and tp!107848 e!758729))))

(declare-datatypes ((V!53965 0))(
  ( (V!53966 (val!18398 Int)) )
))
(declare-datatypes ((ValueCell!17425 0))(
  ( (ValueCellFull!17425 (v!21035 V!53965)) (EmptyCell!17425) )
))
(declare-datatypes ((array!90174 0))(
  ( (array!90175 (arr!43553 (Array (_ BitVec 32) ValueCell!17425)) (size!44103 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90174)

(declare-fun mapValue!56644 () ValueCell!17425)

(declare-fun mapRest!56644 () (Array (_ BitVec 32) ValueCell!17425))

(declare-fun mapKey!56644 () (_ BitVec 32))

(assert (=> mapNonEmpty!56644 (= (arr!43553 _values!1320) (store mapRest!56644 mapKey!56644 mapValue!56644))))

(declare-fun b!1331565 () Bool)

(declare-fun e!758731 () Bool)

(declare-fun tp_is_empty!36647 () Bool)

(assert (=> b!1331565 (= e!758731 tp_is_empty!36647)))

(declare-fun b!1331566 () Bool)

(declare-fun res!883610 () Bool)

(declare-fun e!758728 () Bool)

(assert (=> b!1331566 (=> (not res!883610) (not e!758728))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90176 0))(
  ( (array!90177 (arr!43554 (Array (_ BitVec 32) (_ BitVec 64))) (size!44104 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90176)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1331566 (= res!883610 (not (= (select (arr!43554 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1331568 () Bool)

(declare-fun res!883607 () Bool)

(assert (=> b!1331568 (=> (not res!883607) (not e!758728))))

(declare-datatypes ((List!30849 0))(
  ( (Nil!30846) (Cons!30845 (h!32054 (_ BitVec 64)) (t!44999 List!30849)) )
))
(declare-fun arrayNoDuplicates!0 (array!90176 (_ BitVec 32) List!30849) Bool)

(assert (=> b!1331568 (= res!883607 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30846))))

(declare-fun b!1331569 () Bool)

(declare-fun res!883612 () Bool)

(assert (=> b!1331569 (=> (not res!883612) (not e!758728))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331569 (= res!883612 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44104 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331570 () Bool)

(declare-fun res!883614 () Bool)

(assert (=> b!1331570 (=> (not res!883614) (not e!758728))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53965)

(declare-fun zeroValue!1262 () V!53965)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((tuple2!23700 0))(
  ( (tuple2!23701 (_1!11861 (_ BitVec 64)) (_2!11861 V!53965)) )
))
(declare-datatypes ((List!30850 0))(
  ( (Nil!30847) (Cons!30846 (h!32055 tuple2!23700) (t!45000 List!30850)) )
))
(declare-datatypes ((ListLongMap!21357 0))(
  ( (ListLongMap!21358 (toList!10694 List!30850)) )
))
(declare-fun contains!8858 (ListLongMap!21357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5678 (array!90176 array!90174 (_ BitVec 32) (_ BitVec 32) V!53965 V!53965 (_ BitVec 32) Int) ListLongMap!21357)

(assert (=> b!1331570 (= res!883614 (contains!8858 (getCurrentListMap!5678 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1331571 () Bool)

(assert (=> b!1331571 (= e!758728 (not true))))

(declare-fun lt!591596 () ListLongMap!21357)

(declare-fun +!4688 (ListLongMap!21357 tuple2!23700) ListLongMap!21357)

(assert (=> b!1331571 (contains!8858 (+!4688 lt!591596 (tuple2!23701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43825 0))(
  ( (Unit!43826) )
))
(declare-fun lt!591595 () Unit!43825)

(declare-fun addStillContains!1167 (ListLongMap!21357 (_ BitVec 64) V!53965 (_ BitVec 64)) Unit!43825)

(assert (=> b!1331571 (= lt!591595 (addStillContains!1167 lt!591596 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1331571 (contains!8858 lt!591596 k!1153)))

(declare-fun lt!591594 () V!53965)

(declare-fun lt!591597 () Unit!43825)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!275 ((_ BitVec 64) (_ BitVec 64) V!53965 ListLongMap!21357) Unit!43825)

(assert (=> b!1331571 (= lt!591597 (lemmaInListMapAfterAddingDiffThenInBefore!275 k!1153 (select (arr!43554 _keys!1590) from!1980) lt!591594 lt!591596))))

(declare-fun lt!591593 () ListLongMap!21357)

(assert (=> b!1331571 (contains!8858 lt!591593 k!1153)))

(declare-fun lt!591598 () Unit!43825)

(assert (=> b!1331571 (= lt!591598 (lemmaInListMapAfterAddingDiffThenInBefore!275 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591593))))

(assert (=> b!1331571 (= lt!591593 (+!4688 lt!591596 (tuple2!23701 (select (arr!43554 _keys!1590) from!1980) lt!591594)))))

(declare-fun get!21962 (ValueCell!17425 V!53965) V!53965)

(declare-fun dynLambda!3627 (Int (_ BitVec 64)) V!53965)

(assert (=> b!1331571 (= lt!591594 (get!21962 (select (arr!43553 _values!1320) from!1980) (dynLambda!3627 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6326 (array!90176 array!90174 (_ BitVec 32) (_ BitVec 32) V!53965 V!53965 (_ BitVec 32) Int) ListLongMap!21357)

(assert (=> b!1331571 (= lt!591596 (getCurrentListMapNoExtraKeys!6326 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331572 () Bool)

(declare-fun e!758730 () Bool)

(assert (=> b!1331572 (= e!758730 (and e!758731 mapRes!56644))))

(declare-fun condMapEmpty!56644 () Bool)

(declare-fun mapDefault!56644 () ValueCell!17425)

