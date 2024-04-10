; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99188 () Bool)

(assert start!99188)

(declare-fun b_free!24793 () Bool)

(declare-fun b_next!24793 () Bool)

(assert (=> start!99188 (= b_free!24793 (not b_next!24793))))

(declare-fun tp!87089 () Bool)

(declare-fun b_and!40435 () Bool)

(assert (=> start!99188 (= tp!87089 b_and!40435)))

(declare-fun b!1167689 () Bool)

(declare-fun e!663674 () Bool)

(declare-fun tp_is_empty!29323 () Bool)

(assert (=> b!1167689 (= e!663674 tp_is_empty!29323)))

(declare-fun b!1167690 () Bool)

(declare-fun e!663676 () Bool)

(assert (=> b!1167690 (= e!663676 tp_is_empty!29323)))

(declare-fun b!1167691 () Bool)

(declare-fun e!663677 () Bool)

(declare-fun e!663679 () Bool)

(assert (=> b!1167691 (= e!663677 e!663679)))

(declare-fun res!774658 () Bool)

(assert (=> b!1167691 (=> (not res!774658) (not e!663679))))

(declare-datatypes ((array!75469 0))(
  ( (array!75470 (arr!36385 (Array (_ BitVec 32) (_ BitVec 64))) (size!36921 (_ BitVec 32))) )
))
(declare-fun lt!525730 () array!75469)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75469 (_ BitVec 32)) Bool)

(assert (=> b!1167691 (= res!774658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525730 mask!1564))))

(declare-fun _keys!1208 () array!75469)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167691 (= lt!525730 (array!75470 (store (arr!36385 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36921 _keys!1208)))))

(declare-fun b!1167692 () Bool)

(declare-fun res!774657 () Bool)

(assert (=> b!1167692 (=> (not res!774657) (not e!663677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167692 (= res!774657 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45809 () Bool)

(declare-fun mapRes!45809 () Bool)

(declare-fun tp!87090 () Bool)

(assert (=> mapNonEmpty!45809 (= mapRes!45809 (and tp!87090 e!663674))))

(declare-datatypes ((V!44225 0))(
  ( (V!44226 (val!14718 Int)) )
))
(declare-datatypes ((ValueCell!13952 0))(
  ( (ValueCellFull!13952 (v!17355 V!44225)) (EmptyCell!13952) )
))
(declare-fun mapRest!45809 () (Array (_ BitVec 32) ValueCell!13952))

(declare-fun mapKey!45809 () (_ BitVec 32))

(declare-fun mapValue!45809 () ValueCell!13952)

(declare-datatypes ((array!75471 0))(
  ( (array!75472 (arr!36386 (Array (_ BitVec 32) ValueCell!13952)) (size!36922 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75471)

(assert (=> mapNonEmpty!45809 (= (arr!36386 _values!996) (store mapRest!45809 mapKey!45809 mapValue!45809))))

(declare-fun b!1167694 () Bool)

(declare-fun e!663675 () Bool)

(assert (=> b!1167694 (= e!663679 (not e!663675))))

(declare-fun res!774653 () Bool)

(assert (=> b!1167694 (=> res!774653 e!663675)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1167694 (= res!774653 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167694 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38528 0))(
  ( (Unit!38529) )
))
(declare-fun lt!525732 () Unit!38528)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75469 (_ BitVec 64) (_ BitVec 32)) Unit!38528)

(assert (=> b!1167694 (= lt!525732 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1167695 () Bool)

(declare-fun res!774651 () Bool)

(assert (=> b!1167695 (=> (not res!774651) (not e!663677))))

(assert (=> b!1167695 (= res!774651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167696 () Bool)

(declare-fun res!774652 () Bool)

(assert (=> b!1167696 (=> (not res!774652) (not e!663679))))

(declare-datatypes ((List!25516 0))(
  ( (Nil!25513) (Cons!25512 (h!26721 (_ BitVec 64)) (t!37301 List!25516)) )
))
(declare-fun arrayNoDuplicates!0 (array!75469 (_ BitVec 32) List!25516) Bool)

(assert (=> b!1167696 (= res!774652 (arrayNoDuplicates!0 lt!525730 #b00000000000000000000000000000000 Nil!25513))))

(declare-fun b!1167697 () Bool)

(declare-fun res!774655 () Bool)

(assert (=> b!1167697 (=> (not res!774655) (not e!663677))))

(assert (=> b!1167697 (= res!774655 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36921 _keys!1208))))))

(declare-fun b!1167698 () Bool)

(declare-fun res!774649 () Bool)

(assert (=> b!1167698 (=> (not res!774649) (not e!663677))))

(assert (=> b!1167698 (= res!774649 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25513))))

(declare-fun mapIsEmpty!45809 () Bool)

(assert (=> mapIsEmpty!45809 mapRes!45809))

(declare-fun b!1167699 () Bool)

(declare-fun res!774656 () Bool)

(assert (=> b!1167699 (=> (not res!774656) (not e!663677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167699 (= res!774656 (validKeyInArray!0 k!934))))

(declare-fun b!1167700 () Bool)

(declare-fun res!774659 () Bool)

(assert (=> b!1167700 (=> (not res!774659) (not e!663677))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1167700 (= res!774659 (and (= (size!36922 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36921 _keys!1208) (size!36922 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167701 () Bool)

(declare-fun e!663678 () Bool)

(assert (=> b!1167701 (= e!663678 true)))

(declare-fun zeroValue!944 () V!44225)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44225)

(declare-fun lt!525734 () array!75471)

(declare-datatypes ((tuple2!18776 0))(
  ( (tuple2!18777 (_1!9399 (_ BitVec 64)) (_2!9399 V!44225)) )
))
(declare-datatypes ((List!25517 0))(
  ( (Nil!25514) (Cons!25513 (h!26722 tuple2!18776) (t!37302 List!25517)) )
))
(declare-datatypes ((ListLongMap!16745 0))(
  ( (ListLongMap!16746 (toList!8388 List!25517)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4852 (array!75469 array!75471 (_ BitVec 32) (_ BitVec 32) V!44225 V!44225 (_ BitVec 32) Int) ListLongMap!16745)

(declare-fun -!1463 (ListLongMap!16745 (_ BitVec 64)) ListLongMap!16745)

(assert (=> b!1167701 (= (getCurrentListMapNoExtraKeys!4852 lt!525730 lt!525734 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1463 (getCurrentListMapNoExtraKeys!4852 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!525733 () Unit!38528)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!690 (array!75469 array!75471 (_ BitVec 32) (_ BitVec 32) V!44225 V!44225 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38528)

(assert (=> b!1167701 (= lt!525733 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!690 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167702 () Bool)

(declare-fun res!774648 () Bool)

(assert (=> b!1167702 (=> (not res!774648) (not e!663677))))

(assert (=> b!1167702 (= res!774648 (= (select (arr!36385 _keys!1208) i!673) k!934))))

(declare-fun b!1167703 () Bool)

(declare-fun e!663680 () Bool)

(assert (=> b!1167703 (= e!663680 (and e!663676 mapRes!45809))))

(declare-fun condMapEmpty!45809 () Bool)

(declare-fun mapDefault!45809 () ValueCell!13952)

