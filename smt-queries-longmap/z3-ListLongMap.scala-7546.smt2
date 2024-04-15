; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95590 () Bool)

(assert start!95590)

(declare-fun b_free!22249 () Bool)

(declare-fun b_next!22249 () Bool)

(assert (=> start!95590 (= b_free!22249 (not b_next!22249))))

(declare-fun tp!78595 () Bool)

(declare-fun b_and!35201 () Bool)

(assert (=> start!95590 (= tp!78595 b_and!35201)))

(declare-fun mapIsEmpty!41131 () Bool)

(declare-fun mapRes!41131 () Bool)

(assert (=> mapIsEmpty!41131 mapRes!41131))

(declare-fun res!719694 () Bool)

(declare-fun e!617325 () Bool)

(assert (=> start!95590 (=> (not res!719694) (not e!617325))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95590 (= res!719694 (validMask!0 mask!1414))))

(assert (=> start!95590 e!617325))

(assert (=> start!95590 tp!78595))

(assert (=> start!95590 true))

(declare-fun tp_is_empty!26251 () Bool)

(assert (=> start!95590 tp_is_empty!26251))

(declare-datatypes ((array!69384 0))(
  ( (array!69385 (arr!33366 (Array (_ BitVec 32) (_ BitVec 64))) (size!33904 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69384)

(declare-fun array_inv!25798 (array!69384) Bool)

(assert (=> start!95590 (array_inv!25798 _keys!1070)))

(declare-datatypes ((V!40129 0))(
  ( (V!40130 (val!13182 Int)) )
))
(declare-datatypes ((ValueCell!12416 0))(
  ( (ValueCellFull!12416 (v!15802 V!40129)) (EmptyCell!12416) )
))
(declare-datatypes ((array!69386 0))(
  ( (array!69387 (arr!33367 (Array (_ BitVec 32) ValueCell!12416)) (size!33905 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69386)

(declare-fun e!617329 () Bool)

(declare-fun array_inv!25799 (array!69386) Bool)

(assert (=> start!95590 (and (array_inv!25799 _values!874) e!617329)))

(declare-fun b!1079844 () Bool)

(declare-fun res!719697 () Bool)

(declare-fun e!617326 () Bool)

(assert (=> b!1079844 (=> (not res!719697) (not e!617326))))

(declare-fun lt!478708 () array!69384)

(declare-datatypes ((List!23322 0))(
  ( (Nil!23319) (Cons!23318 (h!24527 (_ BitVec 64)) (t!32672 List!23322)) )
))
(declare-fun arrayNoDuplicates!0 (array!69384 (_ BitVec 32) List!23322) Bool)

(assert (=> b!1079844 (= res!719697 (arrayNoDuplicates!0 lt!478708 #b00000000000000000000000000000000 Nil!23319))))

(declare-fun b!1079845 () Bool)

(declare-fun res!719692 () Bool)

(assert (=> b!1079845 (=> (not res!719692) (not e!617325))))

(assert (=> b!1079845 (= res!719692 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23319))))

(declare-fun b!1079846 () Bool)

(declare-fun res!719696 () Bool)

(assert (=> b!1079846 (=> (not res!719696) (not e!617325))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079846 (= res!719696 (= (select (arr!33366 _keys!1070) i!650) k0!904))))

(declare-fun b!1079847 () Bool)

(declare-fun e!617328 () Bool)

(assert (=> b!1079847 (= e!617328 tp_is_empty!26251)))

(declare-fun b!1079848 () Bool)

(declare-fun res!719691 () Bool)

(assert (=> b!1079848 (=> (not res!719691) (not e!617325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079848 (= res!719691 (validKeyInArray!0 k0!904))))

(declare-fun b!1079849 () Bool)

(declare-fun res!719690 () Bool)

(assert (=> b!1079849 (=> (not res!719690) (not e!617325))))

(assert (=> b!1079849 (= res!719690 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33904 _keys!1070))))))

(declare-fun b!1079850 () Bool)

(declare-fun res!719689 () Bool)

(assert (=> b!1079850 (=> (not res!719689) (not e!617325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69384 (_ BitVec 32)) Bool)

(assert (=> b!1079850 (= res!719689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079851 () Bool)

(assert (=> b!1079851 (= e!617326 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40129)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16762 0))(
  ( (tuple2!16763 (_1!8392 (_ BitVec 64)) (_2!8392 V!40129)) )
))
(declare-datatypes ((List!23323 0))(
  ( (Nil!23320) (Cons!23319 (h!24528 tuple2!16762) (t!32673 List!23323)) )
))
(declare-datatypes ((ListLongMap!14731 0))(
  ( (ListLongMap!14732 (toList!7381 List!23323)) )
))
(declare-fun lt!478707 () ListLongMap!14731)

(declare-fun zeroValue!831 () V!40129)

(declare-fun getCurrentListMapNoExtraKeys!3944 (array!69384 array!69386 (_ BitVec 32) (_ BitVec 32) V!40129 V!40129 (_ BitVec 32) Int) ListLongMap!14731)

(assert (=> b!1079851 (= lt!478707 (getCurrentListMapNoExtraKeys!3944 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079851 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35355 0))(
  ( (Unit!35356) )
))
(declare-fun lt!478709 () Unit!35355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69384 (_ BitVec 64) (_ BitVec 32)) Unit!35355)

(assert (=> b!1079851 (= lt!478709 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079852 () Bool)

(declare-fun e!617327 () Bool)

(assert (=> b!1079852 (= e!617327 tp_is_empty!26251)))

(declare-fun b!1079853 () Bool)

(assert (=> b!1079853 (= e!617329 (and e!617328 mapRes!41131))))

(declare-fun condMapEmpty!41131 () Bool)

(declare-fun mapDefault!41131 () ValueCell!12416)

(assert (=> b!1079853 (= condMapEmpty!41131 (= (arr!33367 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12416)) mapDefault!41131)))))

(declare-fun b!1079854 () Bool)

(declare-fun res!719693 () Bool)

(assert (=> b!1079854 (=> (not res!719693) (not e!617325))))

(assert (=> b!1079854 (= res!719693 (and (= (size!33905 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33904 _keys!1070) (size!33905 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41131 () Bool)

(declare-fun tp!78596 () Bool)

(assert (=> mapNonEmpty!41131 (= mapRes!41131 (and tp!78596 e!617327))))

(declare-fun mapValue!41131 () ValueCell!12416)

(declare-fun mapRest!41131 () (Array (_ BitVec 32) ValueCell!12416))

(declare-fun mapKey!41131 () (_ BitVec 32))

(assert (=> mapNonEmpty!41131 (= (arr!33367 _values!874) (store mapRest!41131 mapKey!41131 mapValue!41131))))

(declare-fun b!1079855 () Bool)

(assert (=> b!1079855 (= e!617325 e!617326)))

(declare-fun res!719695 () Bool)

(assert (=> b!1079855 (=> (not res!719695) (not e!617326))))

(assert (=> b!1079855 (= res!719695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478708 mask!1414))))

(assert (=> b!1079855 (= lt!478708 (array!69385 (store (arr!33366 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33904 _keys!1070)))))

(assert (= (and start!95590 res!719694) b!1079854))

(assert (= (and b!1079854 res!719693) b!1079850))

(assert (= (and b!1079850 res!719689) b!1079845))

(assert (= (and b!1079845 res!719692) b!1079849))

(assert (= (and b!1079849 res!719690) b!1079848))

(assert (= (and b!1079848 res!719691) b!1079846))

(assert (= (and b!1079846 res!719696) b!1079855))

(assert (= (and b!1079855 res!719695) b!1079844))

(assert (= (and b!1079844 res!719697) b!1079851))

(assert (= (and b!1079853 condMapEmpty!41131) mapIsEmpty!41131))

(assert (= (and b!1079853 (not condMapEmpty!41131)) mapNonEmpty!41131))

(get-info :version)

(assert (= (and mapNonEmpty!41131 ((_ is ValueCellFull!12416) mapValue!41131)) b!1079852))

(assert (= (and b!1079853 ((_ is ValueCellFull!12416) mapDefault!41131)) b!1079847))

(assert (= start!95590 b!1079853))

(declare-fun m!997427 () Bool)

(assert (=> b!1079848 m!997427))

(declare-fun m!997429 () Bool)

(assert (=> b!1079844 m!997429))

(declare-fun m!997431 () Bool)

(assert (=> mapNonEmpty!41131 m!997431))

(declare-fun m!997433 () Bool)

(assert (=> b!1079845 m!997433))

(declare-fun m!997435 () Bool)

(assert (=> b!1079851 m!997435))

(declare-fun m!997437 () Bool)

(assert (=> b!1079851 m!997437))

(declare-fun m!997439 () Bool)

(assert (=> b!1079851 m!997439))

(declare-fun m!997441 () Bool)

(assert (=> b!1079855 m!997441))

(declare-fun m!997443 () Bool)

(assert (=> b!1079855 m!997443))

(declare-fun m!997445 () Bool)

(assert (=> b!1079850 m!997445))

(declare-fun m!997447 () Bool)

(assert (=> start!95590 m!997447))

(declare-fun m!997449 () Bool)

(assert (=> start!95590 m!997449))

(declare-fun m!997451 () Bool)

(assert (=> start!95590 m!997451))

(declare-fun m!997453 () Bool)

(assert (=> b!1079846 m!997453))

(check-sat (not b_next!22249) b_and!35201 (not b!1079844) tp_is_empty!26251 (not mapNonEmpty!41131) (not b!1079845) (not b!1079855) (not b!1079848) (not b!1079851) (not start!95590) (not b!1079850))
(check-sat b_and!35201 (not b_next!22249))
