; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95596 () Bool)

(assert start!95596)

(declare-fun b_free!22255 () Bool)

(declare-fun b_next!22255 () Bool)

(assert (=> start!95596 (= b_free!22255 (not b_next!22255))))

(declare-fun tp!78613 () Bool)

(declare-fun b_and!35207 () Bool)

(assert (=> start!95596 (= tp!78613 b_and!35207)))

(declare-fun b!1079952 () Bool)

(declare-fun res!719774 () Bool)

(declare-fun e!617384 () Bool)

(assert (=> b!1079952 (=> (not res!719774) (not e!617384))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69396 0))(
  ( (array!69397 (arr!33372 (Array (_ BitVec 32) (_ BitVec 64))) (size!33910 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69396)

(assert (=> b!1079952 (= res!719774 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33910 _keys!1070))))))

(declare-fun b!1079953 () Bool)

(declare-fun e!617381 () Bool)

(declare-fun e!617380 () Bool)

(declare-fun mapRes!41140 () Bool)

(assert (=> b!1079953 (= e!617381 (and e!617380 mapRes!41140))))

(declare-fun condMapEmpty!41140 () Bool)

(declare-datatypes ((V!40137 0))(
  ( (V!40138 (val!13185 Int)) )
))
(declare-datatypes ((ValueCell!12419 0))(
  ( (ValueCellFull!12419 (v!15805 V!40137)) (EmptyCell!12419) )
))
(declare-datatypes ((array!69398 0))(
  ( (array!69399 (arr!33373 (Array (_ BitVec 32) ValueCell!12419)) (size!33911 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69398)

(declare-fun mapDefault!41140 () ValueCell!12419)

(assert (=> b!1079953 (= condMapEmpty!41140 (= (arr!33373 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12419)) mapDefault!41140)))))

(declare-fun mapIsEmpty!41140 () Bool)

(assert (=> mapIsEmpty!41140 mapRes!41140))

(declare-fun b!1079955 () Bool)

(declare-fun e!617379 () Bool)

(declare-fun tp_is_empty!26257 () Bool)

(assert (=> b!1079955 (= e!617379 tp_is_empty!26257)))

(declare-fun b!1079956 () Bool)

(declare-fun e!617383 () Bool)

(assert (=> b!1079956 (= e!617383 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40137)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16768 0))(
  ( (tuple2!16769 (_1!8395 (_ BitVec 64)) (_2!8395 V!40137)) )
))
(declare-datatypes ((List!23328 0))(
  ( (Nil!23325) (Cons!23324 (h!24533 tuple2!16768) (t!32678 List!23328)) )
))
(declare-datatypes ((ListLongMap!14737 0))(
  ( (ListLongMap!14738 (toList!7384 List!23328)) )
))
(declare-fun lt!478735 () ListLongMap!14737)

(declare-fun zeroValue!831 () V!40137)

(declare-fun getCurrentListMapNoExtraKeys!3947 (array!69396 array!69398 (_ BitVec 32) (_ BitVec 32) V!40137 V!40137 (_ BitVec 32) Int) ListLongMap!14737)

(assert (=> b!1079956 (= lt!478735 (getCurrentListMapNoExtraKeys!3947 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079956 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35361 0))(
  ( (Unit!35362) )
))
(declare-fun lt!478736 () Unit!35361)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69396 (_ BitVec 64) (_ BitVec 32)) Unit!35361)

