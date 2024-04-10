; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98804 () Bool)

(assert start!98804)

(declare-fun b_free!24409 () Bool)

(declare-fun b_next!24409 () Bool)

(assert (=> start!98804 (= b_free!24409 (not b_next!24409))))

(declare-fun tp!85938 () Bool)

(declare-fun b_and!39667 () Bool)

(assert (=> start!98804 (= tp!85938 b_and!39667)))

(declare-fun b!1153826 () Bool)

(declare-fun c!114544 () Bool)

(declare-fun lt!517240 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1153826 (= c!114544 (and (not lt!517240) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37977 0))(
  ( (Unit!37978) )
))
(declare-fun e!656229 () Unit!37977)

(declare-fun e!656217 () Unit!37977)

(assert (=> b!1153826 (= e!656229 e!656217)))

(declare-fun b!1153827 () Bool)

(declare-fun call!54452 () Bool)

(assert (=> b!1153827 call!54452))

(declare-fun lt!517251 () Unit!37977)

(declare-fun call!54455 () Unit!37977)

(assert (=> b!1153827 (= lt!517251 call!54455)))

(declare-fun e!656213 () Unit!37977)

(assert (=> b!1153827 (= e!656213 lt!517251)))

(declare-fun b!1153828 () Bool)

(declare-datatypes ((V!43713 0))(
  ( (V!43714 (val!14526 Int)) )
))
(declare-datatypes ((tuple2!18460 0))(
  ( (tuple2!18461 (_1!9241 (_ BitVec 64)) (_2!9241 V!43713)) )
))
(declare-datatypes ((List!25204 0))(
  ( (Nil!25201) (Cons!25200 (h!26409 tuple2!18460) (t!36605 List!25204)) )
))
(declare-datatypes ((ListLongMap!16429 0))(
  ( (ListLongMap!16430 (toList!8230 List!25204)) )
))
(declare-fun lt!517244 () ListLongMap!16429)

(declare-fun minValue!944 () V!43713)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6744 (ListLongMap!16429 (_ BitVec 64)) Bool)

(declare-fun +!3643 (ListLongMap!16429 tuple2!18460) ListLongMap!16429)

