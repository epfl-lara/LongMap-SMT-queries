; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101274 () Bool)

(assert start!101274)

(declare-fun b_free!26197 () Bool)

(declare-fun b_next!26197 () Bool)

(assert (=> start!101274 (= b_free!26197 (not b_next!26197))))

(declare-fun tp!91613 () Bool)

(declare-fun b_and!43511 () Bool)

(assert (=> start!101274 (= tp!91613 b_and!43511)))

(declare-fun b!1216630 () Bool)

(declare-fun e!690730 () Bool)

(declare-fun e!690724 () Bool)

(assert (=> b!1216630 (= e!690730 e!690724)))

(declare-fun res!807902 () Bool)

(assert (=> b!1216630 (=> (not res!807902) (not e!690724))))

(declare-datatypes ((array!78573 0))(
  ( (array!78574 (arr!37921 (Array (_ BitVec 32) (_ BitVec 64))) (size!38457 (_ BitVec 32))) )
))
(declare-fun lt!552975 () array!78573)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78573 (_ BitVec 32)) Bool)

(assert (=> b!1216630 (= res!807902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552975 mask!1564))))

(declare-fun _keys!1208 () array!78573)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216630 (= lt!552975 (array!78574 (store (arr!37921 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38457 _keys!1208)))))

(declare-fun b!1216631 () Bool)

(declare-fun res!807903 () Bool)

(assert (=> b!1216631 (=> (not res!807903) (not e!690730))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46329 0))(
  ( (V!46330 (val!15507 Int)) )
))
(declare-datatypes ((ValueCell!14741 0))(
  ( (ValueCellFull!14741 (v!18160 V!46329)) (EmptyCell!14741) )
))
(declare-datatypes ((array!78575 0))(
  ( (array!78576 (arr!37922 (Array (_ BitVec 32) ValueCell!14741)) (size!38458 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78575)

(assert (=> b!1216631 (= res!807903 (and (= (size!38458 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38457 _keys!1208) (size!38458 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216632 () Bool)

(declare-fun e!690729 () Bool)

(declare-fun e!690722 () Bool)

(assert (=> b!1216632 (= e!690729 e!690722)))

(declare-fun res!807914 () Bool)

(assert (=> b!1216632 (=> res!807914 e!690722)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216632 (= res!807914 (not (validKeyInArray!0 (select (arr!37921 _keys!1208) from!1455))))))

(declare-fun zeroValue!944 () V!46329)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!552977 () array!78575)

(declare-fun minValue!944 () V!46329)

(declare-datatypes ((tuple2!19930 0))(
  ( (tuple2!19931 (_1!9976 (_ BitVec 64)) (_2!9976 V!46329)) )
))
(declare-datatypes ((List!26735 0))(
  ( (Nil!26732) (Cons!26731 (h!27940 tuple2!19930) (t!39912 List!26735)) )
))
(declare-datatypes ((ListLongMap!17899 0))(
  ( (ListLongMap!17900 (toList!8965 List!26735)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5392 (array!78573 array!78575 (_ BitVec 32) (_ BitVec 32) V!46329 V!46329 (_ BitVec 32) Int) ListLongMap!17899)

(declare-fun -!1884 (ListLongMap!17899 (_ BitVec 64)) ListLongMap!17899)

(assert (=> b!1216632 (= (getCurrentListMapNoExtraKeys!5392 lt!552975 lt!552977 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1884 (getCurrentListMapNoExtraKeys!5392 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!40338 0))(
  ( (Unit!40339) )
))
(declare-fun lt!552974 () Unit!40338)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1091 (array!78573 array!78575 (_ BitVec 32) (_ BitVec 32) V!46329 V!46329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40338)

(assert (=> b!1216632 (= lt!552974 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1091 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216634 () Bool)

(declare-fun e!690727 () Bool)

(assert (=> b!1216634 (= e!690727 e!690729)))

(declare-fun res!807905 () Bool)

(assert (=> b!1216634 (=> res!807905 e!690729)))

(assert (=> b!1216634 (= res!807905 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!552978 () ListLongMap!17899)

(assert (=> b!1216634 (= lt!552978 (getCurrentListMapNoExtraKeys!5392 lt!552975 lt!552977 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3281 (Int (_ BitVec 64)) V!46329)

(assert (=> b!1216634 (= lt!552977 (array!78576 (store (arr!37922 _values!996) i!673 (ValueCellFull!14741 (dynLambda!3281 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38458 _values!996)))))

(declare-fun lt!552973 () ListLongMap!17899)

(assert (=> b!1216634 (= lt!552973 (getCurrentListMapNoExtraKeys!5392 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216635 () Bool)

(declare-fun e!690723 () Bool)

(declare-fun tp_is_empty!30901 () Bool)

(assert (=> b!1216635 (= e!690723 tp_is_empty!30901)))

(declare-fun b!1216636 () Bool)

(declare-fun res!807906 () Bool)

(assert (=> b!1216636 (=> (not res!807906) (not e!690730))))

(assert (=> b!1216636 (= res!807906 (= (select (arr!37921 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!48226 () Bool)

(declare-fun mapRes!48226 () Bool)

(declare-fun tp!91612 () Bool)

(declare-fun e!690725 () Bool)

(assert (=> mapNonEmpty!48226 (= mapRes!48226 (and tp!91612 e!690725))))

(declare-fun mapValue!48226 () ValueCell!14741)

(declare-fun mapRest!48226 () (Array (_ BitVec 32) ValueCell!14741))

(declare-fun mapKey!48226 () (_ BitVec 32))

(assert (=> mapNonEmpty!48226 (= (arr!37922 _values!996) (store mapRest!48226 mapKey!48226 mapValue!48226))))

(declare-fun b!1216637 () Bool)

(declare-fun res!807910 () Bool)

(assert (=> b!1216637 (=> (not res!807910) (not e!690730))))

(assert (=> b!1216637 (= res!807910 (validKeyInArray!0 k!934))))

(declare-fun b!1216638 () Bool)

(declare-fun res!807912 () Bool)

(assert (=> b!1216638 (=> (not res!807912) (not e!690730))))

(declare-datatypes ((List!26736 0))(
  ( (Nil!26733) (Cons!26732 (h!27941 (_ BitVec 64)) (t!39913 List!26736)) )
))
(declare-fun arrayNoDuplicates!0 (array!78573 (_ BitVec 32) List!26736) Bool)

(assert (=> b!1216638 (= res!807912 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26733))))

(declare-fun b!1216639 () Bool)

(declare-fun res!807907 () Bool)

(assert (=> b!1216639 (=> (not res!807907) (not e!690730))))

(assert (=> b!1216639 (= res!807907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216640 () Bool)

(declare-fun e!690726 () Bool)

(assert (=> b!1216640 (= e!690726 (and e!690723 mapRes!48226))))

(declare-fun condMapEmpty!48226 () Bool)

(declare-fun mapDefault!48226 () ValueCell!14741)

