; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95776 () Bool)

(assert start!95776)

(declare-fun b_free!22435 () Bool)

(declare-fun b_next!22435 () Bool)

(assert (=> start!95776 (= b_free!22435 (not b_next!22435))))

(declare-fun tp!79154 () Bool)

(declare-fun b_and!35519 () Bool)

(assert (=> start!95776 (= tp!79154 b_and!35519)))

(declare-fun b!1083324 () Bool)

(declare-fun res!722208 () Bool)

(declare-fun e!619002 () Bool)

(assert (=> b!1083324 (=> (not res!722208) (not e!619002))))

(declare-datatypes ((array!69742 0))(
  ( (array!69743 (arr!33545 (Array (_ BitVec 32) (_ BitVec 64))) (size!34083 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69742)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083324 (= res!722208 (= (select (arr!33545 _keys!1070) i!650) k0!904))))

(declare-fun b!1083325 () Bool)

(declare-fun res!722202 () Bool)

(assert (=> b!1083325 (=> (not res!722202) (not e!619002))))

(declare-datatypes ((List!23448 0))(
  ( (Nil!23445) (Cons!23444 (h!24653 (_ BitVec 64)) (t!32932 List!23448)) )
))
(declare-fun arrayNoDuplicates!0 (array!69742 (_ BitVec 32) List!23448) Bool)

(assert (=> b!1083325 (= res!722202 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23445))))

(declare-fun mapIsEmpty!41410 () Bool)

(declare-fun mapRes!41410 () Bool)

(assert (=> mapIsEmpty!41410 mapRes!41410))

(declare-fun b!1083326 () Bool)

(declare-fun res!722200 () Bool)

(assert (=> b!1083326 (=> (not res!722200) (not e!619002))))

(assert (=> b!1083326 (= res!722200 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34083 _keys!1070))))))

(declare-fun b!1083328 () Bool)

(declare-fun e!618999 () Bool)

