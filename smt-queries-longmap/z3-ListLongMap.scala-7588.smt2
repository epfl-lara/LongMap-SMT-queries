; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95842 () Bool)

(assert start!95842)

(declare-fun b_free!22501 () Bool)

(declare-fun b_next!22501 () Bool)

(assert (=> start!95842 (= b_free!22501 (not b_next!22501))))

(declare-fun tp!79352 () Bool)

(declare-fun b_and!35651 () Bool)

(assert (=> start!95842 (= tp!79352 b_and!35651)))

(declare-fun b!1084607 () Bool)

(declare-fun e!619617 () Bool)

(declare-fun e!619618 () Bool)

(assert (=> b!1084607 (= e!619617 e!619618)))

(declare-fun res!723121 () Bool)

(assert (=> b!1084607 (=> (not res!723121) (not e!619618))))

(declare-datatypes ((array!69868 0))(
  ( (array!69869 (arr!33608 (Array (_ BitVec 32) (_ BitVec 64))) (size!34146 (_ BitVec 32))) )
))
(declare-fun lt!480712 () array!69868)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69868 (_ BitVec 32)) Bool)

(assert (=> b!1084607 (= res!723121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480712 mask!1414))))

(declare-fun _keys!1070 () array!69868)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084607 (= lt!480712 (array!69869 (store (arr!33608 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34146 _keys!1070)))))

(declare-fun b!1084608 () Bool)

(declare-fun res!723122 () Bool)

(assert (=> b!1084608 (=> (not res!723122) (not e!619617))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084608 (= res!723122 (validKeyInArray!0 k0!904))))

(declare-fun b!1084609 () Bool)

(declare-fun res!723125 () Bool)

(assert (=> b!1084609 (=> (not res!723125) (not e!619617))))

(assert (=> b!1084609 (= res!723125 (= (select (arr!33608 _keys!1070) i!650) k0!904))))

(declare-fun b!1084610 () Bool)

(declare-fun e!619616 () Bool)

(assert (=> b!1084610 (= e!619618 (not e!619616))))

(declare-fun res!723128 () Bool)

(assert (=> b!1084610 (=> res!723128 e!619616)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1084610 (= res!723128 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40465 0))(
  ( (V!40466 (val!13308 Int)) )
))
(declare-datatypes ((tuple2!16926 0))(
  ( (tuple2!16927 (_1!8474 (_ BitVec 64)) (_2!8474 V!40465)) )
))
(declare-datatypes ((List!23498 0))(
  ( (Nil!23495) (Cons!23494 (h!24703 tuple2!16926) (t!33048 List!23498)) )
))
(declare-datatypes ((ListLongMap!14895 0))(
  ( (ListLongMap!14896 (toList!7463 List!23498)) )
))
(declare-fun lt!480711 () ListLongMap!14895)

(declare-fun minValue!831 () V!40465)

(declare-fun zeroValue!831 () V!40465)

