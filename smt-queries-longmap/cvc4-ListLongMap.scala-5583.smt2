; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73286 () Bool)

(assert start!73286)

(declare-fun b_free!14201 () Bool)

(declare-fun b_next!14201 () Bool)

(assert (=> start!73286 (= b_free!14201 (not b_next!14201))))

(declare-fun tp!50107 () Bool)

(declare-fun b_and!23557 () Bool)

(assert (=> start!73286 (= tp!50107 b_and!23557)))

(declare-fun b!854842 () Bool)

(declare-fun res!580529 () Bool)

(declare-fun e!476650 () Bool)

(assert (=> b!854842 (=> (not res!580529) (not e!476650))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854842 (= res!580529 (validMask!0 mask!1196))))

(declare-fun b!854843 () Bool)

(declare-fun res!580526 () Bool)

(assert (=> b!854843 (=> (not res!580526) (not e!476650))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48870 0))(
  ( (array!48871 (arr!23466 (Array (_ BitVec 32) (_ BitVec 64))) (size!23906 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48870)

(declare-datatypes ((V!26829 0))(
  ( (V!26830 (val!8216 Int)) )
))
(declare-datatypes ((ValueCell!7729 0))(
  ( (ValueCellFull!7729 (v!10641 V!26829)) (EmptyCell!7729) )
))
(declare-datatypes ((array!48872 0))(
  ( (array!48873 (arr!23467 (Array (_ BitVec 32) ValueCell!7729)) (size!23907 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48872)

(assert (=> b!854843 (= res!580526 (and (= (size!23907 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23906 _keys!868) (size!23907 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854844 () Bool)

(declare-fun res!580527 () Bool)

(assert (=> b!854844 (=> (not res!580527) (not e!476650))))

(declare-datatypes ((List!16634 0))(
  ( (Nil!16631) (Cons!16630 (h!17761 (_ BitVec 64)) (t!23275 List!16634)) )
))
(declare-fun arrayNoDuplicates!0 (array!48870 (_ BitVec 32) List!16634) Bool)

(assert (=> b!854844 (= res!580527 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16631))))

(declare-fun b!854845 () Bool)

(declare-fun res!580523 () Bool)

(assert (=> b!854845 (=> (not res!580523) (not e!476650))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854845 (= res!580523 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23906 _keys!868))))))

(declare-fun mapIsEmpty!26105 () Bool)

(declare-fun mapRes!26105 () Bool)

(assert (=> mapIsEmpty!26105 mapRes!26105))

(declare-fun mapNonEmpty!26105 () Bool)

(declare-fun tp!50106 () Bool)

(declare-fun e!476649 () Bool)

(assert (=> mapNonEmpty!26105 (= mapRes!26105 (and tp!50106 e!476649))))

(declare-fun mapRest!26105 () (Array (_ BitVec 32) ValueCell!7729))

(declare-fun mapKey!26105 () (_ BitVec 32))

(declare-fun mapValue!26105 () ValueCell!7729)

(assert (=> mapNonEmpty!26105 (= (arr!23467 _values!688) (store mapRest!26105 mapKey!26105 mapValue!26105))))

(declare-fun res!580528 () Bool)

(assert (=> start!73286 (=> (not res!580528) (not e!476650))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73286 (= res!580528 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23906 _keys!868))))))

(assert (=> start!73286 e!476650))

(declare-fun tp_is_empty!16337 () Bool)

(assert (=> start!73286 tp_is_empty!16337))

(assert (=> start!73286 true))

(assert (=> start!73286 tp!50107))

(declare-fun array_inv!18594 (array!48870) Bool)

(assert (=> start!73286 (array_inv!18594 _keys!868)))

(declare-fun e!476652 () Bool)

(declare-fun array_inv!18595 (array!48872) Bool)

(assert (=> start!73286 (and (array_inv!18595 _values!688) e!476652)))

(declare-fun b!854846 () Bool)

(assert (=> b!854846 (= e!476650 false)))

(declare-datatypes ((tuple2!10820 0))(
  ( (tuple2!10821 (_1!5421 (_ BitVec 64)) (_2!5421 V!26829)) )
))
(declare-datatypes ((List!16635 0))(
  ( (Nil!16632) (Cons!16631 (h!17762 tuple2!10820) (t!23276 List!16635)) )
))
(declare-datatypes ((ListLongMap!9589 0))(
  ( (ListLongMap!9590 (toList!4810 List!16635)) )
))
(declare-fun lt!385590 () ListLongMap!9589)

(declare-fun v!557 () V!26829)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26829)

(declare-fun zeroValue!654 () V!26829)

(declare-fun getCurrentListMapNoExtraKeys!2791 (array!48870 array!48872 (_ BitVec 32) (_ BitVec 32) V!26829 V!26829 (_ BitVec 32) Int) ListLongMap!9589)

(assert (=> b!854846 (= lt!385590 (getCurrentListMapNoExtraKeys!2791 _keys!868 (array!48873 (store (arr!23467 _values!688) i!612 (ValueCellFull!7729 v!557)) (size!23907 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385591 () ListLongMap!9589)

(assert (=> b!854846 (= lt!385591 (getCurrentListMapNoExtraKeys!2791 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854847 () Bool)

(declare-fun res!580522 () Bool)

(assert (=> b!854847 (=> (not res!580522) (not e!476650))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!854847 (= res!580522 (and (= (select (arr!23466 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!854848 () Bool)

(declare-fun res!580525 () Bool)

(assert (=> b!854848 (=> (not res!580525) (not e!476650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854848 (= res!580525 (validKeyInArray!0 k!854))))

(declare-fun b!854849 () Bool)

(declare-fun e!476651 () Bool)

(assert (=> b!854849 (= e!476652 (and e!476651 mapRes!26105))))

(declare-fun condMapEmpty!26105 () Bool)

(declare-fun mapDefault!26105 () ValueCell!7729)

