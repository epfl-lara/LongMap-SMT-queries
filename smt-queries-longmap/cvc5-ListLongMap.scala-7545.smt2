; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95590 () Bool)

(assert start!95590)

(declare-fun b!1079889 () Bool)

(declare-fun e!617367 () Bool)

(declare-fun tp_is_empty!26245 () Bool)

(assert (=> b!1079889 (= e!617367 tp_is_empty!26245)))

(declare-fun mapNonEmpty!41122 () Bool)

(declare-fun mapRes!41122 () Bool)

(declare-fun tp!78584 () Bool)

(declare-fun e!617369 () Bool)

(assert (=> mapNonEmpty!41122 (= mapRes!41122 (and tp!78584 e!617369))))

(declare-datatypes ((V!40121 0))(
  ( (V!40122 (val!13179 Int)) )
))
(declare-datatypes ((ValueCell!12413 0))(
  ( (ValueCellFull!12413 (v!15800 V!40121)) (EmptyCell!12413) )
))
(declare-datatypes ((array!69443 0))(
  ( (array!69444 (arr!33395 (Array (_ BitVec 32) ValueCell!12413)) (size!33931 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69443)

(declare-fun mapKey!41122 () (_ BitVec 32))

(declare-fun mapValue!41122 () ValueCell!12413)

(declare-fun mapRest!41122 () (Array (_ BitVec 32) ValueCell!12413))

(assert (=> mapNonEmpty!41122 (= (arr!33395 _values!874) (store mapRest!41122 mapKey!41122 mapValue!41122))))

(declare-fun b!1079890 () Bool)

(declare-fun res!719682 () Bool)

(declare-fun e!617366 () Bool)

(assert (=> b!1079890 (=> (not res!719682) (not e!617366))))

(declare-datatypes ((array!69445 0))(
  ( (array!69446 (arr!33396 (Array (_ BitVec 32) (_ BitVec 64))) (size!33932 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69445)

(declare-datatypes ((List!23271 0))(
  ( (Nil!23268) (Cons!23267 (h!24476 (_ BitVec 64)) (t!32630 List!23271)) )
))
(declare-fun arrayNoDuplicates!0 (array!69445 (_ BitVec 32) List!23271) Bool)

(assert (=> b!1079890 (= res!719682 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23268))))

(declare-fun b!1079891 () Bool)

(declare-fun res!719678 () Bool)

(assert (=> b!1079891 (=> (not res!719678) (not e!617366))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079891 (= res!719678 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33932 _keys!1070))))))

(declare-fun b!1079892 () Bool)

(declare-fun e!617364 () Bool)

(assert (=> b!1079892 (= e!617366 e!617364)))

(declare-fun res!719685 () Bool)

(assert (=> b!1079892 (=> (not res!719685) (not e!617364))))

(declare-fun lt!478887 () array!69445)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69445 (_ BitVec 32)) Bool)

(assert (=> b!1079892 (= res!719685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478887 mask!1414))))

(assert (=> b!1079892 (= lt!478887 (array!69446 (store (arr!33396 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33932 _keys!1070)))))

(declare-fun b!1079893 () Bool)

(assert (=> b!1079893 (= e!617364 (not (bvsle #b00000000000000000000000000000000 (size!33932 _keys!1070))))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079893 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35508 0))(
  ( (Unit!35509) )
))
(declare-fun lt!478888 () Unit!35508)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69445 (_ BitVec 64) (_ BitVec 32)) Unit!35508)

(assert (=> b!1079893 (= lt!478888 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapIsEmpty!41122 () Bool)

(assert (=> mapIsEmpty!41122 mapRes!41122))

(declare-fun b!1079894 () Bool)

(declare-fun e!617368 () Bool)

(assert (=> b!1079894 (= e!617368 (and e!617367 mapRes!41122))))

(declare-fun condMapEmpty!41122 () Bool)

(declare-fun mapDefault!41122 () ValueCell!12413)

