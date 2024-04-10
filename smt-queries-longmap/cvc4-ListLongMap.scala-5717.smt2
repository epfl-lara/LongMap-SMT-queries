; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74090 () Bool)

(assert start!74090)

(declare-fun b_free!14999 () Bool)

(declare-fun b_next!14999 () Bool)

(assert (=> start!74090 (= b_free!14999 (not b_next!14999))))

(declare-fun tp!52509 () Bool)

(declare-fun b_and!24751 () Bool)

(assert (=> start!74090 (= tp!52509 b_and!24751)))

(declare-fun b!871708 () Bool)

(declare-fun e!485335 () Bool)

(declare-fun tp_is_empty!17141 () Bool)

(assert (=> b!871708 (= e!485335 tp_is_empty!17141)))

(declare-fun b!871709 () Bool)

(declare-fun e!485334 () Bool)

(assert (=> b!871709 (= e!485334 tp_is_empty!17141)))

(declare-fun mapNonEmpty!27311 () Bool)

(declare-fun mapRes!27311 () Bool)

(declare-fun tp!52510 () Bool)

(assert (=> mapNonEmpty!27311 (= mapRes!27311 (and tp!52510 e!485334))))

(declare-datatypes ((V!27901 0))(
  ( (V!27902 (val!8618 Int)) )
))
(declare-datatypes ((ValueCell!8131 0))(
  ( (ValueCellFull!8131 (v!11043 V!27901)) (EmptyCell!8131) )
))
(declare-fun mapValue!27311 () ValueCell!8131)

(declare-fun mapKey!27311 () (_ BitVec 32))

(declare-fun mapRest!27311 () (Array (_ BitVec 32) ValueCell!8131))

(declare-datatypes ((array!50420 0))(
  ( (array!50421 (arr!24241 (Array (_ BitVec 32) ValueCell!8131)) (size!24681 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50420)

(assert (=> mapNonEmpty!27311 (= (arr!24241 _values!688) (store mapRest!27311 mapKey!27311 mapValue!27311))))

(declare-fun b!871710 () Bool)

(declare-fun res!592529 () Bool)

(declare-fun e!485336 () Bool)

(assert (=> b!871710 (=> (not res!592529) (not e!485336))))

(declare-datatypes ((array!50422 0))(
  ( (array!50423 (arr!24242 (Array (_ BitVec 32) (_ BitVec 64))) (size!24682 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50422)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50422 (_ BitVec 32)) Bool)

(assert (=> b!871710 (= res!592529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871711 () Bool)

(declare-fun res!592535 () Bool)

(assert (=> b!871711 (=> (not res!592535) (not e!485336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871711 (= res!592535 (validMask!0 mask!1196))))

(declare-fun b!871712 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!871712 (= e!485336 (and (not (= from!1053 i!612)) (bvsge from!1053 i!612)))))

(declare-datatypes ((tuple2!11452 0))(
  ( (tuple2!11453 (_1!5737 (_ BitVec 64)) (_2!5737 V!27901)) )
))
(declare-datatypes ((List!17240 0))(
  ( (Nil!17237) (Cons!17236 (h!18367 tuple2!11452) (t!24277 List!17240)) )
))
(declare-datatypes ((ListLongMap!10221 0))(
  ( (ListLongMap!10222 (toList!5126 List!17240)) )
))
(declare-fun lt!395527 () ListLongMap!10221)

(declare-fun v!557 () V!27901)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27901)

(declare-fun zeroValue!654 () V!27901)

(declare-fun getCurrentListMapNoExtraKeys!3095 (array!50422 array!50420 (_ BitVec 32) (_ BitVec 32) V!27901 V!27901 (_ BitVec 32) Int) ListLongMap!10221)

(assert (=> b!871712 (= lt!395527 (getCurrentListMapNoExtraKeys!3095 _keys!868 (array!50421 (store (arr!24241 _values!688) i!612 (ValueCellFull!8131 v!557)) (size!24681 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395526 () ListLongMap!10221)

(assert (=> b!871712 (= lt!395526 (getCurrentListMapNoExtraKeys!3095 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871713 () Bool)

(declare-fun res!592530 () Bool)

(assert (=> b!871713 (=> (not res!592530) (not e!485336))))

(assert (=> b!871713 (= res!592530 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24682 _keys!868))))))

(declare-fun b!871714 () Bool)

(declare-fun res!592534 () Bool)

(assert (=> b!871714 (=> (not res!592534) (not e!485336))))

(declare-datatypes ((List!17241 0))(
  ( (Nil!17238) (Cons!17237 (h!18368 (_ BitVec 64)) (t!24278 List!17241)) )
))
(declare-fun arrayNoDuplicates!0 (array!50422 (_ BitVec 32) List!17241) Bool)

(assert (=> b!871714 (= res!592534 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17238))))

(declare-fun b!871716 () Bool)

(declare-fun e!485337 () Bool)

(assert (=> b!871716 (= e!485337 (and e!485335 mapRes!27311))))

(declare-fun condMapEmpty!27311 () Bool)

(declare-fun mapDefault!27311 () ValueCell!8131)

