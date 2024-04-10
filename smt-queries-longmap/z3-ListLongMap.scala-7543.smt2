; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95580 () Bool)

(assert start!95580)

(declare-fun b!1079709 () Bool)

(declare-fun e!617274 () Bool)

(declare-fun e!617279 () Bool)

(assert (=> b!1079709 (= e!617274 e!617279)))

(declare-fun res!719544 () Bool)

(assert (=> b!1079709 (=> (not res!719544) (not e!617279))))

(declare-datatypes ((array!69425 0))(
  ( (array!69426 (arr!33386 (Array (_ BitVec 32) (_ BitVec 64))) (size!33922 (_ BitVec 32))) )
))
(declare-fun lt!478858 () array!69425)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69425 (_ BitVec 32)) Bool)

(assert (=> b!1079709 (= res!719544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478858 mask!1414))))

(declare-fun _keys!1070 () array!69425)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079709 (= lt!478858 (array!69426 (store (arr!33386 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33922 _keys!1070)))))

(declare-fun b!1079710 () Bool)

(assert (=> b!1079710 (= e!617279 (not true))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079710 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35500 0))(
  ( (Unit!35501) )
))
(declare-fun lt!478857 () Unit!35500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69425 (_ BitVec 64) (_ BitVec 32)) Unit!35500)

