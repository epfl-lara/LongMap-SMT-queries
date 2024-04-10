; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39508 () Bool)

(assert start!39508)

(declare-fun b_free!9775 () Bool)

(declare-fun b_next!9775 () Bool)

(assert (=> start!39508 (= b_free!9775 (not b_next!9775))))

(declare-fun tp!34854 () Bool)

(declare-fun b_and!17425 () Bool)

(assert (=> start!39508 (= tp!34854 b_and!17425)))

(declare-fun b!422150 () Bool)

(declare-fun res!246466 () Bool)

(declare-fun e!251212 () Bool)

(assert (=> b!422150 (=> (not res!246466) (not e!251212))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422150 (= res!246466 (validMask!0 mask!1025))))

(declare-fun b!422151 () Bool)

(declare-fun res!246467 () Bool)

(assert (=> b!422151 (=> (not res!246467) (not e!251212))))

(declare-datatypes ((array!25701 0))(
  ( (array!25702 (arr!12300 (Array (_ BitVec 32) (_ BitVec 64))) (size!12652 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25701)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25701 (_ BitVec 32)) Bool)

(assert (=> b!422151 (= res!246467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422152 () Bool)

(declare-fun e!251218 () Bool)

(declare-fun e!251214 () Bool)

(assert (=> b!422152 (= e!251218 (not e!251214))))

(declare-fun res!246464 () Bool)

(assert (=> b!422152 (=> res!246464 e!251214)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422152 (= res!246464 (validKeyInArray!0 (select (arr!12300 _keys!709) from!863)))))

(declare-fun e!251217 () Bool)

(assert (=> b!422152 e!251217))

(declare-fun c!55376 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422152 (= c!55376 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15675 0))(
  ( (V!15676 (val!5508 Int)) )
))
(declare-fun minValue!515 () V!15675)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5120 0))(
  ( (ValueCellFull!5120 (v!7755 V!15675)) (EmptyCell!5120) )
))
(declare-datatypes ((array!25703 0))(
  ( (array!25704 (arr!12301 (Array (_ BitVec 32) ValueCell!5120)) (size!12653 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25703)

(declare-fun zeroValue!515 () V!15675)

(declare-fun v!412 () V!15675)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12466 0))(
  ( (Unit!12467) )
))
(declare-fun lt!193862 () Unit!12466)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!477 (array!25701 array!25703 (_ BitVec 32) (_ BitVec 32) V!15675 V!15675 (_ BitVec 32) (_ BitVec 64) V!15675 (_ BitVec 32) Int) Unit!12466)

(assert (=> b!422152 (= lt!193862 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!477 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422153 () Bool)

(declare-fun res!246458 () Bool)

(assert (=> b!422153 (=> (not res!246458) (not e!251212))))

(declare-fun arrayContainsKey!0 (array!25701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422153 (= res!246458 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!422154 () Bool)

(declare-fun res!246468 () Bool)

(assert (=> b!422154 (=> (not res!246468) (not e!251212))))

(assert (=> b!422154 (= res!246468 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12652 _keys!709))))))

(declare-fun b!422155 () Bool)

(declare-fun res!246470 () Bool)

(assert (=> b!422155 (=> (not res!246470) (not e!251212))))

(assert (=> b!422155 (= res!246470 (or (= (select (arr!12300 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12300 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422156 () Bool)

(declare-fun e!251215 () Bool)

(assert (=> b!422156 (= e!251215 e!251218)))

(declare-fun res!246462 () Bool)

(assert (=> b!422156 (=> (not res!246462) (not e!251218))))

(assert (=> b!422156 (= res!246462 (= from!863 i!563))))

(declare-datatypes ((tuple2!7230 0))(
  ( (tuple2!7231 (_1!3626 (_ BitVec 64)) (_2!3626 V!15675)) )
))
(declare-datatypes ((List!7235 0))(
  ( (Nil!7232) (Cons!7231 (h!8087 tuple2!7230) (t!12675 List!7235)) )
))
(declare-datatypes ((ListLongMap!6143 0))(
  ( (ListLongMap!6144 (toList!3087 List!7235)) )
))
(declare-fun lt!193864 () ListLongMap!6143)

(declare-fun lt!193870 () array!25703)

(declare-fun lt!193867 () array!25701)

(declare-fun getCurrentListMapNoExtraKeys!1291 (array!25701 array!25703 (_ BitVec 32) (_ BitVec 32) V!15675 V!15675 (_ BitVec 32) Int) ListLongMap!6143)

(assert (=> b!422156 (= lt!193864 (getCurrentListMapNoExtraKeys!1291 lt!193867 lt!193870 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!422156 (= lt!193870 (array!25704 (store (arr!12301 _values!549) i!563 (ValueCellFull!5120 v!412)) (size!12653 _values!549)))))

(declare-fun lt!193871 () ListLongMap!6143)

(assert (=> b!422156 (= lt!193871 (getCurrentListMapNoExtraKeys!1291 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422157 () Bool)

(declare-fun res!246461 () Bool)

(assert (=> b!422157 (=> (not res!246461) (not e!251215))))

(declare-datatypes ((List!7236 0))(
  ( (Nil!7233) (Cons!7232 (h!8088 (_ BitVec 64)) (t!12676 List!7236)) )
))
(declare-fun arrayNoDuplicates!0 (array!25701 (_ BitVec 32) List!7236) Bool)

(assert (=> b!422157 (= res!246461 (arrayNoDuplicates!0 lt!193867 #b00000000000000000000000000000000 Nil!7233))))

(declare-fun call!29504 () ListLongMap!6143)

(declare-fun b!422158 () Bool)

(declare-fun call!29503 () ListLongMap!6143)

(declare-fun +!1282 (ListLongMap!6143 tuple2!7230) ListLongMap!6143)

(assert (=> b!422158 (= e!251217 (= call!29504 (+!1282 call!29503 (tuple2!7231 k!794 v!412))))))

(declare-fun b!422159 () Bool)

(declare-fun res!246463 () Bool)

(assert (=> b!422159 (=> (not res!246463) (not e!251215))))

(assert (=> b!422159 (= res!246463 (bvsle from!863 i!563))))

(declare-fun b!422160 () Bool)

(declare-fun res!246469 () Bool)

(assert (=> b!422160 (=> (not res!246469) (not e!251212))))

(assert (=> b!422160 (= res!246469 (validKeyInArray!0 k!794))))

(declare-fun b!422161 () Bool)

(declare-fun res!246471 () Bool)

(assert (=> b!422161 (=> (not res!246471) (not e!251212))))

(assert (=> b!422161 (= res!246471 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7233))))

(declare-fun b!422162 () Bool)

(declare-fun e!251219 () Bool)

(declare-fun e!251213 () Bool)

(declare-fun mapRes!18012 () Bool)

(assert (=> b!422162 (= e!251219 (and e!251213 mapRes!18012))))

(declare-fun condMapEmpty!18012 () Bool)

(declare-fun mapDefault!18012 () ValueCell!5120)

