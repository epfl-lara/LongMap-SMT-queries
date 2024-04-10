; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100270 () Bool)

(assert start!100270)

(declare-fun res!795997 () Bool)

(declare-fun e!679631 () Bool)

(assert (=> start!100270 (=> (not res!795997) (not e!679631))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77455 0))(
  ( (array!77456 (arr!37374 (Array (_ BitVec 32) (_ BitVec 64))) (size!37910 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77455)

(assert (=> start!100270 (= res!795997 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37910 _keys!1208))))))

(assert (=> start!100270 e!679631))

(declare-fun array_inv!28486 (array!77455) Bool)

(assert (=> start!100270 (array_inv!28486 _keys!1208)))

(assert (=> start!100270 true))

(declare-datatypes ((V!45577 0))(
  ( (V!45578 (val!15225 Int)) )
))
(declare-datatypes ((ValueCell!14459 0))(
  ( (ValueCellFull!14459 (v!17863 V!45577)) (EmptyCell!14459) )
))
(declare-datatypes ((array!77457 0))(
  ( (array!77458 (arr!37375 (Array (_ BitVec 32) ValueCell!14459)) (size!37911 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77457)

(declare-fun e!679628 () Bool)

(declare-fun array_inv!28487 (array!77457) Bool)

(assert (=> start!100270 (and (array_inv!28487 _values!996) e!679628)))

(declare-fun b!1196139 () Bool)

(declare-fun res!796001 () Bool)

(assert (=> b!1196139 (=> (not res!796001) (not e!679631))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196139 (= res!796001 (validMask!0 mask!1564))))

(declare-fun b!1196140 () Bool)

(declare-fun res!795998 () Bool)

(assert (=> b!1196140 (=> (not res!795998) (not e!679631))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196140 (= res!795998 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37910 _keys!1208))))))

(declare-fun b!1196141 () Bool)

(declare-fun res!796005 () Bool)

(assert (=> b!1196141 (=> (not res!796005) (not e!679631))))

(declare-datatypes ((List!26296 0))(
  ( (Nil!26293) (Cons!26292 (h!27501 (_ BitVec 64)) (t!38967 List!26296)) )
))
(declare-fun arrayNoDuplicates!0 (array!77455 (_ BitVec 32) List!26296) Bool)

(assert (=> b!1196141 (= res!796005 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26293))))

(declare-fun b!1196142 () Bool)

(declare-fun res!796003 () Bool)

(declare-fun e!679632 () Bool)

(assert (=> b!1196142 (=> (not res!796003) (not e!679632))))

(declare-fun lt!543036 () array!77455)

(assert (=> b!1196142 (= res!796003 (arrayNoDuplicates!0 lt!543036 #b00000000000000000000000000000000 Nil!26293))))

(declare-fun b!1196143 () Bool)

(declare-fun res!796000 () Bool)

(assert (=> b!1196143 (=> (not res!796000) (not e!679631))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196143 (= res!796000 (validKeyInArray!0 k!934))))

(declare-fun b!1196144 () Bool)

(declare-fun res!796006 () Bool)

(assert (=> b!1196144 (=> (not res!796006) (not e!679631))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196144 (= res!796006 (and (= (size!37911 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37910 _keys!1208) (size!37911 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47342 () Bool)

(declare-fun mapRes!47342 () Bool)

(assert (=> mapIsEmpty!47342 mapRes!47342))

(declare-fun b!1196145 () Bool)

(declare-fun e!679629 () Bool)

(declare-fun tp_is_empty!30337 () Bool)

(assert (=> b!1196145 (= e!679629 tp_is_empty!30337)))

(declare-fun mapNonEmpty!47342 () Bool)

(declare-fun tp!89952 () Bool)

(assert (=> mapNonEmpty!47342 (= mapRes!47342 (and tp!89952 e!679629))))

(declare-fun mapValue!47342 () ValueCell!14459)

(declare-fun mapKey!47342 () (_ BitVec 32))

(declare-fun mapRest!47342 () (Array (_ BitVec 32) ValueCell!14459))

(assert (=> mapNonEmpty!47342 (= (arr!37375 _values!996) (store mapRest!47342 mapKey!47342 mapValue!47342))))

(declare-fun b!1196146 () Bool)

(declare-fun res!795999 () Bool)

(assert (=> b!1196146 (=> (not res!795999) (not e!679631))))

(assert (=> b!1196146 (= res!795999 (= (select (arr!37374 _keys!1208) i!673) k!934))))

(declare-fun b!1196147 () Bool)

(declare-fun e!679630 () Bool)

(assert (=> b!1196147 (= e!679630 tp_is_empty!30337)))

(declare-fun b!1196148 () Bool)

(assert (=> b!1196148 (= e!679632 (not true))))

(declare-fun arrayContainsKey!0 (array!77455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196148 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39662 0))(
  ( (Unit!39663) )
))
(declare-fun lt!543035 () Unit!39662)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77455 (_ BitVec 64) (_ BitVec 32)) Unit!39662)

(assert (=> b!1196148 (= lt!543035 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1196149 () Bool)

(assert (=> b!1196149 (= e!679628 (and e!679630 mapRes!47342))))

(declare-fun condMapEmpty!47342 () Bool)

(declare-fun mapDefault!47342 () ValueCell!14459)

