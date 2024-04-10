; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39346 () Bool)

(assert start!39346)

(declare-fun b_free!9613 () Bool)

(declare-fun b_next!9613 () Bool)

(assert (=> start!39346 (= b_free!9613 (not b_next!9613))))

(declare-fun tp!34367 () Bool)

(declare-fun b_and!17101 () Bool)

(assert (=> start!39346 (= tp!34367 b_and!17101)))

(declare-fun b!417371 () Bool)

(declare-fun e!249031 () Bool)

(declare-fun tp_is_empty!10765 () Bool)

(assert (=> b!417371 (= e!249031 tp_is_empty!10765)))

(declare-fun b!417372 () Bool)

(declare-fun e!249027 () Bool)

(assert (=> b!417372 (= e!249027 true)))

(declare-datatypes ((V!15459 0))(
  ( (V!15460 (val!5427 Int)) )
))
(declare-datatypes ((tuple2!7084 0))(
  ( (tuple2!7085 (_1!3553 (_ BitVec 64)) (_2!3553 V!15459)) )
))
(declare-datatypes ((List!7102 0))(
  ( (Nil!7099) (Cons!7098 (h!7954 tuple2!7084) (t!12380 List!7102)) )
))
(declare-datatypes ((ListLongMap!5997 0))(
  ( (ListLongMap!5998 (toList!3014 List!7102)) )
))
(declare-fun lt!191194 () ListLongMap!5997)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!191198 () V!15459)

(declare-fun lt!191192 () tuple2!7084)

(declare-fun +!1216 (ListLongMap!5997 tuple2!7084) ListLongMap!5997)

(assert (=> b!417372 (= (+!1216 lt!191194 lt!191192) (+!1216 (+!1216 lt!191194 (tuple2!7085 k!794 lt!191198)) lt!191192))))

(declare-fun lt!191197 () V!15459)

(assert (=> b!417372 (= lt!191192 (tuple2!7085 k!794 lt!191197))))

(declare-datatypes ((Unit!12334 0))(
  ( (Unit!12335) )
))
(declare-fun lt!191196 () Unit!12334)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!17 (ListLongMap!5997 (_ BitVec 64) V!15459 V!15459) Unit!12334)

