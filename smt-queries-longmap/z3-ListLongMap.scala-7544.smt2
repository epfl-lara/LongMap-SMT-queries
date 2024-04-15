; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95578 () Bool)

(assert start!95578)

(declare-fun mapIsEmpty!41113 () Bool)

(declare-fun mapRes!41113 () Bool)

(assert (=> mapIsEmpty!41113 mapRes!41113))

(declare-fun b!1079628 () Bool)

(declare-fun res!719527 () Bool)

(declare-fun e!617218 () Bool)

(assert (=> b!1079628 (=> (not res!719527) (not e!617218))))

(declare-datatypes ((array!69362 0))(
  ( (array!69363 (arr!33355 (Array (_ BitVec 32) (_ BitVec 64))) (size!33893 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69362)

(declare-datatypes ((List!23319 0))(
  ( (Nil!23316) (Cons!23315 (h!24524 (_ BitVec 64)) (t!32669 List!23319)) )
))
(declare-fun arrayNoDuplicates!0 (array!69362 (_ BitVec 32) List!23319) Bool)

(assert (=> b!1079628 (= res!719527 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23316))))

(declare-fun b!1079629 () Bool)

(declare-fun e!617222 () Bool)

(declare-fun tp_is_empty!26239 () Bool)

(assert (=> b!1079629 (= e!617222 tp_is_empty!26239)))

(declare-fun b!1079630 () Bool)

(declare-fun e!617219 () Bool)

(declare-fun e!617221 () Bool)

(assert (=> b!1079630 (= e!617219 (and e!617221 mapRes!41113))))

(declare-fun condMapEmpty!41113 () Bool)

(declare-datatypes ((V!40113 0))(
  ( (V!40114 (val!13176 Int)) )
))
(declare-datatypes ((ValueCell!12410 0))(
  ( (ValueCellFull!12410 (v!15796 V!40113)) (EmptyCell!12410) )
))
(declare-datatypes ((array!69364 0))(
  ( (array!69365 (arr!33356 (Array (_ BitVec 32) ValueCell!12410)) (size!33894 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69364)

(declare-fun mapDefault!41113 () ValueCell!12410)

(assert (=> b!1079630 (= condMapEmpty!41113 (= (arr!33356 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12410)) mapDefault!41113)))))

(declare-fun mapNonEmpty!41113 () Bool)

(declare-fun tp!78575 () Bool)

(assert (=> mapNonEmpty!41113 (= mapRes!41113 (and tp!78575 e!617222))))

(declare-fun mapKey!41113 () (_ BitVec 32))

(declare-fun mapValue!41113 () ValueCell!12410)

(declare-fun mapRest!41113 () (Array (_ BitVec 32) ValueCell!12410))

(assert (=> mapNonEmpty!41113 (= (arr!33356 _values!874) (store mapRest!41113 mapKey!41113 mapValue!41113))))

(declare-fun b!1079631 () Bool)

(declare-fun res!719532 () Bool)

(assert (=> b!1079631 (=> (not res!719532) (not e!617218))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079631 (= res!719532 (validKeyInArray!0 k0!904))))

(declare-fun res!719529 () Bool)

(assert (=> start!95578 (=> (not res!719529) (not e!617218))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95578 (= res!719529 (validMask!0 mask!1414))))

(assert (=> start!95578 e!617218))

(assert (=> start!95578 true))

(declare-fun array_inv!25792 (array!69362) Bool)

(assert (=> start!95578 (array_inv!25792 _keys!1070)))

(declare-fun array_inv!25793 (array!69364) Bool)

(assert (=> start!95578 (and (array_inv!25793 _values!874) e!617219)))

(declare-fun b!1079632 () Bool)

(declare-fun e!617217 () Bool)

(assert (=> b!1079632 (= e!617218 e!617217)))

(declare-fun res!719530 () Bool)

(assert (=> b!1079632 (=> (not res!719530) (not e!617217))))

(declare-fun lt!478669 () array!69362)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69362 (_ BitVec 32)) Bool)

(assert (=> b!1079632 (= res!719530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478669 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079632 (= lt!478669 (array!69363 (store (arr!33355 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33893 _keys!1070)))))

(declare-fun b!1079633 () Bool)

(assert (=> b!1079633 (= e!617217 (not true))))

(declare-fun arrayContainsKey!0 (array!69362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079633 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35351 0))(
  ( (Unit!35352) )
))
(declare-fun lt!478670 () Unit!35351)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69362 (_ BitVec 64) (_ BitVec 32)) Unit!35351)

(assert (=> b!1079633 (= lt!478670 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079634 () Bool)

(declare-fun res!719534 () Bool)

(assert (=> b!1079634 (=> (not res!719534) (not e!617218))))

(assert (=> b!1079634 (= res!719534 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33893 _keys!1070))))))

(declare-fun b!1079635 () Bool)

(assert (=> b!1079635 (= e!617221 tp_is_empty!26239)))

(declare-fun b!1079636 () Bool)

(declare-fun res!719531 () Bool)

(assert (=> b!1079636 (=> (not res!719531) (not e!617218))))

(assert (=> b!1079636 (= res!719531 (= (select (arr!33355 _keys!1070) i!650) k0!904))))

(declare-fun b!1079637 () Bool)

(declare-fun res!719535 () Bool)

(assert (=> b!1079637 (=> (not res!719535) (not e!617218))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079637 (= res!719535 (and (= (size!33894 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33893 _keys!1070) (size!33894 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079638 () Bool)

(declare-fun res!719533 () Bool)

(assert (=> b!1079638 (=> (not res!719533) (not e!617217))))

(assert (=> b!1079638 (= res!719533 (arrayNoDuplicates!0 lt!478669 #b00000000000000000000000000000000 Nil!23316))))

(declare-fun b!1079639 () Bool)

(declare-fun res!719528 () Bool)

(assert (=> b!1079639 (=> (not res!719528) (not e!617218))))

(assert (=> b!1079639 (= res!719528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95578 res!719529) b!1079637))

(assert (= (and b!1079637 res!719535) b!1079639))

(assert (= (and b!1079639 res!719528) b!1079628))

(assert (= (and b!1079628 res!719527) b!1079634))

(assert (= (and b!1079634 res!719534) b!1079631))

(assert (= (and b!1079631 res!719532) b!1079636))

(assert (= (and b!1079636 res!719531) b!1079632))

(assert (= (and b!1079632 res!719530) b!1079638))

(assert (= (and b!1079638 res!719533) b!1079633))

(assert (= (and b!1079630 condMapEmpty!41113) mapIsEmpty!41113))

(assert (= (and b!1079630 (not condMapEmpty!41113)) mapNonEmpty!41113))

(get-info :version)

(assert (= (and mapNonEmpty!41113 ((_ is ValueCellFull!12410) mapValue!41113)) b!1079629))

(assert (= (and b!1079630 ((_ is ValueCellFull!12410) mapDefault!41113)) b!1079635))

(assert (= start!95578 b!1079630))

(declare-fun m!997271 () Bool)

(assert (=> start!95578 m!997271))

(declare-fun m!997273 () Bool)

(assert (=> start!95578 m!997273))

(declare-fun m!997275 () Bool)

(assert (=> start!95578 m!997275))

(declare-fun m!997277 () Bool)

(assert (=> b!1079638 m!997277))

(declare-fun m!997279 () Bool)

(assert (=> b!1079639 m!997279))

(declare-fun m!997281 () Bool)

(assert (=> b!1079632 m!997281))

(declare-fun m!997283 () Bool)

(assert (=> b!1079632 m!997283))

(declare-fun m!997285 () Bool)

(assert (=> b!1079631 m!997285))

(declare-fun m!997287 () Bool)

(assert (=> b!1079633 m!997287))

(declare-fun m!997289 () Bool)

(assert (=> b!1079633 m!997289))

(declare-fun m!997291 () Bool)

(assert (=> b!1079628 m!997291))

(declare-fun m!997293 () Bool)

(assert (=> b!1079636 m!997293))

(declare-fun m!997295 () Bool)

(assert (=> mapNonEmpty!41113 m!997295))

(check-sat (not b!1079633) (not b!1079631) (not mapNonEmpty!41113) (not b!1079638) (not b!1079632) (not start!95578) tp_is_empty!26239 (not b!1079628) (not b!1079639))
(check-sat)
