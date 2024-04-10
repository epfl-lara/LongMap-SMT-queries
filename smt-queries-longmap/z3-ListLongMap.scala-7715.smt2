; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96924 () Bool)

(assert start!96924)

(declare-fun b_free!23217 () Bool)

(declare-fun b_next!23217 () Bool)

(assert (=> start!96924 (= b_free!23217 (not b_next!23217))))

(declare-fun tp!81611 () Bool)

(declare-fun b_and!37251 () Bool)

(assert (=> start!96924 (= tp!81611 b_and!37251)))

(declare-fun b!1102776 () Bool)

(declare-fun e!629420 () Bool)

(declare-fun e!629425 () Bool)

(declare-fun mapRes!42694 () Bool)

(assert (=> b!1102776 (= e!629420 (and e!629425 mapRes!42694))))

(declare-fun condMapEmpty!42694 () Bool)

(declare-datatypes ((V!41483 0))(
  ( (V!41484 (val!13690 Int)) )
))
(declare-datatypes ((ValueCell!12924 0))(
  ( (ValueCellFull!12924 (v!16321 V!41483)) (EmptyCell!12924) )
))
(declare-datatypes ((array!71455 0))(
  ( (array!71456 (arr!34388 (Array (_ BitVec 32) ValueCell!12924)) (size!34924 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71455)

(declare-fun mapDefault!42694 () ValueCell!12924)

(assert (=> b!1102776 (= condMapEmpty!42694 (= (arr!34388 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12924)) mapDefault!42694)))))

(declare-fun b!1102777 () Bool)

(declare-fun res!735807 () Bool)

(declare-fun e!629419 () Bool)

(assert (=> b!1102777 (=> (not res!735807) (not e!629419))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102777 (= res!735807 (validKeyInArray!0 k0!904))))

(declare-fun b!1102778 () Bool)

(declare-fun e!629423 () Bool)

(declare-fun e!629422 () Bool)

(assert (=> b!1102778 (= e!629423 (not e!629422))))

(declare-fun res!735814 () Bool)

(assert (=> b!1102778 (=> res!735814 e!629422)))

(declare-fun lt!494873 () Bool)

(declare-datatypes ((tuple2!17414 0))(
  ( (tuple2!17415 (_1!8718 (_ BitVec 64)) (_2!8718 V!41483)) )
))
(declare-datatypes ((List!24031 0))(
  ( (Nil!24028) (Cons!24027 (h!25236 tuple2!17414) (t!34294 List!24031)) )
))
(declare-datatypes ((ListLongMap!15383 0))(
  ( (ListLongMap!15384 (toList!7707 List!24031)) )
))
(declare-fun lt!494872 () ListLongMap!15383)

(declare-fun lt!494871 () ListLongMap!15383)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1102778 (= res!735814 (or (and (not lt!494873) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!494873) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!494873) (not (= lt!494871 lt!494872))))))

