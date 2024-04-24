; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96252 () Bool)

(assert start!96252)

(declare-fun b_free!22669 () Bool)

(declare-fun b_next!22669 () Bool)

(assert (=> start!96252 (= b_free!22669 (not b_next!22669))))

(declare-fun tp!79856 () Bool)

(declare-fun b_and!36023 () Bool)

(assert (=> start!96252 (= tp!79856 b_and!36023)))

(declare-fun b!1089785 () Bool)

(declare-fun res!726495 () Bool)

(declare-fun e!622575 () Bool)

(assert (=> b!1089785 (=> (not res!726495) (not e!622575))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089785 (= res!726495 (validKeyInArray!0 k0!904))))

(declare-fun b!1089786 () Bool)

(declare-fun res!726487 () Bool)

(assert (=> b!1089786 (=> (not res!726487) (not e!622575))))

(declare-datatypes ((array!70307 0))(
  ( (array!70308 (arr!33821 (Array (_ BitVec 32) (_ BitVec 64))) (size!34358 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70307)

(declare-datatypes ((List!23609 0))(
  ( (Nil!23606) (Cons!23605 (h!24823 (_ BitVec 64)) (t!33328 List!23609)) )
))
(declare-fun arrayNoDuplicates!0 (array!70307 (_ BitVec 32) List!23609) Bool)

(assert (=> b!1089786 (= res!726487 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23606))))

(declare-fun b!1089787 () Bool)

(declare-fun res!726485 () Bool)

(assert (=> b!1089787 (=> (not res!726485) (not e!622575))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089787 (= res!726485 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34358 _keys!1070))))))

(declare-fun b!1089788 () Bool)

(declare-fun res!726491 () Bool)

(declare-fun e!622572 () Bool)

(assert (=> b!1089788 (=> (not res!726491) (not e!622572))))

(declare-fun lt!485330 () array!70307)

