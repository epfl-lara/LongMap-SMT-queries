; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20594 () Bool)

(assert start!20594)

(declare-fun b_free!5253 () Bool)

(declare-fun b_next!5253 () Bool)

(assert (=> start!20594 (= b_free!5253 (not b_next!5253))))

(declare-fun tp!18790 () Bool)

(declare-fun b_and!11999 () Bool)

(assert (=> start!20594 (= tp!18790 b_and!11999)))

(declare-fun b!205200 () Bool)

(declare-fun e!134209 () Bool)

(declare-fun tp_is_empty!5109 () Bool)

(assert (=> b!205200 (= e!134209 tp_is_empty!5109)))

(declare-fun b!205201 () Bool)

(declare-fun res!99077 () Bool)

(declare-fun e!134207 () Bool)

(assert (=> b!205201 (=> (not res!99077) (not e!134207))))

(declare-datatypes ((array!9431 0))(
  ( (array!9432 (arr!4466 (Array (_ BitVec 32) (_ BitVec 64))) (size!4791 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9431)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9431 (_ BitVec 32)) Bool)

(assert (=> b!205201 (= res!99077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205202 () Bool)

(declare-fun e!134210 () Bool)

(declare-fun e!134208 () Bool)

(declare-fun mapRes!8732 () Bool)

(assert (=> b!205202 (= e!134210 (and e!134208 mapRes!8732))))

(declare-fun condMapEmpty!8732 () Bool)

(declare-datatypes ((V!6459 0))(
  ( (V!6460 (val!2599 Int)) )
))
(declare-datatypes ((ValueCell!2211 0))(
  ( (ValueCellFull!2211 (v!4569 V!6459)) (EmptyCell!2211) )
))
(declare-datatypes ((array!9433 0))(
  ( (array!9434 (arr!4467 (Array (_ BitVec 32) ValueCell!2211)) (size!4792 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9433)

(declare-fun mapDefault!8732 () ValueCell!2211)

(assert (=> b!205202 (= condMapEmpty!8732 (= (arr!4467 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2211)) mapDefault!8732)))))

(declare-fun b!205203 () Bool)

(assert (=> b!205203 (= e!134208 tp_is_empty!5109)))

(declare-fun b!205204 () Bool)

(declare-fun res!99083 () Bool)

(assert (=> b!205204 (=> (not res!99083) (not e!134207))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205204 (= res!99083 (and (= (size!4792 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4791 _keys!825) (size!4792 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205206 () Bool)

(declare-fun e!134205 () Bool)

(declare-fun e!134206 () Bool)

(assert (=> b!205206 (= e!134205 e!134206)))

(declare-fun res!99081 () Bool)

(assert (=> b!205206 (=> res!99081 e!134206)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!205206 (= res!99081 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3940 0))(
  ( (tuple2!3941 (_1!1981 (_ BitVec 64)) (_2!1981 V!6459)) )
))
(declare-datatypes ((List!2839 0))(
  ( (Nil!2836) (Cons!2835 (h!3477 tuple2!3940) (t!7770 List!2839)) )
))
(declare-datatypes ((ListLongMap!2853 0))(
  ( (ListLongMap!2854 (toList!1442 List!2839)) )
))
(declare-fun lt!104338 () ListLongMap!2853)

(declare-fun lt!104335 () ListLongMap!2853)

(assert (=> b!205206 (= lt!104338 lt!104335)))

(declare-fun lt!104341 () ListLongMap!2853)

(declare-fun lt!104343 () tuple2!3940)

(declare-fun +!469 (ListLongMap!2853 tuple2!3940) ListLongMap!2853)

(assert (=> b!205206 (= lt!104335 (+!469 lt!104341 lt!104343))))

(declare-fun lt!104332 () ListLongMap!2853)

(declare-fun lt!104339 () ListLongMap!2853)

(assert (=> b!205206 (= lt!104332 lt!104339)))

(declare-fun lt!104333 () ListLongMap!2853)

(assert (=> b!205206 (= lt!104339 (+!469 lt!104333 lt!104343))))

(declare-fun lt!104334 () ListLongMap!2853)

(assert (=> b!205206 (= lt!104332 (+!469 lt!104334 lt!104343))))

(declare-fun minValue!615 () V!6459)

(assert (=> b!205206 (= lt!104343 (tuple2!3941 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205207 () Bool)

(declare-fun res!99084 () Bool)

(assert (=> b!205207 (=> (not res!99084) (not e!134207))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205207 (= res!99084 (= (select (arr!4466 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8732 () Bool)

(assert (=> mapIsEmpty!8732 mapRes!8732))

(declare-fun b!205208 () Bool)

(declare-fun res!99078 () Bool)

(assert (=> b!205208 (=> (not res!99078) (not e!134207))))

(declare-datatypes ((List!2840 0))(
  ( (Nil!2837) (Cons!2836 (h!3478 (_ BitVec 64)) (t!7771 List!2840)) )
))
(declare-fun arrayNoDuplicates!0 (array!9431 (_ BitVec 32) List!2840) Bool)

(assert (=> b!205208 (= res!99078 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2837))))

(declare-fun b!205209 () Bool)

(assert (=> b!205209 (= e!134207 (not e!134205))))

(declare-fun res!99079 () Bool)

(assert (=> b!205209 (=> res!99079 e!134205)))

(assert (=> b!205209 (= res!99079 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6459)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1014 (array!9431 array!9433 (_ BitVec 32) (_ BitVec 32) V!6459 V!6459 (_ BitVec 32) Int) ListLongMap!2853)

(assert (=> b!205209 (= lt!104338 (getCurrentListMap!1014 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104337 () array!9433)

(assert (=> b!205209 (= lt!104332 (getCurrentListMap!1014 _keys!825 lt!104337 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205209 (and (= lt!104334 lt!104333) (= lt!104333 lt!104334))))

(declare-fun lt!104340 () tuple2!3940)

(assert (=> b!205209 (= lt!104333 (+!469 lt!104341 lt!104340))))

(declare-fun v!520 () V!6459)

(assert (=> b!205209 (= lt!104340 (tuple2!3941 k0!843 v!520))))

(declare-datatypes ((Unit!6230 0))(
  ( (Unit!6231) )
))
(declare-fun lt!104336 () Unit!6230)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!127 (array!9431 array!9433 (_ BitVec 32) (_ BitVec 32) V!6459 V!6459 (_ BitVec 32) (_ BitVec 64) V!6459 (_ BitVec 32) Int) Unit!6230)

(assert (=> b!205209 (= lt!104336 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!127 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!388 (array!9431 array!9433 (_ BitVec 32) (_ BitVec 32) V!6459 V!6459 (_ BitVec 32) Int) ListLongMap!2853)

(assert (=> b!205209 (= lt!104334 (getCurrentListMapNoExtraKeys!388 _keys!825 lt!104337 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205209 (= lt!104337 (array!9434 (store (arr!4467 _values!649) i!601 (ValueCellFull!2211 v!520)) (size!4792 _values!649)))))

(assert (=> b!205209 (= lt!104341 (getCurrentListMapNoExtraKeys!388 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205210 () Bool)

(declare-fun res!99085 () Bool)

(assert (=> b!205210 (=> (not res!99085) (not e!134207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205210 (= res!99085 (validKeyInArray!0 k0!843))))

(declare-fun b!205205 () Bool)

(declare-fun res!99082 () Bool)

(assert (=> b!205205 (=> (not res!99082) (not e!134207))))

(assert (=> b!205205 (= res!99082 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4791 _keys!825))))))

(declare-fun res!99080 () Bool)

(assert (=> start!20594 (=> (not res!99080) (not e!134207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20594 (= res!99080 (validMask!0 mask!1149))))

(assert (=> start!20594 e!134207))

(declare-fun array_inv!2951 (array!9433) Bool)

(assert (=> start!20594 (and (array_inv!2951 _values!649) e!134210)))

(assert (=> start!20594 true))

(assert (=> start!20594 tp_is_empty!5109))

(declare-fun array_inv!2952 (array!9431) Bool)

(assert (=> start!20594 (array_inv!2952 _keys!825)))

(assert (=> start!20594 tp!18790))

(declare-fun b!205211 () Bool)

(assert (=> b!205211 (= e!134206 true)))

(assert (=> b!205211 (= lt!104339 (+!469 lt!104335 lt!104340))))

(declare-fun lt!104342 () Unit!6230)

(declare-fun addCommutativeForDiffKeys!173 (ListLongMap!2853 (_ BitVec 64) V!6459 (_ BitVec 64) V!6459) Unit!6230)

(assert (=> b!205211 (= lt!104342 (addCommutativeForDiffKeys!173 lt!104341 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8732 () Bool)

(declare-fun tp!18791 () Bool)

(assert (=> mapNonEmpty!8732 (= mapRes!8732 (and tp!18791 e!134209))))

(declare-fun mapKey!8732 () (_ BitVec 32))

(declare-fun mapRest!8732 () (Array (_ BitVec 32) ValueCell!2211))

(declare-fun mapValue!8732 () ValueCell!2211)

(assert (=> mapNonEmpty!8732 (= (arr!4467 _values!649) (store mapRest!8732 mapKey!8732 mapValue!8732))))

(assert (= (and start!20594 res!99080) b!205204))

(assert (= (and b!205204 res!99083) b!205201))

(assert (= (and b!205201 res!99077) b!205208))

(assert (= (and b!205208 res!99078) b!205205))

(assert (= (and b!205205 res!99082) b!205210))

(assert (= (and b!205210 res!99085) b!205207))

(assert (= (and b!205207 res!99084) b!205209))

(assert (= (and b!205209 (not res!99079)) b!205206))

(assert (= (and b!205206 (not res!99081)) b!205211))

(assert (= (and b!205202 condMapEmpty!8732) mapIsEmpty!8732))

(assert (= (and b!205202 (not condMapEmpty!8732)) mapNonEmpty!8732))

(get-info :version)

(assert (= (and mapNonEmpty!8732 ((_ is ValueCellFull!2211) mapValue!8732)) b!205200))

(assert (= (and b!205202 ((_ is ValueCellFull!2211) mapDefault!8732)) b!205203))

(assert (= start!20594 b!205202))

(declare-fun m!232799 () Bool)

(assert (=> b!205206 m!232799))

(declare-fun m!232801 () Bool)

(assert (=> b!205206 m!232801))

(declare-fun m!232803 () Bool)

(assert (=> b!205206 m!232803))

(declare-fun m!232805 () Bool)

(assert (=> b!205207 m!232805))

(declare-fun m!232807 () Bool)

(assert (=> b!205201 m!232807))

(declare-fun m!232809 () Bool)

(assert (=> mapNonEmpty!8732 m!232809))

(declare-fun m!232811 () Bool)

(assert (=> b!205208 m!232811))

(declare-fun m!232813 () Bool)

(assert (=> b!205211 m!232813))

(declare-fun m!232815 () Bool)

(assert (=> b!205211 m!232815))

(declare-fun m!232817 () Bool)

(assert (=> b!205209 m!232817))

(declare-fun m!232819 () Bool)

(assert (=> b!205209 m!232819))

(declare-fun m!232821 () Bool)

(assert (=> b!205209 m!232821))

(declare-fun m!232823 () Bool)

(assert (=> b!205209 m!232823))

(declare-fun m!232825 () Bool)

(assert (=> b!205209 m!232825))

(declare-fun m!232827 () Bool)

(assert (=> b!205209 m!232827))

(declare-fun m!232829 () Bool)

(assert (=> b!205209 m!232829))

(declare-fun m!232831 () Bool)

(assert (=> b!205210 m!232831))

(declare-fun m!232833 () Bool)

(assert (=> start!20594 m!232833))

(declare-fun m!232835 () Bool)

(assert (=> start!20594 m!232835))

(declare-fun m!232837 () Bool)

(assert (=> start!20594 m!232837))

(check-sat (not start!20594) tp_is_empty!5109 (not b!205206) (not b!205211) (not b!205209) (not b_next!5253) b_and!11999 (not b!205208) (not mapNonEmpty!8732) (not b!205210) (not b!205201))
(check-sat b_and!11999 (not b_next!5253))
