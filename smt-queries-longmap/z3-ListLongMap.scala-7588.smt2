; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95850 () Bool)

(assert start!95850)

(declare-fun b_free!22503 () Bool)

(declare-fun b_next!22503 () Bool)

(assert (=> start!95850 (= b_free!22503 (not b_next!22503))))

(declare-fun tp!79357 () Bool)

(declare-fun b_and!35681 () Bool)

(assert (=> start!95850 (= tp!79357 b_and!35681)))

(declare-fun mapNonEmpty!41512 () Bool)

(declare-fun mapRes!41512 () Bool)

(declare-fun tp!79358 () Bool)

(declare-fun e!619727 () Bool)

(assert (=> mapNonEmpty!41512 (= mapRes!41512 (and tp!79358 e!619727))))

(declare-datatypes ((V!40467 0))(
  ( (V!40468 (val!13309 Int)) )
))
(declare-datatypes ((ValueCell!12543 0))(
  ( (ValueCellFull!12543 (v!15930 V!40467)) (EmptyCell!12543) )
))
(declare-datatypes ((array!69947 0))(
  ( (array!69948 (arr!33647 (Array (_ BitVec 32) ValueCell!12543)) (size!34183 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69947)

(declare-fun mapRest!41512 () (Array (_ BitVec 32) ValueCell!12543))

(declare-fun mapKey!41512 () (_ BitVec 32))

(declare-fun mapValue!41512 () ValueCell!12543)

(assert (=> mapNonEmpty!41512 (= (arr!33647 _values!874) (store mapRest!41512 mapKey!41512 mapValue!41512))))

(declare-fun mapIsEmpty!41512 () Bool)

(assert (=> mapIsEmpty!41512 mapRes!41512))

(declare-fun b!1084801 () Bool)

(declare-fun res!723223 () Bool)

(declare-fun e!619728 () Bool)

(assert (=> b!1084801 (=> (not res!723223) (not e!619728))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69949 0))(
  ( (array!69950 (arr!33648 (Array (_ BitVec 32) (_ BitVec 64))) (size!34184 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69949)

(assert (=> b!1084801 (= res!723223 (and (= (size!34183 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34184 _keys!1070) (size!34183 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084802 () Bool)

(declare-fun res!723221 () Bool)

(assert (=> b!1084802 (=> (not res!723221) (not e!619728))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084802 (= res!723221 (validKeyInArray!0 k0!904))))

(declare-fun res!723219 () Bool)

(assert (=> start!95850 (=> (not res!723219) (not e!619728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95850 (= res!723219 (validMask!0 mask!1414))))

(assert (=> start!95850 e!619728))

(assert (=> start!95850 tp!79357))

(assert (=> start!95850 true))

(declare-fun tp_is_empty!26505 () Bool)

(assert (=> start!95850 tp_is_empty!26505))

(declare-fun array_inv!25966 (array!69949) Bool)

(assert (=> start!95850 (array_inv!25966 _keys!1070)))

(declare-fun e!619732 () Bool)

(declare-fun array_inv!25967 (array!69947) Bool)

(assert (=> start!95850 (and (array_inv!25967 _values!874) e!619732)))

(declare-fun b!1084803 () Bool)

(declare-fun e!619733 () Bool)

(declare-fun e!619729 () Bool)

(assert (=> b!1084803 (= e!619733 (not e!619729))))

(declare-fun res!723226 () Bool)

(assert (=> b!1084803 (=> res!723226 e!619729)))

(assert (=> b!1084803 (= res!723226 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40467)

(declare-datatypes ((tuple2!16870 0))(
  ( (tuple2!16871 (_1!8446 (_ BitVec 64)) (_2!8446 V!40467)) )
))
(declare-datatypes ((List!23459 0))(
  ( (Nil!23456) (Cons!23455 (h!24664 tuple2!16870) (t!33020 List!23459)) )
))
(declare-datatypes ((ListLongMap!14839 0))(
  ( (ListLongMap!14840 (toList!7435 List!23459)) )
))
(declare-fun lt!480957 () ListLongMap!14839)

(declare-fun zeroValue!831 () V!40467)

(declare-fun getCurrentListMap!4222 (array!69949 array!69947 (_ BitVec 32) (_ BitVec 32) V!40467 V!40467 (_ BitVec 32) Int) ListLongMap!14839)

(assert (=> b!1084803 (= lt!480957 (getCurrentListMap!4222 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480961 () array!69947)

(declare-fun lt!480955 () array!69949)

(declare-fun lt!480952 () ListLongMap!14839)

(assert (=> b!1084803 (= lt!480952 (getCurrentListMap!4222 lt!480955 lt!480961 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480963 () ListLongMap!14839)

(declare-fun lt!480951 () ListLongMap!14839)

(assert (=> b!1084803 (and (= lt!480963 lt!480951) (= lt!480951 lt!480963))))

(declare-fun lt!480954 () ListLongMap!14839)

(declare-fun -!761 (ListLongMap!14839 (_ BitVec 64)) ListLongMap!14839)

(assert (=> b!1084803 (= lt!480951 (-!761 lt!480954 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35688 0))(
  ( (Unit!35689) )
))
(declare-fun lt!480964 () Unit!35688)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!41 (array!69949 array!69947 (_ BitVec 32) (_ BitVec 32) V!40467 V!40467 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35688)

(assert (=> b!1084803 (= lt!480964 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!41 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3982 (array!69949 array!69947 (_ BitVec 32) (_ BitVec 32) V!40467 V!40467 (_ BitVec 32) Int) ListLongMap!14839)

(assert (=> b!1084803 (= lt!480963 (getCurrentListMapNoExtraKeys!3982 lt!480955 lt!480961 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2119 (Int (_ BitVec 64)) V!40467)

(assert (=> b!1084803 (= lt!480961 (array!69948 (store (arr!33647 _values!874) i!650 (ValueCellFull!12543 (dynLambda!2119 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34183 _values!874)))))

(assert (=> b!1084803 (= lt!480954 (getCurrentListMapNoExtraKeys!3982 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084803 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480960 () Unit!35688)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69949 (_ BitVec 64) (_ BitVec 32)) Unit!35688)

(assert (=> b!1084803 (= lt!480960 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084804 () Bool)

(assert (=> b!1084804 (= e!619729 true)))

(declare-fun lt!480962 () ListLongMap!14839)

(declare-fun lt!480959 () ListLongMap!14839)

(assert (=> b!1084804 (= (-!761 lt!480962 k0!904) lt!480959)))

(declare-fun lt!480953 () Unit!35688)

(declare-fun addRemoveCommutativeForDiffKeys!1 (ListLongMap!14839 (_ BitVec 64) V!40467 (_ BitVec 64)) Unit!35688)

(assert (=> b!1084804 (= lt!480953 (addRemoveCommutativeForDiffKeys!1 lt!480954 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!480958 () tuple2!16870)

(declare-fun +!3245 (ListLongMap!14839 tuple2!16870) ListLongMap!14839)

(assert (=> b!1084804 (= lt!480952 (+!3245 lt!480959 lt!480958))))

(declare-fun lt!480956 () tuple2!16870)

(assert (=> b!1084804 (= lt!480959 (+!3245 lt!480951 lt!480956))))

(assert (=> b!1084804 (= lt!480957 (+!3245 lt!480962 lt!480958))))

(assert (=> b!1084804 (= lt!480962 (+!3245 lt!480954 lt!480956))))

(assert (=> b!1084804 (= lt!480952 (+!3245 (+!3245 lt!480963 lt!480956) lt!480958))))

(assert (=> b!1084804 (= lt!480958 (tuple2!16871 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1084804 (= lt!480956 (tuple2!16871 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1084805 () Bool)

(declare-fun res!723225 () Bool)

(assert (=> b!1084805 (=> (not res!723225) (not e!619728))))

(assert (=> b!1084805 (= res!723225 (= (select (arr!33648 _keys!1070) i!650) k0!904))))

(declare-fun b!1084806 () Bool)

(declare-fun e!619730 () Bool)

(assert (=> b!1084806 (= e!619730 tp_is_empty!26505)))

(declare-fun b!1084807 () Bool)

(assert (=> b!1084807 (= e!619728 e!619733)))

(declare-fun res!723227 () Bool)

(assert (=> b!1084807 (=> (not res!723227) (not e!619733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69949 (_ BitVec 32)) Bool)

(assert (=> b!1084807 (= res!723227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480955 mask!1414))))

(assert (=> b!1084807 (= lt!480955 (array!69950 (store (arr!33648 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34184 _keys!1070)))))

(declare-fun b!1084808 () Bool)

(declare-fun res!723220 () Bool)

(assert (=> b!1084808 (=> (not res!723220) (not e!619728))))

(assert (=> b!1084808 (= res!723220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084809 () Bool)

(declare-fun res!723222 () Bool)

(assert (=> b!1084809 (=> (not res!723222) (not e!619728))))

(declare-datatypes ((List!23460 0))(
  ( (Nil!23457) (Cons!23456 (h!24665 (_ BitVec 64)) (t!33021 List!23460)) )
))
(declare-fun arrayNoDuplicates!0 (array!69949 (_ BitVec 32) List!23460) Bool)

(assert (=> b!1084809 (= res!723222 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23457))))

(declare-fun b!1084810 () Bool)

(declare-fun res!723224 () Bool)

(assert (=> b!1084810 (=> (not res!723224) (not e!619733))))

(assert (=> b!1084810 (= res!723224 (arrayNoDuplicates!0 lt!480955 #b00000000000000000000000000000000 Nil!23457))))

(declare-fun b!1084811 () Bool)

(assert (=> b!1084811 (= e!619732 (and e!619730 mapRes!41512))))

(declare-fun condMapEmpty!41512 () Bool)

(declare-fun mapDefault!41512 () ValueCell!12543)

(assert (=> b!1084811 (= condMapEmpty!41512 (= (arr!33647 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12543)) mapDefault!41512)))))

(declare-fun b!1084812 () Bool)

(assert (=> b!1084812 (= e!619727 tp_is_empty!26505)))

(declare-fun b!1084813 () Bool)

(declare-fun res!723228 () Bool)

(assert (=> b!1084813 (=> (not res!723228) (not e!619728))))

(assert (=> b!1084813 (= res!723228 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34184 _keys!1070))))))

(assert (= (and start!95850 res!723219) b!1084801))

(assert (= (and b!1084801 res!723223) b!1084808))

(assert (= (and b!1084808 res!723220) b!1084809))

(assert (= (and b!1084809 res!723222) b!1084813))

(assert (= (and b!1084813 res!723228) b!1084802))

(assert (= (and b!1084802 res!723221) b!1084805))

(assert (= (and b!1084805 res!723225) b!1084807))

(assert (= (and b!1084807 res!723227) b!1084810))

(assert (= (and b!1084810 res!723224) b!1084803))

(assert (= (and b!1084803 (not res!723226)) b!1084804))

(assert (= (and b!1084811 condMapEmpty!41512) mapIsEmpty!41512))

(assert (= (and b!1084811 (not condMapEmpty!41512)) mapNonEmpty!41512))

(get-info :version)

(assert (= (and mapNonEmpty!41512 ((_ is ValueCellFull!12543) mapValue!41512)) b!1084812))

(assert (= (and b!1084811 ((_ is ValueCellFull!12543) mapDefault!41512)) b!1084806))

(assert (= start!95850 b!1084811))

(declare-fun b_lambda!17173 () Bool)

(assert (=> (not b_lambda!17173) (not b!1084803)))

(declare-fun t!33019 () Bool)

(declare-fun tb!7381 () Bool)

(assert (=> (and start!95850 (= defaultEntry!882 defaultEntry!882) t!33019) tb!7381))

(declare-fun result!15281 () Bool)

(assert (=> tb!7381 (= result!15281 tp_is_empty!26505)))

(assert (=> b!1084803 t!33019))

(declare-fun b_and!35683 () Bool)

(assert (= b_and!35681 (and (=> t!33019 result!15281) b_and!35683)))

(declare-fun m!1002563 () Bool)

(assert (=> mapNonEmpty!41512 m!1002563))

(declare-fun m!1002565 () Bool)

(assert (=> b!1084802 m!1002565))

(declare-fun m!1002567 () Bool)

(assert (=> start!95850 m!1002567))

(declare-fun m!1002569 () Bool)

(assert (=> start!95850 m!1002569))

(declare-fun m!1002571 () Bool)

(assert (=> start!95850 m!1002571))

(declare-fun m!1002573 () Bool)

(assert (=> b!1084805 m!1002573))

(declare-fun m!1002575 () Bool)

(assert (=> b!1084809 m!1002575))

(declare-fun m!1002577 () Bool)

(assert (=> b!1084807 m!1002577))

(declare-fun m!1002579 () Bool)

(assert (=> b!1084807 m!1002579))

(declare-fun m!1002581 () Bool)

(assert (=> b!1084810 m!1002581))

(declare-fun m!1002583 () Bool)

(assert (=> b!1084808 m!1002583))

(declare-fun m!1002585 () Bool)

(assert (=> b!1084804 m!1002585))

(assert (=> b!1084804 m!1002585))

(declare-fun m!1002587 () Bool)

(assert (=> b!1084804 m!1002587))

(declare-fun m!1002589 () Bool)

(assert (=> b!1084804 m!1002589))

(declare-fun m!1002591 () Bool)

(assert (=> b!1084804 m!1002591))

(declare-fun m!1002593 () Bool)

(assert (=> b!1084804 m!1002593))

(declare-fun m!1002595 () Bool)

(assert (=> b!1084804 m!1002595))

(declare-fun m!1002597 () Bool)

(assert (=> b!1084804 m!1002597))

(declare-fun m!1002599 () Bool)

(assert (=> b!1084804 m!1002599))

(declare-fun m!1002601 () Bool)

(assert (=> b!1084803 m!1002601))

(declare-fun m!1002603 () Bool)

(assert (=> b!1084803 m!1002603))

(declare-fun m!1002605 () Bool)

(assert (=> b!1084803 m!1002605))

(declare-fun m!1002607 () Bool)

(assert (=> b!1084803 m!1002607))

(declare-fun m!1002609 () Bool)

(assert (=> b!1084803 m!1002609))

(declare-fun m!1002611 () Bool)

(assert (=> b!1084803 m!1002611))

(declare-fun m!1002613 () Bool)

(assert (=> b!1084803 m!1002613))

(declare-fun m!1002615 () Bool)

(assert (=> b!1084803 m!1002615))

(declare-fun m!1002617 () Bool)

(assert (=> b!1084803 m!1002617))

(declare-fun m!1002619 () Bool)

(assert (=> b!1084803 m!1002619))

(check-sat (not mapNonEmpty!41512) (not start!95850) (not b!1084802) (not b!1084808) (not b!1084810) (not b!1084804) (not b!1084803) (not b!1084809) b_and!35683 (not b_next!22503) tp_is_empty!26505 (not b_lambda!17173) (not b!1084807))
(check-sat b_and!35683 (not b_next!22503))
