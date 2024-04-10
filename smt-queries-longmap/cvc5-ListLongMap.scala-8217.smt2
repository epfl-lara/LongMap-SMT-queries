; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100210 () Bool)

(assert start!100210)

(declare-fun res!795097 () Bool)

(declare-fun e!679093 () Bool)

(assert (=> start!100210 (=> (not res!795097) (not e!679093))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77335 0))(
  ( (array!77336 (arr!37314 (Array (_ BitVec 32) (_ BitVec 64))) (size!37850 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77335)

(assert (=> start!100210 (= res!795097 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37850 _keys!1208))))))

(assert (=> start!100210 e!679093))

(declare-fun array_inv!28442 (array!77335) Bool)

(assert (=> start!100210 (array_inv!28442 _keys!1208)))

(assert (=> start!100210 true))

(declare-datatypes ((V!45497 0))(
  ( (V!45498 (val!15195 Int)) )
))
(declare-datatypes ((ValueCell!14429 0))(
  ( (ValueCellFull!14429 (v!17833 V!45497)) (EmptyCell!14429) )
))
(declare-datatypes ((array!77337 0))(
  ( (array!77338 (arr!37315 (Array (_ BitVec 32) ValueCell!14429)) (size!37851 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77337)

(declare-fun e!679091 () Bool)

(declare-fun array_inv!28443 (array!77337) Bool)

(assert (=> start!100210 (and (array_inv!28443 _values!996) e!679091)))

(declare-fun b!1194969 () Bool)

(declare-fun res!795102 () Bool)

(declare-fun e!679092 () Bool)

(assert (=> b!1194969 (=> (not res!795102) (not e!679092))))

(declare-fun lt!542856 () array!77335)

(declare-datatypes ((List!26269 0))(
  ( (Nil!26266) (Cons!26265 (h!27474 (_ BitVec 64)) (t!38940 List!26269)) )
))
(declare-fun arrayNoDuplicates!0 (array!77335 (_ BitVec 32) List!26269) Bool)

(assert (=> b!1194969 (= res!795102 (arrayNoDuplicates!0 lt!542856 #b00000000000000000000000000000000 Nil!26266))))

(declare-fun b!1194970 () Bool)

(declare-fun res!795105 () Bool)

(assert (=> b!1194970 (=> (not res!795105) (not e!679093))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194970 (= res!795105 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47252 () Bool)

(declare-fun mapRes!47252 () Bool)

(declare-fun tp!89862 () Bool)

(declare-fun e!679089 () Bool)

(assert (=> mapNonEmpty!47252 (= mapRes!47252 (and tp!89862 e!679089))))

(declare-fun mapKey!47252 () (_ BitVec 32))

(declare-fun mapRest!47252 () (Array (_ BitVec 32) ValueCell!14429))

(declare-fun mapValue!47252 () ValueCell!14429)

(assert (=> mapNonEmpty!47252 (= (arr!37315 _values!996) (store mapRest!47252 mapKey!47252 mapValue!47252))))

(declare-fun b!1194971 () Bool)

(declare-fun tp_is_empty!30277 () Bool)

(assert (=> b!1194971 (= e!679089 tp_is_empty!30277)))

(declare-fun b!1194972 () Bool)

(declare-fun res!795098 () Bool)

(assert (=> b!1194972 (=> (not res!795098) (not e!679093))))

(assert (=> b!1194972 (= res!795098 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26266))))

(declare-fun b!1194973 () Bool)

(declare-fun res!795101 () Bool)

(assert (=> b!1194973 (=> (not res!795101) (not e!679093))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1194973 (= res!795101 (= (select (arr!37314 _keys!1208) i!673) k!934))))

(declare-fun b!1194974 () Bool)

(declare-fun res!795104 () Bool)

(assert (=> b!1194974 (=> (not res!795104) (not e!679093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194974 (= res!795104 (validKeyInArray!0 k!934))))

(declare-fun b!1194975 () Bool)

(assert (=> b!1194975 (= e!679092 (not true))))

(declare-fun arrayContainsKey!0 (array!77335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194975 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39612 0))(
  ( (Unit!39613) )
))
(declare-fun lt!542855 () Unit!39612)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77335 (_ BitVec 64) (_ BitVec 32)) Unit!39612)

(assert (=> b!1194975 (= lt!542855 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1194976 () Bool)

(declare-fun e!679088 () Bool)

(assert (=> b!1194976 (= e!679088 tp_is_empty!30277)))

(declare-fun b!1194977 () Bool)

(declare-fun res!795106 () Bool)

(assert (=> b!1194977 (=> (not res!795106) (not e!679093))))

(assert (=> b!1194977 (= res!795106 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37850 _keys!1208))))))

(declare-fun b!1194978 () Bool)

(assert (=> b!1194978 (= e!679091 (and e!679088 mapRes!47252))))

(declare-fun condMapEmpty!47252 () Bool)

(declare-fun mapDefault!47252 () ValueCell!14429)