(assert (=> b!1089788 (= res!726491 (arrayNoDuplicates!0 lt!485330 #b00000000000000000000000000000000 Nil!23606))))

(declare-fun b!1089789 () Bool)

(assert (=> b!1089789 (= e!622575 e!622572)))

(declare-fun res!726493 () Bool)

(assert (=> b!1089789 (=> (not res!726493) (not e!622572))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70307 (_ BitVec 32)) Bool)

(assert (=> b!1089789 (= res!726493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485330 mask!1414))))

(assert (=> b!1089789 (= lt!485330 (array!70308 (store (arr!33821 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34358 _keys!1070)))))

(declare-fun b!1089790 () Bool)

(declare-fun e!622576 () Bool)

(assert (=> b!1089790 (= e!622576 (bvsle #b00000000000000000000000000000000 (size!34358 _keys!1070)))))

(declare-datatypes ((V!40689 0))(
  ( (V!40690 (val!13392 Int)) )
))
(declare-datatypes ((tuple2!17016 0))(
  ( (tuple2!17017 (_1!8519 (_ BitVec 64)) (_2!8519 V!40689)) )
))
(declare-datatypes ((List!23610 0))(
  ( (Nil!23607) (Cons!23606 (h!24824 tuple2!17016) (t!33329 List!23610)) )
))
(declare-datatypes ((ListLongMap!14993 0))(
  ( (ListLongMap!14994 (toList!7512 List!23610)) )
))
(declare-fun lt!485339 () ListLongMap!14993)

(declare-fun lt!485335 () ListLongMap!14993)

(declare-fun -!823 (ListLongMap!14993 (_ BitVec 64)) ListLongMap!14993)

(assert (=> b!1089790 (= (-!823 lt!485339 k0!904) lt!485335)))

(declare-datatypes ((Unit!35813 0))(
  ( (Unit!35814) )
))
(declare-fun lt!485336 () Unit!35813)

(declare-fun lt!485328 () ListLongMap!14993)

(declare-fun zeroValue!831 () V!40689)

(declare-fun addRemoveCommutativeForDiffKeys!62 (ListLongMap!14993 (_ BitVec 64) V!40689 (_ BitVec 64)) Unit!35813)

(assert (=> b!1089790 (= lt!485336 (addRemoveCommutativeForDiffKeys!62 lt!485328 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1089791 () Bool)

(declare-fun e!622571 () Bool)

(declare-fun e!622577 () Bool)

(declare-fun mapRes!41761 () Bool)

(assert (=> b!1089791 (= e!622571 (and e!622577 mapRes!41761))))

(declare-fun condMapEmpty!41761 () Bool)

(declare-datatypes ((ValueCell!12626 0))(
  ( (ValueCellFull!12626 (v!16009 V!40689)) (EmptyCell!12626) )
))
(declare-datatypes ((array!70309 0))(
  ( (array!70310 (arr!33822 (Array (_ BitVec 32) ValueCell!12626)) (size!34359 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70309)

(declare-fun mapDefault!41761 () ValueCell!12626)

(assert (=> b!1089791 (= condMapEmpty!41761 (= (arr!33822 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12626)) mapDefault!41761)))))

(declare-fun res!726486 () Bool)

(assert (=> start!96252 (=> (not res!726486) (not e!622575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96252 (= res!726486 (validMask!0 mask!1414))))

(assert (=> start!96252 e!622575))

(assert (=> start!96252 tp!79856))

(assert (=> start!96252 true))

(declare-fun tp_is_empty!26671 () Bool)

(assert (=> start!96252 tp_is_empty!26671))

(declare-fun array_inv!26132 (array!70307) Bool)

(assert (=> start!96252 (array_inv!26132 _keys!1070)))

(declare-fun array_inv!26133 (array!70309) Bool)

(assert (=> start!96252 (and (array_inv!26133 _values!874) e!622571)))

(declare-fun b!1089792 () Bool)

(declare-fun e!622573 () Bool)

(assert (=> b!1089792 (= e!622573 e!622576)))

(declare-fun res!726488 () Bool)

(assert (=> b!1089792 (=> res!726488 e!622576)))

(assert (=> b!1089792 (= res!726488 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!485333 () ListLongMap!14993)

(assert (=> b!1089792 (= lt!485333 lt!485335)))

(declare-fun lt!485329 () ListLongMap!14993)

(declare-fun lt!485334 () tuple2!17016)

(declare-fun +!3332 (ListLongMap!14993 tuple2!17016) ListLongMap!14993)

(assert (=> b!1089792 (= lt!485335 (+!3332 lt!485329 lt!485334))))

(declare-fun lt!485337 () ListLongMap!14993)

(assert (=> b!1089792 (= lt!485337 lt!485339)))

(assert (=> b!1089792 (= lt!485339 (+!3332 lt!485328 lt!485334))))

(declare-fun lt!485338 () ListLongMap!14993)

(assert (=> b!1089792 (= lt!485333 (+!3332 lt!485338 lt!485334))))

(assert (=> b!1089792 (= lt!485334 (tuple2!17017 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089793 () Bool)

(declare-fun res!726489 () Bool)

(assert (=> b!1089793 (=> (not res!726489) (not e!622575))))

(assert (=> b!1089793 (= res!726489 (= (select (arr!33821 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41761 () Bool)

(declare-fun tp!79855 () Bool)

(declare-fun e!622574 () Bool)

(assert (=> mapNonEmpty!41761 (= mapRes!41761 (and tp!79855 e!622574))))

(declare-fun mapRest!41761 () (Array (_ BitVec 32) ValueCell!12626))

(declare-fun mapValue!41761 () ValueCell!12626)

(declare-fun mapKey!41761 () (_ BitVec 32))

(assert (=> mapNonEmpty!41761 (= (arr!33822 _values!874) (store mapRest!41761 mapKey!41761 mapValue!41761))))

(declare-fun b!1089794 () Bool)

(declare-fun res!726490 () Bool)

(assert (=> b!1089794 (=> (not res!726490) (not e!622575))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089794 (= res!726490 (and (= (size!34359 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34358 _keys!1070) (size!34359 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089795 () Bool)

(assert (=> b!1089795 (= e!622574 tp_is_empty!26671)))

(declare-fun mapIsEmpty!41761 () Bool)

(assert (=> mapIsEmpty!41761 mapRes!41761))

(declare-fun b!1089796 () Bool)

(assert (=> b!1089796 (= e!622577 tp_is_empty!26671)))

(declare-fun b!1089797 () Bool)

(assert (=> b!1089797 (= e!622572 (not e!622573))))

(declare-fun res!726494 () Bool)

(assert (=> b!1089797 (=> res!726494 e!622573)))

(assert (=> b!1089797 (= res!726494 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun minValue!831 () V!40689)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4271 (array!70307 array!70309 (_ BitVec 32) (_ BitVec 32) V!40689 V!40689 (_ BitVec 32) Int) ListLongMap!14993)

(assert (=> b!1089797 (= lt!485337 (getCurrentListMap!4271 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485340 () array!70309)

(assert (=> b!1089797 (= lt!485333 (getCurrentListMap!4271 lt!485330 lt!485340 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1089797 (and (= lt!485338 lt!485329) (= lt!485329 lt!485338))))

(assert (=> b!1089797 (= lt!485329 (-!823 lt!485328 k0!904))))

(declare-fun lt!485332 () Unit!35813)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!100 (array!70307 array!70309 (_ BitVec 32) (_ BitVec 32) V!40689 V!40689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35813)

(assert (=> b!1089797 (= lt!485332 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!100 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4076 (array!70307 array!70309 (_ BitVec 32) (_ BitVec 32) V!40689 V!40689 (_ BitVec 32) Int) ListLongMap!14993)

(assert (=> b!1089797 (= lt!485338 (getCurrentListMapNoExtraKeys!4076 lt!485330 lt!485340 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2197 (Int (_ BitVec 64)) V!40689)

(assert (=> b!1089797 (= lt!485340 (array!70310 (store (arr!33822 _values!874) i!650 (ValueCellFull!12626 (dynLambda!2197 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34359 _values!874)))))

(assert (=> b!1089797 (= lt!485328 (getCurrentListMapNoExtraKeys!4076 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089797 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485331 () Unit!35813)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70307 (_ BitVec 64) (_ BitVec 32)) Unit!35813)

(assert (=> b!1089797 (= lt!485331 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089798 () Bool)

(declare-fun res!726492 () Bool)

(assert (=> b!1089798 (=> (not res!726492) (not e!622575))))

(assert (=> b!1089798 (= res!726492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96252 res!726486) b!1089794))

(assert (= (and b!1089794 res!726490) b!1089798))

(assert (= (and b!1089798 res!726492) b!1089786))

(assert (= (and b!1089786 res!726487) b!1089787))

(assert (= (and b!1089787 res!726485) b!1089785))

(assert (= (and b!1089785 res!726495) b!1089793))

(assert (= (and b!1089793 res!726489) b!1089789))

(assert (= (and b!1089789 res!726493) b!1089788))

(assert (= (and b!1089788 res!726491) b!1089797))

(assert (= (and b!1089797 (not res!726494)) b!1089792))

(assert (= (and b!1089792 (not res!726488)) b!1089790))

(assert (= (and b!1089791 condMapEmpty!41761) mapIsEmpty!41761))

(assert (= (and b!1089791 (not condMapEmpty!41761)) mapNonEmpty!41761))

(get-info :version)

(assert (= (and mapNonEmpty!41761 ((_ is ValueCellFull!12626) mapValue!41761)) b!1089795))

(assert (= (and b!1089791 ((_ is ValueCellFull!12626) mapDefault!41761)) b!1089796))

(assert (= start!96252 b!1089791))

(declare-fun b_lambda!17349 () Bool)

(assert (=> (not b_lambda!17349) (not b!1089797)))

(declare-fun t!33327 () Bool)

(declare-fun tb!7539 () Bool)

(assert (=> (and start!96252 (= defaultEntry!882 defaultEntry!882) t!33327) tb!7539))

(declare-fun result!15605 () Bool)

(assert (=> tb!7539 (= result!15605 tp_is_empty!26671)))

(assert (=> b!1089797 t!33327))

(declare-fun b_and!36025 () Bool)

(assert (= b_and!36023 (and (=> t!33327 result!15605) b_and!36025)))

(declare-fun m!1009199 () Bool)

(assert (=> b!1089793 m!1009199))

(declare-fun m!1009201 () Bool)

(assert (=> b!1089792 m!1009201))

(declare-fun m!1009203 () Bool)

(assert (=> b!1089792 m!1009203))

(declare-fun m!1009205 () Bool)

(assert (=> b!1089792 m!1009205))

(declare-fun m!1009207 () Bool)

(assert (=> b!1089789 m!1009207))

(declare-fun m!1009209 () Bool)

(assert (=> b!1089789 m!1009209))

(declare-fun m!1009211 () Bool)

(assert (=> b!1089798 m!1009211))

(declare-fun m!1009213 () Bool)

(assert (=> b!1089788 m!1009213))

(declare-fun m!1009215 () Bool)

(assert (=> b!1089786 m!1009215))

(declare-fun m!1009217 () Bool)

(assert (=> b!1089797 m!1009217))

(declare-fun m!1009219 () Bool)

(assert (=> b!1089797 m!1009219))

(declare-fun m!1009221 () Bool)

(assert (=> b!1089797 m!1009221))

(declare-fun m!1009223 () Bool)

(assert (=> b!1089797 m!1009223))

(declare-fun m!1009225 () Bool)

(assert (=> b!1089797 m!1009225))

(declare-fun m!1009227 () Bool)

(assert (=> b!1089797 m!1009227))

(declare-fun m!1009229 () Bool)

(assert (=> b!1089797 m!1009229))

(declare-fun m!1009231 () Bool)

(assert (=> b!1089797 m!1009231))

(declare-fun m!1009233 () Bool)

(assert (=> b!1089797 m!1009233))

(declare-fun m!1009235 () Bool)

(assert (=> b!1089797 m!1009235))

(declare-fun m!1009237 () Bool)

(assert (=> b!1089785 m!1009237))

(declare-fun m!1009239 () Bool)

(assert (=> b!1089790 m!1009239))

(declare-fun m!1009241 () Bool)

(assert (=> b!1089790 m!1009241))

(declare-fun m!1009243 () Bool)

(assert (=> start!96252 m!1009243))

(declare-fun m!1009245 () Bool)

(assert (=> start!96252 m!1009245))

(declare-fun m!1009247 () Bool)

(assert (=> start!96252 m!1009247))

(declare-fun m!1009249 () Bool)

(assert (=> mapNonEmpty!41761 m!1009249))

(check-sat (not b!1089790) b_and!36025 (not b!1089792) (not b!1089798) (not b!1089788) (not b!1089789) (not mapNonEmpty!41761) (not b_lambda!17349) tp_is_empty!26671 (not b_next!22669) (not b!1089786) (not start!96252) (not b!1089797) (not b!1089785))
(check-sat b_and!36025 (not b_next!22669))
