; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100016 () Bool)

(assert start!100016)

(declare-fun b_free!25595 () Bool)

(declare-fun b_next!25595 () Bool)

(assert (=> start!100016 (= b_free!25595 (not b_next!25595))))

(declare-fun tp!89499 () Bool)

(declare-fun b_and!42057 () Bool)

(assert (=> start!100016 (= tp!89499 b_and!42057)))

(declare-fun b!1191656 () Bool)

(declare-fun res!792646 () Bool)

(declare-fun e!677382 () Bool)

(assert (=> b!1191656 (=> (not res!792646) (not e!677382))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191656 (= res!792646 (validKeyInArray!0 k!934))))

(declare-fun b!1191657 () Bool)

(declare-fun e!677386 () Bool)

(declare-fun e!677379 () Bool)

(assert (=> b!1191657 (= e!677386 e!677379)))

(declare-fun res!792655 () Bool)

(assert (=> b!1191657 (=> res!792655 e!677379)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191657 (= res!792655 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45293 0))(
  ( (V!45294 (val!15119 Int)) )
))
(declare-fun zeroValue!944 () V!45293)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19434 0))(
  ( (tuple2!19435 (_1!9728 (_ BitVec 64)) (_2!9728 V!45293)) )
))
(declare-datatypes ((List!26177 0))(
  ( (Nil!26174) (Cons!26173 (h!27382 tuple2!19434) (t!38764 List!26177)) )
))
(declare-datatypes ((ListLongMap!17403 0))(
  ( (ListLongMap!17404 (toList!8717 List!26177)) )
))
(declare-fun lt!541915 () ListLongMap!17403)

(declare-datatypes ((array!77041 0))(
  ( (array!77042 (arr!37170 (Array (_ BitVec 32) (_ BitVec 64))) (size!37706 (_ BitVec 32))) )
))
(declare-fun lt!541916 () array!77041)

(declare-fun minValue!944 () V!45293)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14353 0))(
  ( (ValueCellFull!14353 (v!17757 V!45293)) (EmptyCell!14353) )
))
(declare-datatypes ((array!77043 0))(
  ( (array!77044 (arr!37171 (Array (_ BitVec 32) ValueCell!14353)) (size!37707 (_ BitVec 32))) )
))
(declare-fun lt!541920 () array!77043)

(declare-fun getCurrentListMapNoExtraKeys!5158 (array!77041 array!77043 (_ BitVec 32) (_ BitVec 32) V!45293 V!45293 (_ BitVec 32) Int) ListLongMap!17403)

