; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73558 () Bool)

(assert start!73558)

(declare-fun b_free!14305 () Bool)

(declare-fun b_next!14305 () Bool)

(assert (=> start!73558 (= b_free!14305 (not b_next!14305))))

(declare-fun tp!50420 () Bool)

(declare-fun b_and!23671 () Bool)

(assert (=> start!73558 (= tp!50420 b_and!23671)))

(declare-fun b!857517 () Bool)

(declare-fun e!478067 () Bool)

(declare-fun e!478069 () Bool)

(assert (=> b!857517 (= e!478067 e!478069)))

(declare-fun res!582175 () Bool)

(assert (=> b!857517 (=> (not res!582175) (not e!478069))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857517 (= res!582175 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26969 0))(
  ( (V!26970 (val!8268 Int)) )
))
(declare-datatypes ((tuple2!10822 0))(
  ( (tuple2!10823 (_1!5422 (_ BitVec 64)) (_2!5422 V!26969)) )
))
(declare-datatypes ((List!16667 0))(
  ( (Nil!16664) (Cons!16663 (h!17800 tuple2!10822) (t!23300 List!16667)) )
))
(declare-datatypes ((ListLongMap!9593 0))(
  ( (ListLongMap!9594 (toList!4812 List!16667)) )
))
(declare-fun lt!386375 () ListLongMap!9593)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49121 0))(
  ( (array!49122 (arr!23587 (Array (_ BitVec 32) (_ BitVec 64))) (size!24028 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49121)

(declare-datatypes ((ValueCell!7781 0))(
  ( (ValueCellFull!7781 (v!10693 V!26969)) (EmptyCell!7781) )
))
(declare-datatypes ((array!49123 0))(
  ( (array!49124 (arr!23588 (Array (_ BitVec 32) ValueCell!7781)) (size!24029 (_ BitVec 32))) )
))
(declare-fun lt!386377 () array!49123)

(declare-fun minValue!654 () V!26969)

(declare-fun zeroValue!654 () V!26969)

(declare-fun getCurrentListMapNoExtraKeys!2868 (array!49121 array!49123 (_ BitVec 32) (_ BitVec 32) V!26969 V!26969 (_ BitVec 32) Int) ListLongMap!9593)

(assert (=> b!857517 (= lt!386375 (getCurrentListMapNoExtraKeys!2868 _keys!868 lt!386377 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26969)

(declare-fun _values!688 () array!49123)

(assert (=> b!857517 (= lt!386377 (array!49124 (store (arr!23588 _values!688) i!612 (ValueCellFull!7781 v!557)) (size!24029 _values!688)))))

(declare-fun lt!386376 () ListLongMap!9593)

(assert (=> b!857517 (= lt!386376 (getCurrentListMapNoExtraKeys!2868 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857518 () Bool)

(declare-fun res!582178 () Bool)

(assert (=> b!857518 (=> (not res!582178) (not e!478067))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857518 (= res!582178 (validKeyInArray!0 k0!854))))

(declare-fun b!857519 () Bool)

(declare-fun e!478072 () Bool)

(declare-fun tp_is_empty!16441 () Bool)

(assert (=> b!857519 (= e!478072 tp_is_empty!16441)))

(declare-fun b!857520 () Bool)

(declare-fun res!582172 () Bool)

(assert (=> b!857520 (=> (not res!582172) (not e!478067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49121 (_ BitVec 32)) Bool)

(assert (=> b!857520 (= res!582172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857521 () Bool)

(declare-fun res!582174 () Bool)

(assert (=> b!857521 (=> (not res!582174) (not e!478067))))

(declare-datatypes ((List!16668 0))(
  ( (Nil!16665) (Cons!16664 (h!17801 (_ BitVec 64)) (t!23301 List!16668)) )
))
(declare-fun arrayNoDuplicates!0 (array!49121 (_ BitVec 32) List!16668) Bool)

(assert (=> b!857521 (= res!582174 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16665))))

(declare-fun b!857522 () Bool)

(declare-fun res!582177 () Bool)

(assert (=> b!857522 (=> (not res!582177) (not e!478067))))

(assert (=> b!857522 (= res!582177 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24028 _keys!868))))))

(declare-fun mapNonEmpty!26261 () Bool)

(declare-fun mapRes!26261 () Bool)

(declare-fun tp!50419 () Bool)

(assert (=> mapNonEmpty!26261 (= mapRes!26261 (and tp!50419 e!478072))))

(declare-fun mapKey!26261 () (_ BitVec 32))

(declare-fun mapValue!26261 () ValueCell!7781)

(declare-fun mapRest!26261 () (Array (_ BitVec 32) ValueCell!7781))

(assert (=> mapNonEmpty!26261 (= (arr!23588 _values!688) (store mapRest!26261 mapKey!26261 mapValue!26261))))

(declare-fun mapIsEmpty!26261 () Bool)

(assert (=> mapIsEmpty!26261 mapRes!26261))

(declare-fun b!857523 () Bool)

(declare-fun res!582171 () Bool)

(assert (=> b!857523 (=> (not res!582171) (not e!478067))))

(assert (=> b!857523 (= res!582171 (and (= (select (arr!23587 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!582176 () Bool)

(assert (=> start!73558 (=> (not res!582176) (not e!478067))))

(assert (=> start!73558 (= res!582176 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24028 _keys!868))))))

(assert (=> start!73558 e!478067))

(assert (=> start!73558 tp_is_empty!16441))

(assert (=> start!73558 true))

(assert (=> start!73558 tp!50420))

(declare-fun array_inv!18740 (array!49121) Bool)

(assert (=> start!73558 (array_inv!18740 _keys!868)))

(declare-fun e!478068 () Bool)

(declare-fun array_inv!18741 (array!49123) Bool)

(assert (=> start!73558 (and (array_inv!18741 _values!688) e!478068)))

(declare-fun b!857524 () Bool)

(assert (=> b!857524 (= e!478069 (not true))))

(declare-fun +!2225 (ListLongMap!9593 tuple2!10822) ListLongMap!9593)

(assert (=> b!857524 (= (getCurrentListMapNoExtraKeys!2868 _keys!868 lt!386377 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2225 (getCurrentListMapNoExtraKeys!2868 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10823 k0!854 v!557)))))

(declare-datatypes ((Unit!29206 0))(
  ( (Unit!29207) )
))
(declare-fun lt!386378 () Unit!29206)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!423 (array!49121 array!49123 (_ BitVec 32) (_ BitVec 32) V!26969 V!26969 (_ BitVec 32) (_ BitVec 64) V!26969 (_ BitVec 32) Int) Unit!29206)

(assert (=> b!857524 (= lt!386378 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!423 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857525 () Bool)

(declare-fun res!582170 () Bool)

(assert (=> b!857525 (=> (not res!582170) (not e!478067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857525 (= res!582170 (validMask!0 mask!1196))))

(declare-fun b!857526 () Bool)

(declare-fun e!478071 () Bool)

(assert (=> b!857526 (= e!478071 tp_is_empty!16441)))

(declare-fun b!857527 () Bool)

(declare-fun res!582173 () Bool)

(assert (=> b!857527 (=> (not res!582173) (not e!478067))))

(assert (=> b!857527 (= res!582173 (and (= (size!24029 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24028 _keys!868) (size!24029 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857528 () Bool)

(assert (=> b!857528 (= e!478068 (and e!478071 mapRes!26261))))

(declare-fun condMapEmpty!26261 () Bool)

(declare-fun mapDefault!26261 () ValueCell!7781)

(assert (=> b!857528 (= condMapEmpty!26261 (= (arr!23588 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7781)) mapDefault!26261)))))

(assert (= (and start!73558 res!582176) b!857525))

(assert (= (and b!857525 res!582170) b!857527))

(assert (= (and b!857527 res!582173) b!857520))

(assert (= (and b!857520 res!582172) b!857521))

(assert (= (and b!857521 res!582174) b!857522))

(assert (= (and b!857522 res!582177) b!857518))

(assert (= (and b!857518 res!582178) b!857523))

(assert (= (and b!857523 res!582171) b!857517))

(assert (= (and b!857517 res!582175) b!857524))

(assert (= (and b!857528 condMapEmpty!26261) mapIsEmpty!26261))

(assert (= (and b!857528 (not condMapEmpty!26261)) mapNonEmpty!26261))

(get-info :version)

(assert (= (and mapNonEmpty!26261 ((_ is ValueCellFull!7781) mapValue!26261)) b!857519))

(assert (= (and b!857528 ((_ is ValueCellFull!7781) mapDefault!26261)) b!857526))

(assert (= start!73558 b!857528))

(declare-fun m!798821 () Bool)

(assert (=> b!857523 m!798821))

(declare-fun m!798823 () Bool)

(assert (=> b!857525 m!798823))

(declare-fun m!798825 () Bool)

(assert (=> b!857520 m!798825))

(declare-fun m!798827 () Bool)

(assert (=> b!857521 m!798827))

(declare-fun m!798829 () Bool)

(assert (=> b!857524 m!798829))

(declare-fun m!798831 () Bool)

(assert (=> b!857524 m!798831))

(assert (=> b!857524 m!798831))

(declare-fun m!798833 () Bool)

(assert (=> b!857524 m!798833))

(declare-fun m!798835 () Bool)

(assert (=> b!857524 m!798835))

(declare-fun m!798837 () Bool)

(assert (=> b!857517 m!798837))

(declare-fun m!798839 () Bool)

(assert (=> b!857517 m!798839))

(declare-fun m!798841 () Bool)

(assert (=> b!857517 m!798841))

(declare-fun m!798843 () Bool)

(assert (=> b!857518 m!798843))

(declare-fun m!798845 () Bool)

(assert (=> mapNonEmpty!26261 m!798845))

(declare-fun m!798847 () Bool)

(assert (=> start!73558 m!798847))

(declare-fun m!798849 () Bool)

(assert (=> start!73558 m!798849))

(check-sat (not b!857525) (not b!857524) (not b_next!14305) tp_is_empty!16441 (not start!73558) (not b!857521) (not b!857520) (not b!857517) b_and!23671 (not b!857518) (not mapNonEmpty!26261))
(check-sat b_and!23671 (not b_next!14305))
