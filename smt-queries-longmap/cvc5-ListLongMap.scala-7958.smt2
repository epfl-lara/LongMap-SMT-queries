; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98588 () Bool)

(assert start!98588)

(declare-fun b_free!24193 () Bool)

(declare-fun b_next!24193 () Bool)

(assert (=> start!98588 (= b_free!24193 (not b_next!24193))))

(declare-fun tp!85289 () Bool)

(declare-fun b_and!39235 () Bool)

(assert (=> start!98588 (= tp!85289 b_and!39235)))

(declare-fun mapNonEmpty!44909 () Bool)

(declare-fun mapRes!44909 () Bool)

(declare-fun tp!85290 () Bool)

(declare-fun e!650726 () Bool)

(assert (=> mapNonEmpty!44909 (= mapRes!44909 (and tp!85290 e!650726))))

(declare-datatypes ((V!43425 0))(
  ( (V!43426 (val!14418 Int)) )
))
(declare-datatypes ((ValueCell!13652 0))(
  ( (ValueCellFull!13652 (v!17055 V!43425)) (EmptyCell!13652) )
))
(declare-fun mapValue!44909 () ValueCell!13652)

(declare-datatypes ((array!74299 0))(
  ( (array!74300 (arr!35800 (Array (_ BitVec 32) ValueCell!13652)) (size!36336 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74299)

(declare-fun mapRest!44909 () (Array (_ BitVec 32) ValueCell!13652))

(declare-fun mapKey!44909 () (_ BitVec 32))

(assert (=> mapNonEmpty!44909 (= (arr!35800 _values!996) (store mapRest!44909 mapKey!44909 mapValue!44909))))

(declare-fun b!1143897 () Bool)

(declare-fun res!762020 () Bool)

(declare-fun e!650714 () Bool)

(assert (=> b!1143897 (=> (not res!762020) (not e!650714))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143897 (= res!762020 (validKeyInArray!0 k!934))))

(declare-fun b!1143898 () Bool)

(declare-datatypes ((Unit!37540 0))(
  ( (Unit!37541) )
))
(declare-fun e!650712 () Unit!37540)

(declare-fun lt!510276 () Unit!37540)

(assert (=> b!1143898 (= e!650712 lt!510276)))

(declare-fun call!51859 () Unit!37540)

(assert (=> b!1143898 (= lt!510276 call!51859)))

(declare-fun call!51864 () Bool)

(assert (=> b!1143898 call!51864))

(declare-fun b!1143899 () Bool)

(declare-fun res!762026 () Bool)

(assert (=> b!1143899 (=> (not res!762026) (not e!650714))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143899 (= res!762026 (validMask!0 mask!1564))))

(declare-fun b!1143900 () Bool)

(declare-fun e!650717 () Bool)

(assert (=> b!1143900 (= e!650714 e!650717)))

(declare-fun res!762018 () Bool)

(assert (=> b!1143900 (=> (not res!762018) (not e!650717))))

(declare-datatypes ((array!74301 0))(
  ( (array!74302 (arr!35801 (Array (_ BitVec 32) (_ BitVec 64))) (size!36337 (_ BitVec 32))) )
))
(declare-fun lt!510271 () array!74301)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74301 (_ BitVec 32)) Bool)

(assert (=> b!1143900 (= res!762018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510271 mask!1564))))

(declare-fun _keys!1208 () array!74301)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143900 (= lt!510271 (array!74302 (store (arr!35801 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36337 _keys!1208)))))

(declare-fun b!1143901 () Bool)

(declare-fun res!762022 () Bool)

(assert (=> b!1143901 (=> (not res!762022) (not e!650714))))

