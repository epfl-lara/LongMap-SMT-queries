; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96620 () Bool)

(assert start!96620)

(declare-fun b_free!22963 () Bool)

(declare-fun b_next!22963 () Bool)

(assert (=> start!96620 (= b_free!22963 (not b_next!22963))))

(declare-fun tp!80815 () Bool)

(declare-fun b_and!36599 () Bool)

(assert (=> start!96620 (= tp!80815 b_and!36599)))

(declare-fun b!1096709 () Bool)

(declare-fun res!731542 () Bool)

(declare-fun e!626215 () Bool)

(assert (=> b!1096709 (=> (not res!731542) (not e!626215))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096709 (= res!731542 (validKeyInArray!0 k0!904))))

(declare-fun b!1096710 () Bool)

(declare-fun e!626213 () Bool)

(declare-fun tp_is_empty!27013 () Bool)

(assert (=> b!1096710 (= e!626213 tp_is_empty!27013)))

(declare-fun b!1096711 () Bool)

(declare-fun res!731543 () Bool)

(assert (=> b!1096711 (=> (not res!731543) (not e!626215))))

(declare-datatypes ((array!70975 0))(
  ( (array!70976 (arr!34153 (Array (_ BitVec 32) (_ BitVec 64))) (size!34690 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70975)

(declare-datatypes ((List!23854 0))(
  ( (Nil!23851) (Cons!23850 (h!25068 (_ BitVec 64)) (t!33855 List!23854)) )
))
(declare-fun arrayNoDuplicates!0 (array!70975 (_ BitVec 32) List!23854) Bool)

(assert (=> b!1096711 (= res!731543 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23851))))

(declare-fun b!1096712 () Bool)

(declare-fun e!626214 () Bool)

(assert (=> b!1096712 (= e!626214 (not (bvsle #b00000000000000000000000000000000 (size!34690 _keys!1070))))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41145 0))(
  ( (V!41146 (val!13563 Int)) )
))
(declare-datatypes ((ValueCell!12797 0))(
  ( (ValueCellFull!12797 (v!16180 V!41145)) (EmptyCell!12797) )
))
(declare-datatypes ((array!70977 0))(
  ( (array!70978 (arr!34154 (Array (_ BitVec 32) ValueCell!12797)) (size!34691 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70977)

(declare-fun minValue!831 () V!41145)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!490329 () array!70975)

(declare-fun zeroValue!831 () V!41145)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((tuple2!17234 0))(
  ( (tuple2!17235 (_1!8628 (_ BitVec 64)) (_2!8628 V!41145)) )
))
(declare-datatypes ((List!23855 0))(
  ( (Nil!23852) (Cons!23851 (h!25069 tuple2!17234) (t!33856 List!23855)) )
))
(declare-datatypes ((ListLongMap!15211 0))(
  ( (ListLongMap!15212 (toList!7621 List!23855)) )
))
(declare-fun lt!490330 () ListLongMap!15211)

(declare-fun getCurrentListMapNoExtraKeys!4174 (array!70975 array!70977 (_ BitVec 32) (_ BitVec 32) V!41145 V!41145 (_ BitVec 32) Int) ListLongMap!15211)

(declare-fun dynLambda!2292 (Int (_ BitVec 64)) V!41145)

(assert (=> b!1096712 (= lt!490330 (getCurrentListMapNoExtraKeys!4174 lt!490329 (array!70978 (store (arr!34154 _values!874) i!650 (ValueCellFull!12797 (dynLambda!2292 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34691 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490332 () ListLongMap!15211)

(assert (=> b!1096712 (= lt!490332 (getCurrentListMapNoExtraKeys!4174 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096712 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36029 0))(
  ( (Unit!36030) )
))
(declare-fun lt!490331 () Unit!36029)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70975 (_ BitVec 64) (_ BitVec 32)) Unit!36029)

(assert (=> b!1096712 (= lt!490331 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096713 () Bool)

(declare-fun e!626216 () Bool)

(declare-fun mapRes!42280 () Bool)

(assert (=> b!1096713 (= e!626216 (and e!626213 mapRes!42280))))

(declare-fun condMapEmpty!42280 () Bool)

(declare-fun mapDefault!42280 () ValueCell!12797)

(assert (=> b!1096713 (= condMapEmpty!42280 (= (arr!34154 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12797)) mapDefault!42280)))))

(declare-fun b!1096714 () Bool)

(declare-fun res!731545 () Bool)

(assert (=> b!1096714 (=> (not res!731545) (not e!626215))))

(assert (=> b!1096714 (= res!731545 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34690 _keys!1070))))))

(declare-fun res!731540 () Bool)

(assert (=> start!96620 (=> (not res!731540) (not e!626215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96620 (= res!731540 (validMask!0 mask!1414))))

(assert (=> start!96620 e!626215))

(assert (=> start!96620 tp!80815))

(assert (=> start!96620 true))

(assert (=> start!96620 tp_is_empty!27013))

(declare-fun array_inv!26350 (array!70975) Bool)

(assert (=> start!96620 (array_inv!26350 _keys!1070)))

(declare-fun array_inv!26351 (array!70977) Bool)

(assert (=> start!96620 (and (array_inv!26351 _values!874) e!626216)))

(declare-fun b!1096715 () Bool)

(declare-fun res!731544 () Bool)

(assert (=> b!1096715 (=> (not res!731544) (not e!626215))))

(assert (=> b!1096715 (= res!731544 (and (= (size!34691 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34690 _keys!1070) (size!34691 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096716 () Bool)

(declare-fun e!626218 () Bool)

(assert (=> b!1096716 (= e!626218 tp_is_empty!27013)))

(declare-fun b!1096717 () Bool)

(assert (=> b!1096717 (= e!626215 e!626214)))

(declare-fun res!731541 () Bool)

(assert (=> b!1096717 (=> (not res!731541) (not e!626214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70975 (_ BitVec 32)) Bool)

(assert (=> b!1096717 (= res!731541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490329 mask!1414))))

(assert (=> b!1096717 (= lt!490329 (array!70976 (store (arr!34153 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34690 _keys!1070)))))

(declare-fun mapNonEmpty!42280 () Bool)

(declare-fun tp!80816 () Bool)

(assert (=> mapNonEmpty!42280 (= mapRes!42280 (and tp!80816 e!626218))))

(declare-fun mapValue!42280 () ValueCell!12797)

(declare-fun mapRest!42280 () (Array (_ BitVec 32) ValueCell!12797))

(declare-fun mapKey!42280 () (_ BitVec 32))

(assert (=> mapNonEmpty!42280 (= (arr!34154 _values!874) (store mapRest!42280 mapKey!42280 mapValue!42280))))

(declare-fun b!1096718 () Bool)

(declare-fun res!731546 () Bool)

(assert (=> b!1096718 (=> (not res!731546) (not e!626214))))

(assert (=> b!1096718 (= res!731546 (arrayNoDuplicates!0 lt!490329 #b00000000000000000000000000000000 Nil!23851))))

(declare-fun b!1096719 () Bool)

(declare-fun res!731547 () Bool)

(assert (=> b!1096719 (=> (not res!731547) (not e!626215))))

(assert (=> b!1096719 (= res!731547 (= (select (arr!34153 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42280 () Bool)

(assert (=> mapIsEmpty!42280 mapRes!42280))

(declare-fun b!1096720 () Bool)

(declare-fun res!731548 () Bool)

(assert (=> b!1096720 (=> (not res!731548) (not e!626215))))

(assert (=> b!1096720 (= res!731548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96620 res!731540) b!1096715))

(assert (= (and b!1096715 res!731544) b!1096720))

(assert (= (and b!1096720 res!731548) b!1096711))

(assert (= (and b!1096711 res!731543) b!1096714))

(assert (= (and b!1096714 res!731545) b!1096709))

(assert (= (and b!1096709 res!731542) b!1096719))

(assert (= (and b!1096719 res!731547) b!1096717))

(assert (= (and b!1096717 res!731541) b!1096718))

(assert (= (and b!1096718 res!731546) b!1096712))

(assert (= (and b!1096713 condMapEmpty!42280) mapIsEmpty!42280))

(assert (= (and b!1096713 (not condMapEmpty!42280)) mapNonEmpty!42280))

(get-info :version)

(assert (= (and mapNonEmpty!42280 ((_ is ValueCellFull!12797) mapValue!42280)) b!1096716))

(assert (= (and b!1096713 ((_ is ValueCellFull!12797) mapDefault!42280)) b!1096710))

(assert (= start!96620 b!1096713))

(declare-fun b_lambda!17631 () Bool)

(assert (=> (not b_lambda!17631) (not b!1096712)))

(declare-fun t!33854 () Bool)

(declare-fun tb!7821 () Bool)

(assert (=> (and start!96620 (= defaultEntry!882 defaultEntry!882) t!33854) tb!7821))

(declare-fun result!16173 () Bool)

(assert (=> tb!7821 (= result!16173 tp_is_empty!27013)))

(assert (=> b!1096712 t!33854))

(declare-fun b_and!36601 () Bool)

(assert (= b_and!36599 (and (=> t!33854 result!16173) b_and!36601)))

(declare-fun m!1016697 () Bool)

(assert (=> b!1096718 m!1016697))

(declare-fun m!1016699 () Bool)

(assert (=> b!1096719 m!1016699))

(declare-fun m!1016701 () Bool)

(assert (=> b!1096709 m!1016701))

(declare-fun m!1016703 () Bool)

(assert (=> b!1096711 m!1016703))

(declare-fun m!1016705 () Bool)

(assert (=> b!1096717 m!1016705))

(declare-fun m!1016707 () Bool)

(assert (=> b!1096717 m!1016707))

(declare-fun m!1016709 () Bool)

(assert (=> mapNonEmpty!42280 m!1016709))

(declare-fun m!1016711 () Bool)

(assert (=> b!1096712 m!1016711))

(declare-fun m!1016713 () Bool)

(assert (=> b!1096712 m!1016713))

(declare-fun m!1016715 () Bool)

(assert (=> b!1096712 m!1016715))

(declare-fun m!1016717 () Bool)

(assert (=> b!1096712 m!1016717))

(declare-fun m!1016719 () Bool)

(assert (=> b!1096712 m!1016719))

(declare-fun m!1016721 () Bool)

(assert (=> b!1096712 m!1016721))

(declare-fun m!1016723 () Bool)

(assert (=> start!96620 m!1016723))

(declare-fun m!1016725 () Bool)

(assert (=> start!96620 m!1016725))

(declare-fun m!1016727 () Bool)

(assert (=> start!96620 m!1016727))

(declare-fun m!1016729 () Bool)

(assert (=> b!1096720 m!1016729))

(check-sat (not mapNonEmpty!42280) (not start!96620) (not b!1096720) tp_is_empty!27013 (not b!1096717) b_and!36601 (not b!1096712) (not b_next!22963) (not b!1096718) (not b!1096709) (not b!1096711) (not b_lambda!17631))
(check-sat b_and!36601 (not b_next!22963))
