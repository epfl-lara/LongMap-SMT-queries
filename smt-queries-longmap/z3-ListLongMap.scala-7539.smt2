; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95556 () Bool)

(assert start!95556)

(declare-fun b!1079277 () Bool)

(declare-fun e!617062 () Bool)

(declare-fun tp_is_empty!26211 () Bool)

(assert (=> b!1079277 (= e!617062 tp_is_empty!26211)))

(declare-fun b!1079278 () Bool)

(declare-fun e!617060 () Bool)

(assert (=> b!1079278 (= e!617060 tp_is_empty!26211)))

(declare-fun b!1079279 () Bool)

(declare-fun res!719221 () Bool)

(declare-fun e!617061 () Bool)

(assert (=> b!1079279 (=> (not res!719221) (not e!617061))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69377 0))(
  ( (array!69378 (arr!33362 (Array (_ BitVec 32) (_ BitVec 64))) (size!33898 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69377)

(assert (=> b!1079279 (= res!719221 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33898 _keys!1070))))))

(declare-fun b!1079280 () Bool)

(declare-fun res!719218 () Bool)

(assert (=> b!1079280 (=> (not res!719218) (not e!617061))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079280 (= res!719218 (validKeyInArray!0 k0!904))))

(declare-fun res!719225 () Bool)

(assert (=> start!95556 (=> (not res!719225) (not e!617061))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95556 (= res!719225 (validMask!0 mask!1414))))

(assert (=> start!95556 e!617061))

(assert (=> start!95556 true))

(declare-fun array_inv!25768 (array!69377) Bool)

(assert (=> start!95556 (array_inv!25768 _keys!1070)))

