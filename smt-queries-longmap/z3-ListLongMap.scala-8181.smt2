; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99946 () Bool)

(assert start!99946)

(declare-fun b_free!25531 () Bool)

(declare-fun b_next!25531 () Bool)

(assert (=> start!99946 (= b_free!25531 (not b_next!25531))))

(declare-fun tp!89306 () Bool)

(declare-fun b_and!41907 () Bool)

(assert (=> start!99946 (= tp!89306 b_and!41907)))

(declare-fun b!1190028 () Bool)

(declare-fun res!791432 () Bool)

(declare-fun e!676539 () Bool)

(assert (=> b!1190028 (=> (not res!791432) (not e!676539))))

(declare-datatypes ((array!76850 0))(
  ( (array!76851 (arr!37075 (Array (_ BitVec 32) (_ BitVec 64))) (size!37613 (_ BitVec 32))) )
))
(declare-fun lt!541152 () array!76850)

(declare-datatypes ((List!26209 0))(
  ( (Nil!26206) (Cons!26205 (h!27414 (_ BitVec 64)) (t!38723 List!26209)) )
))
(declare-fun arrayNoDuplicates!0 (array!76850 (_ BitVec 32) List!26209) Bool)

(assert (=> b!1190028 (= res!791432 (arrayNoDuplicates!0 lt!541152 #b00000000000000000000000000000000 Nil!26206))))

(declare-fun b!1190029 () Bool)

(declare-fun res!791426 () Bool)

(declare-fun e!676537 () Bool)

(assert (=> b!1190029 (=> (not res!791426) (not e!676537))))

(declare-fun _keys!1208 () array!76850)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45209 0))(
  ( (V!45210 (val!15087 Int)) )
))
(declare-datatypes ((ValueCell!14321 0))(
  ( (ValueCellFull!14321 (v!17724 V!45209)) (EmptyCell!14321) )
))
(declare-datatypes ((array!76852 0))(
  ( (array!76853 (arr!37076 (Array (_ BitVec 32) ValueCell!14321)) (size!37614 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76852)

(assert (=> b!1190029 (= res!791426 (and (= (size!37614 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37613 _keys!1208) (size!37614 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190030 () Bool)

(declare-fun res!791430 () Bool)

(assert (=> b!1190030 (=> (not res!791430) (not e!676537))))

(assert (=> b!1190030 (= res!791430 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26206))))

(declare-fun mapIsEmpty!46919 () Bool)

(declare-fun mapRes!46919 () Bool)

(assert (=> mapIsEmpty!46919 mapRes!46919))

(declare-fun b!1190031 () Bool)

(declare-fun e!676536 () Bool)

(assert (=> b!1190031 (= e!676539 (not e!676536))))

(declare-fun res!791429 () Bool)

(assert (=> b!1190031 (=> res!791429 e!676536)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190031 (= res!791429 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190031 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39357 0))(
  ( (Unit!39358) )
))
(declare-fun lt!541147 () Unit!39357)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76850 (_ BitVec 64) (_ BitVec 32)) Unit!39357)

(assert (=> b!1190031 (= lt!541147 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190032 () Bool)

(declare-fun e!676540 () Bool)

(assert (=> b!1190032 (= e!676536 e!676540)))

(declare-fun res!791427 () Bool)

(assert (=> b!1190032 (=> res!791427 e!676540)))

(assert (=> b!1190032 (= res!791427 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45209)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45209)

(declare-datatypes ((tuple2!19494 0))(
  ( (tuple2!19495 (_1!9758 (_ BitVec 64)) (_2!9758 V!45209)) )
))
(declare-datatypes ((List!26210 0))(
  ( (Nil!26207) (Cons!26206 (h!27415 tuple2!19494) (t!38724 List!26210)) )
))
(declare-datatypes ((ListLongMap!17463 0))(
  ( (ListLongMap!17464 (toList!8747 List!26210)) )
))
(declare-fun lt!541150 () ListLongMap!17463)

(declare-fun lt!541149 () array!76852)

(declare-fun getCurrentListMapNoExtraKeys!5197 (array!76850 array!76852 (_ BitVec 32) (_ BitVec 32) V!45209 V!45209 (_ BitVec 32) Int) ListLongMap!17463)

(assert (=> b!1190032 (= lt!541150 (getCurrentListMapNoExtraKeys!5197 lt!541152 lt!541149 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3091 (Int (_ BitVec 64)) V!45209)

(assert (=> b!1190032 (= lt!541149 (array!76853 (store (arr!37076 _values!996) i!673 (ValueCellFull!14321 (dynLambda!3091 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37614 _values!996)))))

(declare-fun lt!541151 () ListLongMap!17463)

(assert (=> b!1190032 (= lt!541151 (getCurrentListMapNoExtraKeys!5197 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190033 () Bool)

(declare-fun res!791433 () Bool)

(assert (=> b!1190033 (=> (not res!791433) (not e!676537))))

(assert (=> b!1190033 (= res!791433 (= (select (arr!37075 _keys!1208) i!673) k0!934))))

(declare-fun b!1190034 () Bool)

(declare-fun res!791428 () Bool)

(assert (=> b!1190034 (=> (not res!791428) (not e!676537))))

(assert (=> b!1190034 (= res!791428 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37613 _keys!1208))))))

(declare-fun b!1190035 () Bool)

(declare-fun res!791435 () Bool)

(assert (=> b!1190035 (=> (not res!791435) (not e!676537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76850 (_ BitVec 32)) Bool)

(assert (=> b!1190035 (= res!791435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46919 () Bool)

(declare-fun tp!89307 () Bool)

(declare-fun e!676535 () Bool)

(assert (=> mapNonEmpty!46919 (= mapRes!46919 (and tp!89307 e!676535))))

(declare-fun mapRest!46919 () (Array (_ BitVec 32) ValueCell!14321))

(declare-fun mapValue!46919 () ValueCell!14321)

(declare-fun mapKey!46919 () (_ BitVec 32))

(assert (=> mapNonEmpty!46919 (= (arr!37076 _values!996) (store mapRest!46919 mapKey!46919 mapValue!46919))))

(declare-fun b!1190036 () Bool)

(declare-fun e!676534 () Bool)

(declare-fun e!676538 () Bool)

(assert (=> b!1190036 (= e!676534 (and e!676538 mapRes!46919))))

(declare-fun condMapEmpty!46919 () Bool)

(declare-fun mapDefault!46919 () ValueCell!14321)

(assert (=> b!1190036 (= condMapEmpty!46919 (= (arr!37076 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14321)) mapDefault!46919)))))

(declare-fun b!1190037 () Bool)

(declare-fun res!791437 () Bool)

(assert (=> b!1190037 (=> (not res!791437) (not e!676537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190037 (= res!791437 (validMask!0 mask!1564))))

(declare-fun b!1190038 () Bool)

(declare-fun tp_is_empty!30061 () Bool)

(assert (=> b!1190038 (= e!676538 tp_is_empty!30061)))

(declare-fun b!1190039 () Bool)

(assert (=> b!1190039 (= e!676535 tp_is_empty!30061)))

(declare-fun res!791431 () Bool)

(assert (=> start!99946 (=> (not res!791431) (not e!676537))))

(assert (=> start!99946 (= res!791431 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37613 _keys!1208))))))

(assert (=> start!99946 e!676537))

(assert (=> start!99946 tp_is_empty!30061))

(declare-fun array_inv!28404 (array!76850) Bool)

(assert (=> start!99946 (array_inv!28404 _keys!1208)))

(assert (=> start!99946 true))

(assert (=> start!99946 tp!89306))

(declare-fun array_inv!28405 (array!76852) Bool)

(assert (=> start!99946 (and (array_inv!28405 _values!996) e!676534)))

(declare-fun b!1190040 () Bool)

(declare-fun res!791434 () Bool)

(assert (=> b!1190040 (=> (not res!791434) (not e!676537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190040 (= res!791434 (validKeyInArray!0 k0!934))))

(declare-fun b!1190041 () Bool)

(assert (=> b!1190041 (= e!676540 true)))

(declare-fun -!1693 (ListLongMap!17463 (_ BitVec 64)) ListLongMap!17463)

(assert (=> b!1190041 (= (getCurrentListMapNoExtraKeys!5197 lt!541152 lt!541149 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1693 (getCurrentListMapNoExtraKeys!5197 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541148 () Unit!39357)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!943 (array!76850 array!76852 (_ BitVec 32) (_ BitVec 32) V!45209 V!45209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39357)

(assert (=> b!1190041 (= lt!541148 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!943 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190042 () Bool)

(assert (=> b!1190042 (= e!676537 e!676539)))

(declare-fun res!791436 () Bool)

(assert (=> b!1190042 (=> (not res!791436) (not e!676539))))

(assert (=> b!1190042 (= res!791436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541152 mask!1564))))

(assert (=> b!1190042 (= lt!541152 (array!76851 (store (arr!37075 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37613 _keys!1208)))))

(assert (= (and start!99946 res!791431) b!1190037))

(assert (= (and b!1190037 res!791437) b!1190029))

(assert (= (and b!1190029 res!791426) b!1190035))

(assert (= (and b!1190035 res!791435) b!1190030))

(assert (= (and b!1190030 res!791430) b!1190034))

(assert (= (and b!1190034 res!791428) b!1190040))

(assert (= (and b!1190040 res!791434) b!1190033))

(assert (= (and b!1190033 res!791433) b!1190042))

(assert (= (and b!1190042 res!791436) b!1190028))

(assert (= (and b!1190028 res!791432) b!1190031))

(assert (= (and b!1190031 (not res!791429)) b!1190032))

(assert (= (and b!1190032 (not res!791427)) b!1190041))

(assert (= (and b!1190036 condMapEmpty!46919) mapIsEmpty!46919))

(assert (= (and b!1190036 (not condMapEmpty!46919)) mapNonEmpty!46919))

(get-info :version)

(assert (= (and mapNonEmpty!46919 ((_ is ValueCellFull!14321) mapValue!46919)) b!1190039))

(assert (= (and b!1190036 ((_ is ValueCellFull!14321) mapDefault!46919)) b!1190038))

(assert (= start!99946 b!1190036))

(declare-fun b_lambda!20657 () Bool)

(assert (=> (not b_lambda!20657) (not b!1190032)))

(declare-fun t!38722 () Bool)

(declare-fun tb!10335 () Bool)

(assert (=> (and start!99946 (= defaultEntry!1004 defaultEntry!1004) t!38722) tb!10335))

(declare-fun result!21245 () Bool)

(assert (=> tb!10335 (= result!21245 tp_is_empty!30061)))

(assert (=> b!1190032 t!38722))

(declare-fun b_and!41909 () Bool)

(assert (= b_and!41907 (and (=> t!38722 result!21245) b_and!41909)))

(declare-fun m!1098143 () Bool)

(assert (=> b!1190031 m!1098143))

(declare-fun m!1098145 () Bool)

(assert (=> b!1190031 m!1098145))

(declare-fun m!1098147 () Bool)

(assert (=> b!1190040 m!1098147))

(declare-fun m!1098149 () Bool)

(assert (=> mapNonEmpty!46919 m!1098149))

(declare-fun m!1098151 () Bool)

(assert (=> b!1190037 m!1098151))

(declare-fun m!1098153 () Bool)

(assert (=> b!1190035 m!1098153))

(declare-fun m!1098155 () Bool)

(assert (=> b!1190030 m!1098155))

(declare-fun m!1098157 () Bool)

(assert (=> start!99946 m!1098157))

(declare-fun m!1098159 () Bool)

(assert (=> start!99946 m!1098159))

(declare-fun m!1098161 () Bool)

(assert (=> b!1190042 m!1098161))

(declare-fun m!1098163 () Bool)

(assert (=> b!1190042 m!1098163))

(declare-fun m!1098165 () Bool)

(assert (=> b!1190028 m!1098165))

(declare-fun m!1098167 () Bool)

(assert (=> b!1190032 m!1098167))

(declare-fun m!1098169 () Bool)

(assert (=> b!1190032 m!1098169))

(declare-fun m!1098171 () Bool)

(assert (=> b!1190032 m!1098171))

(declare-fun m!1098173 () Bool)

(assert (=> b!1190032 m!1098173))

(declare-fun m!1098175 () Bool)

(assert (=> b!1190041 m!1098175))

(declare-fun m!1098177 () Bool)

(assert (=> b!1190041 m!1098177))

(assert (=> b!1190041 m!1098177))

(declare-fun m!1098179 () Bool)

(assert (=> b!1190041 m!1098179))

(declare-fun m!1098181 () Bool)

(assert (=> b!1190041 m!1098181))

(declare-fun m!1098183 () Bool)

(assert (=> b!1190033 m!1098183))

(check-sat (not b!1190032) (not b!1190040) (not b!1190037) (not b!1190041) (not start!99946) (not b!1190031) (not mapNonEmpty!46919) (not b!1190042) (not b_next!25531) (not b!1190035) (not b!1190030) (not b!1190028) b_and!41909 (not b_lambda!20657) tp_is_empty!30061)
(check-sat b_and!41909 (not b_next!25531))
