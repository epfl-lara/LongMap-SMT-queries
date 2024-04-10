; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95976 () Bool)

(assert start!95976)

(declare-fun b_free!22629 () Bool)

(declare-fun b_next!22629 () Bool)

(assert (=> start!95976 (= b_free!22629 (not b_next!22629))))

(declare-fun tp!79736 () Bool)

(declare-fun b_and!35933 () Bool)

(assert (=> start!95976 (= tp!79736 b_and!35933)))

(declare-fun b!1087578 () Bool)

(declare-fun res!725303 () Bool)

(declare-fun e!621240 () Bool)

(assert (=> b!1087578 (=> (not res!725303) (not e!621240))))

(declare-datatypes ((array!70187 0))(
  ( (array!70188 (arr!33767 (Array (_ BitVec 32) (_ BitVec 64))) (size!34303 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70187)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087578 (= res!725303 (= (select (arr!33767 _keys!1070) i!650) k0!904))))

(declare-fun b!1087579 () Bool)

(declare-fun e!621237 () Bool)

(declare-fun tp_is_empty!26631 () Bool)

(assert (=> b!1087579 (= e!621237 tp_is_empty!26631)))

(declare-fun b!1087580 () Bool)

(declare-fun e!621235 () Bool)

(declare-fun e!621238 () Bool)

(assert (=> b!1087580 (= e!621235 e!621238)))

(declare-fun res!725308 () Bool)

(assert (=> b!1087580 (=> res!725308 e!621238)))

(assert (=> b!1087580 (= res!725308 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40635 0))(
  ( (V!40636 (val!13372 Int)) )
))
(declare-datatypes ((tuple2!16970 0))(
  ( (tuple2!16971 (_1!8496 (_ BitVec 64)) (_2!8496 V!40635)) )
))
(declare-datatypes ((List!23557 0))(
  ( (Nil!23554) (Cons!23553 (h!24762 tuple2!16970) (t!33244 List!23557)) )
))
(declare-datatypes ((ListLongMap!14939 0))(
  ( (ListLongMap!14940 (toList!7485 List!23557)) )
))
(declare-fun lt!484040 () ListLongMap!14939)

(declare-fun lt!484039 () ListLongMap!14939)

(assert (=> b!1087580 (= lt!484040 lt!484039)))

(declare-fun lt!484041 () ListLongMap!14939)

(declare-fun lt!484043 () tuple2!16970)

(declare-fun +!3289 (ListLongMap!14939 tuple2!16970) ListLongMap!14939)

(assert (=> b!1087580 (= lt!484039 (+!3289 lt!484041 lt!484043))))

(declare-fun lt!484038 () ListLongMap!14939)

(declare-fun lt!484033 () ListLongMap!14939)

(assert (=> b!1087580 (= lt!484038 lt!484033)))

(declare-fun lt!484034 () ListLongMap!14939)

(assert (=> b!1087580 (= lt!484033 (+!3289 lt!484034 lt!484043))))

(declare-fun lt!484035 () ListLongMap!14939)

(assert (=> b!1087580 (= lt!484040 (+!3289 lt!484035 lt!484043))))

(declare-fun zeroValue!831 () V!40635)

(assert (=> b!1087580 (= lt!484043 (tuple2!16971 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapNonEmpty!41701 () Bool)

(declare-fun mapRes!41701 () Bool)

(declare-fun tp!79735 () Bool)

(declare-fun e!621239 () Bool)

(assert (=> mapNonEmpty!41701 (= mapRes!41701 (and tp!79735 e!621239))))

(declare-datatypes ((ValueCell!12606 0))(
  ( (ValueCellFull!12606 (v!15993 V!40635)) (EmptyCell!12606) )
))
(declare-fun mapRest!41701 () (Array (_ BitVec 32) ValueCell!12606))

(declare-datatypes ((array!70189 0))(
  ( (array!70190 (arr!33768 (Array (_ BitVec 32) ValueCell!12606)) (size!34304 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70189)

(declare-fun mapValue!41701 () ValueCell!12606)

(declare-fun mapKey!41701 () (_ BitVec 32))

(assert (=> mapNonEmpty!41701 (= (arr!33768 _values!874) (store mapRest!41701 mapKey!41701 mapValue!41701))))

(declare-fun mapIsEmpty!41701 () Bool)

(assert (=> mapIsEmpty!41701 mapRes!41701))

(declare-fun b!1087581 () Bool)

(assert (=> b!1087581 (= e!621238 true)))

(declare-fun -!810 (ListLongMap!14939 (_ BitVec 64)) ListLongMap!14939)

(assert (=> b!1087581 (= (-!810 lt!484033 k0!904) lt!484039)))

(declare-datatypes ((Unit!35786 0))(
  ( (Unit!35787) )
))
(declare-fun lt!484037 () Unit!35786)

(declare-fun addRemoveCommutativeForDiffKeys!42 (ListLongMap!14939 (_ BitVec 64) V!40635 (_ BitVec 64)) Unit!35786)

(assert (=> b!1087581 (= lt!484037 (addRemoveCommutativeForDiffKeys!42 lt!484034 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1087582 () Bool)

(declare-fun e!621236 () Bool)

(assert (=> b!1087582 (= e!621236 (and e!621237 mapRes!41701))))

(declare-fun condMapEmpty!41701 () Bool)

(declare-fun mapDefault!41701 () ValueCell!12606)

(assert (=> b!1087582 (= condMapEmpty!41701 (= (arr!33768 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12606)) mapDefault!41701)))))

(declare-fun b!1087584 () Bool)

(declare-fun res!725306 () Bool)

(assert (=> b!1087584 (=> (not res!725306) (not e!621240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087584 (= res!725306 (validKeyInArray!0 k0!904))))

(declare-fun b!1087585 () Bool)

(assert (=> b!1087585 (= e!621239 tp_is_empty!26631)))

(declare-fun b!1087586 () Bool)

(declare-fun e!621241 () Bool)

(assert (=> b!1087586 (= e!621240 e!621241)))

(declare-fun res!725312 () Bool)

(assert (=> b!1087586 (=> (not res!725312) (not e!621241))))

(declare-fun lt!484044 () array!70187)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70187 (_ BitVec 32)) Bool)

(assert (=> b!1087586 (= res!725312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484044 mask!1414))))

(assert (=> b!1087586 (= lt!484044 (array!70188 (store (arr!33767 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34303 _keys!1070)))))

(declare-fun b!1087587 () Bool)

(declare-fun res!725313 () Bool)

(assert (=> b!1087587 (=> (not res!725313) (not e!621240))))

(declare-datatypes ((List!23558 0))(
  ( (Nil!23555) (Cons!23554 (h!24763 (_ BitVec 64)) (t!33245 List!23558)) )
))
(declare-fun arrayNoDuplicates!0 (array!70187 (_ BitVec 32) List!23558) Bool)

(assert (=> b!1087587 (= res!725313 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23555))))

(declare-fun b!1087588 () Bool)

(declare-fun res!725309 () Bool)

(assert (=> b!1087588 (=> (not res!725309) (not e!621240))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087588 (= res!725309 (and (= (size!34304 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34303 _keys!1070) (size!34304 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087589 () Bool)

(declare-fun res!725304 () Bool)

(assert (=> b!1087589 (=> (not res!725304) (not e!621241))))

(assert (=> b!1087589 (= res!725304 (arrayNoDuplicates!0 lt!484044 #b00000000000000000000000000000000 Nil!23555))))

(declare-fun b!1087590 () Bool)

(declare-fun res!725307 () Bool)

(assert (=> b!1087590 (=> (not res!725307) (not e!621240))))

(assert (=> b!1087590 (= res!725307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087591 () Bool)

(assert (=> b!1087591 (= e!621241 (not e!621235))))

(declare-fun res!725311 () Bool)

(assert (=> b!1087591 (=> res!725311 e!621235)))

(assert (=> b!1087591 (= res!725311 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40635)

(declare-fun getCurrentListMap!4260 (array!70187 array!70189 (_ BitVec 32) (_ BitVec 32) V!40635 V!40635 (_ BitVec 32) Int) ListLongMap!14939)

(assert (=> b!1087591 (= lt!484038 (getCurrentListMap!4260 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484042 () array!70189)

(assert (=> b!1087591 (= lt!484040 (getCurrentListMap!4260 lt!484044 lt!484042 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1087591 (and (= lt!484035 lt!484041) (= lt!484041 lt!484035))))

(assert (=> b!1087591 (= lt!484041 (-!810 lt!484034 k0!904))))

(declare-fun lt!484036 () Unit!35786)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!79 (array!70187 array!70189 (_ BitVec 32) (_ BitVec 32) V!40635 V!40635 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35786)

(assert (=> b!1087591 (= lt!484036 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!79 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4020 (array!70187 array!70189 (_ BitVec 32) (_ BitVec 32) V!40635 V!40635 (_ BitVec 32) Int) ListLongMap!14939)

(assert (=> b!1087591 (= lt!484035 (getCurrentListMapNoExtraKeys!4020 lt!484044 lt!484042 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2157 (Int (_ BitVec 64)) V!40635)

(assert (=> b!1087591 (= lt!484042 (array!70190 (store (arr!33768 _values!874) i!650 (ValueCellFull!12606 (dynLambda!2157 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34304 _values!874)))))

(assert (=> b!1087591 (= lt!484034 (getCurrentListMapNoExtraKeys!4020 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087591 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484045 () Unit!35786)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70187 (_ BitVec 64) (_ BitVec 32)) Unit!35786)

(assert (=> b!1087591 (= lt!484045 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087583 () Bool)

(declare-fun res!725310 () Bool)

(assert (=> b!1087583 (=> (not res!725310) (not e!621240))))

(assert (=> b!1087583 (= res!725310 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34303 _keys!1070))))))

(declare-fun res!725305 () Bool)

(assert (=> start!95976 (=> (not res!725305) (not e!621240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95976 (= res!725305 (validMask!0 mask!1414))))

(assert (=> start!95976 e!621240))

(assert (=> start!95976 tp!79736))

(assert (=> start!95976 true))

(assert (=> start!95976 tp_is_empty!26631))

(declare-fun array_inv!26046 (array!70187) Bool)

(assert (=> start!95976 (array_inv!26046 _keys!1070)))

(declare-fun array_inv!26047 (array!70189) Bool)

(assert (=> start!95976 (and (array_inv!26047 _values!874) e!621236)))

(assert (= (and start!95976 res!725305) b!1087588))

(assert (= (and b!1087588 res!725309) b!1087590))

(assert (= (and b!1087590 res!725307) b!1087587))

(assert (= (and b!1087587 res!725313) b!1087583))

(assert (= (and b!1087583 res!725310) b!1087584))

(assert (= (and b!1087584 res!725306) b!1087578))

(assert (= (and b!1087578 res!725303) b!1087586))

(assert (= (and b!1087586 res!725312) b!1087589))

(assert (= (and b!1087589 res!725304) b!1087591))

(assert (= (and b!1087591 (not res!725311)) b!1087580))

(assert (= (and b!1087580 (not res!725308)) b!1087581))

(assert (= (and b!1087582 condMapEmpty!41701) mapIsEmpty!41701))

(assert (= (and b!1087582 (not condMapEmpty!41701)) mapNonEmpty!41701))

(get-info :version)

(assert (= (and mapNonEmpty!41701 ((_ is ValueCellFull!12606) mapValue!41701)) b!1087585))

(assert (= (and b!1087582 ((_ is ValueCellFull!12606) mapDefault!41701)) b!1087579))

(assert (= start!95976 b!1087582))

(declare-fun b_lambda!17299 () Bool)

(assert (=> (not b_lambda!17299) (not b!1087591)))

(declare-fun t!33243 () Bool)

(declare-fun tb!7507 () Bool)

(assert (=> (and start!95976 (= defaultEntry!882 defaultEntry!882) t!33243) tb!7507))

(declare-fun result!15533 () Bool)

(assert (=> tb!7507 (= result!15533 tp_is_empty!26631)))

(assert (=> b!1087591 t!33243))

(declare-fun b_and!35935 () Bool)

(assert (= b_and!35933 (and (=> t!33243 result!15533) b_and!35935)))

(declare-fun m!1006487 () Bool)

(assert (=> b!1087580 m!1006487))

(declare-fun m!1006489 () Bool)

(assert (=> b!1087580 m!1006489))

(declare-fun m!1006491 () Bool)

(assert (=> b!1087580 m!1006491))

(declare-fun m!1006493 () Bool)

(assert (=> b!1087590 m!1006493))

(declare-fun m!1006495 () Bool)

(assert (=> b!1087581 m!1006495))

(declare-fun m!1006497 () Bool)

(assert (=> b!1087581 m!1006497))

(declare-fun m!1006499 () Bool)

(assert (=> b!1087584 m!1006499))

(declare-fun m!1006501 () Bool)

(assert (=> b!1087586 m!1006501))

(declare-fun m!1006503 () Bool)

(assert (=> b!1087586 m!1006503))

(declare-fun m!1006505 () Bool)

(assert (=> b!1087589 m!1006505))

(declare-fun m!1006507 () Bool)

(assert (=> start!95976 m!1006507))

(declare-fun m!1006509 () Bool)

(assert (=> start!95976 m!1006509))

(declare-fun m!1006511 () Bool)

(assert (=> start!95976 m!1006511))

(declare-fun m!1006513 () Bool)

(assert (=> b!1087587 m!1006513))

(declare-fun m!1006515 () Bool)

(assert (=> mapNonEmpty!41701 m!1006515))

(declare-fun m!1006517 () Bool)

(assert (=> b!1087591 m!1006517))

(declare-fun m!1006519 () Bool)

(assert (=> b!1087591 m!1006519))

(declare-fun m!1006521 () Bool)

(assert (=> b!1087591 m!1006521))

(declare-fun m!1006523 () Bool)

(assert (=> b!1087591 m!1006523))

(declare-fun m!1006525 () Bool)

(assert (=> b!1087591 m!1006525))

(declare-fun m!1006527 () Bool)

(assert (=> b!1087591 m!1006527))

(declare-fun m!1006529 () Bool)

(assert (=> b!1087591 m!1006529))

(declare-fun m!1006531 () Bool)

(assert (=> b!1087591 m!1006531))

(declare-fun m!1006533 () Bool)

(assert (=> b!1087591 m!1006533))

(declare-fun m!1006535 () Bool)

(assert (=> b!1087591 m!1006535))

(declare-fun m!1006537 () Bool)

(assert (=> b!1087578 m!1006537))

(check-sat (not b!1087581) (not b_next!22629) (not mapNonEmpty!41701) tp_is_empty!26631 (not b!1087590) (not start!95976) (not b_lambda!17299) (not b!1087580) (not b!1087584) b_and!35935 (not b!1087591) (not b!1087587) (not b!1087586) (not b!1087589))
(check-sat b_and!35935 (not b_next!22629))
