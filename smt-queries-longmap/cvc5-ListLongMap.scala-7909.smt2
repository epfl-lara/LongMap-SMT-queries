; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98198 () Bool)

(assert start!98198)

(declare-fun b_free!23899 () Bool)

(declare-fun b_next!23899 () Bool)

(assert (=> start!98198 (= b_free!23899 (not b_next!23899))))

(declare-fun tp!84401 () Bool)

(declare-fun b_and!38581 () Bool)

(assert (=> start!98198 (= tp!84401 b_and!38581)))

(declare-datatypes ((V!43033 0))(
  ( (V!43034 (val!14271 Int)) )
))
(declare-datatypes ((tuple2!17976 0))(
  ( (tuple2!17977 (_1!8999 (_ BitVec 64)) (_2!8999 V!43033)) )
))
(declare-datatypes ((List!24740 0))(
  ( (Nil!24737) (Cons!24736 (h!25945 tuple2!17976) (t!35631 List!24740)) )
))
(declare-datatypes ((ListLongMap!15945 0))(
  ( (ListLongMap!15946 (toList!7988 List!24740)) )
))
(declare-fun call!48266 () ListLongMap!15945)

(declare-datatypes ((array!73715 0))(
  ( (array!73716 (arr!35510 (Array (_ BitVec 32) (_ BitVec 64))) (size!36046 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73715)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13505 0))(
  ( (ValueCellFull!13505 (v!16904 V!43033)) (EmptyCell!13505) )
))
(declare-datatypes ((array!73717 0))(
  ( (array!73718 (arr!35511 (Array (_ BitVec 32) ValueCell!13505)) (size!36047 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73717)

(declare-fun minValue!944 () V!43033)

(declare-fun zeroValue!944 () V!43033)

(declare-fun bm!48258 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4475 (array!73715 array!73717 (_ BitVec 32) (_ BitVec 32) V!43033 V!43033 (_ BitVec 32) Int) ListLongMap!15945)

(assert (=> bm!48258 (= call!48266 (getCurrentListMapNoExtraKeys!4475 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130156 () Bool)

(declare-datatypes ((Unit!37023 0))(
  ( (Unit!37024) )
))
(declare-fun e!643195 () Unit!37023)

(declare-fun lt!501833 () Unit!37023)

(assert (=> b!1130156 (= e!643195 lt!501833)))

(declare-fun lt!501832 () Unit!37023)

(declare-fun call!48262 () Unit!37023)

(assert (=> b!1130156 (= lt!501832 call!48262)))

(declare-fun lt!501830 () ListLongMap!15945)

(declare-fun lt!501829 () ListLongMap!15945)

(declare-fun +!3438 (ListLongMap!15945 tuple2!17976) ListLongMap!15945)

(assert (=> b!1130156 (= lt!501830 (+!3438 lt!501829 (tuple2!17977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!48264 () Bool)

(assert (=> b!1130156 call!48264))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun addStillContains!700 (ListLongMap!15945 (_ BitVec 64) V!43033 (_ BitVec 64)) Unit!37023)

(assert (=> b!1130156 (= lt!501833 (addStillContains!700 lt!501830 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!48263 () ListLongMap!15945)

(declare-fun contains!6511 (ListLongMap!15945 (_ BitVec 64)) Bool)

(assert (=> b!1130156 (contains!6511 call!48263 k!934)))

(declare-fun b!1130157 () Bool)

(declare-fun e!643186 () Unit!37023)

(declare-fun lt!501837 () Unit!37023)

(assert (=> b!1130157 (= e!643186 lt!501837)))

(declare-fun call!48261 () Unit!37023)

(assert (=> b!1130157 (= lt!501837 call!48261)))

(declare-fun call!48268 () Bool)

(assert (=> b!1130157 call!48268))

(declare-fun b!1130158 () Bool)

(assert (=> b!1130158 call!48268))

(declare-fun lt!501842 () Unit!37023)

(assert (=> b!1130158 (= lt!501842 call!48261)))

(declare-fun e!643183 () Unit!37023)

(assert (=> b!1130158 (= e!643183 lt!501842)))

(declare-fun b!1130159 () Bool)

(declare-fun c!109981 () Bool)

(declare-fun lt!501836 () Bool)

(assert (=> b!1130159 (= c!109981 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501836))))

(assert (=> b!1130159 (= e!643183 e!643186)))

(declare-fun bm!48259 () Bool)

(assert (=> bm!48259 (= call!48261 call!48262)))

(declare-fun b!1130160 () Bool)

(declare-fun e!643189 () Bool)

(declare-fun e!643196 () Bool)

(assert (=> b!1130160 (= e!643189 e!643196)))

(declare-fun res!755151 () Bool)

(assert (=> b!1130160 (=> res!755151 e!643196)))

(assert (=> b!1130160 (= res!755151 (not (contains!6511 lt!501829 k!934)))))

(assert (=> b!1130160 (= lt!501829 (getCurrentListMapNoExtraKeys!4475 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130161 () Bool)

(declare-fun res!755158 () Bool)

(declare-fun e!643191 () Bool)

(assert (=> b!1130161 (=> (not res!755158) (not e!643191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130161 (= res!755158 (validKeyInArray!0 k!934))))

(declare-fun bm!48260 () Bool)

(assert (=> bm!48260 (= call!48268 call!48264)))

(declare-fun b!1130162 () Bool)

(declare-fun res!755148 () Bool)

(assert (=> b!1130162 (=> (not res!755148) (not e!643191))))

(assert (=> b!1130162 (= res!755148 (and (= (size!36047 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36046 _keys!1208) (size!36047 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130163 () Bool)

(declare-fun e!643185 () Bool)

(declare-fun call!48267 () ListLongMap!15945)

(assert (=> b!1130163 (= e!643185 (= call!48267 call!48266))))

(declare-fun b!1130164 () Bool)

(declare-fun e!643193 () Bool)

(declare-fun tp_is_empty!28429 () Bool)

(assert (=> b!1130164 (= e!643193 tp_is_empty!28429)))

(declare-fun b!1130165 () Bool)

(declare-fun e!643194 () Bool)

(assert (=> b!1130165 (= e!643196 e!643194)))

(declare-fun res!755152 () Bool)

(assert (=> b!1130165 (=> res!755152 e!643194)))

(assert (=> b!1130165 (= res!755152 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36046 _keys!1208))))))

(declare-fun lt!501831 () Unit!37023)

(assert (=> b!1130165 (= lt!501831 e!643195)))

(declare-fun c!109980 () Bool)

(assert (=> b!1130165 (= c!109980 (and (not lt!501836) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130165 (= lt!501836 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1130166 () Bool)

(declare-fun res!755156 () Bool)

(assert (=> b!1130166 (=> (not res!755156) (not e!643191))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130166 (= res!755156 (= (select (arr!35510 _keys!1208) i!673) k!934))))

(declare-fun b!1130167 () Bool)

(declare-fun e!643197 () Bool)

(assert (=> b!1130167 (= e!643197 tp_is_empty!28429)))

(declare-fun b!1130168 () Bool)

(assert (=> b!1130168 (= e!643195 e!643183)))

(declare-fun c!109982 () Bool)

(assert (=> b!1130168 (= c!109982 (and (not lt!501836) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!44461 () Bool)

(declare-fun mapRes!44461 () Bool)

(declare-fun tp!84400 () Bool)

(assert (=> mapNonEmpty!44461 (= mapRes!44461 (and tp!84400 e!643193))))

(declare-fun mapRest!44461 () (Array (_ BitVec 32) ValueCell!13505))

(declare-fun mapKey!44461 () (_ BitVec 32))

(declare-fun mapValue!44461 () ValueCell!13505)

(assert (=> mapNonEmpty!44461 (= (arr!35511 _values!996) (store mapRest!44461 mapKey!44461 mapValue!44461))))

(declare-fun b!1130169 () Bool)

(declare-fun e!643187 () Bool)

(assert (=> b!1130169 (= e!643187 e!643189)))

(declare-fun res!755144 () Bool)

(assert (=> b!1130169 (=> res!755144 e!643189)))

(assert (=> b!1130169 (= res!755144 (not (= (select (arr!35510 _keys!1208) from!1455) k!934)))))

(assert (=> b!1130169 e!643185))

(declare-fun c!109983 () Bool)

(assert (=> b!1130169 (= c!109983 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501834 () Unit!37023)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!420 (array!73715 array!73717 (_ BitVec 32) (_ BitVec 32) V!43033 V!43033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37023)

(assert (=> b!1130169 (= lt!501834 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130170 () Bool)

(declare-fun res!755155 () Bool)

(assert (=> b!1130170 (=> (not res!755155) (not e!643191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130170 (= res!755155 (validMask!0 mask!1564))))

(declare-fun bm!48262 () Bool)

(declare-fun call!48265 () ListLongMap!15945)

(assert (=> bm!48262 (= call!48265 call!48263)))

(declare-fun b!1130171 () Bool)

(declare-fun e!643188 () Bool)

(assert (=> b!1130171 (= e!643191 e!643188)))

(declare-fun res!755146 () Bool)

(assert (=> b!1130171 (=> (not res!755146) (not e!643188))))

(declare-fun lt!501835 () array!73715)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73715 (_ BitVec 32)) Bool)

(assert (=> b!1130171 (= res!755146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501835 mask!1564))))

(assert (=> b!1130171 (= lt!501835 (array!73716 (store (arr!35510 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36046 _keys!1208)))))

(declare-fun b!1130172 () Bool)

(declare-fun e!643184 () Bool)

(assert (=> b!1130172 (= e!643188 (not e!643184))))

(declare-fun res!755147 () Bool)

(assert (=> b!1130172 (=> res!755147 e!643184)))

(assert (=> b!1130172 (= res!755147 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130172 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!501841 () Unit!37023)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73715 (_ BitVec 64) (_ BitVec 32)) Unit!37023)

(assert (=> b!1130172 (= lt!501841 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1130173 () Bool)

(assert (=> b!1130173 (= e!643184 e!643187)))

(declare-fun res!755157 () Bool)

(assert (=> b!1130173 (=> res!755157 e!643187)))

(assert (=> b!1130173 (= res!755157 (not (= from!1455 i!673)))))

(declare-fun lt!501828 () ListLongMap!15945)

(declare-fun lt!501840 () array!73717)

(assert (=> b!1130173 (= lt!501828 (getCurrentListMapNoExtraKeys!4475 lt!501835 lt!501840 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2551 (Int (_ BitVec 64)) V!43033)

(assert (=> b!1130173 (= lt!501840 (array!73718 (store (arr!35511 _values!996) i!673 (ValueCellFull!13505 (dynLambda!2551 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36047 _values!996)))))

(declare-fun lt!501838 () ListLongMap!15945)

(assert (=> b!1130173 (= lt!501838 (getCurrentListMapNoExtraKeys!4475 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130174 () Bool)

(declare-fun res!755150 () Bool)

(assert (=> b!1130174 (=> (not res!755150) (not e!643191))))

(assert (=> b!1130174 (= res!755150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130175 () Bool)

(declare-fun res!755153 () Bool)

(assert (=> b!1130175 (=> (not res!755153) (not e!643191))))

(assert (=> b!1130175 (= res!755153 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36046 _keys!1208))))))

(declare-fun b!1130176 () Bool)

(declare-fun -!1167 (ListLongMap!15945 (_ BitVec 64)) ListLongMap!15945)

(assert (=> b!1130176 (= e!643185 (= call!48267 (-!1167 call!48266 k!934)))))

(declare-fun b!1130177 () Bool)

(assert (=> b!1130177 (= e!643194 true)))

(declare-fun lt!501839 () Bool)

(declare-fun getCurrentListMap!4421 (array!73715 array!73717 (_ BitVec 32) (_ BitVec 32) V!43033 V!43033 (_ BitVec 32) Int) ListLongMap!15945)

(assert (=> b!1130177 (= lt!501839 (contains!6511 (getCurrentListMap!4421 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun bm!48263 () Bool)

(assert (=> bm!48263 (= call!48264 (contains!6511 (ite c!109980 lt!501830 call!48265) k!934))))

(declare-fun mapIsEmpty!44461 () Bool)

(assert (=> mapIsEmpty!44461 mapRes!44461))

(declare-fun b!1130178 () Bool)

(declare-fun res!755149 () Bool)

(assert (=> b!1130178 (=> (not res!755149) (not e!643191))))

(declare-datatypes ((List!24741 0))(
  ( (Nil!24738) (Cons!24737 (h!25946 (_ BitVec 64)) (t!35632 List!24741)) )
))
(declare-fun arrayNoDuplicates!0 (array!73715 (_ BitVec 32) List!24741) Bool)

(assert (=> b!1130178 (= res!755149 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24738))))

(declare-fun res!755154 () Bool)

(assert (=> start!98198 (=> (not res!755154) (not e!643191))))

(assert (=> start!98198 (= res!755154 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36046 _keys!1208))))))

(assert (=> start!98198 e!643191))

(assert (=> start!98198 tp_is_empty!28429))

(declare-fun array_inv!27240 (array!73715) Bool)

(assert (=> start!98198 (array_inv!27240 _keys!1208)))

(assert (=> start!98198 true))

(assert (=> start!98198 tp!84401))

(declare-fun e!643192 () Bool)

(declare-fun array_inv!27241 (array!73717) Bool)

(assert (=> start!98198 (and (array_inv!27241 _values!996) e!643192)))

(declare-fun bm!48261 () Bool)

(assert (=> bm!48261 (= call!48262 (addStillContains!700 lt!501829 (ite (or c!109980 c!109982) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!109980 c!109982) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1130179 () Bool)

(declare-fun Unit!37025 () Unit!37023)

(assert (=> b!1130179 (= e!643186 Unit!37025)))

(declare-fun b!1130180 () Bool)

(assert (=> b!1130180 (= e!643192 (and e!643197 mapRes!44461))))

(declare-fun condMapEmpty!44461 () Bool)

(declare-fun mapDefault!44461 () ValueCell!13505)

