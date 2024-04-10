; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72878 () Bool)

(assert start!72878)

(declare-fun b_free!13793 () Bool)

(declare-fun b_next!13793 () Bool)

(assert (=> start!72878 (= b_free!13793 (not b_next!13793))))

(declare-fun tp!48882 () Bool)

(declare-fun b_and!22879 () Bool)

(assert (=> start!72878 (= tp!48882 b_and!22879)))

(declare-fun res!574729 () Bool)

(declare-fun e!472204 () Bool)

(assert (=> start!72878 (=> (not res!574729) (not e!472204))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48076 0))(
  ( (array!48077 (arr!23069 (Array (_ BitVec 32) (_ BitVec 64))) (size!23509 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48076)

(assert (=> start!72878 (= res!574729 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23509 _keys!868))))))

(assert (=> start!72878 e!472204))

(assert (=> start!72878 true))

(assert (=> start!72878 tp!48882))

(declare-fun array_inv!18330 (array!48076) Bool)

(assert (=> start!72878 (array_inv!18330 _keys!868)))

(declare-datatypes ((V!26285 0))(
  ( (V!26286 (val!8012 Int)) )
))
(declare-datatypes ((ValueCell!7525 0))(
  ( (ValueCellFull!7525 (v!10437 V!26285)) (EmptyCell!7525) )
))
(declare-datatypes ((array!48078 0))(
  ( (array!48079 (arr!23070 (Array (_ BitVec 32) ValueCell!7525)) (size!23510 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48078)

(declare-fun e!472203 () Bool)

(declare-fun array_inv!18331 (array!48078) Bool)

(assert (=> start!72878 (and (array_inv!18331 _values!688) e!472203)))

(declare-fun tp_is_empty!15929 () Bool)

(assert (=> start!72878 tp_is_empty!15929))

(declare-fun b!845968 () Bool)

(declare-fun res!574732 () Bool)

(assert (=> b!845968 (=> (not res!574732) (not e!472204))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!845968 (= res!574732 (and (= (select (arr!23069 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25493 () Bool)

(declare-fun mapRes!25493 () Bool)

(assert (=> mapIsEmpty!25493 mapRes!25493))

(declare-fun b!845969 () Bool)

(declare-fun e!472205 () Bool)

(assert (=> b!845969 (= e!472205 tp_is_empty!15929)))

(declare-fun b!845970 () Bool)

(declare-fun res!574733 () Bool)

(assert (=> b!845970 (=> (not res!574733) (not e!472204))))

(assert (=> b!845970 (= res!574733 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23509 _keys!868))))))

(declare-fun b!845971 () Bool)

(declare-fun res!574726 () Bool)

(assert (=> b!845971 (=> (not res!574726) (not e!472204))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845971 (= res!574726 (validMask!0 mask!1196))))

(declare-fun b!845972 () Bool)

(declare-fun res!574727 () Bool)

(assert (=> b!845972 (=> (not res!574727) (not e!472204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48076 (_ BitVec 32)) Bool)

(assert (=> b!845972 (= res!574727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845973 () Bool)

(declare-fun res!574731 () Bool)

(assert (=> b!845973 (=> (not res!574731) (not e!472204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845973 (= res!574731 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!25493 () Bool)

(declare-fun tp!48883 () Bool)

(declare-fun e!472206 () Bool)

(assert (=> mapNonEmpty!25493 (= mapRes!25493 (and tp!48883 e!472206))))

(declare-fun mapKey!25493 () (_ BitVec 32))

(declare-fun mapRest!25493 () (Array (_ BitVec 32) ValueCell!7525))

(declare-fun mapValue!25493 () ValueCell!7525)

(assert (=> mapNonEmpty!25493 (= (arr!23070 _values!688) (store mapRest!25493 mapKey!25493 mapValue!25493))))

(declare-fun b!845974 () Bool)

(assert (=> b!845974 (= e!472204 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26285)

(declare-fun zeroValue!654 () V!26285)

(declare-datatypes ((tuple2!10466 0))(
  ( (tuple2!10467 (_1!5244 (_ BitVec 64)) (_2!5244 V!26285)) )
))
(declare-datatypes ((List!16328 0))(
  ( (Nil!16325) (Cons!16324 (h!17455 tuple2!10466) (t!22699 List!16328)) )
))
(declare-datatypes ((ListLongMap!9235 0))(
  ( (ListLongMap!9236 (toList!4633 List!16328)) )
))
(declare-fun lt!381460 () ListLongMap!9235)

(declare-fun getCurrentListMapNoExtraKeys!2618 (array!48076 array!48078 (_ BitVec 32) (_ BitVec 32) V!26285 V!26285 (_ BitVec 32) Int) ListLongMap!9235)

(assert (=> b!845974 (= lt!381460 (getCurrentListMapNoExtraKeys!2618 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845975 () Bool)

(assert (=> b!845975 (= e!472206 tp_is_empty!15929)))

(declare-fun b!845976 () Bool)

(declare-fun res!574730 () Bool)

(assert (=> b!845976 (=> (not res!574730) (not e!472204))))

(assert (=> b!845976 (= res!574730 (and (= (size!23510 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23509 _keys!868) (size!23510 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845977 () Bool)

(assert (=> b!845977 (= e!472203 (and e!472205 mapRes!25493))))

(declare-fun condMapEmpty!25493 () Bool)

(declare-fun mapDefault!25493 () ValueCell!7525)

