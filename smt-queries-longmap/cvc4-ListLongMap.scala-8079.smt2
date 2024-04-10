; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99344 () Bool)

(assert start!99344)

(declare-fun b_free!24923 () Bool)

(declare-fun b_next!24923 () Bool)

(assert (=> start!99344 (= b_free!24923 (not b_next!24923))))

(declare-fun tp!87482 () Bool)

(declare-fun b_and!40713 () Bool)

(assert (=> start!99344 (= tp!87482 b_and!40713)))

(declare-fun b!1171447 () Bool)

(declare-fun e!665844 () Bool)

(declare-fun e!665845 () Bool)

(assert (=> b!1171447 (= e!665844 e!665845)))

(declare-fun res!777621 () Bool)

(assert (=> b!1171447 (=> (not res!777621) (not e!665845))))

(declare-datatypes ((array!75725 0))(
  ( (array!75726 (arr!36512 (Array (_ BitVec 32) (_ BitVec 64))) (size!37048 (_ BitVec 32))) )
))
(declare-fun lt!527710 () array!75725)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75725 (_ BitVec 32)) Bool)

(assert (=> b!1171447 (= res!777621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527710 mask!1564))))

(declare-fun _keys!1208 () array!75725)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1171447 (= lt!527710 (array!75726 (store (arr!36512 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37048 _keys!1208)))))

(declare-fun b!1171448 () Bool)

(declare-fun e!665838 () Bool)

(declare-fun e!665842 () Bool)

(assert (=> b!1171448 (= e!665838 e!665842)))

(declare-fun res!777610 () Bool)

(assert (=> b!1171448 (=> res!777610 e!665842)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1171448 (= res!777610 (or (bvsge (size!37048 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37048 _keys!1208)) (bvsge from!1455 (size!37048 _keys!1208))))))

(declare-datatypes ((List!25622 0))(
  ( (Nil!25619) (Cons!25618 (h!26827 (_ BitVec 64)) (t!37537 List!25622)) )
))
(declare-fun arrayNoDuplicates!0 (array!75725 (_ BitVec 32) List!25622) Bool)

(assert (=> b!1171448 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25619)))

(declare-datatypes ((Unit!38638 0))(
  ( (Unit!38639) )
))
(declare-fun lt!527709 () Unit!38638)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75725 (_ BitVec 32) (_ BitVec 32)) Unit!38638)

