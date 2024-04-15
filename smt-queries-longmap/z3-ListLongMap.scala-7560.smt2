; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95674 () Bool)

(assert start!95674)

(declare-fun b_free!22333 () Bool)

(declare-fun b_next!22333 () Bool)

(assert (=> start!95674 (= b_free!22333 (not b_next!22333))))

(declare-fun tp!78847 () Bool)

(declare-fun b_and!35315 () Bool)

(assert (=> start!95674 (= tp!78847 b_and!35315)))

(declare-fun res!720831 () Bool)

(declare-fun e!618081 () Bool)

(assert (=> start!95674 (=> (not res!720831) (not e!618081))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95674 (= res!720831 (validMask!0 mask!1414))))

(assert (=> start!95674 e!618081))

(assert (=> start!95674 tp!78847))

(assert (=> start!95674 true))

(declare-fun tp_is_empty!26335 () Bool)

(assert (=> start!95674 tp_is_empty!26335))

(declare-datatypes ((array!69546 0))(
  ( (array!69547 (arr!33447 (Array (_ BitVec 32) (_ BitVec 64))) (size!33985 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69546)

(declare-fun array_inv!25856 (array!69546) Bool)

(assert (=> start!95674 (array_inv!25856 _keys!1070)))

(declare-datatypes ((V!40241 0))(
  ( (V!40242 (val!13224 Int)) )
))
(declare-datatypes ((ValueCell!12458 0))(
  ( (ValueCellFull!12458 (v!15844 V!40241)) (EmptyCell!12458) )
))
(declare-datatypes ((array!69548 0))(
  ( (array!69549 (arr!33448 (Array (_ BitVec 32) ValueCell!12458)) (size!33986 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69548)

(declare-fun e!618083 () Bool)

(declare-fun array_inv!25857 (array!69548) Bool)

(assert (=> start!95674 (and (array_inv!25857 _values!874) e!618083)))

(declare-fun b!1081386 () Bool)

(declare-fun e!618085 () Bool)

(assert (=> b!1081386 (= e!618085 tp_is_empty!26335)))

(declare-fun b!1081387 () Bool)

(declare-fun res!720827 () Bool)

(declare-fun e!618082 () Bool)

(assert (=> b!1081387 (=> (not res!720827) (not e!618082))))

(declare-fun lt!479132 () array!69546)

(declare-datatypes ((List!23379 0))(
  ( (Nil!23376) (Cons!23375 (h!24584 (_ BitVec 64)) (t!32761 List!23379)) )
))
(declare-fun arrayNoDuplicates!0 (array!69546 (_ BitVec 32) List!23379) Bool)

(assert (=> b!1081387 (= res!720827 (arrayNoDuplicates!0 lt!479132 #b00000000000000000000000000000000 Nil!23376))))

(declare-fun b!1081388 () Bool)

(declare-fun res!720830 () Bool)

(assert (=> b!1081388 (=> (not res!720830) (not e!618081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69546 (_ BitVec 32)) Bool)

(assert (=> b!1081388 (= res!720830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41257 () Bool)

(declare-fun mapRes!41257 () Bool)

(assert (=> mapIsEmpty!41257 mapRes!41257))

(declare-fun b!1081389 () Bool)

(declare-fun res!720829 () Bool)

(assert (=> b!1081389 (=> (not res!720829) (not e!618081))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081389 (= res!720829 (= (select (arr!33447 _keys!1070) i!650) k0!904))))

(declare-fun b!1081390 () Bool)

(declare-fun res!720823 () Bool)

(assert (=> b!1081390 (=> (not res!720823) (not e!618081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081390 (= res!720823 (validKeyInArray!0 k0!904))))

(declare-fun b!1081391 () Bool)

(assert (=> b!1081391 (= e!618081 e!618082)))

(declare-fun res!720824 () Bool)

(assert (=> b!1081391 (=> (not res!720824) (not e!618082))))

(assert (=> b!1081391 (= res!720824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479132 mask!1414))))

(assert (=> b!1081391 (= lt!479132 (array!69547 (store (arr!33447 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33985 _keys!1070)))))

(declare-fun b!1081392 () Bool)

(declare-fun res!720825 () Bool)

(assert (=> b!1081392 (=> (not res!720825) (not e!618081))))

(assert (=> b!1081392 (= res!720825 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23376))))

(declare-fun mapNonEmpty!41257 () Bool)

(declare-fun tp!78848 () Bool)

(declare-fun e!618086 () Bool)

(assert (=> mapNonEmpty!41257 (= mapRes!41257 (and tp!78848 e!618086))))

(declare-fun mapValue!41257 () ValueCell!12458)

(declare-fun mapKey!41257 () (_ BitVec 32))

(declare-fun mapRest!41257 () (Array (_ BitVec 32) ValueCell!12458))

(assert (=> mapNonEmpty!41257 (= (arr!33448 _values!874) (store mapRest!41257 mapKey!41257 mapValue!41257))))

(declare-fun b!1081393 () Bool)

(declare-fun res!720826 () Bool)

(assert (=> b!1081393 (=> (not res!720826) (not e!618081))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1081393 (= res!720826 (and (= (size!33986 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33985 _keys!1070) (size!33986 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081394 () Bool)

(assert (=> b!1081394 (= e!618086 tp_is_empty!26335)))

(declare-fun b!1081395 () Bool)

(assert (=> b!1081395 (= e!618083 (and e!618085 mapRes!41257))))

(declare-fun condMapEmpty!41257 () Bool)

(declare-fun mapDefault!41257 () ValueCell!12458)

(assert (=> b!1081395 (= condMapEmpty!41257 (= (arr!33448 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12458)) mapDefault!41257)))))

(declare-fun b!1081396 () Bool)

(declare-fun res!720828 () Bool)

(assert (=> b!1081396 (=> (not res!720828) (not e!618081))))

(assert (=> b!1081396 (= res!720828 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33985 _keys!1070))))))

(declare-fun b!1081397 () Bool)

(assert (=> b!1081397 (= e!618082 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40241)

(declare-datatypes ((tuple2!16816 0))(
  ( (tuple2!16817 (_1!8419 (_ BitVec 64)) (_2!8419 V!40241)) )
))
(declare-datatypes ((List!23380 0))(
  ( (Nil!23377) (Cons!23376 (h!24585 tuple2!16816) (t!32762 List!23380)) )
))
(declare-datatypes ((ListLongMap!14785 0))(
  ( (ListLongMap!14786 (toList!7408 List!23380)) )
))
(declare-fun lt!479135 () ListLongMap!14785)

(declare-fun zeroValue!831 () V!40241)

(declare-fun getCurrentListMapNoExtraKeys!3971 (array!69546 array!69548 (_ BitVec 32) (_ BitVec 32) V!40241 V!40241 (_ BitVec 32) Int) ListLongMap!14785)

(declare-fun dynLambda!2042 (Int (_ BitVec 64)) V!40241)

(assert (=> b!1081397 (= lt!479135 (getCurrentListMapNoExtraKeys!3971 lt!479132 (array!69549 (store (arr!33448 _values!874) i!650 (ValueCellFull!12458 (dynLambda!2042 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!33986 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479133 () ListLongMap!14785)

(assert (=> b!1081397 (= lt!479133 (getCurrentListMapNoExtraKeys!3971 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081397 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35409 0))(
  ( (Unit!35410) )
))
(declare-fun lt!479134 () Unit!35409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69546 (_ BitVec 64) (_ BitVec 32)) Unit!35409)

(assert (=> b!1081397 (= lt!479134 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!95674 res!720831) b!1081393))

(assert (= (and b!1081393 res!720826) b!1081388))

(assert (= (and b!1081388 res!720830) b!1081392))

(assert (= (and b!1081392 res!720825) b!1081396))

(assert (= (and b!1081396 res!720828) b!1081390))

(assert (= (and b!1081390 res!720823) b!1081389))

(assert (= (and b!1081389 res!720829) b!1081391))

(assert (= (and b!1081391 res!720824) b!1081387))

(assert (= (and b!1081387 res!720827) b!1081397))

(assert (= (and b!1081395 condMapEmpty!41257) mapIsEmpty!41257))

(assert (= (and b!1081395 (not condMapEmpty!41257)) mapNonEmpty!41257))

(get-info :version)

(assert (= (and mapNonEmpty!41257 ((_ is ValueCellFull!12458) mapValue!41257)) b!1081394))

(assert (= (and b!1081395 ((_ is ValueCellFull!12458) mapDefault!41257)) b!1081386))

(assert (= start!95674 b!1081395))

(declare-fun b_lambda!16981 () Bool)

(assert (=> (not b_lambda!16981) (not b!1081397)))

(declare-fun t!32760 () Bool)

(declare-fun tb!7203 () Bool)

(assert (=> (and start!95674 (= defaultEntry!882 defaultEntry!882) t!32760) tb!7203))

(declare-fun result!14933 () Bool)

(assert (=> tb!7203 (= result!14933 tp_is_empty!26335)))

(assert (=> b!1081397 t!32760))

(declare-fun b_and!35317 () Bool)

(assert (= b_and!35315 (and (=> t!32760 result!14933) b_and!35317)))

(declare-fun m!998693 () Bool)

(assert (=> b!1081397 m!998693))

(declare-fun m!998695 () Bool)

(assert (=> b!1081397 m!998695))

(declare-fun m!998697 () Bool)

(assert (=> b!1081397 m!998697))

(declare-fun m!998699 () Bool)

(assert (=> b!1081397 m!998699))

(declare-fun m!998701 () Bool)

(assert (=> b!1081397 m!998701))

(declare-fun m!998703 () Bool)

(assert (=> b!1081397 m!998703))

(declare-fun m!998705 () Bool)

(assert (=> b!1081388 m!998705))

(declare-fun m!998707 () Bool)

(assert (=> b!1081391 m!998707))

(declare-fun m!998709 () Bool)

(assert (=> b!1081391 m!998709))

(declare-fun m!998711 () Bool)

(assert (=> b!1081387 m!998711))

(declare-fun m!998713 () Bool)

(assert (=> start!95674 m!998713))

(declare-fun m!998715 () Bool)

(assert (=> start!95674 m!998715))

(declare-fun m!998717 () Bool)

(assert (=> start!95674 m!998717))

(declare-fun m!998719 () Bool)

(assert (=> mapNonEmpty!41257 m!998719))

(declare-fun m!998721 () Bool)

(assert (=> b!1081390 m!998721))

(declare-fun m!998723 () Bool)

(assert (=> b!1081392 m!998723))

(declare-fun m!998725 () Bool)

(assert (=> b!1081389 m!998725))

(check-sat (not b!1081390) (not b_next!22333) tp_is_empty!26335 b_and!35317 (not start!95674) (not b!1081392) (not b!1081391) (not b_lambda!16981) (not mapNonEmpty!41257) (not b!1081387) (not b!1081388) (not b!1081397))
(check-sat b_and!35317 (not b_next!22333))
