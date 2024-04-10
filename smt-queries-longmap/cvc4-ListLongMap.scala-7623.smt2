; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96062 () Bool)

(assert start!96062)

(declare-fun b_free!22715 () Bool)

(declare-fun b_next!22715 () Bool)

(assert (=> start!96062 (= b_free!22715 (not b_next!22715))))

(declare-fun tp!79993 () Bool)

(declare-fun b_and!36105 () Bool)

(assert (=> start!96062 (= tp!79993 b_and!36105)))

(declare-fun b!1089470 () Bool)

(declare-fun res!726729 () Bool)

(declare-fun e!622271 () Bool)

(assert (=> b!1089470 (=> (not res!726729) (not e!622271))))

(declare-datatypes ((array!70357 0))(
  ( (array!70358 (arr!33852 (Array (_ BitVec 32) (_ BitVec 64))) (size!34388 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70357)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70357 (_ BitVec 32)) Bool)

(assert (=> b!1089470 (= res!726729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089471 () Bool)

(declare-fun e!622273 () Bool)

(assert (=> b!1089471 (= e!622271 e!622273)))

(declare-fun res!726732 () Bool)

(assert (=> b!1089471 (=> (not res!726732) (not e!622273))))

(declare-fun lt!485711 () array!70357)

(assert (=> b!1089471 (= res!726732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485711 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089471 (= lt!485711 (array!70358 (store (arr!33852 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34388 _keys!1070)))))

(declare-fun mapNonEmpty!41830 () Bool)

(declare-fun mapRes!41830 () Bool)

(declare-fun tp!79994 () Bool)

(declare-fun e!622268 () Bool)

(assert (=> mapNonEmpty!41830 (= mapRes!41830 (and tp!79994 e!622268))))

(declare-datatypes ((V!40749 0))(
  ( (V!40750 (val!13415 Int)) )
))
(declare-datatypes ((ValueCell!12649 0))(
  ( (ValueCellFull!12649 (v!16036 V!40749)) (EmptyCell!12649) )
))
(declare-datatypes ((array!70359 0))(
  ( (array!70360 (arr!33853 (Array (_ BitVec 32) ValueCell!12649)) (size!34389 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70359)

(declare-fun mapValue!41830 () ValueCell!12649)

(declare-fun mapKey!41830 () (_ BitVec 32))

(declare-fun mapRest!41830 () (Array (_ BitVec 32) ValueCell!12649))

(assert (=> mapNonEmpty!41830 (= (arr!33853 _values!874) (store mapRest!41830 mapKey!41830 mapValue!41830))))

(declare-fun b!1089472 () Bool)

(declare-fun tp_is_empty!26717 () Bool)

(assert (=> b!1089472 (= e!622268 tp_is_empty!26717)))

(declare-fun b!1089473 () Bool)

(declare-fun res!726722 () Bool)

(assert (=> b!1089473 (=> (not res!726722) (not e!622271))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1089473 (= res!726722 (= (select (arr!33852 _keys!1070) i!650) k!904))))

(declare-fun b!1089474 () Bool)

(declare-fun e!622269 () Bool)

(assert (=> b!1089474 (= e!622273 (not e!622269))))

(declare-fun res!726725 () Bool)

(assert (=> b!1089474 (=> res!726725 e!622269)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089474 (= res!726725 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40749)

(declare-datatypes ((tuple2!17042 0))(
  ( (tuple2!17043 (_1!8532 (_ BitVec 64)) (_2!8532 V!40749)) )
))
(declare-datatypes ((List!23631 0))(
  ( (Nil!23628) (Cons!23627 (h!24836 tuple2!17042) (t!33404 List!23631)) )
))
(declare-datatypes ((ListLongMap!15011 0))(
  ( (ListLongMap!15012 (toList!7521 List!23631)) )
))
(declare-fun lt!485715 () ListLongMap!15011)

(declare-fun zeroValue!831 () V!40749)

(declare-fun getCurrentListMap!4292 (array!70357 array!70359 (_ BitVec 32) (_ BitVec 32) V!40749 V!40749 (_ BitVec 32) Int) ListLongMap!15011)

(assert (=> b!1089474 (= lt!485715 (getCurrentListMap!4292 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485714 () ListLongMap!15011)

(declare-fun lt!485710 () array!70359)

(assert (=> b!1089474 (= lt!485714 (getCurrentListMap!4292 lt!485711 lt!485710 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485722 () ListLongMap!15011)

(declare-fun lt!485712 () ListLongMap!15011)

(assert (=> b!1089474 (and (= lt!485722 lt!485712) (= lt!485712 lt!485722))))

(declare-fun lt!485717 () ListLongMap!15011)

(declare-fun -!846 (ListLongMap!15011 (_ BitVec 64)) ListLongMap!15011)

(assert (=> b!1089474 (= lt!485712 (-!846 lt!485717 k!904))))

(declare-datatypes ((Unit!35858 0))(
  ( (Unit!35859) )
))
(declare-fun lt!485713 () Unit!35858)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!111 (array!70357 array!70359 (_ BitVec 32) (_ BitVec 32) V!40749 V!40749 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35858)

(assert (=> b!1089474 (= lt!485713 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!111 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4052 (array!70357 array!70359 (_ BitVec 32) (_ BitVec 32) V!40749 V!40749 (_ BitVec 32) Int) ListLongMap!15011)

(assert (=> b!1089474 (= lt!485722 (getCurrentListMapNoExtraKeys!4052 lt!485711 lt!485710 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2189 (Int (_ BitVec 64)) V!40749)

(assert (=> b!1089474 (= lt!485710 (array!70360 (store (arr!33853 _values!874) i!650 (ValueCellFull!12649 (dynLambda!2189 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34389 _values!874)))))

(assert (=> b!1089474 (= lt!485717 (getCurrentListMapNoExtraKeys!4052 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089474 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!485721 () Unit!35858)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70357 (_ BitVec 64) (_ BitVec 32)) Unit!35858)

(assert (=> b!1089474 (= lt!485721 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1089475 () Bool)

(declare-fun res!726728 () Bool)

(assert (=> b!1089475 (=> (not res!726728) (not e!622271))))

(assert (=> b!1089475 (= res!726728 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34388 _keys!1070))))))

(declare-fun b!1089476 () Bool)

(declare-fun res!726731 () Bool)

(assert (=> b!1089476 (=> (not res!726731) (not e!622271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089476 (= res!726731 (validKeyInArray!0 k!904))))

(declare-fun b!1089477 () Bool)

(declare-fun res!726727 () Bool)

(assert (=> b!1089477 (=> (not res!726727) (not e!622271))))

(assert (=> b!1089477 (= res!726727 (and (= (size!34389 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34388 _keys!1070) (size!34389 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089478 () Bool)

(declare-fun e!622272 () Bool)

(declare-fun e!622270 () Bool)

(assert (=> b!1089478 (= e!622272 (and e!622270 mapRes!41830))))

(declare-fun condMapEmpty!41830 () Bool)

(declare-fun mapDefault!41830 () ValueCell!12649)

