; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100374 () Bool)

(assert start!100374)

(declare-fun b_free!25715 () Bool)

(declare-fun b_next!25715 () Bool)

(assert (=> start!100374 (= b_free!25715 (not b_next!25715))))

(declare-fun tp!90131 () Bool)

(declare-fun b_and!42321 () Bool)

(assert (=> start!100374 (= tp!90131 b_and!42321)))

(declare-datatypes ((V!45685 0))(
  ( (V!45686 (val!15266 Int)) )
))
(declare-fun zeroValue!944 () V!45685)

(declare-datatypes ((array!77615 0))(
  ( (array!77616 (arr!37453 (Array (_ BitVec 32) (_ BitVec 64))) (size!37989 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77615)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun e!680558 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1198046 () Bool)

(declare-datatypes ((ValueCell!14500 0))(
  ( (ValueCellFull!14500 (v!17904 V!45685)) (EmptyCell!14500) )
))
(declare-datatypes ((array!77617 0))(
  ( (array!77618 (arr!37454 (Array (_ BitVec 32) ValueCell!14500)) (size!37990 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77617)

(declare-fun lt!543389 () array!77615)

(declare-fun minValue!944 () V!45685)

(declare-datatypes ((tuple2!19530 0))(
  ( (tuple2!19531 (_1!9776 (_ BitVec 64)) (_2!9776 V!45685)) )
))
(declare-datatypes ((List!26347 0))(
  ( (Nil!26344) (Cons!26343 (h!27552 tuple2!19530) (t!39054 List!26347)) )
))
(declare-datatypes ((ListLongMap!17499 0))(
  ( (ListLongMap!17500 (toList!8765 List!26347)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5204 (array!77615 array!77617 (_ BitVec 32) (_ BitVec 32) V!45685 V!45685 (_ BitVec 32) Int) ListLongMap!17499)

(declare-fun dynLambda!3128 (Int (_ BitVec 64)) V!45685)

(assert (=> b!1198046 (= e!680558 (= (getCurrentListMapNoExtraKeys!5204 lt!543389 (array!77618 (store (arr!37454 _values!996) i!673 (ValueCellFull!14500 (dynLambda!3128 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37990 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) (getCurrentListMapNoExtraKeys!5204 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004)))))

(declare-fun b!1198047 () Bool)

(declare-fun e!680553 () Bool)

(declare-fun tp_is_empty!30419 () Bool)

(assert (=> b!1198047 (= e!680553 tp_is_empty!30419)))

(declare-fun b!1198048 () Bool)

(declare-fun e!680554 () Bool)

(assert (=> b!1198048 (= e!680554 (not e!680558))))

(declare-fun res!797335 () Bool)

(assert (=> b!1198048 (=> res!797335 e!680558)))

(assert (=> b!1198048 (= res!797335 (or (bvsle from!1455 i!673) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37989 _keys!1208))))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198048 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39724 0))(
  ( (Unit!39725) )
))
(declare-fun lt!543390 () Unit!39724)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77615 (_ BitVec 64) (_ BitVec 32)) Unit!39724)

(assert (=> b!1198048 (= lt!543390 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1198049 () Bool)

(declare-fun res!797333 () Bool)

(declare-fun e!680556 () Bool)

(assert (=> b!1198049 (=> (not res!797333) (not e!680556))))

(assert (=> b!1198049 (= res!797333 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37989 _keys!1208))))))

(declare-fun b!1198050 () Bool)

(declare-fun res!797343 () Bool)

(assert (=> b!1198050 (=> (not res!797343) (not e!680554))))

(declare-datatypes ((List!26348 0))(
  ( (Nil!26345) (Cons!26344 (h!27553 (_ BitVec 64)) (t!39055 List!26348)) )
))
(declare-fun arrayNoDuplicates!0 (array!77615 (_ BitVec 32) List!26348) Bool)

(assert (=> b!1198050 (= res!797343 (arrayNoDuplicates!0 lt!543389 #b00000000000000000000000000000000 Nil!26345))))

(declare-fun b!1198051 () Bool)

(declare-fun res!797336 () Bool)

(assert (=> b!1198051 (=> (not res!797336) (not e!680556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77615 (_ BitVec 32)) Bool)

(assert (=> b!1198051 (= res!797336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198052 () Bool)

(declare-fun res!797342 () Bool)

(assert (=> b!1198052 (=> (not res!797342) (not e!680556))))

(assert (=> b!1198052 (= res!797342 (= (select (arr!37453 _keys!1208) i!673) k!934))))

(declare-fun b!1198053 () Bool)

(declare-fun e!680557 () Bool)

(declare-fun mapRes!47468 () Bool)

(assert (=> b!1198053 (= e!680557 (and e!680553 mapRes!47468))))

(declare-fun condMapEmpty!47468 () Bool)

(declare-fun mapDefault!47468 () ValueCell!14500)