(assert (=> b!1171448 (= lt!527709 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171448 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527718 () Unit!38638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75725 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38638)

(assert (=> b!1171448 (= lt!527718 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171449 () Bool)

(declare-fun e!665846 () Bool)

(declare-fun e!665840 () Bool)

(assert (=> b!1171449 (= e!665846 e!665840)))

(declare-fun res!777607 () Bool)

(assert (=> b!1171449 (=> res!777607 e!665840)))

(assert (=> b!1171449 (= res!777607 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44397 0))(
  ( (V!44398 (val!14783 Int)) )
))
(declare-fun zeroValue!944 () V!44397)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44397)

(declare-datatypes ((ValueCell!14017 0))(
  ( (ValueCellFull!14017 (v!17421 V!44397)) (EmptyCell!14017) )
))
(declare-datatypes ((array!75727 0))(
  ( (array!75728 (arr!36513 (Array (_ BitVec 32) ValueCell!14017)) (size!37049 (_ BitVec 32))) )
))
(declare-fun lt!527713 () array!75727)

(declare-datatypes ((tuple2!18886 0))(
  ( (tuple2!18887 (_1!9454 (_ BitVec 64)) (_2!9454 V!44397)) )
))
(declare-datatypes ((List!25623 0))(
  ( (Nil!25620) (Cons!25619 (h!26828 tuple2!18886) (t!37538 List!25623)) )
))
(declare-datatypes ((ListLongMap!16855 0))(
  ( (ListLongMap!16856 (toList!8443 List!25623)) )
))
(declare-fun lt!527707 () ListLongMap!16855)

(declare-fun getCurrentListMapNoExtraKeys!4907 (array!75725 array!75727 (_ BitVec 32) (_ BitVec 32) V!44397 V!44397 (_ BitVec 32) Int) ListLongMap!16855)

(assert (=> b!1171449 (= lt!527707 (getCurrentListMapNoExtraKeys!4907 lt!527710 lt!527713 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527712 () V!44397)

(declare-fun _values!996 () array!75727)

(assert (=> b!1171449 (= lt!527713 (array!75728 (store (arr!36513 _values!996) i!673 (ValueCellFull!14017 lt!527712)) (size!37049 _values!996)))))

(declare-fun dynLambda!2880 (Int (_ BitVec 64)) V!44397)

(assert (=> b!1171449 (= lt!527712 (dynLambda!2880 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527715 () ListLongMap!16855)

(assert (=> b!1171449 (= lt!527715 (getCurrentListMapNoExtraKeys!4907 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171450 () Bool)

(declare-fun res!777614 () Bool)

(assert (=> b!1171450 (=> (not res!777614) (not e!665844))))

(assert (=> b!1171450 (= res!777614 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25619))))

(declare-fun b!1171451 () Bool)

(declare-fun res!777617 () Bool)

(assert (=> b!1171451 (=> (not res!777617) (not e!665844))))

(assert (=> b!1171451 (= res!777617 (= (select (arr!36512 _keys!1208) i!673) k!934))))

(declare-fun b!1171452 () Bool)

(declare-fun res!777618 () Bool)

(assert (=> b!1171452 (=> res!777618 e!665842)))

(declare-fun noDuplicate!1609 (List!25622) Bool)

(assert (=> b!1171452 (= res!777618 (not (noDuplicate!1609 Nil!25619)))))

(declare-fun mapIsEmpty!46007 () Bool)

(declare-fun mapRes!46007 () Bool)

(assert (=> mapIsEmpty!46007 mapRes!46007))

(declare-fun mapNonEmpty!46007 () Bool)

(declare-fun tp!87483 () Bool)

(declare-fun e!665847 () Bool)

(assert (=> mapNonEmpty!46007 (= mapRes!46007 (and tp!87483 e!665847))))

(declare-fun mapRest!46007 () (Array (_ BitVec 32) ValueCell!14017))

(declare-fun mapValue!46007 () ValueCell!14017)

(declare-fun mapKey!46007 () (_ BitVec 32))

(assert (=> mapNonEmpty!46007 (= (arr!36513 _values!996) (store mapRest!46007 mapKey!46007 mapValue!46007))))

(declare-fun res!777609 () Bool)

(assert (=> start!99344 (=> (not res!777609) (not e!665844))))

(assert (=> start!99344 (= res!777609 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37048 _keys!1208))))))

(assert (=> start!99344 e!665844))

(declare-fun tp_is_empty!29453 () Bool)

(assert (=> start!99344 tp_is_empty!29453))

(declare-fun array_inv!27904 (array!75725) Bool)

(assert (=> start!99344 (array_inv!27904 _keys!1208)))

(assert (=> start!99344 true))

(assert (=> start!99344 tp!87482))

(declare-fun e!665843 () Bool)

(declare-fun array_inv!27905 (array!75727) Bool)

(assert (=> start!99344 (and (array_inv!27905 _values!996) e!665843)))

(declare-fun b!1171453 () Bool)

(declare-fun res!777613 () Bool)

(assert (=> b!1171453 (=> (not res!777613) (not e!665844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171453 (= res!777613 (validKeyInArray!0 k!934))))

(declare-fun b!1171454 () Bool)

(declare-fun res!777615 () Bool)

(assert (=> b!1171454 (=> (not res!777615) (not e!665844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171454 (= res!777615 (validMask!0 mask!1564))))

(declare-fun b!1171455 () Bool)

(declare-fun res!777612 () Bool)

(assert (=> b!1171455 (=> (not res!777612) (not e!665844))))

(assert (=> b!1171455 (= res!777612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171456 () Bool)

(declare-fun res!777619 () Bool)

(assert (=> b!1171456 (=> (not res!777619) (not e!665844))))

(assert (=> b!1171456 (= res!777619 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37048 _keys!1208))))))

(declare-fun b!1171457 () Bool)

(assert (=> b!1171457 (= e!665842 true)))

(declare-fun lt!527714 () Bool)

(declare-fun contains!6848 (List!25622 (_ BitVec 64)) Bool)

(assert (=> b!1171457 (= lt!527714 (contains!6848 Nil!25619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171458 () Bool)

(declare-fun e!665841 () Bool)

(assert (=> b!1171458 (= e!665843 (and e!665841 mapRes!46007))))

(declare-fun condMapEmpty!46007 () Bool)

(declare-fun mapDefault!46007 () ValueCell!14017)

