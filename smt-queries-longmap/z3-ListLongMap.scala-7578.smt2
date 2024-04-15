; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95782 () Bool)

(assert start!95782)

(declare-fun b_free!22441 () Bool)

(declare-fun b_next!22441 () Bool)

(assert (=> start!95782 (= b_free!22441 (not b_next!22441))))

(declare-fun tp!79172 () Bool)

(declare-fun b_and!35531 () Bool)

(assert (=> start!95782 (= tp!79172 b_and!35531)))

(declare-fun b!1083438 () Bool)

(declare-fun e!619055 () Bool)

(assert (=> b!1083438 (= e!619055 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69754 0))(
  ( (array!69755 (arr!33551 (Array (_ BitVec 32) (_ BitVec 64))) (size!34089 (_ BitVec 32))) )
))
(declare-fun lt!479951 () array!69754)

(declare-datatypes ((V!40385 0))(
  ( (V!40386 (val!13278 Int)) )
))
(declare-datatypes ((tuple2!16884 0))(
  ( (tuple2!16885 (_1!8453 (_ BitVec 64)) (_2!8453 V!40385)) )
))
(declare-datatypes ((List!23453 0))(
  ( (Nil!23450) (Cons!23449 (h!24658 tuple2!16884) (t!32943 List!23453)) )
))
(declare-datatypes ((ListLongMap!14853 0))(
  ( (ListLongMap!14854 (toList!7442 List!23453)) )
))
(declare-fun lt!479954 () ListLongMap!14853)

(declare-fun zeroValue!831 () V!40385)

(declare-fun minValue!831 () V!40385)

(declare-datatypes ((ValueCell!12512 0))(
  ( (ValueCellFull!12512 (v!15898 V!40385)) (EmptyCell!12512) )
))
(declare-datatypes ((array!69756 0))(
  ( (array!69757 (arr!33552 (Array (_ BitVec 32) ValueCell!12512)) (size!34090 (_ BitVec 32))) )
))
(declare-fun lt!479956 () array!69756)

(declare-fun getCurrentListMap!4135 (array!69754 array!69756 (_ BitVec 32) (_ BitVec 32) V!40385 V!40385 (_ BitVec 32) Int) ListLongMap!14853)

