; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95622 () Bool)

(assert start!95622)

(declare-fun b_free!22275 () Bool)

(declare-fun b_next!22275 () Bool)

(assert (=> start!95622 (= b_free!22275 (not b_next!22275))))

(declare-fun tp!78674 () Bool)

(declare-fun b_and!35253 () Bool)

(assert (=> start!95622 (= tp!78674 b_and!35253)))

(declare-fun b!1080465 () Bool)

(declare-fun res!720117 () Bool)

(declare-fun e!617656 () Bool)

(assert (=> b!1080465 (=> (not res!720117) (not e!617656))))

(declare-datatypes ((array!69505 0))(
  ( (array!69506 (arr!33426 (Array (_ BitVec 32) (_ BitVec 64))) (size!33962 (_ BitVec 32))) )
))
(declare-fun lt!479026 () array!69505)

(declare-datatypes ((List!23292 0))(
  ( (Nil!23289) (Cons!23288 (h!24497 (_ BitVec 64)) (t!32651 List!23292)) )
))
(declare-fun arrayNoDuplicates!0 (array!69505 (_ BitVec 32) List!23292) Bool)

(assert (=> b!1080465 (= res!720117 (arrayNoDuplicates!0 lt!479026 #b00000000000000000000000000000000 Nil!23289))))

(declare-fun res!720113 () Bool)

(declare-fun e!617655 () Bool)

(assert (=> start!95622 (=> (not res!720113) (not e!617655))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95622 (= res!720113 (validMask!0 mask!1414))))

(assert (=> start!95622 e!617655))

(assert (=> start!95622 tp!78674))

(assert (=> start!95622 true))

(declare-fun tp_is_empty!26277 () Bool)

(assert (=> start!95622 tp_is_empty!26277))

(declare-fun _keys!1070 () array!69505)

(declare-fun array_inv!25810 (array!69505) Bool)

(assert (=> start!95622 (array_inv!25810 _keys!1070)))

(declare-datatypes ((V!40163 0))(
  ( (V!40164 (val!13195 Int)) )
))
(declare-datatypes ((ValueCell!12429 0))(
  ( (ValueCellFull!12429 (v!15816 V!40163)) (EmptyCell!12429) )
))
(declare-datatypes ((array!69507 0))(
  ( (array!69508 (arr!33427 (Array (_ BitVec 32) ValueCell!12429)) (size!33963 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69507)

(declare-fun e!617654 () Bool)

(declare-fun array_inv!25811 (array!69507) Bool)

(assert (=> start!95622 (and (array_inv!25811 _values!874) e!617654)))

(declare-fun b!1080466 () Bool)

(declare-fun res!720110 () Bool)

(assert (=> b!1080466 (=> (not res!720110) (not e!617655))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1080466 (= res!720110 (and (= (size!33963 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33962 _keys!1070) (size!33963 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080467 () Bool)

(declare-fun res!720111 () Bool)

(assert (=> b!1080467 (=> (not res!720111) (not e!617655))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080467 (= res!720111 (= (select (arr!33426 _keys!1070) i!650) k0!904))))

(declare-fun b!1080468 () Bool)

(declare-fun res!720114 () Bool)

(assert (=> b!1080468 (=> (not res!720114) (not e!617655))))

(assert (=> b!1080468 (= res!720114 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33962 _keys!1070))))))

(declare-fun mapNonEmpty!41170 () Bool)

(declare-fun mapRes!41170 () Bool)

(declare-fun tp!78673 () Bool)

(declare-fun e!617652 () Bool)

(assert (=> mapNonEmpty!41170 (= mapRes!41170 (and tp!78673 e!617652))))

(declare-fun mapKey!41170 () (_ BitVec 32))

(declare-fun mapRest!41170 () (Array (_ BitVec 32) ValueCell!12429))

(declare-fun mapValue!41170 () ValueCell!12429)

(assert (=> mapNonEmpty!41170 (= (arr!33427 _values!874) (store mapRest!41170 mapKey!41170 mapValue!41170))))

(declare-fun b!1080469 () Bool)

(declare-fun res!720115 () Bool)

(assert (=> b!1080469 (=> (not res!720115) (not e!617655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080469 (= res!720115 (validKeyInArray!0 k0!904))))

(declare-fun b!1080470 () Bool)

(declare-fun e!617653 () Bool)

(assert (=> b!1080470 (= e!617653 tp_is_empty!26277)))

(declare-fun b!1080471 () Bool)

(assert (=> b!1080471 (= e!617656 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16712 0))(
  ( (tuple2!16713 (_1!8367 (_ BitVec 64)) (_2!8367 V!40163)) )
))
(declare-datatypes ((List!23293 0))(
  ( (Nil!23290) (Cons!23289 (h!24498 tuple2!16712) (t!32652 List!23293)) )
))
(declare-datatypes ((ListLongMap!14681 0))(
  ( (ListLongMap!14682 (toList!7356 List!23293)) )
))
(declare-fun lt!479024 () ListLongMap!14681)

(declare-fun minValue!831 () V!40163)

(declare-fun zeroValue!831 () V!40163)

(declare-fun getCurrentListMapNoExtraKeys!3904 (array!69505 array!69507 (_ BitVec 32) (_ BitVec 32) V!40163 V!40163 (_ BitVec 32) Int) ListLongMap!14681)

(assert (=> b!1080471 (= lt!479024 (getCurrentListMapNoExtraKeys!3904 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080471 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35532 0))(
  ( (Unit!35533) )
))
(declare-fun lt!479025 () Unit!35532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69505 (_ BitVec 64) (_ BitVec 32)) Unit!35532)

(assert (=> b!1080471 (= lt!479025 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41170 () Bool)

(assert (=> mapIsEmpty!41170 mapRes!41170))

(declare-fun b!1080472 () Bool)

(assert (=> b!1080472 (= e!617655 e!617656)))

(declare-fun res!720109 () Bool)

(assert (=> b!1080472 (=> (not res!720109) (not e!617656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69505 (_ BitVec 32)) Bool)

(assert (=> b!1080472 (= res!720109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479026 mask!1414))))

(assert (=> b!1080472 (= lt!479026 (array!69506 (store (arr!33426 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33962 _keys!1070)))))

(declare-fun b!1080473 () Bool)

(assert (=> b!1080473 (= e!617652 tp_is_empty!26277)))

(declare-fun b!1080474 () Bool)

(assert (=> b!1080474 (= e!617654 (and e!617653 mapRes!41170))))

(declare-fun condMapEmpty!41170 () Bool)

(declare-fun mapDefault!41170 () ValueCell!12429)

(assert (=> b!1080474 (= condMapEmpty!41170 (= (arr!33427 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12429)) mapDefault!41170)))))

(declare-fun b!1080475 () Bool)

(declare-fun res!720112 () Bool)

(assert (=> b!1080475 (=> (not res!720112) (not e!617655))))

(assert (=> b!1080475 (= res!720112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080476 () Bool)

(declare-fun res!720116 () Bool)

(assert (=> b!1080476 (=> (not res!720116) (not e!617655))))

(assert (=> b!1080476 (= res!720116 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23289))))

(assert (= (and start!95622 res!720113) b!1080466))

(assert (= (and b!1080466 res!720110) b!1080475))

(assert (= (and b!1080475 res!720112) b!1080476))

(assert (= (and b!1080476 res!720116) b!1080468))

(assert (= (and b!1080468 res!720114) b!1080469))

(assert (= (and b!1080469 res!720115) b!1080467))

(assert (= (and b!1080467 res!720111) b!1080472))

(assert (= (and b!1080472 res!720109) b!1080465))

(assert (= (and b!1080465 res!720117) b!1080471))

(assert (= (and b!1080474 condMapEmpty!41170) mapIsEmpty!41170))

(assert (= (and b!1080474 (not condMapEmpty!41170)) mapNonEmpty!41170))

(get-info :version)

(assert (= (and mapNonEmpty!41170 ((_ is ValueCellFull!12429) mapValue!41170)) b!1080473))

(assert (= (and b!1080474 ((_ is ValueCellFull!12429) mapDefault!41170)) b!1080470))

(assert (= start!95622 b!1080474))

(declare-fun m!998417 () Bool)

(assert (=> b!1080471 m!998417))

(declare-fun m!998419 () Bool)

(assert (=> b!1080471 m!998419))

(declare-fun m!998421 () Bool)

(assert (=> b!1080471 m!998421))

(declare-fun m!998423 () Bool)

(assert (=> b!1080467 m!998423))

(declare-fun m!998425 () Bool)

(assert (=> start!95622 m!998425))

(declare-fun m!998427 () Bool)

(assert (=> start!95622 m!998427))

(declare-fun m!998429 () Bool)

(assert (=> start!95622 m!998429))

(declare-fun m!998431 () Bool)

(assert (=> b!1080472 m!998431))

(declare-fun m!998433 () Bool)

(assert (=> b!1080472 m!998433))

(declare-fun m!998435 () Bool)

(assert (=> b!1080476 m!998435))

(declare-fun m!998437 () Bool)

(assert (=> b!1080469 m!998437))

(declare-fun m!998439 () Bool)

(assert (=> b!1080475 m!998439))

(declare-fun m!998441 () Bool)

(assert (=> b!1080465 m!998441))

(declare-fun m!998443 () Bool)

(assert (=> mapNonEmpty!41170 m!998443))

(check-sat b_and!35253 (not b!1080475) (not b!1080469) (not b_next!22275) (not b!1080476) (not b!1080465) (not start!95622) (not b!1080472) (not b!1080471) (not mapNonEmpty!41170) tp_is_empty!26277)
(check-sat b_and!35253 (not b_next!22275))
