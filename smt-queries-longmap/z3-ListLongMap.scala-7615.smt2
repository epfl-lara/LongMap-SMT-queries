; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96012 () Bool)

(assert start!96012)

(declare-fun b_free!22665 () Bool)

(declare-fun b_next!22665 () Bool)

(assert (=> start!96012 (= b_free!22665 (not b_next!22665))))

(declare-fun tp!79843 () Bool)

(declare-fun b_and!36005 () Bool)

(assert (=> start!96012 (= tp!79843 b_and!36005)))

(declare-fun mapNonEmpty!41755 () Bool)

(declare-fun mapRes!41755 () Bool)

(declare-fun tp!79844 () Bool)

(declare-fun e!621672 () Bool)

(assert (=> mapNonEmpty!41755 (= mapRes!41755 (and tp!79844 e!621672))))

(declare-datatypes ((V!40683 0))(
  ( (V!40684 (val!13390 Int)) )
))
(declare-datatypes ((ValueCell!12624 0))(
  ( (ValueCellFull!12624 (v!16011 V!40683)) (EmptyCell!12624) )
))
(declare-fun mapRest!41755 () (Array (_ BitVec 32) ValueCell!12624))

(declare-datatypes ((array!70259 0))(
  ( (array!70260 (arr!33803 (Array (_ BitVec 32) ValueCell!12624)) (size!34339 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70259)

(declare-fun mapValue!41755 () ValueCell!12624)

(declare-fun mapKey!41755 () (_ BitVec 32))

(assert (=> mapNonEmpty!41755 (= (arr!33803 _values!874) (store mapRest!41755 mapKey!41755 mapValue!41755))))

(declare-fun b!1088370 () Bool)

(declare-fun res!725903 () Bool)

(declare-fun e!621667 () Bool)

(assert (=> b!1088370 (=> (not res!725903) (not e!621667))))

(declare-datatypes ((array!70261 0))(
  ( (array!70262 (arr!33804 (Array (_ BitVec 32) (_ BitVec 64))) (size!34340 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70261)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088370 (= res!725903 (= (select (arr!33804 _keys!1070) i!650) k0!904))))

(declare-fun b!1088371 () Bool)

(declare-fun e!621669 () Bool)

(assert (=> b!1088371 (= e!621667 e!621669)))

(declare-fun res!725898 () Bool)

(assert (=> b!1088371 (=> (not res!725898) (not e!621669))))

(declare-fun lt!484747 () array!70261)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70261 (_ BitVec 32)) Bool)

(assert (=> b!1088371 (= res!725898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484747 mask!1414))))

(assert (=> b!1088371 (= lt!484747 (array!70262 (store (arr!33804 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34340 _keys!1070)))))

(declare-fun b!1088372 () Bool)

(declare-fun res!725900 () Bool)

(assert (=> b!1088372 (=> (not res!725900) (not e!621667))))

(declare-datatypes ((List!23585 0))(
  ( (Nil!23582) (Cons!23581 (h!24790 (_ BitVec 64)) (t!33308 List!23585)) )
))
(declare-fun arrayNoDuplicates!0 (array!70261 (_ BitVec 32) List!23585) Bool)

(assert (=> b!1088372 (= res!725900 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23582))))

(declare-fun mapIsEmpty!41755 () Bool)

(assert (=> mapIsEmpty!41755 mapRes!41755))

(declare-fun b!1088373 () Bool)

(declare-fun e!621671 () Bool)

(declare-fun e!621673 () Bool)

(assert (=> b!1088373 (= e!621671 e!621673)))

(declare-fun res!725901 () Bool)

(assert (=> b!1088373 (=> res!725901 e!621673)))

(assert (=> b!1088373 (= res!725901 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!16998 0))(
  ( (tuple2!16999 (_1!8510 (_ BitVec 64)) (_2!8510 V!40683)) )
))
(declare-datatypes ((List!23586 0))(
  ( (Nil!23583) (Cons!23582 (h!24791 tuple2!16998) (t!33309 List!23586)) )
))
(declare-datatypes ((ListLongMap!14967 0))(
  ( (ListLongMap!14968 (toList!7499 List!23586)) )
))
(declare-fun lt!484739 () ListLongMap!14967)

(declare-fun lt!484742 () ListLongMap!14967)

(assert (=> b!1088373 (= lt!484739 lt!484742)))

(declare-fun lt!484741 () ListLongMap!14967)

(declare-fun lt!484744 () tuple2!16998)

(declare-fun +!3299 (ListLongMap!14967 tuple2!16998) ListLongMap!14967)

(assert (=> b!1088373 (= lt!484742 (+!3299 lt!484741 lt!484744))))

(declare-fun lt!484745 () ListLongMap!14967)

(declare-fun lt!484740 () ListLongMap!14967)

(assert (=> b!1088373 (= lt!484745 lt!484740)))

(declare-fun lt!484735 () ListLongMap!14967)

(assert (=> b!1088373 (= lt!484740 (+!3299 lt!484735 lt!484744))))

(declare-fun lt!484736 () ListLongMap!14967)

(assert (=> b!1088373 (= lt!484739 (+!3299 lt!484736 lt!484744))))

(declare-fun zeroValue!831 () V!40683)

(assert (=> b!1088373 (= lt!484744 (tuple2!16999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!725897 () Bool)

(assert (=> start!96012 (=> (not res!725897) (not e!621667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96012 (= res!725897 (validMask!0 mask!1414))))

(assert (=> start!96012 e!621667))

(assert (=> start!96012 tp!79843))

(assert (=> start!96012 true))

(declare-fun tp_is_empty!26667 () Bool)

(assert (=> start!96012 tp_is_empty!26667))

(declare-fun array_inv!26068 (array!70261) Bool)

(assert (=> start!96012 (array_inv!26068 _keys!1070)))

(declare-fun e!621668 () Bool)

(declare-fun array_inv!26069 (array!70259) Bool)

(assert (=> start!96012 (and (array_inv!26069 _values!874) e!621668)))

(declare-fun b!1088374 () Bool)

(declare-fun res!725902 () Bool)

(assert (=> b!1088374 (=> (not res!725902) (not e!621667))))

(assert (=> b!1088374 (= res!725902 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34340 _keys!1070))))))

(declare-fun b!1088375 () Bool)

(declare-fun e!621670 () Bool)

(assert (=> b!1088375 (= e!621668 (and e!621670 mapRes!41755))))

(declare-fun condMapEmpty!41755 () Bool)

(declare-fun mapDefault!41755 () ValueCell!12624)

(assert (=> b!1088375 (= condMapEmpty!41755 (= (arr!33803 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12624)) mapDefault!41755)))))

(declare-fun b!1088376 () Bool)

(declare-fun res!725907 () Bool)

(assert (=> b!1088376 (=> (not res!725907) (not e!621667))))

(assert (=> b!1088376 (= res!725907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088377 () Bool)

(assert (=> b!1088377 (= e!621670 tp_is_empty!26667)))

(declare-fun b!1088378 () Bool)

(assert (=> b!1088378 (= e!621669 (not e!621671))))

(declare-fun res!725905 () Bool)

(assert (=> b!1088378 (=> res!725905 e!621671)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088378 (= res!725905 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40683)

(declare-fun getCurrentListMap!4273 (array!70261 array!70259 (_ BitVec 32) (_ BitVec 32) V!40683 V!40683 (_ BitVec 32) Int) ListLongMap!14967)

(assert (=> b!1088378 (= lt!484745 (getCurrentListMap!4273 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484743 () array!70259)

(assert (=> b!1088378 (= lt!484739 (getCurrentListMap!4273 lt!484747 lt!484743 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088378 (and (= lt!484736 lt!484741) (= lt!484741 lt!484736))))

(declare-fun -!824 (ListLongMap!14967 (_ BitVec 64)) ListLongMap!14967)

(assert (=> b!1088378 (= lt!484741 (-!824 lt!484735 k0!904))))

(declare-datatypes ((Unit!35814 0))(
  ( (Unit!35815) )
))
(declare-fun lt!484746 () Unit!35814)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!92 (array!70261 array!70259 (_ BitVec 32) (_ BitVec 32) V!40683 V!40683 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35814)

(assert (=> b!1088378 (= lt!484746 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!92 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4033 (array!70261 array!70259 (_ BitVec 32) (_ BitVec 32) V!40683 V!40683 (_ BitVec 32) Int) ListLongMap!14967)

(assert (=> b!1088378 (= lt!484736 (getCurrentListMapNoExtraKeys!4033 lt!484747 lt!484743 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2170 (Int (_ BitVec 64)) V!40683)

(assert (=> b!1088378 (= lt!484743 (array!70260 (store (arr!33803 _values!874) i!650 (ValueCellFull!12624 (dynLambda!2170 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34339 _values!874)))))

(assert (=> b!1088378 (= lt!484735 (getCurrentListMapNoExtraKeys!4033 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088378 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484737 () Unit!35814)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70261 (_ BitVec 64) (_ BitVec 32)) Unit!35814)

(assert (=> b!1088378 (= lt!484737 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088379 () Bool)

(assert (=> b!1088379 (= e!621673 true)))

(assert (=> b!1088379 (= (-!824 lt!484740 k0!904) lt!484742)))

(declare-fun lt!484738 () Unit!35814)

(declare-fun addRemoveCommutativeForDiffKeys!53 (ListLongMap!14967 (_ BitVec 64) V!40683 (_ BitVec 64)) Unit!35814)

(assert (=> b!1088379 (= lt!484738 (addRemoveCommutativeForDiffKeys!53 lt!484735 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1088380 () Bool)

(declare-fun res!725906 () Bool)

(assert (=> b!1088380 (=> (not res!725906) (not e!621667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088380 (= res!725906 (validKeyInArray!0 k0!904))))

(declare-fun b!1088381 () Bool)

(assert (=> b!1088381 (= e!621672 tp_is_empty!26667)))

(declare-fun b!1088382 () Bool)

(declare-fun res!725904 () Bool)

(assert (=> b!1088382 (=> (not res!725904) (not e!621667))))

(assert (=> b!1088382 (= res!725904 (and (= (size!34339 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34340 _keys!1070) (size!34339 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088383 () Bool)

(declare-fun res!725899 () Bool)

(assert (=> b!1088383 (=> (not res!725899) (not e!621669))))

(assert (=> b!1088383 (= res!725899 (arrayNoDuplicates!0 lt!484747 #b00000000000000000000000000000000 Nil!23582))))

(assert (= (and start!96012 res!725897) b!1088382))

(assert (= (and b!1088382 res!725904) b!1088376))

(assert (= (and b!1088376 res!725907) b!1088372))

(assert (= (and b!1088372 res!725900) b!1088374))

(assert (= (and b!1088374 res!725902) b!1088380))

(assert (= (and b!1088380 res!725906) b!1088370))

(assert (= (and b!1088370 res!725903) b!1088371))

(assert (= (and b!1088371 res!725898) b!1088383))

(assert (= (and b!1088383 res!725899) b!1088378))

(assert (= (and b!1088378 (not res!725905)) b!1088373))

(assert (= (and b!1088373 (not res!725901)) b!1088379))

(assert (= (and b!1088375 condMapEmpty!41755) mapIsEmpty!41755))

(assert (= (and b!1088375 (not condMapEmpty!41755)) mapNonEmpty!41755))

(get-info :version)

(assert (= (and mapNonEmpty!41755 ((_ is ValueCellFull!12624) mapValue!41755)) b!1088381))

(assert (= (and b!1088375 ((_ is ValueCellFull!12624) mapDefault!41755)) b!1088377))

(assert (= start!96012 b!1088375))

(declare-fun b_lambda!17335 () Bool)

(assert (=> (not b_lambda!17335) (not b!1088378)))

(declare-fun t!33307 () Bool)

(declare-fun tb!7543 () Bool)

(assert (=> (and start!96012 (= defaultEntry!882 defaultEntry!882) t!33307) tb!7543))

(declare-fun result!15605 () Bool)

(assert (=> tb!7543 (= result!15605 tp_is_empty!26667)))

(assert (=> b!1088378 t!33307))

(declare-fun b_and!36007 () Bool)

(assert (= b_and!36005 (and (=> t!33307 result!15605) b_and!36007)))

(declare-fun m!1007423 () Bool)

(assert (=> start!96012 m!1007423))

(declare-fun m!1007425 () Bool)

(assert (=> start!96012 m!1007425))

(declare-fun m!1007427 () Bool)

(assert (=> start!96012 m!1007427))

(declare-fun m!1007429 () Bool)

(assert (=> b!1088380 m!1007429))

(declare-fun m!1007431 () Bool)

(assert (=> b!1088379 m!1007431))

(declare-fun m!1007433 () Bool)

(assert (=> b!1088379 m!1007433))

(declare-fun m!1007435 () Bool)

(assert (=> b!1088378 m!1007435))

(declare-fun m!1007437 () Bool)

(assert (=> b!1088378 m!1007437))

(declare-fun m!1007439 () Bool)

(assert (=> b!1088378 m!1007439))

(declare-fun m!1007441 () Bool)

(assert (=> b!1088378 m!1007441))

(declare-fun m!1007443 () Bool)

(assert (=> b!1088378 m!1007443))

(declare-fun m!1007445 () Bool)

(assert (=> b!1088378 m!1007445))

(declare-fun m!1007447 () Bool)

(assert (=> b!1088378 m!1007447))

(declare-fun m!1007449 () Bool)

(assert (=> b!1088378 m!1007449))

(declare-fun m!1007451 () Bool)

(assert (=> b!1088378 m!1007451))

(declare-fun m!1007453 () Bool)

(assert (=> b!1088378 m!1007453))

(declare-fun m!1007455 () Bool)

(assert (=> b!1088372 m!1007455))

(declare-fun m!1007457 () Bool)

(assert (=> b!1088373 m!1007457))

(declare-fun m!1007459 () Bool)

(assert (=> b!1088373 m!1007459))

(declare-fun m!1007461 () Bool)

(assert (=> b!1088373 m!1007461))

(declare-fun m!1007463 () Bool)

(assert (=> b!1088376 m!1007463))

(declare-fun m!1007465 () Bool)

(assert (=> mapNonEmpty!41755 m!1007465))

(declare-fun m!1007467 () Bool)

(assert (=> b!1088383 m!1007467))

(declare-fun m!1007469 () Bool)

(assert (=> b!1088370 m!1007469))

(declare-fun m!1007471 () Bool)

(assert (=> b!1088371 m!1007471))

(declare-fun m!1007473 () Bool)

(assert (=> b!1088371 m!1007473))

(check-sat (not b!1088373) (not start!96012) (not b!1088372) (not b!1088376) (not b_next!22665) (not b!1088371) (not b!1088383) (not b!1088378) (not mapNonEmpty!41755) b_and!36007 (not b!1088380) (not b_lambda!17335) tp_is_empty!26667 (not b!1088379))
(check-sat b_and!36007 (not b_next!22665))
