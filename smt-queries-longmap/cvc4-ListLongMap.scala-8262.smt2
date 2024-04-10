; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100524 () Bool)

(assert start!100524)

(declare-fun b_free!25847 () Bool)

(declare-fun b_next!25847 () Bool)

(assert (=> start!100524 (= b_free!25847 (not b_next!25847))))

(declare-fun tp!90530 () Bool)

(declare-fun b_and!42581 () Bool)

(assert (=> start!100524 (= tp!90530 b_and!42581)))

(declare-fun res!799655 () Bool)

(declare-fun e!682145 () Bool)

(assert (=> start!100524 (=> (not res!799655) (not e!682145))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77875 0))(
  ( (array!77876 (arr!37582 (Array (_ BitVec 32) (_ BitVec 64))) (size!38118 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77875)

(assert (=> start!100524 (= res!799655 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38118 _keys!1208))))))

(assert (=> start!100524 e!682145))

(declare-fun tp_is_empty!30551 () Bool)

(assert (=> start!100524 tp_is_empty!30551))

(declare-fun array_inv!28642 (array!77875) Bool)

(assert (=> start!100524 (array_inv!28642 _keys!1208)))

(assert (=> start!100524 true))

(assert (=> start!100524 tp!90530))

(declare-datatypes ((V!45861 0))(
  ( (V!45862 (val!15332 Int)) )
))
(declare-datatypes ((ValueCell!14566 0))(
  ( (ValueCellFull!14566 (v!17970 V!45861)) (EmptyCell!14566) )
))
(declare-datatypes ((array!77877 0))(
  ( (array!77878 (arr!37583 (Array (_ BitVec 32) ValueCell!14566)) (size!38119 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77877)

(declare-fun e!682147 () Bool)

(declare-fun array_inv!28643 (array!77877) Bool)

(assert (=> start!100524 (and (array_inv!28643 _values!996) e!682147)))

(declare-fun zeroValue!944 () V!45861)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!57367 () Bool)

(declare-datatypes ((tuple2!19636 0))(
  ( (tuple2!19637 (_1!9829 (_ BitVec 64)) (_2!9829 V!45861)) )
))
(declare-datatypes ((List!26454 0))(
  ( (Nil!26451) (Cons!26450 (h!27659 tuple2!19636) (t!39281 List!26454)) )
))
(declare-datatypes ((ListLongMap!17605 0))(
  ( (ListLongMap!17606 (toList!8818 List!26454)) )
))
(declare-fun call!57371 () ListLongMap!17605)

(declare-fun minValue!944 () V!45861)

(declare-fun getCurrentListMapNoExtraKeys!5257 (array!77875 array!77877 (_ BitVec 32) (_ BitVec 32) V!45861 V!45861 (_ BitVec 32) Int) ListLongMap!17605)

(assert (=> bm!57367 (= call!57371 (getCurrentListMapNoExtraKeys!5257 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201221 () Bool)

(declare-fun e!682142 () Bool)

(assert (=> b!1201221 (= e!682142 tp_is_empty!30551)))

(declare-fun mapIsEmpty!47669 () Bool)

(declare-fun mapRes!47669 () Bool)

(assert (=> mapIsEmpty!47669 mapRes!47669))

(declare-fun b!1201222 () Bool)

(declare-fun e!682139 () Bool)

(declare-fun e!682140 () Bool)

(assert (=> b!1201222 (= e!682139 (not e!682140))))

(declare-fun res!799652 () Bool)

(assert (=> b!1201222 (=> res!799652 e!682140)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201222 (= res!799652 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201222 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39824 0))(
  ( (Unit!39825) )
))
(declare-fun lt!544342 () Unit!39824)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77875 (_ BitVec 64) (_ BitVec 32)) Unit!39824)

(assert (=> b!1201222 (= lt!544342 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1201223 () Bool)

(declare-fun res!799657 () Bool)

(assert (=> b!1201223 (=> (not res!799657) (not e!682145))))

(assert (=> b!1201223 (= res!799657 (= (select (arr!37582 _keys!1208) i!673) k!934))))

(declare-fun b!1201224 () Bool)

(declare-fun res!799662 () Bool)

(assert (=> b!1201224 (=> (not res!799662) (not e!682145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77875 (_ BitVec 32)) Bool)

(assert (=> b!1201224 (= res!799662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!57368 () Bool)

(declare-fun lt!544340 () array!77875)

(declare-fun call!57370 () ListLongMap!17605)

(declare-fun lt!544339 () array!77877)

(assert (=> bm!57368 (= call!57370 (getCurrentListMapNoExtraKeys!5257 lt!544340 lt!544339 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201225 () Bool)

(declare-fun e!682144 () Bool)

(declare-fun e!682143 () Bool)

(assert (=> b!1201225 (= e!682144 e!682143)))

(declare-fun res!799654 () Bool)

(assert (=> b!1201225 (=> res!799654 e!682143)))

(assert (=> b!1201225 (= res!799654 (not (= (select (arr!37582 _keys!1208) from!1455) k!934)))))

(declare-fun e!682138 () Bool)

(assert (=> b!1201225 e!682138))

(declare-fun c!117482 () Bool)

(assert (=> b!1201225 (= c!117482 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544338 () Unit!39824)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!997 (array!77875 array!77877 (_ BitVec 32) (_ BitVec 32) V!45861 V!45861 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39824)

(assert (=> b!1201225 (= lt!544338 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!997 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47669 () Bool)

(declare-fun tp!90531 () Bool)

(assert (=> mapNonEmpty!47669 (= mapRes!47669 (and tp!90531 e!682142))))

(declare-fun mapKey!47669 () (_ BitVec 32))

(declare-fun mapValue!47669 () ValueCell!14566)

(declare-fun mapRest!47669 () (Array (_ BitVec 32) ValueCell!14566))

(assert (=> mapNonEmpty!47669 (= (arr!37583 _values!996) (store mapRest!47669 mapKey!47669 mapValue!47669))))

(declare-fun b!1201226 () Bool)

(declare-fun e!682146 () Bool)

(assert (=> b!1201226 (= e!682146 tp_is_empty!30551)))

(declare-fun b!1201227 () Bool)

(assert (=> b!1201227 (= e!682143 true)))

(declare-fun lt!544337 () Bool)

(declare-fun contains!6876 (ListLongMap!17605 (_ BitVec 64)) Bool)

(assert (=> b!1201227 (= lt!544337 (contains!6876 (getCurrentListMapNoExtraKeys!5257 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1201228 () Bool)

(declare-fun -!1791 (ListLongMap!17605 (_ BitVec 64)) ListLongMap!17605)

(assert (=> b!1201228 (= e!682138 (= call!57370 (-!1791 call!57371 k!934)))))

(declare-fun b!1201229 () Bool)

(declare-fun res!799656 () Bool)

(assert (=> b!1201229 (=> (not res!799656) (not e!682145))))

(declare-datatypes ((List!26455 0))(
  ( (Nil!26452) (Cons!26451 (h!27660 (_ BitVec 64)) (t!39282 List!26455)) )
))
(declare-fun arrayNoDuplicates!0 (array!77875 (_ BitVec 32) List!26455) Bool)

(assert (=> b!1201229 (= res!799656 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26452))))

(declare-fun b!1201230 () Bool)

(declare-fun res!799660 () Bool)

(assert (=> b!1201230 (=> (not res!799660) (not e!682139))))

(assert (=> b!1201230 (= res!799660 (arrayNoDuplicates!0 lt!544340 #b00000000000000000000000000000000 Nil!26452))))

(declare-fun b!1201231 () Bool)

(declare-fun res!799661 () Bool)

(assert (=> b!1201231 (=> (not res!799661) (not e!682145))))

(assert (=> b!1201231 (= res!799661 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38118 _keys!1208))))))

(declare-fun b!1201232 () Bool)

(assert (=> b!1201232 (= e!682140 e!682144)))

(declare-fun res!799651 () Bool)

(assert (=> b!1201232 (=> res!799651 e!682144)))

(assert (=> b!1201232 (= res!799651 (not (= from!1455 i!673)))))

(declare-fun lt!544341 () ListLongMap!17605)

(assert (=> b!1201232 (= lt!544341 (getCurrentListMapNoExtraKeys!5257 lt!544340 lt!544339 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3174 (Int (_ BitVec 64)) V!45861)

(assert (=> b!1201232 (= lt!544339 (array!77878 (store (arr!37583 _values!996) i!673 (ValueCellFull!14566 (dynLambda!3174 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38119 _values!996)))))

(declare-fun lt!544336 () ListLongMap!17605)

(assert (=> b!1201232 (= lt!544336 (getCurrentListMapNoExtraKeys!5257 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201233 () Bool)

(declare-fun res!799659 () Bool)

(assert (=> b!1201233 (=> (not res!799659) (not e!682145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201233 (= res!799659 (validMask!0 mask!1564))))

(declare-fun b!1201234 () Bool)

(declare-fun res!799653 () Bool)

(assert (=> b!1201234 (=> (not res!799653) (not e!682145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201234 (= res!799653 (validKeyInArray!0 k!934))))

(declare-fun b!1201235 () Bool)

(assert (=> b!1201235 (= e!682147 (and e!682146 mapRes!47669))))

(declare-fun condMapEmpty!47669 () Bool)

(declare-fun mapDefault!47669 () ValueCell!14566)

