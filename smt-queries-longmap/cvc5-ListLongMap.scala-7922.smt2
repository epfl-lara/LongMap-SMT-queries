; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98372 () Bool)

(assert start!98372)

(declare-fun b_free!23977 () Bool)

(declare-fun b_next!23977 () Bool)

(assert (=> start!98372 (= b_free!23977 (not b_next!23977))))

(declare-fun tp!84641 () Bool)

(declare-fun b_and!38803 () Bool)

(assert (=> start!98372 (= tp!84641 b_and!38803)))

(declare-fun b!1134127 () Bool)

(declare-fun res!757175 () Bool)

(declare-fun e!645461 () Bool)

(assert (=> b!1134127 (=> res!757175 e!645461)))

(declare-datatypes ((List!24811 0))(
  ( (Nil!24808) (Cons!24807 (h!26016 (_ BitVec 64)) (t!35780 List!24811)) )
))
(declare-fun contains!6549 (List!24811 (_ BitVec 64)) Bool)

(assert (=> b!1134127 (= res!757175 (contains!6549 Nil!24808 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134128 () Bool)

(declare-fun res!757171 () Bool)

(assert (=> b!1134128 (=> res!757171 e!645461)))

(declare-fun noDuplicate!1590 (List!24811) Bool)

(assert (=> b!1134128 (= res!757171 (not (noDuplicate!1590 Nil!24808)))))

(declare-fun b!1134129 () Bool)

(declare-datatypes ((Unit!37160 0))(
  ( (Unit!37161) )
))
(declare-fun e!645453 () Unit!37160)

(declare-fun lt!504055 () Unit!37160)

(assert (=> b!1134129 (= e!645453 lt!504055)))

(declare-fun call!49270 () Unit!37160)

(assert (=> b!1134129 (= lt!504055 call!49270)))

(declare-fun call!49266 () Bool)

(assert (=> b!1134129 call!49266))

(declare-fun b!1134130 () Bool)

(declare-fun res!757178 () Bool)

(declare-fun e!645452 () Bool)

(assert (=> b!1134130 (=> (not res!757178) (not e!645452))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134130 (= res!757178 (validMask!0 mask!1564))))

(declare-fun b!1134131 () Bool)

(declare-fun res!757169 () Bool)

(declare-fun e!645459 () Bool)

(assert (=> b!1134131 (=> (not res!757169) (not e!645459))))

(declare-datatypes ((array!73875 0))(
  ( (array!73876 (arr!35588 (Array (_ BitVec 32) (_ BitVec 64))) (size!36124 (_ BitVec 32))) )
))
(declare-fun lt!504046 () array!73875)

(declare-fun arrayNoDuplicates!0 (array!73875 (_ BitVec 32) List!24811) Bool)

(assert (=> b!1134131 (= res!757169 (arrayNoDuplicates!0 lt!504046 #b00000000000000000000000000000000 Nil!24808))))

(declare-datatypes ((V!43137 0))(
  ( (V!43138 (val!14310 Int)) )
))
(declare-fun zeroValue!944 () V!43137)

(declare-fun _keys!1208 () array!73875)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18052 0))(
  ( (tuple2!18053 (_1!9037 (_ BitVec 64)) (_2!9037 V!43137)) )
))
(declare-datatypes ((List!24812 0))(
  ( (Nil!24809) (Cons!24808 (h!26017 tuple2!18052) (t!35781 List!24812)) )
))
(declare-datatypes ((ListLongMap!16021 0))(
  ( (ListLongMap!16022 (toList!8026 List!24812)) )
))
(declare-fun call!49273 () ListLongMap!16021)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13544 0))(
  ( (ValueCellFull!13544 (v!16947 V!43137)) (EmptyCell!13544) )
))
(declare-datatypes ((array!73877 0))(
  ( (array!73878 (arr!35589 (Array (_ BitVec 32) ValueCell!13544)) (size!36125 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73877)

(declare-fun minValue!944 () V!43137)

(declare-fun bm!49263 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4512 (array!73875 array!73877 (_ BitVec 32) (_ BitVec 32) V!43137 V!43137 (_ BitVec 32) Int) ListLongMap!16021)

(assert (=> bm!49263 (= call!49273 (getCurrentListMapNoExtraKeys!4512 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!49268 () ListLongMap!16021)

(declare-fun bm!49264 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!504050 () ListLongMap!16021)

(declare-fun c!110734 () Bool)

(declare-fun call!49269 () Bool)

(declare-fun contains!6550 (ListLongMap!16021 (_ BitVec 64)) Bool)

(assert (=> bm!49264 (= call!49269 (contains!6550 (ite c!110734 lt!504050 call!49268) k!934))))

(declare-fun mapNonEmpty!44585 () Bool)

(declare-fun mapRes!44585 () Bool)

(declare-fun tp!84642 () Bool)

(declare-fun e!645465 () Bool)

(assert (=> mapNonEmpty!44585 (= mapRes!44585 (and tp!84642 e!645465))))

(declare-fun mapValue!44585 () ValueCell!13544)

(declare-fun mapKey!44585 () (_ BitVec 32))

(declare-fun mapRest!44585 () (Array (_ BitVec 32) ValueCell!13544))

(assert (=> mapNonEmpty!44585 (= (arr!35589 _values!996) (store mapRest!44585 mapKey!44585 mapValue!44585))))

(declare-fun b!1134132 () Bool)

(declare-fun c!110732 () Bool)

(declare-fun lt!504049 () Bool)

(assert (=> b!1134132 (= c!110732 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504049))))

(declare-fun e!645450 () Unit!37160)

(assert (=> b!1134132 (= e!645450 e!645453)))

(declare-fun b!1134133 () Bool)

(declare-fun res!757173 () Bool)

(assert (=> b!1134133 (=> (not res!757173) (not e!645452))))

(assert (=> b!1134133 (= res!757173 (and (= (size!36125 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36124 _keys!1208) (size!36125 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1134134 () Bool)

(declare-fun e!645455 () Bool)

(declare-fun e!645456 () Bool)

(assert (=> b!1134134 (= e!645455 e!645456)))

(declare-fun res!757164 () Bool)

(assert (=> b!1134134 (=> res!757164 e!645456)))

(assert (=> b!1134134 (= res!757164 (not (= (select (arr!35588 _keys!1208) from!1455) k!934)))))

(declare-fun e!645454 () Bool)

(assert (=> b!1134134 e!645454))

(declare-fun c!110733 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134134 (= c!110733 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504060 () Unit!37160)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!443 (array!73875 array!73877 (_ BitVec 32) (_ BitVec 32) V!43137 V!43137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37160)

(assert (=> b!1134134 (= lt!504060 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!645464 () Bool)

(declare-fun b!1134135 () Bool)

(declare-fun arrayContainsKey!0 (array!73875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134135 (= e!645464 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!504047 () array!73877)

(declare-fun call!49267 () ListLongMap!16021)

(declare-fun bm!49265 () Bool)

(assert (=> bm!49265 (= call!49267 (getCurrentListMapNoExtraKeys!4512 lt!504046 lt!504047 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49266 () Bool)

(assert (=> bm!49266 (= call!49266 call!49269)))

(declare-fun b!1134136 () Bool)

(declare-fun e!645457 () Bool)

(assert (=> b!1134136 (= e!645457 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134137 () Bool)

(declare-fun res!757176 () Bool)

(assert (=> b!1134137 (=> (not res!757176) (not e!645452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73875 (_ BitVec 32)) Bool)

(assert (=> b!1134137 (= res!757176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1134138 () Bool)

(declare-fun Unit!37162 () Unit!37160)

(assert (=> b!1134138 (= e!645453 Unit!37162)))

(declare-fun b!1134139 () Bool)

(declare-fun e!645449 () Unit!37160)

(assert (=> b!1134139 (= e!645449 e!645450)))

(declare-fun c!110731 () Bool)

(assert (=> b!1134139 (= c!110731 (and (not lt!504049) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1134140 () Bool)

(declare-fun e!645458 () Bool)

(assert (=> b!1134140 (= e!645456 e!645458)))

(declare-fun res!757170 () Bool)

(assert (=> b!1134140 (=> res!757170 e!645458)))

(declare-fun lt!504054 () ListLongMap!16021)

(assert (=> b!1134140 (= res!757170 (not (contains!6550 lt!504054 k!934)))))

(assert (=> b!1134140 (= lt!504054 (getCurrentListMapNoExtraKeys!4512 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134141 () Bool)

(declare-fun res!757172 () Bool)

(assert (=> b!1134141 (=> (not res!757172) (not e!645452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134141 (= res!757172 (validKeyInArray!0 k!934))))

(declare-fun call!49271 () ListLongMap!16021)

(declare-fun bm!49267 () Bool)

(declare-fun +!3466 (ListLongMap!16021 tuple2!18052) ListLongMap!16021)

(assert (=> bm!49267 (= call!49271 (+!3466 (ite c!110734 lt!504050 lt!504054) (ite c!110734 (tuple2!18053 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110731 (tuple2!18053 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18053 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun res!757168 () Bool)

(assert (=> start!98372 (=> (not res!757168) (not e!645452))))

(assert (=> start!98372 (= res!757168 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36124 _keys!1208))))))

(assert (=> start!98372 e!645452))

(declare-fun tp_is_empty!28507 () Bool)

(assert (=> start!98372 tp_is_empty!28507))

(declare-fun array_inv!27294 (array!73875) Bool)

(assert (=> start!98372 (array_inv!27294 _keys!1208)))

(assert (=> start!98372 true))

(assert (=> start!98372 tp!84641))

(declare-fun e!645460 () Bool)

(declare-fun array_inv!27295 (array!73877) Bool)

(assert (=> start!98372 (and (array_inv!27295 _values!996) e!645460)))

(declare-fun mapIsEmpty!44585 () Bool)

(assert (=> mapIsEmpty!44585 mapRes!44585))

(declare-fun b!1134142 () Bool)

(declare-fun res!757180 () Bool)

(assert (=> b!1134142 (=> (not res!757180) (not e!645452))))

(assert (=> b!1134142 (= res!757180 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24808))))

(declare-fun b!1134143 () Bool)

(assert (=> b!1134143 (= e!645464 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504049) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1134144 () Bool)

(assert (=> b!1134144 (= e!645465 tp_is_empty!28507)))

(declare-fun b!1134145 () Bool)

(declare-fun e!645463 () Bool)

(assert (=> b!1134145 (= e!645460 (and e!645463 mapRes!44585))))

(declare-fun condMapEmpty!44585 () Bool)

(declare-fun mapDefault!44585 () ValueCell!13544)

