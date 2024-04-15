; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95992 () Bool)

(assert start!95992)

(declare-fun b_free!22651 () Bool)

(declare-fun b_next!22651 () Bool)

(assert (=> start!95992 (= b_free!22651 (not b_next!22651))))

(declare-fun tp!79801 () Bool)

(declare-fun b_and!35951 () Bool)

(assert (=> start!95992 (= tp!79801 b_and!35951)))

(declare-fun b!1087909 () Bool)

(declare-fun e!621408 () Bool)

(declare-fun e!621409 () Bool)

(declare-fun mapRes!41734 () Bool)

(assert (=> b!1087909 (= e!621408 (and e!621409 mapRes!41734))))

(declare-fun condMapEmpty!41734 () Bool)

(declare-datatypes ((V!40665 0))(
  ( (V!40666 (val!13383 Int)) )
))
(declare-datatypes ((ValueCell!12617 0))(
  ( (ValueCellFull!12617 (v!16003 V!40665)) (EmptyCell!12617) )
))
(declare-datatypes ((array!70156 0))(
  ( (array!70157 (arr!33752 (Array (_ BitVec 32) ValueCell!12617)) (size!34290 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70156)

(declare-fun mapDefault!41734 () ValueCell!12617)

(assert (=> b!1087909 (= condMapEmpty!41734 (= (arr!33752 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12617)) mapDefault!41734)))))

(declare-fun res!725598 () Bool)

(declare-fun e!621406 () Bool)

(assert (=> start!95992 (=> (not res!725598) (not e!621406))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95992 (= res!725598 (validMask!0 mask!1414))))

(assert (=> start!95992 e!621406))

(assert (=> start!95992 tp!79801))

(assert (=> start!95992 true))

(declare-fun tp_is_empty!26653 () Bool)

(assert (=> start!95992 tp_is_empty!26653))

(declare-datatypes ((array!70158 0))(
  ( (array!70159 (arr!33753 (Array (_ BitVec 32) (_ BitVec 64))) (size!34291 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70158)

(declare-fun array_inv!26080 (array!70158) Bool)

(assert (=> start!95992 (array_inv!26080 _keys!1070)))

(declare-fun array_inv!26081 (array!70156) Bool)

(assert (=> start!95992 (and (array_inv!26081 _values!874) e!621408)))

(declare-fun b!1087910 () Bool)

(assert (=> b!1087910 (= e!621409 tp_is_empty!26653)))

(declare-fun b!1087911 () Bool)

(declare-fun e!621407 () Bool)

(declare-fun e!621413 () Bool)

(assert (=> b!1087911 (= e!621407 (not e!621413))))

(declare-fun res!725601 () Bool)

(assert (=> b!1087911 (=> res!725601 e!621413)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087911 (= res!725601 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!17046 0))(
  ( (tuple2!17047 (_1!8534 (_ BitVec 64)) (_2!8534 V!40665)) )
))
(declare-datatypes ((List!23614 0))(
  ( (Nil!23611) (Cons!23610 (h!24819 tuple2!17046) (t!33314 List!23614)) )
))
(declare-datatypes ((ListLongMap!15015 0))(
  ( (ListLongMap!15016 (toList!7523 List!23614)) )
))
(declare-fun lt!484266 () ListLongMap!15015)

(declare-fun minValue!831 () V!40665)

(declare-fun zeroValue!831 () V!40665)

(declare-fun getCurrentListMap!4204 (array!70158 array!70156 (_ BitVec 32) (_ BitVec 32) V!40665 V!40665 (_ BitVec 32) Int) ListLongMap!15015)

(assert (=> b!1087911 (= lt!484266 (getCurrentListMap!4204 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484264 () array!70158)

(declare-fun lt!484274 () ListLongMap!15015)

(declare-fun lt!484267 () array!70156)

(assert (=> b!1087911 (= lt!484274 (getCurrentListMap!4204 lt!484264 lt!484267 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484262 () ListLongMap!15015)

(declare-fun lt!484269 () ListLongMap!15015)

(assert (=> b!1087911 (and (= lt!484262 lt!484269) (= lt!484269 lt!484262))))

(declare-fun lt!484272 () ListLongMap!15015)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!801 (ListLongMap!15015 (_ BitVec 64)) ListLongMap!15015)

(assert (=> b!1087911 (= lt!484269 (-!801 lt!484272 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35637 0))(
  ( (Unit!35638) )
))
(declare-fun lt!484271 () Unit!35637)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!88 (array!70158 array!70156 (_ BitVec 32) (_ BitVec 32) V!40665 V!40665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35637)

(assert (=> b!1087911 (= lt!484271 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!88 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4074 (array!70158 array!70156 (_ BitVec 32) (_ BitVec 32) V!40665 V!40665 (_ BitVec 32) Int) ListLongMap!15015)

(assert (=> b!1087911 (= lt!484262 (getCurrentListMapNoExtraKeys!4074 lt!484264 lt!484267 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2145 (Int (_ BitVec 64)) V!40665)

(assert (=> b!1087911 (= lt!484267 (array!70157 (store (arr!33752 _values!874) i!650 (ValueCellFull!12617 (dynLambda!2145 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34290 _values!874)))))

(assert (=> b!1087911 (= lt!484272 (getCurrentListMapNoExtraKeys!4074 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087911 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484268 () Unit!35637)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70158 (_ BitVec 64) (_ BitVec 32)) Unit!35637)

(assert (=> b!1087911 (= lt!484268 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1087912 () Bool)

(declare-fun res!725607 () Bool)

(assert (=> b!1087912 (=> (not res!725607) (not e!621406))))

(assert (=> b!1087912 (= res!725607 (and (= (size!34290 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34291 _keys!1070) (size!34290 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087913 () Bool)

(assert (=> b!1087913 (= e!621406 e!621407)))

(declare-fun res!725597 () Bool)

(assert (=> b!1087913 (=> (not res!725597) (not e!621407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70158 (_ BitVec 32)) Bool)

(assert (=> b!1087913 (= res!725597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484264 mask!1414))))

(assert (=> b!1087913 (= lt!484264 (array!70159 (store (arr!33753 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34291 _keys!1070)))))

(declare-fun mapIsEmpty!41734 () Bool)

(assert (=> mapIsEmpty!41734 mapRes!41734))

(declare-fun b!1087914 () Bool)

(declare-fun res!725603 () Bool)

(assert (=> b!1087914 (=> (not res!725603) (not e!621406))))

(assert (=> b!1087914 (= res!725603 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34291 _keys!1070))))))

(declare-fun b!1087915 () Bool)

(declare-fun e!621412 () Bool)

(assert (=> b!1087915 (= e!621412 true)))

(declare-fun lt!484270 () ListLongMap!15015)

(declare-fun lt!484273 () ListLongMap!15015)

(assert (=> b!1087915 (= (-!801 lt!484270 k0!904) lt!484273)))

(declare-fun lt!484265 () Unit!35637)

(declare-fun addRemoveCommutativeForDiffKeys!54 (ListLongMap!15015 (_ BitVec 64) V!40665 (_ BitVec 64)) Unit!35637)

(assert (=> b!1087915 (= lt!484265 (addRemoveCommutativeForDiffKeys!54 lt!484272 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1087916 () Bool)

(assert (=> b!1087916 (= e!621413 e!621412)))

(declare-fun res!725605 () Bool)

(assert (=> b!1087916 (=> res!725605 e!621412)))

(assert (=> b!1087916 (= res!725605 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1087916 (= lt!484274 lt!484273)))

(declare-fun lt!484263 () tuple2!17046)

(declare-fun +!3327 (ListLongMap!15015 tuple2!17046) ListLongMap!15015)

(assert (=> b!1087916 (= lt!484273 (+!3327 lt!484269 lt!484263))))

(assert (=> b!1087916 (= lt!484266 lt!484270)))

(assert (=> b!1087916 (= lt!484270 (+!3327 lt!484272 lt!484263))))

(assert (=> b!1087916 (= lt!484274 (+!3327 lt!484262 lt!484263))))

(assert (=> b!1087916 (= lt!484263 (tuple2!17047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087917 () Bool)

(declare-fun res!725599 () Bool)

(assert (=> b!1087917 (=> (not res!725599) (not e!621407))))

(declare-datatypes ((List!23615 0))(
  ( (Nil!23612) (Cons!23611 (h!24820 (_ BitVec 64)) (t!33315 List!23615)) )
))
(declare-fun arrayNoDuplicates!0 (array!70158 (_ BitVec 32) List!23615) Bool)

(assert (=> b!1087917 (= res!725599 (arrayNoDuplicates!0 lt!484264 #b00000000000000000000000000000000 Nil!23612))))

(declare-fun b!1087918 () Bool)

(declare-fun res!725604 () Bool)

(assert (=> b!1087918 (=> (not res!725604) (not e!621406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087918 (= res!725604 (validKeyInArray!0 k0!904))))

(declare-fun b!1087919 () Bool)

(declare-fun res!725606 () Bool)

(assert (=> b!1087919 (=> (not res!725606) (not e!621406))))

(assert (=> b!1087919 (= res!725606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087920 () Bool)

(declare-fun res!725602 () Bool)

(assert (=> b!1087920 (=> (not res!725602) (not e!621406))))

(assert (=> b!1087920 (= res!725602 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23612))))

(declare-fun mapNonEmpty!41734 () Bool)

(declare-fun tp!79802 () Bool)

(declare-fun e!621410 () Bool)

(assert (=> mapNonEmpty!41734 (= mapRes!41734 (and tp!79802 e!621410))))

(declare-fun mapValue!41734 () ValueCell!12617)

(declare-fun mapRest!41734 () (Array (_ BitVec 32) ValueCell!12617))

(declare-fun mapKey!41734 () (_ BitVec 32))

(assert (=> mapNonEmpty!41734 (= (arr!33752 _values!874) (store mapRest!41734 mapKey!41734 mapValue!41734))))

(declare-fun b!1087921 () Bool)

(declare-fun res!725600 () Bool)

(assert (=> b!1087921 (=> (not res!725600) (not e!621406))))

(assert (=> b!1087921 (= res!725600 (= (select (arr!33753 _keys!1070) i!650) k0!904))))

(declare-fun b!1087922 () Bool)

(assert (=> b!1087922 (= e!621410 tp_is_empty!26653)))

(assert (= (and start!95992 res!725598) b!1087912))

(assert (= (and b!1087912 res!725607) b!1087919))

(assert (= (and b!1087919 res!725606) b!1087920))

(assert (= (and b!1087920 res!725602) b!1087914))

(assert (= (and b!1087914 res!725603) b!1087918))

(assert (= (and b!1087918 res!725604) b!1087921))

(assert (= (and b!1087921 res!725600) b!1087913))

(assert (= (and b!1087913 res!725597) b!1087917))

(assert (= (and b!1087917 res!725599) b!1087911))

(assert (= (and b!1087911 (not res!725601)) b!1087916))

(assert (= (and b!1087916 (not res!725605)) b!1087915))

(assert (= (and b!1087909 condMapEmpty!41734) mapIsEmpty!41734))

(assert (= (and b!1087909 (not condMapEmpty!41734)) mapNonEmpty!41734))

(get-info :version)

(assert (= (and mapNonEmpty!41734 ((_ is ValueCellFull!12617) mapValue!41734)) b!1087922))

(assert (= (and b!1087909 ((_ is ValueCellFull!12617) mapDefault!41734)) b!1087910))

(assert (= start!95992 b!1087909))

(declare-fun b_lambda!17299 () Bool)

(assert (=> (not b_lambda!17299) (not b!1087911)))

(declare-fun t!33313 () Bool)

(declare-fun tb!7521 () Bool)

(assert (=> (and start!95992 (= defaultEntry!882 defaultEntry!882) t!33313) tb!7521))

(declare-fun result!15569 () Bool)

(assert (=> tb!7521 (= result!15569 tp_is_empty!26653)))

(assert (=> b!1087911 t!33313))

(declare-fun b_and!35953 () Bool)

(assert (= b_and!35951 (and (=> t!33313 result!15569) b_and!35953)))

(declare-fun m!1006433 () Bool)

(assert (=> b!1087911 m!1006433))

(declare-fun m!1006435 () Bool)

(assert (=> b!1087911 m!1006435))

(declare-fun m!1006437 () Bool)

(assert (=> b!1087911 m!1006437))

(declare-fun m!1006439 () Bool)

(assert (=> b!1087911 m!1006439))

(declare-fun m!1006441 () Bool)

(assert (=> b!1087911 m!1006441))

(declare-fun m!1006443 () Bool)

(assert (=> b!1087911 m!1006443))

(declare-fun m!1006445 () Bool)

(assert (=> b!1087911 m!1006445))

(declare-fun m!1006447 () Bool)

(assert (=> b!1087911 m!1006447))

(declare-fun m!1006449 () Bool)

(assert (=> b!1087911 m!1006449))

(declare-fun m!1006451 () Bool)

(assert (=> b!1087911 m!1006451))

(declare-fun m!1006453 () Bool)

(assert (=> b!1087916 m!1006453))

(declare-fun m!1006455 () Bool)

(assert (=> b!1087916 m!1006455))

(declare-fun m!1006457 () Bool)

(assert (=> b!1087916 m!1006457))

(declare-fun m!1006459 () Bool)

(assert (=> b!1087917 m!1006459))

(declare-fun m!1006461 () Bool)

(assert (=> b!1087918 m!1006461))

(declare-fun m!1006463 () Bool)

(assert (=> mapNonEmpty!41734 m!1006463))

(declare-fun m!1006465 () Bool)

(assert (=> b!1087915 m!1006465))

(declare-fun m!1006467 () Bool)

(assert (=> b!1087915 m!1006467))

(declare-fun m!1006469 () Bool)

(assert (=> b!1087913 m!1006469))

(declare-fun m!1006471 () Bool)

(assert (=> b!1087913 m!1006471))

(declare-fun m!1006473 () Bool)

(assert (=> b!1087920 m!1006473))

(declare-fun m!1006475 () Bool)

(assert (=> b!1087921 m!1006475))

(declare-fun m!1006477 () Bool)

(assert (=> b!1087919 m!1006477))

(declare-fun m!1006479 () Bool)

(assert (=> start!95992 m!1006479))

(declare-fun m!1006481 () Bool)

(assert (=> start!95992 m!1006481))

(declare-fun m!1006483 () Bool)

(assert (=> start!95992 m!1006483))

(check-sat tp_is_empty!26653 (not b!1087911) (not b!1087916) (not b!1087919) (not start!95992) (not b_next!22651) (not b!1087913) (not b!1087917) (not b!1087915) b_and!35953 (not b!1087920) (not b_lambda!17299) (not mapNonEmpty!41734) (not b!1087918))
(check-sat b_and!35953 (not b_next!22651))