(declare-datatypes ((ValueCell!12542 0))(
  ( (ValueCellFull!12542 (v!15928 V!40465)) (EmptyCell!12542) )
))
(declare-datatypes ((array!69870 0))(
  ( (array!69871 (arr!33609 (Array (_ BitVec 32) ValueCell!12542)) (size!34147 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69870)

(declare-fun getCurrentListMap!4156 (array!69868 array!69870 (_ BitVec 32) (_ BitVec 32) V!40465 V!40465 (_ BitVec 32) Int) ListLongMap!14895)

(assert (=> b!1084610 (= lt!480711 (getCurrentListMap!4156 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480709 () array!69870)

(declare-fun lt!480718 () ListLongMap!14895)

(assert (=> b!1084610 (= lt!480718 (getCurrentListMap!4156 lt!480712 lt!480709 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480713 () ListLongMap!14895)

(declare-fun lt!480722 () ListLongMap!14895)

(assert (=> b!1084610 (and (= lt!480713 lt!480722) (= lt!480722 lt!480713))))

(declare-fun lt!480714 () ListLongMap!14895)

(declare-fun -!742 (ListLongMap!14895 (_ BitVec 64)) ListLongMap!14895)

(assert (=> b!1084610 (= lt!480722 (-!742 lt!480714 k0!904))))

(declare-datatypes ((Unit!35519 0))(
  ( (Unit!35520) )
))
(declare-fun lt!480710 () Unit!35519)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!40 (array!69868 array!69870 (_ BitVec 32) (_ BitVec 32) V!40465 V!40465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35519)

(assert (=> b!1084610 (= lt!480710 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!40 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4026 (array!69868 array!69870 (_ BitVec 32) (_ BitVec 32) V!40465 V!40465 (_ BitVec 32) Int) ListLongMap!14895)

(assert (=> b!1084610 (= lt!480713 (getCurrentListMapNoExtraKeys!4026 lt!480712 lt!480709 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2097 (Int (_ BitVec 64)) V!40465)

(assert (=> b!1084610 (= lt!480709 (array!69871 (store (arr!33609 _values!874) i!650 (ValueCellFull!12542 (dynLambda!2097 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34147 _values!874)))))

(assert (=> b!1084610 (= lt!480714 (getCurrentListMapNoExtraKeys!4026 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084610 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480721 () Unit!35519)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69868 (_ BitVec 64) (_ BitVec 32)) Unit!35519)

(assert (=> b!1084610 (= lt!480721 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41509 () Bool)

(declare-fun mapRes!41509 () Bool)

(declare-fun tp!79351 () Bool)

(declare-fun e!619615 () Bool)

(assert (=> mapNonEmpty!41509 (= mapRes!41509 (and tp!79351 e!619615))))

(declare-fun mapKey!41509 () (_ BitVec 32))

(declare-fun mapValue!41509 () ValueCell!12542)

(declare-fun mapRest!41509 () (Array (_ BitVec 32) ValueCell!12542))

(assert (=> mapNonEmpty!41509 (= (arr!33609 _values!874) (store mapRest!41509 mapKey!41509 mapValue!41509))))

(declare-fun b!1084611 () Bool)

(declare-fun res!723120 () Bool)

(assert (=> b!1084611 (=> (not res!723120) (not e!619617))))

(assert (=> b!1084611 (= res!723120 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34146 _keys!1070))))))

(declare-fun b!1084612 () Bool)

(declare-fun res!723126 () Bool)

(assert (=> b!1084612 (=> (not res!723126) (not e!619617))))

(assert (=> b!1084612 (= res!723126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084613 () Bool)

(declare-fun res!723129 () Bool)

(assert (=> b!1084613 (=> (not res!723129) (not e!619617))))

(declare-datatypes ((List!23499 0))(
  ( (Nil!23496) (Cons!23495 (h!24704 (_ BitVec 64)) (t!33049 List!23499)) )
))
(declare-fun arrayNoDuplicates!0 (array!69868 (_ BitVec 32) List!23499) Bool)

(assert (=> b!1084613 (= res!723129 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23496))))

(declare-fun b!1084614 () Bool)

(declare-fun tp_is_empty!26503 () Bool)

(assert (=> b!1084614 (= e!619615 tp_is_empty!26503)))

(declare-fun mapIsEmpty!41509 () Bool)

(assert (=> mapIsEmpty!41509 mapRes!41509))

(declare-fun b!1084615 () Bool)

(declare-fun e!619614 () Bool)

(assert (=> b!1084615 (= e!619614 tp_is_empty!26503)))

(declare-fun b!1084616 () Bool)

(declare-fun res!723123 () Bool)

(assert (=> b!1084616 (=> (not res!723123) (not e!619618))))

(assert (=> b!1084616 (= res!723123 (arrayNoDuplicates!0 lt!480712 #b00000000000000000000000000000000 Nil!23496))))

(declare-fun res!723127 () Bool)

(assert (=> start!95842 (=> (not res!723127) (not e!619617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95842 (= res!723127 (validMask!0 mask!1414))))

(assert (=> start!95842 e!619617))

(assert (=> start!95842 tp!79352))

(assert (=> start!95842 true))

(assert (=> start!95842 tp_is_empty!26503))

(declare-fun array_inv!25978 (array!69868) Bool)

(assert (=> start!95842 (array_inv!25978 _keys!1070)))

(declare-fun e!619619 () Bool)

(declare-fun array_inv!25979 (array!69870) Bool)

(assert (=> start!95842 (and (array_inv!25979 _values!874) e!619619)))

(declare-fun b!1084617 () Bool)

(assert (=> b!1084617 (= e!619619 (and e!619614 mapRes!41509))))

(declare-fun condMapEmpty!41509 () Bool)

(declare-fun mapDefault!41509 () ValueCell!12542)

(assert (=> b!1084617 (= condMapEmpty!41509 (= (arr!33609 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12542)) mapDefault!41509)))))

(declare-fun b!1084618 () Bool)

(declare-fun res!723124 () Bool)

(assert (=> b!1084618 (=> (not res!723124) (not e!619617))))

(assert (=> b!1084618 (= res!723124 (and (= (size!34147 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34146 _keys!1070) (size!34147 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084619 () Bool)

(assert (=> b!1084619 (= e!619616 true)))

(declare-fun lt!480717 () ListLongMap!14895)

(declare-fun lt!480716 () ListLongMap!14895)

(assert (=> b!1084619 (= (-!742 lt!480717 k0!904) lt!480716)))

(declare-fun lt!480720 () Unit!35519)

(declare-fun addRemoveCommutativeForDiffKeys!1 (ListLongMap!14895 (_ BitVec 64) V!40465 (_ BitVec 64)) Unit!35519)

(assert (=> b!1084619 (= lt!480720 (addRemoveCommutativeForDiffKeys!1 lt!480714 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!480715 () tuple2!16926)

(declare-fun +!3272 (ListLongMap!14895 tuple2!16926) ListLongMap!14895)

(assert (=> b!1084619 (= lt!480718 (+!3272 lt!480716 lt!480715))))

(declare-fun lt!480719 () tuple2!16926)

(assert (=> b!1084619 (= lt!480716 (+!3272 lt!480722 lt!480719))))

(assert (=> b!1084619 (= lt!480711 (+!3272 lt!480717 lt!480715))))

(assert (=> b!1084619 (= lt!480717 (+!3272 lt!480714 lt!480719))))

(assert (=> b!1084619 (= lt!480718 (+!3272 (+!3272 lt!480713 lt!480719) lt!480715))))

(assert (=> b!1084619 (= lt!480715 (tuple2!16927 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1084619 (= lt!480719 (tuple2!16927 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(assert (= (and start!95842 res!723127) b!1084618))

(assert (= (and b!1084618 res!723124) b!1084612))

(assert (= (and b!1084612 res!723126) b!1084613))

(assert (= (and b!1084613 res!723129) b!1084611))

(assert (= (and b!1084611 res!723120) b!1084608))

(assert (= (and b!1084608 res!723122) b!1084609))

(assert (= (and b!1084609 res!723125) b!1084607))

(assert (= (and b!1084607 res!723121) b!1084616))

(assert (= (and b!1084616 res!723123) b!1084610))

(assert (= (and b!1084610 (not res!723128)) b!1084619))

(assert (= (and b!1084617 condMapEmpty!41509) mapIsEmpty!41509))

(assert (= (and b!1084617 (not condMapEmpty!41509)) mapNonEmpty!41509))

(get-info :version)

(assert (= (and mapNonEmpty!41509 ((_ is ValueCellFull!12542) mapValue!41509)) b!1084614))

(assert (= (and b!1084617 ((_ is ValueCellFull!12542) mapDefault!41509)) b!1084615))

(assert (= start!95842 b!1084617))

(declare-fun b_lambda!17149 () Bool)

(assert (=> (not b_lambda!17149) (not b!1084610)))

(declare-fun t!33047 () Bool)

(declare-fun tb!7371 () Bool)

(assert (=> (and start!95842 (= defaultEntry!882 defaultEntry!882) t!33047) tb!7371))

(declare-fun result!15269 () Bool)

(assert (=> tb!7371 (= result!15269 tp_is_empty!26503)))

(assert (=> b!1084610 t!33047))

(declare-fun b_and!35653 () Bool)

(assert (= b_and!35651 (and (=> t!33047 result!15269) b_and!35653)))

(declare-fun m!1001879 () Bool)

(assert (=> b!1084609 m!1001879))

(declare-fun m!1001881 () Bool)

(assert (=> b!1084608 m!1001881))

(declare-fun m!1001883 () Bool)

(assert (=> b!1084616 m!1001883))

(declare-fun m!1001885 () Bool)

(assert (=> b!1084612 m!1001885))

(declare-fun m!1001887 () Bool)

(assert (=> start!95842 m!1001887))

(declare-fun m!1001889 () Bool)

(assert (=> start!95842 m!1001889))

(declare-fun m!1001891 () Bool)

(assert (=> start!95842 m!1001891))

(declare-fun m!1001893 () Bool)

(assert (=> mapNonEmpty!41509 m!1001893))

(declare-fun m!1001895 () Bool)

(assert (=> b!1084619 m!1001895))

(declare-fun m!1001897 () Bool)

(assert (=> b!1084619 m!1001897))

(declare-fun m!1001899 () Bool)

(assert (=> b!1084619 m!1001899))

(declare-fun m!1001901 () Bool)

(assert (=> b!1084619 m!1001901))

(declare-fun m!1001903 () Bool)

(assert (=> b!1084619 m!1001903))

(assert (=> b!1084619 m!1001897))

(declare-fun m!1001905 () Bool)

(assert (=> b!1084619 m!1001905))

(declare-fun m!1001907 () Bool)

(assert (=> b!1084619 m!1001907))

(declare-fun m!1001909 () Bool)

(assert (=> b!1084619 m!1001909))

(declare-fun m!1001911 () Bool)

(assert (=> b!1084610 m!1001911))

(declare-fun m!1001913 () Bool)

(assert (=> b!1084610 m!1001913))

(declare-fun m!1001915 () Bool)

(assert (=> b!1084610 m!1001915))

(declare-fun m!1001917 () Bool)

(assert (=> b!1084610 m!1001917))

(declare-fun m!1001919 () Bool)

(assert (=> b!1084610 m!1001919))

(declare-fun m!1001921 () Bool)

(assert (=> b!1084610 m!1001921))

(declare-fun m!1001923 () Bool)

(assert (=> b!1084610 m!1001923))

(declare-fun m!1001925 () Bool)

(assert (=> b!1084610 m!1001925))

(declare-fun m!1001927 () Bool)

(assert (=> b!1084610 m!1001927))

(declare-fun m!1001929 () Bool)

(assert (=> b!1084610 m!1001929))

(declare-fun m!1001931 () Bool)

(assert (=> b!1084613 m!1001931))

(declare-fun m!1001933 () Bool)

(assert (=> b!1084607 m!1001933))

(declare-fun m!1001935 () Bool)

(assert (=> b!1084607 m!1001935))

(check-sat (not b!1084608) (not mapNonEmpty!41509) (not b_lambda!17149) (not b!1084619) (not b!1084607) (not b!1084612) b_and!35653 (not b!1084616) (not b!1084610) (not b!1084613) tp_is_empty!26503 (not b_next!22501) (not start!95842))
(check-sat b_and!35653 (not b_next!22501))
