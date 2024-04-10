; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101474 () Bool)

(assert start!101474)

(declare-fun b_free!26291 () Bool)

(declare-fun b_next!26291 () Bool)

(assert (=> start!101474 (= b_free!26291 (not b_next!26291))))

(declare-fun tp!91906 () Bool)

(declare-fun b_and!43771 () Bool)

(assert (=> start!101474 (= tp!91906 b_and!43771)))

(declare-fun mapIsEmpty!48379 () Bool)

(declare-fun mapRes!48379 () Bool)

(assert (=> mapIsEmpty!48379 mapRes!48379))

(declare-fun b!1219782 () Bool)

(declare-fun e!692607 () Bool)

(declare-fun e!692598 () Bool)

(assert (=> b!1219782 (= e!692607 e!692598)))

(declare-fun res!810210 () Bool)

(assert (=> b!1219782 (=> res!810210 e!692598)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219782 (= res!810210 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46453 0))(
  ( (V!46454 (val!15554 Int)) )
))
(declare-fun zeroValue!944 () V!46453)

(declare-datatypes ((ValueCell!14788 0))(
  ( (ValueCellFull!14788 (v!18211 V!46453)) (EmptyCell!14788) )
))
(declare-datatypes ((array!78767 0))(
  ( (array!78768 (arr!38014 (Array (_ BitVec 32) ValueCell!14788)) (size!38550 (_ BitVec 32))) )
))
(declare-fun lt!554627 () array!78767)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!78769 0))(
  ( (array!78770 (arr!38015 (Array (_ BitVec 32) (_ BitVec 64))) (size!38551 (_ BitVec 32))) )
))
(declare-fun lt!554625 () array!78769)

(declare-datatypes ((tuple2!20020 0))(
  ( (tuple2!20021 (_1!10021 (_ BitVec 64)) (_2!10021 V!46453)) )
))
(declare-datatypes ((List!26819 0))(
  ( (Nil!26816) (Cons!26815 (h!28024 tuple2!20020) (t!40090 List!26819)) )
))
(declare-datatypes ((ListLongMap!17989 0))(
  ( (ListLongMap!17990 (toList!9010 List!26819)) )
))
(declare-fun lt!554622 () ListLongMap!17989)

(declare-fun minValue!944 () V!46453)

(declare-fun getCurrentListMapNoExtraKeys!5434 (array!78769 array!78767 (_ BitVec 32) (_ BitVec 32) V!46453 V!46453 (_ BitVec 32) Int) ListLongMap!17989)

