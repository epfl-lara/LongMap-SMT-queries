; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97730 () Bool)

(assert start!97730)

(declare-fun b!1117473 () Bool)

(declare-fun e!636568 () Bool)

(declare-fun tp_is_empty!27961 () Bool)

(assert (=> b!1117473 (= e!636568 tp_is_empty!27961)))

(declare-fun mapNonEmpty!43759 () Bool)

(declare-fun mapRes!43759 () Bool)

(declare-fun tp!83003 () Bool)

(assert (=> mapNonEmpty!43759 (= mapRes!43759 (and tp!83003 e!636568))))

(declare-datatypes ((V!42409 0))(
  ( (V!42410 (val!14037 Int)) )
))
(declare-datatypes ((ValueCell!13271 0))(
  ( (ValueCellFull!13271 (v!16670 V!42409)) (EmptyCell!13271) )
))
(declare-fun mapValue!43759 () ValueCell!13271)

(declare-fun mapKey!43759 () (_ BitVec 32))

(declare-datatypes ((array!72813 0))(
  ( (array!72814 (arr!35059 (Array (_ BitVec 32) ValueCell!13271)) (size!35595 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72813)

(declare-fun mapRest!43759 () (Array (_ BitVec 32) ValueCell!13271))

(assert (=> mapNonEmpty!43759 (= (arr!35059 _values!996) (store mapRest!43759 mapKey!43759 mapValue!43759))))

(declare-fun b!1117474 () Bool)

(declare-fun res!746242 () Bool)

(declare-fun e!636571 () Bool)

(assert (=> b!1117474 (=> (not res!746242) (not e!636571))))

(declare-datatypes ((array!72815 0))(
  ( (array!72816 (arr!35060 (Array (_ BitVec 32) (_ BitVec 64))) (size!35596 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72815)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1117474 (= res!746242 (and (= (size!35595 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35596 _keys!1208) (size!35595 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117475 () Bool)

(declare-fun res!746238 () Bool)

(declare-fun e!636570 () Bool)

(assert (=> b!1117475 (=> (not res!746238) (not e!636570))))

(declare-fun lt!497294 () array!72815)

(declare-datatypes ((List!24387 0))(
  ( (Nil!24384) (Cons!24383 (h!25592 (_ BitVec 64)) (t!34868 List!24387)) )
))
(declare-fun arrayNoDuplicates!0 (array!72815 (_ BitVec 32) List!24387) Bool)

(assert (=> b!1117475 (= res!746238 (arrayNoDuplicates!0 lt!497294 #b00000000000000000000000000000000 Nil!24384))))

(declare-fun b!1117476 () Bool)

(declare-fun res!746237 () Bool)

(assert (=> b!1117476 (=> (not res!746237) (not e!636571))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117476 (= res!746237 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35596 _keys!1208))))))

(declare-fun b!1117477 () Bool)

(declare-fun res!746241 () Bool)

(assert (=> b!1117477 (=> (not res!746241) (not e!636571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72815 (_ BitVec 32)) Bool)

(assert (=> b!1117477 (= res!746241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117478 () Bool)

(assert (=> b!1117478 (= e!636570 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117478 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36672 0))(
  ( (Unit!36673) )
))
(declare-fun lt!497293 () Unit!36672)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72815 (_ BitVec 64) (_ BitVec 32)) Unit!36672)

(assert (=> b!1117478 (= lt!497293 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!746234 () Bool)

(assert (=> start!97730 (=> (not res!746234) (not e!636571))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97730 (= res!746234 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35596 _keys!1208))))))

(assert (=> start!97730 e!636571))

(declare-fun array_inv!26940 (array!72815) Bool)

(assert (=> start!97730 (array_inv!26940 _keys!1208)))

(assert (=> start!97730 true))

(declare-fun e!636573 () Bool)

(declare-fun array_inv!26941 (array!72813) Bool)

(assert (=> start!97730 (and (array_inv!26941 _values!996) e!636573)))

(declare-fun mapIsEmpty!43759 () Bool)

(assert (=> mapIsEmpty!43759 mapRes!43759))

(declare-fun b!1117479 () Bool)

(declare-fun e!636572 () Bool)

(assert (=> b!1117479 (= e!636573 (and e!636572 mapRes!43759))))

(declare-fun condMapEmpty!43759 () Bool)

(declare-fun mapDefault!43759 () ValueCell!13271)

