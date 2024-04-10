; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95492 () Bool)

(assert start!95492)

(declare-fun mapIsEmpty!40996 () Bool)

(declare-fun mapRes!40996 () Bool)

(assert (=> mapIsEmpty!40996 mapRes!40996))

(declare-fun b!1078385 () Bool)

(declare-fun res!718567 () Bool)

(declare-fun e!616589 () Bool)

(assert (=> b!1078385 (=> (not res!718567) (not e!616589))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69281 0))(
  ( (array!69282 (arr!33315 (Array (_ BitVec 32) (_ BitVec 64))) (size!33851 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69281)

(assert (=> b!1078385 (= res!718567 (= (select (arr!33315 _keys!1070) i!650) k0!904))))

(declare-fun b!1078386 () Bool)

(declare-fun e!616590 () Bool)

(assert (=> b!1078386 (= e!616589 e!616590)))

(declare-fun res!718573 () Bool)

(assert (=> b!1078386 (=> (not res!718573) (not e!616590))))

(declare-fun lt!478627 () array!69281)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69281 (_ BitVec 32)) Bool)

(assert (=> b!1078386 (= res!718573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478627 mask!1414))))

(assert (=> b!1078386 (= lt!478627 (array!69282 (store (arr!33315 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33851 _keys!1070)))))

(declare-fun b!1078387 () Bool)

(declare-fun res!718570 () Bool)

(assert (=> b!1078387 (=> (not res!718570) (not e!616589))))

(assert (=> b!1078387 (= res!718570 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33851 _keys!1070))))))

(declare-fun mapNonEmpty!40996 () Bool)

(declare-fun tp!78458 () Bool)

(declare-fun e!616591 () Bool)

(assert (=> mapNonEmpty!40996 (= mapRes!40996 (and tp!78458 e!616591))))

(declare-datatypes ((V!40011 0))(
  ( (V!40012 (val!13138 Int)) )
))
(declare-datatypes ((ValueCell!12372 0))(
  ( (ValueCellFull!12372 (v!15759 V!40011)) (EmptyCell!12372) )
))
(declare-datatypes ((array!69283 0))(
  ( (array!69284 (arr!33316 (Array (_ BitVec 32) ValueCell!12372)) (size!33852 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69283)

(declare-fun mapValue!40996 () ValueCell!12372)

(declare-fun mapRest!40996 () (Array (_ BitVec 32) ValueCell!12372))

(declare-fun mapKey!40996 () (_ BitVec 32))

(assert (=> mapNonEmpty!40996 (= (arr!33316 _values!874) (store mapRest!40996 mapKey!40996 mapValue!40996))))

(declare-fun b!1078388 () Bool)

(declare-fun res!718566 () Bool)

(assert (=> b!1078388 (=> (not res!718566) (not e!616589))))

(declare-datatypes ((List!23237 0))(
  ( (Nil!23234) (Cons!23233 (h!24442 (_ BitVec 64)) (t!32596 List!23237)) )
))
(declare-fun arrayNoDuplicates!0 (array!69281 (_ BitVec 32) List!23237) Bool)

(assert (=> b!1078388 (= res!718566 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23234))))

(declare-fun b!1078389 () Bool)

(assert (=> b!1078389 (= e!616590 false)))

(declare-fun lt!478626 () Bool)

(assert (=> b!1078389 (= lt!478626 (arrayNoDuplicates!0 lt!478627 #b00000000000000000000000000000000 Nil!23234))))

(declare-fun b!1078391 () Bool)

(declare-fun e!616586 () Bool)

(declare-fun tp_is_empty!26163 () Bool)

(assert (=> b!1078391 (= e!616586 tp_is_empty!26163)))

(declare-fun b!1078392 () Bool)

(declare-fun res!718572 () Bool)

(assert (=> b!1078392 (=> (not res!718572) (not e!616589))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078392 (= res!718572 (and (= (size!33852 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33851 _keys!1070) (size!33852 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078393 () Bool)

(declare-fun e!616587 () Bool)

(assert (=> b!1078393 (= e!616587 (and e!616586 mapRes!40996))))

(declare-fun condMapEmpty!40996 () Bool)

(declare-fun mapDefault!40996 () ValueCell!12372)

(assert (=> b!1078393 (= condMapEmpty!40996 (= (arr!33316 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12372)) mapDefault!40996)))))

(declare-fun b!1078394 () Bool)

(declare-fun res!718568 () Bool)

(assert (=> b!1078394 (=> (not res!718568) (not e!616589))))

(assert (=> b!1078394 (= res!718568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078395 () Bool)

(declare-fun res!718569 () Bool)

(assert (=> b!1078395 (=> (not res!718569) (not e!616589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078395 (= res!718569 (validKeyInArray!0 k0!904))))

(declare-fun b!1078390 () Bool)

(assert (=> b!1078390 (= e!616591 tp_is_empty!26163)))

(declare-fun res!718571 () Bool)

(assert (=> start!95492 (=> (not res!718571) (not e!616589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95492 (= res!718571 (validMask!0 mask!1414))))

(assert (=> start!95492 e!616589))

(assert (=> start!95492 true))

(declare-fun array_inv!25732 (array!69281) Bool)

(assert (=> start!95492 (array_inv!25732 _keys!1070)))

(declare-fun array_inv!25733 (array!69283) Bool)

(assert (=> start!95492 (and (array_inv!25733 _values!874) e!616587)))

(assert (= (and start!95492 res!718571) b!1078392))

(assert (= (and b!1078392 res!718572) b!1078394))

(assert (= (and b!1078394 res!718568) b!1078388))

(assert (= (and b!1078388 res!718566) b!1078387))

(assert (= (and b!1078387 res!718570) b!1078395))

(assert (= (and b!1078395 res!718569) b!1078385))

(assert (= (and b!1078385 res!718567) b!1078386))

(assert (= (and b!1078386 res!718573) b!1078389))

(assert (= (and b!1078393 condMapEmpty!40996) mapIsEmpty!40996))

(assert (= (and b!1078393 (not condMapEmpty!40996)) mapNonEmpty!40996))

(get-info :version)

(assert (= (and mapNonEmpty!40996 ((_ is ValueCellFull!12372) mapValue!40996)) b!1078390))

(assert (= (and b!1078393 ((_ is ValueCellFull!12372) mapDefault!40996)) b!1078391))

(assert (= start!95492 b!1078393))

(declare-fun m!996903 () Bool)

(assert (=> b!1078389 m!996903))

(declare-fun m!996905 () Bool)

(assert (=> start!95492 m!996905))

(declare-fun m!996907 () Bool)

(assert (=> start!95492 m!996907))

(declare-fun m!996909 () Bool)

(assert (=> start!95492 m!996909))

(declare-fun m!996911 () Bool)

(assert (=> b!1078388 m!996911))

(declare-fun m!996913 () Bool)

(assert (=> b!1078386 m!996913))

(declare-fun m!996915 () Bool)

(assert (=> b!1078386 m!996915))

(declare-fun m!996917 () Bool)

(assert (=> b!1078395 m!996917))

(declare-fun m!996919 () Bool)

(assert (=> mapNonEmpty!40996 m!996919))

(declare-fun m!996921 () Bool)

(assert (=> b!1078385 m!996921))

(declare-fun m!996923 () Bool)

(assert (=> b!1078394 m!996923))

(check-sat tp_is_empty!26163 (not mapNonEmpty!40996) (not b!1078395) (not start!95492) (not b!1078389) (not b!1078388) (not b!1078394) (not b!1078386))
(check-sat)
