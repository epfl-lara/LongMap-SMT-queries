; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98702 () Bool)

(assert start!98702)

(declare-fun b_free!24307 () Bool)

(declare-fun b_next!24307 () Bool)

(assert (=> start!98702 (= b_free!24307 (not b_next!24307))))

(declare-fun tp!85631 () Bool)

(declare-fun b_and!39463 () Bool)

(assert (=> start!98702 (= tp!85631 b_and!39463)))

(declare-fun b!1149134 () Bool)

(declare-fun res!764583 () Bool)

(declare-fun e!653615 () Bool)

(assert (=> b!1149134 (=> (not res!764583) (not e!653615))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74521 0))(
  ( (array!74522 (arr!35911 (Array (_ BitVec 32) (_ BitVec 64))) (size!36447 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74521)

(assert (=> b!1149134 (= res!764583 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36447 _keys!1208))))))

(declare-fun b!1149135 () Bool)

(declare-datatypes ((Unit!37773 0))(
  ( (Unit!37774) )
))
(declare-fun e!653613 () Unit!37773)

(declare-fun Unit!37775 () Unit!37773)

(assert (=> b!1149135 (= e!653613 Unit!37775)))

(declare-fun b!1149136 () Bool)

(declare-fun e!653624 () Bool)

(assert (=> b!1149136 (= e!653615 e!653624)))

(declare-fun res!764579 () Bool)

(assert (=> b!1149136 (=> (not res!764579) (not e!653624))))

(declare-fun lt!513874 () array!74521)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74521 (_ BitVec 32)) Bool)

(assert (=> b!1149136 (= res!764579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513874 mask!1564))))

(assert (=> b!1149136 (= lt!513874 (array!74522 (store (arr!35911 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36447 _keys!1208)))))

(declare-fun b!1149137 () Bool)

(declare-fun e!653621 () Bool)

(declare-datatypes ((V!43577 0))(
  ( (V!43578 (val!14475 Int)) )
))
(declare-datatypes ((tuple2!18362 0))(
  ( (tuple2!18363 (_1!9192 (_ BitVec 64)) (_2!9192 V!43577)) )
))
(declare-datatypes ((List!25113 0))(
  ( (Nil!25110) (Cons!25109 (h!26318 tuple2!18362) (t!36412 List!25113)) )
))
(declare-datatypes ((ListLongMap!16331 0))(
  ( (ListLongMap!16332 (toList!8181 List!25113)) )
))
(declare-fun call!53231 () ListLongMap!16331)

(declare-fun call!53229 () ListLongMap!16331)

(assert (=> b!1149137 (= e!653621 (= call!53231 call!53229))))

(declare-fun b!1149138 () Bool)

(declare-fun e!653623 () Unit!37773)

(declare-fun lt!513869 () Unit!37773)

(assert (=> b!1149138 (= e!653623 lt!513869)))

(declare-fun call!53230 () Unit!37773)

(assert (=> b!1149138 (= lt!513869 call!53230)))

(declare-fun call!53233 () Bool)

(assert (=> b!1149138 call!53233))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1149139 () Bool)

(declare-fun -!1316 (ListLongMap!16331 (_ BitVec 64)) ListLongMap!16331)

(assert (=> b!1149139 (= e!653621 (= call!53231 (-!1316 call!53229 k!934)))))

(declare-fun mapNonEmpty!45080 () Bool)

(declare-fun mapRes!45080 () Bool)

(declare-fun tp!85632 () Bool)

(declare-fun e!653616 () Bool)

(assert (=> mapNonEmpty!45080 (= mapRes!45080 (and tp!85632 e!653616))))

(declare-fun mapKey!45080 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13709 0))(
  ( (ValueCellFull!13709 (v!17112 V!43577)) (EmptyCell!13709) )
))
(declare-fun mapValue!45080 () ValueCell!13709)

(declare-fun mapRest!45080 () (Array (_ BitVec 32) ValueCell!13709))

