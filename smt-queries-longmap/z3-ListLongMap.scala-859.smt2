; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20254 () Bool)

(assert start!20254)

(declare-fun b_free!4909 () Bool)

(declare-fun b_next!4909 () Bool)

(assert (=> start!20254 (= b_free!4909 (not b_next!4909))))

(declare-fun tp!17758 () Bool)

(declare-fun b_and!11669 () Bool)

(assert (=> start!20254 (= tp!17758 b_and!11669)))

(declare-fun mapIsEmpty!8216 () Bool)

(declare-fun mapRes!8216 () Bool)

(assert (=> mapIsEmpty!8216 mapRes!8216))

(declare-fun b!199231 () Bool)

(declare-fun res!94634 () Bool)

(declare-fun e!130821 () Bool)

(assert (=> b!199231 (=> (not res!94634) (not e!130821))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199231 (= res!94634 (validKeyInArray!0 k0!843))))

(declare-fun b!199232 () Bool)

(declare-fun res!94630 () Bool)

(assert (=> b!199232 (=> (not res!94630) (not e!130821))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6001 0))(
  ( (V!6002 (val!2427 Int)) )
))
(declare-datatypes ((ValueCell!2039 0))(
  ( (ValueCellFull!2039 (v!4398 V!6001)) (EmptyCell!2039) )
))
(declare-datatypes ((array!8761 0))(
  ( (array!8762 (arr!4131 (Array (_ BitVec 32) ValueCell!2039)) (size!4456 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8761)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!8763 0))(
  ( (array!8764 (arr!4132 (Array (_ BitVec 32) (_ BitVec 64))) (size!4457 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8763)

(assert (=> b!199232 (= res!94630 (and (= (size!4456 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4457 _keys!825) (size!4456 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199233 () Bool)

(declare-fun res!94631 () Bool)

(assert (=> b!199233 (=> (not res!94631) (not e!130821))))

(declare-datatypes ((List!2535 0))(
  ( (Nil!2532) (Cons!2531 (h!3173 (_ BitVec 64)) (t!7458 List!2535)) )
))
(declare-fun arrayNoDuplicates!0 (array!8763 (_ BitVec 32) List!2535) Bool)

(assert (=> b!199233 (= res!94631 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2532))))

(declare-fun b!199234 () Bool)

(declare-fun res!94632 () Bool)

(assert (=> b!199234 (=> (not res!94632) (not e!130821))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199234 (= res!94632 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4457 _keys!825))))))

(declare-fun b!199235 () Bool)

(assert (=> b!199235 (= e!130821 (not true))))

(declare-datatypes ((tuple2!3616 0))(
  ( (tuple2!3617 (_1!1819 (_ BitVec 64)) (_2!1819 V!6001)) )
))
(declare-datatypes ((List!2536 0))(
  ( (Nil!2533) (Cons!2532 (h!3174 tuple2!3616) (t!7459 List!2536)) )
))
(declare-datatypes ((ListLongMap!2531 0))(
  ( (ListLongMap!2532 (toList!1281 List!2536)) )
))
(declare-fun lt!98258 () ListLongMap!2531)

(declare-fun lt!98256 () ListLongMap!2531)

(assert (=> b!199235 (and (= lt!98258 lt!98256) (= lt!98256 lt!98258))))

(declare-fun lt!98255 () ListLongMap!2531)

(declare-fun v!520 () V!6001)

(declare-fun +!335 (ListLongMap!2531 tuple2!3616) ListLongMap!2531)

(assert (=> b!199235 (= lt!98256 (+!335 lt!98255 (tuple2!3617 k0!843 v!520)))))

(declare-datatypes ((Unit!5956 0))(
  ( (Unit!5957) )
))
(declare-fun lt!98257 () Unit!5956)

(declare-fun zeroValue!615 () V!6001)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6001)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!14 (array!8763 array!8761 (_ BitVec 32) (_ BitVec 32) V!6001 V!6001 (_ BitVec 32) (_ BitVec 64) V!6001 (_ BitVec 32) Int) Unit!5956)

(assert (=> b!199235 (= lt!98257 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!14 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!271 (array!8763 array!8761 (_ BitVec 32) (_ BitVec 32) V!6001 V!6001 (_ BitVec 32) Int) ListLongMap!2531)

(assert (=> b!199235 (= lt!98258 (getCurrentListMapNoExtraKeys!271 _keys!825 (array!8762 (store (arr!4131 _values!649) i!601 (ValueCellFull!2039 v!520)) (size!4456 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199235 (= lt!98255 (getCurrentListMapNoExtraKeys!271 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199236 () Bool)

(declare-fun e!130822 () Bool)

(declare-fun tp_is_empty!4765 () Bool)

(assert (=> b!199236 (= e!130822 tp_is_empty!4765)))

(declare-fun mapNonEmpty!8216 () Bool)

(declare-fun tp!17759 () Bool)

(declare-fun e!130823 () Bool)

(assert (=> mapNonEmpty!8216 (= mapRes!8216 (and tp!17759 e!130823))))

(declare-fun mapValue!8216 () ValueCell!2039)

(declare-fun mapKey!8216 () (_ BitVec 32))

(declare-fun mapRest!8216 () (Array (_ BitVec 32) ValueCell!2039))

(assert (=> mapNonEmpty!8216 (= (arr!4131 _values!649) (store mapRest!8216 mapKey!8216 mapValue!8216))))

(declare-fun res!94633 () Bool)

(assert (=> start!20254 (=> (not res!94633) (not e!130821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20254 (= res!94633 (validMask!0 mask!1149))))

(assert (=> start!20254 e!130821))

(declare-fun e!130820 () Bool)

(declare-fun array_inv!2695 (array!8761) Bool)

(assert (=> start!20254 (and (array_inv!2695 _values!649) e!130820)))

(assert (=> start!20254 true))

(assert (=> start!20254 tp_is_empty!4765))

(declare-fun array_inv!2696 (array!8763) Bool)

(assert (=> start!20254 (array_inv!2696 _keys!825)))

(assert (=> start!20254 tp!17758))

(declare-fun b!199237 () Bool)

(assert (=> b!199237 (= e!130823 tp_is_empty!4765)))

(declare-fun b!199238 () Bool)

(declare-fun res!94636 () Bool)

(assert (=> b!199238 (=> (not res!94636) (not e!130821))))

(assert (=> b!199238 (= res!94636 (= (select (arr!4132 _keys!825) i!601) k0!843))))

(declare-fun b!199239 () Bool)

(assert (=> b!199239 (= e!130820 (and e!130822 mapRes!8216))))

(declare-fun condMapEmpty!8216 () Bool)

(declare-fun mapDefault!8216 () ValueCell!2039)

(assert (=> b!199239 (= condMapEmpty!8216 (= (arr!4131 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2039)) mapDefault!8216)))))

(declare-fun b!199240 () Bool)

(declare-fun res!94635 () Bool)

(assert (=> b!199240 (=> (not res!94635) (not e!130821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8763 (_ BitVec 32)) Bool)

(assert (=> b!199240 (= res!94635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20254 res!94633) b!199232))

(assert (= (and b!199232 res!94630) b!199240))

(assert (= (and b!199240 res!94635) b!199233))

(assert (= (and b!199233 res!94631) b!199234))

(assert (= (and b!199234 res!94632) b!199231))

(assert (= (and b!199231 res!94634) b!199238))

(assert (= (and b!199238 res!94636) b!199235))

(assert (= (and b!199239 condMapEmpty!8216) mapIsEmpty!8216))

(assert (= (and b!199239 (not condMapEmpty!8216)) mapNonEmpty!8216))

(get-info :version)

(assert (= (and mapNonEmpty!8216 ((_ is ValueCellFull!2039) mapValue!8216)) b!199237))

(assert (= (and b!199239 ((_ is ValueCellFull!2039) mapDefault!8216)) b!199236))

(assert (= start!20254 b!199239))

(declare-fun m!225861 () Bool)

(assert (=> b!199233 m!225861))

(declare-fun m!225863 () Bool)

(assert (=> b!199240 m!225863))

(declare-fun m!225865 () Bool)

(assert (=> b!199231 m!225865))

(declare-fun m!225867 () Bool)

(assert (=> b!199235 m!225867))

(declare-fun m!225869 () Bool)

(assert (=> b!199235 m!225869))

(declare-fun m!225871 () Bool)

(assert (=> b!199235 m!225871))

(declare-fun m!225873 () Bool)

(assert (=> b!199235 m!225873))

(declare-fun m!225875 () Bool)

(assert (=> b!199235 m!225875))

(declare-fun m!225877 () Bool)

(assert (=> mapNonEmpty!8216 m!225877))

(declare-fun m!225879 () Bool)

(assert (=> start!20254 m!225879))

(declare-fun m!225881 () Bool)

(assert (=> start!20254 m!225881))

(declare-fun m!225883 () Bool)

(assert (=> start!20254 m!225883))

(declare-fun m!225885 () Bool)

(assert (=> b!199238 m!225885))

(check-sat (not b!199235) tp_is_empty!4765 (not b_next!4909) (not b!199240) (not b!199231) (not b!199233) b_and!11669 (not mapNonEmpty!8216) (not start!20254))
(check-sat b_and!11669 (not b_next!4909))
