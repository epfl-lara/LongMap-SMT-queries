; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101256 () Bool)

(assert start!101256)

(declare-fun b_free!26179 () Bool)

(declare-fun b_next!26179 () Bool)

(assert (=> start!101256 (= b_free!26179 (not b_next!26179))))

(declare-fun tp!91558 () Bool)

(declare-fun b_and!43475 () Bool)

(assert (=> start!101256 (= tp!91558 b_and!43475)))

(declare-fun b!1216212 () Bool)

(declare-fun res!807583 () Bool)

(declare-fun e!690516 () Bool)

(assert (=> b!1216212 (=> (not res!807583) (not e!690516))))

(declare-datatypes ((array!78539 0))(
  ( (array!78540 (arr!37904 (Array (_ BitVec 32) (_ BitVec 64))) (size!38440 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78539)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1216212 (= res!807583 (= (select (arr!37904 _keys!1208) i!673) k!934))))

(declare-fun b!1216213 () Bool)

(declare-fun e!690514 () Bool)

(declare-fun tp_is_empty!30883 () Bool)

(assert (=> b!1216213 (= e!690514 tp_is_empty!30883)))

(declare-fun b!1216214 () Bool)

(declare-fun res!807592 () Bool)

(assert (=> b!1216214 (=> (not res!807592) (not e!690516))))

(assert (=> b!1216214 (= res!807592 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38440 _keys!1208))))))

(declare-fun b!1216215 () Bool)

(declare-fun e!690513 () Bool)

(declare-fun e!690517 () Bool)

(assert (=> b!1216215 (= e!690513 (not e!690517))))

(declare-fun res!807591 () Bool)

(assert (=> b!1216215 (=> res!807591 e!690517)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1216215 (= res!807591 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216215 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40322 0))(
  ( (Unit!40323) )
))
(declare-fun lt!552825 () Unit!40322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78539 (_ BitVec 64) (_ BitVec 32)) Unit!40322)

(assert (=> b!1216215 (= lt!552825 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!807587 () Bool)

(assert (=> start!101256 (=> (not res!807587) (not e!690516))))

(assert (=> start!101256 (= res!807587 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38440 _keys!1208))))))

(assert (=> start!101256 e!690516))

(assert (=> start!101256 tp_is_empty!30883))

(declare-fun array_inv!28858 (array!78539) Bool)

(assert (=> start!101256 (array_inv!28858 _keys!1208)))

(assert (=> start!101256 true))

(assert (=> start!101256 tp!91558))

(declare-datatypes ((V!46305 0))(
  ( (V!46306 (val!15498 Int)) )
))
(declare-datatypes ((ValueCell!14732 0))(
  ( (ValueCellFull!14732 (v!18151 V!46305)) (EmptyCell!14732) )
))
(declare-datatypes ((array!78541 0))(
  ( (array!78542 (arr!37905 (Array (_ BitVec 32) ValueCell!14732)) (size!38441 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78541)

(declare-fun e!690512 () Bool)

(declare-fun array_inv!28859 (array!78541) Bool)

(assert (=> start!101256 (and (array_inv!28859 _values!996) e!690512)))

(declare-fun mapNonEmpty!48199 () Bool)

(declare-fun mapRes!48199 () Bool)

(declare-fun tp!91559 () Bool)

(declare-fun e!690511 () Bool)

(assert (=> mapNonEmpty!48199 (= mapRes!48199 (and tp!91559 e!690511))))

(declare-fun mapValue!48199 () ValueCell!14732)

(declare-fun mapKey!48199 () (_ BitVec 32))

(declare-fun mapRest!48199 () (Array (_ BitVec 32) ValueCell!14732))

(assert (=> mapNonEmpty!48199 (= (arr!37905 _values!996) (store mapRest!48199 mapKey!48199 mapValue!48199))))

(declare-fun b!1216216 () Bool)

(declare-fun res!807585 () Bool)

(assert (=> b!1216216 (=> (not res!807585) (not e!690516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216216 (= res!807585 (validKeyInArray!0 k!934))))

(declare-fun b!1216217 () Bool)

(declare-fun res!807589 () Bool)

(assert (=> b!1216217 (=> (not res!807589) (not e!690513))))

(declare-fun lt!552828 () array!78539)

(declare-datatypes ((List!26721 0))(
  ( (Nil!26718) (Cons!26717 (h!27926 (_ BitVec 64)) (t!39880 List!26721)) )
))
(declare-fun arrayNoDuplicates!0 (array!78539 (_ BitVec 32) List!26721) Bool)

(assert (=> b!1216217 (= res!807589 (arrayNoDuplicates!0 lt!552828 #b00000000000000000000000000000000 Nil!26718))))

(declare-fun b!1216218 () Bool)

(assert (=> b!1216218 (= e!690512 (and e!690514 mapRes!48199))))

(declare-fun condMapEmpty!48199 () Bool)

(declare-fun mapDefault!48199 () ValueCell!14732)

