; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99872 () Bool)

(assert start!99872)

(declare-fun b_free!25451 () Bool)

(declare-fun b_next!25451 () Bool)

(assert (=> start!99872 (= b_free!25451 (not b_next!25451))))

(declare-fun tp!89067 () Bool)

(declare-fun b_and!41769 () Bool)

(assert (=> start!99872 (= tp!89067 b_and!41769)))

(declare-fun b!1188267 () Bool)

(declare-fun res!790060 () Bool)

(declare-fun e!675652 () Bool)

(assert (=> b!1188267 (=> (not res!790060) (not e!675652))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188267 (= res!790060 (validKeyInArray!0 k!934))))

(declare-fun res!790058 () Bool)

(assert (=> start!99872 (=> (not res!790058) (not e!675652))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76757 0))(
  ( (array!76758 (arr!37028 (Array (_ BitVec 32) (_ BitVec 64))) (size!37564 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76757)

(assert (=> start!99872 (= res!790058 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37564 _keys!1208))))))

(assert (=> start!99872 e!675652))

(declare-fun tp_is_empty!29981 () Bool)

(assert (=> start!99872 tp_is_empty!29981))

(declare-fun array_inv!28252 (array!76757) Bool)

(assert (=> start!99872 (array_inv!28252 _keys!1208)))

(assert (=> start!99872 true))

(assert (=> start!99872 tp!89067))

(declare-datatypes ((V!45101 0))(
  ( (V!45102 (val!15047 Int)) )
))
(declare-datatypes ((ValueCell!14281 0))(
  ( (ValueCellFull!14281 (v!17685 V!45101)) (EmptyCell!14281) )
))
(declare-datatypes ((array!76759 0))(
  ( (array!76760 (arr!37029 (Array (_ BitVec 32) ValueCell!14281)) (size!37565 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76759)

(declare-fun e!675656 () Bool)

(declare-fun array_inv!28253 (array!76759) Bool)

(assert (=> start!99872 (and (array_inv!28253 _values!996) e!675656)))

(declare-fun b!1188268 () Bool)

(declare-fun res!790049 () Bool)

(assert (=> b!1188268 (=> (not res!790049) (not e!675652))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188268 (= res!790049 (= (select (arr!37028 _keys!1208) i!673) k!934))))

(declare-fun b!1188269 () Bool)

(declare-fun e!675654 () Bool)

(assert (=> b!1188269 (= e!675652 e!675654)))

(declare-fun res!790056 () Bool)

(assert (=> b!1188269 (=> (not res!790056) (not e!675654))))

(declare-fun lt!540624 () array!76757)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76757 (_ BitVec 32)) Bool)

(assert (=> b!1188269 (= res!790056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540624 mask!1564))))

(assert (=> b!1188269 (= lt!540624 (array!76758 (store (arr!37028 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37564 _keys!1208)))))

(declare-fun b!1188270 () Bool)

(declare-fun e!675657 () Bool)

(assert (=> b!1188270 (= e!675657 tp_is_empty!29981)))

(declare-fun b!1188271 () Bool)

(declare-fun e!675655 () Bool)

(assert (=> b!1188271 (= e!675655 tp_is_empty!29981)))

(declare-fun b!1188272 () Bool)

(declare-fun res!790063 () Bool)

(assert (=> b!1188272 (=> (not res!790063) (not e!675652))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1188272 (= res!790063 (and (= (size!37565 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37564 _keys!1208) (size!37565 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188273 () Bool)

(declare-fun res!790057 () Bool)

(assert (=> b!1188273 (=> (not res!790057) (not e!675654))))

(declare-datatypes ((List!26064 0))(
  ( (Nil!26061) (Cons!26060 (h!27269 (_ BitVec 64)) (t!38507 List!26064)) )
))
(declare-fun arrayNoDuplicates!0 (array!76757 (_ BitVec 32) List!26064) Bool)

(assert (=> b!1188273 (= res!790057 (arrayNoDuplicates!0 lt!540624 #b00000000000000000000000000000000 Nil!26061))))

(declare-fun b!1188274 () Bool)

(declare-fun e!675650 () Bool)

(declare-fun arrayContainsKey!0 (array!76757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188274 (= e!675650 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!46799 () Bool)

(declare-fun mapRes!46799 () Bool)

(declare-fun tp!89066 () Bool)

(assert (=> mapNonEmpty!46799 (= mapRes!46799 (and tp!89066 e!675655))))

(declare-fun mapKey!46799 () (_ BitVec 32))

(declare-fun mapValue!46799 () ValueCell!14281)

(declare-fun mapRest!46799 () (Array (_ BitVec 32) ValueCell!14281))

(assert (=> mapNonEmpty!46799 (= (arr!37029 _values!996) (store mapRest!46799 mapKey!46799 mapValue!46799))))

(declare-fun b!1188275 () Bool)

(assert (=> b!1188275 (= e!675656 (and e!675657 mapRes!46799))))

(declare-fun condMapEmpty!46799 () Bool)

(declare-fun mapDefault!46799 () ValueCell!14281)

