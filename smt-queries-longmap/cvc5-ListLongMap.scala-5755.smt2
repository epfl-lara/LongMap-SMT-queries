; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74358 () Bool)

(assert start!74358)

(declare-fun b_free!15121 () Bool)

(declare-fun b_next!15121 () Bool)

(assert (=> start!74358 (= b_free!15121 (not b_next!15121))))

(declare-fun tp!53037 () Bool)

(declare-fun b_and!24897 () Bool)

(assert (=> start!74358 (= tp!53037 b_and!24897)))

(declare-fun b!875242 () Bool)

(declare-fun res!594818 () Bool)

(declare-fun e!487253 () Bool)

(assert (=> b!875242 (=> (not res!594818) (not e!487253))))

(declare-datatypes ((array!50856 0))(
  ( (array!50857 (arr!24456 (Array (_ BitVec 32) (_ BitVec 64))) (size!24896 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50856)

(declare-datatypes ((List!17354 0))(
  ( (Nil!17351) (Cons!17350 (h!18481 (_ BitVec 64)) (t!24395 List!17354)) )
))
(declare-fun arrayNoDuplicates!0 (array!50856 (_ BitVec 32) List!17354) Bool)

(assert (=> b!875242 (= res!594818 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17351))))

(declare-fun b!875243 () Bool)

(declare-datatypes ((V!28201 0))(
  ( (V!28202 (val!8730 Int)) )
))
(declare-fun v!557 () V!28201)

(declare-datatypes ((tuple2!11530 0))(
  ( (tuple2!11531 (_1!5776 (_ BitVec 64)) (_2!5776 V!28201)) )
))
(declare-datatypes ((List!17355 0))(
  ( (Nil!17352) (Cons!17351 (h!18482 tuple2!11530) (t!24396 List!17355)) )
))
(declare-datatypes ((ListLongMap!10299 0))(
  ( (ListLongMap!10300 (toList!5165 List!17355)) )
))
(declare-fun call!38588 () ListLongMap!10299)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun call!38589 () ListLongMap!10299)

(declare-fun e!487258 () Bool)

(declare-fun +!2469 (ListLongMap!10299 tuple2!11530) ListLongMap!10299)

(assert (=> b!875243 (= e!487258 (= call!38589 (+!2469 call!38588 (tuple2!11531 k!854 v!557))))))

(declare-fun b!875244 () Bool)

(declare-fun res!594817 () Bool)

(assert (=> b!875244 (=> (not res!594817) (not e!487253))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!875244 (= res!594817 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24896 _keys!868))))))

(declare-fun b!875245 () Bool)

(declare-fun res!594815 () Bool)

(assert (=> b!875245 (=> (not res!594815) (not e!487253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875245 (= res!594815 (validKeyInArray!0 k!854))))

(declare-fun b!875246 () Bool)

(assert (=> b!875246 (= e!487258 (= call!38589 call!38588))))

(declare-fun b!875247 () Bool)

(declare-fun res!594811 () Bool)

(assert (=> b!875247 (=> (not res!594811) (not e!487253))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!875247 (= res!594811 (and (= (select (arr!24456 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!594814 () Bool)

(assert (=> start!74358 (=> (not res!594814) (not e!487253))))

(assert (=> start!74358 (= res!594814 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24896 _keys!868))))))

(assert (=> start!74358 e!487253))

(declare-fun tp_is_empty!17365 () Bool)

(assert (=> start!74358 tp_is_empty!17365))

(assert (=> start!74358 true))

(assert (=> start!74358 tp!53037))

(declare-fun array_inv!19280 (array!50856) Bool)

(assert (=> start!74358 (array_inv!19280 _keys!868)))

(declare-datatypes ((ValueCell!8243 0))(
  ( (ValueCellFull!8243 (v!11159 V!28201)) (EmptyCell!8243) )
))
(declare-datatypes ((array!50858 0))(
  ( (array!50859 (arr!24457 (Array (_ BitVec 32) ValueCell!8243)) (size!24897 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50858)

(declare-fun e!487257 () Bool)

(declare-fun array_inv!19281 (array!50858) Bool)

(assert (=> start!74358 (and (array_inv!19281 _values!688) e!487257)))

(declare-fun mapIsEmpty!27656 () Bool)

(declare-fun mapRes!27656 () Bool)

(assert (=> mapIsEmpty!27656 mapRes!27656))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28201)

(declare-fun zeroValue!654 () V!28201)

(declare-fun bm!38585 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3132 (array!50856 array!50858 (_ BitVec 32) (_ BitVec 32) V!28201 V!28201 (_ BitVec 32) Int) ListLongMap!10299)

(assert (=> bm!38585 (= call!38588 (getCurrentListMapNoExtraKeys!3132 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875248 () Bool)

(declare-fun res!594816 () Bool)

(assert (=> b!875248 (=> (not res!594816) (not e!487253))))

(assert (=> b!875248 (= res!594816 (and (= (size!24897 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24896 _keys!868) (size!24897 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875249 () Bool)

(declare-fun res!594812 () Bool)

(assert (=> b!875249 (=> (not res!594812) (not e!487253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875249 (= res!594812 (validMask!0 mask!1196))))

(declare-fun b!875250 () Bool)

(declare-fun e!487255 () Bool)

(assert (=> b!875250 (= e!487257 (and e!487255 mapRes!27656))))

(declare-fun condMapEmpty!27656 () Bool)

(declare-fun mapDefault!27656 () ValueCell!8243)

