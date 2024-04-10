; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99662 () Bool)

(assert start!99662)

(declare-fun b_free!25241 () Bool)

(declare-fun b_next!25241 () Bool)

(assert (=> start!99662 (= b_free!25241 (not b_next!25241))))

(declare-fun tp!88436 () Bool)

(declare-fun b_and!41349 () Bool)

(assert (=> start!99662 (= tp!88436 b_and!41349)))

(declare-fun b!1181757 () Bool)

(declare-fun e!671875 () Bool)

(declare-fun e!671870 () Bool)

(assert (=> b!1181757 (= e!671875 e!671870)))

(declare-fun res!785325 () Bool)

(assert (=> b!1181757 (=> res!785325 e!671870)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1181757 (= res!785325 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44821 0))(
  ( (V!44822 (val!14942 Int)) )
))
(declare-fun zeroValue!944 () V!44821)

(declare-datatypes ((tuple2!19144 0))(
  ( (tuple2!19145 (_1!9583 (_ BitVec 64)) (_2!9583 V!44821)) )
))
(declare-datatypes ((List!25884 0))(
  ( (Nil!25881) (Cons!25880 (h!27089 tuple2!19144) (t!38117 List!25884)) )
))
(declare-datatypes ((ListLongMap!17113 0))(
  ( (ListLongMap!17114 (toList!8572 List!25884)) )
))
(declare-fun lt!534631 () ListLongMap!17113)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!76345 0))(
  ( (array!76346 (arr!36822 (Array (_ BitVec 32) (_ BitVec 64))) (size!37358 (_ BitVec 32))) )
))
(declare-fun lt!534639 () array!76345)

(declare-fun minValue!944 () V!44821)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14176 0))(
  ( (ValueCellFull!14176 (v!17580 V!44821)) (EmptyCell!14176) )
))
(declare-datatypes ((array!76347 0))(
  ( (array!76348 (arr!36823 (Array (_ BitVec 32) ValueCell!14176)) (size!37359 (_ BitVec 32))) )
))
(declare-fun lt!534626 () array!76347)

(declare-fun getCurrentListMapNoExtraKeys!5025 (array!76345 array!76347 (_ BitVec 32) (_ BitVec 32) V!44821 V!44821 (_ BitVec 32) Int) ListLongMap!17113)

