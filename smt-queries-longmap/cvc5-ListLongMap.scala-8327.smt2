; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101362 () Bool)

(assert start!101362)

(declare-fun b_free!26233 () Bool)

(declare-fun b_next!26233 () Bool)

(assert (=> start!101362 (= b_free!26233 (not b_next!26233))))

(declare-fun tp!91727 () Bool)

(declare-fun b_and!43619 () Bool)

(assert (=> start!101362 (= tp!91727 b_and!43619)))

(declare-fun b!1217831 () Bool)

(declare-fun res!808743 () Bool)

(declare-fun e!691418 () Bool)

(assert (=> b!1217831 (=> (not res!808743) (not e!691418))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78649 0))(
  ( (array!78650 (arr!37957 (Array (_ BitVec 32) (_ BitVec 64))) (size!38493 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78649)

(assert (=> b!1217831 (= res!808743 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38493 _keys!1208))))))

(declare-fun b!1217832 () Bool)

(declare-fun e!691420 () Bool)

(assert (=> b!1217832 (= e!691418 e!691420)))

(declare-fun res!808750 () Bool)

(assert (=> b!1217832 (=> (not res!808750) (not e!691420))))

(declare-fun lt!553565 () array!78649)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78649 (_ BitVec 32)) Bool)

(assert (=> b!1217832 (= res!808750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553565 mask!1564))))

(assert (=> b!1217832 (= lt!553565 (array!78650 (store (arr!37957 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38493 _keys!1208)))))

(declare-fun res!808742 () Bool)

(assert (=> start!101362 (=> (not res!808742) (not e!691418))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101362 (= res!808742 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38493 _keys!1208))))))

(assert (=> start!101362 e!691418))

(declare-fun tp_is_empty!30937 () Bool)

(assert (=> start!101362 tp_is_empty!30937))

(declare-fun array_inv!28892 (array!78649) Bool)

(assert (=> start!101362 (array_inv!28892 _keys!1208)))

(assert (=> start!101362 true))

(assert (=> start!101362 tp!91727))

