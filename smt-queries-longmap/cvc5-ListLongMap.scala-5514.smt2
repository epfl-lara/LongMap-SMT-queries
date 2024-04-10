; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72868 () Bool)

(assert start!72868)

(declare-fun b_free!13783 () Bool)

(declare-fun b_next!13783 () Bool)

(assert (=> start!72868 (= b_free!13783 (not b_next!13783))))

(declare-fun tp!48853 () Bool)

(declare-fun b_and!22869 () Bool)

(assert (=> start!72868 (= tp!48853 b_and!22869)))

(declare-fun b!845803 () Bool)

(declare-fun res!574606 () Bool)

(declare-fun e!472131 () Bool)

(assert (=> b!845803 (=> (not res!574606) (not e!472131))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845803 (= res!574606 (validMask!0 mask!1196))))

(declare-fun res!574613 () Bool)

(assert (=> start!72868 (=> (not res!574613) (not e!472131))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48056 0))(
  ( (array!48057 (arr!23059 (Array (_ BitVec 32) (_ BitVec 64))) (size!23499 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48056)

(assert (=> start!72868 (= res!574613 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23499 _keys!868))))))

(assert (=> start!72868 e!472131))

(assert (=> start!72868 true))

(assert (=> start!72868 tp!48853))

(declare-fun array_inv!18324 (array!48056) Bool)

(assert (=> start!72868 (array_inv!18324 _keys!868)))

(declare-datatypes ((V!26273 0))(
  ( (V!26274 (val!8007 Int)) )
))
(declare-datatypes ((ValueCell!7520 0))(
  ( (ValueCellFull!7520 (v!10432 V!26273)) (EmptyCell!7520) )
))
(declare-datatypes ((array!48058 0))(
  ( (array!48059 (arr!23060 (Array (_ BitVec 32) ValueCell!7520)) (size!23500 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48058)

(declare-fun e!472130 () Bool)

(declare-fun array_inv!18325 (array!48058) Bool)

(assert (=> start!72868 (and (array_inv!18325 _values!688) e!472130)))

(declare-fun tp_is_empty!15919 () Bool)

(assert (=> start!72868 tp_is_empty!15919))

(declare-fun b!845804 () Bool)

(declare-fun res!574607 () Bool)

(assert (=> b!845804 (=> (not res!574607) (not e!472131))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!845804 (= res!574607 (and (= (select (arr!23059 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25478 () Bool)

(declare-fun mapRes!25478 () Bool)

(assert (=> mapIsEmpty!25478 mapRes!25478))

(declare-fun b!845805 () Bool)

(declare-fun res!574610 () Bool)

(assert (=> b!845805 (=> (not res!574610) (not e!472131))))

(declare-datatypes ((List!16320 0))(
  ( (Nil!16317) (Cons!16316 (h!17447 (_ BitVec 64)) (t!22691 List!16320)) )
))
(declare-fun arrayNoDuplicates!0 (array!48056 (_ BitVec 32) List!16320) Bool)

(assert (=> b!845805 (= res!574610 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16317))))

(declare-fun b!845806 () Bool)

(declare-fun res!574609 () Bool)

(assert (=> b!845806 (=> (not res!574609) (not e!472131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48056 (_ BitVec 32)) Bool)

(assert (=> b!845806 (= res!574609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845807 () Bool)

(declare-fun res!574612 () Bool)

(assert (=> b!845807 (=> (not res!574612) (not e!472131))))

(assert (=> b!845807 (= res!574612 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23499 _keys!868))))))

(declare-fun b!845808 () Bool)

(declare-fun res!574608 () Bool)

(assert (=> b!845808 (=> (not res!574608) (not e!472131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845808 (= res!574608 (validKeyInArray!0 k!854))))

(declare-fun b!845809 () Bool)

(assert (=> b!845809 (= e!472131 false)))

(declare-datatypes ((tuple2!10458 0))(
  ( (tuple2!10459 (_1!5240 (_ BitVec 64)) (_2!5240 V!26273)) )
))
(declare-datatypes ((List!16321 0))(
  ( (Nil!16318) (Cons!16317 (h!17448 tuple2!10458) (t!22692 List!16321)) )
))
(declare-datatypes ((ListLongMap!9227 0))(
  ( (ListLongMap!9228 (toList!4629 List!16321)) )
))
(declare-fun lt!381445 () ListLongMap!9227)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26273)

(declare-fun zeroValue!654 () V!26273)

(declare-fun getCurrentListMapNoExtraKeys!2614 (array!48056 array!48058 (_ BitVec 32) (_ BitVec 32) V!26273 V!26273 (_ BitVec 32) Int) ListLongMap!9227)

(assert (=> b!845809 (= lt!381445 (getCurrentListMapNoExtraKeys!2614 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845810 () Bool)

(declare-fun res!574611 () Bool)

(assert (=> b!845810 (=> (not res!574611) (not e!472131))))

(assert (=> b!845810 (= res!574611 (and (= (size!23500 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23499 _keys!868) (size!23500 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845811 () Bool)

(declare-fun e!472132 () Bool)

(assert (=> b!845811 (= e!472130 (and e!472132 mapRes!25478))))

(declare-fun condMapEmpty!25478 () Bool)

(declare-fun mapDefault!25478 () ValueCell!7520)