(assert (=> b!1219782 (= lt!554622 (getCurrentListMapNoExtraKeys!5434 lt!554625 lt!554627 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554630 () V!46453)

(declare-fun _values!996 () array!78767)

(assert (=> b!1219782 (= lt!554627 (array!78768 (store (arr!38014 _values!996) i!673 (ValueCellFull!14788 lt!554630)) (size!38550 _values!996)))))

(declare-fun dynLambda!3316 (Int (_ BitVec 64)) V!46453)

(assert (=> b!1219782 (= lt!554630 (dynLambda!3316 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!78769)

(declare-fun lt!554626 () ListLongMap!17989)

(assert (=> b!1219782 (= lt!554626 (getCurrentListMapNoExtraKeys!5434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219783 () Bool)

(declare-fun e!692602 () Bool)

(declare-fun e!692608 () Bool)

(assert (=> b!1219783 (= e!692602 e!692608)))

(declare-fun res!810207 () Bool)

(assert (=> b!1219783 (=> (not res!810207) (not e!692608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78769 (_ BitVec 32)) Bool)

(assert (=> b!1219783 (= res!810207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554625 mask!1564))))

(assert (=> b!1219783 (= lt!554625 (array!78770 (store (arr!38015 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38551 _keys!1208)))))

(declare-fun b!1219784 () Bool)

(declare-fun e!692606 () Bool)

(declare-fun tp_is_empty!30995 () Bool)

(assert (=> b!1219784 (= e!692606 tp_is_empty!30995)))

(declare-fun b!1219785 () Bool)

(declare-fun res!810213 () Bool)

(assert (=> b!1219785 (=> (not res!810213) (not e!692602))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219785 (= res!810213 (validKeyInArray!0 k!934))))

(declare-fun b!1219786 () Bool)

(declare-fun e!692601 () Bool)

(assert (=> b!1219786 (= e!692601 tp_is_empty!30995)))

(declare-fun b!1219787 () Bool)

(declare-fun e!692599 () Bool)

(declare-fun e!692600 () Bool)

(assert (=> b!1219787 (= e!692599 e!692600)))

(declare-fun res!810202 () Bool)

(assert (=> b!1219787 (=> res!810202 e!692600)))

(assert (=> b!1219787 (= res!810202 (not (= (select (arr!38015 _keys!1208) from!1455) k!934)))))

(declare-fun e!692603 () Bool)

(assert (=> b!1219787 e!692603))

(declare-fun res!810214 () Bool)

(assert (=> b!1219787 (=> (not res!810214) (not e!692603))))

(declare-fun lt!554621 () ListLongMap!17989)

(declare-fun +!4078 (ListLongMap!17989 tuple2!20020) ListLongMap!17989)

(declare-fun get!19389 (ValueCell!14788 V!46453) V!46453)

(assert (=> b!1219787 (= res!810214 (= lt!554622 (+!4078 lt!554621 (tuple2!20021 (select (arr!38015 _keys!1208) from!1455) (get!19389 (select (arr!38014 _values!996) from!1455) lt!554630)))))))

(declare-fun b!1219788 () Bool)

(declare-fun res!810206 () Bool)

(assert (=> b!1219788 (=> (not res!810206) (not e!692602))))

(assert (=> b!1219788 (= res!810206 (= (select (arr!38015 _keys!1208) i!673) k!934))))

(declare-fun b!1219789 () Bool)

(declare-fun res!810215 () Bool)

(assert (=> b!1219789 (=> (not res!810215) (not e!692602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219789 (= res!810215 (validMask!0 mask!1564))))

(declare-fun b!1219790 () Bool)

(declare-fun res!810203 () Bool)

(assert (=> b!1219790 (=> (not res!810203) (not e!692602))))

(assert (=> b!1219790 (= res!810203 (and (= (size!38550 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38551 _keys!1208) (size!38550 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219791 () Bool)

(assert (=> b!1219791 (= e!692608 (not e!692607))))

(declare-fun res!810216 () Bool)

(assert (=> b!1219791 (=> res!810216 e!692607)))

(assert (=> b!1219791 (= res!810216 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219791 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40420 0))(
  ( (Unit!40421) )
))
(declare-fun lt!554629 () Unit!40420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78769 (_ BitVec 64) (_ BitVec 32)) Unit!40420)

(assert (=> b!1219791 (= lt!554629 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1219792 () Bool)

(assert (=> b!1219792 (= e!692598 e!692599)))

(declare-fun res!810201 () Bool)

(assert (=> b!1219792 (=> res!810201 e!692599)))

(assert (=> b!1219792 (= res!810201 (not (validKeyInArray!0 (select (arr!38015 _keys!1208) from!1455))))))

(declare-fun lt!554631 () ListLongMap!17989)

(assert (=> b!1219792 (= lt!554631 lt!554621)))

(declare-fun lt!554624 () ListLongMap!17989)

(declare-fun -!1921 (ListLongMap!17989 (_ BitVec 64)) ListLongMap!17989)

(assert (=> b!1219792 (= lt!554621 (-!1921 lt!554624 k!934))))

(assert (=> b!1219792 (= lt!554631 (getCurrentListMapNoExtraKeys!5434 lt!554625 lt!554627 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219792 (= lt!554624 (getCurrentListMapNoExtraKeys!5434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554628 () Unit!40420)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1128 (array!78769 array!78767 (_ BitVec 32) (_ BitVec 32) V!46453 V!46453 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40420)

(assert (=> b!1219792 (= lt!554628 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1128 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219793 () Bool)

(declare-fun res!810212 () Bool)

(assert (=> b!1219793 (=> (not res!810212) (not e!692608))))

(declare-datatypes ((List!26820 0))(
  ( (Nil!26817) (Cons!26816 (h!28025 (_ BitVec 64)) (t!40091 List!26820)) )
))
(declare-fun arrayNoDuplicates!0 (array!78769 (_ BitVec 32) List!26820) Bool)

(assert (=> b!1219793 (= res!810212 (arrayNoDuplicates!0 lt!554625 #b00000000000000000000000000000000 Nil!26817))))

(declare-fun b!1219794 () Bool)

(declare-fun res!810205 () Bool)

(assert (=> b!1219794 (=> (not res!810205) (not e!692602))))

(assert (=> b!1219794 (= res!810205 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26817))))

(declare-fun b!1219795 () Bool)

(declare-fun res!810208 () Bool)

(assert (=> b!1219795 (=> (not res!810208) (not e!692602))))

(assert (=> b!1219795 (= res!810208 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38551 _keys!1208))))))

(declare-fun res!810209 () Bool)

(assert (=> start!101474 (=> (not res!810209) (not e!692602))))

(assert (=> start!101474 (= res!810209 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38551 _keys!1208))))))

(assert (=> start!101474 e!692602))

(assert (=> start!101474 tp_is_empty!30995))

(declare-fun array_inv!28928 (array!78769) Bool)

(assert (=> start!101474 (array_inv!28928 _keys!1208)))

(assert (=> start!101474 true))

(assert (=> start!101474 tp!91906))

(declare-fun e!692605 () Bool)

(declare-fun array_inv!28929 (array!78767) Bool)

(assert (=> start!101474 (and (array_inv!28929 _values!996) e!692605)))

(declare-fun b!1219796 () Bool)

(declare-fun e!692597 () Bool)

(assert (=> b!1219796 (= e!692603 e!692597)))

(declare-fun res!810211 () Bool)

(assert (=> b!1219796 (=> res!810211 e!692597)))

(assert (=> b!1219796 (= res!810211 (not (= (select (arr!38015 _keys!1208) from!1455) k!934)))))

(declare-fun b!1219797 () Bool)

(assert (=> b!1219797 (= e!692597 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1219798 () Bool)

(assert (=> b!1219798 (= e!692600 true)))

(assert (=> b!1219798 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554623 () Unit!40420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78769 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40420)

(assert (=> b!1219798 (= lt!554623 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!48379 () Bool)

(declare-fun tp!91907 () Bool)

(assert (=> mapNonEmpty!48379 (= mapRes!48379 (and tp!91907 e!692606))))

(declare-fun mapValue!48379 () ValueCell!14788)

(declare-fun mapKey!48379 () (_ BitVec 32))

(declare-fun mapRest!48379 () (Array (_ BitVec 32) ValueCell!14788))

(assert (=> mapNonEmpty!48379 (= (arr!38014 _values!996) (store mapRest!48379 mapKey!48379 mapValue!48379))))

(declare-fun b!1219799 () Bool)

(declare-fun res!810204 () Bool)

(assert (=> b!1219799 (=> (not res!810204) (not e!692602))))

(assert (=> b!1219799 (= res!810204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219800 () Bool)

(assert (=> b!1219800 (= e!692605 (and e!692601 mapRes!48379))))

(declare-fun condMapEmpty!48379 () Bool)

(declare-fun mapDefault!48379 () ValueCell!14788)

