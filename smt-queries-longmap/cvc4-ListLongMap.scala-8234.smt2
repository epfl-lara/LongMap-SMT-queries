; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100316 () Bool)

(assert start!100316)

(declare-fun b_free!25703 () Bool)

(declare-fun b_next!25703 () Bool)

(assert (=> start!100316 (= b_free!25703 (not b_next!25703))))

(declare-fun tp!90057 () Bool)

(declare-fun b_and!42273 () Bool)

(assert (=> start!100316 (= tp!90057 b_and!42273)))

(declare-fun b!1197163 () Bool)

(declare-fun e!680119 () Bool)

(declare-fun e!680115 () Bool)

(assert (=> b!1197163 (= e!680119 e!680115)))

(declare-fun res!796729 () Bool)

(assert (=> b!1197163 (=> (not res!796729) (not e!680115))))

(declare-datatypes ((array!77545 0))(
  ( (array!77546 (arr!37419 (Array (_ BitVec 32) (_ BitVec 64))) (size!37955 (_ BitVec 32))) )
))
(declare-fun lt!543210 () array!77545)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77545 (_ BitVec 32)) Bool)

(assert (=> b!1197163 (= res!796729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543210 mask!1564))))

(declare-fun _keys!1208 () array!77545)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1197163 (= lt!543210 (array!77546 (store (arr!37419 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37955 _keys!1208)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!45637 0))(
  ( (V!45638 (val!15248 Int)) )
))
(declare-datatypes ((tuple2!19518 0))(
  ( (tuple2!19519 (_1!9770 (_ BitVec 64)) (_2!9770 V!45637)) )
))
(declare-datatypes ((List!26327 0))(
  ( (Nil!26324) (Cons!26323 (h!27532 tuple2!19518) (t!39022 List!26327)) )
))
(declare-datatypes ((ListLongMap!17487 0))(
  ( (ListLongMap!17488 (toList!8759 List!26327)) )
))
(declare-fun call!57230 () ListLongMap!17487)

(declare-datatypes ((ValueCell!14482 0))(
  ( (ValueCellFull!14482 (v!17886 V!45637)) (EmptyCell!14482) )
))
(declare-datatypes ((array!77547 0))(
  ( (array!77548 (arr!37420 (Array (_ BitVec 32) ValueCell!14482)) (size!37956 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77547)

(declare-fun minValue!944 () V!45637)

(declare-fun zeroValue!944 () V!45637)

(declare-fun bm!57227 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5199 (array!77545 array!77547 (_ BitVec 32) (_ BitVec 32) V!45637 V!45637 (_ BitVec 32) Int) ListLongMap!17487)

(assert (=> bm!57227 (= call!57230 (getCurrentListMapNoExtraKeys!5199 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197164 () Bool)

(declare-fun res!796725 () Bool)

(assert (=> b!1197164 (=> (not res!796725) (not e!680119))))

(declare-datatypes ((List!26328 0))(
  ( (Nil!26325) (Cons!26324 (h!27533 (_ BitVec 64)) (t!39023 List!26328)) )
))
(declare-fun arrayNoDuplicates!0 (array!77545 (_ BitVec 32) List!26328) Bool)

(assert (=> b!1197164 (= res!796725 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26325))))

(declare-fun b!1197165 () Bool)

(declare-fun e!680118 () Bool)

(declare-fun call!57231 () ListLongMap!17487)

(assert (=> b!1197165 (= e!680118 (= call!57231 call!57230))))

(declare-fun b!1197166 () Bool)

(declare-fun e!680112 () Bool)

(declare-fun tp_is_empty!30383 () Bool)

(assert (=> b!1197166 (= e!680112 tp_is_empty!30383)))

(declare-fun b!1197167 () Bool)

(declare-fun res!796727 () Bool)

(assert (=> b!1197167 (=> (not res!796727) (not e!680115))))

(assert (=> b!1197167 (= res!796727 (arrayNoDuplicates!0 lt!543210 #b00000000000000000000000000000000 Nil!26325))))

(declare-fun b!1197168 () Bool)

(declare-fun e!680113 () Bool)

(assert (=> b!1197168 (= e!680115 (not e!680113))))

(declare-fun res!796723 () Bool)

(assert (=> b!1197168 (=> res!796723 e!680113)))

(assert (=> b!1197168 (= res!796723 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37955 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197168 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39698 0))(
  ( (Unit!39699) )
))
(declare-fun lt!543209 () Unit!39698)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77545 (_ BitVec 64) (_ BitVec 32)) Unit!39698)

(assert (=> b!1197168 (= lt!543209 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!47411 () Bool)

(declare-fun mapRes!47411 () Bool)

(declare-fun tp!90056 () Bool)

(declare-fun e!680114 () Bool)

(assert (=> mapNonEmpty!47411 (= mapRes!47411 (and tp!90056 e!680114))))

(declare-fun mapValue!47411 () ValueCell!14482)

(declare-fun mapKey!47411 () (_ BitVec 32))

(declare-fun mapRest!47411 () (Array (_ BitVec 32) ValueCell!14482))

(assert (=> mapNonEmpty!47411 (= (arr!37420 _values!996) (store mapRest!47411 mapKey!47411 mapValue!47411))))

(declare-fun res!796726 () Bool)

(assert (=> start!100316 (=> (not res!796726) (not e!680119))))

(assert (=> start!100316 (= res!796726 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37955 _keys!1208))))))

(assert (=> start!100316 e!680119))

(assert (=> start!100316 tp_is_empty!30383))

(declare-fun array_inv!28518 (array!77545) Bool)

(assert (=> start!100316 (array_inv!28518 _keys!1208)))

(assert (=> start!100316 true))

(assert (=> start!100316 tp!90057))

(declare-fun e!680117 () Bool)

(declare-fun array_inv!28519 (array!77547) Bool)

(assert (=> start!100316 (and (array_inv!28519 _values!996) e!680117)))

(declare-fun b!1197169 () Bool)

(declare-fun res!796731 () Bool)

(assert (=> b!1197169 (=> (not res!796731) (not e!680119))))

(assert (=> b!1197169 (= res!796731 (and (= (size!37956 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37955 _keys!1208) (size!37956 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47411 () Bool)

(assert (=> mapIsEmpty!47411 mapRes!47411))

(declare-fun b!1197170 () Bool)

(declare-fun res!796732 () Bool)

(assert (=> b!1197170 (=> (not res!796732) (not e!680119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197170 (= res!796732 (validMask!0 mask!1564))))

(declare-fun b!1197171 () Bool)

(declare-fun -!1777 (ListLongMap!17487 (_ BitVec 64)) ListLongMap!17487)

(assert (=> b!1197171 (= e!680118 (= call!57231 (-!1777 call!57230 k!934)))))

(declare-fun bm!57228 () Bool)

(declare-fun dynLambda!3124 (Int (_ BitVec 64)) V!45637)

(assert (=> bm!57228 (= call!57231 (getCurrentListMapNoExtraKeys!5199 lt!543210 (array!77548 (store (arr!37420 _values!996) i!673 (ValueCellFull!14482 (dynLambda!3124 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37956 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197172 () Bool)

(declare-fun res!796728 () Bool)

(assert (=> b!1197172 (=> (not res!796728) (not e!680119))))

(assert (=> b!1197172 (= res!796728 (= (select (arr!37419 _keys!1208) i!673) k!934))))

(declare-fun b!1197173 () Bool)

(assert (=> b!1197173 (= e!680117 (and e!680112 mapRes!47411))))

(declare-fun condMapEmpty!47411 () Bool)

(declare-fun mapDefault!47411 () ValueCell!14482)

