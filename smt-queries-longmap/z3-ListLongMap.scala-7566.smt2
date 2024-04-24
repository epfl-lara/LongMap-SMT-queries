; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95952 () Bool)

(assert start!95952)

(declare-fun b_free!22369 () Bool)

(declare-fun b_next!22369 () Bool)

(assert (=> start!95952 (= b_free!22369 (not b_next!22369))))

(declare-fun tp!78956 () Bool)

(declare-fun b_and!35423 () Bool)

(assert (=> start!95952 (= tp!78956 b_and!35423)))

(declare-fun mapNonEmpty!41311 () Bool)

(declare-fun mapRes!41311 () Bool)

(declare-fun tp!78955 () Bool)

(declare-fun e!619358 () Bool)

(assert (=> mapNonEmpty!41311 (= mapRes!41311 (and tp!78955 e!619358))))

(declare-datatypes ((V!40289 0))(
  ( (V!40290 (val!13242 Int)) )
))
(declare-datatypes ((ValueCell!12476 0))(
  ( (ValueCellFull!12476 (v!15859 V!40289)) (EmptyCell!12476) )
))
(declare-datatypes ((array!69725 0))(
  ( (array!69726 (arr!33530 (Array (_ BitVec 32) ValueCell!12476)) (size!34067 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69725)

(declare-fun mapRest!41311 () (Array (_ BitVec 32) ValueCell!12476))

(declare-fun mapKey!41311 () (_ BitVec 32))

(declare-fun mapValue!41311 () ValueCell!12476)

(assert (=> mapNonEmpty!41311 (= (arr!33530 _values!874) (store mapRest!41311 mapKey!41311 mapValue!41311))))

(declare-fun b!1083550 () Bool)

(declare-fun res!721905 () Bool)

(declare-fun e!619356 () Bool)

(assert (=> b!1083550 (=> (not res!721905) (not e!619356))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083550 (= res!721905 (validKeyInArray!0 k0!904))))

(declare-fun b!1083551 () Bool)

(declare-fun tp_is_empty!26371 () Bool)

(assert (=> b!1083551 (= e!619358 tp_is_empty!26371)))

(declare-fun b!1083552 () Bool)

(declare-fun res!721900 () Bool)

(assert (=> b!1083552 (=> (not res!721900) (not e!619356))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69727 0))(
  ( (array!69728 (arr!33531 (Array (_ BitVec 32) (_ BitVec 64))) (size!34068 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69727)

(assert (=> b!1083552 (= res!721900 (and (= (size!34067 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34068 _keys!1070) (size!34067 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!721901 () Bool)

(assert (=> start!95952 (=> (not res!721901) (not e!619356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95952 (= res!721901 (validMask!0 mask!1414))))

(assert (=> start!95952 e!619356))

(assert (=> start!95952 tp!78956))

(assert (=> start!95952 true))

(assert (=> start!95952 tp_is_empty!26371))

(declare-fun array_inv!25926 (array!69727) Bool)

(assert (=> start!95952 (array_inv!25926 _keys!1070)))

(declare-fun e!619353 () Bool)

(declare-fun array_inv!25927 (array!69725) Bool)

(assert (=> start!95952 (and (array_inv!25927 _values!874) e!619353)))

(declare-fun mapIsEmpty!41311 () Bool)

(assert (=> mapIsEmpty!41311 mapRes!41311))

(declare-fun b!1083553 () Bool)

(declare-fun e!619355 () Bool)

(assert (=> b!1083553 (= e!619355 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40289)

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((tuple2!16780 0))(
  ( (tuple2!16781 (_1!8401 (_ BitVec 64)) (_2!8401 V!40289)) )
))
(declare-datatypes ((List!23370 0))(
  ( (Nil!23367) (Cons!23366 (h!24584 tuple2!16780) (t!32789 List!23370)) )
))
(declare-datatypes ((ListLongMap!14757 0))(
  ( (ListLongMap!14758 (toList!7394 List!23370)) )
))
(declare-fun lt!480065 () ListLongMap!14757)

(declare-fun zeroValue!831 () V!40289)

(declare-fun lt!480066 () array!69727)

(declare-fun getCurrentListMapNoExtraKeys!3971 (array!69727 array!69725 (_ BitVec 32) (_ BitVec 32) V!40289 V!40289 (_ BitVec 32) Int) ListLongMap!14757)

(declare-fun dynLambda!2092 (Int (_ BitVec 64)) V!40289)

(assert (=> b!1083553 (= lt!480065 (getCurrentListMapNoExtraKeys!3971 lt!480066 (array!69726 (store (arr!33530 _values!874) i!650 (ValueCellFull!12476 (dynLambda!2092 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34067 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480063 () ListLongMap!14757)

(assert (=> b!1083553 (= lt!480063 (getCurrentListMapNoExtraKeys!3971 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083553 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35579 0))(
  ( (Unit!35580) )
))
(declare-fun lt!480064 () Unit!35579)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69727 (_ BitVec 64) (_ BitVec 32)) Unit!35579)

(assert (=> b!1083553 (= lt!480064 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083554 () Bool)

(declare-fun e!619354 () Bool)

(assert (=> b!1083554 (= e!619354 tp_is_empty!26371)))

(declare-fun b!1083555 () Bool)

(declare-fun res!721902 () Bool)

(assert (=> b!1083555 (=> (not res!721902) (not e!619356))))

(assert (=> b!1083555 (= res!721902 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34068 _keys!1070))))))

(declare-fun b!1083556 () Bool)

(declare-fun res!721903 () Bool)

(assert (=> b!1083556 (=> (not res!721903) (not e!619356))))

(declare-datatypes ((List!23371 0))(
  ( (Nil!23368) (Cons!23367 (h!24585 (_ BitVec 64)) (t!32790 List!23371)) )
))
(declare-fun arrayNoDuplicates!0 (array!69727 (_ BitVec 32) List!23371) Bool)

(assert (=> b!1083556 (= res!721903 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23368))))

(declare-fun b!1083557 () Bool)

(declare-fun res!721908 () Bool)

(assert (=> b!1083557 (=> (not res!721908) (not e!619356))))

(assert (=> b!1083557 (= res!721908 (= (select (arr!33531 _keys!1070) i!650) k0!904))))

(declare-fun b!1083558 () Bool)

(assert (=> b!1083558 (= e!619353 (and e!619354 mapRes!41311))))

(declare-fun condMapEmpty!41311 () Bool)

(declare-fun mapDefault!41311 () ValueCell!12476)

(assert (=> b!1083558 (= condMapEmpty!41311 (= (arr!33530 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12476)) mapDefault!41311)))))

(declare-fun b!1083559 () Bool)

(declare-fun res!721904 () Bool)

(assert (=> b!1083559 (=> (not res!721904) (not e!619356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69727 (_ BitVec 32)) Bool)

(assert (=> b!1083559 (= res!721904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083560 () Bool)

(declare-fun res!721907 () Bool)

(assert (=> b!1083560 (=> (not res!721907) (not e!619355))))

(assert (=> b!1083560 (= res!721907 (arrayNoDuplicates!0 lt!480066 #b00000000000000000000000000000000 Nil!23368))))

(declare-fun b!1083561 () Bool)

(assert (=> b!1083561 (= e!619356 e!619355)))

(declare-fun res!721906 () Bool)

(assert (=> b!1083561 (=> (not res!721906) (not e!619355))))

(assert (=> b!1083561 (= res!721906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480066 mask!1414))))

(assert (=> b!1083561 (= lt!480066 (array!69728 (store (arr!33531 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34068 _keys!1070)))))

(assert (= (and start!95952 res!721901) b!1083552))

(assert (= (and b!1083552 res!721900) b!1083559))

(assert (= (and b!1083559 res!721904) b!1083556))

(assert (= (and b!1083556 res!721903) b!1083555))

(assert (= (and b!1083555 res!721902) b!1083550))

(assert (= (and b!1083550 res!721905) b!1083557))

(assert (= (and b!1083557 res!721908) b!1083561))

(assert (= (and b!1083561 res!721906) b!1083560))

(assert (= (and b!1083560 res!721907) b!1083553))

(assert (= (and b!1083558 condMapEmpty!41311) mapIsEmpty!41311))

(assert (= (and b!1083558 (not condMapEmpty!41311)) mapNonEmpty!41311))

(get-info :version)

(assert (= (and mapNonEmpty!41311 ((_ is ValueCellFull!12476) mapValue!41311)) b!1083551))

(assert (= (and b!1083558 ((_ is ValueCellFull!12476) mapDefault!41311)) b!1083554))

(assert (= start!95952 b!1083558))

(declare-fun b_lambda!17049 () Bool)

(assert (=> (not b_lambda!17049) (not b!1083553)))

(declare-fun t!32788 () Bool)

(declare-fun tb!7239 () Bool)

(assert (=> (and start!95952 (= defaultEntry!882 defaultEntry!882) t!32788) tb!7239))

(declare-fun result!15005 () Bool)

(assert (=> tb!7239 (= result!15005 tp_is_empty!26371)))

(assert (=> b!1083553 t!32788))

(declare-fun b_and!35425 () Bool)

(assert (= b_and!35423 (and (=> t!32788 result!15005) b_and!35425)))

(declare-fun m!1001603 () Bool)

(assert (=> b!1083557 m!1001603))

(declare-fun m!1001605 () Bool)

(assert (=> b!1083560 m!1001605))

(declare-fun m!1001607 () Bool)

(assert (=> start!95952 m!1001607))

(declare-fun m!1001609 () Bool)

(assert (=> start!95952 m!1001609))

(declare-fun m!1001611 () Bool)

(assert (=> start!95952 m!1001611))

(declare-fun m!1001613 () Bool)

(assert (=> b!1083553 m!1001613))

(declare-fun m!1001615 () Bool)

(assert (=> b!1083553 m!1001615))

(declare-fun m!1001617 () Bool)

(assert (=> b!1083553 m!1001617))

(declare-fun m!1001619 () Bool)

(assert (=> b!1083553 m!1001619))

(declare-fun m!1001621 () Bool)

(assert (=> b!1083553 m!1001621))

(declare-fun m!1001623 () Bool)

(assert (=> b!1083553 m!1001623))

(declare-fun m!1001625 () Bool)

(assert (=> b!1083550 m!1001625))

(declare-fun m!1001627 () Bool)

(assert (=> b!1083556 m!1001627))

(declare-fun m!1001629 () Bool)

(assert (=> b!1083561 m!1001629))

(declare-fun m!1001631 () Bool)

(assert (=> b!1083561 m!1001631))

(declare-fun m!1001633 () Bool)

(assert (=> b!1083559 m!1001633))

(declare-fun m!1001635 () Bool)

(assert (=> mapNonEmpty!41311 m!1001635))

(check-sat (not b_next!22369) b_and!35425 (not b!1083556) (not b!1083559) (not b_lambda!17049) (not b!1083553) tp_is_empty!26371 (not b!1083550) (not b!1083561) (not mapNonEmpty!41311) (not start!95952) (not b!1083560))
(check-sat b_and!35425 (not b_next!22369))
