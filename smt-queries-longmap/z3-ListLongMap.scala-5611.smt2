; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73432 () Bool)

(assert start!73432)

(declare-fun b_free!14365 () Bool)

(declare-fun b_next!14365 () Bool)

(assert (=> start!73432 (= b_free!14365 (not b_next!14365))))

(declare-fun tp!50600 () Bool)

(declare-fun b_and!23695 () Bool)

(assert (=> start!73432 (= tp!50600 b_and!23695)))

(declare-fun b!857455 () Bool)

(declare-fun e!477879 () Bool)

(declare-fun tp_is_empty!16501 () Bool)

(assert (=> b!857455 (= e!477879 tp_is_empty!16501)))

(declare-fun b!857456 () Bool)

(declare-fun e!477877 () Bool)

(assert (=> b!857456 (= e!477877 (not true))))

(declare-datatypes ((V!27049 0))(
  ( (V!27050 (val!8298 Int)) )
))
(declare-fun v!557 () V!27049)

(declare-datatypes ((ValueCell!7811 0))(
  ( (ValueCellFull!7811 (v!10717 V!27049)) (EmptyCell!7811) )
))
(declare-datatypes ((array!49171 0))(
  ( (array!49172 (arr!23617 (Array (_ BitVec 32) ValueCell!7811)) (size!24059 (_ BitVec 32))) )
))
(declare-fun lt!386140 () array!49171)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49173 0))(
  ( (array!49174 (arr!23618 (Array (_ BitVec 32) (_ BitVec 64))) (size!24060 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49173)

(declare-fun _values!688 () array!49171)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27049)

(declare-fun zeroValue!654 () V!27049)

(declare-datatypes ((tuple2!10952 0))(
  ( (tuple2!10953 (_1!5487 (_ BitVec 64)) (_2!5487 V!27049)) )
))
(declare-datatypes ((List!16757 0))(
  ( (Nil!16754) (Cons!16753 (h!17884 tuple2!10952) (t!23389 List!16757)) )
))
(declare-datatypes ((ListLongMap!9711 0))(
  ( (ListLongMap!9712 (toList!4871 List!16757)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2878 (array!49173 array!49171 (_ BitVec 32) (_ BitVec 32) V!27049 V!27049 (_ BitVec 32) Int) ListLongMap!9711)

(declare-fun +!2247 (ListLongMap!9711 tuple2!10952) ListLongMap!9711)

(assert (=> b!857456 (= (getCurrentListMapNoExtraKeys!2878 _keys!868 lt!386140 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2247 (getCurrentListMapNoExtraKeys!2878 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10953 k0!854 v!557)))))

(declare-datatypes ((Unit!29163 0))(
  ( (Unit!29164) )
))
(declare-fun lt!386141 () Unit!29163)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!444 (array!49173 array!49171 (_ BitVec 32) (_ BitVec 32) V!27049 V!27049 (_ BitVec 32) (_ BitVec 64) V!27049 (_ BitVec 32) Int) Unit!29163)

(assert (=> b!857456 (= lt!386141 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!444 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857457 () Bool)

(declare-fun res!582526 () Bool)

(declare-fun e!477878 () Bool)

(assert (=> b!857457 (=> (not res!582526) (not e!477878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49173 (_ BitVec 32)) Bool)

(assert (=> b!857457 (= res!582526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857458 () Bool)

(declare-fun res!582530 () Bool)

(assert (=> b!857458 (=> (not res!582530) (not e!477878))))

(declare-datatypes ((List!16758 0))(
  ( (Nil!16755) (Cons!16754 (h!17885 (_ BitVec 64)) (t!23390 List!16758)) )
))
(declare-fun arrayNoDuplicates!0 (array!49173 (_ BitVec 32) List!16758) Bool)

(assert (=> b!857458 (= res!582530 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16755))))

(declare-fun b!857459 () Bool)

(declare-fun res!582534 () Bool)

(assert (=> b!857459 (=> (not res!582534) (not e!477878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857459 (= res!582534 (validKeyInArray!0 k0!854))))

(declare-fun b!857460 () Bool)

(declare-fun res!582529 () Bool)

(assert (=> b!857460 (=> (not res!582529) (not e!477878))))

(assert (=> b!857460 (= res!582529 (and (= (size!24059 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24060 _keys!868) (size!24059 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857461 () Bool)

(declare-fun res!582532 () Bool)

(assert (=> b!857461 (=> (not res!582532) (not e!477878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857461 (= res!582532 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26351 () Bool)

(declare-fun mapRes!26351 () Bool)

(assert (=> mapIsEmpty!26351 mapRes!26351))

(declare-fun b!857462 () Bool)

(declare-fun res!582527 () Bool)

(assert (=> b!857462 (=> (not res!582527) (not e!477878))))

(assert (=> b!857462 (= res!582527 (and (= (select (arr!23618 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857463 () Bool)

(declare-fun res!582528 () Bool)

(assert (=> b!857463 (=> (not res!582528) (not e!477878))))

(assert (=> b!857463 (= res!582528 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24060 _keys!868))))))

(declare-fun res!582533 () Bool)

(assert (=> start!73432 (=> (not res!582533) (not e!477878))))

(assert (=> start!73432 (= res!582533 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24060 _keys!868))))))

(assert (=> start!73432 e!477878))

(assert (=> start!73432 tp_is_empty!16501))

(assert (=> start!73432 true))

(assert (=> start!73432 tp!50600))

(declare-fun array_inv!18768 (array!49173) Bool)

(assert (=> start!73432 (array_inv!18768 _keys!868)))

(declare-fun e!477882 () Bool)

(declare-fun array_inv!18769 (array!49171) Bool)

(assert (=> start!73432 (and (array_inv!18769 _values!688) e!477882)))

(declare-fun b!857464 () Bool)

(declare-fun e!477880 () Bool)

(assert (=> b!857464 (= e!477880 tp_is_empty!16501)))

(declare-fun b!857465 () Bool)

(assert (=> b!857465 (= e!477882 (and e!477880 mapRes!26351))))

(declare-fun condMapEmpty!26351 () Bool)

(declare-fun mapDefault!26351 () ValueCell!7811)

(assert (=> b!857465 (= condMapEmpty!26351 (= (arr!23617 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7811)) mapDefault!26351)))))

(declare-fun mapNonEmpty!26351 () Bool)

(declare-fun tp!50599 () Bool)

(assert (=> mapNonEmpty!26351 (= mapRes!26351 (and tp!50599 e!477879))))

(declare-fun mapKey!26351 () (_ BitVec 32))

(declare-fun mapValue!26351 () ValueCell!7811)

(declare-fun mapRest!26351 () (Array (_ BitVec 32) ValueCell!7811))

(assert (=> mapNonEmpty!26351 (= (arr!23617 _values!688) (store mapRest!26351 mapKey!26351 mapValue!26351))))

(declare-fun b!857466 () Bool)

(assert (=> b!857466 (= e!477878 e!477877)))

(declare-fun res!582531 () Bool)

(assert (=> b!857466 (=> (not res!582531) (not e!477877))))

(assert (=> b!857466 (= res!582531 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386138 () ListLongMap!9711)

(assert (=> b!857466 (= lt!386138 (getCurrentListMapNoExtraKeys!2878 _keys!868 lt!386140 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!857466 (= lt!386140 (array!49172 (store (arr!23617 _values!688) i!612 (ValueCellFull!7811 v!557)) (size!24059 _values!688)))))

(declare-fun lt!386139 () ListLongMap!9711)

(assert (=> b!857466 (= lt!386139 (getCurrentListMapNoExtraKeys!2878 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73432 res!582533) b!857461))

(assert (= (and b!857461 res!582532) b!857460))

(assert (= (and b!857460 res!582529) b!857457))

(assert (= (and b!857457 res!582526) b!857458))

(assert (= (and b!857458 res!582530) b!857463))

(assert (= (and b!857463 res!582528) b!857459))

(assert (= (and b!857459 res!582534) b!857462))

(assert (= (and b!857462 res!582527) b!857466))

(assert (= (and b!857466 res!582531) b!857456))

(assert (= (and b!857465 condMapEmpty!26351) mapIsEmpty!26351))

(assert (= (and b!857465 (not condMapEmpty!26351)) mapNonEmpty!26351))

(get-info :version)

(assert (= (and mapNonEmpty!26351 ((_ is ValueCellFull!7811) mapValue!26351)) b!857455))

(assert (= (and b!857465 ((_ is ValueCellFull!7811) mapDefault!26351)) b!857464))

(assert (= start!73432 b!857465))

(declare-fun m!797673 () Bool)

(assert (=> b!857456 m!797673))

(declare-fun m!797675 () Bool)

(assert (=> b!857456 m!797675))

(assert (=> b!857456 m!797675))

(declare-fun m!797677 () Bool)

(assert (=> b!857456 m!797677))

(declare-fun m!797679 () Bool)

(assert (=> b!857456 m!797679))

(declare-fun m!797681 () Bool)

(assert (=> b!857457 m!797681))

(declare-fun m!797683 () Bool)

(assert (=> b!857466 m!797683))

(declare-fun m!797685 () Bool)

(assert (=> b!857466 m!797685))

(declare-fun m!797687 () Bool)

(assert (=> b!857466 m!797687))

(declare-fun m!797689 () Bool)

(assert (=> mapNonEmpty!26351 m!797689))

(declare-fun m!797691 () Bool)

(assert (=> start!73432 m!797691))

(declare-fun m!797693 () Bool)

(assert (=> start!73432 m!797693))

(declare-fun m!797695 () Bool)

(assert (=> b!857461 m!797695))

(declare-fun m!797697 () Bool)

(assert (=> b!857462 m!797697))

(declare-fun m!797699 () Bool)

(assert (=> b!857459 m!797699))

(declare-fun m!797701 () Bool)

(assert (=> b!857458 m!797701))

(check-sat (not b!857466) b_and!23695 (not b!857457) (not start!73432) tp_is_empty!16501 (not mapNonEmpty!26351) (not b!857458) (not b_next!14365) (not b!857459) (not b!857461) (not b!857456))
(check-sat b_and!23695 (not b_next!14365))