(assert (=> b!417372 (= lt!191196 (addSameAsAddTwiceSameKeyDiffValues!17 lt!191194 k!794 lt!191198 lt!191197))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5039 0))(
  ( (ValueCellFull!5039 (v!7674 V!15459)) (EmptyCell!5039) )
))
(declare-datatypes ((array!25381 0))(
  ( (array!25382 (arr!12140 (Array (_ BitVec 32) ValueCell!5039)) (size!12492 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25381)

(declare-fun lt!191195 () V!15459)

(declare-fun get!6007 (ValueCell!5039 V!15459) V!15459)

(assert (=> b!417372 (= lt!191198 (get!6007 (select (arr!12140 _values!549) from!863) lt!191195))))

(declare-fun lt!191188 () ListLongMap!5997)

(declare-datatypes ((array!25383 0))(
  ( (array!25384 (arr!12141 (Array (_ BitVec 32) (_ BitVec 64))) (size!12493 (_ BitVec 32))) )
))
(declare-fun lt!191190 () array!25383)

(assert (=> b!417372 (= lt!191188 (+!1216 lt!191194 (tuple2!7085 (select (arr!12141 lt!191190) from!863) lt!191197)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15459)

(assert (=> b!417372 (= lt!191197 (get!6007 (select (store (arr!12140 _values!549) i!563 (ValueCellFull!5039 v!412)) from!863) lt!191195))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!688 (Int (_ BitVec 64)) V!15459)

(assert (=> b!417372 (= lt!191195 (dynLambda!688 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15459)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15459)

(declare-fun lt!191191 () array!25381)

(declare-fun getCurrentListMapNoExtraKeys!1219 (array!25383 array!25381 (_ BitVec 32) (_ BitVec 32) V!15459 V!15459 (_ BitVec 32) Int) ListLongMap!5997)

(assert (=> b!417372 (= lt!191194 (getCurrentListMapNoExtraKeys!1219 lt!191190 lt!191191 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417373 () Bool)

(declare-fun e!249028 () Bool)

(declare-fun e!249030 () Bool)

(assert (=> b!417373 (= e!249028 e!249030)))

(declare-fun res!243063 () Bool)

(assert (=> b!417373 (=> (not res!243063) (not e!249030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25383 (_ BitVec 32)) Bool)

(assert (=> b!417373 (= res!243063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191190 mask!1025))))

(declare-fun _keys!709 () array!25383)

(assert (=> b!417373 (= lt!191190 (array!25384 (store (arr!12141 _keys!709) i!563 k!794) (size!12493 _keys!709)))))

(declare-fun b!417374 () Bool)

(declare-fun res!243061 () Bool)

(assert (=> b!417374 (=> (not res!243061) (not e!249028))))

(assert (=> b!417374 (= res!243061 (and (= (size!12492 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12493 _keys!709) (size!12492 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun e!249026 () Bool)

(declare-fun call!29017 () ListLongMap!5997)

(declare-fun call!29018 () ListLongMap!5997)

(declare-fun b!417375 () Bool)

(assert (=> b!417375 (= e!249026 (= call!29017 (+!1216 call!29018 (tuple2!7085 k!794 v!412))))))

(declare-fun c!55133 () Bool)

(declare-fun bm!29014 () Bool)

(assert (=> bm!29014 (= call!29017 (getCurrentListMapNoExtraKeys!1219 (ite c!55133 lt!191190 _keys!709) (ite c!55133 lt!191191 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29015 () Bool)

(assert (=> bm!29015 (= call!29018 (getCurrentListMapNoExtraKeys!1219 (ite c!55133 _keys!709 lt!191190) (ite c!55133 _values!549 lt!191191) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417377 () Bool)

(declare-fun res!243067 () Bool)

(assert (=> b!417377 (=> (not res!243067) (not e!249030))))

(declare-datatypes ((List!7103 0))(
  ( (Nil!7100) (Cons!7099 (h!7955 (_ BitVec 64)) (t!12381 List!7103)) )
))
(declare-fun arrayNoDuplicates!0 (array!25383 (_ BitVec 32) List!7103) Bool)

(assert (=> b!417377 (= res!243067 (arrayNoDuplicates!0 lt!191190 #b00000000000000000000000000000000 Nil!7100))))

(declare-fun b!417378 () Bool)

(declare-fun res!243068 () Bool)

(assert (=> b!417378 (=> (not res!243068) (not e!249028))))

(assert (=> b!417378 (= res!243068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417379 () Bool)

(declare-fun res!243065 () Bool)

(assert (=> b!417379 (=> (not res!243065) (not e!249028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417379 (= res!243065 (validMask!0 mask!1025))))

(declare-fun b!417380 () Bool)

(declare-fun res!243069 () Bool)

(assert (=> b!417380 (=> (not res!243069) (not e!249028))))

(declare-fun arrayContainsKey!0 (array!25383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417380 (= res!243069 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!417381 () Bool)

(declare-fun e!249029 () Bool)

(assert (=> b!417381 (= e!249029 (not e!249027))))

(declare-fun res!243064 () Bool)

(assert (=> b!417381 (=> res!243064 e!249027)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417381 (= res!243064 (validKeyInArray!0 (select (arr!12141 _keys!709) from!863)))))

(assert (=> b!417381 e!249026))

(assert (=> b!417381 (= c!55133 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191193 () Unit!12334)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!423 (array!25383 array!25381 (_ BitVec 32) (_ BitVec 32) V!15459 V!15459 (_ BitVec 32) (_ BitVec 64) V!15459 (_ BitVec 32) Int) Unit!12334)

(assert (=> b!417381 (= lt!191193 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!423 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417382 () Bool)

(declare-fun res!243058 () Bool)

(assert (=> b!417382 (=> (not res!243058) (not e!249028))))

(assert (=> b!417382 (= res!243058 (or (= (select (arr!12141 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12141 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417383 () Bool)

(declare-fun res!243066 () Bool)

(assert (=> b!417383 (=> (not res!243066) (not e!249030))))

(assert (=> b!417383 (= res!243066 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17769 () Bool)

(declare-fun mapRes!17769 () Bool)

(assert (=> mapIsEmpty!17769 mapRes!17769))

(declare-fun b!417384 () Bool)

(declare-fun e!249033 () Bool)

(assert (=> b!417384 (= e!249033 tp_is_empty!10765)))

(declare-fun b!417385 () Bool)

(assert (=> b!417385 (= e!249026 (= call!29018 call!29017))))

(declare-fun b!417386 () Bool)

(declare-fun res!243059 () Bool)

(assert (=> b!417386 (=> (not res!243059) (not e!249028))))

(assert (=> b!417386 (= res!243059 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7100))))

(declare-fun res!243057 () Bool)

(assert (=> start!39346 (=> (not res!243057) (not e!249028))))

(assert (=> start!39346 (= res!243057 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12493 _keys!709))))))

(assert (=> start!39346 e!249028))

(assert (=> start!39346 tp_is_empty!10765))

(assert (=> start!39346 tp!34367))

(assert (=> start!39346 true))

(declare-fun e!249025 () Bool)

(declare-fun array_inv!8854 (array!25381) Bool)

(assert (=> start!39346 (and (array_inv!8854 _values!549) e!249025)))

(declare-fun array_inv!8855 (array!25383) Bool)

(assert (=> start!39346 (array_inv!8855 _keys!709)))

(declare-fun b!417376 () Bool)

(assert (=> b!417376 (= e!249025 (and e!249031 mapRes!17769))))

(declare-fun condMapEmpty!17769 () Bool)

(declare-fun mapDefault!17769 () ValueCell!5039)

