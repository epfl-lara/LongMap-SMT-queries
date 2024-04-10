; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95784 () Bool)

(assert start!95784)

(declare-fun b_free!22437 () Bool)

(declare-fun b_next!22437 () Bool)

(assert (=> start!95784 (= b_free!22437 (not b_next!22437))))

(declare-fun tp!79159 () Bool)

(declare-fun b_and!35549 () Bool)

(assert (=> start!95784 (= tp!79159 b_and!35549)))

(declare-fun b!1083515 () Bool)

(declare-fun res!722302 () Bool)

(declare-fun e!619115 () Bool)

(assert (=> b!1083515 (=> (not res!722302) (not e!619115))))

(declare-datatypes ((array!69821 0))(
  ( (array!69822 (arr!33584 (Array (_ BitVec 32) (_ BitVec 64))) (size!34120 (_ BitVec 32))) )
))
(declare-fun lt!480114 () array!69821)

(declare-datatypes ((List!23410 0))(
  ( (Nil!23407) (Cons!23406 (h!24615 (_ BitVec 64)) (t!32905 List!23410)) )
))
(declare-fun arrayNoDuplicates!0 (array!69821 (_ BitVec 32) List!23410) Bool)

(assert (=> b!1083515 (= res!722302 (arrayNoDuplicates!0 lt!480114 #b00000000000000000000000000000000 Nil!23407))))

(declare-fun b!1083516 () Bool)

(declare-fun res!722300 () Bool)

(declare-fun e!619114 () Bool)

(assert (=> b!1083516 (=> (not res!722300) (not e!619114))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun _keys!1070 () array!69821)

(assert (=> b!1083516 (= res!722300 (= (select (arr!33584 _keys!1070) i!650) k0!904))))

(declare-fun b!1083517 () Bool)

(declare-fun res!722303 () Bool)

(assert (=> b!1083517 (=> (not res!722303) (not e!619114))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69821 (_ BitVec 32)) Bool)

(assert (=> b!1083517 (= res!722303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41413 () Bool)

(declare-fun mapRes!41413 () Bool)

(assert (=> mapIsEmpty!41413 mapRes!41413))

(declare-fun res!722299 () Bool)

(assert (=> start!95784 (=> (not res!722299) (not e!619114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95784 (= res!722299 (validMask!0 mask!1414))))

(assert (=> start!95784 e!619114))

(assert (=> start!95784 tp!79159))

(assert (=> start!95784 true))

(declare-fun tp_is_empty!26439 () Bool)

(assert (=> start!95784 tp_is_empty!26439))

(declare-fun array_inv!25920 (array!69821) Bool)

(assert (=> start!95784 (array_inv!25920 _keys!1070)))

(declare-datatypes ((V!40379 0))(
  ( (V!40380 (val!13276 Int)) )
))
(declare-datatypes ((ValueCell!12510 0))(
  ( (ValueCellFull!12510 (v!15897 V!40379)) (EmptyCell!12510) )
))
(declare-datatypes ((array!69823 0))(
  ( (array!69824 (arr!33585 (Array (_ BitVec 32) ValueCell!12510)) (size!34121 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69823)

(declare-fun e!619113 () Bool)

(declare-fun array_inv!25921 (array!69823) Bool)

(assert (=> start!95784 (and (array_inv!25921 _values!874) e!619113)))

(declare-fun b!1083518 () Bool)

(declare-fun e!619110 () Bool)

(assert (=> b!1083518 (= e!619110 tp_is_empty!26439)))

(declare-fun b!1083519 () Bool)

(declare-fun e!619112 () Bool)

(assert (=> b!1083519 (= e!619113 (and e!619112 mapRes!41413))))

(declare-fun condMapEmpty!41413 () Bool)

(declare-fun mapDefault!41413 () ValueCell!12510)

(assert (=> b!1083519 (= condMapEmpty!41413 (= (arr!33585 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12510)) mapDefault!41413)))))

(declare-fun b!1083520 () Bool)

(declare-fun res!722298 () Bool)

(assert (=> b!1083520 (=> (not res!722298) (not e!619114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083520 (= res!722298 (validKeyInArray!0 k0!904))))

(declare-fun b!1083521 () Bool)

(declare-fun res!722296 () Bool)

(assert (=> b!1083521 (=> (not res!722296) (not e!619114))))

(assert (=> b!1083521 (= res!722296 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34120 _keys!1070))))))

(declare-fun mapNonEmpty!41413 () Bool)

(declare-fun tp!79160 () Bool)

(assert (=> mapNonEmpty!41413 (= mapRes!41413 (and tp!79160 e!619110))))

(declare-fun mapKey!41413 () (_ BitVec 32))

(declare-fun mapValue!41413 () ValueCell!12510)

(declare-fun mapRest!41413 () (Array (_ BitVec 32) ValueCell!12510))

(assert (=> mapNonEmpty!41413 (= (arr!33585 _values!874) (store mapRest!41413 mapKey!41413 mapValue!41413))))

(declare-fun b!1083522 () Bool)

(assert (=> b!1083522 (= e!619115 (not (bvsle #b00000000000000000000000000000000 (size!34120 _keys!1070))))))

(declare-datatypes ((tuple2!16822 0))(
  ( (tuple2!16823 (_1!8422 (_ BitVec 64)) (_2!8422 V!40379)) )
))
(declare-datatypes ((List!23411 0))(
  ( (Nil!23408) (Cons!23407 (h!24616 tuple2!16822) (t!32906 List!23411)) )
))
(declare-datatypes ((ListLongMap!14791 0))(
  ( (ListLongMap!14792 (toList!7411 List!23411)) )
))
(declare-fun lt!480115 () ListLongMap!14791)

(declare-fun lt!480113 () ListLongMap!14791)

(assert (=> b!1083522 (and (= lt!480115 lt!480113) (= lt!480113 lt!480115))))

(declare-fun lt!480111 () ListLongMap!14791)

(declare-fun -!738 (ListLongMap!14791 (_ BitVec 64)) ListLongMap!14791)

(assert (=> b!1083522 (= lt!480113 (-!738 lt!480111 k0!904))))

(declare-fun minValue!831 () V!40379)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40379)

(declare-datatypes ((Unit!35642 0))(
  ( (Unit!35643) )
))
(declare-fun lt!480110 () Unit!35642)

(declare-fun defaultEntry!882 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!18 (array!69821 array!69823 (_ BitVec 32) (_ BitVec 32) V!40379 V!40379 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35642)

(assert (=> b!1083522 (= lt!480110 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!18 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3959 (array!69821 array!69823 (_ BitVec 32) (_ BitVec 32) V!40379 V!40379 (_ BitVec 32) Int) ListLongMap!14791)

(declare-fun dynLambda!2096 (Int (_ BitVec 64)) V!40379)

(assert (=> b!1083522 (= lt!480115 (getCurrentListMapNoExtraKeys!3959 lt!480114 (array!69824 (store (arr!33585 _values!874) i!650 (ValueCellFull!12510 (dynLambda!2096 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34121 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083522 (= lt!480111 (getCurrentListMapNoExtraKeys!3959 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083522 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480112 () Unit!35642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69821 (_ BitVec 64) (_ BitVec 32)) Unit!35642)

(assert (=> b!1083522 (= lt!480112 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083523 () Bool)

(declare-fun res!722301 () Bool)

(assert (=> b!1083523 (=> (not res!722301) (not e!619114))))

(assert (=> b!1083523 (= res!722301 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23407))))

(declare-fun b!1083524 () Bool)

(assert (=> b!1083524 (= e!619112 tp_is_empty!26439)))

(declare-fun b!1083525 () Bool)

(assert (=> b!1083525 (= e!619114 e!619115)))

(declare-fun res!722304 () Bool)

(assert (=> b!1083525 (=> (not res!722304) (not e!619115))))

(assert (=> b!1083525 (= res!722304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480114 mask!1414))))

(assert (=> b!1083525 (= lt!480114 (array!69822 (store (arr!33584 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34120 _keys!1070)))))

(declare-fun b!1083526 () Bool)

(declare-fun res!722297 () Bool)

(assert (=> b!1083526 (=> (not res!722297) (not e!619114))))

(assert (=> b!1083526 (= res!722297 (and (= (size!34121 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34120 _keys!1070) (size!34121 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95784 res!722299) b!1083526))

(assert (= (and b!1083526 res!722297) b!1083517))

(assert (= (and b!1083517 res!722303) b!1083523))

(assert (= (and b!1083523 res!722301) b!1083521))

(assert (= (and b!1083521 res!722296) b!1083520))

(assert (= (and b!1083520 res!722298) b!1083516))

(assert (= (and b!1083516 res!722300) b!1083525))

(assert (= (and b!1083525 res!722304) b!1083515))

(assert (= (and b!1083515 res!722302) b!1083522))

(assert (= (and b!1083519 condMapEmpty!41413) mapIsEmpty!41413))

(assert (= (and b!1083519 (not condMapEmpty!41413)) mapNonEmpty!41413))

(get-info :version)

(assert (= (and mapNonEmpty!41413 ((_ is ValueCellFull!12510) mapValue!41413)) b!1083518))

(assert (= (and b!1083519 ((_ is ValueCellFull!12510) mapDefault!41413)) b!1083524))

(assert (= start!95784 b!1083519))

(declare-fun b_lambda!17107 () Bool)

(assert (=> (not b_lambda!17107) (not b!1083522)))

(declare-fun t!32904 () Bool)

(declare-fun tb!7315 () Bool)

(assert (=> (and start!95784 (= defaultEntry!882 defaultEntry!882) t!32904) tb!7315))

(declare-fun result!15149 () Bool)

(assert (=> tb!7315 (= result!15149 tp_is_empty!26439)))

(assert (=> b!1083522 t!32904))

(declare-fun b_and!35551 () Bool)

(assert (= b_and!35549 (and (=> t!32904 result!15149) b_and!35551)))

(declare-fun m!1001187 () Bool)

(assert (=> b!1083520 m!1001187))

(declare-fun m!1001189 () Bool)

(assert (=> b!1083516 m!1001189))

(declare-fun m!1001191 () Bool)

(assert (=> mapNonEmpty!41413 m!1001191))

(declare-fun m!1001193 () Bool)

(assert (=> b!1083515 m!1001193))

(declare-fun m!1001195 () Bool)

(assert (=> b!1083522 m!1001195))

(declare-fun m!1001197 () Bool)

(assert (=> b!1083522 m!1001197))

(declare-fun m!1001199 () Bool)

(assert (=> b!1083522 m!1001199))

(declare-fun m!1001201 () Bool)

(assert (=> b!1083522 m!1001201))

(declare-fun m!1001203 () Bool)

(assert (=> b!1083522 m!1001203))

(declare-fun m!1001205 () Bool)

(assert (=> b!1083522 m!1001205))

(declare-fun m!1001207 () Bool)

(assert (=> b!1083522 m!1001207))

(declare-fun m!1001209 () Bool)

(assert (=> b!1083522 m!1001209))

(declare-fun m!1001211 () Bool)

(assert (=> b!1083523 m!1001211))

(declare-fun m!1001213 () Bool)

(assert (=> b!1083525 m!1001213))

(declare-fun m!1001215 () Bool)

(assert (=> b!1083525 m!1001215))

(declare-fun m!1001217 () Bool)

(assert (=> start!95784 m!1001217))

(declare-fun m!1001219 () Bool)

(assert (=> start!95784 m!1001219))

(declare-fun m!1001221 () Bool)

(assert (=> start!95784 m!1001221))

(declare-fun m!1001223 () Bool)

(assert (=> b!1083517 m!1001223))

(check-sat (not b_next!22437) (not b!1083523) (not b!1083525) (not b!1083522) (not mapNonEmpty!41413) (not start!95784) (not b_lambda!17107) (not b!1083520) b_and!35551 tp_is_empty!26439 (not b!1083515) (not b!1083517))
(check-sat b_and!35551 (not b_next!22437))
