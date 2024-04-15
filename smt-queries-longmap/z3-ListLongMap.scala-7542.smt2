; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95566 () Bool)

(assert start!95566)

(declare-fun b!1079412 () Bool)

(declare-fun e!617111 () Bool)

(declare-fun e!617110 () Bool)

(declare-fun mapRes!41095 () Bool)

(assert (=> b!1079412 (= e!617111 (and e!617110 mapRes!41095))))

(declare-fun condMapEmpty!41095 () Bool)

(declare-datatypes ((V!40097 0))(
  ( (V!40098 (val!13170 Int)) )
))
(declare-datatypes ((ValueCell!12404 0))(
  ( (ValueCellFull!12404 (v!15790 V!40097)) (EmptyCell!12404) )
))
(declare-datatypes ((array!69338 0))(
  ( (array!69339 (arr!33343 (Array (_ BitVec 32) ValueCell!12404)) (size!33881 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69338)

(declare-fun mapDefault!41095 () ValueCell!12404)

(assert (=> b!1079412 (= condMapEmpty!41095 (= (arr!33343 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12404)) mapDefault!41095)))))

(declare-fun b!1079413 () Bool)

(declare-fun res!719372 () Bool)

(declare-fun e!617114 () Bool)

(assert (=> b!1079413 (=> (not res!719372) (not e!617114))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69340 0))(
  ( (array!69341 (arr!33344 (Array (_ BitVec 32) (_ BitVec 64))) (size!33882 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69340)

(assert (=> b!1079413 (= res!719372 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33882 _keys!1070))))))

(declare-fun b!1079414 () Bool)

(declare-fun tp_is_empty!26227 () Bool)

(assert (=> b!1079414 (= e!617110 tp_is_empty!26227)))

(declare-fun b!1079415 () Bool)

(declare-fun res!719371 () Bool)

(declare-fun e!617113 () Bool)

(assert (=> b!1079415 (=> (not res!719371) (not e!617113))))

(declare-fun lt!478634 () array!69340)

(declare-datatypes ((List!23314 0))(
  ( (Nil!23311) (Cons!23310 (h!24519 (_ BitVec 64)) (t!32664 List!23314)) )
))
(declare-fun arrayNoDuplicates!0 (array!69340 (_ BitVec 32) List!23314) Bool)

(assert (=> b!1079415 (= res!719371 (arrayNoDuplicates!0 lt!478634 #b00000000000000000000000000000000 Nil!23311))))

(declare-fun res!719365 () Bool)

(assert (=> start!95566 (=> (not res!719365) (not e!617114))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95566 (= res!719365 (validMask!0 mask!1414))))

(assert (=> start!95566 e!617114))

(assert (=> start!95566 true))

(declare-fun array_inv!25786 (array!69340) Bool)

(assert (=> start!95566 (array_inv!25786 _keys!1070)))

(declare-fun array_inv!25787 (array!69338) Bool)

(assert (=> start!95566 (and (array_inv!25787 _values!874) e!617111)))

(declare-fun mapNonEmpty!41095 () Bool)

(declare-fun tp!78557 () Bool)

(declare-fun e!617109 () Bool)

(assert (=> mapNonEmpty!41095 (= mapRes!41095 (and tp!78557 e!617109))))

(declare-fun mapValue!41095 () ValueCell!12404)

(declare-fun mapKey!41095 () (_ BitVec 32))

(declare-fun mapRest!41095 () (Array (_ BitVec 32) ValueCell!12404))

(assert (=> mapNonEmpty!41095 (= (arr!33343 _values!874) (store mapRest!41095 mapKey!41095 mapValue!41095))))

(declare-fun b!1079416 () Bool)

(declare-fun res!719370 () Bool)

(assert (=> b!1079416 (=> (not res!719370) (not e!617114))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1079416 (= res!719370 (= (select (arr!33344 _keys!1070) i!650) k0!904))))

(declare-fun b!1079417 () Bool)

(declare-fun res!719368 () Bool)

(assert (=> b!1079417 (=> (not res!719368) (not e!617114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079417 (= res!719368 (validKeyInArray!0 k0!904))))

(declare-fun b!1079418 () Bool)

(declare-fun res!719373 () Bool)

(assert (=> b!1079418 (=> (not res!719373) (not e!617114))))

(assert (=> b!1079418 (= res!719373 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23311))))

(declare-fun b!1079419 () Bool)

(assert (=> b!1079419 (= e!617113 (not true))))

(declare-fun arrayContainsKey!0 (array!69340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079419 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35343 0))(
  ( (Unit!35344) )
))
(declare-fun lt!478633 () Unit!35343)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69340 (_ BitVec 64) (_ BitVec 32)) Unit!35343)

(assert (=> b!1079419 (= lt!478633 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41095 () Bool)

(assert (=> mapIsEmpty!41095 mapRes!41095))

(declare-fun b!1079420 () Bool)

(assert (=> b!1079420 (= e!617109 tp_is_empty!26227)))

(declare-fun b!1079421 () Bool)

(declare-fun res!719366 () Bool)

(assert (=> b!1079421 (=> (not res!719366) (not e!617114))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079421 (= res!719366 (and (= (size!33881 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33882 _keys!1070) (size!33881 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079422 () Bool)

(assert (=> b!1079422 (= e!617114 e!617113)))

(declare-fun res!719369 () Bool)

(assert (=> b!1079422 (=> (not res!719369) (not e!617113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69340 (_ BitVec 32)) Bool)

(assert (=> b!1079422 (= res!719369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478634 mask!1414))))

(assert (=> b!1079422 (= lt!478634 (array!69341 (store (arr!33344 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33882 _keys!1070)))))

(declare-fun b!1079423 () Bool)

(declare-fun res!719367 () Bool)

(assert (=> b!1079423 (=> (not res!719367) (not e!617114))))

(assert (=> b!1079423 (= res!719367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95566 res!719365) b!1079421))

(assert (= (and b!1079421 res!719366) b!1079423))

(assert (= (and b!1079423 res!719367) b!1079418))

(assert (= (and b!1079418 res!719373) b!1079413))

(assert (= (and b!1079413 res!719372) b!1079417))

(assert (= (and b!1079417 res!719368) b!1079416))

(assert (= (and b!1079416 res!719370) b!1079422))

(assert (= (and b!1079422 res!719369) b!1079415))

(assert (= (and b!1079415 res!719371) b!1079419))

(assert (= (and b!1079412 condMapEmpty!41095) mapIsEmpty!41095))

(assert (= (and b!1079412 (not condMapEmpty!41095)) mapNonEmpty!41095))

(get-info :version)

(assert (= (and mapNonEmpty!41095 ((_ is ValueCellFull!12404) mapValue!41095)) b!1079420))

(assert (= (and b!1079412 ((_ is ValueCellFull!12404) mapDefault!41095)) b!1079414))

(assert (= start!95566 b!1079412))

(declare-fun m!997115 () Bool)

(assert (=> start!95566 m!997115))

(declare-fun m!997117 () Bool)

(assert (=> start!95566 m!997117))

(declare-fun m!997119 () Bool)

(assert (=> start!95566 m!997119))

(declare-fun m!997121 () Bool)

(assert (=> b!1079423 m!997121))

(declare-fun m!997123 () Bool)

(assert (=> b!1079416 m!997123))

(declare-fun m!997125 () Bool)

(assert (=> b!1079417 m!997125))

(declare-fun m!997127 () Bool)

(assert (=> b!1079415 m!997127))

(declare-fun m!997129 () Bool)

(assert (=> b!1079418 m!997129))

(declare-fun m!997131 () Bool)

(assert (=> mapNonEmpty!41095 m!997131))

(declare-fun m!997133 () Bool)

(assert (=> b!1079422 m!997133))

(declare-fun m!997135 () Bool)

(assert (=> b!1079422 m!997135))

(declare-fun m!997137 () Bool)

(assert (=> b!1079419 m!997137))

(declare-fun m!997139 () Bool)

(assert (=> b!1079419 m!997139))

(check-sat (not b!1079422) (not mapNonEmpty!41095) (not b!1079419) (not b!1079423) tp_is_empty!26227 (not b!1079417) (not b!1079415) (not start!95566) (not b!1079418))
(check-sat)