(assert (=> b!1079956 (= lt!478736 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1079957 () Bool)

(declare-fun res!719777 () Bool)

(assert (=> b!1079957 (=> (not res!719777) (not e!617384))))

(declare-datatypes ((List!23329 0))(
  ( (Nil!23326) (Cons!23325 (h!24534 (_ BitVec 64)) (t!32679 List!23329)) )
))
(declare-fun arrayNoDuplicates!0 (array!69396 (_ BitVec 32) List!23329) Bool)

(assert (=> b!1079957 (= res!719777 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23326))))

(declare-fun mapNonEmpty!41140 () Bool)

(declare-fun tp!78614 () Bool)

(assert (=> mapNonEmpty!41140 (= mapRes!41140 (and tp!78614 e!617379))))

(declare-fun mapKey!41140 () (_ BitVec 32))

(declare-fun mapValue!41140 () ValueCell!12419)

(declare-fun mapRest!41140 () (Array (_ BitVec 32) ValueCell!12419))

(assert (=> mapNonEmpty!41140 (= (arr!33373 _values!874) (store mapRest!41140 mapKey!41140 mapValue!41140))))

(declare-fun b!1079958 () Bool)

(assert (=> b!1079958 (= e!617380 tp_is_empty!26257)))

(declare-fun b!1079959 () Bool)

(declare-fun res!719773 () Bool)

(assert (=> b!1079959 (=> (not res!719773) (not e!617384))))

(assert (=> b!1079959 (= res!719773 (and (= (size!33911 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33910 _keys!1070) (size!33911 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079960 () Bool)

(declare-fun res!719771 () Bool)

(assert (=> b!1079960 (=> (not res!719771) (not e!617384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079960 (= res!719771 (validKeyInArray!0 k0!904))))

(declare-fun b!1079961 () Bool)

(declare-fun res!719776 () Bool)

(assert (=> b!1079961 (=> (not res!719776) (not e!617384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69396 (_ BitVec 32)) Bool)

(assert (=> b!1079961 (= res!719776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!719770 () Bool)

(assert (=> start!95596 (=> (not res!719770) (not e!617384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95596 (= res!719770 (validMask!0 mask!1414))))

(assert (=> start!95596 e!617384))

(assert (=> start!95596 tp!78613))

(assert (=> start!95596 true))

(assert (=> start!95596 tp_is_empty!26257))

(declare-fun array_inv!25802 (array!69396) Bool)

(assert (=> start!95596 (array_inv!25802 _keys!1070)))

(declare-fun array_inv!25803 (array!69398) Bool)

(assert (=> start!95596 (and (array_inv!25803 _values!874) e!617381)))

(declare-fun b!1079954 () Bool)

(assert (=> b!1079954 (= e!617384 e!617383)))

(declare-fun res!719772 () Bool)

(assert (=> b!1079954 (=> (not res!719772) (not e!617383))))

(declare-fun lt!478734 () array!69396)

(assert (=> b!1079954 (= res!719772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478734 mask!1414))))

(assert (=> b!1079954 (= lt!478734 (array!69397 (store (arr!33372 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33910 _keys!1070)))))

(declare-fun b!1079962 () Bool)

(declare-fun res!719778 () Bool)

(assert (=> b!1079962 (=> (not res!719778) (not e!617384))))

(assert (=> b!1079962 (= res!719778 (= (select (arr!33372 _keys!1070) i!650) k0!904))))

(declare-fun b!1079963 () Bool)

(declare-fun res!719775 () Bool)

(assert (=> b!1079963 (=> (not res!719775) (not e!617383))))

(assert (=> b!1079963 (= res!719775 (arrayNoDuplicates!0 lt!478734 #b00000000000000000000000000000000 Nil!23326))))

(assert (= (and start!95596 res!719770) b!1079959))

(assert (= (and b!1079959 res!719773) b!1079961))

(assert (= (and b!1079961 res!719776) b!1079957))

(assert (= (and b!1079957 res!719777) b!1079952))

(assert (= (and b!1079952 res!719774) b!1079960))

(assert (= (and b!1079960 res!719771) b!1079962))

(assert (= (and b!1079962 res!719778) b!1079954))

(assert (= (and b!1079954 res!719772) b!1079963))

(assert (= (and b!1079963 res!719775) b!1079956))

(assert (= (and b!1079953 condMapEmpty!41140) mapIsEmpty!41140))

(assert (= (and b!1079953 (not condMapEmpty!41140)) mapNonEmpty!41140))

(get-info :version)

(assert (= (and mapNonEmpty!41140 ((_ is ValueCellFull!12419) mapValue!41140)) b!1079955))

(assert (= (and b!1079953 ((_ is ValueCellFull!12419) mapDefault!41140)) b!1079958))

(assert (= start!95596 b!1079953))

(declare-fun m!997511 () Bool)

(assert (=> b!1079962 m!997511))

(declare-fun m!997513 () Bool)

(assert (=> b!1079957 m!997513))

(declare-fun m!997515 () Bool)

(assert (=> b!1079956 m!997515))

(declare-fun m!997517 () Bool)

(assert (=> b!1079956 m!997517))

(declare-fun m!997519 () Bool)

(assert (=> b!1079956 m!997519))

(declare-fun m!997521 () Bool)

(assert (=> mapNonEmpty!41140 m!997521))

(declare-fun m!997523 () Bool)

(assert (=> b!1079963 m!997523))

(declare-fun m!997525 () Bool)

(assert (=> b!1079960 m!997525))

(declare-fun m!997527 () Bool)

(assert (=> start!95596 m!997527))

(declare-fun m!997529 () Bool)

(assert (=> start!95596 m!997529))

(declare-fun m!997531 () Bool)

(assert (=> start!95596 m!997531))

(declare-fun m!997533 () Bool)

(assert (=> b!1079954 m!997533))

(declare-fun m!997535 () Bool)

(assert (=> b!1079954 m!997535))

(declare-fun m!997537 () Bool)

(assert (=> b!1079961 m!997537))

(check-sat (not b_next!22255) (not b!1079960) (not b!1079963) (not b!1079954) (not b!1079956) (not start!95596) tp_is_empty!26257 (not b!1079961) (not mapNonEmpty!41140) b_and!35207 (not b!1079957))
(check-sat b_and!35207 (not b_next!22255))
