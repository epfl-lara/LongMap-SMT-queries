; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39734 () Bool)

(assert start!39734)

(declare-fun b_free!10001 () Bool)

(declare-fun b_next!10001 () Bool)

(assert (=> start!39734 (= b_free!10001 (not b_next!10001))))

(declare-fun tp!35532 () Bool)

(declare-fun b_and!17661 () Bool)

(assert (=> start!39734 (= tp!35532 b_and!17661)))

(declare-fun b!427460 () Bool)

(declare-fun res!250730 () Bool)

(declare-fun e!253457 () Bool)

(assert (=> b!427460 (=> (not res!250730) (not e!253457))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427460 (= res!250730 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18351 () Bool)

(declare-fun mapRes!18351 () Bool)

(declare-fun tp!35531 () Bool)

(declare-fun e!253459 () Bool)

(assert (=> mapNonEmpty!18351 (= mapRes!18351 (and tp!35531 e!253459))))

(declare-datatypes ((V!15975 0))(
  ( (V!15976 (val!5621 Int)) )
))
(declare-datatypes ((ValueCell!5233 0))(
  ( (ValueCellFull!5233 (v!7868 V!15975)) (EmptyCell!5233) )
))
(declare-datatypes ((array!26143 0))(
  ( (array!26144 (arr!12521 (Array (_ BitVec 32) ValueCell!5233)) (size!12873 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26143)

(declare-fun mapKey!18351 () (_ BitVec 32))

(declare-fun mapRest!18351 () (Array (_ BitVec 32) ValueCell!5233))

(declare-fun mapValue!18351 () ValueCell!5233)

(assert (=> mapNonEmpty!18351 (= (arr!12521 _values!549) (store mapRest!18351 mapKey!18351 mapValue!18351))))

(declare-fun b!427461 () Bool)

(declare-fun res!250733 () Bool)

(declare-fun e!253458 () Bool)

(assert (=> b!427461 (=> (not res!250733) (not e!253458))))

(declare-datatypes ((array!26145 0))(
  ( (array!26146 (arr!12522 (Array (_ BitVec 32) (_ BitVec 64))) (size!12874 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26145)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26145 (_ BitVec 32)) Bool)

(assert (=> b!427461 (= res!250733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427462 () Bool)

(declare-fun tp_is_empty!11153 () Bool)

(assert (=> b!427462 (= e!253459 tp_is_empty!11153)))

(declare-fun b!427463 () Bool)

(declare-fun e!253456 () Bool)

(declare-fun e!253461 () Bool)

(assert (=> b!427463 (= e!253456 (not e!253461))))

(declare-fun res!250735 () Bool)

(assert (=> b!427463 (=> res!250735 e!253461)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427463 (= res!250735 (not (validKeyInArray!0 (select (arr!12522 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7388 0))(
  ( (tuple2!7389 (_1!3705 (_ BitVec 64)) (_2!3705 V!15975)) )
))
(declare-datatypes ((List!7403 0))(
  ( (Nil!7400) (Cons!7399 (h!8255 tuple2!7388) (t!12853 List!7403)) )
))
(declare-datatypes ((ListLongMap!6301 0))(
  ( (ListLongMap!6302 (toList!3166 List!7403)) )
))
(declare-fun lt!195303 () ListLongMap!6301)

(declare-fun lt!195299 () ListLongMap!6301)

(assert (=> b!427463 (= lt!195303 lt!195299)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!195302 () ListLongMap!6301)

(declare-fun v!412 () V!15975)

(declare-fun +!1321 (ListLongMap!6301 tuple2!7388) ListLongMap!6301)

(assert (=> b!427463 (= lt!195299 (+!1321 lt!195302 (tuple2!7389 k!794 v!412)))))

(declare-fun minValue!515 () V!15975)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15975)

(declare-fun lt!195300 () array!26143)

(declare-fun lt!195304 () array!26145)

(declare-fun getCurrentListMapNoExtraKeys!1370 (array!26145 array!26143 (_ BitVec 32) (_ BitVec 32) V!15975 V!15975 (_ BitVec 32) Int) ListLongMap!6301)

(assert (=> b!427463 (= lt!195303 (getCurrentListMapNoExtraKeys!1370 lt!195304 lt!195300 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427463 (= lt!195302 (getCurrentListMapNoExtraKeys!1370 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12544 0))(
  ( (Unit!12545) )
))
(declare-fun lt!195305 () Unit!12544)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!516 (array!26145 array!26143 (_ BitVec 32) (_ BitVec 32) V!15975 V!15975 (_ BitVec 32) (_ BitVec 64) V!15975 (_ BitVec 32) Int) Unit!12544)

(assert (=> b!427463 (= lt!195305 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!516 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427464 () Bool)

(assert (=> b!427464 (= e!253458 e!253457)))

(declare-fun res!250737 () Bool)

(assert (=> b!427464 (=> (not res!250737) (not e!253457))))

(assert (=> b!427464 (= res!250737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195304 mask!1025))))

(assert (=> b!427464 (= lt!195304 (array!26146 (store (arr!12522 _keys!709) i!563 k!794) (size!12874 _keys!709)))))

(declare-fun b!427465 () Bool)

(declare-fun e!253454 () Bool)

(declare-fun e!253455 () Bool)

(assert (=> b!427465 (= e!253454 (and e!253455 mapRes!18351))))

(declare-fun condMapEmpty!18351 () Bool)

(declare-fun mapDefault!18351 () ValueCell!5233)

