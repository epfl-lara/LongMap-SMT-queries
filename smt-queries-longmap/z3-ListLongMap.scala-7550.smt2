; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95856 () Bool)

(assert start!95856)

(declare-fun b_free!22273 () Bool)

(declare-fun b_next!22273 () Bool)

(assert (=> start!95856 (= b_free!22273 (not b_next!22273))))

(declare-fun tp!78667 () Bool)

(declare-fun b_and!35261 () Bool)

(assert (=> start!95856 (= tp!78667 b_and!35261)))

(declare-fun b!1081756 () Bool)

(declare-fun res!720605 () Bool)

(declare-fun e!618494 () Bool)

(assert (=> b!1081756 (=> (not res!720605) (not e!618494))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69537 0))(
  ( (array!69538 (arr!33436 (Array (_ BitVec 32) (_ BitVec 64))) (size!33973 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69537)

(declare-datatypes ((V!40161 0))(
  ( (V!40162 (val!13194 Int)) )
))
(declare-datatypes ((ValueCell!12428 0))(
  ( (ValueCellFull!12428 (v!15811 V!40161)) (EmptyCell!12428) )
))
(declare-datatypes ((array!69539 0))(
  ( (array!69540 (arr!33437 (Array (_ BitVec 32) ValueCell!12428)) (size!33974 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69539)

(assert (=> b!1081756 (= res!720605 (and (= (size!33974 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33973 _keys!1070) (size!33974 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41167 () Bool)

(declare-fun mapRes!41167 () Bool)

(assert (=> mapIsEmpty!41167 mapRes!41167))

(declare-fun b!1081757 () Bool)

(declare-fun e!618491 () Bool)

(declare-fun e!618490 () Bool)

(assert (=> b!1081757 (= e!618491 (and e!618490 mapRes!41167))))

(declare-fun condMapEmpty!41167 () Bool)

(declare-fun mapDefault!41167 () ValueCell!12428)

(assert (=> b!1081757 (= condMapEmpty!41167 (= (arr!33437 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12428)) mapDefault!41167)))))

(declare-fun b!1081758 () Bool)

(declare-fun res!720612 () Bool)

(assert (=> b!1081758 (=> (not res!720612) (not e!618494))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081758 (= res!720612 (= (select (arr!33436 _keys!1070) i!650) k0!904))))

(declare-fun b!1081759 () Bool)

(declare-fun res!720610 () Bool)

(assert (=> b!1081759 (=> (not res!720610) (not e!618494))))

(assert (=> b!1081759 (= res!720610 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33973 _keys!1070))))))

(declare-fun b!1081760 () Bool)

(declare-fun res!720607 () Bool)

(assert (=> b!1081760 (=> (not res!720607) (not e!618494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081760 (= res!720607 (validKeyInArray!0 k0!904))))

(declare-fun b!1081761 () Bool)

(declare-fun res!720611 () Bool)

(assert (=> b!1081761 (=> (not res!720611) (not e!618494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69537 (_ BitVec 32)) Bool)

(assert (=> b!1081761 (= res!720611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081762 () Bool)

(declare-fun e!618492 () Bool)

(assert (=> b!1081762 (= e!618492 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40161)

(declare-datatypes ((tuple2!16704 0))(
  ( (tuple2!16705 (_1!8363 (_ BitVec 64)) (_2!8363 V!40161)) )
))
(declare-datatypes ((List!23296 0))(
  ( (Nil!23293) (Cons!23292 (h!24510 tuple2!16704) (t!32647 List!23296)) )
))
(declare-datatypes ((ListLongMap!14681 0))(
  ( (ListLongMap!14682 (toList!7356 List!23296)) )
))
(declare-fun lt!479532 () ListLongMap!14681)

(declare-fun zeroValue!831 () V!40161)

(declare-fun getCurrentListMapNoExtraKeys!3933 (array!69537 array!69539 (_ BitVec 32) (_ BitVec 32) V!40161 V!40161 (_ BitVec 32) Int) ListLongMap!14681)

(assert (=> b!1081762 (= lt!479532 (getCurrentListMapNoExtraKeys!3933 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081762 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35503 0))(
  ( (Unit!35504) )
))
(declare-fun lt!479530 () Unit!35503)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69537 (_ BitVec 64) (_ BitVec 32)) Unit!35503)

(assert (=> b!1081762 (= lt!479530 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!720604 () Bool)

(assert (=> start!95856 (=> (not res!720604) (not e!618494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95856 (= res!720604 (validMask!0 mask!1414))))

(assert (=> start!95856 e!618494))

(assert (=> start!95856 tp!78667))

(assert (=> start!95856 true))

(declare-fun tp_is_empty!26275 () Bool)

(assert (=> start!95856 tp_is_empty!26275))

(declare-fun array_inv!25856 (array!69537) Bool)

(assert (=> start!95856 (array_inv!25856 _keys!1070)))

(declare-fun array_inv!25857 (array!69539) Bool)

(assert (=> start!95856 (and (array_inv!25857 _values!874) e!618491)))

(declare-fun b!1081763 () Bool)

(declare-fun res!720606 () Bool)

(assert (=> b!1081763 (=> (not res!720606) (not e!618494))))

(declare-datatypes ((List!23297 0))(
  ( (Nil!23294) (Cons!23293 (h!24511 (_ BitVec 64)) (t!32648 List!23297)) )
))
(declare-fun arrayNoDuplicates!0 (array!69537 (_ BitVec 32) List!23297) Bool)

(assert (=> b!1081763 (= res!720606 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23294))))

(declare-fun b!1081764 () Bool)

(declare-fun e!618493 () Bool)

(assert (=> b!1081764 (= e!618493 tp_is_empty!26275)))

(declare-fun mapNonEmpty!41167 () Bool)

(declare-fun tp!78668 () Bool)

(assert (=> mapNonEmpty!41167 (= mapRes!41167 (and tp!78668 e!618493))))

(declare-fun mapRest!41167 () (Array (_ BitVec 32) ValueCell!12428))

(declare-fun mapKey!41167 () (_ BitVec 32))

(declare-fun mapValue!41167 () ValueCell!12428)

(assert (=> mapNonEmpty!41167 (= (arr!33437 _values!874) (store mapRest!41167 mapKey!41167 mapValue!41167))))

(declare-fun b!1081765 () Bool)

(assert (=> b!1081765 (= e!618490 tp_is_empty!26275)))

(declare-fun b!1081766 () Bool)

(assert (=> b!1081766 (= e!618494 e!618492)))

(declare-fun res!720609 () Bool)

(assert (=> b!1081766 (=> (not res!720609) (not e!618492))))

(declare-fun lt!479531 () array!69537)

(assert (=> b!1081766 (= res!720609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479531 mask!1414))))

(assert (=> b!1081766 (= lt!479531 (array!69538 (store (arr!33436 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33973 _keys!1070)))))

(declare-fun b!1081767 () Bool)

(declare-fun res!720608 () Bool)

(assert (=> b!1081767 (=> (not res!720608) (not e!618492))))

(assert (=> b!1081767 (= res!720608 (arrayNoDuplicates!0 lt!479531 #b00000000000000000000000000000000 Nil!23294))))

(assert (= (and start!95856 res!720604) b!1081756))

(assert (= (and b!1081756 res!720605) b!1081761))

(assert (= (and b!1081761 res!720611) b!1081763))

(assert (= (and b!1081763 res!720606) b!1081759))

(assert (= (and b!1081759 res!720610) b!1081760))

(assert (= (and b!1081760 res!720607) b!1081758))

(assert (= (and b!1081758 res!720612) b!1081766))

(assert (= (and b!1081766 res!720609) b!1081767))

(assert (= (and b!1081767 res!720608) b!1081762))

(assert (= (and b!1081757 condMapEmpty!41167) mapIsEmpty!41167))

(assert (= (and b!1081757 (not condMapEmpty!41167)) mapNonEmpty!41167))

(get-info :version)

(assert (= (and mapNonEmpty!41167 ((_ is ValueCellFull!12428) mapValue!41167)) b!1081764))

(assert (= (and b!1081757 ((_ is ValueCellFull!12428) mapDefault!41167)) b!1081765))

(assert (= start!95856 b!1081757))

(declare-fun m!1000061 () Bool)

(assert (=> b!1081758 m!1000061))

(declare-fun m!1000063 () Bool)

(assert (=> mapNonEmpty!41167 m!1000063))

(declare-fun m!1000065 () Bool)

(assert (=> b!1081767 m!1000065))

(declare-fun m!1000067 () Bool)

(assert (=> b!1081762 m!1000067))

(declare-fun m!1000069 () Bool)

(assert (=> b!1081762 m!1000069))

(declare-fun m!1000071 () Bool)

(assert (=> b!1081762 m!1000071))

(declare-fun m!1000073 () Bool)

(assert (=> b!1081761 m!1000073))

(declare-fun m!1000075 () Bool)

(assert (=> b!1081760 m!1000075))

(declare-fun m!1000077 () Bool)

(assert (=> b!1081766 m!1000077))

(declare-fun m!1000079 () Bool)

(assert (=> b!1081766 m!1000079))

(declare-fun m!1000081 () Bool)

(assert (=> b!1081763 m!1000081))

(declare-fun m!1000083 () Bool)

(assert (=> start!95856 m!1000083))

(declare-fun m!1000085 () Bool)

(assert (=> start!95856 m!1000085))

(declare-fun m!1000087 () Bool)

(assert (=> start!95856 m!1000087))

(check-sat (not b!1081766) b_and!35261 (not b!1081763) (not b!1081762) (not b_next!22273) (not b!1081767) (not b!1081760) (not start!95856) (not mapNonEmpty!41167) (not b!1081761) tp_is_empty!26275)
(check-sat b_and!35261 (not b_next!22273))
