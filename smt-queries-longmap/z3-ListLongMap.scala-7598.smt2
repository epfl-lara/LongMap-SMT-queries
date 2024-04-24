; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96144 () Bool)

(assert start!96144)

(declare-fun b_free!22561 () Bool)

(declare-fun b_next!22561 () Bool)

(assert (=> start!96144 (= b_free!22561 (not b_next!22561))))

(declare-fun tp!79532 () Bool)

(declare-fun b_and!35807 () Bool)

(assert (=> start!96144 (= tp!79532 b_and!35807)))

(declare-fun b!1087400 () Bool)

(declare-fun e!621274 () Bool)

(declare-fun tp_is_empty!26563 () Bool)

(assert (=> b!1087400 (= e!621274 tp_is_empty!26563)))

(declare-fun mapIsEmpty!41599 () Bool)

(declare-fun mapRes!41599 () Bool)

(assert (=> mapIsEmpty!41599 mapRes!41599))

(declare-fun b!1087401 () Bool)

(declare-fun res!724698 () Bool)

(declare-fun e!621275 () Bool)

(assert (=> b!1087401 (=> (not res!724698) (not e!621275))))

(declare-datatypes ((array!70097 0))(
  ( (array!70098 (arr!33716 (Array (_ BitVec 32) (_ BitVec 64))) (size!34253 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70097)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70097 (_ BitVec 32)) Bool)

(assert (=> b!1087401 (= res!724698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087402 () Bool)

(declare-fun e!621278 () Bool)

(assert (=> b!1087402 (= e!621278 true)))

(declare-fun k0!904 () (_ BitVec 64))

(declare-datatypes ((V!40545 0))(
  ( (V!40546 (val!13338 Int)) )
))
(declare-datatypes ((tuple2!16924 0))(
  ( (tuple2!16925 (_1!8473 (_ BitVec 64)) (_2!8473 V!40545)) )
))
(declare-datatypes ((List!23522 0))(
  ( (Nil!23519) (Cons!23518 (h!24736 tuple2!16924) (t!33133 List!23522)) )
))
(declare-datatypes ((ListLongMap!14901 0))(
  ( (ListLongMap!14902 (toList!7466 List!23522)) )
))
(declare-fun lt!482948 () ListLongMap!14901)

(declare-fun lt!482935 () ListLongMap!14901)

(declare-fun lt!482944 () tuple2!16924)

(declare-fun -!778 (ListLongMap!14901 (_ BitVec 64)) ListLongMap!14901)

(declare-fun +!3291 (ListLongMap!14901 tuple2!16924) ListLongMap!14901)

(assert (=> b!1087402 (= (-!778 lt!482948 k0!904) (+!3291 lt!482935 lt!482944))))

(declare-fun minValue!831 () V!40545)

(declare-fun lt!482938 () ListLongMap!14901)

(declare-datatypes ((Unit!35723 0))(
  ( (Unit!35724) )
))
(declare-fun lt!482933 () Unit!35723)

(declare-fun addRemoveCommutativeForDiffKeys!25 (ListLongMap!14901 (_ BitVec 64) V!40545 (_ BitVec 64)) Unit!35723)

(assert (=> b!1087402 (= lt!482933 (addRemoveCommutativeForDiffKeys!25 lt!482938 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1087403 () Bool)

(declare-fun res!724700 () Bool)

(assert (=> b!1087403 (=> (not res!724700) (not e!621275))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12572 0))(
  ( (ValueCellFull!12572 (v!15955 V!40545)) (EmptyCell!12572) )
))
(declare-datatypes ((array!70099 0))(
  ( (array!70100 (arr!33717 (Array (_ BitVec 32) ValueCell!12572)) (size!34254 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70099)

(assert (=> b!1087403 (= res!724700 (and (= (size!34254 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34253 _keys!1070) (size!34254 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087404 () Bool)

(declare-fun e!621276 () Bool)

(declare-fun e!621280 () Bool)

(assert (=> b!1087404 (= e!621276 (not e!621280))))

(declare-fun res!724699 () Bool)

(assert (=> b!1087404 (=> res!724699 e!621280)))

(assert (=> b!1087404 (= res!724699 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!482934 () ListLongMap!14901)

(declare-fun zeroValue!831 () V!40545)

(declare-fun getCurrentListMap!4234 (array!70097 array!70099 (_ BitVec 32) (_ BitVec 32) V!40545 V!40545 (_ BitVec 32) Int) ListLongMap!14901)

(assert (=> b!1087404 (= lt!482934 (getCurrentListMap!4234 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482947 () array!70099)

(declare-fun lt!482946 () ListLongMap!14901)

(declare-fun lt!482942 () array!70097)

(assert (=> b!1087404 (= lt!482946 (getCurrentListMap!4234 lt!482942 lt!482947 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482945 () ListLongMap!14901)

(declare-fun lt!482936 () ListLongMap!14901)

(assert (=> b!1087404 (and (= lt!482945 lt!482936) (= lt!482936 lt!482945))))

(declare-fun lt!482949 () ListLongMap!14901)

(assert (=> b!1087404 (= lt!482936 (-!778 lt!482949 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!482941 () Unit!35723)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!63 (array!70097 array!70099 (_ BitVec 32) (_ BitVec 32) V!40545 V!40545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35723)

(assert (=> b!1087404 (= lt!482941 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!63 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4039 (array!70097 array!70099 (_ BitVec 32) (_ BitVec 32) V!40545 V!40545 (_ BitVec 32) Int) ListLongMap!14901)

(assert (=> b!1087404 (= lt!482945 (getCurrentListMapNoExtraKeys!4039 lt!482942 lt!482947 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2160 (Int (_ BitVec 64)) V!40545)

(assert (=> b!1087404 (= lt!482947 (array!70100 (store (arr!33717 _values!874) i!650 (ValueCellFull!12572 (dynLambda!2160 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34254 _values!874)))))

(assert (=> b!1087404 (= lt!482949 (getCurrentListMapNoExtraKeys!4039 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087404 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482939 () Unit!35723)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70097 (_ BitVec 64) (_ BitVec 32)) Unit!35723)

(assert (=> b!1087404 (= lt!482939 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087405 () Bool)

(declare-fun res!724703 () Bool)

(assert (=> b!1087405 (=> (not res!724703) (not e!621276))))

(declare-datatypes ((List!23523 0))(
  ( (Nil!23520) (Cons!23519 (h!24737 (_ BitVec 64)) (t!33134 List!23523)) )
))
(declare-fun arrayNoDuplicates!0 (array!70097 (_ BitVec 32) List!23523) Bool)

(assert (=> b!1087405 (= res!724703 (arrayNoDuplicates!0 lt!482942 #b00000000000000000000000000000000 Nil!23520))))

(declare-fun mapNonEmpty!41599 () Bool)

(declare-fun tp!79531 () Bool)

(assert (=> mapNonEmpty!41599 (= mapRes!41599 (and tp!79531 e!621274))))

(declare-fun mapKey!41599 () (_ BitVec 32))

(declare-fun mapValue!41599 () ValueCell!12572)

(declare-fun mapRest!41599 () (Array (_ BitVec 32) ValueCell!12572))

(assert (=> mapNonEmpty!41599 (= (arr!33717 _values!874) (store mapRest!41599 mapKey!41599 mapValue!41599))))

(declare-fun b!1087406 () Bool)

(declare-fun e!621279 () Bool)

(declare-fun e!621277 () Bool)

(assert (=> b!1087406 (= e!621279 (and e!621277 mapRes!41599))))

(declare-fun condMapEmpty!41599 () Bool)

(declare-fun mapDefault!41599 () ValueCell!12572)

(assert (=> b!1087406 (= condMapEmpty!41599 (= (arr!33717 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12572)) mapDefault!41599)))))

(declare-fun res!724695 () Bool)

(assert (=> start!96144 (=> (not res!724695) (not e!621275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96144 (= res!724695 (validMask!0 mask!1414))))

(assert (=> start!96144 e!621275))

(assert (=> start!96144 tp!79532))

(assert (=> start!96144 true))

(assert (=> start!96144 tp_is_empty!26563))

(declare-fun array_inv!26060 (array!70097) Bool)

(assert (=> start!96144 (array_inv!26060 _keys!1070)))

(declare-fun array_inv!26061 (array!70099) Bool)

(assert (=> start!96144 (and (array_inv!26061 _values!874) e!621279)))

(declare-fun b!1087407 () Bool)

(assert (=> b!1087407 (= e!621275 e!621276)))

(declare-fun res!724694 () Bool)

(assert (=> b!1087407 (=> (not res!724694) (not e!621276))))

(assert (=> b!1087407 (= res!724694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482942 mask!1414))))

(assert (=> b!1087407 (= lt!482942 (array!70098 (store (arr!33716 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34253 _keys!1070)))))

(declare-fun b!1087408 () Bool)

(declare-fun res!724696 () Bool)

(assert (=> b!1087408 (=> (not res!724696) (not e!621275))))

(assert (=> b!1087408 (= res!724696 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34253 _keys!1070))))))

(declare-fun b!1087409 () Bool)

(declare-fun res!724702 () Bool)

(assert (=> b!1087409 (=> (not res!724702) (not e!621275))))

(assert (=> b!1087409 (= res!724702 (= (select (arr!33716 _keys!1070) i!650) k0!904))))

(declare-fun b!1087410 () Bool)

(assert (=> b!1087410 (= e!621280 e!621278)))

(declare-fun res!724704 () Bool)

(assert (=> b!1087410 (=> res!724704 e!621278)))

(assert (=> b!1087410 (= res!724704 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!482943 () ListLongMap!14901)

(assert (=> b!1087410 (= lt!482935 lt!482943)))

(assert (=> b!1087410 (= lt!482935 (-!778 lt!482938 k0!904))))

(declare-fun lt!482940 () Unit!35723)

(assert (=> b!1087410 (= lt!482940 (addRemoveCommutativeForDiffKeys!25 lt!482949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1087410 (= lt!482946 (+!3291 lt!482943 lt!482944))))

(declare-fun lt!482937 () tuple2!16924)

(assert (=> b!1087410 (= lt!482943 (+!3291 lt!482936 lt!482937))))

(assert (=> b!1087410 (= lt!482934 lt!482948)))

(assert (=> b!1087410 (= lt!482948 (+!3291 lt!482938 lt!482944))))

(assert (=> b!1087410 (= lt!482938 (+!3291 lt!482949 lt!482937))))

(assert (=> b!1087410 (= lt!482946 (+!3291 (+!3291 lt!482945 lt!482937) lt!482944))))

(assert (=> b!1087410 (= lt!482944 (tuple2!16925 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1087410 (= lt!482937 (tuple2!16925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087411 () Bool)

(declare-fun res!724701 () Bool)

(assert (=> b!1087411 (=> (not res!724701) (not e!621275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087411 (= res!724701 (validKeyInArray!0 k0!904))))

(declare-fun b!1087412 () Bool)

(assert (=> b!1087412 (= e!621277 tp_is_empty!26563)))

(declare-fun b!1087413 () Bool)

(declare-fun res!724697 () Bool)

(assert (=> b!1087413 (=> (not res!724697) (not e!621275))))

(assert (=> b!1087413 (= res!724697 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23520))))

(assert (= (and start!96144 res!724695) b!1087403))

(assert (= (and b!1087403 res!724700) b!1087401))

(assert (= (and b!1087401 res!724698) b!1087413))

(assert (= (and b!1087413 res!724697) b!1087408))

(assert (= (and b!1087408 res!724696) b!1087411))

(assert (= (and b!1087411 res!724701) b!1087409))

(assert (= (and b!1087409 res!724702) b!1087407))

(assert (= (and b!1087407 res!724694) b!1087405))

(assert (= (and b!1087405 res!724703) b!1087404))

(assert (= (and b!1087404 (not res!724699)) b!1087410))

(assert (= (and b!1087410 (not res!724704)) b!1087402))

(assert (= (and b!1087406 condMapEmpty!41599) mapIsEmpty!41599))

(assert (= (and b!1087406 (not condMapEmpty!41599)) mapNonEmpty!41599))

(get-info :version)

(assert (= (and mapNonEmpty!41599 ((_ is ValueCellFull!12572) mapValue!41599)) b!1087400))

(assert (= (and b!1087406 ((_ is ValueCellFull!12572) mapDefault!41599)) b!1087412))

(assert (= start!96144 b!1087406))

(declare-fun b_lambda!17241 () Bool)

(assert (=> (not b_lambda!17241) (not b!1087404)))

(declare-fun t!33132 () Bool)

(declare-fun tb!7431 () Bool)

(assert (=> (and start!96144 (= defaultEntry!882 defaultEntry!882) t!33132) tb!7431))

(declare-fun result!15389 () Bool)

(assert (=> tb!7431 (= result!15389 tp_is_empty!26563)))

(assert (=> b!1087404 t!33132))

(declare-fun b_and!35809 () Bool)

(assert (= b_and!35807 (and (=> t!33132 result!15389) b_and!35809)))

(declare-fun m!1006079 () Bool)

(assert (=> b!1087413 m!1006079))

(declare-fun m!1006081 () Bool)

(assert (=> b!1087401 m!1006081))

(declare-fun m!1006083 () Bool)

(assert (=> b!1087404 m!1006083))

(declare-fun m!1006085 () Bool)

(assert (=> b!1087404 m!1006085))

(declare-fun m!1006087 () Bool)

(assert (=> b!1087404 m!1006087))

(declare-fun m!1006089 () Bool)

(assert (=> b!1087404 m!1006089))

(declare-fun m!1006091 () Bool)

(assert (=> b!1087404 m!1006091))

(declare-fun m!1006093 () Bool)

(assert (=> b!1087404 m!1006093))

(declare-fun m!1006095 () Bool)

(assert (=> b!1087404 m!1006095))

(declare-fun m!1006097 () Bool)

(assert (=> b!1087404 m!1006097))

(declare-fun m!1006099 () Bool)

(assert (=> b!1087404 m!1006099))

(declare-fun m!1006101 () Bool)

(assert (=> b!1087404 m!1006101))

(declare-fun m!1006103 () Bool)

(assert (=> start!96144 m!1006103))

(declare-fun m!1006105 () Bool)

(assert (=> start!96144 m!1006105))

(declare-fun m!1006107 () Bool)

(assert (=> start!96144 m!1006107))

(declare-fun m!1006109 () Bool)

(assert (=> b!1087402 m!1006109))

(declare-fun m!1006111 () Bool)

(assert (=> b!1087402 m!1006111))

(declare-fun m!1006113 () Bool)

(assert (=> b!1087402 m!1006113))

(declare-fun m!1006115 () Bool)

(assert (=> b!1087405 m!1006115))

(declare-fun m!1006117 () Bool)

(assert (=> b!1087411 m!1006117))

(declare-fun m!1006119 () Bool)

(assert (=> b!1087407 m!1006119))

(declare-fun m!1006121 () Bool)

(assert (=> b!1087407 m!1006121))

(declare-fun m!1006123 () Bool)

(assert (=> b!1087409 m!1006123))

(declare-fun m!1006125 () Bool)

(assert (=> b!1087410 m!1006125))

(declare-fun m!1006127 () Bool)

(assert (=> b!1087410 m!1006127))

(declare-fun m!1006129 () Bool)

(assert (=> b!1087410 m!1006129))

(declare-fun m!1006131 () Bool)

(assert (=> b!1087410 m!1006131))

(declare-fun m!1006133 () Bool)

(assert (=> b!1087410 m!1006133))

(assert (=> b!1087410 m!1006129))

(declare-fun m!1006135 () Bool)

(assert (=> b!1087410 m!1006135))

(declare-fun m!1006137 () Bool)

(assert (=> b!1087410 m!1006137))

(declare-fun m!1006139 () Bool)

(assert (=> b!1087410 m!1006139))

(declare-fun m!1006141 () Bool)

(assert (=> mapNonEmpty!41599 m!1006141))

(check-sat (not start!96144) (not b_lambda!17241) (not b!1087405) (not b!1087413) tp_is_empty!26563 (not b!1087401) (not b!1087404) b_and!35809 (not b!1087402) (not b!1087411) (not b!1087410) (not mapNonEmpty!41599) (not b!1087407) (not b_next!22561))
(check-sat b_and!35809 (not b_next!22561))
