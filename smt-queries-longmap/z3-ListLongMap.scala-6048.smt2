; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78376 () Bool)

(assert start!78376)

(declare-fun b_free!16699 () Bool)

(declare-fun b_next!16699 () Bool)

(assert (=> start!78376 (= b_free!16699 (not b_next!16699))))

(declare-fun tp!58375 () Bool)

(declare-fun b_and!27285 () Bool)

(assert (=> start!78376 (= tp!58375 b_and!27285)))

(declare-fun mapNonEmpty!30403 () Bool)

(declare-fun mapRes!30403 () Bool)

(declare-fun tp!58374 () Bool)

(declare-fun e!512564 () Bool)

(assert (=> mapNonEmpty!30403 (= mapRes!30403 (and tp!58374 e!512564))))

(declare-datatypes ((V!30455 0))(
  ( (V!30456 (val!9609 Int)) )
))
(declare-datatypes ((ValueCell!9077 0))(
  ( (ValueCellFull!9077 (v!12117 V!30455)) (EmptyCell!9077) )
))
(declare-datatypes ((array!54281 0))(
  ( (array!54282 (arr!26090 (Array (_ BitVec 32) ValueCell!9077)) (size!26550 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54281)

(declare-fun mapRest!30403 () (Array (_ BitVec 32) ValueCell!9077))

(declare-fun mapKey!30403 () (_ BitVec 32))

(declare-fun mapValue!30403 () ValueCell!9077)

(assert (=> mapNonEmpty!30403 (= (arr!26090 _values!1152) (store mapRest!30403 mapKey!30403 mapValue!30403))))

(declare-fun b!913646 () Bool)

(declare-fun res!616060 () Bool)

(declare-fun e!512562 () Bool)

(assert (=> b!913646 (=> (not res!616060) (not e!512562))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30455)

(declare-datatypes ((array!54283 0))(
  ( (array!54284 (arr!26091 (Array (_ BitVec 32) (_ BitVec 64))) (size!26551 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54283)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30455)

(declare-datatypes ((tuple2!12474 0))(
  ( (tuple2!12475 (_1!6248 (_ BitVec 64)) (_2!6248 V!30455)) )
))
(declare-datatypes ((List!18293 0))(
  ( (Nil!18290) (Cons!18289 (h!19441 tuple2!12474) (t!25874 List!18293)) )
))
(declare-datatypes ((ListLongMap!11173 0))(
  ( (ListLongMap!11174 (toList!5602 List!18293)) )
))
(declare-fun contains!4657 (ListLongMap!11173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2863 (array!54283 array!54281 (_ BitVec 32) (_ BitVec 32) V!30455 V!30455 (_ BitVec 32) Int) ListLongMap!11173)

(assert (=> b!913646 (= res!616060 (contains!4657 (getCurrentListMap!2863 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!913647 () Bool)

(declare-fun res!616056 () Bool)

(assert (=> b!913647 (=> (not res!616056) (not e!512562))))

(declare-datatypes ((List!18294 0))(
  ( (Nil!18291) (Cons!18290 (h!19442 (_ BitVec 64)) (t!25875 List!18294)) )
))
(declare-fun arrayNoDuplicates!0 (array!54283 (_ BitVec 32) List!18294) Bool)

(assert (=> b!913647 (= res!616056 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18291))))

(declare-fun b!913648 () Bool)

(declare-fun e!512563 () Bool)

(declare-fun tp_is_empty!19117 () Bool)

(assert (=> b!913648 (= e!512563 tp_is_empty!19117)))

(declare-fun b!913650 () Bool)

(declare-fun res!616058 () Bool)

(assert (=> b!913650 (=> (not res!616058) (not e!512562))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!913650 (= res!616058 (and (= (select (arr!26091 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913651 () Bool)

(declare-fun e!512561 () Bool)

(assert (=> b!913651 (= e!512561 (and e!512563 mapRes!30403))))

(declare-fun condMapEmpty!30403 () Bool)

(declare-fun mapDefault!30403 () ValueCell!9077)

(assert (=> b!913651 (= condMapEmpty!30403 (= (arr!26090 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9077)) mapDefault!30403)))))

(declare-fun b!913652 () Bool)

(declare-fun res!616055 () Bool)

(assert (=> b!913652 (=> (not res!616055) (not e!512562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54283 (_ BitVec 32)) Bool)

(assert (=> b!913652 (= res!616055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!616057 () Bool)

(assert (=> start!78376 (=> (not res!616057) (not e!512562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78376 (= res!616057 (validMask!0 mask!1756))))

(assert (=> start!78376 e!512562))

(declare-fun array_inv!20466 (array!54281) Bool)

(assert (=> start!78376 (and (array_inv!20466 _values!1152) e!512561)))

(assert (=> start!78376 tp!58375))

(assert (=> start!78376 true))

(assert (=> start!78376 tp_is_empty!19117))

(declare-fun array_inv!20467 (array!54283) Bool)

(assert (=> start!78376 (array_inv!20467 _keys!1386)))

(declare-fun b!913649 () Bool)

(assert (=> b!913649 (= e!512562 (not true))))

(declare-fun arrayContainsKey!0 (array!54283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913649 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30872 0))(
  ( (Unit!30873) )
))
(declare-fun lt!411060 () Unit!30872)

(declare-fun lemmaKeyInListMapIsInArray!267 (array!54283 array!54281 (_ BitVec 32) (_ BitVec 32) V!30455 V!30455 (_ BitVec 64) Int) Unit!30872)

(assert (=> b!913649 (= lt!411060 (lemmaKeyInListMapIsInArray!267 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!913653 () Bool)

(assert (=> b!913653 (= e!512564 tp_is_empty!19117)))

(declare-fun b!913654 () Bool)

(declare-fun res!616059 () Bool)

(assert (=> b!913654 (=> (not res!616059) (not e!512562))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913654 (= res!616059 (inRange!0 i!717 mask!1756))))

(declare-fun b!913655 () Bool)

(declare-fun res!616061 () Bool)

(assert (=> b!913655 (=> (not res!616061) (not e!512562))))

(assert (=> b!913655 (= res!616061 (and (= (size!26550 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26551 _keys!1386) (size!26550 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30403 () Bool)

(assert (=> mapIsEmpty!30403 mapRes!30403))

(assert (= (and start!78376 res!616057) b!913655))

(assert (= (and b!913655 res!616061) b!913652))

(assert (= (and b!913652 res!616055) b!913647))

(assert (= (and b!913647 res!616056) b!913646))

(assert (= (and b!913646 res!616060) b!913654))

(assert (= (and b!913654 res!616059) b!913650))

(assert (= (and b!913650 res!616058) b!913649))

(assert (= (and b!913651 condMapEmpty!30403) mapIsEmpty!30403))

(assert (= (and b!913651 (not condMapEmpty!30403)) mapNonEmpty!30403))

(get-info :version)

(assert (= (and mapNonEmpty!30403 ((_ is ValueCellFull!9077) mapValue!30403)) b!913653))

(assert (= (and b!913651 ((_ is ValueCellFull!9077) mapDefault!30403)) b!913648))

(assert (= start!78376 b!913651))

(declare-fun m!848481 () Bool)

(assert (=> b!913649 m!848481))

(declare-fun m!848483 () Bool)

(assert (=> b!913649 m!848483))

(declare-fun m!848485 () Bool)

(assert (=> start!78376 m!848485))

(declare-fun m!848487 () Bool)

(assert (=> start!78376 m!848487))

(declare-fun m!848489 () Bool)

(assert (=> start!78376 m!848489))

(declare-fun m!848491 () Bool)

(assert (=> b!913650 m!848491))

(declare-fun m!848493 () Bool)

(assert (=> mapNonEmpty!30403 m!848493))

(declare-fun m!848495 () Bool)

(assert (=> b!913646 m!848495))

(assert (=> b!913646 m!848495))

(declare-fun m!848497 () Bool)

(assert (=> b!913646 m!848497))

(declare-fun m!848499 () Bool)

(assert (=> b!913647 m!848499))

(declare-fun m!848501 () Bool)

(assert (=> b!913654 m!848501))

(declare-fun m!848503 () Bool)

(assert (=> b!913652 m!848503))

(check-sat b_and!27285 (not b!913652) tp_is_empty!19117 (not b!913654) (not b_next!16699) (not b!913646) (not mapNonEmpty!30403) (not b!913647) (not b!913649) (not start!78376))
(check-sat b_and!27285 (not b_next!16699))
