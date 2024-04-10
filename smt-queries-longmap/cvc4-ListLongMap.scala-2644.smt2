; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39686 () Bool)

(assert start!39686)

(declare-fun b_free!9953 () Bool)

(declare-fun b_next!9953 () Bool)

(assert (=> start!39686 (= b_free!9953 (not b_next!9953))))

(declare-fun tp!35388 () Bool)

(declare-fun b_and!17609 () Bool)

(assert (=> start!39686 (= tp!35388 b_and!17609)))

(declare-fun b!426287 () Bool)

(declare-fun res!249784 () Bool)

(declare-fun e!252933 () Bool)

(assert (=> b!426287 (=> (not res!249784) (not e!252933))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15911 0))(
  ( (V!15912 (val!5597 Int)) )
))
(declare-datatypes ((ValueCell!5209 0))(
  ( (ValueCellFull!5209 (v!7844 V!15911)) (EmptyCell!5209) )
))
(declare-datatypes ((array!26049 0))(
  ( (array!26050 (arr!12474 (Array (_ BitVec 32) ValueCell!5209)) (size!12826 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26049)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!26051 0))(
  ( (array!26052 (arr!12475 (Array (_ BitVec 32) (_ BitVec 64))) (size!12827 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26051)

(assert (=> b!426287 (= res!249784 (and (= (size!12826 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12827 _keys!709) (size!12826 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426288 () Bool)

(declare-fun res!249776 () Bool)

(declare-fun e!252938 () Bool)

(assert (=> b!426288 (=> (not res!249776) (not e!252938))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426288 (= res!249776 (bvsle from!863 i!563))))

(declare-fun b!426289 () Bool)

(declare-fun res!249783 () Bool)

(assert (=> b!426289 (=> (not res!249783) (not e!252933))))

(declare-datatypes ((List!7366 0))(
  ( (Nil!7363) (Cons!7362 (h!8218 (_ BitVec 64)) (t!12810 List!7366)) )
))
(declare-fun arrayNoDuplicates!0 (array!26051 (_ BitVec 32) List!7366) Bool)

(assert (=> b!426289 (= res!249783 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7363))))

(declare-fun b!426290 () Bool)

(declare-fun res!249780 () Bool)

(assert (=> b!426290 (=> (not res!249780) (not e!252933))))

(assert (=> b!426290 (= res!249780 (or (= (select (arr!12475 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12475 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!249785 () Bool)

(assert (=> start!39686 (=> (not res!249785) (not e!252933))))

(assert (=> start!39686 (= res!249785 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12827 _keys!709))))))

(assert (=> start!39686 e!252933))

(declare-fun tp_is_empty!11105 () Bool)

(assert (=> start!39686 tp_is_empty!11105))

(assert (=> start!39686 tp!35388))

(assert (=> start!39686 true))

(declare-fun e!252937 () Bool)

(declare-fun array_inv!9092 (array!26049) Bool)

(assert (=> start!39686 (and (array_inv!9092 _values!549) e!252937)))

(declare-fun array_inv!9093 (array!26051) Bool)

(assert (=> start!39686 (array_inv!9093 _keys!709)))

(declare-fun mapNonEmpty!18279 () Bool)

(declare-fun mapRes!18279 () Bool)

(declare-fun tp!35387 () Bool)

(declare-fun e!252935 () Bool)

(assert (=> mapNonEmpty!18279 (= mapRes!18279 (and tp!35387 e!252935))))

(declare-fun mapValue!18279 () ValueCell!5209)

(declare-fun mapKey!18279 () (_ BitVec 32))

(declare-fun mapRest!18279 () (Array (_ BitVec 32) ValueCell!5209))

(assert (=> mapNonEmpty!18279 (= (arr!12474 _values!549) (store mapRest!18279 mapKey!18279 mapValue!18279))))

(declare-fun b!426291 () Bool)

(declare-fun res!249778 () Bool)

(assert (=> b!426291 (=> (not res!249778) (not e!252933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26051 (_ BitVec 32)) Bool)

(assert (=> b!426291 (= res!249778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426292 () Bool)

(declare-fun e!252939 () Bool)

(assert (=> b!426292 (= e!252939 (not true))))

(declare-fun minValue!515 () V!15911)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15911)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!194914 () array!26049)

(declare-fun lt!194915 () array!26051)

(declare-fun v!412 () V!15911)

(declare-datatypes ((tuple2!7352 0))(
  ( (tuple2!7353 (_1!3687 (_ BitVec 64)) (_2!3687 V!15911)) )
))
(declare-datatypes ((List!7367 0))(
  ( (Nil!7364) (Cons!7363 (h!8219 tuple2!7352) (t!12811 List!7367)) )
))
(declare-datatypes ((ListLongMap!6265 0))(
  ( (ListLongMap!6266 (toList!3148 List!7367)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1352 (array!26051 array!26049 (_ BitVec 32) (_ BitVec 32) V!15911 V!15911 (_ BitVec 32) Int) ListLongMap!6265)

(declare-fun +!1306 (ListLongMap!6265 tuple2!7352) ListLongMap!6265)

(assert (=> b!426292 (= (getCurrentListMapNoExtraKeys!1352 lt!194915 lt!194914 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1306 (getCurrentListMapNoExtraKeys!1352 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7353 k!794 v!412)))))

(declare-datatypes ((Unit!12514 0))(
  ( (Unit!12515) )
))
(declare-fun lt!194918 () Unit!12514)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!501 (array!26051 array!26049 (_ BitVec 32) (_ BitVec 32) V!15911 V!15911 (_ BitVec 32) (_ BitVec 64) V!15911 (_ BitVec 32) Int) Unit!12514)

(assert (=> b!426292 (= lt!194918 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!501 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426293 () Bool)

(declare-fun res!249782 () Bool)

(assert (=> b!426293 (=> (not res!249782) (not e!252938))))

(assert (=> b!426293 (= res!249782 (arrayNoDuplicates!0 lt!194915 #b00000000000000000000000000000000 Nil!7363))))

(declare-fun b!426294 () Bool)

(declare-fun res!249774 () Bool)

(assert (=> b!426294 (=> (not res!249774) (not e!252933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426294 (= res!249774 (validKeyInArray!0 k!794))))

(declare-fun b!426295 () Bool)

(assert (=> b!426295 (= e!252933 e!252938)))

(declare-fun res!249775 () Bool)

(assert (=> b!426295 (=> (not res!249775) (not e!252938))))

(assert (=> b!426295 (= res!249775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194915 mask!1025))))

(assert (=> b!426295 (= lt!194915 (array!26052 (store (arr!12475 _keys!709) i!563 k!794) (size!12827 _keys!709)))))

(declare-fun b!426296 () Bool)

(assert (=> b!426296 (= e!252935 tp_is_empty!11105)))

(declare-fun b!426297 () Bool)

(declare-fun e!252934 () Bool)

(assert (=> b!426297 (= e!252937 (and e!252934 mapRes!18279))))

(declare-fun condMapEmpty!18279 () Bool)

(declare-fun mapDefault!18279 () ValueCell!5209)

