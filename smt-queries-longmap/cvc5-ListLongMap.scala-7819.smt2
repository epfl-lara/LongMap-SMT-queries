; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97658 () Bool)

(assert start!97658)

(declare-fun b!1116069 () Bool)

(declare-fun e!635921 () Bool)

(declare-fun e!635920 () Bool)

(assert (=> b!1116069 (= e!635921 e!635920)))

(declare-fun res!745162 () Bool)

(assert (=> b!1116069 (=> (not res!745162) (not e!635920))))

(declare-datatypes ((array!72675 0))(
  ( (array!72676 (arr!34990 (Array (_ BitVec 32) (_ BitVec 64))) (size!35526 (_ BitVec 32))) )
))
(declare-fun lt!497077 () array!72675)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72675 (_ BitVec 32)) Bool)

(assert (=> b!1116069 (= res!745162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497077 mask!1564))))

(declare-fun _keys!1208 () array!72675)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116069 (= lt!497077 (array!72676 (store (arr!34990 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35526 _keys!1208)))))

(declare-fun b!1116070 () Bool)

(declare-fun res!745158 () Bool)

(assert (=> b!1116070 (=> (not res!745158) (not e!635921))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1116070 (= res!745158 (= (select (arr!34990 _keys!1208) i!673) k!934))))

(declare-fun b!1116071 () Bool)

(assert (=> b!1116071 (= e!635920 (not true))))

(declare-fun arrayContainsKey!0 (array!72675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116071 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36630 0))(
  ( (Unit!36631) )
))
(declare-fun lt!497078 () Unit!36630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72675 (_ BitVec 64) (_ BitVec 32)) Unit!36630)

(assert (=> b!1116071 (= lt!497078 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!745153 () Bool)

(assert (=> start!97658 (=> (not res!745153) (not e!635921))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97658 (= res!745153 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35526 _keys!1208))))))

(assert (=> start!97658 e!635921))

(declare-fun array_inv!26896 (array!72675) Bool)

(assert (=> start!97658 (array_inv!26896 _keys!1208)))

(assert (=> start!97658 true))

(declare-datatypes ((V!42313 0))(
  ( (V!42314 (val!14001 Int)) )
))
(declare-datatypes ((ValueCell!13235 0))(
  ( (ValueCellFull!13235 (v!16634 V!42313)) (EmptyCell!13235) )
))
(declare-datatypes ((array!72677 0))(
  ( (array!72678 (arr!34991 (Array (_ BitVec 32) ValueCell!13235)) (size!35527 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72677)

(declare-fun e!635923 () Bool)

(declare-fun array_inv!26897 (array!72677) Bool)

(assert (=> start!97658 (and (array_inv!26897 _values!996) e!635923)))

(declare-fun b!1116072 () Bool)

(declare-fun res!745157 () Bool)

(assert (=> b!1116072 (=> (not res!745157) (not e!635921))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116072 (= res!745157 (and (= (size!35527 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35526 _keys!1208) (size!35527 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116073 () Bool)

(declare-fun res!745155 () Bool)

(assert (=> b!1116073 (=> (not res!745155) (not e!635921))))

(assert (=> b!1116073 (= res!745155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116074 () Bool)

(declare-fun e!635924 () Bool)

(declare-fun tp_is_empty!27889 () Bool)

(assert (=> b!1116074 (= e!635924 tp_is_empty!27889)))

(declare-fun b!1116075 () Bool)

(declare-fun res!745161 () Bool)

(assert (=> b!1116075 (=> (not res!745161) (not e!635920))))

(declare-datatypes ((List!24360 0))(
  ( (Nil!24357) (Cons!24356 (h!25565 (_ BitVec 64)) (t!34841 List!24360)) )
))
(declare-fun arrayNoDuplicates!0 (array!72675 (_ BitVec 32) List!24360) Bool)

(assert (=> b!1116075 (= res!745161 (arrayNoDuplicates!0 lt!497077 #b00000000000000000000000000000000 Nil!24357))))

(declare-fun b!1116076 () Bool)

(declare-fun e!635922 () Bool)

(assert (=> b!1116076 (= e!635922 tp_is_empty!27889)))

(declare-fun mapNonEmpty!43651 () Bool)

(declare-fun mapRes!43651 () Bool)

(declare-fun tp!82895 () Bool)

(assert (=> mapNonEmpty!43651 (= mapRes!43651 (and tp!82895 e!635924))))

(declare-fun mapKey!43651 () (_ BitVec 32))

(declare-fun mapRest!43651 () (Array (_ BitVec 32) ValueCell!13235))

(declare-fun mapValue!43651 () ValueCell!13235)

(assert (=> mapNonEmpty!43651 (= (arr!34991 _values!996) (store mapRest!43651 mapKey!43651 mapValue!43651))))

(declare-fun b!1116077 () Bool)

(declare-fun res!745159 () Bool)

(assert (=> b!1116077 (=> (not res!745159) (not e!635921))))

(assert (=> b!1116077 (= res!745159 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24357))))

(declare-fun b!1116078 () Bool)

(declare-fun res!745156 () Bool)

(assert (=> b!1116078 (=> (not res!745156) (not e!635921))))

(assert (=> b!1116078 (= res!745156 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35526 _keys!1208))))))

(declare-fun b!1116079 () Bool)

(assert (=> b!1116079 (= e!635923 (and e!635922 mapRes!43651))))

(declare-fun condMapEmpty!43651 () Bool)

(declare-fun mapDefault!43651 () ValueCell!13235)

