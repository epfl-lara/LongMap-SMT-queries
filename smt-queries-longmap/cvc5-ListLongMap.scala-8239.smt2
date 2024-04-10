; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100364 () Bool)

(assert start!100364)

(declare-fun b!1197840 () Bool)

(declare-fun res!797184 () Bool)

(declare-fun e!680456 () Bool)

(assert (=> b!1197840 (=> (not res!797184) (not e!680456))))

(declare-datatypes ((array!77595 0))(
  ( (array!77596 (arr!37443 (Array (_ BitVec 32) (_ BitVec 64))) (size!37979 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77595)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1197840 (= res!797184 (= (select (arr!37443 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!47453 () Bool)

(declare-fun mapRes!47453 () Bool)

(assert (=> mapIsEmpty!47453 mapRes!47453))

(declare-fun b!1197841 () Bool)

(declare-fun res!797182 () Bool)

(assert (=> b!1197841 (=> (not res!797182) (not e!680456))))

(declare-datatypes ((List!26341 0))(
  ( (Nil!26338) (Cons!26337 (h!27546 (_ BitVec 64)) (t!39042 List!26341)) )
))
(declare-fun arrayNoDuplicates!0 (array!77595 (_ BitVec 32) List!26341) Bool)

(assert (=> b!1197841 (= res!797182 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26338))))

(declare-fun b!1197842 () Bool)

(declare-fun res!797177 () Bool)

(declare-fun e!680458 () Bool)

(assert (=> b!1197842 (=> (not res!797177) (not e!680458))))

(declare-fun lt!543360 () array!77595)

(assert (=> b!1197842 (= res!797177 (arrayNoDuplicates!0 lt!543360 #b00000000000000000000000000000000 Nil!26338))))

(declare-fun b!1197843 () Bool)

(declare-fun res!797178 () Bool)

(assert (=> b!1197843 (=> (not res!797178) (not e!680456))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77595 (_ BitVec 32)) Bool)

(assert (=> b!1197843 (= res!797178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197844 () Bool)

(declare-fun e!680454 () Bool)

(declare-fun tp_is_empty!30409 () Bool)

(assert (=> b!1197844 (= e!680454 tp_is_empty!30409)))

(declare-fun b!1197845 () Bool)

(declare-fun res!797176 () Bool)

(assert (=> b!1197845 (=> (not res!797176) (not e!680456))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45673 0))(
  ( (V!45674 (val!15261 Int)) )
))
(declare-datatypes ((ValueCell!14495 0))(
  ( (ValueCellFull!14495 (v!17899 V!45673)) (EmptyCell!14495) )
))
(declare-datatypes ((array!77597 0))(
  ( (array!77598 (arr!37444 (Array (_ BitVec 32) ValueCell!14495)) (size!37980 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77597)

(assert (=> b!1197845 (= res!797176 (and (= (size!37980 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37979 _keys!1208) (size!37980 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197839 () Bool)

(declare-fun res!797183 () Bool)

(assert (=> b!1197839 (=> (not res!797183) (not e!680456))))

(assert (=> b!1197839 (= res!797183 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37979 _keys!1208))))))

(declare-fun res!797175 () Bool)

(assert (=> start!100364 (=> (not res!797175) (not e!680456))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100364 (= res!797175 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37979 _keys!1208))))))

(assert (=> start!100364 e!680456))

(declare-fun array_inv!28538 (array!77595) Bool)

(assert (=> start!100364 (array_inv!28538 _keys!1208)))

(assert (=> start!100364 true))

(declare-fun e!680455 () Bool)

(declare-fun array_inv!28539 (array!77597) Bool)

(assert (=> start!100364 (and (array_inv!28539 _values!996) e!680455)))

(declare-fun b!1197846 () Bool)

(assert (=> b!1197846 (= e!680456 e!680458)))

(declare-fun res!797180 () Bool)

(assert (=> b!1197846 (=> (not res!797180) (not e!680458))))

(assert (=> b!1197846 (= res!797180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543360 mask!1564))))

(assert (=> b!1197846 (= lt!543360 (array!77596 (store (arr!37443 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37979 _keys!1208)))))

(declare-fun b!1197847 () Bool)

(declare-fun e!680457 () Bool)

(assert (=> b!1197847 (= e!680457 tp_is_empty!30409)))

(declare-fun b!1197848 () Bool)

(assert (=> b!1197848 (= e!680455 (and e!680454 mapRes!47453))))

(declare-fun condMapEmpty!47453 () Bool)

(declare-fun mapDefault!47453 () ValueCell!14495)