(declare-datatypes ((array!74523 0))(
  ( (array!74524 (arr!35912 (Array (_ BitVec 32) ValueCell!13709)) (size!36448 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74523)

(assert (=> mapNonEmpty!45080 (= (arr!35912 _values!996) (store mapRest!45080 mapKey!45080 mapValue!45080))))

(declare-fun b!1149140 () Bool)

(declare-fun e!653627 () Bool)

(declare-fun tp_is_empty!28837 () Bool)

(assert (=> b!1149140 (= e!653627 tp_is_empty!28837)))

(declare-fun b!1149141 () Bool)

(declare-fun e!653620 () Bool)

(assert (=> b!1149141 (= e!653620 true)))

(declare-fun e!653628 () Bool)

(assert (=> b!1149141 e!653628))

(declare-fun res!764576 () Bool)

(assert (=> b!1149141 (=> (not res!764576) (not e!653628))))

(declare-fun lt!513881 () ListLongMap!16331)

(declare-fun lt!513875 () ListLongMap!16331)

(assert (=> b!1149141 (= res!764576 (= lt!513881 lt!513875))))

(declare-fun lt!513871 () ListLongMap!16331)

(assert (=> b!1149141 (= lt!513881 (-!1316 lt!513871 k!934))))

(declare-fun lt!513882 () V!43577)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun +!3603 (ListLongMap!16331 tuple2!18362) ListLongMap!16331)

(assert (=> b!1149141 (= (-!1316 (+!3603 lt!513875 (tuple2!18363 (select (arr!35911 _keys!1208) from!1455) lt!513882)) (select (arr!35911 _keys!1208) from!1455)) lt!513875)))

(declare-fun lt!513878 () Unit!37773)

(declare-fun addThenRemoveForNewKeyIsSame!161 (ListLongMap!16331 (_ BitVec 64) V!43577) Unit!37773)

(assert (=> b!1149141 (= lt!513878 (addThenRemoveForNewKeyIsSame!161 lt!513875 (select (arr!35911 _keys!1208) from!1455) lt!513882))))

(declare-fun lt!513864 () V!43577)

(declare-fun get!18277 (ValueCell!13709 V!43577) V!43577)

(assert (=> b!1149141 (= lt!513882 (get!18277 (select (arr!35912 _values!996) from!1455) lt!513864))))

(declare-fun lt!513879 () Unit!37773)

(assert (=> b!1149141 (= lt!513879 e!653613)))

(declare-fun c!113622 () Bool)

(declare-fun contains!6704 (ListLongMap!16331 (_ BitVec 64)) Bool)

(assert (=> b!1149141 (= c!113622 (contains!6704 lt!513875 k!934))))

(declare-fun zeroValue!944 () V!43577)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43577)

(declare-fun getCurrentListMapNoExtraKeys!4654 (array!74521 array!74523 (_ BitVec 32) (_ BitVec 32) V!43577 V!43577 (_ BitVec 32) Int) ListLongMap!16331)

(assert (=> b!1149141 (= lt!513875 (getCurrentListMapNoExtraKeys!4654 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!653619 () Bool)

(declare-fun b!1149142 () Bool)

(declare-fun arrayContainsKey!0 (array!74521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149142 (= e!653619 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53223 () Bool)

(declare-fun lt!513880 () array!74523)

(assert (=> bm!53223 (= call!53231 (getCurrentListMapNoExtraKeys!4654 lt!513874 lt!513880 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149143 () Bool)

(declare-fun res!764587 () Bool)

(assert (=> b!1149143 (=> (not res!764587) (not e!653615))))

(declare-datatypes ((List!25114 0))(
  ( (Nil!25111) (Cons!25110 (h!26319 (_ BitVec 64)) (t!36413 List!25114)) )
))
(declare-fun arrayNoDuplicates!0 (array!74521 (_ BitVec 32) List!25114) Bool)

(assert (=> b!1149143 (= res!764587 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25111))))

(declare-fun b!1149144 () Bool)

(assert (=> b!1149144 (= e!653628 (= lt!513881 (getCurrentListMapNoExtraKeys!4654 lt!513874 lt!513880 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1149145 () Bool)

(declare-fun res!764575 () Bool)

(assert (=> b!1149145 (=> (not res!764575) (not e!653615))))

(assert (=> b!1149145 (= res!764575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1149146 () Bool)

(declare-fun e!653614 () Unit!37773)

(assert (=> b!1149146 (= e!653623 e!653614)))

(declare-fun c!113625 () Bool)

(declare-fun lt!513870 () Bool)

(assert (=> b!1149146 (= c!113625 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513870))))

(declare-fun res!764586 () Bool)

(assert (=> start!98702 (=> (not res!764586) (not e!653615))))

(assert (=> start!98702 (= res!764586 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36447 _keys!1208))))))

(assert (=> start!98702 e!653615))

(assert (=> start!98702 tp_is_empty!28837))

(declare-fun array_inv!27506 (array!74521) Bool)

(assert (=> start!98702 (array_inv!27506 _keys!1208)))

(assert (=> start!98702 true))

(assert (=> start!98702 tp!85631))

(declare-fun e!653622 () Bool)

(declare-fun array_inv!27507 (array!74523) Bool)

(assert (=> start!98702 (and (array_inv!27507 _values!996) e!653622)))

(declare-fun b!1149147 () Bool)

(declare-fun e!653612 () Bool)

(assert (=> b!1149147 (= e!653624 (not e!653612))))

(declare-fun res!764584 () Bool)

(assert (=> b!1149147 (=> res!764584 e!653612)))

(assert (=> b!1149147 (= res!764584 (bvsgt from!1455 i!673))))

(assert (=> b!1149147 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!513876 () Unit!37773)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74521 (_ BitVec 64) (_ BitVec 32)) Unit!37773)

(assert (=> b!1149147 (= lt!513876 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1149148 () Bool)

(declare-fun res!764588 () Bool)

(assert (=> b!1149148 (=> (not res!764588) (not e!653615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149148 (= res!764588 (validKeyInArray!0 k!934))))

(declare-fun b!1149149 () Bool)

(assert (=> b!1149149 call!53233))

(declare-fun lt!513883 () Unit!37773)

(assert (=> b!1149149 (= lt!513883 call!53230)))

(assert (=> b!1149149 (= e!653614 lt!513883)))

(declare-fun lt!513866 () ListLongMap!16331)

(declare-fun c!113623 () Bool)

(declare-fun bm!53224 () Bool)

(declare-fun c!113621 () Bool)

(declare-fun call!53232 () Unit!37773)

(declare-fun addStillContains!853 (ListLongMap!16331 (_ BitVec 64) V!43577 (_ BitVec 64)) Unit!37773)

(assert (=> bm!53224 (= call!53232 (addStillContains!853 (ite c!113623 lt!513866 lt!513875) (ite c!113623 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113621 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113623 minValue!944 (ite c!113621 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1149150 () Bool)

(declare-fun e!653617 () Bool)

(assert (=> b!1149150 (= e!653617 e!653620)))

(declare-fun res!764580 () Bool)

(assert (=> b!1149150 (=> res!764580 e!653620)))

(assert (=> b!1149150 (= res!764580 (not (= (select (arr!35911 _keys!1208) from!1455) k!934)))))

(assert (=> b!1149150 e!653621))

(declare-fun c!113624 () Bool)

(assert (=> b!1149150 (= c!113624 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513885 () Unit!37773)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!553 (array!74521 array!74523 (_ BitVec 32) (_ BitVec 32) V!43577 V!43577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37773)

(assert (=> b!1149150 (= lt!513885 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!653626 () Bool)

(declare-fun b!1149151 () Bool)

(assert (=> b!1149151 (= e!653626 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149152 () Bool)

(declare-fun res!764582 () Bool)

(assert (=> b!1149152 (=> (not res!764582) (not e!653624))))

(assert (=> b!1149152 (= res!764582 (arrayNoDuplicates!0 lt!513874 #b00000000000000000000000000000000 Nil!25111))))

(declare-fun b!1149153 () Bool)

(declare-fun Unit!37776 () Unit!37773)

(assert (=> b!1149153 (= e!653614 Unit!37776)))

(declare-fun call!53228 () Bool)

(declare-fun call!53226 () ListLongMap!16331)

(declare-fun bm!53225 () Bool)

(assert (=> bm!53225 (= call!53228 (contains!6704 (ite c!113623 lt!513866 call!53226) k!934))))

(declare-fun b!1149154 () Bool)

(assert (=> b!1149154 (= c!113621 (and (not lt!513870) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!653625 () Unit!37773)

(assert (=> b!1149154 (= e!653625 e!653623)))

(declare-fun bm!53226 () Bool)

(declare-fun call!53227 () ListLongMap!16331)

(assert (=> bm!53226 (= call!53226 call!53227)))

(declare-fun bm!53227 () Bool)

(assert (=> bm!53227 (= call!53229 (getCurrentListMapNoExtraKeys!4654 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53228 () Bool)

(assert (=> bm!53228 (= call!53230 call!53232)))

(declare-fun b!1149155 () Bool)

(assert (=> b!1149155 (= e!653622 (and e!653627 mapRes!45080))))

(declare-fun condMapEmpty!45080 () Bool)

(declare-fun mapDefault!45080 () ValueCell!13709)

