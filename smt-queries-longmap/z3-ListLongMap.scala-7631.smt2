; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96342 () Bool)

(assert start!96342)

(declare-fun b_free!22759 () Bool)

(declare-fun b_next!22759 () Bool)

(assert (=> start!96342 (= b_free!22759 (not b_next!22759))))

(declare-fun tp!80125 () Bool)

(declare-fun b_and!36203 () Bool)

(assert (=> start!96342 (= tp!80125 b_and!36203)))

(declare-fun b!1091775 () Bool)

(declare-fun res!727980 () Bool)

(declare-fun e!623650 () Bool)

(assert (=> b!1091775 (=> (not res!727980) (not e!623650))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70481 0))(
  ( (array!70482 (arr!33908 (Array (_ BitVec 32) (_ BitVec 64))) (size!34445 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70481)

(declare-datatypes ((V!40809 0))(
  ( (V!40810 (val!13437 Int)) )
))
(declare-datatypes ((ValueCell!12671 0))(
  ( (ValueCellFull!12671 (v!16054 V!40809)) (EmptyCell!12671) )
))
(declare-datatypes ((array!70483 0))(
  ( (array!70484 (arr!33909 (Array (_ BitVec 32) ValueCell!12671)) (size!34446 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70483)

(assert (=> b!1091775 (= res!727980 (and (= (size!34446 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34445 _keys!1070) (size!34446 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091776 () Bool)

(declare-fun res!727989 () Bool)

(assert (=> b!1091776 (=> (not res!727989) (not e!623650))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091776 (= res!727989 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34445 _keys!1070))))))

(declare-fun b!1091777 () Bool)

(declare-fun res!727986 () Bool)

(assert (=> b!1091777 (=> (not res!727986) (not e!623650))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1091777 (= res!727986 (= (select (arr!33908 _keys!1070) i!650) k0!904))))

(declare-fun b!1091778 () Bool)

(declare-fun e!623656 () Bool)

(declare-fun tp_is_empty!26761 () Bool)

(assert (=> b!1091778 (= e!623656 tp_is_empty!26761)))

(declare-fun b!1091779 () Bool)

(declare-fun e!623653 () Bool)

(declare-fun e!623655 () Bool)

(declare-fun mapRes!41896 () Bool)

(assert (=> b!1091779 (= e!623653 (and e!623655 mapRes!41896))))

(declare-fun condMapEmpty!41896 () Bool)

(declare-fun mapDefault!41896 () ValueCell!12671)

(assert (=> b!1091779 (= condMapEmpty!41896 (= (arr!33909 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12671)) mapDefault!41896)))))

(declare-fun b!1091780 () Bool)

(declare-fun e!623657 () Bool)

(assert (=> b!1091780 (= e!623657 true)))

(declare-datatypes ((tuple2!17092 0))(
  ( (tuple2!17093 (_1!8557 (_ BitVec 64)) (_2!8557 V!40809)) )
))
(declare-datatypes ((List!23683 0))(
  ( (Nil!23680) (Cons!23679 (h!24897 tuple2!17092) (t!33492 List!23683)) )
))
(declare-datatypes ((ListLongMap!15069 0))(
  ( (ListLongMap!15070 (toList!7550 List!23683)) )
))
(declare-fun lt!487065 () ListLongMap!15069)

(declare-fun lt!487059 () ListLongMap!15069)

(declare-fun -!857 (ListLongMap!15069 (_ BitVec 64)) ListLongMap!15069)

(assert (=> b!1091780 (= (-!857 lt!487065 k0!904) lt!487059)))

(declare-fun lt!487060 () ListLongMap!15069)

(declare-fun minValue!831 () V!40809)

(declare-datatypes ((Unit!35881 0))(
  ( (Unit!35882) )
))
(declare-fun lt!487067 () Unit!35881)

(declare-fun addRemoveCommutativeForDiffKeys!91 (ListLongMap!15069 (_ BitVec 64) V!40809 (_ BitVec 64)) Unit!35881)

(assert (=> b!1091780 (= lt!487067 (addRemoveCommutativeForDiffKeys!91 lt!487060 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091781 () Bool)

(declare-fun e!623652 () Bool)

(assert (=> b!1091781 (= e!623650 e!623652)))

(declare-fun res!727984 () Bool)

(assert (=> b!1091781 (=> (not res!727984) (not e!623652))))

(declare-fun lt!487063 () array!70481)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70481 (_ BitVec 32)) Bool)

(assert (=> b!1091781 (= res!727984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487063 mask!1414))))

(assert (=> b!1091781 (= lt!487063 (array!70482 (store (arr!33908 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34445 _keys!1070)))))

(declare-fun mapIsEmpty!41896 () Bool)

(assert (=> mapIsEmpty!41896 mapRes!41896))

(declare-fun b!1091774 () Bool)

(declare-fun res!727988 () Bool)

(assert (=> b!1091774 (=> (not res!727988) (not e!623652))))

(declare-datatypes ((List!23684 0))(
  ( (Nil!23681) (Cons!23680 (h!24898 (_ BitVec 64)) (t!33493 List!23684)) )
))
(declare-fun arrayNoDuplicates!0 (array!70481 (_ BitVec 32) List!23684) Bool)

(assert (=> b!1091774 (= res!727988 (arrayNoDuplicates!0 lt!487063 #b00000000000000000000000000000000 Nil!23681))))

(declare-fun res!727981 () Bool)

(assert (=> start!96342 (=> (not res!727981) (not e!623650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96342 (= res!727981 (validMask!0 mask!1414))))

(assert (=> start!96342 e!623650))

(assert (=> start!96342 tp!80125))

(assert (=> start!96342 true))

(assert (=> start!96342 tp_is_empty!26761))

(declare-fun array_inv!26196 (array!70481) Bool)

(assert (=> start!96342 (array_inv!26196 _keys!1070)))

(declare-fun array_inv!26197 (array!70483) Bool)

(assert (=> start!96342 (and (array_inv!26197 _values!874) e!623653)))

(declare-fun b!1091782 () Bool)

(assert (=> b!1091782 (= e!623655 tp_is_empty!26761)))

(declare-fun b!1091783 () Bool)

(declare-fun res!727979 () Bool)

(assert (=> b!1091783 (=> (not res!727979) (not e!623650))))

(assert (=> b!1091783 (= res!727979 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23681))))

(declare-fun b!1091784 () Bool)

(declare-fun res!727985 () Bool)

(assert (=> b!1091784 (=> (not res!727985) (not e!623650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091784 (= res!727985 (validKeyInArray!0 k0!904))))

(declare-fun b!1091785 () Bool)

(declare-fun e!623651 () Bool)

(assert (=> b!1091785 (= e!623651 e!623657)))

(declare-fun res!727982 () Bool)

(assert (=> b!1091785 (=> res!727982 e!623657)))

(assert (=> b!1091785 (= res!727982 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!487066 () ListLongMap!15069)

(assert (=> b!1091785 (= lt!487066 lt!487065)))

(declare-fun lt!487068 () tuple2!17092)

(declare-fun +!3366 (ListLongMap!15069 tuple2!17092) ListLongMap!15069)

(assert (=> b!1091785 (= lt!487065 (+!3366 lt!487060 lt!487068))))

(declare-fun lt!487062 () ListLongMap!15069)

(assert (=> b!1091785 (= lt!487062 lt!487059)))

(declare-fun lt!487061 () ListLongMap!15069)

(assert (=> b!1091785 (= lt!487059 (+!3366 lt!487061 lt!487068))))

(declare-fun lt!487058 () ListLongMap!15069)

(assert (=> b!1091785 (= lt!487062 (+!3366 lt!487058 lt!487068))))

(assert (=> b!1091785 (= lt!487068 (tuple2!17093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091786 () Bool)

(assert (=> b!1091786 (= e!623652 (not e!623651))))

(declare-fun res!727987 () Bool)

(assert (=> b!1091786 (=> res!727987 e!623651)))

(assert (=> b!1091786 (= res!727987 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40809)

(declare-fun getCurrentListMap!4303 (array!70481 array!70483 (_ BitVec 32) (_ BitVec 32) V!40809 V!40809 (_ BitVec 32) Int) ListLongMap!15069)

(assert (=> b!1091786 (= lt!487066 (getCurrentListMap!4303 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487064 () array!70483)

(assert (=> b!1091786 (= lt!487062 (getCurrentListMap!4303 lt!487063 lt!487064 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1091786 (and (= lt!487058 lt!487061) (= lt!487061 lt!487058))))

(assert (=> b!1091786 (= lt!487061 (-!857 lt!487060 k0!904))))

(declare-fun lt!487057 () Unit!35881)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!132 (array!70481 array!70483 (_ BitVec 32) (_ BitVec 32) V!40809 V!40809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35881)

(assert (=> b!1091786 (= lt!487057 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!132 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4108 (array!70481 array!70483 (_ BitVec 32) (_ BitVec 32) V!40809 V!40809 (_ BitVec 32) Int) ListLongMap!15069)

(assert (=> b!1091786 (= lt!487058 (getCurrentListMapNoExtraKeys!4108 lt!487063 lt!487064 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2229 (Int (_ BitVec 64)) V!40809)

(assert (=> b!1091786 (= lt!487064 (array!70484 (store (arr!33909 _values!874) i!650 (ValueCellFull!12671 (dynLambda!2229 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34446 _values!874)))))

(assert (=> b!1091786 (= lt!487060 (getCurrentListMapNoExtraKeys!4108 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091786 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487056 () Unit!35881)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70481 (_ BitVec 64) (_ BitVec 32)) Unit!35881)

(assert (=> b!1091786 (= lt!487056 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41896 () Bool)

(declare-fun tp!80126 () Bool)

(assert (=> mapNonEmpty!41896 (= mapRes!41896 (and tp!80126 e!623656))))

(declare-fun mapRest!41896 () (Array (_ BitVec 32) ValueCell!12671))

(declare-fun mapKey!41896 () (_ BitVec 32))

(declare-fun mapValue!41896 () ValueCell!12671)

(assert (=> mapNonEmpty!41896 (= (arr!33909 _values!874) (store mapRest!41896 mapKey!41896 mapValue!41896))))

(declare-fun b!1091787 () Bool)

(declare-fun res!727983 () Bool)

(assert (=> b!1091787 (=> (not res!727983) (not e!623650))))

(assert (=> b!1091787 (= res!727983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96342 res!727981) b!1091775))

(assert (= (and b!1091775 res!727980) b!1091787))

(assert (= (and b!1091787 res!727983) b!1091783))

(assert (= (and b!1091783 res!727979) b!1091776))

(assert (= (and b!1091776 res!727989) b!1091784))

(assert (= (and b!1091784 res!727985) b!1091777))

(assert (= (and b!1091777 res!727986) b!1091781))

(assert (= (and b!1091781 res!727984) b!1091774))

(assert (= (and b!1091774 res!727988) b!1091786))

(assert (= (and b!1091786 (not res!727987)) b!1091785))

(assert (= (and b!1091785 (not res!727982)) b!1091780))

(assert (= (and b!1091779 condMapEmpty!41896) mapIsEmpty!41896))

(assert (= (and b!1091779 (not condMapEmpty!41896)) mapNonEmpty!41896))

(get-info :version)

(assert (= (and mapNonEmpty!41896 ((_ is ValueCellFull!12671) mapValue!41896)) b!1091778))

(assert (= (and b!1091779 ((_ is ValueCellFull!12671) mapDefault!41896)) b!1091782))

(assert (= start!96342 b!1091779))

(declare-fun b_lambda!17439 () Bool)

(assert (=> (not b_lambda!17439) (not b!1091786)))

(declare-fun t!33491 () Bool)

(declare-fun tb!7629 () Bool)

(assert (=> (and start!96342 (= defaultEntry!882 defaultEntry!882) t!33491) tb!7629))

(declare-fun result!15785 () Bool)

(assert (=> tb!7629 (= result!15785 tp_is_empty!26761)))

(assert (=> b!1091786 t!33491))

(declare-fun b_and!36205 () Bool)

(assert (= b_and!36203 (and (=> t!33491 result!15785) b_and!36205)))

(declare-fun m!1011527 () Bool)

(assert (=> b!1091786 m!1011527))

(declare-fun m!1011529 () Bool)

(assert (=> b!1091786 m!1011529))

(declare-fun m!1011531 () Bool)

(assert (=> b!1091786 m!1011531))

(declare-fun m!1011533 () Bool)

(assert (=> b!1091786 m!1011533))

(declare-fun m!1011535 () Bool)

(assert (=> b!1091786 m!1011535))

(declare-fun m!1011537 () Bool)

(assert (=> b!1091786 m!1011537))

(declare-fun m!1011539 () Bool)

(assert (=> b!1091786 m!1011539))

(declare-fun m!1011541 () Bool)

(assert (=> b!1091786 m!1011541))

(declare-fun m!1011543 () Bool)

(assert (=> b!1091786 m!1011543))

(declare-fun m!1011545 () Bool)

(assert (=> b!1091786 m!1011545))

(declare-fun m!1011547 () Bool)

(assert (=> b!1091785 m!1011547))

(declare-fun m!1011549 () Bool)

(assert (=> b!1091785 m!1011549))

(declare-fun m!1011551 () Bool)

(assert (=> b!1091785 m!1011551))

(declare-fun m!1011553 () Bool)

(assert (=> b!1091784 m!1011553))

(declare-fun m!1011555 () Bool)

(assert (=> b!1091774 m!1011555))

(declare-fun m!1011557 () Bool)

(assert (=> b!1091777 m!1011557))

(declare-fun m!1011559 () Bool)

(assert (=> b!1091783 m!1011559))

(declare-fun m!1011561 () Bool)

(assert (=> mapNonEmpty!41896 m!1011561))

(declare-fun m!1011563 () Bool)

(assert (=> b!1091781 m!1011563))

(declare-fun m!1011565 () Bool)

(assert (=> b!1091781 m!1011565))

(declare-fun m!1011567 () Bool)

(assert (=> b!1091787 m!1011567))

(declare-fun m!1011569 () Bool)

(assert (=> b!1091780 m!1011569))

(declare-fun m!1011571 () Bool)

(assert (=> b!1091780 m!1011571))

(declare-fun m!1011573 () Bool)

(assert (=> start!96342 m!1011573))

(declare-fun m!1011575 () Bool)

(assert (=> start!96342 m!1011575))

(declare-fun m!1011577 () Bool)

(assert (=> start!96342 m!1011577))

(check-sat (not b!1091787) (not b!1091785) (not b!1091774) b_and!36205 tp_is_empty!26761 (not mapNonEmpty!41896) (not b_lambda!17439) (not b!1091784) (not b!1091781) (not b!1091783) (not start!96342) (not b_next!22759) (not b!1091786) (not b!1091780))
(check-sat b_and!36205 (not b_next!22759))
