; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96156 () Bool)

(assert start!96156)

(declare-fun b_free!22573 () Bool)

(declare-fun b_next!22573 () Bool)

(assert (=> start!96156 (= b_free!22573 (not b_next!22573))))

(declare-fun tp!79567 () Bool)

(declare-fun b_and!35831 () Bool)

(assert (=> start!96156 (= tp!79567 b_and!35831)))

(declare-fun mapIsEmpty!41617 () Bool)

(declare-fun mapRes!41617 () Bool)

(assert (=> mapIsEmpty!41617 mapRes!41617))

(declare-fun b!1087664 () Bool)

(declare-fun e!621423 () Bool)

(assert (=> b!1087664 (= e!621423 true)))

(declare-fun k0!904 () (_ BitVec 64))

(declare-datatypes ((V!40561 0))(
  ( (V!40562 (val!13344 Int)) )
))
(declare-datatypes ((tuple2!16934 0))(
  ( (tuple2!16935 (_1!8478 (_ BitVec 64)) (_2!8478 V!40561)) )
))
(declare-datatypes ((List!23532 0))(
  ( (Nil!23529) (Cons!23528 (h!24746 tuple2!16934) (t!33155 List!23532)) )
))
(declare-datatypes ((ListLongMap!14911 0))(
  ( (ListLongMap!14912 (toList!7471 List!23532)) )
))
(declare-fun lt!483242 () ListLongMap!14911)

(declare-fun lt!483248 () tuple2!16934)

(declare-fun lt!483246 () ListLongMap!14911)

(declare-fun -!783 (ListLongMap!14911 (_ BitVec 64)) ListLongMap!14911)

(declare-fun +!3295 (ListLongMap!14911 tuple2!16934) ListLongMap!14911)

(assert (=> b!1087664 (= (-!783 lt!483246 k0!904) (+!3295 lt!483242 lt!483248))))

(declare-datatypes ((Unit!35733 0))(
  ( (Unit!35734) )
))
(declare-fun lt!483240 () Unit!35733)

(declare-fun minValue!831 () V!40561)

(declare-fun lt!483253 () ListLongMap!14911)

(declare-fun addRemoveCommutativeForDiffKeys!29 (ListLongMap!14911 (_ BitVec 64) V!40561 (_ BitVec 64)) Unit!35733)