(assert (=> b!1083438 (= lt!479954 (getCurrentListMap!4135 lt!479951 lt!479956 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479952 () ListLongMap!14853)

(declare-fun lt!479957 () ListLongMap!14853)

(assert (=> b!1083438 (and (= lt!479952 lt!479957) (= lt!479957 lt!479952))))

(declare-fun lt!479955 () ListLongMap!14853)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!721 (ListLongMap!14853 (_ BitVec 64)) ListLongMap!14853)

(assert (=> b!1083438 (= lt!479957 (-!721 lt!479955 k0!904))))

(declare-datatypes ((Unit!35477 0))(
  ( (Unit!35478) )
))
(declare-fun lt!479953 () Unit!35477)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun _keys!1070 () array!69754)

(declare-fun _values!874 () array!69756)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!19 (array!69754 array!69756 (_ BitVec 32) (_ BitVec 32) V!40385 V!40385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35477)

(assert (=> b!1083438 (= lt!479953 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!19 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4005 (array!69754 array!69756 (_ BitVec 32) (_ BitVec 32) V!40385 V!40385 (_ BitVec 32) Int) ListLongMap!14853)

(assert (=> b!1083438 (= lt!479952 (getCurrentListMapNoExtraKeys!4005 lt!479951 lt!479956 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2076 (Int (_ BitVec 64)) V!40385)

(assert (=> b!1083438 (= lt!479956 (array!69757 (store (arr!33552 _values!874) i!650 (ValueCellFull!12512 (dynLambda!2076 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34090 _values!874)))))

(assert (=> b!1083438 (= lt!479955 (getCurrentListMapNoExtraKeys!4005 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083438 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479950 () Unit!35477)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69754 (_ BitVec 64) (_ BitVec 32)) Unit!35477)

(assert (=> b!1083438 (= lt!479950 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083439 () Bool)

(declare-fun e!619058 () Bool)

(assert (=> b!1083439 (= e!619058 e!619055)))

(declare-fun res!722287 () Bool)

(assert (=> b!1083439 (=> (not res!722287) (not e!619055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69754 (_ BitVec 32)) Bool)

(assert (=> b!1083439 (= res!722287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479951 mask!1414))))

(assert (=> b!1083439 (= lt!479951 (array!69755 (store (arr!33551 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34089 _keys!1070)))))

(declare-fun b!1083440 () Bool)

(declare-fun res!722285 () Bool)

(assert (=> b!1083440 (=> (not res!722285) (not e!619058))))

(assert (=> b!1083440 (= res!722285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083441 () Bool)

(declare-fun res!722286 () Bool)

(assert (=> b!1083441 (=> (not res!722286) (not e!619058))))

(declare-datatypes ((List!23454 0))(
  ( (Nil!23451) (Cons!23450 (h!24659 (_ BitVec 64)) (t!32944 List!23454)) )
))
(declare-fun arrayNoDuplicates!0 (array!69754 (_ BitVec 32) List!23454) Bool)

(assert (=> b!1083441 (= res!722286 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23451))))

(declare-fun b!1083442 () Bool)

(declare-fun res!722283 () Bool)

(assert (=> b!1083442 (=> (not res!722283) (not e!619058))))

(assert (=> b!1083442 (= res!722283 (and (= (size!34090 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34089 _keys!1070) (size!34090 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083443 () Bool)

(declare-fun res!722282 () Bool)

(assert (=> b!1083443 (=> (not res!722282) (not e!619058))))

(assert (=> b!1083443 (= res!722282 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34089 _keys!1070))))))

(declare-fun b!1083444 () Bool)

(declare-fun e!619056 () Bool)

(declare-fun tp_is_empty!26443 () Bool)

(assert (=> b!1083444 (= e!619056 tp_is_empty!26443)))

(declare-fun b!1083445 () Bool)

(declare-fun res!722284 () Bool)

(assert (=> b!1083445 (=> (not res!722284) (not e!619058))))

(assert (=> b!1083445 (= res!722284 (= (select (arr!33551 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41419 () Bool)

(declare-fun mapRes!41419 () Bool)

(declare-fun tp!79171 () Bool)

(assert (=> mapNonEmpty!41419 (= mapRes!41419 (and tp!79171 e!619056))))

(declare-fun mapKey!41419 () (_ BitVec 32))

(declare-fun mapValue!41419 () ValueCell!12512)

(declare-fun mapRest!41419 () (Array (_ BitVec 32) ValueCell!12512))

(assert (=> mapNonEmpty!41419 (= (arr!33552 _values!874) (store mapRest!41419 mapKey!41419 mapValue!41419))))

(declare-fun mapIsEmpty!41419 () Bool)

(assert (=> mapIsEmpty!41419 mapRes!41419))

(declare-fun b!1083446 () Bool)

(declare-fun res!722288 () Bool)

(assert (=> b!1083446 (=> (not res!722288) (not e!619055))))

(assert (=> b!1083446 (= res!722288 (arrayNoDuplicates!0 lt!479951 #b00000000000000000000000000000000 Nil!23451))))

(declare-fun res!722289 () Bool)

(assert (=> start!95782 (=> (not res!722289) (not e!619058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95782 (= res!722289 (validMask!0 mask!1414))))

(assert (=> start!95782 e!619058))

(assert (=> start!95782 tp!79172))

(assert (=> start!95782 true))

(assert (=> start!95782 tp_is_empty!26443))

(declare-fun array_inv!25934 (array!69754) Bool)

(assert (=> start!95782 (array_inv!25934 _keys!1070)))

(declare-fun e!619053 () Bool)

(declare-fun array_inv!25935 (array!69756) Bool)

(assert (=> start!95782 (and (array_inv!25935 _values!874) e!619053)))

(declare-fun b!1083447 () Bool)

(declare-fun res!722281 () Bool)

(assert (=> b!1083447 (=> (not res!722281) (not e!619058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083447 (= res!722281 (validKeyInArray!0 k0!904))))

(declare-fun b!1083448 () Bool)

(declare-fun e!619057 () Bool)

(assert (=> b!1083448 (= e!619057 tp_is_empty!26443)))

(declare-fun b!1083449 () Bool)

(assert (=> b!1083449 (= e!619053 (and e!619057 mapRes!41419))))

(declare-fun condMapEmpty!41419 () Bool)

(declare-fun mapDefault!41419 () ValueCell!12512)

(assert (=> b!1083449 (= condMapEmpty!41419 (= (arr!33552 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12512)) mapDefault!41419)))))

(assert (= (and start!95782 res!722289) b!1083442))

(assert (= (and b!1083442 res!722283) b!1083440))

(assert (= (and b!1083440 res!722285) b!1083441))

(assert (= (and b!1083441 res!722286) b!1083443))

(assert (= (and b!1083443 res!722282) b!1083447))

(assert (= (and b!1083447 res!722281) b!1083445))

(assert (= (and b!1083445 res!722284) b!1083439))

(assert (= (and b!1083439 res!722287) b!1083446))

(assert (= (and b!1083446 res!722288) b!1083438))

(assert (= (and b!1083449 condMapEmpty!41419) mapIsEmpty!41419))

(assert (= (and b!1083449 (not condMapEmpty!41419)) mapNonEmpty!41419))

(get-info :version)

(assert (= (and mapNonEmpty!41419 ((_ is ValueCellFull!12512) mapValue!41419)) b!1083444))

(assert (= (and b!1083449 ((_ is ValueCellFull!12512) mapDefault!41419)) b!1083448))

(assert (= start!95782 b!1083449))

(declare-fun b_lambda!17089 () Bool)

(assert (=> (not b_lambda!17089) (not b!1083438)))

(declare-fun t!32942 () Bool)

(declare-fun tb!7311 () Bool)

(assert (=> (and start!95782 (= defaultEntry!882 defaultEntry!882) t!32942) tb!7311))

(declare-fun result!15149 () Bool)

(assert (=> tb!7311 (= result!15149 tp_is_empty!26443)))

(assert (=> b!1083438 t!32942))

(declare-fun b_and!35533 () Bool)

(assert (= b_and!35531 (and (=> t!32942 result!15149) b_and!35533)))

(declare-fun m!1000637 () Bool)

(assert (=> b!1083447 m!1000637))

(declare-fun m!1000639 () Bool)

(assert (=> b!1083441 m!1000639))

(declare-fun m!1000641 () Bool)

(assert (=> b!1083439 m!1000641))

(declare-fun m!1000643 () Bool)

(assert (=> b!1083439 m!1000643))

(declare-fun m!1000645 () Bool)

(assert (=> b!1083440 m!1000645))

(declare-fun m!1000647 () Bool)

(assert (=> b!1083446 m!1000647))

(declare-fun m!1000649 () Bool)

(assert (=> b!1083438 m!1000649))

(declare-fun m!1000651 () Bool)

(assert (=> b!1083438 m!1000651))

(declare-fun m!1000653 () Bool)

(assert (=> b!1083438 m!1000653))

(declare-fun m!1000655 () Bool)

(assert (=> b!1083438 m!1000655))

(declare-fun m!1000657 () Bool)

(assert (=> b!1083438 m!1000657))

(declare-fun m!1000659 () Bool)

(assert (=> b!1083438 m!1000659))

(declare-fun m!1000661 () Bool)

(assert (=> b!1083438 m!1000661))

(declare-fun m!1000663 () Bool)

(assert (=> b!1083438 m!1000663))

(declare-fun m!1000665 () Bool)

(assert (=> b!1083438 m!1000665))

(declare-fun m!1000667 () Bool)

(assert (=> b!1083445 m!1000667))

(declare-fun m!1000669 () Bool)

(assert (=> start!95782 m!1000669))

(declare-fun m!1000671 () Bool)

(assert (=> start!95782 m!1000671))

(declare-fun m!1000673 () Bool)

(assert (=> start!95782 m!1000673))

(declare-fun m!1000675 () Bool)

(assert (=> mapNonEmpty!41419 m!1000675))

(check-sat (not b!1083441) b_and!35533 (not b_next!22441) (not b_lambda!17089) (not mapNonEmpty!41419) (not b!1083446) (not b!1083447) tp_is_empty!26443 (not b!1083439) (not b!1083438) (not start!95782) (not b!1083440))
(check-sat b_and!35533 (not b_next!22441))
