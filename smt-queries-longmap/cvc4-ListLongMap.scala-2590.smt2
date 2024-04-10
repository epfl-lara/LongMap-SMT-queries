; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39362 () Bool)

(assert start!39362)

(declare-fun b_free!9629 () Bool)

(declare-fun b_next!9629 () Bool)

(assert (=> start!39362 (= b_free!9629 (not b_next!9629))))

(declare-fun tp!34416 () Bool)

(declare-fun b_and!17133 () Bool)

(assert (=> start!39362 (= tp!34416 b_and!17133)))

(declare-fun b!417843 () Bool)

(declare-fun e!249246 () Bool)

(declare-fun tp_is_empty!10781 () Bool)

(assert (=> b!417843 (= e!249246 tp_is_empty!10781)))

(declare-fun b!417844 () Bool)

(declare-fun e!249245 () Bool)

(assert (=> b!417844 (= e!249245 true)))

(declare-datatypes ((V!15479 0))(
  ( (V!15480 (val!5435 Int)) )
))
(declare-datatypes ((tuple2!7100 0))(
  ( (tuple2!7101 (_1!3561 (_ BitVec 64)) (_2!3561 V!15479)) )
))
(declare-datatypes ((List!7116 0))(
  ( (Nil!7113) (Cons!7112 (h!7968 tuple2!7100) (t!12410 List!7116)) )
))
(declare-datatypes ((ListLongMap!6013 0))(
  ( (ListLongMap!6014 (toList!3022 List!7116)) )
))
(declare-fun lt!191460 () ListLongMap!6013)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!191458 () tuple2!7100)

(declare-fun lt!191455 () V!15479)

(declare-fun +!1222 (ListLongMap!6013 tuple2!7100) ListLongMap!6013)

(assert (=> b!417844 (= (+!1222 lt!191460 lt!191458) (+!1222 (+!1222 lt!191460 (tuple2!7101 k!794 lt!191455)) lt!191458))))

(declare-fun lt!191452 () V!15479)

(assert (=> b!417844 (= lt!191458 (tuple2!7101 k!794 lt!191452))))

(declare-datatypes ((Unit!12348 0))(
  ( (Unit!12349) )
))
(declare-fun lt!191456 () Unit!12348)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!22 (ListLongMap!6013 (_ BitVec 64) V!15479 V!15479) Unit!12348)

(assert (=> b!417844 (= lt!191456 (addSameAsAddTwiceSameKeyDiffValues!22 lt!191460 k!794 lt!191455 lt!191452))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5047 0))(
  ( (ValueCellFull!5047 (v!7682 V!15479)) (EmptyCell!5047) )
))
(declare-datatypes ((array!25413 0))(
  ( (array!25414 (arr!12156 (Array (_ BitVec 32) ValueCell!5047)) (size!12508 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25413)

(declare-fun lt!191461 () V!15479)

(declare-fun get!6016 (ValueCell!5047 V!15479) V!15479)

(assert (=> b!417844 (= lt!191455 (get!6016 (select (arr!12156 _values!549) from!863) lt!191461))))

(declare-fun lt!191462 () ListLongMap!6013)

(declare-datatypes ((array!25415 0))(
  ( (array!25416 (arr!12157 (Array (_ BitVec 32) (_ BitVec 64))) (size!12509 (_ BitVec 32))) )
))
(declare-fun lt!191453 () array!25415)

(assert (=> b!417844 (= lt!191462 (+!1222 lt!191460 (tuple2!7101 (select (arr!12157 lt!191453) from!863) lt!191452)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15479)

(assert (=> b!417844 (= lt!191452 (get!6016 (select (store (arr!12156 _values!549) i!563 (ValueCellFull!5047 v!412)) from!863) lt!191461))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!693 (Int (_ BitVec 64)) V!15479)

(assert (=> b!417844 (= lt!191461 (dynLambda!693 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15479)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15479)

(declare-fun lt!191454 () array!25413)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1227 (array!25415 array!25413 (_ BitVec 32) (_ BitVec 32) V!15479 V!15479 (_ BitVec 32) Int) ListLongMap!6013)

(assert (=> b!417844 (= lt!191460 (getCurrentListMapNoExtraKeys!1227 lt!191453 lt!191454 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17793 () Bool)

(declare-fun mapRes!17793 () Bool)

(declare-fun tp!34415 () Bool)

(declare-fun e!249249 () Bool)

(assert (=> mapNonEmpty!17793 (= mapRes!17793 (and tp!34415 e!249249))))

(declare-fun mapRest!17793 () (Array (_ BitVec 32) ValueCell!5047))

(declare-fun mapKey!17793 () (_ BitVec 32))

(declare-fun mapValue!17793 () ValueCell!5047)

(assert (=> mapNonEmpty!17793 (= (arr!12156 _values!549) (store mapRest!17793 mapKey!17793 mapValue!17793))))

(declare-fun b!417845 () Bool)

(assert (=> b!417845 (= e!249249 tp_is_empty!10781)))

(declare-fun res!243405 () Bool)

(declare-fun e!249248 () Bool)

(assert (=> start!39362 (=> (not res!243405) (not e!249248))))

(declare-fun _keys!709 () array!25415)

(assert (=> start!39362 (= res!243405 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12509 _keys!709))))))

(assert (=> start!39362 e!249248))

(assert (=> start!39362 tp_is_empty!10781))

(assert (=> start!39362 tp!34416))

(assert (=> start!39362 true))

(declare-fun e!249247 () Bool)

(declare-fun array_inv!8862 (array!25413) Bool)

(assert (=> start!39362 (and (array_inv!8862 _values!549) e!249247)))

(declare-fun array_inv!8863 (array!25415) Bool)

(assert (=> start!39362 (array_inv!8863 _keys!709)))

(declare-fun b!417846 () Bool)

(assert (=> b!417846 (= e!249247 (and e!249246 mapRes!17793))))

(declare-fun condMapEmpty!17793 () Bool)

(declare-fun mapDefault!17793 () ValueCell!5047)