(assert (=> b!1079710 (= lt!478857 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079711 () Bool)

(declare-fun res!719543 () Bool)

(assert (=> b!1079711 (=> (not res!719543) (not e!617279))))

(declare-datatypes ((List!23267 0))(
  ( (Nil!23264) (Cons!23263 (h!24472 (_ BitVec 64)) (t!32626 List!23267)) )
))
(declare-fun arrayNoDuplicates!0 (array!69425 (_ BitVec 32) List!23267) Bool)

(assert (=> b!1079711 (= res!719543 (arrayNoDuplicates!0 lt!478858 #b00000000000000000000000000000000 Nil!23264))))

(declare-fun b!1079712 () Bool)

(declare-fun res!719546 () Bool)

(assert (=> b!1079712 (=> (not res!719546) (not e!617274))))

(declare-datatypes ((V!40107 0))(
  ( (V!40108 (val!13174 Int)) )
))
(declare-datatypes ((ValueCell!12408 0))(
  ( (ValueCellFull!12408 (v!15795 V!40107)) (EmptyCell!12408) )
))
(declare-datatypes ((array!69427 0))(
  ( (array!69428 (arr!33387 (Array (_ BitVec 32) ValueCell!12408)) (size!33923 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69427)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079712 (= res!719546 (and (= (size!33923 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33922 _keys!1070) (size!33923 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!719547 () Bool)

(assert (=> start!95580 (=> (not res!719547) (not e!617274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95580 (= res!719547 (validMask!0 mask!1414))))

(assert (=> start!95580 e!617274))

(assert (=> start!95580 true))

(declare-fun array_inv!25782 (array!69425) Bool)

(assert (=> start!95580 (array_inv!25782 _keys!1070)))

(declare-fun e!617278 () Bool)

(declare-fun array_inv!25783 (array!69427) Bool)

(assert (=> start!95580 (and (array_inv!25783 _values!874) e!617278)))

(declare-fun b!1079713 () Bool)

(declare-fun res!719550 () Bool)

(assert (=> b!1079713 (=> (not res!719550) (not e!617274))))

(assert (=> b!1079713 (= res!719550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079714 () Bool)

(declare-fun res!719549 () Bool)

(assert (=> b!1079714 (=> (not res!719549) (not e!617274))))

(assert (=> b!1079714 (= res!719549 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23264))))

(declare-fun b!1079715 () Bool)

(declare-fun res!719542 () Bool)

(assert (=> b!1079715 (=> (not res!719542) (not e!617274))))

(assert (=> b!1079715 (= res!719542 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33922 _keys!1070))))))

(declare-fun b!1079716 () Bool)

(declare-fun e!617276 () Bool)

(declare-fun tp_is_empty!26235 () Bool)

(assert (=> b!1079716 (= e!617276 tp_is_empty!26235)))

(declare-fun b!1079717 () Bool)

(declare-fun e!617277 () Bool)

(assert (=> b!1079717 (= e!617277 tp_is_empty!26235)))

(declare-fun b!1079718 () Bool)

(declare-fun mapRes!41107 () Bool)

(assert (=> b!1079718 (= e!617278 (and e!617276 mapRes!41107))))

(declare-fun condMapEmpty!41107 () Bool)

(declare-fun mapDefault!41107 () ValueCell!12408)

(assert (=> b!1079718 (= condMapEmpty!41107 (= (arr!33387 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12408)) mapDefault!41107)))))

(declare-fun b!1079719 () Bool)

(declare-fun res!719545 () Bool)

(assert (=> b!1079719 (=> (not res!719545) (not e!617274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079719 (= res!719545 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41107 () Bool)

(declare-fun tp!78569 () Bool)

(assert (=> mapNonEmpty!41107 (= mapRes!41107 (and tp!78569 e!617277))))

(declare-fun mapKey!41107 () (_ BitVec 32))

(declare-fun mapValue!41107 () ValueCell!12408)

(declare-fun mapRest!41107 () (Array (_ BitVec 32) ValueCell!12408))

(assert (=> mapNonEmpty!41107 (= (arr!33387 _values!874) (store mapRest!41107 mapKey!41107 mapValue!41107))))

(declare-fun b!1079720 () Bool)

(declare-fun res!719548 () Bool)

(assert (=> b!1079720 (=> (not res!719548) (not e!617274))))

(assert (=> b!1079720 (= res!719548 (= (select (arr!33386 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41107 () Bool)

(assert (=> mapIsEmpty!41107 mapRes!41107))

(assert (= (and start!95580 res!719547) b!1079712))

(assert (= (and b!1079712 res!719546) b!1079713))

(assert (= (and b!1079713 res!719550) b!1079714))

(assert (= (and b!1079714 res!719549) b!1079715))

(assert (= (and b!1079715 res!719542) b!1079719))

(assert (= (and b!1079719 res!719545) b!1079720))

(assert (= (and b!1079720 res!719548) b!1079709))

(assert (= (and b!1079709 res!719544) b!1079711))

(assert (= (and b!1079711 res!719543) b!1079710))

(assert (= (and b!1079718 condMapEmpty!41107) mapIsEmpty!41107))

(assert (= (and b!1079718 (not condMapEmpty!41107)) mapNonEmpty!41107))

(get-info :version)

(assert (= (and mapNonEmpty!41107 ((_ is ValueCellFull!12408) mapValue!41107)) b!1079717))

(assert (= (and b!1079718 ((_ is ValueCellFull!12408) mapDefault!41107)) b!1079716))

(assert (= start!95580 b!1079718))

(declare-fun m!997845 () Bool)

(assert (=> b!1079713 m!997845))

(declare-fun m!997847 () Bool)

(assert (=> b!1079720 m!997847))

(declare-fun m!997849 () Bool)

(assert (=> b!1079714 m!997849))

(declare-fun m!997851 () Bool)

(assert (=> b!1079719 m!997851))

(declare-fun m!997853 () Bool)

(assert (=> b!1079710 m!997853))

(declare-fun m!997855 () Bool)

(assert (=> b!1079710 m!997855))

(declare-fun m!997857 () Bool)

(assert (=> b!1079711 m!997857))

(declare-fun m!997859 () Bool)

(assert (=> b!1079709 m!997859))

(declare-fun m!997861 () Bool)

(assert (=> b!1079709 m!997861))

(declare-fun m!997863 () Bool)

(assert (=> mapNonEmpty!41107 m!997863))

(declare-fun m!997865 () Bool)

(assert (=> start!95580 m!997865))

(declare-fun m!997867 () Bool)

(assert (=> start!95580 m!997867))

(declare-fun m!997869 () Bool)

(assert (=> start!95580 m!997869))

(check-sat (not b!1079719) (not start!95580) (not b!1079709) (not b!1079713) (not b!1079710) (not b!1079711) tp_is_empty!26235 (not mapNonEmpty!41107) (not b!1079714))
(check-sat)