(assert (=> b!1153828 (contains!6744 (+!3643 lt!517244 (tuple2!18461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!517241 () Unit!37977)

(declare-fun call!54453 () Unit!37977)

(assert (=> b!1153828 (= lt!517241 call!54453)))

(declare-fun call!54457 () Bool)

(assert (=> b!1153828 call!54457))

(declare-fun call!54454 () ListLongMap!16429)

(assert (=> b!1153828 (= lt!517244 call!54454)))

(declare-fun zeroValue!944 () V!43713)

(declare-fun lt!517249 () ListLongMap!16429)

(declare-fun lt!517247 () Unit!37977)

(declare-fun addStillContains!889 (ListLongMap!16429 (_ BitVec 64) V!43713 (_ BitVec 64)) Unit!37977)

(assert (=> b!1153828 (= lt!517247 (addStillContains!889 lt!517249 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1153828 (= e!656229 lt!517241)))

(declare-fun bm!54447 () Bool)

(assert (=> bm!54447 (= call!54452 call!54457)))

(declare-fun bm!54448 () Bool)

(declare-datatypes ((array!74725 0))(
  ( (array!74726 (arr!36013 (Array (_ BitVec 32) (_ BitVec 64))) (size!36549 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74725)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13760 0))(
  ( (ValueCellFull!13760 (v!17163 V!43713)) (EmptyCell!13760) )
))
(declare-datatypes ((array!74727 0))(
  ( (array!74728 (arr!36014 (Array (_ BitVec 32) ValueCell!13760)) (size!36550 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74727)

(declare-fun call!54450 () ListLongMap!16429)

(declare-fun getCurrentListMapNoExtraKeys!4699 (array!74725 array!74727 (_ BitVec 32) (_ BitVec 32) V!43713 V!43713 (_ BitVec 32) Int) ListLongMap!16429)

(assert (=> bm!54448 (= call!54450 (getCurrentListMapNoExtraKeys!4699 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153829 () Bool)

(declare-fun e!656220 () Unit!37977)

(declare-fun Unit!37979 () Unit!37977)

(assert (=> b!1153829 (= e!656220 Unit!37979)))

(declare-fun b!1153830 () Bool)

(declare-fun e!656221 () Bool)

(declare-fun e!656226 () Bool)

(assert (=> b!1153830 (= e!656221 (not e!656226))))

(declare-fun res!766879 () Bool)

(assert (=> b!1153830 (=> res!766879 e!656226)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153830 (= res!766879 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153830 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!517250 () Unit!37977)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74725 (_ BitVec 64) (_ BitVec 32)) Unit!37977)

(assert (=> b!1153830 (= lt!517250 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1153831 () Bool)

(declare-fun res!766882 () Bool)

(declare-fun e!656222 () Bool)

(assert (=> b!1153831 (=> (not res!766882) (not e!656222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1153831 (= res!766882 (validKeyInArray!0 k!934))))

(declare-fun b!1153832 () Bool)

(declare-fun res!766872 () Bool)

(assert (=> b!1153832 (=> (not res!766872) (not e!656222))))

(assert (=> b!1153832 (= res!766872 (and (= (size!36550 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36549 _keys!1208) (size!36550 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1153833 () Bool)

(assert (=> b!1153833 (= e!656222 e!656221)))

(declare-fun res!766873 () Bool)

(assert (=> b!1153833 (=> (not res!766873) (not e!656221))))

(declare-fun lt!517245 () array!74725)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74725 (_ BitVec 32)) Bool)

(assert (=> b!1153833 (= res!766873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517245 mask!1564))))

(assert (=> b!1153833 (= lt!517245 (array!74726 (store (arr!36013 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36549 _keys!1208)))))

(declare-fun b!1153834 () Bool)

(declare-fun res!766871 () Bool)

(assert (=> b!1153834 (=> (not res!766871) (not e!656222))))

(declare-datatypes ((List!25205 0))(
  ( (Nil!25202) (Cons!25201 (h!26410 (_ BitVec 64)) (t!36606 List!25205)) )
))
(declare-fun arrayNoDuplicates!0 (array!74725 (_ BitVec 32) List!25205) Bool)

(assert (=> b!1153834 (= res!766871 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25202))))

(declare-fun b!1153835 () Bool)

(declare-fun res!766883 () Bool)

(assert (=> b!1153835 (=> (not res!766883) (not e!656221))))

(assert (=> b!1153835 (= res!766883 (arrayNoDuplicates!0 lt!517245 #b00000000000000000000000000000000 Nil!25202))))

(declare-fun b!1153836 () Bool)

(declare-fun res!766877 () Bool)

(assert (=> b!1153836 (=> (not res!766877) (not e!656222))))

(assert (=> b!1153836 (= res!766877 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36549 _keys!1208))))))

(declare-fun b!1153837 () Bool)

(declare-fun e!656223 () Bool)

(declare-fun tp_is_empty!28939 () Bool)

(assert (=> b!1153837 (= e!656223 tp_is_empty!28939)))

(declare-fun bm!54449 () Bool)

(assert (=> bm!54449 (= call!54455 call!54453)))

(declare-fun e!656214 () Bool)

(declare-fun b!1153838 () Bool)

(assert (=> b!1153838 (= e!656214 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153839 () Bool)

(declare-fun e!656228 () Bool)

(declare-fun e!656219 () Bool)

(declare-fun mapRes!45233 () Bool)

(assert (=> b!1153839 (= e!656228 (and e!656219 mapRes!45233))))

(declare-fun condMapEmpty!45233 () Bool)

(declare-fun mapDefault!45233 () ValueCell!13760)