(assert (=> b!1191657 (= lt!541915 (getCurrentListMapNoExtraKeys!5158 lt!541916 lt!541920 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77043)

(declare-fun dynLambda!3091 (Int (_ BitVec 64)) V!45293)

(assert (=> b!1191657 (= lt!541920 (array!77044 (store (arr!37171 _values!996) i!673 (ValueCellFull!14353 (dynLambda!3091 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37707 _values!996)))))

(declare-fun _keys!1208 () array!77041)

(declare-fun lt!541919 () ListLongMap!17403)

(assert (=> b!1191657 (= lt!541919 (getCurrentListMapNoExtraKeys!5158 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191658 () Bool)

(declare-fun res!792653 () Bool)

(assert (=> b!1191658 (=> (not res!792653) (not e!677382))))

(assert (=> b!1191658 (= res!792653 (= (select (arr!37170 _keys!1208) i!673) k!934))))

(declare-fun res!792650 () Bool)

(assert (=> start!100016 (=> (not res!792650) (not e!677382))))

(assert (=> start!100016 (= res!792650 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37706 _keys!1208))))))

(assert (=> start!100016 e!677382))

(declare-fun tp_is_empty!30125 () Bool)

(assert (=> start!100016 tp_is_empty!30125))

(declare-fun array_inv!28346 (array!77041) Bool)

(assert (=> start!100016 (array_inv!28346 _keys!1208)))

(assert (=> start!100016 true))

(assert (=> start!100016 tp!89499))

(declare-fun e!677385 () Bool)

(declare-fun array_inv!28347 (array!77043) Bool)

(assert (=> start!100016 (and (array_inv!28347 _values!996) e!677385)))

(declare-fun mapNonEmpty!47015 () Bool)

(declare-fun mapRes!47015 () Bool)

(declare-fun tp!89498 () Bool)

(declare-fun e!677381 () Bool)

(assert (=> mapNonEmpty!47015 (= mapRes!47015 (and tp!89498 e!677381))))

(declare-fun mapRest!47015 () (Array (_ BitVec 32) ValueCell!14353))

(declare-fun mapKey!47015 () (_ BitVec 32))

(declare-fun mapValue!47015 () ValueCell!14353)

(assert (=> mapNonEmpty!47015 (= (arr!37171 _values!996) (store mapRest!47015 mapKey!47015 mapValue!47015))))

(declare-fun b!1191659 () Bool)

(assert (=> b!1191659 (= e!677379 true)))

(declare-fun -!1742 (ListLongMap!17403 (_ BitVec 64)) ListLongMap!17403)

(assert (=> b!1191659 (= (getCurrentListMapNoExtraKeys!5158 lt!541916 lt!541920 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1742 (getCurrentListMapNoExtraKeys!5158 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39530 0))(
  ( (Unit!39531) )
))
(declare-fun lt!541917 () Unit!39530)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!951 (array!77041 array!77043 (_ BitVec 32) (_ BitVec 32) V!45293 V!45293 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39530)

(assert (=> b!1191659 (= lt!541917 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!951 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191660 () Bool)

(declare-fun res!792645 () Bool)

(assert (=> b!1191660 (=> (not res!792645) (not e!677382))))

(declare-datatypes ((List!26178 0))(
  ( (Nil!26175) (Cons!26174 (h!27383 (_ BitVec 64)) (t!38765 List!26178)) )
))
(declare-fun arrayNoDuplicates!0 (array!77041 (_ BitVec 32) List!26178) Bool)

(assert (=> b!1191660 (= res!792645 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26175))))

(declare-fun b!1191661 () Bool)

(declare-fun e!677380 () Bool)

(assert (=> b!1191661 (= e!677380 tp_is_empty!30125)))

(declare-fun b!1191662 () Bool)

(declare-fun res!792651 () Bool)

(assert (=> b!1191662 (=> (not res!792651) (not e!677382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191662 (= res!792651 (validMask!0 mask!1564))))

(declare-fun b!1191663 () Bool)

(declare-fun res!792652 () Bool)

(assert (=> b!1191663 (=> (not res!792652) (not e!677382))))

(assert (=> b!1191663 (= res!792652 (and (= (size!37707 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37706 _keys!1208) (size!37707 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191664 () Bool)

(declare-fun res!792648 () Bool)

(assert (=> b!1191664 (=> (not res!792648) (not e!677382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77041 (_ BitVec 32)) Bool)

(assert (=> b!1191664 (= res!792648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191665 () Bool)

(declare-fun e!677384 () Bool)

(assert (=> b!1191665 (= e!677384 (not e!677386))))

(declare-fun res!792644 () Bool)

(assert (=> b!1191665 (=> res!792644 e!677386)))

(assert (=> b!1191665 (= res!792644 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191665 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!541918 () Unit!39530)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77041 (_ BitVec 64) (_ BitVec 32)) Unit!39530)

(assert (=> b!1191665 (= lt!541918 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1191666 () Bool)

(assert (=> b!1191666 (= e!677381 tp_is_empty!30125)))

(declare-fun b!1191667 () Bool)

(assert (=> b!1191667 (= e!677382 e!677384)))

(declare-fun res!792654 () Bool)

(assert (=> b!1191667 (=> (not res!792654) (not e!677384))))

(assert (=> b!1191667 (= res!792654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541916 mask!1564))))

(assert (=> b!1191667 (= lt!541916 (array!77042 (store (arr!37170 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37706 _keys!1208)))))

(declare-fun b!1191668 () Bool)

(declare-fun res!792647 () Bool)

(assert (=> b!1191668 (=> (not res!792647) (not e!677382))))

(assert (=> b!1191668 (= res!792647 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37706 _keys!1208))))))

(declare-fun b!1191669 () Bool)

(declare-fun res!792649 () Bool)

(assert (=> b!1191669 (=> (not res!792649) (not e!677384))))

(assert (=> b!1191669 (= res!792649 (arrayNoDuplicates!0 lt!541916 #b00000000000000000000000000000000 Nil!26175))))

(declare-fun b!1191670 () Bool)

(assert (=> b!1191670 (= e!677385 (and e!677380 mapRes!47015))))

(declare-fun condMapEmpty!47015 () Bool)

(declare-fun mapDefault!47015 () ValueCell!14353)

