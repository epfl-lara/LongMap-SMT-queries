; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100424 () Bool)

(assert start!100424)

(declare-fun b_free!25747 () Bool)

(declare-fun b_next!25747 () Bool)

(assert (=> start!100424 (= b_free!25747 (not b_next!25747))))

(declare-fun tp!90231 () Bool)

(declare-fun b_and!42381 () Bool)

(assert (=> start!100424 (= tp!90231 b_and!42381)))

(declare-fun b!1198836 () Bool)

(declare-fun res!797906 () Bool)

(declare-fun e!680957 () Bool)

(assert (=> b!1198836 (=> (not res!797906) (not e!680957))))

(declare-datatypes ((array!77679 0))(
  ( (array!77680 (arr!37484 (Array (_ BitVec 32) (_ BitVec 64))) (size!38020 (_ BitVec 32))) )
))
(declare-fun lt!543607 () array!77679)

(declare-datatypes ((List!26372 0))(
  ( (Nil!26369) (Cons!26368 (h!27577 (_ BitVec 64)) (t!39099 List!26372)) )
))
(declare-fun arrayNoDuplicates!0 (array!77679 (_ BitVec 32) List!26372) Bool)

(assert (=> b!1198836 (= res!797906 (arrayNoDuplicates!0 lt!543607 #b00000000000000000000000000000000 Nil!26369))))

(declare-fun b!1198838 () Bool)

(declare-fun res!797911 () Bool)

(declare-fun e!680961 () Bool)

(assert (=> b!1198838 (=> (not res!797911) (not e!680961))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198838 (= res!797911 (validMask!0 mask!1564))))

(declare-fun b!1198839 () Bool)

(declare-fun res!797908 () Bool)

(assert (=> b!1198839 (=> (not res!797908) (not e!680961))))

(declare-fun _keys!1208 () array!77679)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77679 (_ BitVec 32)) Bool)

(assert (=> b!1198839 (= res!797908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198840 () Bool)

(assert (=> b!1198840 (= e!680961 e!680957)))

(declare-fun res!797913 () Bool)

(assert (=> b!1198840 (=> (not res!797913) (not e!680957))))

(assert (=> b!1198840 (= res!797913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543607 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198840 (= lt!543607 (array!77680 (store (arr!37484 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38020 _keys!1208)))))

(declare-fun b!1198841 () Bool)

(declare-fun e!680959 () Bool)

(assert (=> b!1198841 (= e!680957 (not e!680959))))

(declare-fun res!797907 () Bool)

(assert (=> b!1198841 (=> res!797907 e!680959)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1198841 (= res!797907 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198841 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39750 0))(
  ( (Unit!39751) )
))
(declare-fun lt!543606 () Unit!39750)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77679 (_ BitVec 64) (_ BitVec 32)) Unit!39750)

(assert (=> b!1198841 (= lt!543606 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1198842 () Bool)

(declare-fun e!680956 () Bool)

(declare-fun tp_is_empty!30451 () Bool)

(assert (=> b!1198842 (= e!680956 tp_is_empty!30451)))

(declare-fun b!1198843 () Bool)

(declare-fun res!797905 () Bool)

(assert (=> b!1198843 (=> (not res!797905) (not e!680961))))

(assert (=> b!1198843 (= res!797905 (= (select (arr!37484 _keys!1208) i!673) k!934))))

(declare-fun b!1198844 () Bool)

(assert (=> b!1198844 (= e!680959 true)))

(declare-datatypes ((V!45729 0))(
  ( (V!45730 (val!15282 Int)) )
))
(declare-fun zeroValue!944 () V!45729)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45729)

(declare-datatypes ((ValueCell!14516 0))(
  ( (ValueCellFull!14516 (v!17920 V!45729)) (EmptyCell!14516) )
))
(declare-datatypes ((array!77681 0))(
  ( (array!77682 (arr!37485 (Array (_ BitVec 32) ValueCell!14516)) (size!38021 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77681)

(declare-datatypes ((tuple2!19556 0))(
  ( (tuple2!19557 (_1!9789 (_ BitVec 64)) (_2!9789 V!45729)) )
))
(declare-datatypes ((List!26373 0))(
  ( (Nil!26370) (Cons!26369 (h!27578 tuple2!19556) (t!39100 List!26373)) )
))
(declare-datatypes ((ListLongMap!17525 0))(
  ( (ListLongMap!17526 (toList!8778 List!26373)) )
))
(declare-fun lt!543604 () ListLongMap!17525)

(declare-fun getCurrentListMapNoExtraKeys!5217 (array!77679 array!77681 (_ BitVec 32) (_ BitVec 32) V!45729 V!45729 (_ BitVec 32) Int) ListLongMap!17525)

(declare-fun dynLambda!3137 (Int (_ BitVec 64)) V!45729)

(assert (=> b!1198844 (= lt!543604 (getCurrentListMapNoExtraKeys!5217 lt!543607 (array!77682 (store (arr!37485 _values!996) i!673 (ValueCellFull!14516 (dynLambda!3137 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38021 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543605 () ListLongMap!17525)

(assert (=> b!1198844 (= lt!543605 (getCurrentListMapNoExtraKeys!5217 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198845 () Bool)

(declare-fun e!680958 () Bool)

(assert (=> b!1198845 (= e!680958 tp_is_empty!30451)))

(declare-fun b!1198837 () Bool)

(declare-fun e!680962 () Bool)

(declare-fun mapRes!47519 () Bool)

(assert (=> b!1198837 (= e!680962 (and e!680956 mapRes!47519))))

(declare-fun condMapEmpty!47519 () Bool)

(declare-fun mapDefault!47519 () ValueCell!14516)

