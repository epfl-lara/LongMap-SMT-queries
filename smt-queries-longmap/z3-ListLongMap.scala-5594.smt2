; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73330 () Bool)

(assert start!73330)

(declare-fun b_free!14263 () Bool)

(declare-fun b_next!14263 () Bool)

(assert (=> start!73330 (= b_free!14263 (not b_next!14263))))

(declare-fun tp!50293 () Bool)

(declare-fun b_and!23593 () Bool)

(assert (=> start!73330 (= tp!50293 b_and!23593)))

(declare-fun b!855626 () Bool)

(declare-fun res!581162 () Bool)

(declare-fun e!476968 () Bool)

(assert (=> b!855626 (=> (not res!581162) (not e!476968))))

(declare-datatypes ((array!48979 0))(
  ( (array!48980 (arr!23521 (Array (_ BitVec 32) (_ BitVec 64))) (size!23963 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48979)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48979 (_ BitVec 32)) Bool)

(assert (=> b!855626 (= res!581162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26198 () Bool)

(declare-fun mapRes!26198 () Bool)

(declare-fun tp!50294 () Bool)

(declare-fun e!476966 () Bool)

(assert (=> mapNonEmpty!26198 (= mapRes!26198 (and tp!50294 e!476966))))

(declare-datatypes ((V!26913 0))(
  ( (V!26914 (val!8247 Int)) )
))
(declare-datatypes ((ValueCell!7760 0))(
  ( (ValueCellFull!7760 (v!10666 V!26913)) (EmptyCell!7760) )
))
(declare-fun mapValue!26198 () ValueCell!7760)

(declare-fun mapKey!26198 () (_ BitVec 32))

(declare-fun mapRest!26198 () (Array (_ BitVec 32) ValueCell!7760))

(declare-datatypes ((array!48981 0))(
  ( (array!48982 (arr!23522 (Array (_ BitVec 32) ValueCell!7760)) (size!23964 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48981)

(assert (=> mapNonEmpty!26198 (= (arr!23522 _values!688) (store mapRest!26198 mapKey!26198 mapValue!26198))))

(declare-fun b!855627 () Bool)

(declare-fun res!581158 () Bool)

(assert (=> b!855627 (=> (not res!581158) (not e!476968))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!855627 (= res!581158 (and (= (size!23964 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23963 _keys!868) (size!23964 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855628 () Bool)

(declare-fun res!581161 () Bool)

(assert (=> b!855628 (=> (not res!581161) (not e!476968))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855628 (= res!581161 (validKeyInArray!0 k0!854))))

(declare-fun b!855629 () Bool)

(declare-fun tp_is_empty!16399 () Bool)

(assert (=> b!855629 (= e!476966 tp_is_empty!16399)))

(declare-fun b!855630 () Bool)

(declare-fun res!581163 () Bool)

(assert (=> b!855630 (=> (not res!581163) (not e!476968))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855630 (= res!581163 (and (= (select (arr!23521 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855631 () Bool)

(declare-fun res!581156 () Bool)

(assert (=> b!855631 (=> (not res!581156) (not e!476968))))

(assert (=> b!855631 (= res!581156 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23963 _keys!868))))))

(declare-fun b!855632 () Bool)

(declare-fun e!476969 () Bool)

(declare-fun e!476967 () Bool)

(assert (=> b!855632 (= e!476969 (and e!476967 mapRes!26198))))

(declare-fun condMapEmpty!26198 () Bool)

(declare-fun mapDefault!26198 () ValueCell!7760)

(assert (=> b!855632 (= condMapEmpty!26198 (= (arr!23522 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7760)) mapDefault!26198)))))

(declare-fun b!855633 () Bool)

(declare-fun res!581157 () Bool)

(assert (=> b!855633 (=> (not res!581157) (not e!476968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855633 (= res!581157 (validMask!0 mask!1196))))

(declare-fun b!855634 () Bool)

(assert (=> b!855634 (= e!476967 tp_is_empty!16399)))

(declare-fun b!855635 () Bool)

(declare-fun res!581159 () Bool)

(assert (=> b!855635 (=> (not res!581159) (not e!476968))))

(declare-datatypes ((List!16687 0))(
  ( (Nil!16684) (Cons!16683 (h!17814 (_ BitVec 64)) (t!23319 List!16687)) )
))
(declare-fun arrayNoDuplicates!0 (array!48979 (_ BitVec 32) List!16687) Bool)

(assert (=> b!855635 (= res!581159 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16684))))

(declare-fun res!581160 () Bool)

(assert (=> start!73330 (=> (not res!581160) (not e!476968))))

(assert (=> start!73330 (= res!581160 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23963 _keys!868))))))

(assert (=> start!73330 e!476968))

(assert (=> start!73330 tp_is_empty!16399))

(assert (=> start!73330 true))

(assert (=> start!73330 tp!50293))

(declare-fun array_inv!18706 (array!48979) Bool)

(assert (=> start!73330 (array_inv!18706 _keys!868)))

(declare-fun array_inv!18707 (array!48981) Bool)

(assert (=> start!73330 (and (array_inv!18707 _values!688) e!476969)))

(declare-fun mapIsEmpty!26198 () Bool)

(assert (=> mapIsEmpty!26198 mapRes!26198))

(declare-fun b!855636 () Bool)

(assert (=> b!855636 (= e!476968 false)))

(declare-datatypes ((tuple2!10878 0))(
  ( (tuple2!10879 (_1!5450 (_ BitVec 64)) (_2!5450 V!26913)) )
))
(declare-datatypes ((List!16688 0))(
  ( (Nil!16685) (Cons!16684 (h!17815 tuple2!10878) (t!23320 List!16688)) )
))
(declare-datatypes ((ListLongMap!9637 0))(
  ( (ListLongMap!9638 (toList!4834 List!16688)) )
))
(declare-fun lt!385541 () ListLongMap!9637)

(declare-fun v!557 () V!26913)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26913)

(declare-fun zeroValue!654 () V!26913)

(declare-fun getCurrentListMapNoExtraKeys!2841 (array!48979 array!48981 (_ BitVec 32) (_ BitVec 32) V!26913 V!26913 (_ BitVec 32) Int) ListLongMap!9637)

(assert (=> b!855636 (= lt!385541 (getCurrentListMapNoExtraKeys!2841 _keys!868 (array!48982 (store (arr!23522 _values!688) i!612 (ValueCellFull!7760 v!557)) (size!23964 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385540 () ListLongMap!9637)

(assert (=> b!855636 (= lt!385540 (getCurrentListMapNoExtraKeys!2841 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73330 res!581160) b!855633))

(assert (= (and b!855633 res!581157) b!855627))

(assert (= (and b!855627 res!581158) b!855626))

(assert (= (and b!855626 res!581162) b!855635))

(assert (= (and b!855635 res!581159) b!855631))

(assert (= (and b!855631 res!581156) b!855628))

(assert (= (and b!855628 res!581161) b!855630))

(assert (= (and b!855630 res!581163) b!855636))

(assert (= (and b!855632 condMapEmpty!26198) mapIsEmpty!26198))

(assert (= (and b!855632 (not condMapEmpty!26198)) mapNonEmpty!26198))

(get-info :version)

(assert (= (and mapNonEmpty!26198 ((_ is ValueCellFull!7760) mapValue!26198)) b!855629))

(assert (= (and b!855632 ((_ is ValueCellFull!7760) mapDefault!26198)) b!855634))

(assert (= start!73330 b!855632))

(declare-fun m!796167 () Bool)

(assert (=> b!855626 m!796167))

(declare-fun m!796169 () Bool)

(assert (=> b!855628 m!796169))

(declare-fun m!796171 () Bool)

(assert (=> b!855633 m!796171))

(declare-fun m!796173 () Bool)

(assert (=> b!855630 m!796173))

(declare-fun m!796175 () Bool)

(assert (=> b!855636 m!796175))

(declare-fun m!796177 () Bool)

(assert (=> b!855636 m!796177))

(declare-fun m!796179 () Bool)

(assert (=> b!855636 m!796179))

(declare-fun m!796181 () Bool)

(assert (=> b!855635 m!796181))

(declare-fun m!796183 () Bool)

(assert (=> start!73330 m!796183))

(declare-fun m!796185 () Bool)

(assert (=> start!73330 m!796185))

(declare-fun m!796187 () Bool)

(assert (=> mapNonEmpty!26198 m!796187))

(check-sat (not b_next!14263) (not b!855626) (not b!855633) (not mapNonEmpty!26198) (not b!855635) (not start!73330) (not b!855636) b_and!23593 (not b!855628) tp_is_empty!16399)
(check-sat b_and!23593 (not b_next!14263))
