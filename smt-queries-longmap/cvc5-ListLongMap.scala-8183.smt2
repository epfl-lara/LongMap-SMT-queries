; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99964 () Bool)

(assert start!99964)

(declare-fun b_free!25543 () Bool)

(declare-fun b_next!25543 () Bool)

(assert (=> start!99964 (= b_free!25543 (not b_next!25543))))

(declare-fun tp!89342 () Bool)

(declare-fun b_and!41953 () Bool)

(assert (=> start!99964 (= tp!89342 b_and!41953)))

(declare-fun b!1190434 () Bool)

(declare-fun res!791710 () Bool)

(declare-fun e!676756 () Bool)

(assert (=> b!1190434 (=> (not res!791710) (not e!676756))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190434 (= res!791710 (validKeyInArray!0 k!934))))

(declare-fun b!1190435 () Bool)

(declare-fun res!791714 () Bool)

(assert (=> b!1190435 (=> (not res!791714) (not e!676756))))

(declare-datatypes ((array!76937 0))(
  ( (array!76938 (arr!37118 (Array (_ BitVec 32) (_ BitVec 64))) (size!37654 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76937)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76937 (_ BitVec 32)) Bool)

(assert (=> b!1190435 (= res!791714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190436 () Bool)

(declare-fun e!676760 () Bool)

(declare-fun tp_is_empty!30073 () Bool)

(assert (=> b!1190436 (= e!676760 tp_is_empty!30073)))

(declare-fun b!1190437 () Bool)

(declare-fun res!791716 () Bool)

(assert (=> b!1190437 (=> (not res!791716) (not e!676756))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45225 0))(
  ( (V!45226 (val!15093 Int)) )
))
(declare-datatypes ((ValueCell!14327 0))(
  ( (ValueCellFull!14327 (v!17731 V!45225)) (EmptyCell!14327) )
))
(declare-datatypes ((array!76939 0))(
  ( (array!76940 (arr!37119 (Array (_ BitVec 32) ValueCell!14327)) (size!37655 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76939)

(assert (=> b!1190437 (= res!791716 (and (= (size!37655 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37654 _keys!1208) (size!37655 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46937 () Bool)

(declare-fun mapRes!46937 () Bool)

(declare-fun tp!89343 () Bool)

(declare-fun e!676759 () Bool)

(assert (=> mapNonEmpty!46937 (= mapRes!46937 (and tp!89343 e!676759))))

(declare-fun mapValue!46937 () ValueCell!14327)

(declare-fun mapRest!46937 () (Array (_ BitVec 32) ValueCell!14327))

(declare-fun mapKey!46937 () (_ BitVec 32))

(assert (=> mapNonEmpty!46937 (= (arr!37119 _values!996) (store mapRest!46937 mapKey!46937 mapValue!46937))))

(declare-fun res!791715 () Bool)

(assert (=> start!99964 (=> (not res!791715) (not e!676756))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99964 (= res!791715 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37654 _keys!1208))))))

(assert (=> start!99964 e!676756))

(assert (=> start!99964 tp_is_empty!30073))

(declare-fun array_inv!28306 (array!76937) Bool)

(assert (=> start!99964 (array_inv!28306 _keys!1208)))

(assert (=> start!99964 true))

(assert (=> start!99964 tp!89342))

(declare-fun e!676762 () Bool)

(declare-fun array_inv!28307 (array!76939) Bool)

(assert (=> start!99964 (and (array_inv!28307 _values!996) e!676762)))

(declare-fun b!1190438 () Bool)

(declare-fun e!676755 () Bool)

(assert (=> b!1190438 (= e!676755 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541449 () array!76939)

(declare-fun lt!541450 () array!76937)

(declare-fun minValue!944 () V!45225)

(declare-fun zeroValue!944 () V!45225)

(declare-datatypes ((tuple2!19388 0))(
  ( (tuple2!19389 (_1!9705 (_ BitVec 64)) (_2!9705 V!45225)) )
))
(declare-datatypes ((List!26134 0))(
  ( (Nil!26131) (Cons!26130 (h!27339 tuple2!19388) (t!38669 List!26134)) )
))
(declare-datatypes ((ListLongMap!17357 0))(
  ( (ListLongMap!17358 (toList!8694 List!26134)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5135 (array!76937 array!76939 (_ BitVec 32) (_ BitVec 32) V!45225 V!45225 (_ BitVec 32) Int) ListLongMap!17357)

(declare-fun -!1721 (ListLongMap!17357 (_ BitVec 64)) ListLongMap!17357)

(assert (=> b!1190438 (= (getCurrentListMapNoExtraKeys!5135 lt!541450 lt!541449 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1721 (getCurrentListMapNoExtraKeys!5135 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39484 0))(
  ( (Unit!39485) )
))
(declare-fun lt!541448 () Unit!39484)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!930 (array!76937 array!76939 (_ BitVec 32) (_ BitVec 32) V!45225 V!45225 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39484)

(assert (=> b!1190438 (= lt!541448 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!930 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190439 () Bool)

(declare-fun res!791708 () Bool)

(assert (=> b!1190439 (=> (not res!791708) (not e!676756))))

(assert (=> b!1190439 (= res!791708 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37654 _keys!1208))))))

(declare-fun b!1190440 () Bool)

(assert (=> b!1190440 (= e!676759 tp_is_empty!30073)))

(declare-fun b!1190441 () Bool)

(declare-fun res!791709 () Bool)

(declare-fun e!676757 () Bool)

(assert (=> b!1190441 (=> (not res!791709) (not e!676757))))

(declare-datatypes ((List!26135 0))(
  ( (Nil!26132) (Cons!26131 (h!27340 (_ BitVec 64)) (t!38670 List!26135)) )
))
(declare-fun arrayNoDuplicates!0 (array!76937 (_ BitVec 32) List!26135) Bool)

(assert (=> b!1190441 (= res!791709 (arrayNoDuplicates!0 lt!541450 #b00000000000000000000000000000000 Nil!26132))))

(declare-fun b!1190442 () Bool)

(assert (=> b!1190442 (= e!676762 (and e!676760 mapRes!46937))))

(declare-fun condMapEmpty!46937 () Bool)

(declare-fun mapDefault!46937 () ValueCell!14327)

