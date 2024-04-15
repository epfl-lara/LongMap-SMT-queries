; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95974 () Bool)

(assert start!95974)

(declare-fun b_free!22633 () Bool)

(declare-fun b_next!22633 () Bool)

(assert (=> start!95974 (= b_free!22633 (not b_next!22633))))

(declare-fun tp!79748 () Bool)

(declare-fun b_and!35915 () Bool)

(assert (=> start!95974 (= tp!79748 b_and!35915)))

(declare-fun b!1087513 () Bool)

(declare-fun e!621197 () Bool)

(declare-fun tp_is_empty!26635 () Bool)

(assert (=> b!1087513 (= e!621197 tp_is_empty!26635)))

(declare-fun mapIsEmpty!41707 () Bool)

(declare-fun mapRes!41707 () Bool)

(assert (=> mapIsEmpty!41707 mapRes!41707))

(declare-fun b!1087514 () Bool)

(declare-fun e!621195 () Bool)

(assert (=> b!1087514 (= e!621195 (and e!621197 mapRes!41707))))

(declare-fun condMapEmpty!41707 () Bool)

(declare-datatypes ((V!40641 0))(
  ( (V!40642 (val!13374 Int)) )
))
(declare-datatypes ((ValueCell!12608 0))(
  ( (ValueCellFull!12608 (v!15994 V!40641)) (EmptyCell!12608) )
))
(declare-datatypes ((array!70120 0))(
  ( (array!70121 (arr!33734 (Array (_ BitVec 32) ValueCell!12608)) (size!34272 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70120)

(declare-fun mapDefault!41707 () ValueCell!12608)

(assert (=> b!1087514 (= condMapEmpty!41707 (= (arr!33734 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12608)) mapDefault!41707)))))

(declare-fun b!1087515 () Bool)

(declare-fun res!725301 () Bool)

(declare-fun e!621192 () Bool)

(assert (=> b!1087515 (=> (not res!725301) (not e!621192))))

(declare-datatypes ((array!70122 0))(
  ( (array!70123 (arr!33735 (Array (_ BitVec 32) (_ BitVec 64))) (size!34273 (_ BitVec 32))) )
))
(declare-fun lt!483919 () array!70122)

(declare-datatypes ((List!23598 0))(
  ( (Nil!23595) (Cons!23594 (h!24803 (_ BitVec 64)) (t!33280 List!23598)) )
))
(declare-fun arrayNoDuplicates!0 (array!70122 (_ BitVec 32) List!23598) Bool)

(assert (=> b!1087515 (= res!725301 (arrayNoDuplicates!0 lt!483919 #b00000000000000000000000000000000 Nil!23595))))

(declare-fun b!1087516 () Bool)

(declare-fun e!621196 () Bool)

(assert (=> b!1087516 (= e!621196 e!621192)))

(declare-fun res!725308 () Bool)

(assert (=> b!1087516 (=> (not res!725308) (not e!621192))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70122 (_ BitVec 32)) Bool)

(assert (=> b!1087516 (= res!725308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483919 mask!1414))))

(declare-fun _keys!1070 () array!70122)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087516 (= lt!483919 (array!70123 (store (arr!33735 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34273 _keys!1070)))))

(declare-fun b!1087517 () Bool)

(declare-fun e!621193 () Bool)

(assert (=> b!1087517 (= e!621193 tp_is_empty!26635)))

(declare-fun b!1087518 () Bool)

(declare-fun e!621190 () Bool)

(assert (=> b!1087518 (= e!621192 (not e!621190))))

(declare-fun res!725304 () Bool)

(assert (=> b!1087518 (=> res!725304 e!621190)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087518 (= res!725304 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40641)

(declare-datatypes ((tuple2!17030 0))(
  ( (tuple2!17031 (_1!8526 (_ BitVec 64)) (_2!8526 V!40641)) )
))
(declare-datatypes ((List!23599 0))(
  ( (Nil!23596) (Cons!23595 (h!24804 tuple2!17030) (t!33281 List!23599)) )
))
(declare-datatypes ((ListLongMap!14999 0))(
  ( (ListLongMap!15000 (toList!7515 List!23599)) )
))
(declare-fun lt!483923 () ListLongMap!14999)

(declare-fun zeroValue!831 () V!40641)

(declare-fun getCurrentListMap!4198 (array!70122 array!70120 (_ BitVec 32) (_ BitVec 32) V!40641 V!40641 (_ BitVec 32) Int) ListLongMap!14999)

(assert (=> b!1087518 (= lt!483923 (getCurrentListMap!4198 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483913 () ListLongMap!14999)

(declare-fun lt!483912 () array!70120)

(assert (=> b!1087518 (= lt!483913 (getCurrentListMap!4198 lt!483919 lt!483912 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483917 () ListLongMap!14999)

(declare-fun lt!483918 () ListLongMap!14999)

(assert (=> b!1087518 (and (= lt!483917 lt!483918) (= lt!483918 lt!483917))))

(declare-fun lt!483914 () ListLongMap!14999)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!794 (ListLongMap!14999 (_ BitVec 64)) ListLongMap!14999)

(assert (=> b!1087518 (= lt!483918 (-!794 lt!483914 k0!904))))

(declare-datatypes ((Unit!35623 0))(
  ( (Unit!35624) )
))
(declare-fun lt!483916 () Unit!35623)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!82 (array!70122 array!70120 (_ BitVec 32) (_ BitVec 32) V!40641 V!40641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35623)

(assert (=> b!1087518 (= lt!483916 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!82 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4068 (array!70122 array!70120 (_ BitVec 32) (_ BitVec 32) V!40641 V!40641 (_ BitVec 32) Int) ListLongMap!14999)

(assert (=> b!1087518 (= lt!483917 (getCurrentListMapNoExtraKeys!4068 lt!483919 lt!483912 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2139 (Int (_ BitVec 64)) V!40641)

(assert (=> b!1087518 (= lt!483912 (array!70121 (store (arr!33734 _values!874) i!650 (ValueCellFull!12608 (dynLambda!2139 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34272 _values!874)))))

(assert (=> b!1087518 (= lt!483914 (getCurrentListMapNoExtraKeys!4068 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087518 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483911 () Unit!35623)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70122 (_ BitVec 64) (_ BitVec 32)) Unit!35623)

(assert (=> b!1087518 (= lt!483911 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087519 () Bool)

(declare-fun res!725303 () Bool)

(assert (=> b!1087519 (=> (not res!725303) (not e!621196))))

(assert (=> b!1087519 (= res!725303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087520 () Bool)

(declare-fun e!621191 () Bool)

(assert (=> b!1087520 (= e!621191 true)))

(declare-fun lt!483915 () ListLongMap!14999)

(declare-fun lt!483921 () ListLongMap!14999)

(assert (=> b!1087520 (= (-!794 lt!483915 k0!904) lt!483921)))

(declare-fun lt!483922 () Unit!35623)

(declare-fun addRemoveCommutativeForDiffKeys!48 (ListLongMap!14999 (_ BitVec 64) V!40641 (_ BitVec 64)) Unit!35623)

(assert (=> b!1087520 (= lt!483922 (addRemoveCommutativeForDiffKeys!48 lt!483914 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1087522 () Bool)

(assert (=> b!1087522 (= e!621190 e!621191)))

(declare-fun res!725307 () Bool)

(assert (=> b!1087522 (=> res!725307 e!621191)))

(assert (=> b!1087522 (= res!725307 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1087522 (= lt!483913 lt!483921)))

(declare-fun lt!483920 () tuple2!17030)

(declare-fun +!3320 (ListLongMap!14999 tuple2!17030) ListLongMap!14999)

(assert (=> b!1087522 (= lt!483921 (+!3320 lt!483918 lt!483920))))

(assert (=> b!1087522 (= lt!483923 lt!483915)))

(assert (=> b!1087522 (= lt!483915 (+!3320 lt!483914 lt!483920))))

(assert (=> b!1087522 (= lt!483913 (+!3320 lt!483917 lt!483920))))

(assert (=> b!1087522 (= lt!483920 (tuple2!17031 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087523 () Bool)

(declare-fun res!725302 () Bool)

(assert (=> b!1087523 (=> (not res!725302) (not e!621196))))

(assert (=> b!1087523 (= res!725302 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23595))))

(declare-fun b!1087524 () Bool)

(declare-fun res!725306 () Bool)

(assert (=> b!1087524 (=> (not res!725306) (not e!621196))))

(assert (=> b!1087524 (= res!725306 (and (= (size!34272 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34273 _keys!1070) (size!34272 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087525 () Bool)

(declare-fun res!725300 () Bool)

(assert (=> b!1087525 (=> (not res!725300) (not e!621196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087525 (= res!725300 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41707 () Bool)

(declare-fun tp!79747 () Bool)

(assert (=> mapNonEmpty!41707 (= mapRes!41707 (and tp!79747 e!621193))))

(declare-fun mapValue!41707 () ValueCell!12608)

(declare-fun mapKey!41707 () (_ BitVec 32))

(declare-fun mapRest!41707 () (Array (_ BitVec 32) ValueCell!12608))

(assert (=> mapNonEmpty!41707 (= (arr!33734 _values!874) (store mapRest!41707 mapKey!41707 mapValue!41707))))

(declare-fun b!1087526 () Bool)

(declare-fun res!725310 () Bool)

(assert (=> b!1087526 (=> (not res!725310) (not e!621196))))

(assert (=> b!1087526 (= res!725310 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34273 _keys!1070))))))

(declare-fun res!725305 () Bool)

(assert (=> start!95974 (=> (not res!725305) (not e!621196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95974 (= res!725305 (validMask!0 mask!1414))))

(assert (=> start!95974 e!621196))

(assert (=> start!95974 tp!79748))

(assert (=> start!95974 true))

(assert (=> start!95974 tp_is_empty!26635))

(declare-fun array_inv!26068 (array!70122) Bool)

(assert (=> start!95974 (array_inv!26068 _keys!1070)))

(declare-fun array_inv!26069 (array!70120) Bool)

(assert (=> start!95974 (and (array_inv!26069 _values!874) e!621195)))

(declare-fun b!1087521 () Bool)

(declare-fun res!725309 () Bool)

(assert (=> b!1087521 (=> (not res!725309) (not e!621196))))

(assert (=> b!1087521 (= res!725309 (= (select (arr!33735 _keys!1070) i!650) k0!904))))

(assert (= (and start!95974 res!725305) b!1087524))

(assert (= (and b!1087524 res!725306) b!1087519))

(assert (= (and b!1087519 res!725303) b!1087523))

(assert (= (and b!1087523 res!725302) b!1087526))

(assert (= (and b!1087526 res!725310) b!1087525))

(assert (= (and b!1087525 res!725300) b!1087521))

(assert (= (and b!1087521 res!725309) b!1087516))

(assert (= (and b!1087516 res!725308) b!1087515))

(assert (= (and b!1087515 res!725301) b!1087518))

(assert (= (and b!1087518 (not res!725304)) b!1087522))

(assert (= (and b!1087522 (not res!725307)) b!1087520))

(assert (= (and b!1087514 condMapEmpty!41707) mapIsEmpty!41707))

(assert (= (and b!1087514 (not condMapEmpty!41707)) mapNonEmpty!41707))

(get-info :version)

(assert (= (and mapNonEmpty!41707 ((_ is ValueCellFull!12608) mapValue!41707)) b!1087517))

(assert (= (and b!1087514 ((_ is ValueCellFull!12608) mapDefault!41707)) b!1087513))

(assert (= start!95974 b!1087514))

(declare-fun b_lambda!17281 () Bool)

(assert (=> (not b_lambda!17281) (not b!1087518)))

(declare-fun t!33279 () Bool)

(declare-fun tb!7503 () Bool)

(assert (=> (and start!95974 (= defaultEntry!882 defaultEntry!882) t!33279) tb!7503))

(declare-fun result!15533 () Bool)

(assert (=> tb!7503 (= result!15533 tp_is_empty!26635)))

(assert (=> b!1087518 t!33279))

(declare-fun b_and!35917 () Bool)

(assert (= b_and!35915 (and (=> t!33279 result!15533) b_and!35917)))

(declare-fun m!1005965 () Bool)

(assert (=> start!95974 m!1005965))

(declare-fun m!1005967 () Bool)

(assert (=> start!95974 m!1005967))

(declare-fun m!1005969 () Bool)

(assert (=> start!95974 m!1005969))

(declare-fun m!1005971 () Bool)

(assert (=> b!1087523 m!1005971))

(declare-fun m!1005973 () Bool)

(assert (=> mapNonEmpty!41707 m!1005973))

(declare-fun m!1005975 () Bool)

(assert (=> b!1087521 m!1005975))

(declare-fun m!1005977 () Bool)

(assert (=> b!1087522 m!1005977))

(declare-fun m!1005979 () Bool)

(assert (=> b!1087522 m!1005979))

(declare-fun m!1005981 () Bool)

(assert (=> b!1087522 m!1005981))

(declare-fun m!1005983 () Bool)

(assert (=> b!1087520 m!1005983))

(declare-fun m!1005985 () Bool)

(assert (=> b!1087520 m!1005985))

(declare-fun m!1005987 () Bool)

(assert (=> b!1087516 m!1005987))

(declare-fun m!1005989 () Bool)

(assert (=> b!1087516 m!1005989))

(declare-fun m!1005991 () Bool)

(assert (=> b!1087515 m!1005991))

(declare-fun m!1005993 () Bool)

(assert (=> b!1087525 m!1005993))

(declare-fun m!1005995 () Bool)

(assert (=> b!1087518 m!1005995))

(declare-fun m!1005997 () Bool)

(assert (=> b!1087518 m!1005997))

(declare-fun m!1005999 () Bool)

(assert (=> b!1087518 m!1005999))

(declare-fun m!1006001 () Bool)

(assert (=> b!1087518 m!1006001))

(declare-fun m!1006003 () Bool)

(assert (=> b!1087518 m!1006003))

(declare-fun m!1006005 () Bool)

(assert (=> b!1087518 m!1006005))

(declare-fun m!1006007 () Bool)

(assert (=> b!1087518 m!1006007))

(declare-fun m!1006009 () Bool)

(assert (=> b!1087518 m!1006009))

(declare-fun m!1006011 () Bool)

(assert (=> b!1087518 m!1006011))

(declare-fun m!1006013 () Bool)

(assert (=> b!1087518 m!1006013))

(declare-fun m!1006015 () Bool)

(assert (=> b!1087519 m!1006015))

(check-sat b_and!35917 (not b!1087518) (not start!95974) (not b!1087525) (not b!1087516) (not b_next!22633) (not b!1087519) (not b_lambda!17281) (not b!1087522) (not b!1087515) tp_is_empty!26635 (not b!1087520) (not mapNonEmpty!41707) (not b!1087523))
(check-sat b_and!35917 (not b_next!22633))
