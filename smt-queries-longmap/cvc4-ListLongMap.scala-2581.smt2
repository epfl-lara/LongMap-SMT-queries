; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39308 () Bool)

(assert start!39308)

(declare-fun b_free!9575 () Bool)

(declare-fun b_next!9575 () Bool)

(assert (=> start!39308 (= b_free!9575 (not b_next!9575))))

(declare-fun tp!34254 () Bool)

(declare-fun b_and!17025 () Bool)

(assert (=> start!39308 (= tp!34254 b_and!17025)))

(declare-fun b!416250 () Bool)

(declare-fun res!242263 () Bool)

(declare-fun e!248519 () Bool)

(assert (=> b!416250 (=> (not res!242263) (not e!248519))))

(declare-datatypes ((array!25309 0))(
  ( (array!25310 (arr!12104 (Array (_ BitVec 32) (_ BitVec 64))) (size!12456 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25309)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416250 (= res!242263 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!416251 () Bool)

(declare-fun res!242261 () Bool)

(assert (=> b!416251 (=> (not res!242261) (not e!248519))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25309 (_ BitVec 32)) Bool)

(assert (=> b!416251 (= res!242261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17712 () Bool)

(declare-fun mapRes!17712 () Bool)

(declare-fun tp!34253 () Bool)

(declare-fun e!248517 () Bool)

(assert (=> mapNonEmpty!17712 (= mapRes!17712 (and tp!34253 e!248517))))

(declare-datatypes ((V!15407 0))(
  ( (V!15408 (val!5408 Int)) )
))
(declare-datatypes ((ValueCell!5020 0))(
  ( (ValueCellFull!5020 (v!7655 V!15407)) (EmptyCell!5020) )
))
(declare-fun mapRest!17712 () (Array (_ BitVec 32) ValueCell!5020))

(declare-datatypes ((array!25311 0))(
  ( (array!25312 (arr!12105 (Array (_ BitVec 32) ValueCell!5020)) (size!12457 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25311)

(declare-fun mapValue!17712 () ValueCell!5020)

(declare-fun mapKey!17712 () (_ BitVec 32))

(assert (=> mapNonEmpty!17712 (= (arr!12105 _values!549) (store mapRest!17712 mapKey!17712 mapValue!17712))))

(declare-fun b!416252 () Bool)

(declare-fun e!248514 () Bool)

(declare-fun tp_is_empty!10727 () Bool)

(assert (=> b!416252 (= e!248514 tp_is_empty!10727)))

(declare-fun b!416253 () Bool)

(declare-fun res!242267 () Bool)

(assert (=> b!416253 (=> (not res!242267) (not e!248519))))

(declare-datatypes ((List!7069 0))(
  ( (Nil!7066) (Cons!7065 (h!7921 (_ BitVec 64)) (t!12309 List!7069)) )
))
(declare-fun arrayNoDuplicates!0 (array!25309 (_ BitVec 32) List!7069) Bool)

(assert (=> b!416253 (= res!242267 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7066))))

(declare-fun res!242259 () Bool)

(assert (=> start!39308 (=> (not res!242259) (not e!248519))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39308 (= res!242259 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12456 _keys!709))))))

(assert (=> start!39308 e!248519))

(assert (=> start!39308 tp_is_empty!10727))

(assert (=> start!39308 tp!34254))

(assert (=> start!39308 true))

(declare-fun e!248515 () Bool)

(declare-fun array_inv!8828 (array!25311) Bool)

(assert (=> start!39308 (and (array_inv!8828 _values!549) e!248515)))

(declare-fun array_inv!8829 (array!25309) Bool)

(assert (=> start!39308 (array_inv!8829 _keys!709)))

(declare-fun b!416254 () Bool)

(declare-fun res!242262 () Bool)

(assert (=> b!416254 (=> (not res!242262) (not e!248519))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416254 (= res!242262 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12456 _keys!709))))))

(declare-fun b!416255 () Bool)

(declare-fun e!248520 () Bool)

(assert (=> b!416255 (= e!248520 true)))

(declare-fun lt!190562 () V!15407)

(declare-datatypes ((tuple2!7050 0))(
  ( (tuple2!7051 (_1!3536 (_ BitVec 64)) (_2!3536 V!15407)) )
))
(declare-datatypes ((List!7070 0))(
  ( (Nil!7067) (Cons!7066 (h!7922 tuple2!7050) (t!12310 List!7070)) )
))
(declare-datatypes ((ListLongMap!5963 0))(
  ( (ListLongMap!5964 (toList!2997 List!7070)) )
))
(declare-fun lt!190567 () ListLongMap!5963)

(declare-fun lt!190570 () tuple2!7050)

(declare-fun +!1199 (ListLongMap!5963 tuple2!7050) ListLongMap!5963)

(assert (=> b!416255 (= (+!1199 lt!190567 lt!190570) (+!1199 (+!1199 lt!190567 (tuple2!7051 k!794 lt!190562)) lt!190570))))

(declare-fun lt!190564 () V!15407)

(assert (=> b!416255 (= lt!190570 (tuple2!7051 k!794 lt!190564))))

(declare-datatypes ((Unit!12302 0))(
  ( (Unit!12303) )
))
(declare-fun lt!190561 () Unit!12302)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!4 (ListLongMap!5963 (_ BitVec 64) V!15407 V!15407) Unit!12302)

(assert (=> b!416255 (= lt!190561 (addSameAsAddTwiceSameKeyDiffValues!4 lt!190567 k!794 lt!190562 lt!190564))))

(declare-fun lt!190565 () V!15407)

(declare-fun get!5980 (ValueCell!5020 V!15407) V!15407)

(assert (=> b!416255 (= lt!190562 (get!5980 (select (arr!12105 _values!549) from!863) lt!190565))))

(declare-fun lt!190568 () ListLongMap!5963)

(declare-fun lt!190571 () array!25309)

(assert (=> b!416255 (= lt!190568 (+!1199 lt!190567 (tuple2!7051 (select (arr!12104 lt!190571) from!863) lt!190564)))))

(declare-fun v!412 () V!15407)

(assert (=> b!416255 (= lt!190564 (get!5980 (select (store (arr!12105 _values!549) i!563 (ValueCellFull!5020 v!412)) from!863) lt!190565))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!675 (Int (_ BitVec 64)) V!15407)

(assert (=> b!416255 (= lt!190565 (dynLambda!675 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!190566 () array!25311)

(declare-fun minValue!515 () V!15407)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15407)

(declare-fun getCurrentListMapNoExtraKeys!1202 (array!25309 array!25311 (_ BitVec 32) (_ BitVec 32) V!15407 V!15407 (_ BitVec 32) Int) ListLongMap!5963)

(assert (=> b!416255 (= lt!190567 (getCurrentListMapNoExtraKeys!1202 lt!190571 lt!190566 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416256 () Bool)

(declare-fun res!242266 () Bool)

(assert (=> b!416256 (=> (not res!242266) (not e!248519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416256 (= res!242266 (validKeyInArray!0 k!794))))

(declare-fun b!416257 () Bool)

(declare-fun res!242258 () Bool)

(assert (=> b!416257 (=> (not res!242258) (not e!248519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416257 (= res!242258 (validMask!0 mask!1025))))

(declare-fun b!416258 () Bool)

(assert (=> b!416258 (= e!248515 (and e!248514 mapRes!17712))))

(declare-fun condMapEmpty!17712 () Bool)

(declare-fun mapDefault!17712 () ValueCell!5020)