(assert (=> b!1143901 (= res!762022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!51856 () Bool)

(declare-fun call!51858 () Bool)

(assert (=> bm!51856 (= call!51864 call!51858)))

(declare-fun b!1143902 () Bool)

(declare-fun e!650722 () Bool)

(declare-fun tp_is_empty!28723 () Bool)

(assert (=> b!1143902 (= e!650722 tp_is_empty!28723)))

(declare-fun b!1143903 () Bool)

(declare-fun e!650718 () Unit!37540)

(declare-fun Unit!37542 () Unit!37540)

(assert (=> b!1143903 (= e!650718 Unit!37542)))

(declare-fun b!1143904 () Bool)

(declare-datatypes ((tuple2!18256 0))(
  ( (tuple2!18257 (_1!9139 (_ BitVec 64)) (_2!9139 V!43425)) )
))
(declare-datatypes ((List!25008 0))(
  ( (Nil!25005) (Cons!25004 (h!26213 tuple2!18256) (t!36193 List!25008)) )
))
(declare-datatypes ((ListLongMap!16225 0))(
  ( (ListLongMap!16226 (toList!8128 List!25008)) )
))
(declare-fun lt!510273 () ListLongMap!16225)

(declare-fun minValue!944 () V!43425)

(declare-fun contains!6658 (ListLongMap!16225 (_ BitVec 64)) Bool)

(declare-fun +!3555 (ListLongMap!16225 tuple2!18256) ListLongMap!16225)

(assert (=> b!1143904 (contains!6658 (+!3555 lt!510273 (tuple2!18257 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!510288 () Unit!37540)

(declare-fun addStillContains!812 (ListLongMap!16225 (_ BitVec 64) V!43425 (_ BitVec 64)) Unit!37540)

(assert (=> b!1143904 (= lt!510288 (addStillContains!812 lt!510273 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1143904 call!51858))

(declare-fun call!51865 () ListLongMap!16225)

(assert (=> b!1143904 (= lt!510273 call!51865)))

(declare-fun lt!510272 () Unit!37540)

(declare-fun call!51862 () Unit!37540)

(assert (=> b!1143904 (= lt!510272 call!51862)))

(declare-fun e!650727 () Unit!37540)

(assert (=> b!1143904 (= e!650727 lt!510288)))

(declare-fun bm!51857 () Bool)

(declare-fun c!112599 () Bool)

(declare-fun call!51861 () ListLongMap!16225)

(assert (=> bm!51857 (= call!51858 (contains!6658 (ite c!112599 lt!510273 call!51861) k!934))))

(declare-fun b!1143905 () Bool)

(declare-fun c!112600 () Bool)

(declare-fun lt!510281 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1143905 (= c!112600 (and (not lt!510281) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1143905 (= e!650727 e!650712)))

(declare-fun b!1143906 () Bool)

(declare-fun res!762024 () Bool)

(assert (=> b!1143906 (=> (not res!762024) (not e!650714))))

(assert (=> b!1143906 (= res!762024 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36337 _keys!1208))))))

(declare-fun b!1143907 () Bool)

(assert (=> b!1143907 (= e!650712 e!650718)))

(declare-fun c!112598 () Bool)

(assert (=> b!1143907 (= c!112598 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510281))))

(declare-fun res!762027 () Bool)

(assert (=> start!98588 (=> (not res!762027) (not e!650714))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98588 (= res!762027 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36337 _keys!1208))))))

(assert (=> start!98588 e!650714))

(assert (=> start!98588 tp_is_empty!28723))

(declare-fun array_inv!27432 (array!74301) Bool)

(assert (=> start!98588 (array_inv!27432 _keys!1208)))

(assert (=> start!98588 true))

(assert (=> start!98588 tp!85289))

(declare-fun e!650725 () Bool)

(declare-fun array_inv!27433 (array!74299) Bool)

(assert (=> start!98588 (and (array_inv!27433 _values!996) e!650725)))

(declare-fun zeroValue!944 () V!43425)

(declare-fun bm!51855 () Bool)

(declare-fun lt!510274 () ListLongMap!16225)

(assert (=> bm!51855 (= call!51862 (addStillContains!812 lt!510274 (ite (or c!112599 c!112600) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112599 c!112600) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1143908 () Bool)

(declare-fun e!650713 () Bool)

(declare-fun call!51863 () ListLongMap!16225)

(declare-fun call!51860 () ListLongMap!16225)

(declare-fun -!1272 (ListLongMap!16225 (_ BitVec 64)) ListLongMap!16225)

(assert (=> b!1143908 (= e!650713 (= call!51860 (-!1272 call!51863 k!934)))))

(declare-fun b!1143909 () Bool)

(assert (=> b!1143909 (= e!650726 tp_is_empty!28723)))

(declare-fun b!1143910 () Bool)

(declare-fun res!762017 () Bool)

(assert (=> b!1143910 (=> (not res!762017) (not e!650717))))

(declare-datatypes ((List!25009 0))(
  ( (Nil!25006) (Cons!25005 (h!26214 (_ BitVec 64)) (t!36194 List!25009)) )
))
(declare-fun arrayNoDuplicates!0 (array!74301 (_ BitVec 32) List!25009) Bool)

(assert (=> b!1143910 (= res!762017 (arrayNoDuplicates!0 lt!510271 #b00000000000000000000000000000000 Nil!25006))))

(declare-fun b!1143911 () Bool)

(assert (=> b!1143911 (= e!650725 (and e!650722 mapRes!44909))))

(declare-fun condMapEmpty!44909 () Bool)

(declare-fun mapDefault!44909 () ValueCell!13652)

