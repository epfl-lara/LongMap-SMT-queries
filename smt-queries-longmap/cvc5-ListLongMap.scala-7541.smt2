; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95566 () Bool)

(assert start!95566)

(declare-fun b!1079457 () Bool)

(declare-fun res!719361 () Bool)

(declare-fun e!617152 () Bool)

(assert (=> b!1079457 (=> (not res!719361) (not e!617152))))

(declare-datatypes ((array!69397 0))(
  ( (array!69398 (arr!33372 (Array (_ BitVec 32) (_ BitVec 64))) (size!33908 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69397)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69397 (_ BitVec 32)) Bool)

(assert (=> b!1079457 (= res!719361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079458 () Bool)

(declare-fun e!617151 () Bool)

(declare-fun tp_is_empty!26221 () Bool)

(assert (=> b!1079458 (= e!617151 tp_is_empty!26221)))

(declare-fun mapIsEmpty!41086 () Bool)

(declare-fun mapRes!41086 () Bool)

(assert (=> mapIsEmpty!41086 mapRes!41086))

(declare-fun mapNonEmpty!41086 () Bool)

(declare-fun tp!78548 () Bool)

(assert (=> mapNonEmpty!41086 (= mapRes!41086 (and tp!78548 e!617151))))

(declare-datatypes ((V!40089 0))(
  ( (V!40090 (val!13167 Int)) )
))
(declare-datatypes ((ValueCell!12401 0))(
  ( (ValueCellFull!12401 (v!15788 V!40089)) (EmptyCell!12401) )
))
(declare-datatypes ((array!69399 0))(
  ( (array!69400 (arr!33373 (Array (_ BitVec 32) ValueCell!12401)) (size!33909 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69399)

(declare-fun mapKey!41086 () (_ BitVec 32))

(declare-fun mapValue!41086 () ValueCell!12401)

(declare-fun mapRest!41086 () (Array (_ BitVec 32) ValueCell!12401))

(assert (=> mapNonEmpty!41086 (= (arr!33373 _values!874) (store mapRest!41086 mapKey!41086 mapValue!41086))))

(declare-fun b!1079459 () Bool)

(declare-fun e!617148 () Bool)

(assert (=> b!1079459 (= e!617152 e!617148)))

(declare-fun res!719355 () Bool)

(assert (=> b!1079459 (=> (not res!719355) (not e!617148))))

(declare-fun lt!478815 () array!69397)

(assert (=> b!1079459 (= res!719355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478815 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079459 (= lt!478815 (array!69398 (store (arr!33372 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33908 _keys!1070)))))

(declare-fun b!1079460 () Bool)

(assert (=> b!1079460 (= e!617148 (not true))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079460 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35492 0))(
  ( (Unit!35493) )
))
(declare-fun lt!478816 () Unit!35492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69397 (_ BitVec 64) (_ BitVec 32)) Unit!35492)

(assert (=> b!1079460 (= lt!478816 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1079461 () Bool)

(declare-fun res!719354 () Bool)

(assert (=> b!1079461 (=> (not res!719354) (not e!617152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079461 (= res!719354 (validKeyInArray!0 k!904))))

(declare-fun b!1079462 () Bool)

(declare-fun res!719360 () Bool)

(assert (=> b!1079462 (=> (not res!719360) (not e!617152))))

(assert (=> b!1079462 (= res!719360 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33908 _keys!1070))))))

(declare-fun b!1079463 () Bool)

(declare-fun res!719356 () Bool)

(assert (=> b!1079463 (=> (not res!719356) (not e!617152))))

(assert (=> b!1079463 (= res!719356 (= (select (arr!33372 _keys!1070) i!650) k!904))))

(declare-fun b!1079464 () Bool)

(declare-fun e!617153 () Bool)

(assert (=> b!1079464 (= e!617153 tp_is_empty!26221)))

(declare-fun res!719359 () Bool)

(assert (=> start!95566 (=> (not res!719359) (not e!617152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95566 (= res!719359 (validMask!0 mask!1414))))

(assert (=> start!95566 e!617152))

(assert (=> start!95566 true))

(declare-fun array_inv!25772 (array!69397) Bool)

(assert (=> start!95566 (array_inv!25772 _keys!1070)))

(declare-fun e!617150 () Bool)

(declare-fun array_inv!25773 (array!69399) Bool)

(assert (=> start!95566 (and (array_inv!25773 _values!874) e!617150)))

(declare-fun b!1079465 () Bool)

(declare-fun res!719358 () Bool)

(assert (=> b!1079465 (=> (not res!719358) (not e!617152))))

(declare-datatypes ((List!23260 0))(
  ( (Nil!23257) (Cons!23256 (h!24465 (_ BitVec 64)) (t!32619 List!23260)) )
))
(declare-fun arrayNoDuplicates!0 (array!69397 (_ BitVec 32) List!23260) Bool)

(assert (=> b!1079465 (= res!719358 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23257))))

(declare-fun b!1079466 () Bool)

(assert (=> b!1079466 (= e!617150 (and e!617153 mapRes!41086))))

(declare-fun condMapEmpty!41086 () Bool)

(declare-fun mapDefault!41086 () ValueCell!12401)

