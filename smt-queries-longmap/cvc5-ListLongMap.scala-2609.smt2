; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39472 () Bool)

(assert start!39472)

(declare-fun b_free!9739 () Bool)

(declare-fun b_next!9739 () Bool)

(assert (=> start!39472 (= b_free!9739 (not b_next!9739))))

(declare-fun tp!34746 () Bool)

(declare-fun b_and!17353 () Bool)

(assert (=> start!39472 (= tp!34746 b_and!17353)))

(declare-fun b!421088 () Bool)

(declare-fun e!250728 () Bool)

(assert (=> b!421088 (= e!250728 true)))

(declare-datatypes ((V!15627 0))(
  ( (V!15628 (val!5490 Int)) )
))
(declare-datatypes ((tuple2!7198 0))(
  ( (tuple2!7199 (_1!3610 (_ BitVec 64)) (_2!3610 V!15627)) )
))
(declare-datatypes ((List!7205 0))(
  ( (Nil!7202) (Cons!7201 (h!8057 tuple2!7198) (t!12609 List!7205)) )
))
(declare-datatypes ((ListLongMap!6111 0))(
  ( (ListLongMap!6112 (toList!3071 List!7205)) )
))
(declare-fun lt!193268 () ListLongMap!6111)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!193276 () tuple2!7198)

(declare-fun lt!193271 () V!15627)

(declare-fun +!1267 (ListLongMap!6111 tuple2!7198) ListLongMap!6111)

(assert (=> b!421088 (= (+!1267 lt!193268 lt!193276) (+!1267 (+!1267 lt!193268 (tuple2!7199 k!794 lt!193271)) lt!193276))))

(declare-fun lt!193270 () V!15627)

(assert (=> b!421088 (= lt!193276 (tuple2!7199 k!794 lt!193270))))

(declare-datatypes ((Unit!12436 0))(
  ( (Unit!12437) )
))
(declare-fun lt!193267 () Unit!12436)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!62 (ListLongMap!6111 (_ BitVec 64) V!15627 V!15627) Unit!12436)

(assert (=> b!421088 (= lt!193267 (addSameAsAddTwiceSameKeyDiffValues!62 lt!193268 k!794 lt!193271 lt!193270))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!193275 () V!15627)

(declare-datatypes ((ValueCell!5102 0))(
  ( (ValueCellFull!5102 (v!7737 V!15627)) (EmptyCell!5102) )
))
(declare-datatypes ((array!25631 0))(
  ( (array!25632 (arr!12265 (Array (_ BitVec 32) ValueCell!5102)) (size!12617 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25631)

(declare-fun get!6094 (ValueCell!5102 V!15627) V!15627)

(assert (=> b!421088 (= lt!193271 (get!6094 (select (arr!12265 _values!549) from!863) lt!193275))))

(declare-datatypes ((array!25633 0))(
  ( (array!25634 (arr!12266 (Array (_ BitVec 32) (_ BitVec 64))) (size!12618 (_ BitVec 32))) )
))
(declare-fun lt!193274 () array!25633)

(declare-fun lt!193277 () ListLongMap!6111)

(assert (=> b!421088 (= lt!193277 (+!1267 lt!193268 (tuple2!7199 (select (arr!12266 lt!193274) from!863) lt!193270)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15627)

(assert (=> b!421088 (= lt!193270 (get!6094 (select (store (arr!12265 _values!549) i!563 (ValueCellFull!5102 v!412)) from!863) lt!193275))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!733 (Int (_ BitVec 64)) V!15627)

(assert (=> b!421088 (= lt!193275 (dynLambda!733 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15627)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!193272 () array!25631)

(declare-fun zeroValue!515 () V!15627)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1275 (array!25633 array!25631 (_ BitVec 32) (_ BitVec 32) V!15627 V!15627 (_ BitVec 32) Int) ListLongMap!6111)

(assert (=> b!421088 (= lt!193268 (getCurrentListMapNoExtraKeys!1275 lt!193274 lt!193272 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421089 () Bool)

(declare-fun res!245707 () Bool)

(declare-fun e!250731 () Bool)

(assert (=> b!421089 (=> (not res!245707) (not e!250731))))

(declare-fun _keys!709 () array!25633)

(assert (=> b!421089 (= res!245707 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12618 _keys!709))))))

(declare-fun e!250729 () Bool)

(declare-fun call!29396 () ListLongMap!6111)

(declare-fun call!29395 () ListLongMap!6111)

(declare-fun b!421090 () Bool)

(assert (=> b!421090 (= e!250729 (= call!29396 (+!1267 call!29395 (tuple2!7199 k!794 v!412))))))

(declare-fun b!421091 () Bool)

(declare-fun res!245703 () Bool)

(assert (=> b!421091 (=> (not res!245703) (not e!250731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421091 (= res!245703 (validMask!0 mask!1025))))

(declare-fun b!421092 () Bool)

(declare-fun e!250733 () Bool)

(declare-fun tp_is_empty!10891 () Bool)

(assert (=> b!421092 (= e!250733 tp_is_empty!10891)))

(declare-fun b!421093 () Bool)

(declare-fun res!245714 () Bool)

(assert (=> b!421093 (=> (not res!245714) (not e!250731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25633 (_ BitVec 32)) Bool)

(assert (=> b!421093 (= res!245714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421094 () Bool)

(declare-fun e!250727 () Bool)

(assert (=> b!421094 (= e!250731 e!250727)))

(declare-fun res!245704 () Bool)

(assert (=> b!421094 (=> (not res!245704) (not e!250727))))

(assert (=> b!421094 (= res!245704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193274 mask!1025))))

(assert (=> b!421094 (= lt!193274 (array!25634 (store (arr!12266 _keys!709) i!563 k!794) (size!12618 _keys!709)))))

(declare-fun b!421095 () Bool)

(declare-fun res!245715 () Bool)

(assert (=> b!421095 (=> (not res!245715) (not e!250731))))

(assert (=> b!421095 (= res!245715 (and (= (size!12617 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12618 _keys!709) (size!12617 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17958 () Bool)

(declare-fun mapRes!17958 () Bool)

(assert (=> mapIsEmpty!17958 mapRes!17958))

(declare-fun b!421096 () Bool)

(declare-fun e!250726 () Bool)

(declare-fun e!250732 () Bool)

(assert (=> b!421096 (= e!250726 (and e!250732 mapRes!17958))))

(declare-fun condMapEmpty!17958 () Bool)

(declare-fun mapDefault!17958 () ValueCell!5102)