(assert (=> b!1102778 (= lt!494873 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41483)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41483)

(declare-datatypes ((array!71457 0))(
  ( (array!71458 (arr!34389 (Array (_ BitVec 32) (_ BitVec 64))) (size!34925 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71457)

(declare-fun lt!494866 () ListLongMap!15383)

(declare-fun getCurrentListMap!4411 (array!71457 array!71455 (_ BitVec 32) (_ BitVec 32) V!41483 V!41483 (_ BitVec 32) Int) ListLongMap!15383)

(assert (=> b!1102778 (= lt!494866 (getCurrentListMap!4411 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494868 () array!71455)

(declare-fun lt!494865 () array!71457)

(assert (=> b!1102778 (= lt!494871 (getCurrentListMap!4411 lt!494865 lt!494868 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494867 () ListLongMap!15383)

(assert (=> b!1102778 (and (= lt!494872 lt!494867) (= lt!494867 lt!494872))))

(declare-fun lt!494870 () ListLongMap!15383)

(declare-fun -!990 (ListLongMap!15383 (_ BitVec 64)) ListLongMap!15383)

(assert (=> b!1102778 (= lt!494867 (-!990 lt!494870 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36234 0))(
  ( (Unit!36235) )
))
(declare-fun lt!494869 () Unit!36234)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!237 (array!71457 array!71455 (_ BitVec 32) (_ BitVec 32) V!41483 V!41483 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36234)

(assert (=> b!1102778 (= lt!494869 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4207 (array!71457 array!71455 (_ BitVec 32) (_ BitVec 32) V!41483 V!41483 (_ BitVec 32) Int) ListLongMap!15383)

(assert (=> b!1102778 (= lt!494872 (getCurrentListMapNoExtraKeys!4207 lt!494865 lt!494868 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2342 (Int (_ BitVec 64)) V!41483)

(assert (=> b!1102778 (= lt!494868 (array!71456 (store (arr!34388 _values!874) i!650 (ValueCellFull!12924 (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34924 _values!874)))))

(assert (=> b!1102778 (= lt!494870 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102778 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494874 () Unit!36234)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71457 (_ BitVec 64) (_ BitVec 32)) Unit!36234)

(assert (=> b!1102778 (= lt!494874 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1102779 () Bool)

(declare-fun res!735812 () Bool)

(assert (=> b!1102779 (=> (not res!735812) (not e!629419))))

(assert (=> b!1102779 (= res!735812 (= (select (arr!34389 _keys!1070) i!650) k0!904))))

(declare-fun b!1102780 () Bool)

(assert (=> b!1102780 (= e!629422 (= (-!990 lt!494866 k0!904) lt!494871))))

(declare-fun b!1102781 () Bool)

(declare-fun res!735806 () Bool)

(assert (=> b!1102781 (=> (not res!735806) (not e!629419))))

(assert (=> b!1102781 (= res!735806 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34925 _keys!1070))))))

(declare-fun mapNonEmpty!42694 () Bool)

(declare-fun tp!81610 () Bool)

(declare-fun e!629421 () Bool)

(assert (=> mapNonEmpty!42694 (= mapRes!42694 (and tp!81610 e!629421))))

(declare-fun mapKey!42694 () (_ BitVec 32))

(declare-fun mapRest!42694 () (Array (_ BitVec 32) ValueCell!12924))

(declare-fun mapValue!42694 () ValueCell!12924)

(assert (=> mapNonEmpty!42694 (= (arr!34388 _values!874) (store mapRest!42694 mapKey!42694 mapValue!42694))))

(declare-fun b!1102782 () Bool)

(declare-fun tp_is_empty!27267 () Bool)

(assert (=> b!1102782 (= e!629421 tp_is_empty!27267)))

(declare-fun b!1102783 () Bool)

(assert (=> b!1102783 (= e!629425 tp_is_empty!27267)))

(declare-fun b!1102784 () Bool)

(declare-fun res!735808 () Bool)

(assert (=> b!1102784 (=> (not res!735808) (not e!629419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71457 (_ BitVec 32)) Bool)

(assert (=> b!1102784 (= res!735808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102785 () Bool)

(assert (=> b!1102785 (= e!629419 e!629423)))

(declare-fun res!735811 () Bool)

(assert (=> b!1102785 (=> (not res!735811) (not e!629423))))

(assert (=> b!1102785 (= res!735811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494865 mask!1414))))

(assert (=> b!1102785 (= lt!494865 (array!71458 (store (arr!34389 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34925 _keys!1070)))))

(declare-fun b!1102786 () Bool)

(declare-fun res!735809 () Bool)

(assert (=> b!1102786 (=> (not res!735809) (not e!629423))))

(declare-datatypes ((List!24032 0))(
  ( (Nil!24029) (Cons!24028 (h!25237 (_ BitVec 64)) (t!34295 List!24032)) )
))
(declare-fun arrayNoDuplicates!0 (array!71457 (_ BitVec 32) List!24032) Bool)

(assert (=> b!1102786 (= res!735809 (arrayNoDuplicates!0 lt!494865 #b00000000000000000000000000000000 Nil!24029))))

(declare-fun b!1102787 () Bool)

(declare-fun res!735805 () Bool)

(assert (=> b!1102787 (=> (not res!735805) (not e!629419))))

(assert (=> b!1102787 (= res!735805 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24029))))

(declare-fun mapIsEmpty!42694 () Bool)

(assert (=> mapIsEmpty!42694 mapRes!42694))

(declare-fun b!1102788 () Bool)

(declare-fun res!735813 () Bool)

(assert (=> b!1102788 (=> (not res!735813) (not e!629419))))

(assert (=> b!1102788 (= res!735813 (and (= (size!34924 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34925 _keys!1070) (size!34924 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!735810 () Bool)

(assert (=> start!96924 (=> (not res!735810) (not e!629419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96924 (= res!735810 (validMask!0 mask!1414))))

(assert (=> start!96924 e!629419))

(assert (=> start!96924 tp!81611))

(assert (=> start!96924 true))

(assert (=> start!96924 tp_is_empty!27267))

(declare-fun array_inv!26484 (array!71457) Bool)

(assert (=> start!96924 (array_inv!26484 _keys!1070)))

(declare-fun array_inv!26485 (array!71455) Bool)

(assert (=> start!96924 (and (array_inv!26485 _values!874) e!629420)))

(assert (= (and start!96924 res!735810) b!1102788))

(assert (= (and b!1102788 res!735813) b!1102784))

(assert (= (and b!1102784 res!735808) b!1102787))

(assert (= (and b!1102787 res!735805) b!1102781))

(assert (= (and b!1102781 res!735806) b!1102777))

(assert (= (and b!1102777 res!735807) b!1102779))

(assert (= (and b!1102779 res!735812) b!1102785))

(assert (= (and b!1102785 res!735811) b!1102786))

(assert (= (and b!1102786 res!735809) b!1102778))

(assert (= (and b!1102778 (not res!735814)) b!1102780))

(assert (= (and b!1102776 condMapEmpty!42694) mapIsEmpty!42694))

(assert (= (and b!1102776 (not condMapEmpty!42694)) mapNonEmpty!42694))

(get-info :version)

(assert (= (and mapNonEmpty!42694 ((_ is ValueCellFull!12924) mapValue!42694)) b!1102782))

(assert (= (and b!1102776 ((_ is ValueCellFull!12924) mapDefault!42694)) b!1102783))

(assert (= start!96924 b!1102776))

(declare-fun b_lambda!18205 () Bool)

(assert (=> (not b_lambda!18205) (not b!1102778)))

(declare-fun t!34293 () Bool)

(declare-fun tb!8083 () Bool)

(assert (=> (and start!96924 (= defaultEntry!882 defaultEntry!882) t!34293) tb!8083))

(declare-fun result!16711 () Bool)

(assert (=> tb!8083 (= result!16711 tp_is_empty!27267)))

(assert (=> b!1102778 t!34293))

(declare-fun b_and!37253 () Bool)

(assert (= b_and!37251 (and (=> t!34293 result!16711) b_and!37253)))

(declare-fun m!1023101 () Bool)

(assert (=> b!1102777 m!1023101))

(declare-fun m!1023103 () Bool)

(assert (=> b!1102787 m!1023103))

(declare-fun m!1023105 () Bool)

(assert (=> b!1102785 m!1023105))

(declare-fun m!1023107 () Bool)

(assert (=> b!1102785 m!1023107))

(declare-fun m!1023109 () Bool)

(assert (=> b!1102778 m!1023109))

(declare-fun m!1023111 () Bool)

(assert (=> b!1102778 m!1023111))

(declare-fun m!1023113 () Bool)

(assert (=> b!1102778 m!1023113))

(declare-fun m!1023115 () Bool)

(assert (=> b!1102778 m!1023115))

(declare-fun m!1023117 () Bool)

(assert (=> b!1102778 m!1023117))

(declare-fun m!1023119 () Bool)

(assert (=> b!1102778 m!1023119))

(declare-fun m!1023121 () Bool)

(assert (=> b!1102778 m!1023121))

(declare-fun m!1023123 () Bool)

(assert (=> b!1102778 m!1023123))

(declare-fun m!1023125 () Bool)

(assert (=> b!1102778 m!1023125))

(declare-fun m!1023127 () Bool)

(assert (=> b!1102778 m!1023127))

(declare-fun m!1023129 () Bool)

(assert (=> start!96924 m!1023129))

(declare-fun m!1023131 () Bool)

(assert (=> start!96924 m!1023131))

(declare-fun m!1023133 () Bool)

(assert (=> start!96924 m!1023133))

(declare-fun m!1023135 () Bool)

(assert (=> b!1102780 m!1023135))

(declare-fun m!1023137 () Bool)

(assert (=> mapNonEmpty!42694 m!1023137))

(declare-fun m!1023139 () Bool)

(assert (=> b!1102779 m!1023139))

(declare-fun m!1023141 () Bool)

(assert (=> b!1102784 m!1023141))

(declare-fun m!1023143 () Bool)

(assert (=> b!1102786 m!1023143))

(check-sat (not start!96924) tp_is_empty!27267 (not b!1102786) (not b_next!23217) (not b!1102777) (not b!1102784) (not b_lambda!18205) b_and!37253 (not b!1102778) (not b!1102780) (not b!1102785) (not mapNonEmpty!42694) (not b!1102787))
(check-sat b_and!37253 (not b_next!23217))
(get-model)

(declare-fun b_lambda!18209 () Bool)

(assert (= b_lambda!18205 (or (and start!96924 b_free!23217) b_lambda!18209)))

(check-sat (not start!96924) (not b_lambda!18209) tp_is_empty!27267 (not b!1102786) (not b_next!23217) (not b!1102777) (not b!1102784) b_and!37253 (not b!1102778) (not b!1102780) (not b!1102785) (not mapNonEmpty!42694) (not b!1102787))
(check-sat b_and!37253 (not b_next!23217))
(get-model)

(declare-fun bm!46270 () Bool)

(declare-fun call!46273 () Bool)

(declare-fun c!108922 () Bool)

(assert (=> bm!46270 (= call!46273 (arrayNoDuplicates!0 lt!494865 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108922 (Cons!24028 (select (arr!34389 lt!494865) #b00000000000000000000000000000000) Nil!24029) Nil!24029)))))

(declare-fun d!130761 () Bool)

(declare-fun res!735852 () Bool)

(declare-fun e!629456 () Bool)

(assert (=> d!130761 (=> res!735852 e!629456)))

(assert (=> d!130761 (= res!735852 (bvsge #b00000000000000000000000000000000 (size!34925 lt!494865)))))

(assert (=> d!130761 (= (arrayNoDuplicates!0 lt!494865 #b00000000000000000000000000000000 Nil!24029) e!629456)))

(declare-fun b!1102842 () Bool)

(declare-fun e!629457 () Bool)

(declare-fun e!629458 () Bool)

(assert (=> b!1102842 (= e!629457 e!629458)))

(assert (=> b!1102842 (= c!108922 (validKeyInArray!0 (select (arr!34389 lt!494865) #b00000000000000000000000000000000)))))

(declare-fun b!1102843 () Bool)

(declare-fun e!629455 () Bool)

(declare-fun contains!6409 (List!24032 (_ BitVec 64)) Bool)

(assert (=> b!1102843 (= e!629455 (contains!6409 Nil!24029 (select (arr!34389 lt!494865) #b00000000000000000000000000000000)))))

(declare-fun b!1102844 () Bool)

(assert (=> b!1102844 (= e!629456 e!629457)))

(declare-fun res!735851 () Bool)

(assert (=> b!1102844 (=> (not res!735851) (not e!629457))))

(assert (=> b!1102844 (= res!735851 (not e!629455))))

(declare-fun res!735853 () Bool)

(assert (=> b!1102844 (=> (not res!735853) (not e!629455))))

(assert (=> b!1102844 (= res!735853 (validKeyInArray!0 (select (arr!34389 lt!494865) #b00000000000000000000000000000000)))))

(declare-fun b!1102845 () Bool)

(assert (=> b!1102845 (= e!629458 call!46273)))

(declare-fun b!1102846 () Bool)

(assert (=> b!1102846 (= e!629458 call!46273)))

(assert (= (and d!130761 (not res!735852)) b!1102844))

(assert (= (and b!1102844 res!735853) b!1102843))

(assert (= (and b!1102844 res!735851) b!1102842))

(assert (= (and b!1102842 c!108922) b!1102846))

(assert (= (and b!1102842 (not c!108922)) b!1102845))

(assert (= (or b!1102846 b!1102845) bm!46270))

(declare-fun m!1023189 () Bool)

(assert (=> bm!46270 m!1023189))

(declare-fun m!1023191 () Bool)

(assert (=> bm!46270 m!1023191))

(assert (=> b!1102842 m!1023189))

(assert (=> b!1102842 m!1023189))

(declare-fun m!1023193 () Bool)

(assert (=> b!1102842 m!1023193))

(assert (=> b!1102843 m!1023189))

(assert (=> b!1102843 m!1023189))

(declare-fun m!1023195 () Bool)

(assert (=> b!1102843 m!1023195))

(assert (=> b!1102844 m!1023189))

(assert (=> b!1102844 m!1023189))

(assert (=> b!1102844 m!1023193))

(assert (=> b!1102786 d!130761))

(declare-fun b!1102855 () Bool)

(declare-fun e!629466 () Bool)

(declare-fun e!629465 () Bool)

(assert (=> b!1102855 (= e!629466 e!629465)))

(declare-fun lt!494913 () (_ BitVec 64))

(assert (=> b!1102855 (= lt!494913 (select (arr!34389 lt!494865) #b00000000000000000000000000000000))))

(declare-fun lt!494911 () Unit!36234)

(assert (=> b!1102855 (= lt!494911 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!494865 lt!494913 #b00000000000000000000000000000000))))

(assert (=> b!1102855 (arrayContainsKey!0 lt!494865 lt!494913 #b00000000000000000000000000000000)))

(declare-fun lt!494912 () Unit!36234)

(assert (=> b!1102855 (= lt!494912 lt!494911)))

(declare-fun res!735858 () Bool)

(declare-datatypes ((SeekEntryResult!9917 0))(
  ( (MissingZero!9917 (index!42039 (_ BitVec 32))) (Found!9917 (index!42040 (_ BitVec 32))) (Intermediate!9917 (undefined!10729 Bool) (index!42041 (_ BitVec 32)) (x!99192 (_ BitVec 32))) (Undefined!9917) (MissingVacant!9917 (index!42042 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71457 (_ BitVec 32)) SeekEntryResult!9917)

(assert (=> b!1102855 (= res!735858 (= (seekEntryOrOpen!0 (select (arr!34389 lt!494865) #b00000000000000000000000000000000) lt!494865 mask!1414) (Found!9917 #b00000000000000000000000000000000)))))

(assert (=> b!1102855 (=> (not res!735858) (not e!629465))))

(declare-fun b!1102856 () Bool)

(declare-fun e!629467 () Bool)

(assert (=> b!1102856 (= e!629467 e!629466)))

(declare-fun c!108925 () Bool)

(assert (=> b!1102856 (= c!108925 (validKeyInArray!0 (select (arr!34389 lt!494865) #b00000000000000000000000000000000)))))

(declare-fun d!130763 () Bool)

(declare-fun res!735859 () Bool)

(assert (=> d!130763 (=> res!735859 e!629467)))

(assert (=> d!130763 (= res!735859 (bvsge #b00000000000000000000000000000000 (size!34925 lt!494865)))))

(assert (=> d!130763 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494865 mask!1414) e!629467)))

(declare-fun bm!46273 () Bool)

(declare-fun call!46276 () Bool)

(assert (=> bm!46273 (= call!46276 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!494865 mask!1414))))

(declare-fun b!1102857 () Bool)

(assert (=> b!1102857 (= e!629465 call!46276)))

(declare-fun b!1102858 () Bool)

(assert (=> b!1102858 (= e!629466 call!46276)))

(assert (= (and d!130763 (not res!735859)) b!1102856))

(assert (= (and b!1102856 c!108925) b!1102855))

(assert (= (and b!1102856 (not c!108925)) b!1102858))

(assert (= (and b!1102855 res!735858) b!1102857))

(assert (= (or b!1102857 b!1102858) bm!46273))

(assert (=> b!1102855 m!1023189))

(declare-fun m!1023197 () Bool)

(assert (=> b!1102855 m!1023197))

(declare-fun m!1023199 () Bool)

(assert (=> b!1102855 m!1023199))

(assert (=> b!1102855 m!1023189))

(declare-fun m!1023201 () Bool)

(assert (=> b!1102855 m!1023201))

(assert (=> b!1102856 m!1023189))

(assert (=> b!1102856 m!1023189))

(assert (=> b!1102856 m!1023193))

(declare-fun m!1023203 () Bool)

(assert (=> bm!46273 m!1023203))

(assert (=> b!1102785 d!130763))

(declare-fun d!130765 () Bool)

(declare-fun lt!494916 () ListLongMap!15383)

(declare-fun contains!6410 (ListLongMap!15383 (_ BitVec 64)) Bool)

(assert (=> d!130765 (not (contains!6410 lt!494916 k0!904))))

(declare-fun removeStrictlySorted!88 (List!24031 (_ BitVec 64)) List!24031)

(assert (=> d!130765 (= lt!494916 (ListLongMap!15384 (removeStrictlySorted!88 (toList!7707 lt!494866) k0!904)))))

(assert (=> d!130765 (= (-!990 lt!494866 k0!904) lt!494916)))

(declare-fun bs!32353 () Bool)

(assert (= bs!32353 d!130765))

(declare-fun m!1023205 () Bool)

(assert (=> bs!32353 m!1023205))

(declare-fun m!1023207 () Bool)

(assert (=> bs!32353 m!1023207))

(assert (=> b!1102780 d!130765))

(declare-fun b!1102859 () Bool)

(declare-fun e!629469 () Bool)

(declare-fun e!629468 () Bool)

(assert (=> b!1102859 (= e!629469 e!629468)))

(declare-fun lt!494919 () (_ BitVec 64))

(assert (=> b!1102859 (= lt!494919 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494917 () Unit!36234)

(assert (=> b!1102859 (= lt!494917 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!494919 #b00000000000000000000000000000000))))

(assert (=> b!1102859 (arrayContainsKey!0 _keys!1070 lt!494919 #b00000000000000000000000000000000)))

(declare-fun lt!494918 () Unit!36234)

(assert (=> b!1102859 (= lt!494918 lt!494917)))

(declare-fun res!735860 () Bool)

(assert (=> b!1102859 (= res!735860 (= (seekEntryOrOpen!0 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9917 #b00000000000000000000000000000000)))))

(assert (=> b!1102859 (=> (not res!735860) (not e!629468))))

(declare-fun b!1102860 () Bool)

(declare-fun e!629470 () Bool)

(assert (=> b!1102860 (= e!629470 e!629469)))

(declare-fun c!108926 () Bool)

(assert (=> b!1102860 (= c!108926 (validKeyInArray!0 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130767 () Bool)

(declare-fun res!735861 () Bool)

(assert (=> d!130767 (=> res!735861 e!629470)))

(assert (=> d!130767 (= res!735861 (bvsge #b00000000000000000000000000000000 (size!34925 _keys!1070)))))

(assert (=> d!130767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!629470)))

(declare-fun bm!46274 () Bool)

(declare-fun call!46277 () Bool)

(assert (=> bm!46274 (= call!46277 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1102861 () Bool)

(assert (=> b!1102861 (= e!629468 call!46277)))

(declare-fun b!1102862 () Bool)

(assert (=> b!1102862 (= e!629469 call!46277)))

(assert (= (and d!130767 (not res!735861)) b!1102860))

(assert (= (and b!1102860 c!108926) b!1102859))

(assert (= (and b!1102860 (not c!108926)) b!1102862))

(assert (= (and b!1102859 res!735860) b!1102861))

(assert (= (or b!1102861 b!1102862) bm!46274))

(declare-fun m!1023209 () Bool)

(assert (=> b!1102859 m!1023209))

(declare-fun m!1023211 () Bool)

(assert (=> b!1102859 m!1023211))

(declare-fun m!1023213 () Bool)

(assert (=> b!1102859 m!1023213))

(assert (=> b!1102859 m!1023209))

(declare-fun m!1023215 () Bool)

(assert (=> b!1102859 m!1023215))

(assert (=> b!1102860 m!1023209))

(assert (=> b!1102860 m!1023209))

(declare-fun m!1023217 () Bool)

(assert (=> b!1102860 m!1023217))

(declare-fun m!1023219 () Bool)

(assert (=> bm!46274 m!1023219))

(assert (=> b!1102784 d!130767))

(declare-fun d!130769 () Bool)

(declare-fun res!735866 () Bool)

(declare-fun e!629475 () Bool)

(assert (=> d!130769 (=> res!735866 e!629475)))

(assert (=> d!130769 (= res!735866 (= (select (arr!34389 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130769 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!629475)))

(declare-fun b!1102867 () Bool)

(declare-fun e!629476 () Bool)

(assert (=> b!1102867 (= e!629475 e!629476)))

(declare-fun res!735867 () Bool)

(assert (=> b!1102867 (=> (not res!735867) (not e!629476))))

(assert (=> b!1102867 (= res!735867 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34925 _keys!1070)))))

(declare-fun b!1102868 () Bool)

(assert (=> b!1102868 (= e!629476 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130769 (not res!735866)) b!1102867))

(assert (= (and b!1102867 res!735867) b!1102868))

(assert (=> d!130769 m!1023209))

(declare-fun m!1023221 () Bool)

(assert (=> b!1102868 m!1023221))

(assert (=> b!1102778 d!130769))

(declare-fun b!1102912 () Bool)

(declare-fun e!629514 () ListLongMap!15383)

(declare-fun call!46296 () ListLongMap!15383)

(assert (=> b!1102912 (= e!629514 call!46296)))

(declare-fun b!1102913 () Bool)

(declare-fun e!629504 () Bool)

(declare-fun lt!494977 () ListLongMap!15383)

(declare-fun apply!954 (ListLongMap!15383 (_ BitVec 64)) V!41483)

(declare-fun get!17672 (ValueCell!12924 V!41483) V!41483)

(assert (=> b!1102913 (= e!629504 (= (apply!954 lt!494977 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000)) (get!17672 (select (arr!34388 _values!874) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102913 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34924 _values!874)))))

(assert (=> b!1102913 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34925 _keys!1070)))))

(declare-fun bm!46289 () Bool)

(declare-fun call!46297 () ListLongMap!15383)

(assert (=> bm!46289 (= call!46296 call!46297)))

(declare-fun b!1102914 () Bool)

(declare-fun e!629512 () Bool)

(declare-fun call!46292 () Bool)

(assert (=> b!1102914 (= e!629512 (not call!46292))))

(declare-fun b!1102915 () Bool)

(declare-fun e!629513 () Unit!36234)

(declare-fun Unit!36238 () Unit!36234)

(assert (=> b!1102915 (= e!629513 Unit!36238)))

(declare-fun b!1102916 () Bool)

(declare-fun e!629515 () Bool)

(assert (=> b!1102916 (= e!629515 (= (apply!954 lt!494977 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1102917 () Bool)

(declare-fun e!629503 () Bool)

(assert (=> b!1102917 (= e!629503 (validKeyInArray!0 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102918 () Bool)

(declare-fun res!735888 () Bool)

(declare-fun e!629511 () Bool)

(assert (=> b!1102918 (=> (not res!735888) (not e!629511))))

(declare-fun e!629510 () Bool)

(assert (=> b!1102918 (= res!735888 e!629510)))

(declare-fun c!108943 () Bool)

(assert (=> b!1102918 (= c!108943 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!46290 () Bool)

(declare-fun call!46298 () Bool)

(assert (=> bm!46290 (= call!46298 (contains!6410 lt!494977 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102919 () Bool)

(declare-fun e!629505 () ListLongMap!15383)

(assert (=> b!1102919 (= e!629505 call!46296)))

(declare-fun bm!46291 () Bool)

(declare-fun call!46295 () ListLongMap!15383)

(declare-fun call!46294 () ListLongMap!15383)

(assert (=> bm!46291 (= call!46295 call!46294)))

(declare-fun b!1102920 () Bool)

(assert (=> b!1102920 (= e!629510 (not call!46298))))

(declare-fun bm!46292 () Bool)

(declare-fun call!46293 () ListLongMap!15383)

(assert (=> bm!46292 (= call!46294 call!46293)))

(declare-fun b!1102921 () Bool)

(declare-fun e!629508 () Bool)

(assert (=> b!1102921 (= e!629508 e!629504)))

(declare-fun res!735890 () Bool)

(assert (=> b!1102921 (=> (not res!735890) (not e!629504))))

(assert (=> b!1102921 (= res!735890 (contains!6410 lt!494977 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34925 _keys!1070)))))

(declare-fun b!1102922 () Bool)

(declare-fun lt!494966 () Unit!36234)

(assert (=> b!1102922 (= e!629513 lt!494966)))

(declare-fun lt!494976 () ListLongMap!15383)

(assert (=> b!1102922 (= lt!494976 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494982 () (_ BitVec 64))

(assert (=> b!1102922 (= lt!494982 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494971 () (_ BitVec 64))

(assert (=> b!1102922 (= lt!494971 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494975 () Unit!36234)

(declare-fun addStillContains!667 (ListLongMap!15383 (_ BitVec 64) V!41483 (_ BitVec 64)) Unit!36234)

(assert (=> b!1102922 (= lt!494975 (addStillContains!667 lt!494976 lt!494982 zeroValue!831 lt!494971))))

(declare-fun +!3405 (ListLongMap!15383 tuple2!17414) ListLongMap!15383)

(assert (=> b!1102922 (contains!6410 (+!3405 lt!494976 (tuple2!17415 lt!494982 zeroValue!831)) lt!494971)))

(declare-fun lt!494972 () Unit!36234)

(assert (=> b!1102922 (= lt!494972 lt!494975)))

(declare-fun lt!494974 () ListLongMap!15383)

(assert (=> b!1102922 (= lt!494974 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494970 () (_ BitVec 64))

(assert (=> b!1102922 (= lt!494970 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494980 () (_ BitVec 64))

(assert (=> b!1102922 (= lt!494980 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494978 () Unit!36234)

(declare-fun addApplyDifferent!527 (ListLongMap!15383 (_ BitVec 64) V!41483 (_ BitVec 64)) Unit!36234)

(assert (=> b!1102922 (= lt!494978 (addApplyDifferent!527 lt!494974 lt!494970 minValue!831 lt!494980))))

(assert (=> b!1102922 (= (apply!954 (+!3405 lt!494974 (tuple2!17415 lt!494970 minValue!831)) lt!494980) (apply!954 lt!494974 lt!494980))))

(declare-fun lt!494969 () Unit!36234)

(assert (=> b!1102922 (= lt!494969 lt!494978)))

(declare-fun lt!494965 () ListLongMap!15383)

(assert (=> b!1102922 (= lt!494965 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494985 () (_ BitVec 64))

(assert (=> b!1102922 (= lt!494985 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494968 () (_ BitVec 64))

(assert (=> b!1102922 (= lt!494968 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494979 () Unit!36234)

(assert (=> b!1102922 (= lt!494979 (addApplyDifferent!527 lt!494965 lt!494985 zeroValue!831 lt!494968))))

(assert (=> b!1102922 (= (apply!954 (+!3405 lt!494965 (tuple2!17415 lt!494985 zeroValue!831)) lt!494968) (apply!954 lt!494965 lt!494968))))

(declare-fun lt!494981 () Unit!36234)

(assert (=> b!1102922 (= lt!494981 lt!494979)))

(declare-fun lt!494964 () ListLongMap!15383)

(assert (=> b!1102922 (= lt!494964 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494983 () (_ BitVec 64))

(assert (=> b!1102922 (= lt!494983 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494984 () (_ BitVec 64))

(assert (=> b!1102922 (= lt!494984 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1102922 (= lt!494966 (addApplyDifferent!527 lt!494964 lt!494983 minValue!831 lt!494984))))

(assert (=> b!1102922 (= (apply!954 (+!3405 lt!494964 (tuple2!17415 lt!494983 minValue!831)) lt!494984) (apply!954 lt!494964 lt!494984))))

(declare-fun b!1102923 () Bool)

(assert (=> b!1102923 (= e!629505 call!46295)))

(declare-fun d!130771 () Bool)

(assert (=> d!130771 e!629511))

(declare-fun res!735887 () Bool)

(assert (=> d!130771 (=> (not res!735887) (not e!629511))))

(assert (=> d!130771 (= res!735887 (or (bvsge #b00000000000000000000000000000000 (size!34925 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34925 _keys!1070)))))))

(declare-fun lt!494967 () ListLongMap!15383)

(assert (=> d!130771 (= lt!494977 lt!494967)))

(declare-fun lt!494973 () Unit!36234)

(assert (=> d!130771 (= lt!494973 e!629513)))

(declare-fun c!108944 () Bool)

(assert (=> d!130771 (= c!108944 e!629503)))

(declare-fun res!735893 () Bool)

(assert (=> d!130771 (=> (not res!735893) (not e!629503))))

(assert (=> d!130771 (= res!735893 (bvslt #b00000000000000000000000000000000 (size!34925 _keys!1070)))))

(declare-fun e!629507 () ListLongMap!15383)

(assert (=> d!130771 (= lt!494967 e!629507)))

(declare-fun c!108939 () Bool)

(assert (=> d!130771 (= c!108939 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130771 (validMask!0 mask!1414)))

(assert (=> d!130771 (= (getCurrentListMap!4411 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494977)))

(declare-fun b!1102911 () Bool)

(declare-fun e!629509 () Bool)

(assert (=> b!1102911 (= e!629510 e!629509)))

(declare-fun res!735889 () Bool)

(assert (=> b!1102911 (= res!735889 call!46298)))

(assert (=> b!1102911 (=> (not res!735889) (not e!629509))))

(declare-fun b!1102924 () Bool)

(declare-fun e!629506 () Bool)

(assert (=> b!1102924 (= e!629506 (validKeyInArray!0 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102925 () Bool)

(declare-fun c!108940 () Bool)

(assert (=> b!1102925 (= c!108940 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1102925 (= e!629514 e!629505)))

(declare-fun b!1102926 () Bool)

(assert (=> b!1102926 (= e!629511 e!629512)))

(declare-fun c!108942 () Bool)

(assert (=> b!1102926 (= c!108942 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102927 () Bool)

(assert (=> b!1102927 (= e!629512 e!629515)))

(declare-fun res!735891 () Bool)

(assert (=> b!1102927 (= res!735891 call!46292)))

(assert (=> b!1102927 (=> (not res!735891) (not e!629515))))

(declare-fun bm!46293 () Bool)

(assert (=> bm!46293 (= call!46292 (contains!6410 lt!494977 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102928 () Bool)

(declare-fun res!735886 () Bool)

(assert (=> b!1102928 (=> (not res!735886) (not e!629511))))

(assert (=> b!1102928 (= res!735886 e!629508)))

(declare-fun res!735894 () Bool)

(assert (=> b!1102928 (=> res!735894 e!629508)))

(assert (=> b!1102928 (= res!735894 (not e!629506))))

(declare-fun res!735892 () Bool)

(assert (=> b!1102928 (=> (not res!735892) (not e!629506))))

(assert (=> b!1102928 (= res!735892 (bvslt #b00000000000000000000000000000000 (size!34925 _keys!1070)))))

(declare-fun b!1102929 () Bool)

(assert (=> b!1102929 (= e!629507 e!629514)))

(declare-fun c!108941 () Bool)

(assert (=> b!1102929 (= c!108941 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102930 () Bool)

(assert (=> b!1102930 (= e!629507 (+!3405 call!46297 (tuple2!17415 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1102931 () Bool)

(assert (=> b!1102931 (= e!629509 (= (apply!954 lt!494977 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!46294 () Bool)

(assert (=> bm!46294 (= call!46297 (+!3405 (ite c!108939 call!46293 (ite c!108941 call!46294 call!46295)) (ite (or c!108939 c!108941) (tuple2!17415 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17415 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!46295 () Bool)

(assert (=> bm!46295 (= call!46293 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (= (and d!130771 c!108939) b!1102930))

(assert (= (and d!130771 (not c!108939)) b!1102929))

(assert (= (and b!1102929 c!108941) b!1102912))

(assert (= (and b!1102929 (not c!108941)) b!1102925))

(assert (= (and b!1102925 c!108940) b!1102919))

(assert (= (and b!1102925 (not c!108940)) b!1102923))

(assert (= (or b!1102919 b!1102923) bm!46291))

(assert (= (or b!1102912 bm!46291) bm!46292))

(assert (= (or b!1102912 b!1102919) bm!46289))

(assert (= (or b!1102930 bm!46292) bm!46295))

(assert (= (or b!1102930 bm!46289) bm!46294))

(assert (= (and d!130771 res!735893) b!1102917))

(assert (= (and d!130771 c!108944) b!1102922))

(assert (= (and d!130771 (not c!108944)) b!1102915))

(assert (= (and d!130771 res!735887) b!1102928))

(assert (= (and b!1102928 res!735892) b!1102924))

(assert (= (and b!1102928 (not res!735894)) b!1102921))

(assert (= (and b!1102921 res!735890) b!1102913))

(assert (= (and b!1102928 res!735886) b!1102918))

(assert (= (and b!1102918 c!108943) b!1102911))

(assert (= (and b!1102918 (not c!108943)) b!1102920))

(assert (= (and b!1102911 res!735889) b!1102931))

(assert (= (or b!1102911 b!1102920) bm!46290))

(assert (= (and b!1102918 res!735888) b!1102926))

(assert (= (and b!1102926 c!108942) b!1102927))

(assert (= (and b!1102926 (not c!108942)) b!1102914))

(assert (= (and b!1102927 res!735891) b!1102916))

(assert (= (or b!1102927 b!1102914) bm!46293))

(declare-fun b_lambda!18211 () Bool)

(assert (=> (not b_lambda!18211) (not b!1102913)))

(assert (=> b!1102913 t!34293))

(declare-fun b_and!37259 () Bool)

(assert (= b_and!37253 (and (=> t!34293 result!16711) b_and!37259)))

(assert (=> bm!46295 m!1023123))

(declare-fun m!1023223 () Bool)

(assert (=> b!1102916 m!1023223))

(assert (=> b!1102924 m!1023209))

(assert (=> b!1102924 m!1023209))

(assert (=> b!1102924 m!1023217))

(declare-fun m!1023225 () Bool)

(assert (=> b!1102931 m!1023225))

(assert (=> b!1102921 m!1023209))

(assert (=> b!1102921 m!1023209))

(declare-fun m!1023227 () Bool)

(assert (=> b!1102921 m!1023227))

(assert (=> d!130771 m!1023129))

(declare-fun m!1023229 () Bool)

(assert (=> bm!46290 m!1023229))

(declare-fun m!1023231 () Bool)

(assert (=> bm!46294 m!1023231))

(assert (=> b!1102917 m!1023209))

(assert (=> b!1102917 m!1023209))

(assert (=> b!1102917 m!1023217))

(declare-fun m!1023233 () Bool)

(assert (=> b!1102922 m!1023233))

(declare-fun m!1023235 () Bool)

(assert (=> b!1102922 m!1023235))

(declare-fun m!1023237 () Bool)

(assert (=> b!1102922 m!1023237))

(declare-fun m!1023239 () Bool)

(assert (=> b!1102922 m!1023239))

(declare-fun m!1023241 () Bool)

(assert (=> b!1102922 m!1023241))

(assert (=> b!1102922 m!1023235))

(declare-fun m!1023243 () Bool)

(assert (=> b!1102922 m!1023243))

(assert (=> b!1102922 m!1023123))

(declare-fun m!1023245 () Bool)

(assert (=> b!1102922 m!1023245))

(assert (=> b!1102922 m!1023241))

(declare-fun m!1023247 () Bool)

(assert (=> b!1102922 m!1023247))

(declare-fun m!1023249 () Bool)

(assert (=> b!1102922 m!1023249))

(declare-fun m!1023251 () Bool)

(assert (=> b!1102922 m!1023251))

(declare-fun m!1023253 () Bool)

(assert (=> b!1102922 m!1023253))

(declare-fun m!1023255 () Bool)

(assert (=> b!1102922 m!1023255))

(assert (=> b!1102922 m!1023209))

(declare-fun m!1023257 () Bool)

(assert (=> b!1102922 m!1023257))

(assert (=> b!1102922 m!1023251))

(declare-fun m!1023259 () Bool)

(assert (=> b!1102922 m!1023259))

(assert (=> b!1102922 m!1023257))

(declare-fun m!1023261 () Bool)

(assert (=> b!1102922 m!1023261))

(assert (=> b!1102913 m!1023209))

(declare-fun m!1023263 () Bool)

(assert (=> b!1102913 m!1023263))

(assert (=> b!1102913 m!1023109))

(declare-fun m!1023265 () Bool)

(assert (=> b!1102913 m!1023265))

(assert (=> b!1102913 m!1023209))

(assert (=> b!1102913 m!1023265))

(assert (=> b!1102913 m!1023109))

(declare-fun m!1023267 () Bool)

(assert (=> b!1102913 m!1023267))

(declare-fun m!1023269 () Bool)

(assert (=> bm!46293 m!1023269))

(declare-fun m!1023271 () Bool)

(assert (=> b!1102930 m!1023271))

(assert (=> b!1102778 d!130771))

(declare-fun b!1102956 () Bool)

(declare-fun e!629530 () Bool)

(declare-fun lt!495006 () ListLongMap!15383)

(assert (=> b!1102956 (= e!629530 (= lt!495006 (getCurrentListMapNoExtraKeys!4207 lt!494865 lt!494868 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1102957 () Bool)

(declare-fun e!629531 () Bool)

(assert (=> b!1102957 (= e!629531 (validKeyInArray!0 (select (arr!34389 lt!494865) #b00000000000000000000000000000000)))))

(assert (=> b!1102957 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1102958 () Bool)

(declare-fun isEmpty!972 (ListLongMap!15383) Bool)

(assert (=> b!1102958 (= e!629530 (isEmpty!972 lt!495006))))

(declare-fun b!1102959 () Bool)

(declare-fun res!735905 () Bool)

(declare-fun e!629534 () Bool)

(assert (=> b!1102959 (=> (not res!735905) (not e!629534))))

(assert (=> b!1102959 (= res!735905 (not (contains!6410 lt!495006 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1102960 () Bool)

(declare-fun e!629536 () Bool)

(assert (=> b!1102960 (= e!629534 e!629536)))

(declare-fun c!108954 () Bool)

(assert (=> b!1102960 (= c!108954 e!629531)))

(declare-fun res!735904 () Bool)

(assert (=> b!1102960 (=> (not res!735904) (not e!629531))))

(assert (=> b!1102960 (= res!735904 (bvslt #b00000000000000000000000000000000 (size!34925 lt!494865)))))

(declare-fun b!1102961 () Bool)

(declare-fun e!629533 () ListLongMap!15383)

(assert (=> b!1102961 (= e!629533 (ListLongMap!15384 Nil!24028))))

(declare-fun b!1102962 () Bool)

(declare-fun lt!495004 () Unit!36234)

(declare-fun lt!495003 () Unit!36234)

(assert (=> b!1102962 (= lt!495004 lt!495003)))

(declare-fun lt!495000 () (_ BitVec 64))

(declare-fun lt!495001 () (_ BitVec 64))

(declare-fun lt!495005 () V!41483)

(declare-fun lt!495002 () ListLongMap!15383)

(assert (=> b!1102962 (not (contains!6410 (+!3405 lt!495002 (tuple2!17415 lt!495001 lt!495005)) lt!495000))))

(declare-fun addStillNotContains!282 (ListLongMap!15383 (_ BitVec 64) V!41483 (_ BitVec 64)) Unit!36234)

(assert (=> b!1102962 (= lt!495003 (addStillNotContains!282 lt!495002 lt!495001 lt!495005 lt!495000))))

(assert (=> b!1102962 (= lt!495000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1102962 (= lt!495005 (get!17672 (select (arr!34388 lt!494868) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1102962 (= lt!495001 (select (arr!34389 lt!494865) #b00000000000000000000000000000000))))

(declare-fun call!46301 () ListLongMap!15383)

(assert (=> b!1102962 (= lt!495002 call!46301)))

(declare-fun e!629532 () ListLongMap!15383)

(assert (=> b!1102962 (= e!629532 (+!3405 call!46301 (tuple2!17415 (select (arr!34389 lt!494865) #b00000000000000000000000000000000) (get!17672 (select (arr!34388 lt!494868) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1102963 () Bool)

(assert (=> b!1102963 (= e!629536 e!629530)))

(declare-fun c!108955 () Bool)

(assert (=> b!1102963 (= c!108955 (bvslt #b00000000000000000000000000000000 (size!34925 lt!494865)))))

(declare-fun b!1102964 () Bool)

(assert (=> b!1102964 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34925 lt!494865)))))

(assert (=> b!1102964 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34924 lt!494868)))))

(declare-fun e!629535 () Bool)

(assert (=> b!1102964 (= e!629535 (= (apply!954 lt!495006 (select (arr!34389 lt!494865) #b00000000000000000000000000000000)) (get!17672 (select (arr!34388 lt!494868) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1102965 () Bool)

(assert (=> b!1102965 (= e!629532 call!46301)))

(declare-fun bm!46298 () Bool)

(assert (=> bm!46298 (= call!46301 (getCurrentListMapNoExtraKeys!4207 lt!494865 lt!494868 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1102966 () Bool)

(assert (=> b!1102966 (= e!629536 e!629535)))

(assert (=> b!1102966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34925 lt!494865)))))

(declare-fun res!735903 () Bool)

(assert (=> b!1102966 (= res!735903 (contains!6410 lt!495006 (select (arr!34389 lt!494865) #b00000000000000000000000000000000)))))

(assert (=> b!1102966 (=> (not res!735903) (not e!629535))))

(declare-fun d!130773 () Bool)

(assert (=> d!130773 e!629534))

(declare-fun res!735906 () Bool)

(assert (=> d!130773 (=> (not res!735906) (not e!629534))))

(assert (=> d!130773 (= res!735906 (not (contains!6410 lt!495006 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130773 (= lt!495006 e!629533)))

(declare-fun c!108956 () Bool)

(assert (=> d!130773 (= c!108956 (bvsge #b00000000000000000000000000000000 (size!34925 lt!494865)))))

(assert (=> d!130773 (validMask!0 mask!1414)))

(assert (=> d!130773 (= (getCurrentListMapNoExtraKeys!4207 lt!494865 lt!494868 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!495006)))

(declare-fun b!1102967 () Bool)

(assert (=> b!1102967 (= e!629533 e!629532)))

(declare-fun c!108953 () Bool)

(assert (=> b!1102967 (= c!108953 (validKeyInArray!0 (select (arr!34389 lt!494865) #b00000000000000000000000000000000)))))

(assert (= (and d!130773 c!108956) b!1102961))

(assert (= (and d!130773 (not c!108956)) b!1102967))

(assert (= (and b!1102967 c!108953) b!1102962))

(assert (= (and b!1102967 (not c!108953)) b!1102965))

(assert (= (or b!1102962 b!1102965) bm!46298))

(assert (= (and d!130773 res!735906) b!1102959))

(assert (= (and b!1102959 res!735905) b!1102960))

(assert (= (and b!1102960 res!735904) b!1102957))

(assert (= (and b!1102960 c!108954) b!1102966))

(assert (= (and b!1102960 (not c!108954)) b!1102963))

(assert (= (and b!1102966 res!735903) b!1102964))

(assert (= (and b!1102963 c!108955) b!1102956))

(assert (= (and b!1102963 (not c!108955)) b!1102958))

(declare-fun b_lambda!18213 () Bool)

(assert (=> (not b_lambda!18213) (not b!1102962)))

(assert (=> b!1102962 t!34293))

(declare-fun b_and!37261 () Bool)

(assert (= b_and!37259 (and (=> t!34293 result!16711) b_and!37261)))

(declare-fun b_lambda!18215 () Bool)

(assert (=> (not b_lambda!18215) (not b!1102964)))

(assert (=> b!1102964 t!34293))

(declare-fun b_and!37263 () Bool)

(assert (= b_and!37261 (and (=> t!34293 result!16711) b_and!37263)))

(assert (=> b!1102966 m!1023189))

(assert (=> b!1102966 m!1023189))

(declare-fun m!1023273 () Bool)

(assert (=> b!1102966 m!1023273))

(declare-fun m!1023275 () Bool)

(assert (=> d!130773 m!1023275))

(assert (=> d!130773 m!1023129))

(assert (=> b!1102957 m!1023189))

(assert (=> b!1102957 m!1023189))

(assert (=> b!1102957 m!1023193))

(declare-fun m!1023277 () Bool)

(assert (=> b!1102958 m!1023277))

(declare-fun m!1023279 () Bool)

(assert (=> b!1102959 m!1023279))

(declare-fun m!1023281 () Bool)

(assert (=> b!1102956 m!1023281))

(assert (=> b!1102967 m!1023189))

(assert (=> b!1102967 m!1023189))

(assert (=> b!1102967 m!1023193))

(assert (=> b!1102964 m!1023109))

(assert (=> b!1102964 m!1023189))

(declare-fun m!1023283 () Bool)

(assert (=> b!1102964 m!1023283))

(declare-fun m!1023285 () Bool)

(assert (=> b!1102964 m!1023285))

(assert (=> b!1102964 m!1023109))

(declare-fun m!1023287 () Bool)

(assert (=> b!1102964 m!1023287))

(assert (=> b!1102964 m!1023285))

(assert (=> b!1102964 m!1023189))

(declare-fun m!1023289 () Bool)

(assert (=> b!1102962 m!1023289))

(assert (=> b!1102962 m!1023109))

(declare-fun m!1023291 () Bool)

(assert (=> b!1102962 m!1023291))

(declare-fun m!1023293 () Bool)

(assert (=> b!1102962 m!1023293))

(assert (=> b!1102962 m!1023285))

(assert (=> b!1102962 m!1023109))

(assert (=> b!1102962 m!1023287))

(assert (=> b!1102962 m!1023285))

(assert (=> b!1102962 m!1023189))

(declare-fun m!1023295 () Bool)

(assert (=> b!1102962 m!1023295))

(assert (=> b!1102962 m!1023291))

(assert (=> bm!46298 m!1023281))

(assert (=> b!1102778 d!130773))

(declare-fun b!1102969 () Bool)

(declare-fun e!629548 () ListLongMap!15383)

(declare-fun call!46306 () ListLongMap!15383)

(assert (=> b!1102969 (= e!629548 call!46306)))

(declare-fun lt!495020 () ListLongMap!15383)

(declare-fun b!1102970 () Bool)

(declare-fun e!629538 () Bool)

(assert (=> b!1102970 (= e!629538 (= (apply!954 lt!495020 (select (arr!34389 lt!494865) #b00000000000000000000000000000000)) (get!17672 (select (arr!34388 lt!494868) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102970 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34924 lt!494868)))))

(assert (=> b!1102970 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34925 lt!494865)))))

(declare-fun bm!46299 () Bool)

(declare-fun call!46307 () ListLongMap!15383)

(assert (=> bm!46299 (= call!46306 call!46307)))

(declare-fun b!1102971 () Bool)

(declare-fun e!629546 () Bool)

(declare-fun call!46302 () Bool)

(assert (=> b!1102971 (= e!629546 (not call!46302))))

(declare-fun b!1102972 () Bool)

(declare-fun e!629547 () Unit!36234)

(declare-fun Unit!36239 () Unit!36234)

(assert (=> b!1102972 (= e!629547 Unit!36239)))

(declare-fun b!1102973 () Bool)

(declare-fun e!629549 () Bool)

(assert (=> b!1102973 (= e!629549 (= (apply!954 lt!495020 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1102974 () Bool)

(declare-fun e!629537 () Bool)

(assert (=> b!1102974 (= e!629537 (validKeyInArray!0 (select (arr!34389 lt!494865) #b00000000000000000000000000000000)))))

(declare-fun b!1102975 () Bool)

(declare-fun res!735909 () Bool)

(declare-fun e!629545 () Bool)

(assert (=> b!1102975 (=> (not res!735909) (not e!629545))))

(declare-fun e!629544 () Bool)

(assert (=> b!1102975 (= res!735909 e!629544)))

(declare-fun c!108961 () Bool)

(assert (=> b!1102975 (= c!108961 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!46300 () Bool)

(declare-fun call!46308 () Bool)

(assert (=> bm!46300 (= call!46308 (contains!6410 lt!495020 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102976 () Bool)

(declare-fun e!629539 () ListLongMap!15383)

(assert (=> b!1102976 (= e!629539 call!46306)))

(declare-fun bm!46301 () Bool)

(declare-fun call!46305 () ListLongMap!15383)

(declare-fun call!46304 () ListLongMap!15383)

(assert (=> bm!46301 (= call!46305 call!46304)))

(declare-fun b!1102977 () Bool)

(assert (=> b!1102977 (= e!629544 (not call!46308))))

(declare-fun bm!46302 () Bool)

(declare-fun call!46303 () ListLongMap!15383)

(assert (=> bm!46302 (= call!46304 call!46303)))

(declare-fun b!1102978 () Bool)

(declare-fun e!629542 () Bool)

(assert (=> b!1102978 (= e!629542 e!629538)))

(declare-fun res!735911 () Bool)

(assert (=> b!1102978 (=> (not res!735911) (not e!629538))))

(assert (=> b!1102978 (= res!735911 (contains!6410 lt!495020 (select (arr!34389 lt!494865) #b00000000000000000000000000000000)))))

(assert (=> b!1102978 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34925 lt!494865)))))

(declare-fun b!1102979 () Bool)

(declare-fun lt!495009 () Unit!36234)

(assert (=> b!1102979 (= e!629547 lt!495009)))

(declare-fun lt!495019 () ListLongMap!15383)

(assert (=> b!1102979 (= lt!495019 (getCurrentListMapNoExtraKeys!4207 lt!494865 lt!494868 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495025 () (_ BitVec 64))

(assert (=> b!1102979 (= lt!495025 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495014 () (_ BitVec 64))

(assert (=> b!1102979 (= lt!495014 (select (arr!34389 lt!494865) #b00000000000000000000000000000000))))

(declare-fun lt!495018 () Unit!36234)

(assert (=> b!1102979 (= lt!495018 (addStillContains!667 lt!495019 lt!495025 zeroValue!831 lt!495014))))

(assert (=> b!1102979 (contains!6410 (+!3405 lt!495019 (tuple2!17415 lt!495025 zeroValue!831)) lt!495014)))

(declare-fun lt!495015 () Unit!36234)

(assert (=> b!1102979 (= lt!495015 lt!495018)))

(declare-fun lt!495017 () ListLongMap!15383)

(assert (=> b!1102979 (= lt!495017 (getCurrentListMapNoExtraKeys!4207 lt!494865 lt!494868 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495013 () (_ BitVec 64))

(assert (=> b!1102979 (= lt!495013 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495023 () (_ BitVec 64))

(assert (=> b!1102979 (= lt!495023 (select (arr!34389 lt!494865) #b00000000000000000000000000000000))))

(declare-fun lt!495021 () Unit!36234)

(assert (=> b!1102979 (= lt!495021 (addApplyDifferent!527 lt!495017 lt!495013 minValue!831 lt!495023))))

(assert (=> b!1102979 (= (apply!954 (+!3405 lt!495017 (tuple2!17415 lt!495013 minValue!831)) lt!495023) (apply!954 lt!495017 lt!495023))))

(declare-fun lt!495012 () Unit!36234)

(assert (=> b!1102979 (= lt!495012 lt!495021)))

(declare-fun lt!495008 () ListLongMap!15383)

(assert (=> b!1102979 (= lt!495008 (getCurrentListMapNoExtraKeys!4207 lt!494865 lt!494868 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495028 () (_ BitVec 64))

(assert (=> b!1102979 (= lt!495028 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495011 () (_ BitVec 64))

(assert (=> b!1102979 (= lt!495011 (select (arr!34389 lt!494865) #b00000000000000000000000000000000))))

(declare-fun lt!495022 () Unit!36234)

(assert (=> b!1102979 (= lt!495022 (addApplyDifferent!527 lt!495008 lt!495028 zeroValue!831 lt!495011))))

(assert (=> b!1102979 (= (apply!954 (+!3405 lt!495008 (tuple2!17415 lt!495028 zeroValue!831)) lt!495011) (apply!954 lt!495008 lt!495011))))

(declare-fun lt!495024 () Unit!36234)

(assert (=> b!1102979 (= lt!495024 lt!495022)))

(declare-fun lt!495007 () ListLongMap!15383)

(assert (=> b!1102979 (= lt!495007 (getCurrentListMapNoExtraKeys!4207 lt!494865 lt!494868 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495026 () (_ BitVec 64))

(assert (=> b!1102979 (= lt!495026 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495027 () (_ BitVec 64))

(assert (=> b!1102979 (= lt!495027 (select (arr!34389 lt!494865) #b00000000000000000000000000000000))))

(assert (=> b!1102979 (= lt!495009 (addApplyDifferent!527 lt!495007 lt!495026 minValue!831 lt!495027))))

(assert (=> b!1102979 (= (apply!954 (+!3405 lt!495007 (tuple2!17415 lt!495026 minValue!831)) lt!495027) (apply!954 lt!495007 lt!495027))))

(declare-fun b!1102980 () Bool)

(assert (=> b!1102980 (= e!629539 call!46305)))

(declare-fun d!130775 () Bool)

(assert (=> d!130775 e!629545))

(declare-fun res!735908 () Bool)

(assert (=> d!130775 (=> (not res!735908) (not e!629545))))

(assert (=> d!130775 (= res!735908 (or (bvsge #b00000000000000000000000000000000 (size!34925 lt!494865)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34925 lt!494865)))))))

(declare-fun lt!495010 () ListLongMap!15383)

(assert (=> d!130775 (= lt!495020 lt!495010)))

(declare-fun lt!495016 () Unit!36234)

(assert (=> d!130775 (= lt!495016 e!629547)))

(declare-fun c!108962 () Bool)

(assert (=> d!130775 (= c!108962 e!629537)))

(declare-fun res!735914 () Bool)

(assert (=> d!130775 (=> (not res!735914) (not e!629537))))

(assert (=> d!130775 (= res!735914 (bvslt #b00000000000000000000000000000000 (size!34925 lt!494865)))))

(declare-fun e!629541 () ListLongMap!15383)

(assert (=> d!130775 (= lt!495010 e!629541)))

(declare-fun c!108957 () Bool)

(assert (=> d!130775 (= c!108957 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130775 (validMask!0 mask!1414)))

(assert (=> d!130775 (= (getCurrentListMap!4411 lt!494865 lt!494868 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!495020)))

(declare-fun b!1102968 () Bool)

(declare-fun e!629543 () Bool)

(assert (=> b!1102968 (= e!629544 e!629543)))

(declare-fun res!735910 () Bool)

(assert (=> b!1102968 (= res!735910 call!46308)))

(assert (=> b!1102968 (=> (not res!735910) (not e!629543))))

(declare-fun b!1102981 () Bool)

(declare-fun e!629540 () Bool)

(assert (=> b!1102981 (= e!629540 (validKeyInArray!0 (select (arr!34389 lt!494865) #b00000000000000000000000000000000)))))

(declare-fun b!1102982 () Bool)

(declare-fun c!108958 () Bool)

(assert (=> b!1102982 (= c!108958 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1102982 (= e!629548 e!629539)))

(declare-fun b!1102983 () Bool)

(assert (=> b!1102983 (= e!629545 e!629546)))

(declare-fun c!108960 () Bool)

(assert (=> b!1102983 (= c!108960 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102984 () Bool)

(assert (=> b!1102984 (= e!629546 e!629549)))

(declare-fun res!735912 () Bool)

(assert (=> b!1102984 (= res!735912 call!46302)))

(assert (=> b!1102984 (=> (not res!735912) (not e!629549))))

(declare-fun bm!46303 () Bool)

(assert (=> bm!46303 (= call!46302 (contains!6410 lt!495020 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102985 () Bool)

(declare-fun res!735907 () Bool)

(assert (=> b!1102985 (=> (not res!735907) (not e!629545))))

(assert (=> b!1102985 (= res!735907 e!629542)))

(declare-fun res!735915 () Bool)

(assert (=> b!1102985 (=> res!735915 e!629542)))

(assert (=> b!1102985 (= res!735915 (not e!629540))))

(declare-fun res!735913 () Bool)

(assert (=> b!1102985 (=> (not res!735913) (not e!629540))))

(assert (=> b!1102985 (= res!735913 (bvslt #b00000000000000000000000000000000 (size!34925 lt!494865)))))

(declare-fun b!1102986 () Bool)

(assert (=> b!1102986 (= e!629541 e!629548)))

(declare-fun c!108959 () Bool)

(assert (=> b!1102986 (= c!108959 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102987 () Bool)

(assert (=> b!1102987 (= e!629541 (+!3405 call!46307 (tuple2!17415 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1102988 () Bool)

(assert (=> b!1102988 (= e!629543 (= (apply!954 lt!495020 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!46304 () Bool)

(assert (=> bm!46304 (= call!46307 (+!3405 (ite c!108957 call!46303 (ite c!108959 call!46304 call!46305)) (ite (or c!108957 c!108959) (tuple2!17415 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17415 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!46305 () Bool)

(assert (=> bm!46305 (= call!46303 (getCurrentListMapNoExtraKeys!4207 lt!494865 lt!494868 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (= (and d!130775 c!108957) b!1102987))

(assert (= (and d!130775 (not c!108957)) b!1102986))

(assert (= (and b!1102986 c!108959) b!1102969))

(assert (= (and b!1102986 (not c!108959)) b!1102982))

(assert (= (and b!1102982 c!108958) b!1102976))

(assert (= (and b!1102982 (not c!108958)) b!1102980))

(assert (= (or b!1102976 b!1102980) bm!46301))

(assert (= (or b!1102969 bm!46301) bm!46302))

(assert (= (or b!1102969 b!1102976) bm!46299))

(assert (= (or b!1102987 bm!46302) bm!46305))

(assert (= (or b!1102987 bm!46299) bm!46304))

(assert (= (and d!130775 res!735914) b!1102974))

(assert (= (and d!130775 c!108962) b!1102979))

(assert (= (and d!130775 (not c!108962)) b!1102972))

(assert (= (and d!130775 res!735908) b!1102985))

(assert (= (and b!1102985 res!735913) b!1102981))

(assert (= (and b!1102985 (not res!735915)) b!1102978))

(assert (= (and b!1102978 res!735911) b!1102970))

(assert (= (and b!1102985 res!735907) b!1102975))

(assert (= (and b!1102975 c!108961) b!1102968))

(assert (= (and b!1102975 (not c!108961)) b!1102977))

(assert (= (and b!1102968 res!735910) b!1102988))

(assert (= (or b!1102968 b!1102977) bm!46300))

(assert (= (and b!1102975 res!735909) b!1102983))

(assert (= (and b!1102983 c!108960) b!1102984))

(assert (= (and b!1102983 (not c!108960)) b!1102971))

(assert (= (and b!1102984 res!735912) b!1102973))

(assert (= (or b!1102984 b!1102971) bm!46303))

(declare-fun b_lambda!18217 () Bool)

(assert (=> (not b_lambda!18217) (not b!1102970)))

(assert (=> b!1102970 t!34293))

(declare-fun b_and!37265 () Bool)

(assert (= b_and!37263 (and (=> t!34293 result!16711) b_and!37265)))

(assert (=> bm!46305 m!1023111))

(declare-fun m!1023297 () Bool)

(assert (=> b!1102973 m!1023297))

(assert (=> b!1102981 m!1023189))

(assert (=> b!1102981 m!1023189))

(assert (=> b!1102981 m!1023193))

(declare-fun m!1023299 () Bool)

(assert (=> b!1102988 m!1023299))

(assert (=> b!1102978 m!1023189))

(assert (=> b!1102978 m!1023189))

(declare-fun m!1023301 () Bool)

(assert (=> b!1102978 m!1023301))

(assert (=> d!130775 m!1023129))

(declare-fun m!1023303 () Bool)

(assert (=> bm!46300 m!1023303))

(declare-fun m!1023305 () Bool)

(assert (=> bm!46304 m!1023305))

(assert (=> b!1102974 m!1023189))

(assert (=> b!1102974 m!1023189))

(assert (=> b!1102974 m!1023193))

(declare-fun m!1023307 () Bool)

(assert (=> b!1102979 m!1023307))

(declare-fun m!1023309 () Bool)

(assert (=> b!1102979 m!1023309))

(declare-fun m!1023311 () Bool)

(assert (=> b!1102979 m!1023311))

(declare-fun m!1023313 () Bool)

(assert (=> b!1102979 m!1023313))

(declare-fun m!1023315 () Bool)

(assert (=> b!1102979 m!1023315))

(assert (=> b!1102979 m!1023309))

(declare-fun m!1023317 () Bool)

(assert (=> b!1102979 m!1023317))

(assert (=> b!1102979 m!1023111))

(declare-fun m!1023319 () Bool)

(assert (=> b!1102979 m!1023319))

(assert (=> b!1102979 m!1023315))

(declare-fun m!1023321 () Bool)

(assert (=> b!1102979 m!1023321))

(declare-fun m!1023323 () Bool)

(assert (=> b!1102979 m!1023323))

(declare-fun m!1023325 () Bool)

(assert (=> b!1102979 m!1023325))

(declare-fun m!1023327 () Bool)

(assert (=> b!1102979 m!1023327))

(declare-fun m!1023329 () Bool)

(assert (=> b!1102979 m!1023329))

(assert (=> b!1102979 m!1023189))

(declare-fun m!1023331 () Bool)

(assert (=> b!1102979 m!1023331))

(assert (=> b!1102979 m!1023325))

(declare-fun m!1023333 () Bool)

(assert (=> b!1102979 m!1023333))

(assert (=> b!1102979 m!1023331))

(declare-fun m!1023335 () Bool)

(assert (=> b!1102979 m!1023335))

(assert (=> b!1102970 m!1023189))

(declare-fun m!1023337 () Bool)

(assert (=> b!1102970 m!1023337))

(assert (=> b!1102970 m!1023109))

(assert (=> b!1102970 m!1023285))

(assert (=> b!1102970 m!1023189))

(assert (=> b!1102970 m!1023285))

(assert (=> b!1102970 m!1023109))

(assert (=> b!1102970 m!1023287))

(declare-fun m!1023339 () Bool)

(assert (=> bm!46303 m!1023339))

(declare-fun m!1023341 () Bool)

(assert (=> b!1102987 m!1023341))

(assert (=> b!1102778 d!130775))

(declare-fun call!46313 () ListLongMap!15383)

(declare-fun bm!46310 () Bool)

(assert (=> bm!46310 (= call!46313 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1102995 () Bool)

(declare-fun e!629554 () Bool)

(declare-fun call!46314 () ListLongMap!15383)

(assert (=> b!1102995 (= e!629554 (= call!46314 call!46313))))

(assert (=> b!1102995 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34924 _values!874)))))

(declare-fun bm!46311 () Bool)

(assert (=> bm!46311 (= call!46314 (getCurrentListMapNoExtraKeys!4207 (array!71458 (store (arr!34389 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34925 _keys!1070)) (array!71456 (store (arr!34388 _values!874) i!650 (ValueCellFull!12924 (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34924 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1102996 () Bool)

(declare-fun e!629555 () Bool)

(assert (=> b!1102996 (= e!629555 e!629554)))

(declare-fun c!108965 () Bool)

(assert (=> b!1102996 (= c!108965 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun b!1102997 () Bool)

(assert (=> b!1102997 (= e!629554 (= call!46314 (-!990 call!46313 k0!904)))))

(assert (=> b!1102997 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34924 _values!874)))))

(declare-fun d!130777 () Bool)

(assert (=> d!130777 e!629555))

(declare-fun res!735918 () Bool)

(assert (=> d!130777 (=> (not res!735918) (not e!629555))))

(assert (=> d!130777 (= res!735918 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34925 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34925 _keys!1070))))))))

(declare-fun lt!495031 () Unit!36234)

(declare-fun choose!1773 (array!71457 array!71455 (_ BitVec 32) (_ BitVec 32) V!41483 V!41483 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36234)

(assert (=> d!130777 (= lt!495031 (choose!1773 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130777 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34925 _keys!1070)))))

(assert (=> d!130777 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!495031)))

(assert (= (and d!130777 res!735918) b!1102996))

(assert (= (and b!1102996 c!108965) b!1102997))

(assert (= (and b!1102996 (not c!108965)) b!1102995))

(assert (= (or b!1102997 b!1102995) bm!46310))

(assert (= (or b!1102997 b!1102995) bm!46311))

(declare-fun b_lambda!18219 () Bool)

(assert (=> (not b_lambda!18219) (not bm!46311)))

(assert (=> bm!46311 t!34293))

(declare-fun b_and!37267 () Bool)

(assert (= b_and!37265 (and (=> t!34293 result!16711) b_and!37267)))

(assert (=> bm!46310 m!1023123))

(assert (=> bm!46311 m!1023107))

(assert (=> bm!46311 m!1023109))

(assert (=> bm!46311 m!1023115))

(declare-fun m!1023343 () Bool)

(assert (=> bm!46311 m!1023343))

(declare-fun m!1023345 () Bool)

(assert (=> b!1102997 m!1023345))

(declare-fun m!1023347 () Bool)

(assert (=> d!130777 m!1023347))

(assert (=> b!1102778 d!130777))

(declare-fun d!130779 () Bool)

(declare-fun lt!495032 () ListLongMap!15383)

(assert (=> d!130779 (not (contains!6410 lt!495032 k0!904))))

(assert (=> d!130779 (= lt!495032 (ListLongMap!15384 (removeStrictlySorted!88 (toList!7707 lt!494870) k0!904)))))

(assert (=> d!130779 (= (-!990 lt!494870 k0!904) lt!495032)))

(declare-fun bs!32354 () Bool)

(assert (= bs!32354 d!130779))

(declare-fun m!1023349 () Bool)

(assert (=> bs!32354 m!1023349))

(declare-fun m!1023351 () Bool)

(assert (=> bs!32354 m!1023351))

(assert (=> b!1102778 d!130779))

(declare-fun e!629556 () Bool)

(declare-fun b!1102998 () Bool)

(declare-fun lt!495039 () ListLongMap!15383)

(assert (=> b!1102998 (= e!629556 (= lt!495039 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1102999 () Bool)

(declare-fun e!629557 () Bool)

(assert (=> b!1102999 (= e!629557 (validKeyInArray!0 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102999 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1103000 () Bool)

(assert (=> b!1103000 (= e!629556 (isEmpty!972 lt!495039))))

(declare-fun b!1103001 () Bool)

(declare-fun res!735921 () Bool)

(declare-fun e!629560 () Bool)

(assert (=> b!1103001 (=> (not res!735921) (not e!629560))))

(assert (=> b!1103001 (= res!735921 (not (contains!6410 lt!495039 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1103002 () Bool)

(declare-fun e!629562 () Bool)

(assert (=> b!1103002 (= e!629560 e!629562)))

(declare-fun c!108967 () Bool)

(assert (=> b!1103002 (= c!108967 e!629557)))

(declare-fun res!735920 () Bool)

(assert (=> b!1103002 (=> (not res!735920) (not e!629557))))

(assert (=> b!1103002 (= res!735920 (bvslt #b00000000000000000000000000000000 (size!34925 _keys!1070)))))

(declare-fun b!1103003 () Bool)

(declare-fun e!629559 () ListLongMap!15383)

(assert (=> b!1103003 (= e!629559 (ListLongMap!15384 Nil!24028))))

(declare-fun b!1103004 () Bool)

(declare-fun lt!495037 () Unit!36234)

(declare-fun lt!495036 () Unit!36234)

(assert (=> b!1103004 (= lt!495037 lt!495036)))

(declare-fun lt!495033 () (_ BitVec 64))

(declare-fun lt!495038 () V!41483)

(declare-fun lt!495035 () ListLongMap!15383)

(declare-fun lt!495034 () (_ BitVec 64))

(assert (=> b!1103004 (not (contains!6410 (+!3405 lt!495035 (tuple2!17415 lt!495034 lt!495038)) lt!495033))))

(assert (=> b!1103004 (= lt!495036 (addStillNotContains!282 lt!495035 lt!495034 lt!495038 lt!495033))))

(assert (=> b!1103004 (= lt!495033 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1103004 (= lt!495038 (get!17672 (select (arr!34388 _values!874) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1103004 (= lt!495034 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun call!46315 () ListLongMap!15383)

(assert (=> b!1103004 (= lt!495035 call!46315)))

(declare-fun e!629558 () ListLongMap!15383)

(assert (=> b!1103004 (= e!629558 (+!3405 call!46315 (tuple2!17415 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000) (get!17672 (select (arr!34388 _values!874) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1103005 () Bool)

(assert (=> b!1103005 (= e!629562 e!629556)))

(declare-fun c!108968 () Bool)

(assert (=> b!1103005 (= c!108968 (bvslt #b00000000000000000000000000000000 (size!34925 _keys!1070)))))

(declare-fun b!1103006 () Bool)

(assert (=> b!1103006 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34925 _keys!1070)))))

(assert (=> b!1103006 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34924 _values!874)))))

(declare-fun e!629561 () Bool)

(assert (=> b!1103006 (= e!629561 (= (apply!954 lt!495039 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000)) (get!17672 (select (arr!34388 _values!874) #b00000000000000000000000000000000) (dynLambda!2342 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1103007 () Bool)

(assert (=> b!1103007 (= e!629558 call!46315)))

(declare-fun bm!46312 () Bool)

(assert (=> bm!46312 (= call!46315 (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1103008 () Bool)

(assert (=> b!1103008 (= e!629562 e!629561)))

(assert (=> b!1103008 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34925 _keys!1070)))))

(declare-fun res!735919 () Bool)

(assert (=> b!1103008 (= res!735919 (contains!6410 lt!495039 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1103008 (=> (not res!735919) (not e!629561))))

(declare-fun d!130781 () Bool)

(assert (=> d!130781 e!629560))

(declare-fun res!735922 () Bool)

(assert (=> d!130781 (=> (not res!735922) (not e!629560))))

(assert (=> d!130781 (= res!735922 (not (contains!6410 lt!495039 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130781 (= lt!495039 e!629559)))

(declare-fun c!108969 () Bool)

(assert (=> d!130781 (= c!108969 (bvsge #b00000000000000000000000000000000 (size!34925 _keys!1070)))))

(assert (=> d!130781 (validMask!0 mask!1414)))

(assert (=> d!130781 (= (getCurrentListMapNoExtraKeys!4207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!495039)))

(declare-fun b!1103009 () Bool)

(assert (=> b!1103009 (= e!629559 e!629558)))

(declare-fun c!108966 () Bool)

(assert (=> b!1103009 (= c!108966 (validKeyInArray!0 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130781 c!108969) b!1103003))

(assert (= (and d!130781 (not c!108969)) b!1103009))

(assert (= (and b!1103009 c!108966) b!1103004))

(assert (= (and b!1103009 (not c!108966)) b!1103007))

(assert (= (or b!1103004 b!1103007) bm!46312))

(assert (= (and d!130781 res!735922) b!1103001))

(assert (= (and b!1103001 res!735921) b!1103002))

(assert (= (and b!1103002 res!735920) b!1102999))

(assert (= (and b!1103002 c!108967) b!1103008))

(assert (= (and b!1103002 (not c!108967)) b!1103005))

(assert (= (and b!1103008 res!735919) b!1103006))

(assert (= (and b!1103005 c!108968) b!1102998))

(assert (= (and b!1103005 (not c!108968)) b!1103000))

(declare-fun b_lambda!18221 () Bool)

(assert (=> (not b_lambda!18221) (not b!1103004)))

(assert (=> b!1103004 t!34293))

(declare-fun b_and!37269 () Bool)

(assert (= b_and!37267 (and (=> t!34293 result!16711) b_and!37269)))

(declare-fun b_lambda!18223 () Bool)

(assert (=> (not b_lambda!18223) (not b!1103006)))

(assert (=> b!1103006 t!34293))

(declare-fun b_and!37271 () Bool)

(assert (= b_and!37269 (and (=> t!34293 result!16711) b_and!37271)))

(assert (=> b!1103008 m!1023209))

(assert (=> b!1103008 m!1023209))

(declare-fun m!1023353 () Bool)

(assert (=> b!1103008 m!1023353))

(declare-fun m!1023355 () Bool)

(assert (=> d!130781 m!1023355))

(assert (=> d!130781 m!1023129))

(assert (=> b!1102999 m!1023209))

(assert (=> b!1102999 m!1023209))

(assert (=> b!1102999 m!1023217))

(declare-fun m!1023357 () Bool)

(assert (=> b!1103000 m!1023357))

(declare-fun m!1023359 () Bool)

(assert (=> b!1103001 m!1023359))

(declare-fun m!1023361 () Bool)

(assert (=> b!1102998 m!1023361))

(assert (=> b!1103009 m!1023209))

(assert (=> b!1103009 m!1023209))

(assert (=> b!1103009 m!1023217))

(assert (=> b!1103006 m!1023109))

(assert (=> b!1103006 m!1023209))

(declare-fun m!1023363 () Bool)

(assert (=> b!1103006 m!1023363))

(assert (=> b!1103006 m!1023265))

(assert (=> b!1103006 m!1023109))

(assert (=> b!1103006 m!1023267))

(assert (=> b!1103006 m!1023265))

(assert (=> b!1103006 m!1023209))

(declare-fun m!1023365 () Bool)

(assert (=> b!1103004 m!1023365))

(assert (=> b!1103004 m!1023109))

(declare-fun m!1023367 () Bool)

(assert (=> b!1103004 m!1023367))

(declare-fun m!1023369 () Bool)

(assert (=> b!1103004 m!1023369))

(assert (=> b!1103004 m!1023265))

(assert (=> b!1103004 m!1023109))

(assert (=> b!1103004 m!1023267))

(assert (=> b!1103004 m!1023265))

(assert (=> b!1103004 m!1023209))

(declare-fun m!1023371 () Bool)

(assert (=> b!1103004 m!1023371))

(assert (=> b!1103004 m!1023367))

(assert (=> bm!46312 m!1023361))

(assert (=> b!1102778 d!130781))

(declare-fun d!130783 () Bool)

(assert (=> d!130783 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!495042 () Unit!36234)

(declare-fun choose!13 (array!71457 (_ BitVec 64) (_ BitVec 32)) Unit!36234)

(assert (=> d!130783 (= lt!495042 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130783 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130783 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!495042)))

(declare-fun bs!32355 () Bool)

(assert (= bs!32355 d!130783))

(assert (=> bs!32355 m!1023119))

(declare-fun m!1023373 () Bool)

(assert (=> bs!32355 m!1023373))

(assert (=> b!1102778 d!130783))

(declare-fun bm!46313 () Bool)

(declare-fun call!46316 () Bool)

(declare-fun c!108970 () Bool)

(assert (=> bm!46313 (= call!46316 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108970 (Cons!24028 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000) Nil!24029) Nil!24029)))))

(declare-fun d!130785 () Bool)

(declare-fun res!735924 () Bool)

(declare-fun e!629564 () Bool)

(assert (=> d!130785 (=> res!735924 e!629564)))

(assert (=> d!130785 (= res!735924 (bvsge #b00000000000000000000000000000000 (size!34925 _keys!1070)))))

(assert (=> d!130785 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24029) e!629564)))

(declare-fun b!1103010 () Bool)

(declare-fun e!629565 () Bool)

(declare-fun e!629566 () Bool)

(assert (=> b!1103010 (= e!629565 e!629566)))

(assert (=> b!1103010 (= c!108970 (validKeyInArray!0 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1103011 () Bool)

(declare-fun e!629563 () Bool)

(assert (=> b!1103011 (= e!629563 (contains!6409 Nil!24029 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1103012 () Bool)

(assert (=> b!1103012 (= e!629564 e!629565)))

(declare-fun res!735923 () Bool)

(assert (=> b!1103012 (=> (not res!735923) (not e!629565))))

(assert (=> b!1103012 (= res!735923 (not e!629563))))

(declare-fun res!735925 () Bool)

(assert (=> b!1103012 (=> (not res!735925) (not e!629563))))

(assert (=> b!1103012 (= res!735925 (validKeyInArray!0 (select (arr!34389 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1103013 () Bool)

(assert (=> b!1103013 (= e!629566 call!46316)))

(declare-fun b!1103014 () Bool)

(assert (=> b!1103014 (= e!629566 call!46316)))

(assert (= (and d!130785 (not res!735924)) b!1103012))

(assert (= (and b!1103012 res!735925) b!1103011))

(assert (= (and b!1103012 res!735923) b!1103010))

(assert (= (and b!1103010 c!108970) b!1103014))

(assert (= (and b!1103010 (not c!108970)) b!1103013))

(assert (= (or b!1103014 b!1103013) bm!46313))

(assert (=> bm!46313 m!1023209))

(declare-fun m!1023375 () Bool)

(assert (=> bm!46313 m!1023375))

(assert (=> b!1103010 m!1023209))

(assert (=> b!1103010 m!1023209))

(assert (=> b!1103010 m!1023217))

(assert (=> b!1103011 m!1023209))

(assert (=> b!1103011 m!1023209))

(declare-fun m!1023377 () Bool)

(assert (=> b!1103011 m!1023377))

(assert (=> b!1103012 m!1023209))

(assert (=> b!1103012 m!1023209))

(assert (=> b!1103012 m!1023217))

(assert (=> b!1102787 d!130785))

(declare-fun d!130787 () Bool)

(assert (=> d!130787 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102777 d!130787))

(declare-fun d!130789 () Bool)

(assert (=> d!130789 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96924 d!130789))

(declare-fun d!130791 () Bool)

(assert (=> d!130791 (= (array_inv!26484 _keys!1070) (bvsge (size!34925 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96924 d!130791))

(declare-fun d!130793 () Bool)

(assert (=> d!130793 (= (array_inv!26485 _values!874) (bvsge (size!34924 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96924 d!130793))

(declare-fun b!1103021 () Bool)

(declare-fun e!629572 () Bool)

(assert (=> b!1103021 (= e!629572 tp_is_empty!27267)))

(declare-fun b!1103022 () Bool)

(declare-fun e!629571 () Bool)

(assert (=> b!1103022 (= e!629571 tp_is_empty!27267)))

(declare-fun condMapEmpty!42700 () Bool)

(declare-fun mapDefault!42700 () ValueCell!12924)

(assert (=> mapNonEmpty!42694 (= condMapEmpty!42700 (= mapRest!42694 ((as const (Array (_ BitVec 32) ValueCell!12924)) mapDefault!42700)))))

(declare-fun mapRes!42700 () Bool)

(assert (=> mapNonEmpty!42694 (= tp!81610 (and e!629571 mapRes!42700))))

(declare-fun mapNonEmpty!42700 () Bool)

(declare-fun tp!81620 () Bool)

(assert (=> mapNonEmpty!42700 (= mapRes!42700 (and tp!81620 e!629572))))

(declare-fun mapValue!42700 () ValueCell!12924)

(declare-fun mapKey!42700 () (_ BitVec 32))

(declare-fun mapRest!42700 () (Array (_ BitVec 32) ValueCell!12924))

(assert (=> mapNonEmpty!42700 (= mapRest!42694 (store mapRest!42700 mapKey!42700 mapValue!42700))))

(declare-fun mapIsEmpty!42700 () Bool)

(assert (=> mapIsEmpty!42700 mapRes!42700))

(assert (= (and mapNonEmpty!42694 condMapEmpty!42700) mapIsEmpty!42700))

(assert (= (and mapNonEmpty!42694 (not condMapEmpty!42700)) mapNonEmpty!42700))

(assert (= (and mapNonEmpty!42700 ((_ is ValueCellFull!12924) mapValue!42700)) b!1103021))

(assert (= (and mapNonEmpty!42694 ((_ is ValueCellFull!12924) mapDefault!42700)) b!1103022))

(declare-fun m!1023379 () Bool)

(assert (=> mapNonEmpty!42700 m!1023379))

(declare-fun b_lambda!18225 () Bool)

(assert (= b_lambda!18221 (or (and start!96924 b_free!23217) b_lambda!18225)))

(declare-fun b_lambda!18227 () Bool)

(assert (= b_lambda!18211 (or (and start!96924 b_free!23217) b_lambda!18227)))

(declare-fun b_lambda!18229 () Bool)

(assert (= b_lambda!18219 (or (and start!96924 b_free!23217) b_lambda!18229)))

(declare-fun b_lambda!18231 () Bool)

(assert (= b_lambda!18215 (or (and start!96924 b_free!23217) b_lambda!18231)))

(declare-fun b_lambda!18233 () Bool)

(assert (= b_lambda!18217 (or (and start!96924 b_free!23217) b_lambda!18233)))

(declare-fun b_lambda!18235 () Bool)

(assert (= b_lambda!18213 (or (and start!96924 b_free!23217) b_lambda!18235)))

(declare-fun b_lambda!18237 () Bool)

(assert (= b_lambda!18223 (or (and start!96924 b_free!23217) b_lambda!18237)))

(check-sat (not b!1102917) (not b_next!23217) (not b_lambda!18235) (not b!1102916) (not bm!46290) (not b!1103006) (not b!1102964) (not b!1103012) (not b!1102956) (not b!1102998) (not b!1102974) (not bm!46274) (not b!1102987) (not bm!46311) (not b!1102970) (not b!1102962) (not b!1102856) (not b!1102957) (not b!1102859) (not b!1102868) (not b_lambda!18209) (not b!1102958) (not b!1102988) (not b!1102931) (not b!1102860) (not bm!46300) tp_is_empty!27267 (not bm!46312) (not b!1102973) (not b!1103009) (not b!1102922) (not b!1102978) (not b_lambda!18225) (not d!130777) (not mapNonEmpty!42700) (not bm!46270) (not d!130771) (not b!1102844) b_and!37271 (not b!1102842) (not b!1102967) (not b!1102930) (not b_lambda!18231) (not bm!46294) (not b!1102997) (not d!130765) (not b!1102921) (not b!1102924) (not bm!46304) (not b_lambda!18233) (not b_lambda!18229) (not b!1103001) (not b!1103011) (not d!130781) (not b!1102855) (not b!1103008) (not bm!46303) (not d!130773) (not b!1102981) (not b!1102966) (not bm!46295) (not d!130775) (not b!1102843) (not b!1103004) (not b!1103000) (not b_lambda!18237) (not d!130783) (not b!1102959) (not bm!46310) (not bm!46313) (not b!1102913) (not bm!46305) (not b!1102999) (not bm!46298) (not b!1102979) (not bm!46293) (not b_lambda!18227) (not d!130779) (not b!1103010) (not bm!46273))
(check-sat b_and!37271 (not b_next!23217))
