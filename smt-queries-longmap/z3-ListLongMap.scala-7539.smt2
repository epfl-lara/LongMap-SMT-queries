; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95790 () Bool)

(assert start!95790)

(declare-fun b!1080568 () Bool)

(declare-fun e!617900 () Bool)

(declare-fun e!617897 () Bool)

(declare-fun mapRes!41068 () Bool)

(assert (=> b!1080568 (= e!617900 (and e!617897 mapRes!41068))))

(declare-fun condMapEmpty!41068 () Bool)

(declare-datatypes ((V!40073 0))(
  ( (V!40074 (val!13161 Int)) )
))
(declare-datatypes ((ValueCell!12395 0))(
  ( (ValueCellFull!12395 (v!15778 V!40073)) (EmptyCell!12395) )
))
(declare-datatypes ((array!69407 0))(
  ( (array!69408 (arr!33371 (Array (_ BitVec 32) ValueCell!12395)) (size!33908 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69407)

(declare-fun mapDefault!41068 () ValueCell!12395)

(assert (=> b!1080568 (= condMapEmpty!41068 (= (arr!33371 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12395)) mapDefault!41068)))))

(declare-fun b!1080569 () Bool)

(declare-fun e!617896 () Bool)

(declare-fun tp_is_empty!26209 () Bool)

(assert (=> b!1080569 (= e!617896 tp_is_empty!26209)))

(declare-fun b!1080570 () Bool)

(declare-fun res!719717 () Bool)

(declare-fun e!617899 () Bool)

(assert (=> b!1080570 (=> (not res!719717) (not e!617899))))

(declare-datatypes ((array!69409 0))(
  ( (array!69410 (arr!33372 (Array (_ BitVec 32) (_ BitVec 64))) (size!33909 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69409)

(declare-datatypes ((List!23263 0))(
  ( (Nil!23260) (Cons!23259 (h!24477 (_ BitVec 64)) (t!32614 List!23263)) )
))
(declare-fun arrayNoDuplicates!0 (array!69409 (_ BitVec 32) List!23263) Bool)

(assert (=> b!1080570 (= res!719717 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23260))))

(declare-fun b!1080571 () Bool)

(declare-fun res!719720 () Bool)

(declare-fun e!617895 () Bool)

(assert (=> b!1080571 (=> (not res!719720) (not e!617895))))

(declare-fun lt!479294 () array!69409)

(assert (=> b!1080571 (= res!719720 (arrayNoDuplicates!0 lt!479294 #b00000000000000000000000000000000 Nil!23260))))

(declare-fun mapIsEmpty!41068 () Bool)

(assert (=> mapIsEmpty!41068 mapRes!41068))

(declare-fun b!1080572 () Bool)

(assert (=> b!1080572 (= e!617895 (not true))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080572 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35459 0))(
  ( (Unit!35460) )
))
(declare-fun lt!479295 () Unit!35459)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69409 (_ BitVec 64) (_ BitVec 32)) Unit!35459)

(assert (=> b!1080572 (= lt!479295 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080573 () Bool)

(declare-fun res!719719 () Bool)

(assert (=> b!1080573 (=> (not res!719719) (not e!617899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080573 (= res!719719 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41068 () Bool)

(declare-fun tp!78530 () Bool)

(assert (=> mapNonEmpty!41068 (= mapRes!41068 (and tp!78530 e!617896))))

(declare-fun mapKey!41068 () (_ BitVec 32))

(declare-fun mapRest!41068 () (Array (_ BitVec 32) ValueCell!12395))

(declare-fun mapValue!41068 () ValueCell!12395)

(assert (=> mapNonEmpty!41068 (= (arr!33371 _values!874) (store mapRest!41068 mapKey!41068 mapValue!41068))))

(declare-fun b!1080574 () Bool)

(declare-fun res!719718 () Bool)

(assert (=> b!1080574 (=> (not res!719718) (not e!617899))))

(assert (=> b!1080574 (= res!719718 (= (select (arr!33372 _keys!1070) i!650) k0!904))))

(declare-fun b!1080575 () Bool)

(declare-fun res!719715 () Bool)

(assert (=> b!1080575 (=> (not res!719715) (not e!617899))))

(assert (=> b!1080575 (= res!719715 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33909 _keys!1070))))))

(declare-fun b!1080576 () Bool)

(assert (=> b!1080576 (= e!617897 tp_is_empty!26209)))

(declare-fun res!719716 () Bool)

(assert (=> start!95790 (=> (not res!719716) (not e!617899))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95790 (= res!719716 (validMask!0 mask!1414))))

(assert (=> start!95790 e!617899))

(assert (=> start!95790 true))

(declare-fun array_inv!25808 (array!69409) Bool)

(assert (=> start!95790 (array_inv!25808 _keys!1070)))

(declare-fun array_inv!25809 (array!69407) Bool)

(assert (=> start!95790 (and (array_inv!25809 _values!874) e!617900)))

(declare-fun b!1080577 () Bool)

(declare-fun res!719713 () Bool)

(assert (=> b!1080577 (=> (not res!719713) (not e!617899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69409 (_ BitVec 32)) Bool)

(assert (=> b!1080577 (= res!719713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080578 () Bool)

(assert (=> b!1080578 (= e!617899 e!617895)))

(declare-fun res!719721 () Bool)

(assert (=> b!1080578 (=> (not res!719721) (not e!617895))))

(assert (=> b!1080578 (= res!719721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479294 mask!1414))))

(assert (=> b!1080578 (= lt!479294 (array!69410 (store (arr!33372 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33909 _keys!1070)))))

(declare-fun b!1080579 () Bool)

(declare-fun res!719714 () Bool)

(assert (=> b!1080579 (=> (not res!719714) (not e!617899))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1080579 (= res!719714 (and (= (size!33908 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33909 _keys!1070) (size!33908 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95790 res!719716) b!1080579))

(assert (= (and b!1080579 res!719714) b!1080577))

(assert (= (and b!1080577 res!719713) b!1080570))

(assert (= (and b!1080570 res!719717) b!1080575))

(assert (= (and b!1080575 res!719715) b!1080573))

(assert (= (and b!1080573 res!719719) b!1080574))

(assert (= (and b!1080574 res!719718) b!1080578))

(assert (= (and b!1080578 res!719721) b!1080571))

(assert (= (and b!1080571 res!719720) b!1080572))

(assert (= (and b!1080568 condMapEmpty!41068) mapIsEmpty!41068))

(assert (= (and b!1080568 (not condMapEmpty!41068)) mapNonEmpty!41068))

(get-info :version)

(assert (= (and mapNonEmpty!41068 ((_ is ValueCellFull!12395) mapValue!41068)) b!1080569))

(assert (= (and b!1080568 ((_ is ValueCellFull!12395) mapDefault!41068)) b!1080576))

(assert (= start!95790 b!1080568))

(declare-fun m!999179 () Bool)

(assert (=> b!1080578 m!999179))

(declare-fun m!999181 () Bool)

(assert (=> b!1080578 m!999181))

(declare-fun m!999183 () Bool)

(assert (=> start!95790 m!999183))

(declare-fun m!999185 () Bool)

(assert (=> start!95790 m!999185))

(declare-fun m!999187 () Bool)

(assert (=> start!95790 m!999187))

(declare-fun m!999189 () Bool)

(assert (=> b!1080577 m!999189))

(declare-fun m!999191 () Bool)

(assert (=> b!1080573 m!999191))

(declare-fun m!999193 () Bool)

(assert (=> mapNonEmpty!41068 m!999193))

(declare-fun m!999195 () Bool)

(assert (=> b!1080571 m!999195))

(declare-fun m!999197 () Bool)

(assert (=> b!1080572 m!999197))

(declare-fun m!999199 () Bool)

(assert (=> b!1080572 m!999199))

(declare-fun m!999201 () Bool)

(assert (=> b!1080570 m!999201))

(declare-fun m!999203 () Bool)

(assert (=> b!1080574 m!999203))

(check-sat (not b!1080577) tp_is_empty!26209 (not mapNonEmpty!41068) (not b!1080570) (not start!95790) (not b!1080571) (not b!1080573) (not b!1080578) (not b!1080572))
(check-sat)
