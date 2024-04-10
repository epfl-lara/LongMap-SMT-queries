; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72860 () Bool)

(assert start!72860)

(declare-fun b_free!13775 () Bool)

(declare-fun b_next!13775 () Bool)

(assert (=> start!72860 (= b_free!13775 (not b_next!13775))))

(declare-fun tp!48829 () Bool)

(declare-fun b_and!22861 () Bool)

(assert (=> start!72860 (= tp!48829 b_and!22861)))

(declare-fun b!845671 () Bool)

(declare-fun res!574510 () Bool)

(declare-fun e!472072 () Bool)

(assert (=> b!845671 (=> (not res!574510) (not e!472072))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48040 0))(
  ( (array!48041 (arr!23051 (Array (_ BitVec 32) (_ BitVec 64))) (size!23491 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48040)

(assert (=> b!845671 (= res!574510 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23491 _keys!868))))))

(declare-fun b!845672 () Bool)

(declare-fun e!472069 () Bool)

(declare-fun tp_is_empty!15911 () Bool)

(assert (=> b!845672 (= e!472069 tp_is_empty!15911)))

(declare-fun b!845673 () Bool)

(declare-fun res!574514 () Bool)

(assert (=> b!845673 (=> (not res!574514) (not e!472072))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845673 (= res!574514 (validMask!0 mask!1196))))

(declare-fun b!845674 () Bool)

(declare-fun res!574511 () Bool)

(assert (=> b!845674 (=> (not res!574511) (not e!472072))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!845674 (= res!574511 (and (= (select (arr!23051 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25466 () Bool)

(declare-fun mapRes!25466 () Bool)

(assert (=> mapIsEmpty!25466 mapRes!25466))

(declare-fun res!574512 () Bool)

(assert (=> start!72860 (=> (not res!574512) (not e!472072))))

(assert (=> start!72860 (= res!574512 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23491 _keys!868))))))

(assert (=> start!72860 e!472072))

(assert (=> start!72860 true))

(assert (=> start!72860 tp!48829))

(declare-fun array_inv!18318 (array!48040) Bool)

(assert (=> start!72860 (array_inv!18318 _keys!868)))

(declare-datatypes ((V!26261 0))(
  ( (V!26262 (val!8003 Int)) )
))
(declare-datatypes ((ValueCell!7516 0))(
  ( (ValueCellFull!7516 (v!10428 V!26261)) (EmptyCell!7516) )
))
(declare-datatypes ((array!48042 0))(
  ( (array!48043 (arr!23052 (Array (_ BitVec 32) ValueCell!7516)) (size!23492 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48042)

(declare-fun e!472068 () Bool)

(declare-fun array_inv!18319 (array!48042) Bool)

(assert (=> start!72860 (and (array_inv!18319 _values!688) e!472068)))

(assert (=> start!72860 tp_is_empty!15911))

(declare-fun b!845675 () Bool)

(declare-fun res!574517 () Bool)

(assert (=> b!845675 (=> (not res!574517) (not e!472072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845675 (= res!574517 (validKeyInArray!0 k!854))))

(declare-fun b!845676 () Bool)

(declare-fun res!574516 () Bool)

(assert (=> b!845676 (=> (not res!574516) (not e!472072))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845676 (= res!574516 (and (= (size!23492 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23491 _keys!868) (size!23492 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845677 () Bool)

(assert (=> b!845677 (= e!472072 false)))

(declare-datatypes ((tuple2!10450 0))(
  ( (tuple2!10451 (_1!5236 (_ BitVec 64)) (_2!5236 V!26261)) )
))
(declare-datatypes ((List!16312 0))(
  ( (Nil!16309) (Cons!16308 (h!17439 tuple2!10450) (t!22683 List!16312)) )
))
(declare-datatypes ((ListLongMap!9219 0))(
  ( (ListLongMap!9220 (toList!4625 List!16312)) )
))
(declare-fun lt!381433 () ListLongMap!9219)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26261)

(declare-fun zeroValue!654 () V!26261)

(declare-fun getCurrentListMapNoExtraKeys!2610 (array!48040 array!48042 (_ BitVec 32) (_ BitVec 32) V!26261 V!26261 (_ BitVec 32) Int) ListLongMap!9219)

(assert (=> b!845677 (= lt!381433 (getCurrentListMapNoExtraKeys!2610 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845678 () Bool)

(declare-fun res!574515 () Bool)

(assert (=> b!845678 (=> (not res!574515) (not e!472072))))

(declare-datatypes ((List!16313 0))(
  ( (Nil!16310) (Cons!16309 (h!17440 (_ BitVec 64)) (t!22684 List!16313)) )
))
(declare-fun arrayNoDuplicates!0 (array!48040 (_ BitVec 32) List!16313) Bool)

(assert (=> b!845678 (= res!574515 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16310))))

(declare-fun b!845679 () Bool)

(declare-fun res!574513 () Bool)

(assert (=> b!845679 (=> (not res!574513) (not e!472072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48040 (_ BitVec 32)) Bool)

(assert (=> b!845679 (= res!574513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845680 () Bool)

(assert (=> b!845680 (= e!472068 (and e!472069 mapRes!25466))))

(declare-fun condMapEmpty!25466 () Bool)

(declare-fun mapDefault!25466 () ValueCell!7516)

