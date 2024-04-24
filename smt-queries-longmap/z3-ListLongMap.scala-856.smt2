; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20236 () Bool)

(assert start!20236)

(declare-fun b_free!4891 () Bool)

(declare-fun b_next!4891 () Bool)

(assert (=> start!20236 (= b_free!4891 (not b_next!4891))))

(declare-fun tp!17704 () Bool)

(declare-fun b_and!11651 () Bool)

(assert (=> start!20236 (= tp!17704 b_and!11651)))

(declare-fun b!198961 () Bool)

(declare-fun e!130685 () Bool)

(assert (=> b!198961 (= e!130685 (not true))))

(declare-datatypes ((V!5977 0))(
  ( (V!5978 (val!2418 Int)) )
))
(declare-datatypes ((tuple2!3602 0))(
  ( (tuple2!3603 (_1!1812 (_ BitVec 64)) (_2!1812 V!5977)) )
))
(declare-datatypes ((List!2523 0))(
  ( (Nil!2520) (Cons!2519 (h!3161 tuple2!3602) (t!7446 List!2523)) )
))
(declare-datatypes ((ListLongMap!2517 0))(
  ( (ListLongMap!2518 (toList!1274 List!2523)) )
))
(declare-fun lt!98147 () ListLongMap!2517)

(declare-fun lt!98150 () ListLongMap!2517)

(assert (=> b!198961 (and (= lt!98147 lt!98150) (= lt!98150 lt!98147))))

(declare-fun v!520 () V!5977)

(declare-fun lt!98148 () ListLongMap!2517)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!328 (ListLongMap!2517 tuple2!3602) ListLongMap!2517)

(assert (=> b!198961 (= lt!98150 (+!328 lt!98148 (tuple2!3603 k0!843 v!520)))))

(declare-datatypes ((Unit!5942 0))(
  ( (Unit!5943) )
))
(declare-fun lt!98149 () Unit!5942)

