; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40168 () Bool)

(assert start!40168)

(declare-fun b_free!10435 () Bool)

(declare-fun b_next!10435 () Bool)

(assert (=> start!40168 (= b_free!10435 (not b_next!10435))))

(declare-fun tp!36834 () Bool)

(declare-fun b_and!18403 () Bool)

(assert (=> start!40168 (= tp!36834 b_and!18403)))

(declare-fun res!259983 () Bool)

(declare-fun e!259209 () Bool)

(assert (=> start!40168 (=> (not res!259983) (not e!259209))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26989 0))(
  ( (array!26990 (arr!12944 (Array (_ BitVec 32) (_ BitVec 64))) (size!13296 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26989)

(assert (=> start!40168 (= res!259983 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13296 _keys!709))))))

(assert (=> start!40168 e!259209))

(declare-fun tp_is_empty!11587 () Bool)

(assert (=> start!40168 tp_is_empty!11587))

(assert (=> start!40168 tp!36834))

(assert (=> start!40168 true))

(declare-datatypes ((V!16555 0))(
  ( (V!16556 (val!5838 Int)) )
))
(declare-datatypes ((ValueCell!5450 0))(
  ( (ValueCellFull!5450 (v!8085 V!16555)) (EmptyCell!5450) )
))
(declare-datatypes ((array!26991 0))(
  ( (array!26992 (arr!12945 (Array (_ BitVec 32) ValueCell!5450)) (size!13297 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26991)

(declare-fun e!259214 () Bool)

(declare-fun array_inv!9398 (array!26991) Bool)

(assert (=> start!40168 (and (array_inv!9398 _values!549) e!259214)))

(declare-fun array_inv!9399 (array!26989) Bool)

(assert (=> start!40168 (array_inv!9399 _keys!709)))

(declare-fun b!439796 () Bool)

(declare-fun res!259979 () Bool)

(assert (=> b!439796 (=> (not res!259979) (not e!259209))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439796 (= res!259979 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!439797 () Bool)

(declare-fun e!259212 () Bool)

(assert (=> b!439797 (= e!259212 tp_is_empty!11587)))

(declare-fun b!439798 () Bool)

(declare-fun e!259211 () Bool)

(assert (=> b!439798 (= e!259211 (not true))))

(declare-fun minValue!515 () V!16555)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16555)

(declare-fun lt!202385 () array!26989)

(declare-fun v!412 () V!16555)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!202383 () array!26991)

(declare-datatypes ((tuple2!7752 0))(
  ( (tuple2!7753 (_1!3887 (_ BitVec 64)) (_2!3887 V!16555)) )
))
(declare-datatypes ((List!7750 0))(
  ( (Nil!7747) (Cons!7746 (h!8602 tuple2!7752) (t!13506 List!7750)) )
))
(declare-datatypes ((ListLongMap!6665 0))(
  ( (ListLongMap!6666 (toList!3348 List!7750)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1537 (array!26989 array!26991 (_ BitVec 32) (_ BitVec 32) V!16555 V!16555 (_ BitVec 32) Int) ListLongMap!6665)

(declare-fun +!1488 (ListLongMap!6665 tuple2!7752) ListLongMap!6665)

(assert (=> b!439798 (= (getCurrentListMapNoExtraKeys!1537 lt!202385 lt!202383 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1488 (getCurrentListMapNoExtraKeys!1537 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7753 k!794 v!412)))))

(declare-datatypes ((Unit!13080 0))(
  ( (Unit!13081) )
))
(declare-fun lt!202384 () Unit!13080)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!657 (array!26989 array!26991 (_ BitVec 32) (_ BitVec 32) V!16555 V!16555 (_ BitVec 32) (_ BitVec 64) V!16555 (_ BitVec 32) Int) Unit!13080)

(assert (=> b!439798 (= lt!202384 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!657 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439799 () Bool)

(declare-fun e!259215 () Bool)

(assert (=> b!439799 (= e!259215 e!259211)))

(declare-fun res!259984 () Bool)

(assert (=> b!439799 (=> (not res!259984) (not e!259211))))

(assert (=> b!439799 (= res!259984 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202381 () ListLongMap!6665)

(assert (=> b!439799 (= lt!202381 (getCurrentListMapNoExtraKeys!1537 lt!202385 lt!202383 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439799 (= lt!202383 (array!26992 (store (arr!12945 _values!549) i!563 (ValueCellFull!5450 v!412)) (size!13297 _values!549)))))

(declare-fun lt!202382 () ListLongMap!6665)

(assert (=> b!439799 (= lt!202382 (getCurrentListMapNoExtraKeys!1537 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439800 () Bool)

(declare-fun res!259975 () Bool)

(assert (=> b!439800 (=> (not res!259975) (not e!259209))))

(declare-datatypes ((List!7751 0))(
  ( (Nil!7748) (Cons!7747 (h!8603 (_ BitVec 64)) (t!13507 List!7751)) )
))
(declare-fun arrayNoDuplicates!0 (array!26989 (_ BitVec 32) List!7751) Bool)

(assert (=> b!439800 (= res!259975 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7748))))

(declare-fun b!439801 () Bool)

(declare-fun res!259976 () Bool)

(assert (=> b!439801 (=> (not res!259976) (not e!259215))))

(assert (=> b!439801 (= res!259976 (bvsle from!863 i!563))))

(declare-fun b!439802 () Bool)

(declare-fun e!259213 () Bool)

(assert (=> b!439802 (= e!259213 tp_is_empty!11587)))

(declare-fun b!439803 () Bool)

(declare-fun res!259977 () Bool)

(assert (=> b!439803 (=> (not res!259977) (not e!259209))))

(assert (=> b!439803 (= res!259977 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13296 _keys!709))))))

(declare-fun b!439804 () Bool)

(declare-fun mapRes!19002 () Bool)

(assert (=> b!439804 (= e!259214 (and e!259212 mapRes!19002))))

(declare-fun condMapEmpty!19002 () Bool)

(declare-fun mapDefault!19002 () ValueCell!5450)

