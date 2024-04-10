; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20672 () Bool)

(assert start!20672)

(declare-fun b_free!5331 () Bool)

(declare-fun b_next!5331 () Bool)

(assert (=> start!20672 (= b_free!5331 (not b_next!5331))))

(declare-fun tp!19025 () Bool)

(declare-fun b_and!12077 () Bool)

(assert (=> start!20672 (= tp!19025 b_and!12077)))

(declare-fun b!206576 () Bool)

(declare-fun res!100106 () Bool)

(declare-fun e!134998 () Bool)

(assert (=> b!206576 (=> (not res!100106) (not e!134998))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206576 (= res!100106 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8849 () Bool)

(declare-fun mapRes!8849 () Bool)

(assert (=> mapIsEmpty!8849 mapRes!8849))

(declare-fun b!206577 () Bool)

(declare-fun e!134999 () Bool)

(declare-fun tp_is_empty!5187 () Bool)

(assert (=> b!206577 (= e!134999 tp_is_empty!5187)))

(declare-fun b!206578 () Bool)

(declare-fun e!134995 () Bool)

(declare-fun e!134996 () Bool)

(assert (=> b!206578 (= e!134995 (and e!134996 mapRes!8849))))

(declare-fun condMapEmpty!8849 () Bool)

(declare-datatypes ((V!6563 0))(
  ( (V!6564 (val!2638 Int)) )
))
(declare-datatypes ((ValueCell!2250 0))(
  ( (ValueCellFull!2250 (v!4608 V!6563)) (EmptyCell!2250) )
))
(declare-datatypes ((array!9585 0))(
  ( (array!9586 (arr!4543 (Array (_ BitVec 32) ValueCell!2250)) (size!4868 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9585)

(declare-fun mapDefault!8849 () ValueCell!2250)

(assert (=> b!206578 (= condMapEmpty!8849 (= (arr!4543 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2250)) mapDefault!8849)))))

(declare-fun res!100103 () Bool)

(assert (=> start!20672 (=> (not res!100103) (not e!134998))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20672 (= res!100103 (validMask!0 mask!1149))))

(assert (=> start!20672 e!134998))

(declare-fun array_inv!3005 (array!9585) Bool)

(assert (=> start!20672 (and (array_inv!3005 _values!649) e!134995)))

(assert (=> start!20672 true))

(assert (=> start!20672 tp_is_empty!5187))

(declare-datatypes ((array!9587 0))(
  ( (array!9588 (arr!4544 (Array (_ BitVec 32) (_ BitVec 64))) (size!4869 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9587)

(declare-fun array_inv!3006 (array!9587) Bool)

(assert (=> start!20672 (array_inv!3006 _keys!825)))

(assert (=> start!20672 tp!19025))

(declare-fun b!206579 () Bool)

(declare-fun res!100105 () Bool)

(assert (=> b!206579 (=> (not res!100105) (not e!134998))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206579 (= res!100105 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4869 _keys!825))))))

(declare-fun b!206580 () Bool)

(assert (=> b!206580 (= e!134998 (not true))))

(declare-datatypes ((tuple2!4006 0))(
  ( (tuple2!4007 (_1!2014 (_ BitVec 64)) (_2!2014 V!6563)) )
))
(declare-datatypes ((List!2898 0))(
  ( (Nil!2895) (Cons!2894 (h!3536 tuple2!4006) (t!7829 List!2898)) )
))
(declare-datatypes ((ListLongMap!2919 0))(
  ( (ListLongMap!2920 (toList!1475 List!2898)) )
))
(declare-fun lt!105666 () ListLongMap!2919)

(declare-fun zeroValue!615 () V!6563)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6563)

(declare-fun getCurrentListMap!1042 (array!9587 array!9585 (_ BitVec 32) (_ BitVec 32) V!6563 V!6563 (_ BitVec 32) Int) ListLongMap!2919)

(assert (=> b!206580 (= lt!105666 (getCurrentListMap!1042 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105672 () ListLongMap!2919)

(declare-fun lt!105669 () array!9585)

(assert (=> b!206580 (= lt!105672 (getCurrentListMap!1042 _keys!825 lt!105669 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105670 () ListLongMap!2919)

(declare-fun lt!105668 () ListLongMap!2919)

(assert (=> b!206580 (and (= lt!105670 lt!105668) (= lt!105668 lt!105670))))

(declare-fun lt!105667 () ListLongMap!2919)

(declare-fun v!520 () V!6563)

(declare-fun +!502 (ListLongMap!2919 tuple2!4006) ListLongMap!2919)

(assert (=> b!206580 (= lt!105668 (+!502 lt!105667 (tuple2!4007 k0!843 v!520)))))

(declare-datatypes ((Unit!6292 0))(
  ( (Unit!6293) )
))
(declare-fun lt!105671 () Unit!6292)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!155 (array!9587 array!9585 (_ BitVec 32) (_ BitVec 32) V!6563 V!6563 (_ BitVec 32) (_ BitVec 64) V!6563 (_ BitVec 32) Int) Unit!6292)

(assert (=> b!206580 (= lt!105671 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!155 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!416 (array!9587 array!9585 (_ BitVec 32) (_ BitVec 32) V!6563 V!6563 (_ BitVec 32) Int) ListLongMap!2919)

(assert (=> b!206580 (= lt!105670 (getCurrentListMapNoExtraKeys!416 _keys!825 lt!105669 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206580 (= lt!105669 (array!9586 (store (arr!4543 _values!649) i!601 (ValueCellFull!2250 v!520)) (size!4868 _values!649)))))

(assert (=> b!206580 (= lt!105667 (getCurrentListMapNoExtraKeys!416 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8849 () Bool)

(declare-fun tp!19024 () Bool)

(assert (=> mapNonEmpty!8849 (= mapRes!8849 (and tp!19024 e!134999))))

(declare-fun mapValue!8849 () ValueCell!2250)

(declare-fun mapKey!8849 () (_ BitVec 32))

(declare-fun mapRest!8849 () (Array (_ BitVec 32) ValueCell!2250))

(assert (=> mapNonEmpty!8849 (= (arr!4543 _values!649) (store mapRest!8849 mapKey!8849 mapValue!8849))))

(declare-fun b!206581 () Bool)

(declare-fun res!100104 () Bool)

(assert (=> b!206581 (=> (not res!100104) (not e!134998))))

(assert (=> b!206581 (= res!100104 (and (= (size!4868 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4869 _keys!825) (size!4868 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206582 () Bool)

(assert (=> b!206582 (= e!134996 tp_is_empty!5187)))

(declare-fun b!206583 () Bool)

(declare-fun res!100102 () Bool)

(assert (=> b!206583 (=> (not res!100102) (not e!134998))))

(declare-datatypes ((List!2899 0))(
  ( (Nil!2896) (Cons!2895 (h!3537 (_ BitVec 64)) (t!7830 List!2899)) )
))
(declare-fun arrayNoDuplicates!0 (array!9587 (_ BitVec 32) List!2899) Bool)

(assert (=> b!206583 (= res!100102 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2896))))

(declare-fun b!206584 () Bool)

(declare-fun res!100107 () Bool)

(assert (=> b!206584 (=> (not res!100107) (not e!134998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9587 (_ BitVec 32)) Bool)

(assert (=> b!206584 (= res!100107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206585 () Bool)

(declare-fun res!100108 () Bool)

(assert (=> b!206585 (=> (not res!100108) (not e!134998))))

(assert (=> b!206585 (= res!100108 (= (select (arr!4544 _keys!825) i!601) k0!843))))

(assert (= (and start!20672 res!100103) b!206581))

(assert (= (and b!206581 res!100104) b!206584))

(assert (= (and b!206584 res!100107) b!206583))

(assert (= (and b!206583 res!100102) b!206579))

(assert (= (and b!206579 res!100105) b!206576))

(assert (= (and b!206576 res!100106) b!206585))

(assert (= (and b!206585 res!100108) b!206580))

(assert (= (and b!206578 condMapEmpty!8849) mapIsEmpty!8849))

(assert (= (and b!206578 (not condMapEmpty!8849)) mapNonEmpty!8849))

(get-info :version)

(assert (= (and mapNonEmpty!8849 ((_ is ValueCellFull!2250) mapValue!8849)) b!206577))

(assert (= (and b!206578 ((_ is ValueCellFull!2250) mapDefault!8849)) b!206582))

(assert (= start!20672 b!206578))

(declare-fun m!234319 () Bool)

(assert (=> b!206585 m!234319))

(declare-fun m!234321 () Bool)

(assert (=> b!206584 m!234321))

(declare-fun m!234323 () Bool)

(assert (=> mapNonEmpty!8849 m!234323))

(declare-fun m!234325 () Bool)

(assert (=> b!206576 m!234325))

(declare-fun m!234327 () Bool)

(assert (=> start!20672 m!234327))

(declare-fun m!234329 () Bool)

(assert (=> start!20672 m!234329))

(declare-fun m!234331 () Bool)

(assert (=> start!20672 m!234331))

(declare-fun m!234333 () Bool)

(assert (=> b!206580 m!234333))

(declare-fun m!234335 () Bool)

(assert (=> b!206580 m!234335))

(declare-fun m!234337 () Bool)

(assert (=> b!206580 m!234337))

(declare-fun m!234339 () Bool)

(assert (=> b!206580 m!234339))

(declare-fun m!234341 () Bool)

(assert (=> b!206580 m!234341))

(declare-fun m!234343 () Bool)

(assert (=> b!206580 m!234343))

(declare-fun m!234345 () Bool)

(assert (=> b!206580 m!234345))

(declare-fun m!234347 () Bool)

(assert (=> b!206583 m!234347))

(check-sat b_and!12077 (not b!206576) (not b_next!5331) (not b!206583) (not mapNonEmpty!8849) (not b!206580) tp_is_empty!5187 (not b!206584) (not start!20672))
(check-sat b_and!12077 (not b_next!5331))