(assert (=> b!1087664 (= lt!483240 (addRemoveCommutativeForDiffKeys!29 lt!483253 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1087665 () Bool)

(declare-fun res!724893 () Bool)

(declare-fun e!621425 () Bool)

(assert (=> b!1087665 (=> (not res!724893) (not e!621425))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70119 0))(
  ( (array!70120 (arr!33727 (Array (_ BitVec 32) (_ BitVec 64))) (size!34264 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70119)

(assert (=> b!1087665 (= res!724893 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34264 _keys!1070))))))

(declare-fun b!1087666 () Bool)

(declare-fun e!621420 () Bool)

(declare-fun e!621419 () Bool)

(assert (=> b!1087666 (= e!621420 (and e!621419 mapRes!41617))))

(declare-fun condMapEmpty!41617 () Bool)

(declare-datatypes ((ValueCell!12578 0))(
  ( (ValueCellFull!12578 (v!15961 V!40561)) (EmptyCell!12578) )
))
(declare-datatypes ((array!70121 0))(
  ( (array!70122 (arr!33728 (Array (_ BitVec 32) ValueCell!12578)) (size!34265 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70121)

(declare-fun mapDefault!41617 () ValueCell!12578)

(assert (=> b!1087666 (= condMapEmpty!41617 (= (arr!33728 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12578)) mapDefault!41617)))))

(declare-fun b!1087667 () Bool)

(declare-fun tp_is_empty!26575 () Bool)

(assert (=> b!1087667 (= e!621419 tp_is_empty!26575)))

(declare-fun b!1087668 () Bool)

(declare-fun e!621422 () Bool)

(assert (=> b!1087668 (= e!621425 e!621422)))

(declare-fun res!724897 () Bool)

(assert (=> b!1087668 (=> (not res!724897) (not e!621422))))

(declare-fun lt!483252 () array!70119)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70119 (_ BitVec 32)) Bool)

(assert (=> b!1087668 (= res!724897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483252 mask!1414))))

(assert (=> b!1087668 (= lt!483252 (array!70120 (store (arr!33727 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34264 _keys!1070)))))

(declare-fun res!724892 () Bool)

(assert (=> start!96156 (=> (not res!724892) (not e!621425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96156 (= res!724892 (validMask!0 mask!1414))))

(assert (=> start!96156 e!621425))

(assert (=> start!96156 tp!79567))

(assert (=> start!96156 true))

(assert (=> start!96156 tp_is_empty!26575))

(declare-fun array_inv!26068 (array!70119) Bool)

(assert (=> start!96156 (array_inv!26068 _keys!1070)))

(declare-fun array_inv!26069 (array!70121) Bool)

(assert (=> start!96156 (and (array_inv!26069 _values!874) e!621420)))

(declare-fun b!1087669 () Bool)

(declare-fun res!724898 () Bool)

(assert (=> b!1087669 (=> (not res!724898) (not e!621425))))

(assert (=> b!1087669 (= res!724898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087670 () Bool)

(declare-fun e!621421 () Bool)

(assert (=> b!1087670 (= e!621421 e!621423)))

(declare-fun res!724895 () Bool)

(assert (=> b!1087670 (=> res!724895 e!621423)))

(assert (=> b!1087670 (= res!724895 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!483249 () ListLongMap!14911)

(assert (=> b!1087670 (= lt!483242 lt!483249)))

(assert (=> b!1087670 (= lt!483242 (-!783 lt!483253 k0!904))))

(declare-fun lt!483255 () Unit!35733)

(declare-fun lt!483251 () ListLongMap!14911)

(declare-fun zeroValue!831 () V!40561)

(assert (=> b!1087670 (= lt!483255 (addRemoveCommutativeForDiffKeys!29 lt!483251 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!483241 () ListLongMap!14911)

(assert (=> b!1087670 (= lt!483241 (+!3295 lt!483249 lt!483248))))

(declare-fun lt!483244 () ListLongMap!14911)

(declare-fun lt!483245 () tuple2!16934)

(assert (=> b!1087670 (= lt!483249 (+!3295 lt!483244 lt!483245))))

(declare-fun lt!483247 () ListLongMap!14911)

(assert (=> b!1087670 (= lt!483247 lt!483246)))

(assert (=> b!1087670 (= lt!483246 (+!3295 lt!483253 lt!483248))))

(assert (=> b!1087670 (= lt!483253 (+!3295 lt!483251 lt!483245))))

(declare-fun lt!483254 () ListLongMap!14911)

(assert (=> b!1087670 (= lt!483241 (+!3295 (+!3295 lt!483254 lt!483245) lt!483248))))

(assert (=> b!1087670 (= lt!483248 (tuple2!16935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1087670 (= lt!483245 (tuple2!16935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapNonEmpty!41617 () Bool)

(declare-fun tp!79568 () Bool)

(declare-fun e!621418 () Bool)

(assert (=> mapNonEmpty!41617 (= mapRes!41617 (and tp!79568 e!621418))))

(declare-fun mapRest!41617 () (Array (_ BitVec 32) ValueCell!12578))

(declare-fun mapKey!41617 () (_ BitVec 32))

(declare-fun mapValue!41617 () ValueCell!12578)

(assert (=> mapNonEmpty!41617 (= (arr!33728 _values!874) (store mapRest!41617 mapKey!41617 mapValue!41617))))

(declare-fun b!1087671 () Bool)

(assert (=> b!1087671 (= e!621422 (not e!621421))))

(declare-fun res!724900 () Bool)

(assert (=> b!1087671 (=> res!724900 e!621421)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087671 (= res!724900 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4238 (array!70119 array!70121 (_ BitVec 32) (_ BitVec 32) V!40561 V!40561 (_ BitVec 32) Int) ListLongMap!14911)

(assert (=> b!1087671 (= lt!483247 (getCurrentListMap!4238 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483243 () array!70121)

(assert (=> b!1087671 (= lt!483241 (getCurrentListMap!4238 lt!483252 lt!483243 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1087671 (and (= lt!483254 lt!483244) (= lt!483244 lt!483254))))

(assert (=> b!1087671 (= lt!483244 (-!783 lt!483251 k0!904))))

(declare-fun lt!483239 () Unit!35733)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!67 (array!70119 array!70121 (_ BitVec 32) (_ BitVec 32) V!40561 V!40561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35733)

(assert (=> b!1087671 (= lt!483239 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!67 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4043 (array!70119 array!70121 (_ BitVec 32) (_ BitVec 32) V!40561 V!40561 (_ BitVec 32) Int) ListLongMap!14911)

(assert (=> b!1087671 (= lt!483254 (getCurrentListMapNoExtraKeys!4043 lt!483252 lt!483243 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2164 (Int (_ BitVec 64)) V!40561)

(assert (=> b!1087671 (= lt!483243 (array!70122 (store (arr!33728 _values!874) i!650 (ValueCellFull!12578 (dynLambda!2164 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34265 _values!874)))))

(assert (=> b!1087671 (= lt!483251 (getCurrentListMapNoExtraKeys!4043 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087671 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483250 () Unit!35733)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70119 (_ BitVec 64) (_ BitVec 32)) Unit!35733)

(assert (=> b!1087671 (= lt!483250 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087672 () Bool)

(declare-fun res!724896 () Bool)

(assert (=> b!1087672 (=> (not res!724896) (not e!621425))))

(assert (=> b!1087672 (= res!724896 (= (select (arr!33727 _keys!1070) i!650) k0!904))))

(declare-fun b!1087673 () Bool)

(declare-fun res!724894 () Bool)

(assert (=> b!1087673 (=> (not res!724894) (not e!621425))))

(assert (=> b!1087673 (= res!724894 (and (= (size!34265 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34264 _keys!1070) (size!34265 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087674 () Bool)

(declare-fun res!724901 () Bool)

(assert (=> b!1087674 (=> (not res!724901) (not e!621422))))

(declare-datatypes ((List!23533 0))(
  ( (Nil!23530) (Cons!23529 (h!24747 (_ BitVec 64)) (t!33156 List!23533)) )
))
(declare-fun arrayNoDuplicates!0 (array!70119 (_ BitVec 32) List!23533) Bool)

(assert (=> b!1087674 (= res!724901 (arrayNoDuplicates!0 lt!483252 #b00000000000000000000000000000000 Nil!23530))))

(declare-fun b!1087675 () Bool)

(declare-fun res!724902 () Bool)

(assert (=> b!1087675 (=> (not res!724902) (not e!621425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087675 (= res!724902 (validKeyInArray!0 k0!904))))

(declare-fun b!1087676 () Bool)

(declare-fun res!724899 () Bool)

(assert (=> b!1087676 (=> (not res!724899) (not e!621425))))

(assert (=> b!1087676 (= res!724899 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23530))))

(declare-fun b!1087677 () Bool)

(assert (=> b!1087677 (= e!621418 tp_is_empty!26575)))

(assert (= (and start!96156 res!724892) b!1087673))

(assert (= (and b!1087673 res!724894) b!1087669))

(assert (= (and b!1087669 res!724898) b!1087676))

(assert (= (and b!1087676 res!724899) b!1087665))

(assert (= (and b!1087665 res!724893) b!1087675))

(assert (= (and b!1087675 res!724902) b!1087672))

(assert (= (and b!1087672 res!724896) b!1087668))

(assert (= (and b!1087668 res!724897) b!1087674))

(assert (= (and b!1087674 res!724901) b!1087671))

(assert (= (and b!1087671 (not res!724900)) b!1087670))

(assert (= (and b!1087670 (not res!724895)) b!1087664))

(assert (= (and b!1087666 condMapEmpty!41617) mapIsEmpty!41617))

(assert (= (and b!1087666 (not condMapEmpty!41617)) mapNonEmpty!41617))

(get-info :version)

(assert (= (and mapNonEmpty!41617 ((_ is ValueCellFull!12578) mapValue!41617)) b!1087677))

(assert (= (and b!1087666 ((_ is ValueCellFull!12578) mapDefault!41617)) b!1087667))

(assert (= start!96156 b!1087666))

(declare-fun b_lambda!17253 () Bool)

(assert (=> (not b_lambda!17253) (not b!1087671)))

(declare-fun t!33154 () Bool)

(declare-fun tb!7443 () Bool)

(assert (=> (and start!96156 (= defaultEntry!882 defaultEntry!882) t!33154) tb!7443))

(declare-fun result!15413 () Bool)

(assert (=> tb!7443 (= result!15413 tp_is_empty!26575)))

(assert (=> b!1087671 t!33154))

(declare-fun b_and!35833 () Bool)

(assert (= b_and!35831 (and (=> t!33154 result!15413) b_and!35833)))

(declare-fun m!1006463 () Bool)

(assert (=> b!1087664 m!1006463))

(declare-fun m!1006465 () Bool)

(assert (=> b!1087664 m!1006465))

(declare-fun m!1006467 () Bool)

(assert (=> b!1087664 m!1006467))

(declare-fun m!1006469 () Bool)

(assert (=> b!1087670 m!1006469))

(declare-fun m!1006471 () Bool)

(assert (=> b!1087670 m!1006471))

(declare-fun m!1006473 () Bool)

(assert (=> b!1087670 m!1006473))

(declare-fun m!1006475 () Bool)

(assert (=> b!1087670 m!1006475))

(declare-fun m!1006477 () Bool)

(assert (=> b!1087670 m!1006477))

(assert (=> b!1087670 m!1006469))

(declare-fun m!1006479 () Bool)

(assert (=> b!1087670 m!1006479))

(declare-fun m!1006481 () Bool)

(assert (=> b!1087670 m!1006481))

(declare-fun m!1006483 () Bool)

(assert (=> b!1087670 m!1006483))

(declare-fun m!1006485 () Bool)

(assert (=> b!1087675 m!1006485))

(declare-fun m!1006487 () Bool)

(assert (=> mapNonEmpty!41617 m!1006487))

(declare-fun m!1006489 () Bool)

(assert (=> b!1087669 m!1006489))

(declare-fun m!1006491 () Bool)

(assert (=> b!1087671 m!1006491))

(declare-fun m!1006493 () Bool)

(assert (=> b!1087671 m!1006493))

(declare-fun m!1006495 () Bool)

(assert (=> b!1087671 m!1006495))

(declare-fun m!1006497 () Bool)

(assert (=> b!1087671 m!1006497))

(declare-fun m!1006499 () Bool)

(assert (=> b!1087671 m!1006499))

(declare-fun m!1006501 () Bool)

(assert (=> b!1087671 m!1006501))

(declare-fun m!1006503 () Bool)

(assert (=> b!1087671 m!1006503))

(declare-fun m!1006505 () Bool)

(assert (=> b!1087671 m!1006505))

(declare-fun m!1006507 () Bool)

(assert (=> b!1087671 m!1006507))

(declare-fun m!1006509 () Bool)

(assert (=> b!1087671 m!1006509))

(declare-fun m!1006511 () Bool)

(assert (=> b!1087672 m!1006511))

(declare-fun m!1006513 () Bool)

(assert (=> b!1087674 m!1006513))

(declare-fun m!1006515 () Bool)

(assert (=> start!96156 m!1006515))

(declare-fun m!1006517 () Bool)

(assert (=> start!96156 m!1006517))

(declare-fun m!1006519 () Bool)

(assert (=> start!96156 m!1006519))

(declare-fun m!1006521 () Bool)

(assert (=> b!1087668 m!1006521))

(declare-fun m!1006523 () Bool)

(assert (=> b!1087668 m!1006523))

(declare-fun m!1006525 () Bool)

(assert (=> b!1087676 m!1006525))

(check-sat (not b!1087668) (not start!96156) b_and!35833 (not b!1087669) tp_is_empty!26575 (not b!1087664) (not b!1087670) (not b_lambda!17253) (not b!1087675) (not mapNonEmpty!41617) (not b_next!22573) (not b!1087671) (not b!1087676) (not b!1087674))
(check-sat b_and!35833 (not b_next!22573))
