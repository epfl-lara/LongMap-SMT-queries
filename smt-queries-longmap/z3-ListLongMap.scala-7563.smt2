; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95934 () Bool)

(assert start!95934)

(declare-fun b_free!22351 () Bool)

(declare-fun b_next!22351 () Bool)

(assert (=> start!95934 (= b_free!22351 (not b_next!22351))))

(declare-fun tp!78901 () Bool)

(declare-fun b_and!35387 () Bool)

(assert (=> start!95934 (= tp!78901 b_and!35387)))

(declare-fun b!1083208 () Bool)

(declare-fun e!619192 () Bool)

(declare-fun e!619196 () Bool)

(assert (=> b!1083208 (= e!619192 e!619196)))

(declare-fun res!721660 () Bool)

(assert (=> b!1083208 (=> (not res!721660) (not e!619196))))

(declare-datatypes ((array!69689 0))(
  ( (array!69690 (arr!33512 (Array (_ BitVec 32) (_ BitVec 64))) (size!34049 (_ BitVec 32))) )
))
(declare-fun lt!479958 () array!69689)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69689 (_ BitVec 32)) Bool)

(assert (=> b!1083208 (= res!721660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479958 mask!1414))))

(declare-fun _keys!1070 () array!69689)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083208 (= lt!479958 (array!69690 (store (arr!33512 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34049 _keys!1070)))))

(declare-fun res!721665 () Bool)

