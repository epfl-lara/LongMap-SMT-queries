; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72826 () Bool)

(assert start!72826)

(declare-fun b_free!13759 () Bool)

(declare-fun b_next!13759 () Bool)

(assert (=> start!72826 (= b_free!13759 (not b_next!13759))))

(declare-fun tp!48782 () Bool)

(declare-fun b_and!22819 () Bool)

(assert (=> start!72826 (= tp!48782 b_and!22819)))

(declare-fun b!845168 () Bool)

(declare-fun res!574211 () Bool)

(declare-fun e!471802 () Bool)

(assert (=> b!845168 (=> (not res!574211) (not e!471802))))

(declare-datatypes ((array!48013 0))(
  ( (array!48014 (arr!23038 (Array (_ BitVec 32) (_ BitVec 64))) (size!23480 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48013)

(declare-datatypes ((List!16322 0))(
  ( (Nil!16319) (Cons!16318 (h!17449 (_ BitVec 64)) (t!22684 List!16322)) )
))
(declare-fun arrayNoDuplicates!0 (array!48013 (_ BitVec 32) List!16322) Bool)

(assert (=> b!845168 (= res!574211 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16319))))

(declare-fun b!845169 () Bool)

(declare-fun res!574210 () Bool)

(assert (=> b!845169 (=> (not res!574210) (not e!471802))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845169 (= res!574210 (validMask!0 mask!1196))))

(declare-fun res!574215 () Bool)

(assert (=> start!72826 (=> (not res!574215) (not e!471802))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72826 (= res!574215 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23480 _keys!868))))))

(assert (=> start!72826 e!471802))

(assert (=> start!72826 true))

(assert (=> start!72826 tp!48782))

(declare-fun array_inv!18378 (array!48013) Bool)

(assert (=> start!72826 (array_inv!18378 _keys!868)))

