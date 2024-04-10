; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99350 () Bool)

(assert start!99350)

(declare-fun b_free!24929 () Bool)

(declare-fun b_next!24929 () Bool)

(assert (=> start!99350 (= b_free!24929 (not b_next!24929))))

(declare-fun tp!87500 () Bool)

(declare-fun b_and!40725 () Bool)

(assert (=> start!99350 (= tp!87500 b_and!40725)))

(declare-fun b!1171651 () Bool)

(declare-fun e!665954 () Bool)

(assert (=> b!1171651 (= e!665954 true)))

(declare-fun lt!527825 () Bool)

(declare-datatypes ((List!25626 0))(
  ( (Nil!25623) (Cons!25622 (h!26831 (_ BitVec 64)) (t!37547 List!25626)) )
))
(declare-fun contains!6850 (List!25626 (_ BitVec 64)) Bool)

(assert (=> b!1171651 (= lt!527825 (contains!6850 Nil!25623 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171652 () Bool)

(declare-fun e!665960 () Bool)

(declare-fun tp_is_empty!29459 () Bool)

(assert (=> b!1171652 (= e!665960 tp_is_empty!29459)))

(declare-fun b!1171653 () Bool)

(declare-fun res!777796 () Bool)

(declare-fun e!665958 () Bool)

(assert (=> b!1171653 (=> (not res!777796) (not e!665958))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171653 (= res!777796 (validMask!0 mask!1564))))

(declare-fun b!1171654 () Bool)

(declare-fun res!777787 () Bool)

(assert (=> b!1171654 (=> (not res!777787) (not e!665958))))

(declare-datatypes ((array!75735 0))(
  ( (array!75736 (arr!36517 (Array (_ BitVec 32) (_ BitVec 64))) (size!37053 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75735)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75735 (_ BitVec 32)) Bool)

(assert (=> b!1171654 (= res!777787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171655 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!665959 () Bool)

(declare-fun arrayContainsKey!0 (array!75735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171655 (= e!665959 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!46016 () Bool)

(declare-fun mapRes!46016 () Bool)

(declare-fun tp!87501 () Bool)

(assert (=> mapNonEmpty!46016 (= mapRes!46016 (and tp!87501 e!665960))))

(declare-datatypes ((V!44405 0))(
  ( (V!44406 (val!14786 Int)) )
))
(declare-datatypes ((ValueCell!14020 0))(
  ( (ValueCellFull!14020 (v!17424 V!44405)) (EmptyCell!14020) )
))
(declare-fun mapRest!46016 () (Array (_ BitVec 32) ValueCell!14020))

(declare-fun mapValue!46016 () ValueCell!14020)

(declare-datatypes ((array!75737 0))(
  ( (array!75738 (arr!36518 (Array (_ BitVec 32) ValueCell!14020)) (size!37054 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75737)

(declare-fun mapKey!46016 () (_ BitVec 32))

(assert (=> mapNonEmpty!46016 (= (arr!36518 _values!996) (store mapRest!46016 mapKey!46016 mapValue!46016))))

(declare-fun b!1171656 () Bool)

(declare-fun res!777788 () Bool)

(assert (=> b!1171656 (=> (not res!777788) (not e!665958))))

(assert (=> b!1171656 (= res!777788 (= (select (arr!36517 _keys!1208) i!673) k!934))))

(declare-fun b!1171657 () Bool)

(declare-fun e!665953 () Bool)

(assert (=> b!1171657 (= e!665958 e!665953)))

(declare-fun res!777780 () Bool)

(assert (=> b!1171657 (=> (not res!777780) (not e!665953))))

(declare-fun lt!527824 () array!75735)

(assert (=> b!1171657 (= res!777780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527824 mask!1564))))

(assert (=> b!1171657 (= lt!527824 (array!75736 (store (arr!36517 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37053 _keys!1208)))))

(declare-fun b!1171658 () Bool)

(declare-fun e!665956 () Bool)

(declare-fun e!665963 () Bool)

(assert (=> b!1171658 (= e!665956 e!665963)))

(declare-fun res!777784 () Bool)

(assert (=> b!1171658 (=> res!777784 e!665963)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171658 (= res!777784 (not (validKeyInArray!0 (select (arr!36517 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18890 0))(
  ( (tuple2!18891 (_1!9456 (_ BitVec 64)) (_2!9456 V!44405)) )
))
(declare-datatypes ((List!25627 0))(
  ( (Nil!25624) (Cons!25623 (h!26832 tuple2!18890) (t!37548 List!25627)) )
))
(declare-datatypes ((ListLongMap!16859 0))(
  ( (ListLongMap!16860 (toList!8445 List!25627)) )
))
(declare-fun lt!527827 () ListLongMap!16859)

(declare-fun lt!527831 () ListLongMap!16859)

(assert (=> b!1171658 (= lt!527827 lt!527831)))

(declare-fun lt!527829 () ListLongMap!16859)

(declare-fun -!1513 (ListLongMap!16859 (_ BitVec 64)) ListLongMap!16859)

(assert (=> b!1171658 (= lt!527831 (-!1513 lt!527829 k!934))))

(declare-fun zeroValue!944 () V!44405)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!44405)

(declare-fun lt!527835 () array!75737)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4909 (array!75735 array!75737 (_ BitVec 32) (_ BitVec 32) V!44405 V!44405 (_ BitVec 32) Int) ListLongMap!16859)

(assert (=> b!1171658 (= lt!527827 (getCurrentListMapNoExtraKeys!4909 lt!527824 lt!527835 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171658 (= lt!527829 (getCurrentListMapNoExtraKeys!4909 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38642 0))(
  ( (Unit!38643) )
))
(declare-fun lt!527823 () Unit!38642)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!740 (array!75735 array!75737 (_ BitVec 32) (_ BitVec 32) V!44405 V!44405 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38642)

(assert (=> b!1171658 (= lt!527823 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!740 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171659 () Bool)

(declare-fun res!777791 () Bool)

(assert (=> b!1171659 (=> (not res!777791) (not e!665958))))

(assert (=> b!1171659 (= res!777791 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37053 _keys!1208))))))

(declare-fun b!1171660 () Bool)

(declare-fun e!665962 () Bool)

(declare-fun e!665964 () Bool)

(assert (=> b!1171660 (= e!665962 (and e!665964 mapRes!46016))))

(declare-fun condMapEmpty!46016 () Bool)

(declare-fun mapDefault!46016 () ValueCell!14020)