(assert (=> b!1083328 (= e!618999 (not (bvsle #b00000000000000000000000000000000 (size!34083 _keys!1070))))))

(declare-datatypes ((V!40377 0))(
  ( (V!40378 (val!13275 Int)) )
))
(declare-datatypes ((tuple2!16880 0))(
  ( (tuple2!16881 (_1!8451 (_ BitVec 64)) (_2!8451 V!40377)) )
))
(declare-datatypes ((List!23449 0))(
  ( (Nil!23446) (Cons!23445 (h!24654 tuple2!16880) (t!32933 List!23449)) )
))
(declare-datatypes ((ListLongMap!14849 0))(
  ( (ListLongMap!14850 (toList!7440 List!23449)) )
))
(declare-fun lt!479895 () ListLongMap!14849)

(declare-fun lt!479893 () ListLongMap!14849)

(assert (=> b!1083328 (and (= lt!479895 lt!479893) (= lt!479893 lt!479895))))

(declare-fun lt!479892 () ListLongMap!14849)

(declare-fun -!719 (ListLongMap!14849 (_ BitVec 64)) ListLongMap!14849)

(assert (=> b!1083328 (= lt!479893 (-!719 lt!479892 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40377)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40377)

(declare-datatypes ((ValueCell!12509 0))(
  ( (ValueCellFull!12509 (v!15895 V!40377)) (EmptyCell!12509) )
))
(declare-datatypes ((array!69744 0))(
  ( (array!69745 (arr!33546 (Array (_ BitVec 32) ValueCell!12509)) (size!34084 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69744)

(declare-datatypes ((Unit!35473 0))(
  ( (Unit!35474) )
))
(declare-fun lt!479896 () Unit!35473)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!17 (array!69742 array!69744 (_ BitVec 32) (_ BitVec 32) V!40377 V!40377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35473)

(assert (=> b!1083328 (= lt!479896 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!17 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479894 () array!69742)

(declare-fun getCurrentListMapNoExtraKeys!4003 (array!69742 array!69744 (_ BitVec 32) (_ BitVec 32) V!40377 V!40377 (_ BitVec 32) Int) ListLongMap!14849)

(declare-fun dynLambda!2074 (Int (_ BitVec 64)) V!40377)

(assert (=> b!1083328 (= lt!479895 (getCurrentListMapNoExtraKeys!4003 lt!479894 (array!69745 (store (arr!33546 _values!874) i!650 (ValueCellFull!12509 (dynLambda!2074 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34084 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083328 (= lt!479892 (getCurrentListMapNoExtraKeys!4003 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083328 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479897 () Unit!35473)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69742 (_ BitVec 64) (_ BitVec 32)) Unit!35473)

(assert (=> b!1083328 (= lt!479897 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083329 () Bool)

(declare-fun res!722205 () Bool)

(assert (=> b!1083329 (=> (not res!722205) (not e!619002))))

(assert (=> b!1083329 (= res!722205 (and (= (size!34084 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34083 _keys!1070) (size!34084 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083330 () Bool)

(declare-fun e!619004 () Bool)

(declare-fun tp_is_empty!26437 () Bool)

(assert (=> b!1083330 (= e!619004 tp_is_empty!26437)))

(declare-fun mapNonEmpty!41410 () Bool)

(declare-fun tp!79153 () Bool)

(declare-fun e!619001 () Bool)

(assert (=> mapNonEmpty!41410 (= mapRes!41410 (and tp!79153 e!619001))))

(declare-fun mapRest!41410 () (Array (_ BitVec 32) ValueCell!12509))

(declare-fun mapValue!41410 () ValueCell!12509)

(declare-fun mapKey!41410 () (_ BitVec 32))

(assert (=> mapNonEmpty!41410 (= (arr!33546 _values!874) (store mapRest!41410 mapKey!41410 mapValue!41410))))

(declare-fun b!1083331 () Bool)

(assert (=> b!1083331 (= e!619001 tp_is_empty!26437)))

(declare-fun b!1083332 () Bool)

(declare-fun e!619003 () Bool)

(assert (=> b!1083332 (= e!619003 (and e!619004 mapRes!41410))))

(declare-fun condMapEmpty!41410 () Bool)

(declare-fun mapDefault!41410 () ValueCell!12509)

(assert (=> b!1083332 (= condMapEmpty!41410 (= (arr!33546 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12509)) mapDefault!41410)))))

(declare-fun b!1083333 () Bool)

(declare-fun res!722204 () Bool)

(assert (=> b!1083333 (=> (not res!722204) (not e!619002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083333 (= res!722204 (validKeyInArray!0 k0!904))))

(declare-fun b!1083327 () Bool)

(assert (=> b!1083327 (= e!619002 e!618999)))

(declare-fun res!722206 () Bool)

(assert (=> b!1083327 (=> (not res!722206) (not e!618999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69742 (_ BitVec 32)) Bool)

(assert (=> b!1083327 (= res!722206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479894 mask!1414))))

(assert (=> b!1083327 (= lt!479894 (array!69743 (store (arr!33545 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34083 _keys!1070)))))

(declare-fun res!722201 () Bool)

(assert (=> start!95776 (=> (not res!722201) (not e!619002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95776 (= res!722201 (validMask!0 mask!1414))))

(assert (=> start!95776 e!619002))

(assert (=> start!95776 tp!79154))

(assert (=> start!95776 true))

(assert (=> start!95776 tp_is_empty!26437))

(declare-fun array_inv!25930 (array!69742) Bool)

(assert (=> start!95776 (array_inv!25930 _keys!1070)))

(declare-fun array_inv!25931 (array!69744) Bool)

(assert (=> start!95776 (and (array_inv!25931 _values!874) e!619003)))

(declare-fun b!1083334 () Bool)

(declare-fun res!722207 () Bool)

(assert (=> b!1083334 (=> (not res!722207) (not e!619002))))

(assert (=> b!1083334 (= res!722207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083335 () Bool)

(declare-fun res!722203 () Bool)

(assert (=> b!1083335 (=> (not res!722203) (not e!618999))))

(assert (=> b!1083335 (= res!722203 (arrayNoDuplicates!0 lt!479894 #b00000000000000000000000000000000 Nil!23445))))

(assert (= (and start!95776 res!722201) b!1083329))

(assert (= (and b!1083329 res!722205) b!1083334))

(assert (= (and b!1083334 res!722207) b!1083325))

(assert (= (and b!1083325 res!722202) b!1083326))

(assert (= (and b!1083326 res!722200) b!1083333))

(assert (= (and b!1083333 res!722204) b!1083324))

(assert (= (and b!1083324 res!722208) b!1083327))

(assert (= (and b!1083327 res!722206) b!1083335))

(assert (= (and b!1083335 res!722203) b!1083328))

(assert (= (and b!1083332 condMapEmpty!41410) mapIsEmpty!41410))

(assert (= (and b!1083332 (not condMapEmpty!41410)) mapNonEmpty!41410))

(get-info :version)

(assert (= (and mapNonEmpty!41410 ((_ is ValueCellFull!12509) mapValue!41410)) b!1083331))

(assert (= (and b!1083332 ((_ is ValueCellFull!12509) mapDefault!41410)) b!1083330))

(assert (= start!95776 b!1083332))

(declare-fun b_lambda!17083 () Bool)

(assert (=> (not b_lambda!17083) (not b!1083328)))

(declare-fun t!32931 () Bool)

(declare-fun tb!7305 () Bool)

(assert (=> (and start!95776 (= defaultEntry!882 defaultEntry!882) t!32931) tb!7305))

(declare-fun result!15137 () Bool)

(assert (=> tb!7305 (= result!15137 tp_is_empty!26437)))

(assert (=> b!1083328 t!32931))

(declare-fun b_and!35521 () Bool)

(assert (= b_and!35519 (and (=> t!32931 result!15137) b_and!35521)))

(declare-fun m!1000523 () Bool)

(assert (=> mapNonEmpty!41410 m!1000523))

(declare-fun m!1000525 () Bool)

(assert (=> b!1083325 m!1000525))

(declare-fun m!1000527 () Bool)

(assert (=> b!1083333 m!1000527))

(declare-fun m!1000529 () Bool)

(assert (=> b!1083334 m!1000529))

(declare-fun m!1000531 () Bool)

(assert (=> b!1083324 m!1000531))

(declare-fun m!1000533 () Bool)

(assert (=> b!1083327 m!1000533))

(declare-fun m!1000535 () Bool)

(assert (=> b!1083327 m!1000535))

(declare-fun m!1000537 () Bool)

(assert (=> b!1083335 m!1000537))

(declare-fun m!1000539 () Bool)

(assert (=> start!95776 m!1000539))

(declare-fun m!1000541 () Bool)

(assert (=> start!95776 m!1000541))

(declare-fun m!1000543 () Bool)

(assert (=> start!95776 m!1000543))

(declare-fun m!1000545 () Bool)

(assert (=> b!1083328 m!1000545))

(declare-fun m!1000547 () Bool)

(assert (=> b!1083328 m!1000547))

(declare-fun m!1000549 () Bool)

(assert (=> b!1083328 m!1000549))

(declare-fun m!1000551 () Bool)

(assert (=> b!1083328 m!1000551))

(declare-fun m!1000553 () Bool)

(assert (=> b!1083328 m!1000553))

(declare-fun m!1000555 () Bool)

(assert (=> b!1083328 m!1000555))

(declare-fun m!1000557 () Bool)

(assert (=> b!1083328 m!1000557))

(declare-fun m!1000559 () Bool)

(assert (=> b!1083328 m!1000559))

(check-sat b_and!35521 (not b!1083327) (not b!1083334) tp_is_empty!26437 (not start!95776) (not b!1083328) (not b!1083333) (not b!1083325) (not mapNonEmpty!41410) (not b!1083335) (not b_lambda!17083) (not b_next!22435))
(check-sat b_and!35521 (not b_next!22435))
