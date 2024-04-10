; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99880 () Bool)

(assert start!99880)

(declare-fun b_free!25459 () Bool)

(declare-fun b_next!25459 () Bool)

(assert (=> start!99880 (= b_free!25459 (not b_next!25459))))

(declare-fun tp!89090 () Bool)

(declare-fun b_and!41785 () Bool)

(assert (=> start!99880 (= tp!89090 b_and!41785)))

(declare-fun b!1188460 () Bool)

(declare-fun e!675754 () Bool)

(declare-fun e!675747 () Bool)

(assert (=> b!1188460 (= e!675754 e!675747)))

(declare-fun res!790198 () Bool)

(assert (=> b!1188460 (=> (not res!790198) (not e!675747))))

(declare-datatypes ((array!76773 0))(
  ( (array!76774 (arr!37036 (Array (_ BitVec 32) (_ BitVec 64))) (size!37572 (_ BitVec 32))) )
))
(declare-fun lt!540696 () array!76773)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76773 (_ BitVec 32)) Bool)

(assert (=> b!1188460 (= res!790198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540696 mask!1564))))

(declare-fun _keys!1208 () array!76773)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188460 (= lt!540696 (array!76774 (store (arr!37036 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37572 _keys!1208)))))

(declare-fun mapIsEmpty!46811 () Bool)

(declare-fun mapRes!46811 () Bool)

(assert (=> mapIsEmpty!46811 mapRes!46811))

(declare-fun b!1188461 () Bool)

(declare-fun res!790200 () Bool)

(assert (=> b!1188461 (=> (not res!790200) (not e!675747))))

(declare-datatypes ((List!26071 0))(
  ( (Nil!26068) (Cons!26067 (h!27276 (_ BitVec 64)) (t!38522 List!26071)) )
))
(declare-fun arrayNoDuplicates!0 (array!76773 (_ BitVec 32) List!26071) Bool)

(assert (=> b!1188461 (= res!790200 (arrayNoDuplicates!0 lt!540696 #b00000000000000000000000000000000 Nil!26068))))

(declare-fun b!1188462 () Bool)

(declare-fun e!675750 () Bool)

(declare-fun tp_is_empty!29989 () Bool)

(assert (=> b!1188462 (= e!675750 tp_is_empty!29989)))

(declare-fun mapNonEmpty!46811 () Bool)

(declare-fun tp!89091 () Bool)

(declare-fun e!675752 () Bool)

(assert (=> mapNonEmpty!46811 (= mapRes!46811 (and tp!89091 e!675752))))

(declare-fun mapKey!46811 () (_ BitVec 32))

(declare-datatypes ((V!45113 0))(
  ( (V!45114 (val!15051 Int)) )
))
(declare-datatypes ((ValueCell!14285 0))(
  ( (ValueCellFull!14285 (v!17689 V!45113)) (EmptyCell!14285) )
))
(declare-fun mapValue!46811 () ValueCell!14285)

(declare-fun mapRest!46811 () (Array (_ BitVec 32) ValueCell!14285))

(declare-datatypes ((array!76775 0))(
  ( (array!76776 (arr!37037 (Array (_ BitVec 32) ValueCell!14285)) (size!37573 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76775)

(assert (=> mapNonEmpty!46811 (= (arr!37037 _values!996) (store mapRest!46811 mapKey!46811 mapValue!46811))))

(declare-fun b!1188463 () Bool)

(declare-fun e!675751 () Bool)

(assert (=> b!1188463 (= e!675751 (and e!675750 mapRes!46811))))

(declare-fun condMapEmpty!46811 () Bool)

(declare-fun mapDefault!46811 () ValueCell!14285)