(assert (=> start!95934 (=> (not res!721665) (not e!619192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95934 (= res!721665 (validMask!0 mask!1414))))

(assert (=> start!95934 e!619192))

(assert (=> start!95934 tp!78901))

(assert (=> start!95934 true))

(declare-fun tp_is_empty!26353 () Bool)

(assert (=> start!95934 tp_is_empty!26353))

(declare-fun array_inv!25910 (array!69689) Bool)

(assert (=> start!95934 (array_inv!25910 _keys!1070)))

(declare-datatypes ((V!40265 0))(
  ( (V!40266 (val!13233 Int)) )
))
(declare-datatypes ((ValueCell!12467 0))(
  ( (ValueCellFull!12467 (v!15850 V!40265)) (EmptyCell!12467) )
))
(declare-datatypes ((array!69691 0))(
  ( (array!69692 (arr!33513 (Array (_ BitVec 32) ValueCell!12467)) (size!34050 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69691)

(declare-fun e!619191 () Bool)

(declare-fun array_inv!25911 (array!69691) Bool)

(assert (=> start!95934 (and (array_inv!25911 _values!874) e!619191)))

(declare-fun mapNonEmpty!41284 () Bool)

(declare-fun mapRes!41284 () Bool)

(declare-fun tp!78902 () Bool)

(declare-fun e!619195 () Bool)

(assert (=> mapNonEmpty!41284 (= mapRes!41284 (and tp!78902 e!619195))))

(declare-fun mapRest!41284 () (Array (_ BitVec 32) ValueCell!12467))

(declare-fun mapValue!41284 () ValueCell!12467)

(declare-fun mapKey!41284 () (_ BitVec 32))

(assert (=> mapNonEmpty!41284 (= (arr!33513 _values!874) (store mapRest!41284 mapKey!41284 mapValue!41284))))

(declare-fun b!1083209 () Bool)

(declare-fun res!721663 () Bool)

(assert (=> b!1083209 (=> (not res!721663) (not e!619192))))

(declare-datatypes ((List!23357 0))(
  ( (Nil!23354) (Cons!23353 (h!24571 (_ BitVec 64)) (t!32758 List!23357)) )
))
(declare-fun arrayNoDuplicates!0 (array!69689 (_ BitVec 32) List!23357) Bool)

(assert (=> b!1083209 (= res!721663 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23354))))

(declare-fun b!1083210 () Bool)

(assert (=> b!1083210 (= e!619196 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16768 0))(
  ( (tuple2!16769 (_1!8395 (_ BitVec 64)) (_2!8395 V!40265)) )
))
(declare-datatypes ((List!23358 0))(
  ( (Nil!23355) (Cons!23354 (h!24572 tuple2!16768) (t!32759 List!23358)) )
))
(declare-datatypes ((ListLongMap!14745 0))(
  ( (ListLongMap!14746 (toList!7388 List!23358)) )
))
(declare-fun lt!479957 () ListLongMap!14745)

(declare-fun minValue!831 () V!40265)

(declare-fun zeroValue!831 () V!40265)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3965 (array!69689 array!69691 (_ BitVec 32) (_ BitVec 32) V!40265 V!40265 (_ BitVec 32) Int) ListLongMap!14745)

(declare-fun dynLambda!2086 (Int (_ BitVec 64)) V!40265)

(assert (=> b!1083210 (= lt!479957 (getCurrentListMapNoExtraKeys!3965 lt!479958 (array!69692 (store (arr!33513 _values!874) i!650 (ValueCellFull!12467 (dynLambda!2086 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34050 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479956 () ListLongMap!14745)

(assert (=> b!1083210 (= lt!479956 (getCurrentListMapNoExtraKeys!3965 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083210 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35567 0))(
  ( (Unit!35568) )
))
(declare-fun lt!479955 () Unit!35567)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69689 (_ BitVec 64) (_ BitVec 32)) Unit!35567)

(assert (=> b!1083210 (= lt!479955 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083211 () Bool)

(declare-fun e!619193 () Bool)

(assert (=> b!1083211 (= e!619191 (and e!619193 mapRes!41284))))

(declare-fun condMapEmpty!41284 () Bool)

(declare-fun mapDefault!41284 () ValueCell!12467)

(assert (=> b!1083211 (= condMapEmpty!41284 (= (arr!33513 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12467)) mapDefault!41284)))))

(declare-fun mapIsEmpty!41284 () Bool)

(assert (=> mapIsEmpty!41284 mapRes!41284))

(declare-fun b!1083212 () Bool)

(declare-fun res!721658 () Bool)

(assert (=> b!1083212 (=> (not res!721658) (not e!619192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083212 (= res!721658 (validKeyInArray!0 k0!904))))

(declare-fun b!1083213 () Bool)

(declare-fun res!721662 () Bool)

(assert (=> b!1083213 (=> (not res!721662) (not e!619192))))

(assert (=> b!1083213 (= res!721662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083214 () Bool)

(assert (=> b!1083214 (= e!619195 tp_is_empty!26353)))

(declare-fun b!1083215 () Bool)

(assert (=> b!1083215 (= e!619193 tp_is_empty!26353)))

(declare-fun b!1083216 () Bool)

(declare-fun res!721659 () Bool)

(assert (=> b!1083216 (=> (not res!721659) (not e!619192))))

(assert (=> b!1083216 (= res!721659 (and (= (size!34050 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34049 _keys!1070) (size!34050 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083217 () Bool)

(declare-fun res!721661 () Bool)

(assert (=> b!1083217 (=> (not res!721661) (not e!619192))))

(assert (=> b!1083217 (= res!721661 (= (select (arr!33512 _keys!1070) i!650) k0!904))))

(declare-fun b!1083218 () Bool)

(declare-fun res!721657 () Bool)

(assert (=> b!1083218 (=> (not res!721657) (not e!619196))))

(assert (=> b!1083218 (= res!721657 (arrayNoDuplicates!0 lt!479958 #b00000000000000000000000000000000 Nil!23354))))

(declare-fun b!1083219 () Bool)

(declare-fun res!721664 () Bool)

(assert (=> b!1083219 (=> (not res!721664) (not e!619192))))

(assert (=> b!1083219 (= res!721664 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34049 _keys!1070))))))

(assert (= (and start!95934 res!721665) b!1083216))

(assert (= (and b!1083216 res!721659) b!1083213))

(assert (= (and b!1083213 res!721662) b!1083209))

(assert (= (and b!1083209 res!721663) b!1083219))

(assert (= (and b!1083219 res!721664) b!1083212))

(assert (= (and b!1083212 res!721658) b!1083217))

(assert (= (and b!1083217 res!721661) b!1083208))

(assert (= (and b!1083208 res!721660) b!1083218))

(assert (= (and b!1083218 res!721657) b!1083210))

(assert (= (and b!1083211 condMapEmpty!41284) mapIsEmpty!41284))

(assert (= (and b!1083211 (not condMapEmpty!41284)) mapNonEmpty!41284))

(get-info :version)

(assert (= (and mapNonEmpty!41284 ((_ is ValueCellFull!12467) mapValue!41284)) b!1083214))

(assert (= (and b!1083211 ((_ is ValueCellFull!12467) mapDefault!41284)) b!1083215))

(assert (= start!95934 b!1083211))

(declare-fun b_lambda!17031 () Bool)

(assert (=> (not b_lambda!17031) (not b!1083210)))

(declare-fun t!32757 () Bool)

(declare-fun tb!7221 () Bool)

(assert (=> (and start!95934 (= defaultEntry!882 defaultEntry!882) t!32757) tb!7221))

(declare-fun result!14969 () Bool)

(assert (=> tb!7221 (= result!14969 tp_is_empty!26353)))

(assert (=> b!1083210 t!32757))

(declare-fun b_and!35389 () Bool)

(assert (= b_and!35387 (and (=> t!32757 result!14969) b_and!35389)))

(declare-fun m!1001297 () Bool)

(assert (=> start!95934 m!1001297))

(declare-fun m!1001299 () Bool)

(assert (=> start!95934 m!1001299))

(declare-fun m!1001301 () Bool)

(assert (=> start!95934 m!1001301))

(declare-fun m!1001303 () Bool)

(assert (=> b!1083210 m!1001303))

(declare-fun m!1001305 () Bool)

(assert (=> b!1083210 m!1001305))

(declare-fun m!1001307 () Bool)

(assert (=> b!1083210 m!1001307))

(declare-fun m!1001309 () Bool)

(assert (=> b!1083210 m!1001309))

(declare-fun m!1001311 () Bool)

(assert (=> b!1083210 m!1001311))

(declare-fun m!1001313 () Bool)

(assert (=> b!1083210 m!1001313))

(declare-fun m!1001315 () Bool)

(assert (=> b!1083212 m!1001315))

(declare-fun m!1001317 () Bool)

(assert (=> mapNonEmpty!41284 m!1001317))

(declare-fun m!1001319 () Bool)

(assert (=> b!1083218 m!1001319))

(declare-fun m!1001321 () Bool)

(assert (=> b!1083209 m!1001321))

(declare-fun m!1001323 () Bool)

(assert (=> b!1083217 m!1001323))

(declare-fun m!1001325 () Bool)

(assert (=> b!1083213 m!1001325))

(declare-fun m!1001327 () Bool)

(assert (=> b!1083208 m!1001327))

(declare-fun m!1001329 () Bool)

(assert (=> b!1083208 m!1001329))

(check-sat (not b_lambda!17031) (not b!1083208) (not b!1083218) (not mapNonEmpty!41284) (not b!1083210) (not start!95934) (not b!1083213) tp_is_empty!26353 (not b!1083212) b_and!35389 (not b_next!22351) (not b!1083209))
(check-sat b_and!35389 (not b_next!22351))
