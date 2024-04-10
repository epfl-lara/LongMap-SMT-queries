; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100264 () Bool)

(assert start!100264)

(declare-fun b!1196022 () Bool)

(declare-fun res!795915 () Bool)

(declare-fun e!679576 () Bool)

(assert (=> b!1196022 (=> (not res!795915) (not e!679576))))

(declare-datatypes ((array!77443 0))(
  ( (array!77444 (arr!37368 (Array (_ BitVec 32) (_ BitVec 64))) (size!37904 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77443)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45569 0))(
  ( (V!45570 (val!15222 Int)) )
))
(declare-datatypes ((ValueCell!14456 0))(
  ( (ValueCellFull!14456 (v!17860 V!45569)) (EmptyCell!14456) )
))
(declare-datatypes ((array!77445 0))(
  ( (array!77446 (arr!37369 (Array (_ BitVec 32) ValueCell!14456)) (size!37905 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77445)

(assert (=> b!1196022 (= res!795915 (and (= (size!37905 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37904 _keys!1208) (size!37905 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196023 () Bool)

(declare-fun e!679577 () Bool)

(assert (=> b!1196023 (= e!679577 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196023 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39656 0))(
  ( (Unit!39657) )
))
(declare-fun lt!543017 () Unit!39656)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77443 (_ BitVec 64) (_ BitVec 32)) Unit!39656)

(assert (=> b!1196023 (= lt!543017 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1196024 () Bool)

(declare-fun res!795913 () Bool)

(assert (=> b!1196024 (=> (not res!795913) (not e!679576))))

(assert (=> b!1196024 (= res!795913 (= (select (arr!37368 _keys!1208) i!673) k!934))))

(declare-fun b!1196025 () Bool)

(declare-fun res!795912 () Bool)

(assert (=> b!1196025 (=> (not res!795912) (not e!679577))))

(declare-fun lt!543018 () array!77443)

(declare-datatypes ((List!26293 0))(
  ( (Nil!26290) (Cons!26289 (h!27498 (_ BitVec 64)) (t!38964 List!26293)) )
))
(declare-fun arrayNoDuplicates!0 (array!77443 (_ BitVec 32) List!26293) Bool)

(assert (=> b!1196025 (= res!795912 (arrayNoDuplicates!0 lt!543018 #b00000000000000000000000000000000 Nil!26290))))

(declare-fun mapNonEmpty!47333 () Bool)

(declare-fun mapRes!47333 () Bool)

(declare-fun tp!89943 () Bool)

(declare-fun e!679578 () Bool)

(assert (=> mapNonEmpty!47333 (= mapRes!47333 (and tp!89943 e!679578))))

(declare-fun mapKey!47333 () (_ BitVec 32))

(declare-fun mapRest!47333 () (Array (_ BitVec 32) ValueCell!14456))

(declare-fun mapValue!47333 () ValueCell!14456)

(assert (=> mapNonEmpty!47333 (= (arr!37369 _values!996) (store mapRest!47333 mapKey!47333 mapValue!47333))))

(declare-fun res!795911 () Bool)

(assert (=> start!100264 (=> (not res!795911) (not e!679576))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100264 (= res!795911 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37904 _keys!1208))))))

(assert (=> start!100264 e!679576))

(declare-fun array_inv!28482 (array!77443) Bool)

(assert (=> start!100264 (array_inv!28482 _keys!1208)))

(assert (=> start!100264 true))

(declare-fun e!679575 () Bool)

(declare-fun array_inv!28483 (array!77445) Bool)

(assert (=> start!100264 (and (array_inv!28483 _values!996) e!679575)))

(declare-fun mapIsEmpty!47333 () Bool)

(assert (=> mapIsEmpty!47333 mapRes!47333))

(declare-fun b!1196026 () Bool)

(declare-fun res!795908 () Bool)

(assert (=> b!1196026 (=> (not res!795908) (not e!679576))))

(assert (=> b!1196026 (= res!795908 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37904 _keys!1208))))))

(declare-fun b!1196027 () Bool)

(declare-fun res!795916 () Bool)

(assert (=> b!1196027 (=> (not res!795916) (not e!679576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196027 (= res!795916 (validKeyInArray!0 k!934))))

(declare-fun b!1196028 () Bool)

(declare-fun res!795907 () Bool)

(assert (=> b!1196028 (=> (not res!795907) (not e!679576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77443 (_ BitVec 32)) Bool)

(assert (=> b!1196028 (= res!795907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196029 () Bool)

(declare-fun e!679574 () Bool)

(declare-fun tp_is_empty!30331 () Bool)

(assert (=> b!1196029 (= e!679574 tp_is_empty!30331)))

(declare-fun b!1196030 () Bool)

(assert (=> b!1196030 (= e!679575 (and e!679574 mapRes!47333))))

(declare-fun condMapEmpty!47333 () Bool)

(declare-fun mapDefault!47333 () ValueCell!14456)

