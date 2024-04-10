; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39706 () Bool)

(assert start!39706)

(declare-fun b_free!9973 () Bool)

(declare-fun b_next!9973 () Bool)

(assert (=> start!39706 (= b_free!9973 (not b_next!9973))))

(declare-fun tp!35448 () Bool)

(declare-fun b_and!17629 () Bool)

(assert (=> start!39706 (= tp!35448 b_and!17629)))

(declare-fun b!426767 () Bool)

(declare-fun res!250165 () Bool)

(declare-fun e!253143 () Bool)

(assert (=> b!426767 (=> (not res!250165) (not e!253143))))

(declare-datatypes ((array!26089 0))(
  ( (array!26090 (arr!12494 (Array (_ BitVec 32) (_ BitVec 64))) (size!12846 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26089)

(declare-datatypes ((List!7383 0))(
  ( (Nil!7380) (Cons!7379 (h!8235 (_ BitVec 64)) (t!12827 List!7383)) )
))
(declare-fun arrayNoDuplicates!0 (array!26089 (_ BitVec 32) List!7383) Bool)

(assert (=> b!426767 (= res!250165 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7380))))

(declare-fun b!426768 () Bool)

(declare-fun res!250167 () Bool)

(declare-fun e!253149 () Bool)

(assert (=> b!426768 (=> (not res!250167) (not e!253149))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426768 (= res!250167 (bvsle from!863 i!563))))

(declare-fun b!426769 () Bool)

(declare-fun res!250176 () Bool)

(assert (=> b!426769 (=> (not res!250176) (not e!253143))))

(assert (=> b!426769 (= res!250176 (or (= (select (arr!12494 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12494 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426770 () Bool)

(declare-fun res!250169 () Bool)

(assert (=> b!426770 (=> (not res!250169) (not e!253143))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15939 0))(
  ( (V!15940 (val!5607 Int)) )
))
(declare-datatypes ((ValueCell!5219 0))(
  ( (ValueCellFull!5219 (v!7854 V!15939)) (EmptyCell!5219) )
))
(declare-datatypes ((array!26091 0))(
  ( (array!26092 (arr!12495 (Array (_ BitVec 32) ValueCell!5219)) (size!12847 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26091)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!426770 (= res!250169 (and (= (size!12847 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12846 _keys!709) (size!12847 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426771 () Bool)

(declare-fun res!250173 () Bool)

(assert (=> b!426771 (=> (not res!250173) (not e!253143))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426771 (= res!250173 (validKeyInArray!0 k!794))))

(declare-fun b!426772 () Bool)

(declare-fun e!253146 () Bool)

(assert (=> b!426772 (= e!253146 (not true))))

(declare-fun minValue!515 () V!15939)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!195065 () array!26091)

(declare-fun zeroValue!515 () V!15939)

(declare-fun v!412 () V!15939)

(declare-fun lt!195066 () array!26089)

(declare-datatypes ((tuple2!7368 0))(
  ( (tuple2!7369 (_1!3695 (_ BitVec 64)) (_2!3695 V!15939)) )
))
(declare-datatypes ((List!7384 0))(
  ( (Nil!7381) (Cons!7380 (h!8236 tuple2!7368) (t!12828 List!7384)) )
))
(declare-datatypes ((ListLongMap!6281 0))(
  ( (ListLongMap!6282 (toList!3156 List!7384)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1360 (array!26089 array!26091 (_ BitVec 32) (_ BitVec 32) V!15939 V!15939 (_ BitVec 32) Int) ListLongMap!6281)

(declare-fun +!1313 (ListLongMap!6281 tuple2!7368) ListLongMap!6281)

(assert (=> b!426772 (= (getCurrentListMapNoExtraKeys!1360 lt!195066 lt!195065 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1313 (getCurrentListMapNoExtraKeys!1360 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7369 k!794 v!412)))))

(declare-datatypes ((Unit!12528 0))(
  ( (Unit!12529) )
))
(declare-fun lt!195064 () Unit!12528)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!508 (array!26089 array!26091 (_ BitVec 32) (_ BitVec 32) V!15939 V!15939 (_ BitVec 32) (_ BitVec 64) V!15939 (_ BitVec 32) Int) Unit!12528)

(assert (=> b!426772 (= lt!195064 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!508 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426773 () Bool)

(declare-fun e!253145 () Bool)

(declare-fun tp_is_empty!11125 () Bool)

(assert (=> b!426773 (= e!253145 tp_is_empty!11125)))

(declare-fun b!426774 () Bool)

(declare-fun e!253144 () Bool)

(assert (=> b!426774 (= e!253144 tp_is_empty!11125)))

(declare-fun mapIsEmpty!18309 () Bool)

(declare-fun mapRes!18309 () Bool)

(assert (=> mapIsEmpty!18309 mapRes!18309))

(declare-fun mapNonEmpty!18309 () Bool)

(declare-fun tp!35447 () Bool)

(assert (=> mapNonEmpty!18309 (= mapRes!18309 (and tp!35447 e!253144))))

(declare-fun mapKey!18309 () (_ BitVec 32))

(declare-fun mapRest!18309 () (Array (_ BitVec 32) ValueCell!5219))

(declare-fun mapValue!18309 () ValueCell!5219)

(assert (=> mapNonEmpty!18309 (= (arr!12495 _values!549) (store mapRest!18309 mapKey!18309 mapValue!18309))))

(declare-fun b!426775 () Bool)

(declare-fun e!253147 () Bool)

(assert (=> b!426775 (= e!253147 (and e!253145 mapRes!18309))))

(declare-fun condMapEmpty!18309 () Bool)

(declare-fun mapDefault!18309 () ValueCell!5219)

