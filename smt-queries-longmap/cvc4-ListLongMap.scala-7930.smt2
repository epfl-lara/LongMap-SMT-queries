; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98424 () Bool)

(assert start!98424)

(declare-fun b_free!24029 () Bool)

(declare-fun b_next!24029 () Bool)

(assert (=> start!98424 (= b_free!24029 (not b_next!24029))))

(declare-fun tp!84798 () Bool)

(declare-fun b_and!38907 () Bool)

(assert (=> start!98424 (= tp!84798 b_and!38907)))

(declare-datatypes ((V!43205 0))(
  ( (V!43206 (val!14336 Int)) )
))
(declare-fun zeroValue!944 () V!43205)

(declare-datatypes ((array!73979 0))(
  ( (array!73980 (arr!35640 (Array (_ BitVec 32) (_ BitVec 64))) (size!36176 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73979)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13570 0))(
  ( (ValueCellFull!13570 (v!16973 V!43205)) (EmptyCell!13570) )
))
(declare-datatypes ((array!73981 0))(
  ( (array!73982 (arr!35641 (Array (_ BitVec 32) ValueCell!13570)) (size!36177 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73981)

(declare-fun bm!49887 () Bool)

(declare-fun minValue!944 () V!43205)

(declare-datatypes ((tuple2!18100 0))(
  ( (tuple2!18101 (_1!9061 (_ BitVec 64)) (_2!9061 V!43205)) )
))
(declare-datatypes ((List!24859 0))(
  ( (Nil!24856) (Cons!24855 (h!26064 tuple2!18100) (t!35880 List!24859)) )
))
(declare-datatypes ((ListLongMap!16069 0))(
  ( (ListLongMap!16070 (toList!8050 List!24859)) )
))
(declare-fun call!49890 () ListLongMap!16069)

(declare-fun getCurrentListMapNoExtraKeys!4534 (array!73979 array!73981 (_ BitVec 32) (_ BitVec 32) V!43205 V!43205 (_ BitVec 32) Int) ListLongMap!16069)

(assert (=> bm!49887 (= call!49890 (getCurrentListMapNoExtraKeys!4534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136597 () Bool)

(declare-fun e!646781 () Bool)

(assert (=> b!1136597 (= e!646781 true)))

(declare-fun lt!505370 () Bool)

(declare-datatypes ((List!24860 0))(
  ( (Nil!24857) (Cons!24856 (h!26065 (_ BitVec 64)) (t!35881 List!24860)) )
))
(declare-fun contains!6589 (List!24860 (_ BitVec 64)) Bool)

(assert (=> b!1136597 (= lt!505370 (contains!6589 Nil!24857 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1136598 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!646778 () Bool)

(declare-fun arrayContainsKey!0 (array!73979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136598 (= e!646778 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136599 () Bool)

(declare-datatypes ((Unit!37221 0))(
  ( (Unit!37222) )
))
(declare-fun e!646791 () Unit!37221)

(declare-fun lt!505380 () Unit!37221)

(assert (=> b!1136599 (= e!646791 lt!505380)))

(declare-fun lt!505378 () Unit!37221)

(declare-fun call!49897 () Unit!37221)

(assert (=> b!1136599 (= lt!505378 call!49897)))

(declare-fun lt!505376 () ListLongMap!16069)

(declare-fun call!49892 () ListLongMap!16069)

(assert (=> b!1136599 (= lt!505376 call!49892)))

(declare-fun call!49894 () Bool)

(assert (=> b!1136599 call!49894))

(declare-fun addStillContains!747 (ListLongMap!16069 (_ BitVec 64) V!43205 (_ BitVec 64)) Unit!37221)

(assert (=> b!1136599 (= lt!505380 (addStillContains!747 lt!505376 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun contains!6590 (ListLongMap!16069 (_ BitVec 64)) Bool)

(declare-fun +!3486 (ListLongMap!16069 tuple2!18100) ListLongMap!16069)

(assert (=> b!1136599 (contains!6590 (+!3486 lt!505376 (tuple2!18101 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1136600 () Bool)

(declare-fun e!646783 () Unit!37221)

(declare-fun Unit!37223 () Unit!37221)

(assert (=> b!1136600 (= e!646783 Unit!37223)))

(declare-fun b!1136601 () Bool)

(declare-fun res!758574 () Bool)

(declare-fun e!646787 () Bool)

(assert (=> b!1136601 (=> (not res!758574) (not e!646787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136601 (= res!758574 (validKeyInArray!0 k!934))))

(declare-fun lt!505381 () ListLongMap!16069)

(declare-fun bm!49888 () Bool)

(declare-fun c!111122 () Bool)

(declare-fun c!111120 () Bool)

(assert (=> bm!49888 (= call!49897 (addStillContains!747 lt!505381 (ite (or c!111120 c!111122) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111120 c!111122) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1136602 () Bool)

(declare-fun res!758571 () Bool)

(assert (=> b!1136602 (=> res!758571 e!646781)))

(assert (=> b!1136602 (= res!758571 (contains!6589 Nil!24857 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!49896 () ListLongMap!16069)

(declare-fun bm!49889 () Bool)

(assert (=> bm!49889 (= call!49894 (contains!6590 (ite c!111120 lt!505376 call!49896) k!934))))

(declare-fun b!1136603 () Bool)

(declare-fun e!646780 () Bool)

(assert (=> b!1136603 (= e!646787 e!646780)))

(declare-fun res!758581 () Bool)

(assert (=> b!1136603 (=> (not res!758581) (not e!646780))))

(declare-fun lt!505375 () array!73979)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73979 (_ BitVec 32)) Bool)

(assert (=> b!1136603 (= res!758581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505375 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136603 (= lt!505375 (array!73980 (store (arr!35640 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36176 _keys!1208)))))

(declare-fun b!1136604 () Bool)

(declare-fun e!646788 () Bool)

(declare-fun tp_is_empty!28559 () Bool)

(assert (=> b!1136604 (= e!646788 tp_is_empty!28559)))

(declare-fun b!1136605 () Bool)

(declare-fun call!49895 () Bool)

(assert (=> b!1136605 call!49895))

(declare-fun lt!505374 () Unit!37221)

(declare-fun call!49893 () Unit!37221)

(assert (=> b!1136605 (= lt!505374 call!49893)))

(declare-fun e!646785 () Unit!37221)

(assert (=> b!1136605 (= e!646785 lt!505374)))

(declare-fun b!1136606 () Bool)

(declare-fun e!646786 () Bool)

(declare-fun e!646790 () Bool)

(assert (=> b!1136606 (= e!646786 e!646790)))

(declare-fun res!758575 () Bool)

(assert (=> b!1136606 (=> res!758575 e!646790)))

(assert (=> b!1136606 (= res!758575 (not (= from!1455 i!673)))))

(declare-fun lt!505377 () ListLongMap!16069)

(declare-fun lt!505371 () array!73981)

(assert (=> b!1136606 (= lt!505377 (getCurrentListMapNoExtraKeys!4534 lt!505375 lt!505371 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2592 (Int (_ BitVec 64)) V!43205)

(assert (=> b!1136606 (= lt!505371 (array!73982 (store (arr!35641 _values!996) i!673 (ValueCellFull!13570 (dynLambda!2592 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36177 _values!996)))))

(declare-fun lt!505382 () ListLongMap!16069)

(assert (=> b!1136606 (= lt!505382 (getCurrentListMapNoExtraKeys!4534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1136607 () Bool)

(assert (=> b!1136607 (= e!646780 (not e!646786))))

(declare-fun res!758569 () Bool)

(assert (=> b!1136607 (=> res!758569 e!646786)))

(assert (=> b!1136607 (= res!758569 (bvsgt from!1455 i!673))))

(assert (=> b!1136607 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!505379 () Unit!37221)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73979 (_ BitVec 64) (_ BitVec 32)) Unit!37221)

(assert (=> b!1136607 (= lt!505379 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1136608 () Bool)

(declare-fun lt!505385 () Unit!37221)

(assert (=> b!1136608 (= e!646783 lt!505385)))

(assert (=> b!1136608 (= lt!505385 call!49893)))

(assert (=> b!1136608 call!49895))

(declare-fun b!1136609 () Bool)

(declare-fun e!646782 () Bool)

(assert (=> b!1136609 (= e!646782 tp_is_empty!28559)))

(declare-fun b!1136610 () Bool)

(declare-fun res!758582 () Bool)

(assert (=> b!1136610 (=> (not res!758582) (not e!646787))))

(assert (=> b!1136610 (= res!758582 (= (select (arr!35640 _keys!1208) i!673) k!934))))

(declare-fun b!1136611 () Bool)

(declare-fun call!49891 () ListLongMap!16069)

(declare-fun e!646775 () Bool)

(declare-fun -!1211 (ListLongMap!16069 (_ BitVec 64)) ListLongMap!16069)

(assert (=> b!1136611 (= e!646775 (= call!49891 (-!1211 call!49890 k!934)))))

(declare-fun b!1136612 () Bool)

(declare-fun res!758580 () Bool)

(assert (=> b!1136612 (=> (not res!758580) (not e!646787))))

(assert (=> b!1136612 (= res!758580 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36176 _keys!1208))))))

(declare-fun bm!49890 () Bool)

(assert (=> bm!49890 (= call!49895 call!49894)))

(declare-fun b!1136613 () Bool)

(declare-fun e!646777 () Bool)

(declare-fun mapRes!44663 () Bool)

(assert (=> b!1136613 (= e!646777 (and e!646788 mapRes!44663))))

(declare-fun condMapEmpty!44663 () Bool)

(declare-fun mapDefault!44663 () ValueCell!13570)