(declare-datatypes ((V!26241 0))(
  ( (V!26242 (val!7995 Int)) )
))
(declare-datatypes ((ValueCell!7508 0))(
  ( (ValueCellFull!7508 (v!10414 V!26241)) (EmptyCell!7508) )
))
(declare-datatypes ((array!48015 0))(
  ( (array!48016 (arr!23039 (Array (_ BitVec 32) ValueCell!7508)) (size!23481 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48015)

(declare-fun e!471804 () Bool)

(declare-fun array_inv!18379 (array!48015) Bool)

(assert (=> start!72826 (and (array_inv!18379 _values!688) e!471804)))

(declare-fun tp_is_empty!15895 () Bool)

(assert (=> start!72826 tp_is_empty!15895))

(declare-fun b!845170 () Bool)

(assert (=> b!845170 (= e!471802 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10462 0))(
  ( (tuple2!10463 (_1!5242 (_ BitVec 64)) (_2!5242 V!26241)) )
))
(declare-datatypes ((List!16323 0))(
  ( (Nil!16320) (Cons!16319 (h!17450 tuple2!10462) (t!22685 List!16323)) )
))
(declare-datatypes ((ListLongMap!9221 0))(
  ( (ListLongMap!9222 (toList!4626 List!16323)) )
))
(declare-fun lt!381173 () ListLongMap!9221)

(declare-fun minValue!654 () V!26241)

(declare-fun zeroValue!654 () V!26241)

(declare-fun getCurrentListMapNoExtraKeys!2640 (array!48013 array!48015 (_ BitVec 32) (_ BitVec 32) V!26241 V!26241 (_ BitVec 32) Int) ListLongMap!9221)

(assert (=> b!845170 (= lt!381173 (getCurrentListMapNoExtraKeys!2640 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845171 () Bool)

(declare-fun e!471801 () Bool)

(assert (=> b!845171 (= e!471801 tp_is_empty!15895)))

(declare-fun b!845172 () Bool)

(declare-fun res!574214 () Bool)

(assert (=> b!845172 (=> (not res!574214) (not e!471802))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!845172 (= res!574214 (and (= (select (arr!23038 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845173 () Bool)

(declare-fun res!574208 () Bool)

(assert (=> b!845173 (=> (not res!574208) (not e!471802))))

(assert (=> b!845173 (= res!574208 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23480 _keys!868))))))

(declare-fun b!845174 () Bool)

(declare-fun e!471803 () Bool)

(assert (=> b!845174 (= e!471803 tp_is_empty!15895)))

(declare-fun mapNonEmpty!25442 () Bool)

(declare-fun mapRes!25442 () Bool)

(declare-fun tp!48781 () Bool)

(assert (=> mapNonEmpty!25442 (= mapRes!25442 (and tp!48781 e!471803))))

(declare-fun mapKey!25442 () (_ BitVec 32))

(declare-fun mapRest!25442 () (Array (_ BitVec 32) ValueCell!7508))

(declare-fun mapValue!25442 () ValueCell!7508)

(assert (=> mapNonEmpty!25442 (= (arr!23039 _values!688) (store mapRest!25442 mapKey!25442 mapValue!25442))))

(declare-fun b!845175 () Bool)

(declare-fun res!574212 () Bool)

(assert (=> b!845175 (=> (not res!574212) (not e!471802))))

(assert (=> b!845175 (= res!574212 (and (= (size!23481 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23480 _keys!868) (size!23481 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845176 () Bool)

(assert (=> b!845176 (= e!471804 (and e!471801 mapRes!25442))))

(declare-fun condMapEmpty!25442 () Bool)

(declare-fun mapDefault!25442 () ValueCell!7508)

(assert (=> b!845176 (= condMapEmpty!25442 (= (arr!23039 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7508)) mapDefault!25442)))))

(declare-fun mapIsEmpty!25442 () Bool)

(assert (=> mapIsEmpty!25442 mapRes!25442))

(declare-fun b!845177 () Bool)

(declare-fun res!574209 () Bool)

(assert (=> b!845177 (=> (not res!574209) (not e!471802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845177 (= res!574209 (validKeyInArray!0 k0!854))))

(declare-fun b!845178 () Bool)

(declare-fun res!574213 () Bool)

(assert (=> b!845178 (=> (not res!574213) (not e!471802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48013 (_ BitVec 32)) Bool)

(assert (=> b!845178 (= res!574213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72826 res!574215) b!845169))

(assert (= (and b!845169 res!574210) b!845175))

(assert (= (and b!845175 res!574212) b!845178))

(assert (= (and b!845178 res!574213) b!845168))

(assert (= (and b!845168 res!574211) b!845173))

(assert (= (and b!845173 res!574208) b!845177))

(assert (= (and b!845177 res!574209) b!845172))

(assert (= (and b!845172 res!574214) b!845170))

(assert (= (and b!845176 condMapEmpty!25442) mapIsEmpty!25442))

(assert (= (and b!845176 (not condMapEmpty!25442)) mapNonEmpty!25442))

(get-info :version)

(assert (= (and mapNonEmpty!25442 ((_ is ValueCellFull!7508) mapValue!25442)) b!845174))

(assert (= (and b!845176 ((_ is ValueCellFull!7508) mapDefault!25442)) b!845171))

(assert (= start!72826 b!845176))

(declare-fun m!786479 () Bool)

(assert (=> b!845168 m!786479))

(declare-fun m!786481 () Bool)

(assert (=> start!72826 m!786481))

(declare-fun m!786483 () Bool)

(assert (=> start!72826 m!786483))

(declare-fun m!786485 () Bool)

(assert (=> b!845177 m!786485))

(declare-fun m!786487 () Bool)

(assert (=> b!845169 m!786487))

(declare-fun m!786489 () Bool)

(assert (=> mapNonEmpty!25442 m!786489))

(declare-fun m!786491 () Bool)

(assert (=> b!845172 m!786491))

(declare-fun m!786493 () Bool)

(assert (=> b!845178 m!786493))

(declare-fun m!786495 () Bool)

(assert (=> b!845170 m!786495))

(check-sat (not mapNonEmpty!25442) (not start!72826) (not b!845170) (not b_next!13759) (not b!845177) tp_is_empty!15895 (not b!845178) b_and!22819 (not b!845169) (not b!845168))
(check-sat b_and!22819 (not b_next!13759))