(declare-datatypes ((V!40075 0))(
  ( (V!40076 (val!13162 Int)) )
))
(declare-datatypes ((ValueCell!12396 0))(
  ( (ValueCellFull!12396 (v!15783 V!40075)) (EmptyCell!12396) )
))
(declare-datatypes ((array!69379 0))(
  ( (array!69380 (arr!33363 (Array (_ BitVec 32) ValueCell!12396)) (size!33899 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69379)

(declare-fun e!617059 () Bool)

(declare-fun array_inv!25769 (array!69379) Bool)

(assert (=> start!95556 (and (array_inv!25769 _values!874) e!617059)))

(declare-fun b!1079281 () Bool)

(declare-fun e!617058 () Bool)

(assert (=> b!1079281 (= e!617058 (not true))))

(declare-fun arrayContainsKey!0 (array!69377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079281 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35488 0))(
  ( (Unit!35489) )
))
(declare-fun lt!478785 () Unit!35488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69377 (_ BitVec 64) (_ BitVec 32)) Unit!35488)

(assert (=> b!1079281 (= lt!478785 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079282 () Bool)

(declare-fun res!719220 () Bool)

(assert (=> b!1079282 (=> (not res!719220) (not e!617061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69377 (_ BitVec 32)) Bool)

(assert (=> b!1079282 (= res!719220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41071 () Bool)

(declare-fun mapRes!41071 () Bool)

(declare-fun tp!78533 () Bool)

(assert (=> mapNonEmpty!41071 (= mapRes!41071 (and tp!78533 e!617060))))

(declare-fun mapRest!41071 () (Array (_ BitVec 32) ValueCell!12396))

(declare-fun mapKey!41071 () (_ BitVec 32))

(declare-fun mapValue!41071 () ValueCell!12396)

(assert (=> mapNonEmpty!41071 (= (arr!33363 _values!874) (store mapRest!41071 mapKey!41071 mapValue!41071))))

(declare-fun b!1079283 () Bool)

(declare-fun res!719224 () Bool)

(assert (=> b!1079283 (=> (not res!719224) (not e!617061))))

(assert (=> b!1079283 (= res!719224 (= (select (arr!33362 _keys!1070) i!650) k0!904))))

(declare-fun b!1079284 () Bool)

(assert (=> b!1079284 (= e!617061 e!617058)))

(declare-fun res!719226 () Bool)

(assert (=> b!1079284 (=> (not res!719226) (not e!617058))))

(declare-fun lt!478786 () array!69377)

(assert (=> b!1079284 (= res!719226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478786 mask!1414))))

(assert (=> b!1079284 (= lt!478786 (array!69378 (store (arr!33362 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33898 _keys!1070)))))

(declare-fun b!1079285 () Bool)

(declare-fun res!719223 () Bool)

(assert (=> b!1079285 (=> (not res!719223) (not e!617061))))

(declare-datatypes ((List!23255 0))(
  ( (Nil!23252) (Cons!23251 (h!24460 (_ BitVec 64)) (t!32614 List!23255)) )
))
(declare-fun arrayNoDuplicates!0 (array!69377 (_ BitVec 32) List!23255) Bool)

(assert (=> b!1079285 (= res!719223 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23252))))

(declare-fun b!1079286 () Bool)

(assert (=> b!1079286 (= e!617059 (and e!617062 mapRes!41071))))

(declare-fun condMapEmpty!41071 () Bool)

(declare-fun mapDefault!41071 () ValueCell!12396)

(assert (=> b!1079286 (= condMapEmpty!41071 (= (arr!33363 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12396)) mapDefault!41071)))))

(declare-fun mapIsEmpty!41071 () Bool)

(assert (=> mapIsEmpty!41071 mapRes!41071))

(declare-fun b!1079287 () Bool)

(declare-fun res!719219 () Bool)

(assert (=> b!1079287 (=> (not res!719219) (not e!617061))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079287 (= res!719219 (and (= (size!33899 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33898 _keys!1070) (size!33899 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079288 () Bool)

(declare-fun res!719222 () Bool)

(assert (=> b!1079288 (=> (not res!719222) (not e!617058))))

(assert (=> b!1079288 (= res!719222 (arrayNoDuplicates!0 lt!478786 #b00000000000000000000000000000000 Nil!23252))))

(assert (= (and start!95556 res!719225) b!1079287))

(assert (= (and b!1079287 res!719219) b!1079282))

(assert (= (and b!1079282 res!719220) b!1079285))

(assert (= (and b!1079285 res!719223) b!1079279))

(assert (= (and b!1079279 res!719221) b!1079280))

(assert (= (and b!1079280 res!719218) b!1079283))

(assert (= (and b!1079283 res!719224) b!1079284))

(assert (= (and b!1079284 res!719226) b!1079288))

(assert (= (and b!1079288 res!719222) b!1079281))

(assert (= (and b!1079286 condMapEmpty!41071) mapIsEmpty!41071))

(assert (= (and b!1079286 (not condMapEmpty!41071)) mapNonEmpty!41071))

(get-info :version)

(assert (= (and mapNonEmpty!41071 ((_ is ValueCellFull!12396) mapValue!41071)) b!1079278))

(assert (= (and b!1079286 ((_ is ValueCellFull!12396) mapDefault!41071)) b!1079277))

(assert (= start!95556 b!1079286))

(declare-fun m!997533 () Bool)

(assert (=> b!1079281 m!997533))

(declare-fun m!997535 () Bool)

(assert (=> b!1079281 m!997535))

(declare-fun m!997537 () Bool)

(assert (=> b!1079283 m!997537))

(declare-fun m!997539 () Bool)

(assert (=> start!95556 m!997539))

(declare-fun m!997541 () Bool)

(assert (=> start!95556 m!997541))

(declare-fun m!997543 () Bool)

(assert (=> start!95556 m!997543))

(declare-fun m!997545 () Bool)

(assert (=> b!1079282 m!997545))

(declare-fun m!997547 () Bool)

(assert (=> mapNonEmpty!41071 m!997547))

(declare-fun m!997549 () Bool)

(assert (=> b!1079285 m!997549))

(declare-fun m!997551 () Bool)

(assert (=> b!1079280 m!997551))

(declare-fun m!997553 () Bool)

(assert (=> b!1079284 m!997553))

(declare-fun m!997555 () Bool)

(assert (=> b!1079284 m!997555))

(declare-fun m!997557 () Bool)

(assert (=> b!1079288 m!997557))

(check-sat (not b!1079285) (not b!1079281) (not b!1079280) (not b!1079288) (not b!1079282) (not b!1079284) (not start!95556) (not mapNonEmpty!41071) tp_is_empty!26211)
(check-sat)
