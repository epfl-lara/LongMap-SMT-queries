; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72888 () Bool)

(assert start!72888)

(declare-fun b_free!13803 () Bool)

(declare-fun b_next!13803 () Bool)

(assert (=> start!72888 (= b_free!13803 (not b_next!13803))))

(declare-fun tp!48913 () Bool)

(declare-fun b_and!22889 () Bool)

(assert (=> start!72888 (= tp!48913 b_and!22889)))

(declare-fun mapNonEmpty!25508 () Bool)

(declare-fun mapRes!25508 () Bool)

(declare-fun tp!48912 () Bool)

(declare-fun e!472280 () Bool)

(assert (=> mapNonEmpty!25508 (= mapRes!25508 (and tp!48912 e!472280))))

(declare-datatypes ((V!26299 0))(
  ( (V!26300 (val!8017 Int)) )
))
(declare-datatypes ((ValueCell!7530 0))(
  ( (ValueCellFull!7530 (v!10442 V!26299)) (EmptyCell!7530) )
))
(declare-fun mapValue!25508 () ValueCell!7530)

(declare-fun mapKey!25508 () (_ BitVec 32))

(declare-fun mapRest!25508 () (Array (_ BitVec 32) ValueCell!7530))

(declare-datatypes ((array!48092 0))(
  ( (array!48093 (arr!23077 (Array (_ BitVec 32) ValueCell!7530)) (size!23517 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48092)

(assert (=> mapNonEmpty!25508 (= (arr!23077 _values!688) (store mapRest!25508 mapKey!25508 mapValue!25508))))

(declare-fun b!846133 () Bool)

(declare-fun e!472282 () Bool)

(declare-fun e!472278 () Bool)

(assert (=> b!846133 (= e!472282 (and e!472278 mapRes!25508))))

(declare-fun condMapEmpty!25508 () Bool)

(declare-fun mapDefault!25508 () ValueCell!7530)

(assert (=> b!846133 (= condMapEmpty!25508 (= (arr!23077 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7530)) mapDefault!25508)))))

(declare-fun b!846134 () Bool)

(declare-fun res!574848 () Bool)

(declare-fun e!472279 () Bool)

(assert (=> b!846134 (=> (not res!574848) (not e!472279))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846134 (= res!574848 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25508 () Bool)

(assert (=> mapIsEmpty!25508 mapRes!25508))

(declare-fun b!846135 () Bool)

(declare-fun res!574846 () Bool)

(assert (=> b!846135 (=> (not res!574846) (not e!472279))))

(declare-datatypes ((array!48094 0))(
  ( (array!48095 (arr!23078 (Array (_ BitVec 32) (_ BitVec 64))) (size!23518 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48094)

(declare-datatypes ((List!16331 0))(
  ( (Nil!16328) (Cons!16327 (h!17458 (_ BitVec 64)) (t!22702 List!16331)) )
))
(declare-fun arrayNoDuplicates!0 (array!48094 (_ BitVec 32) List!16331) Bool)

(assert (=> b!846135 (= res!574846 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16328))))

(declare-fun res!574847 () Bool)

(assert (=> start!72888 (=> (not res!574847) (not e!472279))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72888 (= res!574847 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23518 _keys!868))))))

(assert (=> start!72888 e!472279))

(declare-fun tp_is_empty!15939 () Bool)

(assert (=> start!72888 tp_is_empty!15939))

(assert (=> start!72888 true))

(assert (=> start!72888 tp!48913))

(declare-fun array_inv!18336 (array!48094) Bool)

(assert (=> start!72888 (array_inv!18336 _keys!868)))

(declare-fun array_inv!18337 (array!48092) Bool)

(assert (=> start!72888 (and (array_inv!18337 _values!688) e!472282)))

(declare-fun b!846136 () Bool)

(assert (=> b!846136 (= e!472280 tp_is_empty!15939)))

(declare-fun b!846137 () Bool)

(assert (=> b!846137 (= e!472279 false)))

(declare-datatypes ((tuple2!10470 0))(
  ( (tuple2!10471 (_1!5246 (_ BitVec 64)) (_2!5246 V!26299)) )
))
(declare-datatypes ((List!16332 0))(
  ( (Nil!16329) (Cons!16328 (h!17459 tuple2!10470) (t!22703 List!16332)) )
))
(declare-datatypes ((ListLongMap!9239 0))(
  ( (ListLongMap!9240 (toList!4635 List!16332)) )
))
(declare-fun lt!381481 () ListLongMap!9239)

(declare-fun v!557 () V!26299)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26299)

(declare-fun zeroValue!654 () V!26299)

(declare-fun getCurrentListMapNoExtraKeys!2620 (array!48094 array!48092 (_ BitVec 32) (_ BitVec 32) V!26299 V!26299 (_ BitVec 32) Int) ListLongMap!9239)

(assert (=> b!846137 (= lt!381481 (getCurrentListMapNoExtraKeys!2620 _keys!868 (array!48093 (store (arr!23077 _values!688) i!612 (ValueCellFull!7530 v!557)) (size!23517 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381480 () ListLongMap!9239)

(assert (=> b!846137 (= lt!381480 (getCurrentListMapNoExtraKeys!2620 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846138 () Bool)

(declare-fun res!574849 () Bool)

(assert (=> b!846138 (=> (not res!574849) (not e!472279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48094 (_ BitVec 32)) Bool)

(assert (=> b!846138 (= res!574849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846139 () Bool)

(declare-fun res!574853 () Bool)

(assert (=> b!846139 (=> (not res!574853) (not e!472279))))

(assert (=> b!846139 (= res!574853 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23518 _keys!868))))))

(declare-fun b!846140 () Bool)

(declare-fun res!574851 () Bool)

(assert (=> b!846140 (=> (not res!574851) (not e!472279))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!846140 (= res!574851 (and (= (select (arr!23078 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846141 () Bool)

(declare-fun res!574850 () Bool)

(assert (=> b!846141 (=> (not res!574850) (not e!472279))))

(assert (=> b!846141 (= res!574850 (and (= (size!23517 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23518 _keys!868) (size!23517 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846142 () Bool)

(assert (=> b!846142 (= e!472278 tp_is_empty!15939)))

(declare-fun b!846143 () Bool)

(declare-fun res!574852 () Bool)

(assert (=> b!846143 (=> (not res!574852) (not e!472279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846143 (= res!574852 (validKeyInArray!0 k0!854))))

(assert (= (and start!72888 res!574847) b!846134))

(assert (= (and b!846134 res!574848) b!846141))

(assert (= (and b!846141 res!574850) b!846138))

(assert (= (and b!846138 res!574849) b!846135))

(assert (= (and b!846135 res!574846) b!846139))

(assert (= (and b!846139 res!574853) b!846143))

(assert (= (and b!846143 res!574852) b!846140))

(assert (= (and b!846140 res!574851) b!846137))

(assert (= (and b!846133 condMapEmpty!25508) mapIsEmpty!25508))

(assert (= (and b!846133 (not condMapEmpty!25508)) mapNonEmpty!25508))

(get-info :version)

(assert (= (and mapNonEmpty!25508 ((_ is ValueCellFull!7530) mapValue!25508)) b!846136))

(assert (= (and b!846133 ((_ is ValueCellFull!7530) mapDefault!25508)) b!846142))

(assert (= start!72888 b!846133))

(declare-fun m!787633 () Bool)

(assert (=> b!846135 m!787633))

(declare-fun m!787635 () Bool)

(assert (=> mapNonEmpty!25508 m!787635))

(declare-fun m!787637 () Bool)

(assert (=> b!846143 m!787637))

(declare-fun m!787639 () Bool)

(assert (=> b!846138 m!787639))

(declare-fun m!787641 () Bool)

(assert (=> b!846137 m!787641))

(declare-fun m!787643 () Bool)

(assert (=> b!846137 m!787643))

(declare-fun m!787645 () Bool)

(assert (=> b!846137 m!787645))

(declare-fun m!787647 () Bool)

(assert (=> start!72888 m!787647))

(declare-fun m!787649 () Bool)

(assert (=> start!72888 m!787649))

(declare-fun m!787651 () Bool)

(assert (=> b!846140 m!787651))

(declare-fun m!787653 () Bool)

(assert (=> b!846134 m!787653))

(check-sat (not b!846138) tp_is_empty!15939 (not b!846135) (not mapNonEmpty!25508) (not b!846137) (not b!846143) (not b!846134) (not start!72888) (not b_next!13803) b_and!22889)
(check-sat b_and!22889 (not b_next!13803))