(declare-datatypes ((ValueCell!2030 0))(
  ( (ValueCellFull!2030 (v!4389 V!5977)) (EmptyCell!2030) )
))
(declare-datatypes ((array!8725 0))(
  ( (array!8726 (arr!4113 (Array (_ BitVec 32) ValueCell!2030)) (size!4438 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8725)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5977)

(declare-datatypes ((array!8727 0))(
  ( (array!8728 (arr!4114 (Array (_ BitVec 32) (_ BitVec 64))) (size!4439 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8727)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5977)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!7 (array!8727 array!8725 (_ BitVec 32) (_ BitVec 32) V!5977 V!5977 (_ BitVec 32) (_ BitVec 64) V!5977 (_ BitVec 32) Int) Unit!5942)

(assert (=> b!198961 (= lt!98149 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!7 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!264 (array!8727 array!8725 (_ BitVec 32) (_ BitVec 32) V!5977 V!5977 (_ BitVec 32) Int) ListLongMap!2517)

(assert (=> b!198961 (= lt!98147 (getCurrentListMapNoExtraKeys!264 _keys!825 (array!8726 (store (arr!4113 _values!649) i!601 (ValueCellFull!2030 v!520)) (size!4438 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198961 (= lt!98148 (getCurrentListMapNoExtraKeys!264 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198962 () Bool)

(declare-fun res!94446 () Bool)

(assert (=> b!198962 (=> (not res!94446) (not e!130685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198962 (= res!94446 (validKeyInArray!0 k0!843))))

(declare-fun b!198963 () Bool)

(declare-fun e!130684 () Bool)

(declare-fun tp_is_empty!4747 () Bool)

(assert (=> b!198963 (= e!130684 tp_is_empty!4747)))

(declare-fun mapIsEmpty!8189 () Bool)

(declare-fun mapRes!8189 () Bool)

(assert (=> mapIsEmpty!8189 mapRes!8189))

(declare-fun b!198964 () Bool)

(declare-fun res!94443 () Bool)

(assert (=> b!198964 (=> (not res!94443) (not e!130685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8727 (_ BitVec 32)) Bool)

(assert (=> b!198964 (= res!94443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198965 () Bool)

(declare-fun e!130687 () Bool)

(declare-fun e!130688 () Bool)

(assert (=> b!198965 (= e!130687 (and e!130688 mapRes!8189))))

(declare-fun condMapEmpty!8189 () Bool)

(declare-fun mapDefault!8189 () ValueCell!2030)

(assert (=> b!198965 (= condMapEmpty!8189 (= (arr!4113 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2030)) mapDefault!8189)))))

(declare-fun b!198966 () Bool)

(assert (=> b!198966 (= e!130688 tp_is_empty!4747)))

(declare-fun b!198967 () Bool)

(declare-fun res!94442 () Bool)

(assert (=> b!198967 (=> (not res!94442) (not e!130685))))

(assert (=> b!198967 (= res!94442 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4439 _keys!825))))))

(declare-fun mapNonEmpty!8189 () Bool)

(declare-fun tp!17705 () Bool)

(assert (=> mapNonEmpty!8189 (= mapRes!8189 (and tp!17705 e!130684))))

(declare-fun mapValue!8189 () ValueCell!2030)

(declare-fun mapRest!8189 () (Array (_ BitVec 32) ValueCell!2030))

(declare-fun mapKey!8189 () (_ BitVec 32))

(assert (=> mapNonEmpty!8189 (= (arr!4113 _values!649) (store mapRest!8189 mapKey!8189 mapValue!8189))))

(declare-fun b!198968 () Bool)

(declare-fun res!94447 () Bool)

(assert (=> b!198968 (=> (not res!94447) (not e!130685))))

(assert (=> b!198968 (= res!94447 (and (= (size!4438 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4439 _keys!825) (size!4438 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198969 () Bool)

(declare-fun res!94444 () Bool)

(assert (=> b!198969 (=> (not res!94444) (not e!130685))))

(assert (=> b!198969 (= res!94444 (= (select (arr!4114 _keys!825) i!601) k0!843))))

(declare-fun b!198970 () Bool)

(declare-fun res!94441 () Bool)

(assert (=> b!198970 (=> (not res!94441) (not e!130685))))

(declare-datatypes ((List!2524 0))(
  ( (Nil!2521) (Cons!2520 (h!3162 (_ BitVec 64)) (t!7447 List!2524)) )
))
(declare-fun arrayNoDuplicates!0 (array!8727 (_ BitVec 32) List!2524) Bool)

(assert (=> b!198970 (= res!94441 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2521))))

(declare-fun res!94445 () Bool)

(assert (=> start!20236 (=> (not res!94445) (not e!130685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20236 (= res!94445 (validMask!0 mask!1149))))

(assert (=> start!20236 e!130685))

(declare-fun array_inv!2685 (array!8725) Bool)

(assert (=> start!20236 (and (array_inv!2685 _values!649) e!130687)))

(assert (=> start!20236 true))

(assert (=> start!20236 tp_is_empty!4747))

(declare-fun array_inv!2686 (array!8727) Bool)

(assert (=> start!20236 (array_inv!2686 _keys!825)))

(assert (=> start!20236 tp!17704))

(assert (= (and start!20236 res!94445) b!198968))

(assert (= (and b!198968 res!94447) b!198964))

(assert (= (and b!198964 res!94443) b!198970))

(assert (= (and b!198970 res!94441) b!198967))

(assert (= (and b!198967 res!94442) b!198962))

(assert (= (and b!198962 res!94446) b!198969))

(assert (= (and b!198969 res!94444) b!198961))

(assert (= (and b!198965 condMapEmpty!8189) mapIsEmpty!8189))

(assert (= (and b!198965 (not condMapEmpty!8189)) mapNonEmpty!8189))

(get-info :version)

(assert (= (and mapNonEmpty!8189 ((_ is ValueCellFull!2030) mapValue!8189)) b!198963))

(assert (= (and b!198965 ((_ is ValueCellFull!2030) mapDefault!8189)) b!198966))

(assert (= start!20236 b!198965))

(declare-fun m!225627 () Bool)

(assert (=> b!198970 m!225627))

(declare-fun m!225629 () Bool)

(assert (=> mapNonEmpty!8189 m!225629))

(declare-fun m!225631 () Bool)

(assert (=> b!198969 m!225631))

(declare-fun m!225633 () Bool)

(assert (=> b!198964 m!225633))

(declare-fun m!225635 () Bool)

(assert (=> start!20236 m!225635))

(declare-fun m!225637 () Bool)

(assert (=> start!20236 m!225637))

(declare-fun m!225639 () Bool)

(assert (=> start!20236 m!225639))

(declare-fun m!225641 () Bool)

(assert (=> b!198962 m!225641))

(declare-fun m!225643 () Bool)

(assert (=> b!198961 m!225643))

(declare-fun m!225645 () Bool)

(assert (=> b!198961 m!225645))

(declare-fun m!225647 () Bool)

(assert (=> b!198961 m!225647))

(declare-fun m!225649 () Bool)

(assert (=> b!198961 m!225649))

(declare-fun m!225651 () Bool)

(assert (=> b!198961 m!225651))

(check-sat (not b_next!4891) (not b!198962) (not start!20236) (not b!198961) (not mapNonEmpty!8189) b_and!11651 (not b!198970) tp_is_empty!4747 (not b!198964))
(check-sat b_and!11651 (not b_next!4891))