(assert (=> b!1181757 (= lt!534631 (getCurrentListMapNoExtraKeys!5025 lt!534639 lt!534626 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534637 () V!44821)

(declare-fun _values!996 () array!76347)

(assert (=> b!1181757 (= lt!534626 (array!76348 (store (arr!36823 _values!996) i!673 (ValueCellFull!14176 lt!534637)) (size!37359 _values!996)))))

(declare-fun dynLambda!2980 (Int (_ BitVec 64)) V!44821)

(assert (=> b!1181757 (= lt!534637 (dynLambda!2980 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76345)

(declare-fun lt!534638 () ListLongMap!17113)

(assert (=> b!1181757 (= lt!534638 (getCurrentListMapNoExtraKeys!5025 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181758 () Bool)

(declare-fun res!785337 () Bool)

(declare-fun e!671874 () Bool)

(assert (=> b!1181758 (=> (not res!785337) (not e!671874))))

(assert (=> b!1181758 (= res!785337 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37358 _keys!1208))))))

(declare-fun b!1181759 () Bool)

(declare-fun e!671876 () Bool)

(assert (=> b!1181759 (= e!671874 e!671876)))

(declare-fun res!785331 () Bool)

(assert (=> b!1181759 (=> (not res!785331) (not e!671876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76345 (_ BitVec 32)) Bool)

(assert (=> b!1181759 (= res!785331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534639 mask!1564))))

(assert (=> b!1181759 (= lt!534639 (array!76346 (store (arr!36822 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37358 _keys!1208)))))

(declare-fun b!1181761 () Bool)

(declare-fun res!785333 () Bool)

(assert (=> b!1181761 (=> (not res!785333) (not e!671874))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1181761 (= res!785333 (= (select (arr!36822 _keys!1208) i!673) k!934))))

(declare-fun b!1181762 () Bool)

(declare-datatypes ((Unit!39086 0))(
  ( (Unit!39087) )
))
(declare-fun e!671873 () Unit!39086)

(declare-fun Unit!39088 () Unit!39086)

(assert (=> b!1181762 (= e!671873 Unit!39088)))

(declare-fun lt!534625 () Unit!39086)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76345 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39086)

(assert (=> b!1181762 (= lt!534625 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181762 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534634 () Unit!39086)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76345 (_ BitVec 32) (_ BitVec 32)) Unit!39086)

(assert (=> b!1181762 (= lt!534634 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25885 0))(
  ( (Nil!25882) (Cons!25881 (h!27090 (_ BitVec 64)) (t!38118 List!25885)) )
))
(declare-fun arrayNoDuplicates!0 (array!76345 (_ BitVec 32) List!25885) Bool)

(assert (=> b!1181762 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25882)))

(declare-fun lt!534632 () Unit!39086)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76345 (_ BitVec 64) (_ BitVec 32) List!25885) Unit!39086)

(assert (=> b!1181762 (= lt!534632 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25882))))

(assert (=> b!1181762 false))

(declare-fun b!1181763 () Bool)

(declare-fun e!671877 () Bool)

(assert (=> b!1181763 (= e!671877 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1181764 () Bool)

(declare-fun e!671869 () Bool)

(declare-fun tp_is_empty!29771 () Bool)

(assert (=> b!1181764 (= e!671869 tp_is_empty!29771)))

(declare-fun b!1181765 () Bool)

(declare-fun e!671872 () Bool)

(assert (=> b!1181765 (= e!671872 e!671877)))

(declare-fun res!785326 () Bool)

(assert (=> b!1181765 (=> res!785326 e!671877)))

(assert (=> b!1181765 (= res!785326 (not (= (select (arr!36822 _keys!1208) from!1455) k!934)))))

(declare-fun b!1181766 () Bool)

(declare-fun res!785332 () Bool)

(assert (=> b!1181766 (=> (not res!785332) (not e!671874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181766 (= res!785332 (validKeyInArray!0 k!934))))

(declare-fun b!1181767 () Bool)

(declare-fun res!785336 () Bool)

(assert (=> b!1181767 (=> (not res!785336) (not e!671876))))

(assert (=> b!1181767 (= res!785336 (arrayNoDuplicates!0 lt!534639 #b00000000000000000000000000000000 Nil!25882))))

(declare-fun b!1181768 () Bool)

(declare-fun e!671878 () Bool)

(assert (=> b!1181768 (= e!671878 true)))

(declare-fun lt!534633 () ListLongMap!17113)

(declare-fun lt!534628 () ListLongMap!17113)

(declare-fun -!1611 (ListLongMap!17113 (_ BitVec 64)) ListLongMap!17113)

(assert (=> b!1181768 (= (-!1611 lt!534633 k!934) lt!534628)))

(declare-fun lt!534624 () Unit!39086)

(declare-fun lt!534627 () ListLongMap!17113)

(declare-fun lt!534622 () V!44821)

(declare-fun addRemoveCommutativeForDiffKeys!142 (ListLongMap!17113 (_ BitVec 64) V!44821 (_ BitVec 64)) Unit!39086)

(assert (=> b!1181768 (= lt!534624 (addRemoveCommutativeForDiffKeys!142 lt!534627 (select (arr!36822 _keys!1208) from!1455) lt!534622 k!934))))

(declare-fun lt!534630 () ListLongMap!17113)

(declare-fun lt!534635 () ListLongMap!17113)

(assert (=> b!1181768 (and (= lt!534638 lt!534633) (= lt!534635 lt!534630))))

(declare-fun lt!534629 () tuple2!19144)

(declare-fun +!3879 (ListLongMap!17113 tuple2!19144) ListLongMap!17113)

(assert (=> b!1181768 (= lt!534633 (+!3879 lt!534627 lt!534629))))

(assert (=> b!1181768 (not (= (select (arr!36822 _keys!1208) from!1455) k!934))))

(declare-fun lt!534621 () Unit!39086)

(assert (=> b!1181768 (= lt!534621 e!671873)))

(declare-fun c!116985 () Bool)

(assert (=> b!1181768 (= c!116985 (= (select (arr!36822 _keys!1208) from!1455) k!934))))

(assert (=> b!1181768 e!671872))

(declare-fun res!785335 () Bool)

(assert (=> b!1181768 (=> (not res!785335) (not e!671872))))

(assert (=> b!1181768 (= res!785335 (= lt!534631 lt!534628))))

(assert (=> b!1181768 (= lt!534628 (+!3879 lt!534635 lt!534629))))

(assert (=> b!1181768 (= lt!534629 (tuple2!19145 (select (arr!36822 _keys!1208) from!1455) lt!534622))))

(declare-fun get!18832 (ValueCell!14176 V!44821) V!44821)

(assert (=> b!1181768 (= lt!534622 (get!18832 (select (arr!36823 _values!996) from!1455) lt!534637))))

(declare-fun b!1181769 () Bool)

(declare-fun e!671867 () Bool)

(assert (=> b!1181769 (= e!671867 tp_is_empty!29771)))

(declare-fun b!1181770 () Bool)

(declare-fun Unit!39089 () Unit!39086)

(assert (=> b!1181770 (= e!671873 Unit!39089)))

(declare-fun mapNonEmpty!46484 () Bool)

(declare-fun mapRes!46484 () Bool)

(declare-fun tp!88437 () Bool)

(assert (=> mapNonEmpty!46484 (= mapRes!46484 (and tp!88437 e!671869))))

(declare-fun mapValue!46484 () ValueCell!14176)

(declare-fun mapKey!46484 () (_ BitVec 32))

(declare-fun mapRest!46484 () (Array (_ BitVec 32) ValueCell!14176))

(assert (=> mapNonEmpty!46484 (= (arr!36823 _values!996) (store mapRest!46484 mapKey!46484 mapValue!46484))))

(declare-fun b!1181771 () Bool)

(declare-fun res!785334 () Bool)

(assert (=> b!1181771 (=> (not res!785334) (not e!671874))))

(assert (=> b!1181771 (= res!785334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181760 () Bool)

(declare-fun res!785338 () Bool)

(assert (=> b!1181760 (=> (not res!785338) (not e!671874))))

(assert (=> b!1181760 (= res!785338 (and (= (size!37359 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37358 _keys!1208) (size!37359 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!785324 () Bool)

(assert (=> start!99662 (=> (not res!785324) (not e!671874))))

(assert (=> start!99662 (= res!785324 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37358 _keys!1208))))))

(assert (=> start!99662 e!671874))

(assert (=> start!99662 tp_is_empty!29771))

(declare-fun array_inv!28114 (array!76345) Bool)

(assert (=> start!99662 (array_inv!28114 _keys!1208)))

(assert (=> start!99662 true))

(assert (=> start!99662 tp!88436))

(declare-fun e!671868 () Bool)

(declare-fun array_inv!28115 (array!76347) Bool)

(assert (=> start!99662 (and (array_inv!28115 _values!996) e!671868)))

(declare-fun b!1181772 () Bool)

(declare-fun res!785327 () Bool)

(assert (=> b!1181772 (=> (not res!785327) (not e!671874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181772 (= res!785327 (validMask!0 mask!1564))))

(declare-fun b!1181773 () Bool)

(assert (=> b!1181773 (= e!671868 (and e!671867 mapRes!46484))))

(declare-fun condMapEmpty!46484 () Bool)

(declare-fun mapDefault!46484 () ValueCell!14176)

