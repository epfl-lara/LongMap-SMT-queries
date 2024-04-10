; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95898 () Bool)

(assert start!95898)

(declare-fun b_free!22551 () Bool)

(declare-fun b_next!22551 () Bool)

(assert (=> start!95898 (= b_free!22551 (not b_next!22551))))

(declare-fun tp!79501 () Bool)

(declare-fun b_and!35777 () Bool)

(assert (=> start!95898 (= tp!79501 b_and!35777)))

(declare-fun b!1085853 () Bool)

(declare-fun e!620306 () Bool)

(declare-fun e!620305 () Bool)

(declare-fun mapRes!41584 () Bool)

(assert (=> b!1085853 (= e!620306 (and e!620305 mapRes!41584))))

(declare-fun condMapEmpty!41584 () Bool)

(declare-datatypes ((V!40531 0))(
  ( (V!40532 (val!13333 Int)) )
))
(declare-datatypes ((ValueCell!12567 0))(
  ( (ValueCellFull!12567 (v!15954 V!40531)) (EmptyCell!12567) )
))
(declare-datatypes ((array!70041 0))(
  ( (array!70042 (arr!33694 (Array (_ BitVec 32) ValueCell!12567)) (size!34230 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70041)

(declare-fun mapDefault!41584 () ValueCell!12567)

(assert (=> b!1085853 (= condMapEmpty!41584 (= (arr!33694 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12567)) mapDefault!41584)))))

(declare-fun b!1085854 () Bool)

(declare-fun res!724010 () Bool)

(declare-fun e!620300 () Bool)

(assert (=> b!1085854 (=> (not res!724010) (not e!620300))))

(declare-datatypes ((array!70043 0))(
  ( (array!70044 (arr!33695 (Array (_ BitVec 32) (_ BitVec 64))) (size!34231 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70043)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70043 (_ BitVec 32)) Bool)

(assert (=> b!1085854 (= res!724010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085855 () Bool)

(declare-fun res!724009 () Bool)

(assert (=> b!1085855 (=> (not res!724009) (not e!620300))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085855 (= res!724009 (= (select (arr!33695 _keys!1070) i!650) k0!904))))

(declare-fun b!1085856 () Bool)

(declare-fun res!724012 () Bool)

(assert (=> b!1085856 (=> (not res!724012) (not e!620300))))

(assert (=> b!1085856 (= res!724012 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34231 _keys!1070))))))

(declare-fun b!1085857 () Bool)

(declare-fun e!620303 () Bool)

(declare-fun e!620301 () Bool)

(assert (=> b!1085857 (= e!620303 e!620301)))

(declare-fun res!724014 () Bool)

(assert (=> b!1085857 (=> res!724014 e!620301)))

(assert (=> b!1085857 (= res!724014 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16908 0))(
  ( (tuple2!16909 (_1!8465 (_ BitVec 64)) (_2!8465 V!40531)) )
))
(declare-datatypes ((List!23497 0))(
  ( (Nil!23494) (Cons!23493 (h!24702 tuple2!16908) (t!33106 List!23497)) )
))
(declare-datatypes ((ListLongMap!14877 0))(
  ( (ListLongMap!14878 (toList!7454 List!23497)) )
))
(declare-fun lt!482175 () ListLongMap!14877)

(declare-fun lt!482173 () ListLongMap!14877)

(assert (=> b!1085857 (= lt!482175 lt!482173)))

(declare-fun lt!482167 () ListLongMap!14877)

(declare-fun -!780 (ListLongMap!14877 (_ BitVec 64)) ListLongMap!14877)

(assert (=> b!1085857 (= lt!482175 (-!780 lt!482167 k0!904))))

(declare-fun zeroValue!831 () V!40531)

(declare-datatypes ((Unit!35726 0))(
  ( (Unit!35727) )
))
(declare-fun lt!482163 () Unit!35726)

(declare-fun lt!482179 () ListLongMap!14877)

(declare-fun addRemoveCommutativeForDiffKeys!18 (ListLongMap!14877 (_ BitVec 64) V!40531 (_ BitVec 64)) Unit!35726)

(assert (=> b!1085857 (= lt!482163 (addRemoveCommutativeForDiffKeys!18 lt!482179 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482168 () ListLongMap!14877)

(declare-fun lt!482178 () tuple2!16908)

(declare-fun +!3262 (ListLongMap!14877 tuple2!16908) ListLongMap!14877)

(assert (=> b!1085857 (= lt!482168 (+!3262 lt!482173 lt!482178))))

(declare-fun lt!482172 () ListLongMap!14877)

(declare-fun lt!482166 () tuple2!16908)

(assert (=> b!1085857 (= lt!482173 (+!3262 lt!482172 lt!482166))))

(declare-fun lt!482177 () ListLongMap!14877)

(declare-fun lt!482174 () ListLongMap!14877)

(assert (=> b!1085857 (= lt!482177 lt!482174)))

(assert (=> b!1085857 (= lt!482174 (+!3262 lt!482167 lt!482178))))

(assert (=> b!1085857 (= lt!482167 (+!3262 lt!482179 lt!482166))))

(declare-fun lt!482170 () ListLongMap!14877)

(assert (=> b!1085857 (= lt!482168 (+!3262 (+!3262 lt!482170 lt!482166) lt!482178))))

(declare-fun minValue!831 () V!40531)

(assert (=> b!1085857 (= lt!482178 (tuple2!16909 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085857 (= lt!482166 (tuple2!16909 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085858 () Bool)

(declare-fun res!724015 () Bool)

(assert (=> b!1085858 (=> (not res!724015) (not e!620300))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085858 (= res!724015 (and (= (size!34230 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34231 _keys!1070) (size!34230 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085859 () Bool)

(declare-fun e!620302 () Bool)

(assert (=> b!1085859 (= e!620302 (not e!620303))))

(declare-fun res!724017 () Bool)

(assert (=> b!1085859 (=> res!724017 e!620303)))

(assert (=> b!1085859 (= res!724017 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4237 (array!70043 array!70041 (_ BitVec 32) (_ BitVec 32) V!40531 V!40531 (_ BitVec 32) Int) ListLongMap!14877)

(assert (=> b!1085859 (= lt!482177 (getCurrentListMap!4237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482164 () array!70043)

(declare-fun lt!482171 () array!70041)

(assert (=> b!1085859 (= lt!482168 (getCurrentListMap!4237 lt!482164 lt!482171 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1085859 (and (= lt!482170 lt!482172) (= lt!482172 lt!482170))))

(assert (=> b!1085859 (= lt!482172 (-!780 lt!482179 k0!904))))

(declare-fun lt!482169 () Unit!35726)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!56 (array!70043 array!70041 (_ BitVec 32) (_ BitVec 32) V!40531 V!40531 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35726)

(assert (=> b!1085859 (= lt!482169 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!56 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3997 (array!70043 array!70041 (_ BitVec 32) (_ BitVec 32) V!40531 V!40531 (_ BitVec 32) Int) ListLongMap!14877)

(assert (=> b!1085859 (= lt!482170 (getCurrentListMapNoExtraKeys!3997 lt!482164 lt!482171 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2134 (Int (_ BitVec 64)) V!40531)

(assert (=> b!1085859 (= lt!482171 (array!70042 (store (arr!33694 _values!874) i!650 (ValueCellFull!12567 (dynLambda!2134 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34230 _values!874)))))

(assert (=> b!1085859 (= lt!482179 (getCurrentListMapNoExtraKeys!3997 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085859 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482165 () Unit!35726)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70043 (_ BitVec 64) (_ BitVec 32)) Unit!35726)

(assert (=> b!1085859 (= lt!482165 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41584 () Bool)

(assert (=> mapIsEmpty!41584 mapRes!41584))

(declare-fun mapNonEmpty!41584 () Bool)

(declare-fun tp!79502 () Bool)

(declare-fun e!620299 () Bool)

(assert (=> mapNonEmpty!41584 (= mapRes!41584 (and tp!79502 e!620299))))

(declare-fun mapKey!41584 () (_ BitVec 32))

(declare-fun mapValue!41584 () ValueCell!12567)

(declare-fun mapRest!41584 () (Array (_ BitVec 32) ValueCell!12567))

(assert (=> mapNonEmpty!41584 (= (arr!33694 _values!874) (store mapRest!41584 mapKey!41584 mapValue!41584))))

(declare-fun res!724008 () Bool)

(assert (=> start!95898 (=> (not res!724008) (not e!620300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95898 (= res!724008 (validMask!0 mask!1414))))

(assert (=> start!95898 e!620300))

(assert (=> start!95898 tp!79501))

(assert (=> start!95898 true))

(declare-fun tp_is_empty!26553 () Bool)

(assert (=> start!95898 tp_is_empty!26553))

(declare-fun array_inv!26002 (array!70043) Bool)

(assert (=> start!95898 (array_inv!26002 _keys!1070)))

(declare-fun array_inv!26003 (array!70041) Bool)

(assert (=> start!95898 (and (array_inv!26003 _values!874) e!620306)))

(declare-fun b!1085860 () Bool)

(declare-fun res!724007 () Bool)

(assert (=> b!1085860 (=> (not res!724007) (not e!620300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085860 (= res!724007 (validKeyInArray!0 k0!904))))

(declare-fun b!1085861 () Bool)

(declare-fun res!724011 () Bool)

(assert (=> b!1085861 (=> (not res!724011) (not e!620300))))

(declare-datatypes ((List!23498 0))(
  ( (Nil!23495) (Cons!23494 (h!24703 (_ BitVec 64)) (t!33107 List!23498)) )
))
(declare-fun arrayNoDuplicates!0 (array!70043 (_ BitVec 32) List!23498) Bool)

(assert (=> b!1085861 (= res!724011 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23495))))

(declare-fun b!1085862 () Bool)

(assert (=> b!1085862 (= e!620301 true)))

(assert (=> b!1085862 (= (-!780 lt!482174 k0!904) (+!3262 lt!482175 lt!482178))))

(declare-fun lt!482176 () Unit!35726)

(assert (=> b!1085862 (= lt!482176 (addRemoveCommutativeForDiffKeys!18 lt!482167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085863 () Bool)

(assert (=> b!1085863 (= e!620299 tp_is_empty!26553)))

(declare-fun b!1085864 () Bool)

(assert (=> b!1085864 (= e!620305 tp_is_empty!26553)))

(declare-fun b!1085865 () Bool)

(declare-fun res!724013 () Bool)

(assert (=> b!1085865 (=> (not res!724013) (not e!620302))))

(assert (=> b!1085865 (= res!724013 (arrayNoDuplicates!0 lt!482164 #b00000000000000000000000000000000 Nil!23495))))

(declare-fun b!1085866 () Bool)

(assert (=> b!1085866 (= e!620300 e!620302)))

(declare-fun res!724016 () Bool)

(assert (=> b!1085866 (=> (not res!724016) (not e!620302))))

(assert (=> b!1085866 (= res!724016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482164 mask!1414))))

(assert (=> b!1085866 (= lt!482164 (array!70044 (store (arr!33695 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34231 _keys!1070)))))

(assert (= (and start!95898 res!724008) b!1085858))

(assert (= (and b!1085858 res!724015) b!1085854))

(assert (= (and b!1085854 res!724010) b!1085861))

(assert (= (and b!1085861 res!724011) b!1085856))

(assert (= (and b!1085856 res!724012) b!1085860))

(assert (= (and b!1085860 res!724007) b!1085855))

(assert (= (and b!1085855 res!724009) b!1085866))

(assert (= (and b!1085866 res!724016) b!1085865))

(assert (= (and b!1085865 res!724013) b!1085859))

(assert (= (and b!1085859 (not res!724017)) b!1085857))

(assert (= (and b!1085857 (not res!724014)) b!1085862))

(assert (= (and b!1085853 condMapEmpty!41584) mapIsEmpty!41584))

(assert (= (and b!1085853 (not condMapEmpty!41584)) mapNonEmpty!41584))

(get-info :version)

(assert (= (and mapNonEmpty!41584 ((_ is ValueCellFull!12567) mapValue!41584)) b!1085863))

(assert (= (and b!1085853 ((_ is ValueCellFull!12567) mapDefault!41584)) b!1085864))

(assert (= start!95898 b!1085853))

(declare-fun b_lambda!17221 () Bool)

(assert (=> (not b_lambda!17221) (not b!1085859)))

(declare-fun t!33105 () Bool)

(declare-fun tb!7429 () Bool)

(assert (=> (and start!95898 (= defaultEntry!882 defaultEntry!882) t!33105) tb!7429))

(declare-fun result!15377 () Bool)

(assert (=> tb!7429 (= result!15377 tp_is_empty!26553)))

(assert (=> b!1085859 t!33105))

(declare-fun b_and!35779 () Bool)

(assert (= b_and!35777 (and (=> t!33105 result!15377) b_and!35779)))

(declare-fun m!1004087 () Bool)

(assert (=> b!1085859 m!1004087))

(declare-fun m!1004089 () Bool)

(assert (=> b!1085859 m!1004089))

(declare-fun m!1004091 () Bool)

(assert (=> b!1085859 m!1004091))

(declare-fun m!1004093 () Bool)

(assert (=> b!1085859 m!1004093))

(declare-fun m!1004095 () Bool)

(assert (=> b!1085859 m!1004095))

(declare-fun m!1004097 () Bool)

(assert (=> b!1085859 m!1004097))

(declare-fun m!1004099 () Bool)

(assert (=> b!1085859 m!1004099))

(declare-fun m!1004101 () Bool)

(assert (=> b!1085859 m!1004101))

(declare-fun m!1004103 () Bool)

(assert (=> b!1085859 m!1004103))

(declare-fun m!1004105 () Bool)

(assert (=> b!1085859 m!1004105))

(declare-fun m!1004107 () Bool)

(assert (=> b!1085866 m!1004107))

(declare-fun m!1004109 () Bool)

(assert (=> b!1085866 m!1004109))

(declare-fun m!1004111 () Bool)

(assert (=> b!1085857 m!1004111))

(declare-fun m!1004113 () Bool)

(assert (=> b!1085857 m!1004113))

(declare-fun m!1004115 () Bool)

(assert (=> b!1085857 m!1004115))

(declare-fun m!1004117 () Bool)

(assert (=> b!1085857 m!1004117))

(declare-fun m!1004119 () Bool)

(assert (=> b!1085857 m!1004119))

(declare-fun m!1004121 () Bool)

(assert (=> b!1085857 m!1004121))

(declare-fun m!1004123 () Bool)

(assert (=> b!1085857 m!1004123))

(declare-fun m!1004125 () Bool)

(assert (=> b!1085857 m!1004125))

(assert (=> b!1085857 m!1004117))

(declare-fun m!1004127 () Bool)

(assert (=> b!1085855 m!1004127))

(declare-fun m!1004129 () Bool)

(assert (=> b!1085865 m!1004129))

(declare-fun m!1004131 () Bool)

(assert (=> b!1085861 m!1004131))

(declare-fun m!1004133 () Bool)

(assert (=> start!95898 m!1004133))

(declare-fun m!1004135 () Bool)

(assert (=> start!95898 m!1004135))

(declare-fun m!1004137 () Bool)

(assert (=> start!95898 m!1004137))

(declare-fun m!1004139 () Bool)

(assert (=> b!1085854 m!1004139))

(declare-fun m!1004141 () Bool)

(assert (=> mapNonEmpty!41584 m!1004141))

(declare-fun m!1004143 () Bool)

(assert (=> b!1085862 m!1004143))

(declare-fun m!1004145 () Bool)

(assert (=> b!1085862 m!1004145))

(declare-fun m!1004147 () Bool)

(assert (=> b!1085862 m!1004147))

(declare-fun m!1004149 () Bool)

(assert (=> b!1085860 m!1004149))

(check-sat b_and!35779 (not b!1085854) (not b!1085862) (not mapNonEmpty!41584) tp_is_empty!26553 (not b!1085859) (not b_lambda!17221) (not b!1085860) (not b!1085861) (not b_next!22551) (not b!1085866) (not b!1085857) (not b!1085865) (not start!95898))
(check-sat b_and!35779 (not b_next!22551))
