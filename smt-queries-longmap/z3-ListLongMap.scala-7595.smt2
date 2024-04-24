; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96126 () Bool)

(assert start!96126)

(declare-fun b_free!22543 () Bool)

(declare-fun b_next!22543 () Bool)

(assert (=> start!96126 (= b_free!22543 (not b_next!22543))))

(declare-fun tp!79477 () Bool)

(declare-fun b_and!35771 () Bool)

(assert (=> start!96126 (= tp!79477 b_and!35771)))

(declare-fun b!1087004 () Bool)

(declare-fun res!724402 () Bool)

(declare-fun e!621062 () Bool)

(assert (=> b!1087004 (=> (not res!724402) (not e!621062))))

(declare-datatypes ((array!70063 0))(
  ( (array!70064 (arr!33699 (Array (_ BitVec 32) (_ BitVec 64))) (size!34236 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70063)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70063 (_ BitVec 32)) Bool)

(assert (=> b!1087004 (= res!724402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087005 () Bool)

(declare-fun e!621061 () Bool)

(declare-fun e!621059 () Bool)

(assert (=> b!1087005 (= e!621061 e!621059)))

(declare-fun res!724397 () Bool)

(assert (=> b!1087005 (=> res!724397 e!621059)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1087005 (= res!724397 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40521 0))(
  ( (V!40522 (val!13329 Int)) )
))
(declare-datatypes ((tuple2!16910 0))(
  ( (tuple2!16911 (_1!8466 (_ BitVec 64)) (_2!8466 V!40521)) )
))
(declare-datatypes ((List!23508 0))(
  ( (Nil!23505) (Cons!23504 (h!24722 tuple2!16910) (t!33101 List!23508)) )
))
(declare-datatypes ((ListLongMap!14887 0))(
  ( (ListLongMap!14888 (toList!7459 List!23508)) )
))
(declare-fun lt!482479 () ListLongMap!14887)

(declare-fun lt!482476 () ListLongMap!14887)

(assert (=> b!1087005 (= lt!482479 lt!482476)))

(declare-fun lt!482477 () ListLongMap!14887)

(declare-fun -!771 (ListLongMap!14887 (_ BitVec 64)) ListLongMap!14887)

(assert (=> b!1087005 (= lt!482479 (-!771 lt!482477 k0!904))))

(declare-fun lt!482480 () ListLongMap!14887)

(declare-datatypes ((Unit!35709 0))(
  ( (Unit!35710) )
))
(declare-fun lt!482478 () Unit!35709)

(declare-fun zeroValue!831 () V!40521)

(declare-fun addRemoveCommutativeForDiffKeys!18 (ListLongMap!14887 (_ BitVec 64) V!40521 (_ BitVec 64)) Unit!35709)

(assert (=> b!1087005 (= lt!482478 (addRemoveCommutativeForDiffKeys!18 lt!482480 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482474 () ListLongMap!14887)

(declare-fun lt!482487 () tuple2!16910)

(declare-fun +!3284 (ListLongMap!14887 tuple2!16910) ListLongMap!14887)

(assert (=> b!1087005 (= lt!482474 (+!3284 lt!482476 lt!482487))))

(declare-fun lt!482483 () ListLongMap!14887)

(declare-fun lt!482482 () tuple2!16910)

(assert (=> b!1087005 (= lt!482476 (+!3284 lt!482483 lt!482482))))

(declare-fun lt!482489 () ListLongMap!14887)

(declare-fun lt!482484 () ListLongMap!14887)

(assert (=> b!1087005 (= lt!482489 lt!482484)))

(assert (=> b!1087005 (= lt!482484 (+!3284 lt!482477 lt!482487))))

(assert (=> b!1087005 (= lt!482477 (+!3284 lt!482480 lt!482482))))

(declare-fun lt!482485 () ListLongMap!14887)

(assert (=> b!1087005 (= lt!482474 (+!3284 (+!3284 lt!482485 lt!482482) lt!482487))))

(declare-fun minValue!831 () V!40521)

(assert (=> b!1087005 (= lt!482487 (tuple2!16911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1087005 (= lt!482482 (tuple2!16911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087006 () Bool)

(declare-fun res!724405 () Bool)

(declare-fun e!621065 () Bool)

(assert (=> b!1087006 (=> (not res!724405) (not e!621065))))

(declare-fun lt!482475 () array!70063)

(declare-datatypes ((List!23509 0))(
  ( (Nil!23506) (Cons!23505 (h!24723 (_ BitVec 64)) (t!33102 List!23509)) )
))
(declare-fun arrayNoDuplicates!0 (array!70063 (_ BitVec 32) List!23509) Bool)

(assert (=> b!1087006 (= res!724405 (arrayNoDuplicates!0 lt!482475 #b00000000000000000000000000000000 Nil!23506))))

(declare-fun res!724406 () Bool)

(assert (=> start!96126 (=> (not res!724406) (not e!621062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96126 (= res!724406 (validMask!0 mask!1414))))

(assert (=> start!96126 e!621062))

(assert (=> start!96126 tp!79477))

(assert (=> start!96126 true))

(declare-fun tp_is_empty!26545 () Bool)

(assert (=> start!96126 tp_is_empty!26545))

(declare-fun array_inv!26048 (array!70063) Bool)

(assert (=> start!96126 (array_inv!26048 _keys!1070)))

(declare-datatypes ((ValueCell!12563 0))(
  ( (ValueCellFull!12563 (v!15946 V!40521)) (EmptyCell!12563) )
))
(declare-datatypes ((array!70065 0))(
  ( (array!70066 (arr!33700 (Array (_ BitVec 32) ValueCell!12563)) (size!34237 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70065)

(declare-fun e!621063 () Bool)

(declare-fun array_inv!26049 (array!70065) Bool)

(assert (=> start!96126 (and (array_inv!26049 _values!874) e!621063)))

(declare-fun b!1087007 () Bool)

(assert (=> b!1087007 (= e!621059 true)))

(assert (=> b!1087007 (= (-!771 lt!482484 k0!904) (+!3284 lt!482479 lt!482487))))

(declare-fun lt!482490 () Unit!35709)

(assert (=> b!1087007 (= lt!482490 (addRemoveCommutativeForDiffKeys!18 lt!482477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1087008 () Bool)

(declare-fun e!621064 () Bool)

(assert (=> b!1087008 (= e!621064 tp_is_empty!26545)))

(declare-fun b!1087009 () Bool)

(declare-fun res!724403 () Bool)

(assert (=> b!1087009 (=> (not res!724403) (not e!621062))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087009 (= res!724403 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34236 _keys!1070))))))

(declare-fun b!1087010 () Bool)

(declare-fun res!724399 () Bool)

(assert (=> b!1087010 (=> (not res!724399) (not e!621062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087010 (= res!724399 (validKeyInArray!0 k0!904))))

(declare-fun b!1087011 () Bool)

(declare-fun res!724404 () Bool)

(assert (=> b!1087011 (=> (not res!724404) (not e!621062))))

(assert (=> b!1087011 (= res!724404 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23506))))

(declare-fun b!1087012 () Bool)

(assert (=> b!1087012 (= e!621065 (not e!621061))))

(declare-fun res!724407 () Bool)

(assert (=> b!1087012 (=> res!724407 e!621061)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087012 (= res!724407 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4227 (array!70063 array!70065 (_ BitVec 32) (_ BitVec 32) V!40521 V!40521 (_ BitVec 32) Int) ListLongMap!14887)

(assert (=> b!1087012 (= lt!482489 (getCurrentListMap!4227 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482486 () array!70065)

(assert (=> b!1087012 (= lt!482474 (getCurrentListMap!4227 lt!482475 lt!482486 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1087012 (and (= lt!482485 lt!482483) (= lt!482483 lt!482485))))

(assert (=> b!1087012 (= lt!482483 (-!771 lt!482480 k0!904))))

(declare-fun lt!482481 () Unit!35709)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!56 (array!70063 array!70065 (_ BitVec 32) (_ BitVec 32) V!40521 V!40521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35709)

(assert (=> b!1087012 (= lt!482481 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!56 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4032 (array!70063 array!70065 (_ BitVec 32) (_ BitVec 32) V!40521 V!40521 (_ BitVec 32) Int) ListLongMap!14887)

(assert (=> b!1087012 (= lt!482485 (getCurrentListMapNoExtraKeys!4032 lt!482475 lt!482486 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2153 (Int (_ BitVec 64)) V!40521)

(assert (=> b!1087012 (= lt!482486 (array!70066 (store (arr!33700 _values!874) i!650 (ValueCellFull!12563 (dynLambda!2153 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34237 _values!874)))))

(assert (=> b!1087012 (= lt!482480 (getCurrentListMapNoExtraKeys!4032 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087012 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482488 () Unit!35709)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70063 (_ BitVec 64) (_ BitVec 32)) Unit!35709)

(assert (=> b!1087012 (= lt!482488 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41572 () Bool)

(declare-fun mapRes!41572 () Bool)

(declare-fun tp!79478 () Bool)

(declare-fun e!621060 () Bool)

(assert (=> mapNonEmpty!41572 (= mapRes!41572 (and tp!79478 e!621060))))

(declare-fun mapKey!41572 () (_ BitVec 32))

(declare-fun mapRest!41572 () (Array (_ BitVec 32) ValueCell!12563))

(declare-fun mapValue!41572 () ValueCell!12563)

(assert (=> mapNonEmpty!41572 (= (arr!33700 _values!874) (store mapRest!41572 mapKey!41572 mapValue!41572))))

(declare-fun b!1087013 () Bool)

(declare-fun res!724400 () Bool)

(assert (=> b!1087013 (=> (not res!724400) (not e!621062))))

(assert (=> b!1087013 (= res!724400 (= (select (arr!33699 _keys!1070) i!650) k0!904))))

(declare-fun b!1087014 () Bool)

(assert (=> b!1087014 (= e!621062 e!621065)))

(declare-fun res!724398 () Bool)

(assert (=> b!1087014 (=> (not res!724398) (not e!621065))))

(assert (=> b!1087014 (= res!724398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482475 mask!1414))))

(assert (=> b!1087014 (= lt!482475 (array!70064 (store (arr!33699 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34236 _keys!1070)))))

(declare-fun b!1087015 () Bool)

(assert (=> b!1087015 (= e!621063 (and e!621064 mapRes!41572))))

(declare-fun condMapEmpty!41572 () Bool)

(declare-fun mapDefault!41572 () ValueCell!12563)

(assert (=> b!1087015 (= condMapEmpty!41572 (= (arr!33700 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12563)) mapDefault!41572)))))

(declare-fun b!1087016 () Bool)

(declare-fun res!724401 () Bool)

(assert (=> b!1087016 (=> (not res!724401) (not e!621062))))

(assert (=> b!1087016 (= res!724401 (and (= (size!34237 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34236 _keys!1070) (size!34237 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087017 () Bool)

(assert (=> b!1087017 (= e!621060 tp_is_empty!26545)))

(declare-fun mapIsEmpty!41572 () Bool)

(assert (=> mapIsEmpty!41572 mapRes!41572))

(assert (= (and start!96126 res!724406) b!1087016))

(assert (= (and b!1087016 res!724401) b!1087004))

(assert (= (and b!1087004 res!724402) b!1087011))

(assert (= (and b!1087011 res!724404) b!1087009))

(assert (= (and b!1087009 res!724403) b!1087010))

(assert (= (and b!1087010 res!724399) b!1087013))

(assert (= (and b!1087013 res!724400) b!1087014))

(assert (= (and b!1087014 res!724398) b!1087006))

(assert (= (and b!1087006 res!724405) b!1087012))

(assert (= (and b!1087012 (not res!724407)) b!1087005))

(assert (= (and b!1087005 (not res!724397)) b!1087007))

(assert (= (and b!1087015 condMapEmpty!41572) mapIsEmpty!41572))

(assert (= (and b!1087015 (not condMapEmpty!41572)) mapNonEmpty!41572))

(get-info :version)

(assert (= (and mapNonEmpty!41572 ((_ is ValueCellFull!12563) mapValue!41572)) b!1087017))

(assert (= (and b!1087015 ((_ is ValueCellFull!12563) mapDefault!41572)) b!1087008))

(assert (= start!96126 b!1087015))

(declare-fun b_lambda!17223 () Bool)

(assert (=> (not b_lambda!17223) (not b!1087012)))

(declare-fun t!33100 () Bool)

(declare-fun tb!7413 () Bool)

(assert (=> (and start!96126 (= defaultEntry!882 defaultEntry!882) t!33100) tb!7413))

(declare-fun result!15353 () Bool)

(assert (=> tb!7413 (= result!15353 tp_is_empty!26545)))

(assert (=> b!1087012 t!33100))

(declare-fun b_and!35773 () Bool)

(assert (= b_and!35771 (and (=> t!33100 result!15353) b_and!35773)))

(declare-fun m!1005503 () Bool)

(assert (=> b!1087006 m!1005503))

(declare-fun m!1005505 () Bool)

(assert (=> b!1087012 m!1005505))

(declare-fun m!1005507 () Bool)

(assert (=> b!1087012 m!1005507))

(declare-fun m!1005509 () Bool)

(assert (=> b!1087012 m!1005509))

(declare-fun m!1005511 () Bool)

(assert (=> b!1087012 m!1005511))

(declare-fun m!1005513 () Bool)

(assert (=> b!1087012 m!1005513))

(declare-fun m!1005515 () Bool)

(assert (=> b!1087012 m!1005515))

(declare-fun m!1005517 () Bool)

(assert (=> b!1087012 m!1005517))

(declare-fun m!1005519 () Bool)

(assert (=> b!1087012 m!1005519))

(declare-fun m!1005521 () Bool)

(assert (=> b!1087012 m!1005521))

(declare-fun m!1005523 () Bool)

(assert (=> b!1087012 m!1005523))

(declare-fun m!1005525 () Bool)

(assert (=> b!1087013 m!1005525))

(declare-fun m!1005527 () Bool)

(assert (=> mapNonEmpty!41572 m!1005527))

(declare-fun m!1005529 () Bool)

(assert (=> b!1087005 m!1005529))

(declare-fun m!1005531 () Bool)

(assert (=> b!1087005 m!1005531))

(declare-fun m!1005533 () Bool)

(assert (=> b!1087005 m!1005533))

(declare-fun m!1005535 () Bool)

(assert (=> b!1087005 m!1005535))

(declare-fun m!1005537 () Bool)

(assert (=> b!1087005 m!1005537))

(declare-fun m!1005539 () Bool)

(assert (=> b!1087005 m!1005539))

(declare-fun m!1005541 () Bool)

(assert (=> b!1087005 m!1005541))

(assert (=> b!1087005 m!1005541))

(declare-fun m!1005543 () Bool)

(assert (=> b!1087005 m!1005543))

(declare-fun m!1005545 () Bool)

(assert (=> b!1087007 m!1005545))

(declare-fun m!1005547 () Bool)

(assert (=> b!1087007 m!1005547))

(declare-fun m!1005549 () Bool)

(assert (=> b!1087007 m!1005549))

(declare-fun m!1005551 () Bool)

(assert (=> start!96126 m!1005551))

(declare-fun m!1005553 () Bool)

(assert (=> start!96126 m!1005553))

(declare-fun m!1005555 () Bool)

(assert (=> start!96126 m!1005555))

(declare-fun m!1005557 () Bool)

(assert (=> b!1087011 m!1005557))

(declare-fun m!1005559 () Bool)

(assert (=> b!1087004 m!1005559))

(declare-fun m!1005561 () Bool)

(assert (=> b!1087014 m!1005561))

(declare-fun m!1005563 () Bool)

(assert (=> b!1087014 m!1005563))

(declare-fun m!1005565 () Bool)

(assert (=> b!1087010 m!1005565))

(check-sat (not b!1087010) (not b!1087012) (not b!1087006) (not start!96126) (not b_next!22543) (not b_lambda!17223) (not mapNonEmpty!41572) tp_is_empty!26545 b_and!35773 (not b!1087011) (not b!1087007) (not b!1087005) (not b!1087014) (not b!1087004))
(check-sat b_and!35773 (not b_next!22543))
