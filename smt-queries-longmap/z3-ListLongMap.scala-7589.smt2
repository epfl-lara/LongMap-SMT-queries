; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95848 () Bool)

(assert start!95848)

(declare-fun b_free!22507 () Bool)

(declare-fun b_next!22507 () Bool)

(assert (=> start!95848 (= b_free!22507 (not b_next!22507))))

(declare-fun tp!79369 () Bool)

(declare-fun b_and!35663 () Bool)

(assert (=> start!95848 (= tp!79369 b_and!35663)))

(declare-fun b!1084732 () Bool)

(declare-fun res!723215 () Bool)

(declare-fun e!619681 () Bool)

(assert (=> b!1084732 (=> (not res!723215) (not e!619681))))

(declare-datatypes ((array!69880 0))(
  ( (array!69881 (arr!33614 (Array (_ BitVec 32) (_ BitVec 64))) (size!34152 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69880)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69880 (_ BitVec 32)) Bool)

(assert (=> b!1084732 (= res!723215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084733 () Bool)

(declare-fun e!619680 () Bool)

(assert (=> b!1084733 (= e!619681 e!619680)))

(declare-fun res!723221 () Bool)

(assert (=> b!1084733 (=> (not res!723221) (not e!619680))))

(declare-fun lt!480851 () array!69880)

(assert (=> b!1084733 (= res!723221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480851 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084733 (= lt!480851 (array!69881 (store (arr!33614 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34152 _keys!1070)))))

(declare-fun b!1084734 () Bool)

(declare-fun res!723217 () Bool)

(assert (=> b!1084734 (=> (not res!723217) (not e!619681))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1084734 (= res!723217 (= (select (arr!33614 _keys!1070) i!650) k0!904))))

(declare-fun b!1084735 () Bool)

(declare-fun e!619685 () Bool)

(declare-fun tp_is_empty!26509 () Bool)

(assert (=> b!1084735 (= e!619685 tp_is_empty!26509)))

(declare-fun b!1084736 () Bool)

(declare-fun res!723213 () Bool)

(assert (=> b!1084736 (=> (not res!723213) (not e!619681))))

(declare-datatypes ((List!23503 0))(
  ( (Nil!23500) (Cons!23499 (h!24708 (_ BitVec 64)) (t!33059 List!23503)) )
))
(declare-fun arrayNoDuplicates!0 (array!69880 (_ BitVec 32) List!23503) Bool)

(assert (=> b!1084736 (= res!723213 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23500))))

(declare-fun b!1084737 () Bool)

(declare-fun e!619682 () Bool)

(declare-fun e!619678 () Bool)

(assert (=> b!1084737 (= e!619682 e!619678)))

(declare-fun res!723212 () Bool)

(assert (=> b!1084737 (=> res!723212 e!619678)))

(assert (=> b!1084737 (= res!723212 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40473 0))(
  ( (V!40474 (val!13311 Int)) )
))
(declare-datatypes ((tuple2!16932 0))(
  ( (tuple2!16933 (_1!8477 (_ BitVec 64)) (_2!8477 V!40473)) )
))
(declare-datatypes ((List!23504 0))(
  ( (Nil!23501) (Cons!23500 (h!24709 tuple2!16932) (t!33060 List!23504)) )
))
(declare-datatypes ((ListLongMap!14901 0))(
  ( (ListLongMap!14902 (toList!7466 List!23504)) )
))
(declare-fun lt!480843 () ListLongMap!14901)

(declare-fun lt!480850 () ListLongMap!14901)

(assert (=> b!1084737 (= lt!480843 lt!480850)))

(declare-fun lt!480854 () ListLongMap!14901)

(declare-fun -!745 (ListLongMap!14901 (_ BitVec 64)) ListLongMap!14901)

(assert (=> b!1084737 (= lt!480843 (-!745 lt!480854 k0!904))))

(declare-fun lt!480855 () ListLongMap!14901)

(declare-datatypes ((Unit!35525 0))(
  ( (Unit!35526) )
))
(declare-fun lt!480848 () Unit!35525)

(declare-fun zeroValue!831 () V!40473)

(declare-fun addRemoveCommutativeForDiffKeys!4 (ListLongMap!14901 (_ BitVec 64) V!40473 (_ BitVec 64)) Unit!35525)

(assert (=> b!1084737 (= lt!480848 (addRemoveCommutativeForDiffKeys!4 lt!480855 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!480856 () ListLongMap!14901)

(declare-fun lt!480849 () tuple2!16932)

(declare-fun +!3275 (ListLongMap!14901 tuple2!16932) ListLongMap!14901)

(assert (=> b!1084737 (= lt!480856 (+!3275 lt!480850 lt!480849))))

(declare-fun lt!480844 () ListLongMap!14901)

(declare-fun lt!480852 () tuple2!16932)

(assert (=> b!1084737 (= lt!480850 (+!3275 lt!480844 lt!480852))))

(declare-fun lt!480857 () ListLongMap!14901)

(declare-fun lt!480853 () ListLongMap!14901)

(assert (=> b!1084737 (= lt!480857 lt!480853)))

(assert (=> b!1084737 (= lt!480853 (+!3275 lt!480854 lt!480849))))

(assert (=> b!1084737 (= lt!480854 (+!3275 lt!480855 lt!480852))))

(declare-fun lt!480841 () ListLongMap!14901)

(assert (=> b!1084737 (= lt!480856 (+!3275 (+!3275 lt!480841 lt!480852) lt!480849))))

(declare-fun minValue!831 () V!40473)

(assert (=> b!1084737 (= lt!480849 (tuple2!16933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1084737 (= lt!480852 (tuple2!16933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!723222 () Bool)

(assert (=> start!95848 (=> (not res!723222) (not e!619681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95848 (= res!723222 (validMask!0 mask!1414))))

(assert (=> start!95848 e!619681))

(assert (=> start!95848 tp!79369))

(assert (=> start!95848 true))

(assert (=> start!95848 tp_is_empty!26509))

(declare-fun array_inv!25980 (array!69880) Bool)

(assert (=> start!95848 (array_inv!25980 _keys!1070)))

(declare-datatypes ((ValueCell!12545 0))(
  ( (ValueCellFull!12545 (v!15931 V!40473)) (EmptyCell!12545) )
))
(declare-datatypes ((array!69882 0))(
  ( (array!69883 (arr!33615 (Array (_ BitVec 32) ValueCell!12545)) (size!34153 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69882)

(declare-fun e!619679 () Bool)

(declare-fun array_inv!25981 (array!69882) Bool)

(assert (=> start!95848 (and (array_inv!25981 _values!874) e!619679)))

(declare-fun b!1084738 () Bool)

(declare-fun res!723214 () Bool)

(assert (=> b!1084738 (=> (not res!723214) (not e!619681))))

(assert (=> b!1084738 (= res!723214 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34152 _keys!1070))))))

(declare-fun b!1084739 () Bool)

(assert (=> b!1084739 (= e!619680 (not e!619682))))

(declare-fun res!723220 () Bool)

(assert (=> b!1084739 (=> res!723220 e!619682)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1084739 (= res!723220 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4157 (array!69880 array!69882 (_ BitVec 32) (_ BitVec 32) V!40473 V!40473 (_ BitVec 32) Int) ListLongMap!14901)

(assert (=> b!1084739 (= lt!480857 (getCurrentListMap!4157 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480847 () array!69882)

(assert (=> b!1084739 (= lt!480856 (getCurrentListMap!4157 lt!480851 lt!480847 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1084739 (and (= lt!480841 lt!480844) (= lt!480844 lt!480841))))

(assert (=> b!1084739 (= lt!480844 (-!745 lt!480855 k0!904))))

(declare-fun lt!480842 () Unit!35525)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!41 (array!69880 array!69882 (_ BitVec 32) (_ BitVec 32) V!40473 V!40473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35525)

(assert (=> b!1084739 (= lt!480842 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!41 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4027 (array!69880 array!69882 (_ BitVec 32) (_ BitVec 32) V!40473 V!40473 (_ BitVec 32) Int) ListLongMap!14901)

(assert (=> b!1084739 (= lt!480841 (getCurrentListMapNoExtraKeys!4027 lt!480851 lt!480847 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2098 (Int (_ BitVec 64)) V!40473)

(assert (=> b!1084739 (= lt!480847 (array!69883 (store (arr!33615 _values!874) i!650 (ValueCellFull!12545 (dynLambda!2098 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34153 _values!874)))))

(assert (=> b!1084739 (= lt!480855 (getCurrentListMapNoExtraKeys!4027 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084739 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480846 () Unit!35525)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69880 (_ BitVec 64) (_ BitVec 32)) Unit!35525)

(assert (=> b!1084739 (= lt!480846 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084740 () Bool)

(declare-fun res!723218 () Bool)

(assert (=> b!1084740 (=> (not res!723218) (not e!619680))))

(assert (=> b!1084740 (= res!723218 (arrayNoDuplicates!0 lt!480851 #b00000000000000000000000000000000 Nil!23500))))

(declare-fun mapNonEmpty!41518 () Bool)

(declare-fun mapRes!41518 () Bool)

(declare-fun tp!79370 () Bool)

(assert (=> mapNonEmpty!41518 (= mapRes!41518 (and tp!79370 e!619685))))

(declare-fun mapValue!41518 () ValueCell!12545)

(declare-fun mapRest!41518 () (Array (_ BitVec 32) ValueCell!12545))

(declare-fun mapKey!41518 () (_ BitVec 32))

(assert (=> mapNonEmpty!41518 (= (arr!33615 _values!874) (store mapRest!41518 mapKey!41518 mapValue!41518))))

(declare-fun b!1084741 () Bool)

(declare-fun res!723219 () Bool)

(assert (=> b!1084741 (=> (not res!723219) (not e!619681))))

(assert (=> b!1084741 (= res!723219 (and (= (size!34153 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34152 _keys!1070) (size!34153 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084742 () Bool)

(declare-fun e!619683 () Bool)

(assert (=> b!1084742 (= e!619683 tp_is_empty!26509)))

(declare-fun b!1084743 () Bool)

(assert (=> b!1084743 (= e!619678 true)))

(assert (=> b!1084743 (= (-!745 lt!480853 k0!904) (+!3275 lt!480843 lt!480849))))

(declare-fun lt!480845 () Unit!35525)

(assert (=> b!1084743 (= lt!480845 (addRemoveCommutativeForDiffKeys!4 lt!480854 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1084744 () Bool)

(assert (=> b!1084744 (= e!619679 (and e!619683 mapRes!41518))))

(declare-fun condMapEmpty!41518 () Bool)

(declare-fun mapDefault!41518 () ValueCell!12545)

(assert (=> b!1084744 (= condMapEmpty!41518 (= (arr!33615 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12545)) mapDefault!41518)))))

(declare-fun b!1084745 () Bool)

(declare-fun res!723216 () Bool)

(assert (=> b!1084745 (=> (not res!723216) (not e!619681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084745 (= res!723216 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!41518 () Bool)

(assert (=> mapIsEmpty!41518 mapRes!41518))

(assert (= (and start!95848 res!723222) b!1084741))

(assert (= (and b!1084741 res!723219) b!1084732))

(assert (= (and b!1084732 res!723215) b!1084736))

(assert (= (and b!1084736 res!723213) b!1084738))

(assert (= (and b!1084738 res!723214) b!1084745))

(assert (= (and b!1084745 res!723216) b!1084734))

(assert (= (and b!1084734 res!723217) b!1084733))

(assert (= (and b!1084733 res!723221) b!1084740))

(assert (= (and b!1084740 res!723218) b!1084739))

(assert (= (and b!1084739 (not res!723220)) b!1084737))

(assert (= (and b!1084737 (not res!723212)) b!1084743))

(assert (= (and b!1084744 condMapEmpty!41518) mapIsEmpty!41518))

(assert (= (and b!1084744 (not condMapEmpty!41518)) mapNonEmpty!41518))

(get-info :version)

(assert (= (and mapNonEmpty!41518 ((_ is ValueCellFull!12545) mapValue!41518)) b!1084735))

(assert (= (and b!1084744 ((_ is ValueCellFull!12545) mapDefault!41518)) b!1084742))

(assert (= start!95848 b!1084744))

(declare-fun b_lambda!17155 () Bool)

(assert (=> (not b_lambda!17155) (not b!1084739)))

(declare-fun t!33058 () Bool)

(declare-fun tb!7377 () Bool)

(assert (=> (and start!95848 (= defaultEntry!882 defaultEntry!882) t!33058) tb!7377))

(declare-fun result!15281 () Bool)

(assert (=> tb!7377 (= result!15281 tp_is_empty!26509)))

(assert (=> b!1084739 t!33058))

(declare-fun b_and!35665 () Bool)

(assert (= b_and!35663 (and (=> t!33058 result!15281) b_and!35665)))

(declare-fun m!1002053 () Bool)

(assert (=> b!1084734 m!1002053))

(declare-fun m!1002055 () Bool)

(assert (=> b!1084743 m!1002055))

(declare-fun m!1002057 () Bool)

(assert (=> b!1084743 m!1002057))

(declare-fun m!1002059 () Bool)

(assert (=> b!1084743 m!1002059))

(declare-fun m!1002061 () Bool)

(assert (=> mapNonEmpty!41518 m!1002061))

(declare-fun m!1002063 () Bool)

(assert (=> b!1084739 m!1002063))

(declare-fun m!1002065 () Bool)

(assert (=> b!1084739 m!1002065))

(declare-fun m!1002067 () Bool)

(assert (=> b!1084739 m!1002067))

(declare-fun m!1002069 () Bool)

(assert (=> b!1084739 m!1002069))

(declare-fun m!1002071 () Bool)

(assert (=> b!1084739 m!1002071))

(declare-fun m!1002073 () Bool)

(assert (=> b!1084739 m!1002073))

(declare-fun m!1002075 () Bool)

(assert (=> b!1084739 m!1002075))

(declare-fun m!1002077 () Bool)

(assert (=> b!1084739 m!1002077))

(declare-fun m!1002079 () Bool)

(assert (=> b!1084739 m!1002079))

(declare-fun m!1002081 () Bool)

(assert (=> b!1084739 m!1002081))

(declare-fun m!1002083 () Bool)

(assert (=> start!95848 m!1002083))

(declare-fun m!1002085 () Bool)

(assert (=> start!95848 m!1002085))

(declare-fun m!1002087 () Bool)

(assert (=> start!95848 m!1002087))

(declare-fun m!1002089 () Bool)

(assert (=> b!1084733 m!1002089))

(declare-fun m!1002091 () Bool)

(assert (=> b!1084733 m!1002091))

(declare-fun m!1002093 () Bool)

(assert (=> b!1084732 m!1002093))

(declare-fun m!1002095 () Bool)

(assert (=> b!1084737 m!1002095))

(declare-fun m!1002097 () Bool)

(assert (=> b!1084737 m!1002097))

(declare-fun m!1002099 () Bool)

(assert (=> b!1084737 m!1002099))

(declare-fun m!1002101 () Bool)

(assert (=> b!1084737 m!1002101))

(declare-fun m!1002103 () Bool)

(assert (=> b!1084737 m!1002103))

(declare-fun m!1002105 () Bool)

(assert (=> b!1084737 m!1002105))

(declare-fun m!1002107 () Bool)

(assert (=> b!1084737 m!1002107))

(assert (=> b!1084737 m!1002095))

(declare-fun m!1002109 () Bool)

(assert (=> b!1084737 m!1002109))

(declare-fun m!1002111 () Bool)

(assert (=> b!1084745 m!1002111))

(declare-fun m!1002113 () Bool)

(assert (=> b!1084740 m!1002113))

(declare-fun m!1002115 () Bool)

(assert (=> b!1084736 m!1002115))

(check-sat (not b!1084733) (not b!1084743) (not b!1084740) b_and!35665 (not b_next!22507) (not b!1084732) (not b!1084736) tp_is_empty!26509 (not b!1084739) (not b!1084737) (not b!1084745) (not b_lambda!17155) (not start!95848) (not mapNonEmpty!41518))
(check-sat b_and!35665 (not b_next!22507))