(declare-datatypes ((V!46377 0))(
  ( (V!46378 (val!15525 Int)) )
))
(declare-datatypes ((ValueCell!14759 0))(
  ( (ValueCellFull!14759 (v!18180 V!46377)) (EmptyCell!14759) )
))
(declare-datatypes ((array!78651 0))(
  ( (array!78652 (arr!37958 (Array (_ BitVec 32) ValueCell!14759)) (size!38494 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78651)

(declare-fun e!691413 () Bool)

(declare-fun array_inv!28893 (array!78651) Bool)

(assert (=> start!101362 (and (array_inv!28893 _values!996) e!691413)))

(declare-fun b!1217833 () Bool)

(declare-fun res!808738 () Bool)

(assert (=> b!1217833 (=> (not res!808738) (not e!691420))))

(declare-datatypes ((List!26770 0))(
  ( (Nil!26767) (Cons!26766 (h!27975 (_ BitVec 64)) (t!39983 List!26770)) )
))
(declare-fun arrayNoDuplicates!0 (array!78649 (_ BitVec 32) List!26770) Bool)

(assert (=> b!1217833 (= res!808738 (arrayNoDuplicates!0 lt!553565 #b00000000000000000000000000000000 Nil!26767))))

(declare-fun mapNonEmpty!48286 () Bool)

(declare-fun mapRes!48286 () Bool)

(declare-fun tp!91726 () Bool)

(declare-fun e!691419 () Bool)

(assert (=> mapNonEmpty!48286 (= mapRes!48286 (and tp!91726 e!691419))))

(declare-fun mapRest!48286 () (Array (_ BitVec 32) ValueCell!14759))

(declare-fun mapKey!48286 () (_ BitVec 32))

(declare-fun mapValue!48286 () ValueCell!14759)

(assert (=> mapNonEmpty!48286 (= (arr!37958 _values!996) (store mapRest!48286 mapKey!48286 mapValue!48286))))

(declare-fun b!1217834 () Bool)

(assert (=> b!1217834 (= e!691419 tp_is_empty!30937)))

(declare-fun b!1217835 () Bool)

(declare-fun res!808739 () Bool)

(assert (=> b!1217835 (=> (not res!808739) (not e!691418))))

(assert (=> b!1217835 (= res!808739 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26767))))

(declare-fun b!1217836 () Bool)

(declare-fun e!691417 () Bool)

(declare-fun e!691421 () Bool)

(assert (=> b!1217836 (= e!691417 e!691421)))

(declare-fun res!808747 () Bool)

(assert (=> b!1217836 (=> res!808747 e!691421)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1217836 (= res!808747 (not (= (select (arr!37957 _keys!1208) from!1455) k!934)))))

(declare-fun b!1217837 () Bool)

(declare-fun res!808737 () Bool)

(assert (=> b!1217837 (=> (not res!808737) (not e!691418))))

(assert (=> b!1217837 (= res!808737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217838 () Bool)

(declare-fun e!691411 () Bool)

(assert (=> b!1217838 (= e!691420 (not e!691411))))

(declare-fun res!808751 () Bool)

(assert (=> b!1217838 (=> res!808751 e!691411)))

(assert (=> b!1217838 (= res!808751 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217838 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40370 0))(
  ( (Unit!40371) )
))
(declare-fun lt!553564 () Unit!40370)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78649 (_ BitVec 64) (_ BitVec 32)) Unit!40370)

(assert (=> b!1217838 (= lt!553564 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1217839 () Bool)

(declare-fun res!808748 () Bool)

(assert (=> b!1217839 (=> (not res!808748) (not e!691418))))

(assert (=> b!1217839 (= res!808748 (= (select (arr!37957 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!48286 () Bool)

(assert (=> mapIsEmpty!48286 mapRes!48286))

(declare-fun b!1217840 () Bool)

(declare-fun res!808744 () Bool)

(assert (=> b!1217840 (=> (not res!808744) (not e!691418))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1217840 (= res!808744 (and (= (size!38494 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38493 _keys!1208) (size!38494 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217841 () Bool)

(declare-fun e!691416 () Bool)

(declare-fun e!691412 () Bool)

(assert (=> b!1217841 (= e!691416 e!691412)))

(declare-fun res!808740 () Bool)

(assert (=> b!1217841 (=> res!808740 e!691412)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217841 (= res!808740 (not (validKeyInArray!0 (select (arr!37957 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19966 0))(
  ( (tuple2!19967 (_1!9994 (_ BitVec 64)) (_2!9994 V!46377)) )
))
(declare-datatypes ((List!26771 0))(
  ( (Nil!26768) (Cons!26767 (h!27976 tuple2!19966) (t!39984 List!26771)) )
))
(declare-datatypes ((ListLongMap!17935 0))(
  ( (ListLongMap!17936 (toList!8983 List!26771)) )
))
(declare-fun lt!553572 () ListLongMap!17935)

(declare-fun lt!553569 () ListLongMap!17935)

(assert (=> b!1217841 (= lt!553572 lt!553569)))

(declare-fun lt!553570 () ListLongMap!17935)

(declare-fun -!1899 (ListLongMap!17935 (_ BitVec 64)) ListLongMap!17935)

(assert (=> b!1217841 (= lt!553569 (-!1899 lt!553570 k!934))))

(declare-fun zeroValue!944 () V!46377)

(declare-fun lt!553567 () array!78651)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46377)

(declare-fun getCurrentListMapNoExtraKeys!5410 (array!78649 array!78651 (_ BitVec 32) (_ BitVec 32) V!46377 V!46377 (_ BitVec 32) Int) ListLongMap!17935)

(assert (=> b!1217841 (= lt!553572 (getCurrentListMapNoExtraKeys!5410 lt!553565 lt!553567 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1217841 (= lt!553570 (getCurrentListMapNoExtraKeys!5410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553563 () Unit!40370)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1106 (array!78649 array!78651 (_ BitVec 32) (_ BitVec 32) V!46377 V!46377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40370)

(assert (=> b!1217841 (= lt!553563 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1106 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217842 () Bool)

(declare-fun e!691415 () Bool)

(assert (=> b!1217842 (= e!691415 tp_is_empty!30937)))

(declare-fun b!1217843 () Bool)

(declare-fun res!808749 () Bool)

(assert (=> b!1217843 (=> (not res!808749) (not e!691418))))

(assert (=> b!1217843 (= res!808749 (validKeyInArray!0 k!934))))

(declare-fun b!1217844 () Bool)

(assert (=> b!1217844 (= e!691421 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1217845 () Bool)

(declare-fun res!808745 () Bool)

(assert (=> b!1217845 (=> (not res!808745) (not e!691418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217845 (= res!808745 (validMask!0 mask!1564))))

(declare-fun b!1217846 () Bool)

(assert (=> b!1217846 (= e!691413 (and e!691415 mapRes!48286))))

(declare-fun condMapEmpty!48286 () Bool)

(declare-fun mapDefault!48286 () ValueCell!14759)

