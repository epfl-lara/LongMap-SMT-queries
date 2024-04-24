; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95732 () Bool)

(assert start!95732)

(declare-fun b!1079778 () Bool)

(declare-fun e!617477 () Bool)

(assert (=> b!1079778 (= e!617477 false)))

(declare-fun lt!479154 () Bool)

(declare-datatypes ((array!69325 0))(
  ( (array!69326 (arr!33331 (Array (_ BitVec 32) (_ BitVec 64))) (size!33868 (_ BitVec 32))) )
))
(declare-fun lt!479153 () array!69325)

(declare-datatypes ((List!23248 0))(
  ( (Nil!23245) (Cons!23244 (h!24462 (_ BitVec 64)) (t!32599 List!23248)) )
))
(declare-fun arrayNoDuplicates!0 (array!69325 (_ BitVec 32) List!23248) Bool)

(assert (=> b!1079778 (= lt!479154 (arrayNoDuplicates!0 lt!479153 #b00000000000000000000000000000000 Nil!23245))))

(declare-fun b!1079779 () Bool)

(declare-fun e!617482 () Bool)

(assert (=> b!1079779 (= e!617482 e!617477)))

(declare-fun res!719142 () Bool)

(assert (=> b!1079779 (=> (not res!719142) (not e!617477))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69325 (_ BitVec 32)) Bool)

(assert (=> b!1079779 (= res!719142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479153 mask!1414))))

(declare-fun _keys!1070 () array!69325)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079779 (= lt!479153 (array!69326 (store (arr!33331 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33868 _keys!1070)))))

(declare-fun b!1079780 () Bool)

(declare-fun res!719140 () Bool)

(assert (=> b!1079780 (=> (not res!719140) (not e!617482))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079780 (= res!719140 (validKeyInArray!0 k0!904))))

(declare-fun b!1079781 () Bool)

(declare-fun e!617481 () Bool)

(declare-fun tp_is_empty!26167 () Bool)

(assert (=> b!1079781 (= e!617481 tp_is_empty!26167)))

(declare-fun b!1079782 () Bool)

(declare-fun res!719141 () Bool)

(assert (=> b!1079782 (=> (not res!719141) (not e!617482))))

(assert (=> b!1079782 (= res!719141 (= (select (arr!33331 _keys!1070) i!650) k0!904))))

(declare-fun res!719143 () Bool)

(assert (=> start!95732 (=> (not res!719143) (not e!617482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95732 (= res!719143 (validMask!0 mask!1414))))

(assert (=> start!95732 e!617482))

(assert (=> start!95732 true))

(declare-fun array_inv!25786 (array!69325) Bool)

(assert (=> start!95732 (array_inv!25786 _keys!1070)))

(declare-datatypes ((V!40017 0))(
  ( (V!40018 (val!13140 Int)) )
))
(declare-datatypes ((ValueCell!12374 0))(
  ( (ValueCellFull!12374 (v!15757 V!40017)) (EmptyCell!12374) )
))
(declare-datatypes ((array!69327 0))(
  ( (array!69328 (arr!33332 (Array (_ BitVec 32) ValueCell!12374)) (size!33869 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69327)

(declare-fun e!617480 () Bool)

(declare-fun array_inv!25787 (array!69327) Bool)

(assert (=> start!95732 (and (array_inv!25787 _values!874) e!617480)))

(declare-fun b!1079783 () Bool)

(declare-fun mapRes!41002 () Bool)

(assert (=> b!1079783 (= e!617480 (and e!617481 mapRes!41002))))

(declare-fun condMapEmpty!41002 () Bool)

(declare-fun mapDefault!41002 () ValueCell!12374)

(assert (=> b!1079783 (= condMapEmpty!41002 (= (arr!33332 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12374)) mapDefault!41002)))))

(declare-fun b!1079784 () Bool)

(declare-fun e!617478 () Bool)

(assert (=> b!1079784 (= e!617478 tp_is_empty!26167)))

(declare-fun mapIsEmpty!41002 () Bool)

(assert (=> mapIsEmpty!41002 mapRes!41002))

(declare-fun b!1079785 () Bool)

(declare-fun res!719138 () Bool)

(assert (=> b!1079785 (=> (not res!719138) (not e!617482))))

(assert (=> b!1079785 (= res!719138 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23245))))

(declare-fun b!1079786 () Bool)

(declare-fun res!719136 () Bool)

(assert (=> b!1079786 (=> (not res!719136) (not e!617482))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079786 (= res!719136 (and (= (size!33869 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33868 _keys!1070) (size!33869 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079787 () Bool)

(declare-fun res!719137 () Bool)

(assert (=> b!1079787 (=> (not res!719137) (not e!617482))))

(assert (=> b!1079787 (= res!719137 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33868 _keys!1070))))))

(declare-fun mapNonEmpty!41002 () Bool)

(declare-fun tp!78464 () Bool)

(assert (=> mapNonEmpty!41002 (= mapRes!41002 (and tp!78464 e!617478))))

(declare-fun mapKey!41002 () (_ BitVec 32))

(declare-fun mapRest!41002 () (Array (_ BitVec 32) ValueCell!12374))

(declare-fun mapValue!41002 () ValueCell!12374)

(assert (=> mapNonEmpty!41002 (= (arr!33332 _values!874) (store mapRest!41002 mapKey!41002 mapValue!41002))))

(declare-fun b!1079788 () Bool)

(declare-fun res!719139 () Bool)

(assert (=> b!1079788 (=> (not res!719139) (not e!617482))))

(assert (=> b!1079788 (= res!719139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95732 res!719143) b!1079786))

(assert (= (and b!1079786 res!719136) b!1079788))

(assert (= (and b!1079788 res!719139) b!1079785))

(assert (= (and b!1079785 res!719138) b!1079787))

(assert (= (and b!1079787 res!719137) b!1079780))

(assert (= (and b!1079780 res!719140) b!1079782))

(assert (= (and b!1079782 res!719141) b!1079779))

(assert (= (and b!1079779 res!719142) b!1079778))

(assert (= (and b!1079783 condMapEmpty!41002) mapIsEmpty!41002))

(assert (= (and b!1079783 (not condMapEmpty!41002)) mapNonEmpty!41002))

(get-info :version)

(assert (= (and mapNonEmpty!41002 ((_ is ValueCellFull!12374) mapValue!41002)) b!1079784))

(assert (= (and b!1079783 ((_ is ValueCellFull!12374) mapDefault!41002)) b!1079781))

(assert (= start!95732 b!1079783))

(declare-fun m!998619 () Bool)

(assert (=> b!1079779 m!998619))

(declare-fun m!998621 () Bool)

(assert (=> b!1079779 m!998621))

(declare-fun m!998623 () Bool)

(assert (=> b!1079785 m!998623))

(declare-fun m!998625 () Bool)

(assert (=> b!1079782 m!998625))

(declare-fun m!998627 () Bool)

(assert (=> b!1079788 m!998627))

(declare-fun m!998629 () Bool)

(assert (=> b!1079780 m!998629))

(declare-fun m!998631 () Bool)

(assert (=> mapNonEmpty!41002 m!998631))

(declare-fun m!998633 () Bool)

(assert (=> start!95732 m!998633))

(declare-fun m!998635 () Bool)

(assert (=> start!95732 m!998635))

(declare-fun m!998637 () Bool)

(assert (=> start!95732 m!998637))

(declare-fun m!998639 () Bool)

(assert (=> b!1079778 m!998639))

(check-sat (not b!1079788) (not start!95732) (not b!1079779) (not b!1079785) (not b!1079780) (not mapNonEmpty!41002) (not b!1079778) tp_is_empty!26167)
(check-sat)
