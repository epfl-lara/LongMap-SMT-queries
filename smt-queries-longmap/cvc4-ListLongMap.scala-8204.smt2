; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100094 () Bool)

(assert start!100094)

(declare-fun b!1193470 () Bool)

(declare-fun e!678302 () Bool)

(assert (=> b!1193470 (= e!678302 (not true))))

(declare-datatypes ((array!77185 0))(
  ( (array!77186 (arr!37242 (Array (_ BitVec 32) (_ BitVec 64))) (size!37778 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77185)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193470 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39592 0))(
  ( (Unit!39593) )
))
(declare-fun lt!542585 () Unit!39592)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77185 (_ BitVec 64) (_ BitVec 32)) Unit!39592)

(assert (=> b!1193470 (= lt!542585 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!47132 () Bool)

(declare-fun mapRes!47132 () Bool)

(declare-fun tp!89724 () Bool)

(declare-fun e!678303 () Bool)

(assert (=> mapNonEmpty!47132 (= mapRes!47132 (and tp!89724 e!678303))))

(declare-datatypes ((V!45397 0))(
  ( (V!45398 (val!15158 Int)) )
))
(declare-datatypes ((ValueCell!14392 0))(
  ( (ValueCellFull!14392 (v!17796 V!45397)) (EmptyCell!14392) )
))
(declare-fun mapRest!47132 () (Array (_ BitVec 32) ValueCell!14392))

(declare-fun mapValue!47132 () ValueCell!14392)

(declare-datatypes ((array!77187 0))(
  ( (array!77188 (arr!37243 (Array (_ BitVec 32) ValueCell!14392)) (size!37779 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77187)

(declare-fun mapKey!47132 () (_ BitVec 32))

(assert (=> mapNonEmpty!47132 (= (arr!37243 _values!996) (store mapRest!47132 mapKey!47132 mapValue!47132))))

(declare-fun b!1193471 () Bool)

(declare-fun e!678300 () Bool)

(assert (=> b!1193471 (= e!678300 e!678302)))

(declare-fun res!794035 () Bool)

(assert (=> b!1193471 (=> (not res!794035) (not e!678302))))

(declare-fun lt!542586 () array!77185)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77185 (_ BitVec 32)) Bool)

(assert (=> b!1193471 (= res!794035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542586 mask!1564))))

(assert (=> b!1193471 (= lt!542586 (array!77186 (store (arr!37242 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37778 _keys!1208)))))

(declare-fun b!1193472 () Bool)

(declare-fun res!794032 () Bool)

(assert (=> b!1193472 (=> (not res!794032) (not e!678300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193472 (= res!794032 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!47132 () Bool)

(assert (=> mapIsEmpty!47132 mapRes!47132))

(declare-fun b!1193473 () Bool)

(declare-fun e!678304 () Bool)

(declare-fun tp_is_empty!30203 () Bool)

(assert (=> b!1193473 (= e!678304 tp_is_empty!30203)))

(declare-fun b!1193474 () Bool)

(declare-fun res!794040 () Bool)

(assert (=> b!1193474 (=> (not res!794040) (not e!678300))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1193474 (= res!794040 (and (= (size!37779 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37778 _keys!1208) (size!37779 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193475 () Bool)

(declare-fun res!794039 () Bool)

(assert (=> b!1193475 (=> (not res!794039) (not e!678300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193475 (= res!794039 (validMask!0 mask!1564))))

(declare-fun b!1193476 () Bool)

(declare-fun res!794033 () Bool)

(assert (=> b!1193476 (=> (not res!794033) (not e!678302))))

(declare-datatypes ((List!26232 0))(
  ( (Nil!26229) (Cons!26228 (h!27437 (_ BitVec 64)) (t!38891 List!26232)) )
))
(declare-fun arrayNoDuplicates!0 (array!77185 (_ BitVec 32) List!26232) Bool)

(assert (=> b!1193476 (= res!794033 (arrayNoDuplicates!0 lt!542586 #b00000000000000000000000000000000 Nil!26229))))

(declare-fun b!1193469 () Bool)

(declare-fun res!794037 () Bool)

(assert (=> b!1193469 (=> (not res!794037) (not e!678300))))

(assert (=> b!1193469 (= res!794037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!794034 () Bool)

(assert (=> start!100094 (=> (not res!794034) (not e!678300))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100094 (= res!794034 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37778 _keys!1208))))))

(assert (=> start!100094 e!678300))

(declare-fun array_inv!28394 (array!77185) Bool)

(assert (=> start!100094 (array_inv!28394 _keys!1208)))

(assert (=> start!100094 true))

(declare-fun e!678299 () Bool)

(declare-fun array_inv!28395 (array!77187) Bool)

(assert (=> start!100094 (and (array_inv!28395 _values!996) e!678299)))

(declare-fun b!1193477 () Bool)

(declare-fun res!794041 () Bool)

(assert (=> b!1193477 (=> (not res!794041) (not e!678300))))

(assert (=> b!1193477 (= res!794041 (= (select (arr!37242 _keys!1208) i!673) k!934))))

(declare-fun b!1193478 () Bool)

(declare-fun res!794036 () Bool)

(assert (=> b!1193478 (=> (not res!794036) (not e!678300))))

(assert (=> b!1193478 (= res!794036 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37778 _keys!1208))))))

(declare-fun b!1193479 () Bool)

(assert (=> b!1193479 (= e!678299 (and e!678304 mapRes!47132))))

(declare-fun condMapEmpty!47132 () Bool)

(declare-fun mapDefault!47132 () ValueCell!14392)

