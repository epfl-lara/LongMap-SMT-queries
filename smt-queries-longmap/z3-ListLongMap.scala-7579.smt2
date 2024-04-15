; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95788 () Bool)

(assert start!95788)

(declare-fun b_free!22447 () Bool)

(declare-fun b_next!22447 () Bool)

(assert (=> start!95788 (= b_free!22447 (not b_next!22447))))

(declare-fun tp!79190 () Bool)

(declare-fun b_and!35543 () Bool)

(assert (=> start!95788 (= tp!79190 b_and!35543)))

(declare-fun b!1083552 () Bool)

(declare-fun e!619112 () Bool)

(declare-fun tp_is_empty!26449 () Bool)

(assert (=> b!1083552 (= e!619112 tp_is_empty!26449)))

(declare-fun b!1083553 () Bool)

(declare-fun res!722368 () Bool)

(declare-fun e!619108 () Bool)

(assert (=> b!1083553 (=> (not res!722368) (not e!619108))))

(declare-datatypes ((array!69766 0))(
  ( (array!69767 (arr!33557 (Array (_ BitVec 32) (_ BitVec 64))) (size!34095 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69766)

(declare-datatypes ((List!23459 0))(
  ( (Nil!23456) (Cons!23455 (h!24664 (_ BitVec 64)) (t!32955 List!23459)) )
))
(declare-fun arrayNoDuplicates!0 (array!69766 (_ BitVec 32) List!23459) Bool)

(assert (=> b!1083553 (= res!722368 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23456))))

(declare-fun b!1083554 () Bool)

(declare-fun res!722363 () Bool)

(declare-fun e!619109 () Bool)

(assert (=> b!1083554 (=> (not res!722363) (not e!619109))))

(declare-fun lt!480026 () array!69766)

(assert (=> b!1083554 (= res!722363 (arrayNoDuplicates!0 lt!480026 #b00000000000000000000000000000000 Nil!23456))))

(declare-fun b!1083555 () Bool)

(declare-fun res!722369 () Bool)

(assert (=> b!1083555 (=> (not res!722369) (not e!619108))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083555 (= res!722369 (validKeyInArray!0 k0!904))))

(declare-fun b!1083556 () Bool)

(declare-fun res!722365 () Bool)

(assert (=> b!1083556 (=> (not res!722365) (not e!619108))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69766 (_ BitVec 32)) Bool)

(assert (=> b!1083556 (= res!722365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083557 () Bool)

(declare-fun e!619107 () Bool)

(assert (=> b!1083557 (= e!619107 tp_is_empty!26449)))

(declare-fun res!722367 () Bool)

(assert (=> start!95788 (=> (not res!722367) (not e!619108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95788 (= res!722367 (validMask!0 mask!1414))))

(assert (=> start!95788 e!619108))

(assert (=> start!95788 tp!79190))

(assert (=> start!95788 true))

(assert (=> start!95788 tp_is_empty!26449))

(declare-fun array_inv!25940 (array!69766) Bool)

(assert (=> start!95788 (array_inv!25940 _keys!1070)))

(declare-datatypes ((V!40393 0))(
  ( (V!40394 (val!13281 Int)) )
))
(declare-datatypes ((ValueCell!12515 0))(
  ( (ValueCellFull!12515 (v!15901 V!40393)) (EmptyCell!12515) )
))
(declare-datatypes ((array!69768 0))(
  ( (array!69769 (arr!33558 (Array (_ BitVec 32) ValueCell!12515)) (size!34096 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69768)

(declare-fun e!619110 () Bool)

(declare-fun array_inv!25941 (array!69768) Bool)

(assert (=> start!95788 (and (array_inv!25941 _values!874) e!619110)))

(declare-fun b!1083558 () Bool)

(assert (=> b!1083558 (= e!619109 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40393)

(declare-datatypes ((tuple2!16890 0))(
  ( (tuple2!16891 (_1!8456 (_ BitVec 64)) (_2!8456 V!40393)) )
))
(declare-datatypes ((List!23460 0))(
  ( (Nil!23457) (Cons!23456 (h!24665 tuple2!16890) (t!32956 List!23460)) )
))
(declare-datatypes ((ListLongMap!14859 0))(
  ( (ListLongMap!14860 (toList!7445 List!23460)) )
))
(declare-fun lt!480028 () ListLongMap!14859)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!480022 () array!69768)

(declare-fun zeroValue!831 () V!40393)

(declare-fun getCurrentListMap!4138 (array!69766 array!69768 (_ BitVec 32) (_ BitVec 32) V!40393 V!40393 (_ BitVec 32) Int) ListLongMap!14859)

(assert (=> b!1083558 (= lt!480028 (getCurrentListMap!4138 lt!480026 lt!480022 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480025 () ListLongMap!14859)

(declare-fun lt!480027 () ListLongMap!14859)

(assert (=> b!1083558 (and (= lt!480025 lt!480027) (= lt!480027 lt!480025))))

(declare-fun lt!480024 () ListLongMap!14859)

(declare-fun -!724 (ListLongMap!14859 (_ BitVec 64)) ListLongMap!14859)

(assert (=> b!1083558 (= lt!480027 (-!724 lt!480024 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35483 0))(
  ( (Unit!35484) )
))
(declare-fun lt!480023 () Unit!35483)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!22 (array!69766 array!69768 (_ BitVec 32) (_ BitVec 32) V!40393 V!40393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35483)

(assert (=> b!1083558 (= lt!480023 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!22 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4008 (array!69766 array!69768 (_ BitVec 32) (_ BitVec 32) V!40393 V!40393 (_ BitVec 32) Int) ListLongMap!14859)

(assert (=> b!1083558 (= lt!480025 (getCurrentListMapNoExtraKeys!4008 lt!480026 lt!480022 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2079 (Int (_ BitVec 64)) V!40393)

(assert (=> b!1083558 (= lt!480022 (array!69769 (store (arr!33558 _values!874) i!650 (ValueCellFull!12515 (dynLambda!2079 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34096 _values!874)))))

(assert (=> b!1083558 (= lt!480024 (getCurrentListMapNoExtraKeys!4008 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083558 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480029 () Unit!35483)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69766 (_ BitVec 64) (_ BitVec 32)) Unit!35483)

(assert (=> b!1083558 (= lt!480029 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1083559 () Bool)

(declare-fun res!722364 () Bool)

(assert (=> b!1083559 (=> (not res!722364) (not e!619108))))

(assert (=> b!1083559 (= res!722364 (= (select (arr!33557 _keys!1070) i!650) k0!904))))

(declare-fun b!1083560 () Bool)

(declare-fun res!722370 () Bool)

(assert (=> b!1083560 (=> (not res!722370) (not e!619108))))

(assert (=> b!1083560 (= res!722370 (and (= (size!34096 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34095 _keys!1070) (size!34096 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083561 () Bool)

(assert (=> b!1083561 (= e!619108 e!619109)))

(declare-fun res!722362 () Bool)

(assert (=> b!1083561 (=> (not res!722362) (not e!619109))))

(assert (=> b!1083561 (= res!722362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480026 mask!1414))))

(assert (=> b!1083561 (= lt!480026 (array!69767 (store (arr!33557 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34095 _keys!1070)))))

(declare-fun mapIsEmpty!41428 () Bool)

(declare-fun mapRes!41428 () Bool)

(assert (=> mapIsEmpty!41428 mapRes!41428))

(declare-fun mapNonEmpty!41428 () Bool)

(declare-fun tp!79189 () Bool)

(assert (=> mapNonEmpty!41428 (= mapRes!41428 (and tp!79189 e!619107))))

(declare-fun mapRest!41428 () (Array (_ BitVec 32) ValueCell!12515))

(declare-fun mapKey!41428 () (_ BitVec 32))

(declare-fun mapValue!41428 () ValueCell!12515)

(assert (=> mapNonEmpty!41428 (= (arr!33558 _values!874) (store mapRest!41428 mapKey!41428 mapValue!41428))))

(declare-fun b!1083562 () Bool)

(declare-fun res!722366 () Bool)

(assert (=> b!1083562 (=> (not res!722366) (not e!619108))))

(assert (=> b!1083562 (= res!722366 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34095 _keys!1070))))))

(declare-fun b!1083563 () Bool)

(assert (=> b!1083563 (= e!619110 (and e!619112 mapRes!41428))))

(declare-fun condMapEmpty!41428 () Bool)

(declare-fun mapDefault!41428 () ValueCell!12515)

(assert (=> b!1083563 (= condMapEmpty!41428 (= (arr!33558 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12515)) mapDefault!41428)))))

(assert (= (and start!95788 res!722367) b!1083560))

(assert (= (and b!1083560 res!722370) b!1083556))

(assert (= (and b!1083556 res!722365) b!1083553))

(assert (= (and b!1083553 res!722368) b!1083562))

(assert (= (and b!1083562 res!722366) b!1083555))

(assert (= (and b!1083555 res!722369) b!1083559))

(assert (= (and b!1083559 res!722364) b!1083561))

(assert (= (and b!1083561 res!722362) b!1083554))

(assert (= (and b!1083554 res!722363) b!1083558))

(assert (= (and b!1083563 condMapEmpty!41428) mapIsEmpty!41428))

(assert (= (and b!1083563 (not condMapEmpty!41428)) mapNonEmpty!41428))

(get-info :version)

(assert (= (and mapNonEmpty!41428 ((_ is ValueCellFull!12515) mapValue!41428)) b!1083557))

(assert (= (and b!1083563 ((_ is ValueCellFull!12515) mapDefault!41428)) b!1083552))

(assert (= start!95788 b!1083563))

(declare-fun b_lambda!17095 () Bool)

(assert (=> (not b_lambda!17095) (not b!1083558)))

(declare-fun t!32954 () Bool)

(declare-fun tb!7317 () Bool)

(assert (=> (and start!95788 (= defaultEntry!882 defaultEntry!882) t!32954) tb!7317))

(declare-fun result!15161 () Bool)

(assert (=> tb!7317 (= result!15161 tp_is_empty!26449)))

(assert (=> b!1083558 t!32954))

(declare-fun b_and!35545 () Bool)

(assert (= b_and!35543 (and (=> t!32954 result!15161) b_and!35545)))

(declare-fun m!1000757 () Bool)

(assert (=> b!1083556 m!1000757))

(declare-fun m!1000759 () Bool)

(assert (=> b!1083554 m!1000759))

(declare-fun m!1000761 () Bool)

(assert (=> b!1083555 m!1000761))

(declare-fun m!1000763 () Bool)

(assert (=> start!95788 m!1000763))

(declare-fun m!1000765 () Bool)

(assert (=> start!95788 m!1000765))

(declare-fun m!1000767 () Bool)

(assert (=> start!95788 m!1000767))

(declare-fun m!1000769 () Bool)

(assert (=> mapNonEmpty!41428 m!1000769))

(declare-fun m!1000771 () Bool)

(assert (=> b!1083559 m!1000771))

(declare-fun m!1000773 () Bool)

(assert (=> b!1083553 m!1000773))

(declare-fun m!1000775 () Bool)

(assert (=> b!1083561 m!1000775))

(declare-fun m!1000777 () Bool)

(assert (=> b!1083561 m!1000777))

(declare-fun m!1000779 () Bool)

(assert (=> b!1083558 m!1000779))

(declare-fun m!1000781 () Bool)

(assert (=> b!1083558 m!1000781))

(declare-fun m!1000783 () Bool)

(assert (=> b!1083558 m!1000783))

(declare-fun m!1000785 () Bool)

(assert (=> b!1083558 m!1000785))

(declare-fun m!1000787 () Bool)

(assert (=> b!1083558 m!1000787))

(declare-fun m!1000789 () Bool)

(assert (=> b!1083558 m!1000789))

(declare-fun m!1000791 () Bool)

(assert (=> b!1083558 m!1000791))

(declare-fun m!1000793 () Bool)

(assert (=> b!1083558 m!1000793))

(declare-fun m!1000795 () Bool)

(assert (=> b!1083558 m!1000795))

(check-sat (not b!1083556) (not b_lambda!17095) tp_is_empty!26449 (not b!1083558) (not mapNonEmpty!41428) (not b_next!22447) b_and!35545 (not b!1083553) (not b!1083561) (not start!95788) (not b!1083554) (not b!1083555))
(check-sat b_and!35545 (not b_next!22447))
