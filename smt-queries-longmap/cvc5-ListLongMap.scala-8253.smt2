; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100466 () Bool)

(assert start!100466)

(declare-fun b_free!25789 () Bool)

(declare-fun b_next!25789 () Bool)

(assert (=> start!100466 (= b_free!25789 (not b_next!25789))))

(declare-fun tp!90357 () Bool)

(declare-fun b_and!42465 () Bool)

(assert (=> start!100466 (= tp!90357 b_and!42465)))

(declare-fun b!1199760 () Bool)

(declare-fun e!681397 () Bool)

(declare-fun e!681401 () Bool)

(assert (=> b!1199760 (= e!681397 (not e!681401))))

(declare-fun res!798604 () Bool)

(assert (=> b!1199760 (=> res!798604 e!681401)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199760 (= res!798604 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77761 0))(
  ( (array!77762 (arr!37525 (Array (_ BitVec 32) (_ BitVec 64))) (size!38061 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77761)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199760 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39776 0))(
  ( (Unit!39777) )
))
(declare-fun lt!543859 () Unit!39776)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77761 (_ BitVec 64) (_ BitVec 32)) Unit!39776)

(assert (=> b!1199760 (= lt!543859 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!47582 () Bool)

(declare-fun mapRes!47582 () Bool)

(declare-fun tp!90356 () Bool)

(declare-fun e!681398 () Bool)

(assert (=> mapNonEmpty!47582 (= mapRes!47582 (and tp!90356 e!681398))))

(declare-fun mapKey!47582 () (_ BitVec 32))

(declare-datatypes ((V!45785 0))(
  ( (V!45786 (val!15303 Int)) )
))
(declare-datatypes ((ValueCell!14537 0))(
  ( (ValueCellFull!14537 (v!17941 V!45785)) (EmptyCell!14537) )
))
(declare-fun mapRest!47582 () (Array (_ BitVec 32) ValueCell!14537))

(declare-fun mapValue!47582 () ValueCell!14537)

(declare-datatypes ((array!77763 0))(
  ( (array!77764 (arr!37526 (Array (_ BitVec 32) ValueCell!14537)) (size!38062 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77763)

(assert (=> mapNonEmpty!47582 (= (arr!37526 _values!996) (store mapRest!47582 mapKey!47582 mapValue!47582))))

(declare-fun b!1199761 () Bool)

(declare-fun e!681402 () Bool)

(declare-fun tp_is_empty!30493 () Bool)

(assert (=> b!1199761 (= e!681402 tp_is_empty!30493)))

(declare-fun b!1199762 () Bool)

(declare-fun e!681400 () Bool)

(assert (=> b!1199762 (= e!681400 e!681397)))

(declare-fun res!798606 () Bool)

(assert (=> b!1199762 (=> (not res!798606) (not e!681397))))

(declare-fun lt!543857 () array!77761)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77761 (_ BitVec 32)) Bool)

(assert (=> b!1199762 (= res!798606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543857 mask!1564))))

(assert (=> b!1199762 (= lt!543857 (array!77762 (store (arr!37525 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38061 _keys!1208)))))

(declare-fun b!1199763 () Bool)

(declare-fun res!798598 () Bool)

(assert (=> b!1199763 (=> (not res!798598) (not e!681400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199763 (= res!798598 (validMask!0 mask!1564))))

(declare-fun b!1199764 () Bool)

(declare-fun res!798601 () Bool)

(assert (=> b!1199764 (=> (not res!798601) (not e!681397))))

(declare-datatypes ((List!26407 0))(
  ( (Nil!26404) (Cons!26403 (h!27612 (_ BitVec 64)) (t!39176 List!26407)) )
))
(declare-fun arrayNoDuplicates!0 (array!77761 (_ BitVec 32) List!26407) Bool)

(assert (=> b!1199764 (= res!798601 (arrayNoDuplicates!0 lt!543857 #b00000000000000000000000000000000 Nil!26404))))

(declare-fun b!1199765 () Bool)

(assert (=> b!1199765 (= e!681398 tp_is_empty!30493)))

(declare-fun res!798602 () Bool)

(assert (=> start!100466 (=> (not res!798602) (not e!681400))))

(assert (=> start!100466 (= res!798602 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38061 _keys!1208))))))

(assert (=> start!100466 e!681400))

(assert (=> start!100466 tp_is_empty!30493))

(declare-fun array_inv!28596 (array!77761) Bool)

(assert (=> start!100466 (array_inv!28596 _keys!1208)))

(assert (=> start!100466 true))

(assert (=> start!100466 tp!90357))

(declare-fun e!681403 () Bool)

(declare-fun array_inv!28597 (array!77763) Bool)

(assert (=> start!100466 (and (array_inv!28597 _values!996) e!681403)))

(declare-fun b!1199766 () Bool)

(assert (=> b!1199766 (= e!681403 (and e!681402 mapRes!47582))))

(declare-fun condMapEmpty!47582 () Bool)

(declare-fun mapDefault!47582 () ValueCell!14537)

