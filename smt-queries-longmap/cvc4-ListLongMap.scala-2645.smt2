; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39692 () Bool)

(assert start!39692)

(declare-fun b_free!9959 () Bool)

(declare-fun b_next!9959 () Bool)

(assert (=> start!39692 (= b_free!9959 (not b_next!9959))))

(declare-fun tp!35406 () Bool)

(declare-fun b_and!17615 () Bool)

(assert (=> start!39692 (= tp!35406 b_and!17615)))

(declare-fun b!426431 () Bool)

(declare-fun res!249893 () Bool)

(declare-fun e!252998 () Bool)

(assert (=> b!426431 (=> (not res!249893) (not e!252998))))

(declare-datatypes ((array!26061 0))(
  ( (array!26062 (arr!12480 (Array (_ BitVec 32) (_ BitVec 64))) (size!12832 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26061)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15919 0))(
  ( (V!15920 (val!5600 Int)) )
))
(declare-datatypes ((ValueCell!5212 0))(
  ( (ValueCellFull!5212 (v!7847 V!15919)) (EmptyCell!5212) )
))
(declare-datatypes ((array!26063 0))(
  ( (array!26064 (arr!12481 (Array (_ BitVec 32) ValueCell!5212)) (size!12833 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26063)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!426431 (= res!249893 (and (= (size!12833 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12832 _keys!709) (size!12833 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426432 () Bool)

(declare-fun e!253001 () Bool)

(declare-fun tp_is_empty!11111 () Bool)

(assert (=> b!426432 (= e!253001 tp_is_empty!11111)))

(declare-fun b!426433 () Bool)

(declare-fun res!249903 () Bool)

(assert (=> b!426433 (=> (not res!249903) (not e!252998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426433 (= res!249903 (validMask!0 mask!1025))))

(declare-fun b!426434 () Bool)

(declare-fun e!252997 () Bool)

(assert (=> b!426434 (= e!252997 (not true))))

(declare-fun minValue!515 () V!15919)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15919)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!194962 () array!26063)

(declare-fun lt!194961 () array!26061)

(declare-fun v!412 () V!15919)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7358 0))(
  ( (tuple2!7359 (_1!3690 (_ BitVec 64)) (_2!3690 V!15919)) )
))
(declare-datatypes ((List!7372 0))(
  ( (Nil!7369) (Cons!7368 (h!8224 tuple2!7358) (t!12816 List!7372)) )
))
(declare-datatypes ((ListLongMap!6271 0))(
  ( (ListLongMap!6272 (toList!3151 List!7372)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1355 (array!26061 array!26063 (_ BitVec 32) (_ BitVec 32) V!15919 V!15919 (_ BitVec 32) Int) ListLongMap!6271)

(declare-fun +!1309 (ListLongMap!6271 tuple2!7358) ListLongMap!6271)

(assert (=> b!426434 (= (getCurrentListMapNoExtraKeys!1355 lt!194961 lt!194962 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1309 (getCurrentListMapNoExtraKeys!1355 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7359 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12520 0))(
  ( (Unit!12521) )
))
(declare-fun lt!194960 () Unit!12520)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!504 (array!26061 array!26063 (_ BitVec 32) (_ BitVec 32) V!15919 V!15919 (_ BitVec 32) (_ BitVec 64) V!15919 (_ BitVec 32) Int) Unit!12520)

(assert (=> b!426434 (= lt!194960 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!504 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!18288 () Bool)

(declare-fun mapRes!18288 () Bool)

(assert (=> mapIsEmpty!18288 mapRes!18288))

(declare-fun b!426435 () Bool)

(declare-fun res!249898 () Bool)

(declare-fun e!252999 () Bool)

(assert (=> b!426435 (=> (not res!249898) (not e!252999))))

(assert (=> b!426435 (= res!249898 (bvsle from!863 i!563))))

(declare-fun b!426436 () Bool)

(declare-fun res!249900 () Bool)

(assert (=> b!426436 (=> (not res!249900) (not e!252999))))

(declare-datatypes ((List!7373 0))(
  ( (Nil!7370) (Cons!7369 (h!8225 (_ BitVec 64)) (t!12817 List!7373)) )
))
(declare-fun arrayNoDuplicates!0 (array!26061 (_ BitVec 32) List!7373) Bool)

(assert (=> b!426436 (= res!249900 (arrayNoDuplicates!0 lt!194961 #b00000000000000000000000000000000 Nil!7370))))

(declare-fun b!426437 () Bool)

(assert (=> b!426437 (= e!252998 e!252999)))

(declare-fun res!249902 () Bool)

(assert (=> b!426437 (=> (not res!249902) (not e!252999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26061 (_ BitVec 32)) Bool)

(assert (=> b!426437 (= res!249902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194961 mask!1025))))

(assert (=> b!426437 (= lt!194961 (array!26062 (store (arr!12480 _keys!709) i!563 k!794) (size!12832 _keys!709)))))

(declare-fun b!426438 () Bool)

(declare-fun res!249896 () Bool)

(assert (=> b!426438 (=> (not res!249896) (not e!252998))))

(assert (=> b!426438 (= res!249896 (or (= (select (arr!12480 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12480 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!249892 () Bool)

(assert (=> start!39692 (=> (not res!249892) (not e!252998))))

(assert (=> start!39692 (= res!249892 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12832 _keys!709))))))

(assert (=> start!39692 e!252998))

(assert (=> start!39692 tp_is_empty!11111))

(assert (=> start!39692 tp!35406))

(assert (=> start!39692 true))

(declare-fun e!253000 () Bool)

(declare-fun array_inv!9098 (array!26063) Bool)

(assert (=> start!39692 (and (array_inv!9098 _values!549) e!253000)))

(declare-fun array_inv!9099 (array!26061) Bool)

(assert (=> start!39692 (array_inv!9099 _keys!709)))

(declare-fun b!426439 () Bool)

(declare-fun res!249891 () Bool)

(assert (=> b!426439 (=> (not res!249891) (not e!252998))))

(declare-fun arrayContainsKey!0 (array!26061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426439 (= res!249891 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!426440 () Bool)

(declare-fun e!253002 () Bool)

(assert (=> b!426440 (= e!253000 (and e!253002 mapRes!18288))))

(declare-fun condMapEmpty!18288 () Bool)

(declare-fun mapDefault!18288 () ValueCell!5212)

